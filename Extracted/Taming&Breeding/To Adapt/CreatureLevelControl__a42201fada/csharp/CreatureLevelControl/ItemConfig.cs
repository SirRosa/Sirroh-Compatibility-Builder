using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using HarmonyLib;
using ServerSync;
using UnityEngine;

namespace CreatureLevelControl;

[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
public class ItemConfig
{
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	public struct Teleportable
	{
		public int amount;

		public float cooldown;

		public float loss;
	}

	[HarmonyPatch(typeof(ObjectDB), "Awake")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	public class LoadPredefinedGroups
	{
		[HarmonyPriority(0)]
		private static void Postfix()
		{
			if (predefinedGroups.Count > 0 || !Object.op_Implicit((Object)(object)ZNetScene.instance))
			{
				return;
			}
			foreach (GameObject item in ObjectDB.instance.m_items)
			{
				ItemDrop component = item.GetComponent<ItemDrop>();
				if (component != null)
				{
					predefinedGroups.Add(((Object)item).name, itemGroups(component.m_itemData.m_shared).ToArray());
				}
			}
		}
	}

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	public class ConfigFile : global::CreatureLevelControl.ConfigFile
	{
		private readonly Dictionary<string, ItemConfig> configs = new Dictionary<string, ItemConfig>();

		private static List<string> prefabLocalizations(ItemDrop prefab)
		{
			return new List<string>
			{
				((Object)prefab).name.ToLower(),
				prefab.m_itemData.m_shared.m_name.ToLower(),
				Localization.instance.Localize(prefab.m_itemData.m_shared.m_name).ToLower(),
				CreatureLevelControl.englishLocalization.Localize(prefab.m_itemData.m_shared.m_name).ToLower()
			};
		}

		public Dictionary<string, ItemConfig> Process()
		{
			Dictionary<string, ItemConfig> dictionary = new Dictionary<string, ItemConfig>();
			foreach (ItemDrop item in from p in ObjectDB.instance.m_items
				select p.GetComponent<ItemDrop>() into c
				where (Object)(object)c != (Object)null
				select c)
			{
				List<string> list = prefabLocalizations(item);
				if (predefinedGroups.TryGetValue(((Object)item).name, out var value))
				{
					list.AddRange(value);
				}
				string[] array = list.ToArray();
				foreach (string name in array)
				{
					resolveGroupsForName(list, name);
				}
				list.Add("all");
				foreach (string item2 in list)
				{
					if (configs.TryGetValue(item2, out var value2))
					{
						if (!dictionary.TryGetValue(((Object)item).name, out var value3))
						{
							ItemConfig itemConfig = (dictionary[((Object)item).name] = new ItemConfig());
							value3 = itemConfig;
						}
						AssignConfig(ref value3.itemWeight, value2.itemWeight);
						AssignConfig(ref value3.itemWeightFactor, value2.itemWeightFactor);
						AssignConfig(ref value3.worldLevelToLootAmount, value2.worldLevelToLootAmount);
						AssignConfig(ref value3.itemStack, value2.itemStack);
						AssignConfig(ref value3.itemStackFactor, value2.itemStackFactor);
						AssignConfig(ref value3.worldLevelToLootPickup, value2.worldLevelToLootPickup);
						AssignConfig(ref value3.worldLevelToItemTeleportable, value2.worldLevelToItemTeleportable);
						AssignConfig(ref value3.itemFloating, value2.itemFloating);
						AssignConfig(ref value3.worldLevelToItemLoss, value2.worldLevelToItemLoss);
					}
				}
				if (dictionary.TryGetValue(((Object)item).name, out var value4))
				{
					fillWorldLevels(value4.worldLevelToLootAmount);
					fillWorldLevels(value4.worldLevelToLootPickup);
					fillWorldLevels(value4.worldLevelToItemTeleportable);
					fillWorldLevels(value4.worldLevelToItemLoss);
				}
			}
			return dictionary;
		}

		protected override void ParsePrimarySection(Section creatureSection)
		{
			string key = creatureSection.dictKey.ToLower();
			if (!configs.TryGetValue(key, out var value))
			{
				value = (configs[key] = new ItemConfig());
			}
			ParseScalarFromObject(ref value.itemWeight, creatureSection, "weight");
			ParseScalarFromObject(ref value.itemWeightFactor, creatureSection, "weight factor");
			ParseWorldlevelToSingleScalar(ref value.worldLevelToLootAmount, creatureSection, "amount");
			ParseScalarFromObject(ref value.itemStack, creatureSection, "stack");
			ParseScalarFromObject(ref value.itemStackFactor, creatureSection, "stack factor");
			ParseWorldlevelToSingleScalar(ref value.worldLevelToLootPickup, creatureSection, "pickup");
			ParseWorldlevelToSingleScalar(ref value.worldLevelToItemTeleportable, creatureSection, "teleportable");
			ParseScalarFromObject(ref value.itemFloating, creatureSection, "floating");
			ParseWorldlevelToSingleScalar(ref value.worldLevelToItemLoss, creatureSection, "loss");
		}
	}

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	public class Loader : global::CreatureLevelControl.ConfigFile.Loader
	{
		[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
		public global::CreatureLevelControl.ConfigFile ConfigFile
		{
			[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(2)]
			get
			{
				return CreatureLevelControl.itemConfigFile;
			}
			[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(2)]
			set
			{
				CreatureLevelControl.itemConfigFile = (ConfigFile)value;
			}
		}

		public string FilePattern => "ItemConfig*.yml";

		public string EditButtonName => LocalizationWrapper.getTranslation("Edit Item YAML config");

		public CustomSyncedValue<List<string>> FileData => CreatureLevelControl.itemConfigFileData;

		public bool Enabled => CreatureLevelControl.itemConfigFileActive.GetToggle();

		public global::CreatureLevelControl.ConfigFile InstantiateConfig()
		{
			return new ConfigFile();
		}

		public void ProcessConfig()
		{
			CreatureLevelControl.ItemConfig = CreatureLevelControl.itemConfigFile.Process();
		}
	}

	public float? itemWeight;

	public float? itemWeightFactor;

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	public Dictionary<int, float?> worldLevelToLootAmount;

	public int? itemStack;

	public float? itemStackFactor;

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	public Dictionary<int, bool?> worldLevelToLootPickup;

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	public Dictionary<int, Teleportable?> worldLevelToItemTeleportable;

	public bool? itemFloating;

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	public Dictionary<int, bool?> worldLevelToItemLoss;

	private static readonly Dictionary<string, string[]> predefinedGroups = new Dictionary<string, string[]>();

	private static IEnumerable<string> itemGroups(SharedData itemData)
	{
		if (itemData != null && itemData.m_food > 0f && itemData.m_foodStamina > 0f)
		{
			yield return "food";
		}
		else if (itemData.m_food > 0f || itemData.m_foodStamina > 0f)
		{
			yield return "potion";
		}
		ItemType itemType = itemData.m_itemType;
		ItemType val = itemType;
		switch (val - 1)
		{
		case 8:
		{
			string ammoType = itemData.m_ammoType;
			string text = ammoType;
			string text2 = text;
			if (!(text2 == "$ammo_bolts"))
			{
				if (text2 == "$ammo_arrows")
				{
					yield return "arrows";
				}
			}
			else
			{
				yield return "bolts";
			}
			yield return "ammo";
			break;
		}
		case 2:
		case 3:
		case 13:
		{
			yield return "equipment";
			bool isWeapon = true;
			SkillType skillType = itemData.m_skillType;
			SkillType val2 = skillType;
			switch (val2 - 1)
			{
			case 0:
				yield return "swords";
				break;
			case 7:
				yield return "bows";
				break;
			case 13:
				yield return "crossbows";
				break;
			case 6:
				yield return "axes";
				break;
			case 2:
				yield return "clubs";
				break;
			case 1:
				yield return "knives";
				break;
			case 11:
				yield return "pickaxes";
				break;
			case 3:
				yield return "polearms";
				break;
			case 4:
				yield return "spears";
				break;
			default:
				isWeapon = false;
				break;
			}
			if (isWeapon)
			{
				yield return "weapon";
			}
			break;
		}
		case 14:
			yield return "equipment";
			break;
		case 12:
		{
			string[] bossTrophies = new string[8] { "eikthyr", "elder", "bonemass", "dragonqueen", "goblinking", "SeekerQueen", "fader", "frozenking" };
			yield return bossTrophies.Any(itemData.m_name.EndsWith) ? "boss trophy" : "trophy";
			break;
		}
		case 0:
		{
			GameObject piece = ObjectDB.instance.GetItemPrefab("Cultivator").GetComponent<ItemDrop>().m_itemData.m_shared.m_buildPieces.m_pieces.FirstOrDefault([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (GameObject p) =>
			{
				Requirement[] resources = p.GetComponent<Piece>().m_resources;
				return resources.Length == 1 && resources[0].m_resItem.m_itemData.m_shared.m_name == itemData.m_name;
			});
			if (piece != null)
			{
				Plant component = piece.GetComponent<Plant>();
				yield return (component != null && component.m_grownPrefabs[0].GetComponent<Pickable>()?.m_amount > 1) ? "crop" : "seed";
			}
			if (ZNetScene.instance.GetPrefab("smelter").GetComponent<Smelter>().m_conversion.Any([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (ItemConversion c) => c.m_from.m_itemData.m_shared.m_name == itemData.m_name))
			{
				yield return "ore";
			}
			if (ZNetScene.instance.GetPrefab("smelter").GetComponent<Smelter>().m_conversion.Any([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (ItemConversion c) => c.m_to.m_itemData.m_shared.m_name == itemData.m_name))
			{
				yield return "metal";
			}
			if (ZNetScene.instance.GetPrefab("blastfurnace").GetComponent<Smelter>().m_conversion.Any([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (ItemConversion c) => c.m_from.m_itemData.m_shared.m_name == itemData.m_name))
			{
				yield return "ore";
			}
			if (ZNetScene.instance.GetPrefab("blastfurnace").GetComponent<Smelter>().m_conversion.Any([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (ItemConversion c) => c.m_to.m_itemData.m_shared.m_name == itemData.m_name))
			{
				yield return "metal";
			}
			if (ZNetScene.instance.GetPrefab("charcoal_kiln").GetComponent<Smelter>().m_conversion.Any([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (ItemConversion c) => c.m_from.m_itemData.m_shared.m_name == itemData.m_name) || itemData.m_name == "$item_yggdrasilwood")
			{
				yield return "woods";
			}
			break;
		}
		case 4:
			if (itemData.m_timedBlockBonus > 0f)
			{
				yield return "equipment";
				yield return "shield";
				yield return "round shield";
			}
			else if (itemData.m_timedBlockBonus == 0f)
			{
				yield return "equipment";
				yield return "shield";
				yield return "tower shield";
			}
			break;
		case 6:
			yield return "equipment";
			yield return "armor";
			yield return "chest";
			break;
		case 16:
			yield return "equipment";
			yield return "armor";
			yield return "cape";
			break;
		case 5:
			yield return "equipment";
			yield return "armor";
			yield return "helmet";
			break;
		case 10:
			yield return "equipment";
			yield return "armor";
			yield return "pants";
			break;
		case 18:
			yield return "equipment";
			yield return "tool";
			break;
		case 17:
			yield return "equipment";
			yield return "special";
			break;
		}
		if (itemData.m_value > 0)
		{
			yield return "valuable";
		}
		if (itemData.m_maxStackSize > 1)
		{
			yield return "stackable";
		}
		if (itemData.m_name == "$item_elderbark")
		{
			yield return "woods";
		}
	}
}
