using System;
using System.Reflection;
using BepInEx;
using BepInEx.Logging;
using HarmonyLib;
using UnityEngine;

namespace AutoRepair;

[BepInPlugin("mtsukn.AutoRepair", "AutoRepair", "0.0.1")]
public class Main : BaseUnityPlugin
{
	[HarmonyPatch(typeof(CraftingStation), "Interact")]
	public static class CraftingPatch
	{
		public static void Postfix(CraftingStation __instance, Humanoid user, bool repeat, bool alt)
		{
			int num = 0;
			InventoryGui instance = InventoryGui.instance;
			MethodInfo methodInfo = AccessTools.Method(typeof(InventoryGui), "HaveRepairableItems", (Type[])null, (Type[])null);
			while ((bool)methodInfo.Invoke(instance, null))
			{
				num++;
				AccessTools.Method(typeof(InventoryGui), "RepairOneItem", (Type[])null, (Type[])null).Invoke(instance, null);
			}
			if (num > 0)
			{
				((Character)Player.m_localPlayer).Message((MessageType)2, " ", 0, (Sprite)null, false);
				logger.LogInfo((object)$"[AutoRepair] Repaired {num} objects!\n");
			}
		}
	}

	private const string pluginGUID = "mtsukn.AutoRepair";

	private const string pluginName = "AutoRepair";

	private const string pluginVersion = "0.0.1";

	private readonly Harmony HarmonyInstance = new Harmony("mtsukn.AutoRepair");

	public static ManualLogSource logger = Logger.CreateLogSource("AutoRepair");

	public void Awake()
	{
		Assembly executingAssembly = Assembly.GetExecutingAssembly();
		HarmonyInstance.PatchAll(executingAssembly);
	}

	public Main()
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0010: Expected Obj, but got Unknown
	}
}
