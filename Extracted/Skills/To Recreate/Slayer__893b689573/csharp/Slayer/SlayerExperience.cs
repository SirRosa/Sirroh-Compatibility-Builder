using HarmonyLib;

namespace Slayer;

internal static class SlayerExperience
{
	[HarmonyPatch(typeof(Character), "Damage")]
	private static class ExperiencePatch
	{
		private static void Prefix(Character __instance, HitData hit)
		{
			//IL_005c: Unknown result type (might be due to invalid IL or missing references)
			Character attacker = hit.GetAttacker();
			Player val = (Player)(object)((attacker is Player) ? attacker : null);
			if (val != null)
			{
				ItemData currentWeapon = ((Humanoid)val).GetCurrentWeapon();
				if (currentWeapon != null && SlayerWeapons.IsSlayerWeapon(currentWeapon) && !(hit.m_damage.GetTotalDamage() <= 0f))
				{
					((Character)val).RaiseSkill(Slayer.SlayerType, 0.5f);
				}
			}
		}
	}

	public static void Initialize()
	{
		Slayer.DebugLog("Experience system initialized.");
	}
}
