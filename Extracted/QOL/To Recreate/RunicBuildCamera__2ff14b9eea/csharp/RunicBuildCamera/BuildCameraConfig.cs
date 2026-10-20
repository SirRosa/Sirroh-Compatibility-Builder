using System;
using System.Collections.Generic;
using BepInEx.Configuration;
using Runic.Localization;
using UnityEngine;

namespace RunicBuildCamera;

internal static class BuildCameraConfig
{
	internal const float DefaultCameraRange = 60f;

	internal const float CameraRangeHardMaximum = 100f;

	internal const float DefaultRemoteActionDistance = 100f;

	internal const float RemoteActionDistanceHardMaximum = 100f;

	private const float MinimumDistance = 1f;

	private static readonly List<Action> UnsubscribeActions = new List<Action>();

	internal static ConfigEntry<bool> Enabled { get; private set; }

	internal static ConfigEntry<KeyboardShortcut> ToggleShortcut { get; private set; }

	internal static ConfigEntry<float> CameraRange { get; private set; }

	internal static ConfigEntry<float> MoveSpeed { get; private set; }

	internal static ConfigEntry<float> FastMoveMultiplier { get; private set; }

	internal static ConfigEntry<bool> WorldRelativeMovement { get; private set; }

	internal static ConfigEntry<float> RemoteActionDistance { get; private set; }

	internal static ConfigEntry<bool> PickupEnabled { get; private set; }

	internal static ConfigEntry<float> PickupRange { get; private set; }

	internal static ConfigEntry<float> PickupIntervalSeconds { get; private set; }

	internal static ConfigEntry<bool> DemisterFollowCamera { get; private set; }

	internal static ConfigEntry<float> DemisterRangeMultiplier { get; private set; }

	internal static ConfigEntry<bool> InvertMouseHorizontal { get; private set; }

	internal static ConfigEntry<bool> InvertMouseVertical { get; private set; }

	internal static ConfigEntry<bool> InvertControllerHorizontal { get; private set; }

	internal static ConfigEntry<bool> InvertControllerVertical { get; private set; }

	internal static ConfigEntry<bool> VerboseLogging { get; private set; }

	internal static event Action Changed;

	internal static void Bind(ConfigFile config)
	{
		//IL_0045: Unknown result type (might be due to invalid IL or missing references)
		if (config == null)
		{
			throw new ArgumentNullException("config");
		}
		UnhookChanges();
		Enabled = BindEntry(config, "General", "Enabled", defaultValue: true, RunicText.Get("text_0a6ae8b067ca"));
		ToggleShortcut = BindEntry<KeyboardShortcut>(config, "Controls", "ToggleShortcut", new KeyboardShortcut((KeyCode)98, Array.Empty<KeyCode>()), RunicText.Get("text_79be68bc27a1"));
		CameraRange = BindRange(config, "Camera", "CameraRange", 60f, 1f, 100f, RunicText.Get("text_1c9f371d5f2c"));
		MoveSpeed = BindRange(config, "Camera", "MoveSpeed", 10f, 0.5f, 50f, RunicText.Get("text_09f482d754a0"));
		FastMoveMultiplier = BindRange(config, "Camera", "FastMoveMultiplier", 3f, 1f, 10f, RunicText.Get("text_9abaa67ab9eb"));
		WorldRelativeMovement = BindEntry(config, "Camera", "WorldRelativeMovement", defaultValue: false, RunicText.Get("text_fdca2a2cae5e"));
		RemoteActionDistance = BindRange(config, "Remote Actions", "RemoteActionDistance", 100f, 1f, 100f, RunicText.Get("text_5cdd426faf6d") + RunicText.Get("text_d77fc99e1978") + RunicText.Get("text_015eb096e1ec"));
		PickupEnabled = BindEntry(config, "Pickup", "PickupEnabled", defaultValue: true, RunicText.Get("text_7e340344c138"));
		PickupRange = BindRange(config, "Pickup", "PickupRange", 10f, 1f, 50f, RunicText.Get("text_1503c4d0efb2"));
		PickupIntervalSeconds = BindRange(config, "Pickup", "PickupIntervalSeconds", 0.25f, 0.05f, 2f, RunicText.Get("text_6ac387048534"));
		DemisterFollowCamera = BindEntry(config, "Mist", "DemisterFollowCamera", defaultValue: true, RunicText.Get("text_2fbfdd579ce5"));
		DemisterRangeMultiplier = BindRange(config, "Mist", "DemisterRangeMultiplier", 2f, 0.25f, 5f, RunicText.Get("text_32c6dc7938c7"));
		InvertMouseHorizontal = BindEntry(config, "Controls", "InvertMouseHorizontal", defaultValue: false, RunicText.Get("text_c3b035822ef5"));
		InvertMouseVertical = BindEntry(config, "Controls", "InvertMouseVertical", defaultValue: false, RunicText.Get("text_41f4b367f85b"));
		InvertControllerHorizontal = BindEntry(config, "Controls", "InvertControllerHorizontal", defaultValue: false, RunicText.Get("text_f3622ea95b67"));
		InvertControllerVertical = BindEntry(config, "Controls", "InvertControllerVertical", defaultValue: false, RunicText.Get("text_908b56428063"));
		VerboseLogging = BindEntry(config, "Diagnostics", "VerboseLogging", defaultValue: false, RunicText.Get("text_2b4b917a0f25"));
	}

	private static ConfigEntry<T> BindEntry<T>(ConfigFile config, string section, string key, T defaultValue, string description)
	{
		ConfigEntry<T> val = config.Bind<T>(section, key, defaultValue, description);
		HookChange<T>(val);
		return val;
	}

	private static ConfigEntry<float> BindRange(ConfigFile config, string section, string key, float defaultValue, float minimum, float maximum, string description)
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Expected Obj, but got Unknown
		ConfigEntry<float> val = config.Bind<float>(section, key, defaultValue, new ConfigDescription(description, (AcceptableValueBase)(object)new AcceptableValueRange<float>(minimum, maximum), Array.Empty<object>()));
		HookChange<float>(val);
		return val;
	}

	private static void HookChange<T>(ConfigEntry<T> entry)
	{
		entry.SettingChanged += OnSettingChanged;
		UnsubscribeActions.Add(() =>
		{
			entry.SettingChanged -= OnSettingChanged;
		});
	}

	private static void UnhookChanges()
	{
		foreach (Action unsubscribeAction in UnsubscribeActions)
		{
			unsubscribeAction();
		}
		UnsubscribeActions.Clear();
	}

	private static void OnSettingChanged(object sender, EventArgs args)
	{
		Changed?.Invoke();
	}
}
