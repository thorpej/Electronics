#	This Makefile is NetBSD-specific; this makes it super easy
#	to cross-compile for my target platform from the host of
#	my choice.

PROG=	tsltest
SRCS=	tsltest.c tsl256x.c
NOMAN=	1

.include <bsd.own.mk>

WARNS?=		5
BINDIR?=	/usr/local/bin

.include <bsd.prog.mk>
