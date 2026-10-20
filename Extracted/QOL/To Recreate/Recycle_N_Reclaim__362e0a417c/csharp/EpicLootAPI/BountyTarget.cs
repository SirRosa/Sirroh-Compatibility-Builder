using System;
using System.Collections.Generic;
using JetBrains.Annotations;
using Newtonsoft.Json;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal class BountyTarget
{
	public Biome Biome;

	public string TargetID = "";

	public int RewardGold;

	public int RewardIron;

	public int RewardCoins;

	public List<BountyMinion> Adds = new List<BountyMinion>();

	internal static readonly List<BountyTarget> BountyTargets = new List<BountyTarget>();

	internal static readonly Method API_AddBountyTarget = new Method("AddBountyTarget");

	internal static readonly Method API_UpdateBountyTarget = new Method("UpdateBountyTarget");

	public BountyTarget(Biome biome, string targetID)
	{
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		Biome = biome;
		TargetID = targetID;
		BountyTargets.Add(this);
	}

	public BountyTarget()
	{
	}

	public static void RegisterAll()
	{
		foreach (BountyTarget item in new List<BountyTarget>(BountyTargets))
		{
			item.Register();
		}
	}

	public bool Register()
	{
		string text = JsonConvert.SerializeObject((object)this);
		if (!(API_AddBountyTarget.Invoke(text)[0] is string value))
		{
			return false;
		}
		RunTimeRegistry.Register(this, value);
		BountyTargets.Remove(this);
		EpicLoot.logger.LogDebug("Registered bounty: " + TargetID);
		return true;
	}

	public bool Update()
	{
		if (!RunTimeRegistry.TryGetValue(this, out string value))
		{
			return false;
		}
		string text = JsonConvert.SerializeObject((object)this);
		bool flag = (bool)(API_UpdateBountyTarget.Invoke(value, text)[0] ?? ((object)false));
		EpicLoot.logger.LogDebug($"Updated bounty target: {TargetID}, {flag}");
		return flag;
	}
}
