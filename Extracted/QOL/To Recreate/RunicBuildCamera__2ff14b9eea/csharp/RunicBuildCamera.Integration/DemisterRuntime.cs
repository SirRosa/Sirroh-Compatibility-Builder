using System;
using System.Collections.Generic;
using System.Reflection;
using HarmonyLib;
using UnityEngine;

namespace RunicBuildCamera.Integration;

internal static class DemisterRuntime
{
	private readonly struct ForceFieldBaseline
	{
		internal ParticleSystemForceField Field { get; }

		internal float EndRange { get; }

		internal ForceFieldBaseline(ParticleSystemForceField field, float endRange)
		{
			Field = field;
			EndRange = endRange;
		}
	}

	private sealed class BallState
	{
		internal GameObject Ball { get; }

		internal ForceFieldBaseline[] ForceFields { get; }

		internal BallState(GameObject ball, ForceFieldBaseline[] forceFields)
		{
			Ball = ball;
			ForceFields = forceFields ?? Array.Empty<ForceFieldBaseline>();
		}
	}

	private static readonly FieldInfo BallInstanceField = AccessTools.Field(typeof(SE_Demister), "m_ballInstance");

	private static readonly Dictionary<int, BallState> BallStates = new Dictionary<int, BallState>();

	private static readonly Dictionary<int, int> EffectBallIds = new Dictionary<int, int>();

	private static bool _subscribed;

	internal static void AfterStatusEffectUpdate(SE_Demister effect)
	{
		//IL_00b0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f6: Unknown result type (might be due to invalid IL or missing references)
		EnsureSubscribed();
		if ((Object)(object)effect == (Object)null)
		{
			RefreshActiveState();
			return;
		}
		GameObject ball = GetBall(effect);
		if (!Object.op_Implicit((Object)(object)ball))
		{
			RestoreEffect(effect);
			PruneDestroyedBalls();
			return;
		}
		int instanceID = ((Object)effect).GetInstanceID();
		int instanceID2 = ((Object)ball).GetInstanceID();
		if (EffectBallIds.TryGetValue(instanceID, out var value) && value != instanceID2)
		{
			RestoreBall(value);
		}
		EffectBallIds[instanceID] = instanceID2;
		bool num = BuildCameraConfig.DemisterFollowCamera != null && BuildCameraConfig.DemisterFollowCamera.Value;
		bool flag = BuildCameraRuntime.TryGetActiveContext(out var player, out var cameraPosition, out var _);
		if (!num || !flag || (Object)(object)player == (Object)null || (Object)(object)player != (Object)(object)Player.m_localPlayer || (Object)(object)((StatusEffect)effect).m_character != (Object)(object)player || !IsFinite(cameraPosition))
		{
			RestoreEffect(effect);
			return;
		}
		BallState orCaptureBall = GetOrCaptureBall(ball);
		if (orCaptureBall != null)
		{
			float multiplier = ((BuildCameraConfig.DemisterRangeMultiplier != null) ? BuildCameraConfig.DemisterRangeMultiplier.Value : 1f);
			ApplyRange(orCaptureBall, multiplier);
			ball.transform.position = cameraPosition;
			PruneDestroyedBalls();
		}
	}

	internal static void BeforeRemoveEffects(SE_Demister effect)
	{
		EnsureSubscribed();
		RestoreEffect(effect);
		PruneDestroyedBalls();
	}

	internal static void RefreshActiveState()
	{
		EnsureSubscribed();
		if (BuildCameraConfig.DemisterFollowCamera == null || !BuildCameraConfig.DemisterFollowCamera.Value || !BuildCameraRuntime.TryGetActiveContext(out var _, out var _, out var _))
		{
			RestoreAll();
		}
		else
		{
			PruneDestroyedBalls();
		}
	}

	internal static void OnCameraExit()
	{
		RestoreAll();
	}

	internal static void Shutdown()
	{
		if (_subscribed)
		{
			BuildCameraConfig.Changed -= OnConfigurationChanged;
			_subscribed = false;
		}
		RestoreAll();
	}

	private static BallState GetOrCaptureBall(GameObject ball)
	{
		int instanceID = ((Object)ball).GetInstanceID();
		if (BallStates.TryGetValue(instanceID, out var value) && value.Ball == ball)
		{
			return value;
		}
		if (value != null)
		{
			RestoreState(value);
		}
		ParticleSystemForceField[] array;
		try
		{
			array = ball.GetComponentsInChildren<ParticleSystemForceField>(true);
		}
		catch
		{
			array = Array.Empty<ParticleSystemForceField>();
		}
		List<ForceFieldBaseline> list = new List<ForceFieldBaseline>(array.Length);
		ParticleSystemForceField[] array2 = array;
		foreach (ParticleSystemForceField val in array2)
		{
			if (Object.op_Implicit((Object)(object)val))
			{
				list.Add(new ForceFieldBaseline(val, val.endRange));
			}
		}
		BallState ballState = new BallState(ball, list.ToArray());
		BallStates[instanceID] = ballState;
		return ballState;
	}

	private static void ApplyRange(BallState state, float multiplier)
	{
		float num = ((IsFinite(multiplier) && multiplier > 0f) ? multiplier : 1f);
		ForceFieldBaseline[] forceFields = state.ForceFields;
		for (int i = 0; i < forceFields.Length; i++)
		{
			ForceFieldBaseline forceFieldBaseline = forceFields[i];
			ParticleSystemForceField field = forceFieldBaseline.Field;
			if (Object.op_Implicit((Object)(object)field))
			{
				double num2 = (double)forceFieldBaseline.EndRange * (double)num;
				field.endRange = ((double.IsNaN(num2) || double.IsInfinity(num2) || num2 > 3.4028234663852886E+38 || num2 < -3.4028234663852886E+38) ? forceFieldBaseline.EndRange : ((float)num2));
			}
		}
	}

	private static void RestoreEffect(SE_Demister effect)
	{
		if ((Object)(object)effect == (Object)null)
		{
			return;
		}
		int instanceID = ((Object)effect).GetInstanceID();
		if (EffectBallIds.TryGetValue(instanceID, out var value))
		{
			RestoreBall(value);
			EffectBallIds.Remove(instanceID);
			return;
		}
		GameObject ball = GetBall(effect);
		if (Object.op_Implicit((Object)(object)ball))
		{
			RestoreBall(((Object)ball).GetInstanceID());
		}
	}

	private static void RestoreBall(int ballId)
	{
		if (!BallStates.TryGetValue(ballId, out var value))
		{
			return;
		}
		RestoreState(value);
		BallStates.Remove(ballId);
		List<int> list = null;
		foreach (KeyValuePair<int, int> effectBallId in EffectBallIds)
		{
			if (effectBallId.Value == ballId)
			{
				if (list == null)
				{
					list = new List<int>();
				}
				list.Add(effectBallId.Key);
			}
		}
		if (list == null)
		{
			return;
		}
		foreach (int item in list)
		{
			EffectBallIds.Remove(item);
		}
	}

	private static void RestoreState(BallState state)
	{
		//IL_0064: Unknown result type (might be due to invalid IL or missing references)
		ForceFieldBaseline[] forceFields = state.ForceFields;
		for (int i = 0; i < forceFields.Length; i++)
		{
			ForceFieldBaseline forceFieldBaseline = forceFields[i];
			ParticleSystemForceField field = forceFieldBaseline.Field;
			if (Object.op_Implicit((Object)(object)field))
			{
				field.endRange = forceFieldBaseline.EndRange;
			}
		}
		Player localPlayer = Player.m_localPlayer;
		if (Object.op_Implicit((Object)(object)state.Ball) && Object.op_Implicit((Object)(object)localPlayer))
		{
			state.Ball.transform.position = ((Character)localPlayer).GetCenterPoint();
		}
	}

	private static void RestoreAll()
	{
		foreach (BallState value in BallStates.Values)
		{
			RestoreState(value);
		}
		BallStates.Clear();
		EffectBallIds.Clear();
	}

	private static void PruneDestroyedBalls()
	{
		List<int> list = null;
		foreach (KeyValuePair<int, BallState> ballState in BallStates)
		{
			if (!Object.op_Implicit((Object)(object)ballState.Value.Ball))
			{
				if (list == null)
				{
					list = new List<int>();
				}
				list.Add(ballState.Key);
			}
		}
		if (list == null)
		{
			return;
		}
		foreach (int item in list)
		{
			RestoreBall(item);
		}
	}

	private static GameObject GetBall(SE_Demister effect)
	{
		if ((Object)(object)effect == (Object)null || BallInstanceField == null || BallInstanceField.FieldType != typeof(GameObject) || BallInstanceField.IsStatic)
		{
			return null;
		}
		try
		{
			object? value = BallInstanceField.GetValue(effect);
			return (GameObject)((value is GameObject) ? value : null);
		}
		catch
		{
			return null;
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
		RestoreAll();
	}

	private static bool IsFinite(Vector3 value)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		if (IsFinite(value.x) && IsFinite(value.y))
		{
			return IsFinite(value.z);
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
