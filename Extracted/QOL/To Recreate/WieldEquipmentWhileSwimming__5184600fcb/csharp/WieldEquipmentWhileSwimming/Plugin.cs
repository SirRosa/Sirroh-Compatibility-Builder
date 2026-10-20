using System;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using BepInEx;
using BepInEx.Configuration;
using HarmonyLib;
using JetBrains.Annotations;
using ServerSync;
using UnityEngine;

namespace WieldEquipmentWhileSwimming;

[BepInPlugin("blacks7ar.WieldEquipmentWhileSwimming", "WieldEquipmentWhileSwimming", "1.1.4")]
public class Plugin : BaseUnityPlugin
{
	private enum Toggle
	{
		On = 1,
		Off = 0
	}

	public class ConfigurationManagerAttributes
	{
		[UsedImplicitly]
		public int? Order;

		[UsedImplicitly]
		public bool? Browsable;

		[UsedImplicitly]
		public string Category;

		[UsedImplicitly]
		public Action<ConfigEntryBase> CustomDrawer;
	}

	private enum UseOptions
	{
		All,
		WeaponsOnly,
		ToolsOnly,
		Custom
	}

	[HarmonyPatch]
	public static class Patches
	{
		[HarmonyPrefix]
		[HarmonyPatch(typeof(Character), "IsSwimming")]
		private static bool IsSwimming_Prefix(Humanoid __instance, float ___m_swimTimer, ref bool __result)
		{
			//IL_0116: Unknown result type (might be due to invalid IL or missing references)
			//IL_011d: Invalid comparison between Unknown and I4
			//IL_015b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0162: Invalid comparison between Unknown and I4
			if (!(___m_swimTimer < 0.5f) || !((Character)__instance).IsPlayer())
			{
				return true;
			}
			StackTrace stackTrace = new StackTrace();
			string text = "";
			for (int i = 2; i < stackTrace.FrameCount && i < 10; i++)
			{
				text = text + GeneralExtensions.FullDescription(stackTrace.GetFrame(i).GetMethod()) + "_";
			}
			if (!text.Contains("UpdateEquipment") && !text.Contains("EquipItem"))
			{
				return true;
			}
			switch (_useOptions.Value)
			{
			case UseOptions.All:
				if ((__instance.GetRightItem() != null && Enumerable.Contains(_blackList.Value.Split(','), ((Object)__instance.GetRightItem().m_dropPrefab).name)) || (__instance.GetLeftItem() != null && Enumerable.Contains(_blackList.Value.Split(','), ((Object)__instance.GetLeftItem().m_dropPrefab).name)))
				{
					__instance.HideHandItems(false, true);
				}
				__result = false;
				return false;
			case UseOptions.ToolsOnly:
				if ((__instance.GetRightItem() != null && ((int)__instance.GetRightItem().m_shared.m_itemType != 19 || Enumerable.Contains(_blackList.Value.Split(','), ((Object)__instance.GetRightItem().m_dropPrefab).name))) || (__instance.GetLeftItem() != null && ((int)__instance.GetLeftItem().m_shared.m_itemType != 19 || Enumerable.Contains(_blackList.Value.Split(','), ((Object)__instance.GetLeftItem().m_dropPrefab).name))))
				{
					__instance.HideHandItems(false, true);
				}
				__result = false;
				return false;
			case UseOptions.WeaponsOnly:
				if ((__instance.GetRightItem() != null && (!__instance.GetRightItem().IsWeapon() || Enumerable.Contains(_blackList.Value.Split(','), ((Object)__instance.GetRightItem().m_dropPrefab).name))) || (__instance.GetLeftItem() != null && (!__instance.GetLeftItem().IsWeapon() || Enumerable.Contains(_blackList.Value.Split(','), ((Object)__instance.GetLeftItem().m_dropPrefab).name))))
				{
					__instance.HideHandItems(false, true);
				}
				__result = false;
				return false;
			case UseOptions.Custom:
				if ((__instance.GetRightItem() != null && (!Enumerable.Contains(_useCustom.Value.Split(','), ((Object)__instance.GetRightItem().m_dropPrefab).name) || Enumerable.Contains(_blackList.Value.Split(','), ((Object)__instance.GetRightItem().m_dropPrefab).name))) || (__instance.GetLeftItem() != null && (!Enumerable.Contains(_useCustom.Value.Split(','), ((Object)__instance.GetLeftItem().m_dropPrefab).name) || Enumerable.Contains(_blackList.Value.Split(','), ((Object)__instance.GetLeftItem().m_dropPrefab).name))))
				{
					__instance.HideHandItems(false, true);
				}
				__result = false;
				return false;
			default:
				return true;
			}
		}

		[HarmonyPrefix]
		[HarmonyPatch(typeof(Humanoid), "EquipItem")]
		private static void EquipItem_Prefix()
		{
		}

		[HarmonyPrefix]
		[HarmonyPatch(typeof(Humanoid), "UpdateEquipment")]
		private static void UpdateEquipment_Prefix()
		{
		}
	}

	private const string modGUID = "blacks7ar.WieldEquipmentWhileSwimming";

	public const string modName = "WieldEquipmentWhileSwimming";

	public const string modAuthor = "blacks7ar";

	public const string modVersion = "1.1.4";

	private static readonly Harmony _harmony = new Harmony("blacks7ar.WieldEquipmentWhileSwimming");

	private static readonly ConfigSync _configSync = new ConfigSync("blacks7ar.WieldEquipmentWhileSwimming")
	{
		DisplayName = "WieldEquipmentWhileSwimming",
		CurrentVersion = "1.1.4",
		MinimumRequiredVersion = "1.1.4"
	};

	private static ConfigEntry<Toggle> _serverConfigLocked;

	private static ConfigEntry<UseOptions> _useOptions;

	private static ConfigEntry<string> _useCustom;

	private static ConfigEntry<string> _blackList;

	private ConfigEntry<T> config<T>(string group, string name, T value, ConfigDescription description, bool synchronizedConfig = true)
	{
		//IL_002a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0030: Expected Obj, but got Unknown
		ConfigDescription val = new ConfigDescription(description.Description + (synchronizedConfig ? " [Synced with Server]" : " [Not Synced with Server]"), description.AcceptableValues, description.Tags);
		ConfigEntry<T> val2 = ((BaseUnityPlugin)this).Config.Bind<T>(group, name, value, val);
		_configSync.AddConfigEntry<T>(val2).SynchronizedConfig = synchronizedConfig;
		return val2;
	}

	private ConfigEntry<T> config2<T>(string group, string name, T value, string desc, bool synchronizedConfig = true)
	{
		//IL_0038: Unknown result type (might be due to invalid IL or missing references)
		//IL_0044: Expected Obj, but got Unknown
		ConfigurationManagerAttributes configurationManagerAttributes = new ConfigurationManagerAttributes
		{
			CustomDrawer = TextBox
		};
		return config(group, name, value, new ConfigDescription(desc, (AcceptableValueBase)null, new object[1] { configurationManagerAttributes }), synchronizedConfig);
	}

	public void Awake()
	{
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Expected Obj, but got Unknown
		//IL_005a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0065: Expected Obj, but got Unknown
		((BaseUnityPlugin)this).Config.SaveOnConfigSet = false;
		_serverConfigLocked = config("1- ServerSync", "Lock Configuration", Toggle.On, new ConfigDescription("If On, the configuration is locked and can be changed by server admins only.", (AcceptableValueBase)null, Array.Empty<object>()));
		_configSync.AddLockingConfigEntry<Toggle>(_serverConfigLocked);
		_useOptions = config("2- General", "Allow", UseOptions.All, new ConfigDescription("Allow selected options to use in water.", (AcceptableValueBase)null, Array.Empty<object>()));
		_useCustom = config2("2- General", "Custom", "Hammer,AxeBronze,Hoe,PickaxeAntler", "Allow only the items in the list when Allow is set to Custom.");
		_blackList = config2("2- General", "Black List", "Hoe", "Dont allow items on this list to be use while swimming.");
		((BaseUnityPlugin)this).Config.SaveOnConfigSet = true;
		((BaseUnityPlugin)this).Config.Save();
		Assembly executingAssembly = Assembly.GetExecutingAssembly();
		_harmony.PatchAll(executingAssembly);
	}

	private void OnDestroy()
	{
		((BaseUnityPlugin)this).Config.Save();
	}

	private static void TextBox(ConfigEntryBase entryBase)
	{
		entryBase.BoxedValue = GUILayout.TextArea((string)entryBase.BoxedValue, new GUILayoutOption[2]
		{
			GUILayout.ExpandWidth(true),
			GUILayout.ExpandHeight(true)
		});
	}

	static Plugin()
	{
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_000f: Expected Obj, but got Unknown
	}
}
