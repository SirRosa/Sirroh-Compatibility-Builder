using System.Runtime.CompilerServices;
using UnityEngine;

namespace RunicBuildCamera.Core;

internal sealed class BuildCameraSession
{
	internal bool IsActive { get; private set; }

	internal int PlayerInstanceId { get; private set; }

	internal Vector3 Anchor
	{
		[CompilerGenerated]
		get
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			return field;
		}
		[CompilerGenerated]
		private set
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			field = value;
		}
	}

	internal Vector3 Position
	{
		[CompilerGenerated]
		get
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			return field;
		}
		[CompilerGenerated]
		private set
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			field = value;
		}
	}

	internal float Yaw { get; private set; }

	internal float Pitch { get; private set; }

	internal float Range { get; private set; }

	internal Quaternion Rotation
	{
		get
		{
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			return Quaternion.Euler(Pitch, Yaw, 0f);
		}
	}

	internal bool Begin(int playerInstanceId, Vector3 anchor, Vector3 cameraPosition, Quaternion cameraRotation, float range)
	{
		//IL_0003: Unknown result type (might be due to invalid IL or missing references)
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		//IL_003e: Unknown result type (might be due to invalid IL or missing references)
		//IL_004d: Unknown result type (might be due to invalid IL or missing references)
		//IL_005e: Unknown result type (might be due to invalid IL or missing references)
		//IL_007e: Unknown result type (might be due to invalid IL or missing references)
		//IL_007f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0082: Unknown result type (might be due to invalid IL or missing references)
		if (playerInstanceId == 0 || !IsFinite(anchor) || !IsFinite(cameraPosition) || !IsFinite(cameraRotation) || !IsPositiveFinite(range))
		{
			return false;
		}
		Vector3 eulerAngles = cameraRotation.eulerAngles;
		IsActive = true;
		PlayerInstanceId = playerInstanceId;
		Anchor = anchor;
		Range = range;
		Yaw = CameraMotion.NormalizeAngle(eulerAngles.y);
		Pitch = Mathf.Clamp(CameraMotion.NormalizeAngle(eulerAngles.x), -89f, 89f);
		Position = CameraMotion.ClampToAnchor(cameraPosition, anchor, range);
		return true;
	}

	internal bool BelongsTo(int playerInstanceId)
	{
		if (IsActive && playerInstanceId != 0)
		{
			return PlayerInstanceId == playerInstanceId;
		}
		return false;
	}

	internal void Reanchor(Vector3 anchor)
	{
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0027: Unknown result type (might be due to invalid IL or missing references)
		//IL_002c: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0033: Unknown result type (might be due to invalid IL or missing references)
		//IL_003e: Unknown result type (might be due to invalid IL or missing references)
		if (IsActive && IsFinite(anchor))
		{
			Vector3 val = anchor - Anchor;
			Anchor = anchor;
			Position = CameraMotion.ClampToAnchor(Position + val, Anchor, Range);
		}
	}

	internal void SetPose(in CameraPose pose)
	{
		//IL_0009: Unknown result type (might be due to invalid IL or missing references)
		//IL_0032: Unknown result type (might be due to invalid IL or missing references)
		//IL_0038: Unknown result type (might be due to invalid IL or missing references)
		//IL_0043: Unknown result type (might be due to invalid IL or missing references)
		if (IsActive && IsFinite(pose.Position) && IsFinite(pose.Yaw) && IsFinite(pose.Pitch))
		{
			Position = CameraMotion.ClampToAnchor(pose.Position, Anchor, Range);
			Yaw = CameraMotion.NormalizeAngle(pose.Yaw);
			Pitch = Mathf.Clamp(pose.Pitch, -89f, 89f);
		}
	}

	internal void UpdateRange(float range)
	{
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		if (IsActive && IsPositiveFinite(range))
		{
			Range = range;
			Position = CameraMotion.ClampToAnchor(Position, Anchor, Range);
		}
	}

	internal void End()
	{
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		IsActive = false;
		PlayerInstanceId = 0;
		Anchor = Vector3.zero;
		Position = Vector3.zero;
		Yaw = 0f;
		Pitch = 0f;
		Range = 0f;
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

	private static bool IsFinite(Quaternion value)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0027: Unknown result type (might be due to invalid IL or missing references)
		if (IsFinite(value.x) && IsFinite(value.y) && IsFinite(value.z))
		{
			return IsFinite(value.w);
		}
		return false;
	}

	private static bool IsPositiveFinite(float value)
	{
		if (IsFinite(value))
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
