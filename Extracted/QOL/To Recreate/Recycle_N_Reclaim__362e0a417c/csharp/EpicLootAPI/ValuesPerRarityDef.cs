using System;
using JetBrains.Annotations;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal class ValuesPerRarityDef
{
	public ValueDef Magic = new ValueDef();

	public ValueDef Rare = new ValueDef();

	public ValueDef Epic = new ValueDef();

	public ValueDef Legendary = new ValueDef();

	public ValueDef Mythic = new ValueDef();
}
