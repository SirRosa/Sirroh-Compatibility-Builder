using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Recycle_N_Reclaim.GamePatches.Recycling;
using UnityEngine;

namespace Recycle_N_Reclaim.Managers;

[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
internal static class RecycleUndoManager
{
	[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(2)]
	private static ItemData _lastItem;

	private static List<RecyclingAnalysisContext.ReclaimingYieldEntry> _lastEntries = new List<RecyclingAnalysisContext.ReclaimingYieldEntry>();

	private static float _recordedAt = float.MinValue;

	internal static bool CanUndo
	{
		get
		{
			if (_lastItem != null && Recycle_N_ReclaimPlugin.UndoRecycleGracePeriodSeconds.Value > 0f)
			{
				return Time.time - _recordedAt <= Recycle_N_ReclaimPlugin.UndoRecycleGracePeriodSeconds.Value;
			}
			return false;
		}
	}

	internal static void Record(ItemData item, List<RecyclingAnalysisContext.ReclaimingYieldEntry> entries)
	{
		_lastItem = item.Clone();
		_lastEntries = entries.Where((RecyclingAnalysisContext.ReclaimingYieldEntry e) => e.Amount > 0 && !e.InitialRecipeHadZero).ToList();
		_recordedAt = Time.time;
	}

	internal static void TryUndo()
	{
		Player localPlayer = Player.m_localPlayer;
		if ((Object)(object)localPlayer == (Object)null)
		{
			return;
		}
		if (!CanUndo)
		{
			((Character)localPlayer).Message((MessageType)2, Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_undo_expired"), 0, (Sprite)null, false);
			Clear();
			return;
		}
		Inventory inventory = ((Humanoid)localPlayer).GetInventory();
		foreach (RecyclingAnalysisContext.ReclaimingYieldEntry lastEntry in _lastEntries)
		{
			if (inventory.CountItems(lastEntry.RecipeItemData.m_shared.m_name, -1, true) < lastEntry.Amount)
			{
				((Character)localPlayer).Message((MessageType)2, Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_undo_failed"), 0, (Sprite)null, false);
				Clear();
				return;
			}
		}
		List<RecyclingAnalysisContext.ReclaimingYieldEntry> list = new List<RecyclingAnalysisContext.ReclaimingYieldEntry>();
		foreach (RecyclingAnalysisContext.ReclaimingYieldEntry lastEntry2 in _lastEntries)
		{
			inventory.RemoveItem(lastEntry2.RecipeItemData.m_shared.m_name, lastEntry2.Amount, -1, true);
			list.Add(lastEntry2);
		}
		ItemData lastItem = _lastItem;
		if ((((Object)(object)lastItem.m_dropPrefab != (Object)null) ? inventory.AddItem(((Object)lastItem.m_dropPrefab).name, lastItem.m_stack, lastItem.m_quality, lastItem.m_variant, lastItem.m_crafterID, lastItem.m_crafterName, false, false) : null) == null)
		{
			bool flag = false;
			foreach (RecyclingAnalysisContext.ReclaimingYieldEntry item in list)
			{
				if (inventory.AddItem(((Object)item.Prefab).name, item.Amount, item.mQuality, item.mVariant, 0L, "", false, false) == null)
				{
					flag = true;
					Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogError((object)$"Undo rollback: failed to restore {item.Amount}x {((Object)item.Prefab).name} to inventory.");
				}
			}
			if (flag)
			{
				Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogError((object)"Undo rollback was incomplete. One or more resources could not be returned to inventory.");
			}
			((Character)localPlayer).Message((MessageType)2, Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_undo_failed"), 0, (Sprite)null, false);
			Clear();
		}
		else
		{
			((Character)localPlayer).Message((MessageType)2, Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_undo_success"), 0, (Sprite)null, false);
			Clear();
		}
	}

	internal static void Clear()
	{
		_lastItem = null;
		_lastEntries.Clear();
	}
}
