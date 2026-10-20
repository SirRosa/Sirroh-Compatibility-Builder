using System;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using BepInEx.Configuration;
using HarmonyLib;
using TMPro;
using UnityEngine;

namespace BetterTames.Scripts.Protection;

public static class Protection
{
	private static readonly int RecoverUntilKey = StringExtensionMethods.GetStableHashCode("BetterTames_RecoverUntil");

	private static readonly int ProtectionKey = StringExtensionMethods.GetStableHashCode("BetterTames_Protection");

	private static readonly FieldRef<Character, ZNetView> NView = AccessTools.FieldRefAccess<Character, ZNetView>("m_nview");

	private static readonly FieldRef<Character, HitData> LastHit = AccessTools.FieldRefAccess<Character, HitData>("m_lastHit");

	private static readonly FieldRef<Player, Character> HoveringCreature = AccessTools.FieldRefAccess<Player, Character>("m_hoveringCreature");

	private static readonly Func<Character, float> GetHealth = AccessTools.MethodDelegate<Func<Character, float>>(AccessTools.Method(typeof(Character), "GetHealth", (Type[])null, (Type[])null), (object)null, true);

	private static readonly Func<Character, float> GetMaxHealth = AccessTools.MethodDelegate<Func<Character, float>>(AccessTools.Method(typeof(Character), "GetMaxHealth", (Type[])null, (Type[])null), (object)null, true);

	private static readonly Action<Character, float> SetHealth = AccessTools.MethodDelegate<Action<Character, float>>(AccessTools.Method(typeof(Character), "SetHealth", (Type[])null, (Type[])null), (object)null, true);

	private static readonly Func<Humanoid, ItemData> GetCurrentWeapon = AccessTools.MethodDelegate<Func<Humanoid, ItemData>>(AccessTools.Method(typeof(Humanoid), "GetCurrentWeapon", (Type[])null, (Type[])null), (object)null, true);

	private static readonly Action<MonsterAI> Sleep = AccessTools.MethodDelegate<Action<MonsterAI>>(AccessTools.Method(typeof(MonsterAI), "Sleep", (Type[])null, (Type[])null), (object)null, true);

	private static readonly Action<MonsterAI> Wakeup = AccessTools.MethodDelegate<Action<MonsterAI>>(AccessTools.Method(typeof(MonsterAI), "Wakeup", (Type[])null, (Type[])null), (object)null, true);

	private static readonly Action<BaseAI> StopMoving = AccessTools.MethodDelegate<Action<BaseAI>>(AccessTools.Method(typeof(BaseAI), "StopMoving", (Type[])null, (Type[])null), (object)null, true);

	private static readonly Action<MonsterAI, bool> SetAlerted = AccessTools.MethodDelegate<Action<MonsterAI, bool>>(AccessTools.Method(typeof(MonsterAI), "SetAlerted", (Type[])null, (Type[])null), (object)null, true);

	private static readonly Action<BaseAI, ZDOID> SetTargetInfo = AccessTools.MethodDelegate<Action<BaseAI, ZDOID>>(AccessTools.Method(typeof(BaseAI), "SetTargetInfo", (Type[])null, (Type[])null), (object)null, true);

	private static readonly Func<MonsterAI, bool> IsSleeping = AccessTools.MethodDelegate<Func<MonsterAI, bool>>(AccessTools.Method(typeof(MonsterAI), "IsSleeping", (Type[])null, (Type[])null), (object)null, true);

	private static readonly Action<ZNetView> ClaimOwnership = AccessTools.MethodDelegate<Action<ZNetView>>(AccessTools.Method(typeof(ZNetView), "ClaimOwnership", (Type[])null, (Type[])null), (object)null, true);

	private static readonly Func<Player, bool> TakeInput = AccessTools.MethodDelegate<Func<Player, bool>>(AccessTools.Method(typeof(Player), "TakeInput", (Type[])null, (Type[])null), (object)null, true);

	private static readonly FieldRef<Character, Vector3> MoveDir = AccessTools.FieldRefAccess<Character, Vector3>("m_moveDir");

	private static readonly FieldRef<Character, Vector3> CurrentVel = AccessTools.FieldRefAccess<Character, Vector3>("m_currentVel");

	private static readonly FieldRef<Character, Rigidbody> Body = AccessTools.FieldRefAccess<Character, Rigidbody>("m_body");

	private static readonly FieldRef<Character, ZSyncAnimation> ZAnim = AccessTools.FieldRefAccess<Character, ZSyncAnimation>("m_zanim");

	private static readonly Action<ZSyncAnimation, int, float> SetAnimFloat = AccessTools.MethodDelegate<Action<ZSyncAnimation, int, float>>(AccessTools.Method(typeof(ZSyncAnimation), "SetFloat", new Type[2]
	{
		typeof(int),
		typeof(float)
	}, (Type[])null), (object)null, true);

	private static readonly int ForwardSpeed = ZSyncAnimation.GetHash("forward_speed");

	private static readonly int SidewaySpeed = ZSyncAnimation.GetHash("sideway_speed");

	private static readonly int TurnSpeed = ZSyncAnimation.GetHash("turn_speed");

	private static readonly FieldRef<Player, int> InteractMask = AccessTools.FieldRefAccess<Player, int>("m_interactMask");

	private static readonly HashSet<Character> Downed = new HashSet<Character>();

	private static readonly Predicate<Character> IsGone = (Character c) => (Object)(object)c == (Object)null;

	private static readonly RaycastHit[] HoverHits = new RaycastHit[32];

	private static float lastDebugLog;

	private const string ProtectedColor = "#4FA3FF";

	private const string RecoveringColor = "#FFD24A";

	private static readonly FieldInfo HudsField = AccessTools.Field(typeof(EnemyHud), "m_huds");

	private static readonly FieldInfo HudNameField = AccessTools.Field(AccessTools.Inner(typeof(EnemyHud), "HudData"), "m_name");

	private static long Now => ZNet.instance.GetTime().Ticks;

	private static void DebugLog(Character character, MonsterAI monsterAI, string when)
	{
		//IL_00a8: Unknown result type (might be due to invalid IL or missing references)
		//IL_00bd: Unknown result type (might be due to invalid IL or missing references)
		//IL_0035: Unknown result type (might be due to invalid IL or missing references)
		if (!Plugin.debugMode.Value)
		{
			return;
		}
		Animator componentInChildren = ((Component)character).GetComponentInChildren<Animator>();
		bool flag = false;
		if ((Object)(object)componentInChildren != (Object)null)
		{
			AnimatorControllerParameter[] parameters = componentInChildren.parameters;
			for (int i = 0; i < parameters.Length; i++)
			{
				if (parameters[i].name == "sleeping")
				{
					flag = true;
				}
			}
		}
		Plugin.Logger.LogInfo((object)(string.Format("[Protection] {0} {1}: sleepParam={2} sleeping={3} ", new object[4]
		{
			when,
			character.m_name,
			flag,
			IsSleeping(monsterAI)
		}) + $"moveDir={MoveDir.Invoke(character)} currentVel={CurrentVel.Invoke(character)} " + string.Format("forward_speed={0:0.00} ", ((Object)(object)componentInChildren != (Object)null) ? componentInChildren.GetFloat("forward_speed") : (-1f)) + string.Format("animSleeping={0}", (((Object)(object)componentInChildren != (Object)null) & flag) && componentInChildren.GetBool("sleeping"))));
	}

	public static bool WildWillFight(Character wild)
	{
		BaseAI baseAI = wild.GetBaseAI();
		if ((Object)(object)baseAI == (Object)null || !baseAI.IsAlerted())
		{
			return false;
		}
		Tameable val = default;
		if (!((Component)wild).TryGetComponent<Tameable>(ref val))
		{
			return true;
		}
		ZNetView val2 = NView.Invoke(wild);
		if ((Object)(object)val2 == (Object)null || !val2.IsValid())
		{
			return true;
		}
		return val2.GetZDO().GetFloat(ZDOVars.s_tameTimeLeft, val.m_tamingTime) >= val.m_tamingTime;
	}

	public static bool IsDowned(Character? character)
	{
		if ((Object)(object)character == (Object)null || !character.IsTamed())
		{
			return false;
		}
		ZNetView val = NView.Invoke(character);
		if ((Object)(object)val != (Object)null && val.IsValid())
		{
			return val.GetZDO().GetLong(RecoverUntilKey, 0L) != 0;
		}
		return false;
	}

	public static bool TryDown(Character character)
	{
		if (!character.IsTamed() || GetHealth(character) > 0f)
		{
			return false;
		}
		MonsterAI val = default;
		if (!((Component)character).TryGetComponent<MonsterAI>(ref val))
		{
			return false;
		}
		ZNetView val2 = NView.Invoke(character);
		if ((Object)(object)val2 == (Object)null || !val2.IsValid() || !val2.IsOwner())
		{
			return false;
		}
		ZDO zDO = val2.GetZDO();
		if (!IsProtected(zDO) || KilledWithButcherKnife(character))
		{
			return false;
		}
		zDO.Set(RecoverUntilKey, Now + TimeSpan.FromSeconds((double)Plugin.recoveryTime.Value).Ticks);
		SetHealth(character, 1f);
		Calm(val, character);
		Sleep(val);
		Downed.Add(character);
		DebugLog(character, val, "downed");
		return true;
	}

	public static bool UpdateRecovery(MonsterAI monsterAI)
	{
		Character val = default;
		if (!((Component)monsterAI).TryGetComponent<Character>(ref val))
		{
			return false;
		}
		ZNetView val2 = NView.Invoke(val);
		if ((Object)(object)val2 == (Object)null || !val2.IsValid())
		{
			return false;
		}
		ZDO zDO = val2.GetZDO();
		long num = zDO.GetLong(RecoverUntilKey, 0L);
		if (num == 0L)
		{
			return false;
		}
		Downed.Add(val);
		if (!val2.IsOwner())
		{
			return true;
		}
		Calm(monsterAI, val);
		if (!IsSleeping(monsterAI))
		{
			Sleep(monsterAI);
		}
		if (Time.time - lastDebugLog > 2f)
		{
			lastDebugLog = Time.time;
			DebugLog(val, monsterAI, "recovering");
		}
		long now = Now;
		float num2 = GetMaxHealth(val);
		if (now >= num)
		{
			zDO.Set(RecoverUntilKey, 0L);
			SetHealth(val, num2);
			Wakeup(monsterAI);
			Downed.Remove(val);
			return true;
		}
		long ticks = TimeSpan.FromSeconds((double)Plugin.recoveryTime.Value).Ticks;
		float num3 = num2 * (1f - (float)(num - now) / (float)ticks);
		if (num3 > GetHealth(val))
		{
			SetHealth(val, num3);
		}
		return true;
	}

	private static void Calm(MonsterAI monsterAI, Character character)
	{
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0032: Unknown result type (might be due to invalid IL or missing references)
		//IL_0037: Unknown result type (might be due to invalid IL or missing references)
		//IL_005c: Unknown result type (might be due to invalid IL or missing references)
		//IL_006b: Unknown result type (might be due to invalid IL or missing references)
		StopMoving((BaseAI)(object)monsterAI);
		SetAlerted(monsterAI, arg2: false);
		SetTargetInfo((BaseAI)(object)monsterAI, ZDOID.None);
		CurrentVel.Invoke(character) = Vector3.zero;
		Rigidbody val = Body.Invoke(character);
		if ((Object)(object)val != (Object)null)
		{
			val.linearVelocity = new Vector3(0f, val.linearVelocity.y, 0f);
		}
		ZSyncAnimation val2 = ZAnim.Invoke(character);
		if (!((Object)(object)val2 == (Object)null))
		{
			SetAnimFloat(val2, ForwardSpeed, 0f);
			SetAnimFloat(val2, SidewaySpeed, 0f);
			SetAnimFloat(val2, TurnSpeed, 0f);
		}
	}

	public static string? HoverLine(Character character, ZDO zdo)
	{
		MonsterAI val = default;
		if (!character.IsTamed() || !((Component)character).TryGetComponent<MonsterAI>(ref val))
		{
			return null;
		}
		long num = zdo.GetLong(RecoverUntilKey, 0L);
		if (num == 0L)
		{
			return null;
		}
		return "Recovering " + Mathf.Max(0, Mathf.CeilToInt((float)(num - Now) / 10000000f)) + "s";
	}

	public static string AddPrompt(Character character, string hoverText)
	{
		//IL_0084: Unknown result type (might be due to invalid IL or missing references)
		MonsterAI val = default;
		if (hoverText.Length == 0 || !character.IsTamed() || !((Component)character).TryGetComponent<MonsterAI>(ref val))
		{
			return hoverText;
		}
		ZNetView val2 = NView.Invoke(character);
		if ((Object)(object)val2 == (Object)null || !val2.IsValid())
		{
			return hoverText;
		}
		string text = (IsProtected(val2.GetZDO()) ? "On" : "Off");
		return hoverText + "\n[<color=yellow><b>" + KeyText(Plugin.toggleProtectionKey.Value) + "</b></color>] Protection: " + text;
	}

	public static void TintNameplates(EnemyHud enemyHud)
	{
		Downed.RemoveWhere(IsGone);
		if (!(HudsField.GetValue(enemyHud) is IDictionary dictionary))
		{
			return;
		}
		foreach (DictionaryEntry item in dictionary)
		{
			object key = item.Key;
			Character val = (Character)((key is Character) ? key : null);
			if (val == null || (Object)(object)val == (Object)null)
			{
				continue;
			}
			string text = NameColor(val);
			if (text != null)
			{
				object? value = HudNameField.GetValue(item.Value);
				TMP_Text val2 = (TMP_Text)((value is TMP_Text) ? value : null);
				if (val2 != null && ((Component)val2).gameObject.activeInHierarchy)
				{
					val2.text = "<color=" + text + ">" + val2.text + "</color>";
				}
			}
		}
	}

	private static string? NameColor(Character character)
	{
		MonsterAI val = default;
		if (!character.IsTamed() || !((Component)character).TryGetComponent<MonsterAI>(ref val))
		{
			return null;
		}
		ZNetView val2 = NView.Invoke(character);
		if ((Object)(object)val2 == (Object)null || !val2.IsValid())
		{
			return null;
		}
		ZDO zDO = val2.GetZDO();
		if (zDO.GetLong(RecoverUntilKey, 0L) != 0L)
		{
			Downed.Add(character);
			return "#FFD24A";
		}
		Downed.Remove(character);
		if (!IsProtected(zDO))
		{
			return null;
		}
		return "#4FA3FF";
	}

	public static void FindDownedHover(Player player, ref Character hoverCreature)
	{
		//IL_0048: Unknown result type (might be due to invalid IL or missing references)
		//IL_004e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0086: Unknown result type (might be due to invalid IL or missing references)
		//IL_008b: Unknown result type (might be due to invalid IL or missing references)
		if ((Object)(object)hoverCreature != (Object)null || Downed.Count == 0 || !Plugin.showDownedTames.Value || (Object)(object)GameCamera.instance == (Object)null)
		{
			return;
		}
		Transform transform = ((Component)GameCamera.instance).transform;
		int num = Physics.RaycastNonAlloc(transform.position, transform.forward, HoverHits, 50f, InteractMask.Invoke(player));
		Character val = null;
		float num2 = float.MaxValue;
		for (int i = 0; i < num; i++)
		{
			RaycastHit val2 = HoverHits[i];
			Character val3 = (((Object)(object)val2.collider.attachedRigidbody != (Object)null) ? ((Component)val2.collider.attachedRigidbody).GetComponent<Character>() : ((Component)val2.collider).GetComponent<Character>());
			if (!((Object)(object)val3 == (Object)null) && !((Object)(object)val3 == (Object)(object)player) && !(val2.distance >= num2))
			{
				val = val3;
				num2 = val2.distance;
			}
		}
		if ((Object)(object)val != (Object)null && Downed.Contains(val))
		{
			hoverCreature = val;
		}
	}

	public static bool SwallowsInteract(Tameable tameable)
	{
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_000a: Unknown result type (might be due to invalid IL or missing references)
		KeyboardShortcut value = Plugin.toggleProtectionKey.Value;
		Character val = default;
		if (value.IsPressed() && ((Component)tameable).TryGetComponent<Character>(ref val))
		{
			return val.IsTamed();
		}
		return false;
	}

	public static void Tick()
	{
		//IL_0027: Unknown result type (might be due to invalid IL or missing references)
		//IL_002c: Unknown result type (might be due to invalid IL or missing references)
		Player localPlayer = Player.m_localPlayer;
		if ((Object)(object)localPlayer == (Object)null || !TakeInput(localPlayer))
		{
			return;
		}
		KeyboardShortcut value = Plugin.toggleProtectionKey.Value;
		if (!value.IsDown())
		{
			return;
		}
		Character val = HoveringCreature.Invoke(localPlayer);
		MonsterAI val2 = default;
		if (!((Object)(object)val == (Object)null) && val.IsTamed() && ((Component)val).TryGetComponent<MonsterAI>(ref val2))
		{
			ZNetView val3 = NView.Invoke(val);
			if (!((Object)(object)val3 == (Object)null) && val3.IsValid())
			{
				ClaimOwnership(val3);
				ZDO zDO = val3.GetZDO();
				bool flag = !IsProtected(zDO);
				zDO.Set(ProtectionKey, flag ? 1 : (-1), false);
				((Character)localPlayer).Message((MessageType)2, val.GetHoverName() + " " + (flag ? "protected" : "not protected"), 0, (Sprite)null, false);
			}
		}
	}

	private static string KeyText(KeyboardShortcut shortcut)
	{
		//IL_0019: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_004e: Unknown result type (might be due to invalid IL or missing references)
		string text = "";
		foreach (KeyCode modifier in shortcut.Modifiers)
		{
			text = text + KeyName(modifier) + " + ";
		}
		return text + KeyName(shortcut.MainKey);
	}

	private static string KeyName(KeyCode key)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0024: Expected I4, but got Unknown
		switch (key - 303)
		{
		case 4:
		case 5:
			return "Alt";
		case 0:
		case 1:
			return "Shift";
		case 2:
		case 3:
			return "Ctrl";
		default:
			return ((object)key/*cast due to constrained. prefix*/).ToString();
		}
	}

	private static bool IsProtected(ZDO zdo)
	{
		return zdo.GetInt(ProtectionKey, 0) switch
		{
			1 => true, 
			-1 => false, 
			_ => Plugin.protectAllTames.Value, 
		};
	}

	private static bool KilledWithButcherKnife(Character character)
	{
		HitData obj = LastHit.Invoke(character);
		Character obj2 = ((obj != null) ? obj.GetAttacker() : null);
		Humanoid val = (Humanoid)(object)((obj2 is Humanoid) ? obj2 : null);
		if (val != null && ((Character)val).IsPlayer())
		{
			return GetCurrentWeapon(val)?.m_shared.m_tamedOnly ?? false;
		}
		return false;
	}
}
