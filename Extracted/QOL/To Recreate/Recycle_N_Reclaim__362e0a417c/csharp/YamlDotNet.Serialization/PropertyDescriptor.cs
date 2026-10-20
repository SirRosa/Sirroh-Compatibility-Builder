using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal sealed class PropertyDescriptor : IPropertyDescriptor
{
	private readonly IPropertyDescriptor baseDescriptor;

	public string Name { get; set; }

	public Type Type => baseDescriptor.Type;

	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	public Type TypeOverride
	{
		[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
		get
		{
			return baseDescriptor.TypeOverride;
		}
		[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
		set
		{
			baseDescriptor.TypeOverride = value;
		}
	}

	public int Order { get; set; }

	public ScalarStyle ScalarStyle
	{
		get
		{
			return baseDescriptor.ScalarStyle;
		}
		set
		{
			baseDescriptor.ScalarStyle = value;
		}
	}

	public bool CanWrite => baseDescriptor.CanWrite;

	public PropertyDescriptor(IPropertyDescriptor baseDescriptor)
	{
		this.baseDescriptor = baseDescriptor;
		Name = baseDescriptor.Name;
	}

	public void Write(object target, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object value)
	{
		baseDescriptor.Write(target, value);
	}

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)]
	[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	public T GetCustomAttribute<T>() where T : Attribute
	{
		return baseDescriptor.GetCustomAttribute<T>();
	}

	public IObjectDescriptor Read(object target)
	{
		return baseDescriptor.Read(target);
	}
}
