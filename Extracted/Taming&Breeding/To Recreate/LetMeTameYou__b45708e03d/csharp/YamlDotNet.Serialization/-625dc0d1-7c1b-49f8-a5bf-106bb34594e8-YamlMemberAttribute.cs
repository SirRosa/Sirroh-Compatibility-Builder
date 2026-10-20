using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

[AttributeUsage(AttributeTargets.Property | AttributeTargets.Field, AllowMultiple = false)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C625dc0d1_002D7c1b_002D49f8_002Da5bf_002D106bb34594e8_003EYamlMemberAttribute : Attribute
{
	private _003Caf16b6a9_002D04e6_002D4f66_002Dbcda_002Daf3138fe7971_003EDefaultValuesHandling? defaultValuesHandling;

	public string Description { get; set; }

	public Type SerializeAs { get; set; }

	public int Order { get; set; }

	public string Alias { get; set; }

	public bool ApplyNamingConventions { get; set; }

	public _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle ScalarStyle { get; set; }

	public _003Caf16b6a9_002D04e6_002D4f66_002Dbcda_002Daf3138fe7971_003EDefaultValuesHandling DefaultValuesHandling
	{
		get
		{
			return defaultValuesHandling.GetValueOrDefault();
		}
		set
		{
			defaultValuesHandling = value;
		}
	}

	public bool IsDefaultValuesHandlingSpecified => defaultValuesHandling.HasValue;

	public _003C625dc0d1_002D7c1b_002D49f8_002Da5bf_002D106bb34594e8_003EYamlMemberAttribute()
	{
		ScalarStyle = _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Any;
		ApplyNamingConventions = true;
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	public _003C625dc0d1_002D7c1b_002D49f8_002Da5bf_002D106bb34594e8_003EYamlMemberAttribute(Type serializeAs)
		: this()
	{
		SerializeAs = serializeAs ?? throw new ArgumentNullException("serializeAs");
	}
}
