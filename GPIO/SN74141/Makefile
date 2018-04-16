#	This Makefile is NetBSD-specific; this makes it super easy
#	to cross-compile for my target platform from the host of
#	my choice.

PROG=	bcdtest
SRCS=	bcdtest.c sn74141.c shift_register.c
NOMAN=	1

.include <bsd.own.mk>

.PATH: ${.CURDIR}/../Shift_Register
CPPFLAGS+= -I${.CURDIR}/../Shift_Register

WARNS?=		5
BINDIR?=	/usr/local/bin

.include <bsd.prog.mk>
