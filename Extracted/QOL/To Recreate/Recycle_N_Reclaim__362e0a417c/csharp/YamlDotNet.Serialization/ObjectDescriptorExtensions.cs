using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization;

internal static class ObjectDescriptorExtensions
{
	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	public static object NonNullValue(this IObjectDescriptor objectDescriptor)
	{
		return objectDescriptor.Value ?? throw new InvalidOperationException("Attempted to use a IObjectDescriptor of type '" + objectDescriptor.Type.FullName + "' whose Value is null at a point whete it is invalid to do so. This may indicate a bug in YamlDotNet.");
	}
}
