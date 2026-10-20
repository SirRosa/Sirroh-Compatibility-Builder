using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using BepInEx;
using BepInEx.Configuration;
using HarmonyLib;
using TMPro;
using UnityEngine;
using neobotics.ModSdk;

namespace neobotics.ValheimMods;

[BepInPlugin("neobotics.valheim_mod.slayerskills", "SlayerSkills", "1.2.0")]
[BepInProcess("valheim.exe")]
[BepInProcess("valheim_server.exe")]
public class SlayerSkills : BaseUnityPlugin
{
	public enum Points
	{
		Random,
		All,
		Distribute,
		KillingBlow
	}

	[HarmonyPatch(typeof(Localization), "SetLanguage")]
	private static class Localization_SetLanguage_Patch
	{
		[HarmonyPostfix]
		private static void Localization_SetLanguage_Postfix(Localization __instance)
		{
			BuildCreatureTrophyMap();
		}
	}

	[HarmonyPatch(typeof(Game), "Start")]
	private static class Game_Start_Patch
	{
		[HarmonyPostfix]
		private static void Game_Start_Patch_Postfix(Game __instance)
		{
			Log.Debug(" Game_Start_Patch_Postfix");
			ZRoutedRpc.instance.Register<string, float>("RaiseSlayerStat", (Action<long, string, float>)RPC_RaiseSlayerStat);
		}
	}

	[HarmonyPatch(typeof(ZNetScene), "Awake")]
	private static class ZNetScene_Awake_Patch
	{
		[HarmonyPostfix]
		private static void ZNetScene_Awake_Postfix(ZNetScene __instance)
		{
			Log.Debug("ZNetScene_Awake_Patch_Postfix");
			BuildCreatureTrophyMap();
		}
	}

	[HarmonyPatch(typeof(InventoryGui), "UpdateTrophyList")]
	private static class InventoryGui_UpdateTrophyList_Patch
	{
		[HarmonyPostfix]
		private static void InventoryGui_UpdateTrophyList_Postfix(InventoryGui __instance, List<GameObject> ___m_trophyList)
		{
			Log.Debug("InventoryGui_UpdateTrophyList_Patch_Postfix");
			if (___m_trophyList == null)
			{
				return;
			}
			foreach (GameObject ___m_trophy in ___m_trophyList)
			{
				Transform transform = ___m_trophy.transform;
				Transform obj = ((transform is RectTransform) ? transform : null);
				TMP_Text component = ((Component)obj.Find("description")).GetComponent<TMP_Text>();
				TMP_Text component2 = ((Component)obj.Find("name")).GetComponent<TMP_Text>();
				if (nameToTokenMap.TryGetValue(component2.text, out var value))
				{
					if (trophyCollection.TryGetValue(value, out var value2))
					{
						string text = ((value2 < (float)Cfg.trophyCap.Value) ? $"{FlooredLevel(value2)}/{Cfg.trophyCap.Value}" : "Slayer");
						component.richText = true;
						component.text = "<color=" + colorString + ">" + text + "</color>\n" + component.text;
					}
					else
					{
						Log.Debug("Can't find mapped token " + value + " in trophy collection");
					}
				}
				else
				{
					Log.Debug("Can't find localized name " + component2.text + " slayerSkill");
				}
			}
		}
	}

	[HarmonyPatch(typeof(CharacterDrop), "OnDeath")]
	private static class CharacterDrop_OnDeath_Patch
	{
		[HarmonyPrefix]
		private static void CharacterDrop_OnDeath_Prefix(CharacterDrop __instance)
		{
			Log.Debug("CharacterDrop_OnDeath_Patch_Prefix");
			s_dod = (sender: 0L, level: 0);
			Character character = __instance.m_character;
			if (!Object.op_Implicit((Object)(object)character) || character.IsPlayer())
			{
				return;
			}
			int num = ((!Cfg.useCreatureLevel.Value) ? 1 : character.m_level);
			if (character.IsBoss())
			{
				num += Cfg.bossPoints.Value;
			}
			Log.Debug($"Creature level {character.m_level} Slayer points {num}");
			s_dod.level = num;
			HitData lastHit = character.m_lastHit;
			if (lastHit != null && lastHit.HaveAttacker())
			{
				s_dod.sender = GetSenderPlayer(lastHit.GetAttacker());
				return;
			}
			long num2 = character.m_nview.GetZDO().GetLong(SLAYER_ID, 0L);
			if (num2 != 0L)
			{
				s_dod.sender = num2;
			}
		}

		[HarmonyFinalizer]
		private static void CharacterDrop_OnDeath_Finalizer(CharacterDrop __instance)
		{
			s_dod = (sender: 0L, level: 0);
		}
	}

	[HarmonyPatch(typeof(CharacterDrop), "DropItems")]
	private static class CharacterDrop_DropItems_Patch
	{
		[HarmonyPostfix]
		private static void CharacterDrop_DropItems_Postfix(List<KeyValuePair<GameObject, int>> drops, Vector3 centerPos, float dropArea)
		{
			//IL_009d: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a4: Invalid comparison between Unknown and I4
			//IL_00b9: Unknown result type (might be due to invalid IL or missing references)
			Log.Debug("CharacterDrop_DropItems_Postfix");
			if (s_dod.sender == 0L && s_rag.sender == 0L)
			{
				return;
			}
			long slayer;
			int num;
			if (s_dod.sender != 0L)
			{
				(slayer, num) = s_dod;
			}
			else
			{
				(slayer, num) = s_rag;
			}
			ItemDrop val = default;
			foreach (KeyValuePair<GameObject, int> drop in drops)
			{
				if ((Object)(object)drop.Key != (Object)null && drop.Key.TryGetComponent<ItemDrop>(ref val) && (int)val.m_itemData.m_shared.m_itemType == 13)
				{
					InitiateRaiseStat(val.m_itemData.m_shared.m_name, num, centerPos, slayer);
					Log.Debug($"Found trophy in drops. Adding Slayer points {num}");
					break;
				}
			}
		}
	}

	[HarmonyPatch(typeof(Ragdoll), "SaveLootList")]
	private static class Ragdoll_SaveLootList_Patch
	{
		[HarmonyPrefix]
		private static void Ragdoll_SaveLootList_Prefix(Ragdoll __instance, CharacterDrop characterDrop)
		{
			Log.Debug("Ragdoll_SaveLootList_Patch_Prefix");
			Character character = characterDrop.m_character;
			HitData lastHit = character.m_lastHit;
			long num = 0L;
			if (lastHit != null && lastHit.HaveAttacker())
			{
				num = GetSenderPlayer(lastHit.GetAttacker());
			}
			if (num == 0L)
			{
				num = character.m_nview.GetZDO().GetLong(SLAYER_ID, 0L);
				if (num != 0L)
				{
					Log.Debug("Existing DOT from slayer found on target. Transferring to Ragdoll.");
				}
			}
			if (num == 0L)
			{
				Log.Debug("Character was not hit by player");
			}
			else
			{
				ZNetView val = default;
				if (!((Object)(object)character != (Object)null) || character.IsTamed() || !((Component)character).TryGetComponent<ZNetView>(ref val))
				{
					return;
				}
				ZDO zDO = __instance.m_nview.GetZDO();
				if (zDO.IsValid())
				{
					int num2 = ((!Cfg.useCreatureLevel.Value) ? 1 : character.m_level);
					if (character.IsBoss())
					{
						num2 += Cfg.bossPoints.Value;
					}
					Log.Debug($"Setting ragdoll tapper to {num} for Slayer points {num2}");
					zDO.Set(SLAYER_ID, num);
					zDO.Set(LEVEL_ID, num2);
				}
			}
		}
	}

	[HarmonyPatch(typeof(Ragdoll), "SpawnLoot")]
	private static class Ragdoll_SpawnLoot_Patch
	{
		[HarmonyPrefix]
		private static void Ragdoll_SpawnLoot_Prefix(Ragdoll __instance, Vector3 center)
		{
			ZDO zDO = __instance.m_nview.GetZDO();
			if (zDO.IsValid())
			{
				s_rag.sender = zDO.GetLong(SLAYER_ID, 0L);
				s_rag.level = zDO.GetInt(LEVEL_ID, 0);
			}
		}

		[HarmonyFinalizer]
		private static void Ragdoll_SpawnLoot_Finalizer(Ragdoll __instance, Vector3 center)
		{
			s_rag = (sender: 0L, level: 0);
		}
	}

	[HarmonyPatch(typeof(Character), "RPC_Damage")]
	private static class Character_RPC_Damage_Patch
	{
		[HarmonyPrefix]
		private static void Character_RPC_Damage_Prefix(Character __instance, HitData hit)
		{
			Log.Debug("Character_RPC_Damage_Patch_Prefix");
			if (!__instance.m_nview.IsOwner())
			{
				return;
			}
			Character attacker = hit.GetAttacker();
			if (hit.HaveAttacker() && attacker.IsPlayer() && !__instance.IsPlayer() && HaveDotDamage(hit))
			{
				__instance.m_nview.GetZDO().Set(SLAYER_ID, attacker.GetOwner());
				if (Log.Testing())
				{
					Log.Debug(((Object)__instance).name + " has DOT from slayer " + ((Object)attacker).name);
				}
			}
		}
	}

	[HarmonyPatch(typeof(Character), "Damage")]
	private static class Character_Damage_Patch
	{
		[HarmonyPrefix]
		private static void Character_Damage_Prefix(Character __instance, HitData hit, ZNetView ___m_nview)
		{
			Log.Debug("Character_Damage_Patch_Prefix");
			if (__instance.IsPlayer())
			{
				return;
			}
			Character attacker = hit.GetAttacker();
			Player localPlayer = Player.m_localPlayer;
			if ((Object)(object)attacker == (Object)null)
			{
				return;
			}
			bool flag = false;
			MonsterAI val = default;
			if (attacker.m_tamed && ((Component)attacker).TryGetComponent<MonsterAI>(ref val) && (Object)(object)val.GetFollowTarget() == (Object)(object)localPlayer)
			{
				flag = true;
			}
			if (!((Object)(object)attacker == (Object)(object)localPlayer) && (!flag || !Cfg.tamesBuff.Value))
			{
				return;
			}
			string text = Utils.UnClonifiedName(((Object)__instance).name);
			Log.Debug(attacker.GetHoverName() + " hit " + text);
			if (creatureTrophyMap.TryGetValue(text, out var value))
			{
				if (trophyCollection.TryGetValue(value, out var value2))
				{
					ApplySlayerBonus(hit, Mathf.Min(value2, (float)Cfg.trophyCap.Value));
				}
				else
				{
					Log.Debug("Can't find " + value + " in slayer collection");
				}
			}
			else
			{
				Log.Debug("Can't find " + text + " slayerSkill");
			}
		}
	}

	[HarmonyPatch(typeof(Player), "Save")]
	public static class Player_Save_Patch
	{
		[HarmonyPrefix]
		public static void Player_Save_Patch_Prefix(Player __instance, ZPackage pkg)
		{
			//IL_003a: Unknown result type (might be due to invalid IL or missing references)
			//IL_003f: Unknown result type (might be due to invalid IL or missing references)
			//IL_006b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0071: Unknown result type (might be due to invalid IL or missing references)
			//IL_0047: Unknown result type (might be due to invalid IL or missing references)
			//IL_0048: Unknown result type (might be due to invalid IL or missing references)
			//IL_0054: Unknown result type (might be due to invalid IL or missing references)
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			Log.Debug("Player_Save_Patch_Prefix");
			if ((Object)(object)Player.m_localPlayer == (Object)null || (Object)(object)__instance != (Object)(object)Player.m_localPlayer)
			{
				Log.Debug("Player_Save_Patch_Prefix: not the local player, skipping sync");
				return;
			}
			ZDOID zDOID = ((Character)__instance).GetZDOID();
			if (customData == null || zDOID == ZDOID.None || zDOID != currentPlayerZdoid)
			{
				Log.Debug($"Player_Save_Patch_Prefix: no trustworthy data loaded (save zdoid={zDOID}, tracked={currentPlayerZdoid}), skipping sync");
				return;
			}
			string text = Utils.SerializeFromDictionary(",", ":", trophyCollection);
			customData.Set(COLLECTION_ID, text);
			Log.Debug("Serializing and adding trophy collection " + text);
			customData.PreSaveSync();
		}
	}

	[HarmonyPatch(typeof(Player), "Start")]
	public static class Player_OnSpawned_Patch
	{
		[HarmonyPostfix]
		public static void Player_Start_Patch_Postfix(Player __instance)
		{
			//IL_003a: Unknown result type (might be due to invalid IL or missing references)
			//IL_003f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0040: Unknown result type (might be due to invalid IL or missing references)
			//IL_0041: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a3: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a4: Unknown result type (might be due to invalid IL or missing references)
			//IL_0079: Unknown result type (might be due to invalid IL or missing references)
			//IL_007e: Unknown result type (might be due to invalid IL or missing references)
			Log.Debug("Player_Start_Patch_Postfix");
			if ((Object)(object)Player.m_localPlayer == (Object)null || (Object)(object)__instance != (Object)(object)Player.m_localPlayer)
			{
				Log.Debug("Player_Start_Patch_Postfix: not the local player, skipping load");
				return;
			}
			ZDOID zDOID = ((Character)__instance).GetZDOID();
			if (zDOID == ZDOID.None)
			{
				Log.Debug("Player_Start_Patch_Postfix: no ZDOID yet (not networked), skipping load");
				return;
			}
			if (ZNet.m_world == null)
			{
				Log.Debug("Player_Start_Patch_Postfix: ZNet.m_world is null, invalidating tracked data");
				customData = null;
				currentPlayerZdoid = ZDOID.None;
				return;
			}
			trophyCollection.Clear();
			customData = new CustomDataWrapper(__instance.m_customData, SLAYER_ID);
			currentPlayerZdoid = zDOID;
			string text = customData.Get(COLLECTION_ID);
			if (text != null)
			{
				Utils.DeserializeToDictionary(text, ",", ":", ref trophyCollection);
				Log.Debug("Deserialized trophy string " + text);
			}
			else
			{
				Log.Debug("Player_Start_Patch_Postfix: no existing trophy collection, starting fresh");
			}
		}
	}

	[HarmonyPatch(typeof(Player), "OnDestroy")]
	public static class Player_OnDestroy_Patch
	{
		[HarmonyPostfix]
		public static void Player_OnDestroy_Patch_Postfix(Player __instance)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			//IL_0008: Unknown result type (might be due to invalid IL or missing references)
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_0015: Unknown result type (might be due to invalid IL or missing references)
			//IL_002b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0041: Unknown result type (might be due to invalid IL or missing references)
			//IL_0046: Unknown result type (might be due to invalid IL or missing references)
			ZDOID zDOID = ((Character)__instance).GetZDOID();
			if (zDOID != ZDOID.None && zDOID == currentPlayerZdoid)
			{
				Log.Debug($"Player_OnDestroy_Patch_Postfix: clearing tracked data for zdoid={zDOID}");
				customData = null;
				currentPlayerZdoid = ZDOID.None;
				trophyCollection.Clear();
			}
		}
	}

	[HarmonyPatch(typeof(Skills), "LowerAllSkills")]
	private static class Skills_LowerAllSkills_Patch
	{
		[HarmonyPostfix]
		private static void Skills_LowerAllSkills_Postfix(Skills __instance, float factor)
		{
			Log.Debug("Skills_LowerAllSkills_Patch_Postfix");
			if (!Cfg.lowerSkillsOnDeath.Value)
			{
				return;
			}
			foreach (string item in new List<string>(trophyCollection.Keys))
			{
				if (trophyCollection[item] < (float)Cfg.trophyCap.Value)
				{
					float num = trophyCollection[item] * factor;
					trophyCollection[item] -= num;
				}
			}
		}
	}

	[HarmonyPatch(typeof(Skills), "CheatRaiseSkill")]
	private static class Skills_CheatRaiseSkill_Patch
	{
		private static bool Prefix(string name, float value)
		{
			Logging.GetLogger().Debug("Skills CheatRaiseSkill Prefix");
			if (Cfg.allowCheats.Value)
			{
				if (name.ToLower() == "all")
				{
					foreach (string item in new List<string>(trophyCollection.Keys))
					{
						float num = trophyCollection[item] + value;
						num = Mathf.Clamp(num, 0f, (float)Cfg.trophyCap.Value);
						trophyCollection[item] = num;
					}
					Console.instance.Print($"All Slayer skills increased by {value} unless capped.");
					return true;
				}
				name = name.Replace('_', ' ');
				if (nameToTokenMap.TryGetValue(name, out var value2) && trophyCollection.TryGetValue(value2, out var value3))
				{
					value3 += value;
					value3 = Mathf.Clamp(value3, 0f, (float)Cfg.trophyCap.Value);
					trophyCollection[value2] = value3;
					Console.instance.Print($"Slayer skill {name} = {value3}");
					return false;
				}
			}
			else
			{
				Log.Debug("SlayerSkills cheats are not enabled");
			}
			return true;
		}
	}

	[HarmonyPatch(typeof(Skills), "CheatResetSkill")]
	private static class Skills_CheatResetSkill_Patch
	{
		private static bool Prefix(string name)
		{
			Logging.GetLogger().Debug("Skills CheatResetSkill Prefix");
			if (Cfg.allowCheats.Value)
			{
				if (name.ToLower() == "all")
				{
					foreach (string item in new List<string>(trophyCollection.Keys))
					{
						trophyCollection[item] = 0f;
					}
					Console.instance.Print("All Slayer skills reset");
					return true;
				}
				name = name.Replace('_', ' ');
				if (nameToTokenMap.TryGetValue(name, out var value) && trophyCollection.ContainsKey(value))
				{
					trophyCollection[value] = 0f;
					Console.instance.Print("Slayer skill " + name + " reset");
					return false;
				}
			}
			else
			{
				Log.Debug("SlayerSkills cheats are not enabled");
			}
			return true;
		}
	}

	private static SlayerSkills _modInstance;

	internal const string PLUGIN_VERSION = "1.2.0";

	internal const string PLUGIN_NAME = "SlayerSkills";

	internal const string PLUGIN_GUID = "neobotics.valheim_mod.slayerskills";

	public static Logging Log;

	public static string SLAYER_ID = "SlayerSkills_1847_";

	public static string LEVEL_ID = SLAYER_ID + "_L";

	public static string COLLECTION_ID = SLAYER_ID + "_C";

	private static CustomDataWrapper customData = null;

	private static ZDOID currentPlayerZdoid = ZDOID.None;

	internal static (long sender, int level) s_dod = (sender: 0L, level: 0);

	internal static (long sender, int level) s_rag = (sender: 0L, level: 0);

	private static IDictionary<string, float> trophyCollection = new Dictionary<string, float>();

	private static IDictionary<string, string> creatureTrophyMap = new Dictionary<string, string>();

	private static IDictionary<string, string> nameToTokenMap = new Dictionary<string, string>();

	private static string colorString = "#00FFFF";

	private static Harmony harmony = null;

	public static SlayerSkills GetInstance()
	{
		return _modInstance;
	}

	private void Awake()
	{
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Expected Obj, but got Unknown
		_modInstance = this;
		harmony = new Harmony(((BaseUnityPlugin)this).Info.Metadata.GUID);
		harmony.PatchAll(Assembly.GetExecutingAssembly());
		ConfigureMod();
		Log.Info("Awake");
	}

	private void ConfigureMod()
	{
		Log = Logging.GetLogger(Logging.LogLevels.Info, "SlayerSkills");
		ServerConfiguration.Instance.Setup(((BaseUnityPlugin)this).Config, (BaseUnityPlugin)(object)_modInstance);
		Cfg.BepInExConfig((BaseUnityPlugin)(object)_modInstance);
		ServerConfiguration.Instance.CreateConfigWatcher();
	}

	public static void ChangeLogging(object s, EventArgs e)
	{
		SettingChangedEventArgs e2 = (SettingChangedEventArgs)(object)((e is SettingChangedEventArgs) ? e : null);
		Log.Debug($"ChangeLog {e2.ChangedSetting.Definition.Key} to {e2.ChangedSetting.BoxedValue}");
		Log.LogLevel = Cfg.debugLevel.Value;
	}

	public static void ChangeColor(object s, EventArgs e)
	{
		//IL_0040: Unknown result type (might be due to invalid IL or missing references)
		SettingChangedEventArgs e2 = (SettingChangedEventArgs)(object)((e is SettingChangedEventArgs) ? e : null);
		Log.Debug($"ChangeColor {e2.ChangedSetting.Definition.Key} to {e2.ChangedSetting.BoxedValue}");
		colorString = "#" + ColorUtility.ToHtmlStringRGB(Cfg.skillColor.Value);
	}

	private void OnDestroy()
	{
		harmony.UnpatchSelf();
	}

	private static int GetVersionID(string versionString)
	{
		string[] array = versionString.Split('.');
		return int.Parse(array[0]) * 10000 + int.Parse(array[1]) * 1000 + int.Parse(array[2]);
	}

	private static bool OkToKey(Player player)
	{
		if (!Chat.instance.HasFocus() && !Console.IsVisible() && (Object)(object)TextViewer.instance != (Object)null && !TextViewer.instance.IsVisible() && !GameCamera.InFreeFly() && !Minimap.IsOpen() && !TextInput.IsVisible() && !StoreGui.IsVisible() && !((Character)player).InCutscene() && !((Character)player).InBed() && !((Character)player).IsTeleporting() && !((Character)player).IsDead())
		{
			return !((Character)player).InPlaceMode();
		}
		return false;
	}

	private static void KeypressEntryPoint()
	{
		_ = Player.m_localPlayer;
		Log.Debug("KeypressEntryPoint");
	}

	private static string GetTrophyDisplayName(string trophyName)
	{
		string text = Localization.instance.Localize(trophyName);
		string text2 = (text.EndsWith(" trophy") ? text.Substring(0, text.Length - 7) : text);
		Log.Debug("Trophy name " + trophyName + " Localized name " + text + " Display name " + text2);
		return text2;
	}

	private static string GetTrophyDisplayNameCaseInsensitive(string trophyName)
	{
		string text = Localization.instance.Localize(trophyName);
		if (!text.EndsWith(" trophy"))
		{
			return text;
		}
		return text.Substring(0, text.Length - 7);
	}

	private static void ApplySlayerBonus(HitData hitData, float skillLevel)
	{
		skillLevel = Mathf.Clamp(skillLevel, 0f, (float)Cfg.trophyCap.Value);
		float num = skillLevel / (float)Cfg.trophyCap.Value;
		float num2 = (float)Cfg.damageCap.Value / 100f * num;
		Log.Debug($"Before slayer Level {skillLevel} multiplier {num2} blunt {hitData.m_damage.m_blunt} slash {hitData.m_damage.m_slash} pierce {hitData.m_damage.m_pierce} fire {hitData.m_damage.m_fire} frost {hitData.m_damage.m_frost} lightning {hitData.m_damage.m_lightning} poison {hitData.m_damage.m_poison} spirit {hitData.m_damage.m_spirit}");
		if (Cfg.damagePhysical.Value)
		{
			hitData.m_damage.m_blunt += hitData.m_damage.m_blunt * num2;
			hitData.m_damage.m_slash += hitData.m_damage.m_slash * num2;
			hitData.m_damage.m_pierce += hitData.m_damage.m_pierce * num2;
		}
		if (Cfg.damageElemental.Value)
		{
			hitData.m_damage.m_fire += hitData.m_damage.m_fire * num2;
			hitData.m_damage.m_frost += hitData.m_damage.m_frost * num2;
			hitData.m_damage.m_lightning += hitData.m_damage.m_lightning * num2;
		}
		if (Cfg.damageOther.Value)
		{
			hitData.m_damage.m_spirit += hitData.m_damage.m_spirit * num2;
			hitData.m_damage.m_poison += hitData.m_damage.m_poison * num2;
		}
		Log.Debug($"After slayer Level {skillLevel} multiplier {num2} blunt {hitData.m_damage.m_blunt} slash {hitData.m_damage.m_slash} pierce {hitData.m_damage.m_pierce} fire {hitData.m_damage.m_fire} frost {hitData.m_damage.m_frost} lightning {hitData.m_damage.m_lightning} poison {hitData.m_damage.m_poison} spirit {hitData.m_damage.m_spirit}");
	}

	public static void BuildCreatureTrophyMap()
	{
		//IL_00bc: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c3: Invalid comparison between Unknown and I4
		if (ZNetScene.instance?.m_prefabs == null)
		{
			Log.Debug("ZNetScene instance is null");
			return;
		}
		CharacterDrop val = default;
		ItemDrop val2 = default;
		foreach (GameObject prefab in ZNetScene.instance.m_prefabs)
		{
			Character component = (Character)(object)prefab.GetComponent<Humanoid>();
			if ((Object)(object)component == (Object)null)
			{
				component = prefab.GetComponent<Character>();
			}
			if (!((Object)(object)component != (Object)null) || !prefab.TryGetComponent<CharacterDrop>(ref val))
			{
				continue;
			}
			foreach (Drop drop in val.m_drops)
			{
				if ((Object)(object)drop.m_prefab != (Object)null && drop.m_prefab.TryGetComponent<ItemDrop>(ref val2) && (int)val2.m_itemData.m_shared.m_itemType == 13)
				{
					string name = val2.m_itemData.m_shared.m_name;
					string trophyDisplayName = GetTrophyDisplayName(name);
					if (!creatureTrophyMap.ContainsKey(((Object)component).name))
					{
						Log.Debug("Adding " + ((Object)component).name + " " + name + " to original trophy map");
						creatureTrophyMap.Add(((Object)component).name, name);
					}
					if (!nameToTokenMap.ContainsKey(trophyDisplayName))
					{
						Log.Debug("Adding " + trophyDisplayName + " " + name + " to name-to-token map");
						nameToTokenMap.Add(trophyDisplayName, name);
					}
				}
			}
		}
	}

	private static int FlooredLevel(float level)
	{
		return Mathf.FloorToInt(level);
	}

	private static void RaiseStat(string itemName, float amt)
	{
		//IL_0182: Unknown result type (might be due to invalid IL or missing references)
		//IL_0189: Unknown result type (might be due to invalid IL or missing references)
		//IL_0198: Unknown result type (might be due to invalid IL or missing references)
		//IL_019e: Unknown result type (might be due to invalid IL or missing references)
		Log.Debug("RaiseStat");
		bool flag = false;
		string text = GetTrophyDisplayName(itemName);
		if (text.ToLower().EndsWith(" trophy"))
		{
			text = text.Substring(0, text.Length - 7);
		}
		Log.Debug(itemName + " translates to trophy name " + text);
		if (!trophyCollection.ContainsKey(itemName))
		{
			trophyCollection.Add(itemName, amt);
			int num = FlooredLevel(amt);
			if (num >= 1)
			{
				((Character)Player.m_localPlayer).Message((MessageType)2, $"{text} Slayer Level {num}", 0, (Sprite)null, false);
				flag = true;
			}
			Log.Debug("Adding " + text + " to slayer collection");
		}
		else
		{
			int num2 = FlooredLevel(trophyCollection[itemName]);
			if (num2 < Cfg.trophyCap.Value)
			{
				trophyCollection[itemName] += amt;
				if (trophyCollection[itemName] > (float)Cfg.trophyCap.Value)
				{
					trophyCollection[itemName] = Cfg.trophyCap.Value;
				}
				int num3 = FlooredLevel(trophyCollection[itemName]);
				if (num3 > num2)
				{
					((Character)Player.m_localPlayer).Message((MessageType)1, $"{text} Slayer Level {num3}", 0, (Sprite)null, false);
					flag = true;
				}
			}
			else
			{
				Log.Debug("Trophy cap reached");
			}
		}
		if (flag)
		{
			Player localPlayer = Player.m_localPlayer;
			Transform head = ((Character)localPlayer).m_head;
			localPlayer.m_skillLevelupEffects.Create(head.position, head.rotation, head, 1f, -1, default(ZDOID));
		}
	}

	private static void RPC_RaiseSlayerStat(long id, string itemName, float amt)
	{
		Log.Debug("RPC_RaiseSlayerStat");
		RaiseStat(itemName, amt);
	}

	private static List<Player> GetPlayersInRange(Vector3 point, float range, List<Player> allPlayers)
	{
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Unknown result type (might be due to invalid IL or missing references)
		List<Player> list = new List<Player>();
		foreach (Player allPlayer in allPlayers)
		{
			if (Vector3.Distance(((Component)allPlayer).transform.position, point) < range)
			{
				list.Add(allPlayer);
			}
		}
		return list;
	}

	private static void InitiateRaiseStat(string itemName, float amount, Vector3 center, long slayer)
	{
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		//IL_013b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0140: Unknown result type (might be due to invalid IL or missing references)
		//IL_01f8: Unknown result type (might be due to invalid IL or missing references)
		//IL_01fd: Unknown result type (might be due to invalid IL or missing references)
		Log.Debug("IntitiateRaiseStat");
		List<Player> allPlayers = Player.GetAllPlayers();
		int num = allPlayers.Count();
		if (num > 1)
		{
			List<Player> playersInRange = GetPlayersInRange(center, Cfg.trophyDistance.Value, allPlayers);
			Log.Debug($"Players in range {playersInRange.Count}");
			if (playersInRange.Count < num)
			{
				Log.Info($"{num - playersInRange.Count} player(s) not in range of the dropped trophy.");
			}
			if (playersInRange.Count <= 0)
			{
				return;
			}
			Log.Debug($"Assigning Slayer points using {Cfg.assignPoints.Value}");
			if (Cfg.assignPoints.Value == Points.KillingBlow)
			{
				Log.Debug($"Invoking RPC on Single player {slayer}");
				ZRoutedRpc.instance.InvokeRoutedRPC(slayer, "RaiseSlayerStat", new object[2] { itemName, amount });
				return;
			}
			if (Cfg.assignPoints.Value != Points.Random)
			{
				if (Cfg.assignPoints.Value == Points.Distribute)
				{
					amount /= (float)playersInRange.Count;
				}
				{
					ZNetView val = default;
					foreach (Player item in playersInRange)
					{
						if (((Component)item).TryGetComponent<ZNetView>(ref val) && val.IsValid() && val.GetZDO().m_uid != ZDOID.None)
						{
							Log.Debug($"Invoking RPC on {val.GetZDO().GetOwner()} All players {item.GetPlayerName()}");
							ZRoutedRpc.instance.InvokeRoutedRPC(val.GetZDO().GetOwner(), "RaiseSlayerStat", new object[2] { itemName, amount });
						}
					}
					return;
				}
			}
			int index = Random.Range(0, playersInRange.Count);
			ZNetView val2 = default;
			if (((Component)playersInRange[index]).TryGetComponent<ZNetView>(ref val2) && val2.IsValid() && val2.GetZDO().m_uid != ZDOID.None)
			{
				Log.Debug($"Invoking RPC on {val2.GetZDO().GetOwner()} Random player {playersInRange[index].GetPlayerName()}");
				ZRoutedRpc.instance.InvokeRoutedRPC(val2.GetZDO().GetOwner(), "RaiseSlayerStat", new object[2] { itemName, amount });
			}
		}
		else
		{
			RaiseStat(itemName, amount);
		}
	}

	internal static bool HaveDotDamage(HitData hit)
	{
		return hit.m_damage.m_fire + hit.m_damage.m_spirit + hit.m_damage.m_poison > 0f;
	}

	internal static long GetSenderPlayer(Character attacker)
	{
		Log.Debug("GetSenderPlayer");
		long result = 0L;
		if ((Object)(object)attacker == (Object)null)
		{
			return 0L;
		}
		if (attacker.IsPlayer())
		{
			return attacker.GetOwner();
		}
		MonsterAI val = default;
		if (attacker.m_tamed && ((Component)attacker).TryGetComponent<MonsterAI>(ref val))
		{
			GameObject followTarget = val.GetFollowTarget();
			if (Object.op_Implicit((Object)(object)followTarget) && Cfg.tamesSlay.Value)
			{
				Log.Debug("Tame following player");
				Character val2 = default;
				if (followTarget.TryGetComponent<Character>(ref val2) && val2.IsPlayer())
				{
					result = val2.GetOwner();
				}
			}
		}
		return result;
	}

	static SlayerSkills()
	{
		//IL_0038: Unknown result type (might be due to invalid IL or missing references)
		//IL_003d: Unknown result type (might be due to invalid IL or missing references)
	}
}
