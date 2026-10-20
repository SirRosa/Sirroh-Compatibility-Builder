using UnityEngine;

namespace RunicBuildCamera.Core;

internal static class CameraMotion
{
	internal static CameraPose Step(Vector3 position, float yaw, float pitch, Vector3 anchor, float range, in CameraMotionInput input, float deltaTime, float moveSpeed, float fastMoveMultiplier, bool worldRelativeMovement)
	{
		//IL_0051: Unknown result type (might be due to invalid IL or missing references)
		//IL_007b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0080: Unknown result type (might be due to invalid IL or missing references)
		//IL_008b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0091: Unknown result type (might be due to invalid IL or missing references)
		//IL_0096: Unknown result type (might be due to invalid IL or missing references)
		//IL_009b: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a6: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ab: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b0: Unknown result type (might be due to invalid IL or missing references)
		//IL_006f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0070: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fa: Unknown result type (might be due to invalid IL or missing references)
		//IL_0100: Unknown result type (might be due to invalid IL or missing references)
		//IL_0105: Unknown result type (might be due to invalid IL or missing references)
		//IL_0127: Unknown result type (might be due to invalid IL or missing references)
		//IL_012a: Unknown result type (might be due to invalid IL or missing references)
		float num = SanitizeDeltaTime(deltaTime);
		float num2 = NormalizeAngle(yaw + Sanitize(input.YawDelta));
		float num3 = Mathf.Clamp(pitch + Sanitize(input.PitchDelta), -89f, 89f);
		Vector3 val = new Vector3(input.Right, input.Up, input.Forward);
		if (val.sqrMagnitude > 1f)
		{
			val.Normalize();
		}
		Vector3 val2;
		if (worldRelativeMovement)
		{
			val2 = val;
		}
		else
		{
			val2 = Quaternion.Euler(num3, num2, 0f) * new Vector3(val.x, 0f, val.z) + Vector3.up * val.y;
			if (val2.sqrMagnitude > 1f)
			{
				val2.Normalize();
			}
		}
		float num4 = Mathf.Max(0f, Sanitize(moveSpeed));
		if (input.Fast)
		{
			num4 *= Mathf.Max(1f, Sanitize(fastMoveMultiplier));
		}
		Vector3 position2 = position + val2 * (num4 * num);
		float range2 = ((IsFinite(range) && range > 0f) ? range : 0.01f);
		return new CameraPose(ClampToAnchor(position2, anchor, range2), num2, num3);
	}

	internal static Vector3 ClampToAnchor(Vector3 position, Vector3 anchor, float range)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Unknown result type (might be due to invalid IL or missing references)
		//IL_0024: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		//IL_0026: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		//IL_003c: Unknown result type (might be due to invalid IL or missing references)
		//IL_003f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0045: Unknown result type (might be due to invalid IL or missing references)
		//IL_004a: Unknown result type (might be due to invalid IL or missing references)
		//IL_003a: Unknown result type (might be due to invalid IL or missing references)
		if (!IsFinite(position) || !IsFinite(anchor))
		{
			return anchor;
		}
		if (!IsFinite(range) || range <= 0f)
		{
			return anchor;
		}
		Vector3 val = position - anchor;
		float num = range * range;
		if (val.sqrMagnitude <= num)
		{
			return position;
		}
		return anchor + val.normalized * range;
	}

	internal static float NormalizeAngle(float degrees)
	{
		if (!IsFinite(degrees))
		{
			return 0f;
		}
		degrees %= 360f;
		if (degrees > 180f)
		{
			degrees -= 360f;
		}
		if (degrees <= -180f)
		{
			degrees += 360f;
		}
		return degrees;
	}

	private static float SanitizeDeltaTime(float value)
	{
		if (!IsFinite(value))
		{
			return 0f;
		}
		return Mathf.Clamp(value, 0f, 0.1f);
	}

	private static float Sanitize(float value)
	{
		if (!IsFinite(value))
		{
			return 0f;
		}
		return value;
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
