using System;
using System.Runtime.CompilerServices;
using System.Text.RegularExpressions;

namespace YamlDotNet.Core.Tokens;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal class _003C7077c70a_002D7b6b_002D4819_002D8257_002D8431e277734c_003ETagDirective : _003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken
{
	private static readonly Regex TagHandlePattern = new Regex("^!([0-9A-Za-z_\\-]*!)?$", RegexOptions.Compiled);

	public string Handle { get; }

	public string Prefix { get; }

	public _003C7077c70a_002D7b6b_002D4819_002D8257_002D8431e277734c_003ETagDirective(string handle, string prefix)
		: this(handle, prefix, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty)
	{
	}

	public _003C7077c70a_002D7b6b_002D4819_002D8257_002D8431e277734c_003ETagDirective(string handle, string prefix, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end)
		: base(in start, in end)
	{
		if (string.IsNullOrEmpty(handle))
		{
			throw new ArgumentNullException("handle", "Tag handle must not be empty.");
		}
		if (!TagHandlePattern.IsMatch(handle))
		{
			throw new ArgumentException("Tag handle must start and end with '!' and contain alphanumerical characters only.", "handle");
		}
		Handle = handle;
		if (string.IsNullOrEmpty(prefix))
		{
			throw new ArgumentNullException("prefix", "Tag prefix must not be empty.");
		}
		Prefix = prefix;
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
	public override bool Equals(object obj)
	{
		if (obj is _003C7077c70a_002D7b6b_002D4819_002D8257_002D8431e277734c_003ETagDirective obj2 && Handle.Equals(obj2.Handle))
		{
			return Prefix.Equals(obj2.Prefix);
		}
		return false;
	}

	public override int GetHashCode()
	{
		return Handle.GetHashCode() ^ Prefix.GetHashCode();
	}

	public override string ToString()
	{
		return Handle + " => " + Prefix;
	}
}
