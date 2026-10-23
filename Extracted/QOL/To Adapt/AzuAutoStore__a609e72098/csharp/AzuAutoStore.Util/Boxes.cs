using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using AzuAutoStore.APIs;
using AzuAutoStore.Interfaces;
using AzuAutoStore.Patches;
using Backpacks;
using ItemDataManager;
using UnityEngine;

namespace AzuAutoStore.Util;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public class Boxes
{
	internal static readonly List<Container> Containers = new List<Container>();

	private static readonly List<Container> ContainersToAdd = new List<Container>();

	private static readonly List<Container> ContainersToRemove = new List<Container>();

	internal static readonly List<IContainer> ContainersToPing = new List<IContainer>();

	internal static bool StoringPaused;

	internal static void AddContainer(Container container)
	{
		if (!Containers.Contains(container))
		{
			ContainersToAdd.Add(container);
			AzuAutoStorePlugin.AzuAutoStoreLogger.LogDebug((object)("Added container " + ((Object)container).name + " to list"));
		}
		UpdateContainers();
	}

	internal static void RemoveContainer(Container container)
	{
		if (Containers.Contains(container))
		{
			ContainersToRemove.Add(container);
			if (Object.op_Implicit((Object)(object)container))
			{
				AzuAutoStorePlugin.AzuAutoStoreLogger.LogDebug((object)("Removed container " + ((Object)container).name + " from list"));
			}
		}
		UpdateContainers();
	}

	internal static void PruneDestroyed()
	{
		for (int num = Containers.Count - 1; num >= 0; num--)
		{
			Container val = Containers[num];
			if (!Object.op_Implicit((Object)(object)val) || !Object.op_Implicit((Object)(object)((Component)val).transform) || val.GetInventory() == null)
			{
				Containers.RemoveAt(num);
			}
		}
	}

	internal static void UpdateContainers()
	{
		Containers.AddRange(ContainersToAdd);
		ContainersToAdd.Clear();
		foreach (Container item in ContainersToRemove)
		{
			Containers.Remove(item);
		}
		ContainersToRemove.Clear();
	}

	internal static List<IContainer> GetNearbyContainers<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)] T>(T gameObject, float rangeToUse) where T : Component
	{
		//IL_003c: Unknown result type (might be due to invalid IL or missing references)
		//IL_004c: Unknown result type (might be due to invalid IL or missing references)
		//IL_01ee: Unknown result type (might be due to invalid IL or missing references)
		//IL_0226: Unknown result type (might be due to invalid IL or missing references)
		List<IContainer> list = new List<IContainer>();
		foreach (Container container in Containers)
		{
			if (!((Object)(object)gameObject == (Object)null) && !((Object)(object)container == (Object)null))
			{
				float num = Vector3.Distance(((Component)container).transform.position, ((Component)gameObject).transform.position);
				if (num <= rangeToUse)
				{
					AzuAutoStorePlugin.AzuAutoStoreLogger.LogDebug((object)$"Distance to container {((Object)container).name} is {num}m, within the range of {rangeToUse}m set to store items for this chest");
					list.Add(VanillaContainers.Create(container));
				}
			}
		}
		IEnumerable<IContainer> second = new List<IContainer>();
		List<IContainer> list2 = new List<IContainer>();
		if (AzuAutoStorePlugin.BackpacksIsLoaded && AzuAutoStorePlugin.DontStoreToBackpacks.Value.IsOff())
		{
			foreach (ItemData item2 in from x in ((Humanoid)Player.m_localPlayer).GetInventory().GetAllItems()
				where ((x == null) ? null : _003C35e5ab3c_002D7099_002D45c6_002Dac00_002Db53ba5a87838_003EItemExtensions.Data(x, "org.bepinex.plugins.backpacks")?.Get<ItemContainer>()) != null
				select x)
			{
				BackpackContainer item = BackpackContainer.Create((item2 == null) ? null : _003C35e5ab3c_002D7099_002D45c6_002Dac00_002Db53ba5a87838_003EItemExtensions.Data(item2, "org.bepinex.plugins.backpacks")?.Get<ItemContainer>());
				if (!list2.Contains(item))
				{
					list2.Add(item);
				}
			}
			second = list2;
		}
		List<IContainer> list3 = new List<IContainer>();
		if (BowsBeforeHoesCompat.IsLoaded && AzuAutoStorePlugin.DontStoreToBackpacks.Value.IsOff())
		{
			foreach (ItemData allItem in ((Humanoid)Player.m_localPlayer).GetInventory().GetAllItems())
			{
				Inventory inventory = BowsBeforeHoesCompat.GetInventory(allItem);
				if (inventory != null)
				{
					list3.Add(new BowsBeforeHoesQuiver(allItem, inventory));
				}
			}
		}
		IEnumerable<IContainer> second2 = ItemDrawers_API.AllDrawersInRange(((Component)gameObject).transform.position, rangeToUse).Select(kgDrawer.Create);
		IEnumerable<IContainer> second3 = MkzItemDrawers_API.AllDrawersInRange(((Component)gameObject).transform.position, rangeToUse).Select(mkzDrawer.Create);
		return list.Concat(second2).Concat(second3).Concat(second)
			.Concat(list3)
			.ToList();
	}

	public static void AddContainerIfNotExists(string containerName)
	{
		if (AzuAutoStorePlugin.yamlData != null && !AzuAutoStorePlugin.yamlData.ContainsKey(containerName))
		{
			AzuAutoStorePlugin.yamlData[containerName] = new Dictionary<string, object>
			{
				{
					"exclude",
					new List<string>()
				},
				{
					"includeOverride",
					new List<string>()
				}
			};
			YamlUtils.WriteYaml(AzuAutoStorePlugin.yamlPath);
		}
	}

	[return: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(new byte[] { 1, 1, 1, 2 })]
	public static Dictionary<string, List<string>> GetExcludedPrefabsForAllContainers()
	{
		Dictionary<string, List<string>> dictionary = new Dictionary<string, List<string>>();
		foreach (string allContainer in GetAllContainers())
		{
			dictionary[allContainer] = GetExcludedPrefabs(allContainer);
		}
		return dictionary;
	}

	[return: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(new byte[] { 2, 1 })]
	public static List<string> GetAllContainers()
	{
		return AzuAutoStorePlugin.yamlData?.Keys.Where([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (string key) => key != "groups").ToList();
	}

	public static bool CanItemBeStored(string container, string prefab)
	{
		if (AzuAutoStorePlugin.yamlData == null)
		{
			AzuAutoStorePlugin.AzuAutoStoreLogger.LogError((object)"yamlData is null.");
			return false;
		}
		if (!AzuAutoStorePlugin.yamlData.ContainsKey(container))
		{
			return true;
		}
		if (!(AzuAutoStorePlugin.yamlData[container] is Dictionary<object, object> dict))
		{
			AzuAutoStorePlugin.AzuAutoStoreLogger.LogError((object)("Unable to cast containerData for container '" + container + "' to Dictionary<object, object>."));
			return false;
		}
		List<object> list = (GetValueCaseInsensitive(dict, "exclude") as List<object>) ?? new List<object>();
		if (((GetValueCaseInsensitive(dict, "includeOverride") as List<object>) ?? new List<object>()).Contains(prefab))
		{
			return true;
		}
		foreach (object item in list)
		{
			if (prefab.Equals(item))
			{
				return false;
			}
			if (GroupUtils.IsGroupDefined((string)item) && GroupUtils.GetItemsInGroup((string)item).Contains(prefab))
			{
				return false;
			}
		}
		return true;
	}

	internal static bool IsPrefabExcluded(string prefab, List<object> exclusionList)
	{
		if (exclusionList != null)
		{
			foreach (object exclusion in exclusionList)
			{
				string text = exclusion.ToString();
				if (AzuAutoStorePlugin.groups.TryGetValue(text, out var value))
				{
					if (value.Contains(prefab))
					{
						return true;
					}
				}
				else if (text == prefab)
				{
					return true;
				}
			}
		}
		return false;
	}

	[return: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(new byte[] { 1, 2 })]
	public static List<string> GetExcludedPrefabs(string container)
	{
		if (AzuAutoStorePlugin.yamlData != null && AzuAutoStorePlugin.yamlData.TryGetValue(container, out var value) && value is Dictionary<object, object> dict)
		{
			object valueCaseInsensitive = GetValueCaseInsensitive(dict, "exclude");
			if (valueCaseInsensitive != null && valueCaseInsensitive is List<object> list)
			{
				List<string> list2 = new List<string>();
				{
					foreach (object item in list)
					{
						string text = item.ToString();
						if (AzuAutoStorePlugin.groups.TryGetValue(text, out var value2))
						{
							list2.AddRange(value2);
						}
						else
						{
							list2.Add(text);
						}
					}
					return list2;
				}
			}
		}
		return new List<string>();
	}

	internal static void RPC_RequestPause(long sender, bool pause, Container container)
	{
		if (container.m_nview.IsValid() && container.m_nview.IsOwner())
		{
			container.m_nview.GetZDO().Set(ContainerAwakePatch.storingPausedHash, pause);
		}
	}

	[return: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	internal static object GetValueCaseInsensitive(Dictionary<object, object> dict, string key)
	{
		foreach (KeyValuePair<object, object> item in dict)
		{
			if (string.Equals(item.Key?.ToString(), key, StringComparison.OrdinalIgnoreCase))
			{
				return item.Value;
			}
		}
		return null;
	}
}
