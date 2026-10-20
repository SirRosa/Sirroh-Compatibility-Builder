using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Serialization.Converters;
using YamlDotNet.Serialization.NamingConventions;
using YamlDotNet.Serialization.TypeInspectors;

namespace YamlDotNet.Serialization;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal abstract class BuilderSkeleton<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] TBuilder> where TBuilder : BuilderSkeleton<TBuilder>
{
	internal INamingConvention namingConvention = NullNamingConvention.Instance;

	internal ITypeResolver typeResolver;

	internal readonly YamlAttributeOverrides overrides;

	internal readonly LazyComponentRegistrationList<Nothing, IYamlTypeConverter> typeConverterFactories;

	internal readonly LazyComponentRegistrationList<ITypeInspector, ITypeInspector> typeInspectorFactories;

	private bool ignoreFields;

	private bool includeNonPublicProperties;

	protected abstract TBuilder Self { get; }

	internal BuilderSkeleton(ITypeResolver typeResolver)
	{
		overrides = new YamlAttributeOverrides();
		typeConverterFactories = new LazyComponentRegistrationList<Nothing, IYamlTypeConverter>
		{
			{
				typeof(GuidConverter),
				(Nothing _) => new GuidConverter(jsonCompatible: false)
			},
			{
				typeof(SystemTypeConverter),
				(Nothing _) => new SystemTypeConverter()
			}
		};
		typeInspectorFactories = new LazyComponentRegistrationList<ITypeInspector, ITypeInspector>();
		this.typeResolver = typeResolver ?? throw new ArgumentNullException("typeResolver");
	}

	internal ITypeInspector BuildTypeInspector()
	{
		ITypeInspector typeInspector = new ReadablePropertiesTypeInspector(typeResolver, includeNonPublicProperties);
		if (!ignoreFields)
		{
			typeInspector = new CompositeTypeInspector(new ReadableFieldsTypeInspector(typeResolver), typeInspector);
		}
		return typeInspectorFactories.BuildComponentChain(typeInspector);
	}

	public TBuilder IgnoreFields()
	{
		ignoreFields = true;
		return Self;
	}

	public TBuilder IncludeNonPublicProperties()
	{
		includeNonPublicProperties = true;
		return Self;
	}

	public TBuilder WithNamingConvention(INamingConvention namingConvention)
	{
		this.namingConvention = namingConvention ?? throw new ArgumentNullException("namingConvention");
		return Self;
	}

	public TBuilder WithTypeResolver(ITypeResolver typeResolver)
	{
		this.typeResolver = typeResolver ?? throw new ArgumentNullException("typeResolver");
		return Self;
	}

	public abstract TBuilder WithTagMapping(TagName tag, Type type);

	public TBuilder WithAttributeOverride<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] TClass>(Expression<Func<TClass, object>> propertyAccessor, Attribute attribute)
	{
		overrides.Add(propertyAccessor, attribute);
		return Self;
	}

	public TBuilder WithAttributeOverride(Type type, string member, Attribute attribute)
	{
		overrides.Add(type, member, attribute);
		return Self;
	}

	public TBuilder WithTypeConverter(IYamlTypeConverter typeConverter)
	{
		return WithTypeConverter(typeConverter, (IRegistrationLocationSelectionSyntax<IYamlTypeConverter> w) =>
		{
			w.OnTop();
		});
	}

	public TBuilder WithTypeConverter(IYamlTypeConverter typeConverter, Action<IRegistrationLocationSelectionSyntax<IYamlTypeConverter>> where)
	{
		if (typeConverter == null)
		{
			throw new ArgumentNullException("typeConverter");
		}
		if (where == null)
		{
			throw new ArgumentNullException("where");
		}
		where(typeConverterFactories.CreateRegistrationLocationSelector(typeConverter.GetType(), (Nothing _) => typeConverter));
		return Self;
	}

	public TBuilder WithTypeConverter<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] TYamlTypeConverter>(WrapperFactory<IYamlTypeConverter, IYamlTypeConverter> typeConverterFactory, Action<ITrackingRegistrationLocationSelectionSyntax<IYamlTypeConverter>> where) where TYamlTypeConverter : IYamlTypeConverter
	{
		if (typeConverterFactory == null)
		{
			throw new ArgumentNullException("typeConverterFactory");
		}
		if (where == null)
		{
			throw new ArgumentNullException("where");
		}
		where(typeConverterFactories.CreateTrackingRegistrationLocationSelector(typeof(TYamlTypeConverter), (IYamlTypeConverter wrapped, Nothing _) => typeConverterFactory(wrapped)));
		return Self;
	}

	public TBuilder WithoutTypeConverter<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] TYamlTypeConverter>() where TYamlTypeConverter : IYamlTypeConverter
	{
		return WithoutTypeConverter(typeof(TYamlTypeConverter));
	}

	public TBuilder WithoutTypeConverter(Type converterType)
	{
		if (converterType == null)
		{
			throw new ArgumentNullException("converterType");
		}
		typeConverterFactories.Remove(converterType);
		return Self;
	}

	public TBuilder WithTypeInspector<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] TTypeInspector>(Func<ITypeInspector, TTypeInspector> typeInspectorFactory) where TTypeInspector : ITypeInspector
	{
		return WithTypeInspector(typeInspectorFactory, (IRegistrationLocationSelectionSyntax<ITypeInspector> w) =>
		{
			w.OnTop();
		});
	}

	public TBuilder WithTypeInspector<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] TTypeInspector>(Func<ITypeInspector, TTypeInspector> typeInspectorFactory, Action<IRegistrationLocationSelectionSyntax<ITypeInspector>> where) where TTypeInspector : ITypeInspector
	{
		if (typeInspectorFactory == null)
		{
			throw new ArgumentNullException("typeInspectorFactory");
		}
		if (where == null)
		{
			throw new ArgumentNullException("where");
		}
		where(typeInspectorFactories.CreateRegistrationLocationSelector(typeof(TTypeInspector), (ITypeInspector inner) => typeInspectorFactory(inner)));
		return Self;
	}

	public TBuilder WithTypeInspector<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] TTypeInspector>(WrapperFactory<ITypeInspector, ITypeInspector, TTypeInspector> typeInspectorFactory, Action<ITrackingRegistrationLocationSelectionSyntax<ITypeInspector>> where) where TTypeInspector : ITypeInspector
	{
		if (typeInspectorFactory == null)
		{
			throw new ArgumentNullException("typeInspectorFactory");
		}
		if (where == null)
		{
			throw new ArgumentNullException("where");
		}
		where(typeInspectorFactories.CreateTrackingRegistrationLocationSelector(typeof(TTypeInspector), (ITypeInspector wrapped, ITypeInspector inner) => typeInspectorFactory(wrapped, inner)));
		return Self;
	}

	public TBuilder WithoutTypeInspector<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] TTypeInspector>() where TTypeInspector : ITypeInspector
	{
		return WithoutTypeInspector(typeof(TTypeInspector));
	}

	public TBuilder WithoutTypeInspector(Type inspectorType)
	{
		if (inspectorType == null)
		{
			throw new ArgumentNullException("inspectorType");
		}
		typeInspectorFactories.Remove(inspectorType);
		return Self;
	}

	protected IEnumerable<IYamlTypeConverter> BuildTypeConverters()
	{
		return typeConverterFactories.BuildComponentList();
	}
}
