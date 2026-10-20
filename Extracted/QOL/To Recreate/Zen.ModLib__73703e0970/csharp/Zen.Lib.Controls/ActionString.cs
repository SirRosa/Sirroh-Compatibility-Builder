using System.Collections.Generic;
using System.Reflection;
using System.Text.RegularExpressions;
using BepInEx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.InputSystem.LowLevel;

namespace Zen.Lib.Controls;

public class ActionString
{
	private static readonly Dictionary<Assembly, List<ActionString>> Instances = new Dictionary<Assembly, List<ActionString>>();

	private string _label = string.Empty;

	private ButtonDef? _kbmAlias;

	private ButtonDef? _joyAlias;

	private readonly string _joyName;

	public string Name { get; }

	public string Label
	{
		get
		{
			return _label.Localize();
		}
		set
		{
			_label = value;
		}
	}

	public static implicit operator string(ActionString input)
	{
		return input.ToString();
	}

	internal ActionString(Assembly assembly, string? label = null, string? nameOverride = null)
	{
		Regex regex = new Regex("[^\\w]");
		string arg = regex.Replace(assembly.GetName().Name, "_");
		string arg2 = regex.Replace(label ?? string.Empty, "").Truncate(20);
		if (!Instances.TryGetValue(assembly, out List<ActionString> value))
		{
			value = (Instances[assembly] = new List<ActionString>());
		}
		value.Add(this);
		if (nameOverride != null)
		{
			Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(21, 1, out var shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("Using name override: ");
				msg.AppendFormatted(nameOverride);
			}
			Logging<ModLib>.Info(msg);
		}
		Name = nameOverride ?? $"{arg}_{arg2}_{value.Count - 1:0000}";
		_joyName = "Joy" + Name;
		Label = label ?? string.Empty;
	}

	private void UpdateLabelTranslations()
	{
		if (!Utility.IsNullOrWhiteSpace(Label))
		{
			Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(21, 2, out var shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("Update translation: ");
				msg.AppendFormatted(Name);
				msg.AppendLiteral(" ");
				msg.AppendFormatted(Label);
			}
			Logging<ModLib>.Info(msg);
			Localization.instance.AddWord(Name, Label);
			Localization.instance.AddWord("settings_" + Name.ToLower(), Label);
		}
	}

	private static void AddButtonInternal(string name, string path, bool altKey, bool showHints, bool rebindable, float repeatDelay, float repeatInterval)
	{
		bool shouldAppend;
		Logging<ModLib>.InterpolatedString msg;
		if (ZInput.instance.m_buttons.TryGetValue(name, out var value))
		{
			msg = new Logging<ModLib>.InterpolatedString(23, 2, out shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("Skip existing button: ");
				msg.AppendFormatted(value.GetActionPath(true));
				msg.AppendLiteral("\t");
				msg.AppendFormatted(value.Name);
			}
			Logging<ModLib>.Info(msg);
			return;
		}
		if (rebindable && (path.StartsWith("<Keyboard>") || path.StartsWith("<Mouse>")))
		{
			string text = PlayerPrefs.GetString("kbmBinding_" + name);
			if (!Utility.IsNullOrWhiteSpace(text))
			{
				path = text;
			}
		}
		msg = new Logging<ModLib>.InterpolatedString(13, 2, out shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Add Button: ");
			msg.AppendFormatted(path);
			msg.AppendLiteral("\t");
			msg.AppendFormatted(name);
		}
		Logging<ModLib>.Info(msg);
		ZInput.instance.AddButton(name, path, altKey, showHints, rebindable, repeatDelay, repeatInterval);
	}

	public void AddButton(GamepadInput input, bool altKey = false, bool showHints = false, bool rebindable = false, float repeatDelay = 0f, float repeatInterval = 0f)
	{
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		AddButtonInternal("Joy" + Name, input.Path(), altKey, showHints, rebindable, repeatDelay, repeatInterval);
	}

	public void AddButton(MouseButton input, bool altKey = false, bool showHints = false, bool rebindable = false, float repeatDelay = 0f, float repeatInterval = 0f)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		AddButtonInternal(Name, input.Path(), altKey, showHints, rebindable, repeatDelay, repeatInterval);
	}

	public void AddButton(KeyCode input, bool altKey = false, bool showHints = false, bool rebindable = false, float repeatDelay = 0f, float repeatInterval = 0f)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		AddButtonInternal(Name, input.Path(), altKey, showHints, rebindable, repeatDelay, repeatInterval);
	}

	public void AddButton(Key input, bool altKey = false, bool showHints = false, bool rebindable = false, float repeatDelay = 0f, float repeatInterval = 0f)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		AddButtonInternal(Name, input.Path(), altKey, showHints, rebindable, repeatDelay, repeatInterval);
	}

	public void Alias(string existingName)
	{
		ButtonDef buttonDef = ZInput.instance.GetButtonDef(existingName);
		string actionPath = buttonDef.GetActionPath(true);
		if (actionPath.StartsWith("<Gamepad>"))
		{
			_joyAlias = buttonDef;
		}
		else if (actionPath.StartsWith("<Keyboard>") || actionPath.StartsWith("<Mouse>"))
		{
			_kbmAlias = buttonDef;
		}
		Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(12, 3, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Alias: ");
			msg.AppendFormatted(buttonDef.GetActionPath(true));
			msg.AppendLiteral("\t");
			msg.AppendFormatted(existingName);
			msg.AppendLiteral(" -> ");
			msg.AppendFormatted(Name);
		}
		Logging<ModLib>.Info(msg);
	}

	public override string ToString()
	{
		if (ZInput.IsGamepadActive())
		{
			if (_joyAlias == null)
			{
				return _joyName;
			}
			return _joyAlias.Name;
		}
		if (_kbmAlias == null)
		{
			return Name;
		}
		return _kbmAlias.Name;
	}

	public void RemoveButtons()
	{
		Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(29, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Remove ActionString Buttons: ");
			msg.AppendFormatted(Name);
		}
		Logging<ModLib>.Info(msg);
		ZInput.instance.RemoveButton(Name);
		ZInput.instance.RemoveButton("Joy" + Name);
	}

	private static void RemoveAll(Assembly assembly)
	{
		if (!Instances.TryGetValue(assembly, out List<ActionString> value))
		{
			return;
		}
		foreach (ActionString item in value)
		{
			item.RemoveButtons();
		}
		value.Clear();
	}

	internal static void Shutdown(Assembly assembly)
	{
		RemoveAll(assembly);
		Instances.Remove(assembly);
	}

	internal static void TranslateAll(Assembly assembly)
	{
		if (!Instances.TryGetValue(assembly, out List<ActionString> value))
		{
			return;
		}
		foreach (ActionString item in value)
		{
			item.UpdateLabelTranslations();
		}
	}
}
