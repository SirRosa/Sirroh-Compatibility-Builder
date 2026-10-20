using System.Collections.Generic;
using System.Linq;
using HarmonyLib;
using UnityEngine;
using Zen;

namespace ZenUI.Compatibility;

[HarmonyPatch]
public class ActivateOnCopy : MonoBehaviour
{
	private static bool _isRegistering;

	private static readonly List<ActivateOnCopy> SourceTrackers = new List<ActivateOnCopy>();

	private static readonly List<ActivateOnCopy> ActiveTrackers = new List<ActivateOnCopy>();

	[SerializeField]
	private MonoBehaviour refComponent;

	private readonly bool _isSource;

	private ActivateOnCopy()
	{
		_isSource = _isRegistering;
		if (_isSource)
		{
			SourceTrackers.Add(this);
		}
		else
		{
			ActiveTrackers.Add(this);
		}
	}

	internal static void Register(MonoBehaviour component)
	{
		Logging<Plugin>.Info("Add ActivateOnCopy");
		Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(21, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Adding to component: ");
			msg.AppendFormatted(((Object)component).name);
		}
		Logging<Plugin>.Info(msg);
		_isRegistering = true;
		((Component)component).gameObject.AddComponent<ActivateOnCopy>().refComponent = component;
		_isRegistering = false;
	}

	internal static void Shutdown()
	{
		foreach (ActivateOnCopy item in ActiveTrackers.Union(SourceTrackers))
		{
			Object.Destroy((Object)(object)item);
		}
		ActiveTrackers.Clear();
		SourceTrackers.Clear();
	}

	public void Awake()
	{
		if (!_isSource)
		{
			Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(10, 1, out var shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("Awakening ");
				msg.AppendFormatted(((Object)this).name);
			}
			Logging<Plugin>.Info(msg);
			((Behaviour)refComponent).enabled = true;
			Object.Destroy((Object)(object)this);
		}
	}

	public void OnDestroy()
	{
		Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(14, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Removing from ");
			msg.AppendFormatted(((Object)this).name);
		}
		Logging<Plugin>.Info(msg);
		if (_isSource)
		{
			SourceTrackers.Remove(this);
		}
		else
		{
			ActiveTrackers.Remove(this);
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Game), "Update")]
	private static void Game_Update()
	{
		foreach (ActivateOnCopy activeTracker in ActiveTrackers)
		{
			((Component)activeTracker).gameObject.SetActive(true);
		}
	}
}
