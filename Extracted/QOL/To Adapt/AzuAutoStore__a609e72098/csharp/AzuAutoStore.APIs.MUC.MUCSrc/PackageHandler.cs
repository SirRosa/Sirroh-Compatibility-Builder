using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Data;
using UnityEngine;

namespace AzuAutoStore.APIs.MUC.MUCSrc;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public static class PackageHandler
{
	private static readonly Dictionary<int, IPackage> Packages = new Dictionary<int, IPackage>();

	private static readonly Dictionary<int, float> AddedAt = new Dictionary<int, float>();

	private static readonly List<int> Stale = new List<int>();

	private static readonly Random Random = new Random();

	private static int total;

	private const float PackageTimeout = 60f;

	public static int AddPackage(IPackage package)
	{
		DropStale();
		int randomId = GetRandomId();
		Packages.Add(randomId, package);
		AddedAt[randomId] = Time.time;
		return randomId;
	}

	private static void DropStale()
	{
		if (Packages.Count == 0)
		{
			return;
		}
		Stale.Clear();
		float time = Time.time;
		foreach (KeyValuePair<int, float> item in AddedAt)
		{
			if (time - item.Value >= 60f)
			{
				Stale.Add(item.Key);
			}
		}
		for (int i = 0; i < Stale.Count; i++)
		{
			Packages.Remove(Stale[i]);
			AddedAt.Remove(Stale[i]);
		}
		Stale.Clear();
	}

	public static float AgeOf(int id)
	{
		if (!AddedAt.TryGetValue(id, out var value))
		{
			return float.PositiveInfinity;
		}
		return Time.time - value;
	}

	public static void RemovePackage(int id)
	{
		Packages.Remove(id);
		AddedAt.Remove(id);
	}

	private static int GetRandomId()
	{
		return Random.Next(int.MinValue, int.MaxValue);
	}

	public static bool GetPackage<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)] T>(int id, out T package) where T : IPackage
	{
		if (Packages.TryGetValue(id, out var value))
		{
			package = (T)value;
			return true;
		}
		package = default;
		return false;
	}

	public static T GetPackage<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)] T>(int id) where T : IPackage
	{
		if (Packages.TryGetValue(id, out var value))
		{
			return (T)value;
		}
		return default;
	}
}
