using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.TypeResolvers;

internal class _003C534a538c_002D0b1c_002D4b73_002Db909_002D57190509c5f3_003EStaticTypeResolver : _003C9a18e817_002D7f53_002D45f5_002D8cc8_002D78dd60e37121_003EITypeResolver
{
	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	public virtual Type Resolve(Type staticType, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object actualValue)
	{
		if (actualValue != null)
		{
			if (actualValue.GetType().IsEnum)
			{
				return staticType;
			}
			switch (_003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.GetTypeCode(actualValue.GetType()))
			{
			case TypeCode.Boolean:
				return typeof(bool);
			case TypeCode.Char:
				return typeof(char);
			case TypeCode.SByte:
				return typeof(sbyte);
			case TypeCode.Byte:
				return typeof(byte);
			case TypeCode.Int16:
				return typeof(short);
			case TypeCode.UInt16:
				return typeof(ushort);
			case TypeCode.Int32:
				return typeof(int);
			case TypeCode.UInt32:
				return typeof(uint);
			case TypeCode.Int64:
				return typeof(long);
			case TypeCode.UInt64:
				return typeof(ulong);
			case TypeCode.Single:
				return typeof(float);
			case TypeCode.Double:
				return typeof(double);
			case TypeCode.Decimal:
				return typeof(decimal);
			case TypeCode.String:
				return typeof(string);
			case TypeCode.DateTime:
				return typeof(DateTime);
			}
		}
		return staticType;
	}
}
