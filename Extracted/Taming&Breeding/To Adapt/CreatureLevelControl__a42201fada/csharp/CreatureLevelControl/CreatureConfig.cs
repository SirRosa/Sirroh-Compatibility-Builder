using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Runtime.CompilerServices;
using BepInEx.Configuration;
using ServerSync;
using UnityEngine;

namespace CreatureLevelControl;

[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
public class CreatureConfig
{
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	[Flags]
	public enum CreatureMode
	{
		Default = 0,
		Tamed = 1,
		Day = 2,
		Night = 4,
		Dungeon = 8,
		Override = 0x10
	}

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	public struct CreatureFilter : IComparable
	{
		public CreatureMode Mode;

		[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1 })]
		public Dictionary<string, bool> GlobalKeys;

		private string globalKeys()
		{
			return "Globalkeys " + string.Join(", ", GlobalKeys.Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (KeyValuePair<string, bool> kv) => (kv.Value ? "" : "!") + kv.Key));
		}

		public override string ToString()
		{
			if (Mode == CreatureMode.Default)
			{
				return globalKeys();
			}
			return (GlobalKeys == null) ? Mode.ToString() : $"{Mode}, {globalKeys()}";
		}

		public int CompareTo(object obj)
		{
			if (obj is CreatureFilter creatureFilter)
			{
				int num = 0;
				if ((Mode & CreatureMode.Override) == 0 == ((creatureFilter.Mode & CreatureMode.Override) == 0))
				{
					if (GlobalKeys == null != (creatureFilter.GlobalKeys == null))
					{
						return (GlobalKeys == null) ? 1 : (-1);
					}
					if (GlobalKeys != null && GlobalKeys.Count != creatureFilter.GlobalKeys.Count)
					{
						return (GlobalKeys.Count <= creatureFilter.GlobalKeys.Count) ? 1 : (-1);
					}
				}
				CreatureMode[] modePriorities = CreatureConfig.modePriorities;
				foreach (CreatureMode creatureMode in modePriorities)
				{
					if ((Mode & creatureMode) == 0 != ((creatureFilter.Mode & creatureMode) == 0))
					{
						return ((Mode & creatureMode) == 0) ? 1 : (-1);
					}
					if (num == 0 && (Mode & creatureMode) != (creatureFilter.Mode & creatureMode))
					{
						num = ((Mode >= creatureFilter.Mode) ? 1 : (-1));
					}
				}
				if (num == 0 && GlobalKeys != null && creatureFilter.GlobalKeys != null)
				{
					List<KeyValuePair<string, bool>> list = GlobalKeys.OrderBy([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (KeyValuePair<string, bool> kv) => kv.Key).ToList();
					List<KeyValuePair<string, bool>> list2 = creatureFilter.GlobalKeys.OrderBy([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (KeyValuePair<string, bool> kv) => kv.Key).ToList();
					for (int num2 = 0; num2 < list.Count; num2++)
					{
						int num3 = string.Compare(list[num2].Key, list2[num2].Key, StringComparison.Ordinal);
						if (num3 != 0)
						{
							return num3;
						}
						if (list[num2].Value != list2[num2].Value)
						{
							return (!list[num2].Value) ? 1 : (-1);
						}
					}
				}
				return num;
			}
			return 1;
		}
	}

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	public class ConfigFile : global::CreatureLevelControl.ConfigFile
	{
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
		private delegate void Assigner<[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] T>(ref T current, T input);

		private readonly Dictionary<string, CreatureConfig> configs = new Dictionary<string, CreatureConfig>();

		private static List<string> prefabLocalizations(Character prefab)
		{
			return new List<string>
			{
				((Object)prefab).name.ToLower(),
				prefab.m_name.ToLower(),
				Localization.instance.Localize(prefab.m_name).ToLower(),
				CreatureLevelControl.englishLocalization.Localize(prefab.m_name).ToLower()
			};
		}

		private static List<string> biomeLocalizations(Biome biome)
		{
			return new string[3]
			{
				((object)biome/*cast due to constrained. prefix*/).ToString().ToLower(),
				Localization.instance.Localize("$biome_" + ((object)biome/*cast due to constrained. prefix*/).ToString().ToLower()).ToLower(),
				CreatureLevelControl.englishLocalization.Localize("$biome_" + ((object)biome/*cast due to constrained. prefix*/).ToString().ToLower()).ToLower()
			}.Distinct().ToList();
		}

		public Dictionary<string, CreatureConfig> Process()
		{
			//IL_00d6: Unknown result type (might be due to invalid IL or missing references)
			//IL_00db: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f3: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fa: Unknown result type (might be due to invalid IL or missing references)
			//IL_010e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0122: Unknown result type (might be due to invalid IL or missing references)
			//IL_020e: Unknown result type (might be due to invalid IL or missing references)
			Dictionary<string, CreatureConfig> dictionary = new Dictionary<string, CreatureConfig>();
			Biome[] array = new Biome[9];
			RuntimeHelpers.InitializeArray(array, __ldtoken(_003CPrivateImplementationDetails_003E._282D7DADBC8D83058F27F643DD45562180980A4F78F6051024C3EA1AE2AF2D81));
			Biome[] biomeOrder = array;
			biomeOrder = biomeOrder.Concat(knownBiomes.Where((Biome b) =>
			{
				//IL_0006: Unknown result type (might be due to invalid IL or missing references)
				return !Enumerable.Contains(biomeOrder, b);
			})).ToArray();
			Dictionary<Biome, List<GameObject>> dictionary2 = new Dictionary<Biome, List<GameObject>>();
			SpawnSystem component = ZNetScene.instance.GetPrefab("_ZoneCtrl").GetComponent<SpawnSystem>();
			foreach (IGrouping<string, SpawnData> item in component.m_spawnLists.SelectMany([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (SpawnSystemList s) => from p in s.m_spawners
				where p.m_requiredGlobalKey == "" && Object.op_Implicit((Object)(object)p.m_prefab.gameObject.GetComponent<Character>())
				group p by ((Object)p.m_prefab).name))
			{
				Biome val = item.Aggregate((Biome)0, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (Biome a, SpawnData p) =>
				{
					//IL_0000: Unknown result type (might be due to invalid IL or missing references)
					//IL_0002: Unknown result type (might be due to invalid IL or missing references)
					//IL_0007: Unknown result type (might be due to invalid IL or missing references)
					return (Biome)(a | p.m_biome);
				});
				Biome[] array2 = biomeOrder;
				foreach (Biome val2 in array2)
				{
					if (((Enum)val).HasFlag((Enum)(object)val2))
					{
						if (!dictionary2.TryGetValue(val2, out var value))
						{
							List<GameObject> list = (dictionary2[val2] = new List<GameObject>());
							value = list;
						}
						value.Add(item.First().m_prefab);
						break;
					}
				}
			}
			averageBiomeCreatureHealth = dictionary2.ToDictionary([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (KeyValuePair<Biome, List<GameObject>> kv) =>
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				return kv.Key;
			}, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (KeyValuePair<Biome, List<GameObject>> kv) => Mathf.CeilToInt(kv.Value.Average([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (GameObject prefab) => prefab.GetComponent<Character>().m_health)));
			foreach (KeyValuePair<Biome, List<GameObject>> item2 in dictionary2)
			{
				List<string> value2 = item2.Value.SelectMany([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (GameObject prefab) => prefabLocalizations(prefab.GetComponent<Character>())).ToList();
				foreach (string item3 in from biomeName in biomeLocalizations(item2.Key)
					where !groups.ContainsKey(biomeName)
					select biomeName)
				{
					groups[item3] = value2;
				}
			}
			foreach (Character item4 in from p in ZNetScene.instance.m_prefabs
				select p.GetComponent<Character>() into c
				where Object.op_Implicit((Object)(object)c) && !c.IsPlayer()
				select c)
			{
				List<string> list3 = prefabLocalizations(item4);
				string[] array3 = list3.ToArray();
				foreach (string name in array3)
				{
					resolveGroupsForName(list3, name);
				}
				list3.Add(item4.IsBoss() ? "boss" : "creature");
				list3.Add("all");
				foreach (string item5 in list3)
				{
					if (configs.TryGetValue(item5, out var value3))
					{
						if (!dictionary.TryGetValue(item4.m_name, out var value4))
						{
							CreatureConfig creatureConfig = (dictionary[item4.m_name] = new CreatureConfig());
							value4 = creatureConfig;
						}
						AssignCreatureModeConfig<Dictionary<int, float[]>>(AssignConfig, value4.worldLevelToStars, value3.worldLevelToStars);
						AssignCreatureModeConfigStruct<float>(value4.sizeScalingFactor, value3.sizeScalingFactor);
						AssignCreatureModeConfig<Dictionary<int, float[]>>(AssignConfig, value4.baseHealth, value3.baseHealth);
						AssignCreatureModeConfig<Dictionary<int, float?>>(AssignConfig, value4.healthGainPerStar, value3.healthGainPerStar);
						AssignCreatureModeConfig<Dictionary<int, Dictionary<CreatureLevelControl.ModifyDamage, float[]>>>(AssignConfig, value4.baseDamage, value3.baseDamage);
						AssignCreatureModeConfig<Dictionary<int, float?>>(AssignConfig, value4.damageGainPerStar, value3.damageGainPerStar);
						AssignCreatureModeConfig<Dictionary<int, float?>>(AssignConfig, value4.attackSpeedGainPerStar, value3.attackSpeedGainPerStar);
						AssignCreatureModeConfig<Dictionary<int, float?>>(AssignConfig, value4.movementSpeedGainPerStar, value3.movementSpeedGainPerStar);
						AssignCreatureModeConfig<Dictionary<int, float[]>>(AssignConfig, value4.baseMovementSpeed, value3.baseMovementSpeed);
						AssignCreatureModeConfig<Dictionary<int, float[]>>(AssignConfig, value4.baseAttackSpeed, value3.baseAttackSpeed);
						AssignCreatureModeConfig<Dictionary<int, float[]>>(AssignConfig, value4.spawnAmount, value3.spawnAmount);
						AssignCreatureModeConfig<Dictionary<int, float[]>>(AssignConfig, value4.sectorCount, value3.sectorCount);
						AssignCreatureModeConfig<Dictionary<int, float[]>>(AssignConfig, value4.sectorStars, value3.sectorStars);
						AssignCreatureModeConfig<Dictionary<int, float[]>>(AssignConfig, value4.worldLevelToLootAmount, value3.worldLevelToLootAmount);
						AssignCreatureModeConfig<Dictionary<int, float?>>(AssignConfig, value4.worldLevelToLootPerStar, value3.worldLevelToLootPerStar);
						AssignCreatureModeConfig<Dictionary<int, Dictionary<CreatureExtraEffect, float[]>>>(AssignEnumConfig, value4.worldLevelToCreatureEffect, value3.worldLevelToCreatureEffect);
						AssignCreatureModeConfig<Dictionary<int, Dictionary<CreatureExtraEffect, float[]>>>(AssignEnumConfig, value4.worldLevelToCreatureEffectFactor, value3.worldLevelToCreatureEffectFactor);
						AssignEnumConfig(ref value4.worldLevelToBoss, value3.worldLevelToBoss);
						AssignEnumConfig(ref value4.worldLevelToBossAffixFactor, value3.worldLevelToBossAffixFactor);
						AssignCreatureModeConfig<Dictionary<int, Dictionary<CreatureInfusion, float[]>>>(AssignEnumConfig, value4.worldLevelToInfusion, value3.worldLevelToInfusion);
						AssignCreatureModeConfig<Dictionary<int, Dictionary<CreatureLevelControl.ModifyDamage, float[]>>>(AssignEnumConfig, value4.worldLevelToDamageTakenModifier, value3.worldLevelToDamageTakenModifier);
					}
				}
				if (dictionary.TryGetValue(item4.m_name, out var value5))
				{
					fillModeWorldLevels<float[]>(value5.worldLevelToStars);
					fillModeWorldLevels<Dictionary<CreatureExtraEffect, float[]>>(value5.worldLevelToCreatureEffect);
					fillModeWorldLevels<Dictionary<CreatureExtraEffect, float[]>>(value5.worldLevelToCreatureEffectFactor);
					fillWorldLevels(value5.worldLevelToBoss);
					fillWorldLevels(value5.worldLevelToBossAffixFactor);
					fillModeWorldLevels<Dictionary<CreatureInfusion, float[]>>(value5.worldLevelToInfusion);
					fillModeWorldLevels<Dictionary<CreatureLevelControl.ModifyDamage, float[]>>(value5.worldLevelToDamageTakenModifier);
					fillModeWorldLevels<float[]>(value5.baseHealth);
					fillModeWorldLevels<float?>(value5.healthGainPerStar);
					fillModeWorldLevels<Dictionary<CreatureLevelControl.ModifyDamage, float[]>>(value5.baseDamage);
					fillModeWorldLevels<float?>(value5.damageGainPerStar);
					fillModeWorldLevels<float[]>(value5.baseMovementSpeed);
					fillModeWorldLevels<float?>(value5.movementSpeedGainPerStar);
					fillModeWorldLevels<float[]>(value5.baseAttackSpeed);
					fillModeWorldLevels<float?>(value5.attackSpeedGainPerStar);
					fillModeWorldLevels<float[]>(value5.spawnAmount);
					fillModeWorldLevels<float[]>(value5.sectorCount);
					fillModeWorldLevels<float[]>(value5.sectorStars);
					fillModeWorldLevels<float[]>(value5.worldLevelToLootAmount);
					fillModeWorldLevels<float?>(value5.worldLevelToLootPerStar);
				}
			}
			return dictionary;
			static void AssignCreatureModeConfig<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0 })] Assigner<T> assigner, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0 })] SortedDictionary<CreatureFilter, T> newConfig, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0 })] SortedDictionary<CreatureFilter, T> inConfig) where T : class
			{
				foreach (CreatureFilter item6 in newConfig.Keys.Concat(inConfig.Keys).ToList())
				{
					T value8;
					if (!newConfig.TryGetValue(item6, out var value6))
					{
						if (inConfig.TryGetValue(item6, out var value7))
						{
							newConfig[item6] = value7;
						}
					}
					else if (inConfig.TryGetValue(item6, out value8))
					{
						assigner(ref value6, value8);
						newConfig[item6] = value6;
					}
				}
			}
			static void AssignCreatureModeConfigStruct<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0 })] SortedDictionary<CreatureFilter, T> newConfig, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0 })] SortedDictionary<CreatureFilter, T> inConfig) where T : struct
			{
				foreach (CreatureFilter item7 in newConfig.Keys.Concat(inConfig.Keys).ToList())
				{
					if (!newConfig.ContainsKey(item7) && inConfig.TryGetValue(item7, out var value6))
					{
						newConfig[item7] = value6;
					}
				}
			}
			void fillModeWorldLevels<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 0 })] SortedDictionary<CreatureFilter, Dictionary<int, T>> config)
			{
				config.Values.ToList().ForEach(fillWorldLevels);
			}
		}

		private SortedDictionary<CreatureFilter, Section> getSections(Section parentSection)
		{
			//IL_00cb: Unknown result type (might be due to invalid IL or missing references)
			//IL_00cf: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d6: Unknown result type (might be due to invalid IL or missing references)
			SortedDictionary<CreatureFilter, Section> sections = new SortedDictionary<CreatureFilter, Section> { 
			{
				default,
				parentSection
			} };
			foreach (CreatureMode item in ((CreatureMode[])Enum.GetValues(typeof(CreatureMode))).Where((CreatureMode v) => v != CreatureMode.Default))
			{
				creatureModeSection(item, new string[1] { item.ToString().ToLower() });
			}
			Biome[] knownBiomes = CreatureConfig.knownBiomes;
			foreach (Biome biome in knownBiomes)
			{
				creatureModeSection(biomeToCreatureMode(biome), biomeLocalizations(biome));
			}
			readGlobalkeys("key_", present: true);
			readGlobalkeys("nokey_", present: false);
			return sections;
			void creatureModeSection(CreatureMode mode, IEnumerable<string> localizations)
			{
				Section section = localizations.Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (string localizedKey) => base.section(parentSection, localizedKey)).FirstOrDefault([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (Section section2) => section2 != null);
				if (section != null)
				{
					foreach (KeyValuePair<CreatureFilter, Section> section2 in getSections(section))
					{
						CreatureFilter key = section2.Key;
						key.Mode |= mode;
						sections[key] = section2.Value;
					}
				}
			}
			void readGlobalkeys(string prefix, bool present)
			{
				foreach (string item2 in parentSection.KeysWithPrefix(prefix))
				{
					Section section = base.section(parentSection, item2);
					if (section != null)
					{
						foreach (KeyValuePair<CreatureFilter, Section> section3 in getSections(section))
						{
							CreatureFilter key = section3.Key;
							key.GlobalKeys = ((key.GlobalKeys != null) ? new Dictionary<string, bool>(key.GlobalKeys) : new Dictionary<string, bool>());
							key.GlobalKeys[item2.Substring(prefix.Length)] = present;
							sections[key] = section3.Value;
						}
					}
				}
			}
		}

		protected override void ParsePrimarySection(Section creatureSection)
		{
			string key = creatureSection.dictKey.ToLower();
			if (!configs.TryGetValue(key, out var value))
			{
				value = (configs[key] = new CreatureConfig());
			}
			SortedDictionary<CreatureFilter, Section> sections = getSections(creatureSection);
			AssignCreatureMode(ParseWorldlevelToFloatMap, value.worldLevelToStars, sections, "stars");
			AssignCreatureMode(ParseWorldlevelToFloatMap, value.worldLevelToLootAmount, sections, "loot");
			AssignCreatureMode(ParseWorldlevelToSingleScalar, value.worldLevelToLootPerStar, sections, "loot per star");
			AssignCreatureMode(ParseScalarFromObject, value.sizeScalingFactor, sections, "size");
			AssignCreatureMode(ParseWorldlevelToFloatMap, value.baseHealth, sections, "health");
			AssignCreatureMode(ParseWorldlevelToSingleScalar, value.healthGainPerStar, sections, "health per star");
			AssignCreatureMode(ParseEnumConfig, value.baseDamage, sections, "damage");
			AssignCreatureMode(ParseWorldlevelToSingleScalar, value.damageGainPerStar, sections, "damage per star");
			AssignCreatureMode(ParseWorldlevelToFloatMap, value.baseAttackSpeed, sections, "attack speed");
			AssignCreatureMode(ParseWorldlevelToSingleScalar, value.attackSpeedGainPerStar, sections, "attack speed per star");
			AssignCreatureMode(ParseWorldlevelToFloatMap, value.baseMovementSpeed, sections, "movement speed");
			AssignCreatureMode(ParseWorldlevelToSingleScalar, value.movementSpeedGainPerStar, sections, "movement speed per star");
			AssignCreatureMode(ParseEnumConfig, value.worldLevelToDamageTakenModifier, sections, "damage taken");
			AssignCreatureMode(ParseWorldlevelToFloatMap, value.spawnAmount, sections, "amount");
			AssignCreatureMode(ParseEnumConfig, value.worldLevelToCreatureEffect, sections, "effect");
			AssignCreatureMode(ParseEnumConfig, value.worldLevelToCreatureEffectFactor, sections, "effect power");
			ParseEnumConfig(ref value.worldLevelToBoss, creatureSection, "affix");
			ParseEnumConfig(ref value.worldLevelToBossAffixFactor, creatureSection, "affix power");
			AssignCreatureMode(ParseEnumConfig, value.worldLevelToInfusion, sections, "infusion");
			using Section section = base.section(creatureSection, "sector");
			if (section != null)
			{
				SortedDictionary<CreatureFilter, Section> sections2 = getSections(section);
				AssignCreatureMode(ParseWorldlevelToFloatMap, value.sectorCount, sections2, "count");
				AssignCreatureMode(ParseWorldlevelToFloatMap, value.sectorStars, sections2, "stars");
			}
			sections.Remove(default);
			foreach (Section value2 in sections.Values)
			{
				value2.Dispose();
			}
		}

		private static void AssignCreatureMode<[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] T>(ParserDelegate<T> parser, SortedDictionary<CreatureFilter, T> target, SortedDictionary<CreatureFilter, Section> sections, string key)
		{
			foreach (KeyValuePair<CreatureFilter, Section> section in sections)
			{
				target.TryGetValue(default, out var value);
				if (parser(ref value, section.Value, key))
				{
					target[section.Key] = value;
				}
			}
		}

		protected override void Verify()
		{
			foreach (KeyValuePair<string, CreatureConfig> config in configs)
			{
				KeyValuePair<string, CreatureConfig> configKv = config;
				foreach (KeyValuePair<CreatureFilter, Dictionary<int, float[]>> worldLevelToStar in configKv.Value.worldLevelToStars)
				{
					float[] array = null;
					foreach (KeyValuePair<int, float[]> item in worldLevelToStar.Value)
					{
						float[] value = item.Value;
						if (value != null && value.Sum() > 100.0001f && (array == null || !Enumerable.SequenceEqual(array, item.Value)))
						{
							array = item.Value;
							configWarnings.Add(string.Format("{0}{1} has a sum of probabilities greater than 100% for its 'stars' setting at world level {2}. Note that the sum of probabilites for individual star levels MUST be equal or lower than 100%, otherwise probabilities exceeding 100% will be ignored.\nWith the current configuration this group would have the following base probabilities: {3}.", new object[4]
							{
								configKv.Key,
								worldLevelToStar.Key.Equals(default(CreatureFilter)) ? "" : $" in {worldLevelToStar.Key} mode",
								item.Key,
								string.Join(", ", API.zeroProbabilities(item.Value).Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (float p, int i) => $"{i} stars: {p}%"))
							}));
						}
					}
				}
				checkEffectProbabilities<CreatureExtraEffect>(configKv.Value.worldLevelToCreatureEffect, CreatureLevelControl.customCreatureAffixChances, "creature special effect");
				checkEffectProbabilities<CreatureInfusion>(configKv.Value.worldLevelToInfusion, CreatureLevelControl.customCreatureInfusionChances, "creature infusion");
				SortedDictionary<CreatureFilter, Dictionary<int, Dictionary<BossAffix, float[]>>> sortedDictionary = new SortedDictionary<CreatureFilter, Dictionary<int, Dictionary<BossAffix, float[]>>>();
				if (configKv.Value.worldLevelToBoss != null)
				{
					sortedDictionary[default] = configKv.Value.worldLevelToBoss;
				}
				checkEffectProbabilities<BossAffix>(sortedDictionary, CreatureLevelControl.customBossAffixChances, "boss affix");
				void checkEffectProbabilities<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 1, 0, 2 })] SortedDictionary<CreatureFilter, Dictionary<int, Dictionary<T, float[]>>> dict, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0, 1 })] Dictionary<T, ConfigEntry<float>> defaultsDict, string nameString) where T : struct, IConvertible
				{
					foreach (KeyValuePair<CreatureFilter, Dictionary<int, Dictionary<T, float[]>>> item2 in dict)
					{
						Dictionary<T, float> dictionary = null;
						foreach (KeyValuePair<int, Dictionary<T, float[]>> item3 in item2.Value)
						{
							int num = item3.Value.Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (KeyValuePair<T, float[]> v) => (v.Value ?? new float[1]).Length).DefaultIfEmpty(1).Max();
							for (int num2 = 0; num2 < num; num2++)
							{
								bool flag = false;
								Dictionary<T, float> dictionary2 = new Dictionary<T, float>();
								Dictionary<T, float> dictionary3 = new Dictionary<T, float>();
								foreach (T item4 in ((T[])Enum.GetValues(typeof(T))).Where([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (T e) => e.ToInt32(CultureInfo.InvariantCulture) != 0))
								{
									float num3;
									if (item3.Value.TryGetValue(item4, out var value2) && value2 != null && value2.Length != 0)
									{
										num3 = (dictionary3[item4] = value2[(num2 < value2.Length) ? num2 : (value2.Length - 1)]);
									}
									else
									{
										num3 = defaultsDict[item4].Value;
										if (num3 > 0f)
										{
											flag = true;
										}
									}
									dictionary2[item4] = num3;
								}
								if (dictionary2.Values.Sum() > 101.1f && Mathf.Abs(dictionary3.Values.Sum() - 100f) > 1.1f && (dictionary == null || !dictionary.SequenceEqual(dictionary2)))
								{
									bool flag2 = dictionary3.Values.Sum() < 100f;
									dictionary = dictionary2;
									configWarnings.Add(string.Format("{0}{1} has a sum of {2} chances greater than 100% for {3} stars at world level {4}{5}. Some effects may not happen at all with the current configuration. Specified chances are: {6}.", new object[7]
									{
										configKv.Key,
										item2.Key.Equals(default(CreatureFilter)) ? "" : $" in configuration {item2.Key}",
										nameString,
										num2,
										item3.Key,
										(flag & flag2) ? " (including default probabilities from config)" : "",
										string.Join(", ", (flag2 ? dictionary2 : dictionary3).Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (KeyValuePair<T, float> kv) => $"{kv.Key}: {kv.Value}%"))
									}));
								}
							}
						}
					}
				}
			}
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
				return CreatureLevelControl.creatureConfigFile;
			}
			[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(2)]
			set
			{
				CreatureLevelControl.creatureConfigFile = (ConfigFile)value;
			}
		}

		public string FilePattern => "CreatureConfig*.yml";

		public string EditButtonName => LocalizationWrapper.getTranslation("Edit Creature YAML config");

		public CustomSyncedValue<List<string>> FileData => CreatureLevelControl.creatureConfigFileData;

		public bool Enabled => CreatureLevelControl.creatureConfigFileActive.GetToggle();

		public global::CreatureLevelControl.ConfigFile InstantiateConfig()
		{
			return new ConfigFile();
		}

		public void ProcessConfig()
		{
			CreatureLevelControl.PrefabConfig = CreatureLevelControl.creatureConfigFile.Process();
		}
	}

	private const int BiomeOffset = 5;

	public static Dictionary<Biome, int> averageBiomeCreatureHealth = new Dictionary<Biome, int>();

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })]
	public readonly SortedDictionary<CreatureFilter, Dictionary<int, float[]>> worldLevelToStars = new SortedDictionary<CreatureFilter, Dictionary<int, float[]>>();

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 1, 2 })]
	public readonly SortedDictionary<CreatureFilter, Dictionary<int, Dictionary<CreatureExtraEffect, float[]>>> worldLevelToCreatureEffect = new SortedDictionary<CreatureFilter, Dictionary<int, Dictionary<CreatureExtraEffect, float[]>>>();

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 1, 2 })]
	public readonly SortedDictionary<CreatureFilter, Dictionary<int, Dictionary<CreatureExtraEffect, float[]>>> worldLevelToCreatureEffectFactor = new SortedDictionary<CreatureFilter, Dictionary<int, Dictionary<CreatureExtraEffect, float[]>>>();

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 1, 2 })]
	public readonly SortedDictionary<CreatureFilter, Dictionary<int, Dictionary<CreatureInfusion, float[]>>> worldLevelToInfusion = new SortedDictionary<CreatureFilter, Dictionary<int, Dictionary<CreatureInfusion, float[]>>>();

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 2 })]
	public Dictionary<int, Dictionary<BossAffix, float[]>> worldLevelToBoss;

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 2 })]
	public Dictionary<int, Dictionary<BossAffix, float[]>> worldLevelToBossAffixFactor;

	public readonly SortedDictionary<CreatureFilter, float> sizeScalingFactor = new SortedDictionary<CreatureFilter, float>();

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })]
	public readonly SortedDictionary<CreatureFilter, Dictionary<int, float[]>> baseHealth = new SortedDictionary<CreatureFilter, Dictionary<int, float[]>>();

	public readonly SortedDictionary<CreatureFilter, Dictionary<int, float?>> healthGainPerStar = new SortedDictionary<CreatureFilter, Dictionary<int, float?>>();

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 1, 2 })]
	public readonly SortedDictionary<CreatureFilter, Dictionary<int, Dictionary<CreatureLevelControl.ModifyDamage, float[]>>> baseDamage = new SortedDictionary<CreatureFilter, Dictionary<int, Dictionary<CreatureLevelControl.ModifyDamage, float[]>>>();

	public readonly SortedDictionary<CreatureFilter, Dictionary<int, float?>> damageGainPerStar = new SortedDictionary<CreatureFilter, Dictionary<int, float?>>();

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })]
	public readonly SortedDictionary<CreatureFilter, Dictionary<int, float[]>> baseMovementSpeed = new SortedDictionary<CreatureFilter, Dictionary<int, float[]>>();

	public readonly SortedDictionary<CreatureFilter, Dictionary<int, float?>> movementSpeedGainPerStar = new SortedDictionary<CreatureFilter, Dictionary<int, float?>>();

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })]
	public readonly SortedDictionary<CreatureFilter, Dictionary<int, float[]>> baseAttackSpeed = new SortedDictionary<CreatureFilter, Dictionary<int, float[]>>();

	public readonly SortedDictionary<CreatureFilter, Dictionary<int, float?>> attackSpeedGainPerStar = new SortedDictionary<CreatureFilter, Dictionary<int, float?>>();

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })]
	public readonly SortedDictionary<CreatureFilter, Dictionary<int, float[]>> spawnAmount = new SortedDictionary<CreatureFilter, Dictionary<int, float[]>>();

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })]
	public readonly SortedDictionary<CreatureFilter, Dictionary<int, float[]>> sectorCount = new SortedDictionary<CreatureFilter, Dictionary<int, float[]>>();

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })]
	public readonly SortedDictionary<CreatureFilter, Dictionary<int, float[]>> sectorStars = new SortedDictionary<CreatureFilter, Dictionary<int, float[]>>();

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 1, 2 })]
	public readonly SortedDictionary<CreatureFilter, Dictionary<int, Dictionary<CreatureLevelControl.ModifyDamage, float[]>>> worldLevelToDamageTakenModifier = new SortedDictionary<CreatureFilter, Dictionary<int, Dictionary<CreatureLevelControl.ModifyDamage, float[]>>>();

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })]
	public readonly SortedDictionary<CreatureFilter, Dictionary<int, float[]>> worldLevelToLootAmount = new SortedDictionary<CreatureFilter, Dictionary<int, float[]>>();

	public readonly SortedDictionary<CreatureFilter, Dictionary<int, float?>> worldLevelToLootPerStar = new SortedDictionary<CreatureFilter, Dictionary<int, float?>>();

	private static Biome[] knownBiomes => ((Biome[])Enum.GetValues(typeof(Biome))).Where((Biome b) =>
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0002: Invalid comparison between Unknown and I4
		return (int)b > 0;
	}).ToArray();

	private static CreatureMode[] modePriorities
	{
		get
		{
			CreatureMode[] array = new CreatureMode[5]
			{
				CreatureMode.Override,
				CreatureMode.Tamed,
				CreatureMode.Dungeon,
				CreatureMode.Default,
				CreatureMode.Day | CreatureMode.Night
			};
			array[3] = knownBiomes.Aggregate(CreatureMode.Default, (CreatureMode a, Biome m) =>
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return a | biomeToCreatureMode(m);
			});
			return array;
		}
	}

	public static CreatureMode biomeToCreatureMode(Biome biome)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_0004: Expected I4, but got Unknown
		return (CreatureMode)(biome << 5);
	}
}
