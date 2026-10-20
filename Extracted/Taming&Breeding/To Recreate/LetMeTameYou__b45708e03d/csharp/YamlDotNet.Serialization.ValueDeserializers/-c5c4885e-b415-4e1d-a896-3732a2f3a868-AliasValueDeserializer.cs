using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization.ValueDeserializers;

internal sealed class _003Cc5c4885e_002Db415_002D4e1d_002Da896_002D3732a2f3a868_003EAliasValueDeserializer : _003Cc60e9164_002D145a_002D4198_002Db719_002D2e6f55daf468_003EIValueDeserializer
{
	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 0, 1 })]
	private sealed class AliasState : Dictionary<_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName, ValuePromise>, _003C6971e000_002Dcc4f_002D4cc3_002D9ada_002Da4855b120d57_003EIPostDeserializationCallback
	{
		public void OnDeserialization()
		{
			foreach (ValuePromise value in Values)
			{
				if (!value.HasValue)
				{
					_003C3010bf72_002Dd2cd_002D45d1_002D9245_002Db3b55fbfa5a0_003EAnchorAlias alias = value.Alias;
					throw new _003C9c6ae7e0_002D3304_002D4260_002D9e60_002D349a0e3ceca3_003EAnchorNotFoundException(alias.Start, alias.End, $"Anchor '{alias.Value}' not found");
				}
			}
		}
	}

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
	private sealed class ValuePromise : _003C9bf148ef_002Dec3e_002D48e2_002Db55a_002D857a8fcd2a5e_003EIValuePromise
	{
		private object value;

		public readonly _003C3010bf72_002Dd2cd_002D45d1_002D9245_002Db3b55fbfa5a0_003EAnchorAlias Alias;

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

		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
		public ValuePromise(_003C3010bf72_002Dd2cd_002D45d1_002D9245_002Db3b55fbfa5a0_003EAnchorAlias alias)
		{
			Alias = alias;
		}

		public ValuePromise(object value)
		{
			HasValue = true;
			this.value = value;
		}
	}

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(1)]
	private readonly _003Cc60e9164_002D145a_002D4198_002Db719_002D2e6f55daf468_003EIValueDeserializer innerDeserializer;

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	public _003Cc5c4885e_002Db415_002D4e1d_002Da896_002D3732a2f3a868_003EAliasValueDeserializer(_003Cc60e9164_002D145a_002D4198_002Db719_002D2e6f55daf468_003EIValueDeserializer innerDeserializer)
	{
		this.innerDeserializer = innerDeserializer ?? throw new ArgumentNullException("innerDeserializer");
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public object DeserializeValue(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, Type expectedType, _003Cda3bae27_002D43f3_002D4951_002Db3b1_002D1040cb481116_003ESerializerState state, _003Cc60e9164_002D145a_002D4198_002Db719_002D2e6f55daf468_003EIValueDeserializer nestedObjectDeserializer)
	{
		if (parser.TryConsume<_003C3010bf72_002Dd2cd_002D45d1_002D9245_002Db3b55fbfa5a0_003EAnchorAlias>(out var @event))
		{
			AliasState aliasState = state.Get<AliasState>();
			if (!aliasState.TryGetValue(@event.Value, out var value))
			{
				throw new _003C9c6ae7e0_002D3304_002D4260_002D9e60_002D349a0e3ceca3_003EAnchorNotFoundException(@event.Start, @event.End, $"Alias ${@event.Value} cannot precede anchor declaration");
			}
			if (!value.HasValue)
			{
				return value;
			}
			return value.Value;
		}
		_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName obj = _003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName.Empty;
		if (parser.Accept<_003C1af307a4_002D0546_002D4fb8_002D9199_002D3379b8888e00_003ENodeEvent>(out var event2) && !event2.Anchor.IsEmpty)
		{
			obj = event2.Anchor;
			AliasState aliasState2 = state.Get<AliasState>();
			if (!aliasState2.ContainsKey(obj))
			{
				aliasState2[obj] = new ValuePromise(new _003C3010bf72_002Dd2cd_002D45d1_002D9245_002Db3b55fbfa5a0_003EAnchorAlias(obj));
			}
		}
		object obj2 = innerDeserializer.DeserializeValue(parser, expectedType, state, nestedObjectDeserializer);
		if (!obj.IsEmpty)
		{
			AliasState aliasState3 = state.Get<AliasState>();
			if (!aliasState3.TryGetValue(obj, out var value2))
			{
				aliasState3.Add(obj, new ValuePromise(obj2));
			}
			else if (!value2.HasValue)
			{
				value2.Value = obj2;
			}
			else
			{
				aliasState3[obj] = new ValuePromise(obj2);
			}
		}
		return obj2;
	}
}
