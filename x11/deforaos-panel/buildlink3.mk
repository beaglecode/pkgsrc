# $NetBSD: buildlink3.mk,v 1.3 2013/06/03 10:06:10 wiz Exp $
#

BUILDLINK_TREE+=	deforaos-panel

.if !defined(DEFORAOS_PANEL_BUILDLINK3_MK)
DEFORAOS_PANEL_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.deforaos-panel+=	deforaos-panel>=0.2.12
BUILDLINK_ABI_DEPENDS.deforaos-panel?=	deforaos-panel>=0.2.16nb2
BUILDLINK_PKGSRCDIR.deforaos-panel?=	../../x11/deforaos-panel

.include "../../devel/deforaos-libsystem/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.endif	# DEFORAOS_PANEL_BUILDLINK3_MK

BUILDLINK_TREE+=	-deforaos-panel
