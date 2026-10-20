using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Helpers;

internal static class ThrowHelper
{
	[MethodImpl(MethodImplOptions.NoInlining)]
	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	public static void ThrowArgumentOutOfRangeException(string paramName, string message)
	{
		throw new ArgumentOutOfRangeException(paramName, message);
	}
}
