using System;
using System.Collections.Generic;
using System.Reflection;
using HarmonyLib;
using Runic.Localization;
using UnityEngine;

namespace RunicBuildCamera.Integration;

internal static class ValheimAdapter
{
	private delegate bool TakeInputDelegate(Player player);

	internal sealed class RangeState
	{
		internal Player Player;

		internal float Original;

		internal float Requested;

		internal int Depth;
	}

	internal sealed class RangeLease : IDisposable
	{
		private readonly int _playerId;

		private readonly RangeState _state;

		private bool _disposed;

		internal RangeLease(int playerId, RangeState state)
		{
			_playerId = playerId;
			_state = state;
		}

		public void Dispose()
		{
			if (!_disposed)
			{
				_disposed = true;
				ExitRange(_playerId, _state);
			}
		}
	}

	private static readonly Dictionary<int, RangeState> RangeStates = new Dictionary<int, RangeState>();

	private static FieldRef<Player, float> _maxPlaceDistance;

	private static FieldRef<Humanoid, ItemData> _rightItem;

	private static TakeInputDelegate _takeInput;

	private static bool _initialized;

	internal static MethodInfo UpdatePlacementMethod { get; private set; }

	internal static MethodInfo UpdatePlacementGhostMethod { get; private set; }

	internal static MethodInfo UpdateCameraMethod { get; private set; }

	internal static MethodInfo SetControlsMethod { get; private set; }

	internal static bool Initialize(out string error)
	{
		error = null;
		if (_initialized)
		{
			return true;
		}
		try
		{
			_maxPlaceDistance = AccessTools.FieldRefAccess<Player, float>(RequireField(typeof(Player), "m_maxPlaceDistance", typeof(float)));
			_rightItem = AccessTools.FieldRefAccess<Humanoid, ItemData>(RequireField(typeof(Humanoid), "m_rightItem", typeof(ItemData)));
			UpdatePlacementMethod = RequireMethod(typeof(Player), "UpdatePlacement", typeof(void), typeof(bool), typeof(float));
			UpdatePlacementGhostMethod = RequireMethod(typeof(Player), "UpdatePlacementGhost", typeof(void), typeof(bool));
			UpdateCameraMethod = RequireMethod(typeof(GameCamera), "UpdateCamera", typeof(void), typeof(float));
			SetControlsMethod = RequireMethod(typeof(Player), "SetControls", typeof(void), typeof(Vector3), typeof(bool), typeof(bool), typeof(bool), typeof(bool), typeof(bool), typeof(bool), typeof(bool), typeof(bool), typeof(bool), typeof(bool), typeof(bool));
			MethodInfo methodInfo = AccessTools.Method(typeof(Player), "TakeInput", Type.EmptyTypes, (Type[])null);
			if (methodInfo == null || methodInfo.ReturnType != typeof(bool))
			{
				throw new MissingMethodException(typeof(Player).FullName, "TakeInput()");
			}
			_takeInput = AccessTools.MethodDelegate<TakeInputDelegate>(methodInfo, (object)null, true);
			_initialized = true;
			return true;
		}
		catch (Exception ex)
		{
			Shutdown();
			error = RunicText.Get("text_d8ff831563aa") + ex.GetType().Name + ": " + ex.Message;
			return false;
		}
	}

	internal static void Shutdown()
	{
		ForceRestoreRanges();
		_maxPlaceDistance = null;
		_rightItem = null;
		_takeInput = null;
		UpdatePlacementMethod = null;
		UpdatePlacementGhostMethod = null;
		UpdateCameraMethod = null;
		SetControlsMethod = null;
		_initialized = false;
	}

	internal static bool IsLocalPlayer(Player player)
	{
		if ((Object)(object)player != (Object)null && (Object)(object)Player.m_localPlayer != (Object)null)
		{
			return (Object)(object)player == (Object)(object)Player.m_localPlayer;
		}
		return false;
	}

	internal static bool IsUsableLocalPlayer(Player player)
	{
		if (!IsLocalPlayer(player))
		{
			return false;
		}
		try
		{
			return !((Character)player).IsDead() && !((Character)player).IsTeleporting();
		}
		catch
		{
			return false;
		}
	}

	internal static bool IsBuildToolEquipped(Player player)
	{
		if (!IsUsableLocalPlayer(player))
		{
			return false;
		}
		try
		{
			ItemData val = ((_rightItem != null) ? _rightItem.Invoke((Humanoid)(object)player) : null);
			return val != null && val.m_shared != null && (Object)(object)val.m_shared.m_buildPieces != (Object)null && ((Character)player).InPlaceMode();
		}
		catch
		{
			return false;
		}
	}

	internal static bool CanTakeInput(Player player)
	{
		if (!IsUsableLocalPlayer(player) || _takeInput == null)
		{
			return false;
		}
		try
		{
			return _takeInput(player);
		}
		catch
		{
			return false;
		}
	}

	internal static RangeLease EnterRemoteActionRange(Player player, float requestedPlayerRange, float requestedStationRange)
	{
		if (!_initialized || !IsLocalPlayer(player) || _maxPlaceDistance == null || !IsFinite(requestedPlayerRange) || !IsPositiveFinite(requestedStationRange))
		{
			return null;
		}
		int instanceID = ((Object)player).GetInstanceID();
		if (!RangeStates.TryGetValue(instanceID, out var value))
		{
			value = new RangeState
			{
				Player = player,
				Original = _maxPlaceDistance.Invoke(player),
				Requested = requestedStationRange,
				Depth = 0
			};
			RangeStates.Add(instanceID, value);
		}
		value.Depth++;
		_maxPlaceDistance.Invoke(player) = requestedPlayerRange;
		return new RangeLease(instanceID, value);
	}

	internal static void ForceRestoreRanges()
	{
		foreach (RangeState value in RangeStates.Values)
		{
			try
			{
				if ((Object)(object)value.Player != (Object)null && _maxPlaceDistance != null)
				{
					_maxPlaceDistance.Invoke(value.Player) = value.Original;
				}
			}
			catch
			{
			}
		}
		RangeStates.Clear();
	}

	internal static bool TryGetScopedStationRange(out float range)
	{
		foreach (RangeState value in RangeStates.Values)
		{
			if (value.Depth > 0 && IsPositiveFinite(value.Requested))
			{
				range = value.Requested;
				return true;
			}
		}
		range = 0f;
		return false;
	}

	private static void ExitRange(int playerId, RangeState expected)
	{
		if (!RangeStates.TryGetValue(playerId, out var value) || value != expected)
		{
			return;
		}
		value.Depth--;
		if (value.Depth <= 0)
		{
			if ((Object)(object)value.Player != (Object)null && _maxPlaceDistance != null)
			{
				_maxPlaceDistance.Invoke(value.Player) = value.Original;
			}
			RangeStates.Remove(playerId);
		}
	}

	private static FieldInfo RequireField(Type owner, string name, Type fieldType)
	{
		FieldInfo fieldInfo = AccessTools.Field(owner, name);
		if (fieldInfo == null || fieldInfo.FieldType != fieldType)
		{
			throw new MissingFieldException(owner.FullName, name);
		}
		return fieldInfo;
	}

	private static MethodInfo RequireMethod(Type owner, string name, Type returnType, params Type[] parameters)
	{
		MethodInfo methodInfo = AccessTools.Method(owner, name, parameters, (Type[])null);
		if (methodInfo == null || methodInfo.ReturnType != returnType)
		{
			throw new MissingMethodException(owner.FullName, name);
		}
		return methodInfo;
	}

	private static bool IsPositiveFinite(float value)
	{
		if (!float.IsNaN(value) && !float.IsInfinity(value))
		{
			return value > 0f;
		}
		return false;
	}

	private static bool IsFinite(float value)
	{
		if (!float.IsNaN(value))
		{
			return !float.IsInfinity(value);
		}
		return false;
	}
}
