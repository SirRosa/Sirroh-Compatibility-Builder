using System.Reflection;
using AzuExtendedPlayerInventory;
using BepInEx;
using HarmonyLib;
using UnityEngine;

namespace QuickStackStore;

[BepInIncompatibility("virtuacode.valheim.trashitems")]
[BepInDependency(/*Could not decode attribute arguments.*/)]
[BepInDependency(/*Could not decode attribute arguments.*/)]
[BepInPlugin("goldenrevolver.quick_stack_store", "Quick Stack - Store - Sort - Trash - Restock", "1.4.16")]
public class QuickStackStorePlugin : BaseUnityPlugin
{
	public const string GUID = "goldenrevolver.quick_stack_store";

	public const string NAME = "Quick Stack - Store - Sort - Trash - Restock";

	public const string VERSION = "1.4.16";

	protected void Start()
	{
		//IL_0063: Unknown result type (might be due to invalid IL or missing references)
		//IL_009d: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d7: Unknown result type (might be due to invalid IL or missing references)
		if (CompatibilitySupport.HasOutdatedMUCPlugin())
		{
			Helper.LogO("This mod is not compatible with versions of Multi User Chest earlier than 0.4.0, aborting start");
			return;
		}
		if (API.IsLoaded())
		{
			CompatibilitySupport.isUsingAzuEPIWithAPI = true;
			if (CompatibilitySupport.HasAzuEPIWithQuickslotCompatibleAPI())
			{
				CompatibilitySupport.isUsingAzuEPIWithQuickslotCompatibleAPI = true;
			}
		}
		string text = "QuickStackStore.Resources";
		BorderRenderer.border = Helper.LoadSprite(text + ".border.png", new Rect(0f, 0f, 1024f, 1024f));
		TrashModule.trashSprite = Helper.LoadSprite(text + ".trash.png", new Rect(0f, 0f, 64f, 64f));
		TrashModule.bgSprite = Helper.LoadSprite(text + ".trashmask.png", new Rect(0f, 0f, 96f, 112f));
		QSSConfig.LoadConfig((BaseUnityPlugin)(object)this);
		Harmony.CreateAndPatchAll(Assembly.GetExecutingAssembly(), "goldenrevolver.quick_stack_store");
	}
}
