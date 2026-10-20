using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.CompilerServices;
using System.Text;
using YamlDotNet.Core.ObjectPool;
using YamlDotNet.Core.Tokens;

namespace YamlDotNet.Core;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal class _003Cddc65641_002De549_002D4241_002D9d31_002D8e798a96f6f8_003EScanner : _003C5b508517_002D85c2_002D4248_002Dbe27_002D26efda2bbca5_003EIScanner
{
	private const int MaxVersionNumberLength = 9;

	private static readonly SortedDictionary<char, char> SimpleEscapeCodes = new SortedDictionary<char, char>
	{
		{ '0', '\0' },
		{ 'a', '\a' },
		{ 'b', '\b' },
		{ 't', '\t' },
		{ '\t', '\t' },
		{ 'n', '\n' },
		{ 'v', '\v' },
		{ 'f', '\f' },
		{ 'r', '\r' },
		{ 'e', '\u001b' },
		{ ' ', ' ' },
		{ '"', '"' },
		{ '\\', '\\' },
		{ '/', '/' },
		{ 'N', '\u0085' },
		{ '_', '\u00a0' },
		{ 'L', '\u2028' },
		{ 'P', '\u2029' }
	};

	private readonly Stack<long> indents = new Stack<long>();

	private readonly _003C036df014_002D06c4_002D43a5_002D8b6e_002D0e35d0557361_003EInsertionQueue<_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken> tokens = new _003C036df014_002D06c4_002D43a5_002D8b6e_002D0e35d0557361_003EInsertionQueue<_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken>();

	private readonly Stack<_003Cfab56de9_002D6af9_002D4218_002Daf7a_002Dd7674b431ad4_003ESimpleKey> simpleKeys = new Stack<_003Cfab56de9_002D6af9_002D4218_002Daf7a_002Dd7674b431ad4_003ESimpleKey>();

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 0, 1 })]
	private readonly _003C5bd418d5_002De6df_002D4afd_002Daf53_002D8ece0b4cc878_003ECharacterAnalyzer<_003Ca68fcb75_002D00d3_002D4e56_002D9f12_002Dcfbe0e401461_003ELookAheadBuffer> analyzer;

	private readonly _003Cecd83e4d_002Dc97a_002D4d94_002Daed7_002D4ce02d4606b1_003ECursor cursor;

	private bool streamStartProduced;

	private bool streamEndProduced;

	private bool plainScalarFollowedByComment;

	private bool flowCollectionFetched;

	private bool startFlowCollectionFetched;

	private long indent = -1L;

	private bool flowScalarFetched;

	private bool simpleKeyAllowed;

	private int flowLevel;

	private int tokensParsed;

	private bool tokenAvailable;

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	private _003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken previous;

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	private _003C8ea3704d_002D416c_002D46f9_002Da1b9_002Db5df207f3095_003EAnchor previousAnchor;

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	private _003Ca75b8374_002Daef2_002D4fe4_002D9788_002Dece9f52f6465_003EScalar lastScalar;

	private readonly int maxKeySize;

	private static readonly byte[] EmptyBytes = Array.Empty<byte>();

	public bool SkipComments { get; private set; }

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	[field: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public _003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken Current
	{
		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
		get;
		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
		private set;
	}

	public _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark CurrentPosition => cursor.Mark();

	private bool IsDocumentStart()
	{
		if (!analyzer.EndOfInput && cursor.LineOffset == 0L && analyzer.Check('-') && analyzer.Check('-', 1) && analyzer.Check('-', 2))
		{
			return analyzer.IsWhiteBreakOrZero(3);
		}
		return false;
	}

	private bool IsDocumentEnd()
	{
		if (!analyzer.EndOfInput && cursor.LineOffset == 0L && analyzer.Check('.') && analyzer.Check('.', 1) && analyzer.Check('.', 2))
		{
			return analyzer.IsWhiteBreakOrZero(3);
		}
		return false;
	}

	private bool IsDocumentIndicator()
	{
		if (!IsDocumentStart())
		{
			return IsDocumentEnd();
		}
		return true;
	}

	public _003Cddc65641_002De549_002D4241_002D9d31_002D8e798a96f6f8_003EScanner(TextReader input, bool skipComments = true)
		: this(input, skipComments, 1024)
	{
	}

	public _003Cddc65641_002De549_002D4241_002D9d31_002D8e798a96f6f8_003EScanner(TextReader input, bool skipComments, int maxKeySize)
	{
		analyzer = new _003C5bd418d5_002De6df_002D4afd_002Daf53_002D8ece0b4cc878_003ECharacterAnalyzer<_003Ca68fcb75_002D00d3_002D4e56_002D9f12_002Dcfbe0e401461_003ELookAheadBuffer>(new _003Ca68fcb75_002D00d3_002D4e56_002D9f12_002Dcfbe0e401461_003ELookAheadBuffer(input, 1024));
		cursor = new _003Cecd83e4d_002Dc97a_002D4d94_002Daed7_002D4ce02d4606b1_003ECursor();
		SkipComments = skipComments;
		this.maxKeySize = maxKeySize;
	}

	public bool MoveNext()
	{
		if (Current != null)
		{
			ConsumeCurrent();
		}
		return MoveNextWithoutConsuming();
	}

	public bool MoveNextWithoutConsuming()
	{
		if (!tokenAvailable && !streamEndProduced)
		{
			FetchMoreTokens();
		}
		if (tokens.Count > 0)
		{
			Current = tokens.Dequeue();
			tokenAvailable = false;
			return true;
		}
		Current = null;
		return false;
	}

	public void ConsumeCurrent()
	{
		tokensParsed++;
		tokenAvailable = false;
		previous = Current;
		Current = null;
	}

	private char ReadCurrentCharacter()
	{
		char result = analyzer.Peek(0);
		Skip();
		return result;
	}

	private char ReadLine()
	{
		if (analyzer.Check("\r\n\u0085"))
		{
			SkipLine();
			return '\n';
		}
		char result = analyzer.Peek(0);
		SkipLine();
		return result;
	}

	private void FetchMoreTokens()
	{
		while (true)
		{
			bool flag = false;
			if (tokens.Count == 0)
			{
				flag = true;
			}
			else
			{
				foreach (_003Cfab56de9_002D6af9_002D4218_002Daf7a_002Dd7674b431ad4_003ESimpleKey simpleKey in simpleKeys)
				{
					if (simpleKey.IsPossible && simpleKey.TokenNumber == tokensParsed)
					{
						flag = true;
						break;
					}
				}
			}
			if (!flag)
			{
				break;
			}
			FetchNextToken();
		}
		tokenAvailable = true;
	}

	private static bool StartsWith(StringBuilder what, char start)
	{
		if (what.Length > 0)
		{
			return what[0] == start;
		}
		return false;
	}

	private void StaleSimpleKeys()
	{
		foreach (_003Cfab56de9_002D6af9_002D4218_002Daf7a_002Dd7674b431ad4_003ESimpleKey simpleKey in simpleKeys)
		{
			if (simpleKey.IsPossible && (simpleKey.Line < cursor.Line || simpleKey.Index + maxKeySize < cursor.Index))
			{
				if (simpleKey.IsRequired)
				{
					_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark obj = cursor.Mark();
					tokens.Enqueue(new _003C7c3ee0a2_002Dedb4_002D4988_002D96ba_002Dc70a57cc426f_003EError("While scanning a simple key, could not find expected ':'.", obj, obj));
				}
				simpleKey.MarkAsImpossible();
			}
		}
	}

	private void FetchNextToken()
	{
		if (!streamStartProduced)
		{
			FetchStreamStart();
			return;
		}
		ScanToNextToken();
		StaleSimpleKeys();
		UnrollIndent(cursor.LineOffset);
		analyzer.Buffer.Cache(4);
		if (analyzer.Buffer.EndOfInput)
		{
			lastScalar = null;
			FetchStreamEnd();
		}
		if (cursor.LineOffset == 0L && analyzer.Check('%'))
		{
			lastScalar = null;
			FetchDirective();
			return;
		}
		if (IsDocumentStart())
		{
			lastScalar = null;
			FetchDocumentIndicator(isStartToken: true);
			return;
		}
		if (IsDocumentEnd())
		{
			lastScalar = null;
			FetchDocumentIndicator(isStartToken: false);
			return;
		}
		if (analyzer.Check('['))
		{
			lastScalar = null;
			FetchFlowCollectionStart(isSequenceToken: true);
			return;
		}
		if (analyzer.Check('{'))
		{
			lastScalar = null;
			FetchFlowCollectionStart(isSequenceToken: false);
			return;
		}
		if (analyzer.Check(']'))
		{
			lastScalar = null;
			FetchFlowCollectionEnd(isSequenceToken: true);
			return;
		}
		if (analyzer.Check('}'))
		{
			lastScalar = null;
			FetchFlowCollectionEnd(isSequenceToken: false);
			return;
		}
		if (analyzer.Check(','))
		{
			lastScalar = null;
			FetchFlowEntry();
			return;
		}
		if (analyzer.Check('-'))
		{
			if (analyzer.IsWhiteBreakOrZero(1))
			{
				FetchBlockEntry();
				return;
			}
			if (flowLevel > 0 && analyzer.Check(",[]{}", 1))
			{
				tokens.Enqueue(new _003C7c3ee0a2_002Dedb4_002D4988_002D96ba_002Dc70a57cc426f_003EError("Invalid key indicator format.", cursor.Mark(), cursor.Mark()));
			}
		}
		if (analyzer.Check('?') && (flowLevel > 0 || analyzer.IsWhiteBreakOrZero(1)) && analyzer.IsWhiteBreakOrZero(1))
		{
			FetchKey();
		}
		else if (analyzer.Check(':') && (flowLevel > 0 || analyzer.IsWhiteBreakOrZero(1)) && (!simpleKeyAllowed || flowLevel <= 0) && (!flowScalarFetched || !analyzer.Check(':', 1)) && (analyzer.IsWhiteBreakOrZero(1) || analyzer.Check(',', 1) || flowScalarFetched || flowCollectionFetched || startFlowCollectionFetched))
		{
			if (lastScalar != null)
			{
				lastScalar.IsKey = true;
				lastScalar = null;
			}
			FetchValue();
		}
		else if (analyzer.Check('*'))
		{
			FetchAnchor(isAlias: true);
		}
		else if (analyzer.Check('&'))
		{
			FetchAnchor(isAlias: false);
		}
		else if (analyzer.Check('!'))
		{
			FetchTag();
		}
		else if (analyzer.Check('|') && flowLevel == 0)
		{
			FetchBlockScalar(isLiteral: true);
		}
		else if (analyzer.Check('>') && flowLevel == 0)
		{
			FetchBlockScalar(isLiteral: false);
		}
		else if (analyzer.Check('\''))
		{
			FetchQuotedScalar(isSingleQuoted: true);
		}
		else if (analyzer.Check('"'))
		{
			FetchQuotedScalar(isSingleQuoted: false);
		}
		else if ((!analyzer.IsWhiteBreakOrZero() && !analyzer.Check("-?:,[]{}#&*!|>'\"%@`")) || (analyzer.Check('-') && !analyzer.IsWhite(1)) || (analyzer.Check("?:") && !analyzer.IsWhiteBreakOrZero(1)) || (simpleKeyAllowed && flowLevel > 0))
		{
			if (plainScalarFollowedByComment)
			{
				_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark obj = cursor.Mark();
				tokens.Enqueue(new _003C7c3ee0a2_002Dedb4_002D4988_002D96ba_002Dc70a57cc426f_003EError("While scanning plain scalar, found a comment between adjacent scalars.", obj, obj));
			}
			if ((flowScalarFetched || (flowCollectionFetched && !startFlowCollectionFetched)) && analyzer.Check(':'))
			{
				Skip();
			}
			flowScalarFetched = false;
			flowCollectionFetched = false;
			startFlowCollectionFetched = false;
			plainScalarFollowedByComment = false;
			FetchPlainScalar();
		}
		else
		{
			if (simpleKeyAllowed && indent >= cursor.LineOffset && analyzer.IsTab())
			{
				throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException("While scanning a mapping, found invalid tab as indentation.");
			}
			if (!analyzer.IsWhiteBreakOrZero())
			{
				_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start = cursor.Mark();
				Skip();
				throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning for the next token, found character that cannot start any token.");
			}
			Skip();
		}
	}

	private bool CheckWhiteSpace()
	{
		if (!analyzer.Check(' '))
		{
			if (flowLevel > 0 || !simpleKeyAllowed)
			{
				return analyzer.Check('\t');
			}
			return false;
		}
		return true;
	}

	private void Skip()
	{
		cursor.Skip();
		analyzer.Buffer.Skip(1);
	}

	private void SkipLine()
	{
		if (analyzer.IsCrLf())
		{
			cursor.SkipLineByOffset(2);
			analyzer.Buffer.Skip(2);
		}
		else if (analyzer.IsBreak())
		{
			cursor.SkipLineByOffset(1);
			analyzer.Buffer.Skip(1);
		}
		else if (!analyzer.IsZero())
		{
			throw new InvalidOperationException("Not at a break.");
		}
	}

	private void ScanToNextToken()
	{
		while (true)
		{
			if (CheckWhiteSpace())
			{
				Skip();
				continue;
			}
			ProcessComment();
			if (analyzer.IsBreak())
			{
				SkipLine();
				if (flowLevel == 0)
				{
					simpleKeyAllowed = true;
				}
				continue;
			}
			break;
		}
	}

	private void ProcessComment()
	{
		if (!analyzer.Check('#'))
		{
			return;
		}
		_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start = cursor.Mark();
		Skip();
		while (analyzer.IsSpace())
		{
			Skip();
		}
		StringBuilderPool.BuilderWrapper builderWrapper = StringBuilderPool.Rent();
		try
		{
			StringBuilder builder = builderWrapper.Builder;
			while (!analyzer.IsBreakOrZero())
			{
				builder.Append(ReadCurrentCharacter());
			}
			if (!SkipComments)
			{
				bool isInline = previous != null && previous.End.Line == start.Line && previous.End.Column != 1 && !(previous is _003C17c184a6_002Db17b_002D4fb0_002D83d8_002D52ae6e511b2e_003EStreamStart);
				tokens.Enqueue(new _003C95dc0082_002D51ac_002D4438_002Db16a_002D5f9463bba9ea_003EComment(builder.ToString(), isInline, start, cursor.Mark()));
			}
		}
		finally
		{
			((IDisposable)builderWrapper/*cast due to constrained. prefix*/).Dispose();
		}
	}

	private void FetchStreamStart()
	{
		simpleKeys.Push(new _003Cfab56de9_002D6af9_002D4218_002Daf7a_002Dd7674b431ad4_003ESimpleKey());
		simpleKeyAllowed = true;
		streamStartProduced = true;
		_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start = cursor.Mark();
		tokens.Enqueue(new _003C17c184a6_002Db17b_002D4fb0_002D83d8_002D52ae6e511b2e_003EStreamStart(in start, in start));
	}

	private void UnrollIndent(long column)
	{
		if (flowLevel == 0)
		{
			while (indent > column)
			{
				_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start = cursor.Mark();
				tokens.Enqueue(new _003C27ae0d26_002Ddc53_002D48f2_002Da7a6_002D728f48d4acfe_003EBlockEnd(in start, in start));
				indent = indents.Pop();
			}
		}
	}

	private void FetchStreamEnd()
	{
		cursor.ForceSkipLineAfterNonBreak();
		UnrollIndent(-1L);
		RemoveSimpleKey();
		simpleKeyAllowed = false;
		streamEndProduced = true;
		_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start = cursor.Mark();
		tokens.Enqueue(new _003Ca66691b6_002De836_002D4692_002D8008_002D56235718fecd_003EStreamEnd(in start, in start));
	}

	private void FetchDirective()
	{
		UnrollIndent(-1L);
		RemoveSimpleKey();
		simpleKeyAllowed = false;
		_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken obj = ScanDirective();
		if (obj != null)
		{
			tokens.Enqueue(obj);
		}
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
	private _003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken ScanDirective()
	{
		_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start = cursor.Mark();
		Skip();
		string text = ScanDirectiveName(in start);
		_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken result;
		if (!(text == "YAML"))
		{
			if (!(text == "TAG"))
			{
				while (!analyzer.EndOfInput && !analyzer.Check('#') && !analyzer.IsBreak())
				{
					Skip();
				}
				return null;
			}
			result = ScanTagDirectiveValue(in start);
		}
		else
		{
			if (!(previous is _003C4f24e2fc_002Df167_002D424e_002D8919_002Deba760b1a18d_003EDocumentStart) && !(previous is _003C17c184a6_002Db17b_002D4fb0_002D83d8_002D52ae6e511b2e_003EStreamStart) && !(previous is _003C3667690f_002Ddae7_002D47d9_002Db231_002D1575dc08fc45_003EDocumentEnd))
			{
				throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(in start, cursor.Mark(), "While scanning a version directive, did not find preceding <document end>.");
			}
			result = ScanVersionDirectiveValue(in start);
		}
		while (analyzer.IsWhite())
		{
			Skip();
		}
		ProcessComment();
		if (!analyzer.IsBreakOrZero())
		{
			throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a directive, did not find expected comment or line break.");
		}
		if (analyzer.IsBreak())
		{
			SkipLine();
		}
		return result;
	}

	private void FetchDocumentIndicator(bool isStartToken)
	{
		UnrollIndent(-1L);
		RemoveSimpleKey();
		simpleKeyAllowed = false;
		_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start = cursor.Mark();
		Skip();
		Skip();
		Skip();
		if (isStartToken)
		{
			tokens.Enqueue(new _003C4f24e2fc_002Df167_002D424e_002D8919_002Deba760b1a18d_003EDocumentStart(in start, cursor.Mark()));
			return;
		}
		_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken obj = null;
		while (!analyzer.EndOfInput && !analyzer.IsBreak() && !analyzer.Check('#'))
		{
			if (!analyzer.IsWhite())
			{
				obj = new _003C7c3ee0a2_002Dedb4_002D4988_002D96ba_002Dc70a57cc426f_003EError("While scanning a document end, found invalid content after '...' marker.", start, cursor.Mark());
				break;
			}
			Skip();
		}
		tokens.Enqueue(new _003C3667690f_002Ddae7_002D47d9_002Db231_002D1575dc08fc45_003EDocumentEnd(in start, in start));
		if (obj != null)
		{
			tokens.Enqueue(obj);
		}
	}

	private void FetchFlowCollectionStart(bool isSequenceToken)
	{
		SaveSimpleKey();
		IncreaseFlowLevel();
		simpleKeyAllowed = true;
		_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start = cursor.Mark();
		Skip();
		_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken item = ((!isSequenceToken) ? ((_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken)new _003C02cc0f8e_002Dc0d1_002D47cc_002D8c27_002Dc121cf2ad4c9_003EFlowMappingStart(in start, in start)) : ((_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken)new _003C39744afc_002Dfb1c_002D43f8_002Da8cd_002D1f9eb2bdaeb2_003EFlowSequenceStart(in start, in start)));
		tokens.Enqueue(item);
		startFlowCollectionFetched = true;
	}

	private void IncreaseFlowLevel()
	{
		simpleKeys.Push(new _003Cfab56de9_002D6af9_002D4218_002Daf7a_002Dd7674b431ad4_003ESimpleKey());
		flowLevel++;
	}

	private void FetchFlowCollectionEnd(bool isSequenceToken)
	{
		RemoveSimpleKey();
		DecreaseFlowLevel();
		simpleKeyAllowed = false;
		_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start = cursor.Mark();
		Skip();
		_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken obj = null;
		_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken item;
		if (isSequenceToken)
		{
			if (analyzer.Check('#'))
			{
				obj = new _003C7c3ee0a2_002Dedb4_002D4988_002D96ba_002Dc70a57cc426f_003EError("While scanning a flow sequence end, found invalid comment after ']'.", start, start);
			}
			item = new _003Ca4560be0_002D954d_002D4445_002Da770_002De05c36e22dd1_003EFlowSequenceEnd(in start, in start);
		}
		else
		{
			item = new _003C611a9d08_002Dfaa9_002D4310_002D88fe_002Deeb501be0171_003EFlowMappingEnd(in start, in start);
		}
		tokens.Enqueue(item);
		if (obj != null)
		{
			tokens.Enqueue(obj);
		}
		flowCollectionFetched = true;
	}

	private void DecreaseFlowLevel()
	{
		if (flowLevel > 0)
		{
			flowLevel--;
			simpleKeys.Pop();
		}
	}

	private void FetchFlowEntry()
	{
		RemoveSimpleKey();
		simpleKeyAllowed = true;
		_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start = cursor.Mark();
		Skip();
		_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end = cursor.Mark();
		if (analyzer.Check('#'))
		{
			tokens.Enqueue(new _003C7c3ee0a2_002Dedb4_002D4988_002D96ba_002Dc70a57cc426f_003EError("While scanning a flow entry, found invalid comment after comma.", start, end));
		}
		else
		{
			tokens.Enqueue(new _003C23e99c17_002Df3a2_002D4c77_002Da9cb_002D99146f4d092a_003EFlowEntry(in start, in end));
		}
	}

	private void FetchBlockEntry()
	{
		if (flowLevel == 0)
		{
			if (!simpleKeyAllowed)
			{
				if (previousAnchor != null && previousAnchor.End.Line == cursor.Line)
				{
					throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(previousAnchor.Start, previousAnchor.End, "Anchor before sequence entry on same line is not allowed.");
				}
				_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark obj = cursor.Mark();
				tokens.Enqueue(new _003C7c3ee0a2_002Dedb4_002D4988_002D96ba_002Dc70a57cc426f_003EError("Block sequence entries are not allowed in this context.", obj, obj));
			}
			RollIndent(cursor.LineOffset, -1, isSequence: true, cursor.Mark());
		}
		RemoveSimpleKey();
		simpleKeyAllowed = true;
		_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start = cursor.Mark();
		Skip();
		tokens.Enqueue(new _003C59891101_002D5418_002D4952_002D81ff_002D1d5da11bfa74_003EBlockEntry(in start, cursor.Mark()));
	}

	private void FetchKey()
	{
		if (flowLevel == 0)
		{
			if (!simpleKeyAllowed)
			{
				_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start = cursor.Mark();
				throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, in start, "Mapping keys are not allowed in this context.");
			}
			RollIndent(cursor.LineOffset, -1, isSequence: false, cursor.Mark());
		}
		RemoveSimpleKey();
		simpleKeyAllowed = flowLevel == 0;
		_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start2 = cursor.Mark();
		Skip();
		tokens.Enqueue(new _003C5e3952ce_002Df7f3_002D4323_002D923b_002D661da98222e9_003EKey(in start2, cursor.Mark()));
	}

	private void FetchValue()
	{
		_003Cfab56de9_002D6af9_002D4218_002Daf7a_002Dd7674b431ad4_003ESimpleKey obj = simpleKeys.Peek();
		if (obj.IsPossible)
		{
			tokens.Insert(obj.TokenNumber - tokensParsed, new _003C5e3952ce_002Df7f3_002D4323_002D923b_002D661da98222e9_003EKey(obj.Mark, obj.Mark));
			RollIndent(obj.LineOffset, obj.TokenNumber, isSequence: false, obj.Mark);
			obj.MarkAsImpossible();
			simpleKeyAllowed = false;
		}
		else
		{
			bool flag = flowLevel == 0;
			if (flag)
			{
				if (!simpleKeyAllowed)
				{
					_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark obj2 = cursor.Mark();
					tokens.Enqueue(new _003C7c3ee0a2_002Dedb4_002D4988_002D96ba_002Dc70a57cc426f_003EError("Mapping values are not allowed in this context.", obj2, obj2));
					return;
				}
				RollIndent(cursor.LineOffset, -1, isSequence: false, cursor.Mark());
				if (cursor.LineOffset == 0L && obj.LineOffset == 0L)
				{
					tokens.Insert(tokens.Count, new _003C5e3952ce_002Df7f3_002D4323_002D923b_002D661da98222e9_003EKey(obj.Mark, obj.Mark));
					flag = false;
				}
			}
			simpleKeyAllowed = flag;
		}
		_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start = cursor.Mark();
		Skip();
		tokens.Enqueue(new _003C94dbf071_002D7b3a_002D4d76_002Da121_002Dfa97347d9f97_003EValue(in start, cursor.Mark()));
	}

	private void RollIndent(long column, int number, bool isSequence, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark position)
	{
		if (flowLevel <= 0 && indent < column)
		{
			indents.Push(indent);
			indent = column;
			_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken item = ((!isSequence) ? ((_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken)new _003C505cb938_002Ddcf5_002D49fb_002Dbd52_002D5385dd8cea90_003EBlockMappingStart(in position, in position)) : ((_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken)new _003C356538f6_002Dae26_002D4a72_002Db244_002Dd5742cb1a602_003EBlockSequenceStart(in position, in position)));
			if (number == -1)
			{
				tokens.Enqueue(item);
			}
			else
			{
				tokens.Insert(number - tokensParsed, item);
			}
		}
	}

	private void FetchAnchor(bool isAlias)
	{
		SaveSimpleKey();
		simpleKeyAllowed = false;
		tokens.Enqueue(ScanAnchor(isAlias));
	}

	private _003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken ScanAnchor(bool isAlias)
	{
		_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start = cursor.Mark();
		Skip();
		bool flag = false;
		if (isAlias)
		{
			_003Cfab56de9_002D6af9_002D4218_002Daf7a_002Dd7674b431ad4_003ESimpleKey obj = simpleKeys.Peek();
			flag = obj.IsRequired && obj.IsPossible;
		}
		StringBuilderPool.BuilderWrapper builderWrapper = StringBuilderPool.Rent();
		try
		{
			StringBuilder builder = builderWrapper.Builder;
			while (!analyzer.IsWhiteBreakOrZero() && !analyzer.Check("[]{},") && (!flag || !analyzer.Check(':') || !analyzer.IsWhiteBreakOrZero(1)))
			{
				builder.Append(ReadCurrentCharacter());
			}
			if (builder.Length == 0 || (!analyzer.IsWhiteBreakOrZero() && !analyzer.Check("?:,]}%@`")))
			{
				throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning an anchor or alias, found value containing disallowed: []{},");
			}
			_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName value = new _003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName(builder.ToString());
			if (isAlias)
			{
				return new _003Cb056b8ab_002D1b41_002D4229_002Db0c7_002De7a9b1125b4b_003EAnchorAlias(value, start, cursor.Mark());
			}
			return previousAnchor = new _003C8ea3704d_002D416c_002D46f9_002Da1b9_002Db5df207f3095_003EAnchor(value, start, cursor.Mark());
		}
		finally
		{
			((IDisposable)builderWrapper/*cast due to constrained. prefix*/).Dispose();
		}
	}

	private void FetchTag()
	{
		SaveSimpleKey();
		simpleKeyAllowed = false;
		tokens.Enqueue(ScanTag());
	}

	private _003C77e3859f_002Db0bc_002D4de3_002D9ee2_002D30297dc5ce15_003ETag ScanTag()
	{
		_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start = cursor.Mark();
		string text;
		string text2;
		if (analyzer.Check('<', 1))
		{
			text = string.Empty;
			Skip();
			Skip();
			text2 = ScanTagUri(null, start);
			if (!analyzer.Check('>'))
			{
				throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a tag, did not find the expected '>'.");
			}
			Skip();
		}
		else
		{
			string text3 = ScanTagHandle(isDirective: false, start);
			if (text3.Length > 1 && text3[0] == '!' && text3[text3.Length - 1] == '!')
			{
				text = text3;
				text2 = ScanTagUri(null, start);
			}
			else
			{
				text2 = ScanTagUri(text3, start);
				text = "!";
				if (text2.Length == 0)
				{
					text2 = text;
					text = string.Empty;
				}
			}
		}
		if (!analyzer.IsWhiteBreakOrZero() && !analyzer.Check(','))
		{
			throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a tag, did not find expected whitespace, comma or line break.");
		}
		return new _003C77e3859f_002Db0bc_002D4de3_002D9ee2_002D30297dc5ce15_003ETag(text, text2, start, cursor.Mark());
	}

	private void FetchBlockScalar(bool isLiteral)
	{
		SaveSimpleKey();
		simpleKeyAllowed = true;
		tokens.Enqueue(ScanBlockScalar(isLiteral));
	}

	private _003Ca75b8374_002Daef2_002D4fe4_002D9788_002Dece9f52f6465_003EScalar ScanBlockScalar(bool isLiteral)
	{
		StringBuilderPool.BuilderWrapper builderWrapper = StringBuilderPool.Rent();
		try
		{
			StringBuilder builder = builderWrapper.Builder;
			StringBuilderPool.BuilderWrapper builderWrapper2 = StringBuilderPool.Rent();
			try
			{
				StringBuilder builder2 = builderWrapper2.Builder;
				StringBuilderPool.BuilderWrapper builderWrapper3 = StringBuilderPool.Rent();
				try
				{
					StringBuilder builder3 = builderWrapper3.Builder;
					int num = 0;
					int num2 = 0;
					long currentIndent = 0L;
					bool flag = false;
					bool? isFirstLine = null;
					_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start = cursor.Mark();
					Skip();
					if (analyzer.Check("+-"))
					{
						num = (analyzer.Check('+') ? 1 : (-1));
						Skip();
						if (analyzer.IsDigit())
						{
							if (analyzer.Check('0'))
							{
								throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a block scalar, found an indentation indicator equal to 0.");
							}
							num2 = analyzer.AsDigit();
							Skip();
						}
					}
					else if (analyzer.IsDigit())
					{
						if (analyzer.Check('0'))
						{
							throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a block scalar, found an indentation indicator equal to 0.");
						}
						num2 = analyzer.AsDigit();
						Skip();
						if (analyzer.Check("+-"))
						{
							num = (analyzer.Check('+') ? 1 : (-1));
							Skip();
						}
					}
					if (analyzer.Check('#'))
					{
						throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a block scalar, found a comment without whtespace after '>' indicator.");
					}
					while (analyzer.IsWhite())
					{
						Skip();
					}
					ProcessComment();
					if (!analyzer.IsBreakOrZero())
					{
						throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a block scalar, did not find expected comment or line break.");
					}
					if (analyzer.IsBreak())
					{
						SkipLine();
						if (!isFirstLine.HasValue)
						{
							isFirstLine = true;
						}
						else if (isFirstLine == true)
						{
							isFirstLine = false;
						}
					}
					_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end = cursor.Mark();
					if (num2 != 0)
					{
						currentIndent = ((indent >= 0) ? (indent + num2) : num2);
					}
					currentIndent = ScanBlockScalarBreaks(currentIndent, builder3, isLiteral, ref end, ref isFirstLine);
					isFirstLine = false;
					while (cursor.LineOffset == currentIndent && !analyzer.IsZero() && !IsDocumentEnd())
					{
						bool flag2 = analyzer.IsWhite();
						if (!isLiteral && StartsWith(builder2, '\n') && !flag && !flag2)
						{
							if (builder3.Length == 0)
							{
								builder.Append(' ');
							}
							builder2.Length = 0;
						}
						else
						{
							builder.Append((object?)builder2);
							builder2.Length = 0;
						}
						builder.Append((object?)builder3);
						builder3.Length = 0;
						flag = analyzer.IsWhite();
						while (!analyzer.IsBreakOrZero())
						{
							builder.Append(ReadCurrentCharacter());
						}
						char c = ReadLine();
						if (c != '\0')
						{
							builder2.Append(c);
						}
						currentIndent = ScanBlockScalarBreaks(currentIndent, builder3, isLiteral, ref end, ref isFirstLine);
					}
					if (num != -1)
					{
						builder.Append((object?)builder2);
					}
					if (num == 1)
					{
						builder.Append((object?)builder3);
					}
					_003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle style = (isLiteral ? _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Literal : _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Folded);
					return new _003Ca75b8374_002Daef2_002D4fe4_002D9788_002Dece9f52f6465_003EScalar(builder.ToString(), style, start, end);
				}
				finally
				{
					((IDisposable)builderWrapper3/*cast due to constrained. prefix*/).Dispose();
				}
			}
			finally
			{
				((IDisposable)builderWrapper2/*cast due to constrained. prefix*/).Dispose();
			}
		}
		finally
		{
			((IDisposable)builderWrapper/*cast due to constrained. prefix*/).Dispose();
		}
	}

	private long ScanBlockScalarBreaks(long currentIndent, StringBuilder breaks, bool isLiteral, ref _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end, ref bool? isFirstLine)
	{
		long num = 0L;
		long num2 = -1L;
		end = cursor.Mark();
		while (true)
		{
			if ((currentIndent == 0L || cursor.LineOffset < currentIndent) && analyzer.IsSpace())
			{
				Skip();
				continue;
			}
			if (cursor.LineOffset > num)
			{
				num = cursor.LineOffset;
			}
			if (!analyzer.IsBreak())
			{
				break;
			}
			if (isFirstLine == true)
			{
				isFirstLine = false;
				num2 = cursor.LineOffset;
			}
			breaks.Append(ReadLine());
			end = cursor.Mark();
		}
		if (isLiteral && isFirstLine == true)
		{
			long num3 = cursor.LineOffset;
			int num4 = 0;
			while (!analyzer.IsBreak(num4) && analyzer.IsSpace(num4))
			{
				num4++;
				num3++;
			}
			if (analyzer.IsBreak(num4) && num3 > cursor.LineOffset)
			{
				isFirstLine = false;
				num2 = num3;
			}
		}
		if (isLiteral && num2 > 1 && currentIndent < num2 - 1)
		{
			throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(in end, cursor.Mark(), "While scanning a literal block scalar, found extra spaces in first line.");
		}
		if (!isLiteral && num > cursor.LineOffset && num2 > -1)
		{
			throw new _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(in end, cursor.Mark(), "While scanning a literal block scalar, found more spaces in lines above first content line.");
		}
		if (currentIndent == 0L && (cursor.LineOffset > 0 || indent > -1))
		{
			currentIndent = Math.Max(num, Math.Max(indent + 1, 1L));
		}
		return currentIndent;
	}

	private void FetchQuotedScalar(bool isSingleQuoted)
	{
		SaveSimpleKey();
		simpleKeyAllowed = false;
		flowScalarFetched = flowLevel > 0;
		_003Ca75b8374_002Daef2_002D4fe4_002D9788_002Dece9f52f6465_003EScalar item = ScanFlowScalar(isSingleQuoted);
		tokens.Enqueue(item);
		lastScalar = item;
		if (!isSingleQuoted && analyzer.Check('#'))
		{
			_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark obj = cursor.Mark();
			tokens.Enqueue(new _003C7c3ee0a2_002Dedb4_002D4988_002D96ba_002Dc70a57cc426f_003EError("While scanning a flow sequence end, found invalid comment after double-quoted scalar.", obj, obj));
		}
	}

	private _003Ca75b8374_002Daef2_002D4fe4_002D9788_002Dece9f52f6465_003EScalar ScanFlowScalar(bool isSingleQuoted)
	{
		_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start = cursor.Mark();
		Skip();
		StringBuilderPool.BuilderWrapper builderWrapper = StringBuilderPool.Rent();
		try
		{
			StringBuilder builder = builderWrapper.Builder;
			StringBuilderPool.BuilderWrapper builderWrapper2 = StringBuilderPool.Rent();
			try
			{
				StringBuilder builder2 = builderWrapper2.Builder;
				StringBuilderPool.BuilderWrapper builderWrapper3 = StringBuilderPool.Rent();
				try
				{
					StringBuilder builder3 = builderWrapper3.Builder;
					StringBuilderPool.BuilderWrapper builderWrapper4 = StringBuilderPool.Rent();
					try
					{
						StringBuilder builder4 = builderWrapper4.Builder;
						bool flag = false;
						while (true)
						{
							if (IsDocumentIndicator())
							{
								throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a quoted scalar, found unexpected document indicator.");
							}
							if (analyzer.IsZero())
							{
								throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a quoted scalar, found unexpected end of stream.");
							}
							if (flag && !isSingleQuoted && indent >= cursor.LineOffset)
							{
								throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a multi-line double-quoted scalar, found wrong indentation.");
							}
							flag = false;
							while (!analyzer.IsWhiteBreakOrZero())
							{
								if (isSingleQuoted && analyzer.Check('\'') && analyzer.Check('\'', 1))
								{
									builder.Append('\'');
									Skip();
									Skip();
									continue;
								}
								if (analyzer.Check(isSingleQuoted ? '\'' : '"'))
								{
									break;
								}
								if (!isSingleQuoted && analyzer.Check('\\') && analyzer.IsBreak(1))
								{
									Skip();
									SkipLine();
									flag = true;
									break;
								}
								if (!isSingleQuoted && analyzer.Check('\\'))
								{
									int num = 0;
									char c = analyzer.Peek(1);
									switch (c)
									{
									case 'x':
										num = 2;
										break;
									case 'u':
										num = 4;
										break;
									case 'U':
										num = 8;
										break;
									default:
									{
										if (SimpleEscapeCodes.TryGetValue(c, out var value))
										{
											builder.Append(value);
											break;
										}
										throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a quoted scalar, found unknown escape character.");
									}
									}
									Skip();
									Skip();
									if (num <= 0)
									{
										continue;
									}
									int num2 = 0;
									for (int i = 0; i < num; i++)
									{
										if (!analyzer.IsHex(i))
										{
											throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a quoted scalar, did not find expected hexadecimal number.");
										}
										num2 = (num2 << 4) + analyzer.AsHex(i);
									}
									if (num2 >= 55296 && num2 <= 57343)
									{
										for (int j = 0; j < num; j++)
										{
											Skip();
										}
										if (analyzer.Peek(0) != '\\' || (analyzer.Peek(1) != 'u' && analyzer.Peek(1) != 'U'))
										{
											throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a quoted scalar, found invalid Unicode surrogates.");
										}
										Skip();
										num = ((analyzer.Peek(0) != 'u') ? 8 : 4);
										Skip();
										int num3 = 0;
										for (int k = 0; k < num; k++)
										{
											if (!analyzer.IsHex(0))
											{
												throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a quoted scalar, did not find expected hexadecimal number.");
											}
											num3 = (num3 << 4) + analyzer.AsHex(k);
										}
										for (int l = 0; l < num; l++)
										{
											Skip();
										}
										num2 = char.ConvertToUtf32((char)num2, (char)num3);
									}
									else
									{
										if (num2 > 1114111)
										{
											throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a quoted scalar, found invalid Unicode character escape code.");
										}
										for (int m = 0; m < num; m++)
										{
											Skip();
										}
									}
									builder.Append(char.ConvertFromUtf32(num2));
								}
								else
								{
									builder.Append(ReadCurrentCharacter());
								}
							}
							if (analyzer.Check(isSingleQuoted ? '\'' : '"'))
							{
								break;
							}
							while (analyzer.IsWhite() || analyzer.IsBreak())
							{
								if (analyzer.IsWhite())
								{
									if (!flag)
									{
										builder2.Append(ReadCurrentCharacter());
									}
									else
									{
										Skip();
									}
								}
								else if (!flag)
								{
									builder2.Length = 0;
									builder3.Append(ReadLine());
									flag = true;
								}
								else
								{
									builder4.Append(ReadLine());
								}
							}
							if (flag)
							{
								if (StartsWith(builder3, '\n'))
								{
									if (builder4.Length == 0)
									{
										builder.Append(' ');
									}
									else
									{
										builder.Append((object?)builder4);
									}
								}
								else
								{
									builder.Append((object?)builder3);
									builder.Append((object?)builder4);
								}
								builder3.Length = 0;
								builder4.Length = 0;
							}
							else
							{
								builder.Append((object?)builder2);
								builder2.Length = 0;
							}
						}
						Skip();
						return new _003Ca75b8374_002Daef2_002D4fe4_002D9788_002Dece9f52f6465_003EScalar(builder.ToString(), isSingleQuoted ? _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.SingleQuoted : _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.DoubleQuoted, start, cursor.Mark());
					}
					finally
					{
						((IDisposable)builderWrapper4/*cast due to constrained. prefix*/).Dispose();
					}
				}
				finally
				{
					((IDisposable)builderWrapper3/*cast due to constrained. prefix*/).Dispose();
				}
			}
			finally
			{
				((IDisposable)builderWrapper2/*cast due to constrained. prefix*/).Dispose();
			}
		}
		finally
		{
			((IDisposable)builderWrapper/*cast due to constrained. prefix*/).Dispose();
		}
	}

	private void FetchPlainScalar()
	{
		SaveSimpleKey();
		simpleKeyAllowed = false;
		bool isMultiline = false;
		_003Ca75b8374_002Daef2_002D4fe4_002D9788_002Dece9f52f6465_003EScalar item = (lastScalar = ScanPlainScalar(ref isMultiline));
		if (isMultiline && analyzer.Check(':') && flowLevel == 0 && indent < cursor.LineOffset)
		{
			tokens.Enqueue(new _003C7c3ee0a2_002Dedb4_002D4988_002D96ba_002Dc70a57cc426f_003EError("While scanning a multiline plain scalar, found invalid mapping.", cursor.Mark(), cursor.Mark()));
		}
		tokens.Enqueue(item);
	}

	private _003Ca75b8374_002Daef2_002D4fe4_002D9788_002Dece9f52f6465_003EScalar ScanPlainScalar(ref bool isMultiline)
	{
		StringBuilderPool.BuilderWrapper builderWrapper = StringBuilderPool.Rent();
		try
		{
			StringBuilder builder = builderWrapper.Builder;
			StringBuilderPool.BuilderWrapper builderWrapper2 = StringBuilderPool.Rent();
			try
			{
				StringBuilder builder2 = builderWrapper2.Builder;
				StringBuilderPool.BuilderWrapper builderWrapper3 = StringBuilderPool.Rent();
				try
				{
					StringBuilder builder3 = builderWrapper3.Builder;
					StringBuilderPool.BuilderWrapper builderWrapper4 = StringBuilderPool.Rent();
					try
					{
						StringBuilder builder4 = builderWrapper4.Builder;
						bool flag = false;
						long num = indent + 1;
						_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start = cursor.Mark();
						_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end = start;
						_003Cfab56de9_002D6af9_002D4218_002Daf7a_002Dd7674b431ad4_003ESimpleKey obj = simpleKeys.Peek();
						while (!IsDocumentIndicator())
						{
							if (analyzer.Check('#'))
							{
								if (indent < 0 && flowLevel == 0)
								{
									plainScalarFollowedByComment = true;
								}
								break;
							}
							bool flag2 = analyzer.Check('*') && (!obj.IsPossible || !obj.IsRequired);
							while (!analyzer.IsWhiteBreakOrZero())
							{
								if ((analyzer.Check(':') && !flag2 && (analyzer.IsWhiteBreakOrZero(1) || (flowLevel > 0 && analyzer.Check(',', 1)))) || (flowLevel > 0 && analyzer.Check(",[]{}")))
								{
									if (flowLevel == 0 && !obj.IsPossible)
									{
										tokens.Enqueue(new _003C7c3ee0a2_002Dedb4_002D4988_002D96ba_002Dc70a57cc426f_003EError("While scanning a plain scalar value, found invalid mapping.", cursor.Mark(), cursor.Mark()));
									}
									break;
								}
								if (flag || builder2.Length > 0)
								{
									if (flag)
									{
										if (StartsWith(builder3, '\n'))
										{
											if (builder4.Length == 0)
											{
												builder.Append(' ');
											}
											else
											{
												builder.Append((object?)builder4);
											}
										}
										else
										{
											builder.Append((object?)builder3);
											builder.Append((object?)builder4);
										}
										builder3.Length = 0;
										builder4.Length = 0;
										flag = false;
									}
									else
									{
										builder.Append((object?)builder2);
										builder2.Length = 0;
									}
								}
								if (flowLevel > 0 && cursor.LineOffset < num)
								{
									throw new InvalidOperationException();
								}
								builder.Append(ReadCurrentCharacter());
								end = cursor.Mark();
							}
							if (!analyzer.IsWhite() && !analyzer.IsBreak())
							{
								break;
							}
							while (analyzer.IsWhite() || analyzer.IsBreak())
							{
								if (analyzer.IsWhite())
								{
									if (flag && cursor.LineOffset < num && analyzer.IsTab())
									{
										throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a plain scalar, found a tab character that violate indentation.");
									}
									if (!flag)
									{
										builder2.Append(ReadCurrentCharacter());
									}
									else
									{
										Skip();
									}
								}
								else
								{
									isMultiline = true;
									if (!flag)
									{
										builder2.Length = 0;
										builder3.Append(ReadLine());
										flag = true;
									}
									else
									{
										builder4.Append(ReadLine());
									}
								}
							}
							if (flowLevel == 0 && cursor.LineOffset < num)
							{
								break;
							}
						}
						if (flag)
						{
							simpleKeyAllowed = true;
						}
						return new _003Ca75b8374_002Daef2_002D4fe4_002D9788_002Dece9f52f6465_003EScalar(builder.ToString(), _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Plain, start, end);
					}
					finally
					{
						((IDisposable)builderWrapper4/*cast due to constrained. prefix*/).Dispose();
					}
				}
				finally
				{
					((IDisposable)builderWrapper3/*cast due to constrained. prefix*/).Dispose();
				}
			}
			finally
			{
				((IDisposable)builderWrapper2/*cast due to constrained. prefix*/).Dispose();
			}
		}
		finally
		{
			((IDisposable)builderWrapper/*cast due to constrained. prefix*/).Dispose();
		}
	}

	private void RemoveSimpleKey()
	{
		_003Cfab56de9_002D6af9_002D4218_002Daf7a_002Dd7674b431ad4_003ESimpleKey obj = simpleKeys.Peek();
		if (obj.IsPossible && obj.IsRequired)
		{
			throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(obj.Mark, obj.Mark, "While scanning a simple key, could not find expected ':'.");
		}
		obj.MarkAsImpossible();
	}

	private string ScanDirectiveName(in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start)
	{
		StringBuilderPool.BuilderWrapper builderWrapper = StringBuilderPool.Rent();
		try
		{
			StringBuilder builder = builderWrapper.Builder;
			while (analyzer.IsAlphaNumericDashOrUnderscore())
			{
				builder.Append(ReadCurrentCharacter());
			}
			if (builder.Length == 0)
			{
				throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a directive, could not find expected directive name.");
			}
			if (analyzer.EndOfInput)
			{
				throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a directive, found unexpected end of stream.");
			}
			if (!analyzer.IsWhiteBreakOrZero())
			{
				throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a directive, found unexpected non-alphabetical character.");
			}
			return builder.ToString();
		}
		finally
		{
			((IDisposable)builderWrapper/*cast due to constrained. prefix*/).Dispose();
		}
	}

	private void SkipWhitespaces()
	{
		while (analyzer.IsWhite())
		{
			Skip();
		}
	}

	private _003Cf27dd385_002D3eaa_002D42f1_002D8a3f_002Dd10c08c1b0c1_003EVersionDirective ScanVersionDirectiveValue(in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start)
	{
		SkipWhitespaces();
		int major = ScanVersionDirectiveNumber(in start);
		if (!analyzer.Check('.'))
		{
			throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a %YAML directive, did not find expected digit or '.' character.");
		}
		Skip();
		int minor = ScanVersionDirectiveNumber(in start);
		return new _003Cf27dd385_002D3eaa_002D42f1_002D8a3f_002Dd10c08c1b0c1_003EVersionDirective(new _003Cea849434_002D302f_002D4f54_002D8316_002D45c7b2236612_003EVersion(major, minor), start, start);
	}

	private _003C7077c70a_002D7b6b_002D4819_002D8257_002D8431e277734c_003ETagDirective ScanTagDirectiveValue(in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start)
	{
		SkipWhitespaces();
		string handle = ScanTagHandle(isDirective: true, start);
		if (!analyzer.IsWhite())
		{
			throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a %TAG directive, did not find expected whitespace.");
		}
		SkipWhitespaces();
		string prefix = ScanTagUri(null, start);
		if (!analyzer.IsWhiteBreakOrZero())
		{
			throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a %TAG directive, did not find expected whitespace or line break.");
		}
		return new _003C7077c70a_002D7b6b_002D4819_002D8257_002D8431e277734c_003ETagDirective(handle, prefix, start, start);
	}

	private string ScanTagUri([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] string head, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start)
	{
		StringBuilderPool.BuilderWrapper builderWrapper = StringBuilderPool.Rent();
		try
		{
			StringBuilder builder = builderWrapper.Builder;
			if (head != null && head.Length > 1)
			{
				builder.Append(head.Substring(1));
			}
			while (analyzer.IsAlphaNumericDashOrUnderscore() || analyzer.Check(";/?:@&=+$.!~*'()[]%") || (analyzer.Check(',') && !analyzer.IsBreak(1)))
			{
				if (analyzer.Check('%'))
				{
					builder.Append(ScanUriEscapes(in start));
				}
				else if (analyzer.Check('+'))
				{
					builder.Append(' ');
					Skip();
				}
				else
				{
					builder.Append(ReadCurrentCharacter());
				}
			}
			if (builder.Length == 0)
			{
				return string.Empty;
			}
			string text = builder.ToString();
			if (Polyfills.EndsWith(text, ','))
			{
				throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(cursor.Mark(), cursor.Mark(), "Unexpected comma at end of tag");
			}
			return text;
		}
		finally
		{
			((IDisposable)builderWrapper/*cast due to constrained. prefix*/).Dispose();
		}
	}

	private string ScanUriEscapes(in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start)
	{
		byte[] array = EmptyBytes;
		int count = 0;
		int num = 0;
		do
		{
			if (!analyzer.Check('%') || !analyzer.IsHex(1) || !analyzer.IsHex(2))
			{
				throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a tag, did not find URI escaped octet.");
			}
			int num2 = (analyzer.AsHex(1) << 4) + analyzer.AsHex(2);
			if (num == 0)
			{
				num = (((num2 & 0x80) == 0) ? 1 : (((num2 & 0xE0) == 192) ? 2 : (((num2 & 0xF0) == 224) ? 3 : (((num2 & 0xF8) == 240) ? 4 : 0))));
				if (num == 0)
				{
					throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a tag, found an incorrect leading UTF-8 octet.");
				}
				array = new byte[num];
			}
			else if ((num2 & 0xC0) != 128)
			{
				throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a tag, found an incorrect trailing UTF-8 octet.");
			}
			array[count++] = (byte)num2;
			Skip();
			Skip();
			Skip();
		}
		while (--num > 0);
		string text = Encoding.UTF8.GetString(array, 0, count);
		if (text.Length == 0 || text.Length > 2)
		{
			throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a tag, found an incorrect UTF-8 sequence.");
		}
		return text;
	}

	private string ScanTagHandle(bool isDirective, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start)
	{
		if (!analyzer.Check('!'))
		{
			throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a tag, did not find expected '!'.");
		}
		StringBuilderPool.BuilderWrapper builderWrapper = StringBuilderPool.Rent();
		try
		{
			StringBuilder builder = builderWrapper.Builder;
			builder.Append(ReadCurrentCharacter());
			while (analyzer.IsAlphaNumericDashOrUnderscore())
			{
				builder.Append(ReadCurrentCharacter());
			}
			if (analyzer.Check('!'))
			{
				builder.Append(ReadCurrentCharacter());
			}
			else if (isDirective && (builder.Length != 1 || builder[0] != '!'))
			{
				throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a tag directive, did not find expected '!'.");
			}
			return builder.ToString();
		}
		finally
		{
			((IDisposable)builderWrapper/*cast due to constrained. prefix*/).Dispose();
		}
	}

	private int ScanVersionDirectiveNumber(in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start)
	{
		int num = 0;
		int num2 = 0;
		while (analyzer.IsDigit())
		{
			if (++num2 > 9)
			{
				throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a %YAML directive, found extremely long version number.");
			}
			num = num * 10 + analyzer.AsDigit();
			Skip();
		}
		if (num2 == 0)
		{
			throw new _003C0638db70_002Dd373_002D4ff5_002Da338_002D04f6be80bb79_003ESyntaxErrorException(in start, cursor.Mark(), "While scanning a %YAML directive, did not find expected version number.");
		}
		return num;
	}

	private void SaveSimpleKey()
	{
		bool isRequired = flowLevel == 0 && indent == cursor.LineOffset;
		if (simpleKeyAllowed)
		{
			_003Cfab56de9_002D6af9_002D4218_002Daf7a_002Dd7674b431ad4_003ESimpleKey item = new _003Cfab56de9_002D6af9_002D4218_002Daf7a_002Dd7674b431ad4_003ESimpleKey(isRequired, tokensParsed + tokens.Count, cursor);
			RemoveSimpleKey();
			simpleKeys.Pop();
			simpleKeys.Push(item);
		}
	}
}
