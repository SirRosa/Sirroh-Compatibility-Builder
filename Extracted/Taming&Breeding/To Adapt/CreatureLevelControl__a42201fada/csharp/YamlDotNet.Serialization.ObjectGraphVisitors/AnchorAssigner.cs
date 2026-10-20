using System;
using System.Collections.Generic;
using System.Globalization;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.ObjectGraphVisitors;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal sealed class AnchorAssigner(IEnumerable<IYamlTypeConverter> typeConverters) : PreProcessingPhaseObjectGraphVisitorSkeleton(typeConverters), IAliasProvider
{
	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(0)]
	private class AnchorAssignment
	{
		public AnchorName Anchor;
	}

	private readonly IDictionary<object, AnchorAssignment> assignments = new Dictionary<object, AnchorAssignment>();

	private uint nextId;

	protected override bool Enter(IObjectDescriptor value)
	{
		if (value.Value != null && assignments.TryGetValue(value.Value, out var value2))
		{
			if (value2.Anchor.IsEmpty)
			{
				value2.Anchor = new AnchorName("o" + nextId.ToString(CultureInfo.InvariantCulture));
				nextId++;
			}
			return false;
		}
		return true;
	}

	protected override bool EnterMapping(IObjectDescriptor key, IObjectDescriptor value)
	{
		return true;
	}

	protected override bool EnterMapping(IPropertyDescriptor key, IObjectDescriptor value)
	{
		return true;
	}

	protected override void VisitScalar(IObjectDescriptor scalar)
	{
	}

	protected override void VisitMappingStart(IObjectDescriptor mapping, Type keyType, Type valueType)
	{
		VisitObject(mapping);
	}

	protected override void VisitMappingEnd(IObjectDescriptor mapping)
	{
	}

	protected override void VisitSequenceStart(IObjectDescriptor sequence, Type elementType)
	{
		VisitObject(sequence);
	}

	protected override void VisitSequenceEnd(IObjectDescriptor sequence)
	{
	}

	private void VisitObject(IObjectDescriptor value)
	{
		if (value.Value != null)
		{
			assignments.Add(value.Value, new AnchorAssignment());
		}
	}

	AnchorName IAliasProvider.GetAlias(object target)
	{
		if (target != null && assignments.TryGetValue(target, out var value))
		{
			return value.Anchor;
		}
		return AnchorName.Empty;
	}
}
