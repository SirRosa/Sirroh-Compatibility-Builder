using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using AzuAutoStore.Util;
using UnityEngine;

namespace AzuAutoStore.Managers;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public class AzuAutoStoreItemDropManager : MonoBehaviour
{
	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	internal static AzuAutoStoreItemDropManager Instance;

	private static readonly List<ItemDrop> DropBuffer = new List<ItemDrop>();

	private void Awake()
	{
		Instance = this;
		((MonoBehaviour)this).InvokeRepeating("ProcessItemDrops", AzuAutoStorePlugin.IntervalSeconds.Value, AzuAutoStorePlugin.IntervalSeconds.Value);
		((MonoBehaviour)this).InvokeRepeating("ProcessAskedFor", 0.25f, 0.25f);
		AzuAutoStorePlugin.IntervalSeconds.SettingChanged += OnIntervalSecondsChanged;
	}

	private void OnDestroy()
	{
		AzuAutoStorePlugin.IntervalSeconds.SettingChanged -= OnIntervalSecondsChanged;
		DropBuffer.Clear();
		Functions.AskedFor.Clear();
		Functions.ClearNearbyContainers();
		if ((Object)(object)Instance == (Object)(object)this)
		{
			Instance = null;
		}
	}

	private void ProcessAskedFor()
	{
		List<ItemDrop> askedFor = Functions.AskedFor;
		if (askedFor.Count == 0)
		{
			return;
		}
		if (ShouldPause())
		{
			askedFor.Clear();
			return;
		}
		bool flag = false;
		try
		{
			for (int num = askedFor.Count - 1; num >= 0; num--)
			{
				ItemDrop val = askedFor[num];
				if (!Object.op_Implicit((Object)(object)val) || (Object)(object)val.m_nview == (Object)null || !val.m_nview.IsValid())
				{
					askedFor.RemoveAt(num);
				}
				else if (val.m_nview.IsOwner())
				{
					askedFor.RemoveAt(num);
					if (!flag)
					{
						Functions.BuildNearbyContainers();
						flag = true;
					}
					Functions.CheckItemDropInstanceAndStore(val);
				}
			}
		}
		finally
		{
			if (flag)
			{
				Functions.ClearNearbyContainers();
			}
		}
	}

	private void ProcessItemDrops()
	{
		Functions.AskedFor.Clear();
		if (ShouldPause() || Boxes.Containers == null || Boxes.Containers.Count == 0)
		{
			return;
		}
		DropBuffer.Clear();
		List<ItemDrop> s_instances = ItemDrop.s_instances;
		for (int i = 0; i < s_instances.Count; i++)
		{
			ItemDrop val = s_instances[i];
			if (!((Object)(object)val == (Object)null) && !((Object)(object)((Component)val).transform == (Object)null) && !((Object)(object)val.m_nview == (Object)null) && val.m_nview.IsValid() && !val.IsPiece())
			{
				DropBuffer.Add(val);
			}
		}
		if (DropBuffer.Count == 0)
		{
			return;
		}
		try
		{
			Functions.BuildNearbyContainers();
			for (int j = 0; j < DropBuffer.Count; j++)
			{
				Functions.CheckItemDropInstanceAndStore(DropBuffer[j]);
			}
		}
		finally
		{
			Functions.ClearNearbyContainers();
			DropBuffer.Clear();
		}
	}

	private void OnIntervalSecondsChanged(object sender, EventArgs e)
	{
		((MonoBehaviour)this).CancelInvoke("ProcessItemDrops");
		((MonoBehaviour)this).InvokeRepeating("ProcessItemDrops", AzuAutoStorePlugin.IntervalSeconds.Value, AzuAutoStorePlugin.IntervalSeconds.Value);
	}

	private static bool ShouldPause()
	{
		Player localPlayer = Player.m_localPlayer;
		if (!((Object)(object)localPlayer == (Object)null) && !((Character)localPlayer).IsTeleporting())
		{
			return ((Character)localPlayer).IsDead();
		}
		return true;
	}
}
