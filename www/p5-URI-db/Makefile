# $NetBSD: Makefile,v 1.1 2014/02/20 18:41:16 schmonz Exp $

DISTNAME=	URI-db-0.12
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=URI/}

MAINTAINER=	pkgsrc-users@NetBSD.org
COMMENT=	Perl extension to provide database URIs
HOMEPAGE=	http://search.cpan.org/dist/URI-db/
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-URI-Nested-[0-9]*:../../www/p5-URI-Nested

PKG_INSTALLATION_TYPES=	overwrite pkgviews

PERL5_MODULE_TYPE=	Module::Build
PERL5_PACKLIST=		auto/URI/db/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
