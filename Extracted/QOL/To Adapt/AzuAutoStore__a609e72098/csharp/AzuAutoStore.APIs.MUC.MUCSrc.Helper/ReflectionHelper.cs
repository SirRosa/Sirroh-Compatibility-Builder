using System;
using System.Reflection;
using System.Runtime.CompilerServices;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Helper;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
public static class ReflectionHelper
{
	private const BindingFlags allFlags = (BindingFlags)(-1);

	public static bool IsType(this object target, string name)
	{
		return target.GetType().Name == name;
	}

	public static bool HasField(this object target, string name)
	{
		return target.GetType().GetField(name, (BindingFlags)(-1)) != null;
	}

	public static T GetField<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)] T>(this object target, string name)
	{
		return (T)(target.GetType().GetField(name, (BindingFlags)(-1))?.GetValue(target));
	}

	public static T InvokeMethod<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)] T>(this object target, string name, params object[] parameter)
	{
		parameter = ((parameter.Length == 0) ? null : parameter);
		return (T)(target.GetType().GetMethod(name, (BindingFlags)(-1))?.Invoke(target, parameter));
	}

	public static T InvokeStaticMethod<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)] T>(string type, string name, params object[] parameter)
	{
		parameter = ((parameter.Length == 0) ? null : parameter);
		return (T)(Type.GetType(type)?.GetMethod(name, (BindingFlags)(-1))?.Invoke(null, parameter));
	}
}
