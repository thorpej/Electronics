#	This Makefile is NetBSD-specific; this makes it super easy
#	to cross-compile for my target platform from the host of
#	my choice.

PROG=	sregtest
SRCS=	sregtest.c shift_register.c
NOMAN=	1

.include <bsd.own.mk>

WARNS?=		5
BINDIR?=	/usr/local/bin

.include <bsd.prog.mk>
