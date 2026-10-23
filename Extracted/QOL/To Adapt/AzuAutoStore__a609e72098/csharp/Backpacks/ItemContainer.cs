using System.Runtime.CompilerServices;
using ItemDataManager;
using JetBrains.Annotations;

namespace Backpacks;

[PublicAPI]
[_003Cc022682b_002D83ab_002D49b3_002D8219_002D142fcecb6471_003ENullableContext(1)]
[_003Cbfd2a42b_002D08e3_002D4dca_002Db590_002Da8bbce16f5dc_003ENullable(0)]
internal class ItemContainer : BackpacksItemData
{
	public readonly Inventory Inventory;

	public ItemContainer()
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_002f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0035: Unknown result type (might be due to invalid IL or missing references)
		//IL_003f: Expected Obj, but got Unknown
		Vector2i defaultContainerSize = GetDefaultContainerSize();
		Player localPlayer = Player.m_localPlayer;
		Inventory = new Inventory("Items", (localPlayer != null) ? ((Humanoid)localPlayer).GetInventory().m_bkg : null, defaultContainerSize.x, defaultContainerSize.y);
	}

	public virtual Vector2i GetDefaultContainerSize()
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		return default;
	}

	public bool Resize(Vector2i dimensions)
	{
		return false;
	}

	public virtual bool IsEquipable()
	{
		return true;
	}

	public virtual Unique Uniqueness()
	{
		return Unique.None;
	}

	public virtual bool ShowTakeAllButton()
	{
		return true;
	}

	public virtual bool AllowOpeningByKeypress()
	{
		return true;
	}

	public virtual string GetContainerTitle()
	{
		return Localization.instance.Localize(Item.m_shared.m_name);
	}

	public virtual string GetPressOpenText()
	{
		return "Press [" + Localization.instance.Localize("<color=yellow><b>$KEY_Use</b></color>") + "] to open";
	}

	public virtual bool IgnoresTeleportable()
	{
		return false;
	}

	public virtual float WeightFactor()
	{
		return 1f;
	}

	public virtual bool CanAddItem(ItemData item)
	{
		return false;
	}

	public virtual bool CanAddItemManually(ItemData item)
	{
		return CanAddItem(item);
	}

	public virtual bool CanRemoveItem(ItemData item)
	{
		return true;
	}

	public virtual bool RemoveItem(ItemData item)
	{
		return true;
	}

	public virtual bool MayAutoPickup(ItemData item)
	{
		return false;
	}

	public virtual bool AllowStacking()
	{
		return true;
	}

	public virtual bool CanBePutInContainer()
	{
		return false;
	}

	public virtual bool Open()
	{
		return true;
	}

	public virtual void Close()
	{
	}

	public override void Save()
	{
	}

	public override void Load()
	{
	}
}
