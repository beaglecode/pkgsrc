# $NetBSD: Makefile,v 1.19 2014/01/05 20:13:17 wiz Exp $

DISTNAME=	libvisio-0.0.31
PKGREVISION=	3
CATEGORIES=	converters
MASTER_SITES=	http://dev-www.libreoffice.org/src/
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	ftigeot@wolfpond.org
HOMEPAGE=	http://www.freedesktop.org/wiki/Software/libvisio/
COMMENT=	Library and tools for parsing the visio file format
LICENSE=	gnu-lgpl-v2.1 OR mpl-1.1 OR gnu-gpl-v2

BUILD_DEPENDS+=	doxygen>=1.8.6:../../devel/doxygen
BUILD_DEPENDS+=	gperf-[0-9]*:../../devel/gperf

USE_LANGUAGES=	c c++
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--disable-werror
PKGCONFIG_OVERRIDE=	libvisio-0.0.pc.in
USE_TOOLS+=	perl:build

.include "../../converters/libwpd/buildlink3.mk"
.include "../../converters/libwpg/buildlink3.mk"
.include "../../devel/boost-libs/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../textproc/icu/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
