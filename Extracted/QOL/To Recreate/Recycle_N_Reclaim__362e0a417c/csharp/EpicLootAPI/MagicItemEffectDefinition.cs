using System;
using System.Collections.Generic;
using System.ComponentModel;
using JetBrains.Annotations;
using Newtonsoft.Json;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal class MagicItemEffectDefinition
{
	public string Type = "";

	public string DisplayText = "";

	public string Description = "";

	public MagicItemEffectRequirements Requirements = new MagicItemEffectRequirements();

	public ValuesPerRarityDef ValuesPerRarity = new ValuesPerRarityDef();

	public float SelectionWeight = 1f;

	public bool CanBeAugmented = true;

	public bool CanBeDisenchanted = true;

	public string Comment = "";

	public List<string> Prefixes = new List<string>();

	public List<string> Suffixes = new List<string>();

	public string EquipFx = "";

	public FxAttachMode EquipFxMode = FxAttachMode.Player;

	public string Ability = "";

	internal static readonly List<MagicItemEffectDefinition> MagicEffects = new List<MagicItemEffectDefinition>();

	internal static readonly Method API_AddMagicEffect = new Method("AddMagicEffect");

	internal static readonly Method API_UpdateMagicEffect = new Method("UpdateMagicEffect");

	internal static readonly Method API_GetMagicEffectDefinitionCopy = new Method("GetMagicItemEffectDefinition");

	[Description("Adds your new magic item definition to a list, use Register to send to epic loot")]
	public MagicItemEffectDefinition(string effectType, string displayText = "", string description = "")
	{
		Type = effectType;
		DisplayText = displayText;
		Description = description;
		MagicEffects.Add(this);
	}

	public MagicItemEffectDefinition()
	{
	}

	public static void RegisterAll()
	{
		foreach (MagicItemEffectDefinition item in new List<MagicItemEffectDefinition>(MagicEffects))
		{
			item.Register();
		}
	}

	public static MagicItemEffectDefinition Copy(string effectType)
	{
		string text = (string)(API_GetMagicEffectDefinitionCopy.Invoke(effectType)[0] ?? "");
		if (string.IsNullOrEmpty(text))
		{
			return null;
		}
		try
		{
			return JsonConvert.DeserializeObject<MagicItemEffectDefinition>(text);
		}
		catch
		{
			EpicLoot.logger.LogWarning("Failed to parse magic item effect definition json");
			return null;
		}
	}

	public bool Register()
	{
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Expected Obj, but got Unknown
		MagicEffects.Remove(this);
		string text = JsonConvert.SerializeObject((object)this, new JsonSerializerSettings
		{
			NullValueHandling = (NullValueHandling)0
		});
		if (!(API_AddMagicEffect.Invoke(text)[0] is string value))
		{
			return false;
		}
		RunTimeRegistry.Register(this, value);
		EpicLoot.logger.LogDebug("Registered magic effect: " + Type);
		return true;
	}

	public bool Update()
	{
		if (!RunTimeRegistry.TryGetValue(this, out string value))
		{
			return false;
		}
		string text = JsonConvert.SerializeObject((object)this);
		bool flag = (bool)(API_UpdateMagicEffect.Invoke(value, text)[0] ?? ((object)false));
		EpicLoot.logger.LogDebug($"Updated magic effect: {Type}, {flag}");
		return flag;
	}
}
