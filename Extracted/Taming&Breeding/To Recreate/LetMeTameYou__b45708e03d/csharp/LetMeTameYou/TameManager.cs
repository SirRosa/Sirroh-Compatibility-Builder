using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Reflection;
using BepInEx;
using HarmonyLib;
using LocalizationManager;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace LetMeTameYou;

public class TameManager : MonoBehaviour
{
	public enum AddedClass
	{
		Tameable,
		Procreation,
		LMTY_AnimalAI,
		LMTY_Interactable
	}

	public class ModifiedTame
	{
		public GameObject go { get; set; } = null;

		public List<AddedClass> addedClasses { get; set; } = new List<AddedClass>();

		public ModifiedTame(GameObject gameObject)
		{
			go = gameObject;
		}
	}

	public static ZNetScene zns;

	public static GameObject Root;

	public static bool hasInitBaseObj;

	public static bool hasInitTames;

	private static Tameable wtame;

	public static GameObject heartEffectGO;

	public static GameObject DrakeEggPrefab;

	public static GameObject ChickenEggPrefab;

	public static GameObject AsksvinEggPrefab;

	public static GameObject CustDrakeEggPrefab;

	public static bool SetEggs = false;

	public static bool AlteredBaseEggs = false;

	public static bool OverwroteDragonEgg = false;

	private static int maxtamingLvl = -1;

	public static Dictionary<string, GameObject> TamedAttackVariants = new Dictionary<string, GameObject>();

	public static Dictionary<string, List<string>> RequiredTamingKeys = new Dictionary<string, List<string>>();

	private static List<ModifiedTame> modifiedTameList = new List<ModifiedTame>();

	private void Awake()
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0010: Expected Obj, but got Unknown
		Root = new GameObject("MiniOnes");
		Root.transform.SetParent(((Component)this).gameObject.transform);
		Root.SetActive(false);
		maxtamingLvl = LetMeTameYou.maxTamingLevel.Value;
	}

	public static void SetupAllCreatures()
	{
		DBG.blogDebug("SetUp All Creatures");
		InitBaseObjects(ObjectDB.instance);
		AlterEggs();
		maxtamingLvl = LetMeTameYou.maxTamingLevel.Value;
	}

	public static void UpdatesFromServer()
	{
		SetupAllCreatures();
		zns = ((Component)ObjectDB.instance).gameObject.GetComponent<ZNetScene>();
		LoadInCreatures(LetMeTameYou.customTamesList);
		ObjectDB.instance.UpdateRegisters();
		DBG.blogInfo("Succesfully Loaded Config from server");
	}

	private static void LoadInCreatures(Dictionary<string, LetMeTameYou.TameConfig> tamesList)
	{
		DBG.blogDebug("Loading in Creatures");
		foreach (KeyValuePair<string, LetMeTameYou.TameConfig> tames in tamesList)
		{
			string key = tames.Key;
			if ((Object)(object)zns.GetPrefab(key) == (Object)null)
			{
				DBG.blogWarning("Cant find Prefab Check your name : " + key);
			}
			else
			{
				AddTame(zns.GetPrefab(key), tames.Value);
			}
		}
		hasInitTames = true;
	}

	public static void clearTameClasses()
	{
		foreach (ModifiedTame modifiedTame in modifiedTameList)
		{
			foreach (AddedClass addedClass in modifiedTame.addedClasses)
			{
				DBG.blogDebug("Removing " + addedClass.ToString() + " from " + ((Object)modifiedTame.go).name);
				Object.Destroy((Object)(object)((Component)modifiedTame.go.transform).GetComponent(addedClass.ToString()));
				if (addedClass == AddedClass.Tameable)
				{
					MonsterAI component = modifiedTame.go.GetComponent<MonsterAI>();
					if ((Object)(object)component != (Object)null)
					{
						component.m_consumeItems.Clear();
					}
				}
			}
		}
	}

	public static void AddTame(GameObject go, LetMeTameYou.TameConfig tb)
	{
		//IL_0256: Unknown result type (might be due to invalid IL or missing references)
		//IL_025d: Expected Obj, but got Unknown
		if (tb.removeTameable)
		{
			DBG.blogDebug("Removing Tameable from " + ((Object)go).name);
			if ((Object)(object)go.GetComponent<Tameable>() != (Object)null)
			{
				Object.DestroyImmediate((Object)(object)go.GetComponent<Tameable>());
			}
			if ((Object)(object)go.GetComponent<Procreation>() != (Object)null)
			{
				Object.DestroyImmediate((Object)(object)go.GetComponent<Procreation>());
			}
			return;
		}
		if ((Object)(object)go.GetComponent<MonsterAI>() == (Object)null)
		{
			if (!((Object)(object)go.GetComponent<AnimalAI>() != (Object)null))
			{
				DBG.blogWarning(((Object)go).name + " can't be added,Remove it in your cfg");
				return;
			}
			CloneAnimalAI(go);
		}
		MonsterAI component = go.GetComponent<MonsterAI>();
		Humanoid component2 = go.GetComponent<Humanoid>();
		if (tb.specialGroup != "")
		{
			((Character)component2).m_group = tb.specialGroup;
		}
		else if (!tb.hostileToSelf)
		{
			((Character)component2).m_group = ((Object)go).name;
		}
		else
		{
			((Character)component2).m_group = "";
		}
		SpawnedHostilePatches.findTamedAttackVariants(component2);
		ModifiedTame modifiedTame = new ModifiedTame(go);
		Tameable val = default;
		if (!go.TryGetComponent<Tameable>(ref val))
		{
			val = go.AddComponent<Tameable>();
			modifiedTame.addedClasses.Add(AddedClass.Tameable);
		}
		LMTY_Interactable lMTY_Interactable = default;
		if (tb.trade != "" && !go.TryGetComponent<LMTY_Interactable>(ref lMTY_Interactable))
		{
			DBG.blogDebug("Adding LMTY_Interactable");
			lMTY_Interactable = go.AddComponent<LMTY_Interactable>();
			modifiedTame.addedClasses.Add(AddedClass.LMTY_Interactable);
			DBG.blogDebug("Added LMTY_Interactable");
		}
		if (val.m_petEffect.m_effectPrefabs.Length == 0)
		{
			int num = 0;
			string text = "Effect List: ";
			EffectData[] array = new EffectData[10];
			EffectData[] effectPrefabs = ((BaseAI)component).m_idleSound.m_effectPrefabs;
			EffectData[] array2 = effectPrefabs;
			foreach (EffectData val2 in array2)
			{
				try
				{
					text = text + num + ":" + ((Object)val2.m_prefab).name;
					array[num] = val2;
				}
				catch
				{
				}
				num++;
			}
			DBG.blogDebug(text);
			int num2 = effectPrefabs.Length;
			if (((BaseAI)component).m_idleSound.m_effectPrefabs.Length != 0)
			{
				EffectData val3 = new EffectData();
				val3.m_prefab = heartEffectGO;
				Array.Resize(ref array, num2 + 1);
				array[num2] = val3;
				val.m_petEffect.m_effectPrefabs = array;
			}
			else
			{
				val.m_petEffect = wtame.m_petEffect;
			}
		}
		val.m_sootheEffect = val.m_petEffect;
		val.m_tamedEffect = wtame.m_tamedEffect;
		val.m_commandable = tb.commandable;
		val.m_tamingTime = tb.tamingTime;
		val.m_fedDuration = tb.fedDuration;
		component.m_consumeRange = tb.consumeRange;
		component.m_consumeSearchInterval = tb.consumeSearchInterval;
		component.m_consumeSearchRange = tb.consumeSearchRange;
		if (component.m_enableHuntPlayer)
		{
			component.m_wakeupRange = 150f;
			component.m_enableHuntPlayer = false;
		}
		component.m_consumeItems = new List<ItemDrop>();
		List<string> list = tb.consumeItems.Split(new char[1] { ',' }).ToList();
		if (!string.IsNullOrEmpty(list[0]) | (list.Count > 1))
		{
			foreach (string item in list)
			{
				GameObject itemPrefab = ObjectDB.instance.GetItemPrefab(item);
				if ((Object)(object)itemPrefab == (Object)null)
				{
					DBG.blogWarning("Wrong food name :" + item);
				}
				else
				{
					component.m_consumeItems.Add(itemPrefab.GetComponent<ItemDrop>());
				}
			}
		}
		else
		{
			DBG.blogInfo("Cannot be tamed by food");
		}
		if (tb.requiredWorldKeys != "")
		{
			List<string> value = tb.requiredWorldKeys.Split(new char[1] { ',' }).ToList();
			if (RequiredTamingKeys.ContainsKey(((Object)go).name))
			{
				RequiredTamingKeys.Remove(((Object)go).name);
			}
			RequiredTamingKeys.Add(((Object)go).name, value);
		}
		if (tb.procreation)
		{
			bool flag = true;
			Procreation val4 = default;
			if (!go.TryGetComponent<Procreation>(ref val4))
			{
				val4 = go.AddComponent<Procreation>();
				modifiedTame.addedClasses.Add(AddedClass.Procreation);
				flag = false;
			}
			val4.m_maxCreatures = tb.maxCreatures;
			val4.m_pregnancyChance = tb.pregnancyChance;
			if (val4.m_pregnancyChance > 1f)
			{
				Procreation val5 = val4;
				val5.m_pregnancyChance *= 0.01f;
			}
			if (val4.m_pregnancyChance > 1f)
			{
				val4.m_pregnancyChance = 0.66f;
			}
			val4.m_pregnancyDuration = tb.pregnancyDuration;
			if (val4.m_updateInterval < 20f)
			{
				val4.m_updateInterval = 20f;
			}
			val4.m_partnerCheckRange = 4f * tb.size;
			val4.m_totalCheckRange = 10f * tb.size;
			if ((tb.egg ?? "") != "")
			{
				SetNewEgg(go, val4, tb);
			}
			else if (flag && (Object)(object)val4.m_offspring != (Object)null && !tb.offspringOverwrite)
			{
				GameObject offspring = val4.m_offspring;
				Growup component3 = offspring.GetComponent<Growup>();
				if (Object.op_Implicit((Object)(object)component3))
				{
					component3.m_growTime = tb.growTime;
				}
				else
				{
					EggGrow component4 = offspring.GetComponent<EggGrow>();
					if (Object.op_Implicit((Object)(object)component4))
					{
						Growup component5 = component4.m_grownPrefab.GetComponent<Growup>();
						if (Object.op_Implicit((Object)(object)component5))
						{
							component5.m_growTime = tb.growTime;
							DBG.blogWarning(((Object)go).name + " has egg as offspring, modified hatched prefab growtime");
						}
					}
					else
					{
						DBG.blogWarning("Failed to set grow time for " + ((Object)go).name);
					}
				}
				string name = ((Object)offspring).name;
				int stableHashCode = StringExtensionMethods.GetStableHashCode(name);
				if (zns.m_namedPrefabs.ContainsKey(stableHashCode))
				{
					DBG.blogDebug("Already has " + name + " in ObjectDB, only changing growup time");
				}
				else
				{
					DBG.blogDebug("Had to Register " + name + " in ObjectDB");
					Utils.addToZNS(offspring);
				}
				DBG.blogDebug(((Object)go).name + " already has offspring, modified tameable");
			}
			else if (((Object)go).name == "Hatchling" && LetMeTameYou.hatchlingEgg.Value)
			{
				val4.m_offspring = DrakeEggPrefab;
				DrakeEggPrefab.GetComponent<EggGrow>().m_grownPrefab = SpawnMini(go, tb.growTime);
			}
			else
			{
				val4.m_offspring = SpawnMini(go, tb.growTime);
			}
			if (ZNet.instance.IsServer() & ZNet.instance.IsDedicated())
			{
				GameObject prefab = ZNetScene.instance.GetPrefab(((Object)go).name);
				string text2 = " is not Tameable";
				if (((Behaviour)prefab.GetComponent<Tameable>()).enabled)
				{
					text2 = " is Tameable";
				}
				DBG.blogDebug("******* " + ((Object)prefab).name + text2 + " ********");
			}
		}
		else
		{
			if ((Object)(object)go.GetComponent<Procreation>() != (Object)null)
			{
				Object.DestroyImmediate((Object)(object)go.GetComponent<Procreation>());
			}
			DBG.blogDebug("Added ability to tame to " + ((Object)go).name);
		}
		if (modifiedTame.addedClasses.Count > 0)
		{
			modifiedTameList.Add(modifiedTame);
		}
	}

	public static GameObject SpawnMini(GameObject prefab, float growup_time = 1800f)
	{
		//IL_01f3: Unknown result type (might be due to invalid IL or missing references)
		//IL_01fd: Unknown result type (might be due to invalid IL or missing references)
		string text = ((Object)prefab).name;
		string text2 = (LetMeTameYou.customTamesList.TryGetValue(text, out var value) ? value.offspringName : "");
		text2 = text2.Replace("_", " ");
		bool flag = false;
		GameObject val = null;
		if (!Utility.IsNullOrWhiteSpace(value.offspringPrefab))
		{
			val = zns.GetPrefab(value.offspringPrefab);
			if ((Object)(object)val != (Object)null)
			{
				DBG.blogDebug("Found prefab:" + value.offspringPrefab);
				flag = true;
			}
			else
			{
				DBG.blogWarning("Unable to find offspring prefab of name:" + value.offspringPrefab);
			}
		}
		GameObject val2 = (flag ? val : Object.Instantiate<GameObject>(zns.GetPrefab(text), Root.transform));
		if (text.Contains("(Clone)"))
		{
			text = Utils.GetPrefabName(((Object)prefab).name);
		}
		string text3 = "$lmty_mini_prefix";
		if (!flag)
		{
			((Object)val2).name = "Mini" + text;
		}
		string name = ((Object)val2).name;
		int stableHashCode = StringExtensionMethods.GetStableHashCode(name);
		if (zns.m_namedPrefabs.ContainsKey(stableHashCode))
		{
			DBG.blogDebug("Already has " + name + " in ObjectDB, changed growup time");
			GameObject prefab2 = zns.GetPrefab(stableHashCode);
			Growup val3 = default;
			if (prefab2.TryGetComponent<Growup>(ref val3))
			{
				val3.m_growTime = growup_time;
				return prefab2;
			}
			val3 = prefab2.AddComponent<Growup>();
			DBG.blogDebug("No Growup found in " + name + " in ObjectDB, creating one");
			val3.m_grownPrefab = zns.GetPrefab(text);
			if (value != null)
			{
				val3.m_growTime = value.growTime;
			}
			else
			{
				val3.m_growTime = growup_time;
			}
			DBG.blogDebug("Created Growup");
			return prefab2;
		}
		Transform transform = val2.transform;
		transform.localScale *= 0.5f;
		Character component = val2.GetComponent<Character>();
		if ((Object)(object)component != (Object)null)
		{
			if ((text2 ?? "") == "")
			{
				text2 = text3 + " " + component.m_name;
			}
			component.m_name = text2;
		}
		component.m_flying = false;
		if ((Object)(object)val2.GetComponent<MonsterAI>() != (Object)null)
		{
			Object.DestroyImmediate((Object)(object)val2.GetComponent<MonsterAI>());
		}
		if ((Object)(object)val2.GetComponent<VisEquipment>() != (Object)null)
		{
			removeWeaponsFromSets(val2);
		}
		if ((Object)(object)val2.GetComponent<CharacterDrop>() != (Object)null)
		{
			Object.DestroyImmediate((Object)(object)val2.GetComponent<CharacterDrop>());
		}
		if ((Object)(object)val2.GetComponent<Tameable>() != (Object)null)
		{
			Object.DestroyImmediate((Object)(object)val2.GetComponent<Tameable>());
		}
		if ((Object)(object)val2.GetComponent<Procreation>() != (Object)null)
		{
			Object.DestroyImmediate((Object)(object)val2.GetComponent<Procreation>());
		}
		if ((Object)(object)val2.GetComponent<NpcTalk>() != (Object)null)
		{
			Object.DestroyImmediate((Object)(object)val2.GetComponent<NpcTalk>());
		}
		AnimalAI val4 = default;
		if (!val2.TryGetComponent<AnimalAI>(ref val4))
		{
			MonsterAI component2 = prefab.GetComponent<MonsterAI>();
			val4 = val2.AddComponent<AnimalAI>();
			((Component)(object)val4).CopyBroComponent<AnimalAI, MonsterAI>(component2);
		}
		((BaseAI)val4).m_randomFly = false;
		Growup val5 = val2.AddComponent<Growup>();
		val5.m_grownPrefab = zns.GetPrefab(text);
		if (value != null)
		{
			val5.m_growTime = value.growTime;
		}
		else
		{
			val5.m_growTime = growup_time;
		}
		if (zns.m_namedPrefabs.ContainsKey(stableHashCode))
		{
			zns.m_namedPrefabs.Remove(stableHashCode);
		}
		Utils.addToZNS(val2);
		if ((Object)(object)ZNetScene.instance.GetPrefab(((Object)val2).name) != (Object)null)
		{
			DBG.blogDebug("Successfully added Tame and Procreation to " + ((Object)prefab).name);
		}
		return val2;
	}

	private static GameObject InitEgg(GameObject prefab, LetMeTameYou.TameConfig tb, float hatchTime, int EggType = 0, string color = "default", float size = 1f)
	{
		//IL_071c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0803: Unknown result type (might be due to invalid IL or missing references)
		//IL_0808: Unknown result type (might be due to invalid IL or missing references)
		//IL_082a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0839: Unknown result type (might be due to invalid IL or missing references)
		//IL_084a: Unknown result type (might be due to invalid IL or missing references)
		//IL_084f: Unknown result type (might be due to invalid IL or missing references)
		//IL_088e: Unknown result type (might be due to invalid IL or missing references)
		//IL_089f: Unknown result type (might be due to invalid IL or missing references)
		//IL_08a1: Unknown result type (might be due to invalid IL or missing references)
		//IL_08ab: Unknown result type (might be due to invalid IL or missing references)
		//IL_08c3: Unknown result type (might be due to invalid IL or missing references)
		//IL_08c8: Unknown result type (might be due to invalid IL or missing references)
		//IL_0997: Unknown result type (might be due to invalid IL or missing references)
		//IL_099e: Expected Obj, but got Unknown
		//IL_09a9: Unknown result type (might be due to invalid IL or missing references)
		//IL_09ba: Unknown result type (might be due to invalid IL or missing references)
		//IL_09c1: Unknown result type (might be due to invalid IL or missing references)
		//IL_08d7: Unknown result type (might be due to invalid IL or missing references)
		//IL_08e8: Unknown result type (might be due to invalid IL or missing references)
		//IL_08ed: Unknown result type (might be due to invalid IL or missing references)
		DBG.blogDebug("Creating Egg");
		GameObject prefab2 = zns.GetPrefab(((Object)prefab).name + "Egg_LMTY");
		if (Object.op_Implicit((Object)(object)prefab2))
		{
			DBG.blogDebug("zns Already Egg with name " + ((Object)prefab).name + "Egg_LMTY, skipping creation");
			int stableHashCode = StringExtensionMethods.GetStableHashCode(((Object)prefab2).name);
			if (!Object.op_Implicit((Object)(object)ObjectDB.instance.GetItemPrefab(stableHashCode)))
			{
				ObjectDB.instance.m_items.Add(prefab2);
			}
			return prefab2;
		}
		bool flag = false;
		switch (EggType)
		{
		case 0:
			prefab2 = Object.Instantiate<GameObject>(DrakeEggPrefab, Root.transform);
			break;
		case 1:
			prefab2 = Object.Instantiate<GameObject>(ChickenEggPrefab, Root.transform);
			break;
		case 2:
			prefab2 = Object.Instantiate<GameObject>(AsksvinEggPrefab, Root.transform);
			break;
		default:
		{
			string text = tb.egg.Replace(")", "");
			string text2 = text.Split(new char[1] { '(' })[0];
			DBG.blogDebug("egg itemName" + text2);
			GameObject prefab3 = zns.GetPrefab(text2);
			if ((Object)(object)prefab3 == (Object)null)
			{
				DBG.blogDebug("no item found with name:" + text2 + ", skipping creation");
				return null;
			}
			cloneChickenEgg(prefab3, null, hatchTime);
			DBG.blogDebug("Cloned Chicken Egg onto: " + ((Object)prefab3).name);
			flag = true;
			prefab2 = prefab3;
			break;
		}
		}
		if (!flag)
		{
			((Object)prefab2).name = ((Object)prefab).name + "Egg_LMTY";
		}
		int stableHashCode2 = StringExtensionMethods.GetStableHashCode(((Object)prefab2).name);
		if (!Object.op_Implicit((Object)(object)ObjectDB.instance.GetItemPrefab(stableHashCode2)))
		{
			ObjectDB.instance.m_items.Add(prefab2);
		}
		ItemDrop[] components = prefab2.GetComponents<ItemDrop>();
		if (components.Length > 1)
		{
			Object.DestroyImmediate((Object)(object)components[0]);
		}
		ItemDrop component = prefab2.GetComponent<ItemDrop>();
		ItemData itemData = component.m_itemData;
		if (!flag)
		{
			Character component2 = prefab.GetComponent<Character>();
			if (Object.op_Implicit((Object)(object)component2))
			{
				itemData.m_shared.m_name = component2.m_name + " $lmty_egg";
				itemData.m_shared.m_description = "$lmty_egg_desc_prefix " + component2.m_name;
				DBG.blogDebug("char name =" + component2.m_name);
			}
			else
			{
				itemData.m_shared.m_name = ((Object)prefab).name + " $lmty_egg";
				itemData.m_shared.m_description = "$lmty_egg_desc_prefix " + ((Object)prefab).name;
			}
		}
		itemData.m_shared.m_description = itemData.m_shared.m_description.TrimEnd(new char[2] { '.', ' ' }) + ", $lmty_egg_desc_sufix";
		float num = 3f;
		if (size > 1f)
		{
			num = 2.2f;
		}
		float num2 = ((EggType != 2) ? 1 : 30);
		itemData.m_shared.m_weight = itemData.m_shared.m_weight * num2 * Mathf.Pow(size, num);
		itemData.m_shared.m_teleportable = true;
		itemData.m_dropPrefab = prefab2;
		if (ObjectDB.instance.m_itemByHash.TryGetValue(stableHashCode2, out var value))
		{
			DBG.blogDebug("Set drop prefab to object db");
			itemData.m_dropPrefab = value;
		}
		else
		{
			DBG.blogDebug("Adding to objectdb hash");
			ObjectDB.instance.m_itemByHash.Add(stableHashCode2, prefab2);
			DBG.blogDebug("Hash =" + stableHashCode2);
		}
		component.Save();
		EggGrow component3 = prefab2.GetComponent<EggGrow>();
		component3.m_growTime = hatchTime;
		bool flag2 = true;
		MonsterAI component4 = prefab.GetComponent<MonsterAI>();
		if ((Object)(object)component4 != (Object)null && component4.m_avoidLand)
		{
			component3.m_requireNearbyFire = false;
			component3.m_requireUnderRoof = false;
		}
		Procreation val = default;
		if (prefab.TryGetComponent<Procreation>(ref val) && Object.op_Implicit((Object)(object)val.m_offspring) && !tb.offspringOverwrite && !((Object)val.m_offspring).name.Contains("Egg_LMTY"))
		{
			flag2 = false;
			component3.m_grownPrefab = val.m_offspring;
			DBG.blogDebug("Copied Offspring from Parent");
			string name = ((Object)component3.m_grownPrefab).name;
			int stableHashCode3 = StringExtensionMethods.GetStableHashCode(name);
			if (zns.m_namedPrefabs.ContainsKey(stableHashCode3))
			{
				DBG.blogDebug("Egg Offspring Already has " + name + " in ObjectDB, only changing growup time");
				component3.m_grownPrefab = zns.GetPrefab(stableHashCode3);
			}
			else
			{
				DBG.blogDebug("Egg had to Register " + name + " in ObjectDB");
				Utils.addToZNS(component3.m_grownPrefab);
			}
		}
		if (flag2)
		{
			component3.m_grownPrefab = SpawnMini(prefab);
			string name2 = ((Object)component3.m_grownPrefab).name;
			int stableHashCode4 = StringExtensionMethods.GetStableHashCode(name2);
			if (zns.m_namedPrefabs.ContainsKey(stableHashCode4))
			{
				DBG.blogDebug("Create Offspring Already has " + name2 + " in ObjectDB, only changing growup time");
				component3.m_grownPrefab = zns.GetPrefab(stableHashCode4);
			}
			else
			{
				DBG.blogDebug("Egg2 had to Register " + name2 + " in ObjectDB");
				Utils.addToZNS(component3.m_grownPrefab);
			}
		}
		if ((Object)(object)ZNet.instance != (Object)null && ZNet.instance.IsDedicated())
		{
			DBG.blogDebug("Skipping texture import as is dedicated server");
			AssetBundle assetBundle = PrefabManager.getAssetBundle();
			if ((Object)(object)assetBundle == (Object)null)
			{
				DBG.blogDebug("Asset Bundle is null");
				assetBundle = Utils.LoadAssetBundle("lmty_assets", Assembly.GetExecutingAssembly());
				if ((Object)(object)assetBundle == (Object)null)
				{
					DBG.blogDebug("Asset Bundle is still null");
				}
			}
			else
			{
				string[] allAssetNames = assetBundle.GetAllAssetNames();
				foreach (string text3 in allAssetNames)
				{
					DBG.blogDebug("Bundle asset: '" + text3 + "'");
				}
				PrefabManager.setAssetBundle(assetBundle);
			}
		}
		else if (!flag)
		{
			GameObject val2 = ((EggType != 0) ? ((Component)((Component)prefab2.transform.Find("attach").Find("default")).transform).gameObject : ((Component)((Component)prefab2.transform.Find("attach").Find("model")).transform).gameObject);
			if (size != 1f)
			{
				prefab2.transform.Find("attach").localScale = new Vector3(size, size, size);
				LODGroup component5 = val2.GetComponent<LODGroup>();
				if (Object.op_Implicit((Object)(object)component5))
				{
					component5.size = Mathf.Max(9.3f - 2.14f * size, 5f);
				}
				DBG.blogDebug("Changed Size");
			}
			if (color != "default")
			{
				DBG.blogDebug("changing color");
				Material material = ((Renderer)val2.GetComponent<MeshRenderer>()).material;
				if ((Object)(object)material == (Object)null)
				{
					DBG.blogDebug("Material is Null for model:");
					DBG.blogDebug("model name is:" + ((Object)val2).name);
				}
				if (color.Length == 7 && color[0] == '#')
				{
					DBG.blogDebug("attempting hex for " + color);
					Color val3 = Utils.colFromHex(color);
					string text4 = "NewChickenEgg";
					switch (EggType)
					{
					case 0:
					{
						material.color = val3;
						material.SetColor("_EmissionColor", val3 * new Color(1f, 3f, 1f));
						text4 = "NewDragonEgg";
						Light component6 = ((Component)((Component)prefab2.transform.Find("attach").Find("Point light")).transform).gameObject.GetComponent<Light>();
						component6.color = val3;
						break;
					}
					case 1:
						material.color = 1.2f * val3 * new Color(0.9f * val3.r - 0.1f, 0.95f, 1.3f);
						break;
					default:
						material.color = val3 * new Color(1.1f, 1f, 1.1f);
						text4 = "NewRockyEgg";
						break;
					}
					DBG.blogDebug("chose egg as:" + text4);
					bool flag3 = true;
					AssetBundle val4 = PrefabManager.getAssetBundle();
					if ((Object)(object)val4 == (Object)null)
					{
						DBG.blogDebug("Asset Bundle is null");
						val4 = Utils.LoadAssetBundle("lmty_assets", Assembly.GetExecutingAssembly());
						if ((Object)(object)val4 == (Object)null)
						{
							DBG.blogDebug("Asset Bundle is still null");
							flag3 = false;
						}
					}
					if (flag3)
					{
						string text5 = ("assets/lmty/" + text4 + ".png").ToLower();
						Object[] array = val4.LoadAssetWithSubAssets(text5);
						Sprite val5 = (Sprite)array[1];
						Texture2D texture = val5.texture;
						texture = Utils.changeEggTex(texture, val3, EggType == 0);
						Sprite val6 = Sprite.Create(texture, val5.rect, val5.pivot);
						itemData.m_shared.m_icons[0] = val6;
					}
				}
				else
				{
					DBG.blogWarning("Not correctly formatted as HEX color");
				}
			}
			else
			{
				DBG.blogDebug("Keeping color default");
			}
		}
		else
		{
			DBG.blogDebug("Using default item, no changes");
		}
		try
		{
			Utils.addToZNS(prefab2);
			DBG.blogInfo("Succesfully registered " + ((Object)prefab2).name);
		}
		catch
		{
			DBG.blogInfo("Already Registered " + ((Object)prefab2).name);
		}
		return prefab2;
	}

	private static void SetNewEgg(GameObject go, Procreation proc, LetMeTameYou.TameConfig tb)
	{
		int EggType = 3;
		float hatchtime = 1800f;
		string colorstr = "default";
		float size = 1f;
		parseEggValue(tb.egg, ref EggType, ref hatchtime, ref colorstr, ref size);
		GameObject offspring = InitEgg(go, tb, hatchtime, EggType, colorstr, size);
		if ((Object)(object)proc != (Object)null)
		{
			proc.m_offspring = offspring;
		}
	}

	public static void parseEggValue(string eggStr, ref int EggType, ref float hatchtime, ref string colorstr, ref float size)
	{
		string text = eggStr.Replace(")", "");
		string[] array = text.Split(new char[1] { '(' });
		if (array[0].ToLower() == "chicken")
		{
			EggType = 1;
		}
		else if (array[0].ToLower() == "drake")
		{
			EggType = 0;
		}
		else if (array[0].ToLower() == "asksvin")
		{
			EggType = 2;
		}
		if (array.Length < 2)
		{
			return;
		}
		string[] array2 = array[1].Split(new char[1] { ':' });
		try
		{
			hatchtime = float.Parse(array2[0], CultureInfo.InvariantCulture.NumberFormat);
		}
		catch
		{
			DBG.blogWarning("value for egg hatchtime, make sure the config is written correctly");
		}
		if (array2.Length < 2)
		{
			return;
		}
		colorstr = array2[1];
		if (array2.Length < 3)
		{
			return;
		}
		try
		{
			size = float.Parse(array2[2], CultureInfo.InvariantCulture.NumberFormat);
		}
		catch
		{
			DBG.blogWarning("value for egg is invalid, make sure the config is written correctly");
		}
	}

	private static void MakeItemEgg(GameObject item_go, GameObject grownPrefab)
	{
		ItemDrop component = item_go.GetComponent<ItemDrop>();
		if ((Object)(object)component == (Object)null)
		{
			DBG.blogDebug("Item:" + ((Object)item_go).name + " does not have an ItemDrop");
			return;
		}
		if (!AlteredBaseEggs)
		{
			AlterEggs();
		}
		component.m_itemData.m_shared.m_maxQuality = 50;
		component.SetQuality(0);
		component.m_autoPickup = false;
		component.m_itemData.m_shared.m_maxStackSize = 20;
	}

	private static void RemoveBossAndAggravateable(BaseAI baseAI)
	{
		Character character = baseAI.m_character;
		if (!Object.op_Implicit((Object)(object)character) || baseAI.m_nview.GetZDO() == null)
		{
			return;
		}
		if (character.m_tamed)
		{
			baseAI.m_aggravatable = false;
			if (character.m_boss)
			{
				DBG.blogDebug("setting boss to not boss");
				baseAI.SetAlerted(false);
				character.m_dontHideBossHud = false;
				EnemyHud.instance.LateUpdate();
				character.m_boss = false;
			}
		}
		else if (character.m_boss)
		{
			baseAI.SetAlerted(true);
		}
	}

	public static void removeWeaponsFromSets(GameObject go)
	{
		DBG.blogDebug("in removeWeapons");
		Humanoid component = go.GetComponent<Humanoid>();
		if (!Object.op_Implicit((Object)(object)component))
		{
			return;
		}
		component.m_utilityItem = null;
		component.m_randomWeapon = null;
		ItemSet[] randomSets = component.m_randomSets;
		List<ItemType> list = new List<ItemType>();
		list.Add((ItemType)6);
		list.Add((ItemType)7);
		list.Add((ItemType)10);
		list.Add((ItemType)12);
		list.Add((ItemType)11);
		list.Add((ItemType)17);
		if (randomSets != null)
		{
			ItemSet[] array = randomSets;
			foreach (ItemSet val in array)
			{
				if (val != null)
				{
					val.m_items = cleanedSet(val.m_items, list);
				}
			}
		}
		if (component.m_defaultItems != null)
		{
			component.m_defaultItems = cleanedSet(component.m_defaultItems, list);
		}
	}

	public static GameObject[] cleanedSet(GameObject[] dirtySet, List<ItemType> keepList)
	{
		//IL_0042: Unknown result type (might be due to invalid IL or missing references)
		List<GameObject> list = new List<GameObject>();
		list.AddRange(dirtySet);
		ItemDrop val2 = default;
		for (int num = list.Count - 1; num >= 0; num--)
		{
			GameObject val = list[num];
			if (val.TryGetComponent<ItemDrop>(ref val2))
			{
				SharedData shared = val2.m_itemData.m_shared;
				if (!keepList.Contains(shared.m_itemType))
				{
					list.Remove(val);
				}
			}
		}
		return list.ToArray();
	}

	public static void CloneAnimalAI(GameObject go)
	{
		if ((Object)(object)go.GetComponent<LMTY_AnimalAI>() == (Object)null)
		{
			DBG.blogDebug("Fixing AI for " + ((Object)go).name);
			MonsterAI component = zns.GetPrefab("Boar").GetComponent<MonsterAI>();
			Humanoid val = default;
			if (!go.TryGetComponent<Humanoid>(ref val))
			{
				val = go.AddComponent<Humanoid>();
				((Character)val).m_eye = go.transform.GetChild(0);
			}
			AnimalAI component2 = go.GetComponent<AnimalAI>();
			Character component3 = go.GetComponent<Character>();
			LMTY_AnimalAI lMTY_AnimalAI = go.AddComponent<LMTY_AnimalAI>();
			Utils.cloneProperties<LMTY_AnimalAI, MonsterAI>(lMTY_AnimalAI, component);
			Utils.cloneProperties<LMTY_AnimalAI, AnimalAI>(lMTY_AnimalAI, component2);
			Utils.cloneProperties<Humanoid, Character>(val, component3);
			((BaseAI)lMTY_AnimalAI).m_character = (Character)(object)val;
			if (((BaseAI)lMTY_AnimalAI).m_randomMoveInterval > 30f)
			{
				((BaseAI)lMTY_AnimalAI).m_randomMoveInterval = 30f;
			}
			Object.DestroyImmediate((Object)(object)go.GetComponent<AnimalAI>());
			Object.DestroyImmediate((Object)(object)go.GetComponent<Character>());
		}
	}

	private static void AlterEggs()
	{
		DBG.blogDebug("Alter Eggs");
		DBG.tryblogDebug("Chicken Egg=" + ((Object)(object)ChickenEggPrefab != (Object)null), "failed Chicken");
		DBG.tryblogDebug("Asksvin Egg=" + ((Object)(object)AsksvinEggPrefab != (Object)null), "failed Asksvin");
		DBG.tryblogDebug("Dragon Egg=" + ((Object)(object)DrakeEggPrefab != (Object)null), "failed Drake");
		if (!AlteredBaseEggs)
		{
			ItemDrop component = ChickenEggPrefab.GetComponent<ItemDrop>();
			component.m_itemData.m_shared.m_maxQuality = 50;
			component.SetQuality(0);
			component.m_autoPickup = false;
			component.m_itemData.m_shared.m_maxStackSize = 20;
			ItemDrop component2 = AsksvinEggPrefab.GetComponent<ItemDrop>();
			component2.m_itemData.m_shared.m_maxQuality = 50;
			component2.SetQuality(0);
			component2.m_autoPickup = false;
			component2.m_itemData.m_shared.m_maxStackSize = 20;
			ItemDrop component3 = DrakeEggPrefab.GetComponent<ItemDrop>();
			component3.m_itemData.m_shared.m_maxQuality = 50;
			component3.SetQuality(0);
			component3.m_autoPickup = false;
			component3.m_itemData.m_shared.m_maxStackSize = 20;
			AlteredBaseEggs = true;
		}
		if (LetMeTameYou.hatchlingEgg.Value && OverwroteDragonEgg)
		{
			DBG.blogDebug("Skipping modify Dragon egg as already correct setting");
		}
		else if (!LetMeTameYou.hatchlingEgg.Value && OverwroteDragonEgg)
		{
			DBG.blogDebug("in 1");
			SetCustDragonEgg();
			GameObject val = zns.m_prefabs.Find((GameObject x) => ((Object)x).name == "DragonEgg");
			EggGrow val2 = default;
			if (val.TryGetComponent<EggGrow>(ref val2))
			{
				Object.DestroyImmediate((Object)(object)val2);
				DBG.blogDebug("Destroyed EggGrow");
			}
			Transform val3 = val.transform.Find("Not Growing");
			if ((Object)(object)val3 != (Object)null)
			{
				Object.DestroyImmediate((Object)(object)((Component)val3).gameObject);
				DBG.blogDebug("Destroyed Not Growing");
			}
			OverwroteDragonEgg = false;
		}
		else if (!LetMeTameYou.hatchlingEgg.Value && !OverwroteDragonEgg)
		{
			DBG.blogDebug("in 3");
			SetCustDragonEgg();
		}
		else
		{
			DBG.blogDebug("in 2");
			DrakeEggPrefab = zns.m_prefabs.Find((GameObject x) => ((Object)x).name == "DragonEgg");
			OverwroteDragonEgg = true;
			cloneChickenEgg(DrakeEggPrefab, zns.m_prefabs.Find((GameObject x) => ((Object)x).name == "Hatchling"), LetMeTameYou.hatchingTime.Value);
		}
	}

	private static void SetCustDragonEgg()
	{
		if ((Object)(object)CustDrakeEggPrefab == (Object)null)
		{
			CustDrakeEggPrefab = Object.Instantiate<GameObject>(DrakeEggPrefab, Root.transform);
		}
		DrakeEggPrefab = CustDrakeEggPrefab;
		EggGrow component = DrakeEggPrefab.GetComponent<EggGrow>();
		if ((Object)(object)component == (Object)null)
		{
			cloneChickenEgg(DrakeEggPrefab, zns.m_prefabs.Find((GameObject x) => ((Object)x).name == "Hatchling"), LetMeTameYou.hatchingTime.Value);
		}
		else
		{
			component.m_growTime = LetMeTameYou.hatchingTime.Value;
		}
	}

	private static void cloneChickenEgg(GameObject destination_go, GameObject growPrefab, float hatchingTime)
	{
		if ((Object)(object)destination_go == (Object)null)
		{
			DBG.blogDebug("No valid item");
			return;
		}
		if ((Object)(object)destination_go.GetComponent<EggGrow>() != (Object)null)
		{
			DBG.blogDebug("Already added EggGrow To " + ((Object)destination_go).name + ", skipping");
			return;
		}
		DBG.blogDebug("cloning chicken");
		Transform val = Root.transform.Find("chickenEggClone_at");
		if (!Object.op_Implicit((Object)(object)val))
		{
			val = Object.Instantiate<GameObject>(ChickenEggPrefab, Root.transform).transform;
			((Object)val).name = "chickenEggClone_at";
		}
		DBG.blogDebug("cloned chiken=" + ((Object)(object)val != (Object)null));
		GameObject gameObject = ((Component)Utils.CopyIntoParent<Transform>(val.Find("Not Growing"), destination_go.transform)).gameObject;
		EggGrow val2 = destination_go.AddComponent<EggGrow>(((Component)val).GetComponent<EggGrow>());
		val2.m_notGrowingObject = gameObject;
		val2.m_growTime = hatchingTime;
		val2.m_tamed = true;
		((Component)val2).tag = "spawned";
		val2.m_grownPrefab = growPrefab;
		DBG.blogDebug("Added EggGrow To " + ((Object)destination_go).name);
	}

	private static void InitBaseObjects(ObjectDB oDB)
	{
		//IL_012c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0136: Expected Obj, but got Unknown
		DBG.blogWarning("Init Base Objects");
		if (hasInitBaseObj)
		{
			DBG.blogWarning("Already Init Base Objects");
			return;
		}
		if (Object.op_Implicit((Object)(object)oDB))
		{
			DBG.blogWarning("Setting new zns");
			zns = ((Component)oDB).gameObject.GetComponent<ZNetScene>();
		}
		else
		{
			DBG.blogWarning("odb null");
			if (!Object.op_Implicit((Object)(object)zns))
			{
				DBG.blogWarning("zns also null");
				return;
			}
		}
		if (!Object.op_Implicit((Object)(object)zns))
		{
			DBG.blogWarning("zns null");
			return;
		}
		DBG.blogWarning("prefab size=" + zns.m_prefabs.Count);
		wtame = zns.m_prefabs.Find((GameObject x) => ((Object)x).name == "Wolf").GetComponent<Tameable>();
		if ((Object)(object)wtame != (Object)null)
		{
			createHeartEffect();
		}
		else
		{
			DBG.blogWarning("Wolf tame is null, creating null pet effect");
			heartEffectGO = new GameObject("failedHeartEffect");
			heartEffectGO.transform.parent = Root.transform;
			Object.DontDestroyOnLoad((Object)(object)heartEffectGO);
		}
		ChickenEggPrefab = zns.m_prefabs.Find((GameObject x) => ((Object)x).name == "ChickenEgg");
		DrakeEggPrefab = zns.m_prefabs.Find((GameObject x) => ((Object)x).name == "DragonEgg");
		AsksvinEggPrefab = zns.m_prefabs.Find((GameObject x) => ((Object)x).name == "AsksvinEgg");
		PrefabManager.FixShaders(((Component)PrefabManager.TameStickPrefab.transform.GetChild(0)).gameObject);
		hasInitBaseObj = true;
	}

	public static void createHeartEffect()
	{
		//IL_00bd: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c7: Expected Obj, but got Unknown
		DBG.blogDebug("Making HeartEffect");
		bool flag = false;
		if ((Object)(object)wtame == (Object)null)
		{
			DBG.blogWarning("wolf tame is null");
			flag = true;
		}
		if ((Object)(object)Root == (Object)null)
		{
			DBG.blogWarning("Root is null");
		}
		if (!flag)
		{
			DBG.blogDebug("has Wolf");
			heartEffectGO = Object.Instantiate<GameObject>(wtame.m_petEffect.m_effectPrefabs[0].m_prefab, Root.transform);
			DBG.blogDebug("removing child");
			heartEffectGO.transform.GetChild(1).parent = null;
			heartEffectGO.SetActive(false);
		}
		else
		{
			heartEffectGO = new GameObject("failed2HeartEffect");
			heartEffectGO.transform.parent = Root.transform;
		}
		DBG.blogDebug("Created HeartEffect");
	}

	public static void resetTameManager()
	{
		RequiredTamingKeys.Clear();
		TamedAttackVariants.Clear();
		clearTameClasses();
		hasInitTames = false;
	}

	public static bool hasTamingKeysAndLevel(Tameable tameable)
	{
		if (maxtamingLvl > 0 && tameable.m_character.GetLevel() > maxtamingLvl)
		{
			return false;
		}
		string key = ((Object)tameable).name.Replace("(Clone)", "");
		if (RequiredTamingKeys.TryGetValue(key, out var value))
		{
			bool flag = true;
			foreach (string item in value)
			{
				if (!ZoneSystem.instance.CheckKey(item, (GameKeyType)0, true))
				{
					flag = false;
				}
			}
			if (!flag)
			{
				return false;
			}
		}
		return true;
	}

	[HarmonyPatch(typeof(Character), "RPC_Heal")]
	[HarmonyPrefix]
	private static void Prefix(out bool __state, long sender, float hp, ref bool showText)
	{
		__state = showText;
		if (hp < 0.1f)
		{
			showText = false;
		}
	}

	[HarmonyPatch(typeof(MonsterAI), "UpdateConsumeItem")]
	[HarmonyPrefix]
	private static bool Prefix(MonsterAI __instance, Humanoid humanoid, ref bool __result)
	{
		if (((Character)humanoid).m_tamed)
		{
			return true;
		}
		Tameable tamable = ((BaseAI)__instance).m_tamable;
		if ((Object)(object)tamable == (Object)null)
		{
			return true;
		}
		__result = hasTamingKeysAndLevel(tamable);
		if (!__result)
		{
			tamable.m_nview.GetZDO().Set(ZDOVars.s_tameLastFeeding, 0L);
			tamable.m_nview.GetZDO().Set(ZDOVars.s_tameTimeLeft, tamable.m_tamingTime);
			return false;
		}
		return true;
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Tameable), "Tame")]
	private static void Postfix_Tame(Tameable __instance)
	{
		__instance.m_fedDuration *= LetMeTameYou.TamedFedMultiplier.Value;
		RemoveBossAndAggravateable((BaseAI)(object)__instance.m_monsterAI);
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Character), "SetTamed")]
	private static void Postfix_SetTame(Character __instance, bool tamed)
	{
		if (tamed && !((Object)(object)__instance.m_baseAI == (Object)null))
		{
			RemoveBossAndAggravateable(__instance.m_baseAI);
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(BaseAI), "Awake")]
	private static void PostfixBaseAIFindEnemy(BaseAI __instance)
	{
		RemoveBossAndAggravateable(__instance);
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(ObjectDB), "CopyOtherDB")]
	private static void Prefix_ObjectDB_CopyOther(ObjectDB __instance, ObjectDB other)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0007: Invalid comparison between Unknown and I4
		if ((int)SystemInfo.graphicsDeviceType == 4)
		{
			DBG.blogDebug("Skipping loading objects as this is a dedicated server");
			return;
		}
		InitBaseObjects(other);
		if ((Object)(object)other != (Object)null && ((Object)other).name == "_NetScene")
		{
			Utils.addItemToODB(PrefabManager.TameStickPrefab, other);
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(ZNetScene), "Awake")]
	private static void PostFix_ZNetScene_Awake(ObjectDB __instance)
	{
		if ((Object)(object)ZNet.instance != (Object)null && ZNet.instance.IsDedicated())
		{
			DBG.blogDebug("Skipping Creature Setup as is dedicated server");
		}
		else
		{
			SetupAllCreatures();
		}
	}

	[HarmonyPatch(typeof(ObjectDB), "Awake")]
	[HarmonyPostfix]
	[HarmonyPriority(5)]
	private static void Postfix_ODB_Awake(ObjectDB __instance)
	{
		//IL_0026: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		DBG.blogDebug("In main Load");
		if (!LetMeTameYou.localizeLoaded)
		{
			Localizer.Load();
			LetMeTameYou.localizeLoaded = true;
		}
		Scene activeScene = SceneManager.GetActiveScene();
		if (activeScene.name != "main")
		{
			DBG.blogDebug("Not Main Scene");
			return;
		}
		if (!Object.op_Implicit((Object)(object)ZNet.instance))
		{
			DBG.blogDebug("No instance of ZNet");
			return;
		}
		if (!ZNet.instance.IsServer())
		{
			DBG.blogDebug("ZNet not server");
			return;
		}
		DBG.blogDebug("Copying Creature Prefabs for Procreation");
		if (LetMeTameYou.customTamesList.Count() < 1)
		{
			DBG.blogDebug("Grabing creature config again");
			YAMLReadWrite.UseFileOpenReadTextWithSystemTextYaml();
			if (LetMeTameYou.customTamesList.Count() < 1)
			{
				DBG.blogWarning("Failed second attempt at setting the tamelist, all tames may not work");
			}
		}
		if ((Object)(object)ZNet.instance != (Object)null && ZNet.instance.IsDedicated())
		{
			DBG.blogDebug("Skipping loading in items as is dedicated server");
			return;
		}
		if (!hasInitTames)
		{
			zns = ((Component)__instance).gameObject.GetComponent<ZNetScene>();
			LoadInCreatures(LetMeTameYou.customTamesList);
		}
		PrefabManager.ItemReg();
	}
}
