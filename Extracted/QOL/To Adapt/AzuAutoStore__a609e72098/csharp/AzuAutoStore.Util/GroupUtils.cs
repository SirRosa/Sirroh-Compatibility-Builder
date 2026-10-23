using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;

namespace AzuAutoStore.Util;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(2)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
public class GroupUtils
{
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	public static List<string> GetExcludedGroups(string container)
	{
		if (AzuAutoStorePlugin.yamlData != null && AzuAutoStorePlugin.yamlData.TryGetValue(container, out var value) && value is Dictionary<object, object> dictionary && dictionary.TryGetValue("exclude", out var value2) && value2 is List<object> source)
		{
			return (from excludeItem in source
				where AzuAutoStorePlugin.groups.ContainsKey(excludeItem.ToString())
				select excludeItem.ToString()).ToList();
		}
		return new List<string>();
	}

	public static bool IsGroupDefined(string groupName)
	{
		if (AzuAutoStorePlugin.yamlData == null)
		{
			AzuAutoStorePlugin.AzuAutoStoreLogger.LogError((object)"yamlData is null. Make sure that your YAML file is not empty or to call DeserializeYamlFile() before using IsGroupDefined.");
			return false;
		}
		bool flag = false;
		if (AzuAutoStorePlugin.yamlData.ContainsKey("groups"))
		{
			if (AzuAutoStorePlugin.yamlData["groups"] is Dictionary<object, object> dictionary)
			{
				if (groupName != null)
				{
					flag = dictionary.ContainsKey(groupName);
				}
			}
			else
			{
				AzuAutoStorePlugin.AzuAutoStoreLogger.LogError((object)"Unable to cast groupsData to Dictionary<object, object>.");
			}
		}
		if (!flag)
		{
			return AzuAutoStorePlugin.groups.ContainsKey(groupName);
		}
		return true;
	}

	public static bool GroupExists(string groupName)
	{
		return AzuAutoStorePlugin.groups.ContainsKey(groupName);
	}

	[return: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(new byte[] { 1, 2 })]
	public static List<string> GetAllGroups()
	{
		return AzuAutoStorePlugin.groups.Keys.ToList();
	}

	[return: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(new byte[] { 1, 2 })]
	public static List<string> GetItemsInGroup(string groupName)
	{
		if (AzuAutoStorePlugin.groups.TryGetValue(groupName, out var value))
		{
			return value.ToList();
		}
		return new List<string>();
	}
}
