using System.Runtime.CompilerServices;
using BepInEx.Configuration;
using UnityEngine;

namespace AzuAutoStore;

public static class ConfigExtensions
{
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	internal static void TextAreaDrawer(ConfigEntryBase entry)
	{
		GUILayout.ExpandHeight(true);
		GUILayout.ExpandWidth(true);
		entry.BoxedValue = GUILayout.TextArea((string)entry.BoxedValue, new GUILayoutOption[2]
		{
			GUILayout.ExpandWidth(true),
			GUILayout.ExpandHeight(true)
		});
	}
}
