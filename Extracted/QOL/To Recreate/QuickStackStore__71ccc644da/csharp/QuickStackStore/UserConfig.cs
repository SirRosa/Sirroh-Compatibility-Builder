using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
using BepInEx;

namespace QuickStackStore;

public class UserConfig
{
	private static readonly Dictionary<long, UserConfig> playerConfigs = new Dictionary<long, UserConfig>();

	private readonly string _configPath = string.Empty;

	private HashSet<Vector2i> favoritedSlots;

	private HashSet<string> favoritedItems;

	private HashSet<string> trashFlaggedItems;

	private readonly long _uid;

	private static readonly BinaryFormatter _bf = new BinaryFormatter();

	public static UserConfig GetPlayerConfig(long playerID)
	{
		if (playerConfigs.TryGetValue(playerID, out var value))
		{
			return value;
		}
		value = new UserConfig(playerID);
		playerConfigs[playerID] = value;
		return value;
	}

	public UserConfig(long uid)
	{
		_uid = uid;
		_configPath = Path.Combine(Paths.ConfigPath, $"QuickStackStore_player_{_uid}.dat");
		Load();
	}

	internal void ResetAllFavoriting()
	{
		Helper.LogO("Resetting all favoriting data!");
		favoritedSlots = new HashSet<Vector2i>();
		favoritedItems = new HashSet<string>();
		trashFlaggedItems = new HashSet<string>();
		Save();
	}

	private void Save()
	{
		//IL_0026: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		using Stream serializationStream = File.Open(_configPath, FileMode.Create);
		List<Tuple<int, int>> list = new List<Tuple<int, int>>();
		foreach (Vector2i favoritedSlot in favoritedSlots)
		{
			list.Add(new Tuple<int, int>(favoritedSlot.x, favoritedSlot.y));
		}
		_bf.Serialize(serializationStream, list);
		_bf.Serialize(serializationStream, favoritedItems.ToList());
		_bf.Serialize(serializationStream, trashFlaggedItems.ToList());
	}

	private static object TryDeserialize(Stream stream)
	{
		try
		{
			return _bf.Deserialize(stream);
		}
		catch (SerializationException)
		{
			return null;
		}
	}

	private static void LoadProperty<T>(Stream file, out T property) where T : new()
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
		//IL_0072: Unknown result type (might be due to invalid IL or missing references)
		using Stream stream = File.Open(_configPath, FileMode.OpenOrCreate);
		stream.Seek(0L, SeekOrigin.Begin);
		favoritedSlots = new HashSet<Vector2i>();
		favoritedItems = new HashSet<string>();
		trashFlaggedItems = new HashSet<string>();
		List<Tuple<int, int>> property = new List<Tuple<int, int>>();
		LoadProperty<List<Tuple<int, int>>>(stream, out property);
		foreach (Tuple<int, int> item in property)
		{
			favoritedSlots.Add(new Vector2i(item.Item1, item.Item2));
		}
		List<string> property2 = new List<string>();
		LoadProperty<List<string>>(stream, out property2);
		foreach (string item2 in property2)
		{
			favoritedItems.Add(item2);
		}
		List<string> property3 = new List<string>();
		LoadProperty<List<string>>(stream, out property3);
		foreach (string item3 in property3)
		{
			trashFlaggedItems.Add(item3);
		}
	}

	public void ToggleSlotFavoriting(Vector2i position)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		favoritedSlots.XAdd(position);
		Save();
	}

	public bool ToggleItemNameFavoriting(SharedData item)
	{
		if (trashFlaggedItems.Contains(item.m_name))
		{
			return false;
		}
		favoritedItems.XAdd(item.m_name);
		Save();
		return true;
	}

	public bool ToggleItemNameTrashFlagging(SharedData item)
	{
		if (favoritedItems.Contains(item.m_name))
		{
			return false;
		}
		trashFlaggedItems.XAdd(item.m_name);
		Save();
		return true;
	}

	public bool IsSlotFavorited(Vector2i position)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		return favoritedSlots.Contains(position);
	}

	public bool IsItemNameFavorited(SharedData item)
	{
		return favoritedItems.Contains(item.m_name);
	}

	public bool IsItemNameLiterallyTrashFlagged(SharedData item)
	{
		return trashFlaggedItems.Contains(item.m_name);
	}

	public bool IsItemNameConsideredTrashFlagged(SharedData item)
	{
		//IL_0036: Unknown result type (might be due to invalid IL or missing references)
		//IL_003d: Invalid comparison between Unknown and I4
		if (CompatibilitySupport.DisallowAllTrashCanFeatures())
		{
			return false;
		}
		if (IsItemNameLiterallyTrashFlagged(item))
		{
			return true;
		}
		if (!QSSConfig.TrashConfig.AlwaysConsiderTrophiesTrashFlagged.Value)
		{
			return false;
		}
		return (int)item.m_itemType == 13 && !IsItemNameFavorited(item);
	}

	public bool IsItemNameOrSlotFavorited(ItemData item)
	{
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		return IsItemNameFavorited(item.m_shared) || IsSlotFavorited(item.m_gridPos);
	}
}
