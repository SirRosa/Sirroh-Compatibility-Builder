using System;
using System.Linq;
using System.Reflection;
using BepInEx;
using BepInEx.Configuration;
using HarmonyLib;
using UnityEngine;

namespace FoodFreezer;

[BepInPlugin("com.foodfreezer.foodfreezer", "FoodFreezer", "1.0.0")]
public class Plugin : BaseUnityPlugin
{
	public static ConfigEntry<bool> Enabled;

	public static ConfigEntry<float> HearthCheckRadius;

	public static ConfigEntry<bool> RequireLitFire;

	public static ConfigEntry<bool> FallbackToRestingBuff;

	private static readonly int HearthLayerMask = LayerMask.GetMask(new string[2] { "piece", "piece_nonsolid" });

	private Harmony harmony;

	private void Awake()
	{
		//IL_008a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0094: Expected Obj, but got Unknown
		//IL_00f0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fe: Expected Obj, but got Unknown
		Enabled = ((BaseUnityPlugin)this).Config.Bind<bool>("General", "Enabled", true, "Master toggle for FoodFreezer.");
		HearthCheckRadius = ((BaseUnityPlugin)this).Config.Bind<float>("General", "HearthCheckRadius", 30f, "Radius (meters) around the player to search for a hearth.");
		RequireLitFire = ((BaseUnityPlugin)this).Config.Bind<bool>("General", "RequireLitFire", true, "Only freeze food while the hearth is burning.");
		FallbackToRestingBuff = ((BaseUnityPlugin)this).Config.Bind<bool>("General", "FallbackToRestingBuff", false, "Also freeze food while the Rested/Resting status effect is active.");
		harmony = new Harmony("com.foodfreezer.foodfreezer");
		MethodInfo[] array = (from m in typeof(Player).GetMethods(BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic)
			where m.Name == "UpdateFood" && m.DeclaringType == typeof(Player) && m.ReturnType == typeof(void)
			select m).ToArray();
		MethodInfo[] array2 = array;
		foreach (MethodInfo methodInfo in array2)
		{
			harmony.Patch((MethodBase)methodInfo, new HarmonyMethod(typeof(Plugin), "UpdateFoodPrefix", (Type[])null), (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null);
			((BaseUnityPlugin)this).Logger.LogInfo((object)("Patched " + GeneralExtensions.FullDescription((MethodBase)methodInfo)));
		}
		((BaseUnityPlugin)this).Logger.LogInfo((object)string.Format("{0} {1} loaded ({2} UpdateFood overload(s) patched).", "FoodFreezer", "1.0.0", array.Length));
	}

	private static bool UpdateFoodPrefix(Player __instance)
	{
		if ((Object)(object)__instance == (Object)null || (Object)(object)__instance != (Object)(object)Player.m_localPlayer)
		{
			return true;
		}
		if (Enabled == null || !Enabled.Value)
		{
			return true;
		}
		return !ShouldFreeze(__instance);
	}

	private static bool ShouldFreeze(Player player)
	{
		if (FallbackToRestingBuff.Value)
		{
			SEMan sEMan = ((Character)player).GetSEMan();
			if (sEMan.HaveStatusEffect(SEMan.s_statusEffectRested) || sEMan.HaveStatusEffect(SEMan.s_statusEffectResting))
			{
				return true;
			}
		}
		return IsNearBurningFire(player);
	}

	private static bool IsNearBurningFire(Player player)
	{
		//IL_0019: Unknown result type (might be due to invalid IL or missing references)
		if (HearthCheckRadius.Value <= 0f)
		{
			return false;
		}
		Collider[] array = Physics.OverlapSphere(((Component)player).transform.position, HearthCheckRadius.Value, HearthLayerMask);
		for (int i = 0; i < array.Length; i++)
		{
			Fireplace componentInParent = ((Component)array[i]).GetComponentInParent<Fireplace>();
			if (!((Object)(object)componentInParent == (Object)null) && (!RequireLitFire.Value || componentInParent.IsBurning()))
			{
				return true;
			}
		}
		return false;
	}
}
