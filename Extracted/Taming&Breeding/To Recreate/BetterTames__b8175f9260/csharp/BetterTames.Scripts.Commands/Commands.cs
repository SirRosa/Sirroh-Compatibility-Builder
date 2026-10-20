using System;
using BepInEx.Configuration;
using HarmonyLib;
using UnityEngine;

namespace BetterTames.Scripts.Commands;

public static class Commands
{
	private static readonly FieldRef<Tameable, ZNetView> TameView = AccessTools.FieldRefAccess<Tameable, ZNetView>("m_nview");

	private static readonly Func<Player, bool> TakeInput = AccessTools.MethodDelegate<Func<Player, bool>>(AccessTools.Method(typeof(Player), "TakeInput", (Type[])null, (Type[])null), (object)null, true);

	private static float lastMassCommand;

	public static void Apply(Tameable tameable)
	{
		if (Plugin.commandAllTames.Value && (Object)(object)((Component)tameable).GetComponent<MonsterAI>() != (Object)null)
		{
			tameable.m_commandable = true;
			return;
		}
		GameObject val = (Object.op_Implicit((Object)(object)ZNetScene.instance) ? ZNetScene.instance.GetPrefab(Utils.GetPrefabName(((Component)tameable).gameObject)) : null);
		Tameable val2 = (Object.op_Implicit((Object)(object)val) ? val.GetComponent<Tameable>() : null);
		if ((Object)(object)val2 != (Object)null)
		{
			tameable.m_commandable = val2.m_commandable;
		}
	}

	public static void ApplyAll()
	{
		Tameable tameable = default;
		foreach (Character allCharacter in Character.GetAllCharacters())
		{
			if (((Component)allCharacter).TryGetComponent<Tameable>(ref tameable))
			{
				Apply(tameable);
			}
		}
	}

	public static void Tick()
	{
		//IL_0028: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0047: Unknown result type (might be due to invalid IL or missing references)
		//IL_004c: Unknown result type (might be due to invalid IL or missing references)
		Player localPlayer = Player.m_localPlayer;
		if ((Object)(object)localPlayer == (Object)null || !TakeInput(localPlayer))
		{
			return;
		}
		KeyboardShortcut value = Plugin.massFollowKey.Value;
		if (value.IsDown())
		{
			MassCommand(localPlayer, follow: true);
			return;
		}
		value = Plugin.massStayKey.Value;
		if (value.IsDown())
		{
			MassCommand(localPlayer, follow: false);
		}
	}

	private static void MassCommand(Player player, bool follow)
	{
		//IL_008c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0097: Unknown result type (might be due to invalid IL or missing references)
		if (Time.time - lastMassCommand < 1f)
		{
			return;
		}
		lastMassCommand = Time.time;
		string playerName = player.GetPlayerName();
		float value = Plugin.massCommandRange.Value;
		int num = 0;
		Tameable val = default;
		foreach (Character allCharacter in Character.GetAllCharacters())
		{
			if (!allCharacter.IsTamed() || !((Component)allCharacter).TryGetComponent<Tameable>(ref val) || !val.m_commandable || (Object)(object)((Component)allCharacter).GetComponent<MonsterAI>() == (Object)null || Vector3.Distance(((Component)allCharacter).transform.position, ((Component)player).transform.position) > value)
			{
				continue;
			}
			ZNetView val2 = TameView.Invoke(val);
			if (!((Object)(object)val2 == (Object)null) && val2.IsValid())
			{
				string text = val2.GetZDO().GetString(ZDOVars.s_follow, "");
				if (!(follow ? (text.Length > 0) : (text != playerName)))
				{
					val.Command((Humanoid)(object)player, false);
					num++;
				}
			}
		}
		string text2;
		if (num != 0)
		{
			text2 = string.Format("{0} {1} {2}", num, (num == 1) ? "tame" : "tames", follow ? "following" : "staying");
		}
		else
		{
			text2 = (follow ? "No tames to follow you" : "No tames following you");
		}
		((Character)player).Message((MessageType)2, text2, 0, (Sprite)null, false);
	}
}
