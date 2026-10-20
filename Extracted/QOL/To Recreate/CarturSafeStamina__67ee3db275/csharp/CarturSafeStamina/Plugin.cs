using System;
using System.Collections.Generic;
using BepInEx;
using BepInEx.Configuration;
using HarmonyLib;
using UnityEngine;

namespace CarturSafeStamina;

[BepInPlugin("com.jekkle.valheim.cartursafestamina", "Cartur's Safe Stamina", "1.0.13")]
public class Plugin : BaseUnityPlugin
{
	public const string PluginGuid = "com.jekkle.valheim.cartursafestamina";

	public const string PluginName = "Cartur's Safe Stamina";

	public const string PluginVersion = "1.0.13";

	public static ConfigEntry<float> SafeRadius;

	public static ConfigEntry<bool> AffectSprint;

	public static ConfigEntry<bool> AffectJump;

	public static ConfigEntry<bool> AffectBuild;

	public static ConfigEntry<bool> AffectSwim;

	public static ConfigEntry<bool> AffectAttacks;

	public static ConfigEntry<bool> AffectSneak;

	public static ConfigEntry<bool> AffectEncumbered;

	public static ConfigEntry<string> IgnoredCreatures;

	private static float _lastCheckTime = -999f;

	private static bool _lastResult = true;

	private const float CheckInterval = 0.25f;

	private static string _ignoredRaw;

	private static readonly HashSet<string> Ignored = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

	private void Awake()
	{
		SafeRadius = ((BaseUnityPlugin)this).Config.Bind<float>("General", "SafeRadius", 25f, "No stamina cost for sprint/jump/build/swim/attacks/sneak when no enemy is within this many meters.");
		AffectSprint = ((BaseUnityPlugin)this).Config.Bind<bool>("General", "AffectSprint", true, "Free sprint stamina when safe.");
		AffectJump = ((BaseUnityPlugin)this).Config.Bind<bool>("General", "AffectJump", true, "Free jump stamina when safe.");
		AffectBuild = ((BaseUnityPlugin)this).Config.Bind<bool>("General", "AffectBuild", true, "Free build/repair/remove stamina when safe. Covers every build tool, so planting with the cultivator and levelling with the hoe are free too.");
		AffectSwim = ((BaseUnityPlugin)this).Config.Bind<bool>("General", "AffectSwim", true, "Free swim stamina when safe. Note this also removes the drowning risk while safe, since drowning only starts once stamina is empty.");
		AffectAttacks = ((BaseUnityPlugin)this).Config.Bind<bool>("General", "AffectAttacks", true, "Free attack stamina when safe - chopping wood, mining, and weapon swings all pay through the same cost.");
		AffectSneak = ((BaseUnityPlugin)this).Config.Bind<bool>("General", "AffectSneak", true, "Free sneak/crouch stamina when safe.");
		AffectEncumbered = ((BaseUnityPlugin)this).Config.Bind<bool>("General", "AffectEncumbered", false, "Over the weight limit and safe: walking costs no stamina and stamina refills. Off by default, so being over-loaded costs you as in vanilla.");
		IgnoredCreatures = ((BaseUnityPlugin)this).Config.Bind<string>("General", "IgnoredCreatures", "", "Comma-separated creatures that never count as an enemy nearby, by prefab name or by the name shown in game (e.g. T.W.I.G). For modded creatures that are hostile by faction but never fight.");
		Harmony.CreateAndPatchAll(typeof(Plugin).Assembly, "com.jekkle.valheim.cartursafestamina");
		((BaseUnityPlugin)this).Logger.LogInfo((object)"Cartur's Safe Stamina 1.0.13 loaded.");
	}

	public static bool IsLocalAndSafe(Character c)
	{
		Player val = (Player)(object)((c is Player) ? c : null);
		if (val != null && (Object)(object)val == (Object)(object)Player.m_localPlayer)
		{
			return IsSafe(val);
		}
		return false;
	}

	public static bool IsSafe(Player player)
	{
		//IL_0046: Unknown result type (might be due to invalid IL or missing references)
		//IL_004b: Unknown result type (might be due to invalid IL or missing references)
		//IL_008a: Unknown result type (might be due to invalid IL or missing references)
		//IL_008f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0090: Unknown result type (might be due to invalid IL or missing references)
		//IL_0095: Unknown result type (might be due to invalid IL or missing references)
		if ((Object)(object)player == (Object)null)
		{
			return true;
		}
		if (Time.time - _lastCheckTime < 0.25f)
		{
			return _lastResult;
		}
		_lastCheckTime = Time.time;
		_lastResult = true;
		float value = SafeRadius.Value;
		float num = value * value;
		Vector3 position = ((Component)player).transform.position;
		foreach (Character allCharacter in Character.GetAllCharacters())
		{
			if (!((Object)(object)allCharacter == (Object)null) && !((Object)(object)allCharacter == (Object)(object)player) && !allCharacter.IsDead() && BaseAI.IsEnemy((Character)(object)player, allCharacter))
			{
				Vector3 val = ((Component)allCharacter).transform.position - position;
				if (val.sqrMagnitude <= num && !IsIgnored(allCharacter))
				{
					_lastResult = false;
					break;
				}
			}
		}
		return _lastResult;
	}

	private static bool IsIgnored(Character c)
	{
		string text = IgnoredCreatures.Value ?? "";
		if (text != _ignoredRaw)
		{
			_ignoredRaw = text;
			Ignored.Clear();
			string[] array = text.Split(new char[1] { ',' });
			foreach (string text2 in array)
			{
				if (text2.Trim().Length > 0)
				{
					Ignored.Add(text2.Trim());
				}
			}
		}
		if (Ignored.Count == 0)
		{
			return false;
		}
		if (!Ignored.Contains(Utils.GetPrefabName(((Component)c).gameObject)))
		{
			if (Localization.instance != null)
			{
				return Ignored.Contains(Localization.instance.Localize(c.m_name));
			}
			return false;
		}
		return true;
	}
}
