using System;
using System.Collections;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.ObjectFactories;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal abstract class StaticObjectFactory : IObjectFactory
{
	public abstract object Create(Type type);

	public abstract Array CreateArray(Type type, int count);

	public abstract bool IsDictionary(Type type);

	public abstract bool IsArray(Type type);

	public abstract bool IsList(Type type);

	public abstract Type GetKeyType(Type type);

	public abstract Type GetValueType(Type type);

	[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
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

	public bool GetDictionary(IObjectDescriptor descriptor, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] out IDictionary dictionary, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 2, 1 })] out Type[] genericArguments)
	{
		dictionary = null;
		genericArguments = null;
		return false;
	}
}
