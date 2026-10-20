using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using UnityEngine;

namespace Recycle_N_Reclaim.GamePatches.Recycling;

[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
public class RecyclingAnalysisContext
{
	[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
	public readonly struct ReclaimingYieldEntry(GameObject prefab, ItemData itemData, int amount, int mQuality, int mVariant, bool initialRecipeHadZero)
	{
		public readonly GameObject Prefab = prefab;

		public readonly ItemData RecipeItemData = itemData;

		public readonly int Amount = amount;

		public readonly int mQuality = mQuality;

		public readonly int mVariant = mVariant;

		public readonly bool InitialRecipeHadZero = initialRecipeHadZero;
	}

	public ItemData Item;

	public Recipe Recipe { get; set; }

	public List<string> RecyclingImpediments { get; } = new List<string>();

	public List<string> DisplayImpediments { get; } = new List<string>();

	public List<ReclaimingYieldEntry> Entries { get; } = new List<ReclaimingYieldEntry>();

	public bool ShouldErrorDumpAnalysis { get; set; }

	public RecyclingAnalysisContext(ItemData item)
	{
		Item = item;
	}

	public void Dump()
	{
		if (ShouldErrorDumpAnalysis)
		{
			var element = new
			{
				ItemName = Item.m_shared.m_name,
				ItemQuality = Item.m_quality,
				ItemStacks = Item.m_stack,
				ItemMaxStacks = Item.m_shared.m_maxStackSize,
				Impediments = RecyclingImpediments,
				UsedRecipe = (object)GetRecipeObject(),
				Entries = Entries.Select([_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (ReclaimingYieldEntry entry) => new
				{
					PrefabName = ((Object)entry.Prefab).name,
					Amount = entry.Amount,
					Quality = entry.mQuality,
					Variant = entry.mVariant
				}).ToList()
			};
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.AppendLine("\n==== Dump of recycling analysis was requested ====");
			stringBuilder.AppendLine(ObjectDumper.Dump(element));
			stringBuilder.AppendLine("==== Dump ends here ====");
			Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogError((object)stringBuilder.ToString());
		}
	}

	private dynamic GetRecipeObject()
	{
		return new
		{
			ItemName = Recipe.m_item.m_itemData.m_shared.m_name,
			RecipeName = ((Object)Recipe).name,
			RecipeCraftedAmount = Recipe.m_amount,
			Resources = Recipe.m_resources.Select([_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (Requirement resource) => new
			{
				Name = resource.m_resItem.m_itemData.m_shared.m_name,
				Amount = resource.m_amount,
				AmountPerLevel = resource.m_amountPerLevel,
				Quality = resource.m_resItem.m_itemData.m_quality,
				Variant = resource.m_resItem.m_itemData.m_variant
			}).ToList()
		};
	}
}
