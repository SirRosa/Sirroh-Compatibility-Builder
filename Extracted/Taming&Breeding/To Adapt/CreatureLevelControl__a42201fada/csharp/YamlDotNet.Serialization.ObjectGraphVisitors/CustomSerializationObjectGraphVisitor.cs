using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.ObjectGraphVisitors;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
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
		IYamlTypeConverter yamlTypeConverter = typeConverters.FirstOrDefault([_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(0)] (IYamlTypeConverter t) => t.Accepts(value.Type));
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
