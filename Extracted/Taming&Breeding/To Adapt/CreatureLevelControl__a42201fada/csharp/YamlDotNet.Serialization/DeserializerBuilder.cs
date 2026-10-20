using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Serialization.NamingConventions;
using YamlDotNet.Serialization.NodeDeserializers;
using YamlDotNet.Serialization.NodeTypeResolvers;
using YamlDotNet.Serialization.ObjectFactories;
using YamlDotNet.Serialization.Schemas;
using YamlDotNet.Serialization.TypeInspectors;
using YamlDotNet.Serialization.TypeResolvers;
using YamlDotNet.Serialization.ValueDeserializers;

namespace YamlDotNet.Serialization;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(new byte[] { 0, 1 })]
internal sealed class DeserializerBuilder : BuilderSkeleton<DeserializerBuilder>
{
	private IObjectFactory objectFactory = new DefaultObjectFactory();

	private readonly LazyComponentRegistrationList<Nothing, INodeDeserializer> nodeDeserializerFactories;

	private readonly LazyComponentRegistrationList<Nothing, INodeTypeResolver> nodeTypeResolverFactories;

	private readonly Dictionary<TagName, Type> tagMappings;

	private bool ignoreUnmatched;

	protected override DeserializerBuilder Self => this;

	public DeserializerBuilder()
		: base((ITypeResolver)new StaticTypeResolver())
	{
		tagMappings = new Dictionary<TagName, Type>
		{
			{
				FailsafeSchema.Tags.Map,
				typeof(Dictionary<object, object>)
			},
			{
				FailsafeSchema.Tags.Str,
				typeof(string)
			},
			{
				JsonSchema.Tags.Bool,
				typeof(bool)
			},
			{
				JsonSchema.Tags.Float,
				typeof(double)
			},
			{
				JsonSchema.Tags.Int,
				typeof(int)
			},
			{
				DefaultSchema.Tags.Timestamp,
				typeof(DateTime)
			}
		};
		typeInspectorFactories.Add(typeof(CachedTypeInspector), (ITypeInspector inner) => new CachedTypeInspector(inner));
		typeInspectorFactories.Add(typeof(NamingConventionTypeInspector), (ITypeInspector inner) => (!(namingConvention is NullNamingConvention)) ? new NamingConventionTypeInspector(inner, namingConvention) : inner);
		typeInspectorFactories.Add(typeof(YamlAttributesTypeInspector), (ITypeInspector inner) => new YamlAttributesTypeInspector(inner));
		typeInspectorFactories.Add(typeof(YamlAttributeOverridesInspector), (ITypeInspector inner) => (overrides == null) ? inner : new YamlAttributeOverridesInspector(inner, overrides.Clone()));
		typeInspectorFactories.Add(typeof(ReadableAndWritablePropertiesTypeInspector), (ITypeInspector inner) => new ReadableAndWritablePropertiesTypeInspector(inner));
		nodeDeserializerFactories = new LazyComponentRegistrationList<Nothing, INodeDeserializer>
		{
			{
				typeof(YamlConvertibleNodeDeserializer),
				(Nothing _) => new YamlConvertibleNodeDeserializer(objectFactory)
			},
			{
				typeof(YamlSerializableNodeDeserializer),
				(Nothing _) => new YamlSerializableNodeDeserializer(objectFactory)
			},
			{
				typeof(TypeConverterNodeDeserializer),
				(Nothing _) => new TypeConverterNodeDeserializer(BuildTypeConverters())
			},
			{
				typeof(NullNodeDeserializer),
				(Nothing _) => new NullNodeDeserializer()
			},
			{
				typeof(ScalarNodeDeserializer),
				(Nothing _) => new ScalarNodeDeserializer()
			},
			{
				typeof(ArrayNodeDeserializer),
				(Nothing _) => new ArrayNodeDeserializer()
			},
			{
				typeof(DictionaryNodeDeserializer),
				(Nothing _) => new DictionaryNodeDeserializer(objectFactory)
			},
			{
				typeof(CollectionNodeDeserializer),
				(Nothing _) => new CollectionNodeDeserializer(objectFactory)
			},
			{
				typeof(EnumerableNodeDeserializer),
				(Nothing _) => new EnumerableNodeDeserializer()
			},
			{
				typeof(ObjectNodeDeserializer),
				(Nothing _) => new ObjectNodeDeserializer(objectFactory, BuildTypeInspector(), ignoreUnmatched)
			}
		};
		nodeTypeResolverFactories = new LazyComponentRegistrationList<Nothing, INodeTypeResolver>
		{
			{
				typeof(YamlConvertibleTypeResolver),
				(Nothing _) => new YamlConvertibleTypeResolver()
			},
			{
				typeof(YamlSerializableTypeResolver),
				(Nothing _) => new YamlSerializableTypeResolver()
			},
			{
				typeof(TagNodeTypeResolver),
				(Nothing _) => new TagNodeTypeResolver(tagMappings)
			},
			{
				typeof(PreventUnknownTagsNodeTypeResolver),
				(Nothing _) => new PreventUnknownTagsNodeTypeResolver()
			},
			{
				typeof(DefaultContainersNodeTypeResolver),
				(Nothing _) => new DefaultContainersNodeTypeResolver()
			}
		};
	}

	public DeserializerBuilder WithObjectFactory(IObjectFactory objectFactory)
	{
		this.objectFactory = objectFactory ?? throw new ArgumentNullException("objectFactory");
		return this;
	}

	public DeserializerBuilder WithObjectFactory(Func<Type, object> objectFactory)
	{
		if (objectFactory == null)
		{
			throw new ArgumentNullException("objectFactory");
		}
		return WithObjectFactory(new LambdaObjectFactory(objectFactory));
	}

	public DeserializerBuilder WithNodeDeserializer(INodeDeserializer nodeDeserializer)
	{
		return WithNodeDeserializer(nodeDeserializer, (IRegistrationLocationSelectionSyntax<INodeDeserializer> w) =>
		{
			w.OnTop();
		});
	}

	public DeserializerBuilder WithNodeDeserializer(INodeDeserializer nodeDeserializer, Action<IRegistrationLocationSelectionSyntax<INodeDeserializer>> where)
	{
		if (nodeDeserializer == null)
		{
			throw new ArgumentNullException("nodeDeserializer");
		}
		if (where == null)
		{
			throw new ArgumentNullException("where");
		}
		where(nodeDeserializerFactories.CreateRegistrationLocationSelector(nodeDeserializer.GetType(), (Nothing _) => nodeDeserializer));
		return this;
	}

	public DeserializerBuilder WithNodeDeserializer<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] TNodeDeserializer>(WrapperFactory<INodeDeserializer, TNodeDeserializer> nodeDeserializerFactory, Action<ITrackingRegistrationLocationSelectionSyntax<INodeDeserializer>> where) where TNodeDeserializer : INodeDeserializer
	{
		if (nodeDeserializerFactory == null)
		{
			throw new ArgumentNullException("nodeDeserializerFactory");
		}
		if (where == null)
		{
			throw new ArgumentNullException("where");
		}
		where(nodeDeserializerFactories.CreateTrackingRegistrationLocationSelector(typeof(TNodeDeserializer), (INodeDeserializer wrapped, Nothing _) => nodeDeserializerFactory(wrapped)));
		return this;
	}

	public DeserializerBuilder WithoutNodeDeserializer<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] TNodeDeserializer>() where TNodeDeserializer : INodeDeserializer
	{
		return WithoutNodeDeserializer(typeof(TNodeDeserializer));
	}

	public DeserializerBuilder WithoutNodeDeserializer(Type nodeDeserializerType)
	{
		if (nodeDeserializerType == null)
		{
			throw new ArgumentNullException("nodeDeserializerType");
		}
		nodeDeserializerFactories.Remove(nodeDeserializerType);
		return this;
	}

	public DeserializerBuilder WithNodeTypeResolver(INodeTypeResolver nodeTypeResolver)
	{
		return WithNodeTypeResolver(nodeTypeResolver, (IRegistrationLocationSelectionSyntax<INodeTypeResolver> w) =>
		{
			w.OnTop();
		});
	}

	public DeserializerBuilder WithNodeTypeResolver(INodeTypeResolver nodeTypeResolver, Action<IRegistrationLocationSelectionSyntax<INodeTypeResolver>> where)
	{
		if (nodeTypeResolver == null)
		{
			throw new ArgumentNullException("nodeTypeResolver");
		}
		if (where == null)
		{
			throw new ArgumentNullException("where");
		}
		where(nodeTypeResolverFactories.CreateRegistrationLocationSelector(nodeTypeResolver.GetType(), (Nothing _) => nodeTypeResolver));
		return this;
	}

	public DeserializerBuilder WithNodeTypeResolver<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] TNodeTypeResolver>(WrapperFactory<INodeTypeResolver, TNodeTypeResolver> nodeTypeResolverFactory, Action<ITrackingRegistrationLocationSelectionSyntax<INodeTypeResolver>> where) where TNodeTypeResolver : INodeTypeResolver
	{
		if (nodeTypeResolverFactory == null)
		{
			throw new ArgumentNullException("nodeTypeResolverFactory");
		}
		if (where == null)
		{
			throw new ArgumentNullException("where");
		}
		where(nodeTypeResolverFactories.CreateTrackingRegistrationLocationSelector(typeof(TNodeTypeResolver), (INodeTypeResolver wrapped, Nothing _) => nodeTypeResolverFactory(wrapped)));
		return this;
	}

	public DeserializerBuilder WithoutNodeTypeResolver<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] TNodeTypeResolver>() where TNodeTypeResolver : INodeTypeResolver
	{
		return WithoutNodeTypeResolver(typeof(TNodeTypeResolver));
	}

	public DeserializerBuilder WithoutNodeTypeResolver(Type nodeTypeResolverType)
	{
		if (nodeTypeResolverType == null)
		{
			throw new ArgumentNullException("nodeTypeResolverType");
		}
		nodeTypeResolverFactories.Remove(nodeTypeResolverType);
		return this;
	}

	public override DeserializerBuilder WithTagMapping(TagName tag, Type type)
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

	public DeserializerBuilder WithoutTagMapping(TagName tag)
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

	public DeserializerBuilder IgnoreUnmatchedProperties()
	{
		ignoreUnmatched = true;
		return this;
	}

	public IDeserializer Build()
	{
		return Deserializer.FromValueDeserializer(BuildValueDeserializer());
	}

	public IValueDeserializer BuildValueDeserializer()
	{
		return new AliasValueDeserializer(new NodeValueDeserializer(nodeDeserializerFactories.BuildComponentList(), nodeTypeResolverFactories.BuildComponentList()));
	}
}
