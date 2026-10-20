using System.Collections.Generic;
using BepInEx.Bootstrap;
using UnityEngine;

namespace Zen.Interop;

public static class HoverItem
{
	private const string ModID = "ZenDragon.ZenHoverItem";

	public static string Message_UpdateIcons => "UpdateIcons";

	public static bool IsLoaded => Chainloader.PluginInfos.ContainsKey("ZenDragon.ZenHoverItem");

	private static void SendUpdateIcons(object arg)
	{
		Message.Send("ZenDragon.ZenHoverItem", Message_UpdateIcons, arg);
	}

	public static void UpdateIcons(Sprite sprite, string label)
	{
		SendUpdateIcons((sprite, label));
	}

	public static void UpdateIcons(string prefabName, string label)
	{
		SendUpdateIcons((prefabName, label));
	}

	public static void UpdateIcons(IEnumerable<Sprite> sprites)
	{
		SendUpdateIcons(sprites);
	}

	public static void UpdateIcons(IEnumerable<string> sprites)
	{
		SendUpdateIcons(sprites);
	}

	public static void UpdateIcons(IEnumerable<(Sprite Icon, string Label)> sprites)
	{
		SendUpdateIcons(sprites);
	}

	public static void UpdateIcons(IEnumerable<(string PrefabName, string Label)> sprites)
	{
		SendUpdateIcons(sprites);
	}

	public static void UpdateIcons(params (Sprite Icon, string Label)[] elements)
	{
		SendUpdateIcons(elements);
	}

	public static void UpdateIcons(params (string PrefabName, string Label)[] elements)
	{
		SendUpdateIcons(elements);
	}

	public static void UpdateIcons(params Sprite[] sprites)
	{
		SendUpdateIcons(sprites);
	}

	public static void UpdateIcons(params string[] prefabNames)
	{
		SendUpdateIcons(prefabNames);
	}
}
