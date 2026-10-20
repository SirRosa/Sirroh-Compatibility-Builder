using System;
using System.Collections.Generic;
using System.Reflection;
using JetBrains.Annotations;

namespace EpicLootAPI;

internal static class Helpers
{
	[PublicAPI]
	public static void Add<T>(this List<T> list, params T[] items)
	{
		list.AddRange(items);
	}

	[PublicAPI]
	public static void AddMinion(this List<BountyMinion> list, string ID, int count)
	{
		list.Add(new BountyMinion(ID, count));
	}

	[PublicAPI]
	public static void Add(this List<ItemAmount> list, string item, int amount = 1)
	{
		list.Add(new ItemAmount(item, amount));
	}

	[PublicAPI]
	public static void Add(this List<MaterialConversionRequirement> list, string item, int amount = 1)
	{
		list.Add(new MaterialConversionRequirement(item, amount));
	}

	internal static string GetInternalName(this CraftingTable table)
	{
		MemberInfo[] member = typeof(CraftingTable).GetMember(table.ToString());
		if (member.Length == 0)
		{
			return table.ToString();
		}
		InternalName internalName = (InternalName)Attribute.GetCustomAttribute(member[0], typeof(InternalName));
		if (internalName == null)
		{
			return table.ToString();
		}
		return internalName.internalName;
	}

	[PublicAPI]
	public static void Add(this List<RecipeRequirement> list, string item, int amount = 1)
	{
		list.Add(new RecipeRequirement(item, amount));
	}

	[PublicAPI]
	public static void Add(this List<SetBonusInfo> list, int count, string type, float min = 1f, float max = 1f, float increment = 1f)
	{
		list.Add(new SetBonusInfo(count, type, min, max, increment));
	}

	[PublicAPI]
	public static void Add(this List<GuaranteedMagicEffect> list, string type, float min = 1f, float max = 1f, float increment = 1f)
	{
		list.Add(new GuaranteedMagicEffect(type, min, max, increment));
	}
}
