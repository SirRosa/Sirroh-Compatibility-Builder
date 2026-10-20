using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.TypeInspectors;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class ReadablePropertiesTypeInspector : TypeInspectorSkeleton
{
	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
	private sealed class ReflectionPropertyDescriptor : IPropertyDescriptor
	{
		private readonly PropertyInfo propertyInfo;

		private readonly ITypeResolver typeResolver;

		public string Name => propertyInfo.Name;

		public Type Type => propertyInfo.PropertyType;

		[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
		[field: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
		public Type TypeOverride
		{
			[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
			get;
			[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
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

		public void Write(object target, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] object value)
		{
			propertyInfo.SetValue(target, value, null);
		}

		public T GetCustomAttribute<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] T>() where T : Attribute
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

	public override IEnumerable<IPropertyDescriptor> GetProperties(Type type, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] object container)
	{
		return type.GetProperties(includeNonPublicProperties).Where(IsValidProperty).Select((Func<PropertyInfo, IPropertyDescriptor>)([_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(0)] (PropertyInfo p) => new ReflectionPropertyDescriptor(p, typeResolver)));
	}
}
