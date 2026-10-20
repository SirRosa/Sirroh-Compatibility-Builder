using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.TypeInspectors;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal sealed class ReadableFieldsTypeInspector : TypeInspectorSkeleton
{
	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
	private sealed class ReflectionFieldDescriptor : IPropertyDescriptor
	{
		private readonly FieldInfo fieldInfo;

		private readonly ITypeResolver typeResolver;

		public string Name => fieldInfo.Name;

		public Type Type => fieldInfo.FieldType;

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

		public bool CanWrite => !fieldInfo.IsInitOnly;

		public ScalarStyle ScalarStyle { get; set; }

		public ReflectionFieldDescriptor(FieldInfo fieldInfo, ITypeResolver typeResolver)
		{
			this.fieldInfo = fieldInfo;
			this.typeResolver = typeResolver;
			ScalarStyle = ScalarStyle.Any;
		}

		public void Write(object target, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object value)
		{
			fieldInfo.SetValue(target, value);
		}

		[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)]
		[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
		public T GetCustomAttribute<T>() where T : Attribute
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

	public override IEnumerable<IPropertyDescriptor> GetProperties(Type type, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object container)
	{
		return type.GetPublicFields().Select((Func<FieldInfo, IPropertyDescriptor>)([_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)] (FieldInfo p) => new ReflectionFieldDescriptor(p, typeResolver)));
	}
}
