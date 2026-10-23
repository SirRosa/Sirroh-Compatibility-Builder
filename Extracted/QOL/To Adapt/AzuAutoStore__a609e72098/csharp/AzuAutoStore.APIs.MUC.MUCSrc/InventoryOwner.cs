using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Patches;
using UnityEngine;

namespace AzuAutoStore.APIs.MUC.MUCSrc;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
public abstract class InventoryOwner
{
	public abstract ZNetView ZNetView { get; }

	public abstract Inventory Inventory { get; }

	public virtual bool IsValid()
	{
		if (Object.op_Implicit((Object)(object)ZNetView) && ZNetView.HasOwner())
		{
			return Inventory != null;
		}
		return false;
	}

	public static InventoryOwner GetOwner(Inventory inventory)
	{
		if (inventory == null)
		{
			return null;
		}
		if (HumanoidExtend.GetHumanoid(inventory, out var humanoid))
		{
			return humanoid;
		}
		if (ContainerExtend.GetContainer(inventory, out var container))
		{
			return container;
		}
		return null;
	}

	public static InventoryOwner GetOwner(ItemData item)
	{
		if (item == null)
		{
			return null;
		}
		if (InventoryPatch.InventoryOfItem.TryGetValue(item, out var value))
		{
			return GetOwner(value);
		}
		return null;
	}

	public string GetDescription()
	{
		if (!IsValid())
		{
			return "-";
		}
		return $"{Inventory.GetName()} ({GetType().Name}), is owner: {ZNetView.IsOwner()}";
	}
}
