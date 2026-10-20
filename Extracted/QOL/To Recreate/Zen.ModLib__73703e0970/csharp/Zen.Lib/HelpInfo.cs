using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using BepInEx;
using BepInEx.Configuration;
using HarmonyLib;
using UnityEngine;

namespace Zen.Lib;

[HarmonyPatch]
public class HelpInfo(string topic, string text)
{
	private readonly string _topic = topic;

	private readonly string _text = text;

	public static string Format(string heading, string text, string? displayValue = null, bool stripParens = true, bool stripNewLine = true)
	{
		heading = Regex.Replace(heading, "\\s*- Enabled?$", string.Empty, RegexOptions.IgnoreCase);
		heading = Regex.Replace(heading, "\\s*- Disabled?$", string.Empty, RegexOptions.IgnoreCase);
		if (stripParens)
		{
			text = Regex.Replace(text, "\\s*(\\([^)]*\\)|\\[[^\\]]*\\])", string.Empty);
		}
		if (stripNewLine)
		{
			text = text.Replace(text.Contains("\r") ? "\r\n" : "\n", " ");
		}
		heading = heading.Trim();
		text = text.Trim();
		string text2 = string.Empty;
		string text3 = string.Empty;
		if (displayValue != null && !Utility.IsNullOrWhiteSpace(displayValue))
		{
			UIColor valheimTooltipTitle = UIColor.ValheimTooltipTitle;
			if (StringExtensionMethods.RemoveRichTextTags(displayValue).Contains(","))
			{
				text3 = $" <color={valheimTooltipTitle}>[{displayValue}]</color>";
			}
			else
			{
				text2 = $": <color={valheimTooltipTitle}>{displayValue}</color>";
			}
		}
		return string.Format("\r\n<color={0}>{1}{2}</color>\r\n<margin=10>{3}{4}</margin>", new object[5]
		{
			UIColor.Orange,
			heading,
			text2,
			text,
			text3
		});
	}

	public static string Format<T>(ConfigEntry<T> config, bool showValue = false, bool stripParens = true, bool stripNewLine = true)
	{
		string heading = ((((ConfigEntryBase)config).Definition.Section != "General") ? (((ConfigEntryBase)config).Definition.Section + ": " + ((ConfigEntryBase)config).Definition.Key) : ((ConfigEntryBase)config).Definition.Key);
		string description = ((ConfigEntryBase)config).Description.Description;
		string formatted = null;
		if (showValue && !TryPercent(config, out formatted) && !TryColor(config, out formatted) && !TryMouseButton(config, out formatted) && !TryShortcut(config, out formatted))
		{
			T value = config.Value;
			formatted = ((value != null) ? value.ToString() : null);
		}
		return Format(heading, description, formatted, stripParens, stripNewLine);
		static bool TryColor(ConfigEntry<T> val, out string reference)
		{
			//IL_001f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0024: Unknown result type (might be due to invalid IL or missing references)
			//IL_0025: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			//IL_003e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0032: Unknown result type (might be due to invalid IL or missing references)
			//IL_0037: Unknown result type (might be due to invalid IL or missing references)
			T value2 = val.Value;
			if (value2 is Color white)
			{
				if (white == Color.clear)
				{
					white = Color.white;
				}
				reference = $"<color={new UIColor(white)}>\ud83d\udd33</color>";
				return true;
			}
			reference = string.Empty;
			return false;
		}
		static bool TryMouseButton(ConfigEntry<T> val, out string reference)
		{
			//IL_001f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0024: Unknown result type (might be due to invalid IL or missing references)
			//IL_002d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0033: Unknown result type (might be due to invalid IL or missing references)
			//IL_0035: Invalid comparison between Unknown and I4
			//IL_0048: Unknown result type (might be due to invalid IL or missing references)
			T value2 = val.Value;
			KeyCode val2 = default;
			int num;
			if (value2 is KeyCode)
			{
				val2 = (KeyCode)((((object)value2) is KeyCode) ? ((object)value2) : null);
				num = 1;
			}
			else
			{
				num = 0;
			}
			bool flag = (byte)num != 0;
			if (flag)
			{
				bool flag2 = val2 - 323 <= 2;
				flag = flag2;
			}
			if (flag)
			{
				reference = $"$button_{val2}".ToLowerInvariant().Localize();
				return true;
			}
			reference = string.Empty;
			return false;
		}
		static bool TryPercent(ConfigEntry<T> val, out string reference)
		{
			bool flag = ((ConfigEntryBase)val).Definition.Key.ToLowerInvariant().Contains("percent") || ((ConfigEntryBase)val).Description.Description.ToLowerInvariant().Contains("percent");
			T value2 = val.Value;
			float num = default;
			int num2;
			if (value2 is float)
			{
				num = (float)((((object)value2) is float) ? ((object)value2) : null);
				num2 = 1;
			}
			else
			{
				num2 = 0;
			}
			if (((uint)num2 & (flag ? 1u : 0u)) != 0)
			{
				reference = (num * 100f).ToString("N0") + "%";
				return true;
			}
			reference = string.Empty;
			return false;
		}
		static bool TryShortcut(ConfigEntry<T> val, out string reference)
		{
			//IL_001f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0024: Unknown result type (might be due to invalid IL or missing references)
			T value2 = val.Value;
			if (value2 is KeyboardShortcut val2)
			{
				reference = Regex.Replace(((object)val2/*cast due to constrained. prefix*/).ToString(), "Mouse(\\d)", (Match match) =>
				{
					int num = int.Parse(match.Groups[1].Value);
					return $"Mouse-{num + 1}";
				});
				return true;
			}
			reference = string.Empty;
			return false;
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(TextsDialog), "UpdateTextsList")]
	[HarmonyPriority(0)]
	private static void TextsDialog_UpdateTextsList(TextsDialog __instance)
	{
		//IL_0118: Unknown result type (might be due to invalid IL or missing references)
		//IL_011f: Expected Obj, but got Unknown
		if (!ModLib.Configs.ShowHelpInfo.Value)
		{
			return;
		}
		List<HelpInfo> list = new List<HelpInfo>();
		foreach (ZenMod value2 in ZenMod.Instances.Values)
		{
			HelpInfo helpInfo = value2.GetHelpInfo();
			if (helpInfo != null && !Utility.IsNullOrWhiteSpace(helpInfo._topic) && !Utility.IsNullOrWhiteSpace(helpInfo._text))
			{
				list.Add(helpInfo);
			}
		}
		int value = ModLib.Configs.ShowHelpInfoIndex.Value;
		string text = ModLib.Configs.ShowHelpInfoPrefix.Value.Trim();
		if (text.Length > 0)
		{
			text += " ";
		}
		Func<HelpInfo, string> keySelector = (HelpInfo h) => h._topic;
		bool flag = value < 0 || value > __instance.m_texts.Count - 1;
		foreach (HelpInfo item2 in flag ? list.OrderBy(keySelector) : list.OrderByDescending(keySelector))
		{
			TextInfo item = new TextInfo(text + item2._topic, item2._text);
			if (flag)
			{
				__instance.m_texts.Add(item);
			}
			else
			{
				__instance.m_texts.Insert(value, item);
			}
		}
	}
}
