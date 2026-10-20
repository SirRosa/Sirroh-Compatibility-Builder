using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;
using HarmonyLib;
using TMPro;
using UnityEngine;
using Zen.Lib.Controls;

namespace Zen.Lib;

[HarmonyPatch]
public static class KeyHint
{
	private class KeyHintInstance
	{
		public readonly Dictionary<(string Name, HintType Type), (GameObject Keyboard, GameObject Gamepad)> HintUI = new Dictionary<(string, HintType), (GameObject, GameObject)>();

		public event Action? UpdateBuildHints;

		public event Action? UpdateCombatHints;

		public event Action? UpdateBowHints;

		public event Action? UpdateInventoryHints;

		public event Action? UpdateContainerHints;

		public event Action? UpdateBarberHints;

		public event Action? UpdateFishingHints;

		public event Action? UpdateRadialHints;

		public static void InvokeEvents()
		{
			if (!IsFeatureEnabled)
			{
				return;
			}
			foreach (KeyHintInstance value in Instances.Values)
			{
				(ActiveType switch
				{
					HintType.None => null, 
					HintType.Build => value.UpdateBuildHints, 
					HintType.Inventory => value.UpdateInventoryHints, 
					HintType.Container => value.UpdateContainerHints, 
					HintType.Combat => value.UpdateCombatHints, 
					HintType.Bow => value.UpdateBowHints, 
					HintType.Barber => value.UpdateBarberHints, 
					HintType.Fishing => value.UpdateFishingHints, 
					HintType.Radial => value.UpdateRadialHints, 
					_ => throw new ArgumentOutOfRangeException(), 
				})?.Invoke();
			}
		}
	}

	private static readonly Dictionary<HintName, string> HintNodeNames = new Dictionary<HintName, string>
	{
		[HintName.Place] = "Place",
		[HintName.CloseBuildMenu] = "Close Build Menu",
		[HintName.Remove] = "Remove",
		[HintName.BuildMenu] = "Build Menu",
		[HintName.AltPlace] = "Alt Place",
		[HintName.Snap] = "Snap",
		[HintName.Copy] = "Copy",
		[HintName.PrimaryAttack] = "PrimaryAttack",
		[HintName.BowDraw] = "BowDraw",
		[HintName.SecondaryAttack] = "Secondary attack",
		[HintName.Block] = "Block",
		[HintName.Dodge] = "Dodge",
		[HintName.Move] = "Move",
		[HintName.ExitMenu] = "ExitMenu",
		[HintName.Use] = "Use",
		[HintName.Split] = "Split",
		[HintName.Drop] = "Drop",
		[HintName.Multicraft] = "Multicraft",
		[HintName.Transfer] = "Transfer",
		[HintName.Look] = "Look"
	};

	private const string Section = "_SECTION_";

	private static readonly string[] ControlPaths = new string[2] { "Keyboard/_SECTION_/Text", "Gamepad/Text - _SECTION_" };

	private static readonly Regex GamepadLabelRight = new Regex("[^>]+$");

	private static readonly Regex GamepadLabelLeft = new Regex("^[^<]+");

	private const double UpdateDelay = 0.2;

	private static double _lastUpdateTime;

	private static bool _isLabelOneFrameDirty;

	private static readonly Dictionary<Assembly, KeyHintInstance> Instances = new Dictionary<Assembly, KeyHintInstance>();

	public static bool IsFeatureEnabled => ModLib.Configs.UpdateKeyHints.Value;

	public static HintType ActiveType { get; private set; }

	private static event Action? LabelOneFrame;

	private static KeyHintInstance GetInstance(Assembly assembly)
	{
		if (!Instances.TryGetValue(assembly, out KeyHintInstance value))
		{
			return Instances[assembly] = new KeyHintInstance();
		}
		return value;
	}

	public static void Create(HintType hintType, ActionString action, int index = -1, bool startVisible = false)
	{
		Create(Assembly.GetCallingAssembly(), hintType, action.Name, index, startVisible);
	}

	public static void Create(HintType hintType, HintName hintName, int index = -1, bool startVisible = false)
	{
		Create(hintType, HintNodeNames[hintName], index, startVisible);
	}

	public static void Create(HintType hintType, string hintName, int index = -1, bool startVisible = false)
	{
		Create(Assembly.GetCallingAssembly(), hintType, hintName, index, startVisible);
	}

	private static void Create(Assembly assembly, HintType hintType, string hintName, int index = -1, bool startVisible = false)
	{
		//IL_0190: Unknown result type (might be due to invalid IL or missing references)
		//IL_0195: Unknown result type (might be due to invalid IL or missing references)
		if (!IsFeatureEnabled)
		{
			return;
		}
		Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(20, 2, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Create KeyHint for ");
			msg.AppendFormatted(hintType);
			msg.AppendLiteral("/");
			msg.AppendFormatted(hintName);
		}
		Logging<ModLib>.Info(msg);
		GameObject hintRoot = GetHintRoot(hintType);
		(GameObject, GameObject) value = default;
		Transform val = hintRoot.transform.Find("Keyboard");
		GameObject val2 = Object.Instantiate<GameObject>(((Component)val.GetChild(0)).gameObject, val);
		if (index >= 0)
		{
			val2.transform.SetSiblingIndex(index);
		}
		((Object)val2).name = hintName;
		((Component)val2.transform.Find("Text")).GetComponent<TMP_Text>().text = "$" + hintName;
		((Component)val2.transform.Find("key_bkg/Key")).GetComponent<TMP_Text>().text = "$KEY_" + hintName;
		value.Item1 = val2;
		val2.SetActive(startVisible);
		Transform val3 = hintRoot.transform.Find("Gamepad");
		GameObject val4 = Object.Instantiate<GameObject>(((Component)val3.GetChild(0)).gameObject, val3);
		if (index >= 0)
		{
			val4.transform.SetSiblingIndex(index);
		}
		((Object)val4).name = "Text - " + hintName;
		val4.GetComponent<TMP_Text>().text = "$" + hintName + "   <mspace=0.6em>$KEY_Joy" + hintName + "</mspace>";
		value.Item2 = val4;
		foreach (Transform item in val3)
		{
			((Object)item).name = ((Object)item).name.Replace("/", "-");
		}
		val4.SetActive(startVisible);
		GetInstance(assembly).HintUI.Add((hintName, hintType), value);
		Localization.instance.Localize(hintRoot.transform);
	}

	private static GameObject GetHintRoot(HintType hintType)
	{
		return hintType switch
		{
			HintType.Build => KeyHints.instance.m_buildHints, 
			HintType.Combat => KeyHints.instance.m_combatHints, 
			HintType.Bow => KeyHints.instance.m_combatHints, 
			HintType.Inventory => KeyHints.instance.m_inventoryHints, 
			HintType.Container => KeyHints.instance.m_inventoryWithContainerHints, 
			HintType.Barber => KeyHints.instance.m_barberHints, 
			HintType.Fishing => KeyHints.instance.m_fishingHints, 
			HintType.Radial => KeyHints.instance.m_radialHints, 
			_ => throw new ArgumentOutOfRangeException("hintType", hintType, null), 
		};
	}

	public static void SetEvent(HintType hintType, Action action)
	{
		KeyHintInstance instance = GetInstance(Assembly.GetCallingAssembly());
		switch (hintType)
		{
		case HintType.Build:
			instance.UpdateBuildHints += action;
			break;
		case HintType.Combat:
			instance.UpdateCombatHints += action;
			break;
		case HintType.Bow:
			instance.UpdateBowHints += action;
			break;
		case HintType.Inventory:
			instance.UpdateInventoryHints += action;
			break;
		case HintType.Container:
			instance.UpdateContainerHints += action;
			break;
		case HintType.Barber:
			instance.UpdateBarberHints += action;
			break;
		case HintType.Fishing:
			instance.UpdateFishingHints += action;
			break;
		case HintType.Radial:
			instance.UpdateRadialHints += action;
			break;
		case HintType.None:
			throw new ArgumentOutOfRangeException("hintType", hintType, "Cannot set event for None hint type.");
		default:
			throw new ArgumentOutOfRangeException("hintType", hintType, "Unknown hint type.");
		}
	}

	public static void SetVisible(ActionString action, bool isVisible)
	{
		SetVisible(ActiveType, action.Name, isVisible);
	}

	public static void SetVisible(HintName hintName, bool isVisible)
	{
		SetVisible(HintNodeNames[hintName], isVisible);
	}

	public static void SetVisible(string hintName, bool isVisible)
	{
		SetVisible(ActiveType, hintName, isVisible);
	}

	public static void SetVisible(HintType hintType, HintName hintName, bool isVisible)
	{
		SetVisible(hintType, HintNodeNames[hintName], isVisible);
	}

	public static void SetVisible(HintType hintType, string hintName, bool isVisible)
	{
		Set(hintType, hintName, isVisible, null);
	}

	public static void SetLabel(ActionString action, string label)
	{
		SetLabel(ActiveType, action.Name, label);
	}

	public static void SetLabel(HintName hintName, string label)
	{
		SetLabel(HintNodeNames[hintName], label);
	}

	public static void SetLabel(string hintName, string label)
	{
		SetLabel(ActiveType, hintName, label);
	}

	public static void SetLabel(HintType hintType, HintName hintName, string label)
	{
		SetLabel(hintType, HintNodeNames[hintName], label);
	}

	public static void SetLabel(HintType hintType, string hintName, string label)
	{
		Set(hintType, hintName, isVisible: true, label);
	}

	public static void SetLabelOneFrame(HintName hintName, string label)
	{
		SetLabelOneFrame(HintNodeNames[hintName], label);
	}

	public static void SetLabelOneFrame(string hintName, string label)
	{
		if (IsFeatureEnabled)
		{
			LabelOneFrame += () =>
			{
				SetLabel(hintName, label);
				_isLabelOneFrameDirty = true;
			};
		}
	}

	private static void Set(HintType hintType, string hintName, bool isVisible, string? label, string[]? searchPaths = null)
	{
		if (!IsFeatureEnabled)
		{
			return;
		}
		string[] array = searchPaths ?? ControlPaths;
		foreach (string text in array)
		{
			bool flag = text.StartsWith("Gamepad");
			if (flag && hintName == "Copy")
			{
				Set(hintType, "Copy Alt1-2", isVisible && ZInput.IsNonClassicFunctionality(), label, new string[1] { text });
				Set(hintType, "Copy Default", isVisible && !ZInput.IsNonClassicFunctionality(), label, new string[1] { text });
				break;
			}
			string text2 = text.Replace("_SECTION_", hintName);
			Transform val = GetHintRoot(hintType).transform.Find(text2);
			if (!Object.op_Implicit((Object)(object)val))
			{
				Logging<ModLib>.Warning(hintName + " node not found: " + text2);
				break;
			}
			if (flag)
			{
				if (label != null)
				{
					Regex regex = ((ActiveType == HintType.Container) ? GamepadLabelRight : GamepadLabelLeft);
					TMP_Text component = ((Component)val).GetComponent<TMP_Text>();
					component.text = regex.Replace(component.text, label);
				}
				((Component)val).gameObject.SetActive(isVisible);
			}
			else
			{
				if (label != null)
				{
					((Component)val.parent.Find("Text")).GetComponent<TMP_Text>().text = label;
				}
				((Component)val.parent).gameObject.SetActive(isVisible);
			}
		}
	}

	internal static void RemoveAll(Assembly assembly)
	{
		if (!IsFeatureEnabled)
		{
			return;
		}
		KeyHintInstance instance = GetInstance(assembly);
		foreach (var item in instance.HintUI.Keys.Select(((string Name, HintType Type) k) => instance.HintUI[k]))
		{
			Object.Destroy((Object)(object)item.Keyboard);
			Object.Destroy((Object)(object)item.Gamepad);
		}
		instance.HintUI.Clear();
		Instances.Remove(assembly);
	}

	private static HintType GetActiveType()
	{
		if (KeyHints.instance.m_buildHints.activeSelf)
		{
			return HintType.Build;
		}
		if (KeyHints.instance.m_inventoryHints.activeSelf)
		{
			return HintType.Inventory;
		}
		if (KeyHints.instance.m_inventoryWithContainerHints.activeSelf)
		{
			return HintType.Container;
		}
		if (KeyHints.instance.m_combatHints.activeSelf)
		{
			if (!((Humanoid)(object)Player.m_localPlayer).IsUsingRangedWeapon())
			{
				return HintType.Combat;
			}
			return HintType.Bow;
		}
		if (KeyHints.instance.m_fishingHints.activeSelf)
		{
			return HintType.Fishing;
		}
		if (KeyHints.instance.m_barberHints.activeSelf)
		{
			return HintType.Barber;
		}
		if (KeyHints.instance.m_radialHints.activeSelf)
		{
			return HintType.Radial;
		}
		return HintType.None;
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(KeyHints), "UpdateHints")]
	private static void KeyHints_UpdateHints()
	{
		if (!IsFeatureEnabled)
		{
			return;
		}
		ActiveType = HintType.None;
		if (KeyHints.instance.m_keyHintsEnabled && (UI.IsOpen || !(Time.timeAsDouble < _lastUpdateTime + 0.2)))
		{
			_lastUpdateTime = Time.timeAsDouble;
			ActiveType = GetActiveType();
			if (_isLabelOneFrameDirty && ActiveType != HintType.None)
			{
				GameObject hintRoot = GetHintRoot(ActiveType);
				Localization.instance.ReLocalizeVisible(hintRoot.transform);
				_isLabelOneFrameDirty = false;
			}
			KeyHintInstance.InvokeEvents();
			LabelOneFrame?.Invoke();
			LabelOneFrame = null;
		}
	}
}
