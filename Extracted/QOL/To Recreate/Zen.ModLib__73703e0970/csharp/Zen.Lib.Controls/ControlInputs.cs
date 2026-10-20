using System.Reflection;

namespace Zen.Lib.Controls;

public static class ControlInputs
{
	public static string JoyAlt => "JoyAltKeys";

	private static string JoyLTriggerSwapped
	{
		get
		{
			if (!ZInput.SwapTriggers)
			{
				return "JoyLTrigger";
			}
			return "JoyRTrigger";
		}
	}

	private static string JoyLBumperSwapped
	{
		get
		{
			if (!ZInput.SwapTriggers)
			{
				return "JoyLBumper";
			}
			return "JoyRBumper";
		}
	}

	public static GamepadInput TriggerSwappedL
	{
		get
		{
			if (ZInput.SwapTriggers)
			{
				return (GamepadInput)18;
			}
			return (GamepadInput)17;
		}
	}

	public static GamepadInput TriggerSwappedR
	{
		get
		{
			if (ZInput.SwapTriggers)
			{
				return (GamepadInput)17;
			}
			return (GamepadInput)18;
		}
	}

	public static ActionString Create(string? label = null)
	{
		return new ActionString(Assembly.GetCallingAssembly(), label);
	}

	internal static ActionString Create(string? label, string? nameOverride)
	{
		return new ActionString(Assembly.GetCallingAssembly(), label, nameOverride);
	}

	public static bool GetButtonPressQuick(string name, float maxDuration = 0.3f)
	{
		bool buttonUp = ZInput.GetButtonUp(name);
		float buttonLastPressedTimer = ZInput.GetButtonLastPressedTimer(name);
		int num;
		if (buttonUp && buttonLastPressedTimer > 0f)
		{
			num = ((buttonLastPressedTimer < maxDuration) ? 1 : 0);
			if (num != 0)
			{
				ZInput.ResetButtonStatus(name);
			}
		}
		else
		{
			num = 0;
		}
		return (byte)num != 0;
	}

	public static bool GetButtonPressLong(string name, float minDuration = 0.5f)
	{
		bool button = ZInput.GetButton(name);
		float buttonPressedTimer = ZInput.GetButtonPressedTimer(name);
		if (button)
		{
			return buttonPressedTimer >= minDuration;
		}
		return false;
	}
}
