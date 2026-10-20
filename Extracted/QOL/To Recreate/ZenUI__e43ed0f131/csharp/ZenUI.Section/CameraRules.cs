using System;
using System.Collections.Generic;
using System.Reflection.Emit;
using HarmonyLib;
using UnityEngine;
using UnityEngine.PostProcessing;
using Zen;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class CameraRules
{
	[HarmonyPatch]
	private static class ShipFirstPersonCamera
	{
		private static bool _isModified;

		private static bool _isOriginalSaved;

		private static Vector2 _origAnchorMin;

		private static Vector2 _origAnchorMax;

		private static Vector2 _origPivot;

		[HarmonyPostfix]
		[HarmonyPatch(typeof(Hud), "UpdateShipHud")]
		private static void Hud_UpdateShipHud(Hud __instance)
		{
			//IL_000b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0011: Expected Obj, but got Unknown
			//IL_00bb: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e5: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fa: Unknown result type (might be due to invalid IL or missing references)
			//IL_008a: Unknown result type (might be due to invalid IL or missing references)
			//IL_008f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0095: Unknown result type (might be due to invalid IL or missing references)
			//IL_009a: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a5: Unknown result type (might be due to invalid IL or missing references)
			RectTransform val = (RectTransform)__instance.m_shipControlsRoot.transform;
			float num = Configs.CameraZoomRepositionShipControls.Value switch
			{
				RepositionShipControls.Never => float.MinValue, 
				RepositionShipControls.FirstPerson => 0f, 
				RepositionShipControls.NearCamera => 2.5f, 
				RepositionShipControls.Always => float.MaxValue, 
				_ => throw new ArgumentOutOfRangeException("CameraZoomRepositionShipControls"), 
			};
			if (!__instance.m_shipHudRoot.activeSelf || GameCamera.instance.m_distance > num)
			{
				RestoreOriginal(val);
				return;
			}
			if (!_isOriginalSaved)
			{
				_origAnchorMin = val.anchorMin;
				_origAnchorMax = val.anchorMax;
				_origPivot = val.pivot;
				_isOriginalSaved = true;
			}
			val.anchorMax = new Vector2(1f, 0f);
			val.anchorMin = new Vector2(1f, 0f);
			val.pivot = new Vector2(1f, 0f);
			val.anchoredPosition = new Vector2(-100f, 30f);
			_isModified = true;
		}

		private static void RestoreOriginal(RectTransform rt)
		{
			//IL_0009: Unknown result type (might be due to invalid IL or missing references)
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_001f: Unknown result type (might be due to invalid IL or missing references)
			if (_isModified)
			{
				rt.anchorMax = _origAnchorMax;
				rt.anchorMin = _origAnchorMin;
				rt.pivot = _origPivot;
				_isModified = false;
			}
		}
	}

	private static bool _isZoomDefaultSaved;

	private static float _minCameraDistanceDefault;

	private static float _maxCameraDistanceDefault;

	private static float _maxCameraDistanceShipDefault;

	public static void SetLodBias(float bias)
	{
		if (!(bias <= 0f))
		{
			Logging<Plugin>.Message($"Set LOD bias: {bias}");
			QualitySettings.lodBias = bias;
		}
	}

	public static void RemoveDirt()
	{
		if (!Configs.CameraRemoveLensDirt.Value)
		{
			return;
		}
		GameCamera instance = GameCamera.instance;
		if (Object.op_Implicit((Object)(object)instance))
		{
			PostProcessingBehaviour component = ((Component)instance).gameObject.GetComponent<PostProcessingBehaviour>();
			if (Object.op_Implicit((Object)(object)component))
			{
				component.profile.bloom.m_Settings.lensDirt.intensity = 0f;
			}
		}
	}

	public static void SetFirstPersonMode(FirstPersonMode mode)
	{
		GameCamera instance = GameCamera.instance;
		if (Object.op_Implicit((Object)(object)instance))
		{
			if (!_isZoomDefaultSaved)
			{
				_minCameraDistanceDefault = GameCamera.instance.m_minDistance;
				_maxCameraDistanceDefault = GameCamera.instance.m_maxDistance;
				_maxCameraDistanceShipDefault = GameCamera.instance.m_maxDistanceBoat;
				_isZoomDefaultSaved = true;
			}
			if (mode != FirstPersonMode.Disabled)
			{
				instance.m_fpsOffset.z = 0.1f;
				instance.m_nearClipPlaneMin = 0.02f;
				instance.m_nearClipPlaneMax = 0.08f;
			}
			switch (mode)
			{
			case FirstPersonMode.Disabled:
				instance.m_minDistance = _minCameraDistanceDefault;
				instance.m_maxDistance = _maxCameraDistanceDefault;
				instance.m_maxDistanceBoat = _maxCameraDistanceShipDefault;
				break;
			case FirstPersonMode.ZoomToEnable:
				instance.m_minDistance = 0f;
				instance.m_maxDistance = _maxCameraDistanceDefault;
				instance.m_maxDistanceBoat = _maxCameraDistanceShipDefault;
				break;
			case FirstPersonMode.AlwaysExceptShips:
				instance.m_minDistance = 0f;
				instance.m_maxDistance = 0f;
				instance.m_maxDistanceBoat = _maxCameraDistanceShipDefault;
				break;
			case FirstPersonMode.Always:
				instance.m_minDistance = 0f;
				instance.m_maxDistance = 0f;
				instance.m_maxDistanceBoat = 0f;
				break;
			default:
				throw new ArgumentOutOfRangeException("mode", mode, null);
			}
		}
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(Player), "FixedUpdate")]
	private static IEnumerable<CodeInstruction> Player_FixedUpdate(IEnumerable<CodeInstruction> codes)
	{
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_002f: Expected Obj, but got Unknown
		//IL_003d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0043: Expected Obj, but got Unknown
		//IL_0051: Unknown result type (might be due to invalid IL or missing references)
		//IL_0057: Expected Obj, but got Unknown
		//IL_0076: Unknown result type (might be due to invalid IL or missing references)
		//IL_009e: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a4: Expected Obj, but got Unknown
		CodeMatch[] array = new CodeMatch[3]
		{
			new CodeMatch((OpCode?)OpCodes.Call, (object)AccessTools.DeclaredMethod(typeof(Vector3), "Distance", (Type[])null, (Type[])null), (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldc_R4, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Bge_Un, (object)null, (string)null)
		};
		Func<float, float> func = GetMaxDistance;
		return new CodeMatcher(codes, (ILGenerator)null).MatchEndForward(array).ThrowIfInvalid("Unable to match IL sequence").Insert(new CodeInstruction[1]
		{
			new CodeInstruction(OpCodes.Call, (object)func.Method)
		})
			.InstructionEnumeration();
		static float GetMaxDistance(float original)
		{
			if (Configs.CameraFirstPerson.Value == FirstPersonMode.Disabled)
			{
				return original;
			}
			if (!(GameCamera.instance.m_distance <= 0f))
			{
				return original;
			}
			return float.MaxValue;
		}
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(GameCamera), "ApplyCameraTilt")]
	private static IEnumerable<CodeInstruction> GameCamera_ApplyCameraTilt(IEnumerable<CodeInstruction> codes)
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Expected Obj, but got Unknown
		//IL_003b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0041: Expected Obj, but got Unknown
		//IL_004f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0055: Expected Obj, but got Unknown
		//IL_0076: Unknown result type (might be due to invalid IL or missing references)
		//IL_007c: Expected Obj, but got Unknown
		//IL_008a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0090: Expected Obj, but got Unknown
		//IL_009e: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a4: Expected Obj, but got Unknown
		//IL_00c3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00eb: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f1: Expected Obj, but got Unknown
		CodeMatch[] array = new CodeMatch[6]
		{
			new CodeMatch((OpCode?)OpCodes.Ldarg_0, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldfld, (object)AccessTools.DeclaredField(typeof(GameCamera), "m_maxDistanceBoat"), (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldarg_0, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldfld, (object)AccessTools.DeclaredField(typeof(GameCamera), "m_minDistance"), (string)null),
			new CodeMatch((OpCode?)OpCodes.Sub, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Div, (object)null, (string)null)
		};
		Func<float, float> func = ProtectDivZero;
		return new CodeMatcher(codes, (ILGenerator)null).MatchEndForward(array).ThrowIfInvalid("Unable to match IL sequence").Insert(new CodeInstruction[1]
		{
			new CodeInstruction(OpCodes.Call, (object)func.Method)
		})
			.InstructionEnumeration();
		static float ProtectDivZero(float value)
		{
			if (value != 0f)
			{
				return value;
			}
			return 1f;
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(GameCamera), "Awake")]
	private static void GameCamera_Awake(GameCamera __instance)
	{
		SetFirstPersonMode(Configs.CameraFirstPerson.Value);
	}
}
