using System.Linq;
using UnityEngine;

namespace Zen.Lib;

public static class ObjectDBExt
{
	public static Recipe? GetRecipe(this ObjectDB self, ItemDrop itemDrop)
	{
		return self.m_recipes.FirstOrDefault((Recipe r) => (Object)(object)r.m_item == (Object)(object)itemDrop);
	}
}
