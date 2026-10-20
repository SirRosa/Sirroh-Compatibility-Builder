using UnityEngine;
using Zen.Lib;

namespace Zen.Interop;

public static class Message
{
	internal const string Separator = "::";

	public static void Send(string pluginGUID, string message, object? arg)
	{
		if (!string.IsNullOrEmpty(pluginGUID) && !string.IsNullOrEmpty(message))
		{
			((Component)ZenMod<ModLib>.Instance).SendMessage(pluginGUID + "::" + message, arg, (SendMessageOptions)1);
		}
	}

	public static object? Request(string pluginGUID, string message, object? arg)
	{
		object[] array = new object[2] { arg, null };
		Send(pluginGUID, message, array);
		return array[1];
	}
}
