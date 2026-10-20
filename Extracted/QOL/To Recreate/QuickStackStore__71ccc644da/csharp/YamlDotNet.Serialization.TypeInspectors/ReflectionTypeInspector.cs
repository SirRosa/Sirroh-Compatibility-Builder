using System;
using System.Reflection;

namespace YamlDotNet.Serialization.TypeInspectors;

internal abstract class ReflectionTypeInspector : TypeInspectorSkeleton
{
	public override string GetEnumName(Type enumType, string name)
	{
		return name;
	}

	public override string GetEnumValue(object enumValue)
	{
		if (enumValue == null)
		{
			return string.Empty;
		}
		return enumValue.ToString();
	}

	public override bool HasParseMethod(Type type)
	{
		return type.GetMethod("Parse", BindingFlags.Static | BindingFlags.Public, null, new Type[1] { typeof(string) }, null) != null;
	}

	public override object? Parse(string value, Type expectedType)
	{
		MethodInfo method = expectedType.GetMethod("Parse", new Type[1] { typeof(string) });
		if (method == null)
		{
			throw new InvalidOperationException("Type '" + expectedType.FullName + "' does not have a static Parse method.");
		}
		return method.Invoke(null, new object[1] { value });
	}
}
