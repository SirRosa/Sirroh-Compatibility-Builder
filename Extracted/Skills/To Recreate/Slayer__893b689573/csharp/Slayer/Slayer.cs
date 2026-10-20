using System.IO;
using System.Reflection;
using BepInEx;
using HarmonyLib;
using Jotunn;
using Jotunn.Configs;
using Jotunn.Managers;
using Jotunn.Utils;
using UnityEngine;

namespace Slayer;

[BepInPlugin("neithar.Slayer", "Slayer", "1.0.2")]
[BepInDependency(/*Could not decode attribute arguments.*/)]
internal class Slayer : BaseUnityPlugin
{
	public const string PluginGUID = "neithar.Slayer";

	public const string PluginName = "Slayer";

	public const string PluginVersion = "1.0.2";

	public static SkillType SlayerType;

	public const bool DebugLogging = false;

	private void Awake()
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		SlayerConfig.Initialize((BaseUnityPlugin)(object)this);
		CreateSkill();
		new Harmony("neithar.Slayer").PatchAll();
		SlayerDamage.Initialize();
		SlayerPushback.Initialize();
		SlayerExperience.Initialize();
		DebugLog("Slayer initialized.");
	}

	public static void DebugLog(string message)
	{
		bool flag = false;
	}

	private void CreateSkill()
	{
		//IL_0042: Unknown result type (might be due to invalid IL or missing references)
		//IL_0051: Unknown result type (might be due to invalid IL or missing references)
		//IL_005c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0061: Unknown result type (might be due to invalid IL or missing references)
		//IL_006d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0079: Unknown result type (might be due to invalid IL or missing references)
		//IL_0085: Unknown result type (might be due to invalid IL or missing references)
		//IL_008d: Unknown result type (might be due to invalid IL or missing references)
		//IL_009a: Expected Obj, but got Unknown
		//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a5: Unknown result type (might be due to invalid IL or missing references)
		Texture2D val = LoadEmbeddedTexture("Slayer.Assets.krom_no_bg.png");
		if ((Object)(object)val == (Object)null)
		{
			Logger.LogError((object)"Texture load failed!");
			return;
		}
		Sprite icon = Sprite.Create(val, new Rect(0f, 0f, (float)((Texture)val).width, (float)((Texture)val).height), new Vector2(0.5f, 0.5f));
		SkillConfig val2 = new SkillConfig
		{
			Identifier = "neithar.Slayer",
			Name = "Slayer",
			Description = "Deal more damage with two-handed and dual weapons",
			Icon = icon,
			IncreaseStep = 1f
		};
		SlayerType = SkillManager.Instance.AddSkill(val2);
	}

	private Texture2D LoadEmbeddedTexture(string resourceName)
	{
		//IL_004c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0052: Expected Obj, but got Unknown
		Assembly executingAssembly = Assembly.GetExecutingAssembly();
		using Stream stream = executingAssembly.GetManifestResourceStream(resourceName);
		if (stream == null)
		{
			Logger.LogError((object)("Resource not found: " + resourceName));
			return null;
		}
		byte[] array = new byte[stream.Length];
		stream.Read(array, 0, array.Length);
		Texture2D val = new Texture2D(2, 2);
		if (!AssetUtils.LoadImage(val, array))
		{
			Logger.LogError((object)"Failed to load image data into texture");
			return null;
		}
		return val;
	}
}
