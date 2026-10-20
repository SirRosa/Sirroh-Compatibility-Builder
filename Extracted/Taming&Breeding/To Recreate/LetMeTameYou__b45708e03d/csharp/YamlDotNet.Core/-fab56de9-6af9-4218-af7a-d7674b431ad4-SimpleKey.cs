using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003Cfab56de9_002D6af9_002D4218_002Daf7a_002Dd7674b431ad4_003ESimpleKey
{
	private readonly _003Cecd83e4d_002Dc97a_002D4d94_002Daed7_002D4ce02d4606b1_003ECursor cursor;

	public bool IsPossible { get; private set; }

	public bool IsRequired { get; }

	public int TokenNumber { get; }

	public long Index => cursor.Index;

	public long Line => cursor.Line;

	public long LineOffset => cursor.LineOffset;

	public _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark Mark => cursor.Mark();

	public void MarkAsImpossible()
	{
		IsPossible = false;
	}

	public _003Cfab56de9_002D6af9_002D4218_002Daf7a_002Dd7674b431ad4_003ESimpleKey()
	{
		cursor = new _003Cecd83e4d_002Dc97a_002D4d94_002Daed7_002D4ce02d4606b1_003ECursor();
	}

	public _003Cfab56de9_002D6af9_002D4218_002Daf7a_002Dd7674b431ad4_003ESimpleKey(bool isRequired, int tokenNumber, _003Cecd83e4d_002Dc97a_002D4d94_002Daed7_002D4ce02d4606b1_003ECursor cursor)
	{
		IsPossible = true;
		IsRequired = isRequired;
		TokenNumber = tokenNumber;
		this.cursor = new _003Cecd83e4d_002Dc97a_002D4d94_002Daed7_002D4ce02d4606b1_003ECursor(cursor);
	}
}
