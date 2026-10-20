using HarmonyLib;
using UnityEngine;

namespace Slayer;

internal static class SlayerStagger
{
	[HarmonyPatch(typeof(Character), "AddStaggerDamage")]
	private static class AddStaggerDamagePatch
	{
		[HarmonyPrefix]
		private static void Prefix(Character __instance, ref float damage, Vector3 forceDirection, HitData hit)
		{
			//IL_0081: Unknown result type (might be due to invalid IL or missing references)
			//IL_0088: Invalid comparison between Unknown and I4
			//IL_0097: Unknown result type (might be due to invalid IL or missing references)
			if (!SlayerConfig.StaggerDamageEnabled.Value || hit == null)
			{
				return;
			}
			Character attacker = hit.GetAttacker();
			if ((Object)(object)attacker == (Object)null)
			{
				return;
			}
			Player val = (Player)(object)((attacker is Player) ? attacker : null);
			if (!((Object)(object)val == (Object)null))
			{
				ItemData currentWeapon = ((Humanoid)val).GetCurrentWeapon();
				if (currentWeapon != null && SlayerWeapons.IsSlayerWeapon(currentWeapon) && (int)currentWeapon.m_shared.m_itemType == 14)
				{
					float skillFactor = ((Character)val).GetSkillFactor(Slayer.SlayerType);
					float num = skillFactor * SlayerConfig.StaggerDamageAmount.Value / 100f;
					float num2 = damage;
					damage *= 1f + num;
					bool flag = false;
				}
			}
		}
	}

	public static void Initialize()
	{
	}
}
