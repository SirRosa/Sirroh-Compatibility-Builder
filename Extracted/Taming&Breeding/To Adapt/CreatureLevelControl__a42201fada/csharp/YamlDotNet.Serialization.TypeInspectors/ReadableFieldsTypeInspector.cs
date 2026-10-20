using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.TypeInspectors;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal sealed class ReadableFieldsTypeInspector : TypeInspectorSkeleton
{
	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
	private sealed class ReflectionFieldDescriptor : IPropertyDescriptor
	{
		private readonly FieldInfo fieldInfo;

		private readonly ITypeResolver typeResolver;

		public string Name => fieldInfo.Name;

		public Type Type => fieldInfo.FieldType;

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

		public bool CanWrite => !fieldInfo.IsInitOnly;

		public ScalarStyle ScalarStyle { get; set; }

		public ReflectionFieldDescriptor(FieldInfo fieldInfo, ITypeResolver typeResolver)
		{
			this.fieldInfo = fieldInfo;
			this.typeResolver = typeResolver;
			ScalarStyle = ScalarStyle.Any;
		}

		public void Write(object target, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] object value)
		{
			fieldInfo.SetValue(target, value);
		}

		public T GetCustomAttribute<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] T>() where T : Attribute
		{
			return (T)fieldInfo.GetCustomAttributes(typeof(T), inherit: true).FirstOrDefault();
		}

		public IObjectDescriptor Read(object target)
		{
			object value = fieldInfo.GetValue(target);
			Type type = TypeOverride ?? typeResolver.Resolve(Type, value);
			return new ObjectDescriptor(value, type, Type, ScalarStyle);
		}
	}

	private readonly ITypeResolver typeResolver;

	public ReadableFieldsTypeInspector(ITypeResolver typeResolver)
	{
		this.typeResolver = typeResolver ?? throw new ArgumentNullException("typeResolver");
	}

	public override IEnumerable<IPropertyDescriptor> GetProperties(Type type, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] object container)
	{
		return type.GetPublicFields().Select((Func<FieldInfo, IPropertyDescriptor>)([_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(0)] (FieldInfo p) => new ReflectionFieldDescriptor(p, typeResolver)));
	}
}
