using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using UnityEngine;

namespace AzuAutoStore.APIs;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
public static class ItemDrawers_API
{
	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
	public class Drawer(ZNetView znv)
	{
		public string Prefab = znv.m_zdo.GetString("Prefab", "");

		public int Amount = znv.m_zdo.GetInt("Amount", 0);

		public int Quality = znv.m_zdo.GetInt("Quality", 1);

		public Vector3 Position
		{
			get
			{
				//IL_000b: Unknown result type (might be due to invalid IL or missing references)
				return ((Component)znv).transform.position;
			}
		}

		public GameObject gameObject => ((Component)znv).gameObject;

		public string ZNVName => ((Object)((Component)znv).gameObject).name;

		public ZNetView m_nview => znv;

		public void Remove(int amount)
		{
			znv.ClaimOwnership();
			znv.InvokeRPC("ForceRemove", new object[1] { amount });
		}

		public void Withdraw(int amount)
		{
			znv.InvokeRPC("WithdrawItem_Request", new object[1] { amount });
		}

		public void Add(int amount, int quality)
		{
			znv.InvokeRPC("AddItem_Request", new object[3] { Prefab, amount, quality });
		}
	}

	private static readonly bool _IsInstalled;

	private static readonly MethodInfo MI_GetAllDrawers;

	public static List<Drawer> AllDrawers
	{
		get
		{
			if (!_IsInstalled)
			{
				return new List<Drawer>();
			}
			return ((List<ZNetView>)MI_GetAllDrawers.Invoke(null, null)).Select([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (ZNetView znv) => new Drawer(znv)).ToList();
		}
	}

	public static List<Drawer> AllDrawersInRange(Vector3 pos, float range)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		if (!_IsInstalled)
		{
			return new List<Drawer>();
		}
		return (from znv in ((List<ZNetView>)MI_GetAllDrawers.Invoke(null, null)).Where([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (ZNetView znv) =>
			{
				//IL_0006: Unknown result type (might be due to invalid IL or missing references)
				//IL_000c: Unknown result type (might be due to invalid IL or missing references)
				return Vector3.Distance(((Component)znv).transform.position, pos) <= range;
			})
			select new Drawer(znv)).ToList();
	}

	static ItemDrawers_API()
	{
		Type type = Type.GetType("API.ClientSideV2, kg_ItemDrawers");
		if ((object)type == null)
		{
			_IsInstalled = false;
			return;
		}
		_IsInstalled = true;
		MI_GetAllDrawers = type.GetMethod("AllDrawers", BindingFlags.Static | BindingFlags.Public);
	}
}
