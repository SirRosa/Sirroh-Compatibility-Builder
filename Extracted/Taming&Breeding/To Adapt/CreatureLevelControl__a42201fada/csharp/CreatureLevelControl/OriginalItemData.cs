using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using UnityEngine;

namespace CreatureLevelControl;

[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
public class OriginalItemData : MonoBehaviour
{
	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	public abstract class Value
	{
		public readonly Func<ItemConfig, bool> PresentInConfig;

		public bool Changed = false;

		protected Value(Func<ItemConfig, bool> presentInConfig)
		{
			PresentInConfig = presentInConfig;
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	public class Value<T> : Value where T : struct
	{
		public T Original;

		public T? Val => Changed ? new T?(Original) : ((T?)null);

		public Value(T val, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Func<ItemConfig, bool> presentInConfig)
			: base(presentInConfig)
		{
			Original = val;
		}
	}

	public readonly List<Value> Values = new List<Value>();

	public Value<int> maxStackSize = null;

	public Value<float> weight = null;

	public Value<bool> autoPickup = null;

	public Value<ItemConfig.Teleportable> teleportable = null;

	public Value<bool> floating = null;

	private void Awake()
	{
		if (((Component)this).GetComponent<ZNetView>().IsValid())
		{
			Object.Destroy((Object)(object)this);
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0 })]
	private Value<T> val<T>(T original, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Func<ItemConfig, bool> presentInConfig) where T : struct
	{
		Value<T> value = new Value<T>(original, presentInConfig);
		Values.Add(value);
		return value;
	}

	public void Init()
	{
		ItemDrop component = ((Component)this).GetComponent<ItemDrop>();
		SharedData shared = component.m_itemData.m_shared;
		maxStackSize = val(shared.m_maxStackSize, (ItemConfig c) => c.itemStack.HasValue || c.itemStackFactor.HasValue);
		weight = val(shared.m_weight, (ItemConfig c) => c.itemWeight.HasValue || c.itemWeightFactor.HasValue);
		autoPickup = val(component.m_autoPickup, (ItemConfig c) => c.worldLevelToLootPickup != null);
		teleportable = val(new ItemConfig.Teleportable
		{
			amount = (shared.m_teleportable ? int.MaxValue : 0)
		}, (ItemConfig c) => c.worldLevelToItemTeleportable != null);
		floating = val(Object.op_Implicit((Object)(object)((Component)this).GetComponent<Floating>()), (ItemConfig c) => c.itemFloating.HasValue);
		if (!Object.op_Implicit((Object)(object)component.m_itemData.m_dropPrefab))
		{
			component.m_itemData.m_dropPrefab = ((Component)component).gameObject;
		}
	}
}
