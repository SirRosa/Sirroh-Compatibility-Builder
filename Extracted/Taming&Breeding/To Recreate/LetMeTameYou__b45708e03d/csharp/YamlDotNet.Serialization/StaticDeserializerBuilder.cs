using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Serialization.BufferedDeserialization;
using YamlDotNet.Serialization.NamingConventions;
using YamlDotNet.Serialization.NodeDeserializers;
using YamlDotNet.Serialization.NodeTypeResolvers;
using YamlDotNet.Serialization.ObjectFactories;
using YamlDotNet.Serialization.Schemas;
using YamlDotNet.Serialization.TypeInspectors;
using YamlDotNet.Serialization.Utilities;
using YamlDotNet.Serialization.ValueDeserializers;

namespace YamlDotNet.Serialization;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 0, 1 })]
internal sealed class StaticDeserializerBuilder : StaticBuilderSkeleton<StaticDeserializerBuilder>
{
	private readonly StaticContext context;

	private readonly StaticObjectFactory factory;

	private readonly _003C2cd31a20_002D83ff_002D4e8e_002D9b5c_002D5f71fde1499d_003ELazyComponentRegistrationList<_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing, _003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer> nodeDeserializerFactories;

	private readonly _003C2cd31a20_002D83ff_002D4e8e_002D9b5c_002D5f71fde1499d_003ELazyComponentRegistrationList<_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing, _003C5d87a147_002Dae74_002D49a7_002D8626_002Dec84a8adca93_003EINodeTypeResolver> nodeTypeResolverFactories;

	private readonly Dictionary<_003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName, Type> tagMappings;

	private readonly ITypeConverter typeConverter;

	private readonly Dictionary<Type, Type> typeMappings;

	private bool ignoreUnmatched;

	private bool duplicateKeyChecking;

	private bool attemptUnknownTypeDeserialization;

	private bool enforceNullability;

	private bool caseInsensitivePropertyMatching;

	protected override StaticDeserializerBuilder Self => this;

	public StaticDeserializerBuilder(StaticContext context)
		: base(context.GetTypeResolver())
	{
		this.context = context;
		factory = context.GetFactory();
		typeMappings = new Dictionary<Type, Type>();
		tagMappings = new Dictionary<_003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName, Type>
		{
			{
				_003C17e3138a_002D6846_002D4cb2_002D9350_002D191c04acb229_003EFailsafeSchema.Tags.Map,
				typeof(Dictionary<object, object>)
			},
			{
				_003C17e3138a_002D6846_002D4cb2_002D9350_002D191c04acb229_003EFailsafeSchema.Tags.Str,
				typeof(string)
			},
			{
				_003C7e9c1dba_002D2035_002D4200_002D8a6c_002D11ff08451d09_003EJsonSchema.Tags.Bool,
				typeof(bool)
			},
			{
				_003C7e9c1dba_002D2035_002D4200_002D8a6c_002D11ff08451d09_003EJsonSchema.Tags.Float,
				typeof(double)
			},
			{
				_003C7e9c1dba_002D2035_002D4200_002D8a6c_002D11ff08451d09_003EJsonSchema.Tags.Int,
				typeof(int)
			},
			{
				_003C78294957_002D2874_002D420d_002Dbacf_002D7cea9f078e7b_003EDefaultSchema.Tags.Timestamp,
				typeof(DateTime)
			}
		};
		typeInspectorFactories.Add(typeof(_003Cfba57f66_002D4e0b_002D4477_002D9105_002Db9b0b4957763_003ECachedTypeInspector), (_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector inner) => new _003Cfba57f66_002D4e0b_002D4477_002D9105_002Db9b0b4957763_003ECachedTypeInspector(inner));
		typeInspectorFactories.Add(typeof(_003Cf2cd6aa7_002D767a_002D449b_002D8198_002D55e156780a2f_003ENamingConventionTypeInspector), (_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector inner) => (!(namingConvention is _003C4aa8658e_002D2183_002D4694_002Db0ce_002D777f343e803b_003ENullNamingConvention)) ? new _003Cf2cd6aa7_002D767a_002D449b_002D8198_002D55e156780a2f_003ENamingConventionTypeInspector(inner, namingConvention) : inner);
		typeInspectorFactories.Add(typeof(_003C696a98cc_002D544c_002D4e6a_002D89dd_002Dd31f8c518db5_003EYamlAttributesTypeInspector), (_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector inner) => new _003C696a98cc_002D544c_002D4e6a_002D89dd_002Dd31f8c518db5_003EYamlAttributesTypeInspector(inner));
		nodeDeserializerFactories = new _003C2cd31a20_002D83ff_002D4e8e_002D9b5c_002D5f71fde1499d_003ELazyComponentRegistrationList<_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing, _003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer>
		{
			{
				typeof(_003C7fff479c_002D0e60_002D4376_002D9043_002Dbd1bd655ff52_003EYamlConvertibleNodeDeserializer),
				(_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing _) => new _003C7fff479c_002D0e60_002D4376_002D9043_002Dbd1bd655ff52_003EYamlConvertibleNodeDeserializer(factory)
			},
			{
				typeof(_003Cdb693bdb_002Dff1a_002D43e9_002Da4f0_002D9e5038ae4600_003EYamlSerializableNodeDeserializer),
				(_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing _) => new _003Cdb693bdb_002Dff1a_002D43e9_002Da4f0_002D9e5038ae4600_003EYamlSerializableNodeDeserializer(factory)
			},
			{
				typeof(_003C16487fc7_002D0c68_002D40df_002D97ce_002Dae80959abeab_003ETypeConverterNodeDeserializer),
				(_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing _) => new _003C16487fc7_002D0c68_002D40df_002D97ce_002Dae80959abeab_003ETypeConverterNodeDeserializer(BuildTypeConverters())
			},
			{
				typeof(_003Cd9bfb758_002D1707_002D4321_002D8cc7_002D70055e8a0f8d_003ENullNodeDeserializer),
				(_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing _) => new _003Cd9bfb758_002D1707_002D4321_002D8cc7_002D70055e8a0f8d_003ENullNodeDeserializer()
			},
			{
				typeof(_003Cb19366ed_002D16d7_002D4045_002Daa91_002Ddb56b5968d8a_003EScalarNodeDeserializer),
				(_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing _) => new _003Cb19366ed_002D16d7_002D4045_002Daa91_002Ddb56b5968d8a_003EScalarNodeDeserializer(attemptUnknownTypeDeserialization, typeConverter, BuildTypeInspector(), yamlFormatter, enumNamingConvention)
			},
			{
				typeof(StaticArrayNodeDeserializer),
				(_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing _) => new StaticArrayNodeDeserializer(factory)
			},
			{
				typeof(StaticDictionaryNodeDeserializer),
				(_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing _) => new StaticDictionaryNodeDeserializer(factory, duplicateKeyChecking)
			},
			{
				typeof(StaticCollectionNodeDeserializer),
				(_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing _) => new StaticCollectionNodeDeserializer(factory)
			},
			{
				typeof(_003C61a57b16_002Dd2d5_002D4625_002D9683_002Dc29ea0dc3551_003EObjectNodeDeserializer),
				(_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing _) => new _003C61a57b16_002Dd2d5_002D4625_002D9683_002Dc29ea0dc3551_003EObjectNodeDeserializer(factory, BuildTypeInspector(), ignoreUnmatched, duplicateKeyChecking, typeConverter, enumNamingConvention, enforceNullability, caseInsensitivePropertyMatching, enforceRequiredProperties: false, BuildTypeConverters())
			}
		};
		nodeTypeResolverFactories = new _003C2cd31a20_002D83ff_002D4e8e_002D9b5c_002D5f71fde1499d_003ELazyComponentRegistrationList<_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing, _003C5d87a147_002Dae74_002D49a7_002D8626_002Dec84a8adca93_003EINodeTypeResolver>
		{
			{
				typeof(_003Ce1985726_002D4932_002D48d0_002Da4ea_002Dbee25a0948c0_003EMappingNodeTypeResolver),
				(_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing _) => new _003Ce1985726_002D4932_002D48d0_002Da4ea_002Dbee25a0948c0_003EMappingNodeTypeResolver(typeMappings)
			},
			{
				typeof(_003C7b986cb8_002Dd99c_002D4683_002Da849_002D48026185c6d9_003EYamlConvertibleTypeResolver),
				(_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing _) => new _003C7b986cb8_002Dd99c_002D4683_002Da849_002D48026185c6d9_003EYamlConvertibleTypeResolver()
			},
			{
				typeof(_003C934d5171_002Deb6d_002D464b_002Db6bb_002Da90f5e935455_003EYamlSerializableTypeResolver),
				(_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing _) => new _003C934d5171_002Deb6d_002D464b_002Db6bb_002Da90f5e935455_003EYamlSerializableTypeResolver()
			},
			{
				typeof(_003Cf4583779_002Deac1_002D4752_002D8d51_002D913dafb22149_003ETagNodeTypeResolver),
				(_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing _) => new _003Cf4583779_002Deac1_002D4752_002D8d51_002D913dafb22149_003ETagNodeTypeResolver(tagMappings)
			},
			{
				typeof(_003Cdbdb60f1_002D389a_002D4193_002Da6d6_002De172d91f911e_003EPreventUnknownTagsNodeTypeResolver),
				(_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing _) => new _003Cdbdb60f1_002D389a_002D4193_002Da6d6_002De172d91f911e_003EPreventUnknownTagsNodeTypeResolver()
			},
			{
				typeof(_003C001da766_002Dd948_002D452c_002Daa06_002Dfcea59410c62_003EDefaultContainersNodeTypeResolver),
				(_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing _) => new _003C001da766_002Dd948_002D452c_002Daa06_002Dfcea59410c62_003EDefaultContainersNodeTypeResolver()
			}
		};
		typeConverter = new NullTypeConverter();
	}

	public _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector BuildTypeInspector()
	{
		_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector = context.GetTypeInspector();
		return typeInspectorFactories.BuildComponentChain(typeInspector);
	}

	public StaticDeserializerBuilder WithAttemptingUnquotedStringTypeDeserialization()
	{
		attemptUnknownTypeDeserialization = true;
		return this;
	}

	public StaticDeserializerBuilder WithNodeDeserializer(_003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer nodeDeserializer)
	{
		return WithNodeDeserializer(nodeDeserializer, (_003Ce90b0d63_002D97fe_002D48e5_002D8aba_002D6bd8b2703b95_003EIRegistrationLocationSelectionSyntax<_003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer> w) =>
		{
			w.OnTop();
		});
	}

	public StaticDeserializerBuilder WithNodeDeserializer(_003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer nodeDeserializer, Action<_003Ce90b0d63_002D97fe_002D48e5_002D8aba_002D6bd8b2703b95_003EIRegistrationLocationSelectionSyntax<_003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer>> where)
	{
		if (nodeDeserializer == null)
		{
			throw new ArgumentNullException("nodeDeserializer");
		}
		if (where == null)
		{
			throw new ArgumentNullException("where");
		}
		where(nodeDeserializerFactories.CreateRegistrationLocationSelector(nodeDeserializer.GetType(), (_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing _) => nodeDeserializer));
		return this;
	}

	public StaticDeserializerBuilder WithNodeDeserializer<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)] TNodeDeserializer>(_003Cd39f13d8_002Df580_002D4171_002Da00c_002Dc44ac6e939ed_003EWrapperFactory<_003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer, TNodeDeserializer> nodeDeserializerFactory, Action<_003C7b4f1b17_002D7cba_002D4703_002D871c_002Da756aba66c35_003EITrackingRegistrationLocationSelectionSyntax<_003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer>> where) where TNodeDeserializer : _003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer
	{
		if (nodeDeserializerFactory == null)
		{
			throw new ArgumentNullException("nodeDeserializerFactory");
		}
		if (where == null)
		{
			throw new ArgumentNullException("where");
		}
		where(nodeDeserializerFactories.CreateTrackingRegistrationLocationSelector(typeof(TNodeDeserializer), (_003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer wrapped, _003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing _) => nodeDeserializerFactory(wrapped)));
		return this;
	}

	public StaticDeserializerBuilder WithCaseInsensitivePropertyMatching()
	{
		caseInsensitivePropertyMatching = true;
		return this;
	}

	public StaticDeserializerBuilder WithEnforceNullability()
	{
		enforceNullability = true;
		return this;
	}

	public StaticDeserializerBuilder WithoutNodeDeserializer<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)] TNodeDeserializer>() where TNodeDeserializer : _003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer
	{
		return WithoutNodeDeserializer(typeof(TNodeDeserializer));
	}

	public StaticDeserializerBuilder WithoutNodeDeserializer(Type nodeDeserializerType)
	{
		if (nodeDeserializerType == null)
		{
			throw new ArgumentNullException("nodeDeserializerType");
		}
		nodeDeserializerFactories.Remove(nodeDeserializerType);
		return this;
	}

	public StaticDeserializerBuilder WithTypeDiscriminatingNodeDeserializer(Action<ITypeDiscriminatingNodeDeserializerOptions> configureTypeDiscriminatingNodeDeserializerOptions, int maxDepth = -1, int maxLength = -1)
	{
		TypeDiscriminatingNodeDeserializerOptions typeDiscriminatingNodeDeserializerOptions = new TypeDiscriminatingNodeDeserializerOptions();
		configureTypeDiscriminatingNodeDeserializerOptions(typeDiscriminatingNodeDeserializerOptions);
		TypeDiscriminatingNodeDeserializer nodeDeserializer = new TypeDiscriminatingNodeDeserializer(nodeDeserializerFactories.BuildComponentList(), typeDiscriminatingNodeDeserializerOptions.discriminators, maxDepth, maxLength);
		return WithNodeDeserializer(nodeDeserializer, (_003Ce90b0d63_002D97fe_002D48e5_002D8aba_002D6bd8b2703b95_003EIRegistrationLocationSelectionSyntax<_003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer> s) =>
		{
			s.Before<_003C84b07f27_002D201c_002D476c_002Dabb7_002D690f9cc013ce_003EDictionaryNodeDeserializer>();
		});
	}

	public StaticDeserializerBuilder WithNodeTypeResolver(_003C5d87a147_002Dae74_002D49a7_002D8626_002Dec84a8adca93_003EINodeTypeResolver nodeTypeResolver)
	{
		return WithNodeTypeResolver(nodeTypeResolver, (_003Ce90b0d63_002D97fe_002D48e5_002D8aba_002D6bd8b2703b95_003EIRegistrationLocationSelectionSyntax<_003C5d87a147_002Dae74_002D49a7_002D8626_002Dec84a8adca93_003EINodeTypeResolver> w) =>
		{
			w.OnTop();
		});
	}

	public StaticDeserializerBuilder WithNodeTypeResolver(_003C5d87a147_002Dae74_002D49a7_002D8626_002Dec84a8adca93_003EINodeTypeResolver nodeTypeResolver, Action<_003Ce90b0d63_002D97fe_002D48e5_002D8aba_002D6bd8b2703b95_003EIRegistrationLocationSelectionSyntax<_003C5d87a147_002Dae74_002D49a7_002D8626_002Dec84a8adca93_003EINodeTypeResolver>> where)
	{
		if (nodeTypeResolver == null)
		{
			throw new ArgumentNullException("nodeTypeResolver");
		}
		if (where == null)
		{
			throw new ArgumentNullException("where");
		}
		where(nodeTypeResolverFactories.CreateRegistrationLocationSelector(nodeTypeResolver.GetType(), (_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing _) => nodeTypeResolver));
		return this;
	}

	public StaticDeserializerBuilder WithNodeTypeResolver<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)] TNodeTypeResolver>(_003Cd39f13d8_002Df580_002D4171_002Da00c_002Dc44ac6e939ed_003EWrapperFactory<_003C5d87a147_002Dae74_002D49a7_002D8626_002Dec84a8adca93_003EINodeTypeResolver, TNodeTypeResolver> nodeTypeResolverFactory, Action<_003C7b4f1b17_002D7cba_002D4703_002D871c_002Da756aba66c35_003EITrackingRegistrationLocationSelectionSyntax<_003C5d87a147_002Dae74_002D49a7_002D8626_002Dec84a8adca93_003EINodeTypeResolver>> where) where TNodeTypeResolver : _003C5d87a147_002Dae74_002D49a7_002D8626_002Dec84a8adca93_003EINodeTypeResolver
	{
		if (nodeTypeResolverFactory == null)
		{
			throw new ArgumentNullException("nodeTypeResolverFactory");
		}
		if (where == null)
		{
			throw new ArgumentNullException("where");
		}
		where(nodeTypeResolverFactories.CreateTrackingRegistrationLocationSelector(typeof(TNodeTypeResolver), (_003C5d87a147_002Dae74_002D49a7_002D8626_002Dec84a8adca93_003EINodeTypeResolver wrapped, _003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing _) => nodeTypeResolverFactory(wrapped)));
		return this;
	}

	public StaticDeserializerBuilder WithoutNodeTypeResolver<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)] TNodeTypeResolver>() where TNodeTypeResolver : _003C5d87a147_002Dae74_002D49a7_002D8626_002Dec84a8adca93_003EINodeTypeResolver
	{
		return WithoutNodeTypeResolver(typeof(TNodeTypeResolver));
	}

	public StaticDeserializerBuilder WithoutNodeTypeResolver(Type nodeTypeResolverType)
	{
		if (nodeTypeResolverType == null)
		{
			throw new ArgumentNullException("nodeTypeResolverType");
		}
		nodeTypeResolverFactories.Remove(nodeTypeResolverType);
		return this;
	}

	public override StaticDeserializerBuilder WithTagMapping(_003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName tag, Type type)
	{
		if (tag.IsEmpty)
		{
			throw new ArgumentException("Non-specific tags cannot be maped");
		}
		if (type == null)
		{
			throw new ArgumentNullException("type");
		}
		if (tagMappings.TryGetValue(tag, out var value))
		{
			throw new ArgumentException($"Type already has a registered type '{value.FullName}' for tag '{tag}'", "tag");
		}
		tagMappings.Add(tag, type);
		return this;
	}

	public StaticDeserializerBuilder WithTypeMapping<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TInterface, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)] TConcrete>() where TConcrete : TInterface
	{
		Type typeFromHandle = typeof(TInterface);
		Type typeFromHandle2 = typeof(TConcrete);
		if (!typeFromHandle.IsAssignableFrom(typeFromHandle2))
		{
			throw new InvalidOperationException("The type '" + typeFromHandle2.Name + "' does not implement interface '" + typeFromHandle.Name + "'.");
		}
		typeMappings[typeFromHandle] = typeFromHandle2;
		return this;
	}

	public StaticDeserializerBuilder WithoutTagMapping(_003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName tag)
	{
		if (tag.IsEmpty)
		{
			throw new ArgumentException("Non-specific tags cannot be maped");
		}
		if (!tagMappings.Remove(tag))
		{
			throw new KeyNotFoundException($"Tag '{tag}' is not registered");
		}
		return this;
	}

	public StaticDeserializerBuilder IgnoreUnmatchedProperties()
	{
		ignoreUnmatched = true;
		return this;
	}

	public StaticDeserializerBuilder WithDuplicateKeyChecking()
	{
		duplicateKeyChecking = true;
		return this;
	}

	public _003Cdd442f31_002Dab93_002D475f_002Da633_002D58df98d94172_003EIDeserializer Build()
	{
		return _003C2aa38692_002Dee91_002D43ae_002D9a5e_002D18f66e95392e_003EDeserializer.FromValueDeserializer(BuildValueDeserializer());
	}

	public _003Cc60e9164_002D145a_002D4198_002Db719_002D2e6f55daf468_003EIValueDeserializer BuildValueDeserializer()
	{
		return new _003Cc5c4885e_002Db415_002D4e1d_002Da896_002D3732a2f3a868_003EAliasValueDeserializer(new _003C44ba44a9_002Dc9b3_002D4f38_002Da999_002D5728ecc0f513_003ENodeValueDeserializer(nodeDeserializerFactories.BuildComponentList(), nodeTypeResolverFactories.BuildComponentList(), typeConverter, enumNamingConvention, BuildTypeInspector()));
	}
}
