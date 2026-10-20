using System;
using System.Collections.Generic;
using System.Reflection;
using JetBrains.Annotations;

namespace EpicLootAPI;

internal class Method
{
	private const string Namespace = "EpicLoot";

	private const string ClassName = "API";

	private const string Assembly = "EpicLoot";

	private const string API_LOCATION = "EpicLoot.API, EpicLoot";

	private static readonly Dictionary<string, Type> CachedTypes = new Dictionary<string, Type>();

	private readonly MethodInfo info;

	public object[] Invoke(params object[] args)
	{
		object obj = info?.Invoke(null, args);
		object[] array = new object[args.Length + 1];
		array[0] = obj;
		Array.Copy(args, 0, array, 1, args.Length);
		return array;
	}

	public Method(string typeNameWithAssembly, string methodName, BindingFlags bindingFlags = BindingFlags.Static | BindingFlags.Public)
	{
		if (!TryGetType(typeNameWithAssembly, out Type type))
		{
			return;
		}
		if (type == null)
		{
			EpicLoot.logger.LogWarning("Type resolution returned null for: '" + typeNameWithAssembly + "'");
			return;
		}
		info = type.GetMethod(methodName, bindingFlags);
		if (info == null)
		{
			EpicLoot.logger.LogWarning("Failed to find public static method '" + methodName + "' in type '" + type.FullName + "'. Verify the method name is correct, the method exists, and it is marked as public static. ");
		}
	}

	public Method(string methodName, BindingFlags bindingFlags = BindingFlags.Static | BindingFlags.Public)
		: this("EpicLoot.API, EpicLoot", methodName, bindingFlags)
	{
	}

	private static bool TryGetType(string typeNameWithAssembly, out Type type)
	{
		if (CachedTypes.TryGetValue(typeNameWithAssembly, out type))
		{
			return true;
		}
		Type type2 = Type.GetType(typeNameWithAssembly);
		if ((object)type2 == null)
		{
			EpicLoot.logger.LogWarning("Failed to resolve type: '" + typeNameWithAssembly + "'. Verify the namespace, class name, and assembly name are correct. Ensure the assembly is loaded and accessible.");
			return false;
		}
		type = type2;
		CachedTypes[typeNameWithAssembly] = type2;
		return true;
	}

	public Method(string typeNameWithAssembly, string methodName, params Type[] types)
	{
		if (!TryGetType(typeNameWithAssembly, out Type type))
		{
			return;
		}
		if (type == null)
		{
			EpicLoot.logger.LogWarning("Type resolution returned null for: '" + typeNameWithAssembly + "'");
			return;
		}
		info = type.GetMethod(methodName, types);
		if (info == null)
		{
			EpicLoot.logger.LogWarning("Failed to find public static method '" + methodName + "' in type '" + type.FullName + "'. Verify the method name is correct, the method exists, and it is marked as public static. ");
		}
	}

	public Method(string methodName, params Type[] types)
		: this("EpicLoot.API, EpicLoot", methodName, types)
	{
	}

	[PublicAPI]
	public ParameterInfo[] GetParameters()
	{
		return info?.GetParameters() ?? Array.Empty<ParameterInfo>();
	}

	[PublicAPI]
	public static void ClearCache()
	{
		CachedTypes.Clear();
	}
}
