using System;

namespace EpicLootAPI;

internal class InternalName : Attribute
{
	public readonly string internalName;

	public InternalName(string internalName)
	{
		this.internalName = internalName;
	}
}
