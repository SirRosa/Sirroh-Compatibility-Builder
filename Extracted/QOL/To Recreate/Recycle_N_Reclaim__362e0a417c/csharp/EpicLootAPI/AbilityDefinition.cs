using System;
using System.Collections.Generic;
using System.ComponentModel;
using JetBrains.Annotations;
using Newtonsoft.Json;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal class AbilityDefinition
{
	public string ID = "";

	public string IconAsset = "";

	public AbilityActivationMode ActivationMode;

	public float Cooldown;

	public AbilityAction Action;

	public List<string> ActionParams = new List<string>();

	internal static readonly Method API_AddAbility = new Method("AddAbility");

	internal static readonly Method API_UpdateAbility = new Method("UpdateAbility");

	internal static List<AbilityDefinition> Abilities = new List<AbilityDefinition>();

	[Description("Register a status effect ability which activates on player input")]
	public AbilityDefinition(string ID, string iconAsset, float cooldown, string statusEffectName)
	{
		this.ID = ID;
		ActivationMode = AbilityActivationMode.Activated;
		Cooldown = cooldown;
		Action = AbilityAction.StatusEffect;
		ActionParams.Add(statusEffectName);
		IconAsset = iconAsset;
		Abilities.Add(this);
	}

	internal AbilityDefinition(string ID, AbilityActivationMode mode)
	{
		this.ID = ID;
		ActivationMode = mode;
	}

	public AbilityDefinition()
	{
	}

	public static void RegisterAll()
	{
		foreach (AbilityDefinition item in new List<AbilityDefinition>(Abilities))
		{
			item.Register();
		}
	}

	public bool Register()
	{
		string text = JsonConvert.SerializeObject((object)this);
		if (!(API_AddAbility.Invoke(text)[0] is string value))
		{
			return false;
		}
		RunTimeRegistry.Register(this, value);
		Abilities.Remove(this);
		EpicLoot.logger.LogDebug("Registered ability: " + ID);
		return true;
	}

	public bool Update()
	{
		if (!RunTimeRegistry.TryGetValue(this, out string value))
		{
			return false;
		}
		string text = JsonConvert.SerializeObject((object)this);
		bool flag = (bool)(API_UpdateAbility.Invoke(value, text)[0] ?? ((object)false));
		EpicLoot.logger.LogDebug($"Updated ability {ID}: {flag}");
		return flag;
	}
}
