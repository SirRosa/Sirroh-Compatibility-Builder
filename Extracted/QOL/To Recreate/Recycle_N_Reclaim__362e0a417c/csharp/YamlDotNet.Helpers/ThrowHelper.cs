using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Helpers;

internal static class ThrowHelper
{
	[MethodImpl(MethodImplOptions.NoInlining)]
	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	public static void ThrowArgumentOutOfRangeException(string paramName, string message)
	{
		throw new ArgumentOutOfRangeException(paramName, message);
	}
}
