using System;
using System.Collections.Generic;
using BepInEx.Configuration;
using HarmonyLib;
using UnityEngine;

namespace BetterTames.Scripts.CatchUp;

public static class CatchUp
{
	private static readonly FieldRef<Tameable, ZNetView> TameView = AccessTools.FieldRefAccess<Tameable, ZNetView>("m_nview");

	private static readonly FieldRef<Character, Rigidbody> CharacterBody = AccessTools.FieldRefAccess<Character, Rigidbody>("m_body");

	private static readonly Func<Player, bool> TakeInput = AccessTools.MethodDelegate<Func<Player, bool>>(AccessTools.Method(typeof(Player), "TakeInput", (Type[])null, (Type[])null), (object)null, true);

	private static readonly FieldRef<ZDOMan, Dictionary<ZDOID, ZDO>> AllZDOs = AccessTools.FieldRefAccess<ZDOMan, Dictionary<ZDOID, ZDO>>("m_objectsByID");

	private static readonly FieldRef<BaseAI, AgentType> PathAgent = AccessTools.FieldRefAccess<BaseAI, AgentType>("m_pathAgentType");

	private static readonly Action<ZNetView> ClaimOwnership = AccessTools.MethodDelegate<Action<ZNetView>>(AccessTools.Method(typeof(ZNetView), "ClaimOwnership", (Type[])null, (Type[])null), (object)null, true);

	private const float CheckInterval = 2f;

	private static float lastCheck;

	public static void Tick()
	{
		//IL_0037: Unknown result type (might be due to invalid IL or missing references)
		//IL_003c: Unknown result type (might be due to invalid IL or missing references)
		//IL_009e: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a9: Unknown result type (might be due to invalid IL or missing references)
		if (!Plugin.catchUpTeleport.Value)
		{
			return;
		}
		Player localPlayer = Player.m_localPlayer;
		if ((Object)(object)localPlayer != (Object)null && TakeInput(localPlayer))
		{
			KeyboardShortcut value = Plugin.teleportFollowersKey.Value;
			if (value.IsDown())
			{
				TeleportFollowers(localPlayer);
			}
		}
		if ((Object)(object)localPlayer == (Object)null || Time.time - lastCheck < 2f)
		{
			return;
		}
		lastCheck = Time.time;
		foreach (Character item in FollowersOf(localPlayer.GetPlayerName()))
		{
			if (Vector3.Distance(((Component)item).transform.position, ((Component)localPlayer).transform.position) > Plugin.catchUpDistance.Value && CanReach(item, localPlayer))
			{
				MoveTo(item, localPlayer);
			}
		}
	}

	public static void OnRespawn(Player player)
	{
		//IL_0057: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fa: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ff: Unknown result type (might be due to invalid IL or missing references)
		//IL_0104: Unknown result type (might be due to invalid IL or missing references)
		if (!Plugin.catchUpTeleport.Value)
		{
			return;
		}
		string playerName = player.GetPlayerName();
		HashSet<ZDOID> hashSet = new HashSet<ZDOID>();
		foreach (Character item in FollowersOf(playerName))
		{
			MoveTo(item, player);
			ZNetView val = TameView.Invoke(((Component)item).GetComponent<Tameable>());
			hashSet.Add(val.GetZDO().m_uid);
		}
		foreach (ZDO value in AllZDOs.Invoke(ZDOMan.instance).Values)
		{
			if (!hashSet.Contains(value.m_uid) && value.IsOwner() && value.GetBool(ZDOVars.s_tamed, false) && !(value.GetString(ZDOVars.s_follow, "") != playerName))
			{
				value.SetPosition(((Component)player).transform.position + RandomOffset());
			}
		}
	}

	private static void TeleportFollowers(Player player)
	{
		int num = 0;
		foreach (Character item in FollowersOf(player.GetPlayerName()))
		{
			if (CanReach(item, player))
			{
				MoveTo(item, player);
				num++;
			}
		}
		string text = ((num == 0) ? "No tames following you" : string.Format("{0} {1} teleported to you", num, (num == 1) ? "tame" : "tames"));
		((Character)player).Message((MessageType)2, text, 0, (Sprite)null, false);
	}

	public static IEnumerable<Character> FollowersOf(string playerName)
	{
		Tameable val = default;
		foreach (Character allCharacter in Character.GetAllCharacters())
		{
			if (allCharacter.IsTamed() && ((Component)allCharacter).TryGetComponent<Tameable>(ref val))
			{
				ZNetView val2 = TameView.Invoke(val);
				if (!((Object)(object)val2 == (Object)null) && val2.IsValid() && !(val2.GetZDO().GetString(ZDOVars.s_follow, "") != playerName))
				{
					yield return allCharacter;
				}
			}
		}
	}

	private static bool CanReach(Character character, Player player)
	{
		//IL_0024: Unknown result type (might be due to invalid IL or missing references)
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		if (Plugin.bigTamesEnterDungeons.Value)
		{
			return true;
		}
		if (!IsBig(character))
		{
			return true;
		}
		return Character.InInterior(((Component)character).transform.position) == Character.InInterior(((Component)player).transform.position);
	}

	private static bool IsBig(Character character)
	{
		//IL_0021: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Unknown result type (might be due to invalid IL or missing references)
		//IL_0024: Invalid comparison between Unknown and I4
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Invalid comparison between Unknown and I4
		BaseAI baseAI = character.GetBaseAI();
		if ((Object)(object)baseAI == (Object)null)
		{
			return false;
		}
		AgentType val = PathAgent.Invoke(baseAI);
		if ((int)val == 1 || val - 5 <= 1)
		{
			return false;
		}
		return true;
	}

	private static void MoveTo(Character character, Player player)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		MoveTo(character, ((Component)player).transform.position);
	}

	public static Vector3 MoveTo(Character character, Vector3 target)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0046: Unknown result type (might be due to invalid IL or missing references)
		//IL_006c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0066: Unknown result type (might be due to invalid IL or missing references)
		Vector3 val = target + RandomOffset();
		ZNetView component = ((Component)character).GetComponent<ZNetView>();
		if ((Object)(object)component != (Object)null && component.IsValid() && !component.IsOwner())
		{
			ClaimOwnership(component);
		}
		((Component)character).transform.position = val;
		Rigidbody val2 = CharacterBody.Invoke(character);
		if ((Object)(object)val2 != (Object)null)
		{
			val2.position = val;
		}
		return val;
	}

	private static Vector3 RandomOffset()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_000a: Unknown result type (might be due to invalid IL or missing references)
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		//IL_001b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0021: Unknown result type (might be due to invalid IL or missing references)
		Vector2 val = Random.insideUnitCircle * 2f;
		return new Vector3(val.x, 0f, val.y);
	}
}
