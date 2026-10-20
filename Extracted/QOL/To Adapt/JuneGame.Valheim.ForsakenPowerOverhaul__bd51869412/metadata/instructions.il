
// System.Void Microsoft.CodeAnalysis.EmbeddedAttribute::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: ret

// System.Void System.Runtime.CompilerServices.RefSafetyRulesAttribute::.ctor(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: ldarg.0
IL_0007: ldarg.1
IL_0008: stfld System.Int32 System.Runtime.CompilerServices.RefSafetyRulesAttribute::Version
IL_000d: ret

// System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetBossStoneHoverText(System.String,System.Boolean)
.locals System.Text.StringBuilder
IL_0000: ldc.i4 256
IL_0005: newobj System.Void System.Text.StringBuilder::.ctor(System.Int32)
IL_000a: stloc.0
IL_000b: ldarg.0
IL_000c: ldstr ""
IL_0011: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_0016: brfalse IL_022f
IL_001b: ldloc.0
IL_001c: ldstr "<size=24><smallcaps><color=orange>"
IL_0021: ldstr "$se_"
IL_0026: ldarg.0
IL_0027: callvirt System.String System.String::ToLower()
IL_002c: ldstr "_name"
IL_0031: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0036: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetLocalization(System.String)
IL_003b: ldstr "</color></smallcaps></size><size=20>
"
IL_0040: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0045: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_004a: pop
IL_004b: ldloc.0
IL_004c: ldc.i4.5
IL_004d: newarr System.String
IL_0052: dup
IL_0053: ldc.i4.0
IL_0054: ldstr "<smallcaps>"
IL_0059: stelem.ref
IL_005a: dup
IL_005b: ldc.i4.1
IL_005c: ldstr "$ui_fpo_passive"
IL_0061: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetLocalization(System.String)
IL_0066: stelem.ref
IL_0067: dup
IL_0068: ldc.i4.2
IL_0069: ldstr "</smallcaps></size><size=16>
"
IL_006e: stelem.ref
IL_006f: dup
IL_0070: ldc.i4.3
IL_0071: ldsfld ObjectDB ObjectDB::m_instance
IL_0076: ldstr "SE_FPO_"
IL_007b: ldarg.0
IL_007c: ldstr "_Passive"
IL_0081: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0086: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_008b: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_0090: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0095: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetToolTipStringFormat(StatusEffect)
IL_009a: stelem.ref
IL_009b: dup
IL_009c: ldc.i4.4
IL_009d: ldstr "</size><size=20>
"
IL_00a2: stelem.ref
IL_00a3: call System.String System.String::Concat(System.String[])
IL_00a8: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_00ad: pop
IL_00ae: ldsfld System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul::Mod_EpicLoot
IL_00b3: brfalse.s IL_00c4
IL_00b5: ldarg.1
IL_00b6: brtrue.s IL_00c4
IL_00b8: ldloc.0
IL_00b9: ldstr "	
"
IL_00be: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_00c3: pop
IL_00c4: ldloc.0
IL_00c5: ldc.i4.5
IL_00c6: newarr System.String
IL_00cb: dup
IL_00cc: ldc.i4.0
IL_00cd: ldstr "<smallcaps>"
IL_00d2: stelem.ref
IL_00d3: dup
IL_00d4: ldc.i4.1
IL_00d5: ldstr "$ui_fpo_equipped $ui_fpo_passive"
IL_00da: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetLocalization(System.String)
IL_00df: stelem.ref
IL_00e0: dup
IL_00e1: ldc.i4.2
IL_00e2: ldstr "</smallcaps></size><size=16>
"
IL_00e7: stelem.ref
IL_00e8: dup
IL_00e9: ldc.i4.3
IL_00ea: ldsfld ObjectDB ObjectDB::m_instance
IL_00ef: ldstr "SE_FPO_"
IL_00f4: ldarg.0
IL_00f5: ldstr "_Equipped"
IL_00fa: call System.String System.String::Concat(System.String,System.String,System.String)
IL_00ff: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0104: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_0109: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_010e: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetToolTipStringFormat(StatusEffect)
IL_0113: stelem.ref
IL_0114: dup
IL_0115: ldc.i4.4
IL_0116: ldstr "</size><size=20>
"
IL_011b: stelem.ref
IL_011c: call System.String System.String::Concat(System.String[])
IL_0121: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0126: pop
IL_0127: ldsfld System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul::Mod_EpicLoot
IL_012c: brfalse.s IL_013d
IL_012e: ldarg.1
IL_012f: brtrue.s IL_013d
IL_0131: ldloc.0
IL_0132: ldstr "	
"
IL_0137: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_013c: pop
IL_013d: ldloc.0
IL_013e: ldc.i4.5
IL_013f: newarr System.String
IL_0144: dup
IL_0145: ldc.i4.0
IL_0146: ldstr "<smallcaps>"
IL_014b: stelem.ref
IL_014c: dup
IL_014d: ldc.i4.1
IL_014e: ldstr "$ui_fpo_active"
IL_0153: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetLocalization(System.String)
IL_0158: stelem.ref
IL_0159: dup
IL_015a: ldc.i4.2
IL_015b: ldstr "</smallcaps></size><size=16>
"
IL_0160: stelem.ref
IL_0161: dup
IL_0162: ldc.i4.3
IL_0163: ldsfld ObjectDB ObjectDB::m_instance
IL_0168: ldstr "SE_FPO_"
IL_016d: ldarg.0
IL_016e: ldstr "_Active"
IL_0173: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0178: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_017d: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_0182: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0187: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetToolTipStringFormat(StatusEffect)
IL_018c: stelem.ref
IL_018d: dup
IL_018e: ldc.i4.4
IL_018f: ldstr "</size><size=20>
"
IL_0194: stelem.ref
IL_0195: call System.String System.String::Concat(System.String[])
IL_019a: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_019f: pop
IL_01a0: ldsfld System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul::Mod_EpicLoot
IL_01a5: brfalse.s IL_01b6
IL_01a7: ldarg.1
IL_01a8: brtrue.s IL_01b6
IL_01aa: ldloc.0
IL_01ab: ldstr "	
"
IL_01b0: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_01b5: pop
IL_01b6: ldloc.0
IL_01b7: ldc.i4.5
IL_01b8: newarr System.String
IL_01bd: dup
IL_01be: ldc.i4.0
IL_01bf: ldstr "<smallcaps>"
IL_01c4: stelem.ref
IL_01c5: dup
IL_01c6: ldc.i4.1
IL_01c7: ldstr "$ui_fpo_shared $ui_fpo_active"
IL_01cc: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetLocalization(System.String)
IL_01d1: stelem.ref
IL_01d2: dup
IL_01d3: ldc.i4.2
IL_01d4: ldstr "</smallcaps></size><size=16>
"
IL_01d9: stelem.ref
IL_01da: dup
IL_01db: ldc.i4.3
IL_01dc: ldsfld ObjectDB ObjectDB::m_instance
IL_01e1: ldstr "SE_FPO_"
IL_01e6: ldarg.0
IL_01e7: ldstr "_Shared"
IL_01ec: call System.String System.String::Concat(System.String,System.String,System.String)
IL_01f1: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_01f6: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_01fb: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0200: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetToolTipStringFormat(StatusEffect)
IL_0205: stelem.ref
IL_0206: dup
IL_0207: ldc.i4.4
IL_0208: ldstr "</size><size=20>

"
IL_020d: stelem.ref
IL_020e: call System.String System.String::Concat(System.String[])
IL_0213: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0218: pop
IL_0219: ldsfld System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul::Mod_EpicLoot
IL_021e: brfalse.s IL_022f
IL_0220: ldarg.1
IL_0221: brtrue.s IL_022f
IL_0223: ldloc.0
IL_0224: ldstr "	
	
"
IL_0229: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_022e: pop
IL_022f: ldloc.0
IL_0230: callvirt System.String System.Object::ToString()
IL_0235: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Add_Buttons()
.locals 
IL_0000: newobj System.Void Jotunn.Configs.ButtonConfig::.ctor()
IL_0005: dup
IL_0006: ldstr "Button_PowerCycle"
IL_000b: callvirt System.Void Jotunn.Configs.ButtonConfig::set_Name(System.String)
IL_0010: dup
IL_0011: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.KeyCode> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Button_PowerCycle
IL_0016: callvirt System.Void Jotunn.Configs.ButtonConfig::set_Config(BepInEx.Configuration.ConfigEntry`1<UnityEngine.KeyCode>)
IL_001b: stsfld Jotunn.Configs.ButtonConfig ForsakenPowerOverhaul.ForsakenPowerOverhaul::ButtonConfig_PowerCycle
IL_0020: call Jotunn.Managers.InputManager Jotunn.Managers.InputManager::get_Instance()
IL_0025: ldstr "JuneGame.Valheim.ForsakenPowerOverhaul"
IL_002a: ldsfld Jotunn.Configs.ButtonConfig ForsakenPowerOverhaul.ForsakenPowerOverhaul::ButtonConfig_PowerCycle
IL_002f: callvirt System.Void Jotunn.Managers.InputManager::AddButton(System.String,Jotunn.Configs.ButtonConfig)
IL_0034: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Add_ConfigEntries()
.locals System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, System.String, ConfigurationManagerAttributes, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigDescription, System.Collections.Generic.List`1/Enumerator<System.String>, System.String, System.Collections.Generic.List`1/Enumerator<System.String>, System.String, System.String, System.Int32
IL_0000: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Add_Dictionaries()
IL_0005: ldstr "MaxHealth"
IL_000a: stloc.0
IL_000b: ldstr "HealthRegen"
IL_0010: stloc.1
IL_0011: ldstr "HealthRegenModifier"
IL_0016: stloc.2
IL_0017: ldstr "MaxStamina"
IL_001c: stloc.3
IL_001d: ldstr "StaminaRegenModifier"
IL_0022: stloc.s V_4
IL_0024: ldstr "MaxEitr"
IL_0029: stloc.s V_5
IL_002b: ldstr "EitrRegenModifier"
IL_0030: stloc.s V_6
IL_0032: ldstr "MaxWeight"
IL_0037: stloc.s V_7
IL_0039: ldstr "MoveSpeedModifier"
IL_003e: stloc.s V_8
IL_0040: ldstr "JumpForceModifier"
IL_0045: stloc.s V_9
IL_0047: ldstr "MaxFallSpeed"
IL_004c: stloc.s V_10
IL_004e: ldstr "EquipmentSpeedModifier"
IL_0053: stloc.s V_11
IL_0055: ldstr "WindSpeedModifier"
IL_005a: stloc.s V_12
IL_005c: ldstr "RunStaminaCostModifier"
IL_0061: stloc.s V_13
IL_0063: ldstr "JumpStaminaCostModifier"
IL_0068: stloc.s V_14
IL_006a: ldstr "StealthModifier"
IL_006f: stloc.s V_15
IL_0071: ldstr "NoiseModifier"
IL_0076: stloc.s V_16
IL_0078: ldstr "StatusAttributes"
IL_007d: stloc.s V_17
IL_007f: ldstr "OutgoingDamageTypes"
IL_0084: stloc.s V_18
IL_0086: ldstr "OutgoingDamageModifiers"
IL_008b: stloc.s V_19
IL_008d: ldstr "FallDamageModifier"
IL_0092: stloc.s V_20
IL_0094: ldstr "HeatDamageModifier"
IL_0099: stloc.s V_21
IL_009b: ldstr "IncomingDamageTypes"
IL_00a0: stloc.s V_22
IL_00a2: ldstr "IncomingDamageModifiers"
IL_00a7: stloc.s V_23
IL_00a9: ldstr "A value of "12.34" translates to a 12.34% Increase."
IL_00ae: stloc.s V_24
IL_00b0: ldstr "A value of "12.34" translates to a 12.34% Decrease."
IL_00b5: stloc.s V_25
IL_00b7: ldstr "Acceptable Values: [ColdResistance, DoubleImpactDamage, SailingPower]."
IL_00bc: stloc.s V_26
IL_00be: ldstr "Acceptable Values: [All, Unarmed, Clubs, Axes, Knives, Spears, Swords, Polearms, Bows, Crossbows, ElementalMagic, BloodMagic, WoodCutting, Pickaxes]."
IL_00c3: stloc.s V_27
IL_00c5: ldstr "Acceptable Values: [Physical, Pierce, Slash, Blunt, Elemental, Lightning, Poison, Frost, Fire, Spirit, Chop, Pickaxe]."
IL_00ca: stloc.s V_28
IL_00cc: ldstr "Acceptable Values: [0, 25, 50, 100, 150, 200] (0 = Immune, 25 = Very Resistant, 50 = Resistant, 100 = Neutral, 150 = Weak, 200 = Very Weak)."
IL_00d1: stloc.s V_29
IL_00d3: ldstr "Multiple Values Acceptable with Format: "ValueA,ValueB,ValueC"."
IL_00d8: stloc.s V_30
IL_00da: ldstr "This Config may take priority over most mods."
IL_00df: stloc.s V_31
IL_00e1: ldstr "This Config is for Game Balance."
IL_00e6: stloc.s V_32
IL_00e8: newobj System.Void ConfigurationManagerAttributes::.ctor()
IL_00ed: dup
IL_00ee: ldc.i4.1
IL_00ef: callvirt System.Void ConfigurationManagerAttributes::set_IsAdminOnly(System.Boolean)
IL_00f4: stloc.s V_33
IL_00f6: ldstr "Input to Cycle through unlocked Forsaken Powers."
IL_00fb: ldnull
IL_00fc: call !!0[] System.Array::Empty<System.Object>()
IL_0101: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0106: stloc.s V_34
IL_0108: ldstr "Config Preset.
Acceptable Values: [Custom, Vanilla, Vanilla+, Passive Powers]."
IL_010d: ldc.i4.4
IL_010e: newarr System.String
IL_0113: dup
IL_0114: ldc.i4.0
IL_0115: ldstr "Custom"
IL_011a: stelem.ref
IL_011b: dup
IL_011c: ldc.i4.1
IL_011d: ldstr "Vanilla"
IL_0122: stelem.ref
IL_0123: dup
IL_0124: ldc.i4.2
IL_0125: ldstr "Vanilla+"
IL_012a: stelem.ref
IL_012b: dup
IL_012c: ldc.i4.3
IL_012d: ldstr "Passive Powers"
IL_0132: stelem.ref
IL_0133: newobj System.Void BepInEx.Configuration.AcceptableValueList`1<System.String>::.ctor(!0[])
IL_0138: ldc.i4.1
IL_0139: newarr System.Object
IL_013e: dup
IL_013f: ldc.i4.0
IL_0140: ldloc.s V_33
IL_0142: stelem.ref
IL_0143: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0148: stloc.s V_35
IL_014a: ldstr "Forsaken Power's Active Duration in Seconds.
"
IL_014f: ldloc.s V_31
IL_0151: call System.String System.String::Concat(System.String,System.String)
IL_0156: ldnull
IL_0157: ldc.i4.1
IL_0158: newarr System.Object
IL_015d: dup
IL_015e: ldc.i4.0
IL_015f: ldloc.s V_33
IL_0161: stelem.ref
IL_0162: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0167: stloc.s V_36
IL_0169: ldstr "Forsaken Power's Cooldown Duration in Seconds.
"
IL_016e: ldloc.s V_31
IL_0170: call System.String System.String::Concat(System.String,System.String)
IL_0175: ldnull
IL_0176: ldc.i4.1
IL_0177: newarr System.Object
IL_017c: dup
IL_017d: ldc.i4.0
IL_017e: ldloc.s V_33
IL_0180: stelem.ref
IL_0181: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0186: stloc.s V_37
IL_0188: ldstr "Enable Power Cycling."
IL_018d: ldnull
IL_018e: ldc.i4.1
IL_018f: newarr System.Object
IL_0194: dup
IL_0195: ldc.i4.0
IL_0196: ldloc.s V_33
IL_0198: stelem.ref
IL_0199: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_019e: stloc.s V_38
IL_01a0: ldstr "Increase Max Health by Value."
IL_01a5: ldnull
IL_01a6: ldc.i4.1
IL_01a7: newarr System.Object
IL_01ac: dup
IL_01ad: ldc.i4.0
IL_01ae: ldloc.s V_33
IL_01b0: stelem.ref
IL_01b1: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_01b6: stloc.s V_39
IL_01b8: ldstr "Increase Health Regeneration by Value."
IL_01bd: ldnull
IL_01be: ldc.i4.1
IL_01bf: newarr System.Object
IL_01c4: dup
IL_01c5: ldc.i4.0
IL_01c6: ldloc.s V_33
IL_01c8: stelem.ref
IL_01c9: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_01ce: stloc.s V_40
IL_01d0: ldstr "Increase Health Regeneration by Value Percent.
"
IL_01d5: ldloc.s V_24
IL_01d7: call System.String System.String::Concat(System.String,System.String)
IL_01dc: ldnull
IL_01dd: ldc.i4.1
IL_01de: newarr System.Object
IL_01e3: dup
IL_01e4: ldc.i4.0
IL_01e5: ldloc.s V_33
IL_01e7: stelem.ref
IL_01e8: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_01ed: stloc.s V_41
IL_01ef: ldstr "Increase Max Stamina by Value."
IL_01f4: ldnull
IL_01f5: ldc.i4.1
IL_01f6: newarr System.Object
IL_01fb: dup
IL_01fc: ldc.i4.0
IL_01fd: ldloc.s V_33
IL_01ff: stelem.ref
IL_0200: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0205: stloc.s V_42
IL_0207: ldstr "Increase Stamina Regeneration by Value Percent.
"
IL_020c: ldloc.s V_24
IL_020e: call System.String System.String::Concat(System.String,System.String)
IL_0213: ldnull
IL_0214: ldc.i4.1
IL_0215: newarr System.Object
IL_021a: dup
IL_021b: ldc.i4.0
IL_021c: ldloc.s V_33
IL_021e: stelem.ref
IL_021f: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0224: stloc.s V_43
IL_0226: ldstr "Increase Max Eitr by Value."
IL_022b: ldnull
IL_022c: ldc.i4.1
IL_022d: newarr System.Object
IL_0232: dup
IL_0233: ldc.i4.0
IL_0234: ldloc.s V_33
IL_0236: stelem.ref
IL_0237: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_023c: stloc.s V_44
IL_023e: ldstr "Increase Eitr Regeneration by Value Percent.
"
IL_0243: ldloc.s V_24
IL_0245: call System.String System.String::Concat(System.String,System.String)
IL_024a: ldnull
IL_024b: ldc.i4.1
IL_024c: newarr System.Object
IL_0251: dup
IL_0252: ldc.i4.0
IL_0253: ldloc.s V_33
IL_0255: stelem.ref
IL_0256: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_025b: stloc.s V_45
IL_025d: ldstr "Increase Max Weight Capacity by Value."
IL_0262: ldnull
IL_0263: ldc.i4.1
IL_0264: newarr System.Object
IL_0269: dup
IL_026a: ldc.i4.0
IL_026b: ldloc.s V_33
IL_026d: stelem.ref
IL_026e: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0273: stloc.s V_46
IL_0275: ldstr "Increase Movement Speed by Value Percent.
"
IL_027a: ldloc.s V_24
IL_027c: call System.String System.String::Concat(System.String,System.String)
IL_0281: ldnull
IL_0282: ldc.i4.1
IL_0283: newarr System.Object
IL_0288: dup
IL_0289: ldc.i4.0
IL_028a: ldloc.s V_33
IL_028c: stelem.ref
IL_028d: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0292: stloc.s V_47
IL_0294: ldstr "Increase Jump Force by Value Percent.
"
IL_0299: ldloc.s V_24
IL_029b: call System.String System.String::Concat(System.String,System.String)
IL_02a0: ldnull
IL_02a1: ldc.i4.1
IL_02a2: newarr System.Object
IL_02a7: dup
IL_02a8: ldc.i4.0
IL_02a9: ldloc.s V_33
IL_02ab: stelem.ref
IL_02ac: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_02b1: stloc.s V_48
IL_02b3: ldstr "Limits Max Fall Speed to Value."
IL_02b8: ldnull
IL_02b9: ldc.i4.1
IL_02ba: newarr System.Object
IL_02bf: dup
IL_02c0: ldc.i4.0
IL_02c1: ldloc.s V_33
IL_02c3: stelem.ref
IL_02c4: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_02c9: stloc.s V_49
IL_02cb: ldstr "Decrease Movement Speed Penalty from Equipment by Value Percent.
"
IL_02d0: ldloc.s V_25
IL_02d2: call System.String System.String::Concat(System.String,System.String)
IL_02d7: ldnull
IL_02d8: ldc.i4.1
IL_02d9: newarr System.Object
IL_02de: dup
IL_02df: ldc.i4.0
IL_02e0: ldloc.s V_33
IL_02e2: stelem.ref
IL_02e3: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_02e8: stloc.s V_50
IL_02ea: ldstr "Increase Wind Speed when Sailing.
"
IL_02ef: ldloc.s V_24
IL_02f1: call System.String System.String::Concat(System.String,System.String)
IL_02f6: ldnull
IL_02f7: ldc.i4.1
IL_02f8: newarr System.Object
IL_02fd: dup
IL_02fe: ldc.i4.0
IL_02ff: ldloc.s V_33
IL_0301: stelem.ref
IL_0302: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0307: stloc.s V_51
IL_0309: ldstr "Decrease Run Stamina Cost by Value Percent.
"
IL_030e: ldloc.s V_25
IL_0310: call System.String System.String::Concat(System.String,System.String)
IL_0315: ldnull
IL_0316: ldc.i4.1
IL_0317: newarr System.Object
IL_031c: dup
IL_031d: ldc.i4.0
IL_031e: ldloc.s V_33
IL_0320: stelem.ref
IL_0321: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0326: stloc.s V_52
IL_0328: ldstr "Decrease Jump Stamina Cost by Value Percent.
"
IL_032d: ldloc.s V_25
IL_032f: call System.String System.String::Concat(System.String,System.String)
IL_0334: ldnull
IL_0335: ldc.i4.1
IL_0336: newarr System.Object
IL_033b: dup
IL_033c: ldc.i4.0
IL_033d: ldloc.s V_33
IL_033f: stelem.ref
IL_0340: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0345: stloc.s V_53
IL_0347: ldstr "Increase Stealth by Value Percent.
"
IL_034c: ldloc.s V_24
IL_034e: call System.String System.String::Concat(System.String,System.String)
IL_0353: ldnull
IL_0354: ldc.i4.1
IL_0355: newarr System.Object
IL_035a: dup
IL_035b: ldc.i4.0
IL_035c: ldloc.s V_33
IL_035e: stelem.ref
IL_035f: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0364: stloc.s V_54
IL_0366: ldstr "Decrease Noise by Value Percent.
"
IL_036b: ldloc.s V_25
IL_036d: call System.String System.String::Concat(System.String,System.String)
IL_0372: ldnull
IL_0373: ldc.i4.1
IL_0374: newarr System.Object
IL_0379: dup
IL_037a: ldc.i4.0
IL_037b: ldloc.s V_33
IL_037d: stelem.ref
IL_037e: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0383: stloc.s V_55
IL_0385: ldstr "Applies Attributes.
"
IL_038a: ldloc.s V_26
IL_038c: ldstr "
"
IL_0391: ldloc.s V_30
IL_0393: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_0398: ldnull
IL_0399: ldc.i4.1
IL_039a: newarr System.Object
IL_039f: dup
IL_03a0: ldc.i4.0
IL_03a1: ldloc.s V_33
IL_03a3: stelem.ref
IL_03a4: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_03a9: stloc.s V_56
IL_03ab: ldstr "Modify Outgoing Damage Types.
"
IL_03b0: ldloc.s V_27
IL_03b2: ldstr "
"
IL_03b7: ldloc.s V_30
IL_03b9: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_03be: ldnull
IL_03bf: ldc.i4.1
IL_03c0: newarr System.Object
IL_03c5: dup
IL_03c6: ldc.i4.0
IL_03c7: ldloc.s V_33
IL_03c9: stelem.ref
IL_03ca: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_03cf: stloc.s V_57
IL_03d1: ldstr "Modify Outgoing Damage Types by Value Percent.
"
IL_03d6: ldloc.s V_24
IL_03d8: ldstr "
"
IL_03dd: ldloc.s V_30
IL_03df: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_03e4: ldnull
IL_03e5: ldc.i4.1
IL_03e6: newarr System.Object
IL_03eb: dup
IL_03ec: ldc.i4.0
IL_03ed: ldloc.s V_33
IL_03ef: stelem.ref
IL_03f0: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_03f5: stloc.s V_58
IL_03f7: ldstr "Decrease Fall Damage by Value Percent.
"
IL_03fc: ldloc.s V_25
IL_03fe: call System.String System.String::Concat(System.String,System.String)
IL_0403: ldnull
IL_0404: ldc.i4.1
IL_0405: newarr System.Object
IL_040a: dup
IL_040b: ldc.i4.0
IL_040c: ldloc.s V_33
IL_040e: stelem.ref
IL_040f: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0414: stloc.s V_59
IL_0416: ldstr "Decrease Heat Damage by Value Percent.
"
IL_041b: ldloc.s V_25
IL_041d: call System.String System.String::Concat(System.String,System.String)
IL_0422: ldnull
IL_0423: ldc.i4.1
IL_0424: newarr System.Object
IL_0429: dup
IL_042a: ldc.i4.0
IL_042b: ldloc.s V_33
IL_042d: stelem.ref
IL_042e: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0433: stloc.s V_60
IL_0435: ldstr "Modify Incoming Damage Types.
"
IL_043a: ldloc.s V_28
IL_043c: ldstr "
"
IL_0441: ldloc.s V_30
IL_0443: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_0448: ldnull
IL_0449: ldc.i4.1
IL_044a: newarr System.Object
IL_044f: dup
IL_0450: ldc.i4.0
IL_0451: ldloc.s V_33
IL_0453: stelem.ref
IL_0454: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0459: stloc.s V_61
IL_045b: ldstr "Modify Incoming Damage Types by Value Percent.
"
IL_0460: ldloc.s V_29
IL_0462: ldstr "
"
IL_0467: ldloc.s V_30
IL_0469: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_046e: ldnull
IL_046f: ldc.i4.1
IL_0470: newarr System.Object
IL_0475: dup
IL_0476: ldc.i4.0
IL_0477: ldloc.s V_33
IL_0479: stelem.ref
IL_047a: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_047f: stloc.s V_62
IL_0481: ldstr "Corpse Run from Tombstones.
"
IL_0486: ldloc.s V_32
IL_0488: call System.String System.String::Concat(System.String,System.String)
IL_048d: ldnull
IL_048e: ldc.i4.1
IL_048f: newarr System.Object
IL_0494: dup
IL_0495: ldc.i4.0
IL_0496: ldloc.s V_33
IL_0498: stelem.ref
IL_0499: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_049e: stloc.s V_63
IL_04a0: ldarg.0
IL_04a1: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_04a6: ldstr "C00 Client"
IL_04ab: ldstr "PowerCycle"
IL_04b0: ldc.i4.s 103
IL_04b2: ldloc.s V_34
IL_04b4: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<UnityEngine.KeyCode>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_04b9: stsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.KeyCode> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Button_PowerCycle
IL_04be: ldarg.0
IL_04bf: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_04c4: ldstr "S00 Server: General"
IL_04c9: ldstr "Preset"
IL_04ce: ldstr "Vanilla+"
IL_04d3: ldloc.s V_35
IL_04d5: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.String>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_04da: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_General_Preset
IL_04df: ldarg.0
IL_04e0: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_04e5: ldstr "S00 Server: General"
IL_04ea: ldstr "PowerActiveDuration"
IL_04ef: ldc.i4.s 60
IL_04f1: ldloc.s V_36
IL_04f3: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Int32>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_04f8: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_General_GuardianPower_ActiveDuration
IL_04fd: ldarg.0
IL_04fe: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0503: ldstr "S00 Server: General"
IL_0508: ldstr "PowerCooldownDuration"
IL_050d: ldc.i4 240
IL_0512: ldloc.s V_37
IL_0514: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Int32>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0519: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_General_GuardianPower_CooldownDuration
IL_051e: ldarg.0
IL_051f: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0524: ldstr "S00 Server: General"
IL_0529: ldstr "Enable Power Cycling"
IL_052e: ldc.i4.1
IL_052f: ldloc.s V_38
IL_0531: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0536: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_PowerCycle_Bool
IL_053b: ldarg.0
IL_053c: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0541: ldstr "SX1 Server: Corpse Run"
IL_0546: ldstr "Enabled"
IL_054b: ldc.i4.1
IL_054c: ldloc.s V_63
IL_054e: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0553: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Config_SE_CorpseRun_Bool
IL_0558: ldsfld System.Collections.Generic.List`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_BossNames
IL_055d: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_0562: stloc.s V_64
IL_0564: br IL_0d7b
IL_0569: ldloca.s V_64
IL_056b: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_0570: stloc.s V_65
IL_0572: ldsfld System.Collections.Generic.List`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_Components
IL_0577: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_057c: stloc.s V_66
IL_057e: br IL_0d5f
IL_0583: ldloca.s V_66
IL_0585: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_058a: stloc.s V_67
IL_058c: ldc.i4.8
IL_058d: newarr System.String
IL_0592: dup
IL_0593: ldc.i4.0
IL_0594: ldstr "S"
IL_0599: stelem.ref
IL_059a: dup
IL_059b: ldc.i4.1
IL_059c: ldsfld System.Collections.Generic.List`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_BossNames
IL_05a1: ldloc.s V_65
IL_05a3: callvirt System.Int32 System.Collections.Generic.List`1<System.String>::IndexOf(!0)
IL_05a8: ldc.i4.1
IL_05a9: add
IL_05aa: stloc.s V_69
IL_05ac: ldloca.s V_69
IL_05ae: call System.String System.Int32::ToString()
IL_05b3: stelem.ref
IL_05b4: dup
IL_05b5: ldc.i4.2
IL_05b6: ldsfld System.Collections.Generic.List`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_Components
IL_05bb: ldloc.s V_67
IL_05bd: callvirt System.Int32 System.Collections.Generic.List`1<System.String>::IndexOf(!0)
IL_05c2: ldc.i4.1
IL_05c3: add
IL_05c4: stloc.s V_69
IL_05c6: ldloca.s V_69
IL_05c8: call System.String System.Int32::ToString()
IL_05cd: stelem.ref
IL_05ce: dup
IL_05cf: ldc.i4.3
IL_05d0: ldstr " Server: "
IL_05d5: stelem.ref
IL_05d6: dup
IL_05d7: ldc.i4.4
IL_05d8: ldloc.s V_65
IL_05da: stelem.ref
IL_05db: dup
IL_05dc: ldc.i4.5
IL_05dd: ldstr " ("
IL_05e2: stelem.ref
IL_05e3: dup
IL_05e4: ldc.i4.6
IL_05e5: ldloc.s V_67
IL_05e7: stelem.ref
IL_05e8: dup
IL_05e9: ldc.i4.7
IL_05ea: ldstr ")"
IL_05ef: stelem.ref
IL_05f0: call System.String System.String::Concat(System.String[])
IL_05f5: stloc.s V_68
IL_05f7: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_05fc: ldc.i4.5
IL_05fd: newarr System.String
IL_0602: dup
IL_0603: ldc.i4.0
IL_0604: ldstr "ConfigEntry_"
IL_0609: stelem.ref
IL_060a: dup
IL_060b: ldc.i4.1
IL_060c: ldloc.s V_65
IL_060e: stelem.ref
IL_060f: dup
IL_0610: ldc.i4.2
IL_0611: ldstr "_"
IL_0616: stelem.ref
IL_0617: dup
IL_0618: ldc.i4.3
IL_0619: ldloc.s V_67
IL_061b: stelem.ref
IL_061c: dup
IL_061d: ldc.i4.4
IL_061e: ldstr "_MaxHealth"
IL_0623: stelem.ref
IL_0624: call System.String System.String::Concat(System.String[])
IL_0629: ldarg.0
IL_062a: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_062f: ldloc.s V_68
IL_0631: ldloc.0
IL_0632: ldc.i4.0
IL_0633: ldloc.s V_39
IL_0635: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Int32>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_063a: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::set_Item(!0,!1)
IL_063f: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0644: ldc.i4.5
IL_0645: newarr System.String
IL_064a: dup
IL_064b: ldc.i4.0
IL_064c: ldstr "ConfigEntry_"
IL_0651: stelem.ref
IL_0652: dup
IL_0653: ldc.i4.1
IL_0654: ldloc.s V_65
IL_0656: stelem.ref
IL_0657: dup
IL_0658: ldc.i4.2
IL_0659: ldstr "_"
IL_065e: stelem.ref
IL_065f: dup
IL_0660: ldc.i4.3
IL_0661: ldloc.s V_67
IL_0663: stelem.ref
IL_0664: dup
IL_0665: ldc.i4.4
IL_0666: ldstr "_MaxHealth"
IL_066b: stelem.ref
IL_066c: call System.String System.String::Concat(System.String[])
IL_0671: ldarg.0
IL_0672: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0677: ldloc.s V_68
IL_0679: ldloc.0
IL_067a: ldc.i4.0
IL_067b: ldloc.s V_39
IL_067d: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Int32>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0682: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::set_Item(!0,!1)
IL_0687: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_068c: ldc.i4.5
IL_068d: newarr System.String
IL_0692: dup
IL_0693: ldc.i4.0
IL_0694: ldstr "ConfigEntry_"
IL_0699: stelem.ref
IL_069a: dup
IL_069b: ldc.i4.1
IL_069c: ldloc.s V_65
IL_069e: stelem.ref
IL_069f: dup
IL_06a0: ldc.i4.2
IL_06a1: ldstr "_"
IL_06a6: stelem.ref
IL_06a7: dup
IL_06a8: ldc.i4.3
IL_06a9: ldloc.s V_67
IL_06ab: stelem.ref
IL_06ac: dup
IL_06ad: ldc.i4.4
IL_06ae: ldstr "_HealthRegen"
IL_06b3: stelem.ref
IL_06b4: call System.String System.String::Concat(System.String[])
IL_06b9: ldarg.0
IL_06ba: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_06bf: ldloc.s V_68
IL_06c1: ldloc.1
IL_06c2: ldc.i4.0
IL_06c3: ldloc.s V_40
IL_06c5: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Int32>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_06ca: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::set_Item(!0,!1)
IL_06cf: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_06d4: ldc.i4.5
IL_06d5: newarr System.String
IL_06da: dup
IL_06db: ldc.i4.0
IL_06dc: ldstr "ConfigEntry_"
IL_06e1: stelem.ref
IL_06e2: dup
IL_06e3: ldc.i4.1
IL_06e4: ldloc.s V_65
IL_06e6: stelem.ref
IL_06e7: dup
IL_06e8: ldc.i4.2
IL_06e9: ldstr "_"
IL_06ee: stelem.ref
IL_06ef: dup
IL_06f0: ldc.i4.3
IL_06f1: ldloc.s V_67
IL_06f3: stelem.ref
IL_06f4: dup
IL_06f5: ldc.i4.4
IL_06f6: ldstr "_HealthRegenModifier"
IL_06fb: stelem.ref
IL_06fc: call System.String System.String::Concat(System.String[])
IL_0701: ldarg.0
IL_0702: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0707: ldloc.s V_68
IL_0709: ldloc.2
IL_070a: ldc.r4 0
IL_070f: ldloc.s V_41
IL_0711: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0716: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::set_Item(!0,!1)
IL_071b: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0720: ldc.i4.5
IL_0721: newarr System.String
IL_0726: dup
IL_0727: ldc.i4.0
IL_0728: ldstr "ConfigEntry_"
IL_072d: stelem.ref
IL_072e: dup
IL_072f: ldc.i4.1
IL_0730: ldloc.s V_65
IL_0732: stelem.ref
IL_0733: dup
IL_0734: ldc.i4.2
IL_0735: ldstr "_"
IL_073a: stelem.ref
IL_073b: dup
IL_073c: ldc.i4.3
IL_073d: ldloc.s V_67
IL_073f: stelem.ref
IL_0740: dup
IL_0741: ldc.i4.4
IL_0742: ldstr "_MaxStamina"
IL_0747: stelem.ref
IL_0748: call System.String System.String::Concat(System.String[])
IL_074d: ldarg.0
IL_074e: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0753: ldloc.s V_68
IL_0755: ldloc.3
IL_0756: ldc.i4.0
IL_0757: ldloc.s V_42
IL_0759: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Int32>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_075e: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::set_Item(!0,!1)
IL_0763: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0768: ldc.i4.5
IL_0769: newarr System.String
IL_076e: dup
IL_076f: ldc.i4.0
IL_0770: ldstr "ConfigEntry_"
IL_0775: stelem.ref
IL_0776: dup
IL_0777: ldc.i4.1
IL_0778: ldloc.s V_65
IL_077a: stelem.ref
IL_077b: dup
IL_077c: ldc.i4.2
IL_077d: ldstr "_"
IL_0782: stelem.ref
IL_0783: dup
IL_0784: ldc.i4.3
IL_0785: ldloc.s V_67
IL_0787: stelem.ref
IL_0788: dup
IL_0789: ldc.i4.4
IL_078a: ldstr "_StaminaRegenModifier"
IL_078f: stelem.ref
IL_0790: call System.String System.String::Concat(System.String[])
IL_0795: ldarg.0
IL_0796: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_079b: ldloc.s V_68
IL_079d: ldloc.s V_4
IL_079f: ldc.r4 0
IL_07a4: ldloc.s V_43
IL_07a6: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_07ab: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::set_Item(!0,!1)
IL_07b0: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_07b5: ldc.i4.5
IL_07b6: newarr System.String
IL_07bb: dup
IL_07bc: ldc.i4.0
IL_07bd: ldstr "ConfigEntry_"
IL_07c2: stelem.ref
IL_07c3: dup
IL_07c4: ldc.i4.1
IL_07c5: ldloc.s V_65
IL_07c7: stelem.ref
IL_07c8: dup
IL_07c9: ldc.i4.2
IL_07ca: ldstr "_"
IL_07cf: stelem.ref
IL_07d0: dup
IL_07d1: ldc.i4.3
IL_07d2: ldloc.s V_67
IL_07d4: stelem.ref
IL_07d5: dup
IL_07d6: ldc.i4.4
IL_07d7: ldstr "_MaxEitr"
IL_07dc: stelem.ref
IL_07dd: call System.String System.String::Concat(System.String[])
IL_07e2: ldarg.0
IL_07e3: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_07e8: ldloc.s V_68
IL_07ea: ldloc.s V_5
IL_07ec: ldc.i4.0
IL_07ed: ldloc.s V_44
IL_07ef: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Int32>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_07f4: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::set_Item(!0,!1)
IL_07f9: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_07fe: ldc.i4.5
IL_07ff: newarr System.String
IL_0804: dup
IL_0805: ldc.i4.0
IL_0806: ldstr "ConfigEntry_"
IL_080b: stelem.ref
IL_080c: dup
IL_080d: ldc.i4.1
IL_080e: ldloc.s V_65
IL_0810: stelem.ref
IL_0811: dup
IL_0812: ldc.i4.2
IL_0813: ldstr "_"
IL_0818: stelem.ref
IL_0819: dup
IL_081a: ldc.i4.3
IL_081b: ldloc.s V_67
IL_081d: stelem.ref
IL_081e: dup
IL_081f: ldc.i4.4
IL_0820: ldstr "_EitrRegenModifier"
IL_0825: stelem.ref
IL_0826: call System.String System.String::Concat(System.String[])
IL_082b: ldarg.0
IL_082c: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0831: ldloc.s V_68
IL_0833: ldloc.s V_6
IL_0835: ldc.r4 0
IL_083a: ldloc.s V_45
IL_083c: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0841: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::set_Item(!0,!1)
IL_0846: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_084b: ldc.i4.5
IL_084c: newarr System.String
IL_0851: dup
IL_0852: ldc.i4.0
IL_0853: ldstr "ConfigEntry_"
IL_0858: stelem.ref
IL_0859: dup
IL_085a: ldc.i4.1
IL_085b: ldloc.s V_65
IL_085d: stelem.ref
IL_085e: dup
IL_085f: ldc.i4.2
IL_0860: ldstr "_"
IL_0865: stelem.ref
IL_0866: dup
IL_0867: ldc.i4.3
IL_0868: ldloc.s V_67
IL_086a: stelem.ref
IL_086b: dup
IL_086c: ldc.i4.4
IL_086d: ldstr "_MaxWeight"
IL_0872: stelem.ref
IL_0873: call System.String System.String::Concat(System.String[])
IL_0878: ldarg.0
IL_0879: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_087e: ldloc.s V_68
IL_0880: ldloc.s V_7
IL_0882: ldc.i4.0
IL_0883: ldloc.s V_46
IL_0885: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Int32>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_088a: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::set_Item(!0,!1)
IL_088f: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0894: ldc.i4.5
IL_0895: newarr System.String
IL_089a: dup
IL_089b: ldc.i4.0
IL_089c: ldstr "ConfigEntry_"
IL_08a1: stelem.ref
IL_08a2: dup
IL_08a3: ldc.i4.1
IL_08a4: ldloc.s V_65
IL_08a6: stelem.ref
IL_08a7: dup
IL_08a8: ldc.i4.2
IL_08a9: ldstr "_"
IL_08ae: stelem.ref
IL_08af: dup
IL_08b0: ldc.i4.3
IL_08b1: ldloc.s V_67
IL_08b3: stelem.ref
IL_08b4: dup
IL_08b5: ldc.i4.4
IL_08b6: ldstr "_MoveSpeedModifier"
IL_08bb: stelem.ref
IL_08bc: call System.String System.String::Concat(System.String[])
IL_08c1: ldarg.0
IL_08c2: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_08c7: ldloc.s V_68
IL_08c9: ldloc.s V_8
IL_08cb: ldc.r4 0
IL_08d0: ldloc.s V_47
IL_08d2: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_08d7: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::set_Item(!0,!1)
IL_08dc: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_08e1: ldc.i4.5
IL_08e2: newarr System.String
IL_08e7: dup
IL_08e8: ldc.i4.0
IL_08e9: ldstr "ConfigEntry_"
IL_08ee: stelem.ref
IL_08ef: dup
IL_08f0: ldc.i4.1
IL_08f1: ldloc.s V_65
IL_08f3: stelem.ref
IL_08f4: dup
IL_08f5: ldc.i4.2
IL_08f6: ldstr "_"
IL_08fb: stelem.ref
IL_08fc: dup
IL_08fd: ldc.i4.3
IL_08fe: ldloc.s V_67
IL_0900: stelem.ref
IL_0901: dup
IL_0902: ldc.i4.4
IL_0903: ldstr "_JumpForceModifier"
IL_0908: stelem.ref
IL_0909: call System.String System.String::Concat(System.String[])
IL_090e: ldarg.0
IL_090f: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0914: ldloc.s V_68
IL_0916: ldloc.s V_9
IL_0918: ldc.r4 0
IL_091d: ldloc.s V_48
IL_091f: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0924: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::set_Item(!0,!1)
IL_0929: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_092e: ldc.i4.5
IL_092f: newarr System.String
IL_0934: dup
IL_0935: ldc.i4.0
IL_0936: ldstr "ConfigEntry_"
IL_093b: stelem.ref
IL_093c: dup
IL_093d: ldc.i4.1
IL_093e: ldloc.s V_65
IL_0940: stelem.ref
IL_0941: dup
IL_0942: ldc.i4.2
IL_0943: ldstr "_"
IL_0948: stelem.ref
IL_0949: dup
IL_094a: ldc.i4.3
IL_094b: ldloc.s V_67
IL_094d: stelem.ref
IL_094e: dup
IL_094f: ldc.i4.4
IL_0950: ldstr "_MaxFallSpeed"
IL_0955: stelem.ref
IL_0956: call System.String System.String::Concat(System.String[])
IL_095b: ldarg.0
IL_095c: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0961: ldloc.s V_68
IL_0963: ldloc.s V_10
IL_0965: ldc.r4 0
IL_096a: ldloc.s V_49
IL_096c: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0971: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::set_Item(!0,!1)
IL_0976: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_097b: ldc.i4.5
IL_097c: newarr System.String
IL_0981: dup
IL_0982: ldc.i4.0
IL_0983: ldstr "ConfigEntry_"
IL_0988: stelem.ref
IL_0989: dup
IL_098a: ldc.i4.1
IL_098b: ldloc.s V_65
IL_098d: stelem.ref
IL_098e: dup
IL_098f: ldc.i4.2
IL_0990: ldstr "_"
IL_0995: stelem.ref
IL_0996: dup
IL_0997: ldc.i4.3
IL_0998: ldloc.s V_67
IL_099a: stelem.ref
IL_099b: dup
IL_099c: ldc.i4.4
IL_099d: ldstr "_EquipmentSpeedModifier"
IL_09a2: stelem.ref
IL_09a3: call System.String System.String::Concat(System.String[])
IL_09a8: ldarg.0
IL_09a9: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_09ae: ldloc.s V_68
IL_09b0: ldloc.s V_11
IL_09b2: ldc.r4 0
IL_09b7: ldloc.s V_50
IL_09b9: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_09be: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::set_Item(!0,!1)
IL_09c3: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_09c8: ldc.i4.5
IL_09c9: newarr System.String
IL_09ce: dup
IL_09cf: ldc.i4.0
IL_09d0: ldstr "ConfigEntry_"
IL_09d5: stelem.ref
IL_09d6: dup
IL_09d7: ldc.i4.1
IL_09d8: ldloc.s V_65
IL_09da: stelem.ref
IL_09db: dup
IL_09dc: ldc.i4.2
IL_09dd: ldstr "_"
IL_09e2: stelem.ref
IL_09e3: dup
IL_09e4: ldc.i4.3
IL_09e5: ldloc.s V_67
IL_09e7: stelem.ref
IL_09e8: dup
IL_09e9: ldc.i4.4
IL_09ea: ldstr "_WindSpeedModifier"
IL_09ef: stelem.ref
IL_09f0: call System.String System.String::Concat(System.String[])
IL_09f5: ldarg.0
IL_09f6: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_09fb: ldloc.s V_68
IL_09fd: ldloc.s V_12
IL_09ff: ldc.r4 0
IL_0a04: ldloc.s V_51
IL_0a06: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0a0b: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::set_Item(!0,!1)
IL_0a10: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0a15: ldc.i4.5
IL_0a16: newarr System.String
IL_0a1b: dup
IL_0a1c: ldc.i4.0
IL_0a1d: ldstr "ConfigEntry_"
IL_0a22: stelem.ref
IL_0a23: dup
IL_0a24: ldc.i4.1
IL_0a25: ldloc.s V_65
IL_0a27: stelem.ref
IL_0a28: dup
IL_0a29: ldc.i4.2
IL_0a2a: ldstr "_"
IL_0a2f: stelem.ref
IL_0a30: dup
IL_0a31: ldc.i4.3
IL_0a32: ldloc.s V_67
IL_0a34: stelem.ref
IL_0a35: dup
IL_0a36: ldc.i4.4
IL_0a37: ldstr "_RunStaminaCostModifier"
IL_0a3c: stelem.ref
IL_0a3d: call System.String System.String::Concat(System.String[])
IL_0a42: ldarg.0
IL_0a43: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0a48: ldloc.s V_68
IL_0a4a: ldloc.s V_13
IL_0a4c: ldc.r4 0
IL_0a51: ldloc.s V_52
IL_0a53: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0a58: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::set_Item(!0,!1)
IL_0a5d: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0a62: ldc.i4.5
IL_0a63: newarr System.String
IL_0a68: dup
IL_0a69: ldc.i4.0
IL_0a6a: ldstr "ConfigEntry_"
IL_0a6f: stelem.ref
IL_0a70: dup
IL_0a71: ldc.i4.1
IL_0a72: ldloc.s V_65
IL_0a74: stelem.ref
IL_0a75: dup
IL_0a76: ldc.i4.2
IL_0a77: ldstr "_"
IL_0a7c: stelem.ref
IL_0a7d: dup
IL_0a7e: ldc.i4.3
IL_0a7f: ldloc.s V_67
IL_0a81: stelem.ref
IL_0a82: dup
IL_0a83: ldc.i4.4
IL_0a84: ldstr "_JumpStaminaCostModifier"
IL_0a89: stelem.ref
IL_0a8a: call System.String System.String::Concat(System.String[])
IL_0a8f: ldarg.0
IL_0a90: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0a95: ldloc.s V_68
IL_0a97: ldloc.s V_14
IL_0a99: ldc.r4 0
IL_0a9e: ldloc.s V_53
IL_0aa0: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0aa5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::set_Item(!0,!1)
IL_0aaa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0aaf: ldc.i4.5
IL_0ab0: newarr System.String
IL_0ab5: dup
IL_0ab6: ldc.i4.0
IL_0ab7: ldstr "ConfigEntry_"
IL_0abc: stelem.ref
IL_0abd: dup
IL_0abe: ldc.i4.1
IL_0abf: ldloc.s V_65
IL_0ac1: stelem.ref
IL_0ac2: dup
IL_0ac3: ldc.i4.2
IL_0ac4: ldstr "_"
IL_0ac9: stelem.ref
IL_0aca: dup
IL_0acb: ldc.i4.3
IL_0acc: ldloc.s V_67
IL_0ace: stelem.ref
IL_0acf: dup
IL_0ad0: ldc.i4.4
IL_0ad1: ldstr "_StealthModifier"
IL_0ad6: stelem.ref
IL_0ad7: call System.String System.String::Concat(System.String[])
IL_0adc: ldarg.0
IL_0add: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0ae2: ldloc.s V_68
IL_0ae4: ldloc.s V_15
IL_0ae6: ldc.r4 0
IL_0aeb: ldloc.s V_54
IL_0aed: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0af2: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::set_Item(!0,!1)
IL_0af7: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0afc: ldc.i4.5
IL_0afd: newarr System.String
IL_0b02: dup
IL_0b03: ldc.i4.0
IL_0b04: ldstr "ConfigEntry_"
IL_0b09: stelem.ref
IL_0b0a: dup
IL_0b0b: ldc.i4.1
IL_0b0c: ldloc.s V_65
IL_0b0e: stelem.ref
IL_0b0f: dup
IL_0b10: ldc.i4.2
IL_0b11: ldstr "_"
IL_0b16: stelem.ref
IL_0b17: dup
IL_0b18: ldc.i4.3
IL_0b19: ldloc.s V_67
IL_0b1b: stelem.ref
IL_0b1c: dup
IL_0b1d: ldc.i4.4
IL_0b1e: ldstr "_NoiseModifier"
IL_0b23: stelem.ref
IL_0b24: call System.String System.String::Concat(System.String[])
IL_0b29: ldarg.0
IL_0b2a: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0b2f: ldloc.s V_68
IL_0b31: ldloc.s V_16
IL_0b33: ldc.r4 0
IL_0b38: ldloc.s V_55
IL_0b3a: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0b3f: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::set_Item(!0,!1)
IL_0b44: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0b49: ldc.i4.5
IL_0b4a: newarr System.String
IL_0b4f: dup
IL_0b50: ldc.i4.0
IL_0b51: ldstr "ConfigEntry_"
IL_0b56: stelem.ref
IL_0b57: dup
IL_0b58: ldc.i4.1
IL_0b59: ldloc.s V_65
IL_0b5b: stelem.ref
IL_0b5c: dup
IL_0b5d: ldc.i4.2
IL_0b5e: ldstr "_"
IL_0b63: stelem.ref
IL_0b64: dup
IL_0b65: ldc.i4.3
IL_0b66: ldloc.s V_67
IL_0b68: stelem.ref
IL_0b69: dup
IL_0b6a: ldc.i4.4
IL_0b6b: ldstr "_StatusAttributes"
IL_0b70: stelem.ref
IL_0b71: call System.String System.String::Concat(System.String[])
IL_0b76: ldarg.0
IL_0b77: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0b7c: ldloc.s V_68
IL_0b7e: ldloc.s V_17
IL_0b80: ldstr ""
IL_0b85: ldloc.s V_56
IL_0b87: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.String>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0b8c: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::set_Item(!0,!1)
IL_0b91: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0b96: ldc.i4.5
IL_0b97: newarr System.String
IL_0b9c: dup
IL_0b9d: ldc.i4.0
IL_0b9e: ldstr "ConfigEntry_"
IL_0ba3: stelem.ref
IL_0ba4: dup
IL_0ba5: ldc.i4.1
IL_0ba6: ldloc.s V_65
IL_0ba8: stelem.ref
IL_0ba9: dup
IL_0baa: ldc.i4.2
IL_0bab: ldstr "_"
IL_0bb0: stelem.ref
IL_0bb1: dup
IL_0bb2: ldc.i4.3
IL_0bb3: ldloc.s V_67
IL_0bb5: stelem.ref
IL_0bb6: dup
IL_0bb7: ldc.i4.4
IL_0bb8: ldstr "_OutgoingDamageTypes"
IL_0bbd: stelem.ref
IL_0bbe: call System.String System.String::Concat(System.String[])
IL_0bc3: ldarg.0
IL_0bc4: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0bc9: ldloc.s V_68
IL_0bcb: ldloc.s V_18
IL_0bcd: ldstr ""
IL_0bd2: ldloc.s V_57
IL_0bd4: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.String>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0bd9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::set_Item(!0,!1)
IL_0bde: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0be3: ldc.i4.5
IL_0be4: newarr System.String
IL_0be9: dup
IL_0bea: ldc.i4.0
IL_0beb: ldstr "ConfigEntry_"
IL_0bf0: stelem.ref
IL_0bf1: dup
IL_0bf2: ldc.i4.1
IL_0bf3: ldloc.s V_65
IL_0bf5: stelem.ref
IL_0bf6: dup
IL_0bf7: ldc.i4.2
IL_0bf8: ldstr "_"
IL_0bfd: stelem.ref
IL_0bfe: dup
IL_0bff: ldc.i4.3
IL_0c00: ldloc.s V_67
IL_0c02: stelem.ref
IL_0c03: dup
IL_0c04: ldc.i4.4
IL_0c05: ldstr "_OutgoingDamageModifiers"
IL_0c0a: stelem.ref
IL_0c0b: call System.String System.String::Concat(System.String[])
IL_0c10: ldarg.0
IL_0c11: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0c16: ldloc.s V_68
IL_0c18: ldloc.s V_19
IL_0c1a: ldstr ""
IL_0c1f: ldloc.s V_58
IL_0c21: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.String>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0c26: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::set_Item(!0,!1)
IL_0c2b: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0c30: ldc.i4.5
IL_0c31: newarr System.String
IL_0c36: dup
IL_0c37: ldc.i4.0
IL_0c38: ldstr "ConfigEntry_"
IL_0c3d: stelem.ref
IL_0c3e: dup
IL_0c3f: ldc.i4.1
IL_0c40: ldloc.s V_65
IL_0c42: stelem.ref
IL_0c43: dup
IL_0c44: ldc.i4.2
IL_0c45: ldstr "_"
IL_0c4a: stelem.ref
IL_0c4b: dup
IL_0c4c: ldc.i4.3
IL_0c4d: ldloc.s V_67
IL_0c4f: stelem.ref
IL_0c50: dup
IL_0c51: ldc.i4.4
IL_0c52: ldstr "_FallDamageModifier"
IL_0c57: stelem.ref
IL_0c58: call System.String System.String::Concat(System.String[])
IL_0c5d: ldarg.0
IL_0c5e: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0c63: ldloc.s V_68
IL_0c65: ldloc.s V_20
IL_0c67: ldc.r4 0
IL_0c6c: ldloc.s V_59
IL_0c6e: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0c73: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::set_Item(!0,!1)
IL_0c78: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0c7d: ldc.i4.5
IL_0c7e: newarr System.String
IL_0c83: dup
IL_0c84: ldc.i4.0
IL_0c85: ldstr "ConfigEntry_"
IL_0c8a: stelem.ref
IL_0c8b: dup
IL_0c8c: ldc.i4.1
IL_0c8d: ldloc.s V_65
IL_0c8f: stelem.ref
IL_0c90: dup
IL_0c91: ldc.i4.2
IL_0c92: ldstr "_"
IL_0c97: stelem.ref
IL_0c98: dup
IL_0c99: ldc.i4.3
IL_0c9a: ldloc.s V_67
IL_0c9c: stelem.ref
IL_0c9d: dup
IL_0c9e: ldc.i4.4
IL_0c9f: ldstr "_HeatDamageModifier"
IL_0ca4: stelem.ref
IL_0ca5: call System.String System.String::Concat(System.String[])
IL_0caa: ldarg.0
IL_0cab: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0cb0: ldloc.s V_68
IL_0cb2: ldloc.s V_21
IL_0cb4: ldc.r4 0
IL_0cb9: ldloc.s V_60
IL_0cbb: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0cc0: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::set_Item(!0,!1)
IL_0cc5: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0cca: ldc.i4.5
IL_0ccb: newarr System.String
IL_0cd0: dup
IL_0cd1: ldc.i4.0
IL_0cd2: ldstr "ConfigEntry_"
IL_0cd7: stelem.ref
IL_0cd8: dup
IL_0cd9: ldc.i4.1
IL_0cda: ldloc.s V_65
IL_0cdc: stelem.ref
IL_0cdd: dup
IL_0cde: ldc.i4.2
IL_0cdf: ldstr "_"
IL_0ce4: stelem.ref
IL_0ce5: dup
IL_0ce6: ldc.i4.3
IL_0ce7: ldloc.s V_67
IL_0ce9: stelem.ref
IL_0cea: dup
IL_0ceb: ldc.i4.4
IL_0cec: ldstr "_IncomingDamageTypes"
IL_0cf1: stelem.ref
IL_0cf2: call System.String System.String::Concat(System.String[])
IL_0cf7: ldarg.0
IL_0cf8: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0cfd: ldloc.s V_68
IL_0cff: ldloc.s V_22
IL_0d01: ldstr ""
IL_0d06: ldloc.s V_61
IL_0d08: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.String>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0d0d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::set_Item(!0,!1)
IL_0d12: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0d17: ldc.i4.5
IL_0d18: newarr System.String
IL_0d1d: dup
IL_0d1e: ldc.i4.0
IL_0d1f: ldstr "ConfigEntry_"
IL_0d24: stelem.ref
IL_0d25: dup
IL_0d26: ldc.i4.1
IL_0d27: ldloc.s V_65
IL_0d29: stelem.ref
IL_0d2a: dup
IL_0d2b: ldc.i4.2
IL_0d2c: ldstr "_"
IL_0d31: stelem.ref
IL_0d32: dup
IL_0d33: ldc.i4.3
IL_0d34: ldloc.s V_67
IL_0d36: stelem.ref
IL_0d37: dup
IL_0d38: ldc.i4.4
IL_0d39: ldstr "_IncomingDamageModifiers"
IL_0d3e: stelem.ref
IL_0d3f: call System.String System.String::Concat(System.String[])
IL_0d44: ldarg.0
IL_0d45: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0d4a: ldloc.s V_68
IL_0d4c: ldloc.s V_23
IL_0d4e: ldstr ""
IL_0d53: ldloc.s V_62
IL_0d55: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.String>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0d5a: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::set_Item(!0,!1)
IL_0d5f: ldloca.s V_66
IL_0d61: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_0d66: brtrue IL_0583
IL_0d6b: leave.s IL_0d7b
IL_0d6d: ldloca.s V_66
IL_0d6f: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_0d75: callvirt System.Void System.IDisposable::Dispose()
IL_0d7a: endfinally
IL_0d7b: ldloca.s V_64
IL_0d7d: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_0d82: brtrue IL_0569
IL_0d87: leave.s IL_0d97
IL_0d89: ldloca.s V_64
IL_0d8b: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_0d91: callvirt System.Void System.IDisposable::Dispose()
IL_0d96: endfinally
IL_0d97: ldarg.0
IL_0d98: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0d9d: ldsfld System.EventHandler`1<BepInEx.Configuration.SettingChangedEventArgs> ForsakenPowerOverhaul.ForsakenPowerOverhaul/<>O::<0>__Config_SettingChanged
IL_0da2: dup
IL_0da3: brtrue.s IL_0db8
IL_0da5: pop
IL_0da6: ldnull
IL_0da7: ldftn System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Config_SettingChanged(System.Object,System.EventArgs)
IL_0dad: newobj System.Void System.EventHandler`1<BepInEx.Configuration.SettingChangedEventArgs>::.ctor(System.Object,System.IntPtr)
IL_0db2: dup
IL_0db3: stsfld System.EventHandler`1<BepInEx.Configuration.SettingChangedEventArgs> ForsakenPowerOverhaul.ForsakenPowerOverhaul/<>O::<0>__Config_SettingChanged
IL_0db8: callvirt System.Void BepInEx.Configuration.ConfigFile::add_SettingChanged(System.EventHandler`1<BepInEx.Configuration.SettingChangedEventArgs>)
IL_0dbd: ldarg.0
IL_0dbe: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0dc3: ldc.i4.1
IL_0dc4: callvirt System.Void BepInEx.Configuration.ConfigFile::set_SaveOnConfigSet(System.Boolean)
IL_0dc9: ldarg.0
IL_0dca: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0dcf: callvirt System.Void BepInEx.Configuration.ConfigFile::Save()
IL_0dd4: ret
// EH Finally: 1406 - 3437 => 3437 - 3451
// EH Finally: 1380 - 3465 => 3465 - 3479

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Config_SettingChanged(System.Object,System.EventArgs)
.locals 
IL_0000: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Config_SettingRead()
IL_0005: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Config_SettingRead()
.locals System.Collections.Generic.List`1/Enumerator<System.String>, System.String, System.Int32, System.Int32, System.Int32, System.Char, System.Collections.Generic.List`1/Enumerator<System.String>, System.String, ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO, ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO, System.Collections.Generic.List`1<System.Single>, HitData/DamageModPair
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_General_Preset
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_000a: ldstr "Custom"
IL_000f: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0014: brfalse IL_0946
IL_0019: ldsfld System.Collections.Generic.List`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_BossNames
IL_001e: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_0023: stloc.0
IL_0024: br IL_092a
IL_0029: ldloca.s V_0
IL_002b: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_0030: stloc.1
IL_0031: ldloc.1
IL_0032: brfalse IL_0136
IL_0037: ldloc.1
IL_0038: call System.Int32 System.String::get_Length()
IL_003d: stloc.s V_4
IL_003f: ldloc.s V_4
IL_0041: ldc.i4.5
IL_0042: sub
IL_0043: switch IL_0091,IL_0136,IL_005d,IL_0077
IL_0058: br IL_0136
IL_005d: ldloc.1
IL_005e: ldc.i4.0
IL_005f: call System.Char System.String::get_Chars(System.Int32)
IL_0064: stloc.s V_5
IL_0066: ldloc.s V_5
IL_0068: ldc.i4.s 69
IL_006a: beq.s IL_00b1
IL_006c: ldloc.s V_5
IL_006e: ldc.i4.s 89
IL_0070: beq.s IL_00c0
IL_0072: br IL_0136
IL_0077: ldloc.1
IL_0078: ldc.i4.0
IL_0079: call System.Char System.String::get_Chars(System.Int32)
IL_007e: stloc.s V_5
IL_0080: ldloc.s V_5
IL_0082: ldc.i4.s 66
IL_0084: beq.s IL_00de
IL_0086: ldloc.s V_5
IL_0088: ldc.i4.s 84
IL_008a: beq.s IL_00cf
IL_008c: br IL_0136
IL_0091: ldloc.1
IL_0092: ldc.i4.0
IL_0093: call System.Char System.String::get_Chars(System.Int32)
IL_0098: stloc.s V_5
IL_009a: ldloc.s V_5
IL_009c: ldc.i4.s 70
IL_009e: beq.s IL_010b
IL_00a0: ldloc.s V_5
IL_00a2: ldc.i4.s 77
IL_00a4: beq.s IL_00ed
IL_00a6: ldloc.s V_5
IL_00a8: ldc.i4.s 81
IL_00aa: beq.s IL_00fc
IL_00ac: br IL_0136
IL_00b1: ldloc.1
IL_00b2: ldstr "Eikthyr"
IL_00b7: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00bc: brtrue.s IL_011a
IL_00be: br.s IL_0136
IL_00c0: ldloc.1
IL_00c1: ldstr "Yagluth"
IL_00c6: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00cb: brtrue.s IL_012a
IL_00cd: br.s IL_0136
IL_00cf: ldloc.1
IL_00d0: ldstr "TheElder"
IL_00d5: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00da: brtrue.s IL_011e
IL_00dc: br.s IL_0136
IL_00de: ldloc.1
IL_00df: ldstr "Bonemass"
IL_00e4: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00e9: brtrue.s IL_0122
IL_00eb: br.s IL_0136
IL_00ed: ldloc.1
IL_00ee: ldstr "Moder"
IL_00f3: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00f8: brtrue.s IL_0126
IL_00fa: br.s IL_0136
IL_00fc: ldloc.1
IL_00fd: ldstr "Queen"
IL_0102: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0107: brtrue.s IL_012e
IL_0109: br.s IL_0136
IL_010b: ldloc.1
IL_010c: ldstr "Fader"
IL_0111: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0116: brtrue.s IL_0132
IL_0118: br.s IL_0136
IL_011a: ldc.i4.0
IL_011b: stloc.3
IL_011c: br.s IL_0138
IL_011e: ldc.i4.1
IL_011f: stloc.3
IL_0120: br.s IL_0138
IL_0122: ldc.i4.2
IL_0123: stloc.3
IL_0124: br.s IL_0138
IL_0126: ldc.i4.3
IL_0127: stloc.3
IL_0128: br.s IL_0138
IL_012a: ldc.i4.4
IL_012b: stloc.3
IL_012c: br.s IL_0138
IL_012e: ldc.i4.5
IL_012f: stloc.3
IL_0130: br.s IL_0138
IL_0132: ldc.i4.6
IL_0133: stloc.3
IL_0134: br.s IL_0138
IL_0136: ldc.i4.0
IL_0137: stloc.3
IL_0138: ldloc.3
IL_0139: stloc.2
IL_013a: ldsfld System.Collections.Generic.List`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_Components
IL_013f: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_0144: stloc.s V_6
IL_0146: br IL_090e
IL_014b: ldloca.s V_6
IL_014d: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_0152: stloc.s V_7
IL_0154: ldloc.s V_7
IL_0156: ldstr "Passive"
IL_015b: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0160: brtrue.s IL_018e
IL_0162: ldloc.s V_7
IL_0164: ldstr "Equipped"
IL_0169: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_016e: brtrue.s IL_019d
IL_0170: ldloc.s V_7
IL_0172: ldstr "Active"
IL_0177: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_017c: brtrue.s IL_01ac
IL_017e: ldloc.s V_7
IL_0180: ldstr "Shared"
IL_0185: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_018a: brtrue.s IL_01bb
IL_018c: br.s IL_01ca
IL_018e: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Passive
IL_0193: ldloc.2
IL_0194: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0199: stloc.s V_9
IL_019b: br.s IL_01cd
IL_019d: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Equipped
IL_01a2: ldloc.2
IL_01a3: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_01a8: stloc.s V_9
IL_01aa: br.s IL_01cd
IL_01ac: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_01b1: ldloc.2
IL_01b2: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_01b7: stloc.s V_9
IL_01b9: br.s IL_01cd
IL_01bb: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Shared
IL_01c0: ldloc.2
IL_01c1: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_01c6: stloc.s V_9
IL_01c8: br.s IL_01cd
IL_01ca: ldnull
IL_01cb: stloc.s V_9
IL_01cd: ldloc.s V_9
IL_01cf: stloc.s V_8
IL_01d1: ldloc.s V_8
IL_01d3: ldnull
IL_01d4: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_01d9: brfalse IL_090e
IL_01de: ldloc.s V_8
IL_01e0: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_01e5: ldc.i4.5
IL_01e6: newarr System.String
IL_01eb: dup
IL_01ec: ldc.i4.0
IL_01ed: ldstr "ConfigEntry_"
IL_01f2: stelem.ref
IL_01f3: dup
IL_01f4: ldc.i4.1
IL_01f5: ldloc.1
IL_01f6: stelem.ref
IL_01f7: dup
IL_01f8: ldc.i4.2
IL_01f9: ldstr "_"
IL_01fe: stelem.ref
IL_01ff: dup
IL_0200: ldc.i4.3
IL_0201: ldloc.s V_7
IL_0203: stelem.ref
IL_0204: dup
IL_0205: ldc.i4.4
IL_0206: ldstr "_MaxHealth"
IL_020b: stelem.ref
IL_020c: call System.String System.String::Concat(System.String[])
IL_0211: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::get_Item(!0)
IL_0216: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_021b: conv.r4
IL_021c: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxHealth
IL_0221: ldloc.s V_8
IL_0223: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0228: ldc.i4.5
IL_0229: newarr System.String
IL_022e: dup
IL_022f: ldc.i4.0
IL_0230: ldstr "ConfigEntry_"
IL_0235: stelem.ref
IL_0236: dup
IL_0237: ldc.i4.1
IL_0238: ldloc.1
IL_0239: stelem.ref
IL_023a: dup
IL_023b: ldc.i4.2
IL_023c: ldstr "_"
IL_0241: stelem.ref
IL_0242: dup
IL_0243: ldc.i4.3
IL_0244: ldloc.s V_7
IL_0246: stelem.ref
IL_0247: dup
IL_0248: ldc.i4.4
IL_0249: ldstr "_HealthRegen"
IL_024e: stelem.ref
IL_024f: call System.String System.String::Concat(System.String[])
IL_0254: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::get_Item(!0)
IL_0259: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_025e: conv.r4
IL_025f: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HealthRegen
IL_0264: ldloc.s V_8
IL_0266: ldc.r4 1
IL_026b: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0270: ldc.i4.5
IL_0271: newarr System.String
IL_0276: dup
IL_0277: ldc.i4.0
IL_0278: ldstr "ConfigEntry_"
IL_027d: stelem.ref
IL_027e: dup
IL_027f: ldc.i4.1
IL_0280: ldloc.1
IL_0281: stelem.ref
IL_0282: dup
IL_0283: ldc.i4.2
IL_0284: ldstr "_"
IL_0289: stelem.ref
IL_028a: dup
IL_028b: ldc.i4.3
IL_028c: ldloc.s V_7
IL_028e: stelem.ref
IL_028f: dup
IL_0290: ldc.i4.4
IL_0291: ldstr "_HealthRegenModifier"
IL_0296: stelem.ref
IL_0297: call System.String System.String::Concat(System.String[])
IL_029c: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_02a1: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_02a6: ldc.r4 100
IL_02ab: div
IL_02ac: add
IL_02ad: stfld System.Single SE_Stats::m_healthRegenMultiplier
IL_02b2: ldloc.s V_8
IL_02b4: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_02b9: ldc.i4.5
IL_02ba: newarr System.String
IL_02bf: dup
IL_02c0: ldc.i4.0
IL_02c1: ldstr "ConfigEntry_"
IL_02c6: stelem.ref
IL_02c7: dup
IL_02c8: ldc.i4.1
IL_02c9: ldloc.1
IL_02ca: stelem.ref
IL_02cb: dup
IL_02cc: ldc.i4.2
IL_02cd: ldstr "_"
IL_02d2: stelem.ref
IL_02d3: dup
IL_02d4: ldc.i4.3
IL_02d5: ldloc.s V_7
IL_02d7: stelem.ref
IL_02d8: dup
IL_02d9: ldc.i4.4
IL_02da: ldstr "_MaxStamina"
IL_02df: stelem.ref
IL_02e0: call System.String System.String::Concat(System.String[])
IL_02e5: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::get_Item(!0)
IL_02ea: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_02ef: conv.r4
IL_02f0: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxStamina
IL_02f5: ldloc.s V_8
IL_02f7: ldc.r4 1
IL_02fc: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0301: ldc.i4.5
IL_0302: newarr System.String
IL_0307: dup
IL_0308: ldc.i4.0
IL_0309: ldstr "ConfigEntry_"
IL_030e: stelem.ref
IL_030f: dup
IL_0310: ldc.i4.1
IL_0311: ldloc.1
IL_0312: stelem.ref
IL_0313: dup
IL_0314: ldc.i4.2
IL_0315: ldstr "_"
IL_031a: stelem.ref
IL_031b: dup
IL_031c: ldc.i4.3
IL_031d: ldloc.s V_7
IL_031f: stelem.ref
IL_0320: dup
IL_0321: ldc.i4.4
IL_0322: ldstr "_StaminaRegenModifier"
IL_0327: stelem.ref
IL_0328: call System.String System.String::Concat(System.String[])
IL_032d: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_0332: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0337: ldc.r4 100
IL_033c: div
IL_033d: add
IL_033e: stfld System.Single SE_Stats::m_staminaRegenMultiplier
IL_0343: ldloc.s V_8
IL_0345: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_034a: ldc.i4.5
IL_034b: newarr System.String
IL_0350: dup
IL_0351: ldc.i4.0
IL_0352: ldstr "ConfigEntry_"
IL_0357: stelem.ref
IL_0358: dup
IL_0359: ldc.i4.1
IL_035a: ldloc.1
IL_035b: stelem.ref
IL_035c: dup
IL_035d: ldc.i4.2
IL_035e: ldstr "_"
IL_0363: stelem.ref
IL_0364: dup
IL_0365: ldc.i4.3
IL_0366: ldloc.s V_7
IL_0368: stelem.ref
IL_0369: dup
IL_036a: ldc.i4.4
IL_036b: ldstr "_MaxEitr"
IL_0370: stelem.ref
IL_0371: call System.String System.String::Concat(System.String[])
IL_0376: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::get_Item(!0)
IL_037b: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0380: conv.r4
IL_0381: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxEitr
IL_0386: ldloc.s V_8
IL_0388: ldc.r4 1
IL_038d: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0392: ldc.i4.5
IL_0393: newarr System.String
IL_0398: dup
IL_0399: ldc.i4.0
IL_039a: ldstr "ConfigEntry_"
IL_039f: stelem.ref
IL_03a0: dup
IL_03a1: ldc.i4.1
IL_03a2: ldloc.1
IL_03a3: stelem.ref
IL_03a4: dup
IL_03a5: ldc.i4.2
IL_03a6: ldstr "_"
IL_03ab: stelem.ref
IL_03ac: dup
IL_03ad: ldc.i4.3
IL_03ae: ldloc.s V_7
IL_03b0: stelem.ref
IL_03b1: dup
IL_03b2: ldc.i4.4
IL_03b3: ldstr "_EitrRegenModifier"
IL_03b8: stelem.ref
IL_03b9: call System.String System.String::Concat(System.String[])
IL_03be: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_03c3: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_03c8: ldc.r4 100
IL_03cd: div
IL_03ce: add
IL_03cf: stfld System.Single SE_Stats::m_eitrRegenMultiplier
IL_03d4: ldloc.s V_8
IL_03d6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_03db: ldc.i4.5
IL_03dc: newarr System.String
IL_03e1: dup
IL_03e2: ldc.i4.0
IL_03e3: ldstr "ConfigEntry_"
IL_03e8: stelem.ref
IL_03e9: dup
IL_03ea: ldc.i4.1
IL_03eb: ldloc.1
IL_03ec: stelem.ref
IL_03ed: dup
IL_03ee: ldc.i4.2
IL_03ef: ldstr "_"
IL_03f4: stelem.ref
IL_03f5: dup
IL_03f6: ldc.i4.3
IL_03f7: ldloc.s V_7
IL_03f9: stelem.ref
IL_03fa: dup
IL_03fb: ldc.i4.4
IL_03fc: ldstr "_MaxWeight"
IL_0401: stelem.ref
IL_0402: call System.String System.String::Concat(System.String[])
IL_0407: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::get_Item(!0)
IL_040c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0411: conv.r4
IL_0412: stfld System.Single SE_Stats::m_addMaxCarryWeight
IL_0417: ldloc.s V_8
IL_0419: ldc.r4 0
IL_041e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0423: ldc.i4.5
IL_0424: newarr System.String
IL_0429: dup
IL_042a: ldc.i4.0
IL_042b: ldstr "ConfigEntry_"
IL_0430: stelem.ref
IL_0431: dup
IL_0432: ldc.i4.1
IL_0433: ldloc.1
IL_0434: stelem.ref
IL_0435: dup
IL_0436: ldc.i4.2
IL_0437: ldstr "_"
IL_043c: stelem.ref
IL_043d: dup
IL_043e: ldc.i4.3
IL_043f: ldloc.s V_7
IL_0441: stelem.ref
IL_0442: dup
IL_0443: ldc.i4.4
IL_0444: ldstr "_MoveSpeedModifier"
IL_0449: stelem.ref
IL_044a: call System.String System.String::Concat(System.String[])
IL_044f: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_0454: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0459: ldc.r4 100
IL_045e: div
IL_045f: add
IL_0460: stfld System.Single SE_Stats::m_speedModifier
IL_0465: ldloc.s V_8
IL_0467: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_046c: ldc.i4.5
IL_046d: newarr System.String
IL_0472: dup
IL_0473: ldc.i4.0
IL_0474: ldstr "ConfigEntry_"
IL_0479: stelem.ref
IL_047a: dup
IL_047b: ldc.i4.1
IL_047c: ldloc.1
IL_047d: stelem.ref
IL_047e: dup
IL_047f: ldc.i4.2
IL_0480: ldstr "_"
IL_0485: stelem.ref
IL_0486: dup
IL_0487: ldc.i4.3
IL_0488: ldloc.s V_7
IL_048a: stelem.ref
IL_048b: dup
IL_048c: ldc.i4.4
IL_048d: ldstr "_JumpForceModifier"
IL_0492: stelem.ref
IL_0493: call System.String System.String::Concat(System.String[])
IL_0498: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_049d: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_04a2: ldc.r4 0
IL_04a7: bne.un.s IL_04b0
IL_04a9: call UnityEngine.Vector3 UnityEngine.Vector3::get_zero()
IL_04ae: br.s IL_04fb
IL_04b0: call UnityEngine.Vector3 UnityEngine.Vector3::get_one()
IL_04b5: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_04ba: ldc.i4.5
IL_04bb: newarr System.String
IL_04c0: dup
IL_04c1: ldc.i4.0
IL_04c2: ldstr "ConfigEntry_"
IL_04c7: stelem.ref
IL_04c8: dup
IL_04c9: ldc.i4.1
IL_04ca: ldloc.1
IL_04cb: stelem.ref
IL_04cc: dup
IL_04cd: ldc.i4.2
IL_04ce: ldstr "_"
IL_04d3: stelem.ref
IL_04d4: dup
IL_04d5: ldc.i4.3
IL_04d6: ldloc.s V_7
IL_04d8: stelem.ref
IL_04d9: dup
IL_04da: ldc.i4.4
IL_04db: ldstr "_JumpForceModifier"
IL_04e0: stelem.ref
IL_04e1: call System.String System.String::Concat(System.String[])
IL_04e6: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_04eb: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_04f0: ldc.r4 200
IL_04f5: div
IL_04f6: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_04fb: stfld UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_0500: ldloc.s V_8
IL_0502: ldc.r4 0
IL_0507: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_050c: ldc.i4.5
IL_050d: newarr System.String
IL_0512: dup
IL_0513: ldc.i4.0
IL_0514: ldstr "ConfigEntry_"
IL_0519: stelem.ref
IL_051a: dup
IL_051b: ldc.i4.1
IL_051c: ldloc.1
IL_051d: stelem.ref
IL_051e: dup
IL_051f: ldc.i4.2
IL_0520: ldstr "_"
IL_0525: stelem.ref
IL_0526: dup
IL_0527: ldc.i4.3
IL_0528: ldloc.s V_7
IL_052a: stelem.ref
IL_052b: dup
IL_052c: ldc.i4.4
IL_052d: ldstr "_MaxFallSpeed"
IL_0532: stelem.ref
IL_0533: call System.String System.String::Concat(System.String[])
IL_0538: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_053d: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0542: add
IL_0543: stfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_0548: ldloc.s V_8
IL_054a: ldc.r4 0
IL_054f: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0554: ldc.i4.5
IL_0555: newarr System.String
IL_055a: dup
IL_055b: ldc.i4.0
IL_055c: ldstr "ConfigEntry_"
IL_0561: stelem.ref
IL_0562: dup
IL_0563: ldc.i4.1
IL_0564: ldloc.1
IL_0565: stelem.ref
IL_0566: dup
IL_0567: ldc.i4.2
IL_0568: ldstr "_"
IL_056d: stelem.ref
IL_056e: dup
IL_056f: ldc.i4.3
IL_0570: ldloc.s V_7
IL_0572: stelem.ref
IL_0573: dup
IL_0574: ldc.i4.4
IL_0575: ldstr "_EquipmentSpeedModifier"
IL_057a: stelem.ref
IL_057b: call System.String System.String::Concat(System.String[])
IL_0580: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_0585: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_058a: ldc.r4 100
IL_058f: div
IL_0590: sub
IL_0591: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_EquipmentSpeedModifier
IL_0596: ldloc.s V_8
IL_0598: ldc.r4 0
IL_059d: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_05a2: ldc.i4.5
IL_05a3: newarr System.String
IL_05a8: dup
IL_05a9: ldc.i4.0
IL_05aa: ldstr "ConfigEntry_"
IL_05af: stelem.ref
IL_05b0: dup
IL_05b1: ldc.i4.1
IL_05b2: ldloc.1
IL_05b3: stelem.ref
IL_05b4: dup
IL_05b5: ldc.i4.2
IL_05b6: ldstr "_"
IL_05bb: stelem.ref
IL_05bc: dup
IL_05bd: ldc.i4.3
IL_05be: ldloc.s V_7
IL_05c0: stelem.ref
IL_05c1: dup
IL_05c2: ldc.i4.4
IL_05c3: ldstr "_WindSpeedModifier"
IL_05c8: stelem.ref
IL_05c9: call System.String System.String::Concat(System.String[])
IL_05ce: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_05d3: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_05d8: ldc.r4 100
IL_05dd: div
IL_05de: add
IL_05df: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_WindSpeedModifier
IL_05e4: ldloc.s V_8
IL_05e6: ldc.r4 0
IL_05eb: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_05f0: ldc.i4.5
IL_05f1: newarr System.String
IL_05f6: dup
IL_05f7: ldc.i4.0
IL_05f8: ldstr "ConfigEntry_"
IL_05fd: stelem.ref
IL_05fe: dup
IL_05ff: ldc.i4.1
IL_0600: ldloc.1
IL_0601: stelem.ref
IL_0602: dup
IL_0603: ldc.i4.2
IL_0604: ldstr "_"
IL_0609: stelem.ref
IL_060a: dup
IL_060b: ldc.i4.3
IL_060c: ldloc.s V_7
IL_060e: stelem.ref
IL_060f: dup
IL_0610: ldc.i4.4
IL_0611: ldstr "_RunStaminaCostModifier"
IL_0616: stelem.ref
IL_0617: call System.String System.String::Concat(System.String[])
IL_061c: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_0621: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0626: ldc.r4 100
IL_062b: div
IL_062c: sub
IL_062d: stfld System.Single SE_Stats::m_runStaminaDrainModifier
IL_0632: ldloc.s V_8
IL_0634: ldc.r4 0
IL_0639: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_063e: ldc.i4.5
IL_063f: newarr System.String
IL_0644: dup
IL_0645: ldc.i4.0
IL_0646: ldstr "ConfigEntry_"
IL_064b: stelem.ref
IL_064c: dup
IL_064d: ldc.i4.1
IL_064e: ldloc.1
IL_064f: stelem.ref
IL_0650: dup
IL_0651: ldc.i4.2
IL_0652: ldstr "_"
IL_0657: stelem.ref
IL_0658: dup
IL_0659: ldc.i4.3
IL_065a: ldloc.s V_7
IL_065c: stelem.ref
IL_065d: dup
IL_065e: ldc.i4.4
IL_065f: ldstr "_JumpStaminaCostModifier"
IL_0664: stelem.ref
IL_0665: call System.String System.String::Concat(System.String[])
IL_066a: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_066f: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0674: ldc.r4 100
IL_0679: div
IL_067a: sub
IL_067b: stfld System.Single SE_Stats::m_jumpStaminaUseModifier
IL_0680: ldloc.s V_8
IL_0682: ldc.r4 0
IL_0687: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_068c: ldc.i4.5
IL_068d: newarr System.String
IL_0692: dup
IL_0693: ldc.i4.0
IL_0694: ldstr "ConfigEntry_"
IL_0699: stelem.ref
IL_069a: dup
IL_069b: ldc.i4.1
IL_069c: ldloc.1
IL_069d: stelem.ref
IL_069e: dup
IL_069f: ldc.i4.2
IL_06a0: ldstr "_"
IL_06a5: stelem.ref
IL_06a6: dup
IL_06a7: ldc.i4.3
IL_06a8: ldloc.s V_7
IL_06aa: stelem.ref
IL_06ab: dup
IL_06ac: ldc.i4.4
IL_06ad: ldstr "_StealthModifier"
IL_06b2: stelem.ref
IL_06b3: call System.String System.String::Concat(System.String[])
IL_06b8: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_06bd: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_06c2: ldc.r4 100
IL_06c7: div
IL_06c8: sub
IL_06c9: stfld System.Single SE_Stats::m_stealthModifier
IL_06ce: ldloc.s V_8
IL_06d0: ldc.r4 0
IL_06d5: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_06da: ldc.i4.5
IL_06db: newarr System.String
IL_06e0: dup
IL_06e1: ldc.i4.0
IL_06e2: ldstr "ConfigEntry_"
IL_06e7: stelem.ref
IL_06e8: dup
IL_06e9: ldc.i4.1
IL_06ea: ldloc.1
IL_06eb: stelem.ref
IL_06ec: dup
IL_06ed: ldc.i4.2
IL_06ee: ldstr "_"
IL_06f3: stelem.ref
IL_06f4: dup
IL_06f5: ldc.i4.3
IL_06f6: ldloc.s V_7
IL_06f8: stelem.ref
IL_06f9: dup
IL_06fa: ldc.i4.4
IL_06fb: ldstr "_NoiseModifier"
IL_0700: stelem.ref
IL_0701: call System.String System.String::Concat(System.String[])
IL_0706: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_070b: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0710: ldc.r4 100
IL_0715: div
IL_0716: sub
IL_0717: stfld System.Single SE_Stats::m_noiseModifier
IL_071c: ldloc.s V_8
IL_071e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0723: ldc.i4.5
IL_0724: newarr System.String
IL_0729: dup
IL_072a: ldc.i4.0
IL_072b: ldstr "ConfigEntry_"
IL_0730: stelem.ref
IL_0731: dup
IL_0732: ldc.i4.1
IL_0733: ldloc.1
IL_0734: stelem.ref
IL_0735: dup
IL_0736: ldc.i4.2
IL_0737: ldstr "_"
IL_073c: stelem.ref
IL_073d: dup
IL_073e: ldc.i4.3
IL_073f: ldloc.s V_7
IL_0741: stelem.ref
IL_0742: dup
IL_0743: ldc.i4.4
IL_0744: ldstr "_StatusAttributes"
IL_0749: stelem.ref
IL_074a: call System.String System.String::Concat(System.String[])
IL_074f: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::get_Item(!0)
IL_0754: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_0759: call System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetStatusAttributes(System.String)
IL_075e: stfld System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_StatusAttributes
IL_0763: ldloc.s V_8
IL_0765: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_076a: ldc.i4.5
IL_076b: newarr System.String
IL_0770: dup
IL_0771: ldc.i4.0
IL_0772: ldstr "ConfigEntry_"
IL_0777: stelem.ref
IL_0778: dup
IL_0779: ldc.i4.1
IL_077a: ldloc.1
IL_077b: stelem.ref
IL_077c: dup
IL_077d: ldc.i4.2
IL_077e: ldstr "_"
IL_0783: stelem.ref
IL_0784: dup
IL_0785: ldc.i4.3
IL_0786: ldloc.s V_7
IL_0788: stelem.ref
IL_0789: dup
IL_078a: ldc.i4.4
IL_078b: ldstr "_OutgoingDamageTypes"
IL_0790: stelem.ref
IL_0791: call System.String System.String::Concat(System.String[])
IL_0796: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::get_Item(!0)
IL_079b: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_07a0: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_07a5: ldc.i4.5
IL_07a6: newarr System.String
IL_07ab: dup
IL_07ac: ldc.i4.0
IL_07ad: ldstr "ConfigEntry_"
IL_07b2: stelem.ref
IL_07b3: dup
IL_07b4: ldc.i4.1
IL_07b5: ldloc.1
IL_07b6: stelem.ref
IL_07b7: dup
IL_07b8: ldc.i4.2
IL_07b9: ldstr "_"
IL_07be: stelem.ref
IL_07bf: dup
IL_07c0: ldc.i4.3
IL_07c1: ldloc.s V_7
IL_07c3: stelem.ref
IL_07c4: dup
IL_07c5: ldc.i4.4
IL_07c6: ldstr "_OutgoingDamageModifiers"
IL_07cb: stelem.ref
IL_07cc: call System.String System.String::Concat(System.String[])
IL_07d1: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::get_Item(!0)
IL_07d6: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_07db: ldloca.s V_10
IL_07dd: call System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetOutgoingDamages(System.String,System.String,System.Collections.Generic.List`1<System.Single>&)
IL_07e2: stfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_07e7: ldloc.s V_8
IL_07e9: ldloc.s V_10
IL_07eb: stfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_07f0: ldloc.s V_8
IL_07f2: ldc.r4 0
IL_07f7: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_07fc: ldc.i4.5
IL_07fd: newarr System.String
IL_0802: dup
IL_0803: ldc.i4.0
IL_0804: ldstr "ConfigEntry_"
IL_0809: stelem.ref
IL_080a: dup
IL_080b: ldc.i4.1
IL_080c: ldloc.1
IL_080d: stelem.ref
IL_080e: dup
IL_080f: ldc.i4.2
IL_0810: ldstr "_"
IL_0815: stelem.ref
IL_0816: dup
IL_0817: ldc.i4.3
IL_0818: ldloc.s V_7
IL_081a: stelem.ref
IL_081b: dup
IL_081c: ldc.i4.4
IL_081d: ldstr "_FallDamageModifier"
IL_0822: stelem.ref
IL_0823: call System.String System.String::Concat(System.String[])
IL_0828: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_082d: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0832: ldc.r4 100
IL_0837: div
IL_0838: sub
IL_0839: stfld System.Single SE_Stats::m_fallDamageModifier
IL_083e: ldloc.s V_8
IL_0840: ldc.r4 0
IL_0845: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_084a: ldc.i4.5
IL_084b: newarr System.String
IL_0850: dup
IL_0851: ldc.i4.0
IL_0852: ldstr "ConfigEntry_"
IL_0857: stelem.ref
IL_0858: dup
IL_0859: ldc.i4.1
IL_085a: ldloc.1
IL_085b: stelem.ref
IL_085c: dup
IL_085d: ldc.i4.2
IL_085e: ldstr "_"
IL_0863: stelem.ref
IL_0864: dup
IL_0865: ldc.i4.3
IL_0866: ldloc.s V_7
IL_0868: stelem.ref
IL_0869: dup
IL_086a: ldc.i4.4
IL_086b: ldstr "_HeatDamageModifier"
IL_0870: stelem.ref
IL_0871: call System.String System.String::Concat(System.String[])
IL_0876: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_087b: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0880: ldc.r4 100
IL_0885: div
IL_0886: sub
IL_0887: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HeatDamageModifier
IL_088c: ldloc.s V_8
IL_088e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0893: ldc.i4.5
IL_0894: newarr System.String
IL_0899: dup
IL_089a: ldc.i4.0
IL_089b: ldstr "ConfigEntry_"
IL_08a0: stelem.ref
IL_08a1: dup
IL_08a2: ldc.i4.1
IL_08a3: ldloc.1
IL_08a4: stelem.ref
IL_08a5: dup
IL_08a6: ldc.i4.2
IL_08a7: ldstr "_"
IL_08ac: stelem.ref
IL_08ad: dup
IL_08ae: ldc.i4.3
IL_08af: ldloc.s V_7
IL_08b1: stelem.ref
IL_08b2: dup
IL_08b3: ldc.i4.4
IL_08b4: ldstr "_IncomingDamageTypes"
IL_08b9: stelem.ref
IL_08ba: call System.String System.String::Concat(System.String[])
IL_08bf: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::get_Item(!0)
IL_08c4: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_08c9: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_08ce: ldc.i4.5
IL_08cf: newarr System.String
IL_08d4: dup
IL_08d5: ldc.i4.0
IL_08d6: ldstr "ConfigEntry_"
IL_08db: stelem.ref
IL_08dc: dup
IL_08dd: ldc.i4.1
IL_08de: ldloc.1
IL_08df: stelem.ref
IL_08e0: dup
IL_08e1: ldc.i4.2
IL_08e2: ldstr "_"
IL_08e7: stelem.ref
IL_08e8: dup
IL_08e9: ldc.i4.3
IL_08ea: ldloc.s V_7
IL_08ec: stelem.ref
IL_08ed: dup
IL_08ee: ldc.i4.4
IL_08ef: ldstr "_IncomingDamageModifiers"
IL_08f4: stelem.ref
IL_08f5: call System.String System.String::Concat(System.String[])
IL_08fa: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::get_Item(!0)
IL_08ff: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_0904: call System.Collections.Generic.List`1<HitData/DamageModPair> ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetIncomingDamages(System.String,System.String)
IL_0909: stfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_090e: ldloca.s V_6
IL_0910: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_0915: brtrue IL_014b
IL_091a: leave.s IL_092a
IL_091c: ldloca.s V_6
IL_091e: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_0924: callvirt System.Void System.IDisposable::Dispose()
IL_0929: endfinally
IL_092a: ldloca.s V_0
IL_092c: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_0931: brtrue IL_0029
IL_0936: leave.s IL_0946
IL_0938: ldloca.s V_0
IL_093a: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_0940: callvirt System.Void System.IDisposable::Dispose()
IL_0945: endfinally
IL_0946: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_General_Preset
IL_094b: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_0950: ldstr "Vanilla"
IL_0955: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_095a: brfalse IL_0b0b
IL_095f: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Config_SettingReset()
IL_0964: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Active
IL_0969: ldc.r4 -0.6
IL_096e: stfld System.Single SE_Stats::m_runStaminaDrainModifier
IL_0973: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Active
IL_0978: ldc.r4 -0.6
IL_097d: stfld System.Single SE_Stats::m_jumpStaminaUseModifier
IL_0982: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder_Active
IL_0987: newobj System.Void System.Collections.Generic.List`1<Skills/SkillType>::.ctor()
IL_098c: dup
IL_098d: ldc.i4.s 13
IL_098f: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_0994: stfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_0999: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder_Active
IL_099e: newobj System.Void System.Collections.Generic.List`1<System.Single>::.ctor()
IL_09a3: dup
IL_09a4: ldc.r4 0.6
IL_09a9: callvirt System.Void System.Collections.Generic.List`1<System.Single>::Add(!0)
IL_09ae: stfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_09b3: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Bonemass_Active
IL_09b8: newobj System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::.ctor()
IL_09bd: dup
IL_09be: ldloca.s V_11
IL_09c0: initobj HitData/DamageModPair
IL_09c6: ldloca.s V_11
IL_09c8: ldc.i4.4
IL_09c9: stfld HitData/DamageType HitData/DamageModPair::m_type
IL_09ce: ldloca.s V_11
IL_09d0: ldc.i4.1
IL_09d1: stfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_09d6: ldloc.s V_11
IL_09d8: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_09dd: dup
IL_09de: ldloca.s V_11
IL_09e0: initobj HitData/DamageModPair
IL_09e6: ldloca.s V_11
IL_09e8: ldc.i4.2
IL_09e9: stfld HitData/DamageType HitData/DamageModPair::m_type
IL_09ee: ldloca.s V_11
IL_09f0: ldc.i4.1
IL_09f1: stfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_09f6: ldloc.s V_11
IL_09f8: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_09fd: dup
IL_09fe: ldloca.s V_11
IL_0a00: initobj HitData/DamageModPair
IL_0a06: ldloca.s V_11
IL_0a08: ldc.i4.1
IL_0a09: stfld HitData/DamageType HitData/DamageModPair::m_type
IL_0a0e: ldloca.s V_11
IL_0a10: ldc.i4.1
IL_0a11: stfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_0a16: ldloc.s V_11
IL_0a18: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_0a1d: stfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_0a22: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Moder_Active
IL_0a27: newobj System.Void System.Collections.Generic.List`1<StatusEffect/StatusAttribute>::.ctor()
IL_0a2c: dup
IL_0a2d: ldc.i4.4
IL_0a2e: callvirt System.Void System.Collections.Generic.List`1<StatusEffect/StatusAttribute>::Add(!0)
IL_0a33: stfld System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_StatusAttributes
IL_0a38: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Yagluth_Active
IL_0a3d: newobj System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::.ctor()
IL_0a42: dup
IL_0a43: ldloca.s V_11
IL_0a45: initobj HitData/DamageModPair
IL_0a4b: ldloca.s V_11
IL_0a4d: ldc.i4 128
IL_0a52: stfld HitData/DamageType HitData/DamageModPair::m_type
IL_0a57: ldloca.s V_11
IL_0a59: ldc.i4.1
IL_0a5a: stfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_0a5f: ldloc.s V_11
IL_0a61: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_0a66: dup
IL_0a67: ldloca.s V_11
IL_0a69: initobj HitData/DamageModPair
IL_0a6f: ldloca.s V_11
IL_0a71: ldc.i4.s 64
IL_0a73: stfld HitData/DamageType HitData/DamageModPair::m_type
IL_0a78: ldloca.s V_11
IL_0a7a: ldc.i4.1
IL_0a7b: stfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_0a80: ldloc.s V_11
IL_0a82: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_0a87: dup
IL_0a88: ldloca.s V_11
IL_0a8a: initobj HitData/DamageModPair
IL_0a90: ldloca.s V_11
IL_0a92: ldc.i4.s 32
IL_0a94: stfld HitData/DamageType HitData/DamageModPair::m_type
IL_0a99: ldloca.s V_11
IL_0a9b: ldc.i4.1
IL_0a9c: stfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_0aa1: ldloc.s V_11
IL_0aa3: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_0aa8: stfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_0aad: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Active
IL_0ab2: ldc.r4 2
IL_0ab7: stfld System.Single SE_Stats::m_eitrRegenMultiplier
IL_0abc: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Active
IL_0ac1: newobj System.Void System.Collections.Generic.List`1<Skills/SkillType>::.ctor()
IL_0ac6: dup
IL_0ac7: ldc.i4.s 12
IL_0ac9: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_0ace: stfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_0ad3: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Active
IL_0ad8: newobj System.Void System.Collections.Generic.List`1<System.Single>::.ctor()
IL_0add: dup
IL_0ade: ldc.r4 0.6
IL_0ae3: callvirt System.Void System.Collections.Generic.List`1<System.Single>::Add(!0)
IL_0ae8: stfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_0aed: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Fader_Active
IL_0af2: ldc.r4 300
IL_0af7: stfld System.Single SE_Stats::m_addMaxCarryWeight
IL_0afc: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Fader_Active
IL_0b01: ldc.r4 0.1
IL_0b06: stfld System.Single SE_Stats::m_speedModifier
IL_0b0b: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_General_Preset
IL_0b10: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_0b15: ldstr "Vanilla+"
IL_0b1a: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0b1f: brfalse IL_0f34
IL_0b24: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Config_SettingReset()
IL_0b29: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Passive
IL_0b2e: ldc.r4 25
IL_0b33: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxStamina
IL_0b38: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Passive
IL_0b3d: ldc.r4 -0.5
IL_0b42: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_EquipmentSpeedModifier
IL_0b47: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Equipped
IL_0b4c: ldc.r4 2
IL_0b51: stfld System.Single SE_Stats::m_staminaRegenMultiplier
IL_0b56: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Equipped
IL_0b5b: ldc.r4 0.1
IL_0b60: stfld System.Single SE_Stats::m_speedModifier
IL_0b65: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Equipped
IL_0b6a: call UnityEngine.Vector3 UnityEngine.Vector3::get_one()
IL_0b6f: ldc.r4 0.25
IL_0b74: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_0b79: stfld UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_0b7e: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Active
IL_0b83: ldc.r4 -0.5
IL_0b88: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_EquipmentSpeedModifier
IL_0b8d: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Active
IL_0b92: ldc.r4 -0.5
IL_0b97: stfld System.Single SE_Stats::m_runStaminaDrainModifier
IL_0b9c: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Active
IL_0ba1: ldc.r4 -0.5
IL_0ba6: stfld System.Single SE_Stats::m_jumpStaminaUseModifier
IL_0bab: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Shared
IL_0bb0: ldc.r4 1.5
IL_0bb5: stfld System.Single SE_Stats::m_staminaRegenMultiplier
IL_0bba: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder_Passive
IL_0bbf: ldc.r4 10
IL_0bc4: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxHealth
IL_0bc9: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder_Passive
IL_0bce: ldc.r4 1
IL_0bd3: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HealthRegen
IL_0bd8: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder_Passive
IL_0bdd: ldc.r4 50
IL_0be2: stfld System.Single SE_Stats::m_addMaxCarryWeight
IL_0be7: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder_Equipped
IL_0bec: newobj System.Void System.Collections.Generic.List`1<Skills/SkillType>::.ctor()
IL_0bf1: dup
IL_0bf2: ldc.i4.s 13
IL_0bf4: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_0bf9: stfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_0bfe: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder_Equipped
IL_0c03: newobj System.Void System.Collections.Generic.List`1<System.Single>::.ctor()
IL_0c08: dup
IL_0c09: ldc.r4 3
IL_0c0e: callvirt System.Void System.Collections.Generic.List`1<System.Single>::Add(!0)
IL_0c13: stfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_0c18: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder_Active
IL_0c1d: newobj System.Void System.Collections.Generic.List`1<Skills/SkillType>::.ctor()
IL_0c22: dup
IL_0c23: ldc.i4.7
IL_0c24: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_0c29: dup
IL_0c2a: ldc.i4.2
IL_0c2b: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_0c30: dup
IL_0c31: ldc.i4.1
IL_0c32: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_0c37: stfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_0c3c: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder_Active
IL_0c41: newobj System.Void System.Collections.Generic.List`1<System.Single>::.ctor()
IL_0c46: dup
IL_0c47: ldc.r4 1
IL_0c4c: callvirt System.Void System.Collections.Generic.List`1<System.Single>::Add(!0)
IL_0c51: dup
IL_0c52: ldc.r4 1
IL_0c57: callvirt System.Void System.Collections.Generic.List`1<System.Single>::Add(!0)
IL_0c5c: dup
IL_0c5d: ldc.r4 1
IL_0c62: callvirt System.Void System.Collections.Generic.List`1<System.Single>::Add(!0)
IL_0c67: stfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_0c6c: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder_Shared
IL_0c71: ldc.r4 1.5
IL_0c76: stfld System.Single SE_Stats::m_healthRegenMultiplier
IL_0c7b: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Bonemass_Passive
IL_0c80: ldc.r4 15
IL_0c85: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxHealth
IL_0c8a: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Bonemass_Equipped
IL_0c8f: ldc.r4 2
IL_0c94: stfld System.Single SE_Stats::m_healthRegenMultiplier
IL_0c99: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Bonemass_Active
IL_0c9e: newobj System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::.ctor()
IL_0ca3: dup
IL_0ca4: ldloca.s V_11
IL_0ca6: initobj HitData/DamageModPair
IL_0cac: ldloca.s V_11
IL_0cae: ldc.i4.4
IL_0caf: stfld HitData/DamageType HitData/DamageModPair::m_type
IL_0cb4: ldloca.s V_11
IL_0cb6: ldc.i4.1
IL_0cb7: stfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_0cbc: ldloc.s V_11
IL_0cbe: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_0cc3: dup
IL_0cc4: ldloca.s V_11
IL_0cc6: initobj HitData/DamageModPair
IL_0ccc: ldloca.s V_11
IL_0cce: ldc.i4.2
IL_0ccf: stfld HitData/DamageType HitData/DamageModPair::m_type
IL_0cd4: ldloca.s V_11
IL_0cd6: ldc.i4.1
IL_0cd7: stfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_0cdc: ldloc.s V_11
IL_0cde: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_0ce3: dup
IL_0ce4: ldloca.s V_11
IL_0ce6: initobj HitData/DamageModPair
IL_0cec: ldloca.s V_11
IL_0cee: ldc.i4.1
IL_0cef: stfld HitData/DamageType HitData/DamageModPair::m_type
IL_0cf4: ldloca.s V_11
IL_0cf6: ldc.i4.1
IL_0cf7: stfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_0cfc: ldloc.s V_11
IL_0cfe: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_0d03: stfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_0d08: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Bonemass_Shared
IL_0d0d: ldc.r4 1.5
IL_0d12: stfld System.Single SE_Stats::m_healthRegenMultiplier
IL_0d17: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Moder_Passive
IL_0d1c: ldc.r4 -0.5
IL_0d21: stfld System.Single SE_Stats::m_fallDamageModifier
IL_0d26: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Moder_Equipped
IL_0d2b: ldc.r4 1
IL_0d30: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_WindSpeedModifier
IL_0d35: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Moder_Equipped
IL_0d3a: newobj System.Void System.Collections.Generic.List`1<StatusEffect/StatusAttribute>::.ctor()
IL_0d3f: dup
IL_0d40: ldc.i4.4
IL_0d41: callvirt System.Void System.Collections.Generic.List`1<StatusEffect/StatusAttribute>::Add(!0)
IL_0d46: stfld System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_StatusAttributes
IL_0d4b: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Moder_Active
IL_0d50: ldc.r4 5
IL_0d55: stfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_0d5a: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Moder_Active
IL_0d5f: ldc.r4 -1
IL_0d64: stfld System.Single SE_Stats::m_fallDamageModifier
IL_0d69: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Moder_Shared
IL_0d6e: ldc.r4 0.1
IL_0d73: stfld System.Single SE_Stats::m_speedModifier
IL_0d78: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Yagluth_Passive
IL_0d7d: ldc.r4 20
IL_0d82: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxEitr
IL_0d87: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Yagluth_Equipped
IL_0d8c: ldc.r4 2
IL_0d91: stfld System.Single SE_Stats::m_eitrRegenMultiplier
IL_0d96: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Yagluth_Active
IL_0d9b: newobj System.Void System.Collections.Generic.List`1<Skills/SkillType>::.ctor()
IL_0da0: dup
IL_0da1: ldc.i4.s 9
IL_0da3: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_0da8: stfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_0dad: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Yagluth_Active
IL_0db2: newobj System.Void System.Collections.Generic.List`1<System.Single>::.ctor()
IL_0db7: dup
IL_0db8: ldc.r4 1
IL_0dbd: callvirt System.Void System.Collections.Generic.List`1<System.Single>::Add(!0)
IL_0dc2: stfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_0dc7: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Yagluth_Active
IL_0dcc: newobj System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::.ctor()
IL_0dd1: dup
IL_0dd2: ldloca.s V_11
IL_0dd4: initobj HitData/DamageModPair
IL_0dda: ldloca.s V_11
IL_0ddc: ldc.i4 128
IL_0de1: stfld HitData/DamageType HitData/DamageModPair::m_type
IL_0de6: ldloca.s V_11
IL_0de8: ldc.i4.1
IL_0de9: stfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_0dee: ldloc.s V_11
IL_0df0: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_0df5: dup
IL_0df6: ldloca.s V_11
IL_0df8: initobj HitData/DamageModPair
IL_0dfe: ldloca.s V_11
IL_0e00: ldc.i4.s 64
IL_0e02: stfld HitData/DamageType HitData/DamageModPair::m_type
IL_0e07: ldloca.s V_11
IL_0e09: ldc.i4.1
IL_0e0a: stfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_0e0f: ldloc.s V_11
IL_0e11: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_0e16: dup
IL_0e17: ldloca.s V_11
IL_0e19: initobj HitData/DamageModPair
IL_0e1f: ldloca.s V_11
IL_0e21: ldc.i4.s 32
IL_0e23: stfld HitData/DamageType HitData/DamageModPair::m_type
IL_0e28: ldloca.s V_11
IL_0e2a: ldc.i4.1
IL_0e2b: stfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_0e30: ldloc.s V_11
IL_0e32: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_0e37: stfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_0e3c: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Yagluth_Shared
IL_0e41: ldc.r4 1.5
IL_0e46: stfld System.Single SE_Stats::m_eitrRegenMultiplier
IL_0e4b: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Passive
IL_0e50: ldc.r4 30
IL_0e55: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxEitr
IL_0e5a: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Passive
IL_0e5f: ldc.r4 50
IL_0e64: stfld System.Single SE_Stats::m_addMaxCarryWeight
IL_0e69: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Equipped
IL_0e6e: newobj System.Void System.Collections.Generic.List`1<Skills/SkillType>::.ctor()
IL_0e73: dup
IL_0e74: ldc.i4.s 12
IL_0e76: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_0e7b: stfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_0e80: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Equipped
IL_0e85: newobj System.Void System.Collections.Generic.List`1<System.Single>::.ctor()
IL_0e8a: dup
IL_0e8b: ldc.r4 3
IL_0e90: callvirt System.Void System.Collections.Generic.List`1<System.Single>::Add(!0)
IL_0e95: stfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_0e9a: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Active
IL_0e9f: newobj System.Void System.Collections.Generic.List`1<Skills/SkillType>::.ctor()
IL_0ea4: dup
IL_0ea5: ldc.i4.s 10
IL_0ea7: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_0eac: stfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_0eb1: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Active
IL_0eb6: newobj System.Void System.Collections.Generic.List`1<System.Single>::.ctor()
IL_0ebb: dup
IL_0ebc: ldc.r4 1
IL_0ec1: callvirt System.Void System.Collections.Generic.List`1<System.Single>::Add(!0)
IL_0ec6: stfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_0ecb: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Shared
IL_0ed0: ldc.r4 1.5
IL_0ed5: stfld System.Single SE_Stats::m_eitrRegenMultiplier
IL_0eda: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Fader_Passive
IL_0edf: ldc.r4 50
IL_0ee4: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxStamina
IL_0ee9: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Fader_Passive
IL_0eee: ldc.r4 200
IL_0ef3: stfld System.Single SE_Stats::m_addMaxCarryWeight
IL_0ef8: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Fader_Equipped
IL_0efd: ldc.r4 -0.6
IL_0f02: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HeatDamageModifier
IL_0f07: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Fader_Active
IL_0f0c: ldc.r4 -1
IL_0f11: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HeatDamageModifier
IL_0f16: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Fader_Shared
IL_0f1b: ldc.r4 0.1
IL_0f20: stfld System.Single SE_Stats::m_speedModifier
IL_0f25: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Fader_Shared
IL_0f2a: ldc.r4 1.5
IL_0f2f: stfld System.Single SE_Stats::m_staminaRegenMultiplier
IL_0f34: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_General_Preset
IL_0f39: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_0f3e: ldstr "Passive Powers"
IL_0f43: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0f48: brfalse IL_10f9
IL_0f4d: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Config_SettingReset()
IL_0f52: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Passive
IL_0f57: ldc.r4 -0.6
IL_0f5c: stfld System.Single SE_Stats::m_runStaminaDrainModifier
IL_0f61: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Passive
IL_0f66: ldc.r4 -0.6
IL_0f6b: stfld System.Single SE_Stats::m_jumpStaminaUseModifier
IL_0f70: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder_Passive
IL_0f75: newobj System.Void System.Collections.Generic.List`1<Skills/SkillType>::.ctor()
IL_0f7a: dup
IL_0f7b: ldc.i4.s 13
IL_0f7d: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_0f82: stfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_0f87: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder_Passive
IL_0f8c: newobj System.Void System.Collections.Generic.List`1<System.Single>::.ctor()
IL_0f91: dup
IL_0f92: ldc.r4 0.6
IL_0f97: callvirt System.Void System.Collections.Generic.List`1<System.Single>::Add(!0)
IL_0f9c: stfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_0fa1: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Bonemass_Passive
IL_0fa6: newobj System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::.ctor()
IL_0fab: dup
IL_0fac: ldloca.s V_11
IL_0fae: initobj HitData/DamageModPair
IL_0fb4: ldloca.s V_11
IL_0fb6: ldc.i4.4
IL_0fb7: stfld HitData/DamageType HitData/DamageModPair::m_type
IL_0fbc: ldloca.s V_11
IL_0fbe: ldc.i4.1
IL_0fbf: stfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_0fc4: ldloc.s V_11
IL_0fc6: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_0fcb: dup
IL_0fcc: ldloca.s V_11
IL_0fce: initobj HitData/DamageModPair
IL_0fd4: ldloca.s V_11
IL_0fd6: ldc.i4.2
IL_0fd7: stfld HitData/DamageType HitData/DamageModPair::m_type
IL_0fdc: ldloca.s V_11
IL_0fde: ldc.i4.1
IL_0fdf: stfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_0fe4: ldloc.s V_11
IL_0fe6: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_0feb: dup
IL_0fec: ldloca.s V_11
IL_0fee: initobj HitData/DamageModPair
IL_0ff4: ldloca.s V_11
IL_0ff6: ldc.i4.1
IL_0ff7: stfld HitData/DamageType HitData/DamageModPair::m_type
IL_0ffc: ldloca.s V_11
IL_0ffe: ldc.i4.1
IL_0fff: stfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_1004: ldloc.s V_11
IL_1006: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_100b: stfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_1010: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Moder_Passive
IL_1015: newobj System.Void System.Collections.Generic.List`1<StatusEffect/StatusAttribute>::.ctor()
IL_101a: dup
IL_101b: ldc.i4.4
IL_101c: callvirt System.Void System.Collections.Generic.List`1<StatusEffect/StatusAttribute>::Add(!0)
IL_1021: stfld System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_StatusAttributes
IL_1026: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Yagluth_Passive
IL_102b: newobj System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::.ctor()
IL_1030: dup
IL_1031: ldloca.s V_11
IL_1033: initobj HitData/DamageModPair
IL_1039: ldloca.s V_11
IL_103b: ldc.i4 128
IL_1040: stfld HitData/DamageType HitData/DamageModPair::m_type
IL_1045: ldloca.s V_11
IL_1047: ldc.i4.1
IL_1048: stfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_104d: ldloc.s V_11
IL_104f: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_1054: dup
IL_1055: ldloca.s V_11
IL_1057: initobj HitData/DamageModPair
IL_105d: ldloca.s V_11
IL_105f: ldc.i4.s 64
IL_1061: stfld HitData/DamageType HitData/DamageModPair::m_type
IL_1066: ldloca.s V_11
IL_1068: ldc.i4.1
IL_1069: stfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_106e: ldloc.s V_11
IL_1070: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_1075: dup
IL_1076: ldloca.s V_11
IL_1078: initobj HitData/DamageModPair
IL_107e: ldloca.s V_11
IL_1080: ldc.i4.s 32
IL_1082: stfld HitData/DamageType HitData/DamageModPair::m_type
IL_1087: ldloca.s V_11
IL_1089: ldc.i4.1
IL_108a: stfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_108f: ldloc.s V_11
IL_1091: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_1096: stfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_109b: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Passive
IL_10a0: ldc.r4 2
IL_10a5: stfld System.Single SE_Stats::m_eitrRegenMultiplier
IL_10aa: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Passive
IL_10af: newobj System.Void System.Collections.Generic.List`1<Skills/SkillType>::.ctor()
IL_10b4: dup
IL_10b5: ldc.i4.s 12
IL_10b7: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_10bc: stfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_10c1: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Passive
IL_10c6: newobj System.Void System.Collections.Generic.List`1<System.Single>::.ctor()
IL_10cb: dup
IL_10cc: ldc.r4 0.6
IL_10d1: callvirt System.Void System.Collections.Generic.List`1<System.Single>::Add(!0)
IL_10d6: stfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_10db: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Fader_Passive
IL_10e0: ldc.r4 300
IL_10e5: stfld System.Single SE_Stats::m_addMaxCarryWeight
IL_10ea: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Fader_Passive
IL_10ef: ldc.r4 0.1
IL_10f4: stfld System.Single SE_Stats::m_speedModifier
IL_10f9: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Passive_Stats()
IL_10fe: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Active_Stats()
IL_1103: ret
// EH Finally: 326 - 2332 => 2332 - 2346
// EH Finally: 36 - 2360 => 2360 - 2374

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Config_SettingReset()
.locals System.Collections.Generic.List`1/Enumerator<System.String>, System.String, System.Int32, System.Int32, System.Int32, System.Char, System.Collections.Generic.List`1/Enumerator<System.String>, System.String, ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO, ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0000: ldsfld System.Collections.Generic.List`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_BossNames
IL_0005: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_000a: stloc.0
IL_000b: br IL_02f5
IL_0010: ldloca.s V_0
IL_0012: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_0017: stloc.1
IL_0018: ldloc.1
IL_0019: brfalse IL_011d
IL_001e: ldloc.1
IL_001f: call System.Int32 System.String::get_Length()
IL_0024: stloc.s V_4
IL_0026: ldloc.s V_4
IL_0028: ldc.i4.5
IL_0029: sub
IL_002a: switch IL_0078,IL_011d,IL_0044,IL_005e
IL_003f: br IL_011d
IL_0044: ldloc.1
IL_0045: ldc.i4.0
IL_0046: call System.Char System.String::get_Chars(System.Int32)
IL_004b: stloc.s V_5
IL_004d: ldloc.s V_5
IL_004f: ldc.i4.s 69
IL_0051: beq.s IL_0098
IL_0053: ldloc.s V_5
IL_0055: ldc.i4.s 89
IL_0057: beq.s IL_00a7
IL_0059: br IL_011d
IL_005e: ldloc.1
IL_005f: ldc.i4.0
IL_0060: call System.Char System.String::get_Chars(System.Int32)
IL_0065: stloc.s V_5
IL_0067: ldloc.s V_5
IL_0069: ldc.i4.s 66
IL_006b: beq.s IL_00c5
IL_006d: ldloc.s V_5
IL_006f: ldc.i4.s 84
IL_0071: beq.s IL_00b6
IL_0073: br IL_011d
IL_0078: ldloc.1
IL_0079: ldc.i4.0
IL_007a: call System.Char System.String::get_Chars(System.Int32)
IL_007f: stloc.s V_5
IL_0081: ldloc.s V_5
IL_0083: ldc.i4.s 70
IL_0085: beq.s IL_00f2
IL_0087: ldloc.s V_5
IL_0089: ldc.i4.s 77
IL_008b: beq.s IL_00d4
IL_008d: ldloc.s V_5
IL_008f: ldc.i4.s 81
IL_0091: beq.s IL_00e3
IL_0093: br IL_011d
IL_0098: ldloc.1
IL_0099: ldstr "Eikthyr"
IL_009e: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00a3: brtrue.s IL_0101
IL_00a5: br.s IL_011d
IL_00a7: ldloc.1
IL_00a8: ldstr "Yagluth"
IL_00ad: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00b2: brtrue.s IL_0111
IL_00b4: br.s IL_011d
IL_00b6: ldloc.1
IL_00b7: ldstr "TheElder"
IL_00bc: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00c1: brtrue.s IL_0105
IL_00c3: br.s IL_011d
IL_00c5: ldloc.1
IL_00c6: ldstr "Bonemass"
IL_00cb: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00d0: brtrue.s IL_0109
IL_00d2: br.s IL_011d
IL_00d4: ldloc.1
IL_00d5: ldstr "Moder"
IL_00da: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00df: brtrue.s IL_010d
IL_00e1: br.s IL_011d
IL_00e3: ldloc.1
IL_00e4: ldstr "Queen"
IL_00e9: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00ee: brtrue.s IL_0115
IL_00f0: br.s IL_011d
IL_00f2: ldloc.1
IL_00f3: ldstr "Fader"
IL_00f8: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00fd: brtrue.s IL_0119
IL_00ff: br.s IL_011d
IL_0101: ldc.i4.0
IL_0102: stloc.3
IL_0103: br.s IL_011f
IL_0105: ldc.i4.1
IL_0106: stloc.3
IL_0107: br.s IL_011f
IL_0109: ldc.i4.2
IL_010a: stloc.3
IL_010b: br.s IL_011f
IL_010d: ldc.i4.3
IL_010e: stloc.3
IL_010f: br.s IL_011f
IL_0111: ldc.i4.4
IL_0112: stloc.3
IL_0113: br.s IL_011f
IL_0115: ldc.i4.5
IL_0116: stloc.3
IL_0117: br.s IL_011f
IL_0119: ldc.i4.6
IL_011a: stloc.3
IL_011b: br.s IL_011f
IL_011d: ldc.i4.0
IL_011e: stloc.3
IL_011f: ldloc.3
IL_0120: stloc.2
IL_0121: ldsfld System.Collections.Generic.List`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_Components
IL_0126: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_012b: stloc.s V_6
IL_012d: br IL_02d9
IL_0132: ldloca.s V_6
IL_0134: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_0139: stloc.s V_7
IL_013b: ldloc.s V_7
IL_013d: ldstr "Passive"
IL_0142: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0147: brtrue.s IL_0175
IL_0149: ldloc.s V_7
IL_014b: ldstr "Equipped"
IL_0150: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0155: brtrue.s IL_0184
IL_0157: ldloc.s V_7
IL_0159: ldstr "Active"
IL_015e: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0163: brtrue.s IL_0193
IL_0165: ldloc.s V_7
IL_0167: ldstr "Shared"
IL_016c: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0171: brtrue.s IL_01a2
IL_0173: br.s IL_01b1
IL_0175: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Passive
IL_017a: ldloc.2
IL_017b: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0180: stloc.s V_9
IL_0182: br.s IL_01b4
IL_0184: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Equipped
IL_0189: ldloc.2
IL_018a: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_018f: stloc.s V_9
IL_0191: br.s IL_01b4
IL_0193: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_0198: ldloc.2
IL_0199: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_019e: stloc.s V_9
IL_01a0: br.s IL_01b4
IL_01a2: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Shared
IL_01a7: ldloc.2
IL_01a8: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_01ad: stloc.s V_9
IL_01af: br.s IL_01b4
IL_01b1: ldnull
IL_01b2: stloc.s V_9
IL_01b4: ldloc.s V_9
IL_01b6: stloc.s V_8
IL_01b8: ldloc.s V_8
IL_01ba: ldnull
IL_01bb: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_01c0: brfalse IL_02d9
IL_01c5: ldloc.s V_8
IL_01c7: ldc.r4 0
IL_01cc: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxHealth
IL_01d1: ldloc.s V_8
IL_01d3: ldc.r4 0
IL_01d8: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HealthRegen
IL_01dd: ldloc.s V_8
IL_01df: ldc.r4 1
IL_01e4: stfld System.Single SE_Stats::m_healthRegenMultiplier
IL_01e9: ldloc.s V_8
IL_01eb: ldc.r4 0
IL_01f0: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxStamina
IL_01f5: ldloc.s V_8
IL_01f7: ldc.r4 1
IL_01fc: stfld System.Single SE_Stats::m_staminaRegenMultiplier
IL_0201: ldloc.s V_8
IL_0203: ldc.r4 0
IL_0208: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxEitr
IL_020d: ldloc.s V_8
IL_020f: ldc.r4 1
IL_0214: stfld System.Single SE_Stats::m_eitrRegenMultiplier
IL_0219: ldloc.s V_8
IL_021b: ldc.r4 0
IL_0220: stfld System.Single SE_Stats::m_addMaxCarryWeight
IL_0225: ldloc.s V_8
IL_0227: ldc.r4 0
IL_022c: stfld System.Single SE_Stats::m_speedModifier
IL_0231: ldloc.s V_8
IL_0233: call UnityEngine.Vector3 UnityEngine.Vector3::get_zero()
IL_0238: stfld UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_023d: ldloc.s V_8
IL_023f: ldc.r4 0
IL_0244: stfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_0249: ldloc.s V_8
IL_024b: ldc.r4 0
IL_0250: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_EquipmentSpeedModifier
IL_0255: ldloc.s V_8
IL_0257: ldc.r4 0
IL_025c: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_WindSpeedModifier
IL_0261: ldloc.s V_8
IL_0263: ldc.r4 0
IL_0268: stfld System.Single SE_Stats::m_runStaminaDrainModifier
IL_026d: ldloc.s V_8
IL_026f: ldc.r4 0
IL_0274: stfld System.Single SE_Stats::m_jumpStaminaUseModifier
IL_0279: ldloc.s V_8
IL_027b: ldc.r4 0
IL_0280: stfld System.Single SE_Stats::m_stealthModifier
IL_0285: ldloc.s V_8
IL_0287: ldc.r4 0
IL_028c: stfld System.Single SE_Stats::m_noiseModifier
IL_0291: ldloc.s V_8
IL_0293: newobj System.Void System.Collections.Generic.List`1<StatusEffect/StatusAttribute>::.ctor()
IL_0298: stfld System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_StatusAttributes
IL_029d: ldloc.s V_8
IL_029f: newobj System.Void System.Collections.Generic.List`1<Skills/SkillType>::.ctor()
IL_02a4: stfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_02a9: ldloc.s V_8
IL_02ab: newobj System.Void System.Collections.Generic.List`1<System.Single>::.ctor()
IL_02b0: stfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_02b5: ldloc.s V_8
IL_02b7: ldc.r4 0
IL_02bc: stfld System.Single SE_Stats::m_fallDamageModifier
IL_02c1: ldloc.s V_8
IL_02c3: ldc.r4 0
IL_02c8: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HeatDamageModifier
IL_02cd: ldloc.s V_8
IL_02cf: newobj System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::.ctor()
IL_02d4: stfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_02d9: ldloca.s V_6
IL_02db: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_02e0: brtrue IL_0132
IL_02e5: leave.s IL_02f5
IL_02e7: ldloca.s V_6
IL_02e9: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_02ef: callvirt System.Void System.IDisposable::Dispose()
IL_02f4: endfinally
IL_02f5: ldloca.s V_0
IL_02f7: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_02fc: brtrue IL_0010
IL_0301: leave.s IL_0311
IL_0303: ldloca.s V_0
IL_0305: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_030b: callvirt System.Void System.IDisposable::Dispose()
IL_0310: endfinally
IL_0311: ret
// EH Finally: 301 - 743 => 743 - 757
// EH Finally: 11 - 771 => 771 - 785

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Add_Dictionaries()
.locals 
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0005: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Clear()
IL_000a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_000f: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Clear()
IL_0014: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0019: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Clear()
IL_001e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0023: ldstr "ConfigEntry_Eikthyr_Passive_MaxHealth"
IL_0028: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_MaxHealth
IL_002d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0032: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0037: ldstr "ConfigEntry_Eikthyr_Passive_HealthRegen"
IL_003c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_HealthRegen
IL_0041: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0046: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_004b: ldstr "ConfigEntry_Eikthyr_Passive_HealthRegenModifier"
IL_0050: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_HealthRegenModifier
IL_0055: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_005a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_005f: ldstr "ConfigEntry_Eikthyr_Passive_MaxStamina"
IL_0064: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_MaxStamina
IL_0069: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_006e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0073: ldstr "ConfigEntry_Eikthyr_Passive_StaminaRegenModifier"
IL_0078: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_StaminaRegenModifier
IL_007d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0082: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0087: ldstr "ConfigEntry_Eikthyr_Passive_MaxEitr"
IL_008c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_MaxEitr
IL_0091: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0096: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_009b: ldstr "ConfigEntry_Eikthyr_Passive_EitrRegenModifier"
IL_00a0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_EitrRegenModifier
IL_00a5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_00aa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_00af: ldstr "ConfigEntry_Eikthyr_Passive_MaxWeight"
IL_00b4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_MaxWeight
IL_00b9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_00be: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_00c3: ldstr "ConfigEntry_Eikthyr_Passive_MoveSpeedModifier"
IL_00c8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_MoveSpeedModifier
IL_00cd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_00d2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_00d7: ldstr "ConfigEntry_Eikthyr_Passive_JumpForceModifier"
IL_00dc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_JumpForceModifier
IL_00e1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_00e6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_00eb: ldstr "ConfigEntry_Eikthyr_Passive_MaxFallSpeed"
IL_00f0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_MaxFallSpeed
IL_00f5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_00fa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_00ff: ldstr "ConfigEntry_Eikthyr_Passive_EquipmentSpeedModifier"
IL_0104: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_EquipmentSpeedModifier
IL_0109: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_010e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0113: ldstr "ConfigEntry_Eikthyr_Passive_WindSpeedModifier"
IL_0118: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_WindSpeedModifier
IL_011d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0122: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0127: ldstr "ConfigEntry_Eikthyr_Passive_RunStaminaCostModifier"
IL_012c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_RunStaminaCostModifier
IL_0131: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0136: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_013b: ldstr "ConfigEntry_Eikthyr_Passive_JumpStaminaCostModifier"
IL_0140: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_JumpStaminaCostModifier
IL_0145: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_014a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_014f: ldstr "ConfigEntry_Eikthyr_Passive_StealthModifier"
IL_0154: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_StealthModifier
IL_0159: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_015e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0163: ldstr "ConfigEntry_Eikthyr_Passive_NoiseModifier"
IL_0168: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_NoiseModifier
IL_016d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0172: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0177: ldstr "ConfigEntry_Eikthyr_Passive_StatusAttributes"
IL_017c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_StatusAttributes
IL_0181: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0186: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_018b: ldstr "ConfigEntry_Eikthyr_Passive_OutgoingDamageTypes"
IL_0190: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_OutgoingDamageTypes
IL_0195: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_019a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_019f: ldstr "ConfigEntry_Eikthyr_Passive_OutgoingDamageModifiers"
IL_01a4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_OutgoingDamageModifiers
IL_01a9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_01ae: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_01b3: ldstr "ConfigEntry_Eikthyr_Passive_FallDamageModifier"
IL_01b8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_FallDamageModifier
IL_01bd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_01c2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_01c7: ldstr "ConfigEntry_Eikthyr_Passive_IncomingDamageTypes"
IL_01cc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_IncomingDamageTypes
IL_01d1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_01d6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_01db: ldstr "ConfigEntry_Eikthyr_Passive_IncomingDamageModifiers"
IL_01e0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_IncomingDamageModifiers
IL_01e5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_01ea: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_01ef: ldstr "ConfigEntry_Eikthyr_Passive_HeatDamageModifier"
IL_01f4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Passive_HeatDamageModifier
IL_01f9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_01fe: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0203: ldstr "ConfigEntry_Eikthyr_Active_MaxHealth"
IL_0208: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_MaxHealth
IL_020d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0212: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0217: ldstr "ConfigEntry_Eikthyr_Active_HealthRegen"
IL_021c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_HealthRegen
IL_0221: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0226: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_022b: ldstr "ConfigEntry_Eikthyr_Active_HealthRegenModifier"
IL_0230: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_HealthRegenModifier
IL_0235: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_023a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_023f: ldstr "ConfigEntry_Eikthyr_Active_MaxStamina"
IL_0244: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_MaxStamina
IL_0249: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_024e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0253: ldstr "ConfigEntry_Eikthyr_Active_StaminaRegenModifier"
IL_0258: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_StaminaRegenModifier
IL_025d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0262: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0267: ldstr "ConfigEntry_Eikthyr_Active_MaxEitr"
IL_026c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_MaxEitr
IL_0271: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0276: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_027b: ldstr "ConfigEntry_Eikthyr_Active_EitrRegenModifier"
IL_0280: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_EitrRegenModifier
IL_0285: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_028a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_028f: ldstr "ConfigEntry_Eikthyr_Active_MaxWeight"
IL_0294: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_MaxWeight
IL_0299: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_029e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_02a3: ldstr "ConfigEntry_Eikthyr_Active_MoveSpeedModifier"
IL_02a8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_MoveSpeedModifier
IL_02ad: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_02b2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_02b7: ldstr "ConfigEntry_Eikthyr_Active_JumpForceModifier"
IL_02bc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_JumpForceModifier
IL_02c1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_02c6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_02cb: ldstr "ConfigEntry_Eikthyr_Active_MaxFallSpeed"
IL_02d0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_MaxFallSpeed
IL_02d5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_02da: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_02df: ldstr "ConfigEntry_Eikthyr_Active_EquipmentSpeedModifier"
IL_02e4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_EquipmentSpeedModifier
IL_02e9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_02ee: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_02f3: ldstr "ConfigEntry_Eikthyr_Active_WindSpeedModifier"
IL_02f8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_WindSpeedModifier
IL_02fd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0302: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0307: ldstr "ConfigEntry_Eikthyr_Active_RunStaminaCostModifier"
IL_030c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_RunStaminaCostModifier
IL_0311: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0316: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_031b: ldstr "ConfigEntry_Eikthyr_Active_JumpStaminaCostModifier"
IL_0320: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_JumpStaminaCostModifier
IL_0325: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_032a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_032f: ldstr "ConfigEntry_Eikthyr_Active_StealthModifier"
IL_0334: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_StealthModifier
IL_0339: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_033e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0343: ldstr "ConfigEntry_Eikthyr_Active_NoiseModifier"
IL_0348: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_NoiseModifier
IL_034d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0352: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0357: ldstr "ConfigEntry_Eikthyr_Active_StatusAttributes"
IL_035c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_StatusAttributes
IL_0361: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0366: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_036b: ldstr "ConfigEntry_Eikthyr_Active_OutgoingDamageTypes"
IL_0370: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_OutgoingDamageTypes
IL_0375: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_037a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_037f: ldstr "ConfigEntry_Eikthyr_Active_OutgoingDamageModifiers"
IL_0384: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_OutgoingDamageModifiers
IL_0389: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_038e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0393: ldstr "ConfigEntry_Eikthyr_Active_FallDamageModifier"
IL_0398: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_FallDamageModifier
IL_039d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_03a2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_03a7: ldstr "ConfigEntry_Eikthyr_Active_IncomingDamageTypes"
IL_03ac: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_IncomingDamageTypes
IL_03b1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_03b6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_03bb: ldstr "ConfigEntry_Eikthyr_Active_IncomingDamageModifiers"
IL_03c0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_IncomingDamageModifiers
IL_03c5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_03ca: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_03cf: ldstr "ConfigEntry_Eikthyr_Active_HeatDamageModifier"
IL_03d4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Active_HeatDamageModifier
IL_03d9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_03de: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_03e3: ldstr "ConfigEntry_Eikthyr_Shared_MaxHealth"
IL_03e8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_MaxHealth
IL_03ed: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_03f2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_03f7: ldstr "ConfigEntry_Eikthyr_Shared_HealthRegen"
IL_03fc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_HealthRegen
IL_0401: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0406: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_040b: ldstr "ConfigEntry_Eikthyr_Shared_HealthRegenModifier"
IL_0410: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_HealthRegenModifier
IL_0415: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_041a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_041f: ldstr "ConfigEntry_Eikthyr_Shared_MaxStamina"
IL_0424: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_MaxStamina
IL_0429: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_042e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0433: ldstr "ConfigEntry_Eikthyr_Shared_StaminaRegenModifier"
IL_0438: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_StaminaRegenModifier
IL_043d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0442: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0447: ldstr "ConfigEntry_Eikthyr_Shared_MaxEitr"
IL_044c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_MaxEitr
IL_0451: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0456: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_045b: ldstr "ConfigEntry_Eikthyr_Shared_EitrRegenModifier"
IL_0460: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_EitrRegenModifier
IL_0465: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_046a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_046f: ldstr "ConfigEntry_Eikthyr_Shared_MaxWeight"
IL_0474: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_MaxWeight
IL_0479: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_047e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0483: ldstr "ConfigEntry_Eikthyr_Shared_MoveSpeedModifier"
IL_0488: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_MoveSpeedModifier
IL_048d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0492: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0497: ldstr "ConfigEntry_Eikthyr_Shared_JumpForceModifier"
IL_049c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_JumpForceModifier
IL_04a1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_04a6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_04ab: ldstr "ConfigEntry_Eikthyr_Shared_MaxFallSpeed"
IL_04b0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_MaxFallSpeed
IL_04b5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_04ba: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_04bf: ldstr "ConfigEntry_Eikthyr_Shared_EquipmentSpeedModifier"
IL_04c4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_EquipmentSpeedModifier
IL_04c9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_04ce: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_04d3: ldstr "ConfigEntry_Eikthyr_Shared_WindSpeedModifier"
IL_04d8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_WindSpeedModifier
IL_04dd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_04e2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_04e7: ldstr "ConfigEntry_Eikthyr_Shared_RunStaminaCostModifier"
IL_04ec: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_RunStaminaCostModifier
IL_04f1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_04f6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_04fb: ldstr "ConfigEntry_Eikthyr_Shared_JumpStaminaCostModifier"
IL_0500: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_JumpStaminaCostModifier
IL_0505: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_050a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_050f: ldstr "ConfigEntry_Eikthyr_Shared_StealthModifier"
IL_0514: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_StealthModifier
IL_0519: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_051e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0523: ldstr "ConfigEntry_Eikthyr_Shared_NoiseModifier"
IL_0528: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_NoiseModifier
IL_052d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0532: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0537: ldstr "ConfigEntry_Eikthyr_Shared_StatusAttributes"
IL_053c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_StatusAttributes
IL_0541: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0546: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_054b: ldstr "ConfigEntry_Eikthyr_Shared_OutgoingDamageTypes"
IL_0550: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_OutgoingDamageTypes
IL_0555: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_055a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_055f: ldstr "ConfigEntry_Eikthyr_Shared_OutgoingDamageModifiers"
IL_0564: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_OutgoingDamageModifiers
IL_0569: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_056e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0573: ldstr "ConfigEntry_Eikthyr_Shared_FallDamageModifier"
IL_0578: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_FallDamageModifier
IL_057d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0582: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0587: ldstr "ConfigEntry_Eikthyr_Shared_IncomingDamageTypes"
IL_058c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_IncomingDamageTypes
IL_0591: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0596: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_059b: ldstr "ConfigEntry_Eikthyr_Shared_IncomingDamageModifiers"
IL_05a0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_IncomingDamageModifiers
IL_05a5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_05aa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_05af: ldstr "ConfigEntry_Eikthyr_Shared_HeatDamageModifier"
IL_05b4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Shared_HeatDamageModifier
IL_05b9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_05be: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_05c3: ldstr "ConfigEntry_Eikthyr_Equipped_MaxHealth"
IL_05c8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_MaxHealth
IL_05cd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_05d2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_05d7: ldstr "ConfigEntry_Eikthyr_Equipped_HealthRegen"
IL_05dc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_HealthRegen
IL_05e1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_05e6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_05eb: ldstr "ConfigEntry_Eikthyr_Equipped_HealthRegenModifier"
IL_05f0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_HealthRegenModifier
IL_05f5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_05fa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_05ff: ldstr "ConfigEntry_Eikthyr_Equipped_MaxStamina"
IL_0604: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_MaxStamina
IL_0609: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_060e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0613: ldstr "ConfigEntry_Eikthyr_Equipped_StaminaRegenModifier"
IL_0618: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_StaminaRegenModifier
IL_061d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0622: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0627: ldstr "ConfigEntry_Eikthyr_Equipped_MaxEitr"
IL_062c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_MaxEitr
IL_0631: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0636: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_063b: ldstr "ConfigEntry_Eikthyr_Equipped_EitrRegenModifier"
IL_0640: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_EitrRegenModifier
IL_0645: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_064a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_064f: ldstr "ConfigEntry_Eikthyr_Equipped_MaxWeight"
IL_0654: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_MaxWeight
IL_0659: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_065e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0663: ldstr "ConfigEntry_Eikthyr_Equipped_MoveSpeedModifier"
IL_0668: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_MoveSpeedModifier
IL_066d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0672: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0677: ldstr "ConfigEntry_Eikthyr_Equipped_JumpForceModifier"
IL_067c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_JumpForceModifier
IL_0681: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0686: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_068b: ldstr "ConfigEntry_Eikthyr_Equipped_MaxFallSpeed"
IL_0690: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_MaxFallSpeed
IL_0695: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_069a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_069f: ldstr "ConfigEntry_Eikthyr_Equipped_EquipmentSpeedModifier"
IL_06a4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_EquipmentSpeedModifier
IL_06a9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_06ae: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_06b3: ldstr "ConfigEntry_Eikthyr_Equipped_WindSpeedModifier"
IL_06b8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_WindSpeedModifier
IL_06bd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_06c2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_06c7: ldstr "ConfigEntry_Eikthyr_Equipped_RunStaminaCostModifier"
IL_06cc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_RunStaminaCostModifier
IL_06d1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_06d6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_06db: ldstr "ConfigEntry_Eikthyr_Equipped_JumpStaminaCostModifier"
IL_06e0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_JumpStaminaCostModifier
IL_06e5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_06ea: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_06ef: ldstr "ConfigEntry_Eikthyr_Equipped_StealthModifier"
IL_06f4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_StealthModifier
IL_06f9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_06fe: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0703: ldstr "ConfigEntry_Eikthyr_Equipped_NoiseModifier"
IL_0708: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_NoiseModifier
IL_070d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0712: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0717: ldstr "ConfigEntry_Eikthyr_Equipped_StatusAttributes"
IL_071c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_StatusAttributes
IL_0721: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0726: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_072b: ldstr "ConfigEntry_Eikthyr_Equipped_OutgoingDamageTypes"
IL_0730: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_OutgoingDamageTypes
IL_0735: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_073a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_073f: ldstr "ConfigEntry_Eikthyr_Equipped_OutgoingDamageModifiers"
IL_0744: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_OutgoingDamageModifiers
IL_0749: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_074e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0753: ldstr "ConfigEntry_Eikthyr_Equipped_FallDamageModifier"
IL_0758: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_FallDamageModifier
IL_075d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0762: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0767: ldstr "ConfigEntry_Eikthyr_Equipped_IncomingDamageTypes"
IL_076c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_IncomingDamageTypes
IL_0771: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0776: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_077b: ldstr "ConfigEntry_Eikthyr_Equipped_IncomingDamageModifiers"
IL_0780: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_IncomingDamageModifiers
IL_0785: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_078a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_078f: ldstr "ConfigEntry_Eikthyr_Equipped_HeatDamageModifier"
IL_0794: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Eikthyr_Equipped_HeatDamageModifier
IL_0799: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_079e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_07a3: ldstr "ConfigEntry_TheElder_Passive_MaxHealth"
IL_07a8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_MaxHealth
IL_07ad: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_07b2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_07b7: ldstr "ConfigEntry_TheElder_Passive_HealthRegen"
IL_07bc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_HealthRegen
IL_07c1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_07c6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_07cb: ldstr "ConfigEntry_TheElder_Passive_HealthRegenModifier"
IL_07d0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_HealthRegenModifier
IL_07d5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_07da: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_07df: ldstr "ConfigEntry_TheElder_Passive_MaxStamina"
IL_07e4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_MaxStamina
IL_07e9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_07ee: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_07f3: ldstr "ConfigEntry_TheElder_Passive_StaminaRegenModifier"
IL_07f8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_StaminaRegenModifier
IL_07fd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0802: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0807: ldstr "ConfigEntry_TheElder_Passive_MaxEitr"
IL_080c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_MaxEitr
IL_0811: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0816: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_081b: ldstr "ConfigEntry_TheElder_Passive_EitrRegenModifier"
IL_0820: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_EitrRegenModifier
IL_0825: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_082a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_082f: ldstr "ConfigEntry_TheElder_Passive_MaxWeight"
IL_0834: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_MaxWeight
IL_0839: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_083e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0843: ldstr "ConfigEntry_TheElder_Passive_MoveSpeedModifier"
IL_0848: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_MoveSpeedModifier
IL_084d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0852: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0857: ldstr "ConfigEntry_TheElder_Passive_JumpForceModifier"
IL_085c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_JumpForceModifier
IL_0861: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0866: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_086b: ldstr "ConfigEntry_TheElder_Passive_MaxFallSpeed"
IL_0870: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_MaxFallSpeed
IL_0875: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_087a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_087f: ldstr "ConfigEntry_TheElder_Passive_EquipmentSpeedModifier"
IL_0884: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_EquipmentSpeedModifier
IL_0889: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_088e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0893: ldstr "ConfigEntry_TheElder_Passive_WindSpeedModifier"
IL_0898: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_WindSpeedModifier
IL_089d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_08a2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_08a7: ldstr "ConfigEntry_TheElder_Passive_RunStaminaCostModifier"
IL_08ac: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_RunStaminaCostModifier
IL_08b1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_08b6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_08bb: ldstr "ConfigEntry_TheElder_Passive_JumpStaminaCostModifier"
IL_08c0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_JumpStaminaCostModifier
IL_08c5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_08ca: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_08cf: ldstr "ConfigEntry_TheElder_Passive_StealthModifier"
IL_08d4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_StealthModifier
IL_08d9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_08de: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_08e3: ldstr "ConfigEntry_TheElder_Passive_NoiseModifier"
IL_08e8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_NoiseModifier
IL_08ed: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_08f2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_08f7: ldstr "ConfigEntry_TheElder_Passive_StatusAttributes"
IL_08fc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_StatusAttributes
IL_0901: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0906: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_090b: ldstr "ConfigEntry_TheElder_Passive_OutgoingDamageTypes"
IL_0910: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_OutgoingDamageTypes
IL_0915: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_091a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_091f: ldstr "ConfigEntry_TheElder_Passive_OutgoingDamageModifiers"
IL_0924: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_OutgoingDamageModifiers
IL_0929: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_092e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0933: ldstr "ConfigEntry_TheElder_Passive_FallDamageModifier"
IL_0938: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_FallDamageModifier
IL_093d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0942: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0947: ldstr "ConfigEntry_TheElder_Passive_IncomingDamageTypes"
IL_094c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_IncomingDamageTypes
IL_0951: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0956: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_095b: ldstr "ConfigEntry_TheElder_Passive_IncomingDamageModifiers"
IL_0960: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_IncomingDamageModifiers
IL_0965: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_096a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_096f: ldstr "ConfigEntry_TheElder_Passive_HeatDamageModifier"
IL_0974: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Passive_HeatDamageModifier
IL_0979: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_097e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0983: ldstr "ConfigEntry_TheElder_Active_MaxHealth"
IL_0988: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_MaxHealth
IL_098d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0992: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0997: ldstr "ConfigEntry_TheElder_Active_HealthRegen"
IL_099c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_HealthRegen
IL_09a1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_09a6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_09ab: ldstr "ConfigEntry_TheElder_Active_HealthRegenModifier"
IL_09b0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_HealthRegenModifier
IL_09b5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_09ba: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_09bf: ldstr "ConfigEntry_TheElder_Active_MaxStamina"
IL_09c4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_MaxStamina
IL_09c9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_09ce: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_09d3: ldstr "ConfigEntry_TheElder_Active_StaminaRegenModifier"
IL_09d8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_StaminaRegenModifier
IL_09dd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_09e2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_09e7: ldstr "ConfigEntry_TheElder_Active_MaxEitr"
IL_09ec: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_MaxEitr
IL_09f1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_09f6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_09fb: ldstr "ConfigEntry_TheElder_Active_EitrRegenModifier"
IL_0a00: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_EitrRegenModifier
IL_0a05: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0a0a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0a0f: ldstr "ConfigEntry_TheElder_Active_MaxWeight"
IL_0a14: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_MaxWeight
IL_0a19: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0a1e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0a23: ldstr "ConfigEntry_TheElder_Active_MoveSpeedModifier"
IL_0a28: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_MoveSpeedModifier
IL_0a2d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0a32: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0a37: ldstr "ConfigEntry_TheElder_Active_JumpForceModifier"
IL_0a3c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_JumpForceModifier
IL_0a41: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0a46: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0a4b: ldstr "ConfigEntry_TheElder_Active_MaxFallSpeed"
IL_0a50: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_MaxFallSpeed
IL_0a55: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0a5a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0a5f: ldstr "ConfigEntry_TheElder_Active_EquipmentSpeedModifier"
IL_0a64: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_EquipmentSpeedModifier
IL_0a69: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0a6e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0a73: ldstr "ConfigEntry_TheElder_Active_WindSpeedModifier"
IL_0a78: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_WindSpeedModifier
IL_0a7d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0a82: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0a87: ldstr "ConfigEntry_TheElder_Active_RunStaminaCostModifier"
IL_0a8c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_RunStaminaCostModifier
IL_0a91: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0a96: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0a9b: ldstr "ConfigEntry_TheElder_Active_JumpStaminaCostModifier"
IL_0aa0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_JumpStaminaCostModifier
IL_0aa5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0aaa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0aaf: ldstr "ConfigEntry_TheElder_Active_StealthModifier"
IL_0ab4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_StealthModifier
IL_0ab9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0abe: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0ac3: ldstr "ConfigEntry_TheElder_Active_NoiseModifier"
IL_0ac8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_NoiseModifier
IL_0acd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0ad2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0ad7: ldstr "ConfigEntry_TheElder_Active_StatusAttributes"
IL_0adc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_StatusAttributes
IL_0ae1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0ae6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0aeb: ldstr "ConfigEntry_TheElder_Active_OutgoingDamageTypes"
IL_0af0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_OutgoingDamageTypes
IL_0af5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0afa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0aff: ldstr "ConfigEntry_TheElder_Active_OutgoingDamageModifiers"
IL_0b04: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_OutgoingDamageModifiers
IL_0b09: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0b0e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0b13: ldstr "ConfigEntry_TheElder_Active_FallDamageModifier"
IL_0b18: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_FallDamageModifier
IL_0b1d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0b22: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0b27: ldstr "ConfigEntry_TheElder_Active_IncomingDamageTypes"
IL_0b2c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_IncomingDamageTypes
IL_0b31: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0b36: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0b3b: ldstr "ConfigEntry_TheElder_Active_IncomingDamageModifiers"
IL_0b40: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_IncomingDamageModifiers
IL_0b45: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0b4a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0b4f: ldstr "ConfigEntry_TheElder_Active_HeatDamageModifier"
IL_0b54: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Active_HeatDamageModifier
IL_0b59: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0b5e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0b63: ldstr "ConfigEntry_TheElder_Shared_MaxHealth"
IL_0b68: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_MaxHealth
IL_0b6d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0b72: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0b77: ldstr "ConfigEntry_TheElder_Shared_HealthRegen"
IL_0b7c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_HealthRegen
IL_0b81: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0b86: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0b8b: ldstr "ConfigEntry_TheElder_Shared_HealthRegenModifier"
IL_0b90: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_HealthRegenModifier
IL_0b95: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0b9a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0b9f: ldstr "ConfigEntry_TheElder_Shared_MaxStamina"
IL_0ba4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_MaxStamina
IL_0ba9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0bae: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0bb3: ldstr "ConfigEntry_TheElder_Shared_StaminaRegenModifier"
IL_0bb8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_StaminaRegenModifier
IL_0bbd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0bc2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0bc7: ldstr "ConfigEntry_TheElder_Shared_MaxEitr"
IL_0bcc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_MaxEitr
IL_0bd1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0bd6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0bdb: ldstr "ConfigEntry_TheElder_Shared_EitrRegenModifier"
IL_0be0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_EitrRegenModifier
IL_0be5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0bea: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0bef: ldstr "ConfigEntry_TheElder_Shared_MaxWeight"
IL_0bf4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_MaxWeight
IL_0bf9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0bfe: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0c03: ldstr "ConfigEntry_TheElder_Shared_MoveSpeedModifier"
IL_0c08: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_MoveSpeedModifier
IL_0c0d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0c12: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0c17: ldstr "ConfigEntry_TheElder_Shared_JumpForceModifier"
IL_0c1c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_JumpForceModifier
IL_0c21: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0c26: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0c2b: ldstr "ConfigEntry_TheElder_Shared_MaxFallSpeed"
IL_0c30: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_MaxFallSpeed
IL_0c35: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0c3a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0c3f: ldstr "ConfigEntry_TheElder_Shared_EquipmentSpeedModifier"
IL_0c44: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_EquipmentSpeedModifier
IL_0c49: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0c4e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0c53: ldstr "ConfigEntry_TheElder_Shared_WindSpeedModifier"
IL_0c58: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_WindSpeedModifier
IL_0c5d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0c62: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0c67: ldstr "ConfigEntry_TheElder_Shared_RunStaminaCostModifier"
IL_0c6c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_RunStaminaCostModifier
IL_0c71: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0c76: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0c7b: ldstr "ConfigEntry_TheElder_Shared_JumpStaminaCostModifier"
IL_0c80: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_JumpStaminaCostModifier
IL_0c85: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0c8a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0c8f: ldstr "ConfigEntry_TheElder_Shared_StealthModifier"
IL_0c94: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_StealthModifier
IL_0c99: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0c9e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0ca3: ldstr "ConfigEntry_TheElder_Shared_NoiseModifier"
IL_0ca8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_NoiseModifier
IL_0cad: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0cb2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0cb7: ldstr "ConfigEntry_TheElder_Shared_StatusAttributes"
IL_0cbc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_StatusAttributes
IL_0cc1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0cc6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0ccb: ldstr "ConfigEntry_TheElder_Shared_OutgoingDamageTypes"
IL_0cd0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_OutgoingDamageTypes
IL_0cd5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0cda: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0cdf: ldstr "ConfigEntry_TheElder_Shared_OutgoingDamageModifiers"
IL_0ce4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_OutgoingDamageModifiers
IL_0ce9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0cee: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0cf3: ldstr "ConfigEntry_TheElder_Shared_FallDamageModifier"
IL_0cf8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_FallDamageModifier
IL_0cfd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0d02: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0d07: ldstr "ConfigEntry_TheElder_Shared_IncomingDamageTypes"
IL_0d0c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_IncomingDamageTypes
IL_0d11: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0d16: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0d1b: ldstr "ConfigEntry_TheElder_Shared_IncomingDamageModifiers"
IL_0d20: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_IncomingDamageModifiers
IL_0d25: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0d2a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0d2f: ldstr "ConfigEntry_TheElder_Shared_HeatDamageModifier"
IL_0d34: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Shared_HeatDamageModifier
IL_0d39: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0d3e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0d43: ldstr "ConfigEntry_TheElder_Equipped_MaxHealth"
IL_0d48: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_MaxHealth
IL_0d4d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0d52: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0d57: ldstr "ConfigEntry_TheElder_Equipped_HealthRegen"
IL_0d5c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_HealthRegen
IL_0d61: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0d66: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0d6b: ldstr "ConfigEntry_TheElder_Equipped_HealthRegenModifier"
IL_0d70: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_HealthRegenModifier
IL_0d75: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0d7a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0d7f: ldstr "ConfigEntry_TheElder_Equipped_MaxStamina"
IL_0d84: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_MaxStamina
IL_0d89: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0d8e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0d93: ldstr "ConfigEntry_TheElder_Equipped_StaminaRegenModifier"
IL_0d98: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_StaminaRegenModifier
IL_0d9d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0da2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0da7: ldstr "ConfigEntry_TheElder_Equipped_MaxEitr"
IL_0dac: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_MaxEitr
IL_0db1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0db6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0dbb: ldstr "ConfigEntry_TheElder_Equipped_EitrRegenModifier"
IL_0dc0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_EitrRegenModifier
IL_0dc5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0dca: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0dcf: ldstr "ConfigEntry_TheElder_Equipped_MaxWeight"
IL_0dd4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_MaxWeight
IL_0dd9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0dde: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0de3: ldstr "ConfigEntry_TheElder_Equipped_MoveSpeedModifier"
IL_0de8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_MoveSpeedModifier
IL_0ded: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0df2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0df7: ldstr "ConfigEntry_TheElder_Equipped_JumpForceModifier"
IL_0dfc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_JumpForceModifier
IL_0e01: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0e06: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0e0b: ldstr "ConfigEntry_TheElder_Equipped_MaxFallSpeed"
IL_0e10: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_MaxFallSpeed
IL_0e15: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0e1a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0e1f: ldstr "ConfigEntry_TheElder_Equipped_EquipmentSpeedModifier"
IL_0e24: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_EquipmentSpeedModifier
IL_0e29: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0e2e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0e33: ldstr "ConfigEntry_TheElder_Equipped_WindSpeedModifier"
IL_0e38: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_WindSpeedModifier
IL_0e3d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0e42: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0e47: ldstr "ConfigEntry_TheElder_Equipped_RunStaminaCostModifier"
IL_0e4c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_RunStaminaCostModifier
IL_0e51: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0e56: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0e5b: ldstr "ConfigEntry_TheElder_Equipped_JumpStaminaCostModifier"
IL_0e60: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_JumpStaminaCostModifier
IL_0e65: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0e6a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0e6f: ldstr "ConfigEntry_TheElder_Equipped_StealthModifier"
IL_0e74: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_StealthModifier
IL_0e79: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0e7e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0e83: ldstr "ConfigEntry_TheElder_Equipped_NoiseModifier"
IL_0e88: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_NoiseModifier
IL_0e8d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0e92: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0e97: ldstr "ConfigEntry_TheElder_Equipped_StatusAttributes"
IL_0e9c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_StatusAttributes
IL_0ea1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0ea6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0eab: ldstr "ConfigEntry_TheElder_Equipped_OutgoingDamageTypes"
IL_0eb0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_OutgoingDamageTypes
IL_0eb5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0eba: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0ebf: ldstr "ConfigEntry_TheElder_Equipped_OutgoingDamageModifiers"
IL_0ec4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_OutgoingDamageModifiers
IL_0ec9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0ece: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0ed3: ldstr "ConfigEntry_TheElder_Equipped_FallDamageModifier"
IL_0ed8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_FallDamageModifier
IL_0edd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0ee2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0ee7: ldstr "ConfigEntry_TheElder_Equipped_IncomingDamageTypes"
IL_0eec: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_IncomingDamageTypes
IL_0ef1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0ef6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0efb: ldstr "ConfigEntry_TheElder_Equipped_IncomingDamageModifiers"
IL_0f00: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_IncomingDamageModifiers
IL_0f05: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_0f0a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0f0f: ldstr "ConfigEntry_TheElder_Equipped_HeatDamageModifier"
IL_0f14: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_TheElder_Equipped_HeatDamageModifier
IL_0f19: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0f1e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0f23: ldstr "ConfigEntry_Bonemass_Passive_MaxHealth"
IL_0f28: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_MaxHealth
IL_0f2d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0f32: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0f37: ldstr "ConfigEntry_Bonemass_Passive_HealthRegen"
IL_0f3c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_HealthRegen
IL_0f41: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0f46: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0f4b: ldstr "ConfigEntry_Bonemass_Passive_HealthRegenModifier"
IL_0f50: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_HealthRegenModifier
IL_0f55: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0f5a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0f5f: ldstr "ConfigEntry_Bonemass_Passive_MaxStamina"
IL_0f64: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_MaxStamina
IL_0f69: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0f6e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0f73: ldstr "ConfigEntry_Bonemass_Passive_StaminaRegenModifier"
IL_0f78: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_StaminaRegenModifier
IL_0f7d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0f82: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0f87: ldstr "ConfigEntry_Bonemass_Passive_MaxEitr"
IL_0f8c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_MaxEitr
IL_0f91: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0f96: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0f9b: ldstr "ConfigEntry_Bonemass_Passive_EitrRegenModifier"
IL_0fa0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_EitrRegenModifier
IL_0fa5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0faa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0faf: ldstr "ConfigEntry_Bonemass_Passive_MaxWeight"
IL_0fb4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_MaxWeight
IL_0fb9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_0fbe: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0fc3: ldstr "ConfigEntry_Bonemass_Passive_MoveSpeedModifier"
IL_0fc8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_MoveSpeedModifier
IL_0fcd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0fd2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0fd7: ldstr "ConfigEntry_Bonemass_Passive_JumpForceModifier"
IL_0fdc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_JumpForceModifier
IL_0fe1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0fe6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0feb: ldstr "ConfigEntry_Bonemass_Passive_MaxFallSpeed"
IL_0ff0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_MaxFallSpeed
IL_0ff5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_0ffa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0fff: ldstr "ConfigEntry_Bonemass_Passive_EquipmentSpeedModifier"
IL_1004: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_EquipmentSpeedModifier
IL_1009: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_100e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1013: ldstr "ConfigEntry_Bonemass_Passive_WindSpeedModifier"
IL_1018: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_WindSpeedModifier
IL_101d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1022: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1027: ldstr "ConfigEntry_Bonemass_Passive_RunStaminaCostModifier"
IL_102c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_RunStaminaCostModifier
IL_1031: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1036: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_103b: ldstr "ConfigEntry_Bonemass_Passive_JumpStaminaCostModifier"
IL_1040: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_JumpStaminaCostModifier
IL_1045: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_104a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_104f: ldstr "ConfigEntry_Bonemass_Passive_StealthModifier"
IL_1054: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_StealthModifier
IL_1059: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_105e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1063: ldstr "ConfigEntry_Bonemass_Passive_NoiseModifier"
IL_1068: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_NoiseModifier
IL_106d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1072: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1077: ldstr "ConfigEntry_Bonemass_Passive_StatusAttributes"
IL_107c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_StatusAttributes
IL_1081: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1086: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_108b: ldstr "ConfigEntry_Bonemass_Passive_OutgoingDamageTypes"
IL_1090: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_OutgoingDamageTypes
IL_1095: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_109a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_109f: ldstr "ConfigEntry_Bonemass_Passive_OutgoingDamageModifiers"
IL_10a4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_OutgoingDamageModifiers
IL_10a9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_10ae: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_10b3: ldstr "ConfigEntry_Bonemass_Passive_FallDamageModifier"
IL_10b8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_FallDamageModifier
IL_10bd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_10c2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_10c7: ldstr "ConfigEntry_Bonemass_Passive_IncomingDamageTypes"
IL_10cc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_IncomingDamageTypes
IL_10d1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_10d6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_10db: ldstr "ConfigEntry_Bonemass_Passive_IncomingDamageModifiers"
IL_10e0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_IncomingDamageModifiers
IL_10e5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_10ea: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_10ef: ldstr "ConfigEntry_Bonemass_Passive_HeatDamageModifier"
IL_10f4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Passive_HeatDamageModifier
IL_10f9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_10fe: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1103: ldstr "ConfigEntry_Bonemass_Active_MaxHealth"
IL_1108: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_MaxHealth
IL_110d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1112: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1117: ldstr "ConfigEntry_Bonemass_Active_HealthRegen"
IL_111c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_HealthRegen
IL_1121: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1126: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_112b: ldstr "ConfigEntry_Bonemass_Active_HealthRegenModifier"
IL_1130: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_HealthRegenModifier
IL_1135: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_113a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_113f: ldstr "ConfigEntry_Bonemass_Active_MaxStamina"
IL_1144: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_MaxStamina
IL_1149: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_114e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1153: ldstr "ConfigEntry_Bonemass_Active_StaminaRegenModifier"
IL_1158: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_StaminaRegenModifier
IL_115d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1162: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1167: ldstr "ConfigEntry_Bonemass_Active_MaxEitr"
IL_116c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_MaxEitr
IL_1171: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1176: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_117b: ldstr "ConfigEntry_Bonemass_Active_EitrRegenModifier"
IL_1180: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_EitrRegenModifier
IL_1185: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_118a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_118f: ldstr "ConfigEntry_Bonemass_Active_MaxWeight"
IL_1194: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_MaxWeight
IL_1199: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_119e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_11a3: ldstr "ConfigEntry_Bonemass_Active_MoveSpeedModifier"
IL_11a8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_MoveSpeedModifier
IL_11ad: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_11b2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_11b7: ldstr "ConfigEntry_Bonemass_Active_JumpForceModifier"
IL_11bc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_JumpForceModifier
IL_11c1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_11c6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_11cb: ldstr "ConfigEntry_Bonemass_Active_MaxFallSpeed"
IL_11d0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_MaxFallSpeed
IL_11d5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_11da: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_11df: ldstr "ConfigEntry_Bonemass_Active_EquipmentSpeedModifier"
IL_11e4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_EquipmentSpeedModifier
IL_11e9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_11ee: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_11f3: ldstr "ConfigEntry_Bonemass_Active_WindSpeedModifier"
IL_11f8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_WindSpeedModifier
IL_11fd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1202: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1207: ldstr "ConfigEntry_Bonemass_Active_RunStaminaCostModifier"
IL_120c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_RunStaminaCostModifier
IL_1211: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1216: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_121b: ldstr "ConfigEntry_Bonemass_Active_JumpStaminaCostModifier"
IL_1220: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_JumpStaminaCostModifier
IL_1225: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_122a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_122f: ldstr "ConfigEntry_Bonemass_Active_StealthModifier"
IL_1234: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_StealthModifier
IL_1239: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_123e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1243: ldstr "ConfigEntry_Bonemass_Active_NoiseModifier"
IL_1248: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_NoiseModifier
IL_124d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1252: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1257: ldstr "ConfigEntry_Bonemass_Active_StatusAttributes"
IL_125c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_StatusAttributes
IL_1261: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1266: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_126b: ldstr "ConfigEntry_Bonemass_Active_OutgoingDamageTypes"
IL_1270: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_OutgoingDamageTypes
IL_1275: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_127a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_127f: ldstr "ConfigEntry_Bonemass_Active_OutgoingDamageModifiers"
IL_1284: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_OutgoingDamageModifiers
IL_1289: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_128e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1293: ldstr "ConfigEntry_Bonemass_Active_FallDamageModifier"
IL_1298: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_FallDamageModifier
IL_129d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_12a2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_12a7: ldstr "ConfigEntry_Bonemass_Active_IncomingDamageTypes"
IL_12ac: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_IncomingDamageTypes
IL_12b1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_12b6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_12bb: ldstr "ConfigEntry_Bonemass_Active_IncomingDamageModifiers"
IL_12c0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_IncomingDamageModifiers
IL_12c5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_12ca: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_12cf: ldstr "ConfigEntry_Bonemass_Active_HeatDamageModifier"
IL_12d4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Active_HeatDamageModifier
IL_12d9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_12de: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_12e3: ldstr "ConfigEntry_Bonemass_Shared_MaxHealth"
IL_12e8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_MaxHealth
IL_12ed: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_12f2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_12f7: ldstr "ConfigEntry_Bonemass_Shared_HealthRegen"
IL_12fc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_HealthRegen
IL_1301: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1306: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_130b: ldstr "ConfigEntry_Bonemass_Shared_HealthRegenModifier"
IL_1310: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_HealthRegenModifier
IL_1315: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_131a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_131f: ldstr "ConfigEntry_Bonemass_Shared_MaxStamina"
IL_1324: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_MaxStamina
IL_1329: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_132e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1333: ldstr "ConfigEntry_Bonemass_Shared_StaminaRegenModifier"
IL_1338: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_StaminaRegenModifier
IL_133d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1342: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1347: ldstr "ConfigEntry_Bonemass_Shared_MaxEitr"
IL_134c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_MaxEitr
IL_1351: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1356: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_135b: ldstr "ConfigEntry_Bonemass_Shared_EitrRegenModifier"
IL_1360: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_EitrRegenModifier
IL_1365: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_136a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_136f: ldstr "ConfigEntry_Bonemass_Shared_MaxWeight"
IL_1374: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_MaxWeight
IL_1379: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_137e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1383: ldstr "ConfigEntry_Bonemass_Shared_MoveSpeedModifier"
IL_1388: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_MoveSpeedModifier
IL_138d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1392: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1397: ldstr "ConfigEntry_Bonemass_Shared_JumpForceModifier"
IL_139c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_JumpForceModifier
IL_13a1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_13a6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_13ab: ldstr "ConfigEntry_Bonemass_Shared_MaxFallSpeed"
IL_13b0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_MaxFallSpeed
IL_13b5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_13ba: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_13bf: ldstr "ConfigEntry_Bonemass_Shared_EquipmentSpeedModifier"
IL_13c4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_EquipmentSpeedModifier
IL_13c9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_13ce: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_13d3: ldstr "ConfigEntry_Bonemass_Shared_WindSpeedModifier"
IL_13d8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_WindSpeedModifier
IL_13dd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_13e2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_13e7: ldstr "ConfigEntry_Bonemass_Shared_RunStaminaCostModifier"
IL_13ec: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_RunStaminaCostModifier
IL_13f1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_13f6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_13fb: ldstr "ConfigEntry_Bonemass_Shared_JumpStaminaCostModifier"
IL_1400: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_JumpStaminaCostModifier
IL_1405: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_140a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_140f: ldstr "ConfigEntry_Bonemass_Shared_StealthModifier"
IL_1414: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_StealthModifier
IL_1419: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_141e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1423: ldstr "ConfigEntry_Bonemass_Shared_NoiseModifier"
IL_1428: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_NoiseModifier
IL_142d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1432: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1437: ldstr "ConfigEntry_Bonemass_Shared_StatusAttributes"
IL_143c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_StatusAttributes
IL_1441: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1446: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_144b: ldstr "ConfigEntry_Bonemass_Shared_OutgoingDamageTypes"
IL_1450: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_OutgoingDamageTypes
IL_1455: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_145a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_145f: ldstr "ConfigEntry_Bonemass_Shared_OutgoingDamageModifiers"
IL_1464: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_OutgoingDamageModifiers
IL_1469: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_146e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1473: ldstr "ConfigEntry_Bonemass_Shared_FallDamageModifier"
IL_1478: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_FallDamageModifier
IL_147d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1482: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1487: ldstr "ConfigEntry_Bonemass_Shared_IncomingDamageTypes"
IL_148c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_IncomingDamageTypes
IL_1491: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1496: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_149b: ldstr "ConfigEntry_Bonemass_Shared_IncomingDamageModifiers"
IL_14a0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_IncomingDamageModifiers
IL_14a5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_14aa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_14af: ldstr "ConfigEntry_Bonemass_Shared_HeatDamageModifier"
IL_14b4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Shared_HeatDamageModifier
IL_14b9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_14be: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_14c3: ldstr "ConfigEntry_Bonemass_Equipped_MaxHealth"
IL_14c8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_MaxHealth
IL_14cd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_14d2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_14d7: ldstr "ConfigEntry_Bonemass_Equipped_HealthRegen"
IL_14dc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_HealthRegen
IL_14e1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_14e6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_14eb: ldstr "ConfigEntry_Bonemass_Equipped_HealthRegenModifier"
IL_14f0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_HealthRegenModifier
IL_14f5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_14fa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_14ff: ldstr "ConfigEntry_Bonemass_Equipped_MaxStamina"
IL_1504: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_MaxStamina
IL_1509: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_150e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1513: ldstr "ConfigEntry_Bonemass_Equipped_StaminaRegenModifier"
IL_1518: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_StaminaRegenModifier
IL_151d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1522: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1527: ldstr "ConfigEntry_Bonemass_Equipped_MaxEitr"
IL_152c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_MaxEitr
IL_1531: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1536: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_153b: ldstr "ConfigEntry_Bonemass_Equipped_EitrRegenModifier"
IL_1540: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_EitrRegenModifier
IL_1545: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_154a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_154f: ldstr "ConfigEntry_Bonemass_Equipped_MaxWeight"
IL_1554: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_MaxWeight
IL_1559: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_155e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1563: ldstr "ConfigEntry_Bonemass_Equipped_MoveSpeedModifier"
IL_1568: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_MoveSpeedModifier
IL_156d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1572: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1577: ldstr "ConfigEntry_Bonemass_Equipped_JumpForceModifier"
IL_157c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_JumpForceModifier
IL_1581: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1586: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_158b: ldstr "ConfigEntry_Bonemass_Equipped_MaxFallSpeed"
IL_1590: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_MaxFallSpeed
IL_1595: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_159a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_159f: ldstr "ConfigEntry_Bonemass_Equipped_EquipmentSpeedModifier"
IL_15a4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_EquipmentSpeedModifier
IL_15a9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_15ae: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_15b3: ldstr "ConfigEntry_Bonemass_Equipped_WindSpeedModifier"
IL_15b8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_WindSpeedModifier
IL_15bd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_15c2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_15c7: ldstr "ConfigEntry_Bonemass_Equipped_RunStaminaCostModifier"
IL_15cc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_RunStaminaCostModifier
IL_15d1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_15d6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_15db: ldstr "ConfigEntry_Bonemass_Equipped_JumpStaminaCostModifier"
IL_15e0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_JumpStaminaCostModifier
IL_15e5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_15ea: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_15ef: ldstr "ConfigEntry_Bonemass_Equipped_StealthModifier"
IL_15f4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_StealthModifier
IL_15f9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_15fe: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1603: ldstr "ConfigEntry_Bonemass_Equipped_NoiseModifier"
IL_1608: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_NoiseModifier
IL_160d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1612: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1617: ldstr "ConfigEntry_Bonemass_Equipped_StatusAttributes"
IL_161c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_StatusAttributes
IL_1621: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1626: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_162b: ldstr "ConfigEntry_Bonemass_Equipped_OutgoingDamageTypes"
IL_1630: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_OutgoingDamageTypes
IL_1635: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_163a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_163f: ldstr "ConfigEntry_Bonemass_Equipped_OutgoingDamageModifiers"
IL_1644: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_OutgoingDamageModifiers
IL_1649: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_164e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1653: ldstr "ConfigEntry_Bonemass_Equipped_FallDamageModifier"
IL_1658: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_FallDamageModifier
IL_165d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1662: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1667: ldstr "ConfigEntry_Bonemass_Equipped_IncomingDamageTypes"
IL_166c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_IncomingDamageTypes
IL_1671: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1676: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_167b: ldstr "ConfigEntry_Bonemass_Equipped_IncomingDamageModifiers"
IL_1680: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_IncomingDamageModifiers
IL_1685: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_168a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_168f: ldstr "ConfigEntry_Bonemass_Equipped_HeatDamageModifier"
IL_1694: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Bonemass_Equipped_HeatDamageModifier
IL_1699: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_169e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_16a3: ldstr "ConfigEntry_Moder_Passive_MaxHealth"
IL_16a8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_MaxHealth
IL_16ad: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_16b2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_16b7: ldstr "ConfigEntry_Moder_Passive_HealthRegen"
IL_16bc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_HealthRegen
IL_16c1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_16c6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_16cb: ldstr "ConfigEntry_Moder_Passive_HealthRegenModifier"
IL_16d0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_HealthRegenModifier
IL_16d5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_16da: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_16df: ldstr "ConfigEntry_Moder_Passive_MaxStamina"
IL_16e4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_MaxStamina
IL_16e9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_16ee: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_16f3: ldstr "ConfigEntry_Moder_Passive_StaminaRegenModifier"
IL_16f8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_StaminaRegenModifier
IL_16fd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1702: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1707: ldstr "ConfigEntry_Moder_Passive_MaxEitr"
IL_170c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_MaxEitr
IL_1711: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1716: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_171b: ldstr "ConfigEntry_Moder_Passive_EitrRegenModifier"
IL_1720: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_EitrRegenModifier
IL_1725: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_172a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_172f: ldstr "ConfigEntry_Moder_Passive_MaxWeight"
IL_1734: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_MaxWeight
IL_1739: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_173e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1743: ldstr "ConfigEntry_Moder_Passive_MoveSpeedModifier"
IL_1748: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_MoveSpeedModifier
IL_174d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1752: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1757: ldstr "ConfigEntry_Moder_Passive_JumpForceModifier"
IL_175c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_JumpForceModifier
IL_1761: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1766: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_176b: ldstr "ConfigEntry_Moder_Passive_MaxFallSpeed"
IL_1770: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_MaxFallSpeed
IL_1775: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_177a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_177f: ldstr "ConfigEntry_Moder_Passive_EquipmentSpeedModifier"
IL_1784: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_EquipmentSpeedModifier
IL_1789: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_178e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1793: ldstr "ConfigEntry_Moder_Passive_WindSpeedModifier"
IL_1798: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_WindSpeedModifier
IL_179d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_17a2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_17a7: ldstr "ConfigEntry_Moder_Passive_RunStaminaCostModifier"
IL_17ac: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_RunStaminaCostModifier
IL_17b1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_17b6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_17bb: ldstr "ConfigEntry_Moder_Passive_JumpStaminaCostModifier"
IL_17c0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_JumpStaminaCostModifier
IL_17c5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_17ca: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_17cf: ldstr "ConfigEntry_Moder_Passive_StealthModifier"
IL_17d4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_StealthModifier
IL_17d9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_17de: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_17e3: ldstr "ConfigEntry_Moder_Passive_NoiseModifier"
IL_17e8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_NoiseModifier
IL_17ed: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_17f2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_17f7: ldstr "ConfigEntry_Moder_Passive_StatusAttributes"
IL_17fc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_StatusAttributes
IL_1801: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1806: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_180b: ldstr "ConfigEntry_Moder_Passive_OutgoingDamageTypes"
IL_1810: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_OutgoingDamageTypes
IL_1815: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_181a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_181f: ldstr "ConfigEntry_Moder_Passive_OutgoingDamageModifiers"
IL_1824: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_OutgoingDamageModifiers
IL_1829: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_182e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1833: ldstr "ConfigEntry_Moder_Passive_FallDamageModifier"
IL_1838: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_FallDamageModifier
IL_183d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1842: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1847: ldstr "ConfigEntry_Moder_Passive_IncomingDamageTypes"
IL_184c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_IncomingDamageTypes
IL_1851: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1856: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_185b: ldstr "ConfigEntry_Moder_Passive_IncomingDamageModifiers"
IL_1860: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_IncomingDamageModifiers
IL_1865: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_186a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_186f: ldstr "ConfigEntry_Moder_Passive_HeatDamageModifier"
IL_1874: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Passive_HeatDamageModifier
IL_1879: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_187e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1883: ldstr "ConfigEntry_Moder_Active_MaxHealth"
IL_1888: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_MaxHealth
IL_188d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1892: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1897: ldstr "ConfigEntry_Moder_Active_HealthRegen"
IL_189c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_HealthRegen
IL_18a1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_18a6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_18ab: ldstr "ConfigEntry_Moder_Active_HealthRegenModifier"
IL_18b0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_HealthRegenModifier
IL_18b5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_18ba: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_18bf: ldstr "ConfigEntry_Moder_Active_MaxStamina"
IL_18c4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_MaxStamina
IL_18c9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_18ce: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_18d3: ldstr "ConfigEntry_Moder_Active_StaminaRegenModifier"
IL_18d8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_StaminaRegenModifier
IL_18dd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_18e2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_18e7: ldstr "ConfigEntry_Moder_Active_MaxEitr"
IL_18ec: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_MaxEitr
IL_18f1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_18f6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_18fb: ldstr "ConfigEntry_Moder_Active_EitrRegenModifier"
IL_1900: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_EitrRegenModifier
IL_1905: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_190a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_190f: ldstr "ConfigEntry_Moder_Active_MaxWeight"
IL_1914: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_MaxWeight
IL_1919: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_191e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1923: ldstr "ConfigEntry_Moder_Active_MoveSpeedModifier"
IL_1928: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_MoveSpeedModifier
IL_192d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1932: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1937: ldstr "ConfigEntry_Moder_Active_JumpForceModifier"
IL_193c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_JumpForceModifier
IL_1941: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1946: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_194b: ldstr "ConfigEntry_Moder_Active_MaxFallSpeed"
IL_1950: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_MaxFallSpeed
IL_1955: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_195a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_195f: ldstr "ConfigEntry_Moder_Active_EquipmentSpeedModifier"
IL_1964: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_EquipmentSpeedModifier
IL_1969: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_196e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1973: ldstr "ConfigEntry_Moder_Active_WindSpeedModifier"
IL_1978: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_WindSpeedModifier
IL_197d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1982: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1987: ldstr "ConfigEntry_Moder_Active_RunStaminaCostModifier"
IL_198c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_RunStaminaCostModifier
IL_1991: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1996: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_199b: ldstr "ConfigEntry_Moder_Active_JumpStaminaCostModifier"
IL_19a0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_JumpStaminaCostModifier
IL_19a5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_19aa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_19af: ldstr "ConfigEntry_Moder_Active_StealthModifier"
IL_19b4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_StealthModifier
IL_19b9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_19be: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_19c3: ldstr "ConfigEntry_Moder_Active_NoiseModifier"
IL_19c8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_NoiseModifier
IL_19cd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_19d2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_19d7: ldstr "ConfigEntry_Moder_Active_StatusAttributes"
IL_19dc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_StatusAttributes
IL_19e1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_19e6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_19eb: ldstr "ConfigEntry_Moder_Active_OutgoingDamageTypes"
IL_19f0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_OutgoingDamageTypes
IL_19f5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_19fa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_19ff: ldstr "ConfigEntry_Moder_Active_OutgoingDamageModifiers"
IL_1a04: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_OutgoingDamageModifiers
IL_1a09: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1a0e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1a13: ldstr "ConfigEntry_Moder_Active_FallDamageModifier"
IL_1a18: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_FallDamageModifier
IL_1a1d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1a22: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1a27: ldstr "ConfigEntry_Moder_Active_IncomingDamageTypes"
IL_1a2c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_IncomingDamageTypes
IL_1a31: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1a36: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1a3b: ldstr "ConfigEntry_Moder_Active_IncomingDamageModifiers"
IL_1a40: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_IncomingDamageModifiers
IL_1a45: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1a4a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1a4f: ldstr "ConfigEntry_Moder_Active_HeatDamageModifier"
IL_1a54: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Active_HeatDamageModifier
IL_1a59: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1a5e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1a63: ldstr "ConfigEntry_Moder_Shared_MaxHealth"
IL_1a68: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_MaxHealth
IL_1a6d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1a72: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1a77: ldstr "ConfigEntry_Moder_Shared_HealthRegen"
IL_1a7c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_HealthRegen
IL_1a81: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1a86: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1a8b: ldstr "ConfigEntry_Moder_Shared_HealthRegenModifier"
IL_1a90: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_HealthRegenModifier
IL_1a95: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1a9a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1a9f: ldstr "ConfigEntry_Moder_Shared_MaxStamina"
IL_1aa4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_MaxStamina
IL_1aa9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1aae: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1ab3: ldstr "ConfigEntry_Moder_Shared_StaminaRegenModifier"
IL_1ab8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_StaminaRegenModifier
IL_1abd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1ac2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1ac7: ldstr "ConfigEntry_Moder_Shared_MaxEitr"
IL_1acc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_MaxEitr
IL_1ad1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1ad6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1adb: ldstr "ConfigEntry_Moder_Shared_EitrRegenModifier"
IL_1ae0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_EitrRegenModifier
IL_1ae5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1aea: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1aef: ldstr "ConfigEntry_Moder_Shared_MaxWeight"
IL_1af4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_MaxWeight
IL_1af9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1afe: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1b03: ldstr "ConfigEntry_Moder_Shared_MoveSpeedModifier"
IL_1b08: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_MoveSpeedModifier
IL_1b0d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1b12: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1b17: ldstr "ConfigEntry_Moder_Shared_JumpForceModifier"
IL_1b1c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_JumpForceModifier
IL_1b21: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1b26: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1b2b: ldstr "ConfigEntry_Moder_Shared_MaxFallSpeed"
IL_1b30: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_MaxFallSpeed
IL_1b35: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1b3a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1b3f: ldstr "ConfigEntry_Moder_Shared_EquipmentSpeedModifier"
IL_1b44: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_EquipmentSpeedModifier
IL_1b49: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1b4e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1b53: ldstr "ConfigEntry_Moder_Shared_WindSpeedModifier"
IL_1b58: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_WindSpeedModifier
IL_1b5d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1b62: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1b67: ldstr "ConfigEntry_Moder_Shared_RunStaminaCostModifier"
IL_1b6c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_RunStaminaCostModifier
IL_1b71: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1b76: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1b7b: ldstr "ConfigEntry_Moder_Shared_JumpStaminaCostModifier"
IL_1b80: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_JumpStaminaCostModifier
IL_1b85: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1b8a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1b8f: ldstr "ConfigEntry_Moder_Shared_StealthModifier"
IL_1b94: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_StealthModifier
IL_1b99: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1b9e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1ba3: ldstr "ConfigEntry_Moder_Shared_NoiseModifier"
IL_1ba8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_NoiseModifier
IL_1bad: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1bb2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1bb7: ldstr "ConfigEntry_Moder_Shared_StatusAttributes"
IL_1bbc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_StatusAttributes
IL_1bc1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1bc6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1bcb: ldstr "ConfigEntry_Moder_Shared_OutgoingDamageTypes"
IL_1bd0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_OutgoingDamageTypes
IL_1bd5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1bda: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1bdf: ldstr "ConfigEntry_Moder_Shared_OutgoingDamageModifiers"
IL_1be4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_OutgoingDamageModifiers
IL_1be9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1bee: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1bf3: ldstr "ConfigEntry_Moder_Shared_FallDamageModifier"
IL_1bf8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_FallDamageModifier
IL_1bfd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1c02: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1c07: ldstr "ConfigEntry_Moder_Shared_IncomingDamageTypes"
IL_1c0c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_IncomingDamageTypes
IL_1c11: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1c16: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1c1b: ldstr "ConfigEntry_Moder_Shared_IncomingDamageModifiers"
IL_1c20: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_IncomingDamageModifiers
IL_1c25: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1c2a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1c2f: ldstr "ConfigEntry_Moder_Shared_HeatDamageModifier"
IL_1c34: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Shared_HeatDamageModifier
IL_1c39: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1c3e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1c43: ldstr "ConfigEntry_Moder_Equipped_MaxHealth"
IL_1c48: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_MaxHealth
IL_1c4d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1c52: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1c57: ldstr "ConfigEntry_Moder_Equipped_HealthRegen"
IL_1c5c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_HealthRegen
IL_1c61: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1c66: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1c6b: ldstr "ConfigEntry_Moder_Equipped_HealthRegenModifier"
IL_1c70: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_HealthRegenModifier
IL_1c75: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1c7a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1c7f: ldstr "ConfigEntry_Moder_Equipped_MaxStamina"
IL_1c84: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_MaxStamina
IL_1c89: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1c8e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1c93: ldstr "ConfigEntry_Moder_Equipped_StaminaRegenModifier"
IL_1c98: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_StaminaRegenModifier
IL_1c9d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1ca2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1ca7: ldstr "ConfigEntry_Moder_Equipped_MaxEitr"
IL_1cac: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_MaxEitr
IL_1cb1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1cb6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1cbb: ldstr "ConfigEntry_Moder_Equipped_EitrRegenModifier"
IL_1cc0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_EitrRegenModifier
IL_1cc5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1cca: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1ccf: ldstr "ConfigEntry_Moder_Equipped_MaxWeight"
IL_1cd4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_MaxWeight
IL_1cd9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1cde: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1ce3: ldstr "ConfigEntry_Moder_Equipped_MoveSpeedModifier"
IL_1ce8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_MoveSpeedModifier
IL_1ced: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1cf2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1cf7: ldstr "ConfigEntry_Moder_Equipped_JumpForceModifier"
IL_1cfc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_JumpForceModifier
IL_1d01: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1d06: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1d0b: ldstr "ConfigEntry_Moder_Equipped_MaxFallSpeed"
IL_1d10: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_MaxFallSpeed
IL_1d15: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1d1a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1d1f: ldstr "ConfigEntry_Moder_Equipped_EquipmentSpeedModifier"
IL_1d24: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_EquipmentSpeedModifier
IL_1d29: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1d2e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1d33: ldstr "ConfigEntry_Moder_Equipped_WindSpeedModifier"
IL_1d38: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_WindSpeedModifier
IL_1d3d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1d42: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1d47: ldstr "ConfigEntry_Moder_Equipped_RunStaminaCostModifier"
IL_1d4c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_RunStaminaCostModifier
IL_1d51: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1d56: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1d5b: ldstr "ConfigEntry_Moder_Equipped_JumpStaminaCostModifier"
IL_1d60: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_JumpStaminaCostModifier
IL_1d65: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1d6a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1d6f: ldstr "ConfigEntry_Moder_Equipped_StealthModifier"
IL_1d74: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_StealthModifier
IL_1d79: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1d7e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1d83: ldstr "ConfigEntry_Moder_Equipped_NoiseModifier"
IL_1d88: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_NoiseModifier
IL_1d8d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1d92: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1d97: ldstr "ConfigEntry_Moder_Equipped_StatusAttributes"
IL_1d9c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_StatusAttributes
IL_1da1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1da6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1dab: ldstr "ConfigEntry_Moder_Equipped_OutgoingDamageTypes"
IL_1db0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_OutgoingDamageTypes
IL_1db5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1dba: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1dbf: ldstr "ConfigEntry_Moder_Equipped_OutgoingDamageModifiers"
IL_1dc4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_OutgoingDamageModifiers
IL_1dc9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1dce: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1dd3: ldstr "ConfigEntry_Moder_Equipped_FallDamageModifier"
IL_1dd8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_FallDamageModifier
IL_1ddd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1de2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1de7: ldstr "ConfigEntry_Moder_Equipped_IncomingDamageTypes"
IL_1dec: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_IncomingDamageTypes
IL_1df1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1df6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1dfb: ldstr "ConfigEntry_Moder_Equipped_IncomingDamageModifiers"
IL_1e00: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_IncomingDamageModifiers
IL_1e05: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1e0a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1e0f: ldstr "ConfigEntry_Moder_Equipped_HeatDamageModifier"
IL_1e14: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Moder_Equipped_HeatDamageModifier
IL_1e19: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1e1e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1e23: ldstr "ConfigEntry_Yagluth_Passive_MaxHealth"
IL_1e28: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_MaxHealth
IL_1e2d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1e32: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1e37: ldstr "ConfigEntry_Yagluth_Passive_HealthRegen"
IL_1e3c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_HealthRegen
IL_1e41: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1e46: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1e4b: ldstr "ConfigEntry_Yagluth_Passive_HealthRegenModifier"
IL_1e50: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_HealthRegenModifier
IL_1e55: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1e5a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1e5f: ldstr "ConfigEntry_Yagluth_Passive_MaxStamina"
IL_1e64: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_MaxStamina
IL_1e69: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1e6e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1e73: ldstr "ConfigEntry_Yagluth_Passive_StaminaRegenModifier"
IL_1e78: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_StaminaRegenModifier
IL_1e7d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1e82: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1e87: ldstr "ConfigEntry_Yagluth_Passive_MaxEitr"
IL_1e8c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_MaxEitr
IL_1e91: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1e96: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1e9b: ldstr "ConfigEntry_Yagluth_Passive_EitrRegenModifier"
IL_1ea0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_EitrRegenModifier
IL_1ea5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1eaa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_1eaf: ldstr "ConfigEntry_Yagluth_Passive_MaxWeight"
IL_1eb4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_MaxWeight
IL_1eb9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_1ebe: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1ec3: ldstr "ConfigEntry_Yagluth_Passive_MoveSpeedModifier"
IL_1ec8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_MoveSpeedModifier
IL_1ecd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1ed2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1ed7: ldstr "ConfigEntry_Yagluth_Passive_JumpForceModifier"
IL_1edc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_JumpForceModifier
IL_1ee1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1ee6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1eeb: ldstr "ConfigEntry_Yagluth_Passive_MaxFallSpeed"
IL_1ef0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_MaxFallSpeed
IL_1ef5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1efa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1eff: ldstr "ConfigEntry_Yagluth_Passive_EquipmentSpeedModifier"
IL_1f04: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_EquipmentSpeedModifier
IL_1f09: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1f0e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1f13: ldstr "ConfigEntry_Yagluth_Passive_WindSpeedModifier"
IL_1f18: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_WindSpeedModifier
IL_1f1d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1f22: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1f27: ldstr "ConfigEntry_Yagluth_Passive_RunStaminaCostModifier"
IL_1f2c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_RunStaminaCostModifier
IL_1f31: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1f36: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1f3b: ldstr "ConfigEntry_Yagluth_Passive_JumpStaminaCostModifier"
IL_1f40: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_JumpStaminaCostModifier
IL_1f45: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1f4a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1f4f: ldstr "ConfigEntry_Yagluth_Passive_StealthModifier"
IL_1f54: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_StealthModifier
IL_1f59: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1f5e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1f63: ldstr "ConfigEntry_Yagluth_Passive_NoiseModifier"
IL_1f68: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_NoiseModifier
IL_1f6d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1f72: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1f77: ldstr "ConfigEntry_Yagluth_Passive_StatusAttributes"
IL_1f7c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_StatusAttributes
IL_1f81: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1f86: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1f8b: ldstr "ConfigEntry_Yagluth_Passive_OutgoingDamageTypes"
IL_1f90: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_OutgoingDamageTypes
IL_1f95: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1f9a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1f9f: ldstr "ConfigEntry_Yagluth_Passive_OutgoingDamageModifiers"
IL_1fa4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_OutgoingDamageModifiers
IL_1fa9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1fae: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1fb3: ldstr "ConfigEntry_Yagluth_Passive_FallDamageModifier"
IL_1fb8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_FallDamageModifier
IL_1fbd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1fc2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1fc7: ldstr "ConfigEntry_Yagluth_Passive_IncomingDamageTypes"
IL_1fcc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_IncomingDamageTypes
IL_1fd1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1fd6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_1fdb: ldstr "ConfigEntry_Yagluth_Passive_IncomingDamageModifiers"
IL_1fe0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_IncomingDamageModifiers
IL_1fe5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_1fea: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_1fef: ldstr "ConfigEntry_Yagluth_Passive_HeatDamageModifier"
IL_1ff4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Passive_HeatDamageModifier
IL_1ff9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_1ffe: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2003: ldstr "ConfigEntry_Yagluth_Active_MaxHealth"
IL_2008: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_MaxHealth
IL_200d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2012: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2017: ldstr "ConfigEntry_Yagluth_Active_HealthRegen"
IL_201c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_HealthRegen
IL_2021: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2026: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_202b: ldstr "ConfigEntry_Yagluth_Active_HealthRegenModifier"
IL_2030: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_HealthRegenModifier
IL_2035: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_203a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_203f: ldstr "ConfigEntry_Yagluth_Active_MaxStamina"
IL_2044: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_MaxStamina
IL_2049: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_204e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2053: ldstr "ConfigEntry_Yagluth_Active_StaminaRegenModifier"
IL_2058: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_StaminaRegenModifier
IL_205d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2062: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2067: ldstr "ConfigEntry_Yagluth_Active_MaxEitr"
IL_206c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_MaxEitr
IL_2071: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2076: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_207b: ldstr "ConfigEntry_Yagluth_Active_EitrRegenModifier"
IL_2080: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_EitrRegenModifier
IL_2085: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_208a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_208f: ldstr "ConfigEntry_Yagluth_Active_MaxWeight"
IL_2094: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_MaxWeight
IL_2099: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_209e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_20a3: ldstr "ConfigEntry_Yagluth_Active_MoveSpeedModifier"
IL_20a8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_MoveSpeedModifier
IL_20ad: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_20b2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_20b7: ldstr "ConfigEntry_Yagluth_Active_JumpForceModifier"
IL_20bc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_JumpForceModifier
IL_20c1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_20c6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_20cb: ldstr "ConfigEntry_Yagluth_Active_MaxFallSpeed"
IL_20d0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_MaxFallSpeed
IL_20d5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_20da: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_20df: ldstr "ConfigEntry_Yagluth_Active_EquipmentSpeedModifier"
IL_20e4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_EquipmentSpeedModifier
IL_20e9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_20ee: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_20f3: ldstr "ConfigEntry_Yagluth_Active_WindSpeedModifier"
IL_20f8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_WindSpeedModifier
IL_20fd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2102: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2107: ldstr "ConfigEntry_Yagluth_Active_RunStaminaCostModifier"
IL_210c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_RunStaminaCostModifier
IL_2111: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2116: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_211b: ldstr "ConfigEntry_Yagluth_Active_JumpStaminaCostModifier"
IL_2120: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_JumpStaminaCostModifier
IL_2125: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_212a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_212f: ldstr "ConfigEntry_Yagluth_Active_StealthModifier"
IL_2134: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_StealthModifier
IL_2139: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_213e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2143: ldstr "ConfigEntry_Yagluth_Active_NoiseModifier"
IL_2148: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_NoiseModifier
IL_214d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2152: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_2157: ldstr "ConfigEntry_Yagluth_Active_StatusAttributes"
IL_215c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_StatusAttributes
IL_2161: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2166: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_216b: ldstr "ConfigEntry_Yagluth_Active_OutgoingDamageTypes"
IL_2170: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_OutgoingDamageTypes
IL_2175: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_217a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_217f: ldstr "ConfigEntry_Yagluth_Active_OutgoingDamageModifiers"
IL_2184: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_OutgoingDamageModifiers
IL_2189: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_218e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2193: ldstr "ConfigEntry_Yagluth_Active_FallDamageModifier"
IL_2198: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_FallDamageModifier
IL_219d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_21a2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_21a7: ldstr "ConfigEntry_Yagluth_Active_IncomingDamageTypes"
IL_21ac: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_IncomingDamageTypes
IL_21b1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_21b6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_21bb: ldstr "ConfigEntry_Yagluth_Active_IncomingDamageModifiers"
IL_21c0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_IncomingDamageModifiers
IL_21c5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_21ca: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_21cf: ldstr "ConfigEntry_Yagluth_Active_HeatDamageModifier"
IL_21d4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Active_HeatDamageModifier
IL_21d9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_21de: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_21e3: ldstr "ConfigEntry_Yagluth_Shared_MaxHealth"
IL_21e8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_MaxHealth
IL_21ed: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_21f2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_21f7: ldstr "ConfigEntry_Yagluth_Shared_HealthRegen"
IL_21fc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_HealthRegen
IL_2201: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2206: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_220b: ldstr "ConfigEntry_Yagluth_Shared_HealthRegenModifier"
IL_2210: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_HealthRegenModifier
IL_2215: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_221a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_221f: ldstr "ConfigEntry_Yagluth_Shared_MaxStamina"
IL_2224: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_MaxStamina
IL_2229: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_222e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2233: ldstr "ConfigEntry_Yagluth_Shared_StaminaRegenModifier"
IL_2238: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_StaminaRegenModifier
IL_223d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2242: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2247: ldstr "ConfigEntry_Yagluth_Shared_MaxEitr"
IL_224c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_MaxEitr
IL_2251: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2256: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_225b: ldstr "ConfigEntry_Yagluth_Shared_EitrRegenModifier"
IL_2260: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_EitrRegenModifier
IL_2265: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_226a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_226f: ldstr "ConfigEntry_Yagluth_Shared_MaxWeight"
IL_2274: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_MaxWeight
IL_2279: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_227e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2283: ldstr "ConfigEntry_Yagluth_Shared_MoveSpeedModifier"
IL_2288: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_MoveSpeedModifier
IL_228d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2292: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2297: ldstr "ConfigEntry_Yagluth_Shared_JumpForceModifier"
IL_229c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_JumpForceModifier
IL_22a1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_22a6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_22ab: ldstr "ConfigEntry_Yagluth_Shared_MaxFallSpeed"
IL_22b0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_MaxFallSpeed
IL_22b5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_22ba: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_22bf: ldstr "ConfigEntry_Yagluth_Shared_EquipmentSpeedModifier"
IL_22c4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_EquipmentSpeedModifier
IL_22c9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_22ce: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_22d3: ldstr "ConfigEntry_Yagluth_Shared_WindSpeedModifier"
IL_22d8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_WindSpeedModifier
IL_22dd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_22e2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_22e7: ldstr "ConfigEntry_Yagluth_Shared_RunStaminaCostModifier"
IL_22ec: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_RunStaminaCostModifier
IL_22f1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_22f6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_22fb: ldstr "ConfigEntry_Yagluth_Shared_JumpStaminaCostModifier"
IL_2300: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_JumpStaminaCostModifier
IL_2305: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_230a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_230f: ldstr "ConfigEntry_Yagluth_Shared_StealthModifier"
IL_2314: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_StealthModifier
IL_2319: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_231e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2323: ldstr "ConfigEntry_Yagluth_Shared_NoiseModifier"
IL_2328: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_NoiseModifier
IL_232d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2332: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_2337: ldstr "ConfigEntry_Yagluth_Shared_StatusAttributes"
IL_233c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_StatusAttributes
IL_2341: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2346: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_234b: ldstr "ConfigEntry_Yagluth_Shared_OutgoingDamageTypes"
IL_2350: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_OutgoingDamageTypes
IL_2355: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_235a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_235f: ldstr "ConfigEntry_Yagluth_Shared_OutgoingDamageModifiers"
IL_2364: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_OutgoingDamageModifiers
IL_2369: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_236e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2373: ldstr "ConfigEntry_Yagluth_Shared_FallDamageModifier"
IL_2378: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_FallDamageModifier
IL_237d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2382: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_2387: ldstr "ConfigEntry_Yagluth_Shared_IncomingDamageTypes"
IL_238c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_IncomingDamageTypes
IL_2391: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2396: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_239b: ldstr "ConfigEntry_Yagluth_Shared_IncomingDamageModifiers"
IL_23a0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_IncomingDamageModifiers
IL_23a5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_23aa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_23af: ldstr "ConfigEntry_Yagluth_Shared_HeatDamageModifier"
IL_23b4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Shared_HeatDamageModifier
IL_23b9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_23be: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_23c3: ldstr "ConfigEntry_Yagluth_Equipped_MaxHealth"
IL_23c8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_MaxHealth
IL_23cd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_23d2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_23d7: ldstr "ConfigEntry_Yagluth_Equipped_HealthRegen"
IL_23dc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_HealthRegen
IL_23e1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_23e6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_23eb: ldstr "ConfigEntry_Yagluth_Equipped_HealthRegenModifier"
IL_23f0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_HealthRegenModifier
IL_23f5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_23fa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_23ff: ldstr "ConfigEntry_Yagluth_Equipped_MaxStamina"
IL_2404: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_MaxStamina
IL_2409: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_240e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2413: ldstr "ConfigEntry_Yagluth_Equipped_StaminaRegenModifier"
IL_2418: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_StaminaRegenModifier
IL_241d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2422: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2427: ldstr "ConfigEntry_Yagluth_Equipped_MaxEitr"
IL_242c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_MaxEitr
IL_2431: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2436: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_243b: ldstr "ConfigEntry_Yagluth_Equipped_EitrRegenModifier"
IL_2440: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_EitrRegenModifier
IL_2445: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_244a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_244f: ldstr "ConfigEntry_Yagluth_Equipped_MaxWeight"
IL_2454: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_MaxWeight
IL_2459: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_245e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2463: ldstr "ConfigEntry_Yagluth_Equipped_MoveSpeedModifier"
IL_2468: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_MoveSpeedModifier
IL_246d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2472: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2477: ldstr "ConfigEntry_Yagluth_Equipped_JumpForceModifier"
IL_247c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_JumpForceModifier
IL_2481: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2486: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_248b: ldstr "ConfigEntry_Yagluth_Equipped_MaxFallSpeed"
IL_2490: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_MaxFallSpeed
IL_2495: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_249a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_249f: ldstr "ConfigEntry_Yagluth_Equipped_EquipmentSpeedModifier"
IL_24a4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_EquipmentSpeedModifier
IL_24a9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_24ae: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_24b3: ldstr "ConfigEntry_Yagluth_Equipped_WindSpeedModifier"
IL_24b8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_WindSpeedModifier
IL_24bd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_24c2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_24c7: ldstr "ConfigEntry_Yagluth_Equipped_RunStaminaCostModifier"
IL_24cc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_RunStaminaCostModifier
IL_24d1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_24d6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_24db: ldstr "ConfigEntry_Yagluth_Equipped_JumpStaminaCostModifier"
IL_24e0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_JumpStaminaCostModifier
IL_24e5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_24ea: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_24ef: ldstr "ConfigEntry_Yagluth_Equipped_StealthModifier"
IL_24f4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_StealthModifier
IL_24f9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_24fe: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2503: ldstr "ConfigEntry_Yagluth_Equipped_NoiseModifier"
IL_2508: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_NoiseModifier
IL_250d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2512: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_2517: ldstr "ConfigEntry_Yagluth_Equipped_StatusAttributes"
IL_251c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_StatusAttributes
IL_2521: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2526: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_252b: ldstr "ConfigEntry_Yagluth_Equipped_OutgoingDamageTypes"
IL_2530: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_OutgoingDamageTypes
IL_2535: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_253a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_253f: ldstr "ConfigEntry_Yagluth_Equipped_OutgoingDamageModifiers"
IL_2544: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_OutgoingDamageModifiers
IL_2549: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_254e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2553: ldstr "ConfigEntry_Yagluth_Equipped_FallDamageModifier"
IL_2558: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_FallDamageModifier
IL_255d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2562: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_2567: ldstr "ConfigEntry_Yagluth_Equipped_IncomingDamageTypes"
IL_256c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_IncomingDamageTypes
IL_2571: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2576: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_257b: ldstr "ConfigEntry_Yagluth_Equipped_IncomingDamageModifiers"
IL_2580: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_IncomingDamageModifiers
IL_2585: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_258a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_258f: ldstr "ConfigEntry_Yagluth_Equipped_HeatDamageModifier"
IL_2594: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Yagluth_Equipped_HeatDamageModifier
IL_2599: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_259e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_25a3: ldstr "ConfigEntry_Queen_Passive_MaxHealth"
IL_25a8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_MaxHealth
IL_25ad: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_25b2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_25b7: ldstr "ConfigEntry_Queen_Passive_HealthRegen"
IL_25bc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_HealthRegen
IL_25c1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_25c6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_25cb: ldstr "ConfigEntry_Queen_Passive_HealthRegenModifier"
IL_25d0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_HealthRegenModifier
IL_25d5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_25da: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_25df: ldstr "ConfigEntry_Queen_Passive_MaxStamina"
IL_25e4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_MaxStamina
IL_25e9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_25ee: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_25f3: ldstr "ConfigEntry_Queen_Passive_StaminaRegenModifier"
IL_25f8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_StaminaRegenModifier
IL_25fd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2602: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2607: ldstr "ConfigEntry_Queen_Passive_MaxEitr"
IL_260c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_MaxEitr
IL_2611: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2616: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_261b: ldstr "ConfigEntry_Queen_Passive_EitrRegenModifier"
IL_2620: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_EitrRegenModifier
IL_2625: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_262a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_262f: ldstr "ConfigEntry_Queen_Passive_MaxWeight"
IL_2634: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_MaxWeight
IL_2639: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_263e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2643: ldstr "ConfigEntry_Queen_Passive_MoveSpeedModifier"
IL_2648: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_MoveSpeedModifier
IL_264d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2652: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2657: ldstr "ConfigEntry_Queen_Passive_JumpForceModifier"
IL_265c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_JumpForceModifier
IL_2661: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2666: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_266b: ldstr "ConfigEntry_Queen_Passive_MaxFallSpeed"
IL_2670: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_MaxFallSpeed
IL_2675: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_267a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_267f: ldstr "ConfigEntry_Queen_Passive_EquipmentSpeedModifier"
IL_2684: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_EquipmentSpeedModifier
IL_2689: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_268e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2693: ldstr "ConfigEntry_Queen_Passive_WindSpeedModifier"
IL_2698: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_WindSpeedModifier
IL_269d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_26a2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_26a7: ldstr "ConfigEntry_Queen_Passive_RunStaminaCostModifier"
IL_26ac: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_RunStaminaCostModifier
IL_26b1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_26b6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_26bb: ldstr "ConfigEntry_Queen_Passive_JumpStaminaCostModifier"
IL_26c0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_JumpStaminaCostModifier
IL_26c5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_26ca: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_26cf: ldstr "ConfigEntry_Queen_Passive_StealthModifier"
IL_26d4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_StealthModifier
IL_26d9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_26de: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_26e3: ldstr "ConfigEntry_Queen_Passive_NoiseModifier"
IL_26e8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_NoiseModifier
IL_26ed: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_26f2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_26f7: ldstr "ConfigEntry_Queen_Passive_StatusAttributes"
IL_26fc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_StatusAttributes
IL_2701: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2706: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_270b: ldstr "ConfigEntry_Queen_Passive_OutgoingDamageTypes"
IL_2710: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_OutgoingDamageTypes
IL_2715: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_271a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_271f: ldstr "ConfigEntry_Queen_Passive_OutgoingDamageModifiers"
IL_2724: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_OutgoingDamageModifiers
IL_2729: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_272e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2733: ldstr "ConfigEntry_Queen_Passive_FallDamageModifier"
IL_2738: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_FallDamageModifier
IL_273d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2742: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_2747: ldstr "ConfigEntry_Queen_Passive_IncomingDamageTypes"
IL_274c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_IncomingDamageTypes
IL_2751: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2756: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_275b: ldstr "ConfigEntry_Queen_Passive_IncomingDamageModifiers"
IL_2760: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_IncomingDamageModifiers
IL_2765: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_276a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_276f: ldstr "ConfigEntry_Queen_Passive_HeatDamageModifier"
IL_2774: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Passive_HeatDamageModifier
IL_2779: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_277e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2783: ldstr "ConfigEntry_Queen_Active_MaxHealth"
IL_2788: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_MaxHealth
IL_278d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2792: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2797: ldstr "ConfigEntry_Queen_Active_HealthRegen"
IL_279c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_HealthRegen
IL_27a1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_27a6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_27ab: ldstr "ConfigEntry_Queen_Active_HealthRegenModifier"
IL_27b0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_HealthRegenModifier
IL_27b5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_27ba: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_27bf: ldstr "ConfigEntry_Queen_Active_MaxStamina"
IL_27c4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_MaxStamina
IL_27c9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_27ce: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_27d3: ldstr "ConfigEntry_Queen_Active_StaminaRegenModifier"
IL_27d8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_StaminaRegenModifier
IL_27dd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_27e2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_27e7: ldstr "ConfigEntry_Queen_Active_MaxEitr"
IL_27ec: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_MaxEitr
IL_27f1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_27f6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_27fb: ldstr "ConfigEntry_Queen_Active_EitrRegenModifier"
IL_2800: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_EitrRegenModifier
IL_2805: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_280a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_280f: ldstr "ConfigEntry_Queen_Active_MaxWeight"
IL_2814: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_MaxWeight
IL_2819: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_281e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2823: ldstr "ConfigEntry_Queen_Active_MoveSpeedModifier"
IL_2828: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_MoveSpeedModifier
IL_282d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2832: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2837: ldstr "ConfigEntry_Queen_Active_JumpForceModifier"
IL_283c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_JumpForceModifier
IL_2841: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2846: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_284b: ldstr "ConfigEntry_Queen_Active_MaxFallSpeed"
IL_2850: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_MaxFallSpeed
IL_2855: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_285a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_285f: ldstr "ConfigEntry_Queen_Active_EquipmentSpeedModifier"
IL_2864: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_EquipmentSpeedModifier
IL_2869: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_286e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2873: ldstr "ConfigEntry_Queen_Active_WindSpeedModifier"
IL_2878: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_WindSpeedModifier
IL_287d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2882: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2887: ldstr "ConfigEntry_Queen_Active_RunStaminaCostModifier"
IL_288c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_RunStaminaCostModifier
IL_2891: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2896: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_289b: ldstr "ConfigEntry_Queen_Active_JumpStaminaCostModifier"
IL_28a0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_JumpStaminaCostModifier
IL_28a5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_28aa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_28af: ldstr "ConfigEntry_Queen_Active_StealthModifier"
IL_28b4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_StealthModifier
IL_28b9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_28be: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_28c3: ldstr "ConfigEntry_Queen_Active_NoiseModifier"
IL_28c8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_NoiseModifier
IL_28cd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_28d2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_28d7: ldstr "ConfigEntry_Queen_Active_StatusAttributes"
IL_28dc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_StatusAttributes
IL_28e1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_28e6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_28eb: ldstr "ConfigEntry_Queen_Active_OutgoingDamageTypes"
IL_28f0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_OutgoingDamageTypes
IL_28f5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_28fa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_28ff: ldstr "ConfigEntry_Queen_Active_OutgoingDamageModifiers"
IL_2904: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_OutgoingDamageModifiers
IL_2909: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_290e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2913: ldstr "ConfigEntry_Queen_Active_FallDamageModifier"
IL_2918: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_FallDamageModifier
IL_291d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2922: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_2927: ldstr "ConfigEntry_Queen_Active_IncomingDamageTypes"
IL_292c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_IncomingDamageTypes
IL_2931: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2936: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_293b: ldstr "ConfigEntry_Queen_Active_IncomingDamageModifiers"
IL_2940: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_IncomingDamageModifiers
IL_2945: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_294a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_294f: ldstr "ConfigEntry_Queen_Active_HeatDamageModifier"
IL_2954: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Active_HeatDamageModifier
IL_2959: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_295e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2963: ldstr "ConfigEntry_Queen_Shared_MaxHealth"
IL_2968: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_MaxHealth
IL_296d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2972: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2977: ldstr "ConfigEntry_Queen_Shared_HealthRegen"
IL_297c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_HealthRegen
IL_2981: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2986: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_298b: ldstr "ConfigEntry_Queen_Shared_HealthRegenModifier"
IL_2990: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_HealthRegenModifier
IL_2995: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_299a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_299f: ldstr "ConfigEntry_Queen_Shared_MaxStamina"
IL_29a4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_MaxStamina
IL_29a9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_29ae: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_29b3: ldstr "ConfigEntry_Queen_Shared_StaminaRegenModifier"
IL_29b8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_StaminaRegenModifier
IL_29bd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_29c2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_29c7: ldstr "ConfigEntry_Queen_Shared_MaxEitr"
IL_29cc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_MaxEitr
IL_29d1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_29d6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_29db: ldstr "ConfigEntry_Queen_Shared_EitrRegenModifier"
IL_29e0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_EitrRegenModifier
IL_29e5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_29ea: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_29ef: ldstr "ConfigEntry_Queen_Shared_MaxWeight"
IL_29f4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_MaxWeight
IL_29f9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_29fe: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2a03: ldstr "ConfigEntry_Queen_Shared_MoveSpeedModifier"
IL_2a08: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_MoveSpeedModifier
IL_2a0d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2a12: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2a17: ldstr "ConfigEntry_Queen_Shared_JumpForceModifier"
IL_2a1c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_JumpForceModifier
IL_2a21: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2a26: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2a2b: ldstr "ConfigEntry_Queen_Shared_MaxFallSpeed"
IL_2a30: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_MaxFallSpeed
IL_2a35: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2a3a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2a3f: ldstr "ConfigEntry_Queen_Shared_EquipmentSpeedModifier"
IL_2a44: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_EquipmentSpeedModifier
IL_2a49: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2a4e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2a53: ldstr "ConfigEntry_Queen_Shared_WindSpeedModifier"
IL_2a58: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_WindSpeedModifier
IL_2a5d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2a62: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2a67: ldstr "ConfigEntry_Queen_Shared_RunStaminaCostModifier"
IL_2a6c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_RunStaminaCostModifier
IL_2a71: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2a76: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2a7b: ldstr "ConfigEntry_Queen_Shared_JumpStaminaCostModifier"
IL_2a80: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_JumpStaminaCostModifier
IL_2a85: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2a8a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2a8f: ldstr "ConfigEntry_Queen_Shared_StealthModifier"
IL_2a94: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_StealthModifier
IL_2a99: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2a9e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2aa3: ldstr "ConfigEntry_Queen_Shared_NoiseModifier"
IL_2aa8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_NoiseModifier
IL_2aad: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2ab2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_2ab7: ldstr "ConfigEntry_Queen_Shared_StatusAttributes"
IL_2abc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_StatusAttributes
IL_2ac1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2ac6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_2acb: ldstr "ConfigEntry_Queen_Shared_OutgoingDamageTypes"
IL_2ad0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_OutgoingDamageTypes
IL_2ad5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2ada: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_2adf: ldstr "ConfigEntry_Queen_Shared_OutgoingDamageModifiers"
IL_2ae4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_OutgoingDamageModifiers
IL_2ae9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2aee: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2af3: ldstr "ConfigEntry_Queen_Shared_FallDamageModifier"
IL_2af8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_FallDamageModifier
IL_2afd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2b02: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_2b07: ldstr "ConfigEntry_Queen_Shared_IncomingDamageTypes"
IL_2b0c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_IncomingDamageTypes
IL_2b11: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2b16: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_2b1b: ldstr "ConfigEntry_Queen_Shared_IncomingDamageModifiers"
IL_2b20: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_IncomingDamageModifiers
IL_2b25: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2b2a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2b2f: ldstr "ConfigEntry_Queen_Shared_HeatDamageModifier"
IL_2b34: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Shared_HeatDamageModifier
IL_2b39: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2b3e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2b43: ldstr "ConfigEntry_Queen_Equipped_MaxHealth"
IL_2b48: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_MaxHealth
IL_2b4d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2b52: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2b57: ldstr "ConfigEntry_Queen_Equipped_HealthRegen"
IL_2b5c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_HealthRegen
IL_2b61: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2b66: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2b6b: ldstr "ConfigEntry_Queen_Equipped_HealthRegenModifier"
IL_2b70: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_HealthRegenModifier
IL_2b75: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2b7a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2b7f: ldstr "ConfigEntry_Queen_Equipped_MaxStamina"
IL_2b84: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_MaxStamina
IL_2b89: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2b8e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2b93: ldstr "ConfigEntry_Queen_Equipped_StaminaRegenModifier"
IL_2b98: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_StaminaRegenModifier
IL_2b9d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2ba2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2ba7: ldstr "ConfigEntry_Queen_Equipped_MaxEitr"
IL_2bac: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_MaxEitr
IL_2bb1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2bb6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2bbb: ldstr "ConfigEntry_Queen_Equipped_EitrRegenModifier"
IL_2bc0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_EitrRegenModifier
IL_2bc5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2bca: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2bcf: ldstr "ConfigEntry_Queen_Equipped_MaxWeight"
IL_2bd4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_MaxWeight
IL_2bd9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2bde: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2be3: ldstr "ConfigEntry_Queen_Equipped_MoveSpeedModifier"
IL_2be8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_MoveSpeedModifier
IL_2bed: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2bf2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2bf7: ldstr "ConfigEntry_Queen_Equipped_JumpForceModifier"
IL_2bfc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_JumpForceModifier
IL_2c01: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2c06: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2c0b: ldstr "ConfigEntry_Queen_Equipped_MaxFallSpeed"
IL_2c10: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_MaxFallSpeed
IL_2c15: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2c1a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2c1f: ldstr "ConfigEntry_Queen_Equipped_EquipmentSpeedModifier"
IL_2c24: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_EquipmentSpeedModifier
IL_2c29: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2c2e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2c33: ldstr "ConfigEntry_Queen_Equipped_WindSpeedModifier"
IL_2c38: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_WindSpeedModifier
IL_2c3d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2c42: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2c47: ldstr "ConfigEntry_Queen_Equipped_RunStaminaCostModifier"
IL_2c4c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_RunStaminaCostModifier
IL_2c51: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2c56: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2c5b: ldstr "ConfigEntry_Queen_Equipped_JumpStaminaCostModifier"
IL_2c60: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_JumpStaminaCostModifier
IL_2c65: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2c6a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2c6f: ldstr "ConfigEntry_Queen_Equipped_StealthModifier"
IL_2c74: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_StealthModifier
IL_2c79: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2c7e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2c83: ldstr "ConfigEntry_Queen_Equipped_NoiseModifier"
IL_2c88: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_NoiseModifier
IL_2c8d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2c92: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_2c97: ldstr "ConfigEntry_Queen_Equipped_StatusAttributes"
IL_2c9c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_StatusAttributes
IL_2ca1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2ca6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_2cab: ldstr "ConfigEntry_Queen_Equipped_OutgoingDamageTypes"
IL_2cb0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_OutgoingDamageTypes
IL_2cb5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2cba: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_2cbf: ldstr "ConfigEntry_Queen_Equipped_OutgoingDamageModifiers"
IL_2cc4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_OutgoingDamageModifiers
IL_2cc9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2cce: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2cd3: ldstr "ConfigEntry_Queen_Equipped_FallDamageModifier"
IL_2cd8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_FallDamageModifier
IL_2cdd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2ce2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_2ce7: ldstr "ConfigEntry_Queen_Equipped_IncomingDamageTypes"
IL_2cec: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_IncomingDamageTypes
IL_2cf1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2cf6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_2cfb: ldstr "ConfigEntry_Queen_Equipped_IncomingDamageModifiers"
IL_2d00: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_IncomingDamageModifiers
IL_2d05: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2d0a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2d0f: ldstr "ConfigEntry_Queen_Equipped_HeatDamageModifier"
IL_2d14: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Queen_Equipped_HeatDamageModifier
IL_2d19: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2d1e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2d23: ldstr "ConfigEntry_Fader_Passive_MaxHealth"
IL_2d28: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_MaxHealth
IL_2d2d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2d32: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2d37: ldstr "ConfigEntry_Fader_Passive_HealthRegen"
IL_2d3c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_HealthRegen
IL_2d41: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2d46: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2d4b: ldstr "ConfigEntry_Fader_Passive_HealthRegenModifier"
IL_2d50: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_HealthRegenModifier
IL_2d55: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2d5a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2d5f: ldstr "ConfigEntry_Fader_Passive_MaxStamina"
IL_2d64: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_MaxStamina
IL_2d69: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2d6e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2d73: ldstr "ConfigEntry_Fader_Passive_StaminaRegenModifier"
IL_2d78: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_StaminaRegenModifier
IL_2d7d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2d82: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2d87: ldstr "ConfigEntry_Fader_Passive_MaxEitr"
IL_2d8c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_MaxEitr
IL_2d91: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2d96: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2d9b: ldstr "ConfigEntry_Fader_Passive_EitrRegenModifier"
IL_2da0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_EitrRegenModifier
IL_2da5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2daa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2daf: ldstr "ConfigEntry_Fader_Passive_MaxWeight"
IL_2db4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_MaxWeight
IL_2db9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2dbe: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2dc3: ldstr "ConfigEntry_Fader_Passive_MoveSpeedModifier"
IL_2dc8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_MoveSpeedModifier
IL_2dcd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2dd2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2dd7: ldstr "ConfigEntry_Fader_Passive_JumpForceModifier"
IL_2ddc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_JumpForceModifier
IL_2de1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2de6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2deb: ldstr "ConfigEntry_Fader_Passive_MaxFallSpeed"
IL_2df0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_MaxFallSpeed
IL_2df5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2dfa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2dff: ldstr "ConfigEntry_Fader_Passive_EquipmentSpeedModifier"
IL_2e04: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_EquipmentSpeedModifier
IL_2e09: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2e0e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2e13: ldstr "ConfigEntry_Fader_Passive_WindSpeedModifier"
IL_2e18: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_WindSpeedModifier
IL_2e1d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2e22: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2e27: ldstr "ConfigEntry_Fader_Passive_RunStaminaCostModifier"
IL_2e2c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_RunStaminaCostModifier
IL_2e31: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2e36: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2e3b: ldstr "ConfigEntry_Fader_Passive_JumpStaminaCostModifier"
IL_2e40: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_JumpStaminaCostModifier
IL_2e45: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2e4a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2e4f: ldstr "ConfigEntry_Fader_Passive_StealthModifier"
IL_2e54: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_StealthModifier
IL_2e59: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2e5e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2e63: ldstr "ConfigEntry_Fader_Passive_NoiseModifier"
IL_2e68: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_NoiseModifier
IL_2e6d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2e72: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_2e77: ldstr "ConfigEntry_Fader_Passive_StatusAttributes"
IL_2e7c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_StatusAttributes
IL_2e81: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2e86: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_2e8b: ldstr "ConfigEntry_Fader_Passive_OutgoingDamageTypes"
IL_2e90: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_OutgoingDamageTypes
IL_2e95: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2e9a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_2e9f: ldstr "ConfigEntry_Fader_Passive_OutgoingDamageModifiers"
IL_2ea4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_OutgoingDamageModifiers
IL_2ea9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2eae: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2eb3: ldstr "ConfigEntry_Fader_Passive_FallDamageModifier"
IL_2eb8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_FallDamageModifier
IL_2ebd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2ec2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_2ec7: ldstr "ConfigEntry_Fader_Passive_IncomingDamageTypes"
IL_2ecc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_IncomingDamageTypes
IL_2ed1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2ed6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_2edb: ldstr "ConfigEntry_Fader_Passive_IncomingDamageModifiers"
IL_2ee0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_IncomingDamageModifiers
IL_2ee5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_2eea: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2eef: ldstr "ConfigEntry_Fader_Passive_HeatDamageModifier"
IL_2ef4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Passive_HeatDamageModifier
IL_2ef9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2efe: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2f03: ldstr "ConfigEntry_Fader_Active_MaxHealth"
IL_2f08: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_MaxHealth
IL_2f0d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2f12: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2f17: ldstr "ConfigEntry_Fader_Active_HealthRegen"
IL_2f1c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_HealthRegen
IL_2f21: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2f26: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2f2b: ldstr "ConfigEntry_Fader_Active_HealthRegenModifier"
IL_2f30: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_HealthRegenModifier
IL_2f35: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2f3a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2f3f: ldstr "ConfigEntry_Fader_Active_MaxStamina"
IL_2f44: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_MaxStamina
IL_2f49: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2f4e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2f53: ldstr "ConfigEntry_Fader_Active_StaminaRegenModifier"
IL_2f58: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_StaminaRegenModifier
IL_2f5d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2f62: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2f67: ldstr "ConfigEntry_Fader_Active_MaxEitr"
IL_2f6c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_MaxEitr
IL_2f71: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2f76: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2f7b: ldstr "ConfigEntry_Fader_Active_EitrRegenModifier"
IL_2f80: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_EitrRegenModifier
IL_2f85: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2f8a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_2f8f: ldstr "ConfigEntry_Fader_Active_MaxWeight"
IL_2f94: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_MaxWeight
IL_2f99: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_2f9e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2fa3: ldstr "ConfigEntry_Fader_Active_MoveSpeedModifier"
IL_2fa8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_MoveSpeedModifier
IL_2fad: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2fb2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2fb7: ldstr "ConfigEntry_Fader_Active_JumpForceModifier"
IL_2fbc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_JumpForceModifier
IL_2fc1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2fc6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2fcb: ldstr "ConfigEntry_Fader_Active_MaxFallSpeed"
IL_2fd0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_MaxFallSpeed
IL_2fd5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2fda: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2fdf: ldstr "ConfigEntry_Fader_Active_EquipmentSpeedModifier"
IL_2fe4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_EquipmentSpeedModifier
IL_2fe9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_2fee: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_2ff3: ldstr "ConfigEntry_Fader_Active_WindSpeedModifier"
IL_2ff8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_WindSpeedModifier
IL_2ffd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_3002: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_3007: ldstr "ConfigEntry_Fader_Active_RunStaminaCostModifier"
IL_300c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_RunStaminaCostModifier
IL_3011: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_3016: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_301b: ldstr "ConfigEntry_Fader_Active_JumpStaminaCostModifier"
IL_3020: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_JumpStaminaCostModifier
IL_3025: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_302a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_302f: ldstr "ConfigEntry_Fader_Active_StealthModifier"
IL_3034: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_StealthModifier
IL_3039: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_303e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_3043: ldstr "ConfigEntry_Fader_Active_NoiseModifier"
IL_3048: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_NoiseModifier
IL_304d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_3052: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_3057: ldstr "ConfigEntry_Fader_Active_StatusAttributes"
IL_305c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_StatusAttributes
IL_3061: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_3066: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_306b: ldstr "ConfigEntry_Fader_Active_OutgoingDamageTypes"
IL_3070: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_OutgoingDamageTypes
IL_3075: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_307a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_307f: ldstr "ConfigEntry_Fader_Active_OutgoingDamageModifiers"
IL_3084: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_OutgoingDamageModifiers
IL_3089: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_308e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_3093: ldstr "ConfigEntry_Fader_Active_FallDamageModifier"
IL_3098: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_FallDamageModifier
IL_309d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_30a2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_30a7: ldstr "ConfigEntry_Fader_Active_IncomingDamageTypes"
IL_30ac: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_IncomingDamageTypes
IL_30b1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_30b6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_30bb: ldstr "ConfigEntry_Fader_Active_IncomingDamageModifiers"
IL_30c0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_IncomingDamageModifiers
IL_30c5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_30ca: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_30cf: ldstr "ConfigEntry_Fader_Active_HeatDamageModifier"
IL_30d4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Active_HeatDamageModifier
IL_30d9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_30de: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_30e3: ldstr "ConfigEntry_Fader_Shared_MaxHealth"
IL_30e8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_MaxHealth
IL_30ed: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_30f2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_30f7: ldstr "ConfigEntry_Fader_Shared_HealthRegen"
IL_30fc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_HealthRegen
IL_3101: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_3106: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_310b: ldstr "ConfigEntry_Fader_Shared_HealthRegenModifier"
IL_3110: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_HealthRegenModifier
IL_3115: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_311a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_311f: ldstr "ConfigEntry_Fader_Shared_MaxStamina"
IL_3124: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_MaxStamina
IL_3129: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_312e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_3133: ldstr "ConfigEntry_Fader_Shared_StaminaRegenModifier"
IL_3138: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_StaminaRegenModifier
IL_313d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_3142: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_3147: ldstr "ConfigEntry_Fader_Shared_MaxEitr"
IL_314c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_MaxEitr
IL_3151: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_3156: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_315b: ldstr "ConfigEntry_Fader_Shared_EitrRegenModifier"
IL_3160: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_EitrRegenModifier
IL_3165: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_316a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_316f: ldstr "ConfigEntry_Fader_Shared_MaxWeight"
IL_3174: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_MaxWeight
IL_3179: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_317e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_3183: ldstr "ConfigEntry_Fader_Shared_MoveSpeedModifier"
IL_3188: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_MoveSpeedModifier
IL_318d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_3192: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_3197: ldstr "ConfigEntry_Fader_Shared_JumpForceModifier"
IL_319c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_JumpForceModifier
IL_31a1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_31a6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_31ab: ldstr "ConfigEntry_Fader_Shared_MaxFallSpeed"
IL_31b0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_MaxFallSpeed
IL_31b5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_31ba: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_31bf: ldstr "ConfigEntry_Fader_Shared_EquipmentSpeedModifier"
IL_31c4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_EquipmentSpeedModifier
IL_31c9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_31ce: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_31d3: ldstr "ConfigEntry_Fader_Shared_WindSpeedModifier"
IL_31d8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_WindSpeedModifier
IL_31dd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_31e2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_31e7: ldstr "ConfigEntry_Fader_Shared_RunStaminaCostModifier"
IL_31ec: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_RunStaminaCostModifier
IL_31f1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_31f6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_31fb: ldstr "ConfigEntry_Fader_Shared_JumpStaminaCostModifier"
IL_3200: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_JumpStaminaCostModifier
IL_3205: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_320a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_320f: ldstr "ConfigEntry_Fader_Shared_StealthModifier"
IL_3214: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_StealthModifier
IL_3219: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_321e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_3223: ldstr "ConfigEntry_Fader_Shared_NoiseModifier"
IL_3228: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_NoiseModifier
IL_322d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_3232: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_3237: ldstr "ConfigEntry_Fader_Shared_StatusAttributes"
IL_323c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_StatusAttributes
IL_3241: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_3246: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_324b: ldstr "ConfigEntry_Fader_Shared_OutgoingDamageTypes"
IL_3250: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_OutgoingDamageTypes
IL_3255: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_325a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_325f: ldstr "ConfigEntry_Fader_Shared_OutgoingDamageModifiers"
IL_3264: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_OutgoingDamageModifiers
IL_3269: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_326e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_3273: ldstr "ConfigEntry_Fader_Shared_FallDamageModifier"
IL_3278: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_FallDamageModifier
IL_327d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_3282: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_3287: ldstr "ConfigEntry_Fader_Shared_IncomingDamageTypes"
IL_328c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_IncomingDamageTypes
IL_3291: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_3296: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_329b: ldstr "ConfigEntry_Fader_Shared_IncomingDamageModifiers"
IL_32a0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_IncomingDamageModifiers
IL_32a5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_32aa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_32af: ldstr "ConfigEntry_Fader_Shared_HeatDamageModifier"
IL_32b4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Shared_HeatDamageModifier
IL_32b9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_32be: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_32c3: ldstr "ConfigEntry_Fader_Equipped_MaxHealth"
IL_32c8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_MaxHealth
IL_32cd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_32d2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_32d7: ldstr "ConfigEntry_Fader_Equipped_HealthRegen"
IL_32dc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_HealthRegen
IL_32e1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_32e6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_32eb: ldstr "ConfigEntry_Fader_Equipped_HealthRegenModifier"
IL_32f0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_HealthRegenModifier
IL_32f5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_32fa: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_32ff: ldstr "ConfigEntry_Fader_Equipped_MaxStamina"
IL_3304: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_MaxStamina
IL_3309: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_330e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_3313: ldstr "ConfigEntry_Fader_Equipped_StaminaRegenModifier"
IL_3318: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_StaminaRegenModifier
IL_331d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_3322: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_3327: ldstr "ConfigEntry_Fader_Equipped_MaxEitr"
IL_332c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_MaxEitr
IL_3331: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_3336: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_333b: ldstr "ConfigEntry_Fader_Equipped_EitrRegenModifier"
IL_3340: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_EitrRegenModifier
IL_3345: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_334a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_334f: ldstr "ConfigEntry_Fader_Equipped_MaxWeight"
IL_3354: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_MaxWeight
IL_3359: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::Add(!0,!1)
IL_335e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_3363: ldstr "ConfigEntry_Fader_Equipped_MoveSpeedModifier"
IL_3368: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_MoveSpeedModifier
IL_336d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_3372: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_3377: ldstr "ConfigEntry_Fader_Equipped_JumpForceModifier"
IL_337c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_JumpForceModifier
IL_3381: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_3386: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_338b: ldstr "ConfigEntry_Fader_Equipped_MaxFallSpeed"
IL_3390: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_MaxFallSpeed
IL_3395: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_339a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_339f: ldstr "ConfigEntry_Fader_Equipped_EquipmentSpeedModifier"
IL_33a4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_EquipmentSpeedModifier
IL_33a9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_33ae: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_33b3: ldstr "ConfigEntry_Fader_Equipped_WindSpeedModifier"
IL_33b8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_WindSpeedModifier
IL_33bd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_33c2: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_33c7: ldstr "ConfigEntry_Fader_Equipped_RunStaminaCostModifier"
IL_33cc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_RunStaminaCostModifier
IL_33d1: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_33d6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_33db: ldstr "ConfigEntry_Fader_Equipped_JumpStaminaCostModifier"
IL_33e0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_JumpStaminaCostModifier
IL_33e5: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_33ea: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_33ef: ldstr "ConfigEntry_Fader_Equipped_StealthModifier"
IL_33f4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_StealthModifier
IL_33f9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_33fe: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_3403: ldstr "ConfigEntry_Fader_Equipped_NoiseModifier"
IL_3408: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_NoiseModifier
IL_340d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_3412: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_3417: ldstr "ConfigEntry_Fader_Equipped_StatusAttributes"
IL_341c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_StatusAttributes
IL_3421: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_3426: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_342b: ldstr "ConfigEntry_Fader_Equipped_OutgoingDamageTypes"
IL_3430: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_OutgoingDamageTypes
IL_3435: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_343a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_343f: ldstr "ConfigEntry_Fader_Equipped_OutgoingDamageModifiers"
IL_3444: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_OutgoingDamageModifiers
IL_3449: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_344e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_3453: ldstr "ConfigEntry_Fader_Equipped_FallDamageModifier"
IL_3458: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_FallDamageModifier
IL_345d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_3462: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_3467: ldstr "ConfigEntry_Fader_Equipped_IncomingDamageTypes"
IL_346c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_IncomingDamageTypes
IL_3471: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_3476: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_347b: ldstr "ConfigEntry_Fader_Equipped_IncomingDamageModifiers"
IL_3480: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_IncomingDamageModifiers
IL_3485: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::Add(!0,!1)
IL_348a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_348f: ldstr "ConfigEntry_Fader_Equipped_HeatDamageModifier"
IL_3494: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_Fader_Equipped_HeatDamageModifier
IL_3499: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::Add(!0,!1)
IL_349e: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Awake()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Add_ConfigEntries()
IL_0006: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Add_Buttons()
IL_000b: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Add_StatusEffects()
IL_0010: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Add_Translations()
IL_0015: ldstr "JuneGame.Valheim.ForsakenPowerOverhaul"
IL_001a: newobj System.Void HarmonyLib.Harmony::.ctor(System.String)
IL_001f: callvirt System.Void HarmonyLib.Harmony::PatchAll()
IL_0024: ldsfld System.Action ForsakenPowerOverhaul.ForsakenPowerOverhaul/<>O::<1>__Add_Prefabs
IL_0029: dup
IL_002a: brtrue.s IL_003f
IL_002c: pop
IL_002d: ldnull
IL_002e: ldftn System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Add_Prefabs()
IL_0034: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_0039: dup
IL_003a: stsfld System.Action ForsakenPowerOverhaul.ForsakenPowerOverhaul/<>O::<1>__Add_Prefabs
IL_003f: call System.Void Jotunn.Managers.PrefabManager::add_OnVanillaPrefabsAvailable(System.Action)
IL_0044: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Start()
.locals 
IL_0000: call System.Collections.Generic.Dictionary`2<System.String,BepInEx.PluginInfo> BepInEx.Bootstrap.Chainloader::get_PluginInfos()
IL_0005: ldstr "randyknapp.mods.auga"
IL_000a: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,BepInEx.PluginInfo>::ContainsKey(!0)
IL_000f: stsfld System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul::Mod_Auga
IL_0014: call System.Collections.Generic.Dictionary`2<System.String,BepInEx.PluginInfo> BepInEx.Bootstrap.Chainloader::get_PluginInfos()
IL_0019: ldstr "randyknapp.mods.epicloot"
IL_001e: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,BepInEx.PluginInfo>::ContainsKey(!0)
IL_0023: stsfld System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul::Mod_EpicLoot
IL_0028: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update()
.locals 
IL_0000: ldsfld ObjectDB ObjectDB::m_instance
IL_0005: ldnull
IL_0006: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_000b: brfalse IL_009c
IL_0010: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0015: ldnull
IL_0016: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_001b: brfalse.s IL_0022
IL_001d: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Add_StatusEffectLists()
IL_0022: ldsfld Player Player::m_localPlayer
IL_0027: ldnull
IL_0028: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_002d: brfalse.s IL_009c
IL_002f: ldsfld Player Player::m_localPlayer
IL_0034: callvirt System.Boolean Character::IsDead()
IL_0039: brtrue.s IL_009c
IL_003b: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Player_StatusEffects()
IL_0040: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Player_StatusEffects_Equipped()
IL_0045: ldsfld ZInput ZInput::m_instance
IL_004a: brfalse.s IL_009c
IL_004c: ldsfld Jotunn.Configs.ButtonConfig ForsakenPowerOverhaul.ForsakenPowerOverhaul::ButtonConfig_PowerCycle
IL_0051: brfalse.s IL_009c
IL_0053: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_PowerCycle_Bool
IL_0058: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_005d: brfalse.s IL_009c
IL_005f: ldsfld Jotunn.Configs.ButtonConfig ForsakenPowerOverhaul.ForsakenPowerOverhaul::ButtonConfig_PowerCycle
IL_0064: callvirt System.String Jotunn.Configs.ButtonConfig::get_Name()
IL_0069: call System.Boolean ZInput::GetButtonDown(System.String)
IL_006e: brfalse.s IL_009c
IL_0070: ldsfld Player Player::m_localPlayer
IL_0075: callvirt System.Int32 Character::GetCurrentAnimHash()
IL_007a: ldc.i4 1183970330
IL_007f: beq.s IL_009c
IL_0081: ldsfld Player Player::m_localPlayer
IL_0086: callvirt System.String Player::GetGuardianPowerName()
IL_008b: ldstr "GP_"
IL_0090: callvirt System.Boolean System.String::StartsWith(System.String)
IL_0095: brfalse.s IL_009c
IL_0097: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Power_Cycle()
IL_009c: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Add_StatusEffectLists()
.locals 
IL_0000: ldsfld ObjectDB ObjectDB::m_instance
IL_0005: ldstr "SE_FPO_Passive"
IL_000a: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_000f: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_0014: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0019: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_001e: ldsfld ObjectDB ObjectDB::m_instance
IL_0023: ldstr "SE_FPO_Eikthyr"
IL_0028: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_002d: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_0032: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0037: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr
IL_003c: ldsfld ObjectDB ObjectDB::m_instance
IL_0041: ldstr "SE_FPO_TheElder"
IL_0046: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_004b: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_0050: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0055: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder
IL_005a: ldsfld ObjectDB ObjectDB::m_instance
IL_005f: ldstr "SE_FPO_Bonemass"
IL_0064: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0069: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_006e: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0073: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Bonemass
IL_0078: ldsfld ObjectDB ObjectDB::m_instance
IL_007d: ldstr "SE_FPO_Moder"
IL_0082: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0087: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_008c: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0091: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Moder
IL_0096: ldsfld ObjectDB ObjectDB::m_instance
IL_009b: ldstr "SE_FPO_Yagluth"
IL_00a0: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_00a5: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_00aa: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_00af: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Yagluth
IL_00b4: ldsfld ObjectDB ObjectDB::m_instance
IL_00b9: ldstr "SE_FPO_Queen"
IL_00be: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_00c3: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_00c8: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_00cd: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen
IL_00d2: ldsfld ObjectDB ObjectDB::m_instance
IL_00d7: ldstr "SE_FPO_Fader"
IL_00dc: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_00e1: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_00e6: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_00eb: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Fader
IL_00f0: ldsfld ObjectDB ObjectDB::m_instance
IL_00f5: ldstr "SE_FPO_Eikthyr_Passive"
IL_00fa: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_00ff: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_0104: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0109: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Passive
IL_010e: ldsfld ObjectDB ObjectDB::m_instance
IL_0113: ldstr "SE_FPO_TheElder_Passive"
IL_0118: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_011d: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_0122: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0127: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder_Passive
IL_012c: ldsfld ObjectDB ObjectDB::m_instance
IL_0131: ldstr "SE_FPO_Bonemass_Passive"
IL_0136: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_013b: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_0140: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0145: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Bonemass_Passive
IL_014a: ldsfld ObjectDB ObjectDB::m_instance
IL_014f: ldstr "SE_FPO_Moder_Passive"
IL_0154: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0159: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_015e: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0163: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Moder_Passive
IL_0168: ldsfld ObjectDB ObjectDB::m_instance
IL_016d: ldstr "SE_FPO_Yagluth_Passive"
IL_0172: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0177: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_017c: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0181: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Yagluth_Passive
IL_0186: ldsfld ObjectDB ObjectDB::m_instance
IL_018b: ldstr "SE_FPO_Queen_Passive"
IL_0190: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0195: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_019a: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_019f: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Passive
IL_01a4: ldsfld ObjectDB ObjectDB::m_instance
IL_01a9: ldstr "SE_FPO_Fader_Passive"
IL_01ae: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_01b3: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_01b8: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_01bd: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Fader_Passive
IL_01c2: ldsfld ObjectDB ObjectDB::m_instance
IL_01c7: ldstr "SE_FPO_Eikthyr_Equipped"
IL_01cc: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_01d1: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_01d6: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_01db: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Equipped
IL_01e0: ldsfld ObjectDB ObjectDB::m_instance
IL_01e5: ldstr "SE_FPO_TheElder_Equipped"
IL_01ea: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_01ef: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_01f4: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_01f9: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder_Equipped
IL_01fe: ldsfld ObjectDB ObjectDB::m_instance
IL_0203: ldstr "SE_FPO_Bonemass_Equipped"
IL_0208: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_020d: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_0212: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0217: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Bonemass_Equipped
IL_021c: ldsfld ObjectDB ObjectDB::m_instance
IL_0221: ldstr "SE_FPO_Moder_Equipped"
IL_0226: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_022b: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_0230: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0235: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Moder_Equipped
IL_023a: ldsfld ObjectDB ObjectDB::m_instance
IL_023f: ldstr "SE_FPO_Yagluth_Equipped"
IL_0244: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0249: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_024e: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0253: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Yagluth_Equipped
IL_0258: ldsfld ObjectDB ObjectDB::m_instance
IL_025d: ldstr "SE_FPO_Queen_Equipped"
IL_0262: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0267: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_026c: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0271: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Equipped
IL_0276: ldsfld ObjectDB ObjectDB::m_instance
IL_027b: ldstr "SE_FPO_Fader_Equipped"
IL_0280: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0285: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_028a: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_028f: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Fader_Equipped
IL_0294: ldsfld ObjectDB ObjectDB::m_instance
IL_0299: ldstr "SE_FPO_Eikthyr_Active"
IL_029e: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_02a3: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_02a8: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_02ad: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Active
IL_02b2: ldsfld ObjectDB ObjectDB::m_instance
IL_02b7: ldstr "SE_FPO_TheElder_Active"
IL_02bc: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_02c1: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_02c6: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_02cb: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder_Active
IL_02d0: ldsfld ObjectDB ObjectDB::m_instance
IL_02d5: ldstr "SE_FPO_Bonemass_Active"
IL_02da: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_02df: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_02e4: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_02e9: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Bonemass_Active
IL_02ee: ldsfld ObjectDB ObjectDB::m_instance
IL_02f3: ldstr "SE_FPO_Moder_Active"
IL_02f8: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_02fd: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_0302: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0307: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Moder_Active
IL_030c: ldsfld ObjectDB ObjectDB::m_instance
IL_0311: ldstr "SE_FPO_Yagluth_Active"
IL_0316: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_031b: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_0320: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0325: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Yagluth_Active
IL_032a: ldsfld ObjectDB ObjectDB::m_instance
IL_032f: ldstr "SE_FPO_Queen_Active"
IL_0334: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0339: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_033e: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0343: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Active
IL_0348: ldsfld ObjectDB ObjectDB::m_instance
IL_034d: ldstr "SE_FPO_Fader_Active"
IL_0352: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0357: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_035c: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0361: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Fader_Active
IL_0366: ldsfld ObjectDB ObjectDB::m_instance
IL_036b: ldstr "SE_FPO_Eikthyr_Shared"
IL_0370: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0375: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_037a: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_037f: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Shared
IL_0384: ldsfld ObjectDB ObjectDB::m_instance
IL_0389: ldstr "SE_FPO_TheElder_Shared"
IL_038e: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0393: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_0398: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_039d: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder_Shared
IL_03a2: ldsfld ObjectDB ObjectDB::m_instance
IL_03a7: ldstr "SE_FPO_Bonemass_Shared"
IL_03ac: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_03b1: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_03b6: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_03bb: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Bonemass_Shared
IL_03c0: ldsfld ObjectDB ObjectDB::m_instance
IL_03c5: ldstr "SE_FPO_Moder_Shared"
IL_03ca: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_03cf: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_03d4: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_03d9: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Moder_Shared
IL_03de: ldsfld ObjectDB ObjectDB::m_instance
IL_03e3: ldstr "SE_FPO_Yagluth_Shared"
IL_03e8: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_03ed: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_03f2: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_03f7: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Yagluth_Shared
IL_03fc: ldsfld ObjectDB ObjectDB::m_instance
IL_0401: ldstr "SE_FPO_Queen_Shared"
IL_0406: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_040b: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_0410: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0415: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Shared
IL_041a: ldsfld ObjectDB ObjectDB::m_instance
IL_041f: ldstr "SE_FPO_Fader_Shared"
IL_0424: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0429: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_042e: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0433: stsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Fader_Shared
IL_0438: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_043d: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Clear()
IL_0442: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0447: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr
IL_044c: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_0451: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0456: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder
IL_045b: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_0460: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0465: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Bonemass
IL_046a: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_046f: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0474: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Moder
IL_0479: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_047e: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0483: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Yagluth
IL_0488: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_048d: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0492: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen
IL_0497: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_049c: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_04a1: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Fader
IL_04a6: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_04ab: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Passive
IL_04b0: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Clear()
IL_04b5: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Passive
IL_04ba: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Passive
IL_04bf: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_04c4: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Passive
IL_04c9: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder_Passive
IL_04ce: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_04d3: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Passive
IL_04d8: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Bonemass_Passive
IL_04dd: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_04e2: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Passive
IL_04e7: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Moder_Passive
IL_04ec: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_04f1: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Passive
IL_04f6: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Yagluth_Passive
IL_04fb: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_0500: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Passive
IL_0505: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Passive
IL_050a: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_050f: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Passive
IL_0514: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Fader_Passive
IL_0519: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_051e: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Equipped
IL_0523: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Clear()
IL_0528: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Equipped
IL_052d: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Equipped
IL_0532: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_0537: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Equipped
IL_053c: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder_Equipped
IL_0541: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_0546: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Equipped
IL_054b: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Bonemass_Equipped
IL_0550: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_0555: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Equipped
IL_055a: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Moder_Equipped
IL_055f: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_0564: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Equipped
IL_0569: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Yagluth_Equipped
IL_056e: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_0573: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Equipped
IL_0578: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Equipped
IL_057d: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_0582: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Equipped
IL_0587: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Fader_Equipped
IL_058c: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_0591: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_0596: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Clear()
IL_059b: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_05a0: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Active
IL_05a5: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_05aa: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_05af: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder_Active
IL_05b4: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_05b9: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_05be: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Bonemass_Active
IL_05c3: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_05c8: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_05cd: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Moder_Active
IL_05d2: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_05d7: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_05dc: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Yagluth_Active
IL_05e1: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_05e6: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_05eb: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Active
IL_05f0: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_05f5: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_05fa: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Fader_Active
IL_05ff: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_0604: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Shared
IL_0609: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Clear()
IL_060e: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Shared
IL_0613: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Shared
IL_0618: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_061d: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Shared
IL_0622: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder_Shared
IL_0627: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_062c: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Shared
IL_0631: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Bonemass_Shared
IL_0636: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_063b: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Shared
IL_0640: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Moder_Shared
IL_0645: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_064a: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Shared
IL_064f: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Yagluth_Shared
IL_0654: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_0659: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Shared
IL_065e: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Shared
IL_0663: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_0668: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Shared
IL_066d: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Fader_Shared
IL_0672: callvirt System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::Add(!0)
IL_0677: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::GlobalKeys_Update(BossStone)
.locals System.String, System.Boolean
IL_0000: ldc.i4.0
IL_0001: stloc.1
IL_0002: ldarg.0
IL_0003: ldfld ItemStand BossStone::m_itemStand
IL_0008: callvirt System.Boolean ItemStand::HaveAttachment()
IL_000d: brfalse.s IL_005b
IL_000f: ldarg.0
IL_0010: ldfld ItemStand BossStone::m_itemStand
IL_0015: ldfld System.String ItemStand::m_currentItemName
IL_001a: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetBossName(System.String)
IL_001f: stloc.0
IL_0020: call ZoneSystem ZoneSystem::get_instance()
IL_0025: ldstr "gk_fpo_bossstone_"
IL_002a: ldloc.0
IL_002b: call System.String System.String::Concat(System.String,System.String)
IL_0030: callvirt System.Boolean ZoneSystem::GetGlobalKey(System.String)
IL_0035: brtrue.s IL_005b
IL_0037: ldloc.0
IL_0038: ldstr ""
IL_003d: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_0042: brfalse.s IL_005b
IL_0044: call ZoneSystem ZoneSystem::get_instance()
IL_0049: ldstr "gk_fpo_bossstone_"
IL_004e: ldloc.0
IL_004f: call System.String System.String::Concat(System.String,System.String)
IL_0054: callvirt System.Void ZoneSystem::SetGlobalKey(System.String)
IL_0059: ldc.i4.1
IL_005a: stloc.1
IL_005b: ldloc.1
IL_005c: brfalse.s IL_006d
IL_005e: call ZoneSystem ZoneSystem::get_instance()
IL_0063: ldstr "gk_fpo_bossstone_passive"
IL_0068: callvirt System.Void ZoneSystem::SetGlobalKey(System.String)
IL_006d: ret

// System.Collections.Generic.List`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::GlobalKeys_Sort()
.locals System.Collections.Generic.List`1<System.String>, System.Collections.Generic.List`1/Enumerator<System.String>, System.String
IL_0000: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor()
IL_0005: stloc.0
IL_0006: ldsfld System.Collections.Generic.List`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_BossNames
IL_000b: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_0010: stloc.1
IL_0011: br.s IL_0043
IL_0013: ldloca.s V_1
IL_0015: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_001a: stloc.2
IL_001b: call ZoneSystem ZoneSystem::get_instance()
IL_0020: ldstr "gk_fpo_bossstone_"
IL_0025: ldloc.2
IL_0026: call System.String System.String::Concat(System.String,System.String)
IL_002b: callvirt System.Boolean ZoneSystem::GetGlobalKey(System.String)
IL_0030: brfalse.s IL_0043
IL_0032: ldloc.0
IL_0033: ldstr "gk_fpo_bossstone_"
IL_0038: ldloc.2
IL_0039: call System.String System.String::Concat(System.String,System.String)
IL_003e: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_0043: ldloca.s V_1
IL_0045: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_004a: brtrue.s IL_0013
IL_004c: leave.s IL_005c
IL_004e: ldloca.s V_1
IL_0050: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_0056: callvirt System.Void System.IDisposable::Dispose()
IL_005b: endfinally
IL_005c: ldloc.0
IL_005d: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.String>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0062: ret
// EH Finally: 17 - 78 => 78 - 92

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::PlayerKeys_Update()
.locals System.Collections.Generic.List`1/Enumerator<System.String>, System.String
IL_0000: ldsfld Player Player::m_localPlayer
IL_0005: ldnull
IL_0006: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_000b: brfalse.s IL_0067
IL_000d: call ZoneSystem ZoneSystem::get_instance()
IL_0012: callvirt System.Collections.Generic.List`1<System.String> ZoneSystem::GetGlobalKeys()
IL_0017: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_001c: stloc.0
IL_001d: br.s IL_004e
IL_001f: ldloca.s V_0
IL_0021: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_0026: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetBossName(System.String)
IL_002b: stloc.1
IL_002c: ldloc.1
IL_002d: ldstr ""
IL_0032: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_0037: brfalse.s IL_004e
IL_0039: ldsfld Player Player::m_localPlayer
IL_003e: ldstr "GP_"
IL_0043: ldloc.1
IL_0044: call System.String System.String::Concat(System.String,System.String)
IL_0049: callvirt System.Void Humanoid::AddUniqueKey(System.String)
IL_004e: ldloca.s V_0
IL_0050: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_0055: brtrue.s IL_001f
IL_0057: leave.s IL_0067
IL_0059: ldloca.s V_0
IL_005b: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_0061: callvirt System.Void System.IDisposable::Dispose()
IL_0066: endfinally
IL_0067: ret
// EH Finally: 29 - 89 => 89 - 103

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Player_StatusEffects()
.locals 
IL_0000: ldsfld Player Player::m_localPlayer
IL_0005: ldfld SEMan Character::m_seman
IL_000a: ldstr "SE_FPO_Passive"
IL_000f: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0014: callvirt StatusEffect SEMan::GetStatusEffect(System.Int32)
IL_0019: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_001e: brfalse.s IL_0079
IL_0020: ldsfld Player Player::m_localPlayer
IL_0025: ldfld SEMan Character::m_seman
IL_002a: ldstr "SE_FPO_Passive"
IL_002f: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0034: callvirt StatusEffect SEMan::GetStatusEffect(System.Int32)
IL_0039: callvirt System.String StatusEffect::GetTooltipString()
IL_003e: ldsfld ObjectDB ObjectDB::m_instance
IL_0043: ldstr "SE_FPO_Passive"
IL_0048: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_004d: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_0052: callvirt System.String StatusEffect::GetTooltipString()
IL_0057: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_005c: brfalse.s IL_0079
IL_005e: ldsfld Player Player::m_localPlayer
IL_0063: ldfld SEMan Character::m_seman
IL_0068: ldstr "SE_FPO_Passive"
IL_006d: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0072: ldc.i4.0
IL_0073: callvirt System.Boolean SEMan::RemoveStatusEffect(System.Int32,System.Boolean)
IL_0078: pop
IL_0079: ldsfld Player Player::m_localPlayer
IL_007e: ldfld SEMan Character::m_seman
IL_0083: ldstr "SE_FPO_Passive"
IL_0088: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_008d: callvirt StatusEffect SEMan::GetStatusEffect(System.Int32)
IL_0092: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0097: brtrue.s IL_00cc
IL_0099: call ZoneSystem ZoneSystem::get_instance()
IL_009e: ldstr "gk_fpo_bossstone_passive"
IL_00a3: callvirt System.Boolean ZoneSystem::GetGlobalKey(System.String)
IL_00a8: brfalse.s IL_00cc
IL_00aa: ldsfld Player Player::m_localPlayer
IL_00af: ldfld SEMan Character::m_seman
IL_00b4: ldstr "SE_FPO_Passive"
IL_00b9: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_00be: ldc.i4.0
IL_00bf: ldc.i4.0
IL_00c0: ldc.r4 0
IL_00c5: ldc.i4.m1
IL_00c6: callvirt StatusEffect SEMan::AddStatusEffect(System.Int32,System.Boolean,System.Int32,System.Single,System.Int16)
IL_00cb: pop
IL_00cc: ldsfld Player Player::m_localPlayer
IL_00d1: ldfld SEMan Character::m_seman
IL_00d6: ldstr "CorpseRun"
IL_00db: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_00e0: callvirt StatusEffect SEMan::GetStatusEffect(System.Int32)
IL_00e5: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_00ea: brfalse.s IL_0113
IL_00ec: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Config_SE_CorpseRun_Bool
IL_00f1: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_00f6: brtrue.s IL_0113
IL_00f8: ldsfld Player Player::m_localPlayer
IL_00fd: ldfld SEMan Character::m_seman
IL_0102: ldstr "CorpseRun"
IL_0107: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_010c: ldc.i4.0
IL_010d: callvirt System.Boolean SEMan::RemoveStatusEffect(System.Int32,System.Boolean)
IL_0112: pop
IL_0113: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Player_StatusEffects_Equipped()
.locals System.Collections.Generic.List`1/Enumerator<System.String>, System.String, System.String
IL_0000: ldsfld System.Collections.Generic.List`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_BossNames
IL_0005: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_000a: stloc.0
IL_000b: br IL_0182
IL_0010: ldloca.s V_0
IL_0012: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_0017: stloc.1
IL_0018: ldloc.1
IL_0019: ldstr "Fader"
IL_001e: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0023: brtrue.s IL_0032
IL_0025: ldstr "GP_"
IL_002a: ldloc.1
IL_002b: call System.String System.String::Concat(System.String,System.String)
IL_0030: br.s IL_0037
IL_0032: ldstr "GP_Ashlands"
IL_0037: stloc.2
IL_0038: ldsfld Player Player::m_localPlayer
IL_003d: ldfld SEMan Character::m_seman
IL_0042: ldstr "SE_FPO_"
IL_0047: ldloc.1
IL_0048: ldstr "_Equipped"
IL_004d: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0052: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0057: callvirt StatusEffect SEMan::GetStatusEffect(System.Int32)
IL_005c: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0061: brfalse IL_0118
IL_0066: ldsfld Player Player::m_localPlayer
IL_006b: ldfld SEMan Character::m_seman
IL_0070: ldstr "SE_FPO_"
IL_0075: ldloc.1
IL_0076: ldstr "_Equipped"
IL_007b: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0080: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0085: callvirt StatusEffect SEMan::GetStatusEffect(System.Int32)
IL_008a: callvirt System.String StatusEffect::GetTooltipString()
IL_008f: ldsfld ObjectDB ObjectDB::m_instance
IL_0094: ldstr "SE_FPO_"
IL_0099: ldloc.1
IL_009a: ldstr "_Equipped"
IL_009f: call System.String System.String::Concat(System.String,System.String,System.String)
IL_00a4: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_00a9: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_00ae: callvirt System.String StatusEffect::GetTooltipString()
IL_00b3: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_00b8: brfalse.s IL_00e0
IL_00ba: ldsfld Player Player::m_localPlayer
IL_00bf: ldfld SEMan Character::m_seman
IL_00c4: ldstr "SE_FPO_"
IL_00c9: ldloc.1
IL_00ca: ldstr "_Equipped"
IL_00cf: call System.String System.String::Concat(System.String,System.String,System.String)
IL_00d4: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_00d9: ldc.i4.0
IL_00da: callvirt System.Boolean SEMan::RemoveStatusEffect(System.Int32,System.Boolean)
IL_00df: pop
IL_00e0: ldsfld Player Player::m_localPlayer
IL_00e5: callvirt System.String Player::GetGuardianPowerName()
IL_00ea: ldloc.2
IL_00eb: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_00f0: brfalse.s IL_0118
IL_00f2: ldsfld Player Player::m_localPlayer
IL_00f7: ldfld SEMan Character::m_seman
IL_00fc: ldstr "SE_FPO_"
IL_0101: ldloc.1
IL_0102: ldstr "_Equipped"
IL_0107: call System.String System.String::Concat(System.String,System.String,System.String)
IL_010c: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0111: ldc.i4.0
IL_0112: callvirt System.Boolean SEMan::RemoveStatusEffect(System.Int32,System.Boolean)
IL_0117: pop
IL_0118: ldsfld Player Player::m_localPlayer
IL_011d: ldfld SEMan Character::m_seman
IL_0122: ldstr "SE_FPO_"
IL_0127: ldloc.1
IL_0128: ldstr "_Equipped"
IL_012d: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0132: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0137: callvirt StatusEffect SEMan::GetStatusEffect(System.Int32)
IL_013c: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0141: brtrue.s IL_0182
IL_0143: ldsfld Player Player::m_localPlayer
IL_0148: callvirt System.String Player::GetGuardianPowerName()
IL_014d: ldloc.2
IL_014e: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0153: brfalse.s IL_0182
IL_0155: ldsfld Player Player::m_localPlayer
IL_015a: ldfld SEMan Character::m_seman
IL_015f: ldstr "SE_FPO_"
IL_0164: ldloc.1
IL_0165: ldstr "_Equipped"
IL_016a: call System.String System.String::Concat(System.String,System.String,System.String)
IL_016f: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0174: ldc.i4.0
IL_0175: ldc.i4.0
IL_0176: ldc.r4 0
IL_017b: ldc.i4.m1
IL_017c: callvirt StatusEffect SEMan::AddStatusEffect(System.Int32,System.Boolean,System.Int32,System.Single,System.Int16)
IL_0181: pop
IL_0182: ldloca.s V_0
IL_0184: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_0189: brtrue IL_0010
IL_018e: leave.s IL_019e
IL_0190: ldloca.s V_0
IL_0192: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_0198: callvirt System.Void System.IDisposable::Dispose()
IL_019d: endfinally
IL_019e: ret
// EH Finally: 11 - 400 => 400 - 414

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Passive_Stats()
.locals StatusEffect, System.Collections.Generic.List`1<System.Single>, System.Collections.Generic.List`1/Enumerator<System.String>, System.String, ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO, ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO, System.Int32, System.Char, System.Collections.Generic.List`1<System.Single>
IL_0000: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0005: ldc.r4 0
IL_000a: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxHealth
IL_000f: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0014: ldc.r4 0
IL_0019: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HealthRegen
IL_001e: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0023: ldc.r4 1
IL_0028: stfld System.Single SE_Stats::m_healthRegenMultiplier
IL_002d: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0032: ldc.r4 0
IL_0037: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxStamina
IL_003c: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0041: ldc.r4 1
IL_0046: stfld System.Single SE_Stats::m_staminaRegenMultiplier
IL_004b: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0050: ldc.r4 0
IL_0055: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxEitr
IL_005a: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_005f: ldc.r4 1
IL_0064: stfld System.Single SE_Stats::m_eitrRegenMultiplier
IL_0069: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_006e: ldc.r4 0
IL_0073: stfld System.Single SE_Stats::m_addMaxCarryWeight
IL_0078: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_007d: ldc.r4 0
IL_0082: stfld System.Single SE_Stats::m_speedModifier
IL_0087: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_008c: call UnityEngine.Vector3 UnityEngine.Vector3::get_zero()
IL_0091: stfld UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_0096: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_009b: ldc.r4 0
IL_00a0: stfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_00a5: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_00aa: ldc.r4 0
IL_00af: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_EquipmentSpeedModifier
IL_00b4: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_00b9: ldc.r4 0
IL_00be: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_WindSpeedModifier
IL_00c3: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_00c8: ldc.r4 0
IL_00cd: stfld System.Single SE_Stats::m_runStaminaDrainModifier
IL_00d2: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_00d7: ldc.r4 0
IL_00dc: stfld System.Single SE_Stats::m_jumpStaminaUseModifier
IL_00e1: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_00e6: ldc.r4 0
IL_00eb: stfld System.Single SE_Stats::m_stealthModifier
IL_00f0: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_00f5: ldc.r4 0
IL_00fa: stfld System.Single SE_Stats::m_noiseModifier
IL_00ff: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0104: newobj System.Void System.Collections.Generic.List`1<StatusEffect/StatusAttribute>::.ctor()
IL_0109: stfld System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_StatusAttributes
IL_010e: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0113: newobj System.Void System.Collections.Generic.List`1<Skills/SkillType>::.ctor()
IL_0118: stfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_011d: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0122: newobj System.Void System.Collections.Generic.List`1<System.Single>::.ctor()
IL_0127: stfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_012c: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0131: ldc.r4 0
IL_0136: stfld System.Single SE_Stats::m_fallDamageModifier
IL_013b: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0140: ldc.r4 0
IL_0145: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HeatDamageModifier
IL_014a: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_014f: newobj System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::.ctor()
IL_0154: stfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_0159: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_015e: ldc.r4 0
IL_0163: stfld System.Single StatusEffect::m_ttl
IL_0168: ldsfld ObjectDB ObjectDB::m_instance
IL_016d: ldstr "Rested"
IL_0172: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0177: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_017c: stloc.0
IL_017d: ldloc.0
IL_017e: ldnull
IL_017f: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0184: brfalse.s IL_0196
IL_0186: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_018b: ldloc.0
IL_018c: ldfld UnityEngine.Sprite StatusEffect::m_icon
IL_0191: stfld UnityEngine.Sprite StatusEffect::m_icon
IL_0196: call ZoneSystem ZoneSystem::get_instance()
IL_019b: callvirt System.Collections.Generic.List`1<System.String> ZoneSystem::GetGlobalKeys()
IL_01a0: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_01a5: stloc.2
IL_01a6: br IL_0631
IL_01ab: ldloca.s V_2
IL_01ad: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_01b2: stloc.3
IL_01b3: ldloc.3
IL_01b4: ldstr "gk_fpo_bossstone_"
IL_01b9: callvirt System.Boolean System.String::StartsWith(System.String)
IL_01be: brfalse IL_0631
IL_01c3: ldloc.3
IL_01c4: ldstr "gk_fpo_bossstone_passive"
IL_01c9: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_01ce: brfalse IL_0631
IL_01d3: ldloc.3
IL_01d4: brfalse IL_0305
IL_01d9: ldloc.3
IL_01da: call System.Int32 System.String::get_Length()
IL_01df: stloc.s V_6
IL_01e1: ldloc.s V_6
IL_01e3: ldc.i4.s 22
IL_01e5: sub
IL_01e6: switch IL_0236,IL_0305,IL_0200,IL_021b
IL_01fb: br IL_0305
IL_0200: ldloc.3
IL_0201: ldc.i4.s 17
IL_0203: call System.Char System.String::get_Chars(System.Int32)
IL_0208: stloc.s V_7
IL_020a: ldloc.s V_7
IL_020c: ldc.i4.s 101
IL_020e: beq.s IL_0257
IL_0210: ldloc.s V_7
IL_0212: ldc.i4.s 121
IL_0214: beq.s IL_0269
IL_0216: br IL_0305
IL_021b: ldloc.3
IL_021c: ldc.i4.s 17
IL_021e: call System.Char System.String::get_Chars(System.Int32)
IL_0223: stloc.s V_7
IL_0225: ldloc.s V_7
IL_0227: ldc.i4.s 98
IL_0229: beq.s IL_028a
IL_022b: ldloc.s V_7
IL_022d: ldc.i4.s 116
IL_022f: beq.s IL_027b
IL_0231: br IL_0305
IL_0236: ldloc.3
IL_0237: ldc.i4.s 17
IL_0239: call System.Char System.String::get_Chars(System.Int32)
IL_023e: stloc.s V_7
IL_0240: ldloc.s V_7
IL_0242: ldc.i4.s 102
IL_0244: beq.s IL_02b7
IL_0246: ldloc.s V_7
IL_0248: ldc.i4.s 109
IL_024a: beq.s IL_0299
IL_024c: ldloc.s V_7
IL_024e: ldc.i4.s 113
IL_0250: beq.s IL_02a8
IL_0252: br IL_0305
IL_0257: ldloc.3
IL_0258: ldstr "gk_fpo_bossstone_eikthyr"
IL_025d: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0262: brtrue.s IL_02c6
IL_0264: br IL_0305
IL_0269: ldloc.3
IL_026a: ldstr "gk_fpo_bossstone_yagluth"
IL_026f: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0274: brtrue.s IL_02ea
IL_0276: br IL_0305
IL_027b: ldloc.3
IL_027c: ldstr "gk_fpo_bossstone_theelder"
IL_0281: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0286: brtrue.s IL_02cf
IL_0288: br.s IL_0305
IL_028a: ldloc.3
IL_028b: ldstr "gk_fpo_bossstone_bonemass"
IL_0290: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0295: brtrue.s IL_02d8
IL_0297: br.s IL_0305
IL_0299: ldloc.3
IL_029a: ldstr "gk_fpo_bossstone_moder"
IL_029f: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_02a4: brtrue.s IL_02e1
IL_02a6: br.s IL_0305
IL_02a8: ldloc.3
IL_02a9: ldstr "gk_fpo_bossstone_queen"
IL_02ae: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_02b3: brtrue.s IL_02f3
IL_02b5: br.s IL_0305
IL_02b7: ldloc.3
IL_02b8: ldstr "gk_fpo_bossstone_fader"
IL_02bd: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_02c2: brtrue.s IL_02fc
IL_02c4: br.s IL_0305
IL_02c6: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Passive
IL_02cb: stloc.s V_5
IL_02cd: br.s IL_0308
IL_02cf: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder_Passive
IL_02d4: stloc.s V_5
IL_02d6: br.s IL_0308
IL_02d8: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Bonemass_Passive
IL_02dd: stloc.s V_5
IL_02df: br.s IL_0308
IL_02e1: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Moder_Passive
IL_02e6: stloc.s V_5
IL_02e8: br.s IL_0308
IL_02ea: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Yagluth_Passive
IL_02ef: stloc.s V_5
IL_02f1: br.s IL_0308
IL_02f3: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Passive
IL_02f8: stloc.s V_5
IL_02fa: br.s IL_0308
IL_02fc: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Fader_Passive
IL_0301: stloc.s V_5
IL_0303: br.s IL_0308
IL_0305: ldnull
IL_0306: stloc.s V_5
IL_0308: ldloc.s V_5
IL_030a: stloc.s V_4
IL_030c: ldloc.s V_4
IL_030e: ldnull
IL_030f: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0314: brfalse IL_0631
IL_0319: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_031e: dup
IL_031f: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxHealth
IL_0324: ldloc.s V_4
IL_0326: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxHealth
IL_032b: add
IL_032c: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxHealth
IL_0331: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0336: dup
IL_0337: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HealthRegen
IL_033c: ldloc.s V_4
IL_033e: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HealthRegen
IL_0343: add
IL_0344: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HealthRegen
IL_0349: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_034e: dup
IL_034f: ldfld System.Single SE_Stats::m_healthRegenMultiplier
IL_0354: ldloc.s V_4
IL_0356: ldfld System.Single SE_Stats::m_healthRegenMultiplier
IL_035b: ldc.r4 1
IL_0360: sub
IL_0361: add
IL_0362: stfld System.Single SE_Stats::m_healthRegenMultiplier
IL_0367: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_036c: dup
IL_036d: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxStamina
IL_0372: ldloc.s V_4
IL_0374: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxStamina
IL_0379: add
IL_037a: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxStamina
IL_037f: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0384: dup
IL_0385: ldfld System.Single SE_Stats::m_staminaRegenMultiplier
IL_038a: ldloc.s V_4
IL_038c: ldfld System.Single SE_Stats::m_staminaRegenMultiplier
IL_0391: ldc.r4 1
IL_0396: sub
IL_0397: add
IL_0398: stfld System.Single SE_Stats::m_staminaRegenMultiplier
IL_039d: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_03a2: dup
IL_03a3: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxEitr
IL_03a8: ldloc.s V_4
IL_03aa: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxEitr
IL_03af: add
IL_03b0: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxEitr
IL_03b5: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_03ba: dup
IL_03bb: ldfld System.Single SE_Stats::m_eitrRegenMultiplier
IL_03c0: ldloc.s V_4
IL_03c2: ldfld System.Single SE_Stats::m_eitrRegenMultiplier
IL_03c7: ldc.r4 1
IL_03cc: sub
IL_03cd: add
IL_03ce: stfld System.Single SE_Stats::m_eitrRegenMultiplier
IL_03d3: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_03d8: dup
IL_03d9: ldfld System.Single SE_Stats::m_addMaxCarryWeight
IL_03de: ldloc.s V_4
IL_03e0: ldfld System.Single SE_Stats::m_addMaxCarryWeight
IL_03e5: add
IL_03e6: stfld System.Single SE_Stats::m_addMaxCarryWeight
IL_03eb: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_03f0: dup
IL_03f1: ldfld System.Single SE_Stats::m_speedModifier
IL_03f6: ldloc.s V_4
IL_03f8: ldfld System.Single SE_Stats::m_speedModifier
IL_03fd: add
IL_03fe: stfld System.Single SE_Stats::m_speedModifier
IL_0403: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0408: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_040d: ldflda UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_0412: ldfld System.Single UnityEngine.Vector3::x
IL_0417: ldloc.s V_4
IL_0419: ldflda UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_041e: ldfld System.Single UnityEngine.Vector3::x
IL_0423: add
IL_0424: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0429: ldflda UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_042e: ldfld System.Single UnityEngine.Vector3::y
IL_0433: ldloc.s V_4
IL_0435: ldflda UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_043a: ldfld System.Single UnityEngine.Vector3::y
IL_043f: add
IL_0440: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0445: ldflda UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_044a: ldfld System.Single UnityEngine.Vector3::z
IL_044f: ldloc.s V_4
IL_0451: ldflda UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_0456: ldfld System.Single UnityEngine.Vector3::z
IL_045b: add
IL_045c: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0461: stfld UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_0466: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_046b: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0470: ldfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_0475: ldc.r4 0
IL_047a: beq.s IL_04be
IL_047c: ldloc.s V_4
IL_047e: ldfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_0483: ldc.r4 0
IL_0488: beq.s IL_04b2
IL_048a: ldloc.s V_4
IL_048c: ldfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_0491: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0496: ldfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_049b: blt.s IL_04a9
IL_049d: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_04a2: ldfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_04a7: br.s IL_04c5
IL_04a9: ldloc.s V_4
IL_04ab: ldfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_04b0: br.s IL_04c5
IL_04b2: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_04b7: ldfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_04bc: br.s IL_04c5
IL_04be: ldloc.s V_4
IL_04c0: ldfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_04c5: stfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_04ca: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_04cf: dup
IL_04d0: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_EquipmentSpeedModifier
IL_04d5: ldloc.s V_4
IL_04d7: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_EquipmentSpeedModifier
IL_04dc: add
IL_04dd: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_EquipmentSpeedModifier
IL_04e2: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_04e7: dup
IL_04e8: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_WindSpeedModifier
IL_04ed: ldloc.s V_4
IL_04ef: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_WindSpeedModifier
IL_04f4: add
IL_04f5: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_WindSpeedModifier
IL_04fa: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_04ff: dup
IL_0500: ldfld System.Single SE_Stats::m_runStaminaDrainModifier
IL_0505: ldloc.s V_4
IL_0507: ldfld System.Single SE_Stats::m_runStaminaDrainModifier
IL_050c: add
IL_050d: stfld System.Single SE_Stats::m_runStaminaDrainModifier
IL_0512: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0517: dup
IL_0518: ldfld System.Single SE_Stats::m_jumpStaminaUseModifier
IL_051d: ldloc.s V_4
IL_051f: ldfld System.Single SE_Stats::m_jumpStaminaUseModifier
IL_0524: add
IL_0525: stfld System.Single SE_Stats::m_jumpStaminaUseModifier
IL_052a: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_052f: dup
IL_0530: ldfld System.Single SE_Stats::m_stealthModifier
IL_0535: ldloc.s V_4
IL_0537: ldfld System.Single SE_Stats::m_stealthModifier
IL_053c: add
IL_053d: stfld System.Single SE_Stats::m_stealthModifier
IL_0542: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0547: dup
IL_0548: ldfld System.Single SE_Stats::m_noiseModifier
IL_054d: ldloc.s V_4
IL_054f: ldfld System.Single SE_Stats::m_noiseModifier
IL_0554: add
IL_0555: stfld System.Single SE_Stats::m_noiseModifier
IL_055a: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_055f: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0564: ldfld System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_StatusAttributes
IL_0569: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<StatusEffect/StatusAttribute>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_056e: ldloc.s V_4
IL_0570: ldfld System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_StatusAttributes
IL_0575: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<StatusEffect/StatusAttribute>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_057a: call System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusAttributes_Concat(System.Collections.Generic.List`1<StatusEffect/StatusAttribute>,System.Collections.Generic.List`1<StatusEffect/StatusAttribute>)
IL_057f: stfld System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_StatusAttributes
IL_0584: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0589: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_058e: ldfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_0593: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<Skills/SkillType>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0598: ldloc.s V_4
IL_059a: ldfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_059f: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<Skills/SkillType>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_05a4: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_05a9: ldfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_05ae: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.Single>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_05b3: ldloc.s V_4
IL_05b5: ldfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_05ba: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.Single>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_05bf: ldloca.s V_8
IL_05c1: call System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul::OutgoingDamage_Concat(System.Collections.Generic.List`1<Skills/SkillType>,System.Collections.Generic.List`1<Skills/SkillType>,System.Collections.Generic.List`1<System.Single>,System.Collections.Generic.List`1<System.Single>,System.Collections.Generic.List`1<System.Single>&)
IL_05c6: stfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_05cb: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_05d0: ldloc.s V_8
IL_05d2: stfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_05d7: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_05dc: dup
IL_05dd: ldfld System.Single SE_Stats::m_fallDamageModifier
IL_05e2: ldloc.s V_4
IL_05e4: ldfld System.Single SE_Stats::m_fallDamageModifier
IL_05e9: add
IL_05ea: stfld System.Single SE_Stats::m_fallDamageModifier
IL_05ef: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_05f4: dup
IL_05f5: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HeatDamageModifier
IL_05fa: ldloc.s V_4
IL_05fc: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HeatDamageModifier
IL_0601: add
IL_0602: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HeatDamageModifier
IL_0607: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_060c: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0611: ldfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_0616: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<HitData/DamageModPair>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_061b: ldloc.s V_4
IL_061d: ldfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_0622: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<HitData/DamageModPair>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0627: call System.Collections.Generic.List`1<HitData/DamageModPair> ForsakenPowerOverhaul.ForsakenPowerOverhaul::IncomingDamage_Concat(System.Collections.Generic.List`1<HitData/DamageModPair>,System.Collections.Generic.List`1<HitData/DamageModPair>)
IL_062c: stfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_0631: ldloca.s V_2
IL_0633: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_0638: brtrue IL_01ab
IL_063d: leave.s IL_064d
IL_063f: ldloca.s V_2
IL_0641: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_0647: callvirt System.Void System.IDisposable::Dispose()
IL_064c: endfinally
IL_064d: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0652: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0657: ldfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_065c: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<Skills/SkillType>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0661: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0666: ldfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_066b: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.Single>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0670: ldloca.s V_1
IL_0672: call System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul::OutgoingDamage_Sort(System.Collections.Generic.List`1<Skills/SkillType>,System.Collections.Generic.List`1<System.Single>,System.Collections.Generic.List`1<System.Single>&)
IL_0677: stfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_067c: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0681: ldloc.1
IL_0682: stfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_0687: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_068c: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Passive
IL_0691: ldfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_0696: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<HitData/DamageModPair>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_069b: call System.Collections.Generic.List`1<HitData/DamageModPair> ForsakenPowerOverhaul.ForsakenPowerOverhaul::IncomingDamage_Sort(System.Collections.Generic.List`1<HitData/DamageModPair>)
IL_06a0: stfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_06a5: ret
// EH Finally: 422 - 1599 => 1599 - 1613

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Equipped_Stats()
.locals System.Collections.Generic.List`1/Enumerator<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>, ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO, System.String, StatusEffect
IL_0000: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Equipped
IL_0005: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::GetEnumerator()
IL_000a: stloc.0
IL_000b: br.s IL_007e
IL_000d: ldloca.s V_0
IL_000f: call !0 System.Collections.Generic.List`1/Enumerator<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Current()
IL_0014: stloc.1
IL_0015: ldloc.1
IL_0016: ldc.r4 0
IL_001b: stfld System.Single StatusEffect::m_ttl
IL_0020: ldloc.1
IL_0021: callvirt System.String UnityEngine.Object::get_name()
IL_0026: ldstr "SE_FPO_"
IL_002b: ldstr "GP_"
IL_0030: callvirt System.String System.String::Replace(System.String,System.String)
IL_0035: ldstr "_Equipped"
IL_003a: ldstr ""
IL_003f: callvirt System.String System.String::Replace(System.String,System.String)
IL_0044: stloc.2
IL_0045: ldloc.2
IL_0046: ldstr "GP_Fader"
IL_004b: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0050: brfalse.s IL_0058
IL_0052: ldstr "GP_Ashlands"
IL_0057: stloc.2
IL_0058: ldsfld ObjectDB ObjectDB::m_instance
IL_005d: ldloc.2
IL_005e: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_0063: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_0068: stloc.3
IL_0069: ldloc.3
IL_006a: ldnull
IL_006b: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0070: brfalse.s IL_007e
IL_0072: ldloc.1
IL_0073: ldloc.3
IL_0074: ldfld UnityEngine.Sprite StatusEffect::m_icon
IL_0079: stfld UnityEngine.Sprite StatusEffect::m_icon
IL_007e: ldloca.s V_0
IL_0080: call System.Boolean System.Collections.Generic.List`1/Enumerator<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::MoveNext()
IL_0085: brtrue.s IL_000d
IL_0087: leave.s IL_0097
IL_0089: ldloca.s V_0
IL_008b: constrained. System.Collections.Generic.List`1/Enumerator<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>
IL_0091: callvirt System.Void System.IDisposable::Dispose()
IL_0096: endfinally
IL_0097: ret
// EH Finally: 11 - 137 => 137 - 151

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Active_Stats()
.locals System.Int32, System.String, StatusEffect, System.Collections.Generic.List`1<System.Single>, System.Collections.Generic.List`1/Enumerator<System.String>, System.String, ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO, ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO, System.Int32, System.Char, System.Collections.Generic.List`1<System.Single>
IL_0000: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0005: callvirt System.Int32 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Count()
IL_000a: ldc.i4.0
IL_000b: ble IL_09f8
IL_0010: ldc.i4.0
IL_0011: stloc.0
IL_0012: br IL_09e8
IL_0017: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_001c: ldloc.0
IL_001d: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0022: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_0027: ldloc.0
IL_0028: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_002d: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxHealth
IL_0032: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxHealth
IL_0037: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_003c: ldloc.0
IL_003d: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0042: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_0047: ldloc.0
IL_0048: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_004d: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HealthRegen
IL_0052: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HealthRegen
IL_0057: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_005c: ldloc.0
IL_005d: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0062: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_0067: ldloc.0
IL_0068: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_006d: ldfld System.Single SE_Stats::m_healthRegenMultiplier
IL_0072: stfld System.Single SE_Stats::m_healthRegenMultiplier
IL_0077: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_007c: ldloc.0
IL_007d: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0082: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_0087: ldloc.0
IL_0088: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_008d: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxStamina
IL_0092: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxStamina
IL_0097: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_009c: ldloc.0
IL_009d: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_00a2: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_00a7: ldloc.0
IL_00a8: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_00ad: ldfld System.Single SE_Stats::m_staminaRegenMultiplier
IL_00b2: stfld System.Single SE_Stats::m_staminaRegenMultiplier
IL_00b7: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_00bc: ldloc.0
IL_00bd: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_00c2: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_00c7: ldloc.0
IL_00c8: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_00cd: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxEitr
IL_00d2: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxEitr
IL_00d7: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_00dc: ldloc.0
IL_00dd: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_00e2: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_00e7: ldloc.0
IL_00e8: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_00ed: ldfld System.Single SE_Stats::m_eitrRegenMultiplier
IL_00f2: stfld System.Single SE_Stats::m_eitrRegenMultiplier
IL_00f7: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_00fc: ldloc.0
IL_00fd: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0102: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_0107: ldloc.0
IL_0108: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_010d: ldfld System.Single SE_Stats::m_addMaxCarryWeight
IL_0112: stfld System.Single SE_Stats::m_addMaxCarryWeight
IL_0117: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_011c: ldloc.0
IL_011d: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0122: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_0127: ldloc.0
IL_0128: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_012d: ldfld System.Single SE_Stats::m_speedModifier
IL_0132: stfld System.Single SE_Stats::m_speedModifier
IL_0137: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_013c: ldloc.0
IL_013d: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0142: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_0147: ldloc.0
IL_0148: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_014d: ldfld UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_0152: stfld UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_0157: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_015c: ldloc.0
IL_015d: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0162: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_0167: ldloc.0
IL_0168: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_016d: ldfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_0172: stfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_0177: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_017c: ldloc.0
IL_017d: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0182: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_0187: ldloc.0
IL_0188: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_018d: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_EquipmentSpeedModifier
IL_0192: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_EquipmentSpeedModifier
IL_0197: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_019c: ldloc.0
IL_019d: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_01a2: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_01a7: ldloc.0
IL_01a8: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_01ad: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_WindSpeedModifier
IL_01b2: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_WindSpeedModifier
IL_01b7: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_01bc: ldloc.0
IL_01bd: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_01c2: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_01c7: ldloc.0
IL_01c8: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_01cd: ldfld System.Single SE_Stats::m_runStaminaDrainModifier
IL_01d2: stfld System.Single SE_Stats::m_runStaminaDrainModifier
IL_01d7: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_01dc: ldloc.0
IL_01dd: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_01e2: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_01e7: ldloc.0
IL_01e8: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_01ed: ldfld System.Single SE_Stats::m_jumpStaminaUseModifier
IL_01f2: stfld System.Single SE_Stats::m_jumpStaminaUseModifier
IL_01f7: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_01fc: ldloc.0
IL_01fd: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0202: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_0207: ldloc.0
IL_0208: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_020d: ldfld System.Single SE_Stats::m_stealthModifier
IL_0212: stfld System.Single SE_Stats::m_stealthModifier
IL_0217: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_021c: ldloc.0
IL_021d: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0222: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_0227: ldloc.0
IL_0228: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_022d: ldfld System.Single SE_Stats::m_noiseModifier
IL_0232: stfld System.Single SE_Stats::m_noiseModifier
IL_0237: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_023c: ldloc.0
IL_023d: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0242: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_0247: ldloc.0
IL_0248: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_024d: ldfld System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_StatusAttributes
IL_0252: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<StatusEffect/StatusAttribute>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0257: stfld System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_StatusAttributes
IL_025c: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0261: ldloc.0
IL_0262: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0267: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_026c: ldloc.0
IL_026d: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0272: ldfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_0277: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<Skills/SkillType>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_027c: stfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_0281: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0286: ldloc.0
IL_0287: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_028c: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_0291: ldloc.0
IL_0292: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0297: ldfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_029c: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.Single>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_02a1: stfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_02a6: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_02ab: ldloc.0
IL_02ac: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_02b1: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_02b6: ldloc.0
IL_02b7: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_02bc: ldfld System.Single SE_Stats::m_fallDamageModifier
IL_02c1: stfld System.Single SE_Stats::m_fallDamageModifier
IL_02c6: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_02cb: ldloc.0
IL_02cc: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_02d1: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_02d6: ldloc.0
IL_02d7: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_02dc: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HeatDamageModifier
IL_02e1: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HeatDamageModifier
IL_02e6: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_02eb: ldloc.0
IL_02ec: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_02f1: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_02f6: ldloc.0
IL_02f7: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_02fc: ldfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_0301: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<HitData/DamageModPair>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0306: stfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_030b: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0310: ldloc.0
IL_0311: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0316: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_General_GuardianPower_ActiveDuration
IL_031b: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0320: conv.r4
IL_0321: stfld System.Single StatusEffect::m_ttl
IL_0326: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_032b: ldloc.0
IL_032c: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0331: ldfld EffectList StatusEffect::m_startEffects
IL_0336: ldc.i4.1
IL_0337: newarr EffectList/EffectData
IL_033c: stfld EffectList/EffectData[] EffectList::m_effectPrefabs
IL_0341: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0346: ldloc.0
IL_0347: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_034c: ldfld EffectList StatusEffect::m_startEffects
IL_0351: ldfld EffectList/EffectData[] EffectList::m_effectPrefabs
IL_0356: ldc.i4.0
IL_0357: newobj System.Void EffectList/EffectData::.ctor()
IL_035c: dup
IL_035d: call Jotunn.Managers.PrefabManager Jotunn.Managers.PrefabManager::get_Instance()
IL_0362: ldstr "fx_GP_Activation"
IL_0367: callvirt UnityEngine.GameObject Jotunn.Managers.PrefabManager::GetPrefab(System.String)
IL_036c: stfld UnityEngine.GameObject EffectList/EffectData::m_prefab
IL_0371: stelem.ref
IL_0372: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0377: ldloc.0
IL_0378: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_037d: callvirt System.String UnityEngine.Object::get_name()
IL_0382: ldstr "SE_FPO_"
IL_0387: ldstr "GP_"
IL_038c: callvirt System.String System.String::Replace(System.String,System.String)
IL_0391: stloc.1
IL_0392: ldloc.1
IL_0393: ldstr "GP_Fader"
IL_0398: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_039d: brfalse.s IL_03a5
IL_039f: ldstr "GP_Ashlands"
IL_03a4: stloc.1
IL_03a5: ldsfld ObjectDB ObjectDB::m_instance
IL_03aa: ldloc.1
IL_03ab: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_03b0: callvirt StatusEffect ObjectDB::GetStatusEffect(System.Int32)
IL_03b5: stloc.2
IL_03b6: ldloc.2
IL_03b7: ldnull
IL_03b8: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_03bd: brfalse.s IL_03d5
IL_03bf: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_03c4: ldloc.0
IL_03c5: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_03ca: ldloc.2
IL_03cb: ldfld UnityEngine.Sprite StatusEffect::m_icon
IL_03d0: stfld UnityEngine.Sprite StatusEffect::m_icon
IL_03d5: call ZoneSystem ZoneSystem::get_instance()
IL_03da: callvirt System.Collections.Generic.List`1<System.String> ZoneSystem::GetGlobalKeys()
IL_03df: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_03e4: stloc.s V_4
IL_03e6: br IL_094c
IL_03eb: ldloca.s V_4
IL_03ed: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_03f2: stloc.s V_5
IL_03f4: ldloc.s V_5
IL_03f6: ldstr "gk_fpo_bossstone_"
IL_03fb: callvirt System.Boolean System.String::StartsWith(System.String)
IL_0400: brfalse IL_094c
IL_0405: ldloc.s V_5
IL_0407: ldstr "gk_fpo_bossstone_passive"
IL_040c: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_0411: brfalse IL_094c
IL_0416: ldloc.s V_5
IL_0418: brfalse IL_0554
IL_041d: ldloc.s V_5
IL_041f: call System.Int32 System.String::get_Length()
IL_0424: stloc.s V_8
IL_0426: ldloc.s V_8
IL_0428: ldc.i4.s 22
IL_042a: sub
IL_042b: switch IL_047d,IL_0554,IL_0445,IL_0461
IL_0440: br IL_0554
IL_0445: ldloc.s V_5
IL_0447: ldc.i4.s 17
IL_0449: call System.Char System.String::get_Chars(System.Int32)
IL_044e: stloc.s V_9
IL_0450: ldloc.s V_9
IL_0452: ldc.i4.s 101
IL_0454: beq.s IL_049f
IL_0456: ldloc.s V_9
IL_0458: ldc.i4.s 121
IL_045a: beq.s IL_04b2
IL_045c: br IL_0554
IL_0461: ldloc.s V_5
IL_0463: ldc.i4.s 17
IL_0465: call System.Char System.String::get_Chars(System.Int32)
IL_046a: stloc.s V_9
IL_046c: ldloc.s V_9
IL_046e: ldc.i4.s 98
IL_0470: beq.s IL_04d5
IL_0472: ldloc.s V_9
IL_0474: ldc.i4.s 116
IL_0476: beq.s IL_04c5
IL_0478: br IL_0554
IL_047d: ldloc.s V_5
IL_047f: ldc.i4.s 17
IL_0481: call System.Char System.String::get_Chars(System.Int32)
IL_0486: stloc.s V_9
IL_0488: ldloc.s V_9
IL_048a: ldc.i4.s 102
IL_048c: beq.s IL_0505
IL_048e: ldloc.s V_9
IL_0490: ldc.i4.s 109
IL_0492: beq.s IL_04e5
IL_0494: ldloc.s V_9
IL_0496: ldc.i4.s 113
IL_0498: beq.s IL_04f5
IL_049a: br IL_0554
IL_049f: ldloc.s V_5
IL_04a1: ldstr "gk_fpo_bossstone_eikthyr"
IL_04a6: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_04ab: brtrue.s IL_0515
IL_04ad: br IL_0554
IL_04b2: ldloc.s V_5
IL_04b4: ldstr "gk_fpo_bossstone_yagluth"
IL_04b9: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_04be: brtrue.s IL_0539
IL_04c0: br IL_0554
IL_04c5: ldloc.s V_5
IL_04c7: ldstr "gk_fpo_bossstone_theelder"
IL_04cc: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_04d1: brtrue.s IL_051e
IL_04d3: br.s IL_0554
IL_04d5: ldloc.s V_5
IL_04d7: ldstr "gk_fpo_bossstone_bonemass"
IL_04dc: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_04e1: brtrue.s IL_0527
IL_04e3: br.s IL_0554
IL_04e5: ldloc.s V_5
IL_04e7: ldstr "gk_fpo_bossstone_moder"
IL_04ec: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_04f1: brtrue.s IL_0530
IL_04f3: br.s IL_0554
IL_04f5: ldloc.s V_5
IL_04f7: ldstr "gk_fpo_bossstone_queen"
IL_04fc: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0501: brtrue.s IL_0542
IL_0503: br.s IL_0554
IL_0505: ldloc.s V_5
IL_0507: ldstr "gk_fpo_bossstone_fader"
IL_050c: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0511: brtrue.s IL_054b
IL_0513: br.s IL_0554
IL_0515: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Eikthyr_Shared
IL_051a: stloc.s V_7
IL_051c: br.s IL_0557
IL_051e: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_TheElder_Shared
IL_0523: stloc.s V_7
IL_0525: br.s IL_0557
IL_0527: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Bonemass_Shared
IL_052c: stloc.s V_7
IL_052e: br.s IL_0557
IL_0530: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Moder_Shared
IL_0535: stloc.s V_7
IL_0537: br.s IL_0557
IL_0539: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Yagluth_Shared
IL_053e: stloc.s V_7
IL_0540: br.s IL_0557
IL_0542: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Queen_Shared
IL_0547: stloc.s V_7
IL_0549: br.s IL_0557
IL_054b: ldsfld ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusEffect_FPO_Fader_Shared
IL_0550: stloc.s V_7
IL_0552: br.s IL_0557
IL_0554: ldnull
IL_0555: stloc.s V_7
IL_0557: ldloc.s V_7
IL_0559: stloc.s V_6
IL_055b: ldloc.s V_6
IL_055d: ldnull
IL_055e: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0563: brfalse IL_094c
IL_0568: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_056d: ldloc.0
IL_056e: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0573: dup
IL_0574: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxHealth
IL_0579: ldloc.s V_6
IL_057b: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxHealth
IL_0580: add
IL_0581: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxHealth
IL_0586: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_058b: ldloc.0
IL_058c: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0591: dup
IL_0592: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HealthRegen
IL_0597: ldloc.s V_6
IL_0599: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HealthRegen
IL_059e: add
IL_059f: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HealthRegen
IL_05a4: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_05a9: ldloc.0
IL_05aa: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_05af: dup
IL_05b0: ldfld System.Single SE_Stats::m_healthRegenMultiplier
IL_05b5: ldloc.s V_6
IL_05b7: ldfld System.Single SE_Stats::m_healthRegenMultiplier
IL_05bc: ldc.r4 1
IL_05c1: sub
IL_05c2: add
IL_05c3: stfld System.Single SE_Stats::m_healthRegenMultiplier
IL_05c8: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_05cd: ldloc.0
IL_05ce: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_05d3: dup
IL_05d4: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxStamina
IL_05d9: ldloc.s V_6
IL_05db: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxStamina
IL_05e0: add
IL_05e1: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxStamina
IL_05e6: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_05eb: ldloc.0
IL_05ec: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_05f1: dup
IL_05f2: ldfld System.Single SE_Stats::m_staminaRegenMultiplier
IL_05f7: ldloc.s V_6
IL_05f9: ldfld System.Single SE_Stats::m_staminaRegenMultiplier
IL_05fe: ldc.r4 1
IL_0603: sub
IL_0604: add
IL_0605: stfld System.Single SE_Stats::m_staminaRegenMultiplier
IL_060a: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_060f: ldloc.0
IL_0610: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0615: dup
IL_0616: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxEitr
IL_061b: ldloc.s V_6
IL_061d: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxEitr
IL_0622: add
IL_0623: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxEitr
IL_0628: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_062d: ldloc.0
IL_062e: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0633: dup
IL_0634: ldfld System.Single SE_Stats::m_eitrRegenMultiplier
IL_0639: ldloc.s V_6
IL_063b: ldfld System.Single SE_Stats::m_eitrRegenMultiplier
IL_0640: ldc.r4 1
IL_0645: sub
IL_0646: add
IL_0647: stfld System.Single SE_Stats::m_eitrRegenMultiplier
IL_064c: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0651: ldloc.0
IL_0652: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0657: dup
IL_0658: ldfld System.Single SE_Stats::m_addMaxCarryWeight
IL_065d: ldloc.s V_6
IL_065f: ldfld System.Single SE_Stats::m_addMaxCarryWeight
IL_0664: add
IL_0665: stfld System.Single SE_Stats::m_addMaxCarryWeight
IL_066a: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_066f: ldloc.0
IL_0670: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0675: dup
IL_0676: ldfld System.Single SE_Stats::m_speedModifier
IL_067b: ldloc.s V_6
IL_067d: ldfld System.Single SE_Stats::m_speedModifier
IL_0682: add
IL_0683: stfld System.Single SE_Stats::m_speedModifier
IL_0688: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_068d: ldloc.0
IL_068e: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0693: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0698: ldloc.0
IL_0699: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_069e: ldflda UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_06a3: ldfld System.Single UnityEngine.Vector3::x
IL_06a8: ldloc.s V_6
IL_06aa: ldflda UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_06af: ldfld System.Single UnityEngine.Vector3::x
IL_06b4: add
IL_06b5: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_06ba: ldloc.0
IL_06bb: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_06c0: ldflda UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_06c5: ldfld System.Single UnityEngine.Vector3::y
IL_06ca: ldloc.s V_6
IL_06cc: ldflda UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_06d1: ldfld System.Single UnityEngine.Vector3::y
IL_06d6: add
IL_06d7: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_06dc: ldloc.0
IL_06dd: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_06e2: ldflda UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_06e7: ldfld System.Single UnityEngine.Vector3::z
IL_06ec: ldloc.s V_6
IL_06ee: ldflda UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_06f3: ldfld System.Single UnityEngine.Vector3::z
IL_06f8: add
IL_06f9: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_06fe: stfld UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_0703: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0708: ldloc.0
IL_0709: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_070e: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0713: ldloc.0
IL_0714: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0719: ldfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_071e: ldc.r4 0
IL_0723: beq.s IL_0779
IL_0725: ldloc.s V_6
IL_0727: ldfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_072c: ldc.r4 0
IL_0731: beq.s IL_0767
IL_0733: ldloc.s V_6
IL_0735: ldfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_073a: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_073f: ldloc.0
IL_0740: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0745: ldfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_074a: blt.s IL_075e
IL_074c: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0751: ldloc.0
IL_0752: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0757: ldfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_075c: br.s IL_0780
IL_075e: ldloc.s V_6
IL_0760: ldfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_0765: br.s IL_0780
IL_0767: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_076c: ldloc.0
IL_076d: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0772: ldfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_0777: br.s IL_0780
IL_0779: ldloc.s V_6
IL_077b: ldfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_0780: stfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_0785: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_078a: ldloc.0
IL_078b: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0790: dup
IL_0791: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_EquipmentSpeedModifier
IL_0796: ldloc.s V_6
IL_0798: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_EquipmentSpeedModifier
IL_079d: add
IL_079e: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_EquipmentSpeedModifier
IL_07a3: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_07a8: ldloc.0
IL_07a9: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_07ae: dup
IL_07af: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_WindSpeedModifier
IL_07b4: ldloc.s V_6
IL_07b6: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_WindSpeedModifier
IL_07bb: add
IL_07bc: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_WindSpeedModifier
IL_07c1: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_07c6: ldloc.0
IL_07c7: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_07cc: dup
IL_07cd: ldfld System.Single SE_Stats::m_runStaminaDrainModifier
IL_07d2: ldloc.s V_6
IL_07d4: ldfld System.Single SE_Stats::m_runStaminaDrainModifier
IL_07d9: add
IL_07da: stfld System.Single SE_Stats::m_runStaminaDrainModifier
IL_07df: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_07e4: ldloc.0
IL_07e5: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_07ea: dup
IL_07eb: ldfld System.Single SE_Stats::m_jumpStaminaUseModifier
IL_07f0: ldloc.s V_6
IL_07f2: ldfld System.Single SE_Stats::m_jumpStaminaUseModifier
IL_07f7: add
IL_07f8: stfld System.Single SE_Stats::m_jumpStaminaUseModifier
IL_07fd: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0802: ldloc.0
IL_0803: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0808: dup
IL_0809: ldfld System.Single SE_Stats::m_stealthModifier
IL_080e: ldloc.s V_6
IL_0810: ldfld System.Single SE_Stats::m_stealthModifier
IL_0815: add
IL_0816: stfld System.Single SE_Stats::m_stealthModifier
IL_081b: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0820: ldloc.0
IL_0821: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0826: dup
IL_0827: ldfld System.Single SE_Stats::m_noiseModifier
IL_082c: ldloc.s V_6
IL_082e: ldfld System.Single SE_Stats::m_noiseModifier
IL_0833: add
IL_0834: stfld System.Single SE_Stats::m_noiseModifier
IL_0839: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_083e: ldloc.0
IL_083f: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0844: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0849: ldloc.0
IL_084a: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_084f: ldfld System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_StatusAttributes
IL_0854: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<StatusEffect/StatusAttribute>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0859: ldloc.s V_6
IL_085b: ldfld System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_StatusAttributes
IL_0860: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<StatusEffect/StatusAttribute>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0865: call System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusAttributes_Concat(System.Collections.Generic.List`1<StatusEffect/StatusAttribute>,System.Collections.Generic.List`1<StatusEffect/StatusAttribute>)
IL_086a: stfld System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_StatusAttributes
IL_086f: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0874: ldloc.0
IL_0875: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_087a: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_087f: ldloc.0
IL_0880: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0885: ldfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_088a: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<Skills/SkillType>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_088f: ldloc.s V_6
IL_0891: ldfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_0896: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<Skills/SkillType>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_089b: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_08a0: ldloc.0
IL_08a1: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_08a6: ldfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_08ab: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.Single>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_08b0: ldloc.s V_6
IL_08b2: ldfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_08b7: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.Single>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_08bc: ldloca.s V_10
IL_08be: call System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul::OutgoingDamage_Concat(System.Collections.Generic.List`1<Skills/SkillType>,System.Collections.Generic.List`1<Skills/SkillType>,System.Collections.Generic.List`1<System.Single>,System.Collections.Generic.List`1<System.Single>,System.Collections.Generic.List`1<System.Single>&)
IL_08c3: stfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_08c8: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_08cd: ldloc.0
IL_08ce: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_08d3: ldloc.s V_10
IL_08d5: stfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_08da: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_08df: ldloc.0
IL_08e0: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_08e5: dup
IL_08e6: ldfld System.Single SE_Stats::m_fallDamageModifier
IL_08eb: ldloc.s V_6
IL_08ed: ldfld System.Single SE_Stats::m_fallDamageModifier
IL_08f2: add
IL_08f3: stfld System.Single SE_Stats::m_fallDamageModifier
IL_08f8: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_08fd: ldloc.0
IL_08fe: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0903: dup
IL_0904: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HeatDamageModifier
IL_0909: ldloc.s V_6
IL_090b: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HeatDamageModifier
IL_0910: add
IL_0911: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HeatDamageModifier
IL_0916: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_091b: ldloc.0
IL_091c: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0921: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0926: ldloc.0
IL_0927: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_092c: ldfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_0931: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<HitData/DamageModPair>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0936: ldloc.s V_6
IL_0938: ldfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_093d: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<HitData/DamageModPair>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0942: call System.Collections.Generic.List`1<HitData/DamageModPair> ForsakenPowerOverhaul.ForsakenPowerOverhaul::IncomingDamage_Concat(System.Collections.Generic.List`1<HitData/DamageModPair>,System.Collections.Generic.List`1<HitData/DamageModPair>)
IL_0947: stfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_094c: ldloca.s V_4
IL_094e: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_0953: brtrue IL_03eb
IL_0958: leave.s IL_0968
IL_095a: ldloca.s V_4
IL_095c: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_0962: callvirt System.Void System.IDisposable::Dispose()
IL_0967: endfinally
IL_0968: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_096d: ldloc.0
IL_096e: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0973: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_0978: ldloc.0
IL_0979: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_097e: ldfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_0983: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<Skills/SkillType>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0988: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_098d: ldloc.0
IL_098e: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_0993: ldfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_0998: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.Single>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_099d: ldloca.s V_3
IL_099f: call System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul::OutgoingDamage_Sort(System.Collections.Generic.List`1<Skills/SkillType>,System.Collections.Generic.List`1<System.Single>,System.Collections.Generic.List`1<System.Single>&)
IL_09a4: stfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_09a9: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_09ae: ldloc.0
IL_09af: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_09b4: ldloc.3
IL_09b5: stfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_09ba: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_09bf: ldloc.0
IL_09c0: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_09c5: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_09ca: ldloc.0
IL_09cb: callvirt !0 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Item(System.Int32)
IL_09d0: ldfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_09d5: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<HitData/DamageModPair>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_09da: call System.Collections.Generic.List`1<HitData/DamageModPair> ForsakenPowerOverhaul.ForsakenPowerOverhaul::IncomingDamage_Sort(System.Collections.Generic.List`1<HitData/DamageModPair>)
IL_09df: stfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_09e4: ldloc.0
IL_09e5: ldc.i4.1
IL_09e6: add
IL_09e7: stloc.0
IL_09e8: ldloc.0
IL_09e9: ldsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_09ee: callvirt System.Int32 System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::get_Count()
IL_09f3: blt IL_0017
IL_09f8: ret
// EH Finally: 998 - 2394 => 2394 - 2408

// System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul::StatusAttributes_Concat(System.Collections.Generic.List`1<StatusEffect/StatusAttribute>,System.Collections.Generic.List`1<StatusEffect/StatusAttribute>)
.locals System.Collections.Generic.List`1<StatusEffect/StatusAttribute>, System.Collections.Generic.List`1/Enumerator<StatusEffect/StatusAttribute>, StatusEffect/StatusAttribute, System.Boolean, System.Collections.Generic.List`1/Enumerator<StatusEffect/StatusAttribute>, StatusEffect/StatusAttribute
IL_0000: newobj System.Void System.Collections.Generic.List`1<StatusEffect/StatusAttribute>::.ctor()
IL_0005: stloc.0
IL_0006: ldarg.1
IL_0007: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<StatusEffect/StatusAttribute>::GetEnumerator()
IL_000c: stloc.1
IL_000d: br.s IL_0056
IL_000f: ldloca.s V_1
IL_0011: call !0 System.Collections.Generic.List`1/Enumerator<StatusEffect/StatusAttribute>::get_Current()
IL_0016: stloc.2
IL_0017: ldc.i4.1
IL_0018: stloc.3
IL_0019: ldarg.0
IL_001a: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<StatusEffect/StatusAttribute>::GetEnumerator()
IL_001f: stloc.s V_4
IL_0021: br.s IL_0033
IL_0023: ldloca.s V_4
IL_0025: call !0 System.Collections.Generic.List`1/Enumerator<StatusEffect/StatusAttribute>::get_Current()
IL_002a: stloc.s V_5
IL_002c: ldloc.2
IL_002d: ldloc.s V_5
IL_002f: bne.un.s IL_0033
IL_0031: ldc.i4.0
IL_0032: stloc.3
IL_0033: ldloca.s V_4
IL_0035: call System.Boolean System.Collections.Generic.List`1/Enumerator<StatusEffect/StatusAttribute>::MoveNext()
IL_003a: brtrue.s IL_0023
IL_003c: leave.s IL_004c
IL_003e: ldloca.s V_4
IL_0040: constrained. System.Collections.Generic.List`1/Enumerator<StatusEffect/StatusAttribute>
IL_0046: callvirt System.Void System.IDisposable::Dispose()
IL_004b: endfinally
IL_004c: ldloc.3
IL_004d: brfalse.s IL_0056
IL_004f: ldloc.0
IL_0050: ldloc.2
IL_0051: callvirt System.Void System.Collections.Generic.List`1<StatusEffect/StatusAttribute>::Add(!0)
IL_0056: ldloca.s V_1
IL_0058: call System.Boolean System.Collections.Generic.List`1/Enumerator<StatusEffect/StatusAttribute>::MoveNext()
IL_005d: brtrue.s IL_000f
IL_005f: leave.s IL_006f
IL_0061: ldloca.s V_1
IL_0063: constrained. System.Collections.Generic.List`1/Enumerator<StatusEffect/StatusAttribute>
IL_0069: callvirt System.Void System.IDisposable::Dispose()
IL_006e: endfinally
IL_006f: ldarg.0
IL_0070: ldloc.0
IL_0071: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Concat<StatusEffect/StatusAttribute>(System.Collections.Generic.IEnumerable`1<!!0>,System.Collections.Generic.IEnumerable`1<!!0>)
IL_0076: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<StatusEffect/StatusAttribute>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_007b: ret
// EH Finally: 33 - 62 => 62 - 76
// EH Finally: 13 - 97 => 97 - 111

// System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul::OutgoingDamage_Concat(System.Collections.Generic.List`1<Skills/SkillType>,System.Collections.Generic.List`1<Skills/SkillType>,System.Collections.Generic.List`1<System.Single>,System.Collections.Generic.List`1<System.Single>,System.Collections.Generic.List`1<System.Single>&)
.locals System.Collections.Generic.List`1<Skills/SkillType>, System.Collections.Generic.List`1<System.Single>, System.Collections.Generic.List`1/Enumerator<Skills/SkillType>, Skills/SkillType, System.Boolean, System.Int32, System.Collections.Generic.List`1/Enumerator<Skills/SkillType>, Skills/SkillType, System.Collections.Generic.List`1<System.Single>, System.Int32
IL_0000: newobj System.Void System.Collections.Generic.List`1<Skills/SkillType>::.ctor()
IL_0005: stloc.0
IL_0006: newobj System.Void System.Collections.Generic.List`1<System.Single>::.ctor()
IL_000b: stloc.1
IL_000c: ldarg.1
IL_000d: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Skills/SkillType>::GetEnumerator()
IL_0012: stloc.2
IL_0013: br IL_00ab
IL_0018: ldloca.s V_2
IL_001a: call !0 System.Collections.Generic.List`1/Enumerator<Skills/SkillType>::get_Current()
IL_001f: stloc.3
IL_0020: ldc.i4.1
IL_0021: stloc.s V_4
IL_0023: ldc.i4.0
IL_0024: stloc.s V_5
IL_0026: ldarg.0
IL_0027: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Skills/SkillType>::GetEnumerator()
IL_002c: stloc.s V_6
IL_002e: br.s IL_004b
IL_0030: ldloca.s V_6
IL_0032: call !0 System.Collections.Generic.List`1/Enumerator<Skills/SkillType>::get_Current()
IL_0037: stloc.s V_7
IL_0039: ldloc.3
IL_003a: ldloc.s V_7
IL_003c: bne.un.s IL_004b
IL_003e: ldc.i4.0
IL_003f: stloc.s V_4
IL_0041: ldarg.0
IL_0042: ldloc.s V_7
IL_0044: callvirt System.Int32 System.Collections.Generic.List`1<Skills/SkillType>::IndexOf(!0)
IL_0049: stloc.s V_5
IL_004b: ldloca.s V_6
IL_004d: call System.Boolean System.Collections.Generic.List`1/Enumerator<Skills/SkillType>::MoveNext()
IL_0052: brtrue.s IL_0030
IL_0054: leave.s IL_0064
IL_0056: ldloca.s V_6
IL_0058: constrained. System.Collections.Generic.List`1/Enumerator<Skills/SkillType>
IL_005e: callvirt System.Void System.IDisposable::Dispose()
IL_0063: endfinally
IL_0064: ldloc.s V_4
IL_0066: brfalse.s IL_0084
IL_0068: ldloc.0
IL_0069: ldloc.3
IL_006a: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_006f: ldloc.1
IL_0070: ldarg.3
IL_0071: ldarg.1
IL_0072: ldloc.3
IL_0073: callvirt System.Int32 System.Collections.Generic.List`1<Skills/SkillType>::IndexOf(!0)
IL_0078: callvirt !0 System.Collections.Generic.List`1<System.Single>::get_Item(System.Int32)
IL_007d: callvirt System.Void System.Collections.Generic.List`1<System.Single>::Add(!0)
IL_0082: br.s IL_00ab
IL_0084: ldarg.2
IL_0085: stloc.s V_8
IL_0087: ldloc.s V_5
IL_0089: stloc.s V_9
IL_008b: ldloc.s V_8
IL_008d: ldloc.s V_9
IL_008f: ldloc.s V_8
IL_0091: ldloc.s V_9
IL_0093: callvirt !0 System.Collections.Generic.List`1<System.Single>::get_Item(System.Int32)
IL_0098: ldarg.3
IL_0099: ldarg.1
IL_009a: ldloc.3
IL_009b: callvirt System.Int32 System.Collections.Generic.List`1<Skills/SkillType>::IndexOf(!0)
IL_00a0: callvirt !0 System.Collections.Generic.List`1<System.Single>::get_Item(System.Int32)
IL_00a5: add
IL_00a6: callvirt System.Void System.Collections.Generic.List`1<System.Single>::set_Item(System.Int32,!0)
IL_00ab: ldloca.s V_2
IL_00ad: call System.Boolean System.Collections.Generic.List`1/Enumerator<Skills/SkillType>::MoveNext()
IL_00b2: brtrue IL_0018
IL_00b7: leave.s IL_00c7
IL_00b9: ldloca.s V_2
IL_00bb: constrained. System.Collections.Generic.List`1/Enumerator<Skills/SkillType>
IL_00c1: callvirt System.Void System.IDisposable::Dispose()
IL_00c6: endfinally
IL_00c7: ldarg.s m_OutgoingDamageModifiers
IL_00c9: ldarg.2
IL_00ca: ldloc.1
IL_00cb: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Concat<System.Single>(System.Collections.Generic.IEnumerable`1<!!0>,System.Collections.Generic.IEnumerable`1<!!0>)
IL_00d0: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.Single>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_00d5: stind.ref
IL_00d6: ldarg.0
IL_00d7: ldloc.0
IL_00d8: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Concat<Skills/SkillType>(System.Collections.Generic.IEnumerable`1<!!0>,System.Collections.Generic.IEnumerable`1<!!0>)
IL_00dd: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<Skills/SkillType>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_00e2: ret
// EH Finally: 46 - 86 => 86 - 100
// EH Finally: 19 - 185 => 185 - 199

// System.Collections.Generic.List`1<HitData/DamageModPair> ForsakenPowerOverhaul.ForsakenPowerOverhaul::IncomingDamage_Concat(System.Collections.Generic.List`1<HitData/DamageModPair>,System.Collections.Generic.List`1<HitData/DamageModPair>)
.locals System.Collections.Generic.List`1<HitData/DamageModPair>, System.Collections.Generic.List`1/Enumerator<HitData/DamageModPair>, HitData/DamageModPair, System.Boolean, System.Int32, System.Collections.Generic.List`1/Enumerator<HitData/DamageModPair>, HitData/DamageModPair, HitData/DamageModPair
IL_0000: newobj System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::.ctor()
IL_0005: stloc.0
IL_0006: ldarg.1
IL_0007: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<HitData/DamageModPair>::GetEnumerator()
IL_000c: stloc.1
IL_000d: br IL_00cc
IL_0012: ldloca.s V_1
IL_0014: call !0 System.Collections.Generic.List`1/Enumerator<HitData/DamageModPair>::get_Current()
IL_0019: stloc.2
IL_001a: ldc.i4.1
IL_001b: stloc.3
IL_001c: ldc.i4.0
IL_001d: stloc.s V_4
IL_001f: ldarg.0
IL_0020: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<HitData/DamageModPair>::GetEnumerator()
IL_0025: stloc.s V_5
IL_0027: br.s IL_004d
IL_0029: ldloca.s V_5
IL_002b: call !0 System.Collections.Generic.List`1/Enumerator<HitData/DamageModPair>::get_Current()
IL_0030: stloc.s V_6
IL_0032: ldloc.2
IL_0033: ldfld HitData/DamageType HitData/DamageModPair::m_type
IL_0038: ldloc.s V_6
IL_003a: ldfld HitData/DamageType HitData/DamageModPair::m_type
IL_003f: bne.un.s IL_004d
IL_0041: ldc.i4.0
IL_0042: stloc.3
IL_0043: ldarg.0
IL_0044: ldloc.s V_6
IL_0046: callvirt System.Int32 System.Collections.Generic.List`1<HitData/DamageModPair>::IndexOf(!0)
IL_004b: stloc.s V_4
IL_004d: ldloca.s V_5
IL_004f: call System.Boolean System.Collections.Generic.List`1/Enumerator<HitData/DamageModPair>::MoveNext()
IL_0054: brtrue.s IL_0029
IL_0056: leave.s IL_0066
IL_0058: ldloca.s V_5
IL_005a: constrained. System.Collections.Generic.List`1/Enumerator<HitData/DamageModPair>
IL_0060: callvirt System.Void System.IDisposable::Dispose()
IL_0065: endfinally
IL_0066: ldloc.3
IL_0067: brfalse.s IL_0072
IL_0069: ldloc.0
IL_006a: ldloc.2
IL_006b: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_0070: br.s IL_00cc
IL_0072: ldarg.0
IL_0073: ldloc.s V_4
IL_0075: ldloca.s V_7
IL_0077: initobj HitData/DamageModPair
IL_007d: ldloca.s V_7
IL_007f: ldloc.2
IL_0080: ldfld HitData/DamageType HitData/DamageModPair::m_type
IL_0085: stfld HitData/DamageType HitData/DamageModPair::m_type
IL_008a: ldloca.s V_7
IL_008c: ldloc.2
IL_008d: ldfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_0092: call System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetToolTipIncomingDamageModifier(HitData/DamageModifier)
IL_0097: ldarg.0
IL_0098: ldloc.s V_4
IL_009a: callvirt !0 System.Collections.Generic.List`1<HitData/DamageModPair>::get_Item(System.Int32)
IL_009f: ldfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_00a4: call System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetToolTipIncomingDamageModifier(HitData/DamageModifier)
IL_00a9: blt.s IL_00ba
IL_00ab: ldarg.0
IL_00ac: ldloc.s V_4
IL_00ae: callvirt !0 System.Collections.Generic.List`1<HitData/DamageModPair>::get_Item(System.Int32)
IL_00b3: ldfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_00b8: br.s IL_00c0
IL_00ba: ldloc.2
IL_00bb: ldfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_00c0: stfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_00c5: ldloc.s V_7
IL_00c7: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::set_Item(System.Int32,!0)
IL_00cc: ldloca.s V_1
IL_00ce: call System.Boolean System.Collections.Generic.List`1/Enumerator<HitData/DamageModPair>::MoveNext()
IL_00d3: brtrue IL_0012
IL_00d8: leave.s IL_00e8
IL_00da: ldloca.s V_1
IL_00dc: constrained. System.Collections.Generic.List`1/Enumerator<HitData/DamageModPair>
IL_00e2: callvirt System.Void System.IDisposable::Dispose()
IL_00e7: endfinally
IL_00e8: ldarg.0
IL_00e9: ldloc.0
IL_00ea: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Concat<HitData/DamageModPair>(System.Collections.Generic.IEnumerable`1<!!0>,System.Collections.Generic.IEnumerable`1<!!0>)
IL_00ef: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<HitData/DamageModPair>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_00f4: ret
// EH Finally: 39 - 88 => 88 - 102
// EH Finally: 13 - 218 => 218 - 232

// System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul::OutgoingDamage_Sort(System.Collections.Generic.List`1<Skills/SkillType>,System.Collections.Generic.List`1<System.Single>,System.Collections.Generic.List`1<System.Single>&)
.locals System.Collections.Generic.List`1<Skills/SkillType>, System.Collections.Generic.List`1<System.Single>, System.Int32, System.Collections.Generic.List`1/Enumerator<Skills/SkillType>, Skills/SkillType
IL_0000: newobj System.Void System.Collections.Generic.List`1<Skills/SkillType>::.ctor()
IL_0005: stloc.0
IL_0006: newobj System.Void System.Collections.Generic.List`1<System.Single>::.ctor()
IL_000b: stloc.1
IL_000c: newobj System.Void System.Collections.Generic.List`1<Skills/SkillType>::.ctor()
IL_0011: dup
IL_0012: ldc.i4 999
IL_0017: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_001c: dup
IL_001d: ldc.i4.s 11
IL_001f: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_0024: dup
IL_0025: ldc.i4.3
IL_0026: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_002b: dup
IL_002c: ldc.i4.7
IL_002d: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_0032: dup
IL_0033: ldc.i4.2
IL_0034: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_0039: dup
IL_003a: ldc.i4.5
IL_003b: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_0040: dup
IL_0041: ldc.i4.1
IL_0042: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_0047: dup
IL_0048: ldc.i4.4
IL_0049: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_004e: dup
IL_004f: ldc.i4.8
IL_0050: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_0055: dup
IL_0056: ldc.i4.s 14
IL_0058: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_005d: dup
IL_005e: ldc.i4.s 9
IL_0060: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_0065: dup
IL_0066: ldc.i4.s 10
IL_0068: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_006d: dup
IL_006e: ldc.i4.s 13
IL_0070: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_0075: dup
IL_0076: ldc.i4.s 12
IL_0078: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_007d: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Skills/SkillType>::GetEnumerator()
IL_0082: stloc.3
IL_0083: br.s IL_00b9
IL_0085: ldloca.s V_3
IL_0087: call !0 System.Collections.Generic.List`1/Enumerator<Skills/SkillType>::get_Current()
IL_008c: stloc.s V_4
IL_008e: ldarg.0
IL_008f: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<Skills/SkillType>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0094: ldloc.s V_4
IL_0096: ldloca.s V_2
IL_0098: call System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul::OutgoingDamage_Sort_Loop(System.Collections.Generic.List`1<Skills/SkillType>,Skills/SkillType,System.Int32&)
IL_009d: brfalse.s IL_00b9
IL_009f: ldloc.0
IL_00a0: ldarg.0
IL_00a1: ldloc.2
IL_00a2: callvirt !0 System.Collections.Generic.List`1<Skills/SkillType>::get_Item(System.Int32)
IL_00a7: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_00ac: ldloc.1
IL_00ad: ldarg.1
IL_00ae: ldloc.2
IL_00af: callvirt !0 System.Collections.Generic.List`1<System.Single>::get_Item(System.Int32)
IL_00b4: callvirt System.Void System.Collections.Generic.List`1<System.Single>::Add(!0)
IL_00b9: ldloca.s V_3
IL_00bb: call System.Boolean System.Collections.Generic.List`1/Enumerator<Skills/SkillType>::MoveNext()
IL_00c0: brtrue.s IL_0085
IL_00c2: leave.s IL_00d2
IL_00c4: ldloca.s V_3
IL_00c6: constrained. System.Collections.Generic.List`1/Enumerator<Skills/SkillType>
IL_00cc: callvirt System.Void System.IDisposable::Dispose()
IL_00d1: endfinally
IL_00d2: ldarg.2
IL_00d3: ldloc.1
IL_00d4: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.Single>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_00d9: stind.ref
IL_00da: ldloc.0
IL_00db: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<Skills/SkillType>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_00e0: ret
// EH Finally: 131 - 196 => 196 - 210

// System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul::OutgoingDamage_Sort_Loop(System.Collections.Generic.List`1<Skills/SkillType>,Skills/SkillType,System.Int32&)
.locals System.Collections.Generic.List`1/Enumerator<Skills/SkillType>, Skills/SkillType, System.Boolean
IL_0000: ldarg.0
IL_0001: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Skills/SkillType>::GetEnumerator()
IL_0006: stloc.0
IL_0007: br.s IL_0022
IL_0009: ldloca.s V_0
IL_000b: call !0 System.Collections.Generic.List`1/Enumerator<Skills/SkillType>::get_Current()
IL_0010: stloc.1
IL_0011: ldloc.1
IL_0012: ldarg.1
IL_0013: bne.un.s IL_0022
IL_0015: ldarg.2
IL_0016: ldarg.0
IL_0017: ldloc.1
IL_0018: callvirt System.Int32 System.Collections.Generic.List`1<Skills/SkillType>::IndexOf(!0)
IL_001d: stind.i4
IL_001e: ldc.i4.1
IL_001f: stloc.2
IL_0020: leave.s IL_0040
IL_0022: ldloca.s V_0
IL_0024: call System.Boolean System.Collections.Generic.List`1/Enumerator<Skills/SkillType>::MoveNext()
IL_0029: brtrue.s IL_0009
IL_002b: leave.s IL_003b
IL_002d: ldloca.s V_0
IL_002f: constrained. System.Collections.Generic.List`1/Enumerator<Skills/SkillType>
IL_0035: callvirt System.Void System.IDisposable::Dispose()
IL_003a: endfinally
IL_003b: ldarg.2
IL_003c: ldc.i4.0
IL_003d: stind.i4
IL_003e: ldc.i4.0
IL_003f: ret
IL_0040: ldloc.2
IL_0041: ret
// EH Finally: 7 - 45 => 45 - 59

// System.Collections.Generic.List`1<HitData/DamageModPair> ForsakenPowerOverhaul.ForsakenPowerOverhaul::IncomingDamage_Sort(System.Collections.Generic.List`1<HitData/DamageModPair>)
.locals System.Collections.Generic.List`1<HitData/DamageModPair>, System.Collections.Generic.List`1/Enumerator<HitData/DamageType>, HitData/DamageType
IL_0000: newobj System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::.ctor()
IL_0005: stloc.0
IL_0006: newobj System.Void System.Collections.Generic.List`1<HitData/DamageType>::.ctor()
IL_000b: dup
IL_000c: ldc.i4.s 31
IL_000e: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageType>::Add(!0)
IL_0013: dup
IL_0014: ldc.i4.4
IL_0015: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageType>::Add(!0)
IL_001a: dup
IL_001b: ldc.i4.2
IL_001c: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageType>::Add(!0)
IL_0021: dup
IL_0022: ldc.i4.1
IL_0023: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageType>::Add(!0)
IL_0028: dup
IL_0029: ldc.i4 224
IL_002e: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageType>::Add(!0)
IL_0033: dup
IL_0034: ldc.i4 128
IL_0039: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageType>::Add(!0)
IL_003e: dup
IL_003f: ldc.i4 256
IL_0044: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageType>::Add(!0)
IL_0049: dup
IL_004a: ldc.i4.s 64
IL_004c: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageType>::Add(!0)
IL_0051: dup
IL_0052: ldc.i4.s 32
IL_0054: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageType>::Add(!0)
IL_0059: dup
IL_005a: ldc.i4 512
IL_005f: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageType>::Add(!0)
IL_0064: dup
IL_0065: ldc.i4.8
IL_0066: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageType>::Add(!0)
IL_006b: dup
IL_006c: ldc.i4.s 16
IL_006e: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageType>::Add(!0)
IL_0073: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<HitData/DamageType>::GetEnumerator()
IL_0078: stloc.1
IL_0079: br.s IL_0095
IL_007b: ldloca.s V_1
IL_007d: call !0 System.Collections.Generic.List`1/Enumerator<HitData/DamageType>::get_Current()
IL_0082: stloc.2
IL_0083: ldloc.0
IL_0084: ldarg.0
IL_0085: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<HitData/DamageModPair>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_008a: ldloc.2
IL_008b: call HitData/DamageModPair ForsakenPowerOverhaul.ForsakenPowerOverhaul::IncomingDamage_Sort_Loop(System.Collections.Generic.List`1<HitData/DamageModPair>,HitData/DamageType)
IL_0090: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_0095: ldloca.s V_1
IL_0097: call System.Boolean System.Collections.Generic.List`1/Enumerator<HitData/DamageType>::MoveNext()
IL_009c: brtrue.s IL_007b
IL_009e: leave.s IL_00ae
IL_00a0: ldloca.s V_1
IL_00a2: constrained. System.Collections.Generic.List`1/Enumerator<HitData/DamageType>
IL_00a8: callvirt System.Void System.IDisposable::Dispose()
IL_00ad: endfinally
IL_00ae: ldloc.0
IL_00af: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<HitData/DamageModPair>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_00b4: ret
// EH Finally: 121 - 160 => 160 - 174

// HitData/DamageModPair ForsakenPowerOverhaul.ForsakenPowerOverhaul::IncomingDamage_Sort_Loop(System.Collections.Generic.List`1<HitData/DamageModPair>,HitData/DamageType)
.locals System.Collections.Generic.List`1/Enumerator<HitData/DamageModPair>, HitData/DamageModPair, HitData/DamageModPair, HitData/DamageModPair
IL_0000: ldarg.0
IL_0001: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<HitData/DamageModPair>::GetEnumerator()
IL_0006: stloc.0
IL_0007: br.s IL_001e
IL_0009: ldloca.s V_0
IL_000b: call !0 System.Collections.Generic.List`1/Enumerator<HitData/DamageModPair>::get_Current()
IL_0010: stloc.1
IL_0011: ldloc.1
IL_0012: ldfld HitData/DamageType HitData/DamageModPair::m_type
IL_0017: ldarg.1
IL_0018: bne.un.s IL_001e
IL_001a: ldloc.1
IL_001b: stloc.2
IL_001c: leave.s IL_0041
IL_001e: ldloca.s V_0
IL_0020: call System.Boolean System.Collections.Generic.List`1/Enumerator<HitData/DamageModPair>::MoveNext()
IL_0025: brtrue.s IL_0009
IL_0027: leave.s IL_0037
IL_0029: ldloca.s V_0
IL_002b: constrained. System.Collections.Generic.List`1/Enumerator<HitData/DamageModPair>
IL_0031: callvirt System.Void System.IDisposable::Dispose()
IL_0036: endfinally
IL_0037: ldloca.s V_3
IL_0039: initobj HitData/DamageModPair
IL_003f: ldloc.3
IL_0040: ret
IL_0041: ldloc.2
IL_0042: ret
// EH Finally: 7 - 41 => 41 - 55

// System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Player_BaseStats(System.String,Player)
.locals System.Single, System.Single, System.Single, System.Single, System.Single, System.Single, System.Single, System.Collections.Generic.List`1/Enumerator<StatusEffect>, StatusEffect, ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0000: ldarg.1
IL_0001: ldnull
IL_0002: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0007: brfalse IL_0143
IL_000c: ldc.r4 0
IL_0011: stloc.0
IL_0012: ldc.r4 0
IL_0017: stloc.1
IL_0018: ldc.r4 0
IL_001d: stloc.2
IL_001e: ldc.r4 0
IL_0023: stloc.3
IL_0024: ldc.r4 0
IL_0029: stloc.s V_4
IL_002b: ldc.r4 0
IL_0030: stloc.s V_5
IL_0032: ldc.r4 0
IL_0037: stloc.s V_6
IL_0039: ldarg.1
IL_003a: ldfld SEMan Character::m_seman
IL_003f: callvirt System.Collections.Generic.List`1<StatusEffect> SEMan::GetStatusEffects()
IL_0044: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<StatusEffect>::GetEnumerator()
IL_0049: stloc.s V_7
IL_004b: br.s IL_00be
IL_004d: ldloca.s V_7
IL_004f: call !0 System.Collections.Generic.List`1/Enumerator<StatusEffect>::get_Current()
IL_0054: stloc.s V_8
IL_0056: ldloc.s V_8
IL_0058: callvirt System.String UnityEngine.Object::get_name()
IL_005d: ldstr "SE_FPO_"
IL_0062: callvirt System.Boolean System.String::StartsWith(System.String)
IL_0067: brfalse.s IL_00be
IL_0069: ldloc.s V_8
IL_006b: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0070: stloc.s V_9
IL_0072: ldloc.0
IL_0073: ldloc.s V_9
IL_0075: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxHealth
IL_007a: add
IL_007b: stloc.0
IL_007c: ldloc.1
IL_007d: ldloc.s V_9
IL_007f: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HealthRegen
IL_0084: add
IL_0085: stloc.1
IL_0086: ldloc.2
IL_0087: ldloc.s V_9
IL_0089: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxStamina
IL_008e: add
IL_008f: stloc.2
IL_0090: ldloc.3
IL_0091: ldloc.s V_9
IL_0093: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxEitr
IL_0098: add
IL_0099: stloc.3
IL_009a: ldloc.s V_4
IL_009c: ldloc.s V_9
IL_009e: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_EquipmentSpeedModifier
IL_00a3: add
IL_00a4: stloc.s V_4
IL_00a6: ldloc.s V_5
IL_00a8: ldloc.s V_9
IL_00aa: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_WindSpeedModifier
IL_00af: add
IL_00b0: stloc.s V_5
IL_00b2: ldloc.s V_6
IL_00b4: ldloc.s V_9
IL_00b6: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HeatDamageModifier
IL_00bb: add
IL_00bc: stloc.s V_6
IL_00be: ldloca.s V_7
IL_00c0: call System.Boolean System.Collections.Generic.List`1/Enumerator<StatusEffect>::MoveNext()
IL_00c5: brtrue.s IL_004d
IL_00c7: leave.s IL_00d7
IL_00c9: ldloca.s V_7
IL_00cb: constrained. System.Collections.Generic.List`1/Enumerator<StatusEffect>
IL_00d1: callvirt System.Void System.IDisposable::Dispose()
IL_00d6: endfinally
IL_00d7: ldarg.0
IL_00d8: ldstr "MaxHealth"
IL_00dd: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00e2: brfalse.s IL_00e6
IL_00e4: ldloc.0
IL_00e5: ret
IL_00e6: ldarg.0
IL_00e7: ldstr "HealthRegen"
IL_00ec: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00f1: brfalse.s IL_00f5
IL_00f3: ldloc.1
IL_00f4: ret
IL_00f5: ldarg.0
IL_00f6: ldstr "MaxStamina"
IL_00fb: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0100: brfalse.s IL_0104
IL_0102: ldloc.2
IL_0103: ret
IL_0104: ldarg.0
IL_0105: ldstr "MaxEitr"
IL_010a: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_010f: brfalse.s IL_0113
IL_0111: ldloc.3
IL_0112: ret
IL_0113: ldarg.0
IL_0114: ldstr "EquipmentSpeedModifier"
IL_0119: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_011e: brfalse.s IL_0123
IL_0120: ldloc.s V_4
IL_0122: ret
IL_0123: ldarg.0
IL_0124: ldstr "WindSpeedModifier"
IL_0129: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_012e: brfalse.s IL_0133
IL_0130: ldloc.s V_5
IL_0132: ret
IL_0133: ldarg.0
IL_0134: ldstr "HeatDamageModifier"
IL_0139: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_013e: brfalse.s IL_0143
IL_0140: ldloc.s V_6
IL_0142: ret
IL_0143: ldc.r4 0
IL_0148: ret
// EH Finally: 75 - 201 => 201 - 215

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Power_Unlock(BossStone)
.locals System.String
IL_0000: ldsfld Player Player::m_localPlayer
IL_0005: ldnull
IL_0006: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_000b: brfalse.s IL_003c
IL_000d: ldarg.0
IL_000e: ldfld ItemStand BossStone::m_itemStand
IL_0013: ldfld System.String ItemStand::m_currentItemName
IL_0018: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetBossName(System.String)
IL_001d: stloc.0
IL_001e: ldloc.0
IL_001f: ldstr ""
IL_0024: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_0029: brfalse.s IL_003c
IL_002b: ldstr "GP_"
IL_0030: ldloc.0
IL_0031: call System.String System.String::Concat(System.String,System.String)
IL_0036: ldc.i4.1
IL_0037: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Power_Set(System.String,System.Boolean)
IL_003c: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Power_Unlock_Spawn(Player)
.locals System.Collections.Generic.List`1<System.String>, System.Collections.Generic.HashSet`1/Enumerator<System.String>, System.String
IL_0000: ldarg.0
IL_0001: ldsfld Player Player::m_localPlayer
IL_0006: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_000b: brfalse IL_0093
IL_0010: ldarg.0
IL_0011: callvirt System.String Player::GetGuardianPowerName()
IL_0016: ldstr "GP_"
IL_001b: callvirt System.Boolean System.String::StartsWith(System.String)
IL_0020: brtrue.s IL_0093
IL_0022: call ZoneSystem ZoneSystem::get_instance()
IL_0027: ldstr "gk_fpo_bossstone_passive"
IL_002c: callvirt System.Boolean ZoneSystem::GetGlobalKey(System.String)
IL_0031: brfalse.s IL_0093
IL_0033: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor()
IL_0038: stloc.0
IL_0039: ldarg.0
IL_003a: ldfld System.Collections.Generic.HashSet`1<System.String> Player::m_uniques
IL_003f: callvirt System.Collections.Generic.HashSet`1/Enumerator<!0> System.Collections.Generic.HashSet`1<System.String>::GetEnumerator()
IL_0044: stloc.1
IL_0045: br.s IL_0063
IL_0047: ldloca.s V_1
IL_0049: call !0 System.Collections.Generic.HashSet`1/Enumerator<System.String>::get_Current()
IL_004e: stloc.2
IL_004f: ldloc.2
IL_0050: ldstr "GP_"
IL_0055: callvirt System.Boolean System.String::StartsWith(System.String)
IL_005a: brfalse.s IL_0063
IL_005c: ldloc.0
IL_005d: ldloc.2
IL_005e: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_0063: ldloca.s V_1
IL_0065: call System.Boolean System.Collections.Generic.HashSet`1/Enumerator<System.String>::MoveNext()
IL_006a: brtrue.s IL_0047
IL_006c: leave.s IL_007c
IL_006e: ldloca.s V_1
IL_0070: constrained. System.Collections.Generic.HashSet`1/Enumerator<System.String>
IL_0076: callvirt System.Void System.IDisposable::Dispose()
IL_007b: endfinally
IL_007c: ldloc.0
IL_007d: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.String>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0082: call System.Collections.Generic.List`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Power_Sort(System.Collections.Generic.List`1<System.String>)
IL_0087: ldc.i4.0
IL_0088: callvirt !0 System.Collections.Generic.List`1<System.String>::get_Item(System.Int32)
IL_008d: ldc.i4.1
IL_008e: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Power_Set(System.String,System.Boolean)
IL_0093: ret
// EH Finally: 69 - 110 => 110 - 124

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Power_Lock(Player)
.locals System.Boolean, System.Collections.Generic.List`1/Enumerator<System.String>, System.String
IL_0000: ldarg.0
IL_0001: ldsfld Player Player::m_localPlayer
IL_0006: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_000b: brfalse IL_009c
IL_0010: ldarg.0
IL_0011: callvirt System.String Player::GetGuardianPowerName()
IL_0016: ldstr "GP_"
IL_001b: callvirt System.Boolean System.String::StartsWith(System.String)
IL_0020: brfalse.s IL_009c
IL_0022: call ZoneSystem ZoneSystem::get_instance()
IL_0027: ldstr "gk_fpo_bossstone_passive"
IL_002c: callvirt System.Boolean ZoneSystem::GetGlobalKey(System.String)
IL_0031: brtrue.s IL_003f
IL_0033: ldarg.0
IL_0034: ldstr ""
IL_0039: callvirt System.Void Player::SetGuardianPower(System.String)
IL_003e: ret
IL_003f: ldc.i4.1
IL_0040: stloc.0
IL_0041: call ZoneSystem ZoneSystem::get_instance()
IL_0046: callvirt System.Collections.Generic.List`1<System.String> ZoneSystem::GetGlobalKeys()
IL_004b: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_0050: stloc.1
IL_0051: br.s IL_0075
IL_0053: ldloca.s V_1
IL_0055: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_005a: stloc.2
IL_005b: ldarg.0
IL_005c: callvirt System.String Player::GetGuardianPowerName()
IL_0061: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetBossName(System.String)
IL_0066: ldloc.2
IL_0067: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetBossName(System.String)
IL_006c: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0071: brfalse.s IL_0075
IL_0073: ldc.i4.0
IL_0074: stloc.0
IL_0075: ldloca.s V_1
IL_0077: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_007c: brtrue.s IL_0053
IL_007e: leave.s IL_008e
IL_0080: ldloca.s V_1
IL_0082: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_0088: callvirt System.Void System.IDisposable::Dispose()
IL_008d: endfinally
IL_008e: ldloc.0
IL_008f: brfalse.s IL_009c
IL_0091: ldarg.0
IL_0092: ldstr ""
IL_0097: callvirt System.Void Player::SetGuardianPower(System.String)
IL_009c: ret
// EH Finally: 81 - 128 => 128 - 142

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Power_Cycle()
.locals System.Collections.Generic.List`1<System.String>, System.Collections.Generic.List`1<System.String>, System.Collections.Generic.HashSet`1/Enumerator<System.String>, System.String, System.Collections.Generic.List`1/Enumerator<System.String>, System.String, System.Int32, System.String
IL_0000: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor()
IL_0005: stloc.0
IL_0006: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::PlayerKeys_Update()
IL_000b: ldsfld Player Player::m_localPlayer
IL_0010: ldfld System.Collections.Generic.HashSet`1<System.String> Player::m_uniques
IL_0015: callvirt System.Collections.Generic.HashSet`1/Enumerator<!0> System.Collections.Generic.HashSet`1<System.String>::GetEnumerator()
IL_001a: stloc.2
IL_001b: br.s IL_0083
IL_001d: ldloca.s V_2
IL_001f: call !0 System.Collections.Generic.HashSet`1/Enumerator<System.String>::get_Current()
IL_0024: stloc.3
IL_0025: call ZoneSystem ZoneSystem::get_instance()
IL_002a: callvirt System.Collections.Generic.List`1<System.String> ZoneSystem::GetGlobalKeys()
IL_002f: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_0034: stloc.s V_4
IL_0036: br.s IL_006a
IL_0038: ldloca.s V_4
IL_003a: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_003f: stloc.s V_5
IL_0041: ldloc.s V_5
IL_0043: ldstr "gk_fpo_bossstone_"
IL_0048: callvirt System.Boolean System.String::StartsWith(System.String)
IL_004d: brfalse.s IL_006a
IL_004f: ldloc.3
IL_0050: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetBossName(System.String)
IL_0055: ldloc.s V_5
IL_0057: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetBossName(System.String)
IL_005c: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0061: brfalse.s IL_006a
IL_0063: ldloc.0
IL_0064: ldloc.3
IL_0065: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_006a: ldloca.s V_4
IL_006c: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_0071: brtrue.s IL_0038
IL_0073: leave.s IL_0083
IL_0075: ldloca.s V_4
IL_0077: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_007d: callvirt System.Void System.IDisposable::Dispose()
IL_0082: endfinally
IL_0083: ldloca.s V_2
IL_0085: call System.Boolean System.Collections.Generic.HashSet`1/Enumerator<System.String>::MoveNext()
IL_008a: brtrue.s IL_001d
IL_008c: leave.s IL_009c
IL_008e: ldloca.s V_2
IL_0090: constrained. System.Collections.Generic.HashSet`1/Enumerator<System.String>
IL_0096: callvirt System.Void System.IDisposable::Dispose()
IL_009b: endfinally
IL_009c: ldloc.0
IL_009d: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.String>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_00a2: call System.Collections.Generic.List`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Power_Sort(System.Collections.Generic.List`1<System.String>)
IL_00a7: stloc.1
IL_00a8: ldloc.1
IL_00a9: callvirt System.Int32 System.Collections.Generic.List`1<System.String>::get_Count()
IL_00ae: ldc.i4.0
IL_00af: ble IL_0143
IL_00b4: ldc.i4.0
IL_00b5: stloc.s V_6
IL_00b7: ldloc.1
IL_00b8: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_00bd: stloc.s V_4
IL_00bf: br.s IL_010b
IL_00c1: ldloca.s V_4
IL_00c3: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_00c8: stloc.s V_7
IL_00ca: ldsfld Player Player::m_localPlayer
IL_00cf: callvirt System.String Player::GetGuardianPowerName()
IL_00d4: ldloc.s V_7
IL_00d6: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00db: brtrue.s IL_0101
IL_00dd: ldloc.s V_7
IL_00df: ldstr "GP_Fader"
IL_00e4: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00e9: brfalse.s IL_010b
IL_00eb: ldsfld Player Player::m_localPlayer
IL_00f0: callvirt System.String Player::GetGuardianPowerName()
IL_00f5: ldstr "GP_Ashlands"
IL_00fa: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00ff: brfalse.s IL_010b
IL_0101: ldloc.1
IL_0102: ldloc.s V_7
IL_0104: callvirt System.Int32 System.Collections.Generic.List`1<System.String>::IndexOf(!0)
IL_0109: stloc.s V_6
IL_010b: ldloca.s V_4
IL_010d: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_0112: brtrue.s IL_00c1
IL_0114: leave.s IL_0124
IL_0116: ldloca.s V_4
IL_0118: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_011e: callvirt System.Void System.IDisposable::Dispose()
IL_0123: endfinally
IL_0124: ldloc.s V_6
IL_0126: ldc.i4.1
IL_0127: add
IL_0128: ldloc.1
IL_0129: callvirt System.Int32 System.Collections.Generic.List`1<System.String>::get_Count()
IL_012e: bne.un.s IL_0133
IL_0130: ldc.i4.m1
IL_0131: stloc.s V_6
IL_0133: ldloc.1
IL_0134: ldloc.s V_6
IL_0136: ldc.i4.1
IL_0137: add
IL_0138: callvirt !0 System.Collections.Generic.List`1<System.String>::get_Item(System.Int32)
IL_013d: ldc.i4.0
IL_013e: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Power_Set(System.String,System.Boolean)
IL_0143: ret
// EH Finally: 54 - 117 => 117 - 131
// EH Finally: 27 - 142 => 142 - 156
// EH Finally: 191 - 278 => 278 - 292

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Power_Set(System.String,System.Boolean)
.locals EffectList, UnityEngine.Vector3, ZDOID
IL_0000: ldsfld Player Player::m_localPlayer
IL_0005: ldarg.0
IL_0006: ldstr "GP_Fader"
IL_000b: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0010: brtrue.s IL_0015
IL_0012: ldarg.0
IL_0013: br.s IL_001a
IL_0015: ldstr "GP_Ashlands"
IL_001a: callvirt System.Void Player::SetGuardianPower(System.String)
IL_001f: newobj System.Void EffectList::.ctor()
IL_0024: dup
IL_0025: ldc.i4.1
IL_0026: newarr EffectList/EffectData
IL_002b: stfld EffectList/EffectData[] EffectList::m_effectPrefabs
IL_0030: stloc.0
IL_0031: ldsfld Player Player::m_localPlayer
IL_0036: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_003b: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0040: stloc.1
IL_0041: ldloca.s V_1
IL_0043: ldflda System.Single UnityEngine.Vector3::y
IL_0048: dup
IL_0049: ldind.r4
IL_004a: ldc.r4 0.925
IL_004f: add
IL_0050: stind.r4
IL_0051: ldarg.1
IL_0052: brfalse.s IL_00ae
IL_0054: ldloc.0
IL_0055: ldfld EffectList/EffectData[] EffectList::m_effectPrefabs
IL_005a: ldc.i4.0
IL_005b: newobj System.Void EffectList/EffectData::.ctor()
IL_0060: dup
IL_0061: call Jotunn.Managers.PrefabManager Jotunn.Managers.PrefabManager::get_Instance()
IL_0066: ldstr "GO_FPO_Effect_PowerUnlock"
IL_006b: callvirt UnityEngine.GameObject Jotunn.Managers.PrefabManager::GetPrefab(System.String)
IL_0070: stfld UnityEngine.GameObject EffectList/EffectData::m_prefab
IL_0075: dup
IL_0076: ldc.i4.1
IL_0077: stfld System.Boolean EffectList/EffectData::m_scale
IL_007c: stelem.ref
IL_007d: ldloc.0
IL_007e: ldloc.1
IL_007f: ldsfld Player Player::m_localPlayer
IL_0084: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0089: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_008e: ldsfld Player Player::m_localPlayer
IL_0093: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0098: ldc.r4 0.5
IL_009d: ldc.i4.m1
IL_009e: ldloca.s V_2
IL_00a0: initobj ZDOID
IL_00a6: ldloc.2
IL_00a7: callvirt UnityEngine.GameObject[] EffectList::Create(UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Transform,System.Single,System.Int32,ZDOID)
IL_00ac: pop
IL_00ad: ret
IL_00ae: ldloc.0
IL_00af: ldfld EffectList/EffectData[] EffectList::m_effectPrefabs
IL_00b4: ldc.i4.0
IL_00b5: newobj System.Void EffectList/EffectData::.ctor()
IL_00ba: dup
IL_00bb: call Jotunn.Managers.PrefabManager Jotunn.Managers.PrefabManager::get_Instance()
IL_00c0: ldstr "sfx_gui_button"
IL_00c5: callvirt UnityEngine.GameObject Jotunn.Managers.PrefabManager::GetPrefab(System.String)
IL_00ca: stfld UnityEngine.GameObject EffectList/EffectData::m_prefab
IL_00cf: dup
IL_00d0: ldc.i4.1
IL_00d1: stfld System.Boolean EffectList/EffectData::m_attach
IL_00d6: stelem.ref
IL_00d7: ldloc.0
IL_00d8: ldloc.1
IL_00d9: ldsfld Player Player::m_localPlayer
IL_00de: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_00e3: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_00e8: ldsfld Player Player::m_localPlayer
IL_00ed: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_00f2: ldc.r4 1
IL_00f7: ldc.i4.m1
IL_00f8: ldloca.s V_2
IL_00fa: initobj ZDOID
IL_0100: ldloc.2
IL_0101: callvirt UnityEngine.GameObject[] EffectList::Create(UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Transform,System.Single,System.Int32,ZDOID)
IL_0106: pop
IL_0107: ret

// System.Collections.Generic.List`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Power_Sort(System.Collections.Generic.List`1<System.String>)
.locals System.Collections.Generic.List`1<System.String>, System.Collections.Generic.List`1/Enumerator<System.String>, System.String
IL_0000: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor()
IL_0005: stloc.0
IL_0006: ldsfld System.Collections.Generic.List`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_BossNames
IL_000b: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_0010: stloc.1
IL_0011: br.s IL_003f
IL_0013: ldloca.s V_1
IL_0015: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_001a: stloc.2
IL_001b: ldarg.0
IL_001c: ldstr "GP_"
IL_0021: ldloc.2
IL_0022: call System.String System.String::Concat(System.String,System.String)
IL_0027: callvirt System.Boolean System.Collections.Generic.List`1<System.String>::Contains(!0)
IL_002c: brfalse.s IL_003f
IL_002e: ldloc.0
IL_002f: ldstr "GP_"
IL_0034: ldloc.2
IL_0035: call System.String System.String::Concat(System.String,System.String)
IL_003a: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_003f: ldloca.s V_1
IL_0041: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_0046: brtrue.s IL_0013
IL_0048: leave.s IL_0058
IL_004a: ldloca.s V_1
IL_004c: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_0052: callvirt System.Void System.IDisposable::Dispose()
IL_0057: endfinally
IL_0058: ldloc.0
IL_0059: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.String>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_005e: ret
// EH Finally: 17 - 74 => 74 - 88

// System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetBossName(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: callvirt System.String System.String::ToLower()
IL_0006: starg.s New_String
IL_0008: ldarg.0
IL_0009: ldstr "$item_trophy_"
IL_000e: callvirt System.Boolean System.String::StartsWith(System.String)
IL_0013: brtrue.s IL_0032
IL_0015: ldarg.0
IL_0016: ldstr "gk_fpo_bossstone_"
IL_001b: callvirt System.Boolean System.String::StartsWith(System.String)
IL_0020: brtrue.s IL_0032
IL_0022: ldarg.0
IL_0023: ldstr "gp_"
IL_0028: callvirt System.Boolean System.String::StartsWith(System.String)
IL_002d: brfalse IL_00f8
IL_0032: ldarg.0
IL_0033: ldstr "_eikthyr"
IL_0038: callvirt System.Boolean System.String::Contains(System.String)
IL_003d: brfalse.s IL_0045
IL_003f: ldstr "Eikthyr"
IL_0044: ret
IL_0045: ldarg.0
IL_0046: ldstr "_theelder"
IL_004b: callvirt System.Boolean System.String::Contains(System.String)
IL_0050: brtrue.s IL_005f
IL_0052: ldarg.0
IL_0053: ldstr "_elder"
IL_0058: callvirt System.Boolean System.String::Contains(System.String)
IL_005d: brfalse.s IL_0065
IL_005f: ldstr "TheElder"
IL_0064: ret
IL_0065: ldarg.0
IL_0066: ldstr "_bonemass"
IL_006b: callvirt System.Boolean System.String::Contains(System.String)
IL_0070: brfalse.s IL_0078
IL_0072: ldstr "Bonemass"
IL_0077: ret
IL_0078: ldarg.0
IL_0079: ldstr "_moder"
IL_007e: callvirt System.Boolean System.String::Contains(System.String)
IL_0083: brtrue.s IL_0092
IL_0085: ldarg.0
IL_0086: ldstr "_dragonqueen"
IL_008b: callvirt System.Boolean System.String::Contains(System.String)
IL_0090: brfalse.s IL_0098
IL_0092: ldstr "Moder"
IL_0097: ret
IL_0098: ldarg.0
IL_0099: ldstr "_yagluth"
IL_009e: callvirt System.Boolean System.String::Contains(System.String)
IL_00a3: brtrue.s IL_00b2
IL_00a5: ldarg.0
IL_00a6: ldstr "_goblinking"
IL_00ab: callvirt System.Boolean System.String::Contains(System.String)
IL_00b0: brfalse.s IL_00b8
IL_00b2: ldstr "Yagluth"
IL_00b7: ret
IL_00b8: ldarg.0
IL_00b9: ldstr "_queen"
IL_00be: callvirt System.Boolean System.String::Contains(System.String)
IL_00c3: brtrue.s IL_00d2
IL_00c5: ldarg.0
IL_00c6: ldstr "_seekerqueen"
IL_00cb: callvirt System.Boolean System.String::Contains(System.String)
IL_00d0: brfalse.s IL_00d8
IL_00d2: ldstr "Queen"
IL_00d7: ret
IL_00d8: ldarg.0
IL_00d9: ldstr "_fader"
IL_00de: callvirt System.Boolean System.String::Contains(System.String)
IL_00e3: brtrue.s IL_00f2
IL_00e5: ldarg.0
IL_00e6: ldstr "_ashlands"
IL_00eb: callvirt System.Boolean System.String::Contains(System.String)
IL_00f0: brfalse.s IL_00f8
IL_00f2: ldstr "Fader"
IL_00f7: ret
IL_00f8: ldstr ""
IL_00fd: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Add_Prefabs()
.locals UnityEngine.GameObject, System.Collections.IEnumerator, UnityEngine.Transform, UnityEngine.ParticleSystem/MainModule, System.IDisposable
IL_0000: call Jotunn.Managers.PrefabManager Jotunn.Managers.PrefabManager::get_Instance()
IL_0005: ldstr "GO_FPO_Effect_PowerUnlock"
IL_000a: ldstr "fx_GP_Stone"
IL_000f: callvirt UnityEngine.GameObject Jotunn.Managers.PrefabManager::CreateClonedPrefab(System.String,System.String)
IL_0014: stloc.0
IL_0015: ldloc.0
IL_0016: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_001b: callvirt System.Collections.IEnumerator UnityEngine.Transform::GetEnumerator()
IL_0020: stloc.1
IL_0021: br.s IL_0050
IL_0023: ldloc.1
IL_0024: callvirt System.Object System.Collections.IEnumerator::get_Current()
IL_0029: castclass UnityEngine.Transform
IL_002e: stloc.2
IL_002f: ldloc.2
IL_0030: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.ParticleSystem>()
IL_0035: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_003a: brfalse.s IL_0050
IL_003c: ldloc.2
IL_003d: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.ParticleSystem>()
IL_0042: callvirt UnityEngine.ParticleSystem/MainModule UnityEngine.ParticleSystem::get_main()
IL_0047: stloc.3
IL_0048: ldloca.s V_3
IL_004a: ldc.i4.0
IL_004b: call System.Void UnityEngine.ParticleSystem/MainModule::set_scalingMode(UnityEngine.ParticleSystemScalingMode)
IL_0050: ldloc.1
IL_0051: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0056: brtrue.s IL_0023
IL_0058: leave.s IL_006e
IL_005a: ldloc.1
IL_005b: isinst System.IDisposable
IL_0060: stloc.s V_4
IL_0062: ldloc.s V_4
IL_0064: brfalse.s IL_006d
IL_0066: ldloc.s V_4
IL_0068: callvirt System.Void System.IDisposable::Dispose()
IL_006d: endfinally
IL_006e: call Jotunn.Managers.PrefabManager Jotunn.Managers.PrefabManager::get_Instance()
IL_0073: ldloc.0
IL_0074: callvirt System.Void Jotunn.Managers.PrefabManager::AddPrefab(UnityEngine.GameObject)
IL_0079: ldsfld System.Action ForsakenPowerOverhaul.ForsakenPowerOverhaul/<>O::<1>__Add_Prefabs
IL_007e: dup
IL_007f: brtrue.s IL_0094
IL_0081: pop
IL_0082: ldnull
IL_0083: ldftn System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Add_Prefabs()
IL_0089: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_008e: dup
IL_008f: stsfld System.Action ForsakenPowerOverhaul.ForsakenPowerOverhaul/<>O::<1>__Add_Prefabs
IL_0094: call System.Void Jotunn.Managers.PrefabManager::remove_OnVanillaPrefabsAvailable(System.Action)
IL_0099: ret
// EH Finally: 33 - 90 => 90 - 110

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Add_StatusEffects()
.locals ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO, System.Collections.Generic.List`1/Enumerator<System.String>, System.String, ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO, System.String, System.Collections.Generic.List`1/Enumerator<System.String>, System.String, ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO, System.Collections.Generic.List`1<System.Single>
IL_0000: call !!0 UnityEngine.ScriptableObject::CreateInstance<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldstr "SE_FPO_Passive"
IL_000c: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_0011: ldloc.0
IL_0012: ldstr "$ui_fpo_passive"
IL_0017: stfld System.String StatusEffect::m_name
IL_001c: ldloc.0
IL_001d: ldstr "$ui_fpo_passive"
IL_0022: stfld System.String StatusEffect::m_tooltip
IL_0027: call Jotunn.Managers.ItemManager Jotunn.Managers.ItemManager::get_Instance()
IL_002c: ldloc.0
IL_002d: ldc.i4.0
IL_002e: newobj System.Void Jotunn.Entities.CustomStatusEffect::.ctor(StatusEffect,System.Boolean)
IL_0033: callvirt System.Boolean Jotunn.Managers.ItemManager::AddStatusEffect(Jotunn.Entities.CustomStatusEffect)
IL_0038: pop
IL_0039: ldsfld System.Collections.Generic.List`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_BossNames
IL_003e: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_0043: stloc.1
IL_0044: br.s IL_00ad
IL_0046: ldloca.s V_1
IL_0048: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_004d: stloc.2
IL_004e: call !!0 UnityEngine.ScriptableObject::CreateInstance<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>()
IL_0053: stloc.3
IL_0054: ldloc.3
IL_0055: ldstr "SE_FPO_"
IL_005a: ldloc.2
IL_005b: call System.String System.String::Concat(System.String,System.String)
IL_0060: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_0065: ldloc.3
IL_0066: ldstr "$se_"
IL_006b: ldloc.2
IL_006c: callvirt System.String System.String::ToLower()
IL_0071: ldstr "_name"
IL_0076: call System.String System.String::Concat(System.String,System.String,System.String)
IL_007b: stfld System.String StatusEffect::m_name
IL_0080: ldloc.3
IL_0081: ldstr "$se_"
IL_0086: ldloc.2
IL_0087: callvirt System.String System.String::ToLower()
IL_008c: ldstr "_name"
IL_0091: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0096: stfld System.String StatusEffect::m_tooltip
IL_009b: call Jotunn.Managers.ItemManager Jotunn.Managers.ItemManager::get_Instance()
IL_00a0: ldloc.3
IL_00a1: ldc.i4.0
IL_00a2: newobj System.Void Jotunn.Entities.CustomStatusEffect::.ctor(StatusEffect,System.Boolean)
IL_00a7: callvirt System.Boolean Jotunn.Managers.ItemManager::AddStatusEffect(Jotunn.Entities.CustomStatusEffect)
IL_00ac: pop
IL_00ad: ldloca.s V_1
IL_00af: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_00b4: brtrue.s IL_0046
IL_00b6: leave.s IL_00c6
IL_00b8: ldloca.s V_1
IL_00ba: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_00c0: callvirt System.Void System.IDisposable::Dispose()
IL_00c5: endfinally
IL_00c6: ldsfld System.Collections.Generic.List`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_BossNames
IL_00cb: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_00d0: stloc.1
IL_00d1: br IL_08c4
IL_00d6: ldloca.s V_1
IL_00d8: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_00dd: stloc.s V_4
IL_00df: ldsfld System.Collections.Generic.List`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_Components
IL_00e4: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_00e9: stloc.s V_5
IL_00eb: br IL_08a8
IL_00f0: ldloca.s V_5
IL_00f2: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_00f7: stloc.s V_6
IL_00f9: call !!0 UnityEngine.ScriptableObject::CreateInstance<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>()
IL_00fe: stloc.s V_7
IL_0100: ldloc.s V_7
IL_0102: ldstr "SE_FPO_"
IL_0107: ldloc.s V_4
IL_0109: ldstr "_"
IL_010e: ldloc.s V_6
IL_0110: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_0115: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_011a: ldloc.s V_7
IL_011c: ldloc.s V_6
IL_011e: ldstr "Equipped"
IL_0123: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0128: brtrue.s IL_0142
IL_012a: ldstr "$se_"
IL_012f: ldloc.s V_4
IL_0131: callvirt System.String System.String::ToLower()
IL_0136: ldstr "_name"
IL_013b: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0140: br.s IL_0147
IL_0142: ldstr "$ui_fpo_equipped $ui_fpo_passive"
IL_0147: stfld System.String StatusEffect::m_name
IL_014c: ldloc.s V_7
IL_014e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0153: ldc.i4.5
IL_0154: newarr System.String
IL_0159: dup
IL_015a: ldc.i4.0
IL_015b: ldstr "ConfigEntry_"
IL_0160: stelem.ref
IL_0161: dup
IL_0162: ldc.i4.1
IL_0163: ldloc.s V_4
IL_0165: stelem.ref
IL_0166: dup
IL_0167: ldc.i4.2
IL_0168: ldstr "_"
IL_016d: stelem.ref
IL_016e: dup
IL_016f: ldc.i4.3
IL_0170: ldloc.s V_6
IL_0172: stelem.ref
IL_0173: dup
IL_0174: ldc.i4.4
IL_0175: ldstr "_MaxHealth"
IL_017a: stelem.ref
IL_017b: call System.String System.String::Concat(System.String[])
IL_0180: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::get_Item(!0)
IL_0185: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_018a: conv.r4
IL_018b: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxHealth
IL_0190: ldloc.s V_7
IL_0192: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0197: ldc.i4.5
IL_0198: newarr System.String
IL_019d: dup
IL_019e: ldc.i4.0
IL_019f: ldstr "ConfigEntry_"
IL_01a4: stelem.ref
IL_01a5: dup
IL_01a6: ldc.i4.1
IL_01a7: ldloc.s V_4
IL_01a9: stelem.ref
IL_01aa: dup
IL_01ab: ldc.i4.2
IL_01ac: ldstr "_"
IL_01b1: stelem.ref
IL_01b2: dup
IL_01b3: ldc.i4.3
IL_01b4: ldloc.s V_6
IL_01b6: stelem.ref
IL_01b7: dup
IL_01b8: ldc.i4.4
IL_01b9: ldstr "_HealthRegen"
IL_01be: stelem.ref
IL_01bf: call System.String System.String::Concat(System.String[])
IL_01c4: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::get_Item(!0)
IL_01c9: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_01ce: conv.r4
IL_01cf: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HealthRegen
IL_01d4: ldloc.s V_7
IL_01d6: ldc.r4 1
IL_01db: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_01e0: ldc.i4.5
IL_01e1: newarr System.String
IL_01e6: dup
IL_01e7: ldc.i4.0
IL_01e8: ldstr "ConfigEntry_"
IL_01ed: stelem.ref
IL_01ee: dup
IL_01ef: ldc.i4.1
IL_01f0: ldloc.s V_4
IL_01f2: stelem.ref
IL_01f3: dup
IL_01f4: ldc.i4.2
IL_01f5: ldstr "_"
IL_01fa: stelem.ref
IL_01fb: dup
IL_01fc: ldc.i4.3
IL_01fd: ldloc.s V_6
IL_01ff: stelem.ref
IL_0200: dup
IL_0201: ldc.i4.4
IL_0202: ldstr "_HealthRegenModifier"
IL_0207: stelem.ref
IL_0208: call System.String System.String::Concat(System.String[])
IL_020d: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_0212: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0217: ldc.r4 100
IL_021c: div
IL_021d: add
IL_021e: stfld System.Single SE_Stats::m_healthRegenMultiplier
IL_0223: ldloc.s V_7
IL_0225: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_022a: ldc.i4.5
IL_022b: newarr System.String
IL_0230: dup
IL_0231: ldc.i4.0
IL_0232: ldstr "ConfigEntry_"
IL_0237: stelem.ref
IL_0238: dup
IL_0239: ldc.i4.1
IL_023a: ldloc.s V_4
IL_023c: stelem.ref
IL_023d: dup
IL_023e: ldc.i4.2
IL_023f: ldstr "_"
IL_0244: stelem.ref
IL_0245: dup
IL_0246: ldc.i4.3
IL_0247: ldloc.s V_6
IL_0249: stelem.ref
IL_024a: dup
IL_024b: ldc.i4.4
IL_024c: ldstr "_MaxStamina"
IL_0251: stelem.ref
IL_0252: call System.String System.String::Concat(System.String[])
IL_0257: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::get_Item(!0)
IL_025c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0261: conv.r4
IL_0262: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxStamina
IL_0267: ldloc.s V_7
IL_0269: ldc.r4 1
IL_026e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0273: ldc.i4.5
IL_0274: newarr System.String
IL_0279: dup
IL_027a: ldc.i4.0
IL_027b: ldstr "ConfigEntry_"
IL_0280: stelem.ref
IL_0281: dup
IL_0282: ldc.i4.1
IL_0283: ldloc.s V_4
IL_0285: stelem.ref
IL_0286: dup
IL_0287: ldc.i4.2
IL_0288: ldstr "_"
IL_028d: stelem.ref
IL_028e: dup
IL_028f: ldc.i4.3
IL_0290: ldloc.s V_6
IL_0292: stelem.ref
IL_0293: dup
IL_0294: ldc.i4.4
IL_0295: ldstr "_StaminaRegenModifier"
IL_029a: stelem.ref
IL_029b: call System.String System.String::Concat(System.String[])
IL_02a0: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_02a5: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_02aa: ldc.r4 100
IL_02af: div
IL_02b0: add
IL_02b1: stfld System.Single SE_Stats::m_staminaRegenMultiplier
IL_02b6: ldloc.s V_7
IL_02b8: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_02bd: ldc.i4.5
IL_02be: newarr System.String
IL_02c3: dup
IL_02c4: ldc.i4.0
IL_02c5: ldstr "ConfigEntry_"
IL_02ca: stelem.ref
IL_02cb: dup
IL_02cc: ldc.i4.1
IL_02cd: ldloc.s V_4
IL_02cf: stelem.ref
IL_02d0: dup
IL_02d1: ldc.i4.2
IL_02d2: ldstr "_"
IL_02d7: stelem.ref
IL_02d8: dup
IL_02d9: ldc.i4.3
IL_02da: ldloc.s V_6
IL_02dc: stelem.ref
IL_02dd: dup
IL_02de: ldc.i4.4
IL_02df: ldstr "_MaxEitr"
IL_02e4: stelem.ref
IL_02e5: call System.String System.String::Concat(System.String[])
IL_02ea: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::get_Item(!0)
IL_02ef: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_02f4: conv.r4
IL_02f5: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxEitr
IL_02fa: ldloc.s V_7
IL_02fc: ldc.r4 1
IL_0301: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0306: ldc.i4.5
IL_0307: newarr System.String
IL_030c: dup
IL_030d: ldc.i4.0
IL_030e: ldstr "ConfigEntry_"
IL_0313: stelem.ref
IL_0314: dup
IL_0315: ldc.i4.1
IL_0316: ldloc.s V_4
IL_0318: stelem.ref
IL_0319: dup
IL_031a: ldc.i4.2
IL_031b: ldstr "_"
IL_0320: stelem.ref
IL_0321: dup
IL_0322: ldc.i4.3
IL_0323: ldloc.s V_6
IL_0325: stelem.ref
IL_0326: dup
IL_0327: ldc.i4.4
IL_0328: ldstr "_EitrRegenModifier"
IL_032d: stelem.ref
IL_032e: call System.String System.String::Concat(System.String[])
IL_0333: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_0338: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_033d: ldc.r4 100
IL_0342: div
IL_0343: add
IL_0344: stfld System.Single SE_Stats::m_eitrRegenMultiplier
IL_0349: ldloc.s V_7
IL_034b: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_0350: ldc.i4.5
IL_0351: newarr System.String
IL_0356: dup
IL_0357: ldc.i4.0
IL_0358: ldstr "ConfigEntry_"
IL_035d: stelem.ref
IL_035e: dup
IL_035f: ldc.i4.1
IL_0360: ldloc.s V_4
IL_0362: stelem.ref
IL_0363: dup
IL_0364: ldc.i4.2
IL_0365: ldstr "_"
IL_036a: stelem.ref
IL_036b: dup
IL_036c: ldc.i4.3
IL_036d: ldloc.s V_6
IL_036f: stelem.ref
IL_0370: dup
IL_0371: ldc.i4.4
IL_0372: ldstr "_MaxWeight"
IL_0377: stelem.ref
IL_0378: call System.String System.String::Concat(System.String[])
IL_037d: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::get_Item(!0)
IL_0382: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0387: conv.r4
IL_0388: stfld System.Single SE_Stats::m_addMaxCarryWeight
IL_038d: ldloc.s V_7
IL_038f: ldc.r4 0
IL_0394: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0399: ldc.i4.5
IL_039a: newarr System.String
IL_039f: dup
IL_03a0: ldc.i4.0
IL_03a1: ldstr "ConfigEntry_"
IL_03a6: stelem.ref
IL_03a7: dup
IL_03a8: ldc.i4.1
IL_03a9: ldloc.s V_4
IL_03ab: stelem.ref
IL_03ac: dup
IL_03ad: ldc.i4.2
IL_03ae: ldstr "_"
IL_03b3: stelem.ref
IL_03b4: dup
IL_03b5: ldc.i4.3
IL_03b6: ldloc.s V_6
IL_03b8: stelem.ref
IL_03b9: dup
IL_03ba: ldc.i4.4
IL_03bb: ldstr "_MoveSpeedModifier"
IL_03c0: stelem.ref
IL_03c1: call System.String System.String::Concat(System.String[])
IL_03c6: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_03cb: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_03d0: ldc.r4 100
IL_03d5: div
IL_03d6: add
IL_03d7: stfld System.Single SE_Stats::m_speedModifier
IL_03dc: ldloc.s V_7
IL_03de: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_03e3: ldc.i4.5
IL_03e4: newarr System.String
IL_03e9: dup
IL_03ea: ldc.i4.0
IL_03eb: ldstr "ConfigEntry_"
IL_03f0: stelem.ref
IL_03f1: dup
IL_03f2: ldc.i4.1
IL_03f3: ldloc.s V_4
IL_03f5: stelem.ref
IL_03f6: dup
IL_03f7: ldc.i4.2
IL_03f8: ldstr "_"
IL_03fd: stelem.ref
IL_03fe: dup
IL_03ff: ldc.i4.3
IL_0400: ldloc.s V_6
IL_0402: stelem.ref
IL_0403: dup
IL_0404: ldc.i4.4
IL_0405: ldstr "_JumpForceModifier"
IL_040a: stelem.ref
IL_040b: call System.String System.String::Concat(System.String[])
IL_0410: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_0415: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_041a: ldc.r4 0
IL_041f: bne.un.s IL_0428
IL_0421: call UnityEngine.Vector3 UnityEngine.Vector3::get_zero()
IL_0426: br.s IL_0474
IL_0428: call UnityEngine.Vector3 UnityEngine.Vector3::get_one()
IL_042d: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0432: ldc.i4.5
IL_0433: newarr System.String
IL_0438: dup
IL_0439: ldc.i4.0
IL_043a: ldstr "ConfigEntry_"
IL_043f: stelem.ref
IL_0440: dup
IL_0441: ldc.i4.1
IL_0442: ldloc.s V_4
IL_0444: stelem.ref
IL_0445: dup
IL_0446: ldc.i4.2
IL_0447: ldstr "_"
IL_044c: stelem.ref
IL_044d: dup
IL_044e: ldc.i4.3
IL_044f: ldloc.s V_6
IL_0451: stelem.ref
IL_0452: dup
IL_0453: ldc.i4.4
IL_0454: ldstr "_JumpForceModifier"
IL_0459: stelem.ref
IL_045a: call System.String System.String::Concat(System.String[])
IL_045f: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_0464: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0469: ldc.r4 200
IL_046e: div
IL_046f: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_0474: stfld UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_0479: ldloc.s V_7
IL_047b: ldc.r4 0
IL_0480: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0485: ldc.i4.5
IL_0486: newarr System.String
IL_048b: dup
IL_048c: ldc.i4.0
IL_048d: ldstr "ConfigEntry_"
IL_0492: stelem.ref
IL_0493: dup
IL_0494: ldc.i4.1
IL_0495: ldloc.s V_4
IL_0497: stelem.ref
IL_0498: dup
IL_0499: ldc.i4.2
IL_049a: ldstr "_"
IL_049f: stelem.ref
IL_04a0: dup
IL_04a1: ldc.i4.3
IL_04a2: ldloc.s V_6
IL_04a4: stelem.ref
IL_04a5: dup
IL_04a6: ldc.i4.4
IL_04a7: ldstr "_MaxFallSpeed"
IL_04ac: stelem.ref
IL_04ad: call System.String System.String::Concat(System.String[])
IL_04b2: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_04b7: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_04bc: add
IL_04bd: stfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_04c2: ldloc.s V_7
IL_04c4: ldc.r4 0
IL_04c9: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_04ce: ldc.i4.5
IL_04cf: newarr System.String
IL_04d4: dup
IL_04d5: ldc.i4.0
IL_04d6: ldstr "ConfigEntry_"
IL_04db: stelem.ref
IL_04dc: dup
IL_04dd: ldc.i4.1
IL_04de: ldloc.s V_4
IL_04e0: stelem.ref
IL_04e1: dup
IL_04e2: ldc.i4.2
IL_04e3: ldstr "_"
IL_04e8: stelem.ref
IL_04e9: dup
IL_04ea: ldc.i4.3
IL_04eb: ldloc.s V_6
IL_04ed: stelem.ref
IL_04ee: dup
IL_04ef: ldc.i4.4
IL_04f0: ldstr "_EquipmentSpeedModifier"
IL_04f5: stelem.ref
IL_04f6: call System.String System.String::Concat(System.String[])
IL_04fb: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_0500: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0505: ldc.r4 100
IL_050a: div
IL_050b: sub
IL_050c: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_EquipmentSpeedModifier
IL_0511: ldloc.s V_7
IL_0513: ldc.r4 0
IL_0518: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_051d: ldc.i4.5
IL_051e: newarr System.String
IL_0523: dup
IL_0524: ldc.i4.0
IL_0525: ldstr "ConfigEntry_"
IL_052a: stelem.ref
IL_052b: dup
IL_052c: ldc.i4.1
IL_052d: ldloc.s V_4
IL_052f: stelem.ref
IL_0530: dup
IL_0531: ldc.i4.2
IL_0532: ldstr "_"
IL_0537: stelem.ref
IL_0538: dup
IL_0539: ldc.i4.3
IL_053a: ldloc.s V_6
IL_053c: stelem.ref
IL_053d: dup
IL_053e: ldc.i4.4
IL_053f: ldstr "_WindSpeedModifier"
IL_0544: stelem.ref
IL_0545: call System.String System.String::Concat(System.String[])
IL_054a: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_054f: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0554: ldc.r4 100
IL_0559: div
IL_055a: add
IL_055b: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_WindSpeedModifier
IL_0560: ldloc.s V_7
IL_0562: ldc.r4 0
IL_0567: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_056c: ldc.i4.5
IL_056d: newarr System.String
IL_0572: dup
IL_0573: ldc.i4.0
IL_0574: ldstr "ConfigEntry_"
IL_0579: stelem.ref
IL_057a: dup
IL_057b: ldc.i4.1
IL_057c: ldloc.s V_4
IL_057e: stelem.ref
IL_057f: dup
IL_0580: ldc.i4.2
IL_0581: ldstr "_"
IL_0586: stelem.ref
IL_0587: dup
IL_0588: ldc.i4.3
IL_0589: ldloc.s V_6
IL_058b: stelem.ref
IL_058c: dup
IL_058d: ldc.i4.4
IL_058e: ldstr "_RunStaminaCostModifier"
IL_0593: stelem.ref
IL_0594: call System.String System.String::Concat(System.String[])
IL_0599: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_059e: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_05a3: ldc.r4 100
IL_05a8: div
IL_05a9: sub
IL_05aa: stfld System.Single SE_Stats::m_runStaminaDrainModifier
IL_05af: ldloc.s V_7
IL_05b1: ldc.r4 0
IL_05b6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_05bb: ldc.i4.5
IL_05bc: newarr System.String
IL_05c1: dup
IL_05c2: ldc.i4.0
IL_05c3: ldstr "ConfigEntry_"
IL_05c8: stelem.ref
IL_05c9: dup
IL_05ca: ldc.i4.1
IL_05cb: ldloc.s V_4
IL_05cd: stelem.ref
IL_05ce: dup
IL_05cf: ldc.i4.2
IL_05d0: ldstr "_"
IL_05d5: stelem.ref
IL_05d6: dup
IL_05d7: ldc.i4.3
IL_05d8: ldloc.s V_6
IL_05da: stelem.ref
IL_05db: dup
IL_05dc: ldc.i4.4
IL_05dd: ldstr "_JumpStaminaCostModifier"
IL_05e2: stelem.ref
IL_05e3: call System.String System.String::Concat(System.String[])
IL_05e8: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_05ed: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_05f2: ldc.r4 100
IL_05f7: div
IL_05f8: sub
IL_05f9: stfld System.Single SE_Stats::m_jumpStaminaUseModifier
IL_05fe: ldloc.s V_7
IL_0600: ldc.r4 0
IL_0605: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_060a: ldc.i4.5
IL_060b: newarr System.String
IL_0610: dup
IL_0611: ldc.i4.0
IL_0612: ldstr "ConfigEntry_"
IL_0617: stelem.ref
IL_0618: dup
IL_0619: ldc.i4.1
IL_061a: ldloc.s V_4
IL_061c: stelem.ref
IL_061d: dup
IL_061e: ldc.i4.2
IL_061f: ldstr "_"
IL_0624: stelem.ref
IL_0625: dup
IL_0626: ldc.i4.3
IL_0627: ldloc.s V_6
IL_0629: stelem.ref
IL_062a: dup
IL_062b: ldc.i4.4
IL_062c: ldstr "_StealthModifier"
IL_0631: stelem.ref
IL_0632: call System.String System.String::Concat(System.String[])
IL_0637: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_063c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0641: ldc.r4 100
IL_0646: div
IL_0647: sub
IL_0648: stfld System.Single SE_Stats::m_stealthModifier
IL_064d: ldloc.s V_7
IL_064f: ldc.r4 0
IL_0654: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0659: ldc.i4.5
IL_065a: newarr System.String
IL_065f: dup
IL_0660: ldc.i4.0
IL_0661: ldstr "ConfigEntry_"
IL_0666: stelem.ref
IL_0667: dup
IL_0668: ldc.i4.1
IL_0669: ldloc.s V_4
IL_066b: stelem.ref
IL_066c: dup
IL_066d: ldc.i4.2
IL_066e: ldstr "_"
IL_0673: stelem.ref
IL_0674: dup
IL_0675: ldc.i4.3
IL_0676: ldloc.s V_6
IL_0678: stelem.ref
IL_0679: dup
IL_067a: ldc.i4.4
IL_067b: ldstr "_NoiseModifier"
IL_0680: stelem.ref
IL_0681: call System.String System.String::Concat(System.String[])
IL_0686: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_068b: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0690: ldc.r4 100
IL_0695: div
IL_0696: sub
IL_0697: stfld System.Single SE_Stats::m_noiseModifier
IL_069c: ldloc.s V_7
IL_069e: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_06a3: ldc.i4.5
IL_06a4: newarr System.String
IL_06a9: dup
IL_06aa: ldc.i4.0
IL_06ab: ldstr "ConfigEntry_"
IL_06b0: stelem.ref
IL_06b1: dup
IL_06b2: ldc.i4.1
IL_06b3: ldloc.s V_4
IL_06b5: stelem.ref
IL_06b6: dup
IL_06b7: ldc.i4.2
IL_06b8: ldstr "_"
IL_06bd: stelem.ref
IL_06be: dup
IL_06bf: ldc.i4.3
IL_06c0: ldloc.s V_6
IL_06c2: stelem.ref
IL_06c3: dup
IL_06c4: ldc.i4.4
IL_06c5: ldstr "_StatusAttributes"
IL_06ca: stelem.ref
IL_06cb: call System.String System.String::Concat(System.String[])
IL_06d0: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::get_Item(!0)
IL_06d5: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_06da: call System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetStatusAttributes(System.String)
IL_06df: stfld System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_StatusAttributes
IL_06e4: ldloc.s V_7
IL_06e6: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_06eb: ldc.i4.5
IL_06ec: newarr System.String
IL_06f1: dup
IL_06f2: ldc.i4.0
IL_06f3: ldstr "ConfigEntry_"
IL_06f8: stelem.ref
IL_06f9: dup
IL_06fa: ldc.i4.1
IL_06fb: ldloc.s V_4
IL_06fd: stelem.ref
IL_06fe: dup
IL_06ff: ldc.i4.2
IL_0700: ldstr "_"
IL_0705: stelem.ref
IL_0706: dup
IL_0707: ldc.i4.3
IL_0708: ldloc.s V_6
IL_070a: stelem.ref
IL_070b: dup
IL_070c: ldc.i4.4
IL_070d: ldstr "_OutgoingDamageTypes"
IL_0712: stelem.ref
IL_0713: call System.String System.String::Concat(System.String[])
IL_0718: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::get_Item(!0)
IL_071d: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_0722: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0727: ldc.i4.5
IL_0728: newarr System.String
IL_072d: dup
IL_072e: ldc.i4.0
IL_072f: ldstr "ConfigEntry_"
IL_0734: stelem.ref
IL_0735: dup
IL_0736: ldc.i4.1
IL_0737: ldloc.s V_4
IL_0739: stelem.ref
IL_073a: dup
IL_073b: ldc.i4.2
IL_073c: ldstr "_"
IL_0741: stelem.ref
IL_0742: dup
IL_0743: ldc.i4.3
IL_0744: ldloc.s V_6
IL_0746: stelem.ref
IL_0747: dup
IL_0748: ldc.i4.4
IL_0749: ldstr "_OutgoingDamageModifiers"
IL_074e: stelem.ref
IL_074f: call System.String System.String::Concat(System.String[])
IL_0754: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::get_Item(!0)
IL_0759: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_075e: ldloca.s V_8
IL_0760: call System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetOutgoingDamages(System.String,System.String,System.Collections.Generic.List`1<System.Single>&)
IL_0765: stfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_076a: ldloc.s V_7
IL_076c: ldloc.s V_8
IL_076e: stfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_0773: ldloc.s V_7
IL_0775: ldc.r4 0
IL_077a: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_077f: ldc.i4.5
IL_0780: newarr System.String
IL_0785: dup
IL_0786: ldc.i4.0
IL_0787: ldstr "ConfigEntry_"
IL_078c: stelem.ref
IL_078d: dup
IL_078e: ldc.i4.1
IL_078f: ldloc.s V_4
IL_0791: stelem.ref
IL_0792: dup
IL_0793: ldc.i4.2
IL_0794: ldstr "_"
IL_0799: stelem.ref
IL_079a: dup
IL_079b: ldc.i4.3
IL_079c: ldloc.s V_6
IL_079e: stelem.ref
IL_079f: dup
IL_07a0: ldc.i4.4
IL_07a1: ldstr "_FallDamageModifier"
IL_07a6: stelem.ref
IL_07a7: call System.String System.String::Concat(System.String[])
IL_07ac: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_07b1: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_07b6: ldc.r4 100
IL_07bb: div
IL_07bc: sub
IL_07bd: stfld System.Single SE_Stats::m_fallDamageModifier
IL_07c2: ldloc.s V_7
IL_07c4: ldc.r4 0
IL_07c9: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_07ce: ldc.i4.5
IL_07cf: newarr System.String
IL_07d4: dup
IL_07d5: ldc.i4.0
IL_07d6: ldstr "ConfigEntry_"
IL_07db: stelem.ref
IL_07dc: dup
IL_07dd: ldc.i4.1
IL_07de: ldloc.s V_4
IL_07e0: stelem.ref
IL_07e1: dup
IL_07e2: ldc.i4.2
IL_07e3: ldstr "_"
IL_07e8: stelem.ref
IL_07e9: dup
IL_07ea: ldc.i4.3
IL_07eb: ldloc.s V_6
IL_07ed: stelem.ref
IL_07ee: dup
IL_07ef: ldc.i4.4
IL_07f0: ldstr "_HeatDamageModifier"
IL_07f5: stelem.ref
IL_07f6: call System.String System.String::Concat(System.String[])
IL_07fb: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::get_Item(!0)
IL_0800: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0805: ldc.r4 100
IL_080a: div
IL_080b: sub
IL_080c: stfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HeatDamageModifier
IL_0811: ldloc.s V_7
IL_0813: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0818: ldc.i4.5
IL_0819: newarr System.String
IL_081e: dup
IL_081f: ldc.i4.0
IL_0820: ldstr "ConfigEntry_"
IL_0825: stelem.ref
IL_0826: dup
IL_0827: ldc.i4.1
IL_0828: ldloc.s V_4
IL_082a: stelem.ref
IL_082b: dup
IL_082c: ldc.i4.2
IL_082d: ldstr "_"
IL_0832: stelem.ref
IL_0833: dup
IL_0834: ldc.i4.3
IL_0835: ldloc.s V_6
IL_0837: stelem.ref
IL_0838: dup
IL_0839: ldc.i4.4
IL_083a: ldstr "_IncomingDamageTypes"
IL_083f: stelem.ref
IL_0840: call System.String System.String::Concat(System.String[])
IL_0845: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::get_Item(!0)
IL_084a: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_084f: ldsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_0854: ldc.i4.5
IL_0855: newarr System.String
IL_085a: dup
IL_085b: ldc.i4.0
IL_085c: ldstr "ConfigEntry_"
IL_0861: stelem.ref
IL_0862: dup
IL_0863: ldc.i4.1
IL_0864: ldloc.s V_4
IL_0866: stelem.ref
IL_0867: dup
IL_0868: ldc.i4.2
IL_0869: ldstr "_"
IL_086e: stelem.ref
IL_086f: dup
IL_0870: ldc.i4.3
IL_0871: ldloc.s V_6
IL_0873: stelem.ref
IL_0874: dup
IL_0875: ldc.i4.4
IL_0876: ldstr "_IncomingDamageModifiers"
IL_087b: stelem.ref
IL_087c: call System.String System.String::Concat(System.String[])
IL_0881: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::get_Item(!0)
IL_0886: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_088b: call System.Collections.Generic.List`1<HitData/DamageModPair> ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetIncomingDamages(System.String,System.String)
IL_0890: stfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_0895: call Jotunn.Managers.ItemManager Jotunn.Managers.ItemManager::get_Instance()
IL_089a: ldloc.s V_7
IL_089c: ldc.i4.0
IL_089d: newobj System.Void Jotunn.Entities.CustomStatusEffect::.ctor(StatusEffect,System.Boolean)
IL_08a2: callvirt System.Boolean Jotunn.Managers.ItemManager::AddStatusEffect(Jotunn.Entities.CustomStatusEffect)
IL_08a7: pop
IL_08a8: ldloca.s V_5
IL_08aa: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_08af: brtrue IL_00f0
IL_08b4: leave.s IL_08c4
IL_08b6: ldloca.s V_5
IL_08b8: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_08be: callvirt System.Void System.IDisposable::Dispose()
IL_08c3: endfinally
IL_08c4: ldloca.s V_1
IL_08c6: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_08cb: brtrue IL_00d6
IL_08d0: leave.s IL_08e0
IL_08d2: ldloca.s V_1
IL_08d4: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_08da: callvirt System.Void System.IDisposable::Dispose()
IL_08df: endfinally
IL_08e0: ret
// EH Finally: 68 - 184 => 184 - 198
// EH Finally: 235 - 2230 => 2230 - 2244
// EH Finally: 209 - 2258 => 2258 - 2272

// System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetStatusAttributes(System.String)
.locals System.Collections.Generic.List`1<System.String>, System.Collections.Generic.List`1<StatusEffect/StatusAttribute>, System.Int32, System.Boolean, System.Collections.Generic.List`1/Enumerator<StatusEffect/StatusAttribute>, StatusEffect/StatusAttribute
IL_0000: ldarg.0
IL_0001: ldc.i4.1
IL_0002: newarr System.Char
IL_0007: dup
IL_0008: ldc.i4.0
IL_0009: ldc.i4.s 44
IL_000b: stelem.i2
IL_000c: callvirt System.String[] System.String::Split(System.Char[])
IL_0011: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.String>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0016: stloc.0
IL_0017: newobj System.Void System.Collections.Generic.List`1<StatusEffect/StatusAttribute>::.ctor()
IL_001c: stloc.1
IL_001d: ldc.i4.0
IL_001e: stloc.2
IL_001f: br.s IL_0097
IL_0021: ldloc.0
IL_0022: ldloc.2
IL_0023: callvirt !0 System.Collections.Generic.List`1<System.String>::get_Item(System.Int32)
IL_0028: callvirt System.String System.String::ToLower()
IL_002d: call System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetStatusAttributeValid(System.String)
IL_0032: brfalse.s IL_0093
IL_0034: ldc.i4.1
IL_0035: stloc.3
IL_0036: ldloc.1
IL_0037: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<StatusEffect/StatusAttribute>::GetEnumerator()
IL_003c: stloc.s V_4
IL_003e: br.s IL_0060
IL_0040: ldloca.s V_4
IL_0042: call !0 System.Collections.Generic.List`1/Enumerator<StatusEffect/StatusAttribute>::get_Current()
IL_0047: stloc.s V_5
IL_0049: ldloc.0
IL_004a: ldloc.2
IL_004b: callvirt !0 System.Collections.Generic.List`1<System.String>::get_Item(System.Int32)
IL_0050: callvirt System.String System.String::ToLower()
IL_0055: call StatusEffect/StatusAttribute ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetStatusAttribute(System.String)
IL_005a: ldloc.s V_5
IL_005c: bne.un.s IL_0060
IL_005e: ldc.i4.0
IL_005f: stloc.3
IL_0060: ldloca.s V_4
IL_0062: call System.Boolean System.Collections.Generic.List`1/Enumerator<StatusEffect/StatusAttribute>::MoveNext()
IL_0067: brtrue.s IL_0040
IL_0069: leave.s IL_0079
IL_006b: ldloca.s V_4
IL_006d: constrained. System.Collections.Generic.List`1/Enumerator<StatusEffect/StatusAttribute>
IL_0073: callvirt System.Void System.IDisposable::Dispose()
IL_0078: endfinally
IL_0079: ldloc.3
IL_007a: brfalse.s IL_0093
IL_007c: ldloc.1
IL_007d: ldloc.0
IL_007e: ldloc.2
IL_007f: callvirt !0 System.Collections.Generic.List`1<System.String>::get_Item(System.Int32)
IL_0084: callvirt System.String System.String::ToLower()
IL_0089: call StatusEffect/StatusAttribute ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetStatusAttribute(System.String)
IL_008e: callvirt System.Void System.Collections.Generic.List`1<StatusEffect/StatusAttribute>::Add(!0)
IL_0093: ldloc.2
IL_0094: ldc.i4.1
IL_0095: add
IL_0096: stloc.2
IL_0097: ldloc.2
IL_0098: ldloc.0
IL_0099: callvirt System.Int32 System.Collections.Generic.List`1<System.String>::get_Count()
IL_009e: blt.s IL_0021
IL_00a0: ldloc.1
IL_00a1: ret
// EH Finally: 62 - 107 => 107 - 121

// System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetStatusAttributeValid(System.String)
.locals System.Boolean
IL_0000: ldarg.0
IL_0001: ldstr "coldresistance"
IL_0006: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_000b: brtrue.s IL_0029
IL_000d: ldarg.0
IL_000e: ldstr "doubleimpactdamage"
IL_0013: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0018: brtrue.s IL_002d
IL_001a: ldarg.0
IL_001b: ldstr "sailingpower"
IL_0020: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0025: brtrue.s IL_0031
IL_0027: br.s IL_0035
IL_0029: ldc.i4.1
IL_002a: stloc.0
IL_002b: br.s IL_0037
IL_002d: ldc.i4.1
IL_002e: stloc.0
IL_002f: br.s IL_0037
IL_0031: ldc.i4.1
IL_0032: stloc.0
IL_0033: br.s IL_0037
IL_0035: ldc.i4.0
IL_0036: stloc.0
IL_0037: ldloc.0
IL_0038: ret

// StatusEffect/StatusAttribute ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetStatusAttribute(System.String)
.locals StatusEffect/StatusAttribute
IL_0000: ldarg.0
IL_0001: ldstr "coldresistance"
IL_0006: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_000b: brtrue.s IL_0029
IL_000d: ldarg.0
IL_000e: ldstr "doubleimpactdamage"
IL_0013: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0018: brtrue.s IL_002d
IL_001a: ldarg.0
IL_001b: ldstr "sailingpower"
IL_0020: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0025: brtrue.s IL_0031
IL_0027: br.s IL_0035
IL_0029: ldc.i4.1
IL_002a: stloc.0
IL_002b: br.s IL_0037
IL_002d: ldc.i4.2
IL_002e: stloc.0
IL_002f: br.s IL_0037
IL_0031: ldc.i4.4
IL_0032: stloc.0
IL_0033: br.s IL_0037
IL_0035: ldc.i4.0
IL_0036: stloc.0
IL_0037: ldloc.0
IL_0038: ret

// System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetOutgoingDamages(System.String,System.String,System.Collections.Generic.List`1<System.Single>&)
.locals System.Collections.Generic.List`1<System.String>, System.Collections.Generic.List`1<System.String>, System.Collections.Generic.List`1<Skills/SkillType>, System.Collections.Generic.List`1<System.Single>, System.Int32, System.Boolean, System.Collections.Generic.List`1/Enumerator<Skills/SkillType>, Skills/SkillType, System.Single
IL_0000: ldarg.0
IL_0001: ldc.i4.1
IL_0002: newarr System.Char
IL_0007: dup
IL_0008: ldc.i4.0
IL_0009: ldc.i4.s 44
IL_000b: stelem.i2
IL_000c: callvirt System.String[] System.String::Split(System.Char[])
IL_0011: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.String>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0016: stloc.0
IL_0017: ldarg.1
IL_0018: ldc.i4.1
IL_0019: newarr System.Char
IL_001e: dup
IL_001f: ldc.i4.0
IL_0020: ldc.i4.s 44
IL_0022: stelem.i2
IL_0023: callvirt System.String[] System.String::Split(System.Char[])
IL_0028: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.String>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_002d: stloc.1
IL_002e: newobj System.Void System.Collections.Generic.List`1<Skills/SkillType>::.ctor()
IL_0033: stloc.2
IL_0034: newobj System.Void System.Collections.Generic.List`1<System.Single>::.ctor()
IL_0039: stloc.3
IL_003a: ldc.i4.0
IL_003b: stloc.s V_4
IL_003d: br IL_00ec
IL_0042: ldloc.0
IL_0043: ldloc.s V_4
IL_0045: callvirt !0 System.Collections.Generic.List`1<System.String>::get_Item(System.Int32)
IL_004a: callvirt System.String System.String::ToLower()
IL_004f: call System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetOutgoingDamageTypeValid(System.String)
IL_0054: brfalse IL_00e6
IL_0059: ldc.i4.1
IL_005a: stloc.s V_5
IL_005c: ldloc.2
IL_005d: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Skills/SkillType>::GetEnumerator()
IL_0062: stloc.s V_6
IL_0064: br.s IL_0088
IL_0066: ldloca.s V_6
IL_0068: call !0 System.Collections.Generic.List`1/Enumerator<Skills/SkillType>::get_Current()
IL_006d: stloc.s V_7
IL_006f: ldloc.0
IL_0070: ldloc.s V_4
IL_0072: callvirt !0 System.Collections.Generic.List`1<System.String>::get_Item(System.Int32)
IL_0077: callvirt System.String System.String::ToLower()
IL_007c: call Skills/SkillType ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetOutgoingDamageType(System.String)
IL_0081: ldloc.s V_7
IL_0083: bne.un.s IL_0088
IL_0085: ldc.i4.0
IL_0086: stloc.s V_5
IL_0088: ldloca.s V_6
IL_008a: call System.Boolean System.Collections.Generic.List`1/Enumerator<Skills/SkillType>::MoveNext()
IL_008f: brtrue.s IL_0066
IL_0091: leave.s IL_00a1
IL_0093: ldloca.s V_6
IL_0095: constrained. System.Collections.Generic.List`1/Enumerator<Skills/SkillType>
IL_009b: callvirt System.Void System.IDisposable::Dispose()
IL_00a0: endfinally
IL_00a1: ldloc.s V_5
IL_00a3: brfalse.s IL_00e6
IL_00a5: ldloc.2
IL_00a6: ldloc.0
IL_00a7: ldloc.s V_4
IL_00a9: callvirt !0 System.Collections.Generic.List`1<System.String>::get_Item(System.Int32)
IL_00ae: callvirt System.String System.String::ToLower()
IL_00b3: call Skills/SkillType ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetOutgoingDamageType(System.String)
IL_00b8: callvirt System.Void System.Collections.Generic.List`1<Skills/SkillType>::Add(!0)
IL_00bd: ldloc.1
IL_00be: ldloc.s V_4
IL_00c0: callvirt !0 System.Collections.Generic.List`1<System.String>::get_Item(System.Int32)
IL_00c5: ldloca.s V_8
IL_00c7: call System.Boolean System.Single::TryParse(System.String,System.Single&)
IL_00cc: brfalse.s IL_00de
IL_00ce: ldloc.3
IL_00cf: ldloc.s V_8
IL_00d1: ldc.r4 100
IL_00d6: div
IL_00d7: callvirt System.Void System.Collections.Generic.List`1<System.Single>::Add(!0)
IL_00dc: br.s IL_00e6
IL_00de: ldloc.3
IL_00df: ldloc.s V_8
IL_00e1: callvirt System.Void System.Collections.Generic.List`1<System.Single>::Add(!0)
IL_00e6: ldloc.s V_4
IL_00e8: ldc.i4.1
IL_00e9: add
IL_00ea: stloc.s V_4
IL_00ec: ldloc.s V_4
IL_00ee: ldloc.0
IL_00ef: callvirt System.Int32 System.Collections.Generic.List`1<System.String>::get_Count()
IL_00f4: bge.s IL_0103
IL_00f6: ldloc.s V_4
IL_00f8: ldloc.1
IL_00f9: callvirt System.Int32 System.Collections.Generic.List`1<System.String>::get_Count()
IL_00fe: blt IL_0042
IL_0103: ldarg.2
IL_0104: ldloc.3
IL_0105: stind.ref
IL_0106: ldloc.2
IL_0107: ret
// EH Finally: 100 - 147 => 147 - 161

// System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetOutgoingDamageTypeValid(System.String)
.locals System.Boolean, System.Int32, System.Char
IL_0000: ldarg.0
IL_0001: brfalse IL_01e3
IL_0006: ldarg.0
IL_0007: call System.Int32 System.String::get_Length()
IL_000c: stloc.1
IL_000d: ldloc.1
IL_000e: ldc.i4.3
IL_000f: sub
IL_0010: switch IL_00a9,IL_004a,IL_00d3,IL_0067,IL_00be,IL_008c,IL_016f,IL_018d,IL_019c,IL_01e3,IL_01e3,IL_017e
IL_0045: br IL_01e3
IL_004a: ldarg.0
IL_004b: ldc.i4.0
IL_004c: call System.Char System.String::get_Chars(System.Int32)
IL_0051: stloc.2
IL_0052: ldloc.2
IL_0053: ldc.i4.s 97
IL_0055: beq IL_00e8
IL_005a: ldloc.2
IL_005b: ldc.i4.s 98
IL_005d: beq IL_00fd
IL_0062: br IL_01e3
IL_0067: ldarg.0
IL_0068: ldc.i4.1
IL_0069: call System.Char System.String::get_Chars(System.Int32)
IL_006e: stloc.2
IL_006f: ldloc.2
IL_0070: ldc.i4.s 110
IL_0072: beq IL_0112
IL_0077: ldloc.2
IL_0078: ldc.i4.s 112
IL_007a: beq IL_0127
IL_007f: ldloc.2
IL_0080: ldc.i4.s 119
IL_0082: beq IL_013c
IL_0087: br IL_01e3
IL_008c: ldarg.0
IL_008d: ldc.i4.1
IL_008e: call System.Char System.String::get_Chars(System.Int32)
IL_0093: stloc.2
IL_0094: ldloc.2
IL_0095: ldc.i4.s 105
IL_0097: beq IL_0160
IL_009c: ldloc.2
IL_009d: ldc.i4.s 111
IL_009f: beq IL_014e
IL_00a4: br IL_01e3
IL_00a9: ldarg.0
IL_00aa: ldstr "all"
IL_00af: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00b4: brtrue IL_01ab
IL_00b9: br IL_01e3
IL_00be: ldarg.0
IL_00bf: ldstr "unarmed"
IL_00c4: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00c9: brtrue IL_01af
IL_00ce: br IL_01e3
IL_00d3: ldarg.0
IL_00d4: ldstr "clubs"
IL_00d9: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00de: brtrue IL_01b3
IL_00e3: br IL_01e3
IL_00e8: ldarg.0
IL_00e9: ldstr "axes"
IL_00ee: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00f3: brtrue IL_01b7
IL_00f8: br IL_01e3
IL_00fd: ldarg.0
IL_00fe: ldstr "bows"
IL_0103: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0108: brtrue IL_01cb
IL_010d: br IL_01e3
IL_0112: ldarg.0
IL_0113: ldstr "knives"
IL_0118: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_011d: brtrue IL_01bb
IL_0122: br IL_01e3
IL_0127: ldarg.0
IL_0128: ldstr "spears"
IL_012d: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0132: brtrue IL_01bf
IL_0137: br IL_01e3
IL_013c: ldarg.0
IL_013d: ldstr "swords"
IL_0142: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0147: brtrue.s IL_01c3
IL_0149: br IL_01e3
IL_014e: ldarg.0
IL_014f: ldstr "polearms"
IL_0154: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0159: brtrue.s IL_01c7
IL_015b: br IL_01e3
IL_0160: ldarg.0
IL_0161: ldstr "pickaxes"
IL_0166: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_016b: brtrue.s IL_01df
IL_016d: br.s IL_01e3
IL_016f: ldarg.0
IL_0170: ldstr "crossbows"
IL_0175: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_017a: brtrue.s IL_01cf
IL_017c: br.s IL_01e3
IL_017e: ldarg.0
IL_017f: ldstr "elementalmagic"
IL_0184: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0189: brtrue.s IL_01d3
IL_018b: br.s IL_01e3
IL_018d: ldarg.0
IL_018e: ldstr "bloodmagic"
IL_0193: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0198: brtrue.s IL_01d7
IL_019a: br.s IL_01e3
IL_019c: ldarg.0
IL_019d: ldstr "woodcutting"
IL_01a2: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_01a7: brtrue.s IL_01db
IL_01a9: br.s IL_01e3
IL_01ab: ldc.i4.1
IL_01ac: stloc.0
IL_01ad: br.s IL_01e5
IL_01af: ldc.i4.1
IL_01b0: stloc.0
IL_01b1: br.s IL_01e5
IL_01b3: ldc.i4.1
IL_01b4: stloc.0
IL_01b5: br.s IL_01e5
IL_01b7: ldc.i4.1
IL_01b8: stloc.0
IL_01b9: br.s IL_01e5
IL_01bb: ldc.i4.1
IL_01bc: stloc.0
IL_01bd: br.s IL_01e5
IL_01bf: ldc.i4.1
IL_01c0: stloc.0
IL_01c1: br.s IL_01e5
IL_01c3: ldc.i4.1
IL_01c4: stloc.0
IL_01c5: br.s IL_01e5
IL_01c7: ldc.i4.1
IL_01c8: stloc.0
IL_01c9: br.s IL_01e5
IL_01cb: ldc.i4.1
IL_01cc: stloc.0
IL_01cd: br.s IL_01e5
IL_01cf: ldc.i4.1
IL_01d0: stloc.0
IL_01d1: br.s IL_01e5
IL_01d3: ldc.i4.1
IL_01d4: stloc.0
IL_01d5: br.s IL_01e5
IL_01d7: ldc.i4.1
IL_01d8: stloc.0
IL_01d9: br.s IL_01e5
IL_01db: ldc.i4.1
IL_01dc: stloc.0
IL_01dd: br.s IL_01e5
IL_01df: ldc.i4.1
IL_01e0: stloc.0
IL_01e1: br.s IL_01e5
IL_01e3: ldc.i4.0
IL_01e4: stloc.0
IL_01e5: ldloc.0
IL_01e6: ret

// Skills/SkillType ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetOutgoingDamageType(System.String)
.locals Skills/SkillType, System.Int32, System.Char
IL_0000: ldarg.0
IL_0001: brfalse IL_01ed
IL_0006: ldarg.0
IL_0007: call System.Int32 System.String::get_Length()
IL_000c: stloc.1
IL_000d: ldloc.1
IL_000e: ldc.i4.3
IL_000f: sub
IL_0010: switch IL_00a9,IL_004a,IL_00d3,IL_0067,IL_00be,IL_008c,IL_016f,IL_018d,IL_019c,IL_01ed,IL_01ed,IL_017e
IL_0045: br IL_01ed
IL_004a: ldarg.0
IL_004b: ldc.i4.0
IL_004c: call System.Char System.String::get_Chars(System.Int32)
IL_0051: stloc.2
IL_0052: ldloc.2
IL_0053: ldc.i4.s 97
IL_0055: beq IL_00e8
IL_005a: ldloc.2
IL_005b: ldc.i4.s 98
IL_005d: beq IL_00fd
IL_0062: br IL_01ed
IL_0067: ldarg.0
IL_0068: ldc.i4.1
IL_0069: call System.Char System.String::get_Chars(System.Int32)
IL_006e: stloc.2
IL_006f: ldloc.2
IL_0070: ldc.i4.s 110
IL_0072: beq IL_0112
IL_0077: ldloc.2
IL_0078: ldc.i4.s 112
IL_007a: beq IL_0127
IL_007f: ldloc.2
IL_0080: ldc.i4.s 119
IL_0082: beq IL_013c
IL_0087: br IL_01ed
IL_008c: ldarg.0
IL_008d: ldc.i4.1
IL_008e: call System.Char System.String::get_Chars(System.Int32)
IL_0093: stloc.2
IL_0094: ldloc.2
IL_0095: ldc.i4.s 105
IL_0097: beq IL_0160
IL_009c: ldloc.2
IL_009d: ldc.i4.s 111
IL_009f: beq IL_014e
IL_00a4: br IL_01ed
IL_00a9: ldarg.0
IL_00aa: ldstr "all"
IL_00af: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00b4: brtrue IL_01ab
IL_00b9: br IL_01ed
IL_00be: ldarg.0
IL_00bf: ldstr "unarmed"
IL_00c4: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00c9: brtrue IL_01b3
IL_00ce: br IL_01ed
IL_00d3: ldarg.0
IL_00d4: ldstr "clubs"
IL_00d9: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00de: brtrue IL_01b8
IL_00e3: br IL_01ed
IL_00e8: ldarg.0
IL_00e9: ldstr "axes"
IL_00ee: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00f3: brtrue IL_01bc
IL_00f8: br IL_01ed
IL_00fd: ldarg.0
IL_00fe: ldstr "bows"
IL_0103: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0108: brtrue IL_01d0
IL_010d: br IL_01ed
IL_0112: ldarg.0
IL_0113: ldstr "knives"
IL_0118: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_011d: brtrue IL_01c0
IL_0122: br IL_01ed
IL_0127: ldarg.0
IL_0128: ldstr "spears"
IL_012d: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0132: brtrue IL_01c4
IL_0137: br IL_01ed
IL_013c: ldarg.0
IL_013d: ldstr "swords"
IL_0142: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0147: brtrue.s IL_01c8
IL_0149: br IL_01ed
IL_014e: ldarg.0
IL_014f: ldstr "polearms"
IL_0154: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0159: brtrue.s IL_01cc
IL_015b: br IL_01ed
IL_0160: ldarg.0
IL_0161: ldstr "pickaxes"
IL_0166: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_016b: brtrue.s IL_01e8
IL_016d: br.s IL_01ed
IL_016f: ldarg.0
IL_0170: ldstr "crossbows"
IL_0175: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_017a: brtrue.s IL_01d4
IL_017c: br.s IL_01ed
IL_017e: ldarg.0
IL_017f: ldstr "elementalmagic"
IL_0184: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0189: brtrue.s IL_01d9
IL_018b: br.s IL_01ed
IL_018d: ldarg.0
IL_018e: ldstr "bloodmagic"
IL_0193: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0198: brtrue.s IL_01de
IL_019a: br.s IL_01ed
IL_019c: ldarg.0
IL_019d: ldstr "woodcutting"
IL_01a2: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_01a7: brtrue.s IL_01e3
IL_01a9: br.s IL_01ed
IL_01ab: ldc.i4 999
IL_01b0: stloc.0
IL_01b1: br.s IL_01ef
IL_01b3: ldc.i4.s 11
IL_01b5: stloc.0
IL_01b6: br.s IL_01ef
IL_01b8: ldc.i4.3
IL_01b9: stloc.0
IL_01ba: br.s IL_01ef
IL_01bc: ldc.i4.7
IL_01bd: stloc.0
IL_01be: br.s IL_01ef
IL_01c0: ldc.i4.2
IL_01c1: stloc.0
IL_01c2: br.s IL_01ef
IL_01c4: ldc.i4.5
IL_01c5: stloc.0
IL_01c6: br.s IL_01ef
IL_01c8: ldc.i4.1
IL_01c9: stloc.0
IL_01ca: br.s IL_01ef
IL_01cc: ldc.i4.4
IL_01cd: stloc.0
IL_01ce: br.s IL_01ef
IL_01d0: ldc.i4.8
IL_01d1: stloc.0
IL_01d2: br.s IL_01ef
IL_01d4: ldc.i4.s 14
IL_01d6: stloc.0
IL_01d7: br.s IL_01ef
IL_01d9: ldc.i4.s 9
IL_01db: stloc.0
IL_01dc: br.s IL_01ef
IL_01de: ldc.i4.s 10
IL_01e0: stloc.0
IL_01e1: br.s IL_01ef
IL_01e3: ldc.i4.s 13
IL_01e5: stloc.0
IL_01e6: br.s IL_01ef
IL_01e8: ldc.i4.s 12
IL_01ea: stloc.0
IL_01eb: br.s IL_01ef
IL_01ed: ldc.i4.0
IL_01ee: stloc.0
IL_01ef: ldloc.0
IL_01f0: ret

// System.Collections.Generic.List`1<HitData/DamageModPair> ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetIncomingDamages(System.String,System.String)
.locals System.Collections.Generic.List`1<System.String>, System.Collections.Generic.List`1<System.String>, System.Collections.Generic.List`1<HitData/DamageModPair>, System.Int32, System.Boolean, System.Collections.Generic.List`1/Enumerator<HitData/DamageModPair>, HitData/DamageModPair, System.Int32, HitData/DamageModPair
IL_0000: ldarg.0
IL_0001: ldc.i4.1
IL_0002: newarr System.Char
IL_0007: dup
IL_0008: ldc.i4.0
IL_0009: ldc.i4.s 44
IL_000b: stelem.i2
IL_000c: callvirt System.String[] System.String::Split(System.Char[])
IL_0011: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.String>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0016: stloc.0
IL_0017: ldarg.1
IL_0018: ldc.i4.1
IL_0019: newarr System.Char
IL_001e: dup
IL_001f: ldc.i4.0
IL_0020: ldc.i4.s 44
IL_0022: stelem.i2
IL_0023: callvirt System.String[] System.String::Split(System.Char[])
IL_0028: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.String>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_002d: stloc.1
IL_002e: newobj System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::.ctor()
IL_0033: stloc.2
IL_0034: ldc.i4.0
IL_0035: stloc.3
IL_0036: br IL_011d
IL_003b: ldloc.0
IL_003c: ldloc.3
IL_003d: callvirt !0 System.Collections.Generic.List`1<System.String>::get_Item(System.Int32)
IL_0042: callvirt System.String System.String::ToLower()
IL_0047: call System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetIncomingDamageTypeValid(System.String)
IL_004c: brfalse IL_0119
IL_0051: ldc.i4.1
IL_0052: stloc.s V_4
IL_0054: ldloc.2
IL_0055: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<HitData/DamageModPair>::GetEnumerator()
IL_005a: stloc.s V_5
IL_005c: br.s IL_0084
IL_005e: ldloca.s V_5
IL_0060: call !0 System.Collections.Generic.List`1/Enumerator<HitData/DamageModPair>::get_Current()
IL_0065: stloc.s V_6
IL_0067: ldloc.0
IL_0068: ldloc.3
IL_0069: callvirt !0 System.Collections.Generic.List`1<System.String>::get_Item(System.Int32)
IL_006e: callvirt System.String System.String::ToLower()
IL_0073: call HitData/DamageType ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetIncomingDamageType(System.String)
IL_0078: ldloc.s V_6
IL_007a: ldfld HitData/DamageType HitData/DamageModPair::m_type
IL_007f: bne.un.s IL_0084
IL_0081: ldc.i4.0
IL_0082: stloc.s V_4
IL_0084: ldloca.s V_5
IL_0086: call System.Boolean System.Collections.Generic.List`1/Enumerator<HitData/DamageModPair>::MoveNext()
IL_008b: brtrue.s IL_005e
IL_008d: leave.s IL_009d
IL_008f: ldloca.s V_5
IL_0091: constrained. System.Collections.Generic.List`1/Enumerator<HitData/DamageModPair>
IL_0097: callvirt System.Void System.IDisposable::Dispose()
IL_009c: endfinally
IL_009d: ldloc.s V_4
IL_009f: brfalse.s IL_0119
IL_00a1: ldloc.1
IL_00a2: ldloc.3
IL_00a3: callvirt !0 System.Collections.Generic.List`1<System.String>::get_Item(System.Int32)
IL_00a8: ldloca.s V_7
IL_00aa: call System.Boolean System.Int32::TryParse(System.String,System.Int32&)
IL_00af: brfalse.s IL_00e9
IL_00b1: ldloc.2
IL_00b2: ldloca.s V_8
IL_00b4: initobj HitData/DamageModPair
IL_00ba: ldloca.s V_8
IL_00bc: ldloc.0
IL_00bd: ldloc.3
IL_00be: callvirt !0 System.Collections.Generic.List`1<System.String>::get_Item(System.Int32)
IL_00c3: callvirt System.String System.String::ToLower()
IL_00c8: call HitData/DamageType ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetIncomingDamageType(System.String)
IL_00cd: stfld HitData/DamageType HitData/DamageModPair::m_type
IL_00d2: ldloca.s V_8
IL_00d4: ldloc.s V_7
IL_00d6: call HitData/DamageModifier ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetIncomingDamageModifier(System.Int32)
IL_00db: stfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_00e0: ldloc.s V_8
IL_00e2: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_00e7: br.s IL_0119
IL_00e9: ldloc.2
IL_00ea: ldloca.s V_8
IL_00ec: initobj HitData/DamageModPair
IL_00f2: ldloca.s V_8
IL_00f4: ldloc.0
IL_00f5: ldloc.3
IL_00f6: callvirt !0 System.Collections.Generic.List`1<System.String>::get_Item(System.Int32)
IL_00fb: callvirt System.String System.String::ToLower()
IL_0100: call HitData/DamageType ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetIncomingDamageType(System.String)
IL_0105: stfld HitData/DamageType HitData/DamageModPair::m_type
IL_010a: ldloca.s V_8
IL_010c: ldc.i4.0
IL_010d: stfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_0112: ldloc.s V_8
IL_0114: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_0119: ldloc.3
IL_011a: ldc.i4.1
IL_011b: add
IL_011c: stloc.3
IL_011d: ldloc.3
IL_011e: ldloc.0
IL_011f: callvirt System.Int32 System.Collections.Generic.List`1<System.String>::get_Count()
IL_0124: bge.s IL_0132
IL_0126: ldloc.3
IL_0127: ldloc.1
IL_0128: callvirt System.Int32 System.Collections.Generic.List`1<System.String>::get_Count()
IL_012d: blt IL_003b
IL_0132: ldloc.2
IL_0133: ret
// EH Finally: 92 - 143 => 143 - 157

// System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetIncomingDamageTypeValid(System.String)
.locals System.Boolean, System.Int32, System.Char
IL_0000: ldarg.0
IL_0001: brfalse IL_01b8
IL_0006: ldarg.0
IL_0007: call System.Int32 System.String::get_Length()
IL_000c: stloc.1
IL_000d: ldloc.1
IL_000e: ldc.i4.4
IL_000f: sub
IL_0010: switch IL_0099,IL_0057,IL_0032,IL_0179,IL_00b6,IL_007c
IL_002d: br IL_01b8
IL_0032: ldarg.0
IL_0033: ldc.i4.1
IL_0034: call System.Char System.String::get_Chars(System.Int32)
IL_0039: stloc.2
IL_003a: ldloc.2
IL_003b: ldc.i4.s 105
IL_003d: beq IL_00cb
IL_0042: ldloc.2
IL_0043: ldc.i4.s 111
IL_0045: beq IL_00e0
IL_004a: ldloc.2
IL_004b: ldc.i4.s 112
IL_004d: beq IL_00f5
IL_0052: br IL_01b8
IL_0057: ldarg.0
IL_0058: ldc.i4.0
IL_0059: call System.Char System.String::get_Chars(System.Int32)
IL_005e: stloc.2
IL_005f: ldloc.2
IL_0060: ldc.i4.s 98
IL_0062: beq IL_011c
IL_0067: ldloc.2
IL_0068: ldc.i4.s 102
IL_006a: beq IL_012e
IL_006f: ldloc.2
IL_0070: ldc.i4.s 115
IL_0072: beq IL_010a
IL_0077: br IL_01b8
IL_007c: ldarg.0
IL_007d: ldc.i4.0
IL_007e: call System.Char System.String::get_Chars(System.Int32)
IL_0083: stloc.2
IL_0084: ldloc.2
IL_0085: ldc.i4.s 101
IL_0087: beq IL_013d
IL_008c: ldloc.2
IL_008d: ldc.i4.s 108
IL_008f: beq IL_014c
IL_0094: br IL_01b8
IL_0099: ldarg.0
IL_009a: ldc.i4.0
IL_009b: call System.Char System.String::get_Chars(System.Int32)
IL_00a0: stloc.2
IL_00a1: ldloc.2
IL_00a2: ldc.i4.s 99
IL_00a4: beq IL_016a
IL_00a9: ldloc.2
IL_00aa: ldc.i4.s 102
IL_00ac: beq IL_015b
IL_00b1: br IL_01b8
IL_00b6: ldarg.0
IL_00b7: ldstr "physical"
IL_00bc: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00c1: brtrue IL_0188
IL_00c6: br IL_01b8
IL_00cb: ldarg.0
IL_00cc: ldstr "pierce"
IL_00d1: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00d6: brtrue IL_018c
IL_00db: br IL_01b8
IL_00e0: ldarg.0
IL_00e1: ldstr "poison"
IL_00e6: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00eb: brtrue IL_01a0
IL_00f0: br IL_01b8
IL_00f5: ldarg.0
IL_00f6: ldstr "spirit"
IL_00fb: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0100: brtrue IL_01ac
IL_0105: br IL_01b8
IL_010a: ldarg.0
IL_010b: ldstr "slash"
IL_0110: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0115: brtrue.s IL_0190
IL_0117: br IL_01b8
IL_011c: ldarg.0
IL_011d: ldstr "blunt"
IL_0122: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0127: brtrue.s IL_0194
IL_0129: br IL_01b8
IL_012e: ldarg.0
IL_012f: ldstr "frost"
IL_0134: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0139: brtrue.s IL_01a4
IL_013b: br.s IL_01b8
IL_013d: ldarg.0
IL_013e: ldstr "elemental"
IL_0143: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0148: brtrue.s IL_0198
IL_014a: br.s IL_01b8
IL_014c: ldarg.0
IL_014d: ldstr "lightning"
IL_0152: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0157: brtrue.s IL_019c
IL_0159: br.s IL_01b8
IL_015b: ldarg.0
IL_015c: ldstr "fire"
IL_0161: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0166: brtrue.s IL_01a8
IL_0168: br.s IL_01b8
IL_016a: ldarg.0
IL_016b: ldstr "chop"
IL_0170: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0175: brtrue.s IL_01b0
IL_0177: br.s IL_01b8
IL_0179: ldarg.0
IL_017a: ldstr "pickaxe"
IL_017f: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0184: brtrue.s IL_01b4
IL_0186: br.s IL_01b8
IL_0188: ldc.i4.1
IL_0189: stloc.0
IL_018a: br.s IL_01ba
IL_018c: ldc.i4.1
IL_018d: stloc.0
IL_018e: br.s IL_01ba
IL_0190: ldc.i4.1
IL_0191: stloc.0
IL_0192: br.s IL_01ba
IL_0194: ldc.i4.1
IL_0195: stloc.0
IL_0196: br.s IL_01ba
IL_0198: ldc.i4.1
IL_0199: stloc.0
IL_019a: br.s IL_01ba
IL_019c: ldc.i4.1
IL_019d: stloc.0
IL_019e: br.s IL_01ba
IL_01a0: ldc.i4.1
IL_01a1: stloc.0
IL_01a2: br.s IL_01ba
IL_01a4: ldc.i4.1
IL_01a5: stloc.0
IL_01a6: br.s IL_01ba
IL_01a8: ldc.i4.1
IL_01a9: stloc.0
IL_01aa: br.s IL_01ba
IL_01ac: ldc.i4.1
IL_01ad: stloc.0
IL_01ae: br.s IL_01ba
IL_01b0: ldc.i4.1
IL_01b1: stloc.0
IL_01b2: br.s IL_01ba
IL_01b4: ldc.i4.1
IL_01b5: stloc.0
IL_01b6: br.s IL_01ba
IL_01b8: ldc.i4.0
IL_01b9: stloc.0
IL_01ba: ldloc.0
IL_01bb: ret

// HitData/DamageType ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetIncomingDamageType(System.String)
.locals HitData/DamageType, System.Int32, System.Char
IL_0000: ldarg.0
IL_0001: brfalse IL_01d5
IL_0006: ldarg.0
IL_0007: call System.Int32 System.String::get_Length()
IL_000c: stloc.1
IL_000d: ldloc.1
IL_000e: ldc.i4.4
IL_000f: sub
IL_0010: switch IL_0099,IL_0057,IL_0032,IL_0182,IL_00b6,IL_007c
IL_002d: br IL_01d5
IL_0032: ldarg.0
IL_0033: ldc.i4.1
IL_0034: call System.Char System.String::get_Chars(System.Int32)
IL_0039: stloc.2
IL_003a: ldloc.2
IL_003b: ldc.i4.s 105
IL_003d: beq IL_00cb
IL_0042: ldloc.2
IL_0043: ldc.i4.s 111
IL_0045: beq IL_00e0
IL_004a: ldloc.2
IL_004b: ldc.i4.s 112
IL_004d: beq IL_00f5
IL_0052: br IL_01d5
IL_0057: ldarg.0
IL_0058: ldc.i4.0
IL_0059: call System.Char System.String::get_Chars(System.Int32)
IL_005e: stloc.2
IL_005f: ldloc.2
IL_0060: ldc.i4.s 98
IL_0062: beq IL_011f
IL_0067: ldloc.2
IL_0068: ldc.i4.s 102
IL_006a: beq IL_0131
IL_006f: ldloc.2
IL_0070: ldc.i4.s 115
IL_0072: beq IL_010a
IL_0077: br IL_01d5
IL_007c: ldarg.0
IL_007d: ldc.i4.0
IL_007e: call System.Char System.String::get_Chars(System.Int32)
IL_0083: stloc.2
IL_0084: ldloc.2
IL_0085: ldc.i4.s 101
IL_0087: beq IL_0143
IL_008c: ldloc.2
IL_008d: ldc.i4.s 108
IL_008f: beq IL_0155
IL_0094: br IL_01d5
IL_0099: ldarg.0
IL_009a: ldc.i4.0
IL_009b: call System.Char System.String::get_Chars(System.Int32)
IL_00a0: stloc.2
IL_00a1: ldloc.2
IL_00a2: ldc.i4.s 99
IL_00a4: beq IL_0173
IL_00a9: ldloc.2
IL_00aa: ldc.i4.s 102
IL_00ac: beq IL_0164
IL_00b1: br IL_01d5
IL_00b6: ldarg.0
IL_00b7: ldstr "physical"
IL_00bc: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00c1: brtrue IL_0191
IL_00c6: br IL_01d5
IL_00cb: ldarg.0
IL_00cc: ldstr "pierce"
IL_00d1: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00d6: brtrue IL_0196
IL_00db: br IL_01d5
IL_00e0: ldarg.0
IL_00e1: ldstr "poison"
IL_00e6: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00eb: brtrue IL_01b2
IL_00f0: br IL_01d5
IL_00f5: ldarg.0
IL_00f6: ldstr "spirit"
IL_00fb: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0100: brtrue IL_01c4
IL_0105: br IL_01d5
IL_010a: ldarg.0
IL_010b: ldstr "slash"
IL_0110: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0115: brtrue IL_019a
IL_011a: br IL_01d5
IL_011f: ldarg.0
IL_0120: ldstr "blunt"
IL_0125: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_012a: brtrue.s IL_019e
IL_012c: br IL_01d5
IL_0131: ldarg.0
IL_0132: ldstr "frost"
IL_0137: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_013c: brtrue.s IL_01ba
IL_013e: br IL_01d5
IL_0143: ldarg.0
IL_0144: ldstr "elemental"
IL_0149: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_014e: brtrue.s IL_01a2
IL_0150: br IL_01d5
IL_0155: ldarg.0
IL_0156: ldstr "lightning"
IL_015b: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0160: brtrue.s IL_01aa
IL_0162: br.s IL_01d5
IL_0164: ldarg.0
IL_0165: ldstr "fire"
IL_016a: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_016f: brtrue.s IL_01bf
IL_0171: br.s IL_01d5
IL_0173: ldarg.0
IL_0174: ldstr "chop"
IL_0179: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_017e: brtrue.s IL_01cc
IL_0180: br.s IL_01d5
IL_0182: ldarg.0
IL_0183: ldstr "pickaxe"
IL_0188: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_018d: brtrue.s IL_01d0
IL_018f: br.s IL_01d5
IL_0191: ldc.i4.s 31
IL_0193: stloc.0
IL_0194: br.s IL_01d8
IL_0196: ldc.i4.4
IL_0197: stloc.0
IL_0198: br.s IL_01d8
IL_019a: ldc.i4.2
IL_019b: stloc.0
IL_019c: br.s IL_01d8
IL_019e: ldc.i4.1
IL_019f: stloc.0
IL_01a0: br.s IL_01d8
IL_01a2: ldc.i4 224
IL_01a7: stloc.0
IL_01a8: br.s IL_01d8
IL_01aa: ldc.i4 128
IL_01af: stloc.0
IL_01b0: br.s IL_01d8
IL_01b2: ldc.i4 256
IL_01b7: stloc.0
IL_01b8: br.s IL_01d8
IL_01ba: ldc.i4.s 64
IL_01bc: stloc.0
IL_01bd: br.s IL_01d8
IL_01bf: ldc.i4.s 32
IL_01c1: stloc.0
IL_01c2: br.s IL_01d8
IL_01c4: ldc.i4 512
IL_01c9: stloc.0
IL_01ca: br.s IL_01d8
IL_01cc: ldc.i4.8
IL_01cd: stloc.0
IL_01ce: br.s IL_01d8
IL_01d0: ldc.i4.s 16
IL_01d2: stloc.0
IL_01d3: br.s IL_01d8
IL_01d5: ldc.i4.s 31
IL_01d7: stloc.0
IL_01d8: ldloc.0
IL_01d9: ret

// HitData/DamageModifier ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetIncomingDamageModifier(System.Int32)
.locals HitData/DamageModifier
IL_0000: ldarg.0
IL_0001: ldc.i4.s 50
IL_0003: bgt.s IL_0014
IL_0005: ldarg.0
IL_0006: brfalse.s IL_003d
IL_0008: ldarg.0
IL_0009: ldc.i4.s 25
IL_000b: beq.s IL_0039
IL_000d: ldarg.0
IL_000e: ldc.i4.s 50
IL_0010: beq.s IL_0035
IL_0012: br.s IL_0041
IL_0014: ldarg.0
IL_0015: ldc.i4.s 100
IL_0017: beq.s IL_0031
IL_0019: ldarg.0
IL_001a: ldc.i4 150
IL_001f: beq.s IL_002d
IL_0021: ldarg.0
IL_0022: ldc.i4 200
IL_0027: bne.un.s IL_0041
IL_0029: ldc.i4.6
IL_002a: stloc.0
IL_002b: br.s IL_0043
IL_002d: ldc.i4.2
IL_002e: stloc.0
IL_002f: br.s IL_0043
IL_0031: ldc.i4.0
IL_0032: stloc.0
IL_0033: br.s IL_0043
IL_0035: ldc.i4.1
IL_0036: stloc.0
IL_0037: br.s IL_0043
IL_0039: ldc.i4.5
IL_003a: stloc.0
IL_003b: br.s IL_0043
IL_003d: ldc.i4.3
IL_003e: stloc.0
IL_003f: br.s IL_0043
IL_0041: ldc.i4.0
IL_0042: stloc.0
IL_0043: ldloc.0
IL_0044: ret

// System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetTooltipStats(ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO)
.locals System.Text.StringBuilder, System.String, System.Single, System.Single, System.Single, System.Single, System.Single, System.Single, System.Collections.Generic.List`1/Enumerator<StatusEffect/StatusAttribute>, StatusEffect/StatusAttribute, System.String, System.String, System.Collections.Generic.List`1/Enumerator<Skills/SkillType>, Skills/SkillType, System.Single, System.Single, System.Collections.Generic.List`1/Enumerator<HitData/DamageModPair>, HitData/DamageModPair
IL_0000: ldc.i4 256
IL_0005: newobj System.Void System.Text.StringBuilder::.ctor(System.Int32)
IL_000a: stloc.0
IL_000b: ldarg.0
IL_000c: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxHealth
IL_0011: ldc.r4 0
IL_0016: beq.s IL_003e
IL_0018: ldloc.0
IL_0019: ldstr "$se_health: [HP]"
IL_001e: ldarg.0
IL_001f: ldflda System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxHealth
IL_0024: ldstr "+0;-0"
IL_0029: call System.String System.Single::ToString(System.String)
IL_002e: ldstr "</color>
"
IL_0033: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0038: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_003d: pop
IL_003e: ldarg.0
IL_003f: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HealthRegen
IL_0044: ldc.r4 0
IL_0049: beq.s IL_0071
IL_004b: ldloc.0
IL_004c: ldstr "$se_healthregen: [HP]"
IL_0051: ldarg.0
IL_0052: ldflda System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HealthRegen
IL_0057: ldstr "+0;-0"
IL_005c: call System.String System.Single::ToString(System.String)
IL_0061: ldstr "</color> HP/10s
"
IL_0066: call System.String System.String::Concat(System.String,System.String,System.String)
IL_006b: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0070: pop
IL_0071: ldarg.0
IL_0072: ldfld System.Single SE_Stats::m_healthRegenMultiplier
IL_0077: ldc.r4 1
IL_007c: beq.s IL_00b3
IL_007e: ldloc.0
IL_007f: ldstr "$se_healthregen: [HP]"
IL_0084: ldarg.0
IL_0085: ldfld System.Single SE_Stats::m_healthRegenMultiplier
IL_008a: ldc.r4 1
IL_008f: sub
IL_0090: ldc.r4 100
IL_0095: mul
IL_0096: stloc.2
IL_0097: ldloca.s V_2
IL_0099: ldstr "+0;-0"
IL_009e: call System.String System.Single::ToString(System.String)
IL_00a3: ldstr "%</color>
"
IL_00a8: call System.String System.String::Concat(System.String,System.String,System.String)
IL_00ad: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_00b2: pop
IL_00b3: ldarg.0
IL_00b4: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxStamina
IL_00b9: ldc.r4 0
IL_00be: beq.s IL_00e6
IL_00c0: ldloc.0
IL_00c1: ldstr "$se_stamina: [Stamina]"
IL_00c6: ldarg.0
IL_00c7: ldflda System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxStamina
IL_00cc: ldstr "+0;-0"
IL_00d1: call System.String System.Single::ToString(System.String)
IL_00d6: ldstr "</color>
"
IL_00db: call System.String System.String::Concat(System.String,System.String,System.String)
IL_00e0: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_00e5: pop
IL_00e6: ldarg.0
IL_00e7: ldfld System.Single SE_Stats::m_staminaRegenMultiplier
IL_00ec: ldc.r4 1
IL_00f1: beq.s IL_0128
IL_00f3: ldloc.0
IL_00f4: ldstr "$se_staminaregen: [Stamina]"
IL_00f9: ldarg.0
IL_00fa: ldfld System.Single SE_Stats::m_staminaRegenMultiplier
IL_00ff: ldc.r4 1
IL_0104: sub
IL_0105: ldc.r4 100
IL_010a: mul
IL_010b: stloc.2
IL_010c: ldloca.s V_2
IL_010e: ldstr "+0;-0"
IL_0113: call System.String System.Single::ToString(System.String)
IL_0118: ldstr "%</color>
"
IL_011d: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0122: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0127: pop
IL_0128: ldarg.0
IL_0129: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxEitr
IL_012e: ldc.r4 0
IL_0133: beq.s IL_015b
IL_0135: ldloc.0
IL_0136: ldstr "$se_eitr: [Eitr]"
IL_013b: ldarg.0
IL_013c: ldflda System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_MaxEitr
IL_0141: ldstr "+0;-0"
IL_0146: call System.String System.Single::ToString(System.String)
IL_014b: ldstr "</color>
"
IL_0150: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0155: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_015a: pop
IL_015b: ldarg.0
IL_015c: ldfld System.Single SE_Stats::m_eitrRegenMultiplier
IL_0161: ldc.r4 1
IL_0166: beq.s IL_019d
IL_0168: ldloc.0
IL_0169: ldstr "$se_eitrregen: [Eitr]"
IL_016e: ldarg.0
IL_016f: ldfld System.Single SE_Stats::m_eitrRegenMultiplier
IL_0174: ldc.r4 1
IL_0179: sub
IL_017a: ldc.r4 100
IL_017f: mul
IL_0180: stloc.2
IL_0181: ldloca.s V_2
IL_0183: ldstr "+0;-0"
IL_0188: call System.String System.Single::ToString(System.String)
IL_018d: ldstr "%</color>
"
IL_0192: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0197: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_019c: pop
IL_019d: ldarg.0
IL_019e: ldfld System.Single SE_Stats::m_addMaxCarryWeight
IL_01a3: ldc.r4 0
IL_01a8: beq.s IL_01d0
IL_01aa: ldloc.0
IL_01ab: ldstr "$se_max_carryweight: [General]"
IL_01b0: ldarg.0
IL_01b1: ldflda System.Single SE_Stats::m_addMaxCarryWeight
IL_01b6: ldstr "+0;-0"
IL_01bb: call System.String System.Single::ToString(System.String)
IL_01c0: ldstr "</color>
"
IL_01c5: call System.String System.String::Concat(System.String,System.String,System.String)
IL_01ca: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_01cf: pop
IL_01d0: ldarg.0
IL_01d1: ldfld System.Single SE_Stats::m_speedModifier
IL_01d6: ldc.r4 0
IL_01db: beq.s IL_020c
IL_01dd: ldloc.0
IL_01de: ldstr "$item_movement_modifier: [General]"
IL_01e3: ldarg.0
IL_01e4: ldfld System.Single SE_Stats::m_speedModifier
IL_01e9: ldc.r4 100
IL_01ee: mul
IL_01ef: stloc.2
IL_01f0: ldloca.s V_2
IL_01f2: ldstr "+0;-0"
IL_01f7: call System.String System.Single::ToString(System.String)
IL_01fc: ldstr "%</color>
"
IL_0201: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0206: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_020b: pop
IL_020c: ldarg.0
IL_020d: ldfld UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_0212: call UnityEngine.Vector3 UnityEngine.Vector3::get_zero()
IL_0217: call System.Boolean UnityEngine.Vector3::op_Inequality(UnityEngine.Vector3,UnityEngine.Vector3)
IL_021c: brfalse.s IL_0252
IL_021e: ldloc.0
IL_021f: ldstr "$skill_jump: [General]"
IL_0224: ldarg.0
IL_0225: ldflda UnityEngine.Vector3 SE_Stats::m_jumpModifier
IL_022a: ldfld System.Single UnityEngine.Vector3::y
IL_022f: ldc.r4 200
IL_0234: mul
IL_0235: stloc.2
IL_0236: ldloca.s V_2
IL_0238: ldstr "+0;-0"
IL_023d: call System.String System.Single::ToString(System.String)
IL_0242: ldstr "%</color>
"
IL_0247: call System.String System.String::Concat(System.String,System.String,System.String)
IL_024c: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0251: pop
IL_0252: ldarg.0
IL_0253: ldfld System.Single SE_Stats::m_maxMaxFallSpeed
IL_0258: ldc.r4 0
IL_025d: beq.s IL_0285
IL_025f: ldloc.0
IL_0260: ldstr "$item_limitfallspeed: [General]"
IL_0265: ldarg.0
IL_0266: ldflda System.Single SE_Stats::m_maxMaxFallSpeed
IL_026b: ldstr "0"
IL_0270: call System.String System.Single::ToString(System.String)
IL_0275: ldstr "</color> m/s
"
IL_027a: call System.String System.String::Concat(System.String,System.String,System.String)
IL_027f: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0284: pop
IL_0285: ldarg.0
IL_0286: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_EquipmentSpeedModifier
IL_028b: ldc.r4 0
IL_0290: beq.s IL_02db
IL_0292: ldarg.0
IL_0293: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_EquipmentSpeedModifier
IL_0298: ldc.r4 100
IL_029d: mul
IL_029e: ldc.r4 -100
IL_02a3: blt.s IL_02b3
IL_02a5: ldarg.0
IL_02a6: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_EquipmentSpeedModifier
IL_02ab: ldc.r4 100
IL_02b0: mul
IL_02b1: br.s IL_02b8
IL_02b3: ldc.r4 -100
IL_02b8: stloc.3
IL_02b9: ldloc.0
IL_02ba: ldstr "$ui_fpo_equipmentspeedmodifier: [General]"
IL_02bf: ldloca.s V_3
IL_02c1: ldstr "+0;-0"
IL_02c6: call System.String System.Single::ToString(System.String)
IL_02cb: ldstr "%</color>
"
IL_02d0: call System.String System.String::Concat(System.String,System.String,System.String)
IL_02d5: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_02da: pop
IL_02db: ldarg.0
IL_02dc: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_WindSpeedModifier
IL_02e1: ldc.r4 0
IL_02e6: beq.s IL_0317
IL_02e8: ldloc.0
IL_02e9: ldstr "$ui_fpo_windspeedmodifier: [General]"
IL_02ee: ldarg.0
IL_02ef: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_WindSpeedModifier
IL_02f4: ldc.r4 100
IL_02f9: mul
IL_02fa: stloc.2
IL_02fb: ldloca.s V_2
IL_02fd: ldstr "+0;-0"
IL_0302: call System.String System.Single::ToString(System.String)
IL_0307: ldstr "%</color>
"
IL_030c: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0311: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0316: pop
IL_0317: ldarg.0
IL_0318: ldfld System.Single SE_Stats::m_runStaminaDrainModifier
IL_031d: ldc.r4 0
IL_0322: beq.s IL_036e
IL_0324: ldarg.0
IL_0325: ldfld System.Single SE_Stats::m_runStaminaDrainModifier
IL_032a: ldc.r4 100
IL_032f: mul
IL_0330: ldc.r4 -100
IL_0335: blt.s IL_0345
IL_0337: ldarg.0
IL_0338: ldfld System.Single SE_Stats::m_runStaminaDrainModifier
IL_033d: ldc.r4 100
IL_0342: mul
IL_0343: br.s IL_034a
IL_0345: ldc.r4 -100
IL_034a: stloc.s V_4
IL_034c: ldloc.0
IL_034d: ldstr "$se_runstamina: [General]"
IL_0352: ldloca.s V_4
IL_0354: ldstr "+0;-0"
IL_0359: call System.String System.Single::ToString(System.String)
IL_035e: ldstr "%</color>
"
IL_0363: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0368: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_036d: pop
IL_036e: ldarg.0
IL_036f: ldfld System.Single SE_Stats::m_jumpStaminaUseModifier
IL_0374: ldc.r4 0
IL_0379: beq.s IL_03c5
IL_037b: ldarg.0
IL_037c: ldfld System.Single SE_Stats::m_jumpStaminaUseModifier
IL_0381: ldc.r4 100
IL_0386: mul
IL_0387: ldc.r4 -100
IL_038c: blt.s IL_039c
IL_038e: ldarg.0
IL_038f: ldfld System.Single SE_Stats::m_jumpStaminaUseModifier
IL_0394: ldc.r4 100
IL_0399: mul
IL_039a: br.s IL_03a1
IL_039c: ldc.r4 -100
IL_03a1: stloc.s V_5
IL_03a3: ldloc.0
IL_03a4: ldstr "$se_jumpstamina: [General]"
IL_03a9: ldloca.s V_5
IL_03ab: ldstr "+0;-0"
IL_03b0: call System.String System.Single::ToString(System.String)
IL_03b5: ldstr "%</color>
"
IL_03ba: call System.String System.String::Concat(System.String,System.String,System.String)
IL_03bf: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_03c4: pop
IL_03c5: ldarg.0
IL_03c6: ldfld System.Single SE_Stats::m_stealthModifier
IL_03cb: ldc.r4 0
IL_03d0: beq.s IL_041c
IL_03d2: ldarg.0
IL_03d3: ldfld System.Single SE_Stats::m_stealthModifier
IL_03d8: ldc.r4 100
IL_03dd: mul
IL_03de: ldc.r4 -100
IL_03e3: blt.s IL_03f3
IL_03e5: ldarg.0
IL_03e6: ldfld System.Single SE_Stats::m_stealthModifier
IL_03eb: ldc.r4 100
IL_03f0: mul
IL_03f1: br.s IL_03f8
IL_03f3: ldc.r4 -100
IL_03f8: stloc.s V_6
IL_03fa: ldloc.0
IL_03fb: ldstr "$ui_fpo_stealth: [General]"
IL_0400: ldloca.s V_6
IL_0402: ldstr "+0;-0"
IL_0407: call System.String System.Single::ToString(System.String)
IL_040c: ldstr "%</color>
"
IL_0411: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0416: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_041b: pop
IL_041c: ldarg.0
IL_041d: ldfld System.Single SE_Stats::m_noiseModifier
IL_0422: ldc.r4 0
IL_0427: beq.s IL_0473
IL_0429: ldarg.0
IL_042a: ldfld System.Single SE_Stats::m_noiseModifier
IL_042f: ldc.r4 100
IL_0434: mul
IL_0435: ldc.r4 -100
IL_043a: blt.s IL_044a
IL_043c: ldarg.0
IL_043d: ldfld System.Single SE_Stats::m_noiseModifier
IL_0442: ldc.r4 100
IL_0447: mul
IL_0448: br.s IL_044f
IL_044a: ldc.r4 -100
IL_044f: stloc.s V_7
IL_0451: ldloc.0
IL_0452: ldstr "$se_noisemod: [General]"
IL_0457: ldloca.s V_7
IL_0459: ldstr "+0;-0"
IL_045e: call System.String System.Single::ToString(System.String)
IL_0463: ldstr "%</color>
"
IL_0468: call System.String System.String::Concat(System.String,System.String,System.String)
IL_046d: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0472: pop
IL_0473: ldarg.0
IL_0474: ldfld System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_StatusAttributes
IL_0479: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<StatusEffect/StatusAttribute>::GetEnumerator()
IL_047e: stloc.s V_8
IL_0480: br.s IL_04df
IL_0482: ldloca.s V_8
IL_0484: call !0 System.Collections.Generic.List`1/Enumerator<StatusEffect/StatusAttribute>::get_Current()
IL_0489: stloc.s V_9
IL_048b: ldloc.s V_9
IL_048d: ldc.i4.1
IL_048e: sub
IL_048f: switch IL_04a6,IL_04af,IL_04c1,IL_04b8
IL_04a4: br.s IL_04c1
IL_04a6: ldstr "$ui_fpo_coldresistance"
IL_04ab: stloc.s V_11
IL_04ad: br.s IL_04c8
IL_04af: ldstr "$ui_fpo_doubleimpactdamage"
IL_04b4: stloc.s V_11
IL_04b6: br.s IL_04c8
IL_04b8: ldstr "$ui_fpo_sailingpower"
IL_04bd: stloc.s V_11
IL_04bf: br.s IL_04c8
IL_04c1: ldstr ""
IL_04c6: stloc.s V_11
IL_04c8: ldloc.s V_11
IL_04ca: stloc.s V_10
IL_04cc: ldloc.0
IL_04cd: ldloc.s V_10
IL_04cf: ldstr "
"
IL_04d4: call System.String System.String::Concat(System.String,System.String)
IL_04d9: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_04de: pop
IL_04df: ldloca.s V_8
IL_04e1: call System.Boolean System.Collections.Generic.List`1/Enumerator<StatusEffect/StatusAttribute>::MoveNext()
IL_04e6: brtrue.s IL_0482
IL_04e8: leave.s IL_04f8
IL_04ea: ldloca.s V_8
IL_04ec: constrained. System.Collections.Generic.List`1/Enumerator<StatusEffect/StatusAttribute>
IL_04f2: callvirt System.Void System.IDisposable::Dispose()
IL_04f7: endfinally
IL_04f8: ldarg.0
IL_04f9: ldfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_04fe: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Skills/SkillType>::GetEnumerator()
IL_0503: stloc.s V_12
IL_0505: br IL_0656
IL_050a: ldloca.s V_12
IL_050c: call !0 System.Collections.Generic.List`1/Enumerator<Skills/SkillType>::get_Current()
IL_0511: stloc.s V_13
IL_0513: ldarg.0
IL_0514: ldfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_0519: ldarg.0
IL_051a: ldfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_051f: ldloc.s V_13
IL_0521: callvirt System.Int32 System.Collections.Generic.List`1<Skills/SkillType>::IndexOf(!0)
IL_0526: callvirt !0 System.Collections.Generic.List`1<System.Single>::get_Item(System.Int32)
IL_052b: ldc.r4 0
IL_0530: beq IL_0656
IL_0535: ldloc.s V_13
IL_0537: ldc.i4.s 13
IL_0539: beq.s IL_0541
IL_053b: ldloc.s V_13
IL_053d: ldc.i4.s 12
IL_053f: bne.un.s IL_05a8
IL_0541: ldloc.0
IL_0542: ldc.i4.5
IL_0543: newarr System.String
IL_0548: dup
IL_0549: ldc.i4.0
IL_054a: ldstr "$ui_fpo_outgoing_tool "
IL_054f: stelem.ref
IL_0550: dup
IL_0551: ldc.i4.1
IL_0552: ldloc.s V_13
IL_0554: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetToolTipOutgoingDamageType(Skills/SkillType)
IL_0559: stelem.ref
IL_055a: dup
IL_055b: ldc.i4.2
IL_055c: ldstr ": [General]"
IL_0561: stelem.ref
IL_0562: dup
IL_0563: ldc.i4.3
IL_0564: ldarg.0
IL_0565: ldfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_056a: ldarg.0
IL_056b: ldfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_0570: ldloc.s V_13
IL_0572: callvirt System.Int32 System.Collections.Generic.List`1<Skills/SkillType>::IndexOf(!0)
IL_0577: callvirt !0 System.Collections.Generic.List`1<System.Single>::get_Item(System.Int32)
IL_057c: ldc.r4 100
IL_0581: mul
IL_0582: stloc.2
IL_0583: ldloca.s V_2
IL_0585: ldstr "+0;-0"
IL_058a: call System.String System.Single::ToString(System.String)
IL_058f: stelem.ref
IL_0590: dup
IL_0591: ldc.i4.4
IL_0592: ldstr "%</color>
"
IL_0597: stelem.ref
IL_0598: call System.String System.String::Concat(System.String[])
IL_059d: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_05a2: pop
IL_05a3: br IL_0656
IL_05a8: ldloc.s V_13
IL_05aa: ldc.i4 999
IL_05af: bne.un.s IL_05f4
IL_05b1: ldloc.0
IL_05b2: ldstr "$ui_fpo_outgoing_all: [General]"
IL_05b7: ldarg.0
IL_05b8: ldfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_05bd: ldarg.0
IL_05be: ldfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_05c3: ldloc.s V_13
IL_05c5: callvirt System.Int32 System.Collections.Generic.List`1<Skills/SkillType>::IndexOf(!0)
IL_05ca: callvirt !0 System.Collections.Generic.List`1<System.Single>::get_Item(System.Int32)
IL_05cf: ldc.r4 100
IL_05d4: mul
IL_05d5: stloc.2
IL_05d6: ldloca.s V_2
IL_05d8: ldstr "+0;-0"
IL_05dd: call System.String System.Single::ToString(System.String)
IL_05e2: ldstr "%</color>
"
IL_05e7: call System.String System.String::Concat(System.String,System.String,System.String)
IL_05ec: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_05f1: pop
IL_05f2: br.s IL_0656
IL_05f4: ldloc.0
IL_05f5: ldc.i4.5
IL_05f6: newarr System.String
IL_05fb: dup
IL_05fc: ldc.i4.0
IL_05fd: ldstr "$ui_fpo_outgoing "
IL_0602: stelem.ref
IL_0603: dup
IL_0604: ldc.i4.1
IL_0605: ldloc.s V_13
IL_0607: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetToolTipOutgoingDamageType(Skills/SkillType)
IL_060c: stelem.ref
IL_060d: dup
IL_060e: ldc.i4.2
IL_060f: ldstr ": [General]"
IL_0614: stelem.ref
IL_0615: dup
IL_0616: ldc.i4.3
IL_0617: ldarg.0
IL_0618: ldfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_061d: ldarg.0
IL_061e: ldfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_0623: ldloc.s V_13
IL_0625: callvirt System.Int32 System.Collections.Generic.List`1<Skills/SkillType>::IndexOf(!0)
IL_062a: callvirt !0 System.Collections.Generic.List`1<System.Single>::get_Item(System.Int32)
IL_062f: ldc.r4 100
IL_0634: mul
IL_0635: stloc.2
IL_0636: ldloca.s V_2
IL_0638: ldstr "+0;-0"
IL_063d: call System.String System.Single::ToString(System.String)
IL_0642: stelem.ref
IL_0643: dup
IL_0644: ldc.i4.4
IL_0645: ldstr "%</color>
"
IL_064a: stelem.ref
IL_064b: call System.String System.String::Concat(System.String[])
IL_0650: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0655: pop
IL_0656: ldloca.s V_12
IL_0658: call System.Boolean System.Collections.Generic.List`1/Enumerator<Skills/SkillType>::MoveNext()
IL_065d: brtrue IL_050a
IL_0662: leave.s IL_0672
IL_0664: ldloca.s V_12
IL_0666: constrained. System.Collections.Generic.List`1/Enumerator<Skills/SkillType>
IL_066c: callvirt System.Void System.IDisposable::Dispose()
IL_0671: endfinally
IL_0672: ldarg.0
IL_0673: ldfld System.Single SE_Stats::m_fallDamageModifier
IL_0678: ldc.r4 0
IL_067d: beq.s IL_06c9
IL_067f: ldarg.0
IL_0680: ldfld System.Single SE_Stats::m_fallDamageModifier
IL_0685: ldc.r4 100
IL_068a: mul
IL_068b: ldc.r4 -100
IL_0690: blt.s IL_06a0
IL_0692: ldarg.0
IL_0693: ldfld System.Single SE_Stats::m_fallDamageModifier
IL_0698: ldc.r4 100
IL_069d: mul
IL_069e: br.s IL_06a5
IL_06a0: ldc.r4 -100
IL_06a5: stloc.s V_14
IL_06a7: ldloc.0
IL_06a8: ldstr "$item_falldamage: [General]"
IL_06ad: ldloca.s V_14
IL_06af: ldstr "+0;-0"
IL_06b4: call System.String System.Single::ToString(System.String)
IL_06b9: ldstr "%</color>
"
IL_06be: call System.String System.String::Concat(System.String,System.String,System.String)
IL_06c3: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_06c8: pop
IL_06c9: ldarg.0
IL_06ca: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HeatDamageModifier
IL_06cf: ldc.r4 0
IL_06d4: beq.s IL_0720
IL_06d6: ldarg.0
IL_06d7: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HeatDamageModifier
IL_06dc: ldc.r4 100
IL_06e1: mul
IL_06e2: ldc.r4 -100
IL_06e7: blt.s IL_06f7
IL_06e9: ldarg.0
IL_06ea: ldfld System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_HeatDamageModifier
IL_06ef: ldc.r4 100
IL_06f4: mul
IL_06f5: br.s IL_06fc
IL_06f7: ldc.r4 -100
IL_06fc: stloc.s V_15
IL_06fe: ldloc.0
IL_06ff: ldstr "$ui_fpo_heatdamage: [General]"
IL_0704: ldloca.s V_15
IL_0706: ldstr "+0;-0"
IL_070b: call System.String System.Single::ToString(System.String)
IL_0710: ldstr "%</color>
"
IL_0715: call System.String System.String::Concat(System.String,System.String,System.String)
IL_071a: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_071f: pop
IL_0720: ldarg.0
IL_0721: ldfld System.Collections.Generic.List`1<HitData/DamageModPair> SE_Stats::m_mods
IL_0726: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<HitData/DamageModPair>::GetEnumerator()
IL_072b: stloc.s V_16
IL_072d: br.s IL_079c
IL_072f: ldloca.s V_16
IL_0731: call !0 System.Collections.Generic.List`1/Enumerator<HitData/DamageModPair>::get_Current()
IL_0736: stloc.s V_17
IL_0738: ldloc.s V_17
IL_073a: ldfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_073f: brfalse.s IL_079c
IL_0741: ldloc.0
IL_0742: ldc.i4.5
IL_0743: newarr System.String
IL_0748: dup
IL_0749: ldc.i4.0
IL_074a: ldstr "$ui_fpo_incoming "
IL_074f: stelem.ref
IL_0750: dup
IL_0751: ldc.i4.1
IL_0752: ldloc.s V_17
IL_0754: ldfld HitData/DamageType HitData/DamageModPair::m_type
IL_0759: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetToolTipIncomingDamageType(HitData/DamageType)
IL_075e: stelem.ref
IL_075f: dup
IL_0760: ldc.i4.2
IL_0761: ldstr ": [General]"
IL_0766: stelem.ref
IL_0767: dup
IL_0768: ldc.i4.3
IL_0769: ldloc.s V_17
IL_076b: ldfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_0770: call System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetToolTipIncomingDamageModifier(HitData/DamageModifier)
IL_0775: ldc.r4 100
IL_077a: mul
IL_077b: stloc.2
IL_077c: ldloca.s V_2
IL_077e: ldstr "+0;-0"
IL_0783: call System.String System.Single::ToString(System.String)
IL_0788: stelem.ref
IL_0789: dup
IL_078a: ldc.i4.4
IL_078b: ldstr "%</color>
"
IL_0790: stelem.ref
IL_0791: call System.String System.String::Concat(System.String[])
IL_0796: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_079b: pop
IL_079c: ldloca.s V_16
IL_079e: call System.Boolean System.Collections.Generic.List`1/Enumerator<HitData/DamageModPair>::MoveNext()
IL_07a3: brtrue.s IL_072f
IL_07a5: leave.s IL_07b5
IL_07a7: ldloca.s V_16
IL_07a9: constrained. System.Collections.Generic.List`1/Enumerator<HitData/DamageModPair>
IL_07af: callvirt System.Void System.IDisposable::Dispose()
IL_07b4: endfinally
IL_07b5: ldloc.0
IL_07b6: callvirt System.String System.Object::ToString()
IL_07bb: stloc.1
IL_07bc: ldloc.1
IL_07bd: ldstr "[HP]+"
IL_07c2: ldstr "+[HP]"
IL_07c7: callvirt System.String System.String::Replace(System.String,System.String)
IL_07cc: stloc.1
IL_07cd: ldloc.1
IL_07ce: ldstr "[HP]-"
IL_07d3: ldstr "-[HP]"
IL_07d8: callvirt System.String System.String::Replace(System.String,System.String)
IL_07dd: stloc.1
IL_07de: ldloc.1
IL_07df: ldstr "[HP]"
IL_07e4: ldstr "<color=#FF8080FF>"
IL_07e9: callvirt System.String System.String::Replace(System.String,System.String)
IL_07ee: stloc.1
IL_07ef: ldloc.1
IL_07f0: ldstr "[Stamina]+"
IL_07f5: ldstr "+[Stamina]"
IL_07fa: callvirt System.String System.String::Replace(System.String,System.String)
IL_07ff: stloc.1
IL_0800: ldloc.1
IL_0801: ldstr "[Stamina]-"
IL_0806: ldstr "-[Stamina]"
IL_080b: callvirt System.String System.String::Replace(System.String,System.String)
IL_0810: stloc.1
IL_0811: ldloc.1
IL_0812: ldstr "[Stamina]"
IL_0817: ldstr "<color=#FFFF80FF>"
IL_081c: callvirt System.String System.String::Replace(System.String,System.String)
IL_0821: stloc.1
IL_0822: ldloc.1
IL_0823: ldstr "[Eitr]+"
IL_0828: ldstr "+[Eitr]"
IL_082d: callvirt System.String System.String::Replace(System.String,System.String)
IL_0832: stloc.1
IL_0833: ldloc.1
IL_0834: ldstr "[Eitr]-"
IL_0839: ldstr "-[Eitr]"
IL_083e: callvirt System.String System.String::Replace(System.String,System.String)
IL_0843: stloc.1
IL_0844: ldloc.1
IL_0845: ldstr "[Eitr]"
IL_084a: ldstr "<color=#8080FFFF>"
IL_084f: callvirt System.String System.String::Replace(System.String,System.String)
IL_0854: stloc.1
IL_0855: ldloc.1
IL_0856: ldstr "[General]"
IL_085b: ldstr "<color=orange>"
IL_0860: callvirt System.String System.String::Replace(System.String,System.String)
IL_0865: stloc.1
IL_0866: ldloc.1
IL_0867: ldstr ""
IL_086c: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0871: brfalse.s IL_0879
IL_0873: ldstr "None
"
IL_0878: stloc.1
IL_0879: ldloc.1
IL_087a: ret
// EH Finally: 1152 - 1258 => 1258 - 1272
// EH Finally: 1285 - 1636 => 1636 - 1650
// EH Finally: 1837 - 1959 => 1959 - 1973

// System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetToolTipOutgoingDamageType(Skills/SkillType)
.locals System.String
IL_0000: ldarg.0
IL_0001: ldc.i4.1
IL_0002: sub
IL_0003: switch IL_00ae,IL_009b,IL_0085,IL_00b6,IL_00a6,IL_00de,IL_0090,IL_00be,IL_00ce,IL_00d6,IL_007a,IL_0116,IL_010e,IL_00c6
IL_0040: ldarg.0
IL_0041: ldc.i4.s 100
IL_0043: sub
IL_0044: switch IL_00ee,IL_00f6,IL_00e6,IL_00fe,IL_011e,IL_0126,IL_0126,IL_0126,IL_0126,IL_0126,IL_0106
IL_0075: br IL_0126
IL_007a: ldstr "$skill_unarmed"
IL_007f: stloc.0
IL_0080: br IL_012c
IL_0085: ldstr "$skill_clubs"
IL_008a: stloc.0
IL_008b: br IL_012c
IL_0090: ldstr "$skill_axes"
IL_0095: stloc.0
IL_0096: br IL_012c
IL_009b: ldstr "$skill_knives"
IL_00a0: stloc.0
IL_00a1: br IL_012c
IL_00a6: ldstr "$skill_spears"
IL_00ab: stloc.0
IL_00ac: br.s IL_012c
IL_00ae: ldstr "$skill_swords"
IL_00b3: stloc.0
IL_00b4: br.s IL_012c
IL_00b6: ldstr "$skill_polearms"
IL_00bb: stloc.0
IL_00bc: br.s IL_012c
IL_00be: ldstr "$skill_bows"
IL_00c3: stloc.0
IL_00c4: br.s IL_012c
IL_00c6: ldstr "$skill_crowssbows"
IL_00cb: stloc.0
IL_00cc: br.s IL_012c
IL_00ce: ldstr "$skill_elementalmagic"
IL_00d3: stloc.0
IL_00d4: br.s IL_012c
IL_00d6: ldstr "$skill_bloodmagic"
IL_00db: stloc.0
IL_00dc: br.s IL_012c
IL_00de: ldstr "$skill_blocking"
IL_00e3: stloc.0
IL_00e4: br.s IL_012c
IL_00e6: ldstr "$skill_run"
IL_00eb: stloc.0
IL_00ec: br.s IL_012c
IL_00ee: ldstr "$skill_jump"
IL_00f3: stloc.0
IL_00f4: br.s IL_012c
IL_00f6: ldstr "$skill_sneak"
IL_00fb: stloc.0
IL_00fc: br.s IL_012c
IL_00fe: ldstr "$skill_swim"
IL_0103: stloc.0
IL_0104: br.s IL_012c
IL_0106: ldstr "$skill_ride"
IL_010b: stloc.0
IL_010c: br.s IL_012c
IL_010e: ldstr "$skill_woodcutting"
IL_0113: stloc.0
IL_0114: br.s IL_012c
IL_0116: ldstr "$skill_pickaxes"
IL_011b: stloc.0
IL_011c: br.s IL_012c
IL_011e: ldstr "$skill_fishing"
IL_0123: stloc.0
IL_0124: br.s IL_012c
IL_0126: ldstr ""
IL_012b: stloc.0
IL_012c: ldloc.0
IL_012d: ret

// System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetToolTipIncomingDamageType(HitData/DamageType)
.locals System.String
IL_0000: ldarg.0
IL_0001: ldc.i4.s 32
IL_0003: bgt.s IL_003e
IL_0005: ldarg.0
IL_0006: ldc.i4.8
IL_0007: bgt.s IL_002a
IL_0009: ldarg.0
IL_000a: ldc.i4.1
IL_000b: sub
IL_000c: switch IL_0087,IL_007f,IL_00cf,IL_0077
IL_0021: ldarg.0
IL_0022: ldc.i4.8
IL_0023: beq.s IL_008f
IL_0025: br IL_00cf
IL_002a: ldarg.0
IL_002b: ldc.i4.s 16
IL_002d: beq.s IL_0097
IL_002f: ldarg.0
IL_0030: ldc.i4.s 31
IL_0032: beq.s IL_006f
IL_0034: ldarg.0
IL_0035: ldc.i4.s 32
IL_0037: beq.s IL_00b7
IL_0039: br IL_00cf
IL_003e: ldarg.0
IL_003f: ldc.i4 128
IL_0044: bgt.s IL_0055
IL_0046: ldarg.0
IL_0047: ldc.i4.s 64
IL_0049: beq.s IL_00af
IL_004b: ldarg.0
IL_004c: ldc.i4 128
IL_0051: beq.s IL_00a7
IL_0053: br.s IL_00cf
IL_0055: ldarg.0
IL_0056: ldc.i4 224
IL_005b: beq.s IL_009f
IL_005d: ldarg.0
IL_005e: ldc.i4 256
IL_0063: beq.s IL_00bf
IL_0065: ldarg.0
IL_0066: ldc.i4 512
IL_006b: beq.s IL_00c7
IL_006d: br.s IL_00cf
IL_006f: ldstr "$ui_fpo_physical"
IL_0074: stloc.0
IL_0075: br.s IL_00d5
IL_0077: ldstr "$inventory_pierce"
IL_007c: stloc.0
IL_007d: br.s IL_00d5
IL_007f: ldstr "$inventory_slash"
IL_0084: stloc.0
IL_0085: br.s IL_00d5
IL_0087: ldstr "$inventory_blunt"
IL_008c: stloc.0
IL_008d: br.s IL_00d5
IL_008f: ldstr "$inventory_chop"
IL_0094: stloc.0
IL_0095: br.s IL_00d5
IL_0097: ldstr "$inventory_pickaxe"
IL_009c: stloc.0
IL_009d: br.s IL_00d5
IL_009f: ldstr "$ui_fpo_elemental"
IL_00a4: stloc.0
IL_00a5: br.s IL_00d5
IL_00a7: ldstr "$inventory_lightning"
IL_00ac: stloc.0
IL_00ad: br.s IL_00d5
IL_00af: ldstr "$inventory_frost"
IL_00b4: stloc.0
IL_00b5: br.s IL_00d5
IL_00b7: ldstr "$inventory_fire"
IL_00bc: stloc.0
IL_00bd: br.s IL_00d5
IL_00bf: ldstr "$inventory_poison"
IL_00c4: stloc.0
IL_00c5: br.s IL_00d5
IL_00c7: ldstr "$inventory_spirit"
IL_00cc: stloc.0
IL_00cd: br.s IL_00d5
IL_00cf: ldstr ""
IL_00d4: stloc.0
IL_00d5: ldloc.0
IL_00d6: ret

// System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetToolTipIncomingDamageModifier(HitData/DamageModifier)
.locals System.Single
IL_0000: ldarg.0
IL_0001: switch IL_0034,IL_003c,IL_002c,IL_004c,IL_0054,IL_0044,IL_0024
IL_0022: br.s IL_0054
IL_0024: ldc.r4 1
IL_0029: stloc.0
IL_002a: br.s IL_005a
IL_002c: ldc.r4 0.5
IL_0031: stloc.0
IL_0032: br.s IL_005a
IL_0034: ldc.r4 0
IL_0039: stloc.0
IL_003a: br.s IL_005a
IL_003c: ldc.r4 -0.5
IL_0041: stloc.0
IL_0042: br.s IL_005a
IL_0044: ldc.r4 -0.75
IL_0049: stloc.0
IL_004a: br.s IL_005a
IL_004c: ldc.r4 -1
IL_0051: stloc.0
IL_0052: br.s IL_005a
IL_0054: ldc.r4 0
IL_0059: stloc.0
IL_005a: ldloc.0
IL_005b: ret

// System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetToolTipFormat(StatusEffect)
.locals System.Text.StringBuilder
IL_0000: ldc.i4 256
IL_0005: newobj System.Void System.Text.StringBuilder::.ctor(System.Int32)
IL_000a: stloc.0
IL_000b: ldloc.0
IL_000c: ldstr "<color=orange>"
IL_0011: ldarg.0
IL_0012: ldfld System.String StatusEffect::m_name
IL_0017: ldstr "</color>
"
IL_001c: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0021: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0026: pop
IL_0027: ldloc.0
IL_0028: ldarg.0
IL_0029: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetToolTipStringFormat(StatusEffect)
IL_002e: ldstr "
"
IL_0033: call System.String System.String::Concat(System.String,System.String)
IL_0038: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_003d: pop
IL_003e: ldsfld System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul::Mod_EpicLoot
IL_0043: brfalse.s IL_0051
IL_0045: ldloc.0
IL_0046: ldstr "	
"
IL_004b: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0050: pop
IL_0051: ldloc.0
IL_0052: callvirt System.String System.Object::ToString()
IL_0057: ret

// System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetToolTipStringFormat(StatusEffect)
.locals System.Text.StringBuilder, System.String[], System.Int32, System.String
IL_0000: ldc.i4 256
IL_0005: newobj System.Void System.Text.StringBuilder::.ctor(System.Int32)
IL_000a: stloc.0
IL_000b: ldarg.0
IL_000c: callvirt System.String StatusEffect::GetTooltipString()
IL_0011: ldc.i4.1
IL_0012: newarr System.Char
IL_0017: dup
IL_0018: ldc.i4.0
IL_0019: ldc.i4.s 10
IL_001b: stelem.i2
IL_001c: ldc.i4.1
IL_001d: callvirt System.String[] System.String::Split(System.Char[],System.StringSplitOptions)
IL_0022: stloc.1
IL_0023: ldc.i4.0
IL_0024: stloc.2
IL_0025: br.s IL_0046
IL_0027: ldloc.1
IL_0028: ldloc.2
IL_0029: ldelem.ref
IL_002a: stloc.3
IL_002b: ldloc.0
IL_002c: ldstr "<size=16>"
IL_0031: ldloc.3
IL_0032: ldstr "</size>
"
IL_0037: call System.String System.String::Concat(System.String,System.String,System.String)
IL_003c: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0041: pop
IL_0042: ldloc.2
IL_0043: ldc.i4.1
IL_0044: add
IL_0045: stloc.2
IL_0046: ldloc.2
IL_0047: ldloc.1
IL_0048: ldlen
IL_0049: conv.i4
IL_004a: blt.s IL_0027
IL_004c: ldloc.0
IL_004d: callvirt System.String System.Object::ToString()
IL_0052: ret

// System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0006: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Add_Translations()
.locals System.String
IL_0000: call Jotunn.Managers.LocalizationManager Jotunn.Managers.LocalizationManager::get_Instance()
IL_0005: callvirt Jotunn.Entities.CustomLocalization Jotunn.Managers.LocalizationManager::GetLocalization()
IL_000a: ldstr "English"
IL_000f: stloc.0
IL_0010: ldloca.s V_0
IL_0012: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::.ctor()
IL_0017: dup
IL_0018: ldstr "ui_fpo"
IL_001d: ldstr "Forsaken Power Overhaul"
IL_0022: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_0027: dup
IL_0028: ldstr "ui_fpo_passive"
IL_002d: ldstr "Passive"
IL_0032: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_0037: dup
IL_0038: ldstr "ui_fpo_equipped"
IL_003d: ldstr "Equipped"
IL_0042: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_0047: dup
IL_0048: ldstr "ui_fpo_active"
IL_004d: ldstr "Active"
IL_0052: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_0057: dup
IL_0058: ldstr "ui_fpo_shared"
IL_005d: ldstr "Shared"
IL_0062: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_0067: dup
IL_0068: ldstr "ui_fpo_equipmentspeedmodifier"
IL_006d: ldstr "Movement Speed Penalty from Equipment"
IL_0072: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_0077: dup
IL_0078: ldstr "ui_fpo_windspeedmodifier"
IL_007d: ldstr "Wind Speed when Sailing"
IL_0082: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_0087: dup
IL_0088: ldstr "ui_fpo_stealth"
IL_008d: ldstr "Visibility when Sneaking"
IL_0092: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_0097: dup
IL_0098: ldstr "ui_fpo_coldresistance"
IL_009d: ldstr "Cold Resistance"
IL_00a2: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_00a7: dup
IL_00a8: ldstr "ui_fpo_doubleimpactdamage"
IL_00ad: ldstr "Double Impact Damage"
IL_00b2: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_00b7: dup
IL_00b8: ldstr "ui_fpo_sailingpower"
IL_00bd: ldstr "Tailwind when Sailing"
IL_00c2: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_00c7: dup
IL_00c8: ldstr "ui_fpo_outgoing"
IL_00cd: ldstr "Outgoing Damage with"
IL_00d2: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_00d7: dup
IL_00d8: ldstr "ui_fpo_outgoing_all"
IL_00dd: ldstr "Outgoing Damage"
IL_00e2: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_00e7: dup
IL_00e8: ldstr "ui_fpo_outgoing_tool"
IL_00ed: ldstr "Efficiency with"
IL_00f2: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_00f7: dup
IL_00f8: ldstr "ui_fpo_incoming"
IL_00fd: ldstr "Incoming Damage from"
IL_0102: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_0107: dup
IL_0108: ldstr "ui_fpo_heatdamage"
IL_010d: ldstr "Heat Damage"
IL_0112: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_0117: callvirt System.Void Jotunn.Entities.CustomLocalization::AddTranslation(System.String&,System.Collections.Generic.Dictionary`2<System.String,System.String>)
IL_011c: ret

// System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetLocalization(System.String)
.locals 
IL_0000: ldsfld Localization Localization::m_instance
IL_0005: ldarg.0
IL_0006: callvirt System.String Localization::Localize(System.String)
IL_000b: ret

// System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetLocalization(System.Text.StringBuilder)
.locals 
IL_0000: ldsfld Localization Localization::m_instance
IL_0005: ldarg.0
IL_0006: callvirt System.String System.Object::ToString()
IL_000b: callvirt System.String Localization::Localize(System.String)
IL_0010: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void BepInEx.BaseUnityPlugin::.ctor()
IL_0006: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::.cctor()
.locals 
IL_0000: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>>::.ctor()
IL_0005: stsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Int32>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Int
IL_000a: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>>::.ctor()
IL_000f: stsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.Single>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_Float
IL_0014: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>>::.ctor()
IL_0019: stsfld System.Collections.Generic.Dictionary`2<System.String,BepInEx.Configuration.ConfigEntry`1<System.String>> ForsakenPowerOverhaul.ForsakenPowerOverhaul::Dictionary_ConfigEntry_String
IL_001e: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor()
IL_0023: dup
IL_0024: ldstr "Eikthyr"
IL_0029: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_002e: dup
IL_002f: ldstr "TheElder"
IL_0034: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_0039: dup
IL_003a: ldstr "Bonemass"
IL_003f: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_0044: dup
IL_0045: ldstr "Moder"
IL_004a: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_004f: dup
IL_0050: ldstr "Yagluth"
IL_0055: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_005a: dup
IL_005b: ldstr "Queen"
IL_0060: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_0065: dup
IL_0066: ldstr "Fader"
IL_006b: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_0070: stsfld System.Collections.Generic.List`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_BossNames
IL_0075: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor()
IL_007a: dup
IL_007b: ldstr "Passive"
IL_0080: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_0085: dup
IL_0086: ldstr "Equipped"
IL_008b: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_0090: dup
IL_0091: ldstr "Active"
IL_0096: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_009b: dup
IL_009c: ldstr "Shared"
IL_00a1: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_00a6: stsfld System.Collections.Generic.List`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_Components
IL_00ab: newobj System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::.ctor()
IL_00b0: stsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO
IL_00b5: newobj System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::.ctor()
IL_00ba: stsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Passive
IL_00bf: newobj System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::.ctor()
IL_00c4: stsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Equipped
IL_00c9: newobj System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::.ctor()
IL_00ce: stsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Active
IL_00d3: newobj System.Void System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO>::.ctor()
IL_00d8: stsfld System.Collections.Generic.List`1<ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO> ForsakenPowerOverhaul.ForsakenPowerOverhaul::List_StatusEffect_FPO_Shared
IL_00dd: ldc.i4.0
IL_00de: stsfld System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul::Mod_Auga
IL_00e3: ldc.i4.0
IL_00e4: stsfld System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul::Mod_EpicLoot
IL_00e9: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/BossStone_FPO::Update_BossStones()
.locals 
IL_0000: ldarg.0
IL_0001: call !!0 UnityEngine.Component::GetComponent<BossStone>()
IL_0006: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::GlobalKeys_Update(BossStone)
IL_000b: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::PlayerKeys_Update()
IL_0010: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Passive_Stats()
IL_0015: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Active_Stats()
IL_001a: ldsfld Player Player::m_localPlayer
IL_001f: ldnull
IL_0020: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0025: brfalse.s IL_0031
IL_0027: ldsfld Player Player::m_localPlayer
IL_002c: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Power_Unlock_Spawn(Player)
IL_0031: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/BossStone_FPO::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void UnityEngine.MonoBehaviour::.ctor()
IL_0006: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_BossStone_Start::Postfix(BossStone&)
.locals 
IL_0000: ldarg.0
IL_0001: ldind.ref
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0008: brfalse.s IL_003b
IL_000a: ldarg.0
IL_000b: ldind.ref
IL_000c: callvirt !!0 UnityEngine.Component::GetComponent<ForsakenPowerOverhaul.ForsakenPowerOverhaul/BossStone_FPO>()
IL_0011: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0016: brtrue.s IL_0025
IL_0018: ldarg.0
IL_0019: ldind.ref
IL_001a: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_001f: callvirt !!0 UnityEngine.GameObject::AddComponent<ForsakenPowerOverhaul.ForsakenPowerOverhaul/BossStone_FPO>()
IL_0024: pop
IL_0025: ldarg.0
IL_0026: ldind.ref
IL_0027: callvirt !!0 UnityEngine.Component::GetComponent<ForsakenPowerOverhaul.ForsakenPowerOverhaul/BossStone_FPO>()
IL_002c: ldstr "Update_BossStones"
IL_0031: ldc.r4 1
IL_0036: callvirt System.Void UnityEngine.MonoBehaviour::Invoke(System.String,System.Single)
IL_003b: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_BossStone_Start::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_BossStone_DelayedAttachEffects_Step3::Postfix(BossStone&)
.locals 
IL_0000: ldarg.0
IL_0001: ldind.ref
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0008: brfalse.s IL_0027
IL_000a: ldarg.0
IL_000b: ldind.ref
IL_000c: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::GlobalKeys_Update(BossStone)
IL_0011: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::PlayerKeys_Update()
IL_0016: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Passive_Stats()
IL_001b: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Active_Stats()
IL_0020: ldarg.0
IL_0021: ldind.ref
IL_0022: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Power_Unlock(BossStone)
IL_0027: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_BossStone_DelayedAttachEffects_Step3::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_Item_Stand_GetHoverText::Postfix(ItemStand&,System.String&)
.locals 
IL_0000: ldarg.0
IL_0001: ldind.ref
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0008: brfalse IL_00c8
IL_000d: ldarg.0
IL_000e: ldind.ref
IL_000f: callvirt System.Boolean ItemStand::HaveAttachment()
IL_0014: brfalse IL_00c8
IL_0019: ldarg.0
IL_001a: ldind.ref
IL_001b: ldfld System.Boolean ItemStand::m_canBeRemoved
IL_0020: brtrue IL_00c8
IL_0025: ldarg.0
IL_0026: ldind.ref
IL_0027: ldfld StatusEffect ItemStand::m_guardianPower
IL_002c: ldnull
IL_002d: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0032: brfalse IL_00c1
IL_0037: call ZoneSystem ZoneSystem::get_instance()
IL_003c: ldnull
IL_003d: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0042: brfalse.s IL_00c1
IL_0044: call ZoneSystem ZoneSystem::get_instance()
IL_0049: ldarg.0
IL_004a: ldind.ref
IL_004b: ldfld StatusEffect ItemStand::m_guardianPower
IL_0050: ldfld System.String StatusEffect::m_name
IL_0055: ldstr "$se_"
IL_005a: ldstr "GK_FPO_BossStone_"
IL_005f: callvirt System.String System.String::Replace(System.String,System.String)
IL_0064: ldstr "_name"
IL_0069: ldstr ""
IL_006e: callvirt System.String System.String::Replace(System.String,System.String)
IL_0073: callvirt System.Boolean ZoneSystem::GetGlobalKey(System.String)
IL_0078: brfalse.s IL_00c1
IL_007a: ldarg.1
IL_007b: ldarg.0
IL_007c: ldind.ref
IL_007d: ldfld System.String ItemStand::m_currentItemName
IL_0082: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetBossName(System.String)
IL_0087: ldc.i4.1
IL_0088: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetBossStoneHoverText(System.String,System.Boolean)
IL_008d: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetLocalization(System.String)
IL_0092: stind.ref
IL_0093: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_PowerCycle_Bool
IL_0098: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_009d: brtrue.s IL_00c8
IL_009f: ldarg.0
IL_00a0: ldind.ref
IL_00a1: ldsfld Player Player::m_localPlayer
IL_00a6: callvirt System.Boolean ItemStand::IsGuardianPowerActive(Humanoid)
IL_00ab: brtrue.s IL_00c8
IL_00ad: ldarg.1
IL_00ae: ldarg.1
IL_00af: ldind.ref
IL_00b0: ldstr "[<color=yellow><b>$KEY_Use</b></color>] $guardianstone_hook_activate"
IL_00b5: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetLocalization(System.String)
IL_00ba: call System.String System.String::Concat(System.String,System.String)
IL_00bf: stind.ref
IL_00c0: ret
IL_00c1: ldarg.1
IL_00c2: ldstr ""
IL_00c7: stind.ref
IL_00c8: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_Item_Stand_GetHoverText::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_ItemStand_IsGuardianPowerActive::Postfix(ItemStand&,System.Boolean&)
.locals 
IL_0000: ldarg.0
IL_0001: ldind.ref
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0008: brfalse.s IL_0019
IL_000a: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_PowerCycle_Bool
IL_000f: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0014: brfalse.s IL_0019
IL_0016: ldarg.1
IL_0017: ldc.i4.1
IL_0018: stind.i1
IL_0019: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_ItemStand_IsGuardianPowerActive::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_Player_OnSpawned::Postfix(Player&)
.locals 
IL_0000: ldarg.0
IL_0001: ldind.ref
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0008: brfalse.s IL_0031
IL_000a: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Config_SettingRead()
IL_000f: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::PlayerKeys_Update()
IL_0014: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Passive_Stats()
IL_0019: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Active_Stats()
IL_001e: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Equipped_Stats()
IL_0023: ldarg.0
IL_0024: ldind.ref
IL_0025: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Power_Lock(Player)
IL_002a: ldarg.0
IL_002b: ldind.ref
IL_002c: call System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul::Power_Unlock_Spawn(Player)
IL_0031: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_Player_OnSpawned::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_Player_ActivateGuardianPower::Prefix(Player&,System.Boolean&)
.locals System.String, System.String, System.Int32, System.Collections.Generic.List`1/Enumerator<StatusEffect>, StatusEffect
IL_0000: ldarg.0
IL_0001: ldind.ref
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0008: brfalse IL_0136
IL_000d: ldarg.0
IL_000e: ldind.ref
IL_000f: ldfld System.Single Player::m_guardianPowerCooldown
IL_0014: ldc.r4 0
IL_0019: bgt.s IL_002a
IL_001b: ldarg.0
IL_001c: ldind.ref
IL_001d: ldfld StatusEffect Player::m_guardianSE
IL_0022: ldnull
IL_0023: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0028: brfalse.s IL_002f
IL_002a: ldarg.1
IL_002b: ldc.i4.0
IL_002c: stind.i1
IL_002d: ldc.i4.0
IL_002e: ret
IL_002f: ldarg.0
IL_0030: ldind.ref
IL_0031: callvirt System.String Player::GetGuardianPowerName()
IL_0036: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetBossName(System.String)
IL_003b: stloc.0
IL_003c: ldstr "SE_FPO_"
IL_0041: ldloc.0
IL_0042: call System.String System.String::Concat(System.String,System.String)
IL_0047: stloc.1
IL_0048: ldloc.1
IL_0049: call System.Int32 ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetHash(System.String)
IL_004e: stloc.2
IL_004f: ldarg.0
IL_0050: ldind.ref
IL_0051: ldfld SEMan Character::m_seman
IL_0056: ldloc.2
IL_0057: callvirt StatusEffect SEMan::GetStatusEffect(System.Int32)
IL_005c: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0061: brfalse.s IL_0072
IL_0063: ldarg.0
IL_0064: ldind.ref
IL_0065: ldfld SEMan Character::m_seman
IL_006a: ldloc.2
IL_006b: ldc.i4.0
IL_006c: callvirt System.Boolean SEMan::RemoveStatusEffect(System.Int32,System.Boolean)
IL_0071: pop
IL_0072: ldarg.0
IL_0073: ldind.ref
IL_0074: ldfld SEMan Character::m_seman
IL_0079: ldloc.2
IL_007a: ldc.i4.1
IL_007b: ldc.i4.0
IL_007c: ldc.r4 0
IL_0081: ldc.i4.m1
IL_0082: callvirt StatusEffect SEMan::AddStatusEffect(System.Int32,System.Boolean,System.Int32,System.Single,System.Int16)
IL_0087: pop
IL_0088: ldarg.0
IL_0089: ldind.ref
IL_008a: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ForsakenPowerOverhaul.ForsakenPowerOverhaul::ConfigEntry_General_GuardianPower_CooldownDuration
IL_008f: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0094: conv.r4
IL_0095: stfld System.Single Player::m_guardianPowerCooldown
IL_009a: ldarg.0
IL_009b: ldind.ref
IL_009c: ldfld System.Single Player::m_adrenalineGuardianPower
IL_00a1: ldc.r4 0
IL_00a6: ble.un.s IL_00b6
IL_00a8: ldarg.0
IL_00a9: ldind.ref
IL_00aa: ldarg.0
IL_00ab: ldind.ref
IL_00ac: ldfld System.Single Player::m_adrenalineGuardianPower
IL_00b1: callvirt System.Void Character::AddAdrenaline(System.Single)
IL_00b6: ldarg.0
IL_00b7: ldind.ref
IL_00b8: ldfld SEMan Character::m_seman
IL_00bd: callvirt System.Collections.Generic.List`1<StatusEffect> SEMan::GetStatusEffects()
IL_00c2: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<StatusEffect>::GetEnumerator()
IL_00c7: stloc.3
IL_00c8: br.s IL_011a
IL_00ca: ldloca.s V_3
IL_00cc: call !0 System.Collections.Generic.List`1/Enumerator<StatusEffect>::get_Current()
IL_00d1: stloc.s V_4
IL_00d3: ldloc.s V_4
IL_00d5: callvirt System.String UnityEngine.Object::get_name()
IL_00da: ldstr "SE_FPO_"
IL_00df: callvirt System.Boolean System.String::StartsWith(System.String)
IL_00e4: brfalse.s IL_011a
IL_00e6: ldloc.s V_4
IL_00e8: callvirt System.String UnityEngine.Object::get_name()
IL_00ed: ldstr "SE_FPO_Passive"
IL_00f2: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_00f7: brfalse.s IL_011a
IL_00f9: ldloc.s V_4
IL_00fb: callvirt System.String UnityEngine.Object::get_name()
IL_0100: ldloc.1
IL_0101: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_0106: brfalse.s IL_011a
IL_0108: ldarg.0
IL_0109: ldind.ref
IL_010a: ldfld SEMan Character::m_seman
IL_010f: ldloc.s V_4
IL_0111: ldc.i4.0
IL_0112: callvirt System.Boolean SEMan::RemoveStatusEffect(StatusEffect,System.Boolean)
IL_0117: pop
IL_0118: leave.s IL_0133
IL_011a: ldloca.s V_3
IL_011c: call System.Boolean System.Collections.Generic.List`1/Enumerator<StatusEffect>::MoveNext()
IL_0121: brtrue.s IL_00ca
IL_0123: leave.s IL_0133
IL_0125: ldloca.s V_3
IL_0127: constrained. System.Collections.Generic.List`1/Enumerator<StatusEffect>
IL_012d: callvirt System.Void System.IDisposable::Dispose()
IL_0132: endfinally
IL_0133: ldarg.1
IL_0134: ldc.i4.1
IL_0135: stind.i1
IL_0136: ldc.i4.0
IL_0137: ret
// EH Finally: 200 - 293 => 293 - 307

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_Player_ActivateGuardianPower::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_Player_SetMaxHealth::Prefix(Player&,System.Single&)
.locals System.Single
IL_0000: ldarg.0
IL_0001: ldind.ref
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0008: brfalse.s IL_0025
IL_000a: ldc.r4 0
IL_000f: stloc.0
IL_0010: ldloc.0
IL_0011: ldstr "MaxHealth"
IL_0016: ldarg.0
IL_0017: ldind.ref
IL_0018: call System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Player_BaseStats(System.String,Player)
IL_001d: add
IL_001e: stloc.0
IL_001f: ldarg.1
IL_0020: ldarg.1
IL_0021: ldind.r4
IL_0022: ldloc.0
IL_0023: add
IL_0024: stind.r4
IL_0025: ldc.i4.1
IL_0026: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_Player_SetMaxHealth::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_Player_UpdateFood::Postfix(Player&)
.locals System.Single, System.Single
IL_0000: ldarg.0
IL_0001: ldind.ref
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0008: brfalse.s IL_004c
IL_000a: ldarg.0
IL_000b: ldind.ref
IL_000c: ldfld System.Single Player::m_foodRegenTimer
IL_0011: ldc.r4 0
IL_0016: bne.un.s IL_004c
IL_0018: ldc.r4 0
IL_001d: stloc.0
IL_001e: ldloc.0
IL_001f: ldstr "HealthRegen"
IL_0024: ldarg.0
IL_0025: ldind.ref
IL_0026: call System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Player_BaseStats(System.String,Player)
IL_002b: add
IL_002c: stloc.0
IL_002d: ldc.r4 1
IL_0032: stloc.1
IL_0033: ldarg.0
IL_0034: ldind.ref
IL_0035: ldfld SEMan Character::m_seman
IL_003a: ldloca.s V_1
IL_003c: callvirt System.Void SEMan::ModifyHealthRegen(System.Single&)
IL_0041: ldarg.0
IL_0042: ldind.ref
IL_0043: ldloc.0
IL_0044: ldloc.1
IL_0045: mul
IL_0046: ldc.i4.1
IL_0047: callvirt System.Void Character::Heal(System.Single,System.Boolean)
IL_004c: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_Player_UpdateFood::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_Player_SetMaxStamina::Prefix(Player&,System.Single&)
.locals System.Single
IL_0000: ldarg.0
IL_0001: ldind.ref
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0008: brfalse.s IL_0025
IL_000a: ldc.r4 0
IL_000f: stloc.0
IL_0010: ldloc.0
IL_0011: ldstr "MaxStamina"
IL_0016: ldarg.0
IL_0017: ldind.ref
IL_0018: call System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Player_BaseStats(System.String,Player)
IL_001d: add
IL_001e: stloc.0
IL_001f: ldarg.1
IL_0020: ldarg.1
IL_0021: ldind.r4
IL_0022: ldloc.0
IL_0023: add
IL_0024: stind.r4
IL_0025: ldc.i4.1
IL_0026: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_Player_SetMaxStamina::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_Player_SetMaxEitr::Prefix(Player&,System.Single&)
.locals System.Single
IL_0000: ldarg.0
IL_0001: ldind.ref
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0008: brfalse.s IL_0025
IL_000a: ldc.r4 0
IL_000f: stloc.0
IL_0010: ldloc.0
IL_0011: ldstr "MaxEitr"
IL_0016: ldarg.0
IL_0017: ldind.ref
IL_0018: call System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Player_BaseStats(System.String,Player)
IL_001d: add
IL_001e: stloc.0
IL_001f: ldarg.1
IL_0020: ldarg.1
IL_0021: ldind.r4
IL_0022: ldloc.0
IL_0023: add
IL_0024: stind.r4
IL_0025: ldc.i4.1
IL_0026: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_Player_SetMaxEitr::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_Player_GetEquipmentMovementModifier::Postfix(Player&,System.Single&)
.locals System.Single
IL_0000: ldarg.0
IL_0001: ldind.ref
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0008: brfalse IL_031f
IL_000d: ldc.r4 0
IL_0012: stloc.0
IL_0013: ldloc.0
IL_0014: ldstr "EquipmentSpeedModifier"
IL_0019: ldarg.0
IL_001a: ldind.ref
IL_001b: call System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Player_BaseStats(System.String,Player)
IL_0020: add
IL_0021: stloc.0
IL_0022: ldloc.0
IL_0023: ldc.r4 0
IL_0028: beq IL_0314
IL_002d: ldloc.0
IL_002e: ldc.r4 -1
IL_0033: blt.s IL_0038
IL_0035: ldloc.0
IL_0036: br.s IL_003d
IL_0038: ldc.r4 -1
IL_003d: stloc.0
IL_003e: ldc.r4 1
IL_0043: ldloc.0
IL_0044: add
IL_0045: stloc.0
IL_0046: ldarg.0
IL_0047: ldind.ref
IL_0048: ldfld System.Single[] Player::m_equipmentModifierValues
IL_004d: ldc.i4.0
IL_004e: ldc.r4 0
IL_0053: stelem.r4
IL_0054: ldarg.0
IL_0055: ldind.ref
IL_0056: ldfld ItemDrop/ItemData Humanoid::m_rightItem
IL_005b: brfalse.s IL_00ac
IL_005d: ldarg.0
IL_005e: ldind.ref
IL_005f: ldfld System.Single[] Player::m_equipmentModifierValues
IL_0064: ldc.i4.0
IL_0065: ldelema System.Single
IL_006a: dup
IL_006b: ldind.r4
IL_006c: ldarg.0
IL_006d: ldind.ref
IL_006e: ldfld ItemDrop/ItemData Humanoid::m_rightItem
IL_0073: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0078: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_007d: ldc.r4 0
IL_0082: blt.s IL_0097
IL_0084: ldarg.0
IL_0085: ldind.ref
IL_0086: ldfld ItemDrop/ItemData Humanoid::m_rightItem
IL_008b: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0090: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_0095: br.s IL_00aa
IL_0097: ldarg.0
IL_0098: ldind.ref
IL_0099: ldfld ItemDrop/ItemData Humanoid::m_rightItem
IL_009e: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_00a3: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_00a8: ldloc.0
IL_00a9: mul
IL_00aa: add
IL_00ab: stind.r4
IL_00ac: ldarg.0
IL_00ad: ldind.ref
IL_00ae: ldfld ItemDrop/ItemData Humanoid::m_leftItem
IL_00b3: brfalse.s IL_0104
IL_00b5: ldarg.0
IL_00b6: ldind.ref
IL_00b7: ldfld System.Single[] Player::m_equipmentModifierValues
IL_00bc: ldc.i4.0
IL_00bd: ldelema System.Single
IL_00c2: dup
IL_00c3: ldind.r4
IL_00c4: ldarg.0
IL_00c5: ldind.ref
IL_00c6: ldfld ItemDrop/ItemData Humanoid::m_leftItem
IL_00cb: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_00d0: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_00d5: ldc.r4 0
IL_00da: blt.s IL_00ef
IL_00dc: ldarg.0
IL_00dd: ldind.ref
IL_00de: ldfld ItemDrop/ItemData Humanoid::m_leftItem
IL_00e3: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_00e8: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_00ed: br.s IL_0102
IL_00ef: ldarg.0
IL_00f0: ldind.ref
IL_00f1: ldfld ItemDrop/ItemData Humanoid::m_leftItem
IL_00f6: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_00fb: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_0100: ldloc.0
IL_0101: mul
IL_0102: add
IL_0103: stind.r4
IL_0104: ldarg.0
IL_0105: ldind.ref
IL_0106: ldfld ItemDrop/ItemData Humanoid::m_chestItem
IL_010b: brfalse.s IL_015c
IL_010d: ldarg.0
IL_010e: ldind.ref
IL_010f: ldfld System.Single[] Player::m_equipmentModifierValues
IL_0114: ldc.i4.0
IL_0115: ldelema System.Single
IL_011a: dup
IL_011b: ldind.r4
IL_011c: ldarg.0
IL_011d: ldind.ref
IL_011e: ldfld ItemDrop/ItemData Humanoid::m_chestItem
IL_0123: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0128: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_012d: ldc.r4 0
IL_0132: blt.s IL_0147
IL_0134: ldarg.0
IL_0135: ldind.ref
IL_0136: ldfld ItemDrop/ItemData Humanoid::m_chestItem
IL_013b: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0140: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_0145: br.s IL_015a
IL_0147: ldarg.0
IL_0148: ldind.ref
IL_0149: ldfld ItemDrop/ItemData Humanoid::m_chestItem
IL_014e: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0153: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_0158: ldloc.0
IL_0159: mul
IL_015a: add
IL_015b: stind.r4
IL_015c: ldarg.0
IL_015d: ldind.ref
IL_015e: ldfld ItemDrop/ItemData Humanoid::m_legItem
IL_0163: brfalse.s IL_01b4
IL_0165: ldarg.0
IL_0166: ldind.ref
IL_0167: ldfld System.Single[] Player::m_equipmentModifierValues
IL_016c: ldc.i4.0
IL_016d: ldelema System.Single
IL_0172: dup
IL_0173: ldind.r4
IL_0174: ldarg.0
IL_0175: ldind.ref
IL_0176: ldfld ItemDrop/ItemData Humanoid::m_legItem
IL_017b: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0180: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_0185: ldc.r4 0
IL_018a: blt.s IL_019f
IL_018c: ldarg.0
IL_018d: ldind.ref
IL_018e: ldfld ItemDrop/ItemData Humanoid::m_legItem
IL_0193: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0198: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_019d: br.s IL_01b2
IL_019f: ldarg.0
IL_01a0: ldind.ref
IL_01a1: ldfld ItemDrop/ItemData Humanoid::m_legItem
IL_01a6: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_01ab: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_01b0: ldloc.0
IL_01b1: mul
IL_01b2: add
IL_01b3: stind.r4
IL_01b4: ldarg.0
IL_01b5: ldind.ref
IL_01b6: ldfld ItemDrop/ItemData Humanoid::m_helmetItem
IL_01bb: brfalse.s IL_020c
IL_01bd: ldarg.0
IL_01be: ldind.ref
IL_01bf: ldfld System.Single[] Player::m_equipmentModifierValues
IL_01c4: ldc.i4.0
IL_01c5: ldelema System.Single
IL_01ca: dup
IL_01cb: ldind.r4
IL_01cc: ldarg.0
IL_01cd: ldind.ref
IL_01ce: ldfld ItemDrop/ItemData Humanoid::m_helmetItem
IL_01d3: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_01d8: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_01dd: ldc.r4 0
IL_01e2: blt.s IL_01f7
IL_01e4: ldarg.0
IL_01e5: ldind.ref
IL_01e6: ldfld ItemDrop/ItemData Humanoid::m_helmetItem
IL_01eb: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_01f0: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_01f5: br.s IL_020a
IL_01f7: ldarg.0
IL_01f8: ldind.ref
IL_01f9: ldfld ItemDrop/ItemData Humanoid::m_helmetItem
IL_01fe: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0203: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_0208: ldloc.0
IL_0209: mul
IL_020a: add
IL_020b: stind.r4
IL_020c: ldarg.0
IL_020d: ldind.ref
IL_020e: ldfld ItemDrop/ItemData Humanoid::m_shoulderItem
IL_0213: brfalse.s IL_0264
IL_0215: ldarg.0
IL_0216: ldind.ref
IL_0217: ldfld System.Single[] Player::m_equipmentModifierValues
IL_021c: ldc.i4.0
IL_021d: ldelema System.Single
IL_0222: dup
IL_0223: ldind.r4
IL_0224: ldarg.0
IL_0225: ldind.ref
IL_0226: ldfld ItemDrop/ItemData Humanoid::m_shoulderItem
IL_022b: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0230: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_0235: ldc.r4 0
IL_023a: blt.s IL_024f
IL_023c: ldarg.0
IL_023d: ldind.ref
IL_023e: ldfld ItemDrop/ItemData Humanoid::m_shoulderItem
IL_0243: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0248: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_024d: br.s IL_0262
IL_024f: ldarg.0
IL_0250: ldind.ref
IL_0251: ldfld ItemDrop/ItemData Humanoid::m_shoulderItem
IL_0256: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_025b: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_0260: ldloc.0
IL_0261: mul
IL_0262: add
IL_0263: stind.r4
IL_0264: ldarg.0
IL_0265: ldind.ref
IL_0266: ldfld ItemDrop/ItemData Humanoid::m_utilityItem
IL_026b: brfalse.s IL_02bc
IL_026d: ldarg.0
IL_026e: ldind.ref
IL_026f: ldfld System.Single[] Player::m_equipmentModifierValues
IL_0274: ldc.i4.0
IL_0275: ldelema System.Single
IL_027a: dup
IL_027b: ldind.r4
IL_027c: ldarg.0
IL_027d: ldind.ref
IL_027e: ldfld ItemDrop/ItemData Humanoid::m_utilityItem
IL_0283: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0288: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_028d: ldc.r4 0
IL_0292: blt.s IL_02a7
IL_0294: ldarg.0
IL_0295: ldind.ref
IL_0296: ldfld ItemDrop/ItemData Humanoid::m_utilityItem
IL_029b: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_02a0: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_02a5: br.s IL_02ba
IL_02a7: ldarg.0
IL_02a8: ldind.ref
IL_02a9: ldfld ItemDrop/ItemData Humanoid::m_utilityItem
IL_02ae: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_02b3: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_02b8: ldloc.0
IL_02b9: mul
IL_02ba: add
IL_02bb: stind.r4
IL_02bc: ldarg.0
IL_02bd: ldind.ref
IL_02be: ldfld ItemDrop/ItemData Humanoid::m_trinketItem
IL_02c3: brfalse.s IL_0314
IL_02c5: ldarg.0
IL_02c6: ldind.ref
IL_02c7: ldfld System.Single[] Player::m_equipmentModifierValues
IL_02cc: ldc.i4.0
IL_02cd: ldelema System.Single
IL_02d2: dup
IL_02d3: ldind.r4
IL_02d4: ldarg.0
IL_02d5: ldind.ref
IL_02d6: ldfld ItemDrop/ItemData Humanoid::m_trinketItem
IL_02db: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_02e0: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_02e5: ldc.r4 0
IL_02ea: blt.s IL_02ff
IL_02ec: ldarg.0
IL_02ed: ldind.ref
IL_02ee: ldfld ItemDrop/ItemData Humanoid::m_trinketItem
IL_02f3: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_02f8: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_02fd: br.s IL_0312
IL_02ff: ldarg.0
IL_0300: ldind.ref
IL_0301: ldfld ItemDrop/ItemData Humanoid::m_trinketItem
IL_0306: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_030b: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_0310: ldloc.0
IL_0311: mul
IL_0312: add
IL_0313: stind.r4
IL_0314: ldarg.1
IL_0315: ldarg.0
IL_0316: ldind.ref
IL_0317: ldfld System.Single[] Player::m_equipmentModifierValues
IL_031c: ldc.i4.0
IL_031d: ldelem.r4
IL_031e: stind.r4
IL_031f: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_Player_GetEquipmentMovementModifier::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_Player_GetEquipmentHeatResistanceModifier::Postfix(Player&,System.Single&)
.locals System.Single
IL_0000: ldarg.0
IL_0001: ldind.ref
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0008: brfalse.s IL_0065
IL_000a: ldc.r4 0
IL_000f: stloc.0
IL_0010: ldloc.0
IL_0011: ldstr "HeatDamageModifier"
IL_0016: ldarg.0
IL_0017: ldind.ref
IL_0018: call System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Player_BaseStats(System.String,Player)
IL_001d: add
IL_001e: stloc.0
IL_001f: ldarg.0
IL_0020: ldind.ref
IL_0021: ldfld System.Single[] Player::m_equipmentModifierValues
IL_0026: ldc.i4.2
IL_0027: ldelema System.Single
IL_002c: dup
IL_002d: ldind.r4
IL_002e: ldloc.0
IL_002f: sub
IL_0030: stind.r4
IL_0031: ldarg.0
IL_0032: ldind.ref
IL_0033: ldfld System.Single[] Player::m_equipmentModifierValues
IL_0038: ldc.i4.2
IL_0039: ldarg.0
IL_003a: ldind.ref
IL_003b: ldfld System.Single[] Player::m_equipmentModifierValues
IL_0040: ldc.i4.2
IL_0041: ldelem.r4
IL_0042: ldc.r4 1
IL_0047: bgt.s IL_0054
IL_0049: ldarg.0
IL_004a: ldind.ref
IL_004b: ldfld System.Single[] Player::m_equipmentModifierValues
IL_0050: ldc.i4.2
IL_0051: ldelem.r4
IL_0052: br.s IL_0059
IL_0054: ldc.r4 1
IL_0059: stelem.r4
IL_005a: ldarg.1
IL_005b: ldarg.0
IL_005c: ldind.ref
IL_005d: ldfld System.Single[] Player::m_equipmentModifierValues
IL_0062: ldc.i4.2
IL_0063: ldelem.r4
IL_0064: stind.r4
IL_0065: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_Player_GetEquipmentHeatResistanceModifier::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_SEMan_HaveStatusAttribute::Postfix(SEMan&,StatusEffect/StatusAttribute&,System.Boolean&)
.locals System.Boolean, System.Collections.Generic.List`1/Enumerator<StatusEffect>, StatusEffect
IL_0000: ldarg.0
IL_0001: ldind.ref
IL_0002: brfalse.s IL_005d
IL_0004: ldarg.2
IL_0005: ldind.u1
IL_0006: stloc.0
IL_0007: ldarg.0
IL_0008: ldind.ref
IL_0009: callvirt System.Collections.Generic.List`1<StatusEffect> SEMan::GetStatusEffects()
IL_000e: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<StatusEffect>::GetEnumerator()
IL_0013: stloc.1
IL_0014: br.s IL_0041
IL_0016: ldloca.s V_1
IL_0018: call !0 System.Collections.Generic.List`1/Enumerator<StatusEffect>::get_Current()
IL_001d: stloc.2
IL_001e: ldloc.2
IL_001f: callvirt System.String UnityEngine.Object::get_name()
IL_0024: ldstr "SE_FPO_"
IL_0029: callvirt System.Boolean System.String::StartsWith(System.String)
IL_002e: brfalse.s IL_0041
IL_0030: ldloc.2
IL_0031: castclass ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO
IL_0036: ldarg.1
IL_0037: ldind.i4
IL_0038: callvirt System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::HaveAttribute(StatusEffect/StatusAttribute)
IL_003d: brfalse.s IL_0041
IL_003f: ldc.i4.1
IL_0040: stloc.0
IL_0041: ldloca.s V_1
IL_0043: call System.Boolean System.Collections.Generic.List`1/Enumerator<StatusEffect>::MoveNext()
IL_0048: brtrue.s IL_0016
IL_004a: leave.s IL_005a
IL_004c: ldloca.s V_1
IL_004e: constrained. System.Collections.Generic.List`1/Enumerator<StatusEffect>
IL_0054: callvirt System.Void System.IDisposable::Dispose()
IL_0059: endfinally
IL_005a: ldarg.2
IL_005b: ldloc.0
IL_005c: stind.i1
IL_005d: ret
// EH Finally: 20 - 76 => 76 - 90

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_SEMan_HaveStatusAttribute::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_Ship_SailForce::Postfix(Ship&,UnityEngine.Vector3&)
.locals System.Single, System.Collections.Generic.List`1/Enumerator<Player>, Player
IL_0000: ldarg.0
IL_0001: ldind.ref
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0008: brfalse.s IL_006f
IL_000a: ldarg.0
IL_000b: ldind.ref
IL_000c: callvirt System.Boolean Ship::IsWindControllActive()
IL_0011: brfalse.s IL_006f
IL_0013: ldc.r4 0
IL_0018: stloc.0
IL_0019: ldarg.0
IL_001a: ldind.ref
IL_001b: ldfld System.Collections.Generic.List`1<Player> Ship::m_players
IL_0020: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Player>::GetEnumerator()
IL_0025: stloc.1
IL_0026: br.s IL_003e
IL_0028: ldloca.s V_1
IL_002a: call !0 System.Collections.Generic.List`1/Enumerator<Player>::get_Current()
IL_002f: stloc.2
IL_0030: ldloc.0
IL_0031: ldstr "WindSpeedModifier"
IL_0036: ldloc.2
IL_0037: call System.Single ForsakenPowerOverhaul.ForsakenPowerOverhaul::Update_Player_BaseStats(System.String,Player)
IL_003c: add
IL_003d: stloc.0
IL_003e: ldloca.s V_1
IL_0040: call System.Boolean System.Collections.Generic.List`1/Enumerator<Player>::MoveNext()
IL_0045: brtrue.s IL_0028
IL_0047: leave.s IL_0057
IL_0049: ldloca.s V_1
IL_004b: constrained. System.Collections.Generic.List`1/Enumerator<Player>
IL_0051: callvirt System.Void System.IDisposable::Dispose()
IL_0056: endfinally
IL_0057: ldarg.1
IL_0058: ldarg.1
IL_0059: ldobj UnityEngine.Vector3
IL_005e: ldc.r4 1
IL_0063: ldloc.0
IL_0064: add
IL_0065: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_006a: stobj UnityEngine.Vector3
IL_006f: ret
// EH Finally: 38 - 73 => 73 - 87

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_Ship_SailForce::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_TextsDialog_AddActiveEffects::Postfix(TextsDialog&)
.locals System.Text.StringBuilder, System.Text.StringBuilder, System.Collections.Generic.List`1<StatusEffect>, System.Collections.Generic.List`1/Enumerator<StatusEffect>, StatusEffect, StatusEffect, StatusEffect, StatusEffect, System.Collections.Generic.List`1/Enumerator<System.String>, System.String
IL_0000: ldarg.0
IL_0001: ldind.ref
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0008: brfalse IL_0258
IL_000d: ldc.i4 256
IL_0012: newobj System.Void System.Text.StringBuilder::.ctor(System.Int32)
IL_0017: stloc.0
IL_0018: ldc.i4 256
IL_001d: newobj System.Void System.Text.StringBuilder::.ctor(System.Int32)
IL_0022: stloc.1
IL_0023: newobj System.Void System.Collections.Generic.List`1<StatusEffect>::.ctor()
IL_0028: stloc.2
IL_0029: ldsfld Player Player::m_localPlayer
IL_002e: callvirt SEMan Character::GetSEMan()
IL_0033: ldloc.2
IL_0034: callvirt System.Void SEMan::GetHUDStatusEffects(System.Collections.Generic.List`1<StatusEffect>)
IL_0039: ldloc.2
IL_003a: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<StatusEffect>::GetEnumerator()
IL_003f: stloc.3
IL_0040: br.s IL_0092
IL_0042: ldloca.s V_3
IL_0044: call !0 System.Collections.Generic.List`1/Enumerator<StatusEffect>::get_Current()
IL_0049: stloc.s V_4
IL_004b: ldloc.s V_4
IL_004d: callvirt System.String UnityEngine.Object::get_name()
IL_0052: ldstr "SE_FPO_"
IL_0057: callvirt System.Boolean System.String::StartsWith(System.String)
IL_005c: brfalse.s IL_0092
IL_005e: ldloc.s V_4
IL_0060: callvirt System.String UnityEngine.Object::get_name()
IL_0065: ldstr "_Equipped"
IL_006a: callvirt System.Boolean System.String::Contains(System.String)
IL_006f: brtrue.s IL_0092
IL_0071: ldloc.s V_4
IL_0073: callvirt System.String UnityEngine.Object::get_name()
IL_0078: ldstr "_Passive"
IL_007d: callvirt System.Boolean System.String::Contains(System.String)
IL_0082: brtrue.s IL_0092
IL_0084: ldloc.0
IL_0085: ldloc.s V_4
IL_0087: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetToolTipFormat(StatusEffect)
IL_008c: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0091: pop
IL_0092: ldloca.s V_3
IL_0094: call System.Boolean System.Collections.Generic.List`1/Enumerator<StatusEffect>::MoveNext()
IL_0099: brtrue.s IL_0042
IL_009b: leave.s IL_00ab
IL_009d: ldloca.s V_3
IL_009f: constrained. System.Collections.Generic.List`1/Enumerator<StatusEffect>
IL_00a5: callvirt System.Void System.IDisposable::Dispose()
IL_00aa: endfinally
IL_00ab: ldloc.2
IL_00ac: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<StatusEffect>::GetEnumerator()
IL_00b1: stloc.3
IL_00b2: br.s IL_00f1
IL_00b4: ldloca.s V_3
IL_00b6: call !0 System.Collections.Generic.List`1/Enumerator<StatusEffect>::get_Current()
IL_00bb: stloc.s V_5
IL_00bd: ldloc.s V_5
IL_00bf: callvirt System.String UnityEngine.Object::get_name()
IL_00c4: ldstr "SE_FPO_"
IL_00c9: callvirt System.Boolean System.String::StartsWith(System.String)
IL_00ce: brfalse.s IL_00f1
IL_00d0: ldloc.s V_5
IL_00d2: callvirt System.String UnityEngine.Object::get_name()
IL_00d7: ldstr "_Equipped"
IL_00dc: callvirt System.Boolean System.String::Contains(System.String)
IL_00e1: brfalse.s IL_00f1
IL_00e3: ldloc.0
IL_00e4: ldloc.s V_5
IL_00e6: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetToolTipFormat(StatusEffect)
IL_00eb: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_00f0: pop
IL_00f1: ldloca.s V_3
IL_00f3: call System.Boolean System.Collections.Generic.List`1/Enumerator<StatusEffect>::MoveNext()
IL_00f8: brtrue.s IL_00b4
IL_00fa: leave.s IL_010a
IL_00fc: ldloca.s V_3
IL_00fe: constrained. System.Collections.Generic.List`1/Enumerator<StatusEffect>
IL_0104: callvirt System.Void System.IDisposable::Dispose()
IL_0109: endfinally
IL_010a: ldloc.2
IL_010b: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<StatusEffect>::GetEnumerator()
IL_0110: stloc.3
IL_0111: br.s IL_0150
IL_0113: ldloca.s V_3
IL_0115: call !0 System.Collections.Generic.List`1/Enumerator<StatusEffect>::get_Current()
IL_011a: stloc.s V_6
IL_011c: ldloc.s V_6
IL_011e: callvirt System.String UnityEngine.Object::get_name()
IL_0123: ldstr "SE_FPO_"
IL_0128: callvirt System.Boolean System.String::StartsWith(System.String)
IL_012d: brfalse.s IL_0150
IL_012f: ldloc.s V_6
IL_0131: callvirt System.String UnityEngine.Object::get_name()
IL_0136: ldstr "_Passive"
IL_013b: callvirt System.Boolean System.String::Contains(System.String)
IL_0140: brfalse.s IL_0150
IL_0142: ldloc.0
IL_0143: ldloc.s V_6
IL_0145: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetToolTipFormat(StatusEffect)
IL_014a: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_014f: pop
IL_0150: ldloca.s V_3
IL_0152: call System.Boolean System.Collections.Generic.List`1/Enumerator<StatusEffect>::MoveNext()
IL_0157: brtrue.s IL_0113
IL_0159: leave.s IL_0169
IL_015b: ldloca.s V_3
IL_015d: constrained. System.Collections.Generic.List`1/Enumerator<StatusEffect>
IL_0163: callvirt System.Void System.IDisposable::Dispose()
IL_0168: endfinally
IL_0169: ldloc.2
IL_016a: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<StatusEffect>::GetEnumerator()
IL_016f: stloc.3
IL_0170: br.s IL_019c
IL_0172: ldloca.s V_3
IL_0174: call !0 System.Collections.Generic.List`1/Enumerator<StatusEffect>::get_Current()
IL_0179: stloc.s V_7
IL_017b: ldloc.s V_7
IL_017d: callvirt System.String UnityEngine.Object::get_name()
IL_0182: ldstr "SE_FPO_"
IL_0187: callvirt System.Boolean System.String::StartsWith(System.String)
IL_018c: brtrue.s IL_019c
IL_018e: ldloc.0
IL_018f: ldloc.s V_7
IL_0191: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetToolTipFormat(StatusEffect)
IL_0196: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_019b: pop
IL_019c: ldloca.s V_3
IL_019e: call System.Boolean System.Collections.Generic.List`1/Enumerator<StatusEffect>::MoveNext()
IL_01a3: brtrue.s IL_0172
IL_01a5: leave.s IL_01b5
IL_01a7: ldloca.s V_3
IL_01a9: constrained. System.Collections.Generic.List`1/Enumerator<StatusEffect>
IL_01af: callvirt System.Void System.IDisposable::Dispose()
IL_01b4: endfinally
IL_01b5: call System.Collections.Generic.List`1<System.String> ForsakenPowerOverhaul.ForsakenPowerOverhaul::GlobalKeys_Sort()
IL_01ba: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_01bf: stloc.s V_8
IL_01c1: br.s IL_01ee
IL_01c3: ldloca.s V_8
IL_01c5: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_01ca: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetBossName(System.String)
IL_01cf: stloc.s V_9
IL_01d1: ldloc.s V_9
IL_01d3: ldstr ""
IL_01d8: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_01dd: brfalse.s IL_01ee
IL_01df: ldloc.1
IL_01e0: ldloc.s V_9
IL_01e2: ldc.i4.0
IL_01e3: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetBossStoneHoverText(System.String,System.Boolean)
IL_01e8: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_01ed: pop
IL_01ee: ldloca.s V_8
IL_01f0: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_01f5: brtrue.s IL_01c3
IL_01f7: leave.s IL_0207
IL_01f9: ldloca.s V_8
IL_01fb: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_0201: callvirt System.Void System.IDisposable::Dispose()
IL_0206: endfinally
IL_0207: ldarg.0
IL_0208: ldind.ref
IL_0209: ldfld System.Collections.Generic.List`1<TextsDialog/TextInfo> TextsDialog::m_texts
IL_020e: ldc.i4.0
IL_020f: callvirt System.Void System.Collections.Generic.List`1<TextsDialog/TextInfo>::RemoveAt(System.Int32)
IL_0214: ldarg.0
IL_0215: ldind.ref
IL_0216: ldfld System.Collections.Generic.List`1<TextsDialog/TextInfo> TextsDialog::m_texts
IL_021b: ldc.i4.0
IL_021c: ldstr "$inventory_activeeffects"
IL_0221: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetLocalization(System.String)
IL_0226: ldloc.0
IL_0227: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetLocalization(System.Text.StringBuilder)
IL_022c: newobj System.Void TextsDialog/TextInfo::.ctor(System.String,System.String)
IL_0231: callvirt System.Void System.Collections.Generic.List`1<TextsDialog/TextInfo>::Insert(System.Int32,!0)
IL_0236: ldarg.0
IL_0237: ldind.ref
IL_0238: ldfld System.Collections.Generic.List`1<TextsDialog/TextInfo> TextsDialog::m_texts
IL_023d: ldc.i4.1
IL_023e: ldstr "$ui_fpo"
IL_0243: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetLocalization(System.String)
IL_0248: ldloc.1
IL_0249: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetLocalization(System.Text.StringBuilder)
IL_024e: newobj System.Void TextsDialog/TextInfo::.ctor(System.String,System.String)
IL_0253: callvirt System.Void System.Collections.Generic.List`1<TextsDialog/TextInfo>::Insert(System.Int32,!0)
IL_0258: ret
// EH Finally: 64 - 157 => 157 - 171
// EH Finally: 178 - 252 => 252 - 266
// EH Finally: 273 - 347 => 347 - 361
// EH Finally: 368 - 423 => 423 - 437
// EH Finally: 449 - 505 => 505 - 519

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/Patch_TextsDialog_AddActiveEffects::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::HaveAttribute(StatusEffect/StatusAttribute)
.locals System.Boolean, System.Collections.Generic.List`1/Enumerator<StatusEffect/StatusAttribute>, StatusEffect/StatusAttribute
IL_0000: ldc.i4.0
IL_0001: stloc.0
IL_0002: ldarg.0
IL_0003: ldfld System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_StatusAttributes
IL_0008: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<StatusEffect/StatusAttribute>::GetEnumerator()
IL_000d: stloc.1
IL_000e: br.s IL_001e
IL_0010: ldloca.s V_1
IL_0012: call !0 System.Collections.Generic.List`1/Enumerator<StatusEffect/StatusAttribute>::get_Current()
IL_0017: stloc.2
IL_0018: ldarg.1
IL_0019: ldloc.2
IL_001a: bne.un.s IL_001e
IL_001c: ldc.i4.1
IL_001d: stloc.0
IL_001e: ldloca.s V_1
IL_0020: call System.Boolean System.Collections.Generic.List`1/Enumerator<StatusEffect/StatusAttribute>::MoveNext()
IL_0025: brtrue.s IL_0010
IL_0027: leave.s IL_0037
IL_0029: ldloca.s V_1
IL_002b: constrained. System.Collections.Generic.List`1/Enumerator<StatusEffect/StatusAttribute>
IL_0031: callvirt System.Void System.IDisposable::Dispose()
IL_0036: endfinally
IL_0037: ldloc.0
IL_0038: ret
// EH Finally: 14 - 41 => 41 - 55

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::ModifyAttack(Skills/SkillType,HitData&)
.locals System.Collections.Generic.List`1/Enumerator<Skills/SkillType>, Skills/SkillType
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_0006: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Skills/SkillType>::GetEnumerator()
IL_000b: stloc.0
IL_000c: br.s IL_004b
IL_000e: ldloca.s V_0
IL_0010: call !0 System.Collections.Generic.List`1/Enumerator<Skills/SkillType>::get_Current()
IL_0015: stloc.1
IL_0016: ldloc.1
IL_0017: ldarg.1
IL_0018: beq.s IL_0022
IL_001a: ldloc.1
IL_001b: ldc.i4 999
IL_0020: bne.un.s IL_004b
IL_0022: ldarg.2
IL_0023: ldind.ref
IL_0024: ldflda HitData/DamageTypes HitData::m_damage
IL_0029: ldc.r4 1
IL_002e: ldarg.0
IL_002f: ldfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_0034: ldarg.0
IL_0035: ldfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_003a: ldloc.1
IL_003b: callvirt System.Int32 System.Collections.Generic.List`1<Skills/SkillType>::IndexOf(!0)
IL_0040: callvirt !0 System.Collections.Generic.List`1<System.Single>::get_Item(System.Int32)
IL_0045: add
IL_0046: call System.Void HitData/DamageTypes::Modify(System.Single)
IL_004b: ldloca.s V_0
IL_004d: call System.Boolean System.Collections.Generic.List`1/Enumerator<Skills/SkillType>::MoveNext()
IL_0052: brtrue.s IL_000e
IL_0054: leave.s IL_0064
IL_0056: ldloca.s V_0
IL_0058: constrained. System.Collections.Generic.List`1/Enumerator<Skills/SkillType>
IL_005e: callvirt System.Void System.IDisposable::Dispose()
IL_0063: endfinally
IL_0064: ret
// EH Finally: 12 - 86 => 86 - 100

// System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::GetTooltipString()
.locals 
IL_0000: ldc.i4 256
IL_0005: newobj System.Void System.Text.StringBuilder::.ctor(System.Int32)
IL_000a: dup
IL_000b: ldarg.0
IL_000c: call System.String ForsakenPowerOverhaul.ForsakenPowerOverhaul::GetTooltipStats(ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO)
IL_0011: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0016: pop
IL_0017: callvirt System.String System.Object::ToString()
IL_001c: ret

// System.Void ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: newobj System.Void System.Collections.Generic.List`1<StatusEffect/StatusAttribute>::.ctor()
IL_0006: stfld System.Collections.Generic.List`1<StatusEffect/StatusAttribute> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_StatusAttributes
IL_000b: ldarg.0
IL_000c: newobj System.Void System.Collections.Generic.List`1<Skills/SkillType>::.ctor()
IL_0011: stfld System.Collections.Generic.List`1<Skills/SkillType> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageTypes
IL_0016: ldarg.0
IL_0017: newobj System.Void System.Collections.Generic.List`1<System.Single>::.ctor()
IL_001c: stfld System.Collections.Generic.List`1<System.Single> ForsakenPowerOverhaul.ForsakenPowerOverhaul/StatusEffect_FPO::m_OutgoingDamageModifiers
IL_0021: ldarg.0
IL_0022: call System.Void SE_Stats::.ctor()
IL_0027: ret

// System.Void System.Runtime.CompilerServices.IgnoresAccessChecksToAttribute::.ctor(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: ret
