using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
using BepInEx;
using BepInEx.Bootstrap;

namespace AzuAutoStore.Patches.Favoriting;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
public class UserConfig
{
	private static readonly Dictionary<long, UserConfig> PlayerConfigs = new Dictionary<long, UserConfig>();

	private readonly string _configPath;

	private readonly string[] _mirrorPaths;

	private HashSet<Vector2i> _favoritedSlots;

	private HashSet<string> _favoritedItems;

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
		string text = Path.Combine(Paths.ConfigPath, string.Format("{0}_player_{1}.dat", "AzuAutoStore", uid));
		string text2 = Path.Combine(Paths.ConfigPath, $"AzuExtendedPlayerInventory_player_{uid}.dat");
		if (Chainloader.PluginInfos.ContainsKey("goldenrevolver.quick_stack_store"))
		{
			_configPath = Path.Combine(Paths.ConfigPath, $"QuickStackStore_player_{uid}.dat");
			_mirrorPaths = new string[2] { text, text2 };
		}
		else
		{
			_configPath = text;
			_mirrorPaths = new string[1] { text2 };
		}
		Load();
	}

	internal void ResetAllFavoriting()
	{
		AzuAutoStorePlugin.AzuAutoStoreLogger.LogWarning((object)"Resetting all favoriting data!");
		_favoritedSlots = new HashSet<Vector2i>();
		_favoritedItems = new HashSet<string>();
		Save();
	}

	private void Save()
	{
		WriteFile(_configPath);
		foreach (string item in _mirrorPaths.Where(File.Exists))
		{
			try
			{
				WriteFile(item);
			}
			catch (Exception ex) when ((ex is IOException || ex is UnauthorizedAccessException) ? true : false)
			{
				AzuAutoStorePlugin.AzuAutoStoreLogger.LogWarning((object)("Couldn't sync favorites to " + item + ": " + ex.Message));
			}
		}
	}

	private void WriteFile(string path)
	{
		using Stream serializationStream = File.Open(path, FileMode.Create);
		List<Tuple<int, int>> graph = _favoritedSlots.Select([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (Vector2i item) =>
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			return new Tuple<int, int>(item.x, item.y);
		}).ToList();
		Bf.Serialize(serializationStream, graph);
		Bf.Serialize(serializationStream, _favoritedItems.ToList());
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

	private static void LoadProperty<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)] T>(Stream file, out T property) where T : new()
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
		_favoritedSlots = new HashSet<Vector2i>();
		_favoritedItems = new HashSet<string>();
		foreach (string item in _mirrorPaths.Prepend(_configPath).Where(File.Exists))
		{
			try
			{
				ReadFileInto(item);
			}
			catch (Exception ex) when ((ex is IOException || ex is UnauthorizedAccessException) ? true : false)
			{
				AzuAutoStorePlugin.AzuAutoStoreLogger.LogWarning((object)("Couldn't read favorites from " + item + ": " + ex.Message));
			}
		}
	}

	private void ReadFileInto(string path)
	{
		//IL_0041: Unknown result type (might be due to invalid IL or missing references)
		using Stream file = File.Open(path, FileMode.Open, FileAccess.Read, FileShare.Read);
		List<Tuple<int, int>> property = new List<Tuple<int, int>>();
		LoadProperty<List<Tuple<int, int>>>(file, out property);
		if (property != null)
		{
			foreach (Tuple<int, int> item in property)
			{
				_favoritedSlots.Add(new Vector2i(item.Item1, item.Item2));
			}
		}
		List<string> property2 = new List<string>();
		LoadProperty<List<string>>(file, out property2);
		if (property2 == null)
		{
			return;
		}
		foreach (string item2 in property2)
		{
			_favoritedItems.Add(item2);
		}
	}

	public void ToggleSlotFavoriting(Vector2i position)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		_favoritedSlots.XAdd(position);
		Save();
	}

	public bool ToggleItemNameFavoriting(SharedData item)
	{
		_favoritedItems.XAdd(item.m_name);
		Save();
		return true;
	}

	public bool IsSlotFavorited(Vector2i position)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		return _favoritedSlots.Contains(position);
	}

	public bool IsItemNameFavorited(SharedData item)
	{
		return _favoritedItems.Contains(item.m_name);
	}

	public bool IsItemNameOrSlotFavorited(ItemData item)
	{
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		if (!IsItemNameFavorited(item.m_shared))
		{
			return IsSlotFavorited(item.m_gridPos);
		}
		return true;
	}
}
