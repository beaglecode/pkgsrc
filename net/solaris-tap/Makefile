# $NetBSD: Makefile,v 1.8 2014/03/14 08:34:45 obache Exp $

DISTNAME=	tuntap
PKGNAME=	solaris-tap-20091116
CATEGORIES=	net
MASTER_SITES=	http://www.whiteboard.ne.jp/~admin2/tuntap/source/tuntap/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.whiteboard.ne.jp/~admin2/tuntap/
COMMENT=	Solaris kernel module for virtual Ethernet devices

ONLY_FOR_PLATFORM=	SunOS-*-*
GNU_CONFIGURE=		yes

DIST_SUBDIR=	${PKGNAME_NOREV}
WRKSRC=		${WRKDIR}/tuntap

.include "../../mk/bsd.prefs.mk"

.if empty(ABI:U:M64)
CONFIGURE_ARGS+=	--disable-64bit
.endif

INSTALLATION_DIRS=	include/net lkm

do-install:
	${INSTALL_DATA} ${WRKSRC}/if_tun.h ${DESTDIR}${PREFIX}/include/net
.for f in tap tap.conf tun tun.conf
	${INSTALL_DATA} ${WRKSRC}/${f} ${DESTDIR}${PREFIX}/lkm
.endfor

.include "../../mk/bsd.pkg.mk"
