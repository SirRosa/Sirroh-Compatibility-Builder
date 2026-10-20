using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
using BepInEx;

namespace Recycle_N_Reclaim.GamePatches.MarkAsTrash;

[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
public class UserConfig
{
	private static readonly Dictionary<long, UserConfig> PlayerConfigs = new Dictionary<long, UserConfig>();

	private static string _configPath;

	private static HashSet<Vector2i> _trashedSlots = null;

	private static readonly BinaryFormatter Bf = new BinaryFormatter();

	public static UserConfig GetPlayerConfig(long playerID)
	{
		if (PlayerConfigs.TryGetValue(playerID, out var value))
		{
			return value;
		}
		value = new UserConfig(playerID);
		PlayerConfigs[playerID] = value;
		return value;
	}

	public UserConfig(long uid)
	{
		_configPath = Path.Combine(Paths.ConfigPath, string.Format("{0}_player_{1}.dat", "Recycle_N_Reclaim", uid));
		Load();
	}

	internal static void ResetAllTrashing()
	{
		if (_trashedSlots.Count != 0)
		{
			_trashedSlots = new HashSet<Vector2i>();
			Save();
		}
	}

	private static void Save()
	{
		try
		{
			using Stream serializationStream = File.Open(_configPath, FileMode.Create);
			List<Tuple<int, int>> graph = _trashedSlots.Select([_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (Vector2i item) =>
			{
				//IL_0000: Unknown result type (might be due to invalid IL or missing references)
				//IL_0006: Unknown result type (might be due to invalid IL or missing references)
				return new Tuple<int, int>(item.x, item.y);
			}).ToList();
			Bf.Serialize(serializationStream, graph);
		}
		catch (Exception)
		{
		}
	}

	private static object TryDeserialize(Stream stream)
	{
		try
		{
			return Bf.Deserialize(stream);
		}
		catch (SerializationException)
		{
			return null;
		}
	}

	private static void LoadProperty<[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(2)] T>(Stream file, out T property) where T : new()
	{
		if (TryDeserialize(file) is T val)
		{
			property = val;
		}
		else
		{
			property = new T();
		}
	}

	private void Load()
	{
		//IL_0053: Unknown result type (might be due to invalid IL or missing references)
		using Stream stream = File.Open(_configPath, FileMode.OpenOrCreate);
		stream.Seek(0L, SeekOrigin.Begin);
		_trashedSlots = new HashSet<Vector2i>();
		List<Tuple<int, int>> property = new List<Tuple<int, int>>();
		LoadProperty<List<Tuple<int, int>>>(stream, out property);
		if (property == null)
		{
			return;
		}
		foreach (Tuple<int, int> item in property)
		{
			_trashedSlots.Add(new Vector2i(item.Item1, item.Item2));
		}
	}

	public void ToggleSlotTrashing(Vector2i position)
	{
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		_trashedSlots.XAdd(position);
		Save();
	}

	public void AddSlotTrashing(Vector2i position)
	{
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		_trashedSlots.XAdd(position, isToggle: false);
		Save();
	}

	public bool IsSlotTrashed(Vector2i position)
	{
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		return _trashedSlots.Contains(position);
	}
}
