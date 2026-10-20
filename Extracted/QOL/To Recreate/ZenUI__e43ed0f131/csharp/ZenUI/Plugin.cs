using BepInEx;
using Jotunn.Utils;
using Zen.Lib;
using ZenUI.Section;

namespace ZenUI;

[BepInPlugin("ZenDragon.ZenUI", "ZenUI", "1.9.3")]
[BepInDependency(/*Could not decode attribute arguments.*/)]
[BepInDependency(/*Could not decode attribute arguments.*/)]
[SynchronizationMode(/*Could not decode attribute arguments.*/)]
[NetworkCompatibility(/*Could not decode attribute arguments.*/)]
internal class Plugin : ZenMod<Plugin>
{
	public const string PluginName = "ZenUI";

	public const string PluginVersion = "1.9.3";

	public const string PluginGUID = "ZenDragon.ZenUI";

	protected override void Setup()
	{
		ItemIcon.Setup();
	}

	protected override void TitleScene(bool isFirstBoot)
	{
	}

	protected override void WorldStart()
	{
		CameraRules.RemoveDirt();
		CameraRules.SetLodBias(Configs.CameraLodBias.Value);
		TooltipFormat.ApplyTooltipFormatDefaults();
		ShipHud.Init();
		SystemClock.Init();
		AmmoCountIcon.Init();
	}

	protected override void HotRestore()
	{
		ApplyThinScrollBars.Game_Start();
		CraftingPanel.Game_Start();
		CraftingPanelSearch.Game_Start();
		FoodPanel.Game_Start();
	}

	protected override void Shutdown()
	{
		CraftingPanel.Shutdown();
		CraftingPanelSearch.Shutdown();
		SystemClock.Shutdown();
	}
}
