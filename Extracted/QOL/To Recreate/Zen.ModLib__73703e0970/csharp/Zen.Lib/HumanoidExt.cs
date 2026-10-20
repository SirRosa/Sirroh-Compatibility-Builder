using UnityEngine;

namespace Zen.Lib;

public static class HumanoidExt
{
	public static MonoBehaviour? GetHoverInteractable(this Humanoid self)
	{
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Expected Obj, but got Unknown
		GameObject hoverObject = self.GetHoverObject();
		return (MonoBehaviour)(Object.op_Implicit((Object)(object)hoverObject) ? hoverObject.GetComponentInParent<Interactable>() : null);
	}

	public static bool IsUnarmed(this Humanoid self)
	{
		if (self.GetLeftItem() == null)
		{
			return self.GetRightItem() == null;
		}
		return false;
	}

	public static bool IsUsingRangedWeapon(this Humanoid self)
	{
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0021: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Unknown result type (might be due to invalid IL or missing references)
		//IL_0024: Invalid comparison between Unknown and I4
		//IL_0026: Unknown result type (might be due to invalid IL or missing references)
		//IL_0028: Invalid comparison between Unknown and I4
		//IL_003b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0040: Unknown result type (might be due to invalid IL or missing references)
		//IL_0041: Unknown result type (might be due to invalid IL or missing references)
		//IL_0043: Invalid comparison between Unknown and I4
		//IL_0045: Unknown result type (might be due to invalid IL or missing references)
		//IL_0048: Invalid comparison between Unknown and I4
		//IL_004a: Unknown result type (might be due to invalid IL or missing references)
		//IL_004d: Invalid comparison between Unknown and I4
		if (self.IsUnarmed())
		{
			return false;
		}
		ItemData currentWeapon = self.GetCurrentWeapon();
		AttackType attackType = currentWeapon.m_shared.m_attack.m_attackType;
		if (((int)attackType == 2 || (int)attackType == 5) ? true : false)
		{
			return true;
		}
		ItemType itemType = currentWeapon.m_shared.m_itemType;
		if ((int)itemType != 3 && (int)itemType != 14)
		{
			return (int)itemType != 22;
		}
		return false;
	}

	public static bool IsUsingTool(this Humanoid self, bool includeFishingRod)
	{
		if (!self.RightItem.IsItemType((ItemType)19) && !self.LeftItem.IsItemType((ItemType)19))
		{
			if (includeFishingRod)
			{
				return self.GetCurrentWeapon()?.GetName() == "$item_fishingrod";
			}
			return false;
		}
		return true;
	}

	public static bool IsUsingPickAxe(this Humanoid self)
	{
		if (!IsPickAxe(self.RightItem))
		{
			return IsPickAxe(self.LeftItem);
		}
		return true;
		static bool IsPickAxe(ItemData? item)
		{
			if (item != null)
			{
				return item.m_shared.m_damages.m_pickaxe > 0f;
			}
			return false;
		}
	}

	public static bool IsUsing(this Humanoid? self, ItemData item, bool rightOnly = false)
	{
		return self.IsUsing(item.GetPrefabName(), rightOnly);
	}

	public static bool IsUsing(this Humanoid? self, string itemPrefab, bool rightOnly = false)
	{
		if (!(itemPrefab == ((self == null) ? null : self.RightItem?.GetPrefabName())))
		{
			if (itemPrefab == ((self == null) ? null : self.LeftItem?.GetPrefabName()))
			{
				return !rightOnly;
			}
			return false;
		}
		return true;
	}
}
