using System;
using System.Collections;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.ObjectGraphVisitors;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C1044ec24_002Df872_002D425b_002Db9ca_002D54756225f7f6_003EDefaultValuesObjectGraphVisitor : _003Ce00eb3a5_002D8753_002D45a9_002Daab4_002D90b4dd694c6d_003EChainedObjectGraphVisitor
{
	private readonly _003Caf16b6a9_002D04e6_002D4f66_002Dbcda_002Daf3138fe7971_003EDefaultValuesHandling handling;

	private readonly _003C86c651de_002D54a3_002D4b26_002D8421_002D77d942e1f3bb_003EIObjectFactory factory;

	public _003C1044ec24_002Df872_002D425b_002Db9ca_002D54756225f7f6_003EDefaultValuesObjectGraphVisitor(_003Caf16b6a9_002D04e6_002D4f66_002Dbcda_002Daf3138fe7971_003EDefaultValuesHandling handling, _003Cd0224a9c_002Da50e_002D4b39_002D9113_002Dc2af3da8da9e_003EIObjectGraphVisitor<_003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter> nextVisitor, _003C86c651de_002D54a3_002D4b26_002D8421_002D77d942e1f3bb_003EIObjectFactory factory)
		: base(nextVisitor)
	{
		this.handling = handling;
		this.factory = factory;
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	private object GetDefault(Type type)
	{
		return factory.CreatePrimitive(type);
	}

	public override bool EnterMapping(_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor key, _003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor value, _003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter context, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
		_003Caf16b6a9_002D04e6_002D4f66_002Dbcda_002Daf3138fe7971_003EDefaultValuesHandling defaultValuesHandling = handling;
		_003C625dc0d1_002D7c1b_002D49f8_002Da5bf_002D106bb34594e8_003EYamlMemberAttribute customAttribute = key.GetCustomAttribute<_003C625dc0d1_002D7c1b_002D49f8_002Da5bf_002D106bb34594e8_003EYamlMemberAttribute>();
		if (customAttribute != null && customAttribute.IsDefaultValuesHandlingSpecified)
		{
			defaultValuesHandling = customAttribute.DefaultValuesHandling;
		}
		if ((defaultValuesHandling & _003Caf16b6a9_002D04e6_002D4f66_002Dbcda_002Daf3138fe7971_003EDefaultValuesHandling.OmitNull) != 0 && value.Value == null)
		{
			return false;
		}
		if ((defaultValuesHandling & _003Caf16b6a9_002D04e6_002D4f66_002Dbcda_002Daf3138fe7971_003EDefaultValuesHandling.OmitEmptyCollections) != 0 && value.Value is IEnumerable enumerable)
		{
			IEnumerator enumerator = enumerable.GetEnumerator();
			bool flag = enumerator.MoveNext();
			if (enumerator is IDisposable disposable)
			{
				disposable.Dispose();
			}
			if (!flag)
			{
				return false;
			}
		}
		if ((defaultValuesHandling & _003Caf16b6a9_002D04e6_002D4f66_002Dbcda_002Daf3138fe7971_003EDefaultValuesHandling.OmitDefaults) != 0)
		{
			object objB = key.GetCustomAttribute<DefaultValueAttribute>()?.Value ?? GetDefault(key.Type);
			if (object.Equals(value.Value, objB))
			{
				return false;
			}
		}
		return base.EnterMapping(key, value, context, serializer);
	}
}
