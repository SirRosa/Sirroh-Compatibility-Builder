using System;
using System.Collections.Generic;
using System.Globalization;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.ObjectGraphVisitors;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal sealed class AnchorAssigner(IEnumerable<IYamlTypeConverter> typeConverters) : PreProcessingPhaseObjectGraphVisitorSkeleton(typeConverters), IAliasProvider
{
	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)]
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
