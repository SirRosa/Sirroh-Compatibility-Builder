using System;
using System.Runtime.CompilerServices;
using UnityEngine;

namespace AzuAutoStore.APIs.Compatibility.WardIsLove;

public class WardMonoscript : WILCompat
{
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	public static Type ClassType()
	{
		return Type.GetType("WardIsLove.Util.WardMonoscript, WardIsLove");
	}

	public static bool CheckInWardMonoscript(Vector3 point, bool flash = false)
	{
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		return WILCompat.InvokeMethod<bool>(ClassType(), null, "CheckInWardMonoscript", new object[2] { point, flash });
	}

	public static bool CheckAccess(Vector3 point, float radius = 0f, bool flash = true, bool wardCheck = false)
	{
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		return WILCompat.InvokeMethod<bool>(ClassType(), null, "CheckAccess", new object[4] { point, radius, flash, wardCheck });
	}

	public static bool InsideWard(Vector3 pos)
	{
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		if (WardIsLovePlugin.WardEnabled().Value)
		{
			return CheckInWardMonoscript(pos);
		}
		return false;
	}
}
