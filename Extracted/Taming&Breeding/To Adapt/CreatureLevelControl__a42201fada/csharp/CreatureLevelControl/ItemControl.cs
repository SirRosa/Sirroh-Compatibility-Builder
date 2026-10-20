using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Reflection.Emit;
using System.Runtime.CompilerServices;
using HarmonyLib;
using JetBrains.Annotations;
using UnityEngine;

namespace CreatureLevelControl;

public static class ItemControl
{
	[HarmonyPatch(typeof(Game), "RequestRespawn")]
	private static class PatchConfigReading
	{
		[UsedImplicitly]
		[HarmonyPriority(200)]
		private static void Postfix(bool ___m_firstSpawn)
		{
			if (!___m_firstSpawn)
			{
				return;
			}
			foreach (ItemDrop item in (from p in ObjectDB.instance.m_items
				select p.GetComponent<ItemDrop>() into c
				where Object.op_Implicit((Object)(object)c) && Object.op_Implicit((Object)(object)((Component)c).GetComponent<ZNetView>())
				select c).Concat(ItemDrop.s_instances))
			{
				((Component)item).gameObject.AddComponent<OriginalItemData>().Init();
			}
		}
	}

	[HarmonyPatch(typeof(ItemDrop), "Awake")]
	private static class PatchSettingsOnItemDropAwake
	{
		[UsedImplicitly]
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		private static void Postfix(ItemDrop __instance)
		{
			bool? flag = Utils.ReadWithWorldLevelFromConfig(__instance, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)] [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] (ItemConfig c) => c.worldLevelToLootPickup);
			if (flag.HasValue)
			{
				bool valueOrDefault = flag == true;
				if (true)
				{
					__instance.m_autoPickup = valueOrDefault;
				}
			}
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	[HarmonyPatch(typeof(ItemDrop), "SetStack")]
	private static class PatchSetStackMaximumAway
	{
		private static readonly FieldInfo maxStackSize = AccessTools.DeclaredField(typeof(SharedData), "m_maxStackSize");

		[UsedImplicitly]
		private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
		{
			foreach (CodeInstruction instruction in instructions)
			{
				yield return instruction;
				if (instruction.opcode == OpCodes.Ldfld && CodeInstructionExtensions.OperandIs(instruction, (MemberInfo)maxStackSize))
				{
					yield return new CodeInstruction(OpCodes.Pop, (object)null);
					yield return new CodeInstruction(OpCodes.Ldc_I4, (object)int.MaxValue);
				}
			}
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	[HarmonyPatch(typeof(Pickable), "RPC_Pick")]
	private static class PatchMiningMultiplier
	{
		[UsedImplicitly]
		[HarmonyPriority(100)]
		private static void Prefix(Pickable __instance, out int __state)
		{
			__state = __instance.m_amount;
			float? num = Utils.ReadWithWorldLevelFromConfig(__instance.m_itemPrefab.GetComponent<ItemDrop>(), [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] (ItemConfig c) => c.worldLevelToLootAmount);
			if (num.HasValue)
			{
				float valueOrDefault = num.GetValueOrDefault();
				if (true)
				{
					__instance.m_amount = Mathf.FloorToInt((float)__instance.m_amount * valueOrDefault + Random.Range(0f, 1f));
				}
			}
		}

		[UsedImplicitly]
		[HarmonyPriority(700)]
		private static void Postfix(Pickable __instance, int __state)
		{
			__instance.m_amount = __state;
		}
	}

	[HarmonyPatch(typeof(Smelter), "Spawn")]
	private static class PatchSmelterMultiplier
	{
		[UsedImplicitly]
		[HarmonyPriority(100)]
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		private static void Prefix(Smelter __instance, string ore, ref int stack)
		{
			ItemConversion itemConversion = __instance.GetItemConversion(ore);
			if (itemConversion == null || itemConversion.m_to == null)
			{
				return;
			}
			float? num = Utils.ReadWithWorldLevelFromConfig(itemConversion.m_to, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)] [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] (ItemConfig c) => c.worldLevelToLootAmount);
			if (num.HasValue)
			{
				float valueOrDefault = num.GetValueOrDefault();
				if (true)
				{
					stack = Mathf.FloorToInt((float)stack * valueOrDefault + Random.Range(0f, 1f));
				}
			}
		}
	}

	[HarmonyPatch(typeof(DropTable), "GetDropListItems")]
	private static class PatchGatheringMultiplier_GetDropListItems
	{
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		[HarmonyPriority(100)]
		[UsedImplicitly]
		private static void Postfix(ref List<ItemData> __result)
		{
			List<ItemData> list = new List<ItemData>();
			foreach (ItemData item in __result)
			{
				float num = Utils.ReadWithWorldLevelFromConfig(item, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)] [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] (ItemConfig c) => c.worldLevelToLootAmount) ?? 1f;
				for (int num2 = Mathf.FloorToInt(num + Random.Range(0f, 1f)); num2 > 0; num2--)
				{
					list.Add(item);
				}
			}
			__result = list;
		}
	}

	[HarmonyPatch(typeof(DropTable), "GetDropList", new Type[] { typeof(int) })]
	private static class PatchGatheringMultiplier_GetDropList
	{
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		[UsedImplicitly]
		[HarmonyPriority(100)]
		private static void Postfix(ref List<GameObject> __result)
		{
			List<GameObject> list = new List<GameObject>();
			foreach (GameObject item in __result)
			{
				ItemDrop component = item.GetComponent<ItemDrop>();
				if (component != null)
				{
					float num = Utils.ReadWithWorldLevelFromConfig(component, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)] [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] (ItemConfig c) => c.worldLevelToLootAmount) ?? 1f;
					for (int num2 = Mathf.FloorToInt(num + Random.Range(0f, 1f)); num2 > 0; num2--)
					{
						list.Add(item);
					}
				}
				else
				{
					list.Add(item);
				}
			}
			__result = list;
		}
	}

	[HarmonyPatch(typeof(CharacterDrop), "GenerateDropList")]
	private static class PatchCharacterDropMultiplier
	{
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		[UsedImplicitly]
		[HarmonyPriority(100)]
		private static void Postfix(CharacterDrop __instance, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0, 1 })] ref List<KeyValuePair<GameObject, int>> __result)
		{
			List<KeyValuePair<GameObject, int>> list = new List<KeyValuePair<GameObject, int>>();
			foreach (KeyValuePair<GameObject, int> item in __result)
			{
				ItemDrop component = item.Key.GetComponent<ItemDrop>();
				if (component != null)
				{
					float num = Utils.ReadWithWorldLevelFromConfig(component, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)] [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] (ItemConfig c) => c.worldLevelToLootAmount) ?? 1f;
					int value = Mathf.FloorToInt((float)item.Value * num + Random.Range(0f, 1f));
					list.Add(new KeyValuePair<GameObject, int>(item.Key, value));
				}
				else
				{
					list.Add(item);
				}
			}
			__result = list;
			__instance.m_dropsEnabled = false;
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	[HarmonyPatch(typeof(Player), "CreateTombStone")]
	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	private static class PatchItemLoss
	{
		[HarmonyPriority(700)]
		[UsedImplicitly]
		private static void Prefix(Player __instance, out List<ItemData> __state)
		{
			List<ItemData> list = new List<ItemData>();
			__state = new List<ItemData>();
			foreach (ItemData item in ((Humanoid)__instance).m_inventory.m_inventory)
			{
				if (Utils.ReadWithWorldLevelFromConfig(item, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] (ItemConfig c) => c.worldLevelToItemLoss) ?? true)
				{
					list.Add(item);
				}
				else
				{
					__state.Add(item);
				}
			}
			((Humanoid)__instance).m_inventory.m_inventory = list;
		}

		[HarmonyPriority(100)]
		[UsedImplicitly]
		private static void Postfix(Player __instance, List<ItemData> __state)
		{
			foreach (ItemData item in __state)
			{
				((Humanoid)__instance).m_inventory.m_inventory.Add(item);
			}
			((Humanoid)__instance).m_inventory.Changed(false, false);
		}
	}

	[HarmonyPatch(typeof(CookingStation), "RPC_RemoveDoneItem")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	public class PatchCookingStationItemMultiplier
	{
		private static readonly MethodInfo ItemSpawner = AccessTools.DeclaredMethod(typeof(CookingStation), "SpawnItem", (Type[])null, (Type[])null);

		private static readonly MethodInfo ItemSpawnMultiplier = AccessTools.DeclaredMethod(typeof(PatchCookingStationItemMultiplier), "multiplyItemSpawn", (Type[])null, (Type[])null);

		private static void multiplyItemSpawn(CookingStation station, string prefabName, int slot, Vector3 userPoint, bool cheated)
		{
			//IL_0076: Unknown result type (might be due to invalid IL or missing references)
			ItemDrop component = ObjectDB.instance.GetItemPrefab(prefabName).GetComponent<ItemDrop>();
			int num = 1;
			float? num2 = Utils.ReadWithWorldLevelFromConfig(component, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] (ItemConfig c) => c.worldLevelToLootAmount);
			if (num2.HasValue)
			{
				float valueOrDefault = num2.GetValueOrDefault();
				if (true)
				{
					num = Mathf.FloorToInt(valueOrDefault + Random.Range(0f, 1f));
				}
			}
			for (int num3 = 0; num3 < num; num3++)
			{
				station.SpawnItem(prefabName, slot, userPoint, cheated);
			}
		}

		[UsedImplicitly]
		private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
		{
			foreach (CodeInstruction instruction in instructions)
			{
				if (instruction.opcode == OpCodes.Call && CodeInstructionExtensions.OperandIs(instruction, (MemberInfo)ItemSpawner))
				{
					yield return new CodeInstruction(OpCodes.Call, (object)ItemSpawnMultiplier);
				}
				else
				{
					yield return instruction;
				}
			}
		}
	}

	[HarmonyPatch(typeof(InventoryGui), "DoCrafting")]
	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	public class PatchCraftingMultiplier
	{
		private static readonly MethodInfo ItemAdder = AccessTools.DeclaredMethod(typeof(Inventory), "AddItem", new Type[8]
		{
			typeof(string),
			typeof(int),
			typeof(int),
			typeof(int),
			typeof(long),
			typeof(string),
			typeof(bool),
			typeof(bool)
		}, (Type[])null);

		private static readonly MethodInfo ItemAddMultiplier = AccessTools.DeclaredMethod(typeof(PatchCraftingMultiplier), "multiplyItemAdd", (Type[])null, (Type[])null);

		private static ItemData multiplyItemAdd(Inventory inventory, string name, int stack, int quality, int variant, long crafterID, string crafterName, bool pickedUp)
		{
			ItemDrop component = ObjectDB.instance.GetItemPrefab(name).GetComponent<ItemDrop>();
			if (component != null)
			{
				float? num = Utils.ReadWithWorldLevelFromConfig(component, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] (ItemConfig c) => c.worldLevelToLootAmount);
				if (num.HasValue)
				{
					float valueOrDefault = num.GetValueOrDefault();
					if (true)
					{
						stack = Mathf.FloorToInt((float)stack * valueOrDefault + Random.Range(0f, 1f));
					}
				}
			}
			return inventory.AddItem(name, stack, quality, variant, crafterID, crafterName, pickedUp, false);
		}

		[UsedImplicitly]
		private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
		{
			foreach (CodeInstruction instruction in instructions)
			{
				if (instruction.opcode == OpCodes.Callvirt && CodeInstructionExtensions.OperandIs(instruction, (MemberInfo)ItemAdder))
				{
					yield return new CodeInstruction(OpCodes.Call, (object)ItemAddMultiplier);
				}
				else
				{
					yield return instruction;
				}
			}
		}
	}

	public static void UpdateAllItemAttributesFromConfig()
	{
		Inventory[] array = Player.s_players.Select((Player p) => ((Humanoid)p).GetInventory()).Concat(from c in Object.FindObjectsOfType<Container>()
			select c.GetInventory()).ToArray();
		foreach (ItemData item in (from i in (from p in ObjectDB.instance.m_items
				select p.GetComponent<ItemDrop>() into c
				where Object.op_Implicit((Object)(object)c) && Object.op_Implicit((Object)(object)((Component)c).GetComponent<ZNetView>())
				select c).Concat(ItemDrop.s_instances)
			select i.m_itemData).Concat(array.SelectMany((Inventory i) => i.GetAllItems())))
		{
			GameObject dropPrefab = item.m_dropPrefab;
			OriginalItemData originalItemData = ((dropPrefab != null) ? dropPrefab.GetComponent<OriginalItemData>() : null);
			if (originalItemData?.weight == null)
			{
				originalItemData?.Init();
			}
			float? num = Utils.ReadFromConfig(item, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)] (ItemConfig c) => c.itemWeight);
			if (num.HasValue)
			{
				float valueOrDefault = num.GetValueOrDefault();
				if (true)
				{
					item.m_shared.m_weight = valueOrDefault;
					goto IL_025f;
				}
			}
			num = originalItemData?.weight.Original;
			if (num.HasValue)
			{
				float valueOrDefault2 = num.GetValueOrDefault();
				if (true)
				{
					num = Utils.ReadFromConfig(item, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)] (ItemConfig c) => c.itemWeightFactor);
					if (num.HasValue)
					{
						float valueOrDefault3 = num.GetValueOrDefault();
						if (true)
						{
							item.m_shared.m_weight = valueOrDefault2 * valueOrDefault3;
							goto IL_025f;
						}
					}
					if (originalItemData.weight.Changed)
					{
						item.m_shared.m_weight = valueOrDefault2;
					}
				}
			}
			goto IL_025f;
			IL_025f:
			int? num2 = Utils.ReadFromConfig(item, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)] (ItemConfig c) => c.itemStack);
			if (num2.HasValue)
			{
				int valueOrDefault4 = num2.GetValueOrDefault();
				if (true)
				{
					item.m_shared.m_maxStackSize = valueOrDefault4;
					goto IL_0372;
				}
			}
			num2 = originalItemData?.maxStackSize.Original;
			if (num2.HasValue)
			{
				int valueOrDefault5 = num2.GetValueOrDefault();
				if (true)
				{
					num = Utils.ReadFromConfig(item, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)] (ItemConfig c) => c.itemStackFactor);
					if (num.HasValue)
					{
						float valueOrDefault6 = num.GetValueOrDefault();
						if (true)
						{
							item.m_shared.m_maxStackSize = Mathf.RoundToInt((float)valueOrDefault5 * valueOrDefault6);
							goto IL_0372;
						}
					}
					if (originalItemData.maxStackSize.Changed)
					{
						item.m_shared.m_maxStackSize = valueOrDefault5;
					}
				}
			}
			goto IL_0372;
			IL_0372:
			ItemConfig.Teleportable? teleportable = Utils.ReadWithWorldLevelFromConfig(item, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)] [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] (ItemConfig c) => c.worldLevelToItemTeleportable) ?? originalItemData?.teleportable.Val;
			if (teleportable.HasValue)
			{
				ItemConfig.Teleportable valueOrDefault7 = teleportable.GetValueOrDefault();
				if (true)
				{
					item.m_shared.m_teleportable = valueOrDefault7.amount > 0;
				}
			}
		}
		foreach (ItemDrop item2 in (from p in ObjectDB.instance.m_items
			select p.GetComponent<ItemDrop>() into c
			where Object.op_Implicit((Object)(object)c) && Object.op_Implicit((Object)(object)((Component)c).GetComponent<ZNetView>())
			select c).Concat(ItemDrop.s_instances))
		{
			GameObject dropPrefab2 = item2.m_itemData.m_dropPrefab;
			OriginalItemData originalItemData2 = ((dropPrefab2 != null) ? dropPrefab2.GetComponent<OriginalItemData>() : null);
			bool? flag = Utils.ReadWithWorldLevelFromConfig(item2, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)] [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] (ItemConfig c) => c.worldLevelToLootPickup) ?? originalItemData2?.autoPickup.Val;
			if (flag.HasValue)
			{
				bool valueOrDefault8 = flag == true;
				if (true)
				{
					item2.m_autoPickup = valueOrDefault8;
				}
			}
			flag = Utils.ReadFromConfig(item2, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)] (ItemConfig c) => c.itemFloating) ?? originalItemData2?.floating.Val;
			if (!flag.HasValue)
			{
				continue;
			}
			bool valueOrDefault9 = flag == true;
			if (1 == 0)
			{
				continue;
			}
			Floating component = ((Component)item2).GetComponent<Floating>();
			if (component != null)
			{
				if (!valueOrDefault9)
				{
					Object.Destroy((Object)(object)component);
				}
			}
			else if (valueOrDefault9)
			{
				((Component)item2).gameObject.AddComponent<Floating>();
			}
		}
		foreach (OriginalItemData item3 in from p in ObjectDB.instance.m_items
			select p.GetComponent<OriginalItemData>() into o
			where Object.op_Implicit((Object)(object)o)
			select o)
		{
			foreach (OriginalItemData.Value value in item3.Values)
			{
				ItemConfig itemConfig = Utils.ReadItemConfig(((Component)item3).gameObject);
				value.Changed = itemConfig != null && value.PresentInConfig(itemConfig);
			}
		}
		Inventory[] array2 = array;
		foreach (Inventory val in array2)
		{
			val.UpdateTotalWeight();
		}
	}
}
