namespace Slayer;

internal static class SlayerWeapons
{
	public static bool IsSlayerWeapon(ItemData weapon)
	{
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Invalid comparison between Unknown and I4
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0033: Unknown result type (might be due to invalid IL or missing references)
		//IL_0035: Unknown result type (might be due to invalid IL or missing references)
		//IL_0037: Unknown result type (might be due to invalid IL or missing references)
		//IL_0038: Unknown result type (might be due to invalid IL or missing references)
		//IL_003a: Unknown result type (might be due to invalid IL or missing references)
		//IL_005c: Expected I4, but got Unknown
		if (weapon == null)
		{
			return false;
		}
		if ((int)weapon.m_shared.m_itemType != 14)
		{
			return false;
		}
		SkillType skillType = weapon.m_shared.m_skillType;
		SkillType val = skillType;
		switch (val - 1)
		{
		case 0:
		case 2:
		case 3:
		case 6:
			return true;
		default:
			return false;
		}
	}
}
