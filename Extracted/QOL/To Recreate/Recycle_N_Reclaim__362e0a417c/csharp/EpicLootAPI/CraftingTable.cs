using JetBrains.Annotations;

namespace EpicLootAPI;

[PublicAPI]
internal enum CraftingTable
{
	[InternalName("piece_workbench")]
	Workbench,
	[InternalName("piece_cauldron")]
	Cauldron,
	[InternalName("forge")]
	Forge,
	[InternalName("piece_artisanstation")]
	ArtisanTable,
	[InternalName("piece_stonecutter")]
	StoneCutter,
	[InternalName("piece_magetable")]
	MageTable,
	[InternalName("blackforge")]
	BlackForge,
	[InternalName("piece_preptable")]
	FoodPreparationTable,
	[InternalName("piece_MeadCauldron")]
	MeadKetill
}
