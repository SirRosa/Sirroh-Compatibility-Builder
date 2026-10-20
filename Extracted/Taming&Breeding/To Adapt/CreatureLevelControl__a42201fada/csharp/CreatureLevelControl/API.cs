using System;
using System.Linq;
using System.Runtime.CompilerServices;
using BepInEx.Configuration;
using JetBrains.Annotations;
using UnityEngine;

namespace CreatureLevelControl;

[PublicAPI]
[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
public static class API
{
	public static bool IsEnabled()
	{
		return true;
	}

	public static bool IsInfusionEnabled()
	{
		return CreatureLevelControl.creatureInfusionEffects.GetToggle();
	}

	public static bool IsExtraEffectEnabled()
	{
		return CreatureLevelControl.creatureSpecialEffects.GetToggle();
	}

	public static bool IsAffixEnabled()
	{
		return CreatureLevelControl.bossSpecialEffects.GetToggle();
	}

	public static int GetWorldLevel()
	{
		//IL_00c3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ba: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c8: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ca: Unknown result type (might be due to invalid IL or missing references)
		//IL_00cf: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d1: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e2: Unknown result type (might be due to invalid IL or missing references)
		//IL_0277: Unknown result type (might be due to invalid IL or missing references)
		//IL_027c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0281: Unknown result type (might be due to invalid IL or missing references)
		//IL_0287: Unknown result type (might be due to invalid IL or missing references)
		//IL_028b: Invalid comparison between Unknown and I4
		//IL_02b7: Unknown result type (might be due to invalid IL or missing references)
		//IL_02bb: Invalid comparison between Unknown and I4
		//IL_028d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0290: Unknown result type (might be due to invalid IL or missing references)
		//IL_02a6: Expected I4, but got Unknown
		//IL_02bf: Unknown result type (might be due to invalid IL or missing references)
		//IL_02c3: Invalid comparison between Unknown and I4
		//IL_02a8: Unknown result type (might be due to invalid IL or missing references)
		//IL_02ab: Invalid comparison between Unknown and I4
		//IL_02c7: Unknown result type (might be due to invalid IL or missing references)
		//IL_02ce: Invalid comparison between Unknown and I4
		//IL_02af: Unknown result type (might be due to invalid IL or missing references)
		//IL_02b3: Invalid comparison between Unknown and I4
		if (!Object.op_Implicit((Object)(object)ZoneSystem.instance) || !Object.op_Implicit((Object)(object)Game.instance))
		{
			return 0;
		}
		string[] array = new string[8] { "eikthyr", "gdking", "bonemass", "dragon", "goblinking", "queen", "fader", "frozenking" };
		int result = CreatureLevelControl.worldLevels.Count;
		Player player;
		int num2;
		if (CreatureLevelControl.difficultySecondFactor.Value == CreatureLevelControl.DifficultySecondFactor.Distance)
		{
			Vector3 val = default;
			ZoneSystem.instance.GetLocationIcon(Game.instance.m_StartLocation, ref val);
			Player localPlayer = Player.m_localPlayer;
			Vector3 val2 = ((localPlayer != null) ? ((Component)localPlayer).transform.localPosition : default(Vector3)) - val;
			float num = Mathf.Sqrt(Mathf.Pow(val2.x, 2f) + Mathf.Pow(val2.z, 2f));
			foreach (ConfigEntry<int> key in CreatureLevelControl.spawnDistance.Keys)
			{
				if (num < (float)key.Value)
				{
					result = CreatureLevelControl.spawnDistance[key];
					break;
				}
			}
		}
		else if (CreatureLevelControl.difficultySecondFactor.Value == CreatureLevelControl.DifficultySecondFactor.Age_of_world)
		{
			int day = EnvMan.instance.GetDay(ZNet.instance.GetTimeSeconds());
			foreach (ConfigEntry<int> key2 in CreatureLevelControl.worldLevels.Keys)
			{
				if (day < key2.Value)
				{
					result = CreatureLevelControl.worldLevels[key2];
					break;
				}
			}
		}
		else if (CreatureLevelControl.difficultySecondFactor.Value == CreatureLevelControl.DifficultySecondFactor.BossesKilled)
		{
			result = array.Count([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (string boss) => ZoneSystem.instance.GetGlobalKey("defeated_" + boss));
		}
		else
		{
			if (CreatureLevelControl.difficultySecondFactor.Value == CreatureLevelControl.DifficultySecondFactor.Fluid)
			{
				player = Player.m_localPlayer;
				if (player == null)
				{
					return 0;
				}
				Biome val3 = Heightmap.FindBiome(((Component)player).transform.position);
				if (1 == 0)
				{
				}
				if ((int)val3 <= 16)
				{
					switch (val3 - 1)
					{
					case 0:
						goto IL_02d2;
					case 1:
						goto IL_02dc;
					case 3:
						goto IL_02e1;
					case 2:
						goto IL_02fa;
					}
					if ((int)val3 != 8)
					{
						if ((int)val3 != 16)
						{
							goto IL_02fa;
						}
						num2 = 4;
					}
					else
					{
						num2 = 1;
					}
				}
				else if ((int)val3 != 32)
				{
					if ((int)val3 != 64)
					{
						if ((int)val3 != 512)
						{
							goto IL_02fa;
						}
						num2 = 5;
					}
					else
					{
						num2 = 7;
					}
				}
				else
				{
					num2 = 6;
				}
				goto IL_02ff;
			}
			result = 3;
		}
		goto IL_0369;
		IL_02fa:
		num2 = 3;
		goto IL_02ff;
		IL_02ff:
		if (1 == 0)
		{
		}
		int num3 = num2;
		int num4 = Array.FindLastIndex(array, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (string boss) => ((Humanoid)player).HaveUniqueKey("defeated_" + boss));
		result = ((num4 != -1 || num3 != 0) ? ((num4 + 1 >= num3) ? Math.Min(num4 - num3 + 2, CreatureLevelControl.worldLevels.Count) : 3) : 0);
		goto IL_0369;
		IL_02e1:
		num2 = 3;
		goto IL_02ff;
		IL_02d2:
		num2 = 0;
		goto IL_02ff;
		IL_0369:
		return result;
		IL_02dc:
		num2 = 2;
		goto IL_02ff;
	}

	internal static float[] zeroProbabilities(float[] p, int shift = 0)
	{
		float num = 100f;
		for (int i = 0; i < p.Length; i++)
		{
			num -= p[i];
			if (num < 0f)
			{
				p[i] += num;
				num = 0f;
			}
		}
		float[] array = new float[shift + 1].Concat(p).ToArray();
		array[shift] = num;
		return array;
	}

	public static float[] LevelProbabilities([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] Character character, int worldLevel, bool includeZoneBonusLevel)
	{
		//IL_0038: Unknown result type (might be due to invalid IL or missing references)
		int num;
		if (!includeZoneBonusLevel)
		{
			num = 0;
		}
		else
		{
			object obj;
			if (character == null)
			{
				obj = null;
			}
			else
			{
				ZNetView component = ((Component)character).GetComponent<ZNetView>();
				obj = ((component != null) ? component.GetZDO() : null);
			}
			num = ((obj == null) ? CreatureSector.sectorBonusLevel(((Component)Player.m_localPlayer).GetComponent<ZNetView>().GetZDO().GetSector()) : CreatureSector.sectorBonusLevel(character));
		}
		int num2 = num;
		if ((Object)(object)character != (Object)null)
		{
			float[] array = Utils.ReadWithWorldLevelFromConfig(character, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })] (CreatureConfig c) => c.worldLevelToStars);
			if (array != null)
			{
				return zeroProbabilities(array, (!character.IsBoss()) ? num2 : 0);
			}
		}
		if (character != null && character.IsBoss() && !CreatureLevelControl.bossLevelUseCreatureLevel.GetToggle())
		{
			return zeroProbabilities(Utils.ParseStringProbabilities(CreatureLevelControl.customBossLevelChances.Value));
		}
		if (CreatureLevelControl.difficulty.Value == CreatureLevelControl.Difficulty.Custom)
		{
			return zeroProbabilities(Utils.ParseStringProbabilities(CreatureLevelControl.customLevelChances[worldLevel].Value), num2);
		}
		if (!CreatureLevelControl.levelConfig.TryGetValue(CreatureLevelControl.difficulty.Value, out var value))
		{
			value = CreatureLevelControl.levelConfig[CreatureLevelControl.Difficulty.Medium];
		}
		float[] source = zeroProbabilities(value[worldLevel], num2);
		int value2 = (int)CreatureLevelControl.minimumLevel.Value;
		int num3 = Math.Max(value2, (int)CreatureLevelControl.maximumLevel.Value);
		float num4 = source.Take(value2).Sum();
		float num5 = source.Skip(1 + num3).Sum();
		source = new float[value2].Concat(source.Skip(value2).Take(1 + num3 - value2)).ToArray();
		source[value2] += num4;
		if (num5 > 0f)
		{
			source = source.Concat(new float[Mathf.Max(0, 1 + num3 - source.Length)]).ToArray();
			source[num3] += num5;
		}
		return source;
	}

	public static int LevelRand(Character character)
	{
		return Utils.LevelFromProbabilities(LevelProbabilities(character, GetWorldLevel(), includeZoneBonusLevel: true));
	}

	public static bool HasAffixBoss(Character character)
	{
		return HasExtraEffectCreature(character);
	}

	public static BossAffix GetAffixBoss(Character character)
	{
		ZNetView component = ((Component)character).GetComponent<ZNetView>();
		return (CreatureLevelControl.bossSpecialEffects.GetToggle() && ((component != null) ? component.GetZDO() : null) != null) ? ((BossAffix)component.GetZDO().GetInt("CL&LC effect", 0)) : BossAffix.None;
	}

	public static void SetAffixBoss(Character character, BossAffix affix)
	{
		//IL_01e7: Unknown result type (might be due to invalid IL or missing references)
		//IL_01ee: Expected Obj, but got Unknown
		//IL_020a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0211: Expected Obj, but got Unknown
		//IL_021b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0220: Unknown result type (might be due to invalid IL or missing references)
		//IL_024a: Unknown result type (might be due to invalid IL or missing references)
		//IL_025d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0262: Unknown result type (might be due to invalid IL or missing references)
		//IL_026c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0271: Unknown result type (might be due to invalid IL or missing references)
		//IL_0295: Unknown result type (might be due to invalid IL or missing references)
		//IL_02b5: Unknown result type (might be due to invalid IL or missing references)
		//IL_02ba: Unknown result type (might be due to invalid IL or missing references)
		//IL_02bc: Unknown result type (might be due to invalid IL or missing references)
		//IL_02e8: Unknown result type (might be due to invalid IL or missing references)
		//IL_02ef: Unknown result type (might be due to invalid IL or missing references)
		//IL_02d3: Unknown result type (might be due to invalid IL or missing references)
		string[] source = new string[10] { "Eikthyr", "gd_king", "Bonemass", "Dragon", "GoblinKing", "SeekerQueen", "Fader", "FrozenKing", "FrozenKing_p2", "FrozenKing_p3" };
		if (affix == BossAffix.Summoner && !Enumerable.Contains(source, ((Object)character).name.Replace("(Clone)", "")))
		{
			affix = BossAffix.None;
		}
		if (GetAffixBoss(character) == BossAffix.Twin || GetAffixBoss(character) == BossAffix.Godlike)
		{
			if (affix != BossAffix.Twin && affix != BossAffix.Godlike)
			{
				Character twinBoss = GetTwinBoss(character);
				GameObject val = ((twinBoss != null) ? ((Component)twinBoss).gameObject : null);
				if (val != null)
				{
					ZNetScene.instance.Destroy(val);
				}
			}
			float num = Utils.ReadValueFromEnumWithWorldLevelAndStarsFromConfig(character, BossAffix.Twin, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 2 })] (CreatureConfig c) => c.worldLevelToBossAffixFactor) ?? (CreatureLevelControl.bossAffixPowerTwin.Value / 100f);
			character.m_health /= num;
			character.SetupMaxHealth();
		}
		else if ((affix == BossAffix.Twin || affix == BossAffix.Godlike) ? true : false)
		{
			if (CreatureLevelControl.bossSpecialEffects.GetToggle())
			{
				float num2 = Utils.ReadValueFromEnumWithWorldLevelAndStarsFromConfig(character, BossAffix.Twin, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 2 })] (CreatureConfig c) => c.worldLevelToBossAffixFactor) ?? (CreatureLevelControl.bossAffixPowerTwin.Value / 100f);
				character.m_health *= num2;
				character.SetupMaxHealth();
				setAffixBossZDO(character, affix);
				ZPackage val2 = new ZPackage();
				character.m_nview.GetZDO().Serialize(val2);
				val2.SetPos(0);
				ZDO val3 = new ZDO();
				val3.Init();
				val3.m_uid = Utils.GenerateNewZDOID();
				val3.Deserialize(val2);
				val3.SetRotation(Quaternion.Euler(0f, Random.Range(0f, 360f), 0f));
				val3.SetPosition(((Component)character).transform.localPosition + Random.insideUnitSphere * 0.5f);
				val3.SetOwnerInternal(ZDOMan.GetSessionID());
				ZDOMan.instance.m_objectsByID.Add(val3.m_uid, val3);
				Character component = ZNetScene.instance.CreateObject(val3).GetComponent<Character>();
				Vector3 insideUnitSphere = Random.insideUnitSphere;
				if (insideUnitSphere.y < 0f)
				{
					insideUnitSphere.y = 0f - insideUnitSphere.y;
				}
				((Component)component).GetComponent<Rigidbody>().AddForce(insideUnitSphere * 5f, (ForceMode)2);
				CreatureLevelControl.SetTwinBoss(character, component);
			}
			else
			{
				affix = BossAffix.None;
			}
		}
		setAffixBossZDO(character, affix);
		OriginalCharacterData component2 = ((Component)character).GetComponent<OriginalCharacterData>();
		if (component2 != null)
		{
			component2.Awake();
		}
		else
		{
			((Component)character).gameObject.AddComponent<OriginalCharacterData>();
		}
		CreatureLevelControl.ShowStar.NeedsUpdate.Remove(character);
	}

	private static void setAffixBossZDO(Character character, BossAffix affix)
	{
		ZNetView component = ((Component)character).GetComponent<ZNetView>();
		component.GetZDO().Set("CL&LC effect", (int)affix);
	}

	public static bool HasExtraEffectCreature(Character character)
	{
		ZNetView component = ((Component)character).GetComponent<ZNetView>();
		return component.GetZDO().GetInt("CL&LC effect", -1) != -1;
	}

	public static CreatureExtraEffect GetExtraEffectCreature(Character character)
	{
		ZNetView component = ((Component)character).GetComponent<ZNetView>();
		return (CreatureLevelControl.creatureSpecialEffects.GetToggle() && ((component != null) ? component.GetZDO() : null) != null && character.GetLevel() > 1) ? ((CreatureExtraEffect)component.GetZDO().GetInt("CL&LC effect", 0)) : CreatureExtraEffect.None;
	}

	public static void SetExtraEffectCreature(Character character)
	{
		//IL_00e0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f7: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fc: Unknown result type (might be due to invalid IL or missing references)
		//IL_0109: Unknown result type (might be due to invalid IL or missing references)
		//IL_010b: Unknown result type (might be due to invalid IL or missing references)
		CreatureExtraEffect? creatureExtraEffect = Utils.RandomWithProbabilityFromConfig(character, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 1, 2 })] (CreatureConfig c) => c.worldLevelToCreatureEffect, out var rand, out var processedProbabilities);
		if (!creatureExtraEffect.HasValue)
		{
			creatureExtraEffect = CreatureExtraEffect.None;
			foreach (CreatureExtraEffect key in CreatureLevelControl.customCreatureAffixChances.Keys)
			{
				if ((key == CreatureExtraEffect.Splitting && ((Object)character).name.StartsWith("Aspect_")) || processedProbabilities.Contains(key))
				{
					continue;
				}
				rand -= CreatureLevelControl.customCreatureAffixChances[key].Value;
				if (!(rand < 0f))
				{
					continue;
				}
				if (key == CreatureExtraEffect.Armored)
				{
					Vector3? val = character.GetBaseAI()?.m_spawnPoint;
					if (val.HasValue)
					{
						Vector3 valueOrDefault = val.GetValueOrDefault();
						if (character.m_health > (float)(CreatureConfig.averageBiomeCreatureHealth.TryGetValue(Heightmap.FindBiome(valueOrDefault), out var value) ? value : int.MaxValue))
						{
							creatureExtraEffect = CreatureExtraEffect.None;
							break;
						}
					}
				}
				creatureExtraEffect = key;
				break;
			}
		}
		SetExtraEffectCreature(character, creatureExtraEffect.Value);
	}

	public static void SetExtraEffectCreature(Character character, CreatureExtraEffect effect)
	{
		ZNetView component = ((Component)character).GetComponent<ZNetView>();
		component.GetZDO().Set("CL&LC effect", (int)effect);
		CreatureLevelControl.SetPersistedCharacterAttributes(character);
		CreatureLevelControl.ShowStar.NeedsUpdate.Remove(character);
	}

	public static bool HasInfusionCreature(Character character)
	{
		ZNetView component = ((Component)character).GetComponent<ZNetView>();
		return component.GetZDO().GetInt("CL&LC infusion", -1) != -1;
	}

	public static CreatureInfusion GetInfusionCreature(Character character)
	{
		ZNetView component = ((Component)character).GetComponent<ZNetView>();
		return (CreatureLevelControl.creatureInfusionEffects.GetToggle() && ((component != null) ? component.GetZDO() : null) != null) ? ((CreatureInfusion)component.GetZDO().GetInt("CL&LC infusion", 0)) : CreatureInfusion.None;
	}

	public static void SetInfusionCreature(Character character)
	{
		CreatureInfusion? creatureInfusion = Utils.RandomWithProbabilityFromConfig(character, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 1, 2 })] (CreatureConfig c) => c.worldLevelToInfusion, out var rand, out var processedProbabilities);
		CreatureInfusion infusion;
		if (creatureInfusion.HasValue)
		{
			infusion = creatureInfusion.GetValueOrDefault();
			if (true)
			{
				goto IL_0105;
			}
		}
		infusion = CreatureInfusion.None;
		if (!CreatureLevelControl.infusionProbabilityModifiersByLevel.TryGetValue(character.GetLevel(), out var value))
		{
			value = 1f;
		}
		if (Random.Range(0f, 1f) <= value)
		{
			foreach (CreatureInfusion key in CreatureLevelControl.customCreatureInfusionChances.Keys)
			{
				if (!processedProbabilities.Contains(key))
				{
					rand -= CreatureLevelControl.customCreatureInfusionChances[key].Value;
					if (rand < 0f)
					{
						infusion = key;
						break;
					}
				}
			}
		}
		goto IL_0105;
		IL_0105:
		SetInfusionCreature(character, infusion);
	}

	public static void SetInfusionCreature(Character character, CreatureInfusion infusion)
	{
		ZNetView component = ((Component)character).GetComponent<ZNetView>();
		component.GetZDO().Set("CL&LC infusion", (int)infusion);
		OriginalCharacterData component2 = ((Component)character).GetComponent<OriginalCharacterData>();
		if (component2 != null)
		{
			component2.immutableExtra = true;
		}
		CreatureLevelControl.AttachInfusionFlames(character);
		CreatureLevelControl.ShowStar.NeedsUpdate.Remove(character);
	}

	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	public static Character GetTwinBoss(Character boss)
	{
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		ZNetView component = ((Component)boss).GetComponent<ZNetView>();
		ZDOID zDOID = component.GetZDO().GetZDOID("CL&LC twin boss");
		if (ZDOMan.instance.m_objectsByID.TryGetValue(zDOID, out var value) && ZNetScene.s_instance.m_instances.TryGetValue(value, out var value2))
		{
			return ((Component)value2).GetComponent<Character>();
		}
		return null;
	}

	public static bool DropItemOnDeath(ItemData item)
	{
		return Utils.ReadWithWorldLevelFromConfig(item, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] (ItemConfig c) => c.worldLevelToItemLoss) ?? (!item.m_shared.m_questItem && !item.m_equipped);
	}

	public static int GetMaxLevel()
	{
		return (int)(CreatureLevelControl.maximumLevel.Value + 1);
	}
}
