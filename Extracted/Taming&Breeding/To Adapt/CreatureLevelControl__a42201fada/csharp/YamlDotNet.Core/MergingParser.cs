using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Core;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class MergingParser : IParser
{
	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
	private sealed class ParsingEventCollection : IEnumerable<LinkedListNode<ParsingEvent>>, IEnumerable
	{
		private readonly LinkedList<ParsingEvent> events;

		private readonly HashSet<LinkedListNode<ParsingEvent>> deleted;

		private readonly Dictionary<AnchorName, LinkedListNode<ParsingEvent>> references;

		public ParsingEventCollection()
		{
			events = new LinkedList<ParsingEvent>();
			deleted = new HashSet<LinkedListNode<ParsingEvent>>();
			references = new Dictionary<AnchorName, LinkedListNode<ParsingEvent>>();
		}

		public void AddAfter(LinkedListNode<ParsingEvent> node, IEnumerable<ParsingEvent> items)
		{
			foreach (ParsingEvent item in items)
			{
				node = events.AddAfter(node, item);
			}
		}

		public void Add(ParsingEvent item)
		{
			LinkedListNode<ParsingEvent> node = events.AddLast(item);
			AddReference(item, node);
		}

		public void MarkDeleted(LinkedListNode<ParsingEvent> node)
		{
			deleted.Add(node);
		}

		public void CleanMarked()
		{
			foreach (LinkedListNode<ParsingEvent> item in deleted)
			{
				events.Remove(item);
			}
		}

		public IEnumerable<LinkedListNode<ParsingEvent>> FromAnchor(AnchorName anchor)
		{
			LinkedListNode<ParsingEvent> next = references[anchor].Next;
			IEnumerator<LinkedListNode<ParsingEvent>> iterator = GetEnumerator(next);
			while (iterator.MoveNext())
			{
				yield return iterator.Current;
			}
		}

		public IEnumerator<LinkedListNode<ParsingEvent>> GetEnumerator()
		{
			return GetEnumerator(events.First);
		}

		IEnumerator IEnumerable.GetEnumerator()
		{
			return GetEnumerator();
		}

		private IEnumerator<LinkedListNode<ParsingEvent>> GetEnumerator([_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(new byte[] { 2, 1 })] LinkedListNode<ParsingEvent> node)
		{
			while (node != null)
			{
				yield return node;
				node = node.Next;
			}
		}

		private void AddReference(ParsingEvent item, LinkedListNode<ParsingEvent> node)
		{
			if (item is MappingStart { Anchor: { IsEmpty: false } anchor })
			{
				references[anchor] = node;
			}
		}
	}

	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
	private sealed class ParsingEventCloner : IParsingEventVisitor
	{
		[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
		private ParsingEvent clonedEvent;

		public ParsingEvent Clone(ParsingEvent e)
		{
			e.Accept(this);
			if (clonedEvent == null)
			{
				throw new InvalidOperationException($"Could not clone event of type '{e.Type}'");
			}
			return clonedEvent;
		}

		void IParsingEventVisitor.Visit(AnchorAlias e)
		{
			clonedEvent = new AnchorAlias(e.Value, e.Start, e.End);
		}

		void IParsingEventVisitor.Visit(StreamStart e)
		{
			throw new NotSupportedException();
		}

		void IParsingEventVisitor.Visit(StreamEnd e)
		{
			throw new NotSupportedException();
		}

		void IParsingEventVisitor.Visit(DocumentStart e)
		{
			throw new NotSupportedException();
		}

		void IParsingEventVisitor.Visit(DocumentEnd e)
		{
			throw new NotSupportedException();
		}

		void IParsingEventVisitor.Visit(Scalar e)
		{
			clonedEvent = new Scalar(AnchorName.Empty, e.Tag, e.Value, e.Style, e.IsPlainImplicit, e.IsQuotedImplicit, e.Start, e.End);
		}

		void IParsingEventVisitor.Visit(SequenceStart e)
		{
			clonedEvent = new SequenceStart(AnchorName.Empty, e.Tag, e.IsImplicit, e.Style, e.Start, e.End);
		}

		void IParsingEventVisitor.Visit(SequenceEnd e)
		{
			clonedEvent = new SequenceEnd(e.Start, e.End);
		}

		void IParsingEventVisitor.Visit(MappingStart e)
		{
			clonedEvent = new MappingStart(AnchorName.Empty, e.Tag, e.IsImplicit, e.Style, e.Start, e.End);
		}

		void IParsingEventVisitor.Visit(MappingEnd e)
		{
			clonedEvent = new MappingEnd(e.Start, e.End);
		}

		void IParsingEventVisitor.Visit(Comment e)
		{
			throw new NotSupportedException();
		}
	}

	private readonly ParsingEventCollection events;

	private readonly IParser innerParser;

	private IEnumerator<LinkedListNode<ParsingEvent>> iterator;

	private bool merged;

	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	public ParsingEvent Current
	{
		[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
		get
		{
			return iterator.Current?.Value;
		}
	}

	public MergingParser(IParser innerParser)
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
		foreach (LinkedListNode<ParsingEvent> @event in events)
		{
			if (IsMergeToken(@event))
			{
				events.MarkDeleted(@event);
				if (!HandleMerge(@event.Next))
				{
					throw new SemanticErrorException(@event.Value.Start, @event.Value.End, "Unrecognized merge key pattern");
				}
			}
		}
	}

	private bool HandleMerge([_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(new byte[] { 2, 1 })] LinkedListNode<ParsingEvent> node)
	{
		if (node == null)
		{
			return false;
		}
		if (node.Value is AnchorAlias anchorAlias)
		{
			return HandleAnchorAlias(node, anchorAlias);
		}
		if (node.Value is SequenceStart)
		{
			return HandleSequence(node);
		}
		return false;
	}

	private bool IsMergeToken(LinkedListNode<ParsingEvent> node)
	{
		if (node.Value is Scalar scalar)
		{
			return scalar.Value == "<<";
		}
		return false;
	}

	private bool HandleAnchorAlias(LinkedListNode<ParsingEvent> node, AnchorAlias anchorAlias)
	{
		IEnumerable<ParsingEvent> mappingEvents = GetMappingEvents(anchorAlias.Value);
		events.AddAfter(node, mappingEvents);
		events.MarkDeleted(node);
		return true;
	}

	private bool HandleSequence(LinkedListNode<ParsingEvent> node)
	{
		events.MarkDeleted(node);
		LinkedListNode<ParsingEvent> linkedListNode = node;
		while (linkedListNode != null)
		{
			if (linkedListNode.Value is SequenceEnd)
			{
				events.MarkDeleted(linkedListNode);
				return true;
			}
			LinkedListNode<ParsingEvent> next = linkedListNode.Next;
			HandleMerge(next);
			linkedListNode = next;
		}
		return true;
	}

	private IEnumerable<ParsingEvent> GetMappingEvents(AnchorName anchor)
	{
		ParsingEventCloner cloner = new ParsingEventCloner();
		int nesting = 0;
		return from e in (from e in events.FromAnchor(anchor)
				select e.Value).TakeWhile([_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(0)] (ParsingEvent e) => (nesting += e.NestingIncrease) >= 0)
			select cloner.Clone(e);
	}
}
