using System;
using BepInEx.Configuration;
using Runic.Localization;
using RunicBuildCamera.Core;
using UnityEngine;

namespace RunicBuildCamera.Integration;

internal static class BuildCameraRuntime
{
	private static readonly BuildCameraSession Session = new BuildCameraSession();

	private static bool _initialized;

	private static bool _focused = true;

	internal static bool IsActive
	{
		get
		{
			if (_initialized)
			{
				return Session.IsActive;
			}
			return false;
		}
	}

	internal static void Initialize()
	{
		Session.End();
		_focused = Application.isFocused;
		_initialized = true;
	}

	internal static void Shutdown()
	{
		Stop();
		_initialized = false;
	}

	internal static void Tick()
	{
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		//IL_003d: Unknown result type (might be due to invalid IL or missing references)
		//IL_005f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0060: Unknown result type (might be due to invalid IL or missing references)
		//IL_013f: Unknown result type (might be due to invalid IL or missing references)
		if (!_initialized)
		{
			return;
		}
		_focused = Application.isFocused;
		Player localPlayer = Player.m_localPlayer;
		KeyboardShortcut value = BuildCameraConfig.ToggleShortcut.Value;
		bool num = (int)value.MainKey != 0 && Input.GetKeyDown(value.MainKey);
		bool flag = (int)value.MainKey != 0 && value.IsDown();
		if (num && !flag)
		{
			string text = RunicText.Get("text_868e36f8c510");
			KeyboardShortcut val = value;
			ActivationFeedback(localPlayer, text + ((object)val/*cast due to constrained. prefix*/).ToString());
		}
		if (!ConfigEnabled() || !_focused)
		{
			if (flag)
			{
				ActivationFeedback(localPlayer, (!ConfigEnabled()) ? RunicText.Get("text_e1ab24965475") : RunicText.Get("text_4ea5638c368a"));
			}
			Stop();
		}
		else if (Session.IsActive && (!SessionBelongsToUsablePlayer(localPlayer) || (Object)(object)GameCamera.instance == (Object)null))
		{
			Stop();
		}
		else if (flag)
		{
			if (Session.IsActive)
			{
				Stop();
				ActivationFeedback(localPlayer, "Off.");
			}
			else if (ValheimAdapter.CanTakeInput(localPlayer))
			{
				TryStart(localPlayer);
			}
			else
			{
				ActivationFeedback(localPlayer, RunicText.Get("text_f46af67108b2"));
			}
		}
		else if (Session.IsActive)
		{
			if (!ValheimAdapter.IsBuildToolEquipped(localPlayer))
			{
				Stop();
				return;
			}
			Session.Reanchor(((Component)localPlayer).transform.position);
			Session.UpdateRange(Positive(BuildCameraConfig.CameraRange.Value, 1f));
		}
	}

	internal static void OnApplicationFocus(bool focused)
	{
		_focused = focused;
		if (!focused)
		{
			Stop();
		}
	}

	internal static void OnConfigurationChanged()
	{
		if (_initialized)
		{
			if (!ConfigEnabled())
			{
				Stop();
			}
			else if (Session.IsActive)
			{
				Session.UpdateRange(Positive(BuildCameraConfig.CameraRange.Value, 1f));
			}
		}
	}

	internal static void OnLocalPlayerAssigned(Player player)
	{
		if (Session.IsActive && ((Object)(object)player == (Object)null || !Session.BelongsTo(((Object)player).GetInstanceID())))
		{
			Stop();
		}
	}

	internal static bool ShouldFreezePlayer(Player player)
	{
		if (IsActive && (Object)(object)player != (Object)null && Session.BelongsTo(((Object)player).GetInstanceID()))
		{
			return ValheimAdapter.IsLocalPlayer(player);
		}
		return false;
	}

	internal static ValheimAdapter.RangeLease EnterRemoteActionRange(Player player)
	{
		if (!ShouldFreezePlayer(player))
		{
			return null;
		}
		float num = Positive(BuildCameraConfig.RemoteActionDistance.Value, 1f);
		return ValheimAdapter.EnterRemoteActionRange(player, num, num);
	}

	internal static bool IsWithinRemoteActionLimit(Player player, Vector3 target)
	{
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_0035: Unknown result type (might be due to invalid IL or missing references)
		//IL_003c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0041: Unknown result type (might be due to invalid IL or missing references)
		//IL_0046: Unknown result type (might be due to invalid IL or missing references)
		//IL_0047: Unknown result type (might be due to invalid IL or missing references)
		if (!ShouldFreezePlayer(player) || (Object)(object)((Character)player).m_eye == (Object)null || !IsFinite(target))
		{
			return false;
		}
		float num = Positive(BuildCameraConfig.RemoteActionDistance.Value, 1f);
		Vector3 value = target - ((Character)player).m_eye.position;
		if (IsFinite(value))
		{
			return (double)value.sqrMagnitude <= (double)num * (double)num;
		}
		return false;
	}

	internal static bool TryUpdateCamera(GameCamera camera, float deltaTime)
	{
		//IL_0032: Unknown result type (might be due to invalid IL or missing references)
		//IL_0092: Unknown result type (might be due to invalid IL or missing references)
		//IL_009c: Unknown result type (might be due to invalid IL or missing references)
		if (!IsActive || (Object)(object)camera == (Object)null)
		{
			return false;
		}
		Player localPlayer = Player.m_localPlayer;
		if (!SessionBelongsToUsablePlayer(localPlayer))
		{
			Stop();
			return false;
		}
		Session.Reanchor(((Component)localPlayer).transform.position);
		if (_focused && ValheimAdapter.CanTakeInput(localPlayer) && !Console.IsVisible() && ((Object)(object)Hud.instance == (Object)null || !Hud.IsPieceSelectionVisible()))
		{
			Session.SetPose(StepCamera(Session, deltaTime));
		}
		((Component)camera).transform.SetPositionAndRotation(Session.Position, Session.Rotation);
		return true;
	}

	internal static bool TryGetActiveContext(out Player player, out Vector3 cameraPosition, out Quaternion cameraRotation)
	{
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		//IL_0028: Unknown result type (might be due to invalid IL or missing references)
		//IL_0035: Unknown result type (might be due to invalid IL or missing references)
		//IL_003a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0045: Unknown result type (might be due to invalid IL or missing references)
		//IL_004a: Unknown result type (might be due to invalid IL or missing references)
		player = Player.m_localPlayer;
		if (!IsActive || !SessionBelongsToUsablePlayer(player))
		{
			cameraPosition = Vector3.zero;
			cameraRotation = Quaternion.identity;
			return false;
		}
		cameraPosition = Session.Position;
		cameraRotation = Session.Rotation;
		return true;
	}

	internal static void ForceStop()
	{
		Stop();
	}

	internal static bool ExitInputRequested()
	{
		//IL_005c: Unknown result type (might be due to invalid IL or missing references)
		if (CameraExitInput.HotbarRequested((Func<string, bool>)ZInput.GetButtonDown))
		{
			return true;
		}
		Player localPlayer = Player.m_localPlayer;
		bool shortControllerRelease = !Hud.InRadial() && ZInput.GetButtonUp("JoyHide") && ZInput.GetButtonLastPressedTimer("JoyHide") < 0.33f;
		return CameraExitInput.HideRequested(ZInput.GetButtonDown("Hide"), (int)ZInput.InputLayout != 0 && ZInput.IsGamepadActive(), shortControllerRelease, ((Character)localPlayer).InPlaceMode(), ZInput.GetButton("JoyAltKeys"));
	}

	private static void TryStart(Player player)
	{
		//IL_005f: Unknown result type (might be due to invalid IL or missing references)
		//IL_006a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0075: Unknown result type (might be due to invalid IL or missing references)
		if (!ValheimAdapter.IsBuildToolEquipped(player))
		{
			ActivationFeedback(player, RunicText.Get("text_aad211031f8b"));
			return;
		}
		GameCamera instance = GameCamera.instance;
		if ((Object)(object)instance == (Object)null)
		{
			ActivationFeedback(player, RunicText.Get("text_2e15e203e13d"));
			return;
		}
		float range = Positive(BuildCameraConfig.CameraRange.Value, 1f);
		Session.Begin(((Object)player).GetInstanceID(), ((Component)player).transform.position, ((Component)instance).transform.position, ((Component)instance).transform.rotation, range);
		ActivationFeedback(player, RunicText.Get("text_3691699c3e79"));
	}

	private static void ActivationFeedback(Player player, string message)
	{
		Diagnostics.Info("Build camera: " + message);
		if ((Object)(object)player != (Object)null)
		{
			((Character)player).Message((MessageType)1, RunicText.Get("text_5a7920bb73fd") + message, 0, (Sprite)null, false);
		}
	}

	private static CameraPose StepCamera(BuildCameraSession session, float deltaTime)
	{
		//IL_0133: Unknown result type (might be due to invalid IL or missing references)
		//IL_0145: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a0: Unknown result type (might be due to invalid IL or missing references)
		//IL_01b0: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c0: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c5: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d0: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d3: Unknown result type (might be due to invalid IL or missing references)
		//IL_01de: Unknown result type (might be due to invalid IL or missing references)
		//IL_01e3: Unknown result type (might be due to invalid IL or missing references)
		//IL_01e7: Unknown result type (might be due to invalid IL or missing references)
		float right = ButtonAxis("Right", "Left") + ZInput.GetJoyLeftStickX();
		float forward = ButtonAxis("Forward", "Backward") - ZInput.GetJoyLeftStickY();
		float up = ((ZInput.GetButton("Jump") || ZInput.GetButton("JoyJump")) ? 1f : 0f) - ((ZInput.GetButton("Crouch") || ZInput.GetButton("JoyCrouch")) ? 1f : 0f);
		float num = Input.GetAxis("Mouse X") * PlayerController.m_mouseSens;
		float num2 = Input.GetAxis("Mouse Y") * PlayerController.m_mouseSens;
		float num3 = ZInput.GetJoyRightStickX() * 110f * deltaTime;
		float num4 = ZInput.GetJoyRightStickY() * 110f * deltaTime;
		if (BuildCameraConfig.InvertMouseHorizontal.Value)
		{
			num = 0f - num;
		}
		if (PlayerController.m_invertMouse)
		{
			num2 = 0f - num2;
		}
		if (BuildCameraConfig.InvertMouseVertical.Value)
		{
			num2 = 0f - num2;
		}
		if (BuildCameraConfig.InvertControllerHorizontal.Value)
		{
			num3 = 0f - num3;
		}
		if (BuildCameraConfig.InvertControllerVertical.Value)
		{
			num4 = 0f - num4;
		}
		CameraMotionInput input = new CameraMotionInput(right, up, forward, num + num3, 0f - num2 + num4, ZInput.GetButton("Run") || ZInput.GetButton("JoyRun"));
		CameraPose result = CameraMotion.Step(session.Position, session.Yaw, session.Pitch, session.Anchor, session.Range, in input, deltaTime, Positive(BuildCameraConfig.MoveSpeed.Value, 0f), Positive(BuildCameraConfig.FastMoveMultiplier.Value, 1f), BuildCameraConfig.WorldRelativeMovement.Value);
		float num5 = default;
		if ((Object)(object)ZoneSystem.instance != (Object)null && ZoneSystem.instance.GetGroundHeight(result.Position, ref num5) && result.Position.y < num5)
		{
			Vector3 position = result.Position;
			position.y = num5;
			position = CameraMotion.ClampToAnchor(position, session.Anchor, session.Range);
			result = new CameraPose(position, result.Yaw, result.Pitch);
		}
		return result;
	}

	private static float ButtonAxis(string positive, string negative)
	{
		return (ZInput.GetButton(positive) ? 1f : 0f) - (ZInput.GetButton(negative) ? 1f : 0f);
	}

	private static bool SessionBelongsToUsablePlayer(Player player)
	{
		if ((Object)(object)player != (Object)null && Session.BelongsTo(((Object)player).GetInstanceID()))
		{
			return ValheimAdapter.IsUsableLocalPlayer(player);
		}
		return false;
	}

	private static bool ConfigEnabled()
	{
		if (BuildCameraConfig.Enabled != null && BuildCameraConfig.ToggleShortcut != null && BuildCameraConfig.CameraRange != null && BuildCameraConfig.MoveSpeed != null && BuildCameraConfig.FastMoveMultiplier != null && BuildCameraConfig.WorldRelativeMovement != null && BuildCameraConfig.RemoteActionDistance != null && BuildCameraConfig.InvertMouseHorizontal != null && BuildCameraConfig.InvertMouseVertical != null && BuildCameraConfig.InvertControllerHorizontal != null && BuildCameraConfig.InvertControllerVertical != null)
		{
			return BuildCameraConfig.Enabled.Value;
		}
		return false;
	}

	private static float Positive(float value, float fallback)
	{
		if (float.IsNaN(value) || float.IsInfinity(value) || !(value > 0f))
		{
			return fallback;
		}
		return value;
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

	private static void Stop()
	{
		if (Session.IsActive)
		{
			Session.End();
		}
		ValheimAdapter.ForceRestoreRanges();
	}
}
