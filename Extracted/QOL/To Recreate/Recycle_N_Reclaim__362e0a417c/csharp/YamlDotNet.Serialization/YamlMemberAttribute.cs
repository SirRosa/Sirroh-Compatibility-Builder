using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[AttributeUsage(AttributeTargets.Property | AttributeTargets.Field, AllowMultiple = false)]
internal sealed class YamlMemberAttribute : Attribute
{
	private DefaultValuesHandling? defaultValuesHandling;

	public string Description { get; set; }

	public Type SerializeAs { get; set; }

	public int Order { get; set; }

	public string Alias { get; set; }

	public bool ApplyNamingConventions { get; set; }

	public ScalarStyle ScalarStyle { get; set; }

	public DefaultValuesHandling DefaultValuesHandling
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

	public YamlMemberAttribute()
	{
		ScalarStyle = ScalarStyle.Any;
		ApplyNamingConventions = true;
	}

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	public YamlMemberAttribute(Type serializeAs)
		: this()
	{
		SerializeAs = serializeAs ?? throw new ArgumentNullException("serializeAs");
	}
}
