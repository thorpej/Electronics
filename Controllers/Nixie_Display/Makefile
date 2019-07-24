#	This Makefile is NetBSD-specific; this makes it super easy
#	to cross-compile for my target platform from the host of
#	my choice.

PROG=	nixietest
SRCS=	nixietest.c nixie_display.c sn74141.c shift_register.c
NOMAN=	1

.include <bsd.own.mk>

.PATH:	${.CURDIR}/../../GPIO/Shift_Register
CPPFLAGS+= -I${.CURDIR}/../../GPIO/Shift_Register

.PATH:	${.CURDIR}/../../GPIO/SN74141
CPPFLAGS+= -I${.CURDIR}/../../GPIO/SN74141

WARNS?=		5
BINDIR?=	/usr/local/bin

.include <bsd.prog.mk>
