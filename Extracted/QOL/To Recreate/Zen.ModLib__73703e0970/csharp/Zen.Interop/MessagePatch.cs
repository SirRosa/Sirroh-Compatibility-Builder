using System;
using System.Collections.Generic;
using System.Reflection;
using BepInEx;
using BepInEx.Bootstrap;
using HarmonyLib;
using JetBrains.Annotations;
using UnityEngine;

namespace Zen.Interop;

[HarmonyPatch]
internal static class MessagePatch
{
	private enum CacheKind
	{
		Missing,
		Found
	}

	private sealed class CacheEntry
	{
		public readonly CacheKind Kind;

		public readonly BaseUnityPlugin? Plugin;

		public readonly string? Msg;

		private CacheEntry(CacheKind kind, BaseUnityPlugin? plugin, string? msg)
		{
			Kind = kind;
			Plugin = plugin;
			Msg = msg;
		}

		public static CacheEntry MissingPlugin()
		{
			return new CacheEntry(CacheKind.Missing, null, null);
		}

		public static CacheEntry ForPlugin(BaseUnityPlugin plugin, string message)
		{
			return new CacheEntry(CacheKind.Found, plugin, message);
		}
	}

	private static readonly Dictionary<string, CacheEntry> Cache = new Dictionary<string, CacheEntry>(StringComparer.Ordinal);

	private const int CacheMaxEntries = 2048;

	[UsedImplicitly]
	private static IEnumerable<MethodBase> TargetMethods()
	{
		return new _003C_003Ez__ReadOnlyArray<MethodBase>(new MethodBase[2]
		{
			AccessTools.DeclaredMethod(typeof(Component), "SendMessage", new Type[3]
			{
				typeof(string),
				typeof(object),
				typeof(SendMessageOptions)
			}, (Type[])null),
			AccessTools.DeclaredMethod(typeof(GameObject), "SendMessage", new Type[3]
			{
				typeof(string),
				typeof(object),
				typeof(SendMessageOptions)
			}, (Type[])null)
		});
	}

	[HarmonyPrefix]
	[UsedImplicitly]
	[HarmonyPriority(800)]
	private static bool SendMessage_Patch(string? methodName, object? value, SendMessageOptions options)
	{
		//IL_00c2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c4: Invalid comparison between Unknown and I4
		//IL_0163: Unknown result type (might be due to invalid IL or missing references)
		//IL_0090: Unknown result type (might be due to invalid IL or missing references)
		if (methodName == null)
		{
			return true;
		}
		int num = methodName.IndexOf("::", StringComparison.Ordinal);
		if (num < 0)
		{
			return true;
		}
		if (num == 0 || num == methodName.Length - "::".Length)
		{
			return false;
		}
		bool value2 = ModLib.Configs.EnableMessageCache.Value;
		if (value2 && Cache.TryGetValue(methodName, out CacheEntry value3))
		{
			switch (value3.Kind)
			{
			case CacheKind.Missing:
				Logging<ModLib>.Debug("Target plugin not found in cache");
				return false;
			case CacheKind.Found:
				if (Object.op_Implicit((Object)(object)value3.Plugin) && value3.Msg != null)
				{
					Dispatch(value3.Plugin, value3.Msg, value, options);
					return false;
				}
				Cache.Remove(methodName);
				break;
			}
		}
		if (!value2 || Cache.Count >= 2048)
		{
			Cache.Clear();
		}
		if ((int)options != 1)
		{
			Logging<ModLib>.Warning("SendMessage invoked without specifying DontRequireReceiver, this may result in errors if target mod is missing.");
		}
		string key = methodName.Substring(0, num);
		string message = methodName.Substring(num + "::".Length);
		if (!Chainloader.PluginInfos.TryGetValue(key, out var value4))
		{
			Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(39, 1, out var shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("Target plugin not installed / missing: ");
				msg.AppendFormatted(methodName);
			}
			Logging<ModLib>.Info(msg);
			if (value2)
			{
				Cache[methodName] = CacheEntry.MissingPlugin();
			}
			return false;
		}
		BaseUnityPlugin instance = value4.Instance;
		if (value2)
		{
			Cache[methodName] = CacheEntry.ForPlugin(instance, message);
		}
		Dispatch(instance, message, value, options);
		return false;
	}

	private static void Dispatch(BaseUnityPlugin plugin, string message, object? value, SendMessageOptions options)
	{
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		if (plugin is IMessageListener messageListener)
		{
			messageListener.ReceiveMessage(message, value);
		}
		else
		{
			((Component)plugin).SendMessage(message, value, options);
		}
	}
}
