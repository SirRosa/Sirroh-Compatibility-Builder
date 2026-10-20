using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using BepInEx;
using BepInEx.Configuration;
using HarmonyLib;
using ItemDataManager;
using ServerSync;
using SkillManager;
using UnityEngine;
using YamlDotNet.Core;
using YamlDotNet.Serialization;
using YamlDotNet.Serialization.NamingConventions;

namespace BlacksmithingExpanded;

[BepInPlugin("org.bepinex.plugins.blacksmithingexpanded", "Blacksmithing Expanded", "1.2.4")]
public class BlacksmithingExpanded : BaseUnityPlugin
{
	private struct ItemBaseStats
	{
		public float armor;

		public DamageTypes damages;

		public float durability;

		public List<DamageModPair> resistances;

		public float blockPower;

		public float timedBlockBonus;

		public bool isCached;
	}

	public class WorkstationInfusion
	{
		public int tier;

		public float timestamp;

		public float originalSpeed;

		public float bonusSpeed;

		public bool wasActive;

		public bool IsExpired => Time.time - timestamp > cfg_InfusionExpireTime.Value;

		public float RemainingTime => Mathf.Max(0f, cfg_InfusionExpireTime.Value - (Time.time - timestamp));
	}

	private class ItemFilterConfig
	{
		public List<string> Whitelist { get; set; } = new List<string>();

		public List<string> Blacklist { get; set; } = new List<string>();
	}

	public static class ItemEligibilityCache
	{
		private static readonly Dictionary<string, bool> eligibilityCache = new Dictionary<string, bool>();

		private static readonly Dictionary<string, bool> allowedCache = new Dictionary<string, bool>();

		private const int MAX_CACHE_SIZE = 200;

		public static bool IsEligibleForBlacksmithingBonuses(ItemData item)
		{
			if (item?.m_shared == null)
			{
				return false;
			}
			string name = item.m_shared.m_name;
			if (eligibilityCache.TryGetValue(name, out var value))
			{
				return value;
			}
			bool flag = CalculateEligibility(item);
			if (eligibilityCache.Count >= 200)
			{
				string key = eligibilityCache.Keys.First();
				eligibilityCache.Remove(key);
			}
			eligibilityCache[name] = flag;
			return flag;
		}

		public static bool IsItemAllowed(ItemData item)
		{
			if (!cfg_UseYamlFiltering.Value)
			{
				return true;
			}
			if (item?.m_shared == null)
			{
				return false;
			}
			string name = item.m_shared.m_name;
			if (allowedCache.TryGetValue(name, out var value))
			{
				return value;
			}
			bool flag = BlacksmithingExpanded.IsItemAllowed(item);
			if (allowedCache.Count >= 200)
			{
				string key = allowedCache.Keys.First();
				allowedCache.Remove(key);
			}
			allowedCache[name] = flag;
			return flag;
		}

		private static bool CalculateEligibility(ItemData item)
		{
			//IL_000f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0015: Invalid comparison between Unknown and I4
			//IL_001d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0023: Invalid comparison between Unknown and I4
			//IL_002b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0031: Invalid comparison between Unknown and I4
			//IL_0039: Unknown result type (might be due to invalid IL or missing references)
			//IL_0040: Invalid comparison between Unknown and I4
			//IL_0048: Unknown result type (might be due to invalid IL or missing references)
			//IL_004f: Invalid comparison between Unknown and I4
			if (!item.IsWeapon() && (int)item.m_shared.m_itemType != 5 && (int)item.m_shared.m_itemType != 6 && (int)item.m_shared.m_itemType != 7 && (int)item.m_shared.m_itemType != 11 && (int)item.m_shared.m_itemType != 17)
			{
				return false;
			}
			if (item.m_shared.m_maxStackSize > 1)
			{
				return false;
			}
			if (!IsItemAllowed(item))
			{
				return false;
			}
			return true;
		}

		public static void ClearCache()
		{
			eligibilityCache.Clear();
			allowedCache.Clear();
		}
	}

	private class BlacksmithingItemData : ItemData
	{
		public static readonly Dictionary<SharedData, BlacksmithingItemData> activeItems = new Dictionary<SharedData, BlacksmithingItemData>();

		[SerializeField]
		public int level = 0;

		[SerializeField]
		public int lastKnownQuality = 0;

		[SerializeField]
		public string infusion = "";

		[SerializeField]
		public float baseDurability = 0f;

		[SerializeField]
		public float maxDurability = 0f;

		[SerializeField]
		public float armorBonus = 0f;

		[SerializeField]
		public float damageBlunt = 0f;

		[SerializeField]
		public float damageSlash = 0f;

		[SerializeField]
		public float damagePierce = 0f;

		[SerializeField]
		public float damageFire = 0f;

		[SerializeField]
		public float damageFrost = 0f;

		[SerializeField]
		public float damageLightning = 0f;

		[SerializeField]
		public float damagePoison = 0f;

		[SerializeField]
		public float damageSpirit = 0f;

		[SerializeField]
		public float blockPowerBonus = 0f;

		[SerializeField]
		public float timedBlockBonus = 0f;

		[SerializeField]
		public bool statsApplied = false;

		protected override bool AllowStackingIdenticalValues { get; set; } = true;

		~BlacksmithingItemData()
		{
			activeItems.Remove(Item.m_shared);
		}

		public override void Load()
		{
			base.Load();
			if (!IsCloned && level > 0)
			{
				ApplyStoredStats();
				statsApplied = true;
			}
			activeItems[Item.m_shared] = this;
		}

		private void ApplyStoredStats()
		{
			//IL_004a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0054: Expected Obj, but got Unknown
			//IL_0104: Unknown result type (might be due to invalid IL or missing references)
			//IL_012b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0152: Unknown result type (might be due to invalid IL or missing references)
			//IL_0179: Unknown result type (might be due to invalid IL or missing references)
			//IL_01a0: Unknown result type (might be due to invalid IL or missing references)
			//IL_01c7: Unknown result type (might be due to invalid IL or missing references)
			//IL_01ee: Unknown result type (might be due to invalid IL or missing references)
			//IL_0215: Unknown result type (might be due to invalid IL or missing references)
			//IL_0236: Unknown result type (might be due to invalid IL or missing references)
			//IL_023c: Invalid comparison between Unknown and I4
			ItemBaseStats baseStats = GetBaseStats(Item);
			if (!baseStats.isCached)
			{
				return;
			}
			SharedData shared = Item.m_shared;
			Item.m_shared = (SharedData)((object)shared).GetType().GetMethod("MemberwiseClone", BindingFlags.Instance | BindingFlags.NonPublic).Invoke(shared, null);
			if (cfg_EnableDurabilityBonus.Value && maxDurability > 0f)
			{
				Item.m_shared.m_maxDurability = maxDurability;
				Item.m_durability = Mathf.Min(Item.m_durability, Item.GetMaxDurability());
			}
			if (cfg_EnableArmorBonus.Value && armorBonus > 0f)
			{
				Item.m_shared.m_armor = baseStats.armor + armorBonus;
			}
			Item.m_shared.m_damages.m_blunt = baseStats.damages.m_blunt + damageBlunt;
			Item.m_shared.m_damages.m_slash = baseStats.damages.m_slash + damageSlash;
			Item.m_shared.m_damages.m_pierce = baseStats.damages.m_pierce + damagePierce;
			Item.m_shared.m_damages.m_fire = baseStats.damages.m_fire + damageFire;
			Item.m_shared.m_damages.m_frost = baseStats.damages.m_frost + damageFrost;
			Item.m_shared.m_damages.m_lightning = baseStats.damages.m_lightning + damageLightning;
			Item.m_shared.m_damages.m_poison = baseStats.damages.m_poison + damagePoison;
			Item.m_shared.m_damages.m_spirit = baseStats.damages.m_spirit + damageSpirit;
			if ((int)Item.m_shared.m_itemType == 5)
			{
				if (blockPowerBonus > 0f)
				{
					Item.m_shared.m_blockPower = baseStats.blockPower + blockPowerBonus;
				}
				if (timedBlockBonus > 0f)
				{
					Item.m_shared.m_timedBlockBonus = baseStats.timedBlockBonus + timedBlockBonus;
				}
			}
		}

		public override void Unload()
		{
			activeItems.Remove(Item.m_shared);
		}
	}

	[HarmonyPatch(typeof(InventoryGui), "DoCrafting")]
	public static class Patch_Crafting
	{
		private static void Prefix(InventoryGui __instance, out Recipe __state)
		{
			__state = __instance.m_craftRecipe;
		}

		private static void Postfix(InventoryGui __instance, Recipe __state)
		{
			Player localPlayer = Player.m_localPlayer;
			if (((localPlayer != null) ? ((Humanoid)localPlayer).GetInventory() : null) == null || (Object)(object)__state?.m_item == (Object)null)
			{
				return;
			}
			int playerBlacksmithingLevel = GetPlayerBlacksmithingLevel(localPlayer);
			ItemData val = FindMostRecentCraftedItem(localPlayer, __state);
			if (val == null)
			{
				return;
			}
			ApplyCraftingBonuses(val, Math.Max(playerBlacksmithingLevel, 1));
			BlacksmithingItemData blacksmithingItemData = val.Data().Get<BlacksmithingItemData>();
			if (blacksmithingItemData != null && blacksmithingItemData.maxDurability > 0f)
			{
				val.m_durability = val.GetMaxDurability();
			}
			float num = HandleCraftingXP(localPlayer, val);
			if (num >= 1f)
			{
				Debug.Log((object)string.Format("[BlacksmithingExpanded] Crafted {0}: level={1}, quality={2}, xp={3:F2}", new object[4]
				{
					val.m_shared.m_name,
					playerBlacksmithingLevel,
					val.m_quality,
					num
				}));
			}
			if (cfg_EnableExtraItemBonus.Value && ItemEligibilityCache.IsEligibleForBlacksmithingBonuses(val))
			{
				float num2 = cfg_ChanceExtraItemAt100.Value * ((float)playerBlacksmithingLevel / 100f);
				if (Random.value <= num2)
				{
					ItemData val2 = val.Clone();
					((Humanoid)localPlayer).GetInventory().AddItem(val2);
					((Character)localPlayer).Message((MessageType)1, "Masterwork crafting created an extra item!", 0, (Sprite)null, false);
				}
			}
		}

		private static ItemData FindMostRecentCraftedItem(Player player, Recipe recipe)
		{
			Inventory inventory = ((Humanoid)player).GetInventory();
			if (inventory == null || (Object)(object)recipe?.m_item == (Object)null)
			{
				return null;
			}
			ItemData templateItem = ((Component)recipe.m_item).GetComponent<ItemDrop>()?.m_itemData;
			if (templateItem?.m_shared == null)
			{
				return null;
			}
			List<ItemData> list = (from item in inventory.GetAllItems()
				where item.m_shared.m_name == templateItem.m_shared.m_name
				where item.m_quality == templateItem.m_quality
				orderby item.m_durability descending
				select item).ToList();
			foreach (ItemData item in list)
			{
				BlacksmithingItemData blacksmithingItemData = item.Data().Get<BlacksmithingItemData>();
				if (blacksmithingItemData == null || blacksmithingItemData.level == 0)
				{
					return item;
				}
			}
			return null;
		}
	}

	[HarmonyPatch(typeof(CraftingStation), "GetLevel")]
	public static class Patch_CraftingStationLevel
	{
		private static void Postfix(CraftingStation __instance, ref int __result)
		{
			if (!cfg_EnableStationLevelBonus.Value || __instance.m_craftRequireRoof || !(__instance.m_rangeBuild > 0f))
			{
				return;
			}
			Player localPlayer = Player.m_localPlayer;
			if (!((Object)(object)localPlayer == (Object)null))
			{
				int playerBlacksmithingLevel = GetPlayerBlacksmithingLevel(localPlayer);
				int num = CalculateWorkbenchBonus(__instance.m_name, playerBlacksmithingLevel);
				if (num > 0)
				{
					__result += num;
				}
			}
		}

		private static int CalculateWorkbenchBonus(string stationName, int level)
		{
			switch (stationName)
			{
			case "piece_workbench":
				if (level >= 20)
				{
					return 2;
				}
				if (level >= 10)
				{
					return 1;
				}
				return 0;
			case "forge":
				if (level >= 40)
				{
					return 2;
				}
				if (level >= 30)
				{
					return 1;
				}
				return 0;
			case "blackforge":
			case "piece_galdrtable":
				if (level >= 60)
				{
					return 2;
				}
				if (level >= 50)
				{
					return 1;
				}
				return 0;
			default:
				return 0;
			}
		}
	}

	[HarmonyPatch(typeof(InventoryGui), "DoCrafting")]
	public static class Patch_UpgradeDetection_Alternative
	{
		private static void Postfix(InventoryGui __instance)
		{
			Player localPlayer = Player.m_localPlayer;
			if (((localPlayer != null) ? ((Humanoid)localPlayer).GetInventory() : null) == null)
			{
				return;
			}
			foreach (ItemData allItem in ((Humanoid)localPlayer).GetInventory().GetAllItems())
			{
				if (ItemEligibilityCache.IsEligibleForBlacksmithingBonuses(allItem))
				{
					BlacksmithingItemData blacksmithingItemData = allItem.Data().Get<BlacksmithingItemData>();
					if (blacksmithingItemData != null && blacksmithingItemData.lastKnownQuality < allItem.m_quality)
					{
						int playerBlacksmithingLevel = GetPlayerBlacksmithingLevel(localPlayer);
						GiveBlacksmithingXP(localPlayer, cfg_XPPerUpgrade.Value);
						ApplyCraftingBonuses(allItem, playerBlacksmithingLevel);
					}
				}
			}
		}
	}

	[HarmonyPatch(typeof(ItemData), "GetTooltip", new Type[]
	{
		typeof(ItemData),
		typeof(int),
		typeof(bool),
		typeof(float),
		typeof(int),
		typeof(bool)
	})]
	public static class Patch_Tooltip
	{
		public static void Postfix(ItemData item, bool crafting, ref string __result)
		{
			if (item == null)
			{
				return;
			}
			BlacksmithingItemData blacksmithingItemData = item.Data().Get<BlacksmithingItemData>();
			if (blacksmithingItemData != null && blacksmithingItemData.level > 0)
			{
				if (cfg_ShowBlacksmithLevelInTooltip.Value)
				{
					__result += $"\n<color=orange>Forged at Blacksmithing {blacksmithingItemData.level}</color>";
				}
				if (cfg_ShowInfusionInTooltip.Value && !string.IsNullOrEmpty(blacksmithingItemData.infusion))
				{
					__result = __result + "\n<color=#87CEEB>Elemental Infusion: " + blacksmithingItemData.infusion + "</color>";
				}
			}
		}
	}

	[HarmonyPatch(typeof(Player), "UpdatePlacementGhost")]
	public static class Patch_UpgradeDetection
	{
		public static readonly Dictionary<long, Dictionary<string, int>> playerItemQualities = new Dictionary<long, Dictionary<string, int>>();

		private static float lastUpdateTime = 0f;

		private const float UPDATE_INTERVAL = 2f;

		private static void Postfix(Player __instance)
		{
			if (!(Time.time - lastUpdateTime < 2f))
			{
				lastUpdateTime = Time.time;
				CheckForUpgrades(__instance);
			}
		}

		private static void CheckForUpgrades(Player player)
		{
			Inventory inventory = ((Humanoid)player).GetInventory();
			if (inventory == null)
			{
				return;
			}
			long playerID = player.GetPlayerID();
			if (!playerItemQualities.TryGetValue(playerID, out var value))
			{
				value = new Dictionary<string, int>();
				playerItemQualities[playerID] = value;
			}
			HashSet<string> currentItems = new HashSet<string>();
			foreach (ItemData allItem in inventory.GetAllItems())
			{
				if (!ItemEligibilityCache.IsEligibleForBlacksmithingBonuses(allItem))
				{
					continue;
				}
				string text = $"{allItem.m_shared.m_name}_{((object)allItem).GetHashCode()}";
				currentItems.Add(text);
				if (value.TryGetValue(text, out var value2))
				{
					if (allItem.m_quality > value2)
					{
						Debug.Log((object)$"[BlacksmithingExpanded] UPGRADE DETECTED: {allItem.m_shared.m_name} from quality {value2} to {allItem.m_quality}");
						GiveBlacksmithingXP(player, cfg_XPPerUpgrade.Value);
						int playerBlacksmithingLevel = GetPlayerBlacksmithingLevel(player);
						Debug.Log((object)$"[BlacksmithingExpanded] Applying upgrade bonuses at level {playerBlacksmithingLevel}");
						ApplyCraftingBonuses(allItem, playerBlacksmithingLevel);
						value[text] = allItem.m_quality;
						Debug.Log((object)("[BlacksmithingExpanded] Upgrade processing complete for " + allItem.m_shared.m_name));
					}
				}
				else
				{
					value[text] = allItem.m_quality;
				}
			}
			if (!(Time.time % 20f < 2f))
			{
				return;
			}
			List<string> list = value.Keys.Where((string key) => !currentItems.Contains(key)).ToList();
			foreach (string item in list)
			{
				value.Remove(item);
			}
		}
	}

	[HarmonyPatch(typeof(Smelter), "OnAddOre")]
	public static class Patch_Smelter_AddOre
	{
		private static void Postfix(Smelter __instance, Humanoid user, bool __result)
		{
			//IL_01db: Unknown result type (might be due to invalid IL or missing references)
			//IL_0291: Unknown result type (might be due to invalid IL or missing references)
			//IL_031f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0305: Unknown result type (might be due to invalid IL or missing references)
			//IL_02e3: Unknown result type (might be due to invalid IL or missing references)
			//IL_03b2: Unknown result type (might be due to invalid IL or missing references)
			try
			{
				if (!__result)
				{
					return;
				}
				Player val = (Player)(object)((user is Player) ? user : null);
				if (val == null || !IsBlacksmithingStation(__instance))
				{
					return;
				}
				GiveBlacksmithingXP(val, cfg_XPPerSmelt.Value);
				ZNetView nview = __instance.m_nview;
				ZDO val2 = ((nview != null) ? nview.GetZDO() : null);
				if (val2 == null)
				{
					return;
				}
				bool flag = IsKiln(__instance);
				bool flag2 = !flag && IsBlastFurnace(__instance);
				if ((flag && !cfg_EnableKilnSpeedBonus.Value) || (!flag && !cfg_EnableSmeltingSpeedBonus.Value))
				{
					return;
				}
				int playerBlacksmithingLevel = GetPlayerBlacksmithingLevel(val);
				if (cfg_InfusionTierInterval.Value <= 0)
				{
					Debug.LogWarning((object)($"[BlacksmithingExpanded] Invalid tier interval ({cfg_InfusionTierInterval.Value}). " + "Must be greater than 0. Speed bonuses will not be applied."));
					return;
				}
				int num = playerBlacksmithingLevel / cfg_InfusionTierInterval.Value;
				if (num <= 0)
				{
					return;
				}
				float num2 = (flag ? cfg_KilnSpeedBonusPerTier.Value : cfg_SmeltingSpeedBonusPerTier.Value);
				float num3 = 1f + (float)num * num2;
				if (num3 <= 0f)
				{
					string text;
					if (flag)
					{
						text = "kiln";
					}
					else
					{
						text = (flag2 ? "blast furnace" : "smelter");
					}
					Debug.LogWarning((object)($"[BlacksmithingExpanded] Invalid speed multiplier ({num3}) for {text}. " + "This may be caused by conflicting mods modifying " + text + " speeds. Consider disabling 'Enable " + (flag ? "kiln" : "smelting") + " speed bonus' in the config."));
					return;
				}
				float baseSpeed = GetBaseSpeed(__instance, val2.m_uid, flag, flag2);
				if (baseSpeed <= 0f)
				{
					string arg;
					if (flag)
					{
						arg = "kiln";
					}
					else
					{
						arg = (flag2 ? "blast furnace" : "smelter");
					}
					Debug.LogWarning((object)($"[BlacksmithingExpanded] Invalid original {arg} speed ({baseSpeed}). " + "This may indicate a conflict with another mod. Consider disabling 'Enable " + (flag ? "kiln" : "smelting") + " speed bonus' in the config."));
					return;
				}
				WorkstationInfusion workstationInfusion = new WorkstationInfusion
				{
					tier = num,
					timestamp = Time.time,
					originalSpeed = baseSpeed,
					bonusSpeed = baseSpeed / num3
				};
				bool flag3 = false;
				if (flag)
				{
					if (kilnInfusions.TryGetValue(val2.m_uid, out var value))
					{
						value.timestamp = Time.time;
						value.tier = num;
						value.originalSpeed = workstationInfusion.originalSpeed;
						value.bonusSpeed = workstationInfusion.bonusSpeed;
						workstationInfusion = value;
					}
					else
					{
						kilnInfusions[val2.m_uid] = workstationInfusion;
						flag3 = true;
					}
				}
				else if (flag2)
				{
					blastFurnaceInfusions[val2.m_uid] = workstationInfusion;
					flag3 = true;
				}
				else
				{
					smelterInfusions[val2.m_uid] = workstationInfusion;
					flag3 = true;
				}
				if (cfg_EnableOreSaveBonus.Value && !flag)
				{
					float num4 = cfg_SmelterSaveOreChanceAt100.Value * ((float)playerBlacksmithingLevel / 100f);
					if (Random.value <= num4 && __instance.GetFuel() < (float)__instance.m_maxFuel)
					{
						__instance.m_nview.InvokeRPC("RPC_AddFuel", Array.Empty<object>());
					}
				}
				if (flag3)
				{
					ManageInfusionGlow(((Component)__instance).transform, val2.m_uid, enable: true);
				}
			}
			catch (DivideByZeroException ex)
			{
				Debug.LogError((object)("[BlacksmithingExpanded] Division by zero in smelting speed bonus calculation. Please check your config values (Tier Interval, Speed Bonus Per Tier). Consider disabling speed bonuses if the issue persists. Error: " + ex.Message));
			}
			catch (Exception arg2)
			{
				Debug.LogError((object)$"[BlacksmithingExpanded] Unexpected error in Patch_Smelter_AddOre: {arg2}");
			}
		}
	}

	[HarmonyPatch(typeof(Smelter), "UpdateSmelter")]
	public static class Patch_Smelter_Update
	{
		private static void Prefix(Smelter __instance)
		{
			//IL_0048: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f5: Unknown result type (might be due to invalid IL or missing references)
			//IL_0107: Unknown result type (might be due to invalid IL or missing references)
			if (!IsBlacksmithingStation(__instance))
			{
				return;
			}
			ZNetView nview = __instance.m_nview;
			ZDO val = ((nview != null) ? nview.GetZDO() : null);
			if (val == null)
			{
				return;
			}
			bool flag = IsKiln(__instance);
			Dictionary<ZDOID, WorkstationInfusion> dictionary = InfusionsFor(__instance, flag);
			if (dictionary.TryGetValue(val.m_uid, out var value))
			{
				bool flag2 = (flag ? (!cfg_EnableKilnSpeedBonus.Value) : (!cfg_EnableSmeltingSpeedBonus.Value));
				bool flag3 = Time.time - value.timestamp < 1f;
				bool flag4 = __instance.GetQueueSize() == 0 || (!flag && __instance.GetFuel() <= 0f);
				if (flag2 || value.IsExpired || value.bonusSpeed <= 0f || value.originalSpeed <= 0f || (!flag3 & flag4))
				{
					dictionary.Remove(val.m_uid);
					ManageInfusionGlow(((Component)__instance).transform, val.m_uid, enable: false);
				}
				else
				{
					value.wasActive = true;
				}
			}
		}
	}

	[HarmonyPatch(typeof(Smelter), "GetDeltaTime")]
	public static class Patch_Smelter_DeltaTime
	{
		private static void Postfix(Smelter __instance, ref double __result)
		{
			//IL_004a: Unknown result type (might be due to invalid IL or missing references)
			if (!(__result <= 0.0) && IsBlacksmithingStation(__instance))
			{
				ZNetView nview = __instance.m_nview;
				ZDO val = ((nview != null) ? nview.GetZDO() : null);
				if (val != null && InfusionsFor(__instance, IsKiln(__instance)).TryGetValue(val.m_uid, out var value) && !(value.bonusSpeed <= 0f) && !(value.originalSpeed <= 0f))
				{
					__result *= value.originalSpeed / value.bonusSpeed;
				}
			}
		}
	}

	public class FlickerLight : MonoBehaviour
	{
		private Light lightSource;

		private float baseIntensity;

		private void Start()
		{
			lightSource = ((Component)this).GetComponent<Light>();
			baseIntensity = lightSource.intensity;
		}

		private void Update()
		{
			if ((Object)(object)lightSource != (Object)null)
			{
				lightSource.intensity = baseIntensity + Random.Range(-0.2f, 0.2f);
			}
		}
	}

	[HarmonyPatch(typeof(Attack), "Start")]
	public static class Patch_AttackStart
	{
		private static void Prefix(Attack __instance, ItemData weapon, Humanoid character)
		{
			//IL_0053: Unknown result type (might be due to invalid IL or missing references)
			//IL_0059: Invalid comparison between Unknown and I4
			if (weapon == null || !weapon.IsWeapon())
			{
				return;
			}
			Player val = (Player)(object)((character is Player) ? character : null);
			if (val == null || !weapon.m_shared.m_name.ToLower().Contains("spear") || (int)__instance.m_attackType != 2)
			{
				return;
			}
			BlacksmithingItemData blacksmithingItemData = weapon.Data().Get<BlacksmithingItemData>();
			if (blacksmithingItemData != null && blacksmithingItemData.level > 0)
			{
				string key = GenerateSpearKey(weapon, val);
				BlacksmithingItemData blacksmithingItemData2 = new BlacksmithingItemData();
				CopyBlacksmithingData(blacksmithingItemData, blacksmithingItemData2);
				if (tempSpearDataStorage.Count >= 50)
				{
					CleanupOldSpearData();
				}
				tempSpearDataStorage[key] = blacksmithingItemData2;
			}
		}
	}

	[HarmonyPatch(typeof(ItemDrop), "Start")]
	public static class Patch_ItemDropStart
	{
		private static void Postfix(ItemDrop __instance)
		{
			if (__instance == null)
			{
				return;
			}
			ItemData itemData = __instance.m_itemData;
			if (((itemData != null) ? new bool?(itemData.IsWeapon()) : ((bool?)null)) != true || !__instance.m_itemData.m_shared.m_name.ToLower().Contains("spear"))
			{
				return;
			}
			ItemData itemData2 = __instance.m_itemData;
			BlacksmithingItemData blacksmithingItemData = itemData2.Data().Get<BlacksmithingItemData>();
			if (blacksmithingItemData == null || blacksmithingItemData.level <= 0)
			{
				KeyValuePair<string, BlacksmithingItemData> keyValuePair = FindBestSpearMatch(itemData2);
				if (keyValuePair.Key != null && keyValuePair.Value != null)
				{
					BlacksmithingItemData orCreate = itemData2.Data().GetOrCreate<BlacksmithingItemData>();
					CopyBlacksmithingData(keyValuePair.Value, orCreate);
					orCreate.Save();
					ApplyStoredBlacksmithingStats(itemData2, orCreate);
					tempSpearDataStorage.Remove(keyValuePair.Key);
				}
			}
		}
	}

	[HarmonyPatch(typeof(ItemData), "Clone")]
	public static class Patch_ItemDataClone
	{
		private static void Postfix(ItemData __result, ItemData __instance)
		{
			if (__instance != null && __result != null)
			{
				BlacksmithingItemData blacksmithingItemData = __instance.Data().Get<BlacksmithingItemData>();
				if (blacksmithingItemData != null && blacksmithingItemData.level > 0)
				{
					BlacksmithingItemData orCreate = __result.Data().GetOrCreate<BlacksmithingItemData>();
					CopyBlacksmithingData(blacksmithingItemData, orCreate);
					orCreate.Save();
					orCreate.Load();
				}
			}
		}
	}

	internal const string ModName = "Blacksmithing Expanded";

	internal const string ModVersion = "1.2.4";

	internal const string ModGUID = "org.bepinex.plugins.blacksmithingexpanded";

	private Harmony harmony;

	private static readonly ConfigSync configSync = new ConfigSync("org.bepinex.plugins.blacksmithingexpanded")
	{
		DisplayName = "Blacksmithing Expanded",
		CurrentVersion = "1.2.4",
		MinimumRequiredVersion = "1.2.4",
		ModRequired = true
	};

	internal static Skill blacksmithSkill;

	private static readonly Dictionary<string, ItemBaseStats> baseStatsCache = new Dictionary<string, ItemBaseStats>();

	private static readonly object cacheLocker = new object();

	private static ItemFilterConfig itemFilterConfig;

	private static readonly HashSet<string> whitelistedItems = new HashSet<string>();

	private static readonly HashSet<string> blacklistedItems = new HashSet<string>();

	private static string configPath;

	public static readonly CustomSyncedValue<List<string>> syncedWhitelistItems = new CustomSyncedValue<List<string>>(configSync, "whitelist items", new List<string>());

	public static readonly CustomSyncedValue<List<string>> syncedBlacklistItems = new CustomSyncedValue<List<string>>(configSync, "blacklist items", new List<string>());

	internal static Dictionary<ZDOID, WorkstationInfusion> smelterInfusions = new Dictionary<ZDOID, WorkstationInfusion>();

	internal static Dictionary<ZDOID, WorkstationInfusion> kilnInfusions = new Dictionary<ZDOID, WorkstationInfusion>();

	internal static Dictionary<ZDOID, WorkstationInfusion> blastFurnaceInfusions = new Dictionary<ZDOID, WorkstationInfusion>();

	private static readonly Dictionary<ZDOID, float> originalBlastFurnaceSpeeds = new Dictionary<ZDOID, float>();

	private static readonly Dictionary<ZDOID, float> originalSmelterSpeeds = new Dictionary<ZDOID, float>();

	private static readonly Dictionary<ZDOID, float> originalKilnSpeeds = new Dictionary<ZDOID, float>();

	private static readonly Dictionary<ZDOID, GameObject> activeGlowEffects = new Dictionary<ZDOID, GameObject>();

	private static readonly Dictionary<string, BlacksmithingItemData> tempSpearDataStorage = new Dictionary<string, BlacksmithingItemData>();

	private const int MAX_SPEAR_DATA_ENTRIES = 50;

	private const float SPEAR_DATA_CLEANUP_INTERVAL = 30f;

	private static float lastSpearCleanup = 0f;

	internal static ConfigEntry<float> cfg_SkillGainFactor;

	internal static ConfigEntry<float> cfg_SkillEffectFactor;

	internal static ConfigEntry<int> cfg_InfusionTierInterval;

	internal static ConfigEntry<float> cfg_ChanceExtraItemAt100;

	internal static ConfigEntry<float> cfg_SmelterSaveOreChanceAt100;

	internal static ConfigEntry<bool> cfg_EnableSmeltingSpeedBonus;

	internal static ConfigEntry<bool> cfg_EnableKilnSpeedBonus;

	internal static ConfigEntry<string> cfg_BlacksmithingStations;

	internal static ConfigEntry<float> cfg_SmeltingSpeedBonusPerTier;

	internal static ConfigEntry<float> cfg_KilnSpeedBonusPerTier;

	internal static ConfigEntry<float> cfg_InfusionExpireTime;

	internal static ConfigEntry<bool> cfg_ShowInfusionVisualEffect;

	internal static ConfigEntry<bool> cfg_ShowBlacksmithLevelInTooltip;

	internal static ConfigEntry<bool> cfg_ShowInfusionInTooltip;

	internal static ConfigEntry<float> cfg_FirstCraftBonusXP;

	internal static ConfigEntry<float> UpgradeBonus;

	internal static ConfigEntry<bool> cfg_EnableStationLevelBonus;

	internal static ConfigEntry<bool> cfg_UseYamlFiltering;

	internal static ConfigEntry<bool> cfg_LogFilteredItems;

	internal static ConfigEntry<int> cfg_DurabilityTierInterval;

	internal static ConfigEntry<float> cfg_DurabilityBonusPerTier;

	internal static ConfigEntry<float> cfg_DurabilityBonusPerUpgrade;

	internal static ConfigEntry<bool> cfg_RespectOriginalDurability;

	internal static ConfigEntry<float> cfg_MaxDurabilityCap;

	internal static ConfigEntry<bool> cfg_AllowNonRepairableItems;

	internal static ConfigEntry<bool> cfg_EnableDurabilityBonus;

	internal static ConfigEntry<bool> cfg_EnableDamageBonus;

	internal static ConfigEntry<bool> cfg_EnableArmorBonus;

	internal static ConfigEntry<int> cfg_StatTierInterval;

	internal static ConfigEntry<float> cfg_ArmorBonusPerTier;

	internal static ConfigEntry<float> cfg_ArmorBonusPerUpgrade;

	internal static ConfigEntry<float> cfg_ArmorCap;

	internal static ConfigEntry<int> cfg_DamageBonusPerTier;

	internal static ConfigEntry<float> cfg_StatBonusPerUpgrade;

	internal static ConfigEntry<bool> cfg_UsePercentageDamageBonus;

	internal static ConfigEntry<float> cfg_DamagePercentageBonusPerTier;

	internal static ConfigEntry<bool> cfg_UsePercentageUpgradeBonus;

	internal static ConfigEntry<float> cfg_StatPercentageBonusPerUpgrade;

	internal static ConfigEntry<bool> cfg_EnableElementalBonus;

	internal static ConfigEntry<bool> cfg_AlwaysAddElementalAtMax;

	internal static ConfigEntry<int> cfg_ElementalUnlockLevel;

	internal static ConfigEntry<float> cfg_FireBonusPerTier;

	internal static ConfigEntry<float> cfg_FrostBonusPerTier;

	internal static ConfigEntry<float> cfg_LightningBonusPerTier;

	internal static ConfigEntry<float> cfg_PoisonBonusPerTier;

	internal static ConfigEntry<float> cfg_SpiritBonusPerTier;

	internal static ConfigEntry<bool> cfg_BoostElementalWeapons;

	internal static ConfigEntry<float> cfg_ElementalWeaponBoostChance;

	internal static ConfigEntry<bool> cfg_UsePercentageElementalBonus;

	internal static ConfigEntry<float> cfg_ElementalPercentageBonusPerTier;

	internal static ConfigEntry<bool> cfg_EnableShieldBonus;

	internal static ConfigEntry<float> cfg_TimedBlockBonusPerTier;

	internal static ConfigEntry<float> cfg_TimedBlockBonusPerUpgrade;

	internal static ConfigEntry<float> cfg_BlockPowerBonusPerTier;

	internal static ConfigEntry<float> cfg_BlockPowerBonusPerUpgrade;

	internal static ConfigEntry<bool> cfg_EnableExtraItemBonus;

	internal static ConfigEntry<bool> cfg_EnableOreSaveBonus;

	internal static ConfigEntry<float> cfg_XPPerCraft;

	internal static ConfigEntry<float> cfg_XPPerSmelt;

	internal static ConfigEntry<float> cfg_XPPerRepair;

	internal static ConfigEntry<float> cfg_XPPerUpgrade;

	private static Sprite s_skillIcon;

	private ConfigEntry<T> AddConfig<T>(string group, string name, T value, string description, bool sync = true)
	{
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		//IL_001c: Expected Obj, but got Unknown
		ConfigEntry<T> val = ((BaseUnityPlugin)this).Config.Bind<T>(group, name, value, new ConfigDescription(description, (AcceptableValueBase)null, Array.Empty<object>()));
		SyncedConfigEntry<T> syncedConfigEntry = configSync.AddConfigEntry<T>(val);
		syncedConfigEntry.SynchronizedConfig = sync;
		return val;
	}

	private void Awake()
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Expected Obj, but got Unknown
		harmony = new Harmony("org.bepinex.plugins.blacksmithingexpanded");
		configPath = Path.Combine(Path.GetDirectoryName(((BaseUnityPlugin)this).Config.ConfigFilePath), "BlacksmithExpItemList.yml");
		try
		{
			s_skillIcon = LoadEmbeddedSprite("smithing.png", 64, 64);
			if ((Object)(object)s_skillIcon == (Object)null)
			{
				throw new Exception("Failed to load embedded sprite: smithing.png");
			}
			blacksmithSkill = new Skill("Blacksmithing", s_skillIcon);
			blacksmithSkill.Name.English("Blacksmithing");
			blacksmithSkill.Description.English("Craft better, last longer. Improves durability, damage, and armor of crafted items.");
			blacksmithSkill.Configurable = true;
		}
		catch (Exception arg)
		{
			Debug.LogError((object)$"[BlacksmithingExpanded] Skill setup failed: {arg}");
		}
		SetupConfigs();
		if (blacksmithSkill != null)
		{
			blacksmithSkill.SkillGainFactor = cfg_SkillGainFactor.Value;
			blacksmithSkill.SkillEffectFactor = cfg_SkillEffectFactor.Value;
			cfg_SkillGainFactor.SettingChanged += (object _, EventArgs _) =>
			{
				blacksmithSkill.SkillGainFactor = cfg_SkillGainFactor.Value;
			};
			cfg_SkillEffectFactor.SettingChanged += (object _, EventArgs _) =>
			{
				blacksmithSkill.SkillEffectFactor = cfg_SkillEffectFactor.Value;
			};
		}
		InitializeYamlFiltering();
		syncedWhitelistItems.ValueChanged += () =>
		{
			whitelistedItems.Clear();
			foreach (string item in syncedWhitelistItems.Value)
			{
				whitelistedItems.Add(item);
			}
			((BaseUnityPlugin)this).Logger.LogDebug((object)$"[BlacksmithingExpanded] Received synced whitelist: {whitelistedItems.Count} items");
		};
		syncedBlacklistItems.ValueChanged += () =>
		{
			blacklistedItems.Clear();
			foreach (string item2 in syncedBlacklistItems.Value)
			{
				blacklistedItems.Add(item2);
			}
			((BaseUnityPlugin)this).Logger.LogDebug((object)$"[BlacksmithingExpanded] Received synced blacklist: {blacklistedItems.Count} items");
		};
		cfg_UseYamlFiltering.SettingChanged += (object _, EventArgs _) =>
		{
			if ((Object)(object)ZNet.instance == (Object)null || ZNet.instance.IsServer())
			{
				ReloadYamlConfiguration();
			}
		};
		ItemInfo.ForceLoadTypes.Add(typeof(BlacksmithingItemData));
		((MonoBehaviour)this).StartCoroutine(SpearDataCleanupRoutine());
		((MonoBehaviour)this).StartCoroutine(PerformanceMaintenance());
		harmony.PatchAll();
		((BaseUnityPlugin)this).Logger.LogInfo((object)$"[BlacksmithingExpanded] Initialized successfully. Skill registered: {blacksmithSkill != null}");
	}

	private void Update()
	{
		if (Time.time - lastSpearCleanup > 30f)
		{
			CleanupOldSpearData();
			lastSpearCleanup = Time.time;
		}
	}

	private IEnumerator SpearDataCleanupRoutine()
	{
		while (true)
		{
			yield return (object)new WaitForSeconds(30f);
			CleanupOldSpearData();
		}
	}

	private IEnumerator PerformanceMaintenance()
	{
		while (true)
		{
			yield return (object)new WaitForSeconds(60f);
			ItemEligibilityCache.ClearCache();
			if (tempSpearDataStorage.Count > 25)
			{
				CleanupOldSpearData();
			}
			HashSet<long> connectedPlayerIds = new HashSet<long>();
			foreach (Player player in Player.GetAllPlayers())
			{
				connectedPlayerIds.Add(player.GetPlayerID());
			}
			List<long> playersToRemove = Patch_UpgradeDetection.playerItemQualities.Keys.Where((long id) => !connectedPlayerIds.Contains(id)).ToList();
			foreach (long playerId in playersToRemove)
			{
				Patch_UpgradeDetection.playerItemQualities.Remove(playerId);
			}
		}
	}

	private static void CacheBaseStats(ItemData item)
	{
		//IL_007c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0081: Unknown result type (might be due to invalid IL or missing references)
		if (item?.m_shared == null)
		{
			return;
		}
		string name = item.m_shared.m_name;
		lock (cacheLocker)
		{
			if (!baseStatsCache.ContainsKey(name))
			{
				baseStatsCache[name] = new ItemBaseStats
				{
					armor = item.m_shared.m_armor,
					damages = item.m_shared.m_damages.Clone(),
					durability = item.m_shared.m_maxDurability,
					resistances = new List<DamageModPair>(item.m_shared.m_damageModifiers),
					blockPower = item.m_shared.m_blockPower,
					timedBlockBonus = item.m_shared.m_timedBlockBonus,
					isCached = true
				};
			}
		}
	}

	private static ItemBaseStats GetBaseStats(ItemData item)
	{
		if (item?.m_shared == null)
		{
			return new ItemBaseStats
			{
				isCached = false
			};
		}
		string name = item.m_shared.m_name;
		lock (cacheLocker)
		{
			if (!baseStatsCache.ContainsKey(name))
			{
				CacheBaseStats(item);
			}
			return baseStatsCache[name];
		}
	}

	private static void CleanupOldSpearData()
	{
		float time = Time.time;
		List<string> list = new List<string>();
		foreach (KeyValuePair<string, BlacksmithingItemData> item in tempSpearDataStorage.ToList())
		{
			string[] array = item.Key.Split(new char[1] { '_' });
			if (array.Length >= 5 && float.TryParse(array[4], out var result))
			{
				if (time - result > 120f)
				{
					list.Add(item.Key);
				}
			}
			else
			{
				list.Add(item.Key);
			}
		}
		if (tempSpearDataStorage.Count > 50)
		{
			List<string> collection = (from kvp in tempSpearDataStorage.OrderBy((KeyValuePair<string, BlacksmithingItemData> kvp) =>
				{
					string[] array2 = kvp.Key.Split(new char[1] { '_' });
					float result2;
					return (array2.Length >= 5 && float.TryParse(array2[4], out result2)) ? result2 : 0f;
				}).Take(tempSpearDataStorage.Count - 50)
				select kvp.Key).ToList();
			list.AddRange(collection);
		}
		foreach (string item2 in list)
		{
			tempSpearDataStorage.Remove(item2);
		}
		if (list.Count > 0)
		{
			Debug.Log((object)$"[BlacksmithingExpanded] Cleaned up {list.Count} old spear data entries");
		}
	}

	private void SetupConfigs()
	{
		cfg_SkillGainFactor = AddConfig("General", "Skill gain factor", 1f, "Multiplier for blacksmithing XP gain rate (1.5 = 50% faster leveling)");
		cfg_SkillEffectFactor = AddConfig("General", "Skill effect factor", 1f, "Global multiplier for all blacksmithing bonuses (damage, armor, durability, etc). Higher = stronger effects");
		cfg_InfusionTierInterval = AddConfig("General", "Workstation infusion milestone interval", 10, "Every X blacksmithing levels unlocks a new tier of smelter/kiln speed bonus");
		cfg_EnableSmeltingSpeedBonus = AddConfig("General", "Enable smelting speed bonus", value: true, "Enable/disable smelter (and blast furnace) speed bonuses. Disable this if you have other mods that modify smelter speeds to prevent conflicts");
		cfg_EnableKilnSpeedBonus = AddConfig("General", "Enable kiln speed bonus", value: true, "Enable/disable kiln speed bonuses. Disable this if you have other mods that modify kiln speeds to prevent conflicts");
		cfg_BlacksmithingStations = AddConfig("General", "Blacksmithing workstations", "smelter,blastfurnace,charcoal_kiln", "Smelting-type stations only (ones you feed ore, wood or fuel into): comma-separated prefab names of those that give blacksmithing XP when fed and get the speed bonus, infusion glow and ore save chance. Defaults: smelter = Smelter, blastfurnace = Blast Furnace, charcoal_kiln = Charcoal Kiln. The Forge and Workbench are crafting stations, not smelting ones - crafting, upgrading and repairing there always give XP and don't belong in this list. Valheim uses the same smelting code for the Windmill, Spinning Wheel and Eitr Refinery, so anything not listed here is ignored. Add a modded furnace's prefab name to include it.");
		cfg_SmeltingSpeedBonusPerTier = AddConfig("General", "Smelting speed bonus per tier", 0.15f, "Speed bonus per tier - 0.15 = 15% faster smelting. Stacks with each tier");
		cfg_KilnSpeedBonusPerTier = AddConfig("General", "Kiln speed bonus per tier", 0.15f, "Speed bonus per tier - 0.15 = 15% faster charcoal production. Stacks with each tier");
		cfg_InfusionExpireTime = AddConfig("General", "Infusion expire time", 300f, "Seconds that speed bonuses last after adding fuel/ore to smelters/kilns (300 = 5 minutes)");
		cfg_ShowInfusionVisualEffect = AddConfig("General", "Show infusion visual effect", value: true, "Show orange glowing light effect when smelters/kilns have speed bonuses active");
		cfg_SmelterSaveOreChanceAt100 = AddConfig("General", "Ore save chance at 100", 0.2f, "At level 100: chance to not consume ore when smelting (0.2 = 20% ore savings)");
		cfg_ChanceExtraItemAt100 = AddConfig("General", "Extra item chance at 100", 0.05f, "At level 100: chance to get bonus item when crafting (0.05 = 5% chance for double output)");
		cfg_UsePercentageUpgradeBonus = AddConfig("PercentageSystem", "Use percentage upgrade bonus", value: true, "If enabled, upgrade bonuses are percentage-based instead of flat. When disabled, uses flat bonuses");
		cfg_StatPercentageBonusPerUpgrade = AddConfig("PercentageSystem", "Stat percentage bonus per upgrade", 5f, "Percentage bonus per upgrade level when using percentage upgrade system (5 = 5% per upgrade level)");
		cfg_EnableStationLevelBonus = AddConfig("General", "Enable station level bonus", value: true, "Allow blacksmithing skill to add virtual levels to workbenches and forges");
		cfg_UseYamlFiltering = AddConfig("Item Filtering", "Use YAML item filtering", value: true, "Enable custom whitelist/blacklist system via BlacksmithExpItemList.yml file");
		cfg_LogFilteredItems = AddConfig("Item Filtering", "Log filtered items", value: false, "Write to console when items are blocked by whitelist/blacklist filters");
		cfg_XPPerCraft = AddConfig("XP", "XP per craft", 1f, "Base blacksmithing XP gained when crafting any item");
		cfg_XPPerSmelt = AddConfig("XP", "XP per smelt", 0.75f, "Base blacksmithing XP gained when adding ore to smelters/kilns");
		cfg_XPPerRepair = AddConfig("XP", "XP per repair", 0.1f, "Base blacksmithing XP gained when repairing items");
		cfg_XPPerUpgrade = AddConfig("XP", "XP per upgrade", 3f, "Base blacksmithing XP gained when upgrading items at workbenches");
		cfg_FirstCraftBonusXP = AddConfig("XP", "First craft bonus XP", 10f, "One-time bonus XP when crafting each item type for the first time");
		cfg_ShowBlacksmithLevelInTooltip = AddConfig("Tooltip", "Show level in tooltip", value: true, "Display blacksmithing level used to craft item in item tooltips");
		cfg_ShowInfusionInTooltip = AddConfig("Tooltip", "Show infusion in tooltip", value: false, "Display elemental infusion type in item tooltips (Fire, Frost, etc.)");
		cfg_DurabilityTierInterval = AddConfig("Durability", "Durability tier interval", 10, "Every X blacksmithing levels unlocks next tier of durability bonuses");
		cfg_DurabilityBonusPerTier = AddConfig("Durability", "Durability bonus per tier", 25f, "Flat durability points added per tier when crafting items");
		cfg_DurabilityBonusPerUpgrade = AddConfig("Durability", "Durability bonus per upgrade", 50f, "Extra durability points per item quality level (star rating)");
		cfg_RespectOriginalDurability = AddConfig("Durability", "Respect original durability", value: true, "Only boost durability on items that already have durability (prevents boosting consumables/arrows)");
		cfg_MaxDurabilityCap = AddConfig("Durability", "Max durability cap", 2000f, "Maximum durability any item can reach (0 = no limit)");
		cfg_AllowNonRepairableItems = AddConfig("Durability", "Allow non-repairable items", value: false, "Allow blacksmithing bonuses on items with no durability (torches, consumables, etc.)");
		cfg_EnableDurabilityBonus = AddConfig("Durability", "Enable durability bonus", value: true, "Enable/disable the blacksmithing durability bonus entirely. Disable this if other mods manage durability to prevent conflicts (also fixes modded armor losing durability on login)");
		cfg_EnableDamageBonus = AddConfig("Stats", "Enable damage bonus", value: true, "Enable/disable the blacksmithing damage bonus entirely. Disable if other mods handle weapon damage scaling to prevent conflicts");
		cfg_EnableArmorBonus = AddConfig("Stats", "Enable armor bonus", value: true, "Enable/disable the blacksmithing armor bonus entirely. Disable if other mods handle armor scaling to prevent conflicts");
		cfg_BoostElementalWeapons = AddConfig("Stats", "Boost elemental weapons", value: true, "Allow boosting weapons that already have elemental damage (like Frostner)");
		cfg_ElementalWeaponBoostChance = AddConfig("Stats", "Elemental weapon boost chance", 0.25f, "For weapons with both physical and elemental damage: chance to boost elemental instead of physical (0.25 = 25% chance)");
		cfg_StatTierInterval = AddConfig("Stats", "Stat tier interval", 5, "Every X blacksmithing levels unlocks next tier of damage/armor bonuses");
		cfg_ArmorBonusPerTier = AddConfig("Stats", "Armor bonus per tier", 0.5f, "Flat armor points added per tier when crafting armor pieces");
		cfg_ArmorBonusPerUpgrade = AddConfig("Stats", "Armor bonus per upgrade", 2f, "Extra armor points per item quality level (star rating)");
		cfg_ArmorCap = AddConfig("Stats", "Armor cap", 150f, "Maximum armor value any piece can reach (0 = no limit)");
		cfg_UsePercentageDamageBonus = AddConfig("PercentageSystem", "Use percentage damage bonus", value: true, "If enabled, damage bonuses are percentage-based instead of flat. Much more balanced for all weapon types");
		cfg_DamagePercentageBonusPerTier = AddConfig("PercentageSystem", "Damage percentage bonus per tier", 1f, "Percentage damage bonus per tier when using percentage system (1 = 1% per tier)");
		cfg_DamageBonusPerTier = AddConfig("Stats", "Damage bonus per tier", 5, "Flat damage bonus added per stat tier. Applied to one random damage type (slash/pierce/blunt). Only used if percentage system is disabled");
		cfg_StatBonusPerUpgrade = AddConfig("Stats", "Stat bonus per upgrade", 4f, "Extra damage/armor bonus per item quality level (star rating). Only used if percentage upgrade system is disabled");
		cfg_EnableElementalBonus = AddConfig("Elemental", "Enable elemental bonus", value: true, "Enable/disable the blacksmithing elemental damage bonus entirely. Disable if other mods handle elemental damage to prevent conflicts");
		cfg_AlwaysAddElementalAtMax = AddConfig("Elemental", "Add elemental at milestone", value: true, "Automatically add random elemental damage when reaching elemental unlock level");
		cfg_ElementalUnlockLevel = AddConfig("Elemental", "Elemental unlock level", 75, "Blacksmithing level required to add elemental damage bonuses to weapons");
		cfg_FireBonusPerTier = AddConfig("Elemental", "Fire bonus per tier", 3f, "Fire damage points per tier (causes burning damage over time)");
		cfg_FrostBonusPerTier = AddConfig("Elemental", "Frost bonus per tier", 6f, "Frost damage points per tier (causes instant cold damage)");
		cfg_LightningBonusPerTier = AddConfig("Elemental", "Lightning bonus per tier", 5f, "Lightning damage points per tier (good vs wet enemies)");
		cfg_PoisonBonusPerTier = AddConfig("Elemental", "Poison bonus per tier", 2.5f, "Poison damage points per tier (causes poison damage over time)");
		cfg_SpiritBonusPerTier = AddConfig("Elemental", "Spirit bonus per tier", 4f, "Spirit damage points per tier (extra effective vs undead enemies)");
		cfg_UsePercentageElementalBonus = AddConfig("PercentageSystem", "Use percentage elemental bonus", value: true, "If enabled, elemental bonuses are percentage-based instead of flat. Much more balanced for all weapon types");
		cfg_ElementalPercentageBonusPerTier = AddConfig("PercentageSystem", "Elemental percentage bonus per tier", 0.75f, "Percentage elemental bonus per tierwhen using percentage system (0.75 = 0.75% per tier)");
		cfg_EnableShieldBonus = AddConfig("Shields", "Enable shield bonus", value: true, "Enable/disable the blacksmithing shield block power and parry bonuses entirely. Disable if other mods handle shield stats to prevent conflicts");
		cfg_TimedBlockBonusPerTier = AddConfig("Shields", "Timed block bonus per tier", 0.01f, "Parry/perfect block bonus per tier (0.01 = 1% better parry window/damage)");
		cfg_TimedBlockBonusPerUpgrade = AddConfig("Shields", "Timed block bonus per upgrade", 0.05f, "Extra parry bonus per shield quality level (star rating)");
		cfg_BlockPowerBonusPerTier = AddConfig("Shields", "Block power bonus per tier", 1f, "Block strength points per tier (reduces stamina cost when blocking)");
		cfg_BlockPowerBonusPerUpgrade = AddConfig("Shields", "Block power bonus per upgrade", 1f, "Extra block power per shield quality level (star rating)");
		cfg_EnableExtraItemBonus = AddConfig("General", "Enable extra item bonus", value: true, "Enable/disable the chance to receive a bonus crafted item at high blacksmithing levels");
		cfg_EnableOreSaveBonus = AddConfig("General", "Enable ore save bonus", value: true, "Enable/disable the chance to save ore when smelting at high blacksmithing levels");
	}

	private void InitializeYamlFiltering()
	{
		try
		{
			if (!File.Exists(configPath))
			{
				((BaseUnityPlugin)this).Logger.LogInfo((object)("[BlacksmithingExpanded] YAML not found at " + configPath + ". Generating default YAML..."));
				GenerateDefaultYaml();
				((BaseUnityPlugin)this).Logger.LogInfo((object)"[BlacksmithingExpanded] Default YAML created. Please restart the client.");
			}
			else
			{
				ReloadYamlConfiguration();
				((BaseUnityPlugin)this).Logger.LogDebug((object)("[BlacksmithingExpanded] YAML filtering system initialized. File: " + configPath));
			}
		}
		catch (Exception arg)
		{
			((BaseUnityPlugin)this).Logger.LogError((object)$"[BlacksmithingExpanded] Failed to initialize YAML filtering: {arg}");
		}
	}

	private void ReloadYamlConfiguration()
	{
		whitelistedItems.Clear();
		blacklistedItems.Clear();
		if (!cfg_UseYamlFiltering.Value)
		{
			((BaseUnityPlugin)this).Logger.LogInfo((object)"[BlacksmithingExpanded] YAML filtering disabled");
			return;
		}
		try
		{
			IDeserializer deserializer = new DeserializerBuilder().WithNamingConvention(PascalCaseNamingConvention.Instance).IgnoreUnmatchedProperties().Build();
			string input = File.ReadAllText(configPath);
			itemFilterConfig = deserializer.Deserialize<ItemFilterConfig>(input) ?? new ItemFilterConfig();
			if (itemFilterConfig.Whitelist != null)
			{
				foreach (string item in itemFilterConfig.Whitelist.Where((string x) => !string.IsNullOrWhiteSpace(x)))
				{
					whitelistedItems.Add(item.Trim());
				}
			}
			if (itemFilterConfig.Blacklist != null)
			{
				foreach (string item2 in itemFilterConfig.Blacklist.Where((string x) => !string.IsNullOrWhiteSpace(x)))
				{
					blacklistedItems.Add(item2.Trim());
				}
			}
			((BaseUnityPlugin)this).Logger.LogInfo((object)$"[BlacksmithingExpanded] Loaded YAML config - Whitelist: {whitelistedItems.Count} items, Blacklist: {blacklistedItems.Count} items");
			if (whitelistedItems.Count > 0)
			{
				((BaseUnityPlugin)this).Logger.LogDebug((object)("[BlacksmithingExpanded] Whitelisted items: " + string.Join(", ", whitelistedItems)));
			}
			if (blacklistedItems.Count > 0)
			{
				((BaseUnityPlugin)this).Logger.LogDebug((object)("[BlacksmithingExpanded] Blacklisted items: " + string.Join(", ", blacklistedItems)));
			}
		}
		catch (YamlException ex)
		{
			((BaseUnityPlugin)this).Logger.LogError((object)("[BlacksmithingExpanded] YAML parsing error: " + ex.Message));
			((BaseUnityPlugin)this).Logger.LogError((object)("[BlacksmithingExpanded] Check your YAML syntax in: " + configPath));
		}
		catch (Exception arg)
		{
			((BaseUnityPlugin)this).Logger.LogError((object)$"[BlacksmithingExpanded] Failed to load YAML config: {arg}");
		}
	}

	private void GenerateDefaultYaml()
	{
		try
		{
			string contents = "# If whitelist is empty:\r\n# Items not on blacklist → Enhanced (normal mod behavior)\r\n# Items on blacklist → Not enhanced\r\n\r\n# If whitelist has items:\r\n# Items on whitelist → Enhanced\r\n# Items NOT on whitelist → Not enhanced (regardless of blacklist)\r\n\r\nWhitelist:\r\n\r\nBlacklist:\r\n  - Club\r\n  - AxeStone\r\n  - Torch\r\n  - Tankard\r\n  - TankardAnniversary\r\n  - TrinketBronzeHealth\r\n  - TrinketBronzeStamina\r\n  - TrinketCarapaceEitr\r\n  - TrinketBlackDamageHealth\r\n  - TrinketFlametalEitr\r\n  - TrinketChitinSwim\r\n  - TrinketFlametalStaminaHealth\r\n  - TrinketIronHealth\r\n  - TrinketIronStamina\r\n  - TrinketScaleStaminaDamage\r\n  - TrinketSilverDamage\r\n  - TrinketSilverResist\r\n  - Demister\r\n  - DvergrKey\r\n  - SaddleAsksvin\r\n  - SaddleLox\r\n";
			File.WriteAllText(configPath, contents);
			((BaseUnityPlugin)this).Logger.LogDebug((object)("[BlacksmithingExpanded] Created default YAML file at " + configPath));
		}
		catch (Exception arg)
		{
			((BaseUnityPlugin)this).Logger.LogError((object)$"[BlacksmithingExpanded] Failed to create default YAML: {arg}");
		}
	}

	internal static bool IsItemAllowed(ItemData item)
	{
		if (!cfg_UseYamlFiltering.Value)
		{
			return true;
		}
		if (item?.m_shared == null)
		{
			return false;
		}
		string itemPrefabName = GetItemPrefabName(item);
		if (string.IsNullOrEmpty(itemPrefabName))
		{
			if (cfg_LogFilteredItems.Value)
			{
				Debug.Log((object)"[BlacksmithingExpanded] Could not determine prefab name for item - allowing by default");
			}
			return true;
		}
		if (whitelistedItems.Count > 0)
		{
			bool flag = whitelistedItems.Contains(itemPrefabName);
			if (cfg_LogFilteredItems.Value)
			{
				if (flag)
				{
					Debug.Log((object)("[BlacksmithingExpanded] Item prefab '" + itemPrefabName + "' found in whitelist - allowing bonuses"));
				}
				else
				{
					Debug.Log((object)("[BlacksmithingExpanded] Item prefab '" + itemPrefabName + "' not in whitelist - filtering out"));
				}
			}
			return flag;
		}
		if (blacklistedItems.Contains(itemPrefabName))
		{
			if (cfg_LogFilteredItems.Value)
			{
				Debug.Log((object)("[BlacksmithingExpanded] Item prefab '" + itemPrefabName + "' is blacklisted - filtering out"));
			}
			return false;
		}
		if (cfg_LogFilteredItems.Value)
		{
			Debug.Log((object)("[BlacksmithingExpanded] Item prefab '" + itemPrefabName + "' allowed (not blacklisted)"));
		}
		return true;
	}

	private static string GetItemPrefabName(ItemData item)
	{
		try
		{
			if ((Object)(object)item.m_dropPrefab != (Object)null)
			{
				return ((Object)item.m_dropPrefab).name;
			}
			ObjectDB instance = ObjectDB.instance;
			GameObject val = ((instance != null) ? instance.GetItemPrefab(item.m_shared.m_name) : null);
			if ((Object)(object)val != (Object)null)
			{
				return ((Object)val).name;
			}
			string name = item.m_shared.m_name;
			if (name.StartsWith("$item_"))
			{
				string text = name.Substring(6);
				return char.ToUpper(text[0]) + text.Substring(1);
			}
			return name;
		}
		catch (Exception arg)
		{
			Debug.LogError((object)$"[BlacksmithingExpanded] Error getting prefab name: {arg}");
			return item.m_shared?.m_name ?? "Unknown";
		}
	}

	internal static int GetPlayerBlacksmithingLevel(Player player)
	{
		//IL_004a: Unknown result type (might be due to invalid IL or missing references)
		//IL_004f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0056: Unknown result type (might be due to invalid IL or missing references)
		if ((Object)(object)((player != null) ? ((Component)player).GetComponent<Skills>() : null) == (Object)null)
		{
			return 0;
		}
		try
		{
			if (!Skill.skillByName.ContainsKey("Blacksmithing"))
			{
				Debug.LogWarning((object)"[BlacksmithingExpanded] Blacksmithing skill not found, returning 0");
				return 0;
			}
			SkillType val = Skill.fromName("Blacksmithing");
			float skillLevel = ((Component)player).GetComponent<Skills>().GetSkillLevel(val);
			return Mathf.FloorToInt(skillLevel);
		}
		catch (Exception arg)
		{
			Debug.LogError((object)$"[BlacksmithingExpanded] Error getting blacksmithing level: {arg}");
			return 0;
		}
	}

	internal static void GiveBlacksmithingXP(Player player, float amount)
	{
		if ((Object)(object)player == (Object)null || amount <= 0f)
		{
			return;
		}
		try
		{
			float value = amount * cfg_SkillGainFactor.Value;
			((Character)(object)player).RaiseSkill("Blacksmithing", value);
		}
		catch (Exception arg)
		{
			Debug.LogError((object)$"[BlacksmithingExpanded] XP grant failed: {arg}");
		}
	}

	internal static void ApplyCraftingBonuses(ItemData item, int level)
	{
		//IL_044f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0455: Invalid comparison between Unknown and I4
		if (item?.m_shared == null || level <= 0 || item.m_shared.m_maxStackSize > 1)
		{
			return;
		}
		if (!IsItemAllowed(item))
		{
			if (cfg_LogFilteredItems.Value)
			{
				Debug.Log((object)("[BlacksmithingExpanded] Item '" + item.m_shared.m_name + "' filtered out by YAML configuration"));
			}
			return;
		}
		ItemBaseStats baseStats = GetBaseStats(item);
		if (!baseStats.isCached)
		{
			Debug.LogError((object)("[BlacksmithingExpanded] Failed to get base stats for " + item.m_shared.m_name));
			return;
		}
		bool flag = baseStats.durability > 0f;
		if (!flag && !cfg_AllowNonRepairableItems.Value)
		{
			if (cfg_LogFilteredItems.Value)
			{
				Debug.Log((object)("[BlacksmithingExpanded] Item '" + item.m_shared.m_name + "' has no durability and non-repairable items are disabled - skipping"));
			}
			return;
		}
		BlacksmithingItemData orCreate = item.Data().GetOrCreate<BlacksmithingItemData>();
		string text = orCreate.infusion ?? "";
		bool flag2 = false;
		if (orCreate.level != level || orCreate.level == 0)
		{
			flag2 = true;
		}
		else if (orCreate.lastKnownQuality > 0 && orCreate.lastKnownQuality != item.m_quality)
		{
			flag2 = true;
		}
		else if (orCreate.lastKnownQuality == 0 && orCreate.level > 0)
		{
			orCreate.lastKnownQuality = item.m_quality;
			orCreate.Save();
			return;
		}
		if (!flag2)
		{
			return;
		}
		orCreate.level = level;
		orCreate.lastKnownQuality = item.m_quality;
		orCreate.baseDurability = baseStats.durability;
		orCreate.armorBonus = 0f;
		orCreate.damageBlunt = 0f;
		orCreate.damageSlash = 0f;
		orCreate.damagePierce = 0f;
		orCreate.damageFire = 0f;
		orCreate.damageFrost = 0f;
		orCreate.damageLightning = 0f;
		orCreate.damagePoison = 0f;
		orCreate.damageSpirit = 0f;
		orCreate.blockPowerBonus = 0f;
		orCreate.timedBlockBonus = 0f;
		orCreate.statsApplied = false;
		int num = level / cfg_StatTierInterval.Value;
		int num2 = level / cfg_DurabilityTierInterval.Value;
		if (cfg_EnableDurabilityBonus.Value && (flag || cfg_AllowNonRepairableItems.Value) && ((cfg_RespectOriginalDurability.Value & flag) || !cfg_RespectOriginalDurability.Value || cfg_AllowNonRepairableItems.Value))
		{
			float num3 = (float)num2 * cfg_DurabilityBonusPerTier.Value + (float)item.m_quality * cfg_DurabilityBonusPerUpgrade.Value;
			orCreate.maxDurability = baseStats.durability + num3;
			if (cfg_MaxDurabilityCap.Value > 0f)
			{
				orCreate.maxDurability = Mathf.Min(orCreate.maxDurability, cfg_MaxDurabilityCap.Value);
			}
		}
		if (cfg_EnableDamageBonus.Value)
		{
			ApplyDamageBonuses(item, baseStats, num, orCreate);
		}
		if (cfg_EnableArmorBonus.Value && baseStats.armor > 0f)
		{
			float num4 = (float)num * cfg_ArmorBonusPerTier.Value;
			float num6;
			if (cfg_UsePercentageUpgradeBonus.Value)
			{
				float num5 = (float)item.m_quality * cfg_StatPercentageBonusPerUpgrade.Value / 100f;
				num6 = baseStats.armor * num5;
			}
			else
			{
				num6 = (float)item.m_quality * cfg_ArmorBonusPerUpgrade.Value;
			}
			orCreate.armorBonus = num4 + num6;
			if (cfg_ArmorCap.Value > 0f && baseStats.armor + orCreate.armorBonus > cfg_ArmorCap.Value)
			{
				orCreate.armorBonus = cfg_ArmorCap.Value - baseStats.armor;
			}
		}
		if (cfg_EnableShieldBonus.Value && (int)item.m_shared.m_itemType == 5)
		{
			if (item.m_shared.m_blockPower > 0f)
			{
				orCreate.blockPowerBonus = (float)num * cfg_BlockPowerBonusPerTier.Value + (float)item.m_quality * cfg_BlockPowerBonusPerUpgrade.Value;
			}
			if (item.m_shared.m_timedBlockBonus > 0f)
			{
				orCreate.timedBlockBonus = (float)num * cfg_TimedBlockBonusPerTier.Value + (float)item.m_quality * cfg_TimedBlockBonusPerUpgrade.Value;
			}
		}
		if (cfg_EnableElementalBonus.Value && level >= cfg_ElementalUnlockLevel.Value && cfg_AlwaysAddElementalAtMax.Value && item.IsWeapon())
		{
			if (!string.IsNullOrEmpty(text))
			{
				float effectiveTiers = CalculateElementalEffectiveTier(num, item.m_quality);
				ApplySpecificInfusion(text, baseStats, effectiveTiers, orCreate);
			}
			else if (!HasElementalDamageBonus(orCreate))
			{
				float effectiveTiers2 = CalculateElementalEffectiveTier(num, item.m_quality);
				ApplyElementalInfusion(item, baseStats, effectiveTiers2, orCreate);
			}
		}
		orCreate.Save();
		orCreate.Load();
		Debug.Log((object)$"[BlacksmithingExpanded] Applied bonuses to {item.m_shared.m_name} (level {level}, quality {item.m_quality})");
	}

	private static void ApplyDamageBonuses(ItemData item, ItemBaseStats baseStats, int statTier, BlacksmithingItemData data)
	{
		float tierBonus = ((!cfg_UsePercentageDamageBonus.Value) ? ((float)(statTier * cfg_DamageBonusPerTier.Value)) : ((float)statTier * cfg_DamagePercentageBonusPerTier.Value / 100f));
		float upgradeBonus = 0f;
		if (item.m_quality > 0)
		{
			if (cfg_UsePercentageUpgradeBonus.Value)
			{
				upgradeBonus = (float)item.m_quality * cfg_StatPercentageBonusPerUpgrade.Value / 100f;
			}
			else if (cfg_UsePercentageDamageBonus.Value)
			{
				float totalPhysicalDamage = GetTotalPhysicalDamage(baseStats);
				if (totalPhysicalDamage > 0f)
				{
					upgradeBonus = (float)item.m_quality * cfg_StatBonusPerUpgrade.Value / totalPhysicalDamage;
				}
			}
			else
			{
				upgradeBonus = (float)item.m_quality * cfg_StatBonusPerUpgrade.Value;
			}
		}
		ApplyRandomDamageBonus(item, baseStats, tierBonus, upgradeBonus, data);
	}

	private static float CalculateElementalEffectiveTier(int statTier, int quality)
	{
		float num = statTier;
		if (cfg_UsePercentageUpgradeBonus.Value)
		{
			return num + (float)quality * cfg_StatPercentageBonusPerUpgrade.Value / cfg_ElementalPercentageBonusPerTier.Value;
		}
		return num + (float)quality * cfg_StatBonusPerUpgrade.Value / cfg_ElementalPercentageBonusPerTier.Value;
	}

	private static bool HasElementalDamageBonus(BlacksmithingItemData data)
	{
		return data.damageFire > 0f || data.damageFrost > 0f || data.damageLightning > 0f || data.damagePoison > 0f || data.damageSpirit > 0f;
	}

	private static void ApplySpecificInfusion(string infusionType, ItemBaseStats baseStats, float effectiveTiers, BlacksmithingItemData data)
	{
		if (cfg_UsePercentageElementalBonus.Value)
		{
			float num = effectiveTiers * cfg_ElementalPercentageBonusPerTier.Value / 100f;
			float totalPhysicalDamage = GetTotalPhysicalDamage(baseStats);
			switch (infusionType)
			{
			case "Fire":
				data.damageFire = totalPhysicalDamage * num;
				break;
			case "Frost":
				data.damageFrost = totalPhysicalDamage * num;
				break;
			case "Lightning":
				data.damageLightning = totalPhysicalDamage * num;
				break;
			case "Poison":
				data.damagePoison = totalPhysicalDamage * num;
				break;
			case "Spirit":
				data.damageSpirit = totalPhysicalDamage * num;
				break;
			}
		}
		else
		{
			switch (infusionType)
			{
			case "Fire":
				data.damageFire = effectiveTiers * cfg_FireBonusPerTier.Value;
				break;
			case "Frost":
				data.damageFrost = effectiveTiers * cfg_FrostBonusPerTier.Value;
				break;
			case "Lightning":
				data.damageLightning = effectiveTiers * cfg_LightningBonusPerTier.Value;
				break;
			case "Poison":
				data.damagePoison = effectiveTiers * cfg_PoisonBonusPerTier.Value;
				break;
			case "Spirit":
				data.damageSpirit = effectiveTiers * cfg_SpiritBonusPerTier.Value;
				break;
			}
		}
		data.infusion = infusionType;
	}

	private static float GetTotalPhysicalDamage(ItemBaseStats baseStats)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0019: Unknown result type (might be due to invalid IL or missing references)
		return baseStats.damages.m_blunt + baseStats.damages.m_slash + baseStats.damages.m_pierce;
	}

	private static void ApplyRandomDamageBonus(ItemData item, ItemBaseStats baseStats, float tierBonus, float upgradeBonus, BlacksmithingItemData data)
	{
		//IL_01d7: Unknown result type (might be due to invalid IL or missing references)
		//IL_004a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0203: Unknown result type (might be due to invalid IL or missing references)
		//IL_0075: Unknown result type (might be due to invalid IL or missing references)
		//IL_022f: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
		//IL_026f: Unknown result type (might be due to invalid IL or missing references)
		//IL_00df: Unknown result type (might be due to invalid IL or missing references)
		//IL_029b: Unknown result type (might be due to invalid IL or missing references)
		//IL_010a: Unknown result type (might be due to invalid IL or missing references)
		//IL_02c7: Unknown result type (might be due to invalid IL or missing references)
		//IL_0135: Unknown result type (might be due to invalid IL or missing references)
		//IL_02f3: Unknown result type (might be due to invalid IL or missing references)
		//IL_0160: Unknown result type (might be due to invalid IL or missing references)
		//IL_031f: Unknown result type (might be due to invalid IL or missing references)
		//IL_018b: Unknown result type (might be due to invalid IL or missing references)
		List<Action> list = new List<Action>();
		if (cfg_UsePercentageDamageBonus.Value)
		{
			float totalPercentageBonus = tierBonus + upgradeBonus;
			float totalBaseDamage = GetTotalPhysicalDamage(baseStats);
			if (baseStats.damages.m_blunt > 0f)
			{
				list.Add(() =>
				{
					data.damageBlunt = totalBaseDamage * totalPercentageBonus;
				});
			}
			if (baseStats.damages.m_slash > 0f)
			{
				list.Add(() =>
				{
					data.damageSlash = totalBaseDamage * totalPercentageBonus;
				});
			}
			if (baseStats.damages.m_pierce > 0f)
			{
				list.Add(() =>
				{
					data.damagePierce = totalBaseDamage * totalPercentageBonus;
				});
			}
			if (cfg_BoostElementalWeapons.Value)
			{
				if (baseStats.damages.m_fire > 0f)
				{
					list.Add(() =>
					{
						data.damageFire = totalBaseDamage * totalPercentageBonus;
					});
				}
				if (baseStats.damages.m_frost > 0f)
				{
					list.Add(() =>
					{
						data.damageFrost = totalBaseDamage * totalPercentageBonus;
					});
				}
				if (baseStats.damages.m_lightning > 0f)
				{
					list.Add(() =>
					{
						data.damageLightning = totalBaseDamage * totalPercentageBonus;
					});
				}
				if (baseStats.damages.m_poison > 0f)
				{
					list.Add(() =>
					{
						data.damagePoison = totalBaseDamage * totalPercentageBonus;
					});
				}
				if (baseStats.damages.m_spirit > 0f)
				{
					list.Add(() =>
					{
						data.damageSpirit = totalBaseDamage * totalPercentageBonus;
					});
				}
			}
		}
		else
		{
			float totalFlatBonus = tierBonus + upgradeBonus;
			if (baseStats.damages.m_blunt > 0f)
			{
				list.Add(() =>
				{
					data.damageBlunt = totalFlatBonus;
				});
			}
			if (baseStats.damages.m_slash > 0f)
			{
				list.Add(() =>
				{
					data.damageSlash = totalFlatBonus;
				});
			}
			if (baseStats.damages.m_pierce > 0f)
			{
				list.Add(() =>
				{
					data.damagePierce = totalFlatBonus;
				});
			}
			if (cfg_BoostElementalWeapons.Value)
			{
				if (baseStats.damages.m_fire > 0f)
				{
					list.Add(() =>
					{
						data.damageFire = totalFlatBonus;
					});
				}
				if (baseStats.damages.m_frost > 0f)
				{
					list.Add(() =>
					{
						data.damageFrost = totalFlatBonus;
					});
				}
				if (baseStats.damages.m_lightning > 0f)
				{
					list.Add(() =>
					{
						data.damageLightning = totalFlatBonus;
					});
				}
				if (baseStats.damages.m_poison > 0f)
				{
					list.Add(() =>
					{
						data.damagePoison = totalFlatBonus;
					});
				}
				if (baseStats.damages.m_spirit > 0f)
				{
					list.Add(() =>
					{
						data.damageSpirit = totalFlatBonus;
					});
				}
			}
		}
		if (list.Count > 0)
		{
			list[Random.Range(0, list.Count)]();
		}
	}

	private static void ApplyElementalInfusion(ItemData item, ItemBaseStats baseStats, float effectiveTiers, BlacksmithingItemData data)
	{
		//IL_0192: Unknown result type (might be due to invalid IL or missing references)
		//IL_0069: Unknown result type (might be due to invalid IL or missing references)
		//IL_01cc: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a3: Unknown result type (might be due to invalid IL or missing references)
		//IL_0206: Unknown result type (might be due to invalid IL or missing references)
		//IL_00dd: Unknown result type (might be due to invalid IL or missing references)
		//IL_0240: Unknown result type (might be due to invalid IL or missing references)
		//IL_0117: Unknown result type (might be due to invalid IL or missing references)
		//IL_027a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0151: Unknown result type (might be due to invalid IL or missing references)
		List<(string, Action)> list = new List<(string, Action)>();
		if (cfg_UsePercentageElementalBonus.Value)
		{
			float percentageBonus = effectiveTiers * cfg_ElementalPercentageBonusPerTier.Value / 100f;
			float totalBaseDamage = GetTotalPhysicalDamage(baseStats);
			if (baseStats.damages.m_fire <= 0f)
			{
				list.Add(("Fire", () =>
				{
					data.damageFire = totalBaseDamage * percentageBonus;
					data.infusion = "Fire";
				}));
			}
			if (baseStats.damages.m_frost <= 0f)
			{
				list.Add(("Frost", () =>
				{
					data.damageFrost = totalBaseDamage * percentageBonus;
					data.infusion = "Frost";
				}));
			}
			if (baseStats.damages.m_lightning <= 0f)
			{
				list.Add(("Lightning", () =>
				{
					data.damageLightning = totalBaseDamage * percentageBonus;
					data.infusion = "Lightning";
				}));
			}
			if (baseStats.damages.m_poison <= 0f)
			{
				list.Add(("Poison", () =>
				{
					data.damagePoison = totalBaseDamage * percentageBonus;
					data.infusion = "Poison";
				}));
			}
			if (baseStats.damages.m_spirit <= 0f)
			{
				list.Add(("Spirit", () =>
				{
					data.damageSpirit = totalBaseDamage * percentageBonus;
					data.infusion = "Spirit";
				}));
			}
		}
		else
		{
			if (baseStats.damages.m_fire <= 0f)
			{
				list.Add(("Fire", () =>
				{
					data.damageFire = effectiveTiers * cfg_FireBonusPerTier.Value;
					data.infusion = "Fire";
				}));
			}
			if (baseStats.damages.m_frost <= 0f)
			{
				list.Add(("Frost", () =>
				{
					data.damageFrost = effectiveTiers * cfg_FrostBonusPerTier.Value;
					data.infusion = "Frost";
				}));
			}
			if (baseStats.damages.m_lightning <= 0f)
			{
				list.Add(("Lightning", () =>
				{
					data.damageLightning = effectiveTiers * cfg_LightningBonusPerTier.Value;
					data.infusion = "Lightning";
				}));
			}
			if (baseStats.damages.m_poison <= 0f)
			{
				list.Add(("Poison", () =>
				{
					data.damagePoison = effectiveTiers * cfg_PoisonBonusPerTier.Value;
					data.infusion = "Poison";
				}));
			}
			if (baseStats.damages.m_spirit <= 0f)
			{
				list.Add(("Spirit", () =>
				{
					data.damageSpirit = effectiveTiers * cfg_SpiritBonusPerTier.Value;
					data.infusion = "Spirit";
				}));
			}
		}
		if (list.Count > 0)
		{
			list[Random.Range(0, list.Count)].Item2();
		}
	}

	private static float HandleCraftingXP(Player player, ItemData item)
	{
		if (!ItemEligibilityCache.IsEligibleForBlacksmithingBonuses(item))
		{
			return 0f;
		}
		float num = 0f;
		string text = StringExtensionMethods.GetStableHashCode(item.m_shared.m_name).ToString();
		string key = "crafted_" + text;
		if (!player.m_customData.ContainsKey(key))
		{
			player.m_customData[key] = "1";
			float value = cfg_FirstCraftBonusXP.Value;
			GiveBlacksmithingXP(player, value);
			num += value;
		}
		float value2 = cfg_XPPerCraft.Value;
		GiveBlacksmithingXP(player, value2);
		return num + value2;
	}

	private static string GetWorkstationPrefabName(Smelter smelter)
	{
		string text = ((Object)((Component)smelter).gameObject).name;
		int num = text.IndexOf("(Clone)", StringComparison.Ordinal);
		if (num >= 0)
		{
			text = text.Substring(0, num);
		}
		return text.Trim();
	}

	private static bool IsBlacksmithingStation(Smelter smelter)
	{
		string workstationPrefabName = GetWorkstationPrefabName(smelter);
		string[] array = (cfg_BlacksmithingStations.Value ?? "").Split(new char[1] { ',' });
		foreach (string text in array)
		{
			if (string.Equals(text.Trim(), workstationPrefabName, StringComparison.OrdinalIgnoreCase))
			{
				return true;
			}
		}
		return false;
	}

	private static bool IsKiln(Smelter smelter)
	{
		return GetWorkstationPrefabName(smelter) == "charcoal_kiln" || smelter.m_name.Contains("charcoal_kiln") || smelter.m_name.Contains("charcoalkiln");
	}

	private static bool IsBlastFurnace(Smelter smelter)
	{
		return GetWorkstationPrefabName(smelter) == "blastfurnace" || smelter.m_name.Contains("blastfurnace");
	}

	private static float GetBaseSpeed(Smelter smelter, ZDOID uid, bool isKiln, bool isBlastFurnace)
	{
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		Dictionary<ZDOID, float> dictionary;
		if (isKiln)
		{
			dictionary = originalKilnSpeeds;
		}
		else
		{
			dictionary = (isBlastFurnace ? originalBlastFurnaceSpeeds : originalSmelterSpeeds);
		}
		if (!dictionary.TryGetValue(uid, out var value))
		{
			value = (dictionary[uid] = smelter.m_secPerProduct);
		}
		return value;
	}

	private static Dictionary<ZDOID, WorkstationInfusion> InfusionsFor(Smelter smelter, bool isKiln)
	{
		Dictionary<ZDOID, WorkstationInfusion> result;
		if (isKiln)
		{
			result = kilnInfusions;
		}
		else
		{
			result = (IsBlastFurnace(smelter) ? blastFurnaceInfusions : smelterInfusions);
		}
		return result;
	}

	private static void ManageInfusionGlow(Transform workstation, ZDOID zdoid, bool enable)
	{
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_0053: Unknown result type (might be due to invalid IL or missing references)
		//IL_003c: Unknown result type (might be due to invalid IL or missing references)
		//IL_006e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0075: Expected Obj, but got Unknown
		//IL_007d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0082: Unknown result type (might be due to invalid IL or missing references)
		//IL_008c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0091: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ff: Unknown result type (might be due to invalid IL or missing references)
		//IL_0113: Unknown result type (might be due to invalid IL or missing references)
		//IL_0140: Unknown result type (might be due to invalid IL or missing references)
		if (!cfg_ShowInfusionVisualEffect.Value)
		{
			if (activeGlowEffects.TryGetValue(zdoid, out var value))
			{
				if ((Object)(object)value != (Object)null)
				{
					Object.Destroy((Object)(object)value);
				}
				activeGlowEffects.Remove(zdoid);
			}
			return;
		}
		try
		{
			GameObject value2;
			if (enable && !activeGlowEffects.ContainsKey(zdoid))
			{
				GameObject val = new GameObject("InfusionGlow_Light");
				val.transform.position = workstation.position + Vector3.up * 0.5f;
				val.transform.SetParent(workstation);
				Light val2 = val.AddComponent<Light>();
				val2.color = new Color(1f, 0.5f, 0.1f);
				val2.intensity = 4f;
				val2.range = 8f;
				val2.type = (LightType)2;
				val.AddComponent<FlickerLight>();
				activeGlowEffects[zdoid] = val;
			}
			else if (!enable && activeGlowEffects.TryGetValue(zdoid, out value2))
			{
				if ((Object)(object)value2 != (Object)null)
				{
					Object.Destroy((Object)(object)value2);
				}
				activeGlowEffects.Remove(zdoid);
			}
		}
		catch (Exception arg)
		{
			Debug.LogError((object)$"[BlacksmithingExpanded] Light management failed: {arg}");
		}
	}

	private static string GenerateSpearKey(ItemData weapon, Player player)
	{
		return string.Format("{0}_{1}_{2:F1}_{3}_{4:F2}", new object[5]
		{
			weapon.m_shared.m_name,
			weapon.m_quality,
			weapon.m_durability,
			player.GetPlayerID(),
			Time.time
		});
	}

	private static KeyValuePair<string, BlacksmithingItemData> FindBestSpearMatch(ItemData item)
	{
		string key = null;
		BlacksmithingItemData value = null;
		float num = 0f;
		float time = Time.time;
		foreach (KeyValuePair<string, BlacksmithingItemData> item2 in tempSpearDataStorage.ToList())
		{
			string[] array = item2.Key.Split(new char[1] { '_' });
			if (array.Length < 5)
			{
				continue;
			}
			string text = array[0];
			if (!int.TryParse(array[1], out var result) || !float.TryParse(array[2], out var result2) || !long.TryParse(array[3], out var _) || !float.TryParse(array[4], out var result4) || text != item.m_shared.m_name || result != item.m_quality)
			{
				continue;
			}
			float num2 = time - result4;
			if (!(num2 > 60f))
			{
				float num3 = Mathf.Abs(item.m_durability - result2);
				float num4 = 1000f - num3 * 10f - num2 * 5f;
				if (num4 > num)
				{
					num = num4;
					key = item2.Key;
					value = item2.Value;
				}
			}
		}
		return new KeyValuePair<string, BlacksmithingItemData>(key, value);
	}

	private static void ApplyStoredBlacksmithingStats(ItemData item, BlacksmithingItemData data)
	{
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_0033: Expected Obj, but got Unknown
		//IL_00c3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e5: Unknown result type (might be due to invalid IL or missing references)
		//IL_0107: Unknown result type (might be due to invalid IL or missing references)
		//IL_0129: Unknown result type (might be due to invalid IL or missing references)
		//IL_014b: Unknown result type (might be due to invalid IL or missing references)
		//IL_016d: Unknown result type (might be due to invalid IL or missing references)
		//IL_018f: Unknown result type (might be due to invalid IL or missing references)
		//IL_01b1: Unknown result type (might be due to invalid IL or missing references)
		//IL_01cd: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d3: Invalid comparison between Unknown and I4
		ItemBaseStats baseStats = GetBaseStats(item);
		SharedData shared = item.m_shared;
		item.m_shared = (SharedData)((object)shared).GetType().GetMethod("MemberwiseClone", BindingFlags.Instance | BindingFlags.NonPublic).Invoke(shared, null);
		if (cfg_EnableDurabilityBonus.Value && data.maxDurability > 0f)
		{
			item.m_shared.m_maxDurability = data.maxDurability;
			item.m_durability = Mathf.Min(item.m_durability, item.GetMaxDurability());
		}
		if (cfg_EnableArmorBonus.Value && data.armorBonus > 0f)
		{
			item.m_shared.m_armor = baseStats.armor + data.armorBonus;
		}
		item.m_shared.m_damages.m_blunt = baseStats.damages.m_blunt + data.damageBlunt;
		item.m_shared.m_damages.m_slash = baseStats.damages.m_slash + data.damageSlash;
		item.m_shared.m_damages.m_pierce = baseStats.damages.m_pierce + data.damagePierce;
		item.m_shared.m_damages.m_fire = baseStats.damages.m_fire + data.damageFire;
		item.m_shared.m_damages.m_frost = baseStats.damages.m_frost + data.damageFrost;
		item.m_shared.m_damages.m_lightning = baseStats.damages.m_lightning + data.damageLightning;
		item.m_shared.m_damages.m_poison = baseStats.damages.m_poison + data.damagePoison;
		item.m_shared.m_damages.m_spirit = baseStats.damages.m_spirit + data.damageSpirit;
		if ((int)item.m_shared.m_itemType == 5)
		{
			if (data.blockPowerBonus > 0f)
			{
				item.m_shared.m_blockPower = baseStats.blockPower + data.blockPowerBonus;
			}
			if (data.timedBlockBonus > 0f)
			{
				item.m_shared.m_timedBlockBonus = baseStats.timedBlockBonus + data.timedBlockBonus;
			}
		}
	}

	private static void CopyBlacksmithingData(BlacksmithingItemData source, BlacksmithingItemData target)
	{
		target.level = source.level;
		target.lastKnownQuality = source.lastKnownQuality;
		target.infusion = source.infusion;
		target.baseDurability = source.baseDurability;
		target.maxDurability = source.maxDurability;
		target.armorBonus = source.armorBonus;
		target.damageBlunt = source.damageBlunt;
		target.damageSlash = source.damageSlash;
		target.damagePierce = source.damagePierce;
		target.damageFire = source.damageFire;
		target.damageFrost = source.damageFrost;
		target.damageLightning = source.damageLightning;
		target.damagePoison = source.damagePoison;
		target.damageSpirit = source.damageSpirit;
		target.blockPowerBonus = source.blockPowerBonus;
		target.timedBlockBonus = source.timedBlockBonus;
		target.statsApplied = source.statsApplied;
	}

	private static Sprite LoadEmbeddedSprite(string resourceName, int width, int height)
	{
		//IL_0041: Unknown result type (might be due to invalid IL or missing references)
		//IL_0048: Expected Obj, but got Unknown
		//IL_0068: Unknown result type (might be due to invalid IL or missing references)
		//IL_006d: Unknown result type (might be due to invalid IL or missing references)
		try
		{
			using Stream stream = Assembly.GetExecutingAssembly().GetManifestResourceStream("BlacksmithingExpanded.icons." + resourceName);
			if (stream == null)
			{
				return null;
			}
			using MemoryStream memoryStream = new MemoryStream();
			stream.CopyTo(memoryStream);
			byte[] array = memoryStream.ToArray();
			Texture2D val = new Texture2D(width, height);
			if (ImageConversion.LoadImage(val, array))
			{
				return Sprite.Create(val, new Rect(0f, 0f, (float)width, (float)height), Vector2.zero);
			}
		}
		catch (Exception arg)
		{
			Debug.LogError((object)$"[BlacksmithingExpanded] Failed to load sprite {resourceName}: {arg}");
		}
		return null;
	}
}
