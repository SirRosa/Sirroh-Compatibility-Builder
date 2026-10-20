using System;
using System.Runtime.CompilerServices;
using System.Text.RegularExpressions;

namespace YamlDotNet.Core.Tokens;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal class TagDirective : Token
{
	private static readonly Regex TagHandlePattern = new Regex("^!([0-9A-Za-z_\\-]*!)?$", RegexOptions.Compiled);

	public string Handle { get; }

	public string Prefix { get; }

	public TagDirective(string handle, string prefix)
		: this(handle, prefix, Mark.Empty, Mark.Empty)
	{
	}

	public TagDirective(string handle, string prefix, Mark start, Mark end)
		: base(start, end)
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

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
	public override bool Equals(object obj)
	{
		if (obj is TagDirective tagDirective && Handle.Equals(tagDirective.Handle))
		{
			return Prefix.Equals(tagDirective.Prefix);
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
