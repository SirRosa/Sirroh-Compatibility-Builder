using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Serialization.TypeInspectors;

namespace YamlDotNet.Serialization;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal sealed class YamlAttributeOverridesInspector : TypeInspectorSkeleton
{
	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
	public sealed class OverridePropertyDescriptor : IPropertyDescriptor
	{
		private readonly IPropertyDescriptor baseDescriptor;

		private readonly YamlAttributeOverrides overrides;

		private readonly Type classType;

		public string Name => baseDescriptor.Name;

		public bool CanWrite => baseDescriptor.CanWrite;

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

		public void Write(object target, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object value)
		{
			baseDescriptor.Write(target, value);
		}

		[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)]
		[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
		public T GetCustomAttribute<T>() where T : Attribute
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

	public override IEnumerable<IPropertyDescriptor> GetProperties(Type type, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object container)
	{
		IEnumerable<IPropertyDescriptor> enumerable = innerTypeDescriptor.GetProperties(type, container);
		if (overrides != null)
		{
			enumerable = enumerable.Select((Func<IPropertyDescriptor, IPropertyDescriptor>)([_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)] (IPropertyDescriptor p) => new OverridePropertyDescriptor(p, overrides, type)));
		}
		return enumerable;
	}
}
