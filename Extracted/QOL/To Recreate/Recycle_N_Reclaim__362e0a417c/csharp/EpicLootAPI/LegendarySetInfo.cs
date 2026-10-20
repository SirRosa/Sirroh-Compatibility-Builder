using System;
using System.Collections.Generic;
using JetBrains.Annotations;
using Newtonsoft.Json;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal class LegendarySetInfo
{
	public string ID = "";

	public string Name = "";

	public List<string> LegendaryIDs = new List<string>();

	public List<SetBonusInfo> SetBonuses = new List<SetBonusInfo>();

	private LegendaryType type;

	internal static readonly List<LegendarySetInfo> LegendarySets = new List<LegendarySetInfo>();

	internal static readonly Method API_AddLegendarySet = new Method("AddLegendarySet");

	internal static readonly Method API_UpdateLegendarySet = new Method("UpdateLegendarySet");

	public LegendarySetInfo(LegendaryType type, string ID, string name)
	{
		this.ID = ID;
		Name = name;
		this.type = type;
		LegendarySets.Add(this);
	}

	public LegendarySetInfo()
	{
	}

	public static void RegisterAll()
	{
		foreach (LegendarySetInfo item in new List<LegendarySetInfo>(LegendarySets))
		{
			item.Register();
		}
	}

	public bool Register()
	{
		string text = JsonConvert.SerializeObject((object)this);
		if (!(API_AddLegendarySet.Invoke(type.ToString(), text)[0] is string value))
		{
			return false;
		}
		RunTimeRegistry.Register(this, value);
		EpicLoot.logger.LogDebug("Registered legendary set: " + ID);
		return true;
	}

	public bool Update()
	{
		if (!RunTimeRegistry.TryGetValue(this, out string value))
		{
			return false;
		}
		string text = JsonConvert.SerializeObject((object)this);
		bool flag = (bool)(API_UpdateLegendarySet.Invoke(value, text)[0] ?? ((object)false));
		EpicLoot.logger.LogDebug($"Updated legendary set: {ID}, {flag}");
		return flag;
	}
}
