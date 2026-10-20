using System.Collections.Generic;
using System.Linq;
using BepInEx.Bootstrap;
using UnityEngine;

namespace ZenUI.Compatibility;

internal static class OtherModUI
{
	private static readonly Dictionary<string, string> OtherModNodes = new Dictionary<string, string> { ["RecipeExpansionScrollView"] = "Azumatt.ItemCompare" };

	public static void Show(Transform rightPanel, bool show)
	{
		//IL_0040: Unknown result type (might be due to invalid IL or missing references)
		//IL_0046: Expected Obj, but got Unknown
		if (!OtherModNodes.Values.Any((string pluginID) => Chainloader.PluginInfos.ContainsKey(pluginID)))
		{
			return;
		}
		foreach (Transform item in rightPanel)
		{
			Transform val = item;
			if (OtherModNodes.ContainsKey(((Object)val).name))
			{
				((Component)val).gameObject.SetActive(show);
			}
		}
	}
}
