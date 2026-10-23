using System;
using System.Runtime.CompilerServices;

namespace AzuAutoStore.APIs.Compatibility;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public class WILCompat
{
	protected static T InvokeMethod<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)] T>(Type type, object instance, string methodName, object[] parameter)
	{
		return (T)(type.GetMethod(methodName)?.Invoke(instance, parameter));
	}

	[return: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	protected static T GetField<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)] T>(Type type, object instance, string fieldName)
	{
		return (T)(type.GetField(fieldName)?.GetValue(instance));
	}
}
