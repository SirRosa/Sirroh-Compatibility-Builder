using System;
using System.Linq;
using System.Reflection;
using HarmonyLib;

namespace Zen.Compatibility;

internal static class ConfigurationManager
{
	private static bool _notFound;

	private static Func<bool>? _displayingWindow;

	private const string AssemblyName = "ConfigurationManager";

	private const string TypeName = "ConfigurationManager.ConfigurationManager";

	private const string MethodName = "DisplayingWindow";

	private const string InstanceFieldName = "instance";

	public static bool IsDisplayingWindow()
	{
		if (_notFound)
		{
			return false;
		}
		if (_displayingWindow != null)
		{
			return _displayingWindow();
		}
		try
		{
			Type type = AppDomain.CurrentDomain.GetAssemblies().FirstOrDefault((Assembly a) => a.GetName().Name == "ConfigurationManager")?.GetType("ConfigurationManager.ConfigurationManager");
			if (type == null)
			{
				_notFound = true;
				return false;
			}
			_notFound = !AccessTools.GetFieldNames(type).Contains("instance");
			if (_notFound)
			{
				return false;
			}
			object value = AccessTools.Field(type, "instance").GetValue(null);
			MethodInfo methodInfo = AccessTools.Property(type, "DisplayingWindow")?.GetGetMethod(nonPublic: true);
			if (methodInfo == null || value == null)
			{
				_notFound = true;
				return false;
			}
			_displayingWindow = (Func<bool>)methodInfo.CreateDelegate(typeof(Func<bool>), value);
			return _displayingWindow();
		}
		catch
		{
			_notFound = true;
			return false;
		}
	}
}
