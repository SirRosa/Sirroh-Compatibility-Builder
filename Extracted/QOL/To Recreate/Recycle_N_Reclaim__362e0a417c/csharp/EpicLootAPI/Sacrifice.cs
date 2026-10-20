using System;
using System.Collections.Generic;
using System.ComponentModel;
using JetBrains.Annotations;
using Newtonsoft.Json;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal class Sacrifice
{
	[Description("Conditional, checks item needs to be magic")]
	public bool IsMagic;

	[Description("Can be null")]
	public ItemRarity Rarity;

	[Description("Conditional, if empty, does not check if item is of correct type")]
	public List<string> ItemTypes = new List<string>();

	[Description("Conditional, if empty, does not check if item shared name is in list")]
	public List<string> ItemNames = new List<string>();

	[Description("Disenchant product entry")]
	public List<ItemAmount> Products = new List<ItemAmount>();

	internal static readonly List<Sacrifice> Sacrifices = new List<Sacrifice>();

	internal static readonly Method API_AddSacrifice = new Method("AddSacrifice");

	internal static readonly Method API_UpdateSacrifice = new Method("UpdateSacrifice");

	public Sacrifice()
	{
		Sacrifices.Add(this);
	}

	public void AddRequiredItemType(params ItemType[] types)
	{
		//IL_0009: Unknown result type (might be due to invalid IL or missing references)
		for (int i = 0; i < types.Length; i++)
		{
			ItemType val = types[i];
			ItemTypes.Add(((object)val/*cast due to constrained. prefix*/).ToString());
		}
	}

	public static void RegisterAll()
	{
		foreach (Sacrifice item in new List<Sacrifice>(Sacrifices))
		{
			item.Register();
		}
	}

	public bool Register()
	{
		string text = JsonConvert.SerializeObject((object)this);
		if (!(API_AddSacrifice.Invoke(text)[0] is string value))
		{
			return false;
		}
		Sacrifices.Remove(this);
		RunTimeRegistry.Register(this, value);
		EpicLoot.logger.LogDebug("Registered sacrifice");
		return true;
	}

	public bool Update()
	{
		if (!RunTimeRegistry.TryGetValue(this, out string value))
		{
			return false;
		}
		string text = JsonConvert.SerializeObject((object)this);
		bool flag = (bool)(API_UpdateSacrifice.Invoke(value, text)[0] ?? ((object)false));
		EpicLoot.logger.LogDebug($"Updated sacrifice: {flag}");
		return flag;
	}
}
