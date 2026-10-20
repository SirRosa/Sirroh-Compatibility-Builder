using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Helpers;

internal static class Lazy
{
	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	public static Lazy<T> FromValue<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] T>(T value)
	{
		Lazy<T> lazy = new Lazy<T>(() => value, isThreadSafe: false);
		_ = lazy.Value;
		return lazy;
	}
}
