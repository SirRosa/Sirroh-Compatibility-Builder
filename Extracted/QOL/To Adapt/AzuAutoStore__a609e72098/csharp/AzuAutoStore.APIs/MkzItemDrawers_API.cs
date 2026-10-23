using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using UnityEngine;

namespace AzuAutoStore.APIs;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public static class MkzItemDrawers_API
{
	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
	public class Drawer
	{
		private readonly Component _drawer;

		private readonly ZNetView _nview;

		public GameObject gameObject => _drawer.gameObject;

		public ZNetView m_nview => _nview;

		public Vector3 Position
		{
			get
			{
				//IL_000b: Unknown result type (might be due to invalid IL or missing references)
				return _drawer.transform.position;
			}
		}

		public string Prefab
		{
			get
			{
				if (_fiItem == null)
				{
					return null;
				}
				object? value = _fiItem.GetValue(_drawer);
				GameObject val = ((ItemData)(((value is ItemData) ? value : null)?)).m_dropPrefab;
				if (!Object.op_Implicit((Object)(object)val))
				{
					return null;
				}
				return ((Object)val).name;
			}
		}

		public int? Amount
		{
			get
			{
				if (_fiQuantity == null)
				{
					return null;
				}
				return (int)_fiQuantity.GetValue(_drawer);
			}
		}

		internal Drawer(Component drawer)
		{
			_drawer = drawer;
			_nview = drawer.GetComponent<ZNetView>();
		}

		public bool Accepts(string prefab)
		{
			string prefab2 = Prefab;
			if (!string.IsNullOrEmpty(prefab2))
			{
				return string.Equals(prefab2, prefab, StringComparison.Ordinal);
			}
			return true;
		}

		public void Add(string prefab, int amount)
		{
			if (amount > 0 && !string.IsNullOrEmpty(prefab) && Object.op_Implicit((Object)(object)_nview))
			{
				_nview.ClaimOwnership();
				_nview.InvokeRPC("AddItem", new object[2] { prefab, amount });
			}
		}
	}

	private static readonly bool _isInstalled;

	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	private static readonly Type _drawerType;

	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	private static readonly FieldInfo _fiItem;

	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	private static readonly FieldInfo _fiQuantity;

	public static List<Drawer> AllDrawers
	{
		get
		{
			if (_isInstalled)
			{
				return FindAllRuntimeDrawers();
			}
			return new List<Drawer>();
		}
	}

	public static List<Drawer> AllDrawersInRange(Vector3 pos, float range)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		if (_isInstalled)
		{
			return FindAllRuntimeDrawers().Where([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (Drawer d) =>
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				return Vector3.Distance(d.Position, pos) <= range;
			}).ToList();
		}
		return new List<Drawer>();
	}

	static MkzItemDrawers_API()
	{
		_drawerType = Type.GetType("DrawerContainer, itemdrawers");
		if (_drawerType == null)
		{
			_isInstalled = false;
			return;
		}
		_fiItem = _drawerType.GetField("_item", BindingFlags.Instance | BindingFlags.NonPublic);
		_fiQuantity = _drawerType.GetField("_quantity", BindingFlags.Instance | BindingFlags.NonPublic);
		_isInstalled = true;
	}

	private static List<Drawer> FindAllRuntimeDrawers()
	{
		List<Drawer> list = new List<Drawer>();
		Object[] array = Object.FindObjectsByType(_drawerType, (FindObjectsSortMode)0);
		foreach (Object obj in array)
		{
			Component val = (Component)(object)((obj is Component) ? obj : null);
			if (val != null)
			{
				ZNetView component = val.GetComponent<ZNetView>();
				if (Object.op_Implicit((Object)(object)component) && component.IsValid())
				{
					list.Add(new Drawer(val));
				}
			}
		}
		return list;
	}
}
