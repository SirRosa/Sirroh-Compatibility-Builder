using System;

namespace YamlDotNet.Helpers;

internal static class Lazy
{
	public static Lazy<T> FromValue<T>(T value)
	{
		Lazy<T> lazy = new Lazy<T>(() => value, isThreadSafe: false);
		_ = lazy.Value;
		return lazy;
	}
}
