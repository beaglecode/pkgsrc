# $NetBSD: options.mk,v 1.26 2014/03/20 22:19:35 imil Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.nginx
PKG_SUPPORTED_OPTIONS=	dav flv gtools inet6 luajit mail-proxy memcache naxsi \
			pcre push realip ssl sub uwsgi image-filter upload \
			debug status nginx-autodetect-cflags spdy echo \
			set-misc headers-more
PKG_SUGGESTED_OPTIONS=	inet6 pcre ssl

PLIST_VARS+=		naxsi uwsgi

.include "../../mk/bsd.options.mk"

# documentation says naxsi must be the first module
.if !empty(PKG_OPTIONS:Mnaxsi)
PLIST.naxsi=		yes
CONFIGURE_ARGS+=	--add-module=../${NAXSI}/naxsi_src
.endif

.if !empty(PKG_OPTIONS:Mdebug)
CONFIGURE_ARGS+=	--with-debug
.endif

.if !empty(PKG_OPTIONS:Mssl)
.include "../../security/openssl/buildlink3.mk"
CONFIGURE_ARGS+=	--with-mail_ssl_module
CONFIGURE_ARGS+=	--with-http_ssl_module
.endif

.if !empty(PKG_OPTIONS:Mpcre)
.include "../../devel/pcre/buildlink3.mk"
CONFIGURE_ARGS+=	--with-pcre-jit
.else
CONFIGURE_ARGS+=	--without-pcre
CONFIGURE_ARGS+=	--without-http_rewrite_module
.endif

.if !empty(PKG_OPTIONS:Mdav)
CONFIGURE_ARGS+=	--with-http_dav_module
.endif

.if !empty(PKG_OPTIONS:Mflv)
CONFIGURE_ARGS+=	--with-http_flv_module
.endif

.if !empty(PKG_OPTIONS:Mspdy)
CONFIGURE_ARGS+=	--with-http_spdy_module
.endif

.if !empty(PKG_OPTIONS:Msub)
CONFIGURE_ARGS+=	--with-http_sub_module
.endif

.if !empty(PKG_OPTIONS:Mgtools)
CONFIGURE_ARGS+=	--with-google_perftools_module
.endif

.if !empty(PKG_OPTIONS:Mmail-proxy)
CONFIGURE_ARGS+=	--with-mail
.endif

.if empty(PKG_OPTIONS:Mmemcache)
CONFIGURE_ARGS+=	--without-http_memcached_module
.endif

.if !empty(PKG_OPTIONS:Mnaxsi) || make(makesum)
NAXSI=				naxsi-0.53-2
NAXSI_DISTFILE=			${NAXSI}.tar.gz
SITES.${NAXSI_DISTFILE}=	http://ftp.NetBSD.org/pub/pkgsrc/distfiles/
DISTFILES+=			${NAXSI_DISTFILE}
.endif

.if !empty(PKG_OPTIONS:Mrealip)
CONFIGURE_ARGS+=	--with-http_realip_module
.endif

.if !empty(PKG_OPTIONS:Minet6)
CONFIGURE_ARGS+=	--with-ipv6
.endif

# NDK must be added once and before 3rd party modules needing it
.if !empty(PKG_OPTIONS:Mluajit) || !empty(PKG_OPTIONS:Mset-misc)
CONFIGURE_ARGS+=	--add-module=../${NDK}
NEED_NDK=		yes
.endif

.if !empty(PKG_OPTIONS:Mluajit)
CONFIGURE_ARGS+=	--add-module=../${LUA}
.endif
.if !empty(PKG_OPTIONS:Mluajit) || make(makesum)
LUA=			lua-nginx-module-0.9.5
LUA_DISTFILE=		${LUA}.tar.gz
SITES.${LUA_DISTFILE}=	http://ftp.NetBSD.org/pub/pkgsrc/distfiles/
DISTFILES+=		${LUA_DISTFILE}

DEPENDS+=		LuaJIT2>=2.0.3:../../lang/LuaJIT2
.endif

.if !empty(PKG_OPTIONS:Mecho)
CONFIGURE_ARGS+=	--add-module=../${ECHOMOD}
.endif
.if !empty(PKG_OPTIONS:Mecho) || make(makesum)
ECHOMOD=		echo-nginx-module-0.51
ECHOMOD_DISTFILE=	${ECHOMOD}.tar.gz
SITES.${ECHOMOD_DISTFILE}=	http://ftp.NetBSD.org/pub/pkgsrc/distfiles/
DISTFILES+=		${ECHOMOD_DISTFILE}
.endif

.if !empty(PKG_OPTIONS:Mset-misc)
CONFIGURE_ARGS+=	--add-module=../${SETMISC}
.endif
.if !empty(PKG_OPTIONS:Mset-misc) || make(makesum)
SETMISC=		set-misc-nginx-module-0.24
SETMISC_DISTFILE=	${SETMISC}.tar.gz
SITES.${SETMISC_DISTFILE}=	http://ftp.NetBSD.org/pub/pkgsrc/distfiles/
DISTFILES+=		${SETMISC_DISTFILE}
.endif

.if defined(NEED_NDK) || make(makesum)
NDK=			ngx_devel_kit-0.2.19
NDK_DISTFILE=		${NDK}.tar.gz
SITES.${NDK_DISTFILE}=	http://ftp.NetBSD.org/pub/pkgsrc/distfiles/
DISTFILES+=		${NDK_DISTFILE}
.endif

.if !empty(PKG_OPTIONS:Mheaders-more)
CONFIGURE_ARGS+=	--add-module=../${HEADMORE}
.endif
.if !empty(PKG_OPTIONS:Mheaders-more) || make(makesum)
HEADMORE=		headers-more-nginx-module-0.25
HEADMORE_DISTFILE=	${HEADMORE}.tar.gz
SITES.${HEADMORE_DISTFILE}=	http://ftp.NetBSD.org/pub/pkgsrc/distfiles/
DISTFILES+=		${HEADMORE_DISTFILE}
.endif

.if !empty(PKG_OPTIONS:Muwsgi)
EGFILES+=		uwsgi_params
PLIST.uwsgi=		yes
.else
CONFIGURE_ARGS+=	--without-http_uwsgi_module
.endif

.if !empty(PKG_OPTIONS:Mpush)
CONFIGURE_ARGS+=	--add-module=../${PUSH}
.endif
.if !empty(PKG_OPTIONS:Mpush) || make(makesum)
PUSH=			nginx_http_push_module-0.692
PUSH_DISTFILE=		${PUSH}.tar.gz
SITES.${PUSH_DISTFILE}=	http://pushmodule.slact.net/downloads/

DISTFILES+=		${PUSH_DISTFILE}
.endif

.if !empty(PKG_OPTIONS:Mupload)
CONFIGURE_ARGS+=	--add-module=../${NGX_UPLOAD}
.endif

.if !empty(PKG_OPTIONS:Mupload) || make(makesum)
DISTFILES+=		${NGX_UPLOAD_DISTFILE}

NGX_UPLOAD=		nginx_upload_module-2.2.0
NGX_UPLOAD_DISTFILE=	${NGX_UPLOAD}.tar.gz
SITES.${NGX_UPLOAD_DISTFILE}=	http://www.grid.net.ru/nginx/download/
.endif

.if !empty(PKG_OPTIONS:Mimage-filter)
.include "../../graphics/gd/buildlink3.mk"
CONFIGURE_ARGS+=	--with-http_image_filter_module
.endif

.if !empty(PKG_OPTIONS:Mstatus)
CONFIGURE_ARGS+=	--with-http_stub_status_module
.endif
