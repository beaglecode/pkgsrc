# $NetBSD: Makefile,v 1.7 2013/05/31 12:41:48 wiz Exp $

DISTNAME=	PostScript-Simple-0.07
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	4
CATEGORIES=	print perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=PostScript/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/PostScript-Simple/
COMMENT=	Produce PostScript files from Perl
LICENSE=	gnu-gpl-v2

REPLACE_PERL+=		lib/PostScript/Simple.pm lib/PostScript/Simple/EPS.pm

PERL5_PACKLIST=		auto/PostScript/Simple/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
