using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using AzuEPI;
using JetBrains.Annotations;
using UnityEngine;

namespace AzuExtendedPlayerInventory;

[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(0)]
[PublicAPI]
[_003C830637c6_002Dabe4_002D47bb_002D978f_002D1cefcab86d66_003ENullableContext(1)]
internal class API
{
	[_003C830637c6_002Dabe4_002D47bb_002D978f_002D1cefcab86d66_003ENullableContext(0)]
	public delegate void SlotAddedHandler(string slotName);

	[_003C830637c6_002Dabe4_002D47bb_002D978f_002D1cefcab86d66_003ENullableContext(0)]
	public delegate void SlotRemovedHandler(string slotName);

	private static readonly Dictionary<SlotAddedHandler, AzuEPI.API.SlotAddedHandler> _slotAddedMap = new Dictionary<SlotAddedHandler, AzuEPI.API.SlotAddedHandler>();

	private static readonly Dictionary<SlotRemovedHandler, AzuEPI.API.SlotRemovedHandler> _slotRemovedMap = new Dictionary<SlotRemovedHandler, AzuEPI.API.SlotRemovedHandler>();

	private static readonly Dictionary<Action<Hud>, Action<Hud>> _hudAwakeMap = new Dictionary<Action<Hud>, Action<Hud>>();

	private static readonly Dictionary<Action<Hud>, Action<Hud>> _hudAwakeCompleteMap = new Dictionary<Action<Hud>, Action<Hud>>();

	private static readonly Dictionary<Action<Hud>, Action<Hud>> _hudUpdateMap = new Dictionary<Action<Hud>, Action<Hud>>();

	private static readonly Dictionary<Action<Hud>, Action<Hud>> _hudUpdateCompleteMap = new Dictionary<Action<Hud>, Action<Hud>>();

	[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(2)]
	public static event SlotAddedHandler SlotAdded
	{
		[_003C830637c6_002Dabe4_002D47bb_002D978f_002D1cefcab86d66_003ENullableContext(2)]
		add
		{
			if (value == null || _slotAddedMap.ContainsKey(value))
			{
				return;
			}
			AzuEPI.API.SlotAddedHandler value2 = (string s) =>
			{
				try
				{
					value(s);
				}
				catch
				{
				}
			};
			_slotAddedMap[value] = value2;
			AzuEPI.API.SlotAdded += value2;
		}
		[_003C830637c6_002Dabe4_002D47bb_002D978f_002D1cefcab86d66_003ENullableContext(2)]
		remove
		{
			if (value != null && _slotAddedMap.TryGetValue(value, out var value2))
			{
				AzuEPI.API.SlotAdded -= value2;
				_slotAddedMap.Remove(value);
			}
		}
	}

	[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(2)]
	public static event SlotRemovedHandler SlotRemoved
	{
		[_003C830637c6_002Dabe4_002D47bb_002D978f_002D1cefcab86d66_003ENullableContext(2)]
		add
		{
			if (value == null || _slotRemovedMap.ContainsKey(value))
			{
				return;
			}
			AzuEPI.API.SlotRemovedHandler value2 = (string s) =>
			{
				try
				{
					value(s);
				}
				catch
				{
				}
			};
			_slotRemovedMap[value] = value2;
			AzuEPI.API.SlotRemoved += value2;
		}
		[_003C830637c6_002Dabe4_002D47bb_002D978f_002D1cefcab86d66_003ENullableContext(2)]
		remove
		{
			if (value != null && _slotRemovedMap.TryGetValue(value, out var value2))
			{
				AzuEPI.API.SlotRemoved -= value2;
				_slotRemovedMap.Remove(value);
			}
		}
	}

	[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
	public static event Action<Hud> OnHudAwake
	{
		[param: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
		add
		{
			AddHudEvent(value, _hudAwakeMap, (Action<Hud> h) =>
			{
				AzuEPI.API.OnHudAwake += h;
			});
		}
		[param: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
		remove
		{
			RemoveHudEvent(value, _hudAwakeMap, (Action<Hud> h) =>
			{
				AzuEPI.API.OnHudAwake -= h;
			});
		}
	}

	[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
	public static event Action<Hud> OnHudAwakeComplete
	{
		[param: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
		add
		{
			AddHudEvent(value, _hudAwakeCompleteMap, (Action<Hud> h) =>
			{
				AzuEPI.API.OnHudAwakeComplete += h;
			});
		}
		[param: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
		remove
		{
			RemoveHudEvent(value, _hudAwakeCompleteMap, (Action<Hud> h) =>
			{
				AzuEPI.API.OnHudAwakeComplete -= h;
			});
		}
	}

	[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
	public static event Action<Hud> OnHudUpdate
	{
		[param: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
		add
		{
			AddHudEvent(value, _hudUpdateMap, (Action<Hud> h) =>
			{
				AzuEPI.API.OnHudUpdate += h;
			});
		}
		[param: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
		remove
		{
			RemoveHudEvent(value, _hudUpdateMap, (Action<Hud> h) =>
			{
				AzuEPI.API.OnHudUpdate -= h;
			});
		}
	}

	[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
	public static event Action<Hud> OnHudUpdateComplete
	{
		[param: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
		add
		{
			AddHudEvent(value, _hudUpdateCompleteMap, (Action<Hud> h) =>
			{
				AzuEPI.API.OnHudUpdateComplete += h;
			});
		}
		[param: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
		remove
		{
			RemoveHudEvent(value, _hudUpdateCompleteMap, (Action<Hud> h) =>
			{
				AzuEPI.API.OnHudUpdateComplete -= h;
			});
		}
	}

	private static void AddHudEvent([_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })] Action<Hud> handler, Dictionary<Action<Hud>, Action<Hud>> map, Action<Action<Hud>> subscribe)
	{
		if (handler == null || map.ContainsKey(handler))
		{
			return;
		}
		Action<Hud> value = (Hud h) =>
		{
			try
			{
				handler(h);
			}
			catch
			{
			}
		};
		map[handler] = value;
	}

	private static void RemoveHudEvent([_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })] Action<Hud> handler, Dictionary<Action<Hud>, Action<Hud>> map, Action<Action<Hud>> unsubscribe)
	{
		if (handler != null && map.TryGetValue(handler, out var _))
		{
			map.Remove(handler);
		}
	}

	public static bool IsLoaded()
	{
		return AzuEPI.API.IsLoaded();
	}

	public static bool AddSlot(string slotName, [_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 1, 1, 2 })] Func<Player, ItemData> getItem, Func<ItemData, bool> isValid, int index = -1)
	{
		return false;
	}

	public static bool RemoveSlot(string slotName)
	{
		return AzuEPI.API.RemoveSlot(slotName);
	}

	public static SlotInfo GetSlots()
	{
		AzuEPI.SlotInfo slots = AzuEPI.API.GetSlots();
		return new SlotInfo
		{
			SlotNames = (slots.SlotNames ?? Array.Empty<string>()),
			SlotPositions = (slots.SlotPositions ?? Array.Empty<Vector2>()),
			GetItemFuncs = (slots.GetItemFuncs ?? Array.Empty<Func<Player, ItemData>>()),
			IsValidFuncs = (slots.IsValidFuncs ?? Array.Empty<Func<ItemData, bool>>())
		};
	}

	public static SlotInfo GetQuickSlots()
	{
		AzuEPI.SlotInfo quickSlots = AzuEPI.API.GetQuickSlots();
		return new SlotInfo
		{
			SlotNames = (quickSlots.SlotNames ?? Array.Empty<string>()),
			SlotPositions = (quickSlots.SlotPositions ?? Array.Empty<Vector2>()),
			GetItemFuncs = (quickSlots.GetItemFuncs ?? Array.Empty<Func<Player, ItemData>>()),
			IsValidFuncs = (quickSlots.IsValidFuncs ?? Array.Empty<Func<ItemData, bool>>())
		};
	}

	public static List<ItemData> GetQuickSlotsItems()
	{
		return AzuEPI.API.GetQuickSlotsItems();
	}

	public static int GetAddedRows(int width)
	{
		return AzuEPI.API.GetAddedRows(width);
	}

	public static void HudAwake(Hud h)
	{
	}

	public static void HudAwakeComplete(Hud h)
	{
	}

	public static void HudUpdate(Hud h)
	{
	}

	public static void HudUpdateComplete(Hud h)
	{
	}

	private static void SafeInvoke(Action a)
	{
		try
		{
			a();
		}
		catch
		{
		}
	}
}
