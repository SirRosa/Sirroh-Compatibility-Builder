using System;
using UnityEngine;

namespace Zen.Lib;

public static class ZdoExt
{
	private static readonly int ZdoKeyEpochStart = StringExtensionMethods.GetStableHashCode("Zen_EpochStart");

	public static bool IsPlayerCreated(this ZDO zdo)
	{
		if (zdo.IsValid())
		{
			return zdo.GetLong(ZDOVars.s_creator, 0L) != 0;
		}
		return false;
	}

	private static bool HasEpoch(this ZDO zdo)
	{
		return zdo.GetEpoch() != 0.0;
	}

	private static double GetEpoch(this ZDO zdo)
	{
		return zdo.GetDouble(ZdoKeyEpochStart);
	}

	public static double GetAgeSeconds(this ZDO zdo)
	{
		return ZNet.instance.GetTimeSeconds() - zdo.GetEpoch();
	}

	public static void AccelerateAge(this ZDO zdo, double seconds)
	{
		if (!zdo.IsOwner())
		{
			Logging<ModLib>.Error("Cannot age this ZDO, not owner.", 0);
			return;
		}
		double value = Math.Max(zdo.GetEpoch() - seconds, 0.0);
		zdo.Set(ZdoKeyEpochStart, value);
	}

	public static void RemoveEpoch(this ZDO zdo)
	{
		if (!zdo.IsOwner())
		{
			Logging<ModLib>.Error("Cannot remove epoch time because not owner of this ZDO.", 0);
		}
		else
		{
			zdo.Set(ZdoKeyEpochStart, 0.0);
		}
	}

	public static void InitEpoch(this ZDO zdo)
	{
		if (!zdo.IsOwner())
		{
			Logging<ModLib>.Error("Cannot init epoch time because not owner of this ZDO.", 0);
		}
		else if (!zdo.HasEpoch())
		{
			zdo.Set(ZdoKeyEpochStart, ZNet.instance.GetTimeSeconds());
		}
	}

	public static string GetPrefabName(this ZDO zdo)
	{
		//IL_0015: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		if (!GlobalStatic.TryGetPrefab(zdo.GetPrefab(), out GameObject prefab))
		{
			throw new Exception($"ZDO is missing prefab for hash at location: {zdo.GetPosition().XZY()}");
		}
		return ((Object)prefab).name;
	}

	public static double GetDouble(this ZDO zdo, string name, double defaultValue = 0.0)
	{
		return zdo.GetDouble(StringExtensionMethods.GetStableHashCode(name), defaultValue);
	}

	public static double GetDouble(this ZDO zdo, int hash, double defaultValue = 0.0)
	{
		return BitConverter.Int64BitsToDouble(zdo.GetLong(hash, (defaultValue == 0.0) ? 0 : BitConverter.DoubleToInt64Bits(defaultValue)));
	}

	public static void Set(this ZDO zdo, string name, double value)
	{
		zdo.Set(StringExtensionMethods.GetStableHashCode(name), value);
	}

	public static void Set(this ZDO zdo, int hash, double value)
	{
		zdo.Set(hash, BitConverter.DoubleToInt64Bits(value));
	}

	public static ItemData? GetItemData(this ZDO zdo, int prefabHash, int index = -1)
	{
		//IL_002c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0031: Unknown result type (might be due to invalid IL or missing references)
		//IL_003d: Unknown result type (might be due to invalid IL or missing references)
		//IL_004e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0056: Expected Obj, but got Unknown
		//IL_0057: Expected Obj, but got Unknown
		//IL_0021: Unknown result type (might be due to invalid IL or missing references)
		if (prefabHash == 0)
		{
			return null;
		}
		if (!GlobalStatic.TryGetPrefab<ItemDrop>(prefabHash, out ItemDrop prefab, true))
		{
			throw new MissingItemException($"ItemHash: {prefabHash}", zdo.GetPosition());
		}
		ItemData val = new ItemData
		{
			m_dropPrefab = ((Component)prefab).gameObject,
			m_shared = prefab.m_itemData.m_shared
		};
		ItemDrop.LoadFromZDO(val, zdo, index);
		return val;
	}
}
