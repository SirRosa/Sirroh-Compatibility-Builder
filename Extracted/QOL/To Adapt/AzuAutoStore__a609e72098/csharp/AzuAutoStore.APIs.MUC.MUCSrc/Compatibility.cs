using System.Collections.Generic;
using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Helper;

namespace AzuAutoStore.APIs.MUC.MUCSrc;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public static class Compatibility
{
	private static bool IsExtendedInventory(this Inventory inventory, out List<Inventory> inventories)
	{
		if (inventory.IsType("ExtendedInventory") && inventory.HasField("_inventories"))
		{
			inventories = inventory.GetField<List<Inventory>>("_inventories");
			return true;
		}
		inventories = null;
		return false;
	}

	public static List<Inventory> GetInventories(this Inventory inventory)
	{
		if (inventory.IsExtendedInventory(out var inventories))
		{
			return inventories;
		}
		return new List<Inventory> { inventory };
	}
}
