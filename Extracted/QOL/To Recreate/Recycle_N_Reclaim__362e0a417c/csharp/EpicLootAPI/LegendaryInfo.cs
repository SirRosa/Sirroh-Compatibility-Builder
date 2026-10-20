using System;
using System.Collections.Generic;
using JetBrains.Annotations;
using Newtonsoft.Json;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal class LegendaryInfo
{
	public string ID = "";

	public string Name = "";

	public string Description = "";

	public MagicItemEffectRequirements Requirements = new MagicItemEffectRequirements();

	public List<GuaranteedMagicEffect> GuaranteedMagicEffects = new List<GuaranteedMagicEffect>();

	public int GuaranteedEffectCount = -1;

	public float SelectionWeight = 1f;

	public string EquipFx = "";

	public FxAttachMode EquipFxMode = FxAttachMode.Player;

	public List<TextureReplacement> TextureReplacements = new List<TextureReplacement>();

	public bool IsSetItem;

	public bool Enchantable;

	public List<RecipeRequirement> EnchantCost = new List<RecipeRequirement>();

	private LegendaryType type;

	internal static readonly List<LegendaryInfo> LegendaryItems = new List<LegendaryInfo>();

	internal static readonly Method API_AddLegendaryItem = new Method("AddLegendaryItem");

	internal static readonly Method API_UpdateLegendaryItem = new Method("UpdateLegendaryItem");

	public LegendaryInfo(LegendaryType type, string ID, string name, string description)
	{
		this.ID = ID;
		Name = name;
		Description = description;
		this.type = type;
		LegendaryItems.Add(this);
	}

	public LegendaryInfo()
	{
	}

	public static void RegisterAll()
	{
		foreach (LegendaryInfo item in new List<LegendaryInfo>(LegendaryItems))
		{
			item.Register();
		}
	}

	public bool Register()
	{
		string text = JsonConvert.SerializeObject((object)this);
		if (!(API_AddLegendaryItem.Invoke(type.ToString(), text)[0] is string value))
		{
			return false;
		}
		RunTimeRegistry.Register(this, value);
		LegendaryItems.Remove(this);
		EpicLoot.logger.LogDebug("Registered legendary item: " + ID);
		return true;
	}

	public bool Update()
	{
		if (!RunTimeRegistry.TryGetValue(this, out string value))
		{
			return false;
		}
		string text = JsonConvert.SerializeObject((object)this);
		bool flag = (bool)(API_UpdateLegendaryItem.Invoke(value, text)[0] ?? ((object)false));
		EpicLoot.logger.LogDebug($"Updated legendary item: {ID}, {flag}");
		return flag;
	}
}
