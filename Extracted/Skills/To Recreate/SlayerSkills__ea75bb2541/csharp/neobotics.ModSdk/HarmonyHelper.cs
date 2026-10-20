using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Reflection;
using BepInEx.Bootstrap;
using HarmonyLib;

namespace neobotics.ModSdk;

internal class HarmonyHelper
{
	public enum PatchType
	{
		Prefix,
		Postfix,
		Transpiler,
		Finalizer
	}

	private static Dictionary<string, string> detectionSet = new Dictionary<string, string>();

	private static Dictionary<string, string> unpatchMods = new Dictionary<string, string>();

	public static IReadOnlyDictionary<string, string> DetectionSet => detectionSet;

	public static void GetDetectionSet(Dictionary<string, string> harmonyIds)
	{
		Logging logger = Logging.GetLogger();
		foreach (KeyValuePair<string, string> harmonyId in harmonyIds)
		{
			if (Harmony.HasAnyPatches(harmonyId.Key))
			{
				logger.Debug("Detected " + harmonyId.Value + " from Harmony");
				if (!detectionSet.ContainsKey(harmonyId.Key))
				{
					detectionSet.Add(harmonyId.Key, harmonyId.Value);
				}
			}
			else if (Chainloader.PluginInfos.ContainsKey(harmonyId.Key))
			{
				logger.Debug("Detected " + harmonyId.Value + " from BepInEx");
				if (!detectionSet.ContainsKey(harmonyId.Key))
				{
					detectionSet.Add(harmonyId.Key, harmonyId.Value);
				}
			}
		}
	}

	public static void AddToUnpatch(string key)
	{
		if (detectionSet.ContainsKey(key))
		{
			unpatchMods.Add(key, detectionSet[key]);
		}
	}

	public static void UnpatchMods(Harmony harmony)
	{
		Logging logger = Logging.GetLogger();
		foreach (KeyValuePair<string, string> unpatchMod in unpatchMods)
		{
			logger.Warning("Not compatible with " + unpatchMod.Value);
			Harmony.UnpatchID(unpatchMod.Key);
			detectionSet.Remove(unpatchMod.Key);
			logger.Warning("Disabled " + unpatchMod.Value);
		}
	}

	public static bool IsModDetected(string key)
	{
		return detectionSet.ContainsKey(key);
	}

	public static bool IsModNameDetected(string value)
	{
		return detectionSet.ContainsValue(value);
	}

	public static bool TryGetDetectedModName(string key, out string mod)
	{
		return detectionSet.TryGetValue(key, out mod);
	}

	public static bool TryGetDetectedModKey(string value, out string key)
	{
		key = null;
		foreach (string key2 in detectionSet.Keys)
		{
			if (detectionSet[key2] == value)
			{
				key = key2;
				return true;
			}
		}
		return false;
	}

	public static string AddAnonymousPatch(string baseMethodName, PatchType patchType, string modName, string patchMethodName = null)
	{
		string text = null;
		int num = 0;
		Logging logger = Logging.GetLogger();
		foreach (MethodBase item in Harmony.GetAllPatchedMethods().ToList())
		{
			MethodBaseExtensions.HasMethodBody(item);
			Patches patchInfo = Harmony.GetPatchInfo(item);
			ReadOnlyCollection<Patch> readOnlyCollection = patchInfo.Prefixes;
			switch (patchType)
			{
			case PatchType.Postfix:
				readOnlyCollection = patchInfo.Postfixes;
				break;
			case PatchType.Prefix:
				readOnlyCollection = patchInfo.Prefixes;
				break;
			case PatchType.Transpiler:
				readOnlyCollection = patchInfo.Transpilers;
				break;
			case PatchType.Finalizer:
				readOnlyCollection = patchInfo.Finalizers;
				break;
			}
			foreach (Patch item2 in readOnlyCollection)
			{
				if (!item2.owner.StartsWith("harmony-auto") || !(item.Name == baseMethodName))
				{
					continue;
				}
				if (patchMethodName != null)
				{
					if (item2.PatchMethod.Name == patchMethodName)
					{
						num++;
						text = item2.owner;
					}
				}
				else
				{
					num++;
					text = item2.owner;
				}
			}
			if (num == 1)
			{
				detectionSet.Add(text, modName);
				logger.Info($"Added unique anonymous {baseMethodName} {patchType}: {text} as {modName}");
			}
			else if (num > 1)
			{
				text = null;
				logger.Warning($"Found multiple anonymous {baseMethodName} {patchType} entries. Can't identify correct patch to remove or modify.");
			}
		}
		if (num == 0)
		{
			logger.Info("No patch found for " + modName);
		}
		return text;
	}
}
