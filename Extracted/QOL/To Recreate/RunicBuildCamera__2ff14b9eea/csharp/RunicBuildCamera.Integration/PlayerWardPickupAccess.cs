using System;
using System.Collections.Generic;
using System.Reflection;
using HarmonyLib;
using UnityEngine;

namespace RunicBuildCamera.Integration;

internal static class PlayerWardPickupAccess
{
	private static readonly FieldInfo AreasField = AccessTools.Field(typeof(PrivateArea), "m_allAreas");

	private static readonly Func<PrivateArea, bool> Enabled = AccessTools.MethodDelegate<Func<PrivateArea, bool>>(AccessTools.Method(typeof(PrivateArea), "IsEnabled", (Type[])null, (Type[])null), (object)null, true);

	private static readonly Func<PrivateArea, Vector3, float, bool> Inside = AccessTools.MethodDelegate<Func<PrivateArea, Vector3, float, bool>>(AccessTools.Method(typeof(PrivateArea), "IsInside", (Type[])null, (Type[])null), (object)null, true);

	private static readonly Func<PrivateArea, bool> LocalAccess = AccessTools.MethodDelegate<Func<PrivateArea, bool>>(AccessTools.Method(typeof(PrivateArea), "HaveLocalAccess", (Type[])null, (Type[])null), (object)null, true);

	internal static bool Allows(Vector3 target)
	{
		//IL_0067: Unknown result type (might be due to invalid IL or missing references)
		foreach (PrivateArea item in (AreasField?.GetValue(null) as List<PrivateArea>) ?? throw new InvalidOperationException("Cannot read the player ward registry."))
		{
			if (Object.op_Implicit((Object)(object)item))
			{
				Piece component = ((Component)item).GetComponent<Piece>();
				if (Object.op_Implicit((Object)(object)component) && component.IsPlacedByPlayer() && Enabled(item) && Inside(item, target, 0f) && !LocalAccess(item))
				{
					return false;
				}
			}
		}
		return true;
	}
}
