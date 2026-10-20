using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class PropertyDescriptor : IPropertyDescriptor
{
	private readonly IPropertyDescriptor baseDescriptor;

	public string Name { get; set; }

	public Type Type => baseDescriptor.Type;

	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	public Type TypeOverride
	{
		[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
		get
		{
			return baseDescriptor.TypeOverride;
		}
		[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
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

	public void Write(object target, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] object value)
	{
		baseDescriptor.Write(target, value);
	}

	public T GetCustomAttribute<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] T>() where T : Attribute
	{
		return baseDescriptor.GetCustomAttribute<T>();
	}

	public IObjectDescriptor Read(object target)
	{
		return baseDescriptor.Read(target);
	}
}
