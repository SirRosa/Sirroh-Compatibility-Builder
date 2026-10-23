using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Helper;
using UnityEngine;

namespace AzuAutoStore.APIs.MUC.MUCSrc;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
public class HumanoidExtend : MonoBehaviour
{
	private static readonly ConditionalWeakTable<Inventory, HumanoidInventoryOwner> Humanoids = new ConditionalWeakTable<Inventory, HumanoidInventoryOwner>();

	private Inventory inventory;

	private void Awake()
	{
		UpdateInventory();
	}

	private void Start()
	{
		UpdateInventory();
	}

	private void UpdateInventory()
	{
		Humanoid humanoid = default;
		if (!((Component)this).TryGetComponent<Humanoid>(ref humanoid))
		{
			return;
		}
		inventory = humanoid.GetInventory();
		if (inventory == null)
		{
			return;
		}
		foreach (Inventory inventory in inventory.GetInventories())
		{
			Humanoids.TryAdd(inventory, (Inventory i) => new HumanoidInventoryOwner(humanoid, i));
		}
	}

	private void OnDestroy()
	{
		if (inventory == null)
		{
			return;
		}
		foreach (Inventory inventory in inventory.GetInventories())
		{
			Humanoids.Remove(inventory);
		}
	}

	public static bool GetHumanoid(Inventory inventory, out HumanoidInventoryOwner humanoid)
	{
		return Humanoids.TryGetValue(inventory, out humanoid);
	}
}
