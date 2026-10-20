using System;
using System.Collections.Generic;
using System.Linq;

namespace YamlDotNet.Serialization.TypeInspectors;

internal sealed class CompositeTypeInspector : TypeInspectorSkeleton
{
	private readonly IEnumerable<ITypeInspector> typeInspectors;

	public CompositeTypeInspector(params ITypeInspector[] typeInspectors)
		: this((IEnumerable<ITypeInspector>)typeInspectors)
	{
	}

	public CompositeTypeInspector(IEnumerable<ITypeInspector> typeInspectors)
	{
		this.typeInspectors = typeInspectors?.ToList() ?? throw new ArgumentNullException("typeInspectors");
	}

	public override IEnumerable<IPropertyDescriptor> GetProperties(Type type, object? container)
	{
		return typeInspectors.SelectMany((ITypeInspector i) => i.GetProperties(type, container));
	}
}
