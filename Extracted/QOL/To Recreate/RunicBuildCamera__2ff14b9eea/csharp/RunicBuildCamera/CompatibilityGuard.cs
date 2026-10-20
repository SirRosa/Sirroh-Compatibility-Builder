using System;
using System.Collections.Generic;
using System.Reflection;
using BepInEx;
using BepInEx.Bootstrap;
using Runic.Localization;

namespace RunicBuildCamera;

internal static class CompatibilityGuard
{
	internal const string BuildCameraCheGuid = "Azumatt.BuildCameraCHE";

	internal static bool TryFindHardConflict(out string reason)
	{
		reason = null;
		foreach (KeyValuePair<string, PluginInfo> pluginInfo in Chainloader.PluginInfos)
		{
			PluginInfo value = pluginInfo.Value;
			object a;
			if (value == null)
			{
				a = null;
			}
			else
			{
				BepInPlugin metadata = value.Metadata;
				a = ((metadata != null) ? metadata.GUID : null);
			}
			PluginInfo value2 = pluginInfo.Value;
			object obj;
			if (value2 == null)
			{
				obj = null;
			}
			else
			{
				BepInPlugin metadata2 = value2.Metadata;
				obj = ((metadata2 != null) ? metadata2.Name : null);
			}
			string text = (string)obj;
			if (string.Equals((string?)a, "Azumatt.BuildCameraCHE", StringComparison.OrdinalIgnoreCase) || string.Equals(text, "BuildCameraCHE", StringComparison.OrdinalIgnoreCase) || string.Equals(text, "Build Camera Custom Hammers Edition", StringComparison.OrdinalIgnoreCase))
			{
				reason = RunicText.Format("text_acac6a5e4a61", text ?? "Azumatt.BuildCameraCHE") + RunicText.Get("text_ba927d542b6f");
				return true;
			}
		}
		bool flag = false;
		Assembly[] assemblies = AppDomain.CurrentDomain.GetAssemblies();
		foreach (Assembly assembly in assemblies)
		{
			try
			{
				if (assembly.GetType("Valheim_Build_Camera.Valheim_Build_CameraPlugin", throwOnError: false, ignoreCase: false) == null)
				{
					continue;
				}
				flag = true;
				break;
			}
			catch (Exception)
			{
			}
		}
		if (flag)
		{
			reason = RunicText.Get("text_a34f6de98a9a") + RunicText.Get("text_f57f78aa3dfa");
			return true;
		}
		return false;
	}
}
