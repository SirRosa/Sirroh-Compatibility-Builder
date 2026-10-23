using System.Runtime.CompilerServices;
using UnityEngine;

namespace AzuAutoStore.Interfaces;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public interface IContainer
{
	GameObject gameObject { get; }

	ZNetView m_nview { get; }

	int TryStore();

	int TryStoreThisItem(ItemData item, Inventory playerInventory);

	bool IsOwner();
}
