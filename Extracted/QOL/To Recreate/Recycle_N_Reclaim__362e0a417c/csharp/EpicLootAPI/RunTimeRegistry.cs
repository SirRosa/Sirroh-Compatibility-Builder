using System.Collections.Generic;

namespace EpicLootAPI;

internal static class RunTimeRegistry
{
	private static readonly Dictionary<object, string> registry = new Dictionary<object, string>();

	public static void Register(object key, string value)
	{
		registry[key] = value;
	}

	public static bool TryGetValue(object key, out string value)
	{
		return registry.TryGetValue(key, out value);
	}
}
