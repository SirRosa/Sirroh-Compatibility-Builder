using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Serialization.Converters;
using YamlDotNet.Serialization.NamingConventions;

namespace YamlDotNet.Serialization;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal abstract class StaticBuilderSkeleton<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)] TBuilder> where TBuilder : StaticBuilderSkeleton<TBuilder>
{
	internal INamingConvention namingConvention = NullNamingConvention.Instance;

	internal ITypeResolver typeResolver;

	internal readonly LazyComponentRegistrationList<Nothing, IYamlTypeConverter> typeConverterFactories;

	internal readonly LazyComponentRegistrationList<ITypeInspector, ITypeInspector> typeInspectorFactories;

	internal bool includeNonPublicProperties;

	internal Settings settings;

	protected abstract TBuilder Self { get; }

	internal StaticBuilderSkeleton(ITypeResolver typeResolver)
	{
		typeConverterFactories = new LazyComponentRegistrationList<Nothing, IYamlTypeConverter> { 
		{
			typeof(GuidConverter),
			(Nothing _) => new GuidConverter(jsonCompatible: false)
		} };
		typeInspectorFactories = new LazyComponentRegistrationList<ITypeInspector, ITypeInspector>();
		this.typeResolver = typeResolver ?? throw new ArgumentNullException("typeResolver");
		settings = new Settings();
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

	public TBuilder WithTypeConverter<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)] TYamlTypeConverter>(WrapperFactory<IYamlTypeConverter, IYamlTypeConverter> typeConverterFactory, Action<ITrackingRegistrationLocationSelectionSyntax<IYamlTypeConverter>> where) where TYamlTypeConverter : IYamlTypeConverter
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

	public TBuilder WithoutTypeConverter<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)] TYamlTypeConverter>() where TYamlTypeConverter : IYamlTypeConverter
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

	public TBuilder WithTypeInspector<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)] TTypeInspector>(Func<ITypeInspector, TTypeInspector> typeInspectorFactory) where TTypeInspector : ITypeInspector
	{
		return WithTypeInspector(typeInspectorFactory, (IRegistrationLocationSelectionSyntax<ITypeInspector> w) =>
		{
			w.OnTop();
		});
	}

	public TBuilder WithTypeInspector<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)] TTypeInspector>(Func<ITypeInspector, TTypeInspector> typeInspectorFactory, Action<IRegistrationLocationSelectionSyntax<ITypeInspector>> where) where TTypeInspector : ITypeInspector
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

	public TBuilder WithTypeInspector<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)] TTypeInspector>(WrapperFactory<ITypeInspector, ITypeInspector, TTypeInspector> typeInspectorFactory, Action<ITrackingRegistrationLocationSelectionSyntax<ITypeInspector>> where) where TTypeInspector : ITypeInspector
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

	public TBuilder WithoutTypeInspector<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)] TTypeInspector>() where TTypeInspector : ITypeInspector
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
