using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Helper;
using UnityEngine;

namespace AzuAutoStore.APIs.MUC.MUCSrc;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
public class ContainerExtend : MonoBehaviour
{
	private static readonly ConditionalWeakTable<Inventory, ContainerInventoryOwner> Containers = new ConditionalWeakTable<Inventory, ContainerInventoryOwner>();

	private Inventory inventory;

	private void Awake()
	{
		Container container = default;
		if (!((Component)this).TryGetComponent<Container>(ref container))
		{
			return;
		}
		inventory = container.GetInventory();
		if (inventory != null)
		{
			Containers.TryAdd(inventory, (Inventory i) => new ContainerInventoryOwner(container));
		}
	}

	private void OnDestroy()
	{
		if (inventory != null)
		{
			Containers.Remove(inventory);
		}
	}

	public static bool GetContainer(Inventory inventory, out ContainerInventoryOwner container)
	{
		return Containers.TryGetValue(inventory, out container);
	}
}
