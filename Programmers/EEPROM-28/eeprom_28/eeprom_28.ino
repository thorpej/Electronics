/*
 * Copyright (c) 2019 Jason R. Thorpe.  All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

/* 
 * EEPROM-28 -- EEPROM programmer for Atmel / Microchip 28-series parallel
 * EEPROMs and Atmel / Microchip 24-series I2C Serial EEPROMs.
 * 
 * Works with the following parallel EEPROM devices:
 * 
 * => 28C16 (2KiB, 24-pin, 11-bit address)
 * => 28C64 (8KiB, 28-pin, 13-bit address)
 * => 28C256 (32KiB, 28-pin, 15-bit address)
 *
 * and the following serial EEPROM devices:
 * 
 * => 24C01 (128B, 1 byte command, 8 byte page)
 * => 24C02 (256B, 1 byte command, 8 byte page)
 * => 24C04 (512B, 1 byte command, 16 byte page)
 * => 24C08 (1KiB, 1 byte command, 16 byte page)
 * => 24C16 (2KiB, 1 byte command, 16 byte page)
 * => 24C32 (4KiB, 2 byte command, 32 byte page)
 * => 24C64 (8KiB, 2 byte command, 32 byte page)
 * => 24C128 (16KiB, 2 byte command, 64 byte page)
 * => 24C256 (32KiB, 2 byte command, 64 byte page)
 * => 24C512 (64KiB, 2 byte command, 128 byte page)
 * => 24C1024 (128KiB, 2 byte command, 256 byte page)
 * => 24C1025 (128KiB, 2 byte command, 128 byte page, A2 chip select)
 * => 24C1026 (128KiB, 2 byte command, 128 byte page)
 * 
 * SEEPROM I2C addressing is a little complicated for the 1 byte command types:
 * => 24C01 and 24C02 offsets fit into the command byte, so they match on all
 *    of the I2C address bits (0x50 | [A2..A0]).
 * => 24C04 uses the LSb of the I2C address as the 9th offset bit, so they decode
 *    I2C address bits (0x50 | [A2..A1]).
 * => 24C08 uses the 2 LSb of the I2C address as the 10th and 9th offset bits, so
 *    they decode I2C address bits (0x50 | [A2]).
 * => 24C16 uses the 3 LSb of the I2C address as the 11th, 10th, and 9th offset
 *    bits, so they decode I2C address 0x50 only.
 * 
 * You can think of the 24C04, 24C08, and 24C16 as appearing like multiple
 * virtual SEEPROMs on the bus.
 * 
 * The 2 byte command types are able to encapsulate the offset into the 2 byte
 * command issued to the device. and thus don't play any address decoder tricks.
 * 
 * Devices that require a larger offset (e.g. 24C1024, 128KiB) are not currently
 * supported.
 *
 * Thankfully, the task of programming an SEEPROM is simply and we don't care about
 * sharing the I2C bus with anyone.  The EEPROM-28 board ties pins 1, 2, and 3
 * (the A0, A1, and A2 address select pins) of the SEEPROM socket to ATmega pins
 * A0, A1, and A2, which are normally held LOW by the microcontroller.  Thus all
 * SEEPROM devices behave in a uniform fashion, and the address decoding tricks are
 * easy to deal with.  However, some SEEPROMs use the address select pins as chip-
 * enable signals, so we selectively enable them based on the EEPROM type selected.
 * 
 * The EEPROM-28 PCB is designed to take an Arduino Nano.  The software will work
 * with practically any Arduino board, however, with perhaps some small modifications
 * (e.g. the Leonardo uses digital pins 2 and 3 for SDA and SCL, whcih conflict with
 * our use).
 */

#include <avr/pgmspace.h>
#include <Wire.h>

#define EEPROM_28_VERSION   "EEPROM-28 v0.1"
#define EEPROM_28_COPYRIGHT "Copyright (c) 2019 Jason R. Thorpe.  All rights reserved."

#define SERIAL_SPEED        57600

/*
 * Pin definitions:
 * 
 * 13 -- /WRITE ENABLE (also connected to on-board LED)
 * A0 -- I2C EEPROM "A0" address select pin
 * A1 -- I2C EEPROM "A1" address select pin
 * A2 -- I2C EEPROM "A3" address select pin
 * A3 -- /OUTPUT ENABLE
 * 5-12 -- EEPROM D0 - D7
 * 4 -- Shift register LATCH
 * 3 -- Shift register DATA
 * 2 -- Shift register CLOCK
 * 0-1 -- DO NOT USE (reserved for serial output)
 * 
 * We also use the board-defined SDA and SCL pins to communicate with serial
 * EEPROMS.  On the Metro Mini (and Uno), that's A4 and A5.
 */
#define PIN_WRITE_ENABLE  13
#define PIN_SEEPROM_A0    A0
#define PIN_SEEPROM_A1    A1
#define PIN_SEEPROM_A2    A2
#define PIN_OUTPUT_ENABLE A3
#define PIN_EEPROM_D0     5
#define PIN_EEPROM_D7     12
#define PIN_SHIFT_LATCH   4
#define PIN_SHIFT_DATA    3
#define PIN_SHIFT_CLOCK   2

// #define DEBUGSIM            // Enable simulated EEPROM
// #define DEBUG               // Enable debug messages

#ifdef DEBUGSIM
#define DEBUGSIM_LEN  64    // EEPROM page size
uint8_t debugsim_data[DEBUGSIM_LEN] = {
  0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x0a,0x0b,0x0c,0x0d,0x0e,0x0f,
  0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19,0x1a,0x1b,0x1c,0x1d,0x1e,0x1f,
  0x20,0x21,0x22,0x23,0x24,0x25,0x26,0x27,0x28,0x29,0x2a,0x2b,0x2c,0x2d,0x2e,0x2f,
  0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,0x39,0x3a,0x3b,0x3c,0x3d,0x3e,0x3f,
};
#endif /* EEPROM_28_DEBUGSIM */

struct eeprom_type {
  const char *et_name;    // name of the part
  unsigned long et_size;  // size of the part, in bytes
  unsigned int et_pgsize; // page size
  uint8_t et_flags;       // misc. info
};

#define ET_FLAGS_SEEPROM  (1U << 0)
#define ET_FLAGS_2BCMD    (1U << 1)
#define ET_FLAGS_CE_A0    (1U << 2)
#define ET_FLAGS_CE_A1    (1U << 3)
#define ET_FLAGS_CE_A2    (1U << 4)

#define EEPROM_TYPE(t, s, pg, f) \
const char eeprom_type_ ## t ## _name[] PROGMEM = #t; \
const struct eeprom_type eeprom_type_ ## t PROGMEM = { \
  /* .et_name = */ eeprom_type_ ## t ## _name, \
  /* .et_size = */ (s), \
  /* .et_pgsize = */ (pg), \
  /* .et_flags = */ (f), \
}

EEPROM_TYPE(28c16,     2 * 1024UL,   1, 0);
EEPROM_TYPE(28c64,     8 * 1024UL,   1, 0);
EEPROM_TYPE(28c256,   32 * 1024UL,   1, 0);

EEPROM_TYPE(24c01,          128UL,   8, ET_FLAGS_SEEPROM);
EEPROM_TYPE(24c02,          256UL,   8, ET_FLAGS_SEEPROM);
EEPROM_TYPE(24c04,          512UL,  16, ET_FLAGS_SEEPROM);
EEPROM_TYPE(24c08,     1 * 1024UL,  16, ET_FLAGS_SEEPROM);
EEPROM_TYPE(24c16,     2 * 1024UL,  16, ET_FLAGS_SEEPROM);
EEPROM_TYPE(24c32,     4 * 1024UL,  32, ET_FLAGS_SEEPROM | ET_FLAGS_2BCMD);
EEPROM_TYPE(24c64,     8 * 1024UL,  32, ET_FLAGS_SEEPROM | ET_FLAGS_2BCMD);
EEPROM_TYPE(24c128,   16 * 1024UL,  64, ET_FLAGS_SEEPROM | ET_FLAGS_2BCMD);
EEPROM_TYPE(24c256,   32 * 1024UL,  64, ET_FLAGS_SEEPROM | ET_FLAGS_2BCMD);
EEPROM_TYPE(24c512,   64 * 1024UL, 128, ET_FLAGS_SEEPROM | ET_FLAGS_2BCMD);

EEPROM_TYPE(24c1024, 128 * 1024UL, 256, ET_FLAGS_SEEPROM | ET_FLAGS_2BCMD);
EEPROM_TYPE(24c1025, 128 * 1024UL, 128, ET_FLAGS_SEEPROM | ET_FLAGS_2BCMD |
                                        ET_FLAGS_CE_A2);
EEPROM_TYPE(24c1026, 128 * 1024UL, 128, ET_FLAGS_SEEPROM | ET_FLAGS_2BCMD);

#define DEFAULT_EEPROM    "28c16"

const struct eeprom_type * const eeprom_type_table[] PROGMEM = {
  &eeprom_type_28c16,
  &eeprom_type_28c64,
  &eeprom_type_28c256,
  &eeprom_type_24c01,
  &eeprom_type_24c02,
  &eeprom_type_24c04,
  &eeprom_type_24c08,
  &eeprom_type_24c16,
  &eeprom_type_24c32,
  &eeprom_type_24c64,
  &eeprom_type_24c128,
  &eeprom_type_24c256,
  &eeprom_type_24c512,
  &eeprom_type_24c1024,
  &eeprom_type_24c1025,
  &eeprom_type_24c1026,
};
const int eeprom_type_table_count PROGMEM =
    sizeof(eeprom_type_table) / sizeof(eeprom_type_table[0]);

char current_eeprom_name[16];
struct eeprom_type current_eeprom;

#define eeprom_is_serial    (current_eeprom.et_flags & ET_FLAGS_SEEPROM)
#define eeprom_uses_2bcmd   (current_eeprom.et_flags & ET_FLAGS_2BCMD)
#define eeprom_size         (current_eeprom.et_size)
#define eeprom_pgsize       (current_eeprom.et_pgsize)
#define eeprom_flags        (current_eeprom.et_flags)

void
eeprom_type_reset(void)
{
  memset(current_eeprom_name, 0, sizeof(current_eeprom_name));
  memset(&current_eeprom, 0, sizeof(eeprom_type));
}

int
eeprom_type_count(void)
{
  return (int)pgm_read_word(&eeprom_type_table_count);
}

void
eeprom_type_copyout(int idx, struct eeprom_type *et, char *etname)
{
  void *ptr = (void *)pgm_read_word(&eeprom_type_table[idx]);
  memcpy_P(et, ptr, sizeof(*et));
  strcpy_P(etname, et->et_name);
}

bool
eeprom_set_type(const char *cp)
{
  char newname[16];
  struct eeprom_type newtype;
  int ntypes, i;

  ntypes = eeprom_type_count();

  for (i = 0; i < ntypes; i++) {
    eeprom_type_copyout(i, &newtype, newname);
    if (strcasecmp(cp, newname) == 0) {
      strcpy(current_eeprom_name, newname);
      memcpy(&current_eeprom, &newtype, sizeof(current_eeprom));
      return true;
    }
  }
  return false;
}

/*
 * ==> Low-level EEPROM signal access routines
 */

/*
 * eeprom_set_write_enable --
 * Set the /WE signal ont he EEPROM.
 */
void
eeprom_set_write_enable(bool enabled)
{
  digitalWrite(PIN_WRITE_ENABLE, enabled ? LOW : HIGH);
}

/*
 * eeprom_set_output_enable --
 * Set the /OE signal on the EEPROM.
 */
void
eeprom_set_output_enable(bool enabled)
{
  digitalWrite(PIN_OUTPUT_ENABLE, enabled ? LOW : HIGH);
}

/*
 * eeprom_set_data_direction --
 * Set the data pins to the specified direction.
 */
void
eeprom_set_data_direction(int dir)
{
  int pin;

  for (pin = PIN_EEPROM_D0; pin <= PIN_EEPROM_D7; pin++) {
    pinMode(pin, dir);
  }
}

/*
 * eeprom_set_data_byte --
 * Set the data pins to the specified byte value.
 */
void
eeprom_set_data_byte(uint8_t val)
{
  int pin;

  for (pin = PIN_EEPROM_D0; pin <= PIN_EEPROM_D7; pin++) {
    digitalWrite(pin, (val & 1) ? HIGH : LOW);
    val >>= 1;
  }
}

/*
 * eeprom_get_data_byte --
 * Get a byte of data from the data pins.
 */
uint8_t
eeprom_get_data_byte(void)
{
  int pin;
  uint8_t val = 0;

  for (pin = PIN_EEPROM_D7; pin >= PIN_EEPROM_D0; pin--) {
    uint8_t bit = digitalRead(pin) == HIGH;
    val = (val << 1) | bit;
  }

  return val;
}

/*
 * eeprom_set_address --
 * Set the EEPROM address lines.
 */
void
eeprom_set_address(uint16_t address)
{
  digitalWrite(PIN_SHIFT_LATCH, LOW);

  shiftOut(PIN_SHIFT_DATA, PIN_SHIFT_CLOCK, MSBFIRST, address >> 8);
  shiftOut(PIN_SHIFT_DATA, PIN_SHIFT_CLOCK, MSBFIRST, address & 0xff);

  digitalWrite(PIN_SHIFT_LATCH, HIGH);
  digitalWrite(PIN_SHIFT_LATCH, LOW);
}

/*
 * eeprom_read_byte --
 * Read a byte from the eeprom at the specified address.
 * We assume that /OE and the data pins are already set up
 * for a read operation.
 */
uint8_t
eeprom_read_byte(int address)
{
#ifdef DEBUGSIM
  if (address >= DEBUGSIM_LEN) {
    return 0xff;
  }
  return debugsim_data[address];
#else
  uint8_t data_byte;
  
  eeprom_set_address(address);
  eeprom_set_output_enable(true);
  data_byte = eeprom_get_data_byte();
  eeprom_set_output_enable(false);
  
  return data_byte;
#endif /* DEBUGSIM */
}

/*
 * eeprom_write_byte --
 * Write a byte to the eeprom at the specified address.
 * We assume that /OE and the data pins are already set up
 * for a write operation.
 */
void
eeprom_write_byte(int address, uint8_t val)
{
#ifdef DEBUGSIM
  if (address >= DEBUGSIM_LEN) {
    return;
  }
  debugsim_data[address] = val;
#else
  eeprom_set_address(address);
  eeprom_set_data_byte(val);
  eeprom_set_write_enable(true);
  delayMicroseconds(1);
  eeprom_set_write_enable(false);

  // Wait for the write to complete.
  delay(10);    // XXX implement /DATA polling
#endif /* DEBUGSIM */
}

/*
 * eeprom_pin_setup --
 * Set up the EEPROM pins at boot time.
 */
void
eeprom_pin_setup(void)
{
  // Set up the /WE signal pin.
  eeprom_set_write_enable(false);
  pinMode(PIN_WRITE_ENABLE, OUTPUT);

  // Set up the /OE signal pin.
  eeprom_set_output_enable(false);
  pinMode(PIN_OUTPUT_ENABLE, OUTPUT);

  // Set up the Dx pins.
  eeprom_set_data_byte(0);
  eeprom_set_data_direction(INPUT);

  // Set up the shift register pins.
  digitalWrite(PIN_SHIFT_CLOCK, LOW);
  digitalWrite(PIN_SHIFT_DATA, LOW);
  digitalWrite(PIN_SHIFT_LATCH, LOW);
  pinMode(PIN_SHIFT_CLOCK, OUTPUT);
  pinMode(PIN_SHIFT_DATA, OUTPUT);
  pinMode(PIN_SHIFT_LATCH, OUTPUT);
}

/*
 * ==> I2C Serial EEPROM access routines.
 */

#define SEEPROM_I2C_CLOCK   100000    // 100KHz - standard mode
#define SEEPROM_I2C_ADDRESS 0x50      // We tie SEEPROM A[0-2] to ground

/*
 * The Wire library has an internal buffer of 32 bytes.  We therefore must
 * limit all send / receive to the SEEPROM to this limit.  For writes, this
 * includes the 1 or 2 byte offset.  To keep things simple, we limit ourselves
 * to 16 byte transactions.
 */
#define SEEPROM_MAX_IO      16

void
seeprom_set_enable(bool enabled)
{
  int val = enabled ? HIGH : LOW;

  if (eeprom_flags & ET_FLAGS_CE_A0) {
    digitalWrite(PIN_SEEPROM_A0, val);
  }
  if (eeprom_flags & ET_FLAGS_CE_A1) {
    digitalWrite(PIN_SEEPROM_A1, val);
  }
  if (eeprom_flags & ET_FLAGS_CE_A2) {
    digitalWrite(PIN_SEEPROM_A2, val);
  }
}

size_t
trunc_to_page(long address, size_t len, unsigned long pgsize)
{
  unsigned long pgoff;

  pgoff = address & (pgsize - 1);
  if (pgoff + len > pgsize) {
    len = (size_t)(pgsize - pgoff);
  }
  return len;
}

size_t
seeprom_send_address(long address, size_t len, int dir)
{
  int i2c_addr = SEEPROM_I2C_ADDRESS;
  unsigned long pgsize;

  // Cap the length at our max.
  if (len > SEEPROM_MAX_IO) {
    len = SEEPROM_MAX_IO;
  }

  /*
   * If we're doing a read operation, figure out the super-page
   * size.  Auto-increment of the address is not allowed to
   * cross a super-page boundary (because the next super-page
   * requires a different I2C bus address).
   *
   * If we're doing a write operation, we need to ensure we 
   * don't cross an internal page boundary.
   * 
   * Because both page sizes are powers-of-two, and the internal
   * page size is smaller than the super-page size, we are know
   * that not crossing an internal page boundary will also prevent
   * us from crossing a super-page boundary.
   */
  if (dir == OUTPUT) {
    pgsize = eeprom_pgsize;
  } else {
    if (eeprom_uses_2bcmd) {
      pgsize = eeprom_size > 0x10000 ? 0x10000 : eeprom_size;
    } else {
      pgsize = 0x100;
    }
  }
  len = trunc_to_page(address, len, pgsize);  

  if (eeprom_uses_2bcmd) {
    i2c_addr += (address >> 16);
    if (dir == OUTPUT) {
      Wire.beginTransmission(i2c_addr);
      Wire.write(address >> 8);
      Wire.write(address & 0xff);
    } else {
      Wire.requestFrom(i2c_addr, len);
    }
  } else {    
    i2c_addr += (address >> 8);
    if (dir == OUTPUT) {
      Wire.beginTransmission(i2c_addr);
      Wire.write(address & 0xff);
    } else {
      Wire.requestFrom(i2c_addr, len);
    }
  }

  // Return the truncated length to the caller.
  return len;
}

void
seeprom_read_buf(long address, uint8_t *buf, size_t buflen)
{
  size_t orig_buflen = buflen;

  while (orig_buflen) {
    // Don't care about getting the updated length here.
    seeprom_send_address(address, orig_buflen, OUTPUT);
    Wire.endTransmission();

    buflen = seeprom_send_address(address, orig_buflen, INPUT);
    orig_buflen -= buflen;
    address += buflen;
    while (buflen--) {
      *buf++ = Wire.available() ? Wire.read() : 0xff;
    }
  }
}

void
seeprom_write_buf(long address, const uint8_t *buf, size_t buflen)
{
  size_t orig_buflen = buflen;

  while (orig_buflen) {
    buflen = seeprom_send_address(address, orig_buflen, OUTPUT);
    orig_buflen -= buflen;
    address += buflen;
    while (buflen--) {
      Wire.write(*buf++);
    }
    Wire.endTransmission();

    // Wait for the write to complete.
    delay(10);    // XXX implement acknowledgement polling
  }
}

void
seeprom_pin_setup(void)
{
  Wire.begin();
  Wire.setClock(SEEPROM_I2C_CLOCK);

  digitalWrite(PIN_SEEPROM_A0, LOW);
  digitalWrite(PIN_SEEPROM_A1, LOW);
  digitalWrite(PIN_SEEPROM_A2, LOW);
  pinMode(PIN_SEEPROM_A0, OUTPUT);
  pinMode(PIN_SEEPROM_A1, OUTPUT);
  pinMode(PIN_SEEPROM_A2, OUTPUT);
}

/*
 * ==> Command line support routines.
 */

#define COMMAND_BUFFER_LEN   80
char command_buffer[COMMAND_BUFFER_LEN];
unsigned int command_buffer_index;
char command_buffer_last_char;

#define OUTPUT_BUFFER_LEN    80
char output_buffer[OUTPUT_BUFFER_LEN];

/*
 * Message string table.
 */

const char msg_version[] PROGMEM = EEPROM_28_VERSION;
#define MSG_VERSION                       0

const char msg_copyright[] PROGMEM = EEPROM_28_COPYRIGHT;
#define MSG_COPYRIGHT                     1

const char msg_illegal_command[] PROGMEM = "illegal command";
#define MSG_ILLEGAL_COMMAND               2

const char msg_illegal_length[] PROGMEM = "illegal length specification";
#define MSG_ILLEGAL_LENGTH                3

const char msg_illegal_offset[] PROGMEM = "illegal offset specification";
#define MSG_ILLEGAL_OFFSET                4

const char msg_illegal_data[] PROGMEM = "illegal data specification";
#define MSG_ILLEGAL_DATA                  5

const char msg_short_data[] PROGMEM = "short data specification";
#define MSG_SHORT_DATA                    6

const char msg_data_verify_failed[] PROGMEM = "data verificaiton failed";
#define MSG_DATA_VERIFY_FAILED            7

const char msg_unknown_eeprom_type[] PROGMEM = "unknown EEPROM type";
#define MSG_UNKNOWN_EEPROM_TYPE           8

const char msg_trailing_garbage[] PROGMEM = "trailing garbage after command";
#define MSG_TRAILING_GARBAGE              9

const char msg_supported_eeprom_types[] PROGMEM = "Supported EEPROM types:";
#define MSG_SUPPORTED_EEPROM_TYPES        10

#define MSG_HELP_START                    11
#define MSG_HELP_FIRST                    (MSG_HELP_START + 0)
const char msg_help_0[]  PROGMEM = "";
const char msg_help_1[]  PROGMEM = "Commands:";
const char msg_help_2[]  PROGMEM = "=> Read EEPROM:";
const char msg_help_3[]  PROGMEM = "Rx OOOOOO";
const char msg_help_4[]  PROGMEM = "=> Write EEPROM:";
const char msg_help_5[]  PROGMEM = "Wx OOOOOO .. .. .. .. .. .. .. .. .. .. .. .. .. .. .. ..";
const char msg_help_6[]  PROGMEM = "=> Print current EERPROM type:";
const char msg_help_7[]  PROGMEM = "T";
const char msg_help_8[]  PROGMEM = "=> Set EERPROM type:";
const char msg_help_9[]  PROGMEM = "T type";
const char msg_help_10[] PROGMEM = "=> List supported EERPROM types:";
const char msg_help_11[] PROGMEM = "T ?";
const char msg_help_12[] PROGMEM = "=> Print version:";
const char msg_help_13[] PROGMEM = "V";
const char msg_help_14[] PROGMEM = "=> Get help:";
const char msg_help_15[] PROGMEM = "H";
const char msg_help_16[] PROGMEM = "?";
const char msg_help_17[] PROGMEM = "";
const char msg_help_18[] PROGMEM = "x = length minus 1 in HEX ('0' - 'F') => (1 - 16)";
const char msg_help_19[] PROGMEM = "OOOOOO = address in HEX";
const char msg_help_20[] PROGMEM = ".. = data byte in HEX";
#define MSG_HELP_LAST                     (MSG_HELP_FIRST + 20)

const char * const msg_string_table[] PROGMEM = {
  msg_version,
  msg_copyright,
  msg_illegal_command,
  msg_illegal_length,
  msg_illegal_offset,
  msg_illegal_data,
  msg_short_data,
  msg_data_verify_failed,
  msg_unknown_eeprom_type,
  msg_trailing_garbage,
  msg_supported_eeprom_types,
  msg_help_0,
  msg_help_1,
  msg_help_2,
  msg_help_3,
  msg_help_4,
  msg_help_5,
  msg_help_6,
  msg_help_7,
  msg_help_8,
  msg_help_9,
  msg_help_10,
  msg_help_11,
  msg_help_12,
  msg_help_13,
  msg_help_14,
  msg_help_15,
  msg_help_16,
  msg_help_17,
  msg_help_18,
  msg_help_19,
  msg_help_20,
};

/*
 * cli_prompt --
 * Display the command prompt.
 */
void
cli_prompt(void)
{
  Serial.print(F(">>> "));
  Serial.flush();
}

/*
 * cli_status_okay --
 * Return an OKAY status.
 */
void
cli_status_okay(void)
{
  Serial.println(F("Okay"));
  Serial.flush();
}

/*
 * cli_status_error --
 * Return an ERROR status with the specified message.
 */
void
cli_status_error(int msg)
{

  strcpy_P(output_buffer, (char *)pgm_read_word(&(msg_string_table[msg])));

  Serial.print(F("Err "));
  Serial.println(output_buffer);
  Serial.flush();
}

/*
 * cli_info --
 * Print an info string.
 */
void
cli_info(const char *str)
{
  Serial.print(F("# "));
  Serial.println(str);
  Serial.flush();
}

/*
 * cli_info_msg --
 * Print an info string (from the string table).
 */
void
cli_info_msg(int msg)
{

  strcpy_P(output_buffer, (char *)pgm_read_word(&(msg_string_table[msg])));
  cli_info(output_buffer);
}

#ifdef DEBUG
/*
 * cli_debug --
 * Print a debug string.
 */
void
cli_debug(const char *str)
{
  Serial.print(F("%%% "));
  Serial.println(str);
  Serial.flush();
}
#endif /* DEBUG */

/*
 * parse_nybble --
 * Return the value of the specified nybble (-1 if invalid).
 */
int
parse_nybble(char c)
{
  if (c >= '0' && c <= '9') {
    return c - '0';
  }

  if (c >= 'A' && c <= 'F') {
    return 10 + c - 'A';
  }

  if (c >= 'a' && c <= 'f') {
    return 10 + c - 'a';
  }

  return -1;
}

/*
 * get_readwrite_length_spec --
 * Get a length specification for a READ or WRITE command.
 */
const char *
get_readwrite_length_spec(const char *cmd, int *lengthp)
{
  int length;

  length = parse_nybble(*cmd);
  if (length < 0) {
    cli_status_error(MSG_ILLEGAL_LENGTH);
    return NULL;
  }

  *lengthp = length + 1;
  return cmd + 1;
}

/*
 * get_readwrite_address_spec --
 * Get a length specification for a READ or WRITE command.
 */
const char *
get_readwrite_address_spec(const char *cmd, int length, long *offsetp)
{
  unsigned long offset = 0;
  char ch;
  int v;

  for (;;) {
    ch = *cmd;
    v = parse_nybble(ch);
    if (v == -1) {
      if (isWhitespace(ch) || ch == '\0') {
        *offsetp = (long)offset;
        return cmd;
      }
      goto illegal_offset;
    }
    offset <<= 4;
    offset |= v;

    // Make sure it fits within the device.
    if (offset >= eeprom_size || (length + offset) > eeprom_size) {
      goto illegal_offset;
    }
    cmd++;
  }

illegal_offset:
  cli_status_error(MSG_ILLEGAL_OFFSET);
  return NULL;
}

/*
 * consume_whitespace --
 * Consume whitespace.
 */
const char *
consume_whitespace(const char *cmd)
{
  for (;;) {
    if (isWhitespace(*cmd)) {
      cmd++;
      continue;
    }
    return cmd;
  }
}

/*
 * reset_command_buffer --
 * Make the command buffer ready for re-use.
 */
void
reset_command_buffer(void)
{
  memset(command_buffer, 0, sizeof(command_buffer));
  command_buffer_index = 0;
  command_buffer_last_char = 0;
}

/*
 * ==> Command handlers.
 */

/*
 * command_read --
 * Handle a READ command.
 */
void
command_read(const char *cmd)
{
  int length;
  long offset;
  char *cp;

  cmd = get_readwrite_length_spec(cmd, &length);
  if (cmd == NULL) {
    return;
  }

  cmd = consume_whitespace(cmd);

  cmd = get_readwrite_address_spec(cmd, length, &offset);
  if (cmd == NULL) {
    return;
  }

  cmd = consume_whitespace(cmd);

  if (*cmd != '\0') {
    cli_status_error(MSG_TRAILING_GARBAGE);
    return;
  }

  cli_status_okay();

  if (eeprom_is_serial) {
    seeprom_set_enable(true);
    
    // Re-use the command buffer to read the SEEPROM.
    seeprom_read_buf(offset, (uint8_t *)command_buffer, length);

    seeprom_set_enable(false);

    cp = output_buffer;

    // Put the address in the output buffer.
    sprintf(cp, "%08lX", offset);
    cp += 8;

    // Fill the output buffer with the data.
    for (offset = 0; offset < length; offset++) {
      sprintf(cp, " %02X", command_buffer[offset]);
      cp += 3;
    }
  } else {
    eeprom_set_data_direction(INPUT);

    cp = output_buffer;

    // Put the address in the output buffer.
    sprintf(cp, "%08lX", offset);
    cp += 8;

    // Fill the output buffer with the data.
    for (; length != 0; length--, offset++) {
      sprintf(cp, " %02X", eeprom_read_byte(offset));
      cp += 3;
    }
  }

  // Send the reply.
  Serial.print(F("<<< "));
  Serial.println(output_buffer);
  Serial.flush();
}

/*
 * command_write --
 * Handle a WRITE command.
 */
void
command_write(const char *cmd)
{
  int length;
  long offset;
  int i;

  cmd = get_readwrite_length_spec(cmd, &length);
  if (cmd == NULL) {
    return;
  }

  cmd = consume_whitespace(cmd);

  cmd = get_readwrite_address_spec(cmd, length, &offset);
  if (cmd == NULL) {
    return;
  }

  cmd = consume_whitespace(cmd);

  for (i = 0; i < length; i++) {
    if (*cmd == '\0') {
      cli_status_error(MSG_SHORT_DATA);
      return;
    }
    int n1 = parse_nybble(*cmd++);
    int n2 = parse_nybble(*cmd++);
    if (n1 < 0 || n2 < 0) {
      cli_status_error(MSG_ILLEGAL_DATA);
      return;
    }
    cmd = consume_whitespace(cmd);
    output_buffer[i] = (n1 << 4) | n2;
  }

  cmd = consume_whitespace(cmd);

  if (*cmd != '\0') {
    cli_status_error(MSG_TRAILING_GARBAGE);
    return;
  }

  cli_status_okay();    // doesn't touch output_buffer[]

  if (eeprom_is_serial) {
    seeprom_set_enable(true);
    
    seeprom_write_buf(offset, (uint8_t *)output_buffer, length);
    
    // Re-use the command buffer to read the EEPROM.
    seeprom_read_buf(offset, (uint8_t *)command_buffer, length);

    seeprom_set_enable(false);
  } else {
    eeprom_set_output_enable(false);
    eeprom_set_data_direction(OUTPUT);

    for (i = 0; i < length; i++) {
      eeprom_write_byte(offset + i, output_buffer[i]);
    }

    eeprom_set_data_direction(INPUT);

    // Re-use the command buffer to read the SEEPROM.
    for (i = 0; i < length; i++) {
      command_buffer[i] = eeprom_read_byte(offset + i);
    }
  }

  for (i = 0; i < length; i++) {
    if (output_buffer[i] != command_buffer[i]) {
      cli_status_error(MSG_DATA_VERIFY_FAILED);
      sprintf(output_buffer, "Address %08lX Expected %02X Received %02X",
              offset + i, output_buffer[i], command_buffer[i]);
      cli_info(output_buffer);
      break;
    }
  }
}

void
list_eeprom_types(void)
{
  struct eeprom_type newtype;
  int ntypes, i;

  ntypes = eeprom_type_count();

  cli_info_msg(MSG_SUPPORTED_EEPROM_TYPES);
  for (i = 0; i < ntypes; i++) {
    eeprom_type_copyout(i, &newtype, output_buffer);
    Serial.print(F("#     "));
    Serial.print(output_buffer);
    Serial.print(F(" -- "));
    Serial.print(newtype.et_size, DEC);
    Serial.print(F(" bytes"));
    if (newtype.et_flags & ET_FLAGS_SEEPROM) {
      Serial.print(F(", serial"));
    }
    Serial.println("");
  }
}

/*
 * command_type --
 * Handle a TYPE command.
 */
void
command_type(const char *cmd)
{
  size_t i;

  cmd = consume_whitespace(cmd);
  if (*cmd == '\0') {
    cli_status_okay();
    sprintf(output_buffer, "Current EEPROM type: %s", current_eeprom_name);
    cli_info(output_buffer);
    return;
  }

  if (*cmd == '?') {
    cmd = consume_whitespace(++cmd);
    if (*cmd != '\0') {
      cli_status_error(MSG_TRAILING_GARBAGE);
      return;
    }
    cli_status_okay();
    list_eeprom_types();
    return;
  }

  for (i = 0; i < OUTPUT_BUFFER_LEN - 1; i++) {
    if (isWhitespace(*cmd)) {
      break;
    }
    output_buffer[i] = *cmd++;
  }
  output_buffer[i] = '\0';

  cmd = consume_whitespace(cmd);
  if (*cmd != '\0') {
    cli_status_error(MSG_TRAILING_GARBAGE);
    return;
  }

  if (eeprom_set_type(output_buffer) == false) {
    cli_status_error(MSG_UNKNOWN_EEPROM_TYPE);
    return;
  }
  cli_status_okay();
}

/*
 * print_version --
 * Print the software version.
 */
void
print_version(void)
{
  strcpy_P(output_buffer, (char *)pgm_read_word(&(msg_string_table[MSG_VERSION])));
  cli_info(output_buffer);

  strcpy_P(output_buffer, (char *)pgm_read_word(&(msg_string_table[MSG_COPYRIGHT])));
  cli_info(output_buffer);
}

/*
 * print_help --
 * Print the help info.
 */
void
print_help(void)
{
  int i;

  for (i = MSG_HELP_FIRST; i <= MSG_HELP_LAST; i++) {
    strcpy_P(output_buffer, (char *)pgm_read_word(&(msg_string_table[i])));
    cli_info(output_buffer);
  }
}

/*
 * command_version --
 * Handle a VERSION command.
 */
void
command_version(const char *cmd __attribute__((unused)))
{
  cli_status_okay();
  print_version();
}

/*
 * execute_command --
 * Execute the command privided int he command_buffer.
 */
void
execute_command(void)
{
  const char *cmd = command_buffer;
  bool want_help = false;

  switch (*cmd++) {
    case '\0':
      // empty line.
      break;
    case 'R':
    case 'r':
      command_read(cmd);
      break;

    case 'W':
    case 'w':
      command_write(cmd);
      break;

    case 'T':
    case 't':
      command_type(cmd);
      break;

    case 'H':
    case 'h':
    case '?':
      want_help = true;
      // FALLTHROUGH
    case 'V':
    case 'v':
      command_version(cmd);
      if (want_help) {
        print_help();
      }
      break;

    default:
      cli_status_error(MSG_ILLEGAL_COMMAND);
  }
}

/*
 * ==> Standard Arduino entry points.
 */

void
setup(void)
{
  eeprom_pin_setup();
  seeprom_pin_setup();
  eeprom_set_type(DEFAULT_EEPROM);
  reset_command_buffer();

  Serial.begin(SERIAL_SPEED);
  while (! Serial) {
    ; // Wait for serial connection to become availble.
  }

  // Display the initial command prompt.
  Serial.println("");
  print_version();
  cli_prompt(); 
}

void
loop(void)
{
  char ch, last_ch;

  if (Serial.available() < 1) {
    // No data?  Do nothing.
    return;
  }

  while (Serial.available() > 0) {
    ch = Serial.read();

    if (ch == '\b') {
     if (command_buffer_index > 0) {
        command_buffer[--command_buffer_index] = '\0';
        Serial.write("\b \b");
      }
      continue;
    }

    // Everything else is going to result in storing something in the
    // command buffer.

    last_ch = command_buffer_last_char;
    command_buffer_last_char = ch;

    if (command_buffer_index >= COMMAND_BUFFER_LEN) {
      Serial.println("");
      cli_status_error(MSG_ILLEGAL_COMMAND);
      reset_command_buffer();
      cli_prompt();
      return;
    }

    if (ch == '\n' || ch == '\r') {
      command_buffer[command_buffer_index] = '\0';
      if (last_ch != '\n' && last_ch != '\r') {
        Serial.println("");
        execute_command();
        reset_command_buffer();
        cli_prompt();
      }
      return;
    }

    command_buffer[command_buffer_index++] = ch;
    Serial.write(ch);
  }
}
