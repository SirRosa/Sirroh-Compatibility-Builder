using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Text;
using YamlDotNet.Core;
using YamlDotNet.Helpers;

namespace YamlDotNet.Serialization.ObjectGraphTraversalStrategies;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal class _003Ca079ef9c_002D85aa_002D4d79_002D91da_002D46578d914a96_003EFullObjectGraphTraversalStrategy : _003C2e4836f2_002D9cba_002D49fb_002Da7bf_002Df4beabd1fc33_003EIObjectGraphTraversalStrategy
{
	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
	protected readonly struct ObjectPathSegment(object name, _003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor value)
	{
		public readonly object Name = name;

		public readonly _003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor Value = value;
	}

	private readonly int maxRecursion;

	private readonly _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeDescriptor;

	private readonly _003C9a18e817_002D7f53_002D45f5_002D8cc8_002D78dd60e37121_003EITypeResolver typeResolver;

	private readonly _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention namingConvention;

	private readonly _003C86c651de_002D54a3_002D4b26_002D8421_002D77d942e1f3bb_003EIObjectFactory objectFactory;

	public _003Ca079ef9c_002D85aa_002D4d79_002D91da_002D46578d914a96_003EFullObjectGraphTraversalStrategy(_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeDescriptor, _003C9a18e817_002D7f53_002D45f5_002D8cc8_002D78dd60e37121_003EITypeResolver typeResolver, int maxRecursion, _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention namingConvention, _003C86c651de_002D54a3_002D4b26_002D8421_002D77d942e1f3bb_003EIObjectFactory objectFactory)
	{
		if (maxRecursion <= 0)
		{
			throw new ArgumentOutOfRangeException("maxRecursion", maxRecursion, "maxRecursion must be greater than 1");
		}
		this.typeDescriptor = typeDescriptor ?? throw new ArgumentNullException("typeDescriptor");
		this.typeResolver = typeResolver ?? throw new ArgumentNullException("typeResolver");
		this.maxRecursion = maxRecursion;
		this.namingConvention = namingConvention ?? throw new ArgumentNullException("namingConvention");
		this.objectFactory = objectFactory ?? throw new ArgumentNullException("objectFactory");
	}

	void _003C2e4836f2_002D9cba_002D49fb_002Da7bf_002Df4beabd1fc33_003EIObjectGraphTraversalStrategy.Traverse<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TContext>(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor graph, _003Cd0224a9c_002Da50e_002D4b39_002D9113_002Dc2af3da8da9e_003EIObjectGraphVisitor<TContext> visitor, TContext context, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
		Traverse(null, "<root>", graph, visitor, context, new Stack<ObjectPathSegment>(maxRecursion), serializer);
	}

	protected virtual void Traverse<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TContext>([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] _003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor propertyDescriptor, object name, _003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor value, _003Cd0224a9c_002Da50e_002D4b39_002D9113_002Dc2af3da8da9e_003EIObjectGraphVisitor<TContext> visitor, TContext context, Stack<ObjectPathSegment> path, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
		if (path.Count >= maxRecursion)
		{
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.AppendLine("Too much recursion when traversing the object graph.");
			stringBuilder.AppendLine("The path to reach this recursion was:");
			Stack<KeyValuePair<string, string>> stack = new Stack<KeyValuePair<string, string>>(path.Count);
			int num = 0;
			foreach (ObjectPathSegment item in path)
			{
				string text = item.Name?.ToString() ?? string.Empty;
				num = Math.Max(num, text.Length);
				stack.Push(new KeyValuePair<string, string>(text, item.Value.Type.FullName));
			}
			foreach (KeyValuePair<string, string> item2 in stack)
			{
				stringBuilder.Append(" -> ").Append(item2.Key.PadRight(num)).Append("  [")
					.Append(item2.Value)
					.AppendLine("]");
			}
			throw new _003C7588e5e7_002Dd15b_002D4b99_002Db2f8_002Dd825dd1fade2_003EMaximumRecursionLevelReachedException(stringBuilder.ToString());
		}
		if (!visitor.Enter(propertyDescriptor, value, context, serializer))
		{
			return;
		}
		path.Push(new ObjectPathSegment(name, value));
		try
		{
			TypeCode typeCode = _003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.GetTypeCode(value.Type);
			switch (typeCode)
			{
			case TypeCode.Boolean:
			case TypeCode.Char:
			case TypeCode.SByte:
			case TypeCode.Byte:
			case TypeCode.Int16:
			case TypeCode.UInt16:
			case TypeCode.Int32:
			case TypeCode.UInt32:
			case TypeCode.Int64:
			case TypeCode.UInt64:
			case TypeCode.Single:
			case TypeCode.Double:
			case TypeCode.Decimal:
			case TypeCode.DateTime:
			case TypeCode.String:
				visitor.VisitScalar(value, context, serializer);
				return;
			case TypeCode.Empty:
				throw new NotSupportedException($"TypeCode.{typeCode} is not supported.");
			}
			if (_003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.IsDbNull(value))
			{
				visitor.VisitScalar(new _003Ce413efdf_002D5e9a_002D4b56_002D9686_002Da7eb44e10568_003EObjectDescriptor(null, typeof(object), typeof(object)), context, serializer);
			}
			if (value.Value == null || value.Type == typeof(TimeSpan))
			{
				visitor.VisitScalar(value, context, serializer);
				return;
			}
			Type underlyingType = Nullable.GetUnderlyingType(value.Type);
			Type type = underlyingType ?? FsharpHelper.GetOptionUnderlyingType(value.Type);
			object obj = ((type != null) ? FsharpHelper.GetValue(value) : null);
			if (underlyingType != null)
			{
				Traverse(propertyDescriptor, "Value", new _003Ce413efdf_002D5e9a_002D4b56_002D9686_002Da7eb44e10568_003EObjectDescriptor(value.Value, underlyingType, value.Type, value.ScalarStyle), visitor, context, path, serializer);
			}
			else if (type != null && obj != null)
			{
				Traverse(propertyDescriptor, "Value", new _003Ce413efdf_002D5e9a_002D4b56_002D9686_002Da7eb44e10568_003EObjectDescriptor(FsharpHelper.GetValue(value), type, value.Type, value.ScalarStyle), visitor, context, path, serializer);
			}
			else
			{
				TraverseObject(propertyDescriptor, value, visitor, context, path, serializer);
			}
		}
		finally
		{
			path.Pop();
		}
	}

	protected virtual void TraverseObject<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TContext>([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] _003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor propertyDescriptor, _003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor value, _003Cd0224a9c_002Da50e_002D4b39_002D9113_002Dc2af3da8da9e_003EIObjectGraphVisitor<TContext> visitor, TContext context, Stack<ObjectPathSegment> path, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
		IDictionary dictionary;
		Type[] genericArguments;
		if (typeof(IDictionary).IsAssignableFrom(value.Type))
		{
			TraverseDictionary(propertyDescriptor, value, visitor, typeof(object), typeof(object), context, path, serializer);
		}
		else if (objectFactory.GetDictionary(value, out dictionary, out genericArguments))
		{
			TraverseDictionary(propertyDescriptor, new _003Ce413efdf_002D5e9a_002D4b56_002D9686_002Da7eb44e10568_003EObjectDescriptor(dictionary, value.Type, value.StaticType, value.ScalarStyle), visitor, genericArguments[0], genericArguments[1], context, path, serializer);
		}
		else if (typeof(IEnumerable).IsAssignableFrom(value.Type))
		{
			TraverseList(propertyDescriptor, value, visitor, context, path, serializer);
		}
		else
		{
			TraverseProperties(value, visitor, context, path, serializer);
		}
	}

	protected virtual void TraverseDictionary<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TContext>([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] _003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor propertyDescriptor, _003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor dictionary, _003Cd0224a9c_002Da50e_002D4b39_002D9113_002Dc2af3da8da9e_003EIObjectGraphVisitor<TContext> visitor, Type keyType, Type valueType, TContext context, Stack<ObjectPathSegment> path, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
		visitor.VisitMappingStart(dictionary, keyType, valueType, context, serializer);
		bool flag = dictionary.Type.FullName.Equals("System.Dynamic.ExpandoObject");
		foreach (DictionaryEntry? item in (IDictionary)dictionary.NonNullValue())
		{
			DictionaryEntry value = item.Value;
			object obj = (flag ? namingConvention.Apply(value.Key.ToString()) : value.Key);
			_003Ce413efdf_002D5e9a_002D4b56_002D9686_002Da7eb44e10568_003EObjectDescriptor objectDescriptor = GetObjectDescriptor(obj, keyType);
			_003Ce413efdf_002D5e9a_002D4b56_002D9686_002Da7eb44e10568_003EObjectDescriptor objectDescriptor2 = GetObjectDescriptor(value.Value, valueType);
			if (visitor.EnterMapping(objectDescriptor, objectDescriptor2, context, serializer))
			{
				Traverse(propertyDescriptor, obj, objectDescriptor, visitor, context, path, serializer);
				Traverse(propertyDescriptor, obj, objectDescriptor2, visitor, context, path, serializer);
			}
		}
		visitor.VisitMappingEnd(dictionary, context, serializer);
	}

	private void TraverseList<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TContext>(_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor propertyDescriptor, _003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor value, _003Cd0224a9c_002Da50e_002D4b39_002D9113_002Dc2af3da8da9e_003EIObjectGraphVisitor<TContext> visitor, TContext context, Stack<ObjectPathSegment> path, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
		Type valueType = objectFactory.GetValueType(value.Type);
		visitor.VisitSequenceStart(value, valueType, context, serializer);
		int num = 0;
		foreach (object item in (IEnumerable)value.NonNullValue())
		{
			Traverse(propertyDescriptor, num, GetObjectDescriptor(item, valueType), visitor, context, path, serializer);
			num++;
		}
		visitor.VisitSequenceEnd(value, context, serializer);
	}

	protected virtual void TraverseProperties<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TContext>(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor value, _003Cd0224a9c_002Da50e_002D4b39_002D9113_002Dc2af3da8da9e_003EIObjectGraphVisitor<TContext> visitor, TContext context, Stack<ObjectPathSegment> path, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
		if (context.GetType() != typeof(_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing))
		{
			objectFactory.ExecuteOnSerializing(value.Value);
		}
		visitor.VisitMappingStart(value, typeof(string), typeof(object), context, serializer);
		object obj = value.NonNullValue();
		foreach (_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor property in typeDescriptor.GetProperties(value.Type, obj))
		{
			_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor value2 = property.Read(obj);
			if (visitor.EnterMapping(property, value2, context, serializer))
			{
				Traverse(null, property.Name, new _003Ce413efdf_002D5e9a_002D4b56_002D9686_002Da7eb44e10568_003EObjectDescriptor(property.Name, typeof(string), typeof(string), _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Plain), visitor, context, path, serializer);
				Traverse(property, property.Name, value2, visitor, context, path, serializer);
			}
		}
		visitor.VisitMappingEnd(value, context, serializer);
		if (context.GetType() != typeof(_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing))
		{
			objectFactory.ExecuteOnSerialized(value.Value);
		}
	}

	private _003Ce413efdf_002D5e9a_002D4b56_002D9686_002Da7eb44e10568_003EObjectDescriptor GetObjectDescriptor([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object value, Type staticType)
	{
		return new _003Ce413efdf_002D5e9a_002D4b56_002D9686_002Da7eb44e10568_003EObjectDescriptor(value, typeResolver.Resolve(staticType, value), staticType);
	}
}
