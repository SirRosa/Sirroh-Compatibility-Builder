using System;
using System.Collections;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.ObjectFactories;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal abstract class StaticObjectFactory : _003C86c651de_002D54a3_002D4b26_002D8421_002D77d942e1f3bb_003EIObjectFactory
{
	public abstract object Create(Type type);

	public abstract Array CreateArray(Type type, int count);

	public abstract bool IsDictionary(Type type);

	public abstract bool IsArray(Type type);

	public abstract bool IsList(Type type);

	public abstract Type GetKeyType(Type type);

	public abstract Type GetValueType(Type type);

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public virtual object CreatePrimitive(Type type)
	{
		return Type.GetTypeCode(type) switch
		{
			TypeCode.Boolean => (object)false, 
			TypeCode.Byte => (byte)0, 
			TypeCode.Int16 => (short)0, 
			TypeCode.Int32 => 0, 
			TypeCode.Int64 => 0L, 
			TypeCode.SByte => (sbyte)0, 
			TypeCode.UInt16 => (ushort)0, 
			TypeCode.UInt32 => 0u, 
			TypeCode.UInt64 => 0uL, 
			TypeCode.Single => 0f, 
			TypeCode.Double => 0.0, 
			TypeCode.Decimal => 0m, 
			TypeCode.Char => '\0', 
			TypeCode.DateTime => default(DateTime), 
			_ => null, 
		};
	}

	public bool GetDictionary(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor descriptor, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] out IDictionary dictionary, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 2, 1 })] out Type[] genericArguments)
	{
		dictionary = null;
		genericArguments = null;
		return false;
	}

	public abstract void ExecuteOnDeserializing(object value);

	public abstract void ExecuteOnDeserialized(object value);

	public abstract void ExecuteOnSerializing(object value);

	public abstract void ExecuteOnSerialized(object value);
}
