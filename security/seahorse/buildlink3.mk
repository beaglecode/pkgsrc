# $NetBSD: buildlink3.mk,v 1.29 2013/06/03 10:05:56 wiz Exp $

BUILDLINK_TREE+=	seahorse

.if !defined(SEAHORSE_BUILDLINK3_MK)
SEAHORSE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.seahorse+=	seahorse>=2.24.1
BUILDLINK_ABI_DEPENDS.seahorse+=	seahorse>=2.32.0nb19
BUILDLINK_PKGSRCDIR.seahorse?=	../../security/seahorse

.include "../../sysutils/dbus-glib/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.endif # SEAHORSE_BUILDLINK3_MK

BUILDLINK_TREE+=	-seahorse
