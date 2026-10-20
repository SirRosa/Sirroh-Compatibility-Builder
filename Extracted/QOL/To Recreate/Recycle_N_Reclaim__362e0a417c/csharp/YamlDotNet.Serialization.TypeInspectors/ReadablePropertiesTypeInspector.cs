using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.TypeInspectors;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal sealed class ReadablePropertiesTypeInspector : TypeInspectorSkeleton
{
	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
	private sealed class ReflectionPropertyDescriptor : IPropertyDescriptor
	{
		private readonly PropertyInfo propertyInfo;

		private readonly ITypeResolver typeResolver;

		public string Name => propertyInfo.Name;

		public Type Type => propertyInfo.PropertyType;

		[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
		[field: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
		public Type TypeOverride
		{
			[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
			get;
			[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
			set;
		}

		public int Order { get; set; }

		public bool CanWrite => propertyInfo.CanWrite;

		public ScalarStyle ScalarStyle { get; set; }

		public ReflectionPropertyDescriptor(PropertyInfo propertyInfo, ITypeResolver typeResolver)
		{
			this.propertyInfo = propertyInfo ?? throw new ArgumentNullException("propertyInfo");
			this.typeResolver = typeResolver ?? throw new ArgumentNullException("typeResolver");
			ScalarStyle = ScalarStyle.Any;
		}

		public void Write(object target, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object value)
		{
			propertyInfo.SetValue(target, value, null);
		}

		[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)]
		[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
		public T GetCustomAttribute<T>() where T : Attribute
		{
			return (T)propertyInfo.GetAllCustomAttributes<T>().FirstOrDefault();
		}

		public IObjectDescriptor Read(object target)
		{
			object obj = propertyInfo.ReadValue(target);
			Type type = TypeOverride ?? typeResolver.Resolve(Type, obj);
			return new ObjectDescriptor(obj, type, Type, ScalarStyle);
		}
	}

	private readonly ITypeResolver typeResolver;

	private readonly bool includeNonPublicProperties;

	public ReadablePropertiesTypeInspector(ITypeResolver typeResolver)
		: this(typeResolver, includeNonPublicProperties: false)
	{
	}

	public ReadablePropertiesTypeInspector(ITypeResolver typeResolver, bool includeNonPublicProperties)
	{
		this.typeResolver = typeResolver ?? throw new ArgumentNullException("typeResolver");
		this.includeNonPublicProperties = includeNonPublicProperties;
	}

	private static bool IsValidProperty(PropertyInfo property)
	{
		if (property.CanRead)
		{
			return property.GetGetMethod(nonPublic: true).GetParameters().Length == 0;
		}
		return false;
	}

	public override IEnumerable<IPropertyDescriptor> GetProperties(Type type, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object container)
	{
		return type.GetProperties(includeNonPublicProperties).Where(IsValidProperty).Select((Func<PropertyInfo, IPropertyDescriptor>)([_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)] (PropertyInfo p) => new ReflectionPropertyDescriptor(p, typeResolver)));
	}
}
