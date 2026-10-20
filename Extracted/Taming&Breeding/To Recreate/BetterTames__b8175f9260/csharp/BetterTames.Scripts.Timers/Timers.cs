using System;
using System.Collections.Generic;
using BetterTames.Scripts.Protection;
using HarmonyLib;
using UnityEngine;

namespace BetterTames.Scripts.Timers;

public static class Timers
{
	private static readonly FieldRef<Character, ZNetView> NView = AccessTools.FieldRefAccess<Character, ZNetView>("m_nview");

	private static readonly List<Player> NearbyPlayers = new List<Player>();

	private static readonly List<string> Lines = new List<string>();

	public static string AddTo(Character character, string hoverText)
	{
		ZNetView val = NView.Invoke(character);
		if ((Object)(object)val == (Object)null || !val.IsValid() || (Object)(object)ZNet.instance == (Object)null)
		{
			return hoverText;
		}
		ZDO zDO = val.GetZDO();
		Lines.Clear();
		Add(Taming(character, zDO));
		Add(Breeding(character, zDO));
		Add(Growth(character, zDO));
		Add(BetterTames.Scripts.Protection.Protection.HoverLine(character, zDO));
		if (Lines.Count == 0)
		{
			return hoverText;
		}
		string text = string.Join("\n", Lines);
		if (hoverText.Length == 0)
		{
			return character.GetHoverName() + "\n" + text;
		}
		int num = hoverText.IndexOf('\n');
		if (num >= 0)
		{
			return hoverText.Substring(0, num) + "\n" + text + hoverText.Substring(num);
		}
		return hoverText + "\n" + text;
	}

	private static void Add(string? line)
	{
		if (line != null)
		{
			Lines.Add(line);
		}
	}

	private static string? Taming(Character character, ZDO zdo)
	{
		if (!Plugin.showTamingTimer.Value || character.IsTamed())
		{
			return null;
		}
		Tameable component = ((Component)character).GetComponent<Tameable>();
		if ((Object)(object)component == (Object)null)
		{
			return null;
		}
		float num = zdo.GetFloat(ZDOVars.s_tameTimeLeft, component.m_tamingTime);
		if (num >= component.m_tamingTime)
		{
			return null;
		}
		string text = "Tamed in " + Format(num / TamingSpeed(component));
		BaseAI baseAI = character.GetBaseAI();
		if (component.IsHungry() || ((Object)(object)baseAI != (Object)null && baseAI.IsAlerted()))
		{
			text += " (paused)";
		}
		return text;
	}

	private static float TamingSpeed(Tameable tameable)
	{
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		float num = 1f;
		NearbyPlayers.Clear();
		Player.GetPlayersInRange(((Component)tameable).transform.position, tameable.m_tamingSpeedMultiplierRange, NearbyPlayers);
		foreach (Player nearbyPlayer in NearbyPlayers)
		{
			if (((Character)nearbyPlayer).GetSEMan().HaveStatusAttribute((StatusAttribute)8))
			{
				num *= tameable.m_tamingBoostMultiplier;
			}
		}
		return num;
	}

	private static string? Breeding(Character character, ZDO zdo)
	{
		if (!Plugin.showBreedingTimer.Value || !character.IsTamed())
		{
			return null;
		}
		Procreation component = ((Component)character).GetComponent<Procreation>();
		if ((Object)(object)component == (Object)null)
		{
			return null;
		}
		long num = zdo.GetLong(ZDOVars.s_pregnant, 0L);
		if (num == 0L)
		{
			return $"Love {zdo.GetInt(ZDOVars.s_lovePoints, 0)}/{component.m_requiredLovePoints}";
		}
		double num2 = (double)component.m_pregnancyDuration - SecondsSince(num);
		if (!(num2 > 0.0))
		{
			return "Giving birth";
		}
		return "Gives birth in " + Format(num2);
	}

	private static string? Growth(Character character, ZDO zdo)
	{
		if (!Plugin.showGrowthTimer.Value)
		{
			return null;
		}
		Growup component = ((Component)character).GetComponent<Growup>();
		if ((Object)(object)component == (Object)null)
		{
			return null;
		}
		long num = zdo.GetLong(ZDOVars.s_spawnTime, 0L);
		if (num == 0L)
		{
			return null;
		}
		double num2 = (double)component.m_growTime - SecondsSince(num);
		if (!(num2 > 0.0))
		{
			return "Growing up";
		}
		return "Grows up in " + Format(num2);
	}

	private static double SecondsSince(long ticks)
	{
		return (ZNet.instance.GetTime() - new DateTime(ticks)).TotalSeconds;
	}

	private static string Format(double seconds)
	{
		int num = Mathf.CeilToInt((float)seconds);
		if (num >= 3600)
		{
			return $"{num / 3600}h {num % 3600 / 60}m";
		}
		if (num >= 60)
		{
			return $"{num / 60}m {num % 60}s";
		}
		return $"{num}s";
	}
}
