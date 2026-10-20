using System;
using System.Collections.Generic;

namespace Zen.Lib;

public static class BiomeExt
{
	private static readonly Dictionary<string, Biome> BiomeNameLookup;

	static BiomeExt()
	{
		BiomeNameLookup = new Dictionary<string, Biome>();
		InitBiomeNameLookup();
	}

	private static void InitBiomeNameLookup()
	{
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Unknown result type (might be due to invalid IL or missing references)
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		//IL_0026: Unknown result type (might be due to invalid IL or missing references)
		//IL_002c: Invalid comparison between Unknown and I4
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0034: Invalid comparison between Unknown and I4
		//IL_0044: Unknown result type (might be due to invalid IL or missing references)
		//IL_004a: Unknown result type (might be due to invalid IL or missing references)
		foreach (Biome value in Enum.GetValues(typeof(Biome)))
		{
			if (((int)value != 0 && (int)value != 639 && (int)value != 895) || 1 == 0)
			{
				BiomeNameLookup.Add(value.GetName(), value);
			}
		}
	}

	public static bool TryGetBiomeFromTranslationName(this string name, out Biome biome)
	{
		return BiomeNameLookup.TryGetValue(name, out biome);
	}

	public static string GetName(this Biome biome)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0003: Unknown result type (might be due to invalid IL or missing references)
		//IL_0009: Invalid comparison between Unknown and I4
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Invalid comparison between Unknown and I4
		//IL_0021: Unknown result type (might be due to invalid IL or missing references)
		if (((int)biome != 0 && (int)biome != 639 && (int)biome != 895) || 1 == 0)
		{
			return $"$biome_{biome}".ToLowerInvariant();
		}
		return string.Empty;
	}

	public static string Localize(this Biome biome)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		return biome.GetName().Localize();
	}
}
