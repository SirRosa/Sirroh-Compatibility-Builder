using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Serialization.Converters;
using YamlDotNet.Serialization.NamingConventions;

namespace YamlDotNet.Serialization;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal abstract class StaticBuilderSkeleton<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)] TBuilder> where TBuilder : StaticBuilderSkeleton<TBuilder>
{
	internal _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention namingConvention = _003C4aa8658e_002D2183_002D4694_002Db0ce_002D777f343e803b_003ENullNamingConvention.Instance;

	internal _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention enumNamingConvention = _003C4aa8658e_002D2183_002D4694_002Db0ce_002D777f343e803b_003ENullNamingConvention.Instance;

	internal _003C9a18e817_002D7f53_002D45f5_002D8cc8_002D78dd60e37121_003EITypeResolver typeResolver;

	internal readonly _003C2cd31a20_002D83ff_002D4e8e_002D9b5c_002D5f71fde1499d_003ELazyComponentRegistrationList<_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing, _003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter> typeConverterFactories;

	internal readonly _003C2cd31a20_002D83ff_002D4e8e_002D9b5c_002D5f71fde1499d_003ELazyComponentRegistrationList<_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector, _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector> typeInspectorFactories;

	internal bool includeNonPublicProperties;

	internal Settings settings;

	internal _003C7ac57b10_002Ded2c_002D4254_002D96e1_002D3b85a1ba3278_003EYamlFormatter yamlFormatter = _003C7ac57b10_002Ded2c_002D4254_002D96e1_002D3b85a1ba3278_003EYamlFormatter.Default;

	protected abstract TBuilder Self { get; }

	internal StaticBuilderSkeleton(_003C9a18e817_002D7f53_002D45f5_002D8cc8_002D78dd60e37121_003EITypeResolver typeResolver)
	{
		typeConverterFactories = new _003C2cd31a20_002D83ff_002D4e8e_002D9b5c_002D5f71fde1499d_003ELazyComponentRegistrationList<_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing, _003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter> { 
		{
			typeof(_003Cda832479_002Da086_002D45cf_002Da1f7_002D552ede25808b_003EGuidConverter),
			(_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing _) => new _003Cda832479_002Da086_002D45cf_002Da1f7_002D552ede25808b_003EGuidConverter(jsonCompatible: false)
		} };
		typeInspectorFactories = new _003C2cd31a20_002D83ff_002D4e8e_002D9b5c_002D5f71fde1499d_003ELazyComponentRegistrationList<_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector, _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector>();
		this.typeResolver = typeResolver ?? throw new ArgumentNullException("typeResolver");
		settings = new Settings();
	}

	public TBuilder WithNamingConvention(_003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention namingConvention)
	{
		this.namingConvention = namingConvention ?? throw new ArgumentNullException("namingConvention");
		return Self;
	}

	public TBuilder WithEnumNamingConvention(_003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention enumNamingConvention)
	{
		this.enumNamingConvention = enumNamingConvention ?? throw new ArgumentNullException("enumNamingConvention");
		return Self;
	}

	public TBuilder WithTypeResolver(_003C9a18e817_002D7f53_002D45f5_002D8cc8_002D78dd60e37121_003EITypeResolver typeResolver)
	{
		this.typeResolver = typeResolver ?? throw new ArgumentNullException("typeResolver");
		return Self;
	}

	public abstract TBuilder WithTagMapping(_003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName tag, Type type);

	public TBuilder WithTypeConverter(_003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter typeConverter)
	{
		return WithTypeConverter(typeConverter, (_003Ce90b0d63_002D97fe_002D48e5_002D8aba_002D6bd8b2703b95_003EIRegistrationLocationSelectionSyntax<_003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter> w) =>
		{
			w.OnTop();
		});
	}

	public TBuilder WithTypeConverter(_003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter typeConverter, Action<_003Ce90b0d63_002D97fe_002D48e5_002D8aba_002D6bd8b2703b95_003EIRegistrationLocationSelectionSyntax<_003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter>> where)
	{
		if (typeConverter == null)
		{
			throw new ArgumentNullException("typeConverter");
		}
		if (where == null)
		{
			throw new ArgumentNullException("where");
		}
		where(typeConverterFactories.CreateRegistrationLocationSelector(typeConverter.GetType(), (_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing _) => typeConverter));
		return Self;
	}

	public TBuilder WithTypeConverter<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)] TYamlTypeConverter>(_003Cd39f13d8_002Df580_002D4171_002Da00c_002Dc44ac6e939ed_003EWrapperFactory<_003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter, _003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter> typeConverterFactory, Action<_003C7b4f1b17_002D7cba_002D4703_002D871c_002Da756aba66c35_003EITrackingRegistrationLocationSelectionSyntax<_003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter>> where) where TYamlTypeConverter : _003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter
	{
		if (typeConverterFactory == null)
		{
			throw new ArgumentNullException("typeConverterFactory");
		}
		if (where == null)
		{
			throw new ArgumentNullException("where");
		}
		where(typeConverterFactories.CreateTrackingRegistrationLocationSelector(typeof(TYamlTypeConverter), (_003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter wrapped, _003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing _) => typeConverterFactory(wrapped)));
		return Self;
	}

	public TBuilder WithoutTypeConverter<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)] TYamlTypeConverter>() where TYamlTypeConverter : _003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter
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

	public TBuilder WithTypeInspector<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)] TTypeInspector>(Func<_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector, TTypeInspector> typeInspectorFactory) where TTypeInspector : _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector
	{
		return WithTypeInspector(typeInspectorFactory, (_003Ce90b0d63_002D97fe_002D48e5_002D8aba_002D6bd8b2703b95_003EIRegistrationLocationSelectionSyntax<_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector> w) =>
		{
			w.OnTop();
		});
	}

	public TBuilder WithTypeInspector<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)] TTypeInspector>(Func<_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector, TTypeInspector> typeInspectorFactory, Action<_003Ce90b0d63_002D97fe_002D48e5_002D8aba_002D6bd8b2703b95_003EIRegistrationLocationSelectionSyntax<_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector>> where) where TTypeInspector : _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector
	{
		if (typeInspectorFactory == null)
		{
			throw new ArgumentNullException("typeInspectorFactory");
		}
		if (where == null)
		{
			throw new ArgumentNullException("where");
		}
		where(typeInspectorFactories.CreateRegistrationLocationSelector(typeof(TTypeInspector), (_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector inner) => typeInspectorFactory(inner)));
		return Self;
	}

	public TBuilder WithTypeInspector<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)] TTypeInspector>(_003C31eb9eed_002D785d_002D4044_002D9081_002Def6bfa032f83_003EWrapperFactory<_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector, _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector, TTypeInspector> typeInspectorFactory, Action<_003C7b4f1b17_002D7cba_002D4703_002D871c_002Da756aba66c35_003EITrackingRegistrationLocationSelectionSyntax<_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector>> where) where TTypeInspector : _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector
	{
		if (typeInspectorFactory == null)
		{
			throw new ArgumentNullException("typeInspectorFactory");
		}
		if (where == null)
		{
			throw new ArgumentNullException("where");
		}
		where(typeInspectorFactories.CreateTrackingRegistrationLocationSelector(typeof(TTypeInspector), (_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector wrapped, _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector inner) => typeInspectorFactory(wrapped, inner)));
		return Self;
	}

	public TBuilder WithoutTypeInspector<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)] TTypeInspector>() where TTypeInspector : _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector
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

	public TBuilder WithYamlFormatter(_003C7ac57b10_002Ded2c_002D4254_002D96e1_002D3b85a1ba3278_003EYamlFormatter formatter)
	{
		yamlFormatter = formatter ?? throw new ArgumentNullException("formatter");
		return Self;
	}

	protected IEnumerable<_003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter> BuildTypeConverters()
	{
		return typeConverterFactories.BuildComponentList();
	}
}
