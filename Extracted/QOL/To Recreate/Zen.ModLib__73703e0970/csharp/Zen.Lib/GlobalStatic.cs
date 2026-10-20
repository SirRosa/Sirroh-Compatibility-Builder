using System;
using System.Collections.Generic;
using BepInEx;
using Jotunn.Managers;
using UnityEngine;

namespace Zen.Lib;

public static class GlobalStatic
{
	private static readonly Dictionary<(int PrefabHash, Type Type), Object> CachePrefabByHash = new Dictionary<(int, Type), Object>();

	private static readonly Dictionary<(string PrefabName, Type Type), Object> CachePrefabByName = new Dictionary<(string, Type), Object>();

	public static bool TryGetPrefab(string prefabName, out GameObject prefab, bool useCache = true)
	{
		return GlobalStatic.TryGetPrefab<GameObject>(prefabName, out prefab, useCache);
	}

	public static bool TryGetPrefab<T>(string prefabName, out T prefab, bool useCache = true) where T : Object
	{
		return Object.op_Implicit((Object)(object)(prefab = GetPrefab<T>(prefabName, useCache)));
	}

	public static bool TryGetPrefab<T>(int prefabHash, out T prefab, bool useCache = true) where T : Object
	{
		return Object.op_Implicit((Object)(object)(prefab = GetPrefab<T>(prefabHash, useCache)));
	}

	public static bool TryGetPrefab(int prefabHash, out GameObject prefab)
	{
		return Object.op_Implicit((Object)(object)(prefab = GetPrefab(prefabHash)));
	}

	public static GameObject? GetPrefab(int prefabHash)
	{
		return ZNetScene.instance.GetPrefab(prefabHash);
	}

	public static GameObject? GetPrefab(string prefabName, bool useCache = true)
	{
		return GlobalStatic.GetPrefab<GameObject>(prefabName, useCache);
	}

	[Obsolete("Use TryGetPrefab<ItemDrop>(prefabName, out item, useCache) instead.")]
	public static bool TryGetPrefabItem(string prefabName, out ItemDrop item, bool useCache = true)
	{
		return GlobalStatic.TryGetPrefab<ItemDrop>(prefabName, out item, useCache);
	}

	[Obsolete("Use TryGetPrefab<Piece>(prefabName, out piece, useCache) instead.")]
	public static bool TryGetPrefabPiece(string prefabName, out Piece piece, bool useCache = true)
	{
		return GlobalStatic.TryGetPrefab<Piece>(prefabName, out piece, useCache);
	}

	[Obsolete("Use GetPrefab<ItemDrop>(prefabName, useCache) instead.")]
	public static ItemDrop? GetPrefabItem(string prefabName, bool useCache = true)
	{
		return GlobalStatic.GetPrefab<ItemDrop>(prefabName, useCache);
	}

	[Obsolete("Use GetPrefab<Piece>(prefabName, useCache) instead.")]
	public static Piece? GetPrefabPiece(string prefabName, bool useCache = true)
	{
		return GlobalStatic.GetPrefab<Piece>(prefabName, useCache);
	}

	internal static void ResetPrefabLookupCache()
	{
		if (CachePrefabByName.Count == 0 && CachePrefabByHash.Count == 0)
		{
			return;
		}
		if (Logging<ModLib>.IsEnabled)
		{
			Logging<ModLib>.Message($"Clearing prefab cache by name: {CachePrefabByName.Count} entities");
			bool shouldAppend;
			foreach (Object value in CachePrefabByName.Values)
			{
				if (Object.op_Implicit(value))
				{
					Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(14, 1, out shouldAppend);
					if (shouldAppend)
					{
						msg.AppendLiteral("- Was cached: ");
						msg.AppendFormatted(value.name);
					}
					Logging<ModLib>.Info(msg);
				}
			}
			Logging<ModLib>.Message($"Clearing prefab cache by hash: {CachePrefabByHash.Count} entities");
			foreach (Object value2 in CachePrefabByHash.Values)
			{
				if (Object.op_Implicit(value2))
				{
					Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(14, 1, out shouldAppend);
					if (shouldAppend)
					{
						msg.AppendLiteral("- Was cached: ");
						msg.AppendFormatted(value2.name);
					}
					Logging<ModLib>.Info(msg);
				}
			}
		}
		CachePrefabByName.Clear();
		CachePrefabByHash.Clear();
	}

	public static T? GetPrefab<T>(int prefabHash, bool useCache = true) where T : Object
	{
		if (prefabHash == 0)
		{
			return default;
		}
		if (ModLib.Configs.EnablePrefabLookupCache.Value & useCache)
		{
			if (CachePrefabByHash.TryGetValue((prefabHash, typeof(T)), out Object value))
			{
				return (T)(object)value;
			}
			if (Logging<ModLib>.IsEnabled)
			{
				Logging<ModLib>.Message($"Prefab not found in {typeof(T)} cache: {prefabHash}, fallback to component lookup");
			}
		}
		GameObject prefab = default;
		if (!ObjectDB.instance.TryGetItemPrefab(prefabHash, ref prefab))
		{
			if (Logging<ModLib>.IsEnabled)
			{
				Logging<ModLib>.Warning($"Prefab is missing: {prefabHash}");
			}
			return default;
		}
		return GetComponent<T>(prefab, useCache);
	}

	public static T? GetPrefab<T>(string prefabName, bool useCache = true) where T : Object
	{
		if (Utility.IsNullOrWhiteSpace(prefabName))
		{
			return default;
		}
		prefabName = Utils.GetPrefabName(prefabName);
		if (ModLib.Configs.EnablePrefabLookupCache.Value & useCache)
		{
			if (CachePrefabByName.TryGetValue((prefabName, typeof(T)), out Object value))
			{
				return (T)(object)value;
			}
			T prefab = Cache.GetPrefab<T>(prefabName);
			if (Object.op_Implicit((Object)(object)prefab))
			{
				return Cache(prefab, useCache);
			}
			if (Logging<ModLib>.IsEnabled)
			{
				Logging<ModLib>.Message($"Prefab not found in {typeof(T)} cache: {prefabName}, fallback to component lookup");
			}
		}
		GameObject prefab2 = PrefabManager.Instance.GetPrefab(prefabName);
		if (!Object.op_Implicit((Object)(object)prefab2))
		{
			if (Logging<ModLib>.IsEnabled)
			{
				Logging<ModLib>.Warning("Prefab is missing: " + prefabName);
			}
			return default;
		}
		return GetComponent<T>(prefab2, useCache);
	}

	private static T? GetComponent<T>(GameObject prefab, bool useCache) where T : Object
	{
		if (typeof(T) == typeof(GameObject))
		{
			return Cache((T)(object)prefab, useCache);
		}
		T obj = default;
		if (prefab.TryGetComponent<T>(ref obj))
		{
			return Cache(obj, useCache);
		}
		if (Logging<ModLib>.IsEnabled)
		{
			Logging<ModLib>.Warning($"{typeof(T)} is missing for prefab: {((Object)prefab).name}");
		}
		return default;
	}

	private static T Cache<T>(T obj, bool useCache) where T : Object
	{
		if (!ModLib.Configs.EnablePrefabLookupCache.Value || !useCache)
		{
			return obj;
		}
		Type typeFromHandle = typeof(T);
		string name = ((Object)obj).name;
		int stableHashCode = StringExtensionMethods.GetStableHashCode(name);
		CachePrefabByName[(name, typeFromHandle)] = (Object)(object)obj;
		CachePrefabByHash[(stableHashCode, typeFromHandle)] = (Object)(object)obj;
		return obj;
	}
}
