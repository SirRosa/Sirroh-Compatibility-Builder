using System;

namespace YamlDotNet.Serialization.Utilities;

internal class ReflectionTypeConverter : ITypeConverter
{
	public object? ChangeType(object? value, Type expectedType)
	{
		return TypeConverter.ChangeType(value, expectedType);
	}
}
