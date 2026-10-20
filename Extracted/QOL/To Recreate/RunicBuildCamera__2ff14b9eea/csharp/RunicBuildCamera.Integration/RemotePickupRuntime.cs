using System;
using System.Collections.Generic;
using System.Reflection;
using HarmonyLib;
using RunicBuildCamera.Core;
using UnityEngine;

namespace RunicBuildCamera.Integration;

internal static class RemotePickupRuntime
{
	private readonly struct CooldownEntry
	{
		internal float RetryAt { get; }

		internal long Ordinal { get; }

		internal CooldownEntry(float retryAt, long ordinal)
		{
			RetryAt = retryAt;
			Ordinal = ordinal;
		}
	}

	private static readonly ItemDrop[] ItemBuffer = new ItemDrop[128];

	private static readonly HashSet<ZDOID> SeenThisScan = new HashSet<ZDOID>();

	private static readonly Dictionary<ZDOID, CooldownEntry> Cooldowns = new Dictionary<ZDOID, CooldownEntry>();

	private static readonly FieldInfo EnableAutoPickupField = AccessTools.Field(typeof(Player), "m_enableAutoPickup");

	private static readonly FieldInfo ItemInstancesField = AccessTools.Field(typeof(ItemDrop), "s_instances");

	private static bool _subscribed;

	private static bool _wasActive;

	private static Player _lastPlayer;

	private static float _nextScanAt;

	private static long _cooldownOrdinal;

	private static int _scanCursor;

	private static int _pendingCount;

	private static int _pendingIndex;

	private static float _nextDiagnosticAt;

	private static float _nextWarningAt;

	private static bool _autoPickupOffShown;

	internal static void ReportFailure(Exception exception)
	{
		Report("Camera pickup update failed: " + exception);
	}

	internal static void Tick()
	{
		//IL_011c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0135: Unknown result type (might be due to invalid IL or missing references)
		EnsureSubscribed();
		bool flag = BuildCameraRuntime.TryGetActiveContext(out var player, out var cameraPosition, out var _);
		bool num = (BuildCameraRuntime.IsActive && BuildCameraConfig.PickupEnabled != null && BuildCameraConfig.PickupEnabled.Value) & flag;
		if (!num)
		{
			_autoPickupOffShown = false;
		}
		if (!num || (Object)(object)player == (Object)null || (Object)(object)player != (Object)(object)Player.m_localPlayer || ((Character)player).IsTeleporting() || !TryReadAutoPickupState(player, out var enabled) || !enabled)
		{
			if (_wasActive || (Object)(object)_lastPlayer != (Object)null || Cooldowns.Count != 0)
			{
				ResetTransientState();
			}
			return;
		}
		if ((Object)(object)player != (Object)(object)_lastPlayer)
		{
			ResetTransientState();
			_lastPlayer = player;
		}
		_wasActive = true;
		float time = Time.time;
		if (!PickupPolicy.IsScanDue(time, _nextScanAt))
		{
			return;
		}
		float num2 = ((BuildCameraConfig.PickupIntervalSeconds != null) ? BuildCameraConfig.PickupIntervalSeconds.Value : 0.2f);
		_nextScanAt = PickupPolicy.NextScanAt(time, num2);
		float num3 = ((BuildCameraConfig.PickupRange != null) ? BuildCameraConfig.PickupRange.Value : 0f);
		if (!float.IsNaN(num3) && !float.IsInfinity(num3) && !(num3 <= 0f) && IsFinite(cameraPosition))
		{
			Inventory inventory = ((Humanoid)player).GetInventory();
			if (inventory != null)
			{
				Scan(player, inventory, cameraPosition, num3, num2, time);
			}
		}
	}

	internal static void Reset()
	{
		ResetTransientState();
	}

	internal static void Shutdown()
	{
		if (_subscribed)
		{
			BuildCameraConfig.Changed -= OnConfigurationChanged;
			_subscribed = false;
		}
		ResetTransientState();
	}

	private static void Scan(Player player, Inventory inventory, Vector3 cameraPosition, float range, float interval, float now)
	{
		//IL_022e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0135: Unknown result type (might be due to invalid IL or missing references)
		//IL_0150: Unknown result type (might be due to invalid IL or missing references)
		//IL_0157: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a2: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a9: Unknown result type (might be due to invalid IL or missing references)
		//IL_017f: Unknown result type (might be due to invalid IL or missing references)
		//IL_01b7: Unknown result type (might be due to invalid IL or missing references)
		//IL_01ec: Unknown result type (might be due to invalid IL or missing references)
		int pendingCount;
		try
		{
			if (!(ItemInstancesField?.GetValue(null) is List<ItemDrop> items))
			{
				Report("Camera pickup could not read Valheim's loaded item registry.");
				return;
			}
			if (_pendingIndex >= _pendingCount)
			{
				_pendingCount = PickupScanWindow.CopyNext(items, ItemBuffer, ref _scanCursor);
				_pendingIndex = 0;
			}
			pendingCount = _pendingCount;
		}
		catch (Exception ex)
		{
			Report("Camera pickup discovery failed: " + ex);
			return;
		}
		SeenThisScan.Clear();
		PruneExpiredCooldowns(now);
		int num = 0;
		try
		{
			int num2 = Math.Min(pendingCount, ItemBuffer.Length);
			while (_pendingIndex < num2 && num < 16)
			{
				ItemDrop val = ItemBuffer[_pendingIndex];
				ItemBuffer[_pendingIndex++] = null;
				if (!Object.op_Implicit((Object)(object)val) || !((Behaviour)val).isActiveAndEnabled || !((Component)val).gameObject.activeInHierarchy)
				{
					continue;
				}
				ZNetView component = ((Component)val).GetComponent<ZNetView>();
				ZDO val2 = (((Object)(object)component != (Object)null && component.IsValid()) ? component.GetZDO() : null);
				if (val2 == null || val2.m_uid.IsNone() || !SeenThisScan.Add(val2.m_uid))
				{
					continue;
				}
				try
				{
					val.Load();
					if (!TryEvaluate(val, val2.m_uid, player, inventory, cameraPosition, range, now))
					{
						continue;
					}
					val.RequestOwn();
					num++;
					if (!val.CanPickup(true))
					{
						SetCooldown(val2.m_uid, PickupPolicy.OwnershipRetryAt(now, interval));
						continue;
					}
					val.Load();
					if (!TryEvaluate(val, val2.m_uid, player, inventory, cameraPosition, range, now, ignoreCooldown: true))
					{
						SetCooldown(val2.m_uid, PickupPolicy.FailedPickupRetryAt(now));
						continue;
					}
					bool flag = ((Humanoid)player).Pickup(((Component)val).gameObject, true, true);
					if (!flag)
					{
						Report("Camera pickup declined by the normal pickup path or another mod.", warning: false);
					}
					SetCooldown(val2.m_uid, flag ? PickupPolicy.CompletedPickupRetryAt(now) : PickupPolicy.FailedPickupRetryAt(now));
				}
				catch (Exception ex2)
				{
					Report("Camera pickup failed: " + ex2);
					SetCooldown(val2.m_uid, PickupPolicy.FailedPickupRetryAt(now));
				}
			}
		}
		finally
		{
			SeenThisScan.Clear();
		}
	}

	private static bool TryEvaluate(ItemDrop itemDrop, ZDOID id, Player player, Inventory inventory, Vector3 cameraPosition, float range, float now, bool ignoreCooldown = false)
	{
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		//IL_0044: Unknown result type (might be due to invalid IL or missing references)
		//IL_0049: Unknown result type (might be due to invalid IL or missing references)
		//IL_004b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0054: Unknown result type (might be due to invalid IL or missing references)
		//IL_0056: Unknown result type (might be due to invalid IL or missing references)
		//IL_0058: Unknown result type (might be due to invalid IL or missing references)
		//IL_005d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0088: Unknown result type (might be due to invalid IL or missing references)
		ItemData itemData = itemDrop.m_itemData;
		SharedData val = itemData?.m_shared;
		if (itemData == null || val == null)
		{
			return false;
		}
		bool isCoolingDown = !ignoreCooldown && Cooldowns.TryGetValue(id, out var value) && now < value.RetryAt;
		Vector3 position = ((Component)itemDrop).transform.position;
		int num;
		if (IsFinite(position))
		{
			Vector3 val2 = position - cameraPosition;
			num = (PickupPolicy.IsWithinRange(val2.sqrMagnitude, range) ? 1 : 0);
		}
		else
		{
			num = 0;
		}
		bool flag = (byte)num != 0;
		bool flag2 = (Object)(object)((Component)itemDrop).GetComponent<Fish>() != (Object)null;
		if (flag && !flag2 && !PlayerWardPickupAccess.Allows(position))
		{
			Report("Camera pickup rejected " + val.m_name + ": PlayerWardDenied", warning: false);
			return false;
		}
		bool isUniqueOrQuestItem = val.m_questItem || ((Humanoid)player).HaveUniqueKey(val.m_name);
		bool inventoryCanAdd = inventory.CanAddItem(itemData, -1);
		float weight = itemData.GetWeight(-1);
		float num2 = inventory.GetTotalWeight() + weight;
		float maxCarryWeight = player.GetMaxCarryWeight();
		bool wouldExceedCarryWeight = float.IsNaN(weight) || float.IsInfinity(weight) || weight < 0f || float.IsNaN(num2) || float.IsInfinity(num2) || float.IsNaN(maxCarryWeight) || float.IsInfinity(maxCarryWeight) || num2 > maxCarryWeight;
		PickupRejectionReason pickupRejectionReason = PickupPolicy.Evaluate(new PickupCandidateFacts(!id.IsNone(), flag, flag2, itemDrop.m_autoPickup, itemDrop.IsPiece(), itemDrop.InTar(), isUniqueOrQuestItem, inventoryCanAdd, wouldExceedCarryWeight, isCoolingDown));
		if (flag && pickupRejectionReason != PickupRejectionReason.None && pickupRejectionReason != PickupRejectionReason.CoolingDown)
		{
			Report("Camera pickup rejected " + val.m_name + ": " + pickupRejectionReason, warning: false);
		}
		return pickupRejectionReason == PickupRejectionReason.None;
	}

	private static void SetCooldown(ZDOID id, float retryAt)
	{
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0062: Unknown result type (might be due to invalid IL or missing references)
		if (!id.IsNone())
		{
			if (!Cooldowns.ContainsKey(id) && Cooldowns.Count >= 256)
			{
				RemoveOldestCooldown();
			}
			if (_cooldownOrdinal == long.MaxValue)
			{
				Cooldowns.Clear();
				_cooldownOrdinal = 0L;
			}
			long ordinal = ++_cooldownOrdinal;
			Cooldowns[id] = new CooldownEntry(retryAt, ordinal);
		}
	}

	private static void PruneExpiredCooldowns(float now)
	{
		//IL_0042: Unknown result type (might be due to invalid IL or missing references)
		//IL_0075: Unknown result type (might be due to invalid IL or missing references)
		//IL_007a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0081: Unknown result type (might be due to invalid IL or missing references)
		if (Cooldowns.Count == 0)
		{
			return;
		}
		List<ZDOID> list = null;
		foreach (KeyValuePair<ZDOID, CooldownEntry> cooldown in Cooldowns)
		{
			if (!(now < cooldown.Value.RetryAt))
			{
				if (list == null)
				{
					list = new List<ZDOID>();
				}
				list.Add(cooldown.Key);
			}
		}
		if (list == null)
		{
			return;
		}
		foreach (ZDOID item in list)
		{
			Cooldowns.Remove(item);
		}
	}

	private static void RemoveOldestCooldown()
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_0042: Unknown result type (might be due to invalid IL or missing references)
		//IL_0047: Unknown result type (might be due to invalid IL or missing references)
		//IL_007a: Unknown result type (might be due to invalid IL or missing references)
		bool flag = false;
		ZDOID key = ZDOID.None;
		long num = long.MaxValue;
		foreach (KeyValuePair<ZDOID, CooldownEntry> cooldown in Cooldowns)
		{
			if (!flag || cooldown.Value.Ordinal < num)
			{
				flag = true;
				key = cooldown.Key;
				num = cooldown.Value.Ordinal;
			}
		}
		if (flag)
		{
			Cooldowns.Remove(key);
		}
	}

	private static void EnsureSubscribed()
	{
		if (!_subscribed)
		{
			BuildCameraConfig.Changed += OnConfigurationChanged;
			_subscribed = true;
		}
	}

	private static void OnConfigurationChanged()
	{
		ResetTransientState();
	}

	private static void ResetTransientState()
	{
		_wasActive = false;
		_lastPlayer = null;
		_nextScanAt = 0f;
		_cooldownOrdinal = 0L;
		_scanCursor = 0;
		_pendingCount = 0;
		_pendingIndex = 0;
		Cooldowns.Clear();
		SeenThisScan.Clear();
		Array.Clear(ItemBuffer, 0, ItemBuffer.Length);
	}

	private static bool TryReadAutoPickupState(Player player, out bool enabled)
	{
		enabled = false;
		if ((Object)(object)player == (Object)null || EnableAutoPickupField == null || EnableAutoPickupField.FieldType != typeof(bool) || !EnableAutoPickupField.IsStatic)
		{
			Report("Camera pickup could not read Valheim's auto-pickup setting.");
			return false;
		}
		try
		{
			enabled = (bool)EnableAutoPickupField.GetValue(null);
			if (!enabled && !_autoPickupOffShown)
			{
				((Character)player).Message((MessageType)1, "$hud_autopickup: $hud_off", 0, (Sprite)null, false);
			}
			_autoPickupOffShown = !enabled;
			if (!enabled)
			{
				Report("Camera pickup paused: player auto-pickup is off.", warning: false);
			}
			return true;
		}
		catch (Exception ex)
		{
			Report("Camera pickup state read failed: " + ex);
			return false;
		}
	}

	private static void Report(string message, bool warning = true)
	{
		if (warning)
		{
			if (!(Time.time < _nextWarningAt))
			{
				_nextWarningAt = Time.time + 5f;
				Diagnostics.Warn(message);
			}
		}
		else if (!(Time.time < _nextDiagnosticAt))
		{
			_nextDiagnosticAt = Time.time + 5f;
			Diagnostics.Verbose(message);
		}
	}

	private static bool IsFinite(Vector3 value)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0027: Unknown result type (might be due to invalid IL or missing references)
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		//IL_0041: Unknown result type (might be due to invalid IL or missing references)
		if (!float.IsNaN(value.x) && !float.IsInfinity(value.x) && !float.IsNaN(value.y) && !float.IsInfinity(value.y) && !float.IsNaN(value.z))
		{
			return !float.IsInfinity(value.z);
		}
		return false;
	}
}
