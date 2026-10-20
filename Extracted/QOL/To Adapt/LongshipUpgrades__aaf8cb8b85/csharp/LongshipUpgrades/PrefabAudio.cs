using System;
using System.Collections.Generic;
using HarmonyLib;
using UnityEngine;
using UnityEngine.Audio;

namespace LongshipUpgrades;

internal static class PrefabAudio
{
	[HarmonyPatch(typeof(AudioMan), "Awake")]
	private static class AudioMan_Awake_RouteAudio
	{
		private static void Postfix(AudioMan __instance)
		{
			Apply(__instance);
		}
	}

	private static readonly HashSet<AudioSource> sources = new HashSet<AudioSource>();

	private static GameObject templates;

	private static AudioMixerGroup sfxGroup;

	private static AudioMixer warnedMixer;

	private static bool IsHeadless
	{
		get
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Invalid comparison between Unknown and I4
			return (int)SystemInfo.graphicsDeviceType == 4;
		}
	}

	internal static GameObject Clone(GameObject prefab)
	{
		//IL_002f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0039: Expected Obj, but got Unknown
		if ((Object)(object)prefab == (Object)null || IsHeadless)
		{
			return prefab;
		}
		if ((Object)(object)templates == (Object)null)
		{
			templates = new GameObject("shudnal.LongshipUpgrades.AudioPrefabs");
			templates.SetActive(false);
			Object.DontDestroyOnLoad((Object)(object)templates);
		}
		GameObject val = Object.Instantiate<GameObject>(prefab, templates.transform, false);
		((Object)val).name = ((Object)prefab).name;
		Register(val);
		return val;
	}

	internal static void Register(GameObject root)
	{
		if ((Object)(object)root == (Object)null || IsHeadless)
		{
			return;
		}
		AudioSource[] componentsInChildren = root.GetComponentsInChildren<AudioSource>(true);
		foreach (AudioSource val in componentsInChildren)
		{
			if ((Object)(object)val != (Object)null)
			{
				sources.Add(val);
			}
		}
		Apply(AudioMan.instance);
	}

	internal static void Apply(AudioMan audioMan)
	{
		if ((Object)(object)audioMan == (Object)null || (Object)(object)audioMan != (Object)(object)AudioMan.instance || (Object)(object)audioMan.m_masterMixer == (Object)null || IsHeadless)
		{
			return;
		}
		sources.RemoveWhere((AudioSource source) => (Object)(object)source == (Object)null);
		if (sources.Count == 0)
		{
			return;
		}
		AudioMixer masterMixer = audioMan.m_masterMixer;
		if ((Object)(object)sfxGroup == (Object)null || (Object)(object)sfxGroup.audioMixer != (Object)(object)masterMixer)
		{
			sfxGroup = null;
			AudioMixerGroup[] array = masterMixer.FindMatchingGroups(string.Empty);
			foreach (AudioMixerGroup val in array)
			{
				if ((Object)(object)val != (Object)null && string.Equals(((Object)val).name, "Sfx", StringComparison.OrdinalIgnoreCase))
				{
					sfxGroup = val;
					break;
				}
			}
		}
		if ((Object)(object)sfxGroup == (Object)null)
		{
			if ((Object)(object)warnedMixer != (Object)(object)masterMixer)
			{
				warnedMixer = masterMixer;
				Debug.LogWarning((object)"shudnal.LongshipUpgrades: the game's Sfx mixer group was not found; audio routing was not changed.");
			}
			return;
		}
		warnedMixer = null;
		int num2 = 0;
		foreach (AudioSource source in sources)
		{
			if (!((Object)(object)source.outputAudioMixerGroup == (Object)(object)sfxGroup))
			{
				source.outputAudioMixerGroup = sfxGroup;
				num2++;
			}
		}
		if (num2 > 0)
		{
			LongshipUpgrades.LogInfo($"Routed {num2} audio source(s) to the game's Sfx mixer.");
		}
	}

	internal static void Clear()
	{
		sources.Clear();
		sfxGroup = null;
		warnedMixer = null;
		if ((Object)(object)templates != (Object)null)
		{
			Object.Destroy((Object)(object)templates);
		}
		templates = null;
	}
}
