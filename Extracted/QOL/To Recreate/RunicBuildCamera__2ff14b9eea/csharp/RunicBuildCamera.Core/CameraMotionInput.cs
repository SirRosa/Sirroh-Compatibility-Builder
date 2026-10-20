using UnityEngine;

namespace RunicBuildCamera.Core;

internal readonly struct CameraMotionInput
{
	internal float Right { get; }

	internal float Up { get; }

	internal float Forward { get; }

	internal float YawDelta { get; }

	internal float PitchDelta { get; }

	internal bool Fast { get; }

	internal CameraMotionInput(float right, float up, float forward, float yawDelta, float pitchDelta, bool fast)
	{
		Right = Mathf.Clamp(right, -1f, 1f);
		Up = Mathf.Clamp(up, -1f, 1f);
		Forward = Mathf.Clamp(forward, -1f, 1f);
		YawDelta = yawDelta;
		PitchDelta = pitchDelta;
		Fast = fast;
	}
}
