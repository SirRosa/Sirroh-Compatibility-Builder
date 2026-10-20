using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Runtime.Serialization;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;
using YamlDotNet.Helpers;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization.NodeDeserializers;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal sealed class _003C61a57b16_002Dd2d5_002D4625_002D9683_002Dc29ea0dc3551_003EObjectNodeDeserializer : _003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer
{
	private readonly _003C86c651de_002D54a3_002D4b26_002D8421_002D77d942e1f3bb_003EIObjectFactory objectFactory;

	private readonly _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector;

	private readonly bool ignoreUnmatched;

	private readonly bool duplicateKeyChecking;

	private readonly ITypeConverter typeConverter;

	private readonly _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention enumNamingConvention;

	private readonly bool enforceNullability;

	private readonly bool caseInsensitivePropertyMatching;

	private readonly bool enforceRequiredProperties;

	private readonly TypeConverterCache typeConverters;

	public _003C61a57b16_002Dd2d5_002D4625_002D9683_002Dc29ea0dc3551_003EObjectNodeDeserializer(_003C86c651de_002D54a3_002D4b26_002D8421_002D77d942e1f3bb_003EIObjectFactory objectFactory, _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector, bool ignoreUnmatched, bool duplicateKeyChecking, ITypeConverter typeConverter, _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention enumNamingConvention, bool enforceNullability, bool caseInsensitivePropertyMatching, bool enforceRequiredProperties, IEnumerable<_003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter> typeConverters)
	{
		this.objectFactory = objectFactory ?? throw new ArgumentNullException("objectFactory");
		this.typeInspector = typeInspector ?? throw new ArgumentNullException("typeInspector");
		this.ignoreUnmatched = ignoreUnmatched;
		this.duplicateKeyChecking = duplicateKeyChecking;
		this.typeConverter = typeConverter ?? throw new ArgumentNullException("typeConverter");
		this.enumNamingConvention = enumNamingConvention ?? throw new ArgumentNullException("enumNamingConvention");
		this.enforceNullability = enforceNullability;
		this.caseInsensitivePropertyMatching = caseInsensitivePropertyMatching;
		this.enforceRequiredProperties = enforceRequiredProperties;
		this.typeConverters = new TypeConverterCache(typeConverters);
	}

	public bool Deserialize(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, Type expectedType, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser, Type, object> nestedObjectDeserializer, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] out object value, _003Ccf1bb9c3_002D9707_002D4afa_002Daa6b_002D02a0a9430a5f_003EObjectDeserializer rootDeserializer)
	{
		if (!parser.TryConsume<_003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart>(out var _))
		{
			value = null;
			return false;
		}
		Type type = Nullable.GetUnderlyingType(expectedType) ?? FsharpHelper.GetOptionUnderlyingType(expectedType) ?? expectedType;
		value = objectFactory.Create(type);
		objectFactory.ExecuteOnDeserializing(value);
		HashSet<string> hashSet = new HashSet<string>(StringComparer.Ordinal);
		HashSet<string> hashSet2 = new HashSet<string>(StringComparer.Ordinal);
		_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start = _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty;
		_003C446b682a_002D36b6_002D46ea_002Db1c3_002D0616b60e5c52_003EMappingEnd event2;
		while (!parser.TryConsume<_003C446b682a_002D36b6_002D46ea_002Db1c3_002D0616b60e5c52_003EMappingEnd>(out event2))
		{
			_003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar propertyName = parser.Consume<_003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar>();
			if (duplicateKeyChecking && !hashSet.Add(propertyName.Value))
			{
				throw new _003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException(propertyName.Start, propertyName.End, "Encountered duplicate key " + propertyName.Value);
			}
			try
			{
				_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor property = typeInspector.GetProperty(type, null, propertyName.Value, ignoreUnmatched, caseInsensitivePropertyMatching);
				if (property == null)
				{
					parser.SkipThisAndNestedEvents();
					continue;
				}
				hashSet2.Add(property.Name);
				object obj;
				if (property.ConverterType != null)
				{
					_003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter converterByType = typeConverters.GetConverterByType(property.ConverterType);
					obj = converterByType.ReadYaml(parser, property.Type, rootDeserializer);
				}
				else
				{
					obj = nestedObjectDeserializer(parser, property.Type);
				}
				if (obj is _003C9bf148ef_002Dec3e_002D48e2_002Db55a_002D857a8fcd2a5e_003EIValuePromise obj2)
				{
					object valueRef = value;
					obj2.ValueAvailable += [_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)] (object v) =>
					{
						object value3 = typeConverter.ChangeType(v, property.Type, enumNamingConvention, typeInspector);
						NullCheck(value3, property, propertyName);
						property.Write(valueRef, value3);
					};
				}
				else
				{
					object value2 = typeConverter.ChangeType(obj, property.Type, enumNamingConvention, typeInspector);
					NullCheck(value2, property, propertyName);
					property.Write(value, value2);
				}
			}
			catch (SerializationException ex)
			{
				throw new _003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException(propertyName.Start, propertyName.End, ex.Message);
			}
			catch (_003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException)
			{
				throw;
			}
			catch (Exception innerException)
			{
				throw new _003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException(propertyName.Start, propertyName.End, "Exception during deserialization", innerException);
			}
			start = propertyName.End;
		}
		if (enforceRequiredProperties)
		{
			IEnumerable<_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor> properties = typeInspector.GetProperties(type, value);
			List<string> list = new List<string>();
			foreach (_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor item in properties)
			{
				if (item.Required && !hashSet2.Contains(item.Name))
				{
					list.Add(item.Name);
				}
			}
			if (list.Count > 0)
			{
				string text = string.Join(",", list);
				throw new _003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException(in start, in start, "Missing properties, '" + text + "' in source yaml.");
			}
		}
		objectFactory.ExecuteOnDeserialized(value);
		return true;
	}

	public void NullCheck(object value, _003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor property, _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar propertyName)
	{
		if (enforceNullability && value == null && !property.AllowNulls)
		{
			throw new _003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException(propertyName.Start, propertyName.End, "Strict nullability enforcement error.", new NullReferenceException("Yaml value is null when target property requires non null values."));
		}
	}
}
