# $NetBSD: buildlink3.mk,v 1.7 2013/10/10 14:41:45 ryoon Exp $

BUILDLINK_TREE+=	goffice0.10

.if !defined(GOFFICE0.10_BUILDLINK3_MK)
GOFFICE0.10_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.goffice0.10+=	goffice0.10>=0.10.0
BUILDLINK_ABI_DEPENDS.goffice0.10+=	goffice0.10>=0.10.7nb1
BUILDLINK_PKGSRCDIR.goffice0.10?=	../../misc/goffice0.10

.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/libgsf/buildlink3.mk"
.include "../../devel/pango/buildlink3.mk"
.include "../../graphics/cairo/buildlink3.mk"
.include "../../graphics/librsvg/buildlink3.mk"
.include "../../graphics/lasem/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.endif # GOFFICE0.10_BUILDLINK3_MK

BUILDLINK_TREE+=	-goffice0.10
