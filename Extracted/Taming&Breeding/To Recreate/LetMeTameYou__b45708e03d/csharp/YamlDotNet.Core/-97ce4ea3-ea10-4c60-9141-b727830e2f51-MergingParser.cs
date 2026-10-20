using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Core;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C97ce4ea3_002Dea10_002D4c60_002D9141_002Db727830e2f51_003EMergingParser : _003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser
{
	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
	private sealed class ParsingEventCollection : IEnumerable<LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent>>, IEnumerable
	{
		private readonly LinkedList<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> events;

		private readonly HashSet<LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent>> deleted;

		private readonly Dictionary<_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName, LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent>> references;

		public ParsingEventCollection()
		{
			events = new LinkedList<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent>();
			deleted = new HashSet<LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent>>();
			references = new Dictionary<_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName, LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent>>();
		}

		public void AddAfter(LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> node, IEnumerable<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> items)
		{
			foreach (_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent item in items)
			{
				node = events.AddAfter(node, item);
			}
		}

		public void Add(_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent item)
		{
			LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> node = events.AddLast(item);
			AddReference(item, node);
		}

		public void MarkDeleted(LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> node)
		{
			deleted.Add(node);
		}

		public bool IsDeleted(LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> node)
		{
			return deleted.Contains(node);
		}

		public void CleanMarked()
		{
			foreach (LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> item in deleted)
			{
				events.Remove(item);
			}
		}

		public IEnumerable<LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent>> FromAnchor(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName anchor)
		{
			LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> next = references[anchor].Next;
			return Enumerate(next);
		}

		public IEnumerator<LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent>> GetEnumerator()
		{
			return Enumerate(events.First).GetEnumerator();
		}

		IEnumerator IEnumerable.GetEnumerator()
		{
			return GetEnumerator();
		}

		private static IEnumerable<LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent>> Enumerate([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 2, 1 })] LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> node)
		{
			while (node != null)
			{
				yield return node;
				node = node.Next;
			}
		}

		private void AddReference(_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent item, LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> node)
		{
			if (item is _003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart { Anchor: { IsEmpty: false } anchor })
			{
				references[anchor] = node;
			}
		}
	}

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
	private sealed class ParsingEventCloner : _003C8e45faab_002D558f_002D4b7c_002D9be7_002Dfe61db5e445f_003EIParsingEventVisitor
	{
		[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
		private _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent clonedEvent;

		public _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent Clone(_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent e)
		{
			e.Accept(this);
			if (clonedEvent == null)
			{
				throw new InvalidOperationException($"Could not clone event of type '{e.Type}'");
			}
			return clonedEvent;
		}

		void _003C8e45faab_002D558f_002D4b7c_002D9be7_002Dfe61db5e445f_003EIParsingEventVisitor.Visit(_003C3010bf72_002Dd2cd_002D45d1_002D9245_002Db3b55fbfa5a0_003EAnchorAlias e)
		{
			clonedEvent = new _003C3010bf72_002Dd2cd_002D45d1_002D9245_002Db3b55fbfa5a0_003EAnchorAlias(e.Value, e.Start, e.End);
		}

		void _003C8e45faab_002D558f_002D4b7c_002D9be7_002Dfe61db5e445f_003EIParsingEventVisitor.Visit(_003Cd41714f7_002D4f61_002D432e_002D8a83_002Ded593f31e526_003EStreamStart e)
		{
			throw new NotSupportedException();
		}

		void _003C8e45faab_002D558f_002D4b7c_002D9be7_002Dfe61db5e445f_003EIParsingEventVisitor.Visit(_003C50667387_002D32a0_002D4cfa_002D90ba_002D9e18d76632e5_003EStreamEnd e)
		{
			throw new NotSupportedException();
		}

		void _003C8e45faab_002D558f_002D4b7c_002D9be7_002Dfe61db5e445f_003EIParsingEventVisitor.Visit(_003C11d343a3_002Dad11_002D4df1_002D9f55_002Da2bc7ef77934_003EDocumentStart e)
		{
			throw new NotSupportedException();
		}

		void _003C8e45faab_002D558f_002D4b7c_002D9be7_002Dfe61db5e445f_003EIParsingEventVisitor.Visit(_003C7d138b59_002Dd981_002D4379_002Daac9_002D8cdf906ac673_003EDocumentEnd e)
		{
			throw new NotSupportedException();
		}

		void _003C8e45faab_002D558f_002D4b7c_002D9be7_002Dfe61db5e445f_003EIParsingEventVisitor.Visit(_003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar e)
		{
			clonedEvent = new _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName.Empty, e.Tag, e.Value, e.Style, e.IsPlainImplicit, e.IsQuotedImplicit, e.Start, e.End);
		}

		void _003C8e45faab_002D558f_002D4b7c_002D9be7_002Dfe61db5e445f_003EIParsingEventVisitor.Visit(_003C9f7de5d2_002Dfe16_002D493d_002D8158_002D378a5bfd51bb_003ESequenceStart e)
		{
			clonedEvent = new _003C9f7de5d2_002Dfe16_002D493d_002D8158_002D378a5bfd51bb_003ESequenceStart(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName.Empty, e.Tag, e.IsImplicit, e.Style, e.Start, e.End);
		}

		void _003C8e45faab_002D558f_002D4b7c_002D9be7_002Dfe61db5e445f_003EIParsingEventVisitor.Visit(_003Caa8581b2_002D1caa_002D46f6_002Db8ec_002D0b62fd9dce90_003ESequenceEnd e)
		{
			clonedEvent = new _003Caa8581b2_002D1caa_002D46f6_002Db8ec_002D0b62fd9dce90_003ESequenceEnd(e.Start, e.End);
		}

		void _003C8e45faab_002D558f_002D4b7c_002D9be7_002Dfe61db5e445f_003EIParsingEventVisitor.Visit(_003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart e)
		{
			clonedEvent = new _003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName.Empty, e.Tag, e.IsImplicit, e.Style, e.Start, e.End);
		}

		void _003C8e45faab_002D558f_002D4b7c_002D9be7_002Dfe61db5e445f_003EIParsingEventVisitor.Visit(_003C446b682a_002D36b6_002D46ea_002Db1c3_002D0616b60e5c52_003EMappingEnd e)
		{
			clonedEvent = new _003C446b682a_002D36b6_002D46ea_002Db1c3_002D0616b60e5c52_003EMappingEnd(e.Start, e.End);
		}

		void _003C8e45faab_002D558f_002D4b7c_002D9be7_002Dfe61db5e445f_003EIParsingEventVisitor.Visit(_003C287713a7_002D26e2_002D40c3_002Dbfea_002D1c61c7a66cba_003EComment e)
		{
			throw new NotSupportedException();
		}
	}

	private readonly ParsingEventCollection events;

	private readonly _003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser innerParser;

	private IEnumerator<LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent>> iterator;

	private bool merged;

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent Current
	{
		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
		get
		{
			return iterator.Current?.Value;
		}
	}

	public _003C97ce4ea3_002Dea10_002D4c60_002D9141_002Db727830e2f51_003EMergingParser(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser innerParser)
	{
		events = new ParsingEventCollection();
		merged = false;
		iterator = events.GetEnumerator();
		this.innerParser = innerParser;
	}

	public bool MoveNext()
	{
		if (!merged)
		{
			Merge();
			events.CleanMarked();
			iterator = events.GetEnumerator();
			merged = true;
		}
		return iterator.MoveNext();
	}

	private void Merge()
	{
		while (innerParser.MoveNext())
		{
			events.Add(innerParser.Current);
		}
		foreach (LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> @event in events)
		{
			if (IsMergeToken(@event))
			{
				events.MarkDeleted(@event);
				if (!HandleMerge(@event.Next))
				{
					throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(@event.Value.Start, @event.Value.End, "Unrecognized merge key pattern");
				}
			}
		}
	}

	private bool HandleMerge([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 2, 1 })] LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> node)
	{
		if (node == null)
		{
			return false;
		}
		if (node.Value is _003C3010bf72_002Dd2cd_002D45d1_002D9245_002Db3b55fbfa5a0_003EAnchorAlias anchorAlias)
		{
			return HandleAnchorAlias(node, node, anchorAlias);
		}
		if (node.Value is _003C9f7de5d2_002Dfe16_002D493d_002D8158_002D378a5bfd51bb_003ESequenceStart)
		{
			return HandleSequence(node);
		}
		return false;
	}

	private bool HandleMergeSequence(LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> sequenceStart, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 2, 1 })] LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> node)
	{
		if (node == null)
		{
			return false;
		}
		if (node.Value is _003C3010bf72_002Dd2cd_002D45d1_002D9245_002Db3b55fbfa5a0_003EAnchorAlias anchorAlias)
		{
			return HandleAnchorAlias(sequenceStart, node, anchorAlias);
		}
		if (node.Value is _003C9f7de5d2_002Dfe16_002D493d_002D8158_002D378a5bfd51bb_003ESequenceStart)
		{
			return HandleSequence(node);
		}
		return false;
	}

	private static bool IsMergeToken(LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> node)
	{
		if (node.Value is _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar obj)
		{
			return obj.Value == "<<";
		}
		return false;
	}

	private bool HandleAnchorAlias(LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> node, LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> anchorNode, _003C3010bf72_002Dd2cd_002D45d1_002D9245_002Db3b55fbfa5a0_003EAnchorAlias anchorAlias)
	{
		IEnumerable<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> mappingEvents = GetMappingEvents(anchorAlias.Value);
		events.AddAfter(node, mappingEvents);
		events.MarkDeleted(anchorNode);
		return true;
	}

	private bool HandleSequence(LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> node)
	{
		events.MarkDeleted(node);
		LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> linkedListNode = node;
		while (linkedListNode != null)
		{
			if (linkedListNode.Value is _003Caa8581b2_002D1caa_002D46f6_002Db8ec_002D0b62fd9dce90_003ESequenceEnd)
			{
				events.MarkDeleted(linkedListNode);
				return true;
			}
			LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> next = linkedListNode.Next;
			HandleMergeSequence(node, next);
			linkedListNode = next;
		}
		return true;
	}

	private IEnumerable<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> GetMappingEvents(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName anchor)
	{
		ParsingEventCloner parsingEventCloner = new ParsingEventCloner();
		int nesting = 0;
		return (from e in events.FromAnchor(anchor)
			where !events.IsDeleted(e)
			select e.Value).TakeWhile([_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent e) => (nesting += e.NestingIncrease) >= 0).Select(parsingEventCloner.Clone);
	}
}
