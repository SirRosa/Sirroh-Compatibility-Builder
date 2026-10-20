using JetBrains.Annotations;

namespace EpicLootAPI;

[PublicAPI]
internal static class EffectType
{
	public static string DvergerCirclet = "DvergerCirclet";

	public static string InstantMead = "InstantMead";

	public static string AutoMead = "AutoMead";

	public static string DecreaseMeadCooldown = "DecreaseMeadCooldown";

	public static string Megingjord = "Megingjord";

	public static string Wishbone = "Wishbone";

	public static string Andvaranaut = "Andvaranaut";

	public static string ModifyDamage = "ModifyDamage";

	public static string ModifyPhysicalDamage = "ModifyPhysicalDamage";

	public static string ModifyElementalDamage = "ModifyElementalDamage";

	public static string ModifyDurability = "ModifyDurability";

	public static string ModifyDrawStaminaUse = "ModifyDrawStaminaUse";

	public static string ReduceWeight = "ReduceWeight";

	public static string RemoveSpeedPenalty = "RemoveSpeedPenalty";

	public static string ModifyBlockPower = "ModifyBlockPower";

	public static string ModifyBlockForce = "ModifyBlockForce";

	public static string ModifyParry = "ModifyParry";

	public static string ModifyArmor = "ModifyArmor";

	public static string ModifyBackstab = "ModifyBackstab";

	public static string IncreaseMiningDrop = "IncreaseMiningDrop";

	public static string IncreaseTreeDrop = "IncreaseTreeDrop";

	public static string IncreaseHealth = "IncreaseHealth";

	public static string IncreaseHeatResistance = "IncreaseHeatResistance";

	public static string IncreaseStamina = "IncreaseStamina";

	public static string IncreaseEitr = "IncreaseEitr";

	public static string DecreaseForsakenCooldown = "DecreaseForsakenCooldown";

	public static string ModifyHealthRegen = "ModifyHealthRegen";

	public static string AddHealthRegen = "AddHealthRegen";

	public static string ModifyStaminaRegen = "ModifyStaminaRegen";

	public static string ModifyEitrRegen = "ModifyEitrRegen";

	public static string AddBluntDamage = "AddBluntDamage";

	public static string AddSlashingDamage = "AddSlashingDamage";

	public static string AddPiercingDamage = "AddPiercingDamage";

	public static string AddFireDamage = "AddFireDamage";

	public static string AddFrostDamage = "AddFrostDamage";

	public static string AddLightningDamage = "AddLightningDamage";

	public static string AddPoisonDamage = "AddPoisonDamage";

	public static string AddSpiritDamage = "AddSpiritDamage";

	public static string AddFireResistancePercentage = "AddFireResistancePercentage";

	public static string AddFrostResistancePercentage = "AddFrostResistancePercentage";

	public static string AddLightningResistancePercentage = "AddLightningResistancePercentage";

	public static string AddPoisonResistancePercentage = "AddPoisonResistancePercentage";

	public static string AddSpiritResistancePercentage = "AddSpiritResistancePercentage";

	public static string AddElementalResistancePercentage = "AddElementalResistancePercentage";

	public static string AddBluntResistancePercentage = "AddBluntResistancePercentage";

	public static string AddSlashingResistancePercentage = "AddSlashingResistancePercentage";

	public static string AddPiercingResistancePercentage = "AddPiercingResistancePercentage";

	public static string AddChoppingResistancePercentage = "AddChoppingResistancePercentage";

	public static string AddPhysicalResistancePercentage = "AddPhysicalResistancePercentage";

	public static string ModifyMovementSpeed = "ModifyMovementSpeed";

	public static string ModifySprintStaminaUse = "ModifySprintStaminaUse";

	public static string ModifyNoise = "ModifyNoise";

	public static string ModifyBuildDistance = "ModifyBuildDistance";

	public static string ModifyPickupRange = "ModifyPickupRange";

	public static string ModifyMagicFireRate = "ModifyMagicFireRate";

	public static string AmmoConservation = "AmmoConservation";

	public static string ModifyProjectileSpeed = "ModifyProjectileSpeed";

	public static string ModifyDodgeStaminaUse = "ModifyDodgeStaminaUse";

	public static string ModifyJumpStaminaUse = "ModifyJumpStaminaUse";

	public static string ModifyAttackStaminaUse = "ModifyAttackStaminaUse";

	public static string ModifyAttackEitrUse = "ModifyAttackEitrUse";

	public static string ModifyAttackHealthUse = "ModifyAttackHealthUse";

	public static string ModifyBlockStaminaUse = "ModifyBlockStaminaUse";

	public static string ModifySummonHealth = "ModifySummonHealth";

	public static string ModifySummonDamage = "ModifySummonDamage";

	public static string ModifyWispRange = "ModifyWispRange";

	public static string Indestructible = "Indestructible";

	public static string CoinHoarder = "CoinHoarder";

	public static string Weightless = "Weightless";

	public static string LifeSteal = "LifeSteal";

	public static string EitrLeech = "EitrLeech";

	public static string Bloodlust = "Bloodlust";

	public static string AddCarryWeight = "AddCarryWeight";

	public static string ModifyAttackSpeed = "ModifyAttackSpeed";

	public static string Throwable = "Throwable";

	public static string Waterproof = "Waterproof";

	public static string Warmth = "Warmth";

	public static string Paralyze = "Paralyze";

	public static string DoubleJump = "DoubleJump";

	public static string ExplosiveArrows = "ExplosiveArrows";

	public static string QuickDraw = "QuickDraw";

	public static string AddSwordsSkill = "AddSwordsSkill";

	public static string AddKnivesSkill = "AddKnivesSkill";

	public static string AddClubsSkill = "AddClubsSkill";

	public static string AddPolearmsSkill = "AddPolearmsSkill";

	public static string AddSpearsSkill = "AddSpearsSkill";

	public static string AddBlockingSkill = "AddBlockingSkill";

	public static string AddAxesSkill = "AddAxesSkill";

	public static string AddBowsSkill = "AddBowsSkill";

	public static string AddCrossbowsSkill = "AddCrossbowsSkill";

	public static string AddUnarmedSkill = "AddUnarmedSkill";

	public static string AddPickaxesSkill = "AddPickaxesSkill";

	public static string AddFishingSkill = "AddFishingSkill";

	public static string AddElementalMagicSkill = "AddElementalMagicSkill";

	public static string AddBloodMagicSkill = "AddBloodMagicSkill";

	public static string AddMovementSkills = "AddMovementSkills";

	public static string AddCrafterSkills = "AddCrafterSkills";

	public static string ModifyStaggerDuration = "ModifyStaggerDuration";

	public static string QuickLearner = "QuickLearner";

	public static string RecallWeapon = "RecallWeapon";

	public static string ReflectDamage = "ReflectDamage";

	public static string AvoidDamageTaken = "AvoidDamageTaken";

	public static string StaggerOnDamageTaken = "StaggerOnDamageTaken";

	public static string FeatherFall = "FeatherFall";

	public static string ModifyDiscoveryRadius = "ModifyDiscoveryRadius";

	public static string FreeBuild = "FreeBuild";

	public static string Comfortable = "Comfortable";

	public static string ModifyLowHealth = "ModifyLowHealth";

	public static string ModifyMovementSpeedLowHealth = "ModifyMovementSpeedLowHealth";

	public static string ModifyHealthRegenLowHealth = "ModifyHealthRegenLowHealth";

	public static string ModifyStaminaRegenLowHealth = "ModifyStaminaRegenLowHealth";

	public static string ModifyEitrRegenLowHealth = "ModifyEitrRegenLowHealth";

	public static string ModifyArmorLowHealth = "ModifyArmorLowHealth";

	public static string ModifyDamageLowHealth = "ModifyDamageLowHealth";

	public static string ModifyBlockPowerLowHealth = "ModifyBlockPowerLowHealth";

	public static string ModifyParryLowHealth = "ModifyParryLowHealth";

	public static string ModifyAttackSpeedLowHealth = "ModifyAttackSpeedLowHealth";

	public static string AvoidDamageTakenLowHealth = "AvoidDamageTakenLowHealth";

	public static string LifeStealLowHealth = "LifeStealLowHealth";

	public static string Glowing = "Glowing";

	public static string Executioner = "Executioner";

	public static string Riches = "Riches";

	public static string Opportunist = "Opportunist";

	public static string Duelist = "Duelist";

	public static string Immovable = "Immovable";

	public static string ModifyStaggerDamage = "ModifyStaggerDamage";

	public static string Luck = "Luck";

	public static string ModifyParryWindow = "ModifyParryWindow";

	public static string Slow = "Slow";

	public static string FrostDamageAOE = "FrostDamageAOE";

	public static string DoubleMagicShot = "DoubleMagicShot";

	public static string TripleBowShot = "TripleBowShot";

	public static string SpellSword = "SpellSword";

	public static string BulkUp = "BulkUp";

	public static string EitrWeave = "EitrWeave";

	public static string DartingThoughts = "DartingThoughts";

	public static string HeadHunter = "HeadHunter";

	public static string DodgeBuff = "DodgeBuff";

	public static string OffSetAttack = "OffSetAttack";

	public static string ChainLightning = "ChainLightning";

	public static string Apportation = "Apportation";

	public static string ModifyFireRate = "ModifyFireRate";

	public static string Bulwark = "Bulwark";

	public static string Undying = "Undying";

	public static string DamageTakenGivesAdrenaline = "DamageTakenGivesAdrenaline";

	public static string UseAdrenalineAsStamina = "UseAdrenalineAsStamina";

	public static string EitrUseGivesAdrenaline = "EitrUseGivesAdrenaline";

	public static string BurningAdrenaline = "BurningAdrenaline";

	public static string GainAdrenalineFromHarvesting = "GainAdrenalineFromHarvesting";

	public static string SummonBatWhenActivatingAdrenaline = "SummonBatWhenActivatingAdrenaline";

	public static string AdrenalineFrostWave = "AdrenalineFrostWave";

	public static string GainAdrenalineWhenApplyingPoison = "GainAdrenalineWhenApplyingPoison";

	public static string GainAdrenalineWhenSacrificingHealth = "GainAdrenalineWhenSacrificingHealth";

	public static string StormFury = "StormFury";

	public static string AdrenalineIncreasesHealthRegen = "AdrenalineIncreasesHealthRegen";

	public static string AdrenalineCharge = "AdrenalineCharge";

	public static string PerfectDodge = "PerfectDodge";

	public static string PerfectDodgeGivesHealth = "PerfectDodgeGivesHealth";

	public static string PerfectDodgeGivesStamina = "PerfectDodgeGivesStamina";

	public static string PerfectDodgeGivesEitr = "PerfectDodgeGivesEitr";

	public static string DecreaseDodgeCost = "DecreaseDodgeCost";

	public static string IncreaseDamageDuringNighttime = "IncreaseDamageDuringNighttime";

	public static string NightStaminaRegenIncrease = "NightStaminaRegenIncrease";

	public static string DamageReductionAtNight = "DamageReductionAtNight";

	public static string IncreaseDamageDuringDaytime = "IncreaseDamageDuringDaytime";

	public static string DayDiscovery = "DayDiscovery";

	public static string DayArmor = "DayArmor";

	public static string DayStaminaRegen = "DayStaminaRegen";

	public static string DayHealthRegen = "DayHealthRegen";

	public static string DayBlocker = "DayBlocker";

	public static string NightBlocker = "NightBlocker";

	public static string PercentHealth = "PercentHealth";

	public static string PercentStamina = "PercentStamina";

	public static string PercentEitr = "PercentEitr";

	public static string HealthGainPerXDamageDone = "HealthGainPerXDamageDone";

	public static string HealthOnEitrUse = "HealthOnEitrUse";

	public static string LifeGainOnHit = "LifeGainOnHit";

	public static string PhysToFire = "PhysToFire";

	public static string PhysToFrost = "PhysToFrost";

	public static string PhysToPoison = "PhysToPoison";

	public static string PhysToLightning = "PhysToLightning";

	public static string PhysToFireOnBlock = "PhysToFireOnBlock";

	public static string PhysToFrostOnBlock = "PhysToFrostOnBlock";

	public static string PhysToPoisonOnBlock = "PhysToPoisonOnBlock";

	public static string PhysToLightningOnBlock = "PhysToLightningOnBlock";

	public static string ConvertPhysicalDamageToLightning = "ConvertPhysicalDamageToLightning";

	public static string EitrImbueAttack = "EitrImbueAttack";

	public static string StaminaReturnFromEitr = "StaminaReturnFromEitr";

	public static string EnergeticEitr = "EnergeticEitr";

	public static string ConvertEitrCostToStaminaCost = "ConvertEitrCostToStaminaCost";

	public static string ConsumeEitrFirstForBloodCosts = "ConsumeEitrFirstForBloodCosts";

	public static string RunningOnEmpty = "RunningOnEmpty";

	public static string EveryXPointsOfEitrIncreasesStamina = "EveryXPointsOfEitrIncreasesStamina";

	public static string EitrShield = "EitrShield";

	public static string LifeGainOnBlock = "LifeGainOnBlock";

	public static string StaminaGainOnBlock = "StaminaGainOnBlock";

	public static string EitrGainOnBlock = "EitrGainOnBlock";

	public static string Kindling = "Kindling";

	public static string DamageBonusFromPlayerWeight = "DamageBonusFromPlayerWeight";

	public static string StaminaRegenBonusFromPlayerWeight = "StaminaRegenBonusFromPlayerWeight";

	public static string GainMaxStaminaBasedOnPlayerMaxHealth = "GainMaxStaminaBasedOnPlayerMaxHealth";

	public static string GainMaxCarryWeightFromRested = "GainMaxCarryWeightFromRested";

	public static string DamageIncreaseFromMovementPenalty = "DamageIncreaseFromMovementPenalty";

	public static string IncreaseXPGainFromMovementPenalty = "IncreaseXPGainFromMovementPenalty";

	public static string CarryWeightForMovementPenalty = "CarryWeightForMovementPenalty";

	public static string StaminaIncreaseForMovementPenalty = "StaminaIncreaseForMovementPenalty";

	public static string BurdenedBlock = "BurdenedBlock";

	public static string AnchoredBlock = "AnchoredBlock";

	public static string IncreaseHarvestDamage = "IncreaseHarvestDamage";

	public static string IncreaseHarvestXPGain = "IncreaseHarvestXPGain";

	public static string BountifulHarvest = "BountifulHarvest";

	public static string Mercenary = "Mercenary";

	public static string Coinplated = "Coinplated";

	public static string Wager = "Wager";

	public static string LuckWhileFishing = "LuckWhileFishing";

	public static string ChanceDoubleDamage = "ChanceDoubleDamage";

	public static string Inspiration = "Inspiration";

	public static string LuckyLoot = "LuckyLoot";

	public static string SailingSpeed = "SailingSpeed";

	public static string PotionEfficacy = "PotionEfficacy";

	public static string IncreaseMeleeSkills = "IncreaseMeleeSkills";

	public static string IncreaseRangedSkills = "IncreaseRangedSkills";

	public static string BloodStaggerBlock = "BloodStaggerBlock";

	public static string BloodBaseBlock = "BloodBaseBlock";

	public static string Warding = "Warding";

	public static string ElementalWarding = "ElementalWarding";

	public static string LuckyBlock = "LuckyBlock";

	public static string BlockAsDodgeAsBlock = "BlockAsDodgeAsBlock";

	public static string BlockAsWoodCuttingAndPickaxes = "BlockAsWoodCuttingAndPickaxes";

	public static string StaggerOnBlock = "StaggerOnBlock";

	public static string IncreaseAllPoisonDamageDone = "IncreaseAllPoisonDamageDone";

	public static string KillsReduceNextBloodCost = "KillsReduceNextBloodCost";

	public static string BloodMagicLevelIncreasesHealthRegen = "BloodMagicLevelIncreasesHealthRegen";

	public static string ChanceToCritOnHit = "ChanceToCritOnHit";

	public static string Bloodrage = "Bloodrage";

	public static string BloodDrinker = "BloodDrinker";

	public static string Trailblazer = "Trailblazer";

	public static string ReduceFallDamage = "ReduceFallDamage";

	public static string RollCleanse = "RollCleanse";

	public static string StormRider = "StormRider";

	public static string StaminaOnKill = "StaminaOnKill";

	public static string HeartyEitr = "HeartyEitr";

	public static string BurningSpeed = "BurningSpeed";

	public static string PerfectDodgeGivesSpeed = "PerfectDodgeGivesSpeed";

	public static string NightCarryWeight = "NightCarryWeight";

	public static string DaySailingSpeed = "DaySailingSpeed";

	public static string ArmorFromMovementPenalty = "ArmorFromMovementPenalty";

	public static string ReduceEitrCost = "ReduceEitrCost";

	public static string ReduceFishingStaminaCost = "ReduceFishingStaminaCost";

	public static string ReduceArmorIncreaseDamage = "ReduceArmorIncreaseDamage";

	public static string PoisonToTrueDamage = "PoisonToTrueDamage";

	public static string IcyWeight = "IcyWeight";

	public static string GainEitrWhenSacrificingHealth = "GainEitrWhenSacrificingHealth";

	public static string LuckyCraft = "LuckyCraft";

	public static string Conduit = "Conduit";

	public static string RestingHealthRegen = "RestingHealthRegen";

	public static string TravelLight = "TravelLight";

	public static string StrikeCausesLightning = "StrikeCausesLightning";

	public static string BatteringRam = "BatteringRam";

	public static string ShockingCharge = "ShockingCharge";

	public static string ForestsAid = "ForestsAid";

	public static string CorpseRot = "CorpseRot";

	public static string IcyRetribution = "IcyRetribution";

	public static string MeteorSummoner = "MeteorSummoner";

	public static string Everflow = "Everflow";

	public static string NecroticFire = "NecroticFire";
}
