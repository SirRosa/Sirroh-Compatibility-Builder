using System;
using JetBrains.Annotations;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal class SetBonusInfo
{
	public int Count;

	public GuaranteedMagicEffect Effect = new GuaranteedMagicEffect();

	public SetBonusInfo(int count, string type, ValueDef values)
	{
		Count = count;
		Effect = new GuaranteedMagicEffect(type, values);
	}

	public SetBonusInfo(int count, string type, float min, float max, float increment)
		: this(count, type, new ValueDef(min, max, increment))
	{
	}

	public SetBonusInfo()
	{
	}
}
