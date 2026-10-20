using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings
{
	public static readonly _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings Default = new _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings();

	public int BestIndent { get; } = 2;

	public int BestWidth { get; } = int.MaxValue;

	public string NewLine { get; } = Environment.NewLine;

	public bool IsCanonical { get; }

	public bool SkipAnchorName { get; private set; }

	public int MaxSimpleKeyLength { get; } = 1024;

	public bool IndentSequences { get; }

	public bool UseUtf16SurrogatePairs { get; }

	public _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings()
	{
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
	public _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings(int bestIndent, int bestWidth, bool isCanonical, int maxSimpleKeyLength, bool skipAnchorName = false, bool indentSequences = false, string newLine = null, bool useUtf16SurrogatePairs = false)
	{
		if (bestIndent < 2 || bestIndent > 9)
		{
			throw new ArgumentOutOfRangeException("bestIndent", "BestIndent must be between 2 and 9, inclusive");
		}
		if (bestWidth <= bestIndent * 2)
		{
			throw new ArgumentOutOfRangeException("bestWidth", "BestWidth must be greater than BestIndent x 2.");
		}
		if (maxSimpleKeyLength < 0)
		{
			throw new ArgumentOutOfRangeException("maxSimpleKeyLength", "MaxSimpleKeyLength must be >= 0");
		}
		BestIndent = bestIndent;
		BestWidth = bestWidth;
		IsCanonical = isCanonical;
		MaxSimpleKeyLength = maxSimpleKeyLength;
		SkipAnchorName = skipAnchorName;
		IndentSequences = indentSequences;
		NewLine = newLine ?? Environment.NewLine;
		UseUtf16SurrogatePairs = useUtf16SurrogatePairs;
	}

	public _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings WithBestIndent(int bestIndent)
	{
		return new _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings(bestIndent, BestWidth, IsCanonical, MaxSimpleKeyLength, SkipAnchorName, IndentSequences, NewLine, UseUtf16SurrogatePairs);
	}

	public _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings WithBestWidth(int bestWidth)
	{
		return new _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings(BestIndent, bestWidth, IsCanonical, MaxSimpleKeyLength, SkipAnchorName, IndentSequences, NewLine, UseUtf16SurrogatePairs);
	}

	public _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings WithMaxSimpleKeyLength(int maxSimpleKeyLength)
	{
		return new _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings(BestIndent, BestWidth, IsCanonical, maxSimpleKeyLength, SkipAnchorName, IndentSequences, NewLine, UseUtf16SurrogatePairs);
	}

	public _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings WithNewLine(string newLine)
	{
		return new _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings(BestIndent, BestWidth, IsCanonical, MaxSimpleKeyLength, SkipAnchorName, IndentSequences, newLine, UseUtf16SurrogatePairs);
	}

	public _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings Canonical()
	{
		return new _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings(BestIndent, BestWidth, isCanonical: true, MaxSimpleKeyLength, SkipAnchorName);
	}

	public _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings WithoutAnchorName()
	{
		return new _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings(BestIndent, BestWidth, IsCanonical, MaxSimpleKeyLength, skipAnchorName: true, IndentSequences, NewLine, UseUtf16SurrogatePairs);
	}

	public _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings WithIndentedSequences()
	{
		return new _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings(BestIndent, BestWidth, IsCanonical, MaxSimpleKeyLength, SkipAnchorName, indentSequences: true, NewLine, UseUtf16SurrogatePairs);
	}

	public _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings WithUtf16SurrogatePairs()
	{
		return new _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings(BestIndent, BestWidth, IsCanonical, MaxSimpleKeyLength, SkipAnchorName, IndentSequences, NewLine, useUtf16SurrogatePairs: true);
	}
}
