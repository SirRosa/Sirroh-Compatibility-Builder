using System;
using System.Collections.Generic;
using JetBrains.Annotations;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal class MagicItemEffectRequirements
{
	private static List<string> _flags = new List<string>();

	public bool NoRoll;

	public bool ExclusiveSelf = true;

	public List<string> ExclusiveEffectTypes = new List<string>();

	public List<string> MustHaveEffectTypes = new List<string>();

	public List<string> AllowedItemTypes = new List<string>();

	public List<string> ExcludedItemTypes = new List<string>();

	public List<ItemRarity> AllowedRarities = new List<ItemRarity>();

	public List<ItemRarity> ExcludedRarities = new List<ItemRarity>();

	public List<SkillType> AllowedSkillTypes = new List<SkillType>();

	public List<SkillType> ExcludedSkillTypes = new List<SkillType>();

	public List<string> AllowedItemNames = new List<string>();

	public List<string> ExcludedItemNames = new List<string>();

	public bool? ItemHasPhysicalDamage;

	public bool? ItemHasElementalDamage;

	public bool? ItemHasChopDamage;

	public bool? ItemUsesDurability;

	public bool? ItemHasNegativeMovementSpeedModifier;

	public bool? ItemHasBlockPower;

	public bool? ItemHasParryPower;

	public bool? ItemHasNoParryPower;

	public bool? ItemHasArmor;

	public bool? ItemHasBackstabBonus;

	public bool? ItemUsesStaminaOnAttack;

	public bool? ItemUsesEitrOnAttack;

	public bool? ItemUsesHealthOnAttack;

	public bool? ItemUsesDrawStaminaOnAttack;

	public bool? ItemGivesAdrenaline;

	public bool? ItemHasAdrenaline;

	public List<string> CustomFlags = new List<string>();

	public List<string> ExternalRequirements = new List<string>();

	public void AddAllowedItemTypes(params ItemType[] types)
	{
		//IL_0009: Unknown result type (might be due to invalid IL or missing references)
		for (int i = 0; i < types.Length; i++)
		{
			ItemType val = types[i];
			AllowedItemTypes.Add(((object)val/*cast due to constrained. prefix*/).ToString());
		}
	}

	public void AddExcludedItemTypes(params ItemType[] types)
	{
		//IL_0009: Unknown result type (might be due to invalid IL or missing references)
		for (int i = 0; i < types.Length; i++)
		{
			ItemType val = types[i];
			ExcludedItemTypes.Add(((object)val/*cast due to constrained. prefix*/).ToString());
		}
	}
}
