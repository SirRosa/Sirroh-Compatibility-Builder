using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal sealed class EmitterSettings
{
	public static readonly EmitterSettings Default = new EmitterSettings();

	public int BestIndent { get; } = 2;

	public int BestWidth { get; } = int.MaxValue;

	public bool IsCanonical { get; }

	public bool SkipAnchorName { get; private set; }

	public int MaxSimpleKeyLength { get; } = 1024;

	public bool IndentSequences { get; }

	public EmitterSettings()
	{
	}

	public EmitterSettings(int bestIndent, int bestWidth, bool isCanonical, int maxSimpleKeyLength, bool skipAnchorName = false, bool indentSequences = false)
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
	}

	public EmitterSettings WithBestIndent(int bestIndent)
	{
		return new EmitterSettings(bestIndent, BestWidth, IsCanonical, MaxSimpleKeyLength);
	}

	public EmitterSettings WithBestWidth(int bestWidth)
	{
		return new EmitterSettings(BestIndent, bestWidth, IsCanonical, MaxSimpleKeyLength);
	}

	public EmitterSettings WithMaxSimpleKeyLength(int maxSimpleKeyLength)
	{
		return new EmitterSettings(BestIndent, BestWidth, IsCanonical, maxSimpleKeyLength);
	}

	public EmitterSettings Canonical()
	{
		return new EmitterSettings(BestIndent, BestWidth, isCanonical: true, MaxSimpleKeyLength);
	}

	public EmitterSettings WithoutAnchorName()
	{
		SkipAnchorName = true;
		return this;
	}

	public EmitterSettings WithIndentedSequences()
	{
		return new EmitterSettings(BestIndent, BestWidth, IsCanonical, MaxSimpleKeyLength, SkipAnchorName, indentSequences: true);
	}
}
