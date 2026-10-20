using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using BepInEx.Configuration;
using HarmonyLib;
using UnityEngine;

namespace CreatureLevelControl;

public static class Utils
{
	private delegate U FromConfigReader<[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] in T, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] out U>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] T configGetter);

	private delegate bool CreatureModeAccumulator<[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] T>(ref T current, T input);

	private struct ModeInfo<[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] T>
	{
		[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)]
		public Character character;

		[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0, 1, 1 })]
		public IEnumerable<KeyValuePair<CreatureConfig.CreatureFilter, Func<T>>> modes;
	}

	public class IHateCSharpStruct<T> where T : struct
	{
		public T value;
	}

	[HarmonyPatch(typeof(ZNet), "OnNewConnection")]
	private static class AddRPCs
	{
		[CompilerGenerated]
		private static class _003C_003EO
		{
			public static Method _003C0_003E__onServerTimeRequest;

			public static Action<ZRpc, long> _003C1_003E__onServerTimeReceived;
		}

		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		private static void Postfix(ZNet __instance, ZNetPeer peer)
		{
			//IL_0027: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0032: Expected Obj, but got Unknown
			if (__instance.IsServer())
			{
				ZRpc rpc = peer.m_rpc;
				Method val = _003C_003EO._003C0_003E__onServerTimeRequest;
				if (val == null)
				{
					Method val2 = onServerTimeRequest;
					_003C_003EO._003C0_003E__onServerTimeRequest = val2;
					val = val2;
				}
				rpc.Register("CLLC GetServerTime", val);
			}
			else
			{
				peer.m_rpc.Register<long>("CLLC GetServerTime", (Action<ZRpc, long>)onServerTimeReceived);
			}
		}
	}

	public static DateTime serverTime = DateTime.Now;

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	public static bool GetToggle(this ConfigEntry<Toggle> toggle)
	{
		return toggle.Value == Toggle.On;
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	public static float[] ParseStringProbabilities(string probabilities)
	{
		return (from str in probabilities.Split(new char[1] { ',' })
			select float.TryParse(str, NumberStyles.Float, CultureInfo.InvariantCulture, out var result) ? result : 0f).ToArray();
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	public static int LevelFromProbabilities(float[] probabilities)
	{
		double num = Random.Range(0f, 100f);
		for (int i = 0; i < probabilities.Length; i++)
		{
			num -= (double)probabilities[i];
			if (num < 0.0)
			{
				return 1 + i;
			}
		}
		return 1 + (from v in probabilities.Select((float p, int i2) => new
			{
				p = p,
				i = i2
			})
			where v.p != 0f
			select v.i).First();
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(2)]
	private static bool CreatureModeDefaultAccumulator<T>(ref T current, T input) where T : class
	{
		current = input;
		return input != null;
	}

	private static bool CreatureModeDefaultAccumulator<T>(ref T? current, T? input) where T : struct
	{
		current = input;
		return input.HasValue;
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 0, 1 })]
	private static ModeInfo<U> ModeReader<[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] T, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] U>(Character character, FromConfigReader<T, U> configReader, Func<CreatureConfig, SortedDictionary<CreatureConfig.CreatureFilter, T>> configGetter, U defaultValue)
	{
		ModeInfo<U> result = new ModeInfo<U>
		{
			character = character
		};
		CreatureConfig creatureConfig = readCharacterConfig(character);
		IEnumerable<KeyValuePair<CreatureConfig.CreatureFilter, Func<U>>> modes;
		if (creatureConfig == null)
		{
			IEnumerable<KeyValuePair<CreatureConfig.CreatureFilter, Func<U>>> enumerable = new KeyValuePair<CreatureConfig.CreatureFilter, Func<U>>[1]
			{
				new KeyValuePair<CreatureConfig.CreatureFilter, Func<U>>(default, () => defaultValue)
			};
			modes = enumerable;
		}
		else
		{
			modes = from kv in configGetter(creatureConfig)
				select new KeyValuePair<CreatureConfig.CreatureFilter, Func<U>>(kv.Key, () => configReader(kv.Value));
		}
		result.modes = modes;
		return result;
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	private static T CreatureModeChooser<[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] T>(T initialValue, CreatureModeAccumulator<T> accumulator, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 0, 1 })] ModeInfo<T> modeInfo)
	{
		//IL_00d2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ee: Unknown result type (might be due to invalid IL or missing references)
		//IL_0110: Unknown result type (might be due to invalid IL or missing references)
		//IL_0108: Unknown result type (might be due to invalid IL or missing references)
		//IL_010d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0134: Unknown result type (might be due to invalid IL or missing references)
		//IL_0136: Unknown result type (might be due to invalid IL or missing references)
		//IL_012b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0130: Unknown result type (might be due to invalid IL or missing references)
		//IL_0150: Unknown result type (might be due to invalid IL or missing references)
		T current = initialValue;
		if (modeInfo.modes.Count() == 1 && modeInfo.modes.First().Key.Equals(default(CreatureConfig.CreatureFilter)))
		{
			accumulator(ref current, modeInfo.modes.First().Value());
			return current;
		}
		Character character = modeInfo.character;
		CreatureConfig.CreatureMode creatureMode = CreatureConfig.CreatureMode.Override;
		ZNetView nview = character.m_nview;
		if (((nview != null) ? nview.GetZDO() : null) != null && character.IsTamed())
		{
			creatureMode |= CreatureConfig.CreatureMode.Tamed;
		}
		Vector3 val2;
		if (Object.op_Implicit((Object)(object)Player.m_localPlayer))
		{
			Vector3? val = character.GetBaseAI()?.m_spawnPoint;
			if (val.HasValue)
			{
				val2 = val.GetValueOrDefault();
				if (true)
				{
					goto IL_0110;
				}
			}
			val2 = ((Component)Player.m_localPlayer).transform.position;
			goto IL_0110;
		}
		goto IL_016b;
		IL_0110:
		if (val2.y == 0f)
		{
			val2 = ((Component)character).transform.position;
		}
		creatureMode |= CreatureConfig.biomeToCreatureMode(Heightmap.FindBiome(val2));
		creatureMode = (CreatureConfig.CreatureMode)((int)creatureMode | (EnvMan.IsDay() ? 2 : 4));
		if (val2.y > 4500f)
		{
			creatureMode |= CreatureConfig.CreatureMode.Dungeon;
		}
		goto IL_016b;
		IL_016b:
		foreach (KeyValuePair<CreatureConfig.CreatureFilter, Func<T>> mode in modeInfo.modes)
		{
			if ((mode.Key.GlobalKeys == null || !mode.Key.GlobalKeys.Any((KeyValuePair<string, bool> kv) => ZoneSystem.instance.GetGlobalKey(kv.Key) != kv.Value)) && (mode.Key.Mode & creatureMode) == mode.Key.Mode && accumulator(ref current, mode.Value()))
			{
				break;
			}
		}
		return current;
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	private static U CreatureModeChooser<T, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] U>(Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 2, 1 })] FromConfigReader<T, U> configReader, Func<CreatureConfig, SortedDictionary<CreatureConfig.CreatureFilter, T>> configGetter) where T : class where U : class
	{
		return CreatureModeChooser(null, CreatureModeDefaultAccumulator, ModeReader(character, configReader, configGetter, null));
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	private static U? CreatureModeChooser<T, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)] U>(Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 2, 0 })] FromConfigReader<T, U?> configReader, Func<CreatureConfig, SortedDictionary<CreatureConfig.CreatureFilter, T>> configGetter) where T : class where U : struct
	{
		return CreatureModeChooser(null, CreatureModeDefaultAccumulator, ModeReader(character, configReader, configGetter, null));
	}

	private static T? CreatureModeChooser<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0, 0 })] FromConfigReader<T, T?> configReader, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 1, 0 })] Func<CreatureConfig, SortedDictionary<CreatureConfig.CreatureFilter, T>> configGetter) where T : struct
	{
		return CreatureModeChooser(null, CreatureModeDefaultAccumulator, ModeReader(character, configReader, configGetter, null));
	}

	public static T? RandomWithProbabilityFromConfig<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 1, 1, 1, 0, 2 })] Func<CreatureConfig, SortedDictionary<CreatureConfig.CreatureFilter, Dictionary<int, Dictionary<T, float[]>>>> configGetter, out float rand, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0 })] out HashSet<T> processedProbabilities) where T : struct
	{
		float randValue = Random.Range(0f, 100f);
		HashSet<T> probabilities = new HashSet<T>();
		T? result = CreatureModeChooser(null, delegate(ref T? output, T? input)
		{
			output = input;
			return probabilities.Count > 0;
		}, ModeReader(character, ([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 0, 0, 0 })] Dictionary<int, Dictionary<T, float[]>> dict) => RandomWithProbabilityFromConfig(character, dict, out randValue, out probabilities), configGetter, null));
		rand = randValue;
		processedProbabilities = probabilities;
		return result;
	}

	public static T? RandomWithProbabilityFromConfig<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2, 1, 0, 2 })] Func<CreatureConfig, Dictionary<int, Dictionary<T, float[]>>> configGetter, out float rand, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0 })] out HashSet<T> processedProbabilities) where T : struct
	{
		return RandomWithProbabilityFromConfig(character, ReadFromConfig(character, configGetter), out rand, out processedProbabilities);
	}

	public static T? RandomWithProbabilityFromConfig<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 0, 2 })] Dictionary<int, Dictionary<T, float[]>> config, out float rand, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0 })] out HashSet<T> processedProbabilities) where T : struct
	{
		rand = Random.Range(0f, 100f);
		processedProbabilities = new HashSet<T>();
		if (config != null && config.TryGetValue(API.GetWorldLevel(), out var value))
		{
			int num = Mathf.Max(0, character.GetLevel() - ((!(typeof(T) == typeof(CreatureExtraEffect))) ? 1 : 2));
			foreach (T key in value.Keys)
			{
				float[] array = value[key];
				if (array != null && array.Length > 0)
				{
					processedProbabilities.Add(key);
					float num2 = ((num < array.Length) ? array[num] : array[^1]);
					rand -= num2;
					if (rand < 0f)
					{
						return key;
					}
				}
			}
		}
		return null;
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	private static bool enumReaderAccumulator<[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] T, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] U>(ref Dictionary<T, U> current, Dictionary<T, U> input)
	{
		foreach (KeyValuePair<T, U> item in input)
		{
			if (!current.ContainsKey(item.Key))
			{
				current[item.Key] = item.Value;
			}
		}
		return false;
	}

	public static U? ReadValueFromEnumWithWorldLevelAndStarsFromConfig<T, U>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Character character, T enumValue, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 1, 1, 1, 0, 2, 0 })] Func<CreatureConfig, SortedDictionary<CreatureConfig.CreatureFilter, Dictionary<int, Dictionary<T, U[]>>>> configGetter) where T : struct where U : struct
	{
		if (ReadEnumWithWorldLevelAndStarsFromConfig(character, configGetter).TryGetValue(enumValue, out var value))
		{
			return value;
		}
		return null;
	}

	public static U? ReadValueFromEnumWithWorldLevelAndStarsFromConfig<T, U>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Character character, T enumValue, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2, 1, 0, 2, 0 })] Func<CreatureConfig, Dictionary<int, Dictionary<T, U[]>>> configGetter) where T : struct where U : struct
	{
		if (ReadEnumWithWorldLevelAndStarsFromConfig(character, configGetter).TryGetValue(enumValue, out var value))
		{
			return value;
		}
		return null;
	}

	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0, 0 })]
	public static Dictionary<T, U> ReadEnumWithWorldLevelAndStarsFromConfig<T, U>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 1, 1, 1, 0, 2, 0 })] Func<CreatureConfig, SortedDictionary<CreatureConfig.CreatureFilter, Dictionary<int, Dictionary<T, U[]>>>> configGetter) where T : struct where U : struct
	{
		Dictionary<T, int> usedStars;
		return ReadEnumWithWorldLevelAndStarsFromConfig(character, configGetter, out usedStars);
	}

	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0, 0 })]
	public static Dictionary<T, U> ReadEnumWithWorldLevelAndStarsFromConfig<T, U>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 1, 1, 1, 0, 2, 0 })] Func<CreatureConfig, SortedDictionary<CreatureConfig.CreatureFilter, Dictionary<int, Dictionary<T, U[]>>>> configGetter, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0 })] out Dictionary<T, int> usedStars) where T : struct where U : struct
	{
		Dictionary<T, int> UsedStars = (usedStars = new Dictionary<T, int>());
		return CreatureModeChooser(new Dictionary<T, U>(), enumReaderAccumulator, ModeReader(character, ([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 0, 0, 0, 0 })] Dictionary<int, Dictionary<T, U[]>> dict) =>
		{
			Dictionary<T, U> result = ReadEnumWithWorldLevelAndStarsFromConfig(character, dict, out var usedStars2);
			foreach (KeyValuePair<T, int> item in usedStars2)
			{
				if (!UsedStars.ContainsKey(item.Key))
				{
					UsedStars[item.Key] = item.Value;
				}
			}
			return result;
		}, configGetter, new Dictionary<T, U>()));
	}

	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0, 0 })]
	public static Dictionary<T, U> ReadEnumWithWorldLevelAndStarsFromConfig<T, U>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2, 1, 0, 2, 0 })] Func<CreatureConfig, Dictionary<int, Dictionary<T, U[]>>> configGetter) where T : struct where U : struct
	{
		Dictionary<T, int> usedStars;
		return ReadEnumWithWorldLevelAndStarsFromConfig(character, configGetter, out usedStars);
	}

	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0, 0 })]
	public static Dictionary<T, U> ReadEnumWithWorldLevelAndStarsFromConfig<T, U>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2, 1, 0, 2, 0 })] Func<CreatureConfig, Dictionary<int, Dictionary<T, U[]>>> configGetter, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0 })] out Dictionary<T, int> usedStars) where T : struct where U : struct
	{
		return ReadEnumWithWorldLevelAndStarsFromConfig(character, ReadFromConfig(character, configGetter), out usedStars);
	}

	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0, 0 })]
	public static Dictionary<T, U> ReadEnumWithWorldLevelAndStarsFromConfig<T, U>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 0, 2, 0 })] Dictionary<int, Dictionary<T, U[]>> config, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0 })] out Dictionary<T, int> usedStars) where T : struct where U : struct
	{
		Dictionary<T, U> dictionary = new Dictionary<T, U>();
		usedStars = new Dictionary<T, int>();
		if (config != null && config.TryGetValue(API.GetWorldLevel(), out var value))
		{
			int num = Mathf.Max(0, character.GetLevel() - 1);
			foreach (T key in value.Keys)
			{
				U[] array = value[key];
				if (array != null && array.Length > 0)
				{
					int num2 = ((num < array.Length) ? num : (array.Length - 1));
					dictionary[key] = array[num2];
					usedStars[key] = num2;
				}
			}
		}
		return dictionary;
	}

	public static T? ReadWithWorldLevelAndStarsFromConfig<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 1, 1, 2, 0 })] Func<CreatureConfig, SortedDictionary<CreatureConfig.CreatureFilter, Dictionary<int, T[]>>> configGetter) where T : struct
	{
		int usedStars;
		return ReadWithWorldLevelAndStarsFromConfig(character, configGetter, out usedStars);
	}

	public static T? ReadWithWorldLevelAndStarsFromConfig<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 1, 1, 2, 0 })] Func<CreatureConfig, SortedDictionary<CreatureConfig.CreatureFilter, Dictionary<int, T[]>>> configGetter, out int usedStars) where T : struct
	{
		IHateCSharpStruct<int> starHolder = new IHateCSharpStruct<int>();
		T? result = CreatureModeChooser(character, ([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 0, 0 })] Dictionary<int, T[]> dict) =>
		{
			T? result2 = ReadWithWorldLevelAndStarsFromConfig(character, dict, out var usedStars2);
			starHolder.value = usedStars2;
			return result2;
		}, configGetter);
		usedStars = starHolder.value;
		return result;
	}

	public static T? ReadWithWorldLevelAndStarsFromConfig<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2, 2, 0 })] Func<CreatureConfig, Dictionary<int, T[]>> configGetter) where T : struct
	{
		int usedStars;
		return ReadWithWorldLevelAndStarsFromConfig(character, configGetter, out usedStars);
	}

	public static T? ReadWithWorldLevelAndStarsFromConfig<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2, 2, 0 })] Func<CreatureConfig, Dictionary<int, T[]>> configGetter, out int usedStars) where T : struct
	{
		return ReadWithWorldLevelAndStarsFromConfig(character, ReadFromConfig(character, configGetter), out usedStars);
	}

	public static T? ReadWithWorldLevelAndStarsFromConfig<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 2, 0 })] Dictionary<int, T[]> dict, out int usedStars) where T : struct
	{
		T[] array = ReadWithWorldLevelFromConfig(dict);
		if (array != null && array.Length > 0)
		{
			int num = Math.Max(character.GetLevel() - 1, 0);
			usedStars = ((num < array.Length) ? num : (array.Length - 1));
			return array[usedStars];
		}
		usedStars = 0;
		return null;
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	public static T ReadWithWorldLevelFromConfig<T>(Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 1, 1, 2 })] Func<CreatureConfig, SortedDictionary<CreatureConfig.CreatureFilter, Dictionary<int, T>>> configGetter) where T : class
	{
		return CreatureModeChooser(character, ReadWithWorldLevelFromConfig, configGetter);
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	public static T ReadWithWorldLevelFromConfig<T>(Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2, 2 })] Func<CreatureConfig, Dictionary<int, T>> configGetter) where T : class
	{
		return ReadWithWorldLevelFromConfig(ReadFromConfig(character, configGetter));
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	public static T ReadWithWorldLevelFromConfig<T>(ItemData item, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2, 2 })] Func<ItemConfig, Dictionary<int, T>> configGetter) where T : class
	{
		return ReadWithWorldLevelFromConfig(ReadFromConfig(item, configGetter));
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(2)]
	private static T ReadWithWorldLevelFromConfig<[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] T>(Dictionary<int, T> config) where T : class
	{
		T value = null;
		config?.TryGetValue(API.GetWorldLevel(), out value);
		return value;
	}

	public static T? ReadWithWorldLevelFromConfig<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 1, 1, 0 })] Func<CreatureConfig, SortedDictionary<CreatureConfig.CreatureFilter, Dictionary<int, T?>>> configGetter) where T : struct
	{
		return CreatureModeChooser(character, ReadWithWorldLevelFromConfig, configGetter);
	}

	public static T? ReadWithWorldLevelFromConfig<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2, 0 })] Func<CreatureConfig, Dictionary<int, T?>> configGetter) where T : struct
	{
		return ReadWithWorldLevelFromConfig(ReadFromConfig(character, configGetter));
	}

	public static T? ReadWithWorldLevelFromConfig<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] ItemData item, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2, 0 })] Func<ItemConfig, Dictionary<int, T?>> configGetter) where T : struct
	{
		return ReadWithWorldLevelFromConfig(ReadFromConfig(item, configGetter));
	}

	public static T? ReadWithWorldLevelFromConfig<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] ItemDrop item, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2, 0 })] Func<ItemConfig, Dictionary<int, T?>> configGetter) where T : struct
	{
		return ReadWithWorldLevelFromConfig(ReadFromConfig(item, configGetter));
	}

	private static T? ReadWithWorldLevelFromConfig<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 0 })] Dictionary<int, T?> config) where T : struct
	{
		T? value = null;
		config?.TryGetValue(API.GetWorldLevel(), out value);
		return value;
	}

	public static T? ReadFromConfig<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 1, 0 })] Func<CreatureConfig, SortedDictionary<CreatureConfig.CreatureFilter, T>> configGetter) where T : struct
	{
		return CreatureModeChooser<T>(character, (FromConfigReader<T, T?>)((T v) => v), configGetter);
	}

	public static T? ReadFromConfig<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 0 })] Func<CreatureConfig, T?> configGetter) where T : struct
	{
		CreatureConfig creatureConfig = readCharacterConfig(character);
		return (creatureConfig != null) ? configGetter(creatureConfig) : ((T?)null);
	}

	public static T? ReadFromConfig<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] ItemData item, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 0 })] Func<ItemConfig, T?> configGetter) where T : struct
	{
		GameObject dropPrefab = item.m_dropPrefab;
		T? result;
		if (dropPrefab != null)
		{
			ItemConfig itemConfig = ReadItemConfig(dropPrefab);
			if (itemConfig != null)
			{
				result = configGetter(itemConfig);
				goto IL_0026;
			}
		}
		result = null;
		goto IL_0026;
		IL_0026:
		return result;
	}

	public static T? ReadFromConfig<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] ItemDrop item, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 0 })] Func<ItemConfig, T?> configGetter) where T : struct
	{
		return ReadFromConfig(item.m_itemData, configGetter);
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	public static T ReadFromConfig<T>(Character character, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })] Func<CreatureConfig, T> configGetter) where T : class
	{
		CreatureConfig creatureConfig = readCharacterConfig(character);
		return (creatureConfig != null) ? configGetter(creatureConfig) : null;
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	public static T ReadFromConfig<T>(ItemData item, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })] Func<ItemConfig, T> configGetter) where T : class
	{
		GameObject dropPrefab = item.m_dropPrefab;
		T result;
		if (dropPrefab != null)
		{
			ItemConfig itemConfig = ReadItemConfig(dropPrefab);
			if (itemConfig != null)
			{
				result = configGetter(itemConfig);
				goto IL_0026;
			}
		}
		result = null;
		goto IL_0026;
		IL_0026:
		return result;
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	public static T ReadFromConfig<T>(ItemDrop item, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })] Func<ItemConfig, T> configGetter) where T : class
	{
		return ReadFromConfig(item.m_itemData, configGetter);
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	public static ItemConfig ReadItemConfig(GameObject itemPrefab)
	{
		if (CreatureLevelControl.itemConfigFileActive.GetToggle() && CreatureLevelControl.ItemConfig.TryGetValue(((Object)itemPrefab).name, out var value))
		{
			return value;
		}
		return null;
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	private static CreatureConfig readCharacterConfig(Character character)
	{
		ZNetScene instance = ZNetScene.instance;
		object obj;
		if (instance == null)
		{
			obj = null;
		}
		else
		{
			GameObject prefab = instance.GetPrefab(((Object)character).name.Replace("(Clone)", ""));
			obj = ((prefab == null) ? null : prefab.GetComponent<Character>()?.m_name);
		}
		if (obj == null)
		{
			obj = character.m_name;
		}
		string key = (string)obj;
		if (CreatureLevelControl.creatureConfigFileActive.GetToggle() && CreatureLevelControl.PrefabConfig.TryGetValue(key, out var value))
		{
			return value;
		}
		return null;
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	public static string GetEnumDescription(Enum value)
	{
		FieldInfo field = value.GetType().GetField(value.ToString());
		if (field.GetCustomAttributes(typeof(DescriptionAttribute), inherit: false) is DescriptionAttribute[] source && source.Any())
		{
			return source.First().Description;
		}
		return value.ToString();
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	public static float? ReadEffectPowerFromConfig(Character character, CreatureExtraEffect effect)
	{
		try
		{
			character.m_level--;
			return ReadValueFromEnumWithWorldLevelAndStarsFromConfig(character, effect, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)] [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 1, 2 })] (CreatureConfig c) => c.worldLevelToCreatureEffectFactor);
		}
		finally
		{
			character.m_level++;
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(2)]
	private static void onServerTimeReceived(ZRpc rpc, long time)
	{
		serverTime = new DateTime(time);
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	private static void onServerTimeRequest(ZRpc rpc)
	{
		rpc.Invoke("CLLC GetServerTime", new object[1] { DateTime.Now.Ticks });
	}

	public static void RequestServerTime()
	{
		ZNet instance = ZNet.instance;
		if (instance == null)
		{
			return;
		}
		if (instance.IsServer())
		{
			onServerTimeReceived(null, DateTime.Now.Ticks);
			return;
		}
		ZNetPeer serverPeer = instance.GetServerPeer();
		if (serverPeer != null)
		{
			ZRpc rpc = serverPeer.m_rpc;
			if (rpc != null)
			{
				rpc.Invoke("CLLC GetServerTime", Array.Empty<object>());
			}
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	public static AssetBundle GetAssetBundle(string filename)
	{
		Assembly executingAssembly = Assembly.GetExecutingAssembly();
		string name = executingAssembly.GetManifestResourceNames().Single((string str) => str.EndsWith(filename));
		using Stream stream = executingAssembly.GetManifestResourceStream(name);
		return AssetBundle.LoadFromStream(stream);
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	public static byte[] ReadEmbeddedFileBytes(string name)
	{
		using MemoryStream memoryStream = new MemoryStream();
		Assembly.GetExecutingAssembly().GetManifestResourceStream("CreatureLevelControl." + name)?.CopyTo(memoryStream);
		return memoryStream.ToArray();
	}

	public static ZDOID GenerateNewZDOID()
	{
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_0048: Unknown result type (might be due to invalid IL or missing references)
		//IL_0041: Unknown result type (might be due to invalid IL or missing references)
		//IL_0055: Unknown result type (might be due to invalid IL or missing references)
		//IL_0056: Unknown result type (might be due to invalid IL or missing references)
		//IL_005a: Unknown result type (might be due to invalid IL or missing references)
		ZDOMan instance = ZDOMan.instance;
		long sessionID = instance.m_sessionID;
		uint nextUid = instance.m_nextUid;
		instance.m_nextUid = nextUid + 1;
		ZDOID val = new ZDOID(sessionID, nextUid);
		while (instance.GetZDO(val) != null)
		{
			long sessionID2 = instance.m_sessionID;
			nextUid = instance.m_nextUid;
			instance.m_nextUid = nextUid + 1;
			val = new ZDOID(sessionID2, nextUid);
		}
		return val;
	}
}
