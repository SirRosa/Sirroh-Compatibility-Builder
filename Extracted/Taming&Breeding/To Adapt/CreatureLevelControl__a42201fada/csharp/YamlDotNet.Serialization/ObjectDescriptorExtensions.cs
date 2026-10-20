using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization;

internal static class ObjectDescriptorExtensions
{
	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	public static object NonNullValue(this IObjectDescriptor objectDescriptor)
	{
		return objectDescriptor.Value ?? throw new InvalidOperationException("Attempted to use a IObjectDescriptor of type '" + objectDescriptor.Type.FullName + "' whose Value is null at a point whete it is invalid to do so. This may indicate a bug in YamlDotNet.");
	}
}
