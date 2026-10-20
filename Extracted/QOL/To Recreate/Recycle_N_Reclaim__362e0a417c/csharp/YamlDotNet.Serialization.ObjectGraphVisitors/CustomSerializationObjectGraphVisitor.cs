using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.ObjectGraphVisitors;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal sealed class CustomSerializationObjectGraphVisitor : ChainedObjectGraphVisitor
{
	private readonly IEnumerable<IYamlTypeConverter> typeConverters;

	private readonly ObjectSerializer nestedObjectSerializer;

	public CustomSerializationObjectGraphVisitor(IObjectGraphVisitor<IEmitter> nextVisitor, IEnumerable<IYamlTypeConverter> typeConverters, ObjectSerializer nestedObjectSerializer)
		: base(nextVisitor)
	{
		IEnumerable<IYamlTypeConverter> enumerable;
		if (typeConverters == null)
		{
			enumerable = Enumerable.Empty<IYamlTypeConverter>();
		}
		else
		{
			IEnumerable<IYamlTypeConverter> enumerable2 = typeConverters.ToList();
			enumerable = enumerable2;
		}
		this.typeConverters = enumerable;
		this.nestedObjectSerializer = nestedObjectSerializer;
	}

	public override bool Enter(IObjectDescriptor value, IEmitter context)
	{
		IYamlTypeConverter yamlTypeConverter = typeConverters.FirstOrDefault([_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)] (IYamlTypeConverter t) => t.Accepts(value.Type));
		if (yamlTypeConverter != null)
		{
			yamlTypeConverter.WriteYaml(context, value.Value, value.Type);
			return false;
		}
		if (value.Value is IYamlConvertible yamlConvertible)
		{
			yamlConvertible.Write(context, nestedObjectSerializer);
			return false;
		}
		if (value.Value is IYamlSerializable yamlSerializable)
		{
			yamlSerializable.WriteYaml(context);
			return false;
		}
		return base.Enter(value, context);
	}
}
