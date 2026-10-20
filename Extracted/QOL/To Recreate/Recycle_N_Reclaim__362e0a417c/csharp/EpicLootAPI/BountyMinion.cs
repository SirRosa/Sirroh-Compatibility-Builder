using System;
using JetBrains.Annotations;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal class BountyMinion
{
	public string ID = "";

	public int Count;

	public BountyMinion(string ID, int count)
	{
		this.ID = ID;
		Count = count;
	}

	public BountyMinion()
	{
	}
}
