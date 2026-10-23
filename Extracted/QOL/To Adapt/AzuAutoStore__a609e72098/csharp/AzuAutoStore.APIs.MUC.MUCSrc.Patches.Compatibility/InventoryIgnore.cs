using System.Runtime.CompilerServices;
using UnityEngine;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Patches.Compatibility;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
public static class InventoryIgnore
{
	public static bool IgnoreInventory(this InventoryOwner owner)
	{
		if (OdinShip.IsOdinShipInstalled() && owner is ContainerInventoryOwner containerInventoryOwner && containerInventoryOwner.Container.IsOdinShipContainer())
		{
			return true;
		}
		if (owner == null || !Object.op_Implicit((Object)(object)owner.ZNetView) || owner.ZNetView.GetZDO() == null)
		{
			return false;
		}
		return owner.ZNetView.GetZDO().GetBool("MUC_Ignore", false);
	}

	public static bool IgnoreInventory(this Container container)
	{
		return InventoryOwner.GetOwner(container.GetInventory()).IgnoreInventory();
	}
}
