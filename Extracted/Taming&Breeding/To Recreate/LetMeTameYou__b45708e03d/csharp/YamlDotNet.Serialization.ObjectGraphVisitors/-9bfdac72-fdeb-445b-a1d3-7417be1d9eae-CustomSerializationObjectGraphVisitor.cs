using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization.ObjectGraphVisitors;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C9bfdac72_002Dfdeb_002D445b_002Da1d3_002D7417be1d9eae_003ECustomSerializationObjectGraphVisitor : _003Ce00eb3a5_002D8753_002D45a9_002Daab4_002D90b4dd694c6d_003EChainedObjectGraphVisitor
{
	private readonly TypeConverterCache typeConverters;

	private readonly _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer nestedObjectSerializer;

	public _003C9bfdac72_002Dfdeb_002D445b_002Da1d3_002D7417be1d9eae_003ECustomSerializationObjectGraphVisitor(_003Cd0224a9c_002Da50e_002D4b39_002D9113_002Dc2af3da8da9e_003EIObjectGraphVisitor<_003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter> nextVisitor, IEnumerable<_003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter> typeConverters, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer nestedObjectSerializer)
		: base(nextVisitor)
	{
		this.typeConverters = new TypeConverterCache(typeConverters);
		this.nestedObjectSerializer = nestedObjectSerializer;
	}

	public override bool Enter([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] _003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor propertyDescriptor, _003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor value, _003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter context, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
		if (propertyDescriptor?.ConverterType != null)
		{
			_003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter converterByType = typeConverters.GetConverterByType(propertyDescriptor.ConverterType);
			converterByType.WriteYaml(context, value.Value, value.Type, serializer);
			return false;
		}
		if (typeConverters.TryGetConverterForType(value.Type, out var typeConverter))
		{
			typeConverter.WriteYaml(context, value.Value, value.Type, serializer);
			return false;
		}
		if (value.Value is _003Cfb7b8978_002D273f_002D4537_002Dab42_002Dfae47606174a_003EIYamlConvertible obj)
		{
			obj.Write(context, nestedObjectSerializer);
			return false;
		}
		if (value.Value is _003Ce38b0a79_002D37d3_002D4ef7_002D9ea1_002D69439e91296b_003EIYamlSerializable obj2)
		{
			obj2.WriteYaml(context);
			return false;
		}
		return base.Enter(propertyDescriptor, value, context, serializer);
	}
}
