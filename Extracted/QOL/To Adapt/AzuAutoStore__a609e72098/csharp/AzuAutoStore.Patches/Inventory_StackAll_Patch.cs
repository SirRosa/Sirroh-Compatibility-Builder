using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Reflection.Emit;
using System.Runtime.CompilerServices;
using AzuAutoStore.Interfaces;
using AzuAutoStore.Patches.Favoriting;
using HarmonyLib;
using UnityEngine;

namespace AzuAutoStore.Patches;

[HarmonyPatch(typeof(Inventory), "StackAll", new Type[]
{
	typeof(Inventory),
	typeof(bool)
})]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public static class Inventory_StackAll_Patch
{
	public static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
	{
		//IL_0058: Unknown result type (might be due to invalid IL or missing references)
		//IL_0072: Unknown result type (might be due to invalid IL or missing references)
		//IL_0078: Expected Obj, but got Unknown
		//IL_0086: Unknown result type (might be due to invalid IL or missing references)
		//IL_008c: Expected Obj, but got Unknown
		//IL_00a5: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ab: Expected Obj, but got Unknown
		//IL_00b3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b9: Expected Obj, but got Unknown
		MethodInfo methodInfo = AccessTools.DeclaredMethod(typeof(Inventory), "GetAllItems", Type.EmptyTypes, (Type[])null);
		ConstructorInfo constructorInfo = AccessTools.Constructor(typeof(List<ItemData>), new Type[1] { typeof(IEnumerable<ItemData>) }, false);
		MethodInfo methodInfo2 = AccessTools.DeclaredMethod(typeof(Inventory_StackAll_Patch), "FilterItems", (Type[])null, (Type[])null);
		return new CodeMatcher(instructions, (ILGenerator)null).MatchForward(false, new CodeMatch[2]
		{
			new CodeMatch((OpCode?)OpCodes.Callvirt, (object)methodInfo, (string)null),
			new CodeMatch((OpCode?)OpCodes.Newobj, (object)constructorInfo, (string)null)
		}).Advance(2).Insert(new CodeInstruction[2]
		{
			new CodeInstruction(OpCodes.Ldarg_1, (object)null),
			new CodeInstruction(OpCodes.Call, (object)methodInfo2)
		})
			.InstructionEnumeration();
	}

	public static List<ItemData> FilterItems(List<ItemData> items, Inventory fromInventory)
	{
		if (!Object.op_Implicit((Object)(object)Player.m_localPlayer) || fromInventory != ((Humanoid)Player.m_localPlayer).GetInventory())
		{
			return items;
		}
		return items.Where(ShouldIncludeItem).ToList();
	}

	public static bool ShouldIncludeItem(ItemData item)
	{
		return !VanillaContainers.CantStoreFavorite(item, UserConfig.GetPlayerConfig(Player.m_localPlayer.GetPlayerID()));
	}
}
