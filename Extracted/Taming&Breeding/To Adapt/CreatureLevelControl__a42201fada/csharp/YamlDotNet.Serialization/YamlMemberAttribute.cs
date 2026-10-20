using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

[AttributeUsage(AttributeTargets.Property | AttributeTargets.Field, AllowMultiple = false)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
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

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	public YamlMemberAttribute(Type serializeAs)
		: this()
	{
		SerializeAs = serializeAs ?? throw new ArgumentNullException("serializeAs");
	}
}
