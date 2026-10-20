using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using YamlDotNet.Serialization;

namespace Recycle_N_Reclaim.YAMLStuff;

[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
public class YAMLUtils
{
	internal static void WriteConfigFileFromResource(string configFilePath)
	{
		Assembly executingAssembly = Assembly.GetExecutingAssembly();
		string text = "Recycle_N_Reclaim.YAMLStuff.Example.yml";
		using Stream stream = executingAssembly.GetManifestResourceStream(text);
		if (stream == null)
		{
			throw new FileNotFoundException("Resource '" + text + "' not found in the assembly.");
		}
		using StreamReader streamReader = new StreamReader(stream);
		string contents = streamReader.ReadToEnd();
		File.WriteAllText(configFilePath, contents);
	}

	internal static void ReadYaml(string yamlInput)
	{
		Recycle_N_ReclaimPlugin.yamlData = new DeserializerBuilder().Build().Deserialize<Root>(yamlInput);
		Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogDebug((object)("yamlData:\n" + yamlInput));
		Root yamlData = Recycle_N_ReclaimPlugin.yamlData;
		if (yamlData.Groups == null)
		{
			Dictionary<string, List<string>> dictionary = (yamlData.Groups = new Dictionary<string, List<string>>());
		}
		yamlData = Recycle_N_ReclaimPlugin.yamlData;
		if (yamlData.Containers == null)
		{
			Dictionary<string, excludeContainer> dictionary3 = (yamlData.Containers = new Dictionary<string, excludeContainer>());
		}
		yamlData = Recycle_N_ReclaimPlugin.yamlData;
		if (yamlData.Reclaiming == null)
		{
			Reclaiming reclaiming = (yamlData.Reclaiming = new Reclaiming());
		}
		yamlData = Recycle_N_ReclaimPlugin.yamlData;
		if (yamlData.Inventory == null)
		{
			Inventory inventory = (yamlData.Inventory = new Inventory());
		}
		foreach (KeyValuePair<string, HashSet<string>> predefinedGroup in Recycle_N_ReclaimPlugin.predefinedGroups)
		{
			Recycle_N_ReclaimPlugin.yamlData.Groups[predefinedGroup.Key] = predefinedGroup.Value.ToList();
		}
	}

	internal static void ParseGroups()
	{
		if (Recycle_N_ReclaimPlugin.yamlData == null)
		{
			Recycle_N_ReclaimPlugin.yamlData.Groups = new Dictionary<string, List<string>>();
		}
		if (!Recycle_N_ReclaimPlugin.yamlData.Groups.Any())
		{
			return;
		}
		foreach (KeyValuePair<string, List<string>> group in Recycle_N_ReclaimPlugin.yamlData.Groups)
		{
			string key = group.Key;
			List<string> value = group.Value;
			if (value == null)
			{
				continue;
			}
			List<string> list = new List<string>();
			foreach (string item in value)
			{
				list.Add(item);
			}
			Recycle_N_ReclaimPlugin.yamlData.Groups[key] = list;
		}
	}

	public static void WriteYaml(string filePath)
	{
		ISerializer serializer = new SerializerBuilder().Build();
		using StreamWriter writer = new StreamWriter(filePath);
		serializer.Serialize(writer, Recycle_N_ReclaimPlugin.yamlData);
		string contents = serializer.Serialize(Recycle_N_ReclaimPlugin.yamlData);
		File.AppendAllText(filePath, contents);
	}
}
