using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.ObjectGraphVisitors;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal sealed class AnchorAssigningObjectGraphVisitor : ChainedObjectGraphVisitor
{
	private readonly IEventEmitter eventEmitter;

	private readonly IAliasProvider aliasProvider;

	private readonly HashSet<AnchorName> emittedAliases = new HashSet<AnchorName>();

	public AnchorAssigningObjectGraphVisitor(IObjectGraphVisitor<IEmitter> nextVisitor, IEventEmitter eventEmitter, IAliasProvider aliasProvider)
		: base(nextVisitor)
	{
		this.eventEmitter = eventEmitter;
		this.aliasProvider = aliasProvider;
	}

	public override bool Enter(IObjectDescriptor value, IEmitter context)
	{
		if (value.Value != null)
		{
			AnchorName alias = aliasProvider.GetAlias(value.Value);
			if (!alias.IsEmpty && !emittedAliases.Add(alias))
			{
				AliasEventInfo aliasEventInfo = new AliasEventInfo(value, alias);
				eventEmitter.Emit(aliasEventInfo, context);
				return aliasEventInfo.NeedsExpansion;
			}
		}
		return base.Enter(value, context);
	}

	public override void VisitMappingStart(IObjectDescriptor mapping, Type keyType, Type valueType, IEmitter context)
	{
		AnchorName alias = aliasProvider.GetAlias(mapping.NonNullValue());
		eventEmitter.Emit(new MappingStartEventInfo(mapping)
		{
			Anchor = alias
		}, context);
	}

	public override void VisitSequenceStart(IObjectDescriptor sequence, Type elementType, IEmitter context)
	{
		AnchorName alias = aliasProvider.GetAlias(sequence.NonNullValue());
		eventEmitter.Emit(new SequenceStartEventInfo(sequence)
		{
			Anchor = alias
		}, context);
	}

	public override void VisitScalar(IObjectDescriptor scalar, IEmitter context)
	{
		ScalarEventInfo scalarEventInfo = new ScalarEventInfo(scalar);
		if (scalar.Value != null)
		{
			scalarEventInfo.Anchor = aliasProvider.GetAlias(scalar.Value);
		}
		eventEmitter.Emit(scalarEventInfo, context);
	}
}
