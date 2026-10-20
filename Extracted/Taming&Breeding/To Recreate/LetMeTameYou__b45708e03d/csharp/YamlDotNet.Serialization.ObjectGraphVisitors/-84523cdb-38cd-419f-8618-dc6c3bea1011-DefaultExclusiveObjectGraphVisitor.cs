using System;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.ObjectGraphVisitors;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C84523cdb_002D38cd_002D419f_002D8618_002Ddc6c3bea1011_003EDefaultExclusiveObjectGraphVisitor : _003Ce00eb3a5_002D8753_002D45a9_002Daab4_002D90b4dd694c6d_003EChainedObjectGraphVisitor
{
	public _003C84523cdb_002D38cd_002D419f_002D8618_002Ddc6c3bea1011_003EDefaultExclusiveObjectGraphVisitor(_003Cd0224a9c_002Da50e_002D4b39_002D9113_002Dc2af3da8da9e_003EIObjectGraphVisitor<_003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter> nextVisitor)
		: base(nextVisitor)
	{
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	private static object GetDefault(Type type)
	{
		if (!_003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.IsValueType(type))
		{
			return null;
		}
		return Activator.CreateInstance(type);
	}

	public override bool EnterMapping(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor key, _003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor value, _003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter context, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
		if (!object.Equals(value.Value, GetDefault(value.Type)))
		{
			return base.EnterMapping(key, value, context, serializer);
		}
		return false;
	}

	public override bool EnterMapping(_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor key, _003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor value, _003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter context, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
		DefaultValueAttribute customAttribute = key.GetCustomAttribute<DefaultValueAttribute>();
		object objB = ((customAttribute != null) ? customAttribute.Value : GetDefault(key.Type));
		if (!object.Equals(value.Value, objB))
		{
			return base.EnterMapping(key, value, context, serializer);
		}
		return false;
	}
}
