using System;

namespace Jewelcrafting;

[Flags]
internal enum VisualEffectCondition : uint
{
	IsSkill = 0xFFFu,
	Swords = 1u,
	Knives = 2u,
	Clubs = 3u,
	Polearms = 4u,
	Spears = 5u,
	Blocking = 6u,
	Axes = 7u,
	Bows = 8u,
	Unarmed = 0xBu,
	Pickaxes = 0xCu,
	WoodCutting = 0xDu,
	Crossbows = 0xEu,
	IsItem = 0xFF000u,
	Helmet = 0x6000u,
	Chest = 0x7000u,
	Legs = 0xB000u,
	Hands = 0xC000u,
	Shoulder = 0x11000u,
	Tool = 0x13000u,
	GenericExtraAttributes = 0xFF000000u,
	Blackmetal = 0x40000000u,
	TwoHanded = 0x80000000u,
	SpecificExtraAttributes = ~(IsSkill | IsItem | GenericExtraAttributes),
	Hammer = 0x113000u,
	Hoe = 0x213000u,
	Buckler = 0x100006u,
	Towershield = 0x200006u,
	FineWoodBow = 0x100008u,
	BowHuntsman = 0x200008u,
	BowDraugrFang = 0x300008u,
	PickaxeIron = 0x10000Cu,
	Club = 0x100003u
}
