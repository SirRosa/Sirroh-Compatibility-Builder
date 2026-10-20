using System.Runtime.CompilerServices;
using UnityEngine;

namespace RunicBuildCamera.Core;

internal readonly struct CameraPose
{
	internal Vector3 Position
	{
		[CompilerGenerated]
		get
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			return field;
		}
	}

	internal float Yaw { get; }

	internal float Pitch { get; }

	internal Quaternion Rotation
	{
		get
		{
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			return Quaternion.Euler(Pitch, Yaw, 0f);
		}
	}

	internal CameraPose(Vector3 position, float yaw, float pitch)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		Position = position;
		Yaw = yaw;
		Pitch = pitch;
	}
}
