using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization.ValueDeserializers;

internal sealed class AliasValueDeserializer : IValueDeserializer
{
	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(new byte[] { 0, 1 })]
	private sealed class AliasState : Dictionary<AnchorName, ValuePromise>, IPostDeserializationCallback
	{
		public void OnDeserialization()
		{
			foreach (ValuePromise value in Values)
			{
				if (!value.HasValue)
				{
					AnchorAlias alias = value.Alias;
					throw new AnchorNotFoundException(alias.Start, alias.End, $"Anchor '{alias.Value}' not found");
				}
			}
		}
	}

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
	private sealed class ValuePromise : IValuePromise
	{
		private object value;

		public readonly AnchorAlias Alias;

		public bool HasValue { get; private set; }

		public object Value
		{
			get
			{
				if (!HasValue)
				{
					throw new InvalidOperationException("Value not set");
				}
				return value;
			}
			set
			{
				if (HasValue)
				{
					throw new InvalidOperationException("Value already set");
				}
				HasValue = true;
				this.value = value;
				ValueAvailable?.Invoke(value);
			}
		}

		public event Action<object> ValueAvailable;

		[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
		public ValuePromise(AnchorAlias alias)
		{
			Alias = alias;
		}

		public ValuePromise(object value)
		{
			HasValue = true;
			this.value = value;
		}
	}

	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(1)]
	private readonly IValueDeserializer innerDeserializer;

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	public AliasValueDeserializer(IValueDeserializer innerDeserializer)
	{
		this.innerDeserializer = innerDeserializer ?? throw new ArgumentNullException("innerDeserializer");
	}

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	[return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	public object DeserializeValue(IParser parser, Type expectedType, SerializerState state, IValueDeserializer nestedObjectDeserializer)
	{
		if (parser.TryConsume<AnchorAlias>(out var @event))
		{
			if (!state.Get<AliasState>().TryGetValue(@event.Value, out var value))
			{
				throw new AnchorNotFoundException(@event.Start, @event.End, $"Alias ${@event.Value} cannot precede anchor declaration");
			}
			if (!value.HasValue)
			{
				return value;
			}
			return value.Value;
		}
		AnchorName anchorName = AnchorName.Empty;
		if (parser.Accept<NodeEvent>(out var event2) && !event2.Anchor.IsEmpty)
		{
			anchorName = event2.Anchor;
			AliasState aliasState = state.Get<AliasState>();
			if (!aliasState.ContainsKey(anchorName))
			{
				aliasState[anchorName] = new ValuePromise(new AnchorAlias(anchorName));
			}
		}
		object obj = innerDeserializer.DeserializeValue(parser, expectedType, state, nestedObjectDeserializer);
		if (!anchorName.IsEmpty)
		{
			AliasState aliasState2 = state.Get<AliasState>();
			if (!aliasState2.TryGetValue(anchorName, out var value2))
			{
				aliasState2.Add(anchorName, new ValuePromise(obj));
			}
			else if (!value2.HasValue)
			{
				value2.Value = obj;
			}
			else
			{
				aliasState2[anchorName] = new ValuePromise(obj);
			}
		}
		return obj;
	}
}
