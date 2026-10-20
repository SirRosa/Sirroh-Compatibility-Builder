using System;
using System.Collections.Generic;
using JetBrains.Annotations;
using Newtonsoft.Json;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal class TreasureMap
{
	public Biome Biome;

	public int Cost;

	public int ForestTokens;

	public int GoldTokens;

	public int IronTokens;

	public int Coins;

	public float MinRadius;

	public float MaxRadius;

	internal static readonly List<TreasureMap> Treasures = new List<TreasureMap>();

	private static readonly Method API_AddTreasureMap = new Method("AddTreasureMap");

	private static readonly Method API_UpdateTreasureMap = new Method("UpdateTreasureMap");

	public TreasureMap(Biome biome, int cost, float minRadius, float maxRadius)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		Biome = biome;
		Cost = cost;
		MinRadius = minRadius;
		MaxRadius = maxRadius;
		Treasures.Add(this);
	}

	public TreasureMap()
	{
	}

	public static void RegisterAll()
	{
		foreach (TreasureMap item in new List<TreasureMap>(Treasures))
		{
			item.Register();
		}
	}

	public bool Register()
	{
		//IL_0046: Unknown result type (might be due to invalid IL or missing references)
		string text = JsonConvert.SerializeObject((object)this);
		if (!(API_AddTreasureMap.Invoke(text)[0] is string value))
		{
			return false;
		}
		RunTimeRegistry.Register(this, value);
		Treasures.Remove(this);
		EpicLoot.logger.LogDebug($"Added treasure map: {Biome}");
		return true;
	}

	public bool Update()
	{
		//IL_0048: Unknown result type (might be due to invalid IL or missing references)
		if (!RunTimeRegistry.TryGetValue(this, out string value))
		{
			return false;
		}
		string text = JsonConvert.SerializeObject((object)this);
		bool flag = (bool)(API_UpdateTreasureMap.Invoke(value, text)[0] ?? ((object)false));
		EpicLoot.logger.LogDebug($"Updated treasure map: {Biome}, {flag}");
		return flag;
	}
}
