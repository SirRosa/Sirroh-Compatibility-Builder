using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Text.RegularExpressions;
using BepInEx;
using HarmonyLib;
using UnityEngine;
using Zen;
using Zen.Lib;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class TooltipSummary
{
	private static class Icon
	{
		public const string Health = "\ud83d\udc96";

		public const string Stamina = "\ud83d\udcaa";

		public const string Magic = "✨";

		public const string Bow = "\ud83c\udff9";

		public const string Arrow = "\ud83c\udfaf";

		public const string Pickaxe = "⛏";

		public const string Axe = "\ud83e\ude93";

		public const string Dmg = "⚔";

		public const string Slash = "⚔";

		public const string Blunt = "⚒";

		public const string Pierce = "\ud83d\udd31";

		public const string StaminaDrain = "\ud83d\udc97";

		public const string Fire = "\ud83d\udd25";

		public const string Frost = "❄";

		public const string Lightning = "⚡";

		public const string Poison = "\ud83d\udc80\ufe0e";

		public const string Spirit = "\ud83c\udf00";

		public const string Blood = "\ud83e\ude78";

		public const string Shield = "\ud83d\udee1\ufe0f";

		public const string Parry = "⇄\ufe0f";

		public const string Armor = "\ud83d\udd30";

		public const string ArmorSet = "\ud83e\udd7c";

		public const string Clock = "⏱";

		public const string Heal = "\ud83d\udc97";

		public const string Pow = "\ud83d\udca5";

		private static readonly Dictionary<string, UIColor> ColorMap = new Dictionary<string, UIColor>
		{
			{
				"\ud83d\udc96",
				UIColor.LightRed
			},
			{
				"\ud83d\udcaa",
				UIColor.LightYellow
			},
			{
				"✨",
				UIColor.LightPurple
			},
			{
				"\ud83d\udd25",
				UIColor.LightRed
			},
			{
				"❄",
				UIColor.FrostBlue
			},
			{
				"\ud83d\udc80\ufe0e",
				UIColor.ForestGreen
			},
			{
				"⚡",
				UIColor.Yellow
			},
			{
				"\ud83c\udf00",
				UIColor.Gray
			},
			{
				"\ud83e\ude78",
				UIColor.BrightRed
			},
			{
				"\ud83d\udc97",
				UIColor.LightYellow
			}
		};

		public static UIColor GetColor(string emoji)
		{
			if (!ColorMap.TryGetValue(emoji, out UIColor value))
			{
				return ColorDefaultIcon;
			}
			return value;
		}
	}

	private static readonly UIColor ColorOffWhite;

	private static readonly UIColor ColorNumbers;

	private static readonly UIColor ColorDefaultIcon;

	private static readonly UIColor ColorFooter;

	private static readonly UIColor ColorFooterDim;

	private static readonly UIColor ColorDefaultMsg;

	private static readonly UIColor ColorDefaultMsgDim;

	public static bool IsFeatureEnabled => Configs.TooltipDisplayMode.Value != TooltipStyle.Detailed;

	public static string Format(string? description, string footerLeft = "", string footerCenter = "")
	{
		if (description == null)
		{
			description = string.Empty;
		}
		return "\n<align=center>" + description + "</align><line-height=3em>\n</line-height><line-height=0><size=-1>" + $"<align=left><color={ColorFooter}>{footerLeft}</color></align>\n" + $"<align=center><color={ColorFooter}>{footerCenter}</color></align>\n" + $"<align=right><color={ColorFooter}>{HintShowMore()}</color></align>" + "</size></line-height>";
		static string HintShowMore()
		{
			//IL_0005: Unknown result type (might be due to invalid IL or missing references)
			//IL_000a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_0019: Invalid comparison between Unknown and I4
			//IL_002b: Unknown result type (might be due to invalid IL or missing references)
			KeyCode value = Configs.TooltipDetailKey.Value;
			if (!Configs.TooltipShowHint.Value || (int)value <= 0)
			{
				return string.Empty;
			}
			return "⬇ $ui_hold " + KeyStr(value);
		}
	}

	public static string GetTooltipSummary(this ItemData item, int stackOverride, bool appended = false)
	{
		Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(35, 3, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendFormatted(appended ? "Append" : "Generate");
			msg.AppendLiteral(" summary tooltip info for ");
			msg.AppendFormatted(item.GetName());
			msg.AppendLiteral(", stack: ");
			msg.AppendFormatted(stackOverride);
		}
		Logging<Plugin>.Info(msg);
		bool hasIcons = false;
		if (!appended)
		{
			return CreateTooltip();
		}
		return Summary();
		static bool AddIconIfValue(List<string> list, string emoji, float value, string? suffix = null, UIColor? color = null)
		{
			if (value == 0f || Configs.TooltipDisplayMode.Value == TooltipStyle.Abstract)
			{
				return false;
			}
			if (suffix == null)
			{
				suffix = string.Empty;
			}
			list.Add(MakeIcon(emoji, $"{value:0.#}{suffix}", color));
			return true;
		}
		static bool AddIfExists(List<string> list, string str)
		{
			if (Utility.IsNullOrWhiteSpace(str))
			{
				return false;
			}
			list.Add(str);
			return true;
		}
		string AppendedItemData()
		{
			return (item.m_shared.m_appendToolTip?.m_itemData)?.GetTooltipSummary(stackOverride, appended: true) ?? string.Empty;
		}
		string Attack()
		{
			//IL_0041: Unknown result type (might be due to invalid IL or missing references)
			//IL_0046: Unknown result type (might be due to invalid IL or missing references)
			//IL_0048: Unknown result type (might be due to invalid IL or missing references)
			//IL_004b: Invalid comparison between Unknown and I4
			//IL_004d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0051: Invalid comparison between Unknown and I4
			//IL_0095: Unknown result type (might be due to invalid IL or missing references)
			//IL_009a: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a6: Unknown result type (might be due to invalid IL or missing references)
			//IL_00bf: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ec: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fa: Unknown result type (might be due to invalid IL or missing references)
			//IL_0100: Unknown result type (might be due to invalid IL or missing references)
			//IL_012c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0140: Unknown result type (might be due to invalid IL or missing references)
			//IL_0154: Unknown result type (might be due to invalid IL or missing references)
			//IL_0168: Unknown result type (might be due to invalid IL or missing references)
			//IL_017c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0190: Unknown result type (might be due to invalid IL or missing references)
			//IL_0118: Unknown result type (might be due to invalid IL or missing references)
			if (!item.IsWeapon() && !item.IsItemType((ItemType)9) && !item.IsItemType((ItemType)23))
			{
				return string.Empty;
			}
			string text = null;
			SkillType skillType = item.m_shared.m_skillType;
			if (((int)skillType == 8 || (int)skillType == 14) ? true : false)
			{
				text = "\ud83c\udff9";
			}
			if (item.IsItemType((ItemType)9) || item.IsItemType((ItemType)23))
			{
				text = "\ud83c\udfaf";
			}
			List<string> list = new List<string>();
			DamageTypes damage = item.GetDamage();
			AddIconIfValue(list, text ?? "⚔", damage.m_damage);
			AddIconIfValue(list, text ?? "⚔", damage.m_slash);
			AddIconIfValue(list, text ?? "⚒", damage.m_blunt);
			AddIconIfValue(list, "⛏", damage.m_pickaxe);
			if (!Mathf.Approximately(damage.m_pickaxe, damage.m_pierce))
			{
				AddIconIfValue(list, text ?? "\ud83d\udd31", damage.m_pierce);
			}
			AddIconIfValue(list, "\ud83e\ude93", damage.m_chop);
			AddIconIfValue(list, "\ud83d\udd25", damage.m_fire);
			AddIconIfValue(list, "❄", damage.m_frost);
			AddIconIfValue(list, "⚡", damage.m_lightning);
			AddIconIfValue(list, "\ud83d\udc80\ufe0e", damage.m_poison);
			AddIconIfValue(list, "\ud83c\udf00", damage.m_spirit);
			Attack val = item.m_shared.m_attack ?? item.m_shared.m_secondaryAttack;
			if (val != null && item.IsWeapon())
			{
				AddIconIfValue(list, "✨", val.m_attackEitr);
				AddIconIfValue(list, "\ud83e\ude78", val.m_attackHealth);
				AddIconIfValue(list, "\ud83e\ude78", val.m_attackHealthPercentage, "%");
			}
			return CombineIcons(list);
		}
		string CoinValue()
		{
			if (item.m_shared.m_value <= 0)
			{
				return string.Empty;
			}
			return MakeIcon("\ud83d\udcb0", item.GetValue().ToString("N0")) ?? "";
		}
		string CombineIcons(List<string> list)
		{
			if (Configs.TooltipDisplayMode.Value == TooltipStyle.Abstract)
			{
				return string.Empty;
			}
			if (list.Count > 0)
			{
				hasIcons = true;
			}
			return GeneralExtensions.Join<string>((IEnumerable<string>)list, (Func<string, string>)null, "    ");
		}
		string CreateTooltip()
		{
			string footerLeft = Weight() + "<pos=60>" + Movement() + "</pos>";
			return Format(Summary(), footerLeft);
		}
		string Defense()
		{
			if (!item.IsEquipable())
			{
				return string.Empty;
			}
			List<string> list = new List<string>();
			if (item.IsWeapon() || item.IsShield())
			{
				AddIconIfValue(list, "\ud83d\udee1\ufe0f", item.GetBaseBlockPower());
				int num = (item.m_shared.m_buildBlockCharges ? item.m_shared.m_maxBlockCharges : 0);
				AddIconIfValue(list, "\ud83d\udca5", num);
			}
			if (item.IsArmor())
			{
				AddIconIfValue(list, "\ud83d\udd30", item.GetArmor());
			}
			return CombineIcons(list);
		}
		string Description()
		{
			string text = item.m_shared.m_description;
			if (!appended && text.Localize().Trim() == string.Empty)
			{
				text = item.GetName();
			}
			if (appended && text.Length > 0)
			{
				text = "\n" + text;
			}
			return $"<color={ColorOffWhite}>{text}</color>";
		}
		string ExternalModInfo()
		{
			string text = item.GetTooltipExtra().Trim();
			if (!(text != string.Empty))
			{
				return string.Empty;
			}
			return $"\n<color={ColorDefaultMsg}>{text}</color>";
		}
		string Food()
		{
			ItemData val = item;
			if (!val.IsItemType((ItemType)2))
			{
				return string.Empty;
			}
			float food = val.m_shared.m_food;
			float foodStamina = val.m_shared.m_foodStamina;
			float foodEitr = val.m_shared.m_foodEitr;
			List<string> list = new List<string>();
			AddIconIfValue(list, "\ud83d\udc96", food);
			AddIconIfValue(list, "\ud83d\udcaa", foodStamina);
			AddIconIfValue(list, "✨", foodEitr);
			return CombineIcons(list);
		}
		static string MakeIcon(string emoji, string value, UIColor? color = null)
		{
			if (color == null)
			{
				color = Icon.GetColor(emoji);
			}
			return string.Format("<nobr><size=+4><color={0}>{1}</color></size>{2}<color={3}><size=-2>{4}</size></color></nobr>", new object[5] { color, emoji, "<space=2px>", ColorNumbers, value });
		}
		string Movement()
		{
			float movementModifier = item.m_shared.m_movementModifier;
			if (movementModifier == 0f)
			{
				return string.Empty;
			}
			string arg = ((movementModifier > 0f) ? "+" : string.Empty);
			string text = string.Format("{0} {1}{2}%", "\ud83c\udfc3", arg, movementModifier * 100f);
			if (!item.m_equipped)
			{
				return $"<color={ColorFooterDim}>{text}</color>";
			}
			return text;
		}
		string NoTeleport()
		{
			if (item.m_shared.m_teleportable || ZoneSystem.instance.GetGlobalKey((GlobalKeys)35))
			{
				return string.Empty;
			}
			return $"\n<color={ColorDefaultMsg}>$item_noteleport</color>";
		}
		string Resistances()
		{
			return SE_Stats.GetDamageModifiersTooltipString(item.m_shared.m_damageModifiers);
		}
		string SpecialAttackMessages()
		{
			Attack val = item.m_shared.m_attack ?? item.m_shared.m_secondaryAttack;
			if (!item.IsWeapon() || val == null)
			{
				return string.Empty;
			}
			List<string> list = new List<string>();
			if (item.m_shared.m_tamedOnly)
			{
				list.Add("$item_tamedonly");
			}
			if (val.m_damageMultiplierPerMissingHP != 0f)
			{
				list.Add("$item_damagemultiplierhp");
			}
			if (val.m_damageMultiplierByTotalHealthMissing != 0f)
			{
				list.Add("$item_damagemultipliertotal");
			}
			if (Object.op_Implicit((Object)(object)val.m_spawnOnHit))
			{
				GameObject spawnOnHit = val.m_spawnOnHit;
				Aoe val2 = default;
				ItemDrop item2 = default;
				if (spawnOnHit.TryGetComponent<Aoe>(ref val2))
				{
					list.Add(val2.m_name);
				}
				else if (spawnOnHit.TryGetComponent<ItemDrop>(ref item2))
				{
					list.Add(item2.GetName());
				}
				else
				{
					list.Add(((Object)spawnOnHit).name);
				}
			}
			if (list.Count != 0)
			{
				return string.Format("\n<color={0}>{1}</color>", ColorDefaultMsg, GeneralExtensions.Join<string>((IEnumerable<string>)list, (Func<string, string>)null, "\n"));
			}
			return string.Empty;
		}
		string StatsIcons()
		{
			List<string> list = new List<string>();
			AddIfExists(list, Attack());
			AddIfExists(list, Defense());
			AddIfExists(list, Food());
			AddIfExists(list, CoinValue());
			return CombineIcons(list);
		}
		string StatusEffects()
		{
			//IL_014a: Unknown result type (might be due to invalid IL or missing references)
			List<StatusEffect> list = new List<StatusEffect>
			{
				item.m_shared.m_fullAdrenalineSE,
				item.m_shared.m_attackStatusEffect,
				item.m_shared.m_equipStatusEffect,
				item.m_shared.m_consumeStatusEffect,
				item.m_shared.m_perfectBlockStatusEffect,
				item.m_shared.m_setStatusEffect
			};
			list.RemoveAll((StatusEffect e) => !Object.op_Implicit((Object)(object)e));
			if (list.Count == 0)
			{
				return string.Empty;
			}
			List<string> list2 = new List<string>();
			StringBuilder stringBuilder = new StringBuilder();
			if (item.IsItemType((ItemType)2))
			{
				foreach (StatusEffect item3 in list)
				{
					AddIconIfValue(list2, "⏱", item3.m_ttl);
				}
			}
			if (list2.Count > 0)
			{
				stringBuilder.Append(CombineIcons(list2) + "\n");
			}
			float skillLevel = ((Character)Player.m_localPlayer).GetSkillLevel(item.m_shared.m_skillType);
			foreach (StatusEffect item4 in list)
			{
				item4.SetLevel(item.m_quality, skillLevel);
				UIColor uIColor = ColorDefaultMsg;
				string text = string.Empty;
				int setSize = item.m_shared.m_setSize;
				if (setSize > 0 && (Object)(object)item4 == (Object)(object)item.m_shared.m_setStatusEffect)
				{
					int setCount = ((Humanoid)Player.m_localPlayer).GetSetCount(item.m_shared.m_setName);
					if (setCount < setSize)
					{
						uIColor = ColorDefaultMsgDim;
					}
					text = "\n" + UI.CreateMeter("\ud83d\udd18", "\ud83d\udfe3", UIColor.Orange, UIColor.DarkOrange, setCount, setSize, setSize);
				}
				string text2 = ((!((Object)(object)item4 == (Object)(object)item.m_shared.m_consumeStatusEffect) && !item.GetName().Localize().Contains(item4.m_name.Localize())) ? (item4.m_name + ": ") : string.Empty);
				Match match = Regex.Match(item4.GetTooltipString(), "\\$se_[^\n]+");
				if (match.Success)
				{
					stringBuilder.Append(string.Format("\n<color={0}>{1}{2}{3}</color>", new object[4] { uIColor, text2, match.Value, text }));
				}
				else if (text2 != string.Empty)
				{
					stringBuilder.Append($"\n<color={uIColor}>{text2}{text}</color>");
				}
			}
			return stringBuilder.ToString();
		}
		string Summary()
		{
			string[] source = new string[8]
			{
				Description(),
				StatsIcons(),
				SpecialAttackMessages(),
				ExternalModInfo(),
				Resistances(),
				NoTeleport(),
				StatusEffects(),
				AppendedItemData()
			};
			StringBuilder stringBuilder = new StringBuilder();
			foreach (var item5 in source.Where((string s) => !Utility.IsNullOrWhiteSpace(s)).WithIndex())
			{
				var (text, _) = item5;
				if ((item5.Index == 1) & hasIcons)
				{
					stringBuilder.Append("\n");
				}
				stringBuilder.Append(text + "\n");
			}
			return stringBuilder.ToString().Trim();
		}
		string Weight()
		{
			return string.Format("{0} {1:0.#}", "⚖", item.GetWeight(stackOverride));
		}
	}

	public static bool IsDetailMode()
	{
		if (IsFeatureEnabled)
		{
			return IsDetailKeyPressed();
		}
		return true;
	}

	public static bool IsDetailKeyPressed()
	{
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		//IL_0051: Expected I4, but got Unknown
		//IL_00ef: Unknown result type (might be due to invalid IL or missing references)
		if (ZInput.IsGamepadActive())
		{
			return ZInput.GetButton("JoyButtonY");
		}
		KeyCode value = Configs.TooltipDetailKey.Value;
		switch (value - 303)
		{
		case 2:
		case 3:
			return ZInput.GetKey((KeyCode)306, true) || ZInput.GetKey((KeyCode)305, true);
		case 4:
		case 5:
			return ZInput.GetKey((KeyCode)308, true) || ZInput.GetKey((KeyCode)307, true);
		case 0:
		case 1:
			return ZInput.GetKey((KeyCode)304, true) || ZInput.GetKey((KeyCode)303, true);
		case 6:
		case 7:
			return ZInput.GetKey((KeyCode)310, true) || ZInput.GetKey((KeyCode)309, true);
		case 8:
		case 9:
			return ZInput.GetKey((KeyCode)311, true) || ZInput.GetKey((KeyCode)312, true);
		default:
			return ZInput.GetKey(value, true);
		}
	}

	private static string KeyStr(KeyCode key)
	{
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		//IL_0041: Expected I4, but got Unknown
		if (ZInput.IsGamepadActive())
		{
			return "$KEY_JoyButtonY";
		}
		return (key - 303) switch
		{
			3 => "Ctrl", 
			2 => "Ctrl", 
			5 => "Alt", 
			4 => "Alt", 
			1 => "Shift", 
			0 => "Shift", 
			7 => "Cmd", 
			6 => "Cmd", 
			8 => "Win", 
			9 => "Win", 
			_ => ((object)key/*cast due to constrained. prefix*/).ToString(), 
		};
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(UITooltip), "LateUpdate")]
	private static IEnumerable<CodeInstruction> UITooltip_LateUpdate(IEnumerable<CodeInstruction> codes)
	{
		//IL_0043: Unknown result type (might be due to invalid IL or missing references)
		//IL_0049: Expected Obj, but got Unknown
		//IL_0060: Unknown result type (might be due to invalid IL or missing references)
		//IL_0066: Expected Obj, but got Unknown
		//IL_0069: Unknown result type (might be due to invalid IL or missing references)
		//IL_0097: Unknown result type (might be due to invalid IL or missing references)
		//IL_009d: Expected Obj, but got Unknown
		Func<float, float> func = ConfigDelay;
		CodeMatch[] array = new CodeMatch[2]
		{
			new CodeMatch((OpCode?)OpCodes.Ldfld, (object)AccessTools.Field(typeof(UITooltip), "m_showTimer"), (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldc_R4, (object)0.5f, (string)null)
		};
		return new CodeMatcher(codes, (ILGenerator)null).MatchEndForward(array).ThrowIfInvalid("Unable to match IL sequence for tooltip delay").Advance(1)
			.Insert(new CodeInstruction[1]
			{
				new CodeInstruction(OpCodes.Call, (object)func.Method)
			})
			.InstructionEnumeration();
		static float ConfigDelay(float defaultValue)
		{
			if (Configs.TooltipDelay.Value >= 0)
			{
				return (float)Configs.TooltipDelay.Value / 10f;
			}
			return defaultValue;
		}
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(InventoryGui), "Update")]
	[HarmonyPriority(600)]
	private static IEnumerable<CodeInstruction> InventoryGui_Update(IEnumerable<CodeInstruction> codes)
	{
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		//IL_003a: Expected Obj, but got Unknown
		//IL_005d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0063: Expected Obj, but got Unknown
		//IL_0071: Unknown result type (might be due to invalid IL or missing references)
		//IL_0077: Expected Obj, but got Unknown
		//IL_0089: Unknown result type (might be due to invalid IL or missing references)
		//IL_008f: Expected Obj, but got Unknown
		//IL_00b2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b8: Expected Obj, but got Unknown
		//IL_00bb: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ef: Expected Obj, but got Unknown
		Func<bool, bool> func = Intercept;
		CodeMatch[] array = new CodeMatch[5]
		{
			new CodeMatch((OpCode?)OpCodes.Ldstr, (object)"JoyButtonB", (string)null),
			new CodeMatch((OpCode?)OpCodes.Call, (object)AccessTools.DeclaredMethod(typeof(ZInput), "GetButtonDown", (Type[])null, (Type[])null), (string)null),
			new CodeMatch((OpCode?)OpCodes.Brtrue, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldstr, (object)"JoyButtonY", (string)null),
			new CodeMatch((OpCode?)OpCodes.Call, (object)AccessTools.DeclaredMethod(typeof(ZInput), "GetButtonDown", (Type[])null, (Type[])null), (string)null)
		};
		return new CodeMatcher(codes, (ILGenerator)null).MatchEndForward(array).ThrowIfInvalid("Unable to match JoyButtonY IL sequence for tooltip style toggle").Advance(1)
			.Insert(new CodeInstruction[1]
			{
				new CodeInstruction(OpCodes.Call, (object)func.Method)
			})
			.InstructionEnumeration();
		static bool Intercept(bool isJoyButtonYDown)
		{
			return !IsFeatureEnabled & isJoyButtonYDown;
		}
	}

	static TooltipSummary()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		//IL_0040: Unknown result type (might be due to invalid IL or missing references)
		//IL_0045: Unknown result type (might be due to invalid IL or missing references)
		//IL_0052: Unknown result type (might be due to invalid IL or missing references)
		Color white = Color.white;
		white.a = 0.75f;
		ColorOffWhite = white;
		ColorNumbers = UIColor.ValheimBeige;
		ColorDefaultIcon = UIColor.ValheimTooltipTitle;
		ColorFooter = UIColor.ValheimBeige;
		white = UIColor.ValheimBeige.Color;
		white.a = 0.2f;
		ColorFooterDim = white;
		ColorDefaultMsg = UIColor.Orange;
		ColorDefaultMsgDim = UIColor.DarkOrange;
	}
}
