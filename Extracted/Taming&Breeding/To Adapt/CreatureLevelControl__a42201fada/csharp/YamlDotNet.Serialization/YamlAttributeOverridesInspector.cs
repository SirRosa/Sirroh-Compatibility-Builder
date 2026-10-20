using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Serialization.TypeInspectors;

namespace YamlDotNet.Serialization;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class YamlAttributeOverridesInspector : TypeInspectorSkeleton
{
	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
	public sealed class OverridePropertyDescriptor : IPropertyDescriptor
	{
		private readonly IPropertyDescriptor baseDescriptor;

		private readonly YamlAttributeOverrides overrides;

		private readonly Type classType;

		public string Name => baseDescriptor.Name;

		public bool CanWrite => baseDescriptor.CanWrite;

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

		public int Order
		{
			get
			{
				return baseDescriptor.Order;
			}
			set
			{
				baseDescriptor.Order = value;
			}
		}

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

		public OverridePropertyDescriptor(IPropertyDescriptor baseDescriptor, YamlAttributeOverrides overrides, Type classType)
		{
			this.baseDescriptor = baseDescriptor;
			this.overrides = overrides;
			this.classType = classType;
		}

		public void Write(object target, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] object value)
		{
			baseDescriptor.Write(target, value);
		}

		public T GetCustomAttribute<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] T>() where T : Attribute
		{
			return overrides.GetAttribute<T>(classType, Name) ?? baseDescriptor.GetCustomAttribute<T>();
		}

		public IObjectDescriptor Read(object target)
		{
			return baseDescriptor.Read(target);
		}
	}

	private readonly ITypeInspector innerTypeDescriptor;

	private readonly YamlAttributeOverrides overrides;

	public YamlAttributeOverridesInspector(ITypeInspector innerTypeDescriptor, YamlAttributeOverrides overrides)
	{
		this.innerTypeDescriptor = innerTypeDescriptor;
		this.overrides = overrides;
	}

	public override IEnumerable<IPropertyDescriptor> GetProperties(Type type, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] object container)
	{
		IEnumerable<IPropertyDescriptor> enumerable = innerTypeDescriptor.GetProperties(type, container);
		if (overrides != null)
		{
			enumerable = enumerable.Select((Func<IPropertyDescriptor, IPropertyDescriptor>)([_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(0)] (IPropertyDescriptor p) => new OverridePropertyDescriptor(p, overrides, type)));
		}
		return enumerable;
	}
}
