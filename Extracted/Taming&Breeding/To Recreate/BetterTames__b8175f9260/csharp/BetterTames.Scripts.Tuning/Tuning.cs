using HarmonyLib;
using UnityEngine;

namespace BetterTames.Scripts.Tuning;

public static class Tuning
{
	private static readonly FieldRef<Tameable, ZNetView> TameView = AccessTools.FieldRefAccess<Tameable, ZNetView>("m_nview");

	private static readonly FieldRef<Character, float> RegenAllHpTime = AccessTools.FieldRefAccess<Character, float>("m_regenAllHPTime");

	public static void Apply(Tameable tameable)
	{
		tameable.m_tamingTime = (float)Plugin.tamingTime.Value * 60f;
		ZNetView val = TameView.Invoke(tameable);
		if (!((Object)(object)val == (Object)null) && val.IsValid() && val.IsOwner())
		{
			ZDO zDO = val.GetZDO();
			if (zDO.GetFloat(ZDOVars.s_tameTimeLeft, tameable.m_tamingTime) > tameable.m_tamingTime)
			{
				zDO.Set(ZDOVars.s_tameTimeLeft, tameable.m_tamingTime);
			}
		}
	}

	public static void Apply(Procreation procreation)
	{
		procreation.m_requiredLovePoints = Plugin.lovePoints.Value;
		procreation.m_maxCreatures = Plugin.maxCreaturesNearby.Value;
		procreation.m_totalCheckRange = Plugin.maxCreaturesRange.Value;
	}

	public static void Apply(Growup growup)
	{
		growup.m_growTime = (float)Plugin.growthTime.Value * 60f;
	}

	public static void Apply(Character character)
	{
		RegenAllHpTime.Invoke(character) = Plugin.regenTime.Value;
	}

	public static void ApplyAll()
	{
		Tameable tameable = default;
		Procreation procreation = default;
		Growup growup = default;
		foreach (Character allCharacter in Character.GetAllCharacters())
		{
			if (((Component)allCharacter).TryGetComponent<Tameable>(ref tameable))
			{
				Apply(tameable);
			}
			if (((Component)allCharacter).TryGetComponent<Procreation>(ref procreation))
			{
				Apply(procreation);
			}
			if (((Component)allCharacter).TryGetComponent<Growup>(ref growup))
			{
				Apply(growup);
			}
			if (allCharacter.IsTamed())
			{
				Apply(allCharacter);
			}
		}
	}
}
