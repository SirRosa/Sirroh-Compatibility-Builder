using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.ObjectGraphVisitors;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003Cb130d4cf_002Dce8d_002D4e06_002D9e86_002D8ee9f1233ae9_003EAnchorAssigningObjectGraphVisitor : _003Ce00eb3a5_002D8753_002D45a9_002Daab4_002D90b4dd694c6d_003EChainedObjectGraphVisitor
{
	private readonly _003Ca359f02a_002D4850_002D48f6_002Da961_002Dc904bad904ab_003EIEventEmitter eventEmitter;

	private readonly _003C6a5ce0be_002D11fc_002D48e2_002D8c09_002D77e49db3675d_003EIAliasProvider aliasProvider;

	private readonly HashSet<_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName> emittedAliases = new HashSet<_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName>();

	public _003Cb130d4cf_002Dce8d_002D4e06_002D9e86_002D8ee9f1233ae9_003EAnchorAssigningObjectGraphVisitor(_003Cd0224a9c_002Da50e_002D4b39_002D9113_002Dc2af3da8da9e_003EIObjectGraphVisitor<_003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter> nextVisitor, _003Ca359f02a_002D4850_002D48f6_002Da961_002Dc904bad904ab_003EIEventEmitter eventEmitter, _003C6a5ce0be_002D11fc_002D48e2_002D8c09_002D77e49db3675d_003EIAliasProvider aliasProvider)
		: base(nextVisitor)
	{
		this.eventEmitter = eventEmitter;
		this.aliasProvider = aliasProvider;
	}

	public override bool Enter([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] _003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor propertyDescriptor, _003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor value, _003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter context, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
		if (value.Value != null)
		{
			_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName alias = aliasProvider.GetAlias(value.Value);
			if (!alias.IsEmpty && !emittedAliases.Add(alias))
			{
				_003C695b7599_002D579b_002D401a_002Db6a8_002De16fca8b4542_003EAliasEventInfo obj = new _003C695b7599_002D579b_002D401a_002Db6a8_002De16fca8b4542_003EAliasEventInfo(value, alias);
				eventEmitter.Emit(obj, context);
				return obj.NeedsExpansion;
			}
		}
		return base.Enter(propertyDescriptor, value, context, serializer);
	}

	public override void VisitMappingStart(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor mapping, Type keyType, Type valueType, _003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter context, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
		_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName alias = aliasProvider.GetAlias(mapping.NonNullValue());
		eventEmitter.Emit(new _003Cf86b4489_002D7ae4_002D48a5_002Dbf69_002D820dcd79c453_003EMappingStartEventInfo(mapping)
		{
			Anchor = alias
		}, context);
	}

	public override void VisitSequenceStart(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor sequence, Type elementType, _003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter context, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
		_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName alias = aliasProvider.GetAlias(sequence.NonNullValue());
		eventEmitter.Emit(new _003C36d39d35_002D67a3_002D41cc_002Da600_002De72a94055f2e_003ESequenceStartEventInfo(sequence)
		{
			Anchor = alias
		}, context);
	}

	public override void VisitScalar(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor scalar, _003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter context, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
		_003C770f57fd_002Dbae1_002D4ccf_002D8ccf_002D88c849ae3ab1_003EScalarEventInfo obj = new _003C770f57fd_002Dbae1_002D4ccf_002D8ccf_002D88c849ae3ab1_003EScalarEventInfo(scalar);
		if (scalar.Value != null)
		{
			obj.Anchor = aliasProvider.GetAlias(scalar.Value);
		}
		eventEmitter.Emit(obj, context);
	}
}
