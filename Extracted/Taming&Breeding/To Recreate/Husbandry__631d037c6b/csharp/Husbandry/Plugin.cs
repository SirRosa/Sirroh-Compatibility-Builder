using BepInEx;
using HarmonyLib;
using Husbandry.Commands;
using Husbandry.Config;
using Husbandry.Herd;
using Husbandry.Offline;
using Husbandry.Util;
using UnityEngine;

namespace Husbandry;

[BepInPlugin("dafini.husbandry", "Husbandry", "1.1.0")]
[BepInProcess("valheim.exe")]
[BepInProcess("valheim_server.exe")]
internal sealed class Plugin : BaseUnityPlugin
{
	private Harmony _harmony;

	private bool _started;

	private void Awake()
	{
		//IL_0033: Unknown result type (might be due to invalid IL or missing references)
		//IL_003d: Expected Obj, but got Unknown
		Log.Source = ((BaseUnityPlugin)this).Logger;
		HusbandryConfig.Bind(((BaseUnityPlugin)this).Config);
		if (!HusbandryConfig.Enabled.Value)
		{
			Log.Info("Husbandry is switched off in config and is doing nothing.");
			return;
		}
		_harmony = new Harmony("dafini.husbandry");
		_harmony.PatchAll();
		HusbandryCommand.Register();
	}

	private void Update()
	{
		if (!_started)
		{
			ZNet instance = ZNet.instance;
			if ((Object)(object)instance == (Object)null)
			{
				return;
			}
			_started = true;
			if (Steward.ShouldRun(instance.IsServer(), HusbandryConfig.OfflineUpkeep.Value))
			{
				Steward.Begin();
			}
			else
			{
				Log.Info("Husbandry: this machine does not hold the world, so the offline upkeep is not running here. The throttle still is.");
			}
		}
		Steward.Tick();
		Shoving.Tick(Time.time);
	}

	private void OnDestroy()
	{
		Harmony harmony = _harmony;
		if (harmony != null)
		{
			harmony.UnpatchSelf();
		}
	}
}
