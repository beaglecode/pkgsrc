# $NetBSD: Makefile,v 1.9 2013/05/31 12:40:02 wiz Exp $

DISTNAME=	Algorithm-C3-0.08
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	4
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Algorithm/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/Algorithm-C3/
COMMENT=	Module for merging hierarchies using the C3 algorithm
LICENSE=	${PERL5_LICENSE}

PERL5_MODULE_TYPE=	Module::Build

USE_LANGUAGES=	# empty
PERL5_PACKLIST= auto/Algorithm/C3/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
