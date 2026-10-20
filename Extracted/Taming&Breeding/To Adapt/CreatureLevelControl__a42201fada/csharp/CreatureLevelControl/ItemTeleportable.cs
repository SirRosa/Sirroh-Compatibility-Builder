using System.Runtime.CompilerServices;
using HarmonyLib;

namespace CreatureLevelControl;

public static class ItemTeleportable
{
	[HarmonyPatch(typeof(Inventory), "IsTeleportable")]
	private static class CheckIfItemsAreTeleportable
	{
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		[HarmonyPostfix]
		private static void Postfix(Inventory __instance, ref bool __result)
		{
			if (!__result)
			{
				return;
			}
			Utils.RequestServerTime();
			foreach (ItemData item in __instance.m_inventory)
			{
				ItemConfig.Teleportable? teleportable = Utils.ReadWithWorldLevelFromConfig(item, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)] [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] (ItemConfig c) => c.worldLevelToItemTeleportable);
				if (!teleportable.HasValue)
				{
					continue;
				}
				ItemConfig.Teleportable valueOrDefault = teleportable.GetValueOrDefault();
				if (true)
				{
					int amount = valueOrDefault.amount;
					if ((amount == 0 || amount == int.MaxValue) ? true : false)
					{
						break;
					}
					if (item.m_stack > valueOrDefault.amount)
					{
						__result = false;
						break;
					}
				}
			}
		}
	}
}
