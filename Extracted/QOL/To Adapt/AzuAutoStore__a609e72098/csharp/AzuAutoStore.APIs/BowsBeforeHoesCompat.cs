using System;
using System.Reflection;
using System.Runtime.CompilerServices;
using BepInEx.Bootstrap;
using HarmonyLib;

namespace AzuAutoStore.APIs;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
internal static class BowsBeforeHoesCompat
{
	private const string Guid = "Azumatt.BowsBeforeHoes";

	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	private static MethodInfo getQuiverInventory;

	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	private static MethodInfo canAddItem;

	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	private static MethodInfo addItem;

	internal static bool IsLoaded => Chainloader.PluginInfos.ContainsKey("Azumatt.BowsBeforeHoes");

	[return: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	internal static Inventory GetInventory(ItemData item)
	{
		EnsureMethods();
		object? obj = getQuiverInventory?.Invoke(null, new object[1] { item });
		return (Inventory)((obj is Inventory) ? obj : null);
	}

	internal static bool CanAdd(ItemData quiver, ItemData item)
	{
		EnsureMethods();
		return canAddItem?.Invoke(null, new object[2] { quiver, item }) as bool? == true;
	}

	internal static bool Add(ItemData quiver, ItemData item)
	{
		EnsureMethods();
		return addItem?.Invoke(null, new object[2] { quiver, item }) as bool? == true;
	}

	private static void EnsureMethods()
	{
		if (!(getQuiverInventory != null) && Chainloader.PluginInfos.TryGetValue("Azumatt.BowsBeforeHoes", out var value))
		{
			Type type = ((object)value.Instance).GetType().Assembly.GetType("BowsBeforeHoes.API");
			if (!(type == null))
			{
				Type[] array = new Type[2]
				{
					typeof(ItemData),
					typeof(ItemData)
				};
				getQuiverInventory = AccessTools.Method(type, "GetQuiverInventory", new Type[1] { typeof(ItemData) }, (Type[])null);
				canAddItem = AccessTools.Method(type, "CanAddItem", array, (Type[])null);
				addItem = AccessTools.Method(type, "AddItem", array, (Type[])null);
			}
		}
	}
}
