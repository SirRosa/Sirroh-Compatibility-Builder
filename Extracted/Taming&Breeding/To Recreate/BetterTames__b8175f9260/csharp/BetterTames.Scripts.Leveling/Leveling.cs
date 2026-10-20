using System;
using HarmonyLib;
using UnityEngine;

namespace BetterTames.Scripts.Leveling;

public static class Leveling
{
	private const int MaxLevel = 3;

	private static readonly FieldRef<Character, HitData> LastHit = AccessTools.FieldRefAccess<Character, HitData>("m_lastHit");

	private static readonly Func<Character, float> GetMaxHealth = AccessTools.MethodDelegate<Func<Character, float>>(AccessTools.Method(typeof(Character), "GetMaxHealth", (Type[])null, (Type[])null), (object)null, true);

	private static readonly Action<Character, float> SetHealth = AccessTools.MethodDelegate<Action<Character, float>>(AccessTools.Method(typeof(Character), "SetHealth", (Type[])null, (Type[])null), (object)null, true);

	public static void OnDeath(Character victim)
	{
		if (!Plugin.starUpOnKill.Value)
		{
			return;
		}
		HitData obj = LastHit.Invoke(victim);
		Character val = ((obj != null) ? obj.GetAttacker() : null);
		if ((Object)(object)val == (Object)null || !val.IsTamed() || val.GetLevel() >= 6)
		{
			return;
		}
		ZNetView component = ((Component)val).GetComponent<ZNetView>();
		if ((Object)(object)component == (Object)null || !component.IsValid() || !component.IsOwner())
		{
			return;
		}
		int num = Mathf.Max(0, victim.GetLevel() - val.GetLevel());
		int num2 = Plugin.starUpBaseChance.Value + num * Plugin.starUpBonusPerStar.Value;
		if (!(Random.Range(0f, 100f) >= (float)num2))
		{
			val.SetLevel(val.GetLevel() + 1);
			if (Plugin.healOnStarUp.Value)
			{
				SetHealth(val, GetMaxHealth(val));
			}
		}
	}
}
