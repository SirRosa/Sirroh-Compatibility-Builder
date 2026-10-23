using System.Collections.Generic;
using System.IO;
using System.Runtime.CompilerServices;
using YamlDotNet.Serialization;

namespace AzuAutoStore.Util;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
public static class YamlUtils
{
	internal static void ReadYaml(string yamlInput)
	{
		AzuAutoStorePlugin.yamlData = new DeserializerBuilder().Build().Deserialize<Dictionary<string, object>>(yamlInput);
		AzuAutoStorePlugin.AzuAutoStoreLogger.LogDebug((object)("yamlData:\n" + yamlInput));
	}

	internal static void ParseGroups()
	{
		if (AzuAutoStorePlugin.groups == null)
		{
			AzuAutoStorePlugin.groups = new Dictionary<string, HashSet<string>>();
		}
		object value;
		if (AzuAutoStorePlugin.yamlData == null)
		{
			AzuAutoStorePlugin.AzuAutoStoreLogger.LogError((object)"yamlData is null.");
		}
		else if (AzuAutoStorePlugin.yamlData.TryGetValue("groups", out value))
		{
			if (value is Dictionary<object, object> dictionary)
			{
				{
					foreach (KeyValuePair<object, object> item in dictionary)
					{
						string text = item.Key?.ToString();
						if (text == null || !(item.Value is List<object> list))
						{
							continue;
						}
						HashSet<string> hashSet = new HashSet<string>();
						foreach (object item2 in list)
						{
							string text2 = item2?.ToString();
							if (text2 != null)
							{
								hashSet.Add(text2);
							}
						}
						AzuAutoStorePlugin.groups[text] = hashSet;
					}
					return;
				}
			}
			AzuAutoStorePlugin.AzuAutoStoreLogger.LogError((object)"groupData is not of type Dictionary<object, object>.");
		}
		else
		{
			AzuAutoStorePlugin.AzuAutoStoreLogger.LogError((object)"No 'groups' key found in yamlData.");
		}
	}

	public static void WriteYaml(string filePath)
	{
		ISerializer serializer = new SerializerBuilder().Build();
		using StreamWriter writer = new StreamWriter(filePath);
		serializer.Serialize(writer, AzuAutoStorePlugin.yamlData);
		string contents = serializer.Serialize(AzuAutoStorePlugin.yamlData);
		File.AppendAllText(filePath, contents);
	}
}
