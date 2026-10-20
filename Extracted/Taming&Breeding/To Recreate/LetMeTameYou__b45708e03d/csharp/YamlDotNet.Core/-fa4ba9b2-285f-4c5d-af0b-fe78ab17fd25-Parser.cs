using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.CompilerServices;
using YamlDotNet.Core.Events;
using YamlDotNet.Core.Tokens;

namespace YamlDotNet.Core;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal class _003Cfa4ba9b2_002D285f_002D4c5d_002Daf0b_002Dfe78ab17fd25_003EParser : _003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser
{
	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
	private class EventQueue
	{
		private readonly Queue<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> highPriorityEvents = new Queue<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent>();

		private readonly Queue<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> normalPriorityEvents = new Queue<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent>();

		public int Count => highPriorityEvents.Count + normalPriorityEvents.Count;

		public void Enqueue(_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent @event)
		{
			_003C10437f4b_002D3ee2_002D41ea_002D89ce_002Dac952d373058_003EEventType type = @event.Type;
			if (type == _003C10437f4b_002D3ee2_002D41ea_002D89ce_002Dac952d373058_003EEventType.StreamStart || type == _003C10437f4b_002D3ee2_002D41ea_002D89ce_002Dac952d373058_003EEventType.DocumentStart)
			{
				highPriorityEvents.Enqueue(@event);
			}
			else
			{
				normalPriorityEvents.Enqueue(@event);
			}
		}

		public _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent Dequeue()
		{
			if (highPriorityEvents.Count <= 0)
			{
				return normalPriorityEvents.Dequeue();
			}
			return highPriorityEvents.Dequeue();
		}
	}

	private readonly Stack<_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState> states = new Stack<_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState>();

	private readonly _003Ca82c72f0_002D22d6_002D4f99_002Db89a_002Df3404da1c7e0_003ETagDirectiveCollection tagDirectives = new _003Ca82c72f0_002D22d6_002D4f99_002Db89a_002Df3404da1c7e0_003ETagDirectiveCollection();

	private _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState state;

	private readonly _003C5b508517_002D85c2_002D4248_002Dbe27_002D26efda2bbca5_003EIScanner scanner;

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	private _003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken currentToken;

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	private _003Cf27dd385_002D3eaa_002D42f1_002D8a3f_002Dd10c08c1b0c1_003EVersionDirective version;

	private readonly EventQueue pendingEvents = new EventQueue();

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	[field: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent Current
	{
		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
		get;
		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
		private set;
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
	private _003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken GetCurrentToken()
	{
		if (currentToken == null)
		{
			while (scanner.MoveNextWithoutConsuming())
			{
				currentToken = scanner.Current;
				if (!(currentToken is _003C95dc0082_002D51ac_002D4438_002Db16a_002D5f9463bba9ea_003EComment obj))
				{
					break;
				}
				pendingEvents.Enqueue(new _003C287713a7_002D26e2_002D40c3_002Dbfea_002D1c61c7a66cba_003EComment(obj.Value, obj.IsInline, obj.Start, obj.End));
				scanner.ConsumeCurrent();
			}
		}
		return currentToken;
	}

	public _003Cfa4ba9b2_002D285f_002D4c5d_002Daf0b_002Dfe78ab17fd25_003EParser(TextReader input)
		: this(new _003Cddc65641_002De549_002D4241_002D9d31_002D8e798a96f6f8_003EScanner(input))
	{
	}

	public _003Cfa4ba9b2_002D285f_002D4c5d_002Daf0b_002Dfe78ab17fd25_003EParser(_003C5b508517_002D85c2_002D4248_002Dbe27_002D26efda2bbca5_003EIScanner scanner)
	{
		this.scanner = scanner;
	}

	public bool MoveNext()
	{
		if (state == _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.StreamEnd)
		{
			Current = null;
			return false;
		}
		if (pendingEvents.Count == 0)
		{
			pendingEvents.Enqueue(StateMachine());
		}
		Current = pendingEvents.Dequeue();
		return true;
	}

	private _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent StateMachine()
	{
		return state switch
		{
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.StreamStart => ParseStreamStart(), 
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.ImplicitDocumentStart => ParseDocumentStart(isImplicit: true), 
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.DocumentStart => ParseDocumentStart(isImplicit: false), 
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.DocumentContent => ParseDocumentContent(), 
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.DocumentEnd => ParseDocumentEnd(), 
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.BlockNode => ParseNode(isBlock: true, isIndentlessSequence: false), 
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.BlockNodeOrIndentlessSequence => ParseNode(isBlock: true, isIndentlessSequence: true), 
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowNode => ParseNode(isBlock: false, isIndentlessSequence: false), 
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.BlockSequenceFirstEntry => ParseBlockSequenceEntry(isFirst: true), 
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.BlockSequenceEntry => ParseBlockSequenceEntry(isFirst: false), 
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.IndentlessSequenceEntry => ParseIndentlessSequenceEntry(), 
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.BlockMappingFirstKey => ParseBlockMappingKey(isFirst: true), 
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.BlockMappingKey => ParseBlockMappingKey(isFirst: false), 
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.BlockMappingValue => ParseBlockMappingValue(), 
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowSequenceFirstEntry => ParseFlowSequenceEntry(isFirst: true), 
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowSequenceEntry => ParseFlowSequenceEntry(isFirst: false), 
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowSequenceEntryMappingKey => ParseFlowSequenceEntryMappingKey(), 
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowSequenceEntryMappingValue => ParseFlowSequenceEntryMappingValue(), 
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowSequenceEntryMappingEnd => ParseFlowSequenceEntryMappingEnd(), 
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowMappingFirstKey => ParseFlowMappingKey(isFirst: true), 
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowMappingKey => ParseFlowMappingKey(isFirst: false), 
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowMappingValue => ParseFlowMappingValue(isEmpty: false), 
			_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowMappingEmptyValue => ParseFlowMappingValue(isEmpty: true), 
			_ => throw new InvalidOperationException(), 
		};
	}

	private void Skip()
	{
		if (currentToken != null)
		{
			currentToken = null;
			scanner.ConsumeCurrent();
		}
	}

	private _003Cd41714f7_002D4f61_002D432e_002D8a83_002Ded593f31e526_003EStreamStart ParseStreamStart()
	{
		_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken obj = GetCurrentToken();
		if (!(obj is _003C17c184a6_002Db17b_002D4fb0_002D83d8_002D52ae6e511b2e_003EStreamStart obj2))
		{
			throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(obj?.Start ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, obj?.End ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, "Did not find expected <stream-start>.");
		}
		Skip();
		state = _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.ImplicitDocumentStart;
		return new _003Cd41714f7_002D4f61_002D432e_002D8a83_002Ded593f31e526_003EStreamStart(obj2.Start, obj2.End);
	}

	private _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent ParseDocumentStart(bool isImplicit)
	{
		if (currentToken is _003Cf27dd385_002D3eaa_002D42f1_002D8a3f_002Dd10c08c1b0c1_003EVersionDirective)
		{
			throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException("While parsing a document start node, could not find document end marker before version directive.");
		}
		_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken obj = GetCurrentToken();
		if (!isImplicit)
		{
			while (obj is _003C3667690f_002Ddae7_002D47d9_002Db231_002D1575dc08fc45_003EDocumentEnd)
			{
				Skip();
				obj = GetCurrentToken();
			}
		}
		if (obj == null)
		{
			throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException("Reached the end of the stream while parsing a document start.");
		}
		if (obj is _003Ca75b8374_002Daef2_002D4fe4_002D9788_002Dece9f52f6465_003EScalar && (state == _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.ImplicitDocumentStart || state == _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.DocumentStart))
		{
			isImplicit = true;
		}
		if ((isImplicit && !(obj is _003Cf27dd385_002D3eaa_002D42f1_002D8a3f_002Dd10c08c1b0c1_003EVersionDirective) && !(obj is _003C7077c70a_002D7b6b_002D4819_002D8257_002D8431e277734c_003ETagDirective) && !(obj is _003C4f24e2fc_002Df167_002D424e_002D8919_002Deba760b1a18d_003EDocumentStart) && !(obj is _003Ca66691b6_002De836_002D4692_002D8008_002D56235718fecd_003EStreamEnd) && !(obj is _003C3667690f_002Ddae7_002D47d9_002Db231_002D1575dc08fc45_003EDocumentEnd)) || obj is _003C505cb938_002Ddcf5_002D49fb_002Dbd52_002D5385dd8cea90_003EBlockMappingStart)
		{
			_003Ca82c72f0_002D22d6_002D4f99_002Db89a_002Df3404da1c7e0_003ETagDirectiveCollection tags = new _003Ca82c72f0_002D22d6_002D4f99_002Db89a_002Df3404da1c7e0_003ETagDirectiveCollection();
			ProcessDirectives(tags);
			states.Push(_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.DocumentEnd);
			state = _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.BlockNode;
			return new _003C11d343a3_002Dad11_002D4df1_002D9f55_002Da2bc7ef77934_003EDocumentStart(null, tags, isImplicit: true, obj.Start, obj.End);
		}
		if (!(obj is _003Ca66691b6_002De836_002D4692_002D8008_002D56235718fecd_003EStreamEnd) && !(obj is _003C3667690f_002Ddae7_002D47d9_002Db231_002D1575dc08fc45_003EDocumentEnd))
		{
			_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start = obj.Start;
			_003Ca82c72f0_002D22d6_002D4f99_002Db89a_002Df3404da1c7e0_003ETagDirectiveCollection tags2 = new _003Ca82c72f0_002D22d6_002D4f99_002Db89a_002Df3404da1c7e0_003ETagDirectiveCollection();
			_003Cf27dd385_002D3eaa_002D42f1_002D8a3f_002Dd10c08c1b0c1_003EVersionDirective obj2 = ProcessDirectives(tags2);
			obj = GetCurrentToken() ?? throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException("Reached the end of the stream while parsing a document start");
			if (!(obj is _003C4f24e2fc_002Df167_002D424e_002D8919_002Deba760b1a18d_003EDocumentStart))
			{
				throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(obj.Start, obj.End, "Did not find expected <document start>.");
			}
			states.Push(_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.DocumentEnd);
			state = _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.DocumentContent;
			_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end = obj.End;
			Skip();
			return new _003C11d343a3_002Dad11_002D4df1_002D9f55_002Da2bc7ef77934_003EDocumentStart(obj2, tags2, isImplicit: false, start, end);
		}
		if (obj is _003C3667690f_002Ddae7_002D47d9_002Db231_002D1575dc08fc45_003EDocumentEnd)
		{
			Skip();
		}
		state = _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.StreamEnd;
		obj = GetCurrentToken() ?? throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException("Reached the end of the stream while parsing a document start");
		_003C50667387_002D32a0_002D4cfa_002D90ba_002D9e18d76632e5_003EStreamEnd result = new _003C50667387_002D32a0_002D4cfa_002D90ba_002D9e18d76632e5_003EStreamEnd(obj.Start, obj.End);
		if (scanner.MoveNextWithoutConsuming())
		{
			throw new InvalidOperationException("The scanner should contain no more tokens.");
		}
		return result;
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	private _003Cf27dd385_002D3eaa_002D42f1_002D8a3f_002Dd10c08c1b0c1_003EVersionDirective ProcessDirectives(_003Ca82c72f0_002D22d6_002D4f99_002Db89a_002Df3404da1c7e0_003ETagDirectiveCollection tags)
	{
		bool flag = false;
		_003Cf27dd385_002D3eaa_002D42f1_002D8a3f_002Dd10c08c1b0c1_003EVersionDirective result = null;
		while (true)
		{
			if (GetCurrentToken() is _003Cf27dd385_002D3eaa_002D42f1_002D8a3f_002Dd10c08c1b0c1_003EVersionDirective obj)
			{
				if (version != null)
				{
					throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(obj.Start, obj.End, "Found duplicate %YAML directive.");
				}
				if (obj.Version.Major != 1 || obj.Version.Minor > 3)
				{
					throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(obj.Start, obj.End, "Found incompatible YAML document.");
				}
				result = (version = obj);
				flag = true;
			}
			else
			{
				if (!(GetCurrentToken() is _003C7077c70a_002D7b6b_002D4819_002D8257_002D8431e277734c_003ETagDirective obj2))
				{
					break;
				}
				if (tags.Contains(obj2.Handle))
				{
					throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(obj2.Start, obj2.End, "Found duplicate %TAG directive.");
				}
				tags.Add(obj2);
				flag = true;
			}
			Skip();
		}
		if (GetCurrentToken() is _003C4f24e2fc_002Df167_002D424e_002D8919_002Deba760b1a18d_003EDocumentStart && (version == null || (version.Version.Major == 1 && version.Version.Minor > 1)))
		{
			if (GetCurrentToken() is _003C4f24e2fc_002Df167_002D424e_002D8919_002Deba760b1a18d_003EDocumentStart && version == null)
			{
				version = new _003Cf27dd385_002D3eaa_002D42f1_002D8a3f_002Dd10c08c1b0c1_003EVersionDirective(new _003Cea849434_002D302f_002D4f54_002D8316_002D45c7b2236612_003EVersion(1, 2));
			}
			flag = true;
		}
		AddTagDirectives(tags, _003C576d022f_002D1472_002D47c9_002Db17c_002D371245251b07_003EConstants.DefaultTagDirectives);
		if (flag)
		{
			tagDirectives.Clear();
		}
		AddTagDirectives(tagDirectives, tags);
		return result;
	}

	private static void AddTagDirectives(_003Ca82c72f0_002D22d6_002D4f99_002Db89a_002Df3404da1c7e0_003ETagDirectiveCollection directives, IEnumerable<_003C7077c70a_002D7b6b_002D4819_002D8257_002D8431e277734c_003ETagDirective> source)
	{
		foreach (_003C7077c70a_002D7b6b_002D4819_002D8257_002D8431e277734c_003ETagDirective item in source)
		{
			if (!directives.Contains(item))
			{
				directives.Add(item);
			}
		}
	}

	private _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent ParseDocumentContent()
	{
		if (GetCurrentToken() is _003Cf27dd385_002D3eaa_002D42f1_002D8a3f_002Dd10c08c1b0c1_003EVersionDirective || GetCurrentToken() is _003C7077c70a_002D7b6b_002D4819_002D8257_002D8431e277734c_003ETagDirective || GetCurrentToken() is _003C4f24e2fc_002Df167_002D424e_002D8919_002Deba760b1a18d_003EDocumentStart || GetCurrentToken() is _003C3667690f_002Ddae7_002D47d9_002Db231_002D1575dc08fc45_003EDocumentEnd || GetCurrentToken() is _003Ca66691b6_002De836_002D4692_002D8008_002D56235718fecd_003EStreamEnd)
		{
			state = states.Pop();
			return ProcessEmptyScalar(scanner.CurrentPosition);
		}
		return ParseNode(isBlock: true, isIndentlessSequence: false);
	}

	private static _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar ProcessEmptyScalar(in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark position)
	{
		return new _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName.Empty, _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName.Empty, string.Empty, _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Plain, isPlainImplicit: true, isQuotedImplicit: false, position, position);
	}

	private _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent ParseNode(bool isBlock, bool isIndentlessSequence)
	{
		if (GetCurrentToken() is _003C7c3ee0a2_002Dedb4_002D4988_002D96ba_002Dc70a57cc426f_003EError { Start: var start } obj)
		{
			throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(in start, obj.End, obj.Value);
		}
		_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken obj2 = GetCurrentToken() ?? throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException("Reached the end of the stream while parsing a node");
		if (obj2 is _003Cb056b8ab_002D1b41_002D4229_002Db0c7_002De7a9b1125b4b_003EAnchorAlias obj3)
		{
			state = states.Pop();
			_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent result = new _003C3010bf72_002Dd2cd_002D45d1_002D9245_002Db3b55fbfa5a0_003EAnchorAlias(obj3.Value, obj3.Start, obj3.End);
			Skip();
			return result;
		}
		_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start2 = obj2.Start;
		_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName anchor = _003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName.Empty;
		_003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName tag = _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName.Empty;
		_003C8ea3704d_002D416c_002D46f9_002Da1b9_002Db5df207f3095_003EAnchor obj4 = null;
		_003C77e3859f_002Db0bc_002D4de3_002D9ee2_002D30297dc5ce15_003ETag obj5 = null;
		while (true)
		{
			if (anchor.IsEmpty && obj2 is _003C8ea3704d_002D416c_002D46f9_002Da1b9_002Db5df207f3095_003EAnchor obj6)
			{
				obj4 = obj6;
				anchor = obj6.Value;
				Skip();
			}
			else
			{
				if (!tag.IsEmpty || !(obj2 is _003C77e3859f_002Db0bc_002D4de3_002D9ee2_002D30297dc5ce15_003ETag obj7))
				{
					if (obj2 is _003C8ea3704d_002D416c_002D46f9_002Da1b9_002Db5df207f3095_003EAnchor { Start: var start3 } obj8)
					{
						throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(in start3, obj8.End, "While parsing a node, found more than one anchor.");
					}
					if (obj2 is _003Cb056b8ab_002D1b41_002D4229_002Db0c7_002De7a9b1125b4b_003EAnchorAlias { Start: var start4 } obj9)
					{
						throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(in start4, obj9.End, "While parsing a node, did not find expected token.");
					}
					if (!(obj2 is _003C7c3ee0a2_002Dedb4_002D4988_002D96ba_002Dc70a57cc426f_003EError obj10))
					{
						break;
					}
					if (obj5 != null && obj4 != null && !anchor.IsEmpty)
					{
						return new _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar(anchor, default, string.Empty, _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Any, isPlainImplicit: false, isQuotedImplicit: false, obj4.Start, obj4.End);
					}
					throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(obj10.Start, obj10.End, obj10.Value);
				}
				obj5 = obj7;
				if (string.IsNullOrEmpty(obj7.Handle))
				{
					tag = new _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName(obj7.Suffix);
				}
				else
				{
					if (!tagDirectives.Contains(obj7.Handle))
					{
						throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(obj7.Start, obj7.End, "While parsing a node, found undefined tag handle.");
					}
					tag = new _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName(tagDirectives[obj7.Handle].Prefix + obj7.Suffix);
				}
				Skip();
			}
			obj2 = GetCurrentToken() ?? throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException("Reached the end of the stream while parsing a node");
		}
		bool isEmpty = tag.IsEmpty;
		if (isIndentlessSequence && GetCurrentToken() is _003C59891101_002D5418_002D4952_002D81ff_002D1d5da11bfa74_003EBlockEntry)
		{
			state = _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.IndentlessSequenceEntry;
			return new _003C9f7de5d2_002Dfe16_002D493d_002D8158_002D378a5bfd51bb_003ESequenceStart(anchor, tag, isEmpty, _003Ca02ab24e_002Db5a8_002D4bd7_002D916e_002D7ccfa73d61ca_003ESequenceStyle.Block, start2, obj2.End);
		}
		if (obj2 is _003Ca75b8374_002Daef2_002D4fe4_002D9788_002Dece9f52f6465_003EScalar obj11)
		{
			bool isPlainImplicit = false;
			bool isQuotedImplicit = false;
			if ((obj11.Style == _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Plain && tag.IsEmpty) || tag.IsNonSpecific)
			{
				isPlainImplicit = true;
			}
			else if (tag.IsEmpty)
			{
				isQuotedImplicit = true;
			}
			state = states.Pop();
			Skip();
			_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent result2 = new _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar(anchor, tag, obj11.Value, obj11.Style, isPlainImplicit, isQuotedImplicit, start2, obj11.End, obj11.IsKey);
			if (!anchor.IsEmpty && scanner.MoveNextWithoutConsuming())
			{
				currentToken = scanner.Current;
				if (currentToken is _003C7c3ee0a2_002Dedb4_002D4988_002D96ba_002Dc70a57cc426f_003EError)
				{
					_003C7c3ee0a2_002Dedb4_002D4988_002D96ba_002Dc70a57cc426f_003EError obj12 = currentToken as _003C7c3ee0a2_002Dedb4_002D4988_002D96ba_002Dc70a57cc426f_003EError;
					throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(obj12.Start, obj12.End, obj12.Value);
				}
			}
			if (state == _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowMappingKey && !(scanner.Current is _003C611a9d08_002Dfaa9_002D4310_002D88fe_002Deeb501be0171_003EFlowMappingEnd) && scanner.MoveNextWithoutConsuming())
			{
				currentToken = scanner.Current;
				if (currentToken != null && !(currentToken is _003C23e99c17_002Df3a2_002D4c77_002Da9cb_002D99146f4d092a_003EFlowEntry) && !(currentToken is _003C611a9d08_002Dfaa9_002D4310_002D88fe_002Deeb501be0171_003EFlowMappingEnd))
				{
					throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(currentToken.Start, currentToken.End, "While parsing a flow mapping, did not find expected ',' or '}'.");
				}
			}
			return result2;
		}
		if (obj2 is _003C39744afc_002Dfb1c_002D43f8_002Da8cd_002D1f9eb2bdaeb2_003EFlowSequenceStart obj13)
		{
			state = _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowSequenceFirstEntry;
			return new _003C9f7de5d2_002Dfe16_002D493d_002D8158_002D378a5bfd51bb_003ESequenceStart(anchor, tag, isEmpty, _003Ca02ab24e_002Db5a8_002D4bd7_002D916e_002D7ccfa73d61ca_003ESequenceStyle.Flow, start2, obj13.End);
		}
		if (obj2 is _003C02cc0f8e_002Dc0d1_002D47cc_002D8c27_002Dc121cf2ad4c9_003EFlowMappingStart obj14)
		{
			state = _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowMappingFirstKey;
			return new _003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart(anchor, tag, isEmpty, _003C4531dc81_002Df938_002D4560_002D9983_002D291645827825_003EMappingStyle.Flow, start2, obj14.End);
		}
		if (isBlock)
		{
			if (obj2 is _003C356538f6_002Dae26_002D4a72_002Db244_002Dd5742cb1a602_003EBlockSequenceStart obj15)
			{
				state = _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.BlockSequenceFirstEntry;
				return new _003C9f7de5d2_002Dfe16_002D493d_002D8158_002D378a5bfd51bb_003ESequenceStart(anchor, tag, isEmpty, _003Ca02ab24e_002Db5a8_002D4bd7_002D916e_002D7ccfa73d61ca_003ESequenceStyle.Block, start2, obj15.End);
			}
			if (obj2 is _003C505cb938_002Ddcf5_002D49fb_002Dbd52_002D5385dd8cea90_003EBlockMappingStart obj16)
			{
				state = _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.BlockMappingFirstKey;
				return new _003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart(anchor, tag, isEmpty, _003C4531dc81_002Df938_002D4560_002D9983_002D291645827825_003EMappingStyle.Block, start2, obj16.End);
			}
		}
		if (!anchor.IsEmpty || !tag.IsEmpty)
		{
			state = states.Pop();
			return new _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar(anchor, tag, string.Empty, _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Plain, isEmpty, isQuotedImplicit: false, start2, obj2.End);
		}
		throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(obj2.Start, obj2.End, "While parsing a node, did not find expected node content.");
	}

	private _003C7d138b59_002Dd981_002D4379_002Daac9_002D8cdf906ac673_003EDocumentEnd ParseDocumentEnd()
	{
		_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken obj = GetCurrentToken() ?? throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException("Reached the end of the stream while parsing a document end");
		bool isImplicit = true;
		_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start = obj.Start;
		_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end = start;
		if (obj is _003C3667690f_002Ddae7_002D47d9_002Db231_002D1575dc08fc45_003EDocumentEnd)
		{
			end = obj.End;
			Skip();
			isImplicit = false;
		}
		else if (!(currentToken is _003Ca66691b6_002De836_002D4692_002D8008_002D56235718fecd_003EStreamEnd) && !(currentToken is _003C4f24e2fc_002Df167_002D424e_002D8919_002Deba760b1a18d_003EDocumentStart) && !(currentToken is _003Ca4560be0_002D954d_002D4445_002Da770_002De05c36e22dd1_003EFlowSequenceEnd) && !(currentToken is _003Cf27dd385_002D3eaa_002D42f1_002D8a3f_002Dd10c08c1b0c1_003EVersionDirective) && (!(Current is _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar) || !(currentToken is _003C7c3ee0a2_002Dedb4_002D4988_002D96ba_002Dc70a57cc426f_003EError)))
		{
			throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(in start, in end, "Did not find expected <document end>.");
		}
		if (version != null && version.Version.Major == 1 && version.Version.Minor > 1)
		{
			version = null;
		}
		state = _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.DocumentStart;
		return new _003C7d138b59_002Dd981_002D4379_002Daac9_002D8cdf906ac673_003EDocumentEnd(isImplicit, start, end);
	}

	private _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent ParseBlockSequenceEntry(bool isFirst)
	{
		if (isFirst)
		{
			GetCurrentToken();
			Skip();
		}
		_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken obj = GetCurrentToken();
		if (obj is _003C59891101_002D5418_002D4952_002D81ff_002D1d5da11bfa74_003EBlockEntry { End: var position })
		{
			Skip();
			obj = GetCurrentToken();
			if (!(obj is _003C59891101_002D5418_002D4952_002D81ff_002D1d5da11bfa74_003EBlockEntry) && !(obj is _003C27ae0d26_002Ddc53_002D48f2_002Da7a6_002D728f48d4acfe_003EBlockEnd))
			{
				states.Push(_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.BlockSequenceEntry);
				return ParseNode(isBlock: true, isIndentlessSequence: false);
			}
			state = _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.BlockSequenceEntry;
			return ProcessEmptyScalar(in position);
		}
		if (obj is _003C27ae0d26_002Ddc53_002D48f2_002Da7a6_002D728f48d4acfe_003EBlockEnd obj3)
		{
			state = states.Pop();
			_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent result = new _003Caa8581b2_002D1caa_002D46f6_002Db8ec_002D0b62fd9dce90_003ESequenceEnd(obj3.Start, obj3.End);
			Skip();
			return result;
		}
		throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(obj?.Start ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, obj?.End ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, "While parsing a block collection, did not find expected '-' indicator.");
	}

	private _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent ParseIndentlessSequenceEntry()
	{
		_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken obj = GetCurrentToken();
		if (obj is _003C59891101_002D5418_002D4952_002D81ff_002D1d5da11bfa74_003EBlockEntry { End: var position })
		{
			Skip();
			obj = GetCurrentToken();
			if (!(obj is _003C59891101_002D5418_002D4952_002D81ff_002D1d5da11bfa74_003EBlockEntry) && !(obj is _003C5e3952ce_002Df7f3_002D4323_002D923b_002D661da98222e9_003EKey) && !(obj is _003C94dbf071_002D7b3a_002D4d76_002Da121_002Dfa97347d9f97_003EValue) && !(obj is _003C27ae0d26_002Ddc53_002D48f2_002Da7a6_002D728f48d4acfe_003EBlockEnd))
			{
				states.Push(_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.IndentlessSequenceEntry);
				return ParseNode(isBlock: true, isIndentlessSequence: false);
			}
			state = _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.IndentlessSequenceEntry;
			return ProcessEmptyScalar(in position);
		}
		state = states.Pop();
		return new _003Caa8581b2_002D1caa_002D46f6_002Db8ec_002D0b62fd9dce90_003ESequenceEnd(obj?.Start ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, obj?.End ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty);
	}

	private _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent ParseBlockMappingKey(bool isFirst)
	{
		if (isFirst)
		{
			GetCurrentToken();
			Skip();
		}
		_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken obj = GetCurrentToken();
		if (obj is _003C5e3952ce_002Df7f3_002D4323_002D923b_002D661da98222e9_003EKey { End: var position })
		{
			Skip();
			obj = GetCurrentToken();
			if (!(obj is _003C5e3952ce_002Df7f3_002D4323_002D923b_002D661da98222e9_003EKey) && !(obj is _003C94dbf071_002D7b3a_002D4d76_002Da121_002Dfa97347d9f97_003EValue) && !(obj is _003C27ae0d26_002Ddc53_002D48f2_002Da7a6_002D728f48d4acfe_003EBlockEnd))
			{
				states.Push(_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.BlockMappingValue);
				return ParseNode(isBlock: true, isIndentlessSequence: true);
			}
			state = _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.BlockMappingValue;
			return ProcessEmptyScalar(in position);
		}
		if (obj is _003C94dbf071_002D7b3a_002D4d76_002Da121_002Dfa97347d9f97_003EValue obj3)
		{
			Skip();
			return ProcessEmptyScalar(obj3.End);
		}
		if (obj is _003Cb056b8ab_002D1b41_002D4229_002Db0c7_002De7a9b1125b4b_003EAnchorAlias obj4)
		{
			Skip();
			return new _003C3010bf72_002Dd2cd_002D45d1_002D9245_002Db3b55fbfa5a0_003EAnchorAlias(obj4.Value, obj4.Start, obj4.End);
		}
		if (obj is _003C27ae0d26_002Ddc53_002D48f2_002Da7a6_002D728f48d4acfe_003EBlockEnd obj5)
		{
			state = states.Pop();
			_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent result = new _003C446b682a_002D36b6_002D46ea_002Db1c3_002D0616b60e5c52_003EMappingEnd(obj5.Start, obj5.End);
			Skip();
			return result;
		}
		if (GetCurrentToken() is _003C7c3ee0a2_002Dedb4_002D4988_002D96ba_002Dc70a57cc426f_003EError { Start: var start } obj6)
		{
			throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, obj6.End, obj6.Value);
		}
		throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(obj?.Start ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, obj?.End ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, "While parsing a block mapping, did not find expected key.");
	}

	private _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent ParseBlockMappingValue()
	{
		_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken obj = GetCurrentToken();
		if (obj is _003C94dbf071_002D7b3a_002D4d76_002Da121_002Dfa97347d9f97_003EValue { End: var position })
		{
			Skip();
			obj = GetCurrentToken();
			if (!(obj is _003C5e3952ce_002Df7f3_002D4323_002D923b_002D661da98222e9_003EKey) && !(obj is _003C94dbf071_002D7b3a_002D4d76_002Da121_002Dfa97347d9f97_003EValue) && !(obj is _003C27ae0d26_002Ddc53_002D48f2_002Da7a6_002D728f48d4acfe_003EBlockEnd))
			{
				states.Push(_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.BlockMappingKey);
				return ParseNode(isBlock: true, isIndentlessSequence: true);
			}
			state = _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.BlockMappingKey;
			return ProcessEmptyScalar(in position);
		}
		if (obj is _003C7c3ee0a2_002Dedb4_002D4988_002D96ba_002Dc70a57cc426f_003EError { Start: var start } obj3)
		{
			throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(in start, obj3.End, obj3.Value);
		}
		state = _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.BlockMappingKey;
		return ProcessEmptyScalar(obj?.Start ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty);
	}

	private _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent ParseFlowSequenceEntry(bool isFirst)
	{
		if (isFirst)
		{
			GetCurrentToken();
			Skip();
		}
		_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken obj = GetCurrentToken();
		_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent result;
		if (!(obj is _003Ca4560be0_002D954d_002D4445_002Da770_002De05c36e22dd1_003EFlowSequenceEnd))
		{
			if (!isFirst)
			{
				if (!(obj is _003C23e99c17_002Df3a2_002D4c77_002Da9cb_002D99146f4d092a_003EFlowEntry))
				{
					throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(obj?.Start ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, obj?.End ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, "While parsing a flow sequence, did not find expected ',' or ']'.");
				}
				Skip();
				obj = GetCurrentToken();
			}
			if (obj is _003C5e3952ce_002Df7f3_002D4323_002D923b_002D661da98222e9_003EKey)
			{
				state = _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowSequenceEntryMappingKey;
				result = new _003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName.Empty, _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName.Empty, isImplicit: true, _003C4531dc81_002Df938_002D4560_002D9983_002D291645827825_003EMappingStyle.Flow);
				Skip();
				return result;
			}
			if (!(obj is _003Ca4560be0_002D954d_002D4445_002Da770_002De05c36e22dd1_003EFlowSequenceEnd))
			{
				states.Push(_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowSequenceEntry);
				return ParseNode(isBlock: false, isIndentlessSequence: false);
			}
		}
		state = states.Pop();
		result = new _003Caa8581b2_002D1caa_002D46f6_002Db8ec_002D0b62fd9dce90_003ESequenceEnd(obj?.Start ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, obj?.End ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty);
		Skip();
		return result;
	}

	private _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent ParseFlowSequenceEntryMappingKey()
	{
		_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken obj = GetCurrentToken();
		if (!(obj is _003C94dbf071_002D7b3a_002D4d76_002Da121_002Dfa97347d9f97_003EValue) && !(obj is _003C23e99c17_002Df3a2_002D4c77_002Da9cb_002D99146f4d092a_003EFlowEntry) && !(obj is _003Ca4560be0_002D954d_002D4445_002Da770_002De05c36e22dd1_003EFlowSequenceEnd))
		{
			states.Push(_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowSequenceEntryMappingValue);
			return ParseNode(isBlock: false, isIndentlessSequence: false);
		}
		_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark position = obj?.End ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty;
		Skip();
		state = _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowSequenceEntryMappingValue;
		return ProcessEmptyScalar(in position);
	}

	private _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent ParseFlowSequenceEntryMappingValue()
	{
		_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken obj = GetCurrentToken();
		if (obj is _003C94dbf071_002D7b3a_002D4d76_002Da121_002Dfa97347d9f97_003EValue)
		{
			Skip();
			obj = GetCurrentToken();
			if (!(obj is _003C23e99c17_002Df3a2_002D4c77_002Da9cb_002D99146f4d092a_003EFlowEntry) && !(obj is _003Ca4560be0_002D954d_002D4445_002Da770_002De05c36e22dd1_003EFlowSequenceEnd))
			{
				states.Push(_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowSequenceEntryMappingEnd);
				return ParseNode(isBlock: false, isIndentlessSequence: false);
			}
		}
		state = _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowSequenceEntryMappingEnd;
		return ProcessEmptyScalar(obj?.Start ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty);
	}

	private _003C446b682a_002D36b6_002D46ea_002Db1c3_002D0616b60e5c52_003EMappingEnd ParseFlowSequenceEntryMappingEnd()
	{
		state = _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowSequenceEntry;
		_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken obj = GetCurrentToken();
		return new _003C446b682a_002D36b6_002D46ea_002Db1c3_002D0616b60e5c52_003EMappingEnd(obj?.Start ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, obj?.End ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty);
	}

	private _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent ParseFlowMappingKey(bool isFirst)
	{
		if (isFirst)
		{
			GetCurrentToken();
			Skip();
		}
		_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken obj = GetCurrentToken();
		if (!(obj is _003C611a9d08_002Dfaa9_002D4310_002D88fe_002Deeb501be0171_003EFlowMappingEnd))
		{
			if (!isFirst)
			{
				if (obj is _003C23e99c17_002Df3a2_002D4c77_002Da9cb_002D99146f4d092a_003EFlowEntry)
				{
					Skip();
					obj = GetCurrentToken();
				}
				else if (!(obj is _003Ca75b8374_002Daef2_002D4fe4_002D9788_002Dece9f52f6465_003EScalar))
				{
					throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(obj?.Start ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, obj?.End ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, "While parsing a flow mapping,  did not find expected ',' or '}'.");
				}
			}
			if (obj is _003C5e3952ce_002Df7f3_002D4323_002D923b_002D661da98222e9_003EKey)
			{
				Skip();
				obj = GetCurrentToken();
				if (!(obj is _003C94dbf071_002D7b3a_002D4d76_002Da121_002Dfa97347d9f97_003EValue) && !(obj is _003C23e99c17_002Df3a2_002D4c77_002Da9cb_002D99146f4d092a_003EFlowEntry) && !(obj is _003C611a9d08_002Dfaa9_002D4310_002D88fe_002Deeb501be0171_003EFlowMappingEnd))
				{
					states.Push(_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowMappingValue);
					return ParseNode(isBlock: false, isIndentlessSequence: false);
				}
				state = _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowMappingValue;
				return ProcessEmptyScalar(obj?.Start ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty);
			}
			if (obj is _003Ca75b8374_002Daef2_002D4fe4_002D9788_002Dece9f52f6465_003EScalar)
			{
				states.Push(_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowMappingValue);
				return ParseNode(isBlock: false, isIndentlessSequence: false);
			}
			if (!(obj is _003C611a9d08_002Dfaa9_002D4310_002D88fe_002Deeb501be0171_003EFlowMappingEnd))
			{
				states.Push(_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowMappingEmptyValue);
				return ParseNode(isBlock: false, isIndentlessSequence: false);
			}
		}
		state = states.Pop();
		Skip();
		return new _003C446b682a_002D36b6_002D46ea_002Db1c3_002D0616b60e5c52_003EMappingEnd(obj?.Start ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, obj?.End ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty);
	}

	private _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent ParseFlowMappingValue(bool isEmpty)
	{
		_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken obj = GetCurrentToken();
		if (!isEmpty && obj is _003C94dbf071_002D7b3a_002D4d76_002Da121_002Dfa97347d9f97_003EValue)
		{
			Skip();
			obj = GetCurrentToken();
			if (!(obj is _003C23e99c17_002Df3a2_002D4c77_002Da9cb_002D99146f4d092a_003EFlowEntry) && !(obj is _003C611a9d08_002Dfaa9_002D4310_002D88fe_002Deeb501be0171_003EFlowMappingEnd))
			{
				states.Push(_003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowMappingKey);
				return ParseNode(isBlock: false, isIndentlessSequence: false);
			}
		}
		state = _003C2d4dc324_002D75d4_002D48f1_002Db703_002Da3b7f20e5091_003EParserState.FlowMappingKey;
		if (!isEmpty && obj is _003Ca75b8374_002Daef2_002D4fe4_002D9788_002Dece9f52f6465_003EScalar obj2)
		{
			Skip();
			return new _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName.Empty, _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName.Empty, obj2.Value, obj2.Style, isPlainImplicit: false, isQuotedImplicit: false, obj.Start, obj2.End);
		}
		return ProcessEmptyScalar(obj?.Start ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty);
	}
}
