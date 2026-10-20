using System;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.Converters;

internal abstract class ScalarConverterBase<T> : IYamlTypeConverter
{
	public bool Accepts(Type type)
	{
		if (!(type == typeof(T)))
		{
			return Nullable.GetUnderlyingType(type) == typeof(T);
		}
		return true;
	}

	public abstract object ReadYaml(IParser parser, Type type, ObjectDeserializer rootDeserializer);

	public abstract void WriteYaml(IEmitter emitter, object? value, Type type, ObjectSerializer serializer);

	protected static string ConsumeScalarValue(IParser parser)
	{
		return parser.Consume<Scalar>().Value;
	}

	protected static void EmitScalar(IEmitter emitter, string formatted, ScalarStyle style)
	{
		emitter.Emit(new Scalar(AnchorName.Empty, TagName.Empty, formatted, style, isPlainImplicit: true, isQuotedImplicit: false));
	}
}
