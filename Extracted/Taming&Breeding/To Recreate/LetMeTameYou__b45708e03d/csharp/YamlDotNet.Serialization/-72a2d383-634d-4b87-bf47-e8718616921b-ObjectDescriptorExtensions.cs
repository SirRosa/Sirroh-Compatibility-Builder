using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization;

internal static class _003C72a2d383_002D634d_002D4b87_002Dbf47_002De8718616921b_003EObjectDescriptorExtensions
{
	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	public static object NonNullValue(this _003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor objectDescriptor)
	{
		return objectDescriptor.Value ?? throw new InvalidOperationException("Attempted to use a IObjectDescriptor of type '" + objectDescriptor.Type.FullName + "' whose Value is null at a point whete it is invalid to do so. This may indicate a bug in YamlDotNet.");
	}
}
