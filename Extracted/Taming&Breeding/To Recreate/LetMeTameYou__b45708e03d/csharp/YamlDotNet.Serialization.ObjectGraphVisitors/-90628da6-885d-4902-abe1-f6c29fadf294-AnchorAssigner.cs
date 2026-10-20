using System;
using System.Collections.Generic;
using System.Globalization;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.ObjectGraphVisitors;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal sealed class _003C90628da6_002D885d_002D4902_002Dabe1_002Df6c29fadf294_003EAnchorAssigner(IEnumerable<_003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter> typeConverters) : _003C6916c622_002Da071_002D4e39_002D981d_002Db4be5e78901a_003EPreProcessingPhaseObjectGraphVisitorSkeleton(typeConverters), _003C6a5ce0be_002D11fc_002D48e2_002D8c09_002D77e49db3675d_003EIAliasProvider
{
	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)]
	private class AnchorAssignment
	{
		public _003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName Anchor;
	}

	private readonly Dictionary<object, AnchorAssignment> assignments = new Dictionary<object, AnchorAssignment>();

	private uint nextId;

	protected override bool Enter(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor value, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
		if (value.Value != null && assignments.TryGetValue(value.Value, out var value2))
		{
			if (value2.Anchor.IsEmpty)
			{
				value2.Anchor = new _003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName("o" + nextId.ToString(CultureInfo.InvariantCulture));
				nextId++;
			}
			return false;
		}
		return true;
	}

	protected override bool EnterMapping(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor key, _003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor value, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
		return true;
	}

	protected override bool EnterMapping(_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor key, _003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor value, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
		return true;
	}

	protected override void VisitScalar(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor scalar, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
	}

	protected override void VisitMappingStart(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor mapping, Type keyType, Type valueType, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
		VisitObject(mapping);
	}

	protected override void VisitMappingEnd(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor mapping, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
	}

	protected override void VisitSequenceStart(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor sequence, Type elementType, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
		VisitObject(sequence);
	}

	protected override void VisitSequenceEnd(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor sequence, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
	}

	private void VisitObject(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor value)
	{
		if (value.Value != null)
		{
			assignments.Add(value.Value, new AnchorAssignment());
		}
	}

	_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName _003C6a5ce0be_002D11fc_002D48e2_002D8c09_002D77e49db3675d_003EIAliasProvider.GetAlias(object target)
	{
		if (target != null && assignments.TryGetValue(target, out var value))
		{
			return value.Anchor;
		}
		return _003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName.Empty;
	}
}
