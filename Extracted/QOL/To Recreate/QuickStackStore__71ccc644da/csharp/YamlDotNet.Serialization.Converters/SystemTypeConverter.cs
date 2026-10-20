using System;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.Converters;

internal class SystemTypeConverter : IYamlTypeConverter
{
	public bool Accepts(Type type)
	{
		return typeof(Type).IsAssignableFrom(type);
	}

	public object? ReadYaml(IParser parser, Type type, ObjectDeserializer rootDeserializer)
	{
		string value = parser.Consume<Scalar>().Value;
		if (string.IsNullOrEmpty(value))
		{
			return null;
		}
		return Type.GetType(value, throwOnError: true);
	}

	public void WriteYaml(IEmitter emitter, object? value, Type type, ObjectSerializer serializer)
	{
		if (value == null)
		{
			emitter.Emit(new Scalar(AnchorName.Empty, TagName.Empty, "", ScalarStyle.Any, isPlainImplicit: true, isQuotedImplicit: false));
			return;
		}
		Type type2 = (Type)value;
		emitter.Emit(new Scalar(AnchorName.Empty, TagName.Empty, type2.AssemblyQualifiedName, ScalarStyle.Any, isPlainImplicit: true, isQuotedImplicit: false));
	}
}
