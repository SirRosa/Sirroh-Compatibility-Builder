using UnityEngine;

namespace Zen.Lib;

public static class ItemStandExt
{
	public static bool IsBossStone(this ItemStand itemStand)
	{
		if (Object.op_Implicit((Object)(object)itemStand.m_guardianPower))
		{
			return Object.op_Implicit((Object)(object)((Component)itemStand).GetComponentInParent<BossStone>());
		}
		if (Utils.GetPrefabName(((Object)((Component)itemStand).transform.root).name) == "StartPlatform")
		{
			return Object.op_Implicit((Object)(object)((Component)itemStand).GetComponentInParent<BossStone>());
		}
		return false;
	}

	public static bool IsAutoAttach(this ItemStand itemStand)
	{
		return itemStand.m_autoAttach;
	}

	public static bool CanBeRemoved(this ItemStand itemStand)
	{
		return itemStand.m_canBeRemoved;
	}

	public static bool HasOrientations(this ItemStand itemStand)
	{
		return itemStand.m_orientationSettings.Count > 1;
	}

	public static bool TryGetAttachedItem(this ItemStand itemStand, out ItemDrop prefab)
	{
		return GlobalStatic.TryGetPrefab<ItemDrop>(itemStand.GetAttachedItem(), out prefab, true);
	}
}
