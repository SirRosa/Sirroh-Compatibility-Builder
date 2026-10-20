
// System.Void Microsoft.CodeAnalysis.EmbeddedAttribute::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: ret

// System.Void System.Runtime.CompilerServices.NullableAttribute::.ctor(System.Byte)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: ldarg.0
IL_0007: ldc.i4.1
IL_0008: newarr System.Byte
IL_000d: dup
IL_000e: ldc.i4.0
IL_000f: ldarg.1
IL_0010: stelem.i1
IL_0011: stfld System.Byte[] System.Runtime.CompilerServices.NullableAttribute::NullableFlags
IL_0016: ret

// System.Void System.Runtime.CompilerServices.NullableAttribute::.ctor(System.Byte[])
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: ldarg.0
IL_0007: ldarg.1
IL_0008: stfld System.Byte[] System.Runtime.CompilerServices.NullableAttribute::NullableFlags
IL_000d: ret

// System.Void System.Runtime.CompilerServices.NullableContextAttribute::.ctor(System.Byte)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: ldarg.0
IL_0007: ldarg.1
IL_0008: stfld System.Byte System.Runtime.CompilerServices.NullableContextAttribute::Flag
IL_000d: ret

// System.Void System.Runtime.CompilerServices.RefSafetyRulesAttribute::.ctor(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: ldarg.0
IL_0007: ldarg.1
IL_0008: stfld System.Int32 System.Runtime.CompilerServices.RefSafetyRulesAttribute::Version
IL_000d: ret

// System.Void ZenUI.Configs::.cctor()
.locals UnityEngine.Color
IL_0000: ldc.r4 0.376
IL_0005: ldc.r4 0.66
IL_000a: ldc.r4 0.897
IL_000f: ldc.r4 0.761
IL_0014: newobj System.Void UnityEngine.Color::.ctor(System.Single,System.Single,System.Single,System.Single)
IL_0019: call Zen.Lib.UIColor Zen.Lib.UIColor::op_Implicit(UnityEngine.Color)
IL_001e: stsfld Zen.Lib.UIColor ZenUI.Configs::VanillaSelectGridActivatedColorBlue
IL_0023: ldc.r4 0.7574
IL_0028: ldc.r4 0.5042
IL_002d: ldc.r4 0.1838
IL_0032: ldc.r4 1
IL_0037: newobj System.Void UnityEngine.Color::.ctor(System.Single,System.Single,System.Single,System.Single)
IL_003c: call Zen.Lib.UIColor Zen.Lib.UIColor::op_Implicit(UnityEngine.Color)
IL_0041: stsfld Zen.Lib.UIColor ZenUI.Configs::VanillaSelectMenuActivatedColorOrange
IL_0046: ldc.i4.1
IL_0047: ldstr "Notifications"
IL_004c: ldstr "Show Biome Notification"
IL_0051: ldc.i4.7
IL_0052: ldstr "Show the biome notification on key events.  (Vanilla: {0})
Player spawn, After teleport, First discovery"
IL_0057: ldc.i4.4
IL_0058: box ZenUI.BiomeNoticeType
IL_005d: call System.String System.String::Format(System.String,System.Object)
IL_0062: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<ZenUI.BiomeNoticeType>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0067: stsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.BiomeNoticeType> ZenUI.Configs::NoticeShowBiome
IL_006c: ldc.i4.0
IL_006d: ldstr "Notifications"
IL_0072: ldstr "Show Piece Repair Notifications"
IL_0077: ldc.i4.0
IL_0078: ldstr "Show the notifications when a piece is repaired via the hammer. (Vanilla: true)"
IL_007d: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0082: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::NoticeShowPieceRepair
IL_0087: ldc.i4.1
IL_0088: ldstr "General"
IL_008d: ldstr "Hide Status Effects"
IL_0092: newobj System.Void Zen.Lib.Config.StringList::.ctor()
IL_0097: dup
IL_0098: ldstr "$se_windrun_name"
IL_009d: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_00a2: dup
IL_00a3: ldstr "$item_beltstrength"
IL_00a8: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_00ad: dup
IL_00ae: ldstr "$item_demister"
IL_00b3: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_00b8: ldstr "Hide status effect icons from the UI.
Some status effect icons are redundant and noisy and you don't need to see all of them all the time.
Does not change the internal application of the status effect. It just hides the icon from the UI.
Comma separated list of status effect names.  This is usually the translation string name prefixed with $
https://valheim-modding.github.io/Jotunn/data/localization/translations/English.html"
IL_00bd: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<Zen.Lib.Config.StringList>(System.Boolean,System.String,System.String,!!0,System.String)
IL_00c2: stsfld BepInEx.Configuration.ConfigEntry`1<Zen.Lib.Config.StringList> ZenUI.Configs::HideStatusEffects
IL_00c7: ldc.i4.1
IL_00c8: ldstr "General"
IL_00cd: ldstr "Enable Ammo Count"
IL_00d2: ldc.i4.1
IL_00d3: ldstr "When true an icon and count appears on the hotbar with ammo type and count.
[logout required]"
IL_00d8: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_00dd: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::EnableAmmoCount
IL_00e2: ldc.i4.0
IL_00e3: ldstr "General"
IL_00e8: ldstr "Auto Open Skills Panel"
IL_00ed: ldc.i4.0
IL_00ee: ldstr "Automatically open the skills panel when the inventory is opened. (vanilla: false)
[logout required]"
IL_00f3: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_00f8: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::AutoOpenSkillsPanel
IL_00fd: ldc.i4.1
IL_00fe: ldstr "General"
IL_0103: ldstr "No Slide Animation"
IL_0108: ldc.i4.1
IL_0109: ldstr "Disable the panel slide animation when opening/closing your inventory. (vanilla: false)
Disabled by default because it draws faster without the sliding animation, and looks better imo.
On slower hardware the slide animation can appear a bit choppy every time you open/close your inventory.
[logout may be required for changes to take effect]"
IL_010e: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0113: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::NoSlideAnimation
IL_0118: ldc.i4.0
IL_0119: ldstr "General"
IL_011e: ldstr "Colored Food Bars"
IL_0123: ldc.i4.1
IL_0124: ldstr "Colored food bars. (vanilla: false)
Tint the background of the food you ate based on the main property of the food: Health = red, stamina = yellow, blue = eitr"
IL_0129: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_012e: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::ColoredFoodBars
IL_0133: ldc.i4.1
IL_0134: ldstr "General"
IL_0139: ldstr "Colored Food By Simple Majority"
IL_013e: ldc.i4.1
IL_013f: ldstr "Color the food by a simple majority of whichever type is largest: health, stamina, eitr
Vanilla uses a system of majortiy over half which can be misleading when the food type values are close together.
[Vanilla: false]"
IL_0144: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0149: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::ColoredFoodBySimpleMajority
IL_014e: ldc.i4.0
IL_014f: ldstr "General"
IL_0154: ldstr "Colored Piece Health Bar"
IL_0159: ldc.i4.1
IL_015a: ldstr "Show the piece health bar as a color gradient: Green > Yellow > Red
(Vanilla: false)"
IL_015f: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0164: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::ShowPieceHealthColor
IL_0169: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::ShowPieceHealthColor
IL_016e: ldsfld ZenUI.Configs/<>c ZenUI.Configs/<>c::<>9
IL_0173: ldftn System.Void ZenUI.Configs/<>c::<.cctor>b__67_0(System.Object,System.EventArgs)
IL_0179: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_017e: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<System.Boolean>::add_SettingChanged(System.EventHandler)
IL_0183: ldc.i4.1
IL_0184: ldstr "General"
IL_0189: ldstr "Chat Force Case"
IL_018e: ldc.i4.0
IL_018f: ldstr "When enabled forces all shouts to be uppercase and all whispers to be lowercase. (vanilla: true)
When disabled displays the text as it was written."
IL_0194: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0199: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::ChatForceCase
IL_019e: ldc.i4.1
IL_019f: ldstr "General"
IL_01a4: ldstr "Show Ship HP"
IL_01a9: ldc.i4.1
IL_01aa: ldstr "The Captain always sees the ship's HP bar next to the wheel.
NOTE: If you are using ZenCombat with DamageText visibility reduced then this is helpful to have enabled."
IL_01af: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_01b4: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::ShowShipHP
IL_01b9: ldc.i4.0
IL_01ba: ldstr "General"
IL_01bf: ldstr "Show Ship Sail Indicator"
IL_01c4: ldc.i4.0
IL_01c5: ldstr "Show the ship sail indicator.
If this is disabled the rudder icon will still display."
IL_01ca: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_01cf: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::ShowShipSailIndicator
IL_01d4: ldc.i4.0
IL_01d5: ldstr "General"
IL_01da: ldstr "Show System Clock"
IL_01df: ldc.i4.2
IL_01e0: ldstr "Show the system clock local time in the bottom right corner so you don't stay up all night or miss an important meeting.
By default it displays only when you open the system menu (press esc / gamepad start button), you can change it to always display or never display."
IL_01e5: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<ZenUI.Section.SystemClock/DisplayMode>(System.Boolean,System.String,System.String,!!0,System.String)
IL_01ea: stsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.Section.SystemClock/DisplayMode> ZenUI.Configs::ShowSystemClock
IL_01ef: ldc.i4.1
IL_01f0: ldstr "General"
IL_01f5: ldstr "Thin Scroll Bars"
IL_01fa: ldc.i4.1
IL_01fb: ldstr "Use subtle scrollbars to cleanup the UI on the Build Menu and Containers so that they are more visually pleasing.
Nothing major, just a little bit of refinement to make it look better.  No functional changes.
[logout required for changes to take effect]"
IL_0200: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0205: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::ThinScrollBars
IL_020a: ldc.i4.1
IL_020b: ldstr "General"
IL_0210: ldstr "Rescale Container Grid"
IL_0215: ldc.i4.1
IL_0216: ldstr "Rescale the container grid to fit the contents of the Grausten Chest and Wardrobe so that no scrollbar is needed.
["
IL_021b: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::NoSlideAnimation
IL_0220: callvirt BepInEx.Configuration.ConfigDefinition BepInEx.Configuration.ConfigEntryBase::get_Definition()
IL_0225: callvirt System.String BepInEx.Configuration.ConfigDefinition::get_Key()
IL_022a: ldstr " must be true for this to work]
[logout required for changes to take effect]"
IL_022f: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0234: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0239: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::RescaleContainerGrid
IL_023e: ldc.i4.1
IL_023f: ldstr "Camera"
IL_0244: ldstr "First Person Camera"
IL_0249: ldc.i4.1
IL_024a: ldstr "Set the mode for first person camera to be enabled.
(Vanilla: Disabled)"
IL_024f: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<ZenUI.FirstPersonMode>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0254: stsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.FirstPersonMode> ZenUI.Configs::CameraFirstPerson
IL_0259: ldsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.FirstPersonMode> ZenUI.Configs::CameraFirstPerson
IL_025e: ldsfld ZenUI.Configs/<>c ZenUI.Configs/<>c::<>9
IL_0263: ldftn System.Void ZenUI.Configs/<>c::<.cctor>b__67_1(System.Object,System.EventArgs)
IL_0269: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_026e: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<ZenUI.FirstPersonMode>::add_SettingChanged(System.EventHandler)
IL_0273: ldc.i4.0
IL_0274: ldstr "Camera"
IL_0279: ldstr "Zoom Reposition Ship Controls"
IL_027e: ldc.i4.2
IL_027f: ldstr "Set the zoom level that will trigger repositioning the ship controls to the edge of the screen."
IL_0284: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<ZenUI.RepositionShipControls>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0289: stsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.RepositionShipControls> ZenUI.Configs::CameraZoomRepositionShipControls
IL_028e: ldc.i4.1
IL_028f: ldstr "Camera"
IL_0294: ldstr "Remove Lens Dirt"
IL_0299: ldc.i4.1
IL_029a: ldstr "Remove the lens dirt from the camera.
[logout for changes to take effect]"
IL_029f: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_02a4: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CameraRemoveLensDirt
IL_02a9: ldc.i4.0
IL_02aa: ldstr "Camera"
IL_02af: ldstr "LOD Bias"
IL_02b4: ldc.i4.5
IL_02b5: ldc.i4.0
IL_02b6: ldc.i4.s 10
IL_02b8: call BepInEx.Configuration.AcceptableValueRange`1<!!0> Zen.Lib.Config.Config::AcceptRange<System.Int32>(!!0,!!0)
IL_02bd: ldstr "Set the LOD Bias for the camera on startup. (Vanilla: 2) (Vanilla max: 5)
Higher values render objects farther away.  Lower this if you have a slow computer.
Set to 0 to disable this config and use vanilla or other mods to set this value instead."
IL_02c2: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Int32>(System.Boolean,System.String,System.String,!!0,BepInEx.Configuration.AcceptableValueRange`1<!!0>,System.String)
IL_02c7: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ZenUI.Configs::CameraLodBias
IL_02cc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ZenUI.Configs::CameraLodBias
IL_02d1: ldsfld ZenUI.Configs/<>c ZenUI.Configs/<>c::<>9
IL_02d6: ldftn System.Void ZenUI.Configs/<>c::<.cctor>b__67_2(System.Object,System.EventArgs)
IL_02dc: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_02e1: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<System.Int32>::add_SettingChanged(System.EventHandler)
IL_02e6: ldc.i4.0
IL_02e7: ldstr "Tooltips"
IL_02ec: ldstr "Show Title Font Norse"
IL_02f1: ldc.i4.1
IL_02f2: ldstr "Style the title font with Norse Bold to match the rest of the UI.
[game restart required for changes to take effect]"
IL_02f7: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_02fc: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::TooltipShowTitleNorse
IL_0301: ldc.i4.0
IL_0302: ldstr "Tooltips"
IL_0307: ldstr "Display Delay"
IL_030c: ldc.i4.m1
IL_030d: ldc.i4.m1
IL_030e: ldc.i4.s 10
IL_0310: call BepInEx.Configuration.AcceptableValueRange`1<!!0> Zen.Lib.Config.Config::AcceptRange<System.Int32>(!!0,!!0)
IL_0315: ldstr "How long of a delay before the tooltip should appear? (Vanilla: 5)
Lower numbers are faster. 0 is instant.
Set to -1 to disable this config."
IL_031a: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Int32>(System.Boolean,System.String,System.String,!!0,BepInEx.Configuration.AcceptableValueRange`1<!!0>,System.String)
IL_031f: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ZenUI.Configs::TooltipDelay
IL_0324: ldc.i4.0
IL_0325: ldstr "Tooltips"
IL_032a: ldstr "Show Details Key"
IL_032f: ldc.i4 308
IL_0334: ldstr "Hide the visual clutter for item tooltips behind a keypress.
Most of the time you do not need to see the full details with every mouse hover.
Full details are shown when this key is held down.
Gamepad: This is always Button-Y and can not be changed."
IL_0339: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<UnityEngine.KeyCode>(System.Boolean,System.String,System.String,!!0,System.String)
IL_033e: stsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.KeyCode> ZenUI.Configs::TooltipDetailKey
IL_0343: ldc.i4.0
IL_0344: ldstr "Tooltips"
IL_0349: ldstr "Show Details Key Hint"
IL_034e: ldc.i4.1
IL_034f: ldstr "Show or hide the "
IL_0354: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.KeyCode> ZenUI.Configs::TooltipDetailKey
IL_0359: callvirt BepInEx.Configuration.ConfigDefinition BepInEx.Configuration.ConfigEntryBase::get_Definition()
IL_035e: callvirt System.String BepInEx.Configuration.ConfigDefinition::get_Key()
IL_0363: ldstr " hint on the lower right portion of the tooltip."
IL_0368: call System.String System.String::Concat(System.String,System.String,System.String)
IL_036d: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0372: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::TooltipShowHint
IL_0377: ldc.i4.0
IL_0378: ldstr "Tooltips"
IL_037d: ldstr "Display Style"
IL_0382: ldc.i4.1
IL_0383: ldstr "Most of the time you are already familiar with what an item is after viewing it a few times.
Too much information can clutter the UI and make it hard to find important information.
Most of the time you only need to know the summary info at a glance:
- {0}: Only essential text and total stack weight. No extra numbers or icons.
- {1}: All of {2} plus additional icons for attack, defense, magic, food, etc.
- {3}: Full data with every hover. Vanilla's raw data dump.
You can switch to {4} at any time by holding the {5}.
(Vanilla: {6})"
IL_0388: ldc.i4.7
IL_0389: newarr System.Object
IL_038e: dup
IL_038f: ldc.i4.0
IL_0390: ldc.i4.0
IL_0391: box ZenUI.TooltipStyle
IL_0396: stelem.ref
IL_0397: dup
IL_0398: ldc.i4.1
IL_0399: ldc.i4.1
IL_039a: box ZenUI.TooltipStyle
IL_039f: stelem.ref
IL_03a0: dup
IL_03a1: ldc.i4.2
IL_03a2: ldc.i4.0
IL_03a3: box ZenUI.TooltipStyle
IL_03a8: stelem.ref
IL_03a9: dup
IL_03aa: ldc.i4.3
IL_03ab: ldc.i4.2
IL_03ac: box ZenUI.TooltipStyle
IL_03b1: stelem.ref
IL_03b2: dup
IL_03b3: ldc.i4.4
IL_03b4: ldc.i4.2
IL_03b5: box ZenUI.TooltipStyle
IL_03ba: stelem.ref
IL_03bb: dup
IL_03bc: ldc.i4.5
IL_03bd: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.KeyCode> ZenUI.Configs::TooltipDetailKey
IL_03c2: callvirt BepInEx.Configuration.ConfigDefinition BepInEx.Configuration.ConfigEntryBase::get_Definition()
IL_03c7: callvirt System.String BepInEx.Configuration.ConfigDefinition::get_Key()
IL_03cc: stelem.ref
IL_03cd: dup
IL_03ce: ldc.i4.6
IL_03cf: ldc.i4.2
IL_03d0: box ZenUI.TooltipStyle
IL_03d5: stelem.ref
IL_03d6: call System.String System.String::Format(System.String,System.Object[])
IL_03db: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<ZenUI.TooltipStyle>(System.Boolean,System.String,System.String,!!0,System.String)
IL_03e0: stsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.TooltipStyle> ZenUI.Configs::TooltipDisplayMode
IL_03e5: ldc.i4.0
IL_03e6: ldstr "Inventory"
IL_03eb: ldstr "Enable Take Stacks"
IL_03f0: ldc.i4.1
IL_03f1: ldstr "When enabled the Take All button changes behavior to three states instead of one. (Vanilla: false)
The state changes based on the condition of the inventory:
- Take stacks: Unfilled stacks in the player's inventory are filled (example: refill ammo). (ignores weight).
- Take weight: If there are no stacks that can be filled, the button will take items up to max weight.
- Take all: Press again, items are moved to inventory via vanilla behavior (ignores weight)."
IL_03f6: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_03fb: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::EnableTakeStacks
IL_0400: ldc.i4.0
IL_0401: ldstr "Inventory"
IL_0406: ldstr "Drop Style"
IL_040b: ldc.i4.1
IL_040c: ldstr "When dropping items on the ground throw them towards the camera instead of
the vanilla method of chucking them in the direction the character is facing"
IL_0411: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<ZenUI.Section.InventoryRules/DropStyle>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0416: stsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.Section.InventoryRules/DropStyle> ZenUI.Configs::DiscardStyle
IL_041b: ldc.i4.0
IL_041c: ldstr "Inventory"
IL_0421: ldstr "Use From Smallest Stack First"
IL_0426: ldc.i4.1
IL_0427: ldstr "When items are automatically removed from your inventory, such as when fueling a fireplace or crafting,
always draw from the smallest stacks first"
IL_042c: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0431: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::RemoveItemFromSmallestStack
IL_0436: ldc.i4.0
IL_0437: ldstr "Inventory"
IL_043c: ldstr "Stacking - Combine Existing"
IL_0441: ldc.i4.1
IL_0442: ldstr "When stacking items into a container the existing items are combined into as few slots as possible. (Vanilla: false)"
IL_0447: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_044c: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::StackingCombineExisting
IL_0451: ldc.i4.0
IL_0452: ldstr "Inventory"
IL_0457: ldstr "Stacking - Exclude Hotbar"
IL_045c: ldc.i4.1
IL_045d: ldstr "When stacking items into a container any items on the hotbar are skipped. (Vanilla: false)"
IL_0462: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0467: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::StackingExcludeHotbar
IL_046c: ldc.i4.0
IL_046d: ldstr "Inventory"
IL_0472: ldstr "Stacking - Exclude Equipable"
IL_0477: ldc.i4.1
IL_0478: ldstr "When stacking items into a container any equipable items are skipped. (Vanilla: false)"
IL_047d: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0482: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::StackingExcludeEquipable
IL_0487: ldc.i4.0
IL_0488: ldstr "Inventory"
IL_048d: ldstr "Show Full Stack Colored"
IL_0492: ldc.i4.1
IL_0493: ldstr "Show full stacks as a different colored text"
IL_0498: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_049d: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::ItemStackColorApply
IL_04a2: ldc.i4.0
IL_04a3: ldstr "Inventory"
IL_04a8: ldstr "Show Full Stack Style"
IL_04ad: ldc.i4.1
IL_04ae: ldc.i4.5
IL_04af: newarr System.String
IL_04b4: dup
IL_04b5: ldc.i4.0
IL_04b6: ldstr "How should full stacks be displayed?
- Vanilla: X/Y
- HideMaxWhenFull: X only when full, otherwise X/Y
- HideMaxAlways: X only
You can also press "
IL_04bb: stelem.ref
IL_04bc: dup
IL_04bd: ldc.i4.1
IL_04be: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.KeyCode> ZenUI.Configs::TooltipDetailKey
IL_04c3: callvirt BepInEx.Configuration.ConfigDefinition BepInEx.Configuration.ConfigEntryBase::get_Definition()
IL_04c8: callvirt System.String BepInEx.Configuration.ConfigDefinition::get_Section()
IL_04cd: stelem.ref
IL_04ce: dup
IL_04cf: ldc.i4.2
IL_04d0: ldstr "."
IL_04d5: stelem.ref
IL_04d6: dup
IL_04d7: ldc.i4.3
IL_04d8: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.KeyCode> ZenUI.Configs::TooltipDetailKey
IL_04dd: callvirt BepInEx.Configuration.ConfigDefinition BepInEx.Configuration.ConfigEntryBase::get_Definition()
IL_04e2: callvirt System.String BepInEx.Configuration.ConfigDefinition::get_Key()
IL_04e7: stelem.ref
IL_04e8: dup
IL_04e9: ldc.i4.4
IL_04ea: ldstr " to view the full stack."
IL_04ef: stelem.ref
IL_04f0: call System.String System.String::Concat(System.String[])
IL_04f5: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<ZenUI.Section.InventoryStackAmountText/FormatStyle>(System.Boolean,System.String,System.String,!!0,System.String)
IL_04fa: stsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.Section.InventoryStackAmountText/FormatStyle> ZenUI.Configs::ItemStackFormatStyle
IL_04ff: ldc.i4.0
IL_0500: ldstr "Inventory"
IL_0505: ldstr "Show Durability Bar Colors"
IL_050a: ldc.i4.1
IL_050b: ldstr "Show item durability bars with colors based on the durability level"
IL_0510: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0515: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::DurabilityColorApply
IL_051a: ldc.i4.1
IL_051b: ldstr "Inventory"
IL_0520: ldstr "Inventory Rows Default"
IL_0525: ldc.i4.m1
IL_0526: ldc.i4.m1
IL_0527: ldc.i4.6
IL_0528: call BepInEx.Configuration.AcceptableValueRange`1<!!0> Zen.Lib.Config.Config::AcceptRange<System.Int32>(!!0,!!0)
IL_052d: ldstr "CAUTION: This applies to all players on the server when installed on the server and client.
Number of inventory rows that a player starts the game with.
Set to -1 to disable this config. (Vanilla: 3 + hotbar)
There are merchant items you can buy to expand your inventory size through progression.
This setting has no effect if the player key "invrows" is already set.
You must remove it before login or this config will not work: "removekeyplayer invrows num"
Vanilla also has a console command to adjust size locally: inventorysize
Server admin can adjust other player's keys via the "relay" command in Zen.ModLib
[logout required for changes to take effect]"
IL_0532: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Int32>(System.Boolean,System.String,System.String,!!0,BepInEx.Configuration.AcceptableValueRange`1<!!0>,System.String)
IL_0537: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ZenUI.Configs::InventoryRowsDefault
IL_053c: ldc.i4.0
IL_053d: ldstr "Inventory Equip"
IL_0542: ldstr "Assigned Gear Slots"
IL_0547: ldc.i4.1
IL_0548: ldstr "When gear is equipped it always moves to the same pre-configured slot (Vanilla: false)"
IL_054d: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0552: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::AssignedGearSlots
IL_0557: ldstr "Inventory Equip"
IL_055c: call System.Void ZenUI.Section.InventoryEquip::InitConfigs(System.String)
IL_0561: ldc.i4.0
IL_0562: ldstr "Item Colors"
IL_0567: ldstr "Activated Color"
IL_056c: ldsfld Zen.Lib.UIColor ZenUI.Configs::VanillaSelectMenuActivatedColorOrange
IL_0571: call UnityEngine.Color Zen.Lib.UIColor::op_Implicit(Zen.Lib.UIColor)
IL_0576: ldstr "Background color when the item is activated (equipped / selected)
Vanilla blue color: {0}
Vanilla orange color: {1}"
IL_057b: ldsfld Zen.Lib.UIColor ZenUI.Configs::VanillaSelectGridActivatedColorBlue
IL_0580: ldsfld Zen.Lib.UIColor ZenUI.Configs::VanillaSelectMenuActivatedColorOrange
IL_0585: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_058a: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<UnityEngine.Color>(System.Boolean,System.String,System.String,!!0,System.String)
IL_058f: stsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::ItemActivatedColor
IL_0594: ldc.i4.0
IL_0595: ldstr "Item Colors"
IL_059a: ldstr "Activated Color - Hotbar"
IL_059f: ldc.r4 0.35
IL_05a4: ldc.r4 0.35
IL_05a9: ldc.r4 0.35
IL_05ae: ldc.r4 0.55
IL_05b3: newobj System.Void UnityEngine.Color::.ctor(System.Single,System.Single,System.Single,System.Single)
IL_05b8: ldstr "Background color when the item is activated on the hotbar.
Vanilla blue color: {0}
Vanilla orange color: {1}"
IL_05bd: ldsfld Zen.Lib.UIColor ZenUI.Configs::VanillaSelectGridActivatedColorBlue
IL_05c2: ldsfld Zen.Lib.UIColor ZenUI.Configs::VanillaSelectMenuActivatedColorOrange
IL_05c7: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_05cc: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<UnityEngine.Color>(System.Boolean,System.String,System.String,!!0,System.String)
IL_05d1: stsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::ItemActivatedHotbarColor
IL_05d6: ldc.i4.0
IL_05d7: ldstr "Item Colors"
IL_05dc: ldstr "Item Stack Color - Full"
IL_05e1: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::ValheimYellow
IL_05e6: ldfld UnityEngine.Color Zen.Lib.UIColor::Color
IL_05eb: ldstr "The color of the item stack when the item stack is full. (vanilla: white)"
IL_05f0: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<UnityEngine.Color>(System.Boolean,System.String,System.String,!!0,System.String)
IL_05f5: stsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::ItemStackColorFull
IL_05fa: ldc.i4.0
IL_05fb: ldstr "Item Colors"
IL_0600: ldstr "Item Stack Color - Partial"
IL_0605: ldc.i4 221
IL_060a: ldc.i4 221
IL_060f: ldc.i4 221
IL_0614: ldc.i4 255
IL_0619: newobj System.Void UnityEngine.Color32::.ctor(System.Byte,System.Byte,System.Byte,System.Byte)
IL_061e: call UnityEngine.Color UnityEngine.Color32::op_Implicit(UnityEngine.Color32)
IL_0623: ldstr "The color of the item stack when the item stack is incomplete. (vanilla: white)"
IL_0628: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<UnityEngine.Color>(System.Boolean,System.String,System.String,!!0,System.String)
IL_062d: stsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::ItemStackColorPartial
IL_0632: ldc.i4.0
IL_0633: ldstr "Item Colors"
IL_0638: ldstr "Durability 1 - Good"
IL_063d: call UnityEngine.Color UnityEngine.Color::get_green()
IL_0642: stloc.0
IL_0643: ldloca.s V_0
IL_0645: ldc.r4 0.2
IL_064a: stfld System.Single UnityEngine.Color::a
IL_064f: ldloc.0
IL_0650: ldstr "Durability bar color when durability is good"
IL_0655: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<UnityEngine.Color>(System.Boolean,System.String,System.String,!!0,System.String)
IL_065a: stsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::DurabilityGood
IL_065f: ldc.i4.0
IL_0660: ldstr "Item Colors"
IL_0665: ldstr "Durability 2 - Worn"
IL_066a: call UnityEngine.Color UnityEngine.Color::get_yellow()
IL_066f: stloc.0
IL_0670: ldloca.s V_0
IL_0672: ldc.r4 0.5
IL_0677: stfld System.Single UnityEngine.Color::a
IL_067c: ldloc.0
IL_067d: ldstr "Durability bar color when durability is worn"
IL_0682: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<UnityEngine.Color>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0687: stsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::DurabilityWorn
IL_068c: ldc.i4.0
IL_068d: ldstr "Item Colors"
IL_0692: ldstr "Durability 3 - At Risk"
IL_0697: call UnityEngine.Color UnityEngine.Color::get_red()
IL_069c: stloc.0
IL_069d: ldloca.s V_0
IL_069f: ldc.r4 0.7
IL_06a4: stfld System.Single UnityEngine.Color::a
IL_06a9: ldloc.0
IL_06aa: ldstr "Durability bar color when durability is at risk of breaking"
IL_06af: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<UnityEngine.Color>(System.Boolean,System.String,System.String,!!0,System.String)
IL_06b4: stsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::DurabilityAtRisk
IL_06b9: ldc.i4.0
IL_06ba: ldstr "Item Colors"
IL_06bf: ldstr "Durability 4 - Broken"
IL_06c4: call UnityEngine.Color UnityEngine.Color::get_gray()
IL_06c9: ldstr "Durability bar color when item is broken"
IL_06ce: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<UnityEngine.Color>(System.Boolean,System.String,System.String,!!0,System.String)
IL_06d3: stsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::DurabilityBroken
IL_06d8: ldc.i4.0
IL_06d9: ldstr "Item Colors"
IL_06de: ldstr "Symbol Color"
IL_06e3: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::LightYellow
IL_06e8: ldfld UnityEngine.Color Zen.Lib.UIColor::Color
IL_06ed: stloc.0
IL_06ee: ldloca.s V_0
IL_06f0: ldc.r4 0.6
IL_06f5: stfld System.Single UnityEngine.Color::a
IL_06fa: ldloc.0
IL_06fb: ldstr "Color of the item quality symbols"
IL_0700: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<UnityEngine.Color>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0705: stsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::ItemQualitySymbolColor
IL_070a: ldc.i4.1
IL_070b: ldstr "Item Quality Symbols"
IL_0710: ldstr "Show Quality As Symbols"
IL_0715: ldc.i4.1
IL_0716: ldstr "Item quality is shown as symbols instead of numbers on the inventory grid."
IL_071b: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0720: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::ShowQualityAsSymbols
IL_0725: ldc.i4.1
IL_0726: ldstr "Item Quality Symbols"
IL_072b: ldstr "Rotate Symbols 90 Degrees"
IL_0730: ldc.i4.0
IL_0731: ldstr "The quality symbols are rotated 90 degrees to display them vertically instead of horizontally. This is only used if Show Quality As Symbols is enabled."
IL_0736: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_073b: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::Rotate90Degrees
IL_0740: ldc.i4.1
IL_0741: ldstr "Item Quality Symbols"
IL_0746: ldstr "Extra Level Symbols"
IL_074b: ldstr "★"
IL_0750: ldstr "The sequence of symbols used to display the quality level. The first symbol is always the dots and can not be changed.
Each symbol adds 4 levels. Preconfigured with 1 symobl so 8 levels supported: Vanilla 4 + 1 symbol x 4 more levels.
So if you wanted to add 8 more levels for a total of 12 levels (4 + 8), you would add 2 more symbols to the end of the sequence.
Here are some extra symbols you can try.  Not all unicode works, These are known to work: ★✽◈⚡▲
Example: ★▲ would be 4 vanilla levels + 4 more levels for ★ + 4 more levels for ▲
NOTE: If your item level exceeds this value it will be displayed as a number instead of a symbol."
IL_0755: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.String>(System.Boolean,System.String,System.String,!!0,System.String)
IL_075a: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> ZenUI.Configs::ExtraQualityLevelSym
IL_075f: ldc.i4.0
IL_0760: ldstr "Crafting Panel"
IL_0765: ldstr "Enable Panel"
IL_076a: ldc.i4.1
IL_076b: ldstr "Replace the vanilla crafting panel with a visual icon style with sorting and grouping. (vanilla: false)
[logout required for changes to take effect]"
IL_0770: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0775: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelEnabled
IL_077a: ldc.i4.0
IL_077b: ldstr "Crafting Panel"
IL_0780: ldstr "Tooltip - Show Hover Item"
IL_0785: ldc.i4.1
IL_0786: ldstr "When using a mouse enable tooltips when hovering over an item in the crafting panel grid."
IL_078b: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0790: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelTooltipHover
IL_0795: ldc.i4.0
IL_0796: ldstr "Crafting Panel"
IL_079b: ldstr "Tooltip - Show Requirements"
IL_07a0: ldc.i4.1
IL_07a1: ldstr "Enable full tooltips on the item requirements. (vanilla: false)
[logout required for changes to take effect]"
IL_07a6: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_07ab: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelTooltipReq
IL_07b0: ldc.i4.0
IL_07b1: ldstr "Crafting Panel"
IL_07b6: ldstr "Sort Craftable Together"
IL_07bb: ldc.i4.1
IL_07bc: ldstr "Show all craftable items together sorted to the top of the list.
[close/open your UI for changes to take effect]"
IL_07c1: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_07c6: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelSortCraftable
IL_07cb: ldc.i4.0
IL_07cc: ldstr "Crafting Panel"
IL_07d1: ldstr "Hide Uncraftable Variants"
IL_07d6: ldc.i4.1
IL_07d7: ldstr "Enabled: Variants will only be shown when the item can be crafted. This reduces clutter by hiding variants for items that can not be crafted.
Disabled: Variants will always be shown, even if the item can not be crafted."
IL_07dc: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_07e1: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelHideUncraftableVariants
IL_07e6: ldc.i4.1
IL_07e7: ldstr "Crafting Panel"
IL_07ec: ldstr "Show Any Known Station"
IL_07f1: ldc.i4.1
IL_07f2: ldstr "When not at a crafting station show all known items from any known station.
This lets you easily recall the recipe of an item which aids in locating the resources.
If you have ZenSign installed then you can middle-click the recipe ingredient and find the
resources in nearby containers.
NOTE: You can not craft the item without being at the correct station.
The required station is displayed at the top of the panel."
IL_07f7: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_07fc: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelShowAnyKnownStation
IL_0801: ldc.i4.0
IL_0802: ldstr "Crafting Panel"
IL_0807: ldstr "Untouched Item Indicator"
IL_080c: ldc.i4.1
IL_080d: ldstr "Show an indicator on the items that you have never crafted or held in your inventory.
[close/open your UI for changes to take effect]"
IL_0812: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0817: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelUntouchedItemIndicator
IL_081c: ldc.i4.0
IL_081d: ldstr "Crafting Panel"
IL_0822: ldstr "Untouched Item Indicator Color"
IL_0827: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::ValheimTooltipTitle
IL_082c: ldfld UnityEngine.Color Zen.Lib.UIColor::Color
IL_0831: ldstr "Set the color for "
IL_0836: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelUntouchedItemIndicator
IL_083b: callvirt BepInEx.Configuration.ConfigDefinition BepInEx.Configuration.ConfigEntryBase::get_Definition()
IL_0840: callvirt System.String BepInEx.Configuration.ConfigDefinition::get_Key()
IL_0845: ldstr "
[close/open your UI for changes to take effect]"
IL_084a: call System.String System.String::Concat(System.String,System.String,System.String)
IL_084f: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<UnityEngine.Color>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0854: stsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::CraftPanelUntouchedItemIndicatorColor
IL_0859: ldc.i4.0
IL_085a: ldstr "Crafting Panel"
IL_085f: ldstr "Adjust Info Position"
IL_0864: call UnityEngine.Vector2 UnityEngine.Vector2::get_zero()
IL_0869: ldstr "Item info position offset. Positive X is right, positive Y is up.
Use this to compensate for mods that add extra long tooltip information.
[logout required for changes to take effect]"
IL_086e: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<UnityEngine.Vector2>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0873: stsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Vector2> ZenUI.Configs::CraftPanelInfoPosition
IL_0878: ldc.i4.0
IL_0879: ldstr "Crafting Panel"
IL_087e: ldstr "Uncraftable Brightness"
IL_0883: ldc.r4 0
IL_0888: ldc.r4 0
IL_088d: ldc.r4 1
IL_0892: call BepInEx.Configuration.AcceptableValueRange`1<!!0> Zen.Lib.Config.Config::AcceptRange<System.Single>(!!0,!!0)
IL_0897: ldstr "Uncraftable items are displayed with this level of brightness.
When set to 0 then black & white is used instead of the item color."
IL_089c: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Single>(System.Boolean,System.String,System.String,!!0,BepInEx.Configuration.AcceptableValueRange`1<!!0>,System.String)
IL_08a1: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ZenUI.Configs::CraftPanelUncraftableBrightness
IL_08a6: ldc.i4.0
IL_08a7: ldstr "Crafting Panel"
IL_08ac: ldstr "Uncraftable Symbol"
IL_08b1: ldstr "X"
IL_08b6: ldstr "Display this symbol over items that can not be crafted
Some people have different visual distinction prefernces."
IL_08bb: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.String>(System.Boolean,System.String,System.String,!!0,System.String)
IL_08c0: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> ZenUI.Configs::CraftPanelUncraftableSymbol
IL_08c5: ldc.i4.0
IL_08c6: ldstr "Crafting Panel"
IL_08cb: ldstr "Uncraftable Symbol Color"
IL_08d0: ldc.r4 0.667
IL_08d5: ldc.r4 0.2
IL_08da: ldc.r4 0
IL_08df: ldc.r4 0.8
IL_08e4: newobj System.Void UnityEngine.Color::.ctor(System.Single,System.Single,System.Single,System.Single)
IL_08e9: ldstr "The color of the symbol over uncraftable items."
IL_08ee: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<UnityEngine.Color>(System.Boolean,System.String,System.String,!!0,System.String)
IL_08f3: stsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::CraftPanelUncraftableSymbolColor
IL_08f8: ldc.i4.0
IL_08f9: ldstr "Crafting Panel"
IL_08fe: ldstr "Uncraftable Symbol Position"
IL_0903: ldc.i4.0
IL_0904: ldstr "Position of the uncraftable symbol."
IL_0909: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<ZenUI.UncraftableSymbolPosition>(System.Boolean,System.String,System.String,!!0,System.String)
IL_090e: stsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.UncraftableSymbolPosition> ZenUI.Configs::CraftPanelUncraftableSymbolPosition
IL_0913: ldc.i4.0
IL_0914: ldstr "Crafting Panel"
IL_0919: ldstr "Scroll Sensitivity"
IL_091e: ldc.r4 1
IL_0923: ldc.r4 0.01
IL_0928: ldc.r4 5
IL_092d: call BepInEx.Configuration.AcceptableValueRange`1<!!0> Zen.Lib.Config.Config::AcceptRange<System.Single>(!!0,!!0)
IL_0932: ldstr "Scroll wheel sensitivity in the crafting panel.
[logout required for changes to take effect]"
IL_0937: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Single>(System.Boolean,System.String,System.String,!!0,BepInEx.Configuration.AcceptableValueRange`1<!!0>,System.String)
IL_093c: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ZenUI.Configs::CraftPanelScrollSensitivity
IL_0941: ldc.i4.0
IL_0942: ldstr "Crafting Panel - Search"
IL_0947: ldstr "Enable"
IL_094c: ldc.i4.1
IL_094d: ldstr "Enable the crafting panel search filter text box, does not function without panel enabled.
[logout required for changes to take effect]"
IL_0952: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0957: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelSearch
IL_095c: ldc.i4.0
IL_095d: ldstr "Crafting Panel - Search"
IL_0962: ldstr "Adjust Position"
IL_0967: call UnityEngine.Vector2 UnityEngine.Vector2::get_zero()
IL_096c: ldstr "Adjust the search filter's text box position. Positive X is right, positive Y is up."
IL_0971: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<UnityEngine.Vector2>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0976: stsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Vector2> ZenUI.Configs::CraftPanelSearchPosition
IL_097b: ldc.i4.0
IL_097c: ldstr "Crafting Panel - Search"
IL_0981: ldstr "Search Resource Requirements"
IL_0986: ldc.i4.1
IL_0987: ldstr "When searching the crafting panel, also search the recipe's resource requirements for matching items."
IL_098c: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_0991: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelSearchResources
IL_0996: ldc.i4.0
IL_0997: ldstr "Crafting Panel - Search"
IL_099c: ldstr "Search Armor Sets"
IL_09a1: ldc.i4.1
IL_09a2: ldstr "When searching the crafting panel, also search the gear set names for matching items."
IL_09a7: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<System.Boolean>(System.Boolean,System.String,System.String,!!0,System.String)
IL_09ac: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelSearchArmorSets
IL_09b1: call System.Void ZenUI.Section.CraftingPanel::InitExplicitGroupConfigs()
IL_09b6: ret

// System.Void ZenUI.Configs/<>c::.cctor()
.locals 
IL_0000: newobj System.Void ZenUI.Configs/<>c::.ctor()
IL_0005: stsfld ZenUI.Configs/<>c ZenUI.Configs/<>c::<>9
IL_000a: ret

// System.Void ZenUI.Configs/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void ZenUI.Configs/<>c::<.cctor>b__67_0(System.Object,System.EventArgs)
.locals 
IL_0000: call System.Void ZenUI.Section.PieceHealthColor::ResetColor()
IL_0005: ret

// System.Void ZenUI.Configs/<>c::<.cctor>b__67_1(System.Object,System.EventArgs)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.FirstPersonMode> ZenUI.Configs::CameraFirstPerson
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<ZenUI.FirstPersonMode>::get_Value()
IL_000a: call System.Void ZenUI.Section.CameraRules::SetFirstPersonMode(ZenUI.FirstPersonMode)
IL_000f: ret

// System.Void ZenUI.Configs/<>c::<.cctor>b__67_2(System.Object,System.EventArgs)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ZenUI.Configs::CameraLodBias
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_000a: conv.r4
IL_000b: call System.Void ZenUI.Section.CameraRules::SetLodBias(System.Single)
IL_0010: ret

// System.Void ZenUI.Plugin::Setup()
.locals 
IL_0000: call System.Void ZenUI.Section.ItemIcon::Setup()
IL_0005: ret

// System.Void ZenUI.Plugin::TitleScene(System.Boolean)
.locals 
IL_0000: ret

// System.Void ZenUI.Plugin::WorldStart()
.locals 
IL_0000: call System.Void ZenUI.Section.CameraRules::RemoveDirt()
IL_0005: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ZenUI.Configs::CameraLodBias
IL_000a: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_000f: conv.r4
IL_0010: call System.Void ZenUI.Section.CameraRules::SetLodBias(System.Single)
IL_0015: call System.Void ZenUI.Section.TooltipFormat::ApplyTooltipFormatDefaults()
IL_001a: call System.Void ZenUI.Section.ShipHud::Init()
IL_001f: call System.Void ZenUI.Section.SystemClock::Init()
IL_0024: call System.Void ZenUI.Section.AmmoCountIcon::Init()
IL_0029: ret

// System.Void ZenUI.Plugin::HotRestore()
.locals 
IL_0000: call System.Void ZenUI.Section.ApplyThinScrollBars::Game_Start()
IL_0005: call System.Void ZenUI.Section.CraftingPanel::Game_Start()
IL_000a: call System.Void ZenUI.Section.CraftingPanelSearch::Game_Start()
IL_000f: call System.Void ZenUI.Section.FoodPanel::Game_Start()
IL_0014: ret

// System.Void ZenUI.Plugin::Shutdown()
.locals 
IL_0000: call System.Void ZenUI.Section.CraftingPanel::Shutdown()
IL_0005: call System.Void ZenUI.Section.CraftingPanelSearch::Shutdown()
IL_000a: call System.Void ZenUI.Section.SystemClock::Shutdown()
IL_000f: ret

// System.Void ZenUI.Plugin::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void Zen.Lib.ZenMod`1<ZenUI.Plugin>::.ctor()
IL_0006: ret

// System.Void ZenUI.Section.AmmoCountIcon::.cctor()
.locals 
IL_0000: ldc.r4 0
IL_0005: ldc.r4 86
IL_000a: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_000f: stsfld UnityEngine.Vector2 ZenUI.Section.AmmoCountIcon::AmmoCountPosition
IL_0014: ldc.r4 0
IL_0019: ldc.r4 40
IL_001e: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_0023: stsfld UnityEngine.Vector2 ZenUI.Section.AmmoCountIcon::AmmoIconPosition
IL_0028: ldc.r4 -10
IL_002d: ldc.r4 -10
IL_0032: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_0037: stsfld UnityEngine.Vector2 ZenUI.Section.AmmoCountIcon::AmmoIconSize
IL_003c: newobj System.Void System.Collections.Generic.Dictionary`2<HotkeyBar,System.Collections.Generic.Dictionary`2<HotkeyBar/ElementData,ZenUI.Section.AmmoCountIcon/ElementExtraData>>::.ctor()
IL_0041: stsfld System.Collections.Generic.Dictionary`2<HotkeyBar,System.Collections.Generic.Dictionary`2<HotkeyBar/ElementData,ZenUI.Section.AmmoCountIcon/ElementExtraData>> ZenUI.Section.AmmoCountIcon::ElementExtraDatas
IL_0046: ldnull
IL_0047: ldftn System.Void ZenUI.Section.AmmoCountIcon::HotkeyBarClear(HotkeyBar)
IL_004d: newobj System.Void System.Action`1<HotkeyBar>::.ctor(System.Object,System.IntPtr)
IL_0052: call System.Void Zen.Lib.Events.HotkeyBarUI::add_ClearElements(System.Action`1<HotkeyBar>)
IL_0057: ldnull
IL_0058: ldftn System.Void ZenUI.Section.AmmoCountIcon::UpdateAmmoAndIcon(HotkeyBar,HotkeyBar/ElementData,ItemDrop/ItemData)
IL_005e: newobj System.Void System.Action`3<HotkeyBar,HotkeyBar/ElementData,ItemDrop/ItemData>::.ctor(System.Object,System.IntPtr)
IL_0063: call System.Void Zen.Lib.Events.HotkeyBarUI::add_UpdateElement(System.Action`3<HotkeyBar,HotkeyBar/ElementData,ItemDrop/ItemData>)
IL_0068: ret

// System.Void ZenUI.Section.AmmoCountIcon::Init()
.locals 
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<HotkeyBar,System.Collections.Generic.Dictionary`2<HotkeyBar/ElementData,ZenUI.Section.AmmoCountIcon/ElementExtraData>> ZenUI.Section.AmmoCountIcon::ElementExtraDatas
IL_0005: callvirt System.Void System.Collections.Generic.Dictionary`2<HotkeyBar,System.Collections.Generic.Dictionary`2<HotkeyBar/ElementData,ZenUI.Section.AmmoCountIcon/ElementExtraData>>::Clear()
IL_000a: ret

// System.Void ZenUI.Section.AmmoCountIcon::AddCustomElementsToHotkeyPrefab(HotkeyBar)
.locals UnityEngine.GameObject, System.Int32, UnityEngine.GameObject, UnityEngine.GameObject, UnityEngine.GameObject
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::EnableAmmoCount
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: ldstr "Adding Custom Elements"
IL_0012: ldc.i4.0
IL_0013: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_0018: ldarg.0
IL_0019: ldfld UnityEngine.GameObject HotkeyBar::m_elementPrefab
IL_001e: stloc.0
IL_001f: ldloc.0
IL_0020: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0025: brtrue.s IL_0032
IL_0027: ldstr "HotkeyBar.m_elementPrefab is null, this should never happen"
IL_002c: newobj System.Void System.NullReferenceException::.ctor(System.String)
IL_0031: throw
IL_0032: ldloc.0
IL_0033: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0038: ldstr "icon"
IL_003d: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0042: callvirt System.Int32 UnityEngine.Transform::GetSiblingIndex()
IL_0047: ldc.i4.1
IL_0048: add
IL_0049: stloc.1
IL_004a: ldloc.0
IL_004b: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0050: ldstr "ZenUI_AmmoAmount"
IL_0055: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_005a: dup
IL_005b: brtrue.s IL_0061
IL_005d: pop
IL_005e: ldnull
IL_005f: br.s IL_0066
IL_0061: call UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0066: stloc.2
IL_0067: ldloc.2
IL_0068: ldnull
IL_0069: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_006e: brfalse.s IL_00d0
IL_0070: ldloc.0
IL_0071: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0076: ldstr "amount"
IL_007b: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0080: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0085: dup
IL_0086: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0)
IL_008b: stloc.2
IL_008c: ldloc.2
IL_008d: ldstr "ZenUI_AmmoAmount"
IL_0092: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_0097: ldloc.2
IL_0098: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_009d: ldloc.1
IL_009e: callvirt System.Void UnityEngine.Transform::SetSiblingIndex(System.Int32)
IL_00a3: ldloc.2
IL_00a4: ldc.i4.0
IL_00a5: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_00aa: ldloc.2
IL_00ab: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_00b0: ldloc.0
IL_00b1: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_00b6: ldc.i4.0
IL_00b7: callvirt System.Void UnityEngine.Transform::SetParent(UnityEngine.Transform,System.Boolean)
IL_00bc: ldloc.1
IL_00bd: ldc.i4.1
IL_00be: add
IL_00bf: stloc.1
IL_00c0: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_00c5: ldloc.2
IL_00c6: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_00cb: call System.Void ZenUI.Section.AmmoCountIcon::<AddCustomElementsToHotkeyPrefab>g__FillFields|12_0(UnityEngine.Transform,UnityEngine.Transform)
IL_00d0: ldloc.0
IL_00d1: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_00d6: ldstr "ZenUI_AmmoIcon"
IL_00db: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_00e0: dup
IL_00e1: brtrue.s IL_00e7
IL_00e3: pop
IL_00e4: ldnull
IL_00e5: br.s IL_00ec
IL_00e7: call UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_00ec: stloc.3
IL_00ed: ldloc.3
IL_00ee: ldnull
IL_00ef: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_00f4: brfalse.s IL_0155
IL_00f6: ldloc.0
IL_00f7: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_00fc: ldstr "icon"
IL_0101: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0106: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_010b: dup
IL_010c: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0)
IL_0111: stloc.3
IL_0112: ldloc.3
IL_0113: ldstr "ZenUI_AmmoIcon"
IL_0118: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_011d: ldloc.3
IL_011e: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0123: ldloc.1
IL_0124: callvirt System.Void UnityEngine.Transform::SetSiblingIndex(System.Int32)
IL_0129: ldloc.3
IL_012a: ldc.i4.0
IL_012b: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0130: ldloc.3
IL_0131: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0136: ldloc.0
IL_0137: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_013c: callvirt System.Void UnityEngine.Transform::SetParent(UnityEngine.Transform)
IL_0141: ldloc.1
IL_0142: ldc.i4.1
IL_0143: add
IL_0144: stloc.1
IL_0145: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_014a: ldloc.3
IL_014b: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0150: call System.Void ZenUI.Section.AmmoCountIcon::<AddCustomElementsToHotkeyPrefab>g__FillFields|12_0(UnityEngine.Transform,UnityEngine.Transform)
IL_0155: ldloc.0
IL_0156: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_015b: ldstr "ZenUI_AmmoBait"
IL_0160: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0165: dup
IL_0166: brtrue.s IL_016c
IL_0168: pop
IL_0169: ldnull
IL_016a: br.s IL_0171
IL_016c: call UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0171: stloc.s V_4
IL_0173: ldloc.s V_4
IL_0175: ldnull
IL_0176: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_017b: brfalse.s IL_01de
IL_017d: ldloc.0
IL_017e: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0183: ldstr "icon"
IL_0188: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_018d: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0192: dup
IL_0193: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0)
IL_0198: stloc.s V_4
IL_019a: ldloc.s V_4
IL_019c: ldstr "ZenUI_AmmoBait"
IL_01a1: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_01a6: ldloc.s V_4
IL_01a8: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_01ad: ldloc.1
IL_01ae: callvirt System.Void UnityEngine.Transform::SetSiblingIndex(System.Int32)
IL_01b3: ldloc.s V_4
IL_01b5: ldc.i4.0
IL_01b6: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_01bb: ldloc.s V_4
IL_01bd: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_01c2: ldloc.0
IL_01c3: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_01c8: callvirt System.Void UnityEngine.Transform::SetParent(UnityEngine.Transform)
IL_01cd: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_01d2: ldloc.s V_4
IL_01d4: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_01d9: call System.Void ZenUI.Section.AmmoCountIcon::<AddCustomElementsToHotkeyPrefab>g__FillFields|12_0(UnityEngine.Transform,UnityEngine.Transform)
IL_01de: ldloc.2
IL_01df: ldloc.3
IL_01e0: ldloc.s V_4
IL_01e2: call System.Void ZenUI.Section.AmmoCountIcon::<AddCustomElementsToHotkeyPrefab>g__SetupVisibility|12_1(UnityEngine.GameObject,UnityEngine.GameObject,UnityEngine.GameObject)
IL_01e7: ldstr "Added custom elements to hotkey bar"
IL_01ec: ldc.i4.0
IL_01ed: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_01f2: ret

// System.Collections.Generic.Dictionary`2<HotkeyBar/ElementData,ZenUI.Section.AmmoCountIcon/ElementExtraData> ZenUI.Section.AmmoCountIcon::GetElementExtras(HotkeyBar)
.locals System.Collections.Generic.Dictionary`2<HotkeyBar/ElementData,ZenUI.Section.AmmoCountIcon/ElementExtraData>, System.Collections.Generic.Dictionary`2<HotkeyBar/ElementData,ZenUI.Section.AmmoCountIcon/ElementExtraData>
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<HotkeyBar,System.Collections.Generic.Dictionary`2<HotkeyBar/ElementData,ZenUI.Section.AmmoCountIcon/ElementExtraData>> ZenUI.Section.AmmoCountIcon::ElementExtraDatas
IL_0005: ldarg.0
IL_0006: ldloca.s V_0
IL_0008: callvirt System.Boolean System.Collections.Generic.Dictionary`2<HotkeyBar,System.Collections.Generic.Dictionary`2<HotkeyBar/ElementData,ZenUI.Section.AmmoCountIcon/ElementExtraData>>::TryGetValue(!0,!1&)
IL_000d: brtrue.s IL_0023
IL_000f: ldsfld System.Collections.Generic.Dictionary`2<HotkeyBar,System.Collections.Generic.Dictionary`2<HotkeyBar/ElementData,ZenUI.Section.AmmoCountIcon/ElementExtraData>> ZenUI.Section.AmmoCountIcon::ElementExtraDatas
IL_0014: ldarg.0
IL_0015: newobj System.Void System.Collections.Generic.Dictionary`2<HotkeyBar/ElementData,ZenUI.Section.AmmoCountIcon/ElementExtraData>::.ctor()
IL_001a: dup
IL_001b: stloc.1
IL_001c: callvirt System.Void System.Collections.Generic.Dictionary`2<HotkeyBar,System.Collections.Generic.Dictionary`2<HotkeyBar/ElementData,ZenUI.Section.AmmoCountIcon/ElementExtraData>>::set_Item(!0,!1)
IL_0021: ldloc.1
IL_0022: stloc.0
IL_0023: ldloc.0
IL_0024: ret

// System.Void ZenUI.Section.AmmoCountIcon::HotkeyBarClear(HotkeyBar)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Collections.Generic.Dictionary`2<HotkeyBar/ElementData,ZenUI.Section.AmmoCountIcon/ElementExtraData> ZenUI.Section.AmmoCountIcon::GetElementExtras(HotkeyBar)
IL_0006: callvirt System.Void System.Collections.Generic.Dictionary`2<HotkeyBar/ElementData,ZenUI.Section.AmmoCountIcon/ElementExtraData>::Clear()
IL_000b: ret

// System.Void ZenUI.Section.AmmoCountIcon::UpdateAmmoAndIcon(HotkeyBar,HotkeyBar/ElementData,ItemDrop/ItemData)
.locals System.Collections.Generic.Dictionary`2<HotkeyBar/ElementData,ZenUI.Section.AmmoCountIcon/ElementExtraData>, ZenUI.Section.AmmoCountIcon/ElementExtraData
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::EnableAmmoCount
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: ldarg.0
IL_000e: call System.Collections.Generic.Dictionary`2<HotkeyBar/ElementData,ZenUI.Section.AmmoCountIcon/ElementExtraData> ZenUI.Section.AmmoCountIcon::GetElementExtras(HotkeyBar)
IL_0013: stloc.0
IL_0014: ldloc.0
IL_0015: ldarg.1
IL_0016: ldloca.s V_1
IL_0018: callvirt System.Boolean System.Collections.Generic.Dictionary`2<HotkeyBar/ElementData,ZenUI.Section.AmmoCountIcon/ElementExtraData>::TryGetValue(!0,!1&)
IL_001d: brtrue.s IL_007b
IL_001f: ldarg.1
IL_0020: ldfld UnityEngine.GameObject HotkeyBar/ElementData::m_go
IL_0025: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_002a: ldstr "ZenUI_AmmoAmount"
IL_002f: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0034: callvirt !!0 UnityEngine.Component::GetComponent<TMPro.TMP_Text>()
IL_0039: ldarg.1
IL_003a: ldfld UnityEngine.GameObject HotkeyBar/ElementData::m_go
IL_003f: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0044: ldstr "ZenUI_AmmoIcon"
IL_0049: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_004e: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.UI.Image>()
IL_0053: ldarg.1
IL_0054: ldfld UnityEngine.GameObject HotkeyBar/ElementData::m_go
IL_0059: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_005e: ldstr "ZenUI_AmmoBait"
IL_0063: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0068: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.UI.Image>()
IL_006d: newobj System.Void ZenUI.Section.AmmoCountIcon/ElementExtraData::.ctor(TMPro.TMP_Text,UnityEngine.UI.Image,UnityEngine.UI.Image)
IL_0072: stloc.1
IL_0073: ldloc.0
IL_0074: ldarg.1
IL_0075: ldloc.1
IL_0076: callvirt System.Void System.Collections.Generic.Dictionary`2<HotkeyBar/ElementData,ZenUI.Section.AmmoCountIcon/ElementExtraData>::set_Item(!0,!1)
IL_007b: ldarg.1
IL_007c: ldfld System.Boolean HotkeyBar/ElementData::m_used
IL_0081: brfalse.s IL_0086
IL_0083: ldarg.2
IL_0084: brtrue.s IL_008f
IL_0086: ldloc.1
IL_0087: ldnull
IL_0088: stfld ItemDrop/ItemData ZenUI.Section.AmmoCountIcon/ElementExtraData::Item
IL_008d: br.s IL_00b5
IL_008f: ldloc.1
IL_0090: ldarg.2
IL_0091: stfld ItemDrop/ItemData ZenUI.Section.AmmoCountIcon/ElementExtraData::Item
IL_0096: ldarg.2
IL_0097: callvirt UnityEngine.Sprite ItemDrop/ItemData::GetIcon()
IL_009c: ldarg.1
IL_009d: ldfld UnityEngine.UI.Image HotkeyBar/ElementData::m_icon
IL_00a2: callvirt UnityEngine.Sprite UnityEngine.UI.Image::get_sprite()
IL_00a7: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_00ac: brfalse.s IL_00b5
IL_00ae: ldloc.1
IL_00af: ldnull
IL_00b0: stfld ItemDrop/ItemData ZenUI.Section.AmmoCountIcon/ElementExtraData::Item
IL_00b5: ldloc.1
IL_00b6: ldarg.1
IL_00b7: callvirt System.Void ZenUI.Section.AmmoCountIcon/ElementExtraData::UpdateState(HotkeyBar/ElementData)
IL_00bc: ret

// System.Void ZenUI.Section.AmmoCountIcon::HotkeyBar_OnEnable(HotkeyBar)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::EnableAmmoCount
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse.s IL_0012
IL_000c: ldarg.0
IL_000d: call System.Void ZenUI.Section.AmmoCountIcon::AddCustomElementsToHotkeyPrefab(HotkeyBar)
IL_0012: ret

// System.Void ZenUI.Section.AmmoCountIcon::<AddCustomElementsToHotkeyPrefab>g__FillFields|12_0(UnityEngine.Transform,UnityEngine.Transform)
.locals UnityEngine.RectTransform
IL_0000: ldarg.0
IL_0001: castclass UnityEngine.RectTransform
IL_0006: stloc.0
IL_0007: ldarg.1
IL_0008: castclass UnityEngine.RectTransform
IL_000d: dup
IL_000e: ldloc.0
IL_000f: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_anchoredPosition()
IL_0014: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_0019: ldloc.0
IL_001a: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_sizeDelta()
IL_001f: callvirt System.Void UnityEngine.RectTransform::set_sizeDelta(UnityEngine.Vector2)
IL_0024: ret

// System.Void ZenUI.Section.AmmoCountIcon::<AddCustomElementsToHotkeyPrefab>g__SetupVisibility|12_1(UnityEngine.GameObject,UnityEngine.GameObject,UnityEngine.GameObject)
.locals 
IL_0000: ldarg.0
IL_0001: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0006: castclass UnityEngine.RectTransform
IL_000b: ldsfld UnityEngine.Vector2 ZenUI.Section.AmmoCountIcon::AmmoCountPosition
IL_0010: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_0015: ldarg.0
IL_0016: callvirt !!0 UnityEngine.GameObject::GetComponent<TMPro.TMP_Text>()
IL_001b: dup
IL_001c: ldc.r4 14
IL_0021: callvirt System.Void TMPro.TMP_Text::set_fontSize(System.Single)
IL_0026: ldc.i4.2
IL_0027: callvirt System.Void TMPro.TMP_Text::set_horizontalAlignment(TMPro.HorizontalAlignmentOptions)
IL_002c: ldarg.1
IL_002d: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0032: castclass UnityEngine.RectTransform
IL_0037: dup
IL_0038: ldsfld UnityEngine.Vector2 ZenUI.Section.AmmoCountIcon::AmmoIconPosition
IL_003d: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_0042: ldsfld UnityEngine.Vector2 ZenUI.Section.AmmoCountIcon::AmmoIconSize
IL_0047: callvirt System.Void UnityEngine.RectTransform::set_sizeDelta(UnityEngine.Vector2)
IL_004c: ldarg.2
IL_004d: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0052: castclass UnityEngine.RectTransform
IL_0057: dup
IL_0058: ldc.r4 0.5
IL_005d: ldc.r4 0
IL_0062: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_0067: callvirt System.Void UnityEngine.RectTransform::set_anchorMin(UnityEngine.Vector2)
IL_006c: ldc.r4 1
IL_0071: ldc.r4 0.5
IL_0076: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_007b: callvirt System.Void UnityEngine.RectTransform::set_anchorMax(UnityEngine.Vector2)
IL_0080: ret

// System.Void ZenUI.Section.AmmoCountIcon/ElementExtraData::.ctor(TMPro.TMP_Text,UnityEngine.UI.Image,UnityEngine.UI.Image)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld TMPro.TMP_Text ZenUI.Section.AmmoCountIcon/ElementExtraData::<ammoText>P
IL_0007: ldarg.0
IL_0008: ldarg.2
IL_0009: stfld UnityEngine.UI.Image ZenUI.Section.AmmoCountIcon/ElementExtraData::<ammoIcon>P
IL_000e: ldarg.0
IL_000f: ldarg.3
IL_0010: stfld UnityEngine.UI.Image ZenUI.Section.AmmoCountIcon/ElementExtraData::<baitIcon>P
IL_0015: ldarg.0
IL_0016: call System.Void System.Object::.ctor()
IL_001b: ret

// System.Void ZenUI.Section.AmmoCountIcon/ElementExtraData::ShowAmmo(System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld TMPro.TMP_Text ZenUI.Section.AmmoCountIcon/ElementExtraData::<ammoText>P
IL_0006: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_000b: callvirt System.Boolean UnityEngine.GameObject::get_activeSelf()
IL_0010: ldarg.1
IL_0011: beq.s IL_0024
IL_0013: ldarg.0
IL_0014: ldfld TMPro.TMP_Text ZenUI.Section.AmmoCountIcon/ElementExtraData::<ammoText>P
IL_0019: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_001e: ldarg.1
IL_001f: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0024: ldarg.0
IL_0025: ldfld UnityEngine.UI.Image ZenUI.Section.AmmoCountIcon/ElementExtraData::<ammoIcon>P
IL_002a: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_002f: callvirt System.Boolean UnityEngine.GameObject::get_activeSelf()
IL_0034: ldarg.1
IL_0035: beq.s IL_0048
IL_0037: ldarg.0
IL_0038: ldfld UnityEngine.UI.Image ZenUI.Section.AmmoCountIcon/ElementExtraData::<ammoIcon>P
IL_003d: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0042: ldarg.1
IL_0043: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0048: ret

// System.Void ZenUI.Section.AmmoCountIcon/ElementExtraData::ShowBait(System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld UnityEngine.UI.Image ZenUI.Section.AmmoCountIcon/ElementExtraData::<baitIcon>P
IL_0006: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_000b: callvirt System.Boolean UnityEngine.GameObject::get_activeSelf()
IL_0010: ldarg.1
IL_0011: beq.s IL_0024
IL_0013: ldarg.0
IL_0014: ldfld UnityEngine.UI.Image ZenUI.Section.AmmoCountIcon/ElementExtraData::<baitIcon>P
IL_0019: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_001e: ldarg.1
IL_001f: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0024: ret

// System.Void ZenUI.Section.AmmoCountIcon/ElementExtraData::UpdateState(HotkeyBar/ElementData)
.locals ItemDrop/ItemData, UnityEngine.Sprite, ItemDrop/ItemData, UnityEngine.Sprite, System.Int32, System.Int32
IL_0000: ldarg.0
IL_0001: ldfld ItemDrop/ItemData ZenUI.Section.AmmoCountIcon/ElementExtraData::Item
IL_0006: brfalse.s IL_0014
IL_0008: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::EnableAmmoCount
IL_000d: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0012: brtrue.s IL_0023
IL_0014: ldarg.0
IL_0015: ldc.i4.0
IL_0016: call System.Void ZenUI.Section.AmmoCountIcon/ElementExtraData::ShowAmmo(System.Boolean)
IL_001b: ldarg.0
IL_001c: ldc.i4.0
IL_001d: call System.Void ZenUI.Section.AmmoCountIcon/ElementExtraData::ShowBait(System.Boolean)
IL_0022: ret
IL_0023: ldarg.0
IL_0024: call ItemDrop/ItemData ZenUI.Section.AmmoCountIcon/ElementExtraData::GetCurrentAmmo()
IL_0029: stloc.0
IL_002a: ldloc.0
IL_002b: brtrue.s IL_0030
IL_002d: ldnull
IL_002e: br.s IL_0036
IL_0030: ldloc.0
IL_0031: call UnityEngine.Sprite ItemDrop/ItemData::GetIcon()
IL_0036: stloc.1
IL_0037: ldloc.1
IL_0038: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_003d: brfalse.s IL_00ab
IL_003f: ldloc.0
IL_0040: brfalse.s IL_0060
IL_0042: ldsfld Player Player::m_localPlayer
IL_0047: callvirt Inventory Humanoid::GetInventory()
IL_004c: ldloc.0
IL_004d: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0052: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_0057: ldc.i4.m1
IL_0058: ldc.i4.1
IL_0059: callvirt System.Int32 Inventory::CountItems(System.String,System.Int32,System.Boolean)
IL_005e: br.s IL_0061
IL_0060: ldc.i4.0
IL_0061: stloc.s V_4
IL_0063: ldloc.s V_4
IL_0065: ldc.i4.0
IL_0066: ble.s IL_00a2
IL_0068: ldarg.0
IL_0069: ldc.i4.1
IL_006a: call System.Void ZenUI.Section.AmmoCountIcon/ElementExtraData::ShowAmmo(System.Boolean)
IL_006f: ldarg.0
IL_0070: ldfld TMPro.TMP_Text ZenUI.Section.AmmoCountIcon/ElementExtraData::<ammoText>P
IL_0075: ldloca.s V_4
IL_0077: call System.String System.Int32::ToString()
IL_007c: callvirt System.Void TMPro.TMP_Text::SetText(System.String)
IL_0081: ldarg.0
IL_0082: ldfld UnityEngine.UI.Image ZenUI.Section.AmmoCountIcon/ElementExtraData::<ammoIcon>P
IL_0087: callvirt UnityEngine.Sprite UnityEngine.UI.Image::get_overrideSprite()
IL_008c: ldloc.1
IL_008d: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0092: brfalse.s IL_00b2
IL_0094: ldarg.0
IL_0095: ldfld UnityEngine.UI.Image ZenUI.Section.AmmoCountIcon/ElementExtraData::<ammoIcon>P
IL_009a: ldloc.1
IL_009b: callvirt System.Void UnityEngine.UI.Image::set_overrideSprite(UnityEngine.Sprite)
IL_00a0: br.s IL_00b2
IL_00a2: ldarg.0
IL_00a3: ldc.i4.0
IL_00a4: call System.Void ZenUI.Section.AmmoCountIcon/ElementExtraData::ShowAmmo(System.Boolean)
IL_00a9: br.s IL_00b2
IL_00ab: ldarg.0
IL_00ac: ldc.i4.0
IL_00ad: call System.Void ZenUI.Section.AmmoCountIcon/ElementExtraData::ShowAmmo(System.Boolean)
IL_00b2: ldarg.0
IL_00b3: call ItemDrop/ItemData ZenUI.Section.AmmoCountIcon/ElementExtraData::GetCurrentBait()
IL_00b8: stloc.2
IL_00b9: ldloc.2
IL_00ba: brtrue.s IL_00bf
IL_00bc: ldnull
IL_00bd: br.s IL_00c5
IL_00bf: ldloc.2
IL_00c0: call UnityEngine.Sprite ItemDrop/ItemData::GetIcon()
IL_00c5: stloc.3
IL_00c6: ldloc.3
IL_00c7: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_00cc: brfalse IL_017a
IL_00d1: ldarg.0
IL_00d2: ldc.i4.1
IL_00d3: call System.Void ZenUI.Section.AmmoCountIcon/ElementExtraData::ShowBait(System.Boolean)
IL_00d8: ldarg.0
IL_00d9: ldfld UnityEngine.UI.Image ZenUI.Section.AmmoCountIcon/ElementExtraData::<baitIcon>P
IL_00de: callvirt UnityEngine.Sprite UnityEngine.UI.Image::get_overrideSprite()
IL_00e3: ldloc.3
IL_00e4: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_00e9: brfalse.s IL_00f7
IL_00eb: ldarg.0
IL_00ec: ldfld UnityEngine.UI.Image ZenUI.Section.AmmoCountIcon/ElementExtraData::<baitIcon>P
IL_00f1: ldloc.3
IL_00f2: callvirt System.Void UnityEngine.UI.Image::set_overrideSprite(UnityEngine.Sprite)
IL_00f7: ldloc.2
IL_00f8: brtrue.s IL_00fd
IL_00fa: ldc.i4.0
IL_00fb: br.s IL_0119
IL_00fd: ldsfld Player Player::m_localPlayer
IL_0102: callvirt Inventory Humanoid::GetInventory()
IL_0107: ldloc.2
IL_0108: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_010d: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_0112: ldc.i4.m1
IL_0113: ldc.i4.1
IL_0114: callvirt System.Int32 Inventory::CountItems(System.String,System.Int32,System.Boolean)
IL_0119: stloc.s V_5
IL_011b: ldloc.s V_5
IL_011d: ldc.i4.0
IL_011e: ble.s IL_0156
IL_0120: ldarg.1
IL_0121: ldfld TMPro.TMP_Text HotkeyBar/ElementData::m_amount
IL_0126: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_012b: callvirt System.Boolean UnityEngine.GameObject::get_activeSelf()
IL_0130: brtrue.s IL_0143
IL_0132: ldarg.1
IL_0133: ldfld TMPro.TMP_Text HotkeyBar/ElementData::m_amount
IL_0138: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_013d: ldc.i4.1
IL_013e: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0143: ldarg.1
IL_0144: ldfld TMPro.TMP_Text HotkeyBar/ElementData::m_amount
IL_0149: ldloca.s V_5
IL_014b: call System.String System.Int32::ToString()
IL_0150: callvirt System.Void TMPro.TMP_Text::SetText(System.String)
IL_0155: ret
IL_0156: ldarg.1
IL_0157: ldfld TMPro.TMP_Text HotkeyBar/ElementData::m_amount
IL_015c: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0161: callvirt System.Boolean UnityEngine.GameObject::get_activeSelf()
IL_0166: brfalse.s IL_0181
IL_0168: ldarg.1
IL_0169: ldfld TMPro.TMP_Text HotkeyBar/ElementData::m_amount
IL_016e: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0173: ldc.i4.0
IL_0174: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0179: ret
IL_017a: ldarg.0
IL_017b: ldc.i4.0
IL_017c: call System.Void ZenUI.Section.AmmoCountIcon/ElementExtraData::ShowBait(System.Boolean)
IL_0181: ret

// ItemDrop/ItemData ZenUI.Section.AmmoCountIcon/ElementExtraData::GetCurrentAmmo()
.locals ItemDrop/ItemData
IL_0000: ldsfld Player Player::m_localPlayer
IL_0005: call System.Boolean Zen.Lib.PlayerExt::IsReady(Player)
IL_000a: brtrue.s IL_000e
IL_000c: ldnull
IL_000d: ret
IL_000e: ldarg.0
IL_000f: ldfld ItemDrop/ItemData ZenUI.Section.AmmoCountIcon/ElementExtraData::Item
IL_0014: brfalse.s IL_003d
IL_0016: ldarg.0
IL_0017: ldfld ItemDrop/ItemData ZenUI.Section.AmmoCountIcon/ElementExtraData::Item
IL_001c: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0021: ldfld System.String ItemDrop/ItemData/SharedData::m_ammoType
IL_0026: call System.Boolean BepInEx.Utility::IsNullOrWhiteSpace(System.String)
IL_002b: brtrue.s IL_003d
IL_002d: ldarg.0
IL_002e: call System.Boolean ZenUI.Section.AmmoCountIcon/ElementExtraData::IsBaitAmmo()
IL_0033: brtrue.s IL_003d
IL_0035: ldarg.0
IL_0036: call System.Boolean ZenUI.Section.AmmoCountIcon/ElementExtraData::IsAmmo()
IL_003b: brfalse.s IL_003f
IL_003d: ldnull
IL_003e: ret
IL_003f: ldsfld Player Player::m_localPlayer
IL_0044: callvirt ItemDrop/ItemData Humanoid::GetAmmoItem()
IL_0049: stloc.0
IL_004a: ldloc.0
IL_004b: brfalse.s IL_0081
IL_004d: ldloc.0
IL_004e: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0053: ldfld System.String ItemDrop/ItemData/SharedData::m_ammoType
IL_0058: ldarg.0
IL_0059: ldfld ItemDrop/ItemData ZenUI.Section.AmmoCountIcon/ElementExtraData::Item
IL_005e: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0063: ldfld System.String ItemDrop/ItemData/SharedData::m_ammoType
IL_0068: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_006d: brtrue.s IL_0081
IL_006f: ldsfld Player Player::m_localPlayer
IL_0074: callvirt Inventory Humanoid::GetInventory()
IL_0079: ldloc.0
IL_007a: callvirt System.Boolean Inventory::ContainsItem(ItemDrop/ItemData)
IL_007f: brtrue.s IL_00a2
IL_0081: ldsfld Player Player::m_localPlayer
IL_0086: callvirt Inventory Humanoid::GetInventory()
IL_008b: ldarg.0
IL_008c: ldfld ItemDrop/ItemData ZenUI.Section.AmmoCountIcon/ElementExtraData::Item
IL_0091: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0096: ldfld System.String ItemDrop/ItemData/SharedData::m_ammoType
IL_009b: ldnull
IL_009c: callvirt ItemDrop/ItemData Inventory::GetAmmoItem(System.String,System.String)
IL_00a1: stloc.0
IL_00a2: ldloc.0
IL_00a3: ret

// ItemDrop/ItemData ZenUI.Section.AmmoCountIcon/ElementExtraData::GetCurrentBait()
.locals ItemDrop/ItemData
IL_0000: ldarg.0
IL_0001: ldfld ItemDrop/ItemData ZenUI.Section.AmmoCountIcon/ElementExtraData::Item
IL_0006: brfalse.s IL_002f
IL_0008: ldarg.0
IL_0009: ldfld ItemDrop/ItemData ZenUI.Section.AmmoCountIcon/ElementExtraData::Item
IL_000e: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0013: ldfld System.String ItemDrop/ItemData/SharedData::m_ammoType
IL_0018: call System.Boolean BepInEx.Utility::IsNullOrWhiteSpace(System.String)
IL_001d: brtrue.s IL_002f
IL_001f: ldarg.0
IL_0020: call System.Boolean ZenUI.Section.AmmoCountIcon/ElementExtraData::IsBaitAmmo()
IL_0025: brfalse.s IL_002f
IL_0027: ldarg.0
IL_0028: call System.Boolean ZenUI.Section.AmmoCountIcon/ElementExtraData::IsAmmo()
IL_002d: brfalse.s IL_0031
IL_002f: ldnull
IL_0030: ret
IL_0031: ldsfld Player Player::m_localPlayer
IL_0036: callvirt ItemDrop/ItemData Humanoid::GetAmmoItem()
IL_003b: stloc.0
IL_003c: ldloc.0
IL_003d: brfalse.s IL_0073
IL_003f: ldloc.0
IL_0040: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0045: ldfld System.String ItemDrop/ItemData/SharedData::m_ammoType
IL_004a: ldarg.0
IL_004b: ldfld ItemDrop/ItemData ZenUI.Section.AmmoCountIcon/ElementExtraData::Item
IL_0050: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0055: ldfld System.String ItemDrop/ItemData/SharedData::m_ammoType
IL_005a: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_005f: brtrue.s IL_0073
IL_0061: ldsfld Player Player::m_localPlayer
IL_0066: callvirt Inventory Humanoid::GetInventory()
IL_006b: ldloc.0
IL_006c: callvirt System.Boolean Inventory::ContainsItem(ItemDrop/ItemData)
IL_0071: brtrue.s IL_0094
IL_0073: ldsfld Player Player::m_localPlayer
IL_0078: callvirt Inventory Humanoid::GetInventory()
IL_007d: ldarg.0
IL_007e: ldfld ItemDrop/ItemData ZenUI.Section.AmmoCountIcon/ElementExtraData::Item
IL_0083: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0088: ldfld System.String ItemDrop/ItemData/SharedData::m_ammoType
IL_008d: ldnull
IL_008e: callvirt ItemDrop/ItemData Inventory::GetAmmoItem(System.String,System.String)
IL_0093: stloc.0
IL_0094: ldloc.0
IL_0095: ret

// System.Boolean ZenUI.Section.AmmoCountIcon/ElementExtraData::IsAmmo()
.locals System.Nullable`1<ItemDrop/ItemData/ItemType>, ItemDrop/ItemData/ItemType, System.Boolean, System.Nullable`1<ItemDrop/ItemData/ItemType>
IL_0000: ldarg.0
IL_0001: ldfld ItemDrop/ItemData ZenUI.Section.AmmoCountIcon/ElementExtraData::Item
IL_0006: dup
IL_0007: brtrue.s IL_0015
IL_0009: pop
IL_000a: ldloca.s V_3
IL_000c: initobj System.Nullable`1<ItemDrop/ItemData/ItemType>
IL_0012: ldloc.3
IL_0013: br.s IL_0024
IL_0015: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_001a: ldfld ItemDrop/ItemData/ItemType ItemDrop/ItemData/SharedData::m_itemType
IL_001f: newobj System.Void System.Nullable`1<ItemDrop/ItemData/ItemType>::.ctor(!0)
IL_0024: stloc.0
IL_0025: ldloca.s V_0
IL_0027: call System.Boolean System.Nullable`1<ItemDrop/ItemData/ItemType>::get_HasValue()
IL_002c: brfalse.s IL_0048
IL_002e: ldloca.s V_0
IL_0030: call !0 System.Nullable`1<ItemDrop/ItemData/ItemType>::GetValueOrDefault()
IL_0035: stloc.1
IL_0036: ldloc.1
IL_0037: ldc.i4.2
IL_0038: beq.s IL_0044
IL_003a: ldloc.1
IL_003b: ldc.i4.s 9
IL_003d: beq.s IL_0044
IL_003f: ldloc.1
IL_0040: ldc.i4.s 23
IL_0042: bne.un.s IL_0048
IL_0044: ldc.i4.1
IL_0045: stloc.2
IL_0046: br.s IL_004a
IL_0048: ldc.i4.0
IL_0049: stloc.2
IL_004a: ldloc.2
IL_004b: ret

// System.Boolean ZenUI.Section.AmmoCountIcon/ElementExtraData::IsBaitAmmo()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ItemDrop/ItemData ZenUI.Section.AmmoCountIcon/ElementExtraData::Item
IL_0006: dup
IL_0007: brtrue.s IL_000d
IL_0009: pop
IL_000a: ldnull
IL_000b: br.s IL_0017
IL_000d: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0012: ldfld System.String ItemDrop/ItemData/SharedData::m_ammoType
IL_0017: ldstr "$item_fishingbait"
IL_001c: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0021: ret

// System.Boolean ZenUI.Section.ApplyThinScrollBars::get_IsFeatureEnabled()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::ThinScrollBars
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: ret

// System.Void ZenUI.Section.ApplyThinScrollBars::Game_Start()
.locals 
IL_0000: call System.Boolean ZenUI.Section.ApplyThinScrollBars::get_IsFeatureEnabled()
IL_0005: brtrue.s IL_0008
IL_0007: ret
IL_0008: call System.Void ZenUI.Section.ApplyThinScrollBars::SetupBuildGridScrollbars()
IL_000d: call System.Void ZenUI.Section.ApplyThinScrollBars::SetupContainerScrollbars()
IL_0012: ret

// System.Void ZenUI.Section.ApplyThinScrollBars::SetupBuildGridScrollbars()
.locals 
IL_0000: call Hud Hud::get_instance()
IL_0005: ldfld BuildUi Hud::m_buildUi
IL_000a: dup
IL_000b: ldfld UnityEngine.UI.ScrollRect BuildUi::m_tagListScrollRect
IL_0010: callvirt UnityEngine.UI.Scrollbar UnityEngine.UI.ScrollRect::get_verticalScrollbar()
IL_0015: call System.Void ZenUI.Section.ApplyThinScrollBars::<SetupBuildGridScrollbars>g__ThinScrollbar|3_0(UnityEngine.UI.Scrollbar)
IL_001a: ldfld UnityEngine.UI.ScrollRect BuildUi::m_pieceScrollRect
IL_001f: callvirt UnityEngine.UI.Scrollbar UnityEngine.UI.ScrollRect::get_verticalScrollbar()
IL_0024: call System.Void ZenUI.Section.ApplyThinScrollBars::<SetupBuildGridScrollbars>g__ThinScrollbar|3_0(UnityEngine.UI.Scrollbar)
IL_0029: ldc.i4.0
IL_002a: stsfld System.Boolean ZenUI.Section.ApplyThinScrollBars/BuildUISetTagListActive::IsGridInitialized
IL_002f: ret

// System.Void ZenUI.Section.ApplyThinScrollBars::SetupContainerScrollbars()
.locals UnityEngine.Vector2
IL_0000: call InventoryGui InventoryGui::get_instance()
IL_0005: callvirt InventoryGrid InventoryGui::get_ContainerGrid()
IL_000a: ldfld UnityEngine.UI.Scrollbar InventoryGrid::m_scrollbar
IL_000f: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0014: castclass UnityEngine.RectTransform
IL_0019: dup
IL_001a: dup
IL_001b: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_anchoredPosition()
IL_0020: stloc.0
IL_0021: ldloca.s V_0
IL_0023: ldc.r4 -20
IL_0028: stfld System.Single UnityEngine.Vector2::y
IL_002d: ldloc.0
IL_002e: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_0033: ldc.r4 4
IL_0038: ldc.r4 290
IL_003d: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_0042: callvirt System.Void UnityEngine.RectTransform::set_sizeDelta(UnityEngine.Vector2)
IL_0047: ret

// System.Void ZenUI.Section.ApplyThinScrollBars::<SetupBuildGridScrollbars>g__ThinScrollbar|3_0(UnityEngine.UI.Scrollbar)
.locals 
IL_0000: ldarg.0
IL_0001: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0006: castclass UnityEngine.RectTransform
IL_000b: dup
IL_000c: ldc.r4 0
IL_0011: ldc.r4 0
IL_0016: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_001b: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_0020: dup
IL_0021: ldc.r4 1
IL_0026: ldc.r4 1
IL_002b: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_0030: callvirt System.Void UnityEngine.RectTransform::set_anchorMax(UnityEngine.Vector2)
IL_0035: dup
IL_0036: ldc.r4 1
IL_003b: ldc.r4 0
IL_0040: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_0045: callvirt System.Void UnityEngine.RectTransform::set_anchorMin(UnityEngine.Vector2)
IL_004a: dup
IL_004b: ldc.r4 2
IL_0050: ldc.r4 0
IL_0055: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_005a: callvirt System.Void UnityEngine.RectTransform::set_offsetMax(UnityEngine.Vector2)
IL_005f: ldc.r4 -2
IL_0064: ldc.r4 0
IL_0069: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_006e: callvirt System.Void UnityEngine.RectTransform::set_offsetMin(UnityEngine.Vector2)
IL_0073: ret

// System.Void ZenUI.Section.ApplyThinScrollBars/BuildUISetTagListActive::Prefix(BuildUi,System.Boolean&)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.0
IL_0002: ldfld UnityEngine.RectTransform BuildUi::m_tagListContainer
IL_0007: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_000c: callvirt System.Boolean UnityEngine.GameObject::get_activeSelf()
IL_0011: stind.i1
IL_0012: ret

// System.Void ZenUI.Section.ApplyThinScrollBars/BuildUISetTagListActive::Postfix(BuildUi,System.Boolean,System.Boolean,System.Boolean)
.locals 
IL_0000: call System.Boolean ZenUI.Section.ApplyThinScrollBars::get_IsFeatureEnabled()
IL_0005: brtrue.s IL_0008
IL_0007: ret
IL_0008: ldsfld System.Boolean ZenUI.Section.ApplyThinScrollBars/BuildUISetTagListActive::IsGridInitialized
IL_000d: brfalse.s IL_0014
IL_000f: ldarg.1
IL_0010: ldarg.3
IL_0011: bne.un.s IL_0014
IL_0013: ret
IL_0014: ldstr "Adjust grid cell size"
IL_0019: ldc.i4.0
IL_001a: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_001f: ldarg.0
IL_0020: ldfld UnityEngine.RectTransform BuildUi::m_pieceView
IL_0025: callvirt !!0 UnityEngine.Component::GetComponentInChildren<UnityEngine.UI.GridLayoutGroup>()
IL_002a: ldarg.1
IL_002b: brtrue.s IL_003e
IL_002d: ldc.r4 76.3
IL_0032: ldc.r4 76.3
IL_0037: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_003c: br.s IL_004d
IL_003e: ldc.r4 71.5
IL_0043: ldc.r4 71.5
IL_0048: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_004d: callvirt System.Void UnityEngine.UI.GridLayoutGroup::set_cellSize(UnityEngine.Vector2)
IL_0052: ldstr "Toggle help key hints visibility to match tabs"
IL_0057: ldc.i4.0
IL_0058: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_005d: ldarg.0
IL_005e: ldfld UnityEngine.RectTransform BuildUi::m_tabContainer
IL_0063: callvirt UnityEngine.Transform UnityEngine.Transform::get_parent()
IL_0068: ldstr "InputHelp"
IL_006d: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0072: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0077: ldarg.2
IL_0078: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_007d: ldc.i4.1
IL_007e: stsfld System.Boolean ZenUI.Section.ApplyThinScrollBars/BuildUISetTagListActive::IsGridInitialized
IL_0083: ret

// System.Void ZenUI.Section.CameraRules::SetLodBias(System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: ldc.r4 0
IL_0006: bgt.un.s IL_0009
IL_0008: ret
IL_0009: ldstr "Set LOD bias: {0}"
IL_000e: ldarg.0
IL_000f: box System.Single
IL_0014: call System.String System.String::Format(System.String,System.Object)
IL_0019: ldc.i4.0
IL_001a: call System.Void Zen.Logging`1<ZenUI.Plugin>::Message(System.Object,System.Int32)
IL_001f: ldarg.0
IL_0020: call System.Void UnityEngine.QualitySettings::set_lodBias(System.Single)
IL_0025: ret

// System.Void ZenUI.Section.CameraRules::RemoveDirt()
.locals GameCamera, UnityEngine.PostProcessing.PostProcessingBehaviour
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CameraRemoveLensDirt
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: call GameCamera GameCamera::get_instance()
IL_0012: stloc.0
IL_0013: ldloc.0
IL_0014: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0019: brtrue.s IL_001c
IL_001b: ret
IL_001c: ldloc.0
IL_001d: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0022: callvirt !!0 UnityEngine.GameObject::GetComponent<UnityEngine.PostProcessing.PostProcessingBehaviour>()
IL_0027: stloc.1
IL_0028: ldloc.1
IL_0029: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_002e: brtrue.s IL_0031
IL_0030: ret
IL_0031: ldloc.1
IL_0032: ldfld UnityEngine.PostProcessing.PostProcessingProfile UnityEngine.PostProcessing.PostProcessingBehaviour::profile
IL_0037: ldfld UnityEngine.PostProcessing.BloomModel UnityEngine.PostProcessing.PostProcessingProfile::bloom
IL_003c: ldflda UnityEngine.PostProcessing.BloomModel/Settings UnityEngine.PostProcessing.BloomModel::m_Settings
IL_0041: ldflda UnityEngine.PostProcessing.BloomModel/LensDirtSettings UnityEngine.PostProcessing.BloomModel/Settings::lensDirt
IL_0046: ldc.r4 0
IL_004b: stfld System.Single UnityEngine.PostProcessing.BloomModel/LensDirtSettings::intensity
IL_0050: ret

// System.Void ZenUI.Section.CameraRules::SetFirstPersonMode(ZenUI.FirstPersonMode)
.locals GameCamera
IL_0000: call GameCamera GameCamera::get_instance()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000c: brtrue.s IL_000f
IL_000e: ret
IL_000f: ldsfld System.Boolean ZenUI.Section.CameraRules::_isZoomDefaultSaved
IL_0014: brtrue.s IL_0049
IL_0016: call GameCamera GameCamera::get_instance()
IL_001b: ldfld System.Single GameCamera::m_minDistance
IL_0020: stsfld System.Single ZenUI.Section.CameraRules::_minCameraDistanceDefault
IL_0025: call GameCamera GameCamera::get_instance()
IL_002a: ldfld System.Single GameCamera::m_maxDistance
IL_002f: stsfld System.Single ZenUI.Section.CameraRules::_maxCameraDistanceDefault
IL_0034: call GameCamera GameCamera::get_instance()
IL_0039: ldfld System.Single GameCamera::m_maxDistanceBoat
IL_003e: stsfld System.Single ZenUI.Section.CameraRules::_maxCameraDistanceShipDefault
IL_0043: ldc.i4.1
IL_0044: stsfld System.Boolean ZenUI.Section.CameraRules::_isZoomDefaultSaved
IL_0049: ldarg.0
IL_004a: brfalse.s IL_0072
IL_004c: ldloc.0
IL_004d: ldflda UnityEngine.Vector3 GameCamera::m_fpsOffset
IL_0052: ldc.r4 0.1
IL_0057: stfld System.Single UnityEngine.Vector3::z
IL_005c: ldloc.0
IL_005d: ldc.r4 0.02
IL_0062: stfld System.Single GameCamera::m_nearClipPlaneMin
IL_0067: ldloc.0
IL_0068: ldc.r4 0.08
IL_006d: stfld System.Single GameCamera::m_nearClipPlaneMax
IL_0072: ldarg.0
IL_0073: switch IL_008d,IL_00af,IL_00d1,IL_00f3
IL_0088: br IL_0115
IL_008d: ldloc.0
IL_008e: ldsfld System.Single ZenUI.Section.CameraRules::_minCameraDistanceDefault
IL_0093: stfld System.Single GameCamera::m_minDistance
IL_0098: ldloc.0
IL_0099: ldsfld System.Single ZenUI.Section.CameraRules::_maxCameraDistanceDefault
IL_009e: stfld System.Single GameCamera::m_maxDistance
IL_00a3: ldloc.0
IL_00a4: ldsfld System.Single ZenUI.Section.CameraRules::_maxCameraDistanceShipDefault
IL_00a9: stfld System.Single GameCamera::m_maxDistanceBoat
IL_00ae: ret
IL_00af: ldloc.0
IL_00b0: ldc.r4 0
IL_00b5: stfld System.Single GameCamera::m_minDistance
IL_00ba: ldloc.0
IL_00bb: ldsfld System.Single ZenUI.Section.CameraRules::_maxCameraDistanceDefault
IL_00c0: stfld System.Single GameCamera::m_maxDistance
IL_00c5: ldloc.0
IL_00c6: ldsfld System.Single ZenUI.Section.CameraRules::_maxCameraDistanceShipDefault
IL_00cb: stfld System.Single GameCamera::m_maxDistanceBoat
IL_00d0: ret
IL_00d1: ldloc.0
IL_00d2: ldc.r4 0
IL_00d7: stfld System.Single GameCamera::m_minDistance
IL_00dc: ldloc.0
IL_00dd: ldc.r4 0
IL_00e2: stfld System.Single GameCamera::m_maxDistance
IL_00e7: ldloc.0
IL_00e8: ldsfld System.Single ZenUI.Section.CameraRules::_maxCameraDistanceShipDefault
IL_00ed: stfld System.Single GameCamera::m_maxDistanceBoat
IL_00f2: ret
IL_00f3: ldloc.0
IL_00f4: ldc.r4 0
IL_00f9: stfld System.Single GameCamera::m_minDistance
IL_00fe: ldloc.0
IL_00ff: ldc.r4 0
IL_0104: stfld System.Single GameCamera::m_maxDistance
IL_0109: ldloc.0
IL_010a: ldc.r4 0
IL_010f: stfld System.Single GameCamera::m_maxDistanceBoat
IL_0114: ret
IL_0115: ldstr "mode"
IL_011a: ldarg.0
IL_011b: box ZenUI.FirstPersonMode
IL_0120: ldnull
IL_0121: newobj System.Void System.ArgumentOutOfRangeException::.ctor(System.String,System.Object,System.String)
IL_0126: throw

// System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> ZenUI.Section.CameraRules::Player_FixedUpdate(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>)
.locals HarmonyLib.CodeMatch[], System.Func`2<System.Single,System.Single>
IL_0000: ldc.i4.3
IL_0001: newarr HarmonyLib.CodeMatch
IL_0006: dup
IL_0007: ldc.i4.0
IL_0008: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_000d: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_0012: ldtoken UnityEngine.Vector3
IL_0017: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_001c: ldstr "Distance"
IL_0021: ldnull
IL_0022: ldnull
IL_0023: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_0028: ldnull
IL_0029: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_002e: stelem.ref
IL_002f: dup
IL_0030: ldc.i4.1
IL_0031: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldc_R4
IL_0036: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_003b: ldnull
IL_003c: ldnull
IL_003d: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0042: stelem.ref
IL_0043: dup
IL_0044: ldc.i4.2
IL_0045: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Bge_Un
IL_004a: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_004f: ldnull
IL_0050: ldnull
IL_0051: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0056: stelem.ref
IL_0057: stloc.0
IL_0058: ldsfld System.Func`2<System.Single,System.Single> ZenUI.Section.CameraRules/<>O::<0>__GetMaxDistance
IL_005d: dup
IL_005e: brtrue.s IL_0073
IL_0060: pop
IL_0061: ldnull
IL_0062: ldftn System.Single ZenUI.Section.CameraRules::<Player_FixedUpdate>g__GetMaxDistance|7_0(System.Single)
IL_0068: newobj System.Void System.Func`2<System.Single,System.Single>::.ctor(System.Object,System.IntPtr)
IL_006d: dup
IL_006e: stsfld System.Func`2<System.Single,System.Single> ZenUI.Section.CameraRules/<>O::<0>__GetMaxDistance
IL_0073: stloc.1
IL_0074: ldarg.0
IL_0075: ldnull
IL_0076: newobj System.Void HarmonyLib.CodeMatcher::.ctor(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>,System.Reflection.Emit.ILGenerator)
IL_007b: ldloc.0
IL_007c: call HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::MatchEndForward(HarmonyLib.CodeMatch[])
IL_0081: ldstr "Unable to match IL sequence"
IL_0086: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::ThrowIfInvalid(System.String)
IL_008b: ldc.i4.1
IL_008c: newarr HarmonyLib.CodeInstruction
IL_0091: dup
IL_0092: ldc.i4.0
IL_0093: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_0098: ldloc.1
IL_0099: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_009e: newobj System.Void HarmonyLib.CodeInstruction::.ctor(System.Reflection.Emit.OpCode,System.Object)
IL_00a3: stelem.ref
IL_00a4: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Insert(HarmonyLib.CodeInstruction[])
IL_00a9: callvirt System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> HarmonyLib.CodeMatcher::InstructionEnumeration()
IL_00ae: ret

// System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> ZenUI.Section.CameraRules::GameCamera_ApplyCameraTilt(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>)
.locals HarmonyLib.CodeMatch[], System.Func`2<System.Single,System.Single>
IL_0000: ldc.i4.6
IL_0001: newarr HarmonyLib.CodeMatch
IL_0006: dup
IL_0007: ldc.i4.0
IL_0008: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldarg_0
IL_000d: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_0012: ldnull
IL_0013: ldnull
IL_0014: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0019: stelem.ref
IL_001a: dup
IL_001b: ldc.i4.1
IL_001c: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldfld
IL_0021: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_0026: ldtoken GameCamera
IL_002b: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0030: ldstr "m_maxDistanceBoat"
IL_0035: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_003a: ldnull
IL_003b: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0040: stelem.ref
IL_0041: dup
IL_0042: ldc.i4.2
IL_0043: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldarg_0
IL_0048: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_004d: ldnull
IL_004e: ldnull
IL_004f: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0054: stelem.ref
IL_0055: dup
IL_0056: ldc.i4.3
IL_0057: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldfld
IL_005c: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_0061: ldtoken GameCamera
IL_0066: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_006b: ldstr "m_minDistance"
IL_0070: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_0075: ldnull
IL_0076: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_007b: stelem.ref
IL_007c: dup
IL_007d: ldc.i4.4
IL_007e: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Sub
IL_0083: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_0088: ldnull
IL_0089: ldnull
IL_008a: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_008f: stelem.ref
IL_0090: dup
IL_0091: ldc.i4.5
IL_0092: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Div
IL_0097: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_009c: ldnull
IL_009d: ldnull
IL_009e: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_00a3: stelem.ref
IL_00a4: stloc.0
IL_00a5: ldsfld System.Func`2<System.Single,System.Single> ZenUI.Section.CameraRules/<>O::<1>__ProtectDivZero
IL_00aa: dup
IL_00ab: brtrue.s IL_00c0
IL_00ad: pop
IL_00ae: ldnull
IL_00af: ldftn System.Single ZenUI.Section.CameraRules::<GameCamera_ApplyCameraTilt>g__ProtectDivZero|8_0(System.Single)
IL_00b5: newobj System.Void System.Func`2<System.Single,System.Single>::.ctor(System.Object,System.IntPtr)
IL_00ba: dup
IL_00bb: stsfld System.Func`2<System.Single,System.Single> ZenUI.Section.CameraRules/<>O::<1>__ProtectDivZero
IL_00c0: stloc.1
IL_00c1: ldarg.0
IL_00c2: ldnull
IL_00c3: newobj System.Void HarmonyLib.CodeMatcher::.ctor(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>,System.Reflection.Emit.ILGenerator)
IL_00c8: ldloc.0
IL_00c9: call HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::MatchEndForward(HarmonyLib.CodeMatch[])
IL_00ce: ldstr "Unable to match IL sequence"
IL_00d3: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::ThrowIfInvalid(System.String)
IL_00d8: ldc.i4.1
IL_00d9: newarr HarmonyLib.CodeInstruction
IL_00de: dup
IL_00df: ldc.i4.0
IL_00e0: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_00e5: ldloc.1
IL_00e6: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_00eb: newobj System.Void HarmonyLib.CodeInstruction::.ctor(System.Reflection.Emit.OpCode,System.Object)
IL_00f0: stelem.ref
IL_00f1: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Insert(HarmonyLib.CodeInstruction[])
IL_00f6: callvirt System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> HarmonyLib.CodeMatcher::InstructionEnumeration()
IL_00fb: ret

// System.Void ZenUI.Section.CameraRules::GameCamera_Awake(GameCamera)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.FirstPersonMode> ZenUI.Configs::CameraFirstPerson
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<ZenUI.FirstPersonMode>::get_Value()
IL_000a: call System.Void ZenUI.Section.CameraRules::SetFirstPersonMode(ZenUI.FirstPersonMode)
IL_000f: ret

// System.Single ZenUI.Section.CameraRules::<Player_FixedUpdate>g__GetMaxDistance|7_0(System.Single)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.FirstPersonMode> ZenUI.Configs::CameraFirstPerson
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<ZenUI.FirstPersonMode>::get_Value()
IL_000a: brtrue.s IL_000e
IL_000c: ldarg.0
IL_000d: ret
IL_000e: call GameCamera GameCamera::get_instance()
IL_0013: ldfld System.Single GameCamera::m_distance
IL_0018: ldc.r4 0
IL_001d: ble.s IL_0021
IL_001f: ldarg.0
IL_0020: ret
IL_0021: ldc.r4 3.4028235E+38
IL_0026: ret

// System.Single ZenUI.Section.CameraRules::<GameCamera_ApplyCameraTilt>g__ProtectDivZero|8_0(System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: ldc.r4 0
IL_0006: beq.s IL_000a
IL_0008: ldarg.0
IL_0009: ret
IL_000a: ldc.r4 1
IL_000f: ret

// System.Void ZenUI.Section.CameraRules/ShipFirstPersonCamera::Hud_UpdateShipHud(Hud)
.locals UnityEngine.RectTransform, System.Single, System.Single, ZenUI.RepositionShipControls
IL_0000: ldarg.0
IL_0001: ldfld UnityEngine.GameObject Hud::m_shipControlsRoot
IL_0006: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_000b: castclass UnityEngine.RectTransform
IL_0010: stloc.0
IL_0011: ldsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.RepositionShipControls> ZenUI.Configs::CameraZoomRepositionShipControls
IL_0016: callvirt !0 BepInEx.Configuration.ConfigEntry`1<ZenUI.RepositionShipControls>::get_Value()
IL_001b: stloc.3
IL_001c: ldloc.3
IL_001d: switch IL_0034,IL_003c,IL_0044,IL_004c
IL_0032: br.s IL_0054
IL_0034: ldc.r4 -3.4028235E+38
IL_0039: stloc.2
IL_003a: br.s IL_005f
IL_003c: ldc.r4 0
IL_0041: stloc.2
IL_0042: br.s IL_005f
IL_0044: ldc.r4 2.5
IL_0049: stloc.2
IL_004a: br.s IL_005f
IL_004c: ldc.r4 3.4028235E+38
IL_0051: stloc.2
IL_0052: br.s IL_005f
IL_0054: ldstr "CameraZoomRepositionShipControls"
IL_0059: newobj System.Void System.ArgumentOutOfRangeException::.ctor(System.String)
IL_005e: throw
IL_005f: ldloc.2
IL_0060: stloc.1
IL_0061: ldarg.0
IL_0062: ldfld UnityEngine.GameObject Hud::m_shipHudRoot
IL_0067: callvirt System.Boolean UnityEngine.GameObject::get_activeSelf()
IL_006c: brfalse.s IL_007b
IL_006e: call GameCamera GameCamera::get_instance()
IL_0073: ldfld System.Single GameCamera::m_distance
IL_0078: ldloc.1
IL_0079: ble.un.s IL_0082
IL_007b: ldloc.0
IL_007c: call System.Void ZenUI.Section.CameraRules/ShipFirstPersonCamera::RestoreOriginal(UnityEngine.RectTransform)
IL_0081: ret
IL_0082: ldsfld System.Boolean ZenUI.Section.CameraRules/ShipFirstPersonCamera::_isOriginalSaved
IL_0087: brtrue.s IL_00b0
IL_0089: ldloc.0
IL_008a: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_anchorMin()
IL_008f: stsfld UnityEngine.Vector2 ZenUI.Section.CameraRules/ShipFirstPersonCamera::_origAnchorMin
IL_0094: ldloc.0
IL_0095: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_anchorMax()
IL_009a: stsfld UnityEngine.Vector2 ZenUI.Section.CameraRules/ShipFirstPersonCamera::_origAnchorMax
IL_009f: ldloc.0
IL_00a0: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_pivot()
IL_00a5: stsfld UnityEngine.Vector2 ZenUI.Section.CameraRules/ShipFirstPersonCamera::_origPivot
IL_00aa: ldc.i4.1
IL_00ab: stsfld System.Boolean ZenUI.Section.CameraRules/ShipFirstPersonCamera::_isOriginalSaved
IL_00b0: ldloc.0
IL_00b1: ldc.r4 1
IL_00b6: ldc.r4 0
IL_00bb: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_00c0: callvirt System.Void UnityEngine.RectTransform::set_anchorMax(UnityEngine.Vector2)
IL_00c5: ldloc.0
IL_00c6: ldc.r4 1
IL_00cb: ldc.r4 0
IL_00d0: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_00d5: callvirt System.Void UnityEngine.RectTransform::set_anchorMin(UnityEngine.Vector2)
IL_00da: ldloc.0
IL_00db: ldc.r4 1
IL_00e0: ldc.r4 0
IL_00e5: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_00ea: callvirt System.Void UnityEngine.RectTransform::set_pivot(UnityEngine.Vector2)
IL_00ef: ldloc.0
IL_00f0: ldc.r4 -100
IL_00f5: ldc.r4 30
IL_00fa: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_00ff: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_0104: ldc.i4.1
IL_0105: stsfld System.Boolean ZenUI.Section.CameraRules/ShipFirstPersonCamera::_isModified
IL_010a: ret

// System.Void ZenUI.Section.CameraRules/ShipFirstPersonCamera::RestoreOriginal(UnityEngine.RectTransform)
.locals 
IL_0000: ldsfld System.Boolean ZenUI.Section.CameraRules/ShipFirstPersonCamera::_isModified
IL_0005: brtrue.s IL_0008
IL_0007: ret
IL_0008: ldarg.0
IL_0009: ldsfld UnityEngine.Vector2 ZenUI.Section.CameraRules/ShipFirstPersonCamera::_origAnchorMax
IL_000e: callvirt System.Void UnityEngine.RectTransform::set_anchorMax(UnityEngine.Vector2)
IL_0013: ldarg.0
IL_0014: ldsfld UnityEngine.Vector2 ZenUI.Section.CameraRules/ShipFirstPersonCamera::_origAnchorMin
IL_0019: callvirt System.Void UnityEngine.RectTransform::set_anchorMin(UnityEngine.Vector2)
IL_001e: ldarg.0
IL_001f: ldsfld UnityEngine.Vector2 ZenUI.Section.CameraRules/ShipFirstPersonCamera::_origPivot
IL_0024: callvirt System.Void UnityEngine.RectTransform::set_pivot(UnityEngine.Vector2)
IL_0029: ldc.i4.0
IL_002a: stsfld System.Boolean ZenUI.Section.CameraRules/ShipFirstPersonCamera::_isModified
IL_002f: ret

// System.Collections.Generic.IEnumerable`1<System.Reflection.MethodBase> ZenUI.Section.ChatRules::TargetMethods()
.locals 
IL_0000: ldc.i4.3
IL_0001: newarr System.Reflection.MethodBase
IL_0006: dup
IL_0007: ldc.i4.0
IL_0008: ldtoken Chat
IL_000d: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0012: ldstr "AddInworldText"
IL_0017: ldnull
IL_0018: ldnull
IL_0019: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_001e: stelem.ref
IL_001f: dup
IL_0020: ldc.i4.1
IL_0021: ldtoken Terminal
IL_0026: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_002b: ldstr "AddString"
IL_0030: ldc.i4.4
IL_0031: newarr System.Type
IL_0036: dup
IL_0037: ldc.i4.0
IL_0038: ldtoken Splatform.PlatformUserID
IL_003d: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0042: stelem.ref
IL_0043: dup
IL_0044: ldc.i4.1
IL_0045: ldtoken System.String
IL_004a: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_004f: stelem.ref
IL_0050: dup
IL_0051: ldc.i4.2
IL_0052: ldtoken Talker/Type
IL_0057: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_005c: stelem.ref
IL_005d: dup
IL_005e: ldc.i4.3
IL_005f: ldtoken System.Boolean
IL_0064: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0069: stelem.ref
IL_006a: ldnull
IL_006b: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_0070: stelem.ref
IL_0071: dup
IL_0072: ldc.i4.2
IL_0073: ldtoken Terminal
IL_0078: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_007d: ldstr "AddString"
IL_0082: ldc.i4.4
IL_0083: newarr System.Type
IL_0088: dup
IL_0089: ldc.i4.0
IL_008a: ldtoken System.String
IL_008f: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0094: stelem.ref
IL_0095: dup
IL_0096: ldc.i4.1
IL_0097: ldtoken System.String
IL_009c: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00a1: stelem.ref
IL_00a2: dup
IL_00a3: ldc.i4.2
IL_00a4: ldtoken Talker/Type
IL_00a9: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00ae: stelem.ref
IL_00af: dup
IL_00b0: ldc.i4.3
IL_00b1: ldtoken System.Boolean
IL_00b6: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00bb: stelem.ref
IL_00bc: ldnull
IL_00bd: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_00c2: stelem.ref
IL_00c3: newobj System.Void <>z__ReadOnlyArray`1<System.Reflection.MethodBase>::.ctor(T[])
IL_00c8: ret

// System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> ZenUI.Section.ChatRules::PreventCaseChange(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>)
.locals System.Reflection.MethodInfo, System.Reflection.MethodInfo, System.Func`2<System.String,System.String>, System.Func`2<System.String,System.String>
IL_0000: ldtoken System.String
IL_0005: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_000a: ldstr "ToUpper"
IL_000f: call !!0[] System.Array::Empty<System.Type>()
IL_0014: ldnull
IL_0015: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_001a: stloc.0
IL_001b: ldtoken System.String
IL_0020: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0025: ldstr "ToLowerInvariant"
IL_002a: call !!0[] System.Array::Empty<System.Type>()
IL_002f: ldnull
IL_0030: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_0035: stloc.1
IL_0036: ldnull
IL_0037: ldftn System.String ZenUI.Section.ChatRules::<PreventCaseChange>g__ToUpperBypass|1_0(System.String)
IL_003d: newobj System.Void System.Func`2<System.String,System.String>::.ctor(System.Object,System.IntPtr)
IL_0042: stloc.2
IL_0043: ldnull
IL_0044: ldftn System.String ZenUI.Section.ChatRules::<PreventCaseChange>g__ToLowerBypass|1_1(System.String)
IL_004a: newobj System.Void System.Func`2<System.String,System.String>::.ctor(System.Object,System.IntPtr)
IL_004f: stloc.3
IL_0050: ldarg.0
IL_0051: ldloc.0
IL_0052: ldloc.2
IL_0053: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_0058: call System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> HarmonyLib.Transpilers::MethodReplacer(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>,System.Reflection.MethodBase,System.Reflection.MethodBase)
IL_005d: ldloc.1
IL_005e: ldloc.3
IL_005f: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_0064: call System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> HarmonyLib.Transpilers::MethodReplacer(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>,System.Reflection.MethodBase,System.Reflection.MethodBase)
IL_0069: ret

// System.String ZenUI.Section.ChatRules::<PreventCaseChange>g__ToUpperBypass|1_0(System.String)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::ChatForceCase
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000e
IL_000c: ldarg.0
IL_000d: ret
IL_000e: ldarg.0
IL_000f: callvirt System.String System.String::ToUpper()
IL_0014: ret

// System.String ZenUI.Section.ChatRules::<PreventCaseChange>g__ToLowerBypass|1_1(System.String)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::ChatForceCase
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000e
IL_000c: ldarg.0
IL_000d: ret
IL_000e: ldarg.0
IL_000f: callvirt System.String System.String::ToLowerInvariant()
IL_0014: ret

// TMPro.TMP_Text ZenUI.Section.CraftingPanel::get_CraftButtonLabel()
.locals 
IL_0000: ldsfld TMPro.TMP_Text ZenUI.Section.CraftingPanel::_craftButtonLabelCache
IL_0005: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000a: brtrue.s IL_0022
IL_000c: call InventoryGui InventoryGui::get_instance()
IL_0011: ldfld UnityEngine.UI.Button InventoryGui::m_craftButton
IL_0016: callvirt !!0 UnityEngine.Component::GetComponentInChildren<TMPro.TMP_Text>()
IL_001b: dup
IL_001c: stsfld TMPro.TMP_Text ZenUI.Section.CraftingPanel::_craftButtonLabelCache
IL_0021: ret
IL_0022: ldsfld TMPro.TMP_Text ZenUI.Section.CraftingPanel::_craftButtonLabelCache
IL_0027: ret

// System.Boolean ZenUI.Section.CraftingPanel::get_IsObjectDBRecipesChanged()
.locals 
IL_0000: ldsfld System.Int32 ZenUI.Section.CraftingPanel::_lastObjectDBRecipesCount
IL_0005: call ObjectDB ObjectDB::get_instance()
IL_000a: ldfld System.Collections.Generic.List`1<Recipe> ObjectDB::m_recipes
IL_000f: callvirt System.Int32 System.Collections.Generic.List`1<Recipe>::get_Count()
IL_0014: ceq
IL_0016: ldc.i4.0
IL_0017: ceq
IL_0019: ret

// System.Boolean ZenUI.Section.CraftingPanel::get_IsStationChanged()
.locals 
IL_0000: ldsfld Player Player::m_localPlayer
IL_0005: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000a: brfalse.s IL_0021
IL_000c: ldsfld CraftingStation ZenUI.Section.CraftingPanel::_currentStation
IL_0011: ldsfld Player Player::m_localPlayer
IL_0016: callvirt CraftingStation Player::GetCurrentCraftingStation()
IL_001b: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0020: ret
IL_0021: ldc.i4.0
IL_0022: ret

// System.Collections.Generic.IEnumerable`1<InventoryGui/RecipeDataPair> ZenUI.Section.CraftingPanel::get_ActiveRecipes()
.locals System.Collections.Generic.IEnumerable`1<InventoryGui/RecipeDataPair>
IL_0000: ldsflda System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::_currentGroup
IL_0005: call System.Boolean System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>::get_HasValue()
IL_000a: brfalse.s IL_0080
IL_000c: call InventoryGui InventoryGui::get_instance()
IL_0011: ldfld System.Collections.Generic.List`1<InventoryGui/RecipeDataPair> InventoryGui::m_availableRecipes
IL_0016: ldsfld System.Func`2<InventoryGui/RecipeDataPair,System.Boolean> ZenUI.Section.CraftingPanel/<>c::<>9__30_0
IL_001b: dup
IL_001c: brtrue.s IL_0035
IL_001e: pop
IL_001f: ldsfld ZenUI.Section.CraftingPanel/<>c ZenUI.Section.CraftingPanel/<>c::<>9
IL_0024: ldftn System.Boolean ZenUI.Section.CraftingPanel/<>c::<get_ActiveRecipes>b__30_0(InventoryGui/RecipeDataPair)
IL_002a: newobj System.Void System.Func`2<InventoryGui/RecipeDataPair,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_002f: dup
IL_0030: stsfld System.Func`2<InventoryGui/RecipeDataPair,System.Boolean> ZenUI.Section.CraftingPanel/<>c::<>9__30_0
IL_0035: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<InventoryGui/RecipeDataPair>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_003a: ldsfld System.Func`2<InventoryGui/RecipeDataPair,System.Boolean> ZenUI.Section.CraftingPanel/<>O::<0>__InCurrentGroup
IL_003f: dup
IL_0040: brtrue.s IL_0055
IL_0042: pop
IL_0043: ldnull
IL_0044: ldftn System.Boolean ZenUI.Section.CraftingPanel::InCurrentGroup(InventoryGui/RecipeDataPair)
IL_004a: newobj System.Void System.Func`2<InventoryGui/RecipeDataPair,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_004f: dup
IL_0050: stsfld System.Func`2<InventoryGui/RecipeDataPair,System.Boolean> ZenUI.Section.CraftingPanel/<>O::<0>__InCurrentGroup
IL_0055: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<InventoryGui/RecipeDataPair>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_005a: ldsfld System.Func`2<InventoryGui/RecipeDataPair,System.Boolean> ZenUI.Section.CraftingPanel/<>O::<1>__ApplySearchFilter
IL_005f: dup
IL_0060: brtrue.s IL_0075
IL_0062: pop
IL_0063: ldnull
IL_0064: ldftn System.Boolean ZenUI.Section.CraftingPanelSearch::ApplySearchFilter(InventoryGui/RecipeDataPair)
IL_006a: newobj System.Void System.Func`2<InventoryGui/RecipeDataPair,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_006f: dup
IL_0070: stsfld System.Func`2<InventoryGui/RecipeDataPair,System.Boolean> ZenUI.Section.CraftingPanel/<>O::<1>__ApplySearchFilter
IL_0075: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<InventoryGui/RecipeDataPair>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_007a: call System.Collections.Generic.IEnumerable`1<InventoryGui/RecipeDataPair> ZenUI.Section.CraftingPanel::SortCraftRecipes(System.Collections.Generic.IEnumerable`1<InventoryGui/RecipeDataPair>)
IL_007f: ret
IL_0080: call !!0[] System.Array::Empty<InventoryGui/RecipeDataPair>()
IL_0085: stloc.0
IL_0086: ldloc.0
IL_0087: ret

// System.Boolean ZenUI.Section.CraftingPanel::get_IsMulticraftPressed()
.locals 
IL_0000: call InventoryGui InventoryGui::get_instance()
IL_0005: call System.Boolean Zen.Lib.InventoryGuiExt::IsMulticraftPressed(InventoryGui)
IL_000a: ret

// System.Boolean ZenUI.Section.CraftingPanel::get_IsNoCraftCost()
.locals 
IL_0000: call ZoneSystem ZoneSystem::get_instance()
IL_0005: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000a: brfalse.s IL_001a
IL_000c: call ZoneSystem ZoneSystem::get_instance()
IL_0011: ldc.i4.s 25
IL_0013: callvirt System.Boolean ZoneSystem::GetGlobalKey(GlobalKeys)
IL_0018: brtrue.s IL_0033
IL_001a: ldsfld Player Player::m_localPlayer
IL_001f: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0024: brfalse.s IL_0031
IL_0026: ldsfld Player Player::m_localPlayer
IL_002b: callvirt System.Boolean Player::NoCostCheat()
IL_0030: ret
IL_0031: ldc.i4.0
IL_0032: ret
IL_0033: ldc.i4.1
IL_0034: ret

// System.Boolean ZenUI.Section.CraftingPanel::CanCraft(ItemDrop/ItemData)
.locals InventoryGui/RecipeDataPair
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<ItemDrop/ItemData,InventoryGui/RecipeDataPair> ZenUI.Section.CraftingPanel::ItemRecipeData
IL_0005: ldarg.0
IL_0006: callvirt !1 System.Collections.Generic.Dictionary`2<ItemDrop/ItemData,InventoryGui/RecipeDataPair>::get_Item(!0)
IL_000b: stloc.0
IL_000c: ldloca.s V_0
IL_000e: call System.Boolean InventoryGui/RecipeDataPair::get_CanCraft()
IL_0013: brtrue.s IL_001b
IL_0015: call System.Boolean ZenUI.Section.CraftingPanel::get_IsNoCraftCost()
IL_001a: ret
IL_001b: ldc.i4.1
IL_001c: ret

// System.Boolean ZenUI.Section.CraftingPanel::InCurrentGroup(ItemDrop/ItemData)
.locals 
IL_0000: ldarg.0
IL_0001: brfalse.s IL_000f
IL_0003: ldsfld System.Collections.Generic.Dictionary`2<ItemDrop/ItemData,InventoryGui/RecipeDataPair> ZenUI.Section.CraftingPanel::ItemRecipeData
IL_0008: ldarg.0
IL_0009: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ItemDrop/ItemData,InventoryGui/RecipeDataPair>::ContainsKey(!0)
IL_000e: ret
IL_000f: ldc.i4.0
IL_0010: ret

// System.Boolean ZenUI.Section.CraftingPanel::InCurrentGroup(InventoryGui/RecipeDataPair)
.locals 
IL_0000: ldsflda System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::_currentGroup
IL_0005: call System.Boolean System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>::get_HasValue()
IL_000a: brfalse.s IL_002d
IL_000c: ldsfld System.Collections.Generic.Dictionary`2<Recipe,System.Collections.Generic.HashSet`1<ZenUI.Section.CraftingPanel/CraftGroup>> ZenUI.Section.CraftingPanel::RecipeToGroups
IL_0011: ldarga.s r
IL_0013: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0018: callvirt !1 System.Collections.Generic.Dictionary`2<Recipe,System.Collections.Generic.HashSet`1<ZenUI.Section.CraftingPanel/CraftGroup>>::get_Item(!0)
IL_001d: ldsflda System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::_currentGroup
IL_0022: call !0 System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>::get_Value()
IL_0027: callvirt System.Boolean System.Collections.Generic.HashSet`1<ZenUI.Section.CraftingPanel/CraftGroup>::Contains(!0)
IL_002c: ret
IL_002d: ldc.i4.0
IL_002e: ret

// System.Boolean ZenUI.Section.CraftingPanel::IsInGroups(InventoryGui/RecipeDataPair,ZenUI.Section.CraftingPanel/CraftGroup[])
.locals 
IL_0000: ldarga.s recipeData
IL_0002: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0007: ldarg.1
IL_0008: call System.Boolean ZenUI.Section.CraftingPanel::IsInGroups(Recipe,ZenUI.Section.CraftingPanel/CraftGroup[])
IL_000d: ret

// System.Boolean ZenUI.Section.CraftingPanel::IsInGroups(Recipe,ZenUI.Section.CraftingPanel/CraftGroup[])
.locals 
IL_0000: ldarg.1
IL_0001: ldsfld System.Collections.Generic.Dictionary`2<Recipe,System.Collections.Generic.HashSet`1<ZenUI.Section.CraftingPanel/CraftGroup>> ZenUI.Section.CraftingPanel::RecipeToGroups
IL_0006: ldarg.0
IL_0007: callvirt !1 System.Collections.Generic.Dictionary`2<Recipe,System.Collections.Generic.HashSet`1<ZenUI.Section.CraftingPanel/CraftGroup>>::get_Item(!0)
IL_000c: dup
IL_000d: ldvirtftn System.Boolean System.Collections.Generic.HashSet`1<ZenUI.Section.CraftingPanel/CraftGroup>::Contains(!0)
IL_0013: newobj System.Void System.Func`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0018: call System.Boolean System.Linq.Enumerable::Any<ZenUI.Section.CraftingPanel/CraftGroup>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_001d: ret

// System.Void ZenUI.Section.CraftingPanel::InitExplicitGroupConfigs()
.locals System.Collections.IEnumerator, ZenUI.Section.CraftingPanel/<>c__DisplayClass46_0, System.Collections.Generic.HashSet`1<System.String>, System.IDisposable
IL_0000: ldtoken ZenUI.Section.CraftingPanel/CraftGroup
IL_0005: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_000a: call System.Array System.Enum::GetValues(System.Type)
IL_000f: callvirt System.Collections.IEnumerator System.Array::GetEnumerator()
IL_0014: stloc.0
IL_0015: br IL_00cb
IL_001a: newobj System.Void ZenUI.Section.CraftingPanel/<>c__DisplayClass46_0::.ctor()
IL_001f: stloc.1
IL_0020: ldloc.1
IL_0021: ldloc.0
IL_0022: callvirt System.Object System.Collections.IEnumerator::get_Current()
IL_0027: unbox.any ZenUI.Section.CraftingPanel/CraftGroup
IL_002c: stfld ZenUI.Section.CraftingPanel/CraftGroup ZenUI.Section.CraftingPanel/<>c__DisplayClass46_0::group
IL_0031: ldloc.1
IL_0032: ldfld ZenUI.Section.CraftingPanel/CraftGroup ZenUI.Section.CraftingPanel/<>c__DisplayClass46_0::group
IL_0037: brfalse IL_00cb
IL_003c: ldsfld System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>> ZenUI.Section.CraftingPanel::ExplicitGroupAssignment
IL_0041: ldloc.1
IL_0042: ldfld ZenUI.Section.CraftingPanel/CraftGroup ZenUI.Section.CraftingPanel/<>c__DisplayClass46_0::group
IL_0047: ldloca.s V_2
IL_0049: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>>::TryGetValue(!0,!1&)
IL_004e: brtrue.s IL_0067
IL_0050: newobj System.Void System.Collections.Generic.HashSet`1<System.String>::.ctor()
IL_0055: stloc.2
IL_0056: ldsfld System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>> ZenUI.Section.CraftingPanel::ExplicitGroupAssignment
IL_005b: ldloc.1
IL_005c: ldfld ZenUI.Section.CraftingPanel/CraftGroup ZenUI.Section.CraftingPanel/<>c__DisplayClass46_0::group
IL_0061: ldloc.2
IL_0062: callvirt System.Void System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>>::Add(!0,!1)
IL_0067: ldloc.1
IL_0068: ldc.i4.1
IL_0069: ldstr "Crafting Group Assignment"
IL_006e: ldloc.1
IL_006f: ldflda ZenUI.Section.CraftingPanel/CraftGroup ZenUI.Section.CraftingPanel/<>c__DisplayClass46_0::group
IL_0074: constrained. ZenUI.Section.CraftingPanel/CraftGroup
IL_007a: callvirt System.String System.Object::ToString()
IL_007f: ldloc.2
IL_0080: newobj System.Void Zen.Lib.Config.StringList::.ctor(System.Collections.Generic.IEnumerable`1<System.String>)
IL_0085: ldstr "Comma separated list of item prefab names explicitly assigned to this group.
Use this to override the default groupings which are based on item type.
The prefix and suffix wildcard * is supported.
Explicltly remove an item from a group with a - prefix: -prefabName
Removal wildcards are also supported, example: -Wood* or -*Wood"
IL_008a: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<Zen.Lib.Config.StringList>(System.Boolean,System.String,System.String,!!0,System.String)
IL_008f: stfld BepInEx.Configuration.ConfigEntry`1<Zen.Lib.Config.StringList> ZenUI.Section.CraftingPanel/<>c__DisplayClass46_0::config
IL_0094: ldsfld System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>> ZenUI.Section.CraftingPanel::ExplicitGroupAssignment
IL_0099: ldloc.1
IL_009a: ldfld ZenUI.Section.CraftingPanel/CraftGroup ZenUI.Section.CraftingPanel/<>c__DisplayClass46_0::group
IL_009f: ldloc.1
IL_00a0: ldfld BepInEx.Configuration.ConfigEntry`1<Zen.Lib.Config.StringList> ZenUI.Section.CraftingPanel/<>c__DisplayClass46_0::config
IL_00a5: callvirt !0 BepInEx.Configuration.ConfigEntry`1<Zen.Lib.Config.StringList>::get_Value()
IL_00aa: call System.Collections.Generic.HashSet`1<!!0> System.Linq.Enumerable::ToHashSet<System.String>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_00af: callvirt System.Void System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>>::set_Item(!0,!1)
IL_00b4: ldloc.1
IL_00b5: ldfld BepInEx.Configuration.ConfigEntry`1<Zen.Lib.Config.StringList> ZenUI.Section.CraftingPanel/<>c__DisplayClass46_0::config
IL_00ba: ldloc.1
IL_00bb: ldftn System.Void ZenUI.Section.CraftingPanel/<>c__DisplayClass46_0::<InitExplicitGroupConfigs>b__1(System.Object,System.EventArgs)
IL_00c1: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_00c6: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<Zen.Lib.Config.StringList>::add_SettingChanged(System.EventHandler)
IL_00cb: ldloc.0
IL_00cc: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_00d1: brtrue IL_001a
IL_00d6: leave.s IL_00e9
IL_00d8: ldloc.0
IL_00d9: isinst System.IDisposable
IL_00de: stloc.3
IL_00df: ldloc.3
IL_00e0: brfalse.s IL_00e8
IL_00e2: ldloc.3
IL_00e3: callvirt System.Void System.IDisposable::Dispose()
IL_00e8: endfinally
IL_00e9: call System.Void ZenUI.Section.CraftingPanel::UpdateExplicitAssignmentPatterns()
IL_00ee: ret
// EH Finally: 21 - 216 => 216 - 233

// System.Void ZenUI.Section.CraftingPanel::UpdateExplicitAssignmentPatterns()
.locals 
IL_0000: ldsfld System.Collections.Generic.HashSet`1<System.String> ZenUI.Section.CraftingPanel::AllExplicitAssignmentPatterns
IL_0005: callvirt System.Void System.Collections.Generic.HashSet`1<System.String>::Clear()
IL_000a: ldsfld System.Collections.Generic.HashSet`1<System.String> ZenUI.Section.CraftingPanel::AllExplicitAssignmentPatterns
IL_000f: ldsfld System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>> ZenUI.Section.CraftingPanel::ExplicitGroupAssignment
IL_0014: ldsfld System.Func`2<System.Collections.Generic.KeyValuePair`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>>,System.Collections.Generic.IEnumerable`1<System.String>> ZenUI.Section.CraftingPanel/<>c::<>9__47_0
IL_0019: dup
IL_001a: brtrue.s IL_0033
IL_001c: pop
IL_001d: ldsfld ZenUI.Section.CraftingPanel/<>c ZenUI.Section.CraftingPanel/<>c::<>9
IL_0022: ldftn System.Collections.Generic.IEnumerable`1<System.String> ZenUI.Section.CraftingPanel/<>c::<UpdateExplicitAssignmentPatterns>b__47_0(System.Collections.Generic.KeyValuePair`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>>)
IL_0028: newobj System.Void System.Func`2<System.Collections.Generic.KeyValuePair`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>>,System.Collections.Generic.IEnumerable`1<System.String>>::.ctor(System.Object,System.IntPtr)
IL_002d: dup
IL_002e: stsfld System.Func`2<System.Collections.Generic.KeyValuePair`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>>,System.Collections.Generic.IEnumerable`1<System.String>> ZenUI.Section.CraftingPanel/<>c::<>9__47_0
IL_0033: call System.Collections.Generic.IEnumerable`1<!!1> System.Linq.Enumerable::SelectMany<System.Collections.Generic.KeyValuePair`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>>,System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Collections.Generic.IEnumerable`1<!!1>>)
IL_0038: callvirt System.Void System.Collections.Generic.HashSet`1<System.String>::UnionWith(System.Collections.Generic.IEnumerable`1<!0>)
IL_003d: ret

// System.Void ZenUI.Section.CraftingPanel::ResetInfoPanel_KBM()
.locals 
IL_0000: ldsfld UnityEngine.GameObject ZenUI.Section.CraftingPanel::_itemInfoTooltip_KBM
IL_0005: call System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_000a: ldsflda System.ValueTuple`3<ItemDrop/ItemData,System.Boolean,System.Boolean> ZenUI.Section.CraftingPanel::_itemStateLastSelected_KBM
IL_000f: initobj System.ValueTuple`3<ItemDrop/ItemData,System.Boolean,System.Boolean>
IL_0015: ret

// System.Void ZenUI.Section.CraftingPanel::InitPanel()
.locals 
IL_0000: call !0 Zen.Lib.ZenMod`1<ZenUI.Plugin>::get_Instance()
IL_0005: ldsfld System.Action ZenUI.Section.CraftingPanel/<>O::<2>__ResetInfoPanel_KBM
IL_000a: dup
IL_000b: brtrue.s IL_0020
IL_000d: pop
IL_000e: ldnull
IL_000f: ldftn System.Void ZenUI.Section.CraftingPanel::ResetInfoPanel_KBM()
IL_0015: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_001a: dup
IL_001b: stsfld System.Action ZenUI.Section.CraftingPanel/<>O::<2>__ResetInfoPanel_KBM
IL_0020: callvirt System.Void Zen.Lib.ZenMod`1<ZenUI.Plugin>::add_RegisterInputs(System.Action)
IL_0025: call System.Void ZenUI.Section.CraftingPanel::Reset()
IL_002a: call System.Void ZenUI.Section.CraftingPanel::SetupCraftingPanel()
IL_002f: ret

// System.Void ZenUI.Section.CraftingPanel::SetupCraftingPanel()
.locals InventoryGui, UnityEngine.Vector2, UnityEngine.Rect, System.Collections.IEnumerator, System.IDisposable
IL_0000: call InventoryGui InventoryGui::get_instance()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldfld UnityEngine.RectTransform InventoryGui::m_crafting
IL_000c: ldstr "Decription"
IL_0011: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0016: castclass UnityEngine.RectTransform
IL_001b: stsfld UnityEngine.RectTransform ZenUI.Section.CraftingPanel::_rightPanel
IL_0020: ldloc.0
IL_0021: ldfld UnityEngine.RectTransform InventoryGui::m_crafting
IL_0026: ldstr "RecipeList"
IL_002b: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0030: castclass UnityEngine.RectTransform
IL_0035: stsfld UnityEngine.RectTransform ZenUI.Section.CraftingPanel::_leftPanel
IL_003a: ldstr "Resize the panels"
IL_003f: ldc.i4.0
IL_0040: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_0045: ldstr "Resize the crafting window"
IL_004a: ldc.i4.0
IL_004b: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_0050: ldloc.0
IL_0051: ldfld UnityEngine.RectTransform InventoryGui::m_crafting
IL_0056: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_005b: castclass UnityEngine.RectTransform
IL_0060: dup
IL_0061: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_sizeDelta()
IL_0066: stloc.1
IL_0067: ldloca.s V_1
IL_0069: ldc.r4 685
IL_006e: stfld System.Single UnityEngine.Vector2::y
IL_0073: ldloc.1
IL_0074: callvirt System.Void UnityEngine.RectTransform::set_sizeDelta(UnityEngine.Vector2)
IL_0079: ldstr "Resize the right panel"
IL_007e: ldc.i4.0
IL_007f: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_0084: ldsfld UnityEngine.RectTransform ZenUI.Section.CraftingPanel::_rightPanel
IL_0089: ldsfld UnityEngine.RectTransform ZenUI.Section.CraftingPanel::_rightPanel
IL_008e: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_sizeDelta()
IL_0093: stloc.1
IL_0094: ldloca.s V_1
IL_0096: ldc.r4 490
IL_009b: stfld System.Single UnityEngine.Vector2::y
IL_00a0: ldloc.1
IL_00a1: callvirt System.Void UnityEngine.RectTransform::set_sizeDelta(UnityEngine.Vector2)
IL_00a6: ldstr "Resize the left panel"
IL_00ab: ldc.i4.0
IL_00ac: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_00b1: ldsfld UnityEngine.RectTransform ZenUI.Section.CraftingPanel::_leftPanel
IL_00b6: ldsfld UnityEngine.RectTransform ZenUI.Section.CraftingPanel::_leftPanel
IL_00bb: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_sizeDelta()
IL_00c0: stloc.1
IL_00c1: ldloca.s V_1
IL_00c3: ldc.r4 490
IL_00c8: stfld System.Single UnityEngine.Vector2::y
IL_00cd: ldloc.1
IL_00ce: callvirt System.Void UnityEngine.RectTransform::set_sizeDelta(UnityEngine.Vector2)
IL_00d3: ldloc.0
IL_00d4: ldloc.0
IL_00d5: ldfld UnityEngine.RectTransform InventoryGui::m_recipeListRoot
IL_00da: callvirt UnityEngine.Rect UnityEngine.RectTransform::get_rect()
IL_00df: stloc.2
IL_00e0: ldloca.s V_2
IL_00e2: call System.Single UnityEngine.Rect::get_height()
IL_00e7: stfld System.Single InventoryGui::m_recipeListBaseSize
IL_00ec: ldstr "Clone the ContainerGrid game object"
IL_00f1: ldc.i4.0
IL_00f2: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_00f7: ldloc.0
IL_00f8: callvirt InventoryGrid InventoryGui::get_ContainerGrid()
IL_00fd: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0102: ldsfld UnityEngine.RectTransform ZenUI.Section.CraftingPanel::_rightPanel
IL_0107: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Transform)
IL_010c: dup
IL_010d: ldstr "ZenUI_CraftingGrid"
IL_0112: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_0117: dup
IL_0118: ldc.i4.0
IL_0119: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_011e: ldstr "Replace the InventoryGrid with a CraftingPanelGrid"
IL_0123: ldc.i4.0
IL_0124: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_0129: dup
IL_012a: callvirt !!0 UnityEngine.GameObject::GetComponent<InventoryGrid>()
IL_012f: call System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_0134: callvirt !!0 UnityEngine.GameObject::AddComponent<ZenUI.Section.CraftingPanelGrid>()
IL_0139: stsfld ZenUI.Section.CraftingPanelGrid ZenUI.Section.CraftingPanel::_craftingGrid
IL_013e: ldsfld ZenUI.Section.CraftingPanelGrid ZenUI.Section.CraftingPanel::_craftingGrid
IL_0143: ldc.i4.5
IL_0144: ldc.i4.7
IL_0145: callvirt System.Void ZenUI.Section.CraftingPanelGrid::Init(System.Int32,System.Int32)
IL_014a: ldstr "Setup selected event handlers"
IL_014f: ldc.i4.0
IL_0150: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_0155: ldsfld ZenUI.Section.CraftingPanelGrid ZenUI.Section.CraftingPanel::_craftingGrid
IL_015a: ldsfld System.Action`1<ItemDrop/ItemData> ZenUI.Section.CraftingPanel/<>O::<3>__SelectItem
IL_015f: dup
IL_0160: brtrue.s IL_0175
IL_0162: pop
IL_0163: ldnull
IL_0164: ldftn System.Void ZenUI.Section.CraftingPanel::SelectItem(ItemDrop/ItemData)
IL_016a: newobj System.Void System.Action`1<ItemDrop/ItemData>::.ctor(System.Object,System.IntPtr)
IL_016f: dup
IL_0170: stsfld System.Action`1<ItemDrop/ItemData> ZenUI.Section.CraftingPanel/<>O::<3>__SelectItem
IL_0175: callvirt System.Void ZenUI.Section.CraftingPanelGrid::add_OnSelectedItem(System.Action`1<ItemDrop/ItemData>)
IL_017a: ldstr "Setup scroll event handlers"
IL_017f: ldc.i4.0
IL_0180: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_0185: ldsfld ZenUI.Section.CraftingPanelGrid ZenUI.Section.CraftingPanel::_craftingGrid
IL_018a: ldsfld System.Action`1<System.Single> ZenUI.Section.CraftingPanel/<>O::<4>__ScrollChanged
IL_018f: dup
IL_0190: brtrue.s IL_01a5
IL_0192: pop
IL_0193: ldnull
IL_0194: ldftn System.Void ZenUI.Section.CraftingPanel::ScrollChanged(System.Single)
IL_019a: newobj System.Void System.Action`1<System.Single>::.ctor(System.Object,System.IntPtr)
IL_019f: dup
IL_01a0: stsfld System.Action`1<System.Single> ZenUI.Section.CraftingPanel/<>O::<4>__ScrollChanged
IL_01a5: callvirt System.Void ZenUI.Section.CraftingPanelGrid::add_OnScrollChanged(System.Action`1<System.Single>)
IL_01aa: ldstr "Move the crafting button down and to the left"
IL_01af: ldc.i4.0
IL_01b0: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_01b5: ldloc.0
IL_01b6: ldfld UnityEngine.UI.Button InventoryGui::m_craftButton
IL_01bb: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_01c0: callvirt UnityEngine.Transform UnityEngine.Transform::get_parent()
IL_01c5: castclass UnityEngine.RectTransform
IL_01ca: dup
IL_01cb: ldc.r4 -280
IL_01d0: ldc.r4 -50
IL_01d5: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_01da: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_01df: ldc.r4 -160
IL_01e4: ldc.r4 70
IL_01e9: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_01ee: callvirt System.Void UnityEngine.RectTransform::set_sizeDelta(UnityEngine.Vector2)
IL_01f3: ldstr "Resize the progress bar to fit the new button shape"
IL_01f8: ldc.i4.0
IL_01f9: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_01fe: ldloc.0
IL_01ff: ldfld UnityEngine.Transform InventoryGui::m_craftProgressPanel
IL_0204: castclass UnityEngine.RectTransform
IL_0209: dup
IL_020a: call UnityEngine.Vector2 UnityEngine.Vector2::get_zero()
IL_020f: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_0214: dup
IL_0215: dup
IL_0216: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_offsetMax()
IL_021b: stloc.1
IL_021c: ldloca.s V_1
IL_021e: ldc.r4 0
IL_0223: stfld System.Single UnityEngine.Vector2::x
IL_0228: ldloc.1
IL_0229: callvirt System.Void UnityEngine.RectTransform::set_offsetMax(UnityEngine.Vector2)
IL_022e: dup
IL_022f: dup
IL_0230: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_offsetMin()
IL_0235: stloc.1
IL_0236: ldloca.s V_1
IL_0238: ldc.r4 0
IL_023d: stfld System.Single UnityEngine.Vector2::x
IL_0242: ldloc.1
IL_0243: callvirt System.Void UnityEngine.RectTransform::set_offsetMin(UnityEngine.Vector2)
IL_0248: dup
IL_0249: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_sizeDelta()
IL_024e: stloc.1
IL_024f: ldloca.s V_1
IL_0251: ldc.r4 180
IL_0256: stfld System.Single UnityEngine.Vector2::x
IL_025b: ldloc.1
IL_025c: callvirt System.Void UnityEngine.RectTransform::set_sizeDelta(UnityEngine.Vector2)
IL_0261: ldloc.0
IL_0262: ldfld GuiBar InventoryGui::m_craftProgressBar
IL_0267: ldc.r4 180
IL_026c: callvirt System.Void GuiBar::SetWidth(System.Single)
IL_0271: ldstr "Move the requirements panel down and align the right margin"
IL_0276: ldc.i4.0
IL_0277: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_027c: ldloc.0
IL_027d: ldfld UnityEngine.RectTransform InventoryGui::m_crafting
IL_0282: ldstr "Decription/requirements"
IL_0287: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_028c: castclass UnityEngine.RectTransform
IL_0291: dup
IL_0292: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0297: call !!0 Jotunn.ExposedGameObjectExtension::GetOrAddComponent<UnityEngine.UI.HorizontalLayoutGroup>(UnityEngine.GameObject)
IL_029c: ldc.r4 0
IL_02a1: callvirt System.Void UnityEngine.UI.HorizontalOrVerticalLayoutGroup::set_spacing(System.Single)
IL_02a6: dup
IL_02a7: ldc.r4 0
IL_02ac: ldc.r4 -48
IL_02b1: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_02b6: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_02bb: dup
IL_02bc: ldc.r4 1
IL_02c1: ldc.r4 0
IL_02c6: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_02cb: callvirt System.Void UnityEngine.RectTransform::set_anchorMax(UnityEngine.Vector2)
IL_02d0: dup
IL_02d1: ldc.r4 0
IL_02d6: ldc.r4 0
IL_02db: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_02e0: callvirt System.Void UnityEngine.RectTransform::set_anchorMin(UnityEngine.Vector2)
IL_02e5: dup
IL_02e6: dup
IL_02e7: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_sizeDelta()
IL_02ec: stloc.1
IL_02ed: ldloca.s V_1
IL_02ef: ldc.r4 0
IL_02f4: stfld System.Single UnityEngine.Vector2::x
IL_02f9: ldloc.1
IL_02fa: callvirt System.Void UnityEngine.RectTransform::set_sizeDelta(UnityEngine.Vector2)
IL_02ff: callvirt System.Collections.IEnumerator UnityEngine.Transform::GetEnumerator()
IL_0304: stloc.3
IL_0305: br.s IL_031d
IL_0307: ldloc.3
IL_0308: callvirt System.Object System.Collections.IEnumerator::get_Current()
IL_030d: castclass UnityEngine.Transform
IL_0312: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.UI.Image>()
IL_0317: ldc.i4.1
IL_0318: callvirt System.Void UnityEngine.Behaviour::set_enabled(System.Boolean)
IL_031d: ldloc.3
IL_031e: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0323: brtrue.s IL_0307
IL_0325: leave.s IL_033b
IL_0327: ldloc.3
IL_0328: isinst System.IDisposable
IL_032d: stloc.s V_4
IL_032f: ldloc.s V_4
IL_0331: brfalse.s IL_033a
IL_0333: ldloc.s V_4
IL_0335: callvirt System.Void System.IDisposable::Dispose()
IL_033a: endfinally
IL_033b: ldstr "Save the original upgrade notice position"
IL_0340: ldc.i4.0
IL_0341: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_0346: ldloc.0
IL_0347: ldfld TMPro.TMP_Text InventoryGui::m_itemCraftType
IL_034c: callvirt UnityEngine.Transform TMPro.TMP_Text::get_transform()
IL_0351: castclass UnityEngine.RectTransform
IL_0356: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_anchoredPosition()
IL_035b: stsfld UnityEngine.Vector2 ZenUI.Section.CraftingPanel::_craftTypeTextOrigPos
IL_0360: ldstr "Setup crafting group icons"
IL_0365: ldc.i4.0
IL_0366: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_036b: ret
// EH Finally: 773 - 807 => 807 - 827

// System.Void ZenUI.Section.CraftingPanel::SetRepairPanelPosition(InventoryGui)
.locals UnityEngine.Vector2
IL_0000: ldstr "Move the repair panel to compensate for the resized crafting panel"
IL_0005: ldc.i4.0
IL_0006: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_000b: ldarg.0
IL_000c: ldfld UnityEngine.UI.Button InventoryGui::m_repairButton
IL_0011: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0016: castclass UnityEngine.RectTransform
IL_001b: dup
IL_001c: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_anchoredPosition()
IL_0021: stloc.0
IL_0022: ldloca.s V_0
IL_0024: ldc.r4 185.5
IL_0029: stfld System.Single UnityEngine.Vector2::y
IL_002e: ldloc.0
IL_002f: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_0034: ret

// System.Boolean ZenUI.Section.CraftingPanel::TryGetCurrentGroup(ZenUI.Section.CraftingPanel/CraftGroup&)
.locals 
IL_0000: ldarg.0
IL_0001: ldsflda System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::_currentGroup
IL_0006: ldc.i4.m1
IL_0007: call !0 System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>::GetValueOrDefault(!0)
IL_000c: stind.i4
IL_000d: ldsflda System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::_currentGroup
IL_0012: call System.Boolean System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>::get_HasValue()
IL_0017: ret

// System.Void ZenUI.Section.CraftingPanel::ScrollChanged(System.Single)
.locals ZenUI.Section.CraftingPanel/CraftGroup
IL_0000: ldloca.s V_0
IL_0002: call System.Boolean ZenUI.Section.CraftingPanel::TryGetCurrentGroup(ZenUI.Section.CraftingPanel/CraftGroup&)
IL_0007: brfalse.s IL_0015
IL_0009: ldsfld System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Single> ZenUI.Section.CraftingPanel::ScrollPositions
IL_000e: ldloc.0
IL_000f: ldarg.0
IL_0010: callvirt System.Void System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Single>::set_Item(!0,!1)
IL_0015: ret

// System.Void ZenUI.Section.CraftingPanel::ResetScrollCache()
.locals System.Collections.IEnumerator, ZenUI.Section.CraftingPanel/CraftGroup, System.IDisposable
IL_0000: ldstr "Reset scroll position cached values for all groups"
IL_0005: ldc.i4.0
IL_0006: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_000b: ldtoken ZenUI.Section.CraftingPanel/CraftGroup
IL_0010: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0015: call System.Array System.Enum::GetValues(System.Type)
IL_001a: callvirt System.Collections.IEnumerator System.Array::GetEnumerator()
IL_001f: stloc.0
IL_0020: br.s IL_003e
IL_0022: ldloc.0
IL_0023: callvirt System.Object System.Collections.IEnumerator::get_Current()
IL_0028: unbox.any ZenUI.Section.CraftingPanel/CraftGroup
IL_002d: stloc.1
IL_002e: ldsfld System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Single> ZenUI.Section.CraftingPanel::ScrollPositions
IL_0033: ldloc.1
IL_0034: ldc.r4 1
IL_0039: callvirt System.Void System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Single>::set_Item(!0,!1)
IL_003e: ldloc.0
IL_003f: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0044: brtrue.s IL_0022
IL_0046: leave.s IL_0059
IL_0048: ldloc.0
IL_0049: isinst System.IDisposable
IL_004e: stloc.2
IL_004f: ldloc.2
IL_0050: brfalse.s IL_0058
IL_0052: ldloc.2
IL_0053: callvirt System.Void System.IDisposable::Dispose()
IL_0058: endfinally
IL_0059: ret
// EH Finally: 32 - 72 => 72 - 89

// System.Void ZenUI.Section.CraftingPanel::Reset()
.locals 
IL_0000: ldnull
IL_0001: stsfld CraftingStation ZenUI.Section.CraftingPanel::_currentStation
IL_0006: ldsflda System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::_currentGroup
IL_000b: initobj System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>
IL_0011: ldc.i4.0
IL_0012: stsfld System.Int32 ZenUI.Section.CraftingPanel::_lastObjectDBRecipesCount
IL_0017: ldnull
IL_0018: stsfld ItemDrop/ItemData ZenUI.Section.CraftingPanel::_selectedItem
IL_001d: call System.Void ZenUI.Section.CraftingPanel::ResetInfoPanel_KBM()
IL_0022: ldnull
IL_0023: call System.Void ZenUI.Section.CraftingPanel::SelectItem(ItemDrop/ItemData)
IL_0028: call System.Void ZenUI.Section.CraftingPanel::ResetScrollCache()
IL_002d: ret

// System.Void ZenUI.Section.CraftingPanel::ForceRefresh()
.locals 
IL_0000: call System.Void ZenUI.Section.CraftingPanel::Reset()
IL_0005: call InventoryGui InventoryGui::get_instance()
IL_000a: ldc.i4.0
IL_000b: callvirt System.Void InventoryGui::UpdateCraftingPanel(System.Boolean)
IL_0010: ret

// System.Void ZenUI.Section.CraftingPanel::AssignRecipesToCraftGroups()
.locals System.Collections.Generic.IEnumerator`1<Recipe>
IL_0000: ldstr "Assign all recipes to craft groups"
IL_0005: ldc.i4.0
IL_0006: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_000b: ldsfld System.Collections.Generic.Dictionary`2<Recipe,System.Collections.Generic.HashSet`1<ZenUI.Section.CraftingPanel/CraftGroup>> ZenUI.Section.CraftingPanel::RecipeToGroups
IL_0010: callvirt System.Void System.Collections.Generic.Dictionary`2<Recipe,System.Collections.Generic.HashSet`1<ZenUI.Section.CraftingPanel/CraftGroup>>::Clear()
IL_0015: call ObjectDB ObjectDB::get_instance()
IL_001a: ldfld System.Collections.Generic.List`1<Recipe> ObjectDB::m_recipes
IL_001f: ldsfld System.Func`2<Recipe,System.Boolean> ZenUI.Section.CraftingPanel/<>c::<>9__57_0
IL_0024: dup
IL_0025: brtrue.s IL_003e
IL_0027: pop
IL_0028: ldsfld ZenUI.Section.CraftingPanel/<>c ZenUI.Section.CraftingPanel/<>c::<>9
IL_002d: ldftn System.Boolean ZenUI.Section.CraftingPanel/<>c::<AssignRecipesToCraftGroups>b__57_0(Recipe)
IL_0033: newobj System.Void System.Func`2<Recipe,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0038: dup
IL_0039: stsfld System.Func`2<Recipe,System.Boolean> ZenUI.Section.CraftingPanel/<>c::<>9__57_0
IL_003e: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<Recipe>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0043: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<Recipe>::GetEnumerator()
IL_0048: stloc.0
IL_0049: br.s IL_0056
IL_004b: ldloc.0
IL_004c: callvirt !0 System.Collections.Generic.IEnumerator`1<Recipe>::get_Current()
IL_0051: call System.Void ZenUI.Section.CraftingPanel::AssignRecipeToCraftGroups(Recipe)
IL_0056: ldloc.0
IL_0057: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_005c: brtrue.s IL_004b
IL_005e: leave.s IL_006a
IL_0060: ldloc.0
IL_0061: brfalse.s IL_0069
IL_0063: ldloc.0
IL_0064: callvirt System.Void System.IDisposable::Dispose()
IL_0069: endfinally
IL_006a: call ObjectDB ObjectDB::get_instance()
IL_006f: ldfld System.Collections.Generic.List`1<Recipe> ObjectDB::m_recipes
IL_0074: callvirt System.Int32 System.Collections.Generic.List`1<Recipe>::get_Count()
IL_0079: stsfld System.Int32 ZenUI.Section.CraftingPanel::_lastObjectDBRecipesCount
IL_007e: ret
// EH Finally: 73 - 96 => 96 - 106

// System.Void ZenUI.Section.CraftingPanel::AssignRecipeToCraftGroups(Recipe)
.locals ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0, ItemDrop/ItemData/ItemType, System.Boolean, Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean, System.Collections.Generic.IEnumerator`1<ZenUI.Section.CraftingPanel/CraftGroup>, ZenUI.Section.CraftingPanel/CraftGroup
IL_0000: newobj System.Void ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldarg.0
IL_0008: stfld Recipe ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::recipe
IL_000d: ldloc.0
IL_000e: ldloc.0
IL_000f: ldfld Recipe ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::recipe
IL_0014: ldfld ItemDrop Recipe::m_item
IL_0019: call System.String Zen.Lib.ItemDataExt::GetPrefabName(ItemDrop)
IL_001e: stfld System.String ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::itemPrefabName
IL_0023: ldloc.0
IL_0024: ldfld Recipe ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::recipe
IL_0029: ldfld ItemDrop Recipe::m_item
IL_002e: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0033: call ItemDrop/ItemData/ItemType Zen.Lib.ItemDataExt::GetItemType(ItemDrop/ItemData)
IL_0038: stloc.1
IL_0039: ldsfld System.Collections.Generic.SortedDictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes> ZenUI.Section.CraftingPanel::CraftGroups
IL_003e: callvirt System.Collections.Generic.SortedDictionary`2/KeyCollection<!0,!1> System.Collections.Generic.SortedDictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>::get_Keys()
IL_0043: ldsfld System.Func`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Boolean> ZenUI.Section.CraftingPanel/<>c::<>9__58_0
IL_0048: dup
IL_0049: brtrue.s IL_0062
IL_004b: pop
IL_004c: ldsfld ZenUI.Section.CraftingPanel/<>c ZenUI.Section.CraftingPanel/<>c::<>9
IL_0051: ldftn System.Boolean ZenUI.Section.CraftingPanel/<>c::<AssignRecipeToCraftGroups>b__58_0(ZenUI.Section.CraftingPanel/CraftGroup)
IL_0057: newobj System.Void System.Func`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_005c: dup
IL_005d: stsfld System.Func`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Boolean> ZenUI.Section.CraftingPanel/<>c::<>9__58_0
IL_0062: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ZenUI.Section.CraftingPanel/CraftGroup>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0067: ldsfld System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType> ZenUI.Section.CraftingPanel::AllKnownTypes
IL_006c: ldloc.1
IL_006d: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Contains(!0)
IL_0072: brtrue.s IL_00b7
IL_0074: ldc.i4.s 20
IL_0076: ldc.i4.2
IL_0077: ldloca.s V_4
IL_0079: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_007e: stloc.3
IL_007f: ldloc.s V_4
IL_0081: brfalse.s IL_00b0
IL_0083: ldloca.s V_3
IL_0085: ldstr "No known type: "
IL_008a: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_008f: ldloca.s V_3
IL_0091: ldloc.1
IL_0092: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<ItemDrop/ItemData/ItemType>(!!0)
IL_0097: ldloca.s V_3
IL_0099: ldstr " for "
IL_009e: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_00a3: ldloca.s V_3
IL_00a5: ldloc.0
IL_00a6: ldfld System.String ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::itemPrefabName
IL_00ab: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_00b0: ldloc.3
IL_00b1: ldc.i4.0
IL_00b2: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_00b7: ldloc.0
IL_00b8: ldc.i4.0
IL_00b9: callvirt System.Void ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::<AssignRecipeToCraftGroups>g__AddToGroup|6(ZenUI.Section.CraftingPanel/CraftGroup)
IL_00be: ldc.i4.0
IL_00bf: stloc.2
IL_00c0: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<ZenUI.Section.CraftingPanel/CraftGroup>::GetEnumerator()
IL_00c5: stloc.s V_5
IL_00c7: br.s IL_0123
IL_00c9: ldloc.s V_5
IL_00cb: callvirt !0 System.Collections.Generic.IEnumerator`1<ZenUI.Section.CraftingPanel/CraftGroup>::get_Current()
IL_00d0: stloc.s V_6
IL_00d2: ldloc.0
IL_00d3: ldloc.s V_6
IL_00d5: callvirt System.Boolean ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::<AssignRecipeToCraftGroups>g__IsRemovedFromGroupExplicitly|3(ZenUI.Section.CraftingPanel/CraftGroup)
IL_00da: brtrue.s IL_0123
IL_00dc: ldloc.0
IL_00dd: ldsfld System.Collections.Generic.HashSet`1<System.String> ZenUI.Section.CraftingPanel::AllExplicitAssignmentPatterns
IL_00e2: ldc.i4.0
IL_00e3: callvirt System.Boolean ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::<AssignRecipeToCraftGroups>g__IsWildcardFound|1(System.Collections.Generic.HashSet`1<System.String>,System.Boolean)
IL_00e8: brfalse.s IL_0100
IL_00ea: ldloc.0
IL_00eb: ldloc.s V_6
IL_00ed: callvirt System.Boolean ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::<AssignRecipeToCraftGroups>g__IsAssignedToGroupExplicitly|2(ZenUI.Section.CraftingPanel/CraftGroup)
IL_00f2: brfalse.s IL_0123
IL_00f4: ldloc.0
IL_00f5: ldloc.s V_6
IL_00f7: callvirt System.Void ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::<AssignRecipeToCraftGroups>g__AddToGroup|6(ZenUI.Section.CraftingPanel/CraftGroup)
IL_00fc: ldc.i4.1
IL_00fd: stloc.2
IL_00fe: br.s IL_0123
IL_0100: ldsfld System.Collections.Generic.SortedDictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes> ZenUI.Section.CraftingPanel::CraftGroups
IL_0105: ldloc.s V_6
IL_0107: callvirt !1 System.Collections.Generic.SortedDictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>::get_Item(!0)
IL_010c: ldfld System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType> ZenUI.Section.CraftingPanel/CraftGroupItemTypes::Types
IL_0111: ldloc.1
IL_0112: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Contains(!0)
IL_0117: brfalse.s IL_0123
IL_0119: ldloc.0
IL_011a: ldloc.s V_6
IL_011c: callvirt System.Void ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::<AssignRecipeToCraftGroups>g__AddToGroup|6(ZenUI.Section.CraftingPanel/CraftGroup)
IL_0121: ldc.i4.1
IL_0122: stloc.2
IL_0123: ldloc.s V_5
IL_0125: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_012a: brtrue.s IL_00c9
IL_012c: leave.s IL_013a
IL_012e: ldloc.s V_5
IL_0130: brfalse.s IL_0139
IL_0132: ldloc.s V_5
IL_0134: callvirt System.Void System.IDisposable::Dispose()
IL_0139: endfinally
IL_013a: ldloc.2
IL_013b: brtrue.s IL_0145
IL_013d: ldloc.0
IL_013e: ldc.i4.s 11
IL_0140: callvirt System.Void ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::<AssignRecipeToCraftGroups>g__AddToGroup|6(ZenUI.Section.CraftingPanel/CraftGroup)
IL_0145: ret
// EH Finally: 199 - 302 => 302 - 314

// System.Void ZenUI.Section.CraftingPanel::UpdateGamepad()
.locals ZenUI.Section.CraftingPanel/CraftGroup, System.Int32, System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>
IL_0000: call System.Boolean ZInput::IsGamepadActive()
IL_0005: brfalse.s IL_0018
IL_0007: ldsfld ZenUI.Section.CraftingPanelGrid ZenUI.Section.CraftingPanel::_craftingGrid
IL_000c: ldfld UIGroupHandler InventoryGrid::m_uiGroup
IL_0011: callvirt System.Boolean UIGroupHandler::get_IsActive()
IL_0016: brtrue.s IL_0019
IL_0018: ret
IL_0019: call InventoryGui InventoryGui::get_instance()
IL_001e: callvirt System.Boolean InventoryGui::InCraftTab()
IL_0023: brtrue.s IL_0026
IL_0025: ret
IL_0026: ldsfld System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::ActiveGroups
IL_002b: callvirt System.Int32 System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup>::get_Count()
IL_0030: brtrue.s IL_0033
IL_0032: ret
IL_0033: ldsfld System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::_currentGroup
IL_0038: stloc.2
IL_0039: ldloca.s V_2
IL_003b: call System.Boolean System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>::get_HasValue()
IL_0040: brtrue.s IL_004e
IL_0042: ldsfld System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::ActiveGroups
IL_0047: call !!0 System.Linq.Enumerable::First<ZenUI.Section.CraftingPanel/CraftGroup>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_004c: br.s IL_0055
IL_004e: ldloca.s V_2
IL_0050: call !0 System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>::GetValueOrDefault()
IL_0055: stloc.0
IL_0056: ldloc.0
IL_0057: call System.Int32 ZenUI.Section.CraftingPanel::<UpdateGamepad>g__ActiveGroupIndex|59_0(ZenUI.Section.CraftingPanel/CraftGroup)
IL_005c: stloc.1
IL_005d: ldstr "JoyDPadUp"
IL_0062: call System.Boolean ZInput::GetButtonDown(System.String)
IL_0067: brfalse.s IL_007d
IL_0069: ldsfld System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::ActiveGroups
IL_006e: ldloc.1
IL_006f: ldc.i4.1
IL_0070: sub
IL_0071: ldc.i4.0
IL_0072: call System.Int32 UnityEngine.Mathf::Max(System.Int32,System.Int32)
IL_0077: call !!0 System.Linq.Enumerable::ElementAt<ZenUI.Section.CraftingPanel/CraftGroup>(System.Collections.Generic.IEnumerable`1<!!0>,System.Int32)
IL_007c: stloc.0
IL_007d: ldstr "JoyDPadDown"
IL_0082: call System.Boolean ZInput::GetButtonDown(System.String)
IL_0087: brfalse.s IL_00a8
IL_0089: ldsfld System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::ActiveGroups
IL_008e: ldloc.1
IL_008f: ldc.i4.1
IL_0090: add
IL_0091: ldsfld System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::ActiveGroups
IL_0096: callvirt System.Int32 System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup>::get_Count()
IL_009b: ldc.i4.1
IL_009c: sub
IL_009d: call System.Int32 UnityEngine.Mathf::Min(System.Int32,System.Int32)
IL_00a2: call !!0 System.Linq.Enumerable::ElementAt<ZenUI.Section.CraftingPanel/CraftGroup>(System.Collections.Generic.IEnumerable`1<!!0>,System.Int32)
IL_00a7: stloc.0
IL_00a8: ldloc.0
IL_00a9: ldsfld System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::_currentGroup
IL_00ae: stloc.2
IL_00af: ldloca.s V_2
IL_00b1: call !0 System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>::GetValueOrDefault()
IL_00b6: ceq
IL_00b8: ldloca.s V_2
IL_00ba: call System.Boolean System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>::get_HasValue()
IL_00bf: and
IL_00c0: brtrue.s IL_00cd
IL_00c2: ldloc.0
IL_00c3: newobj System.Void System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>::.ctor(!0)
IL_00c8: call System.Void ZenUI.Section.CraftingPanel::SelectGroup(System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>)
IL_00cd: ret

// ItemDrop/ItemData ZenUI.Section.CraftingPanel::GetRecipeItemClone(Recipe,System.Int32)
.locals ItemDrop/ItemData, Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<System.ValueTuple`2<Recipe,System.Int32>,ItemDrop/ItemData> ZenUI.Section.CraftingPanel::RecipeItemCloneCache
IL_0005: ldarg.0
IL_0006: ldarg.1
IL_0007: newobj System.Void System.ValueTuple`2<Recipe,System.Int32>::.ctor(!0,!1)
IL_000c: ldloca.s V_0
IL_000e: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.ValueTuple`2<Recipe,System.Int32>,ItemDrop/ItemData>::TryGetValue(!0,!1&)
IL_0013: brtrue.s IL_007f
IL_0015: ldc.i4.s 39
IL_0017: ldc.i4.2
IL_0018: ldloca.s V_2
IL_001a: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_001f: stloc.1
IL_0020: ldloc.2
IL_0021: brfalse.s IL_0055
IL_0023: ldloca.s V_1
IL_0025: ldstr "Adding recipe item to cache: "
IL_002a: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_002f: ldloca.s V_1
IL_0031: ldarg.0
IL_0032: ldfld ItemDrop Recipe::m_item
IL_0037: call System.String Zen.Lib.ItemDataExt::GetPrefabName(ItemDrop)
IL_003c: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_0041: ldloca.s V_1
IL_0043: ldstr " variant: "
IL_0048: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_004d: ldloca.s V_1
IL_004f: ldarg.1
IL_0050: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Int32>(!!0)
IL_0055: ldloc.1
IL_0056: ldc.i4.0
IL_0057: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_005c: ldarg.0
IL_005d: ldfld ItemDrop Recipe::m_item
IL_0062: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0067: callvirt ItemDrop/ItemData ItemDrop/ItemData::Clone()
IL_006c: stloc.0
IL_006d: ldsfld System.Collections.Generic.Dictionary`2<System.ValueTuple`2<Recipe,System.Int32>,ItemDrop/ItemData> ZenUI.Section.CraftingPanel::RecipeItemCloneCache
IL_0072: ldarg.0
IL_0073: ldarg.1
IL_0074: newobj System.Void System.ValueTuple`2<Recipe,System.Int32>::.ctor(!0,!1)
IL_0079: ldloc.0
IL_007a: callvirt System.Void System.Collections.Generic.Dictionary`2<System.ValueTuple`2<Recipe,System.Int32>,ItemDrop/ItemData>::Add(!0,!1)
IL_007f: ldloc.0
IL_0080: ldarg.0
IL_0081: call System.Int32 ZenUI.Section.CraftingPanel::GetAmount(Recipe)
IL_0086: stfld System.Int32 ItemDrop/ItemData::m_stack
IL_008b: ldloc.0
IL_008c: ldloc.0
IL_008d: callvirt System.Single ItemDrop/ItemData::GetMaxDurability()
IL_0092: stfld System.Single ItemDrop/ItemData::m_durability
IL_0097: ldloc.0
IL_0098: ldarg.1
IL_0099: stfld System.Int32 ItemDrop/ItemData::m_variant
IL_009e: ldloc.0
IL_009f: ret

// System.Int32 ZenUI.Section.CraftingPanel::GetAmount(Recipe)
.locals System.Int32, ItemDrop/ItemData
IL_0000: ldarg.0
IL_0001: ldc.i4.1
IL_0002: ldloca.s V_0
IL_0004: ldloca.s V_1
IL_0006: ldc.i4.1
IL_0007: callvirt System.Int32 Recipe::GetAmount(System.Int32,System.Int32&,ItemDrop/ItemData&,System.Int32)
IL_000c: ret

// System.Void ZenUI.Section.CraftingPanel::UpdateGridData()
.locals Inventory, System.Int32, System.Collections.Generic.IEnumerator`1<InventoryGui/RecipeDataPair>, InventoryGui/RecipeDataPair, Recipe, System.Int32, System.Int32, ItemDrop/ItemData, Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean
IL_0000: ldstr "Update grid data"
IL_0005: ldc.i4.0
IL_0006: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_000b: ldsfld ZenUI.Section.CraftingPanelGrid ZenUI.Section.CraftingPanel::_craftingGrid
IL_0010: callvirt Inventory InventoryGrid::GetInventory()
IL_0015: stloc.0
IL_0016: ldloc.0
IL_0017: ldfld System.Collections.Generic.List`1<ItemDrop/ItemData> Inventory::m_inventory
IL_001c: callvirt System.Void System.Collections.Generic.List`1<ItemDrop/ItemData>::Clear()
IL_0021: ldsfld System.Collections.Generic.Dictionary`2<ItemDrop/ItemData,InventoryGui/RecipeDataPair> ZenUI.Section.CraftingPanel::ItemRecipeData
IL_0026: callvirt System.Void System.Collections.Generic.Dictionary`2<ItemDrop/ItemData,InventoryGui/RecipeDataPair>::Clear()
IL_002b: ldsfld ZenUI.Section.CraftingPanelGrid ZenUI.Section.CraftingPanel::_craftingGrid
IL_0030: callvirt System.Void ZenUI.Section.CraftingPanelGrid::ResetCache()
IL_0035: ldsfld System.Diagnostics.Stopwatch ZenUI.Section.CraftingPanel::Stopwatch
IL_003a: callvirt System.Void System.Diagnostics.Stopwatch::Restart()
IL_003f: ldc.i4.0
IL_0040: stloc.1
IL_0041: call System.Collections.Generic.IEnumerable`1<InventoryGui/RecipeDataPair> ZenUI.Section.CraftingPanel::get_ActiveRecipes()
IL_0046: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<InventoryGui/RecipeDataPair>::GetEnumerator()
IL_004b: stloc.2
IL_004c: br IL_018e
IL_0051: ldloc.2
IL_0052: callvirt !0 System.Collections.Generic.IEnumerator`1<InventoryGui/RecipeDataPair>::get_Current()
IL_0057: stloc.3
IL_0058: ldloca.s V_3
IL_005a: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_005f: stloc.s V_4
IL_0061: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelHideUncraftableVariants
IL_0066: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_006b: brfalse.s IL_007d
IL_006d: ldloca.s V_3
IL_006f: call System.Boolean InventoryGui/RecipeDataPair::get_CanCraft()
IL_0074: brtrue.s IL_007d
IL_0076: call System.Boolean ZenUI.Section.CraftingPanel::get_IsNoCraftCost()
IL_007b: br.s IL_007e
IL_007d: ldc.i4.1
IL_007e: brtrue.s IL_0083
IL_0080: ldc.i4.1
IL_0081: br.s IL_009b
IL_0083: ldloc.s V_4
IL_0085: ldfld ItemDrop Recipe::m_item
IL_008a: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_008f: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0094: ldfld UnityEngine.Sprite[] ItemDrop/ItemData/SharedData::m_icons
IL_0099: ldlen
IL_009a: conv.i4
IL_009b: stloc.s V_5
IL_009d: ldc.i4.0
IL_009e: stloc.s V_6
IL_00a0: br IL_0185
IL_00a5: ldloc.s V_4
IL_00a7: ldloc.s V_6
IL_00a9: call ItemDrop/ItemData ZenUI.Section.CraftingPanel::GetRecipeItemClone(Recipe,System.Int32)
IL_00ae: stloc.s V_7
IL_00b0: ldloc.s V_7
IL_00b2: ldloc.1
IL_00b3: ldc.i4.5
IL_00b4: rem
IL_00b5: ldloc.1
IL_00b6: ldc.i4.5
IL_00b7: div
IL_00b8: newobj System.Void Vector2i::.ctor(System.Int32,System.Int32)
IL_00bd: stfld Vector2i ItemDrop/ItemData::m_gridPos
IL_00c2: call System.Boolean Zen.Logging`1<ZenUI.Plugin>::get_IsEnabled()
IL_00c7: brfalse IL_0162
IL_00cc: ldc.i4.s 42
IL_00ce: ldc.i4.5
IL_00cf: ldloca.s V_9
IL_00d1: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_00d6: stloc.s V_8
IL_00d8: ldloc.s V_9
IL_00da: brfalse.s IL_015a
IL_00dc: ldloca.s V_8
IL_00de: ldstr "Item: "
IL_00e3: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_00e8: ldloca.s V_8
IL_00ea: ldloc.s V_7
IL_00ec: call System.String Zen.Lib.ItemDataExt::GetPrefabName(ItemDrop/ItemData)
IL_00f1: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_00f6: ldloca.s V_8
IL_00f8: ldstr " Index: "
IL_00fd: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0102: ldloca.s V_8
IL_0104: ldloc.1
IL_0105: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Int32>(!!0)
IL_010a: ldloca.s V_8
IL_010c: ldstr " Variant: "
IL_0111: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0116: ldloca.s V_8
IL_0118: ldloc.s V_6
IL_011a: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Int32>(!!0)
IL_011f: ldloca.s V_8
IL_0121: ldstr " GridPos: "
IL_0126: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_012b: ldloca.s V_8
IL_012d: ldloc.s V_7
IL_012f: ldfld Vector2i ItemDrop/ItemData::m_gridPos
IL_0134: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<Vector2i>(!!0)
IL_0139: ldloca.s V_8
IL_013b: ldstr " Icons: "
IL_0140: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0145: ldloca.s V_8
IL_0147: ldloc.s V_7
IL_0149: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_014e: ldfld UnityEngine.Sprite[] ItemDrop/ItemData/SharedData::m_icons
IL_0153: ldlen
IL_0154: conv.i4
IL_0155: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Int32>(!!0)
IL_015a: ldloc.s V_8
IL_015c: ldc.i4.0
IL_015d: call System.Void Zen.Logging`1<ZenUI.Plugin>::Debug(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_0162: ldsfld ZenUI.Section.CraftingPanelGrid ZenUI.Section.CraftingPanel::_craftingGrid
IL_0167: ldloc.s V_7
IL_0169: callvirt System.Void ZenUI.Section.CraftingPanelGrid::AddItem(ItemDrop/ItemData)
IL_016e: ldsfld System.Collections.Generic.Dictionary`2<ItemDrop/ItemData,InventoryGui/RecipeDataPair> ZenUI.Section.CraftingPanel::ItemRecipeData
IL_0173: ldloc.s V_7
IL_0175: ldloc.3
IL_0176: callvirt System.Void System.Collections.Generic.Dictionary`2<ItemDrop/ItemData,InventoryGui/RecipeDataPair>::Add(!0,!1)
IL_017b: ldloc.1
IL_017c: ldc.i4.1
IL_017d: add
IL_017e: stloc.1
IL_017f: ldloc.s V_6
IL_0181: ldc.i4.1
IL_0182: add
IL_0183: stloc.s V_6
IL_0185: ldloc.s V_6
IL_0187: ldloc.s V_5
IL_0189: blt IL_00a5
IL_018e: ldloc.2
IL_018f: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0194: brtrue IL_0051
IL_0199: leave.s IL_01a5
IL_019b: ldloc.2
IL_019c: brfalse.s IL_01a4
IL_019e: ldloc.2
IL_019f: callvirt System.Void System.IDisposable::Dispose()
IL_01a4: endfinally
IL_01a5: ldsfld System.Diagnostics.Stopwatch ZenUI.Section.CraftingPanel::Stopwatch
IL_01aa: callvirt System.Void System.Diagnostics.Stopwatch::Stop()
IL_01af: ldc.i4.s 17
IL_01b1: ldc.i4.2
IL_01b2: ldloca.s V_9
IL_01b4: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_01b9: stloc.s V_8
IL_01bb: ldloc.s V_9
IL_01bd: brfalse.s IL_01f5
IL_01bf: ldloca.s V_8
IL_01c1: ldstr "Time: "
IL_01c6: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_01cb: ldloca.s V_8
IL_01cd: ldsfld System.Diagnostics.Stopwatch ZenUI.Section.CraftingPanel::Stopwatch
IL_01d2: callvirt System.Int64 System.Diagnostics.Stopwatch::get_ElapsedMilliseconds()
IL_01d7: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Int64>(!!0)
IL_01dc: ldloca.s V_8
IL_01de: ldstr "ms, count: "
IL_01e3: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_01e8: ldloca.s V_8
IL_01ea: ldloc.0
IL_01eb: callvirt System.Int32 Inventory::NrOfItems()
IL_01f0: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Int32>(!!0)
IL_01f5: ldloc.s V_8
IL_01f7: ldc.i4.0
IL_01f8: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_01fd: ldloc.0
IL_01fe: ldc.i4.7
IL_01ff: ldloc.0
IL_0200: callvirt System.Int32 Inventory::NrOfItems()
IL_0205: conv.r4
IL_0206: ldc.r4 5
IL_020b: div
IL_020c: call System.Int32 UnityEngine.Mathf::CeilToInt(System.Single)
IL_0211: call System.Int32 UnityEngine.Mathf::Max(System.Int32,System.Int32)
IL_0216: stfld System.Int32 Inventory::m_height
IL_021b: ldc.i4.s 17
IL_021d: ldc.i4.2
IL_021e: ldloca.s V_9
IL_0220: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_0225: stloc.s V_8
IL_0227: ldloc.s V_9
IL_0229: brfalse.s IL_025d
IL_022b: ldloca.s V_8
IL_022d: ldstr "Inventory size: "
IL_0232: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0237: ldloca.s V_8
IL_0239: ldloc.0
IL_023a: ldfld System.Int32 Inventory::m_width
IL_023f: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Int32>(!!0)
IL_0244: ldloca.s V_8
IL_0246: ldstr "x"
IL_024b: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0250: ldloca.s V_8
IL_0252: ldloc.0
IL_0253: ldfld System.Int32 Inventory::m_height
IL_0258: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Int32>(!!0)
IL_025d: ldloc.s V_8
IL_025f: ldc.i4.0
IL_0260: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_0265: ret
// EH Finally: 76 - 411 => 411 - 421

// System.Void ZenUI.Section.CraftingPanel::RestoreScrollPosition()
.locals ZenUI.Section.CraftingPanel/CraftGroup
IL_0000: ldstr "Restore scroll position"
IL_0005: ldc.i4.0
IL_0006: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_000b: ldloca.s V_0
IL_000d: call System.Boolean ZenUI.Section.CraftingPanel::TryGetCurrentGroup(ZenUI.Section.CraftingPanel/CraftGroup&)
IL_0012: brfalse.s IL_002e
IL_0014: ldsfld ZenUI.Section.CraftingPanelGrid ZenUI.Section.CraftingPanel::_craftingGrid
IL_0019: callvirt UnityEngine.UI.ScrollRect ZenUI.Section.CraftingPanelGrid::get_ScrollRect()
IL_001e: ldsfld System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Single> ZenUI.Section.CraftingPanel::ScrollPositions
IL_0023: ldloc.0
IL_0024: callvirt !1 System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Single>::get_Item(!0)
IL_0029: callvirt System.Void UnityEngine.UI.ScrollRect::set_verticalNormalizedPosition(System.Single)
IL_002e: ret

// System.Void ZenUI.Section.CraftingPanel::Shutdown()
.locals 
IL_0000: ldsfld ZenUI.Section.CraftingPanelGrid ZenUI.Section.CraftingPanel::_craftingGrid
IL_0005: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: call InventoryGui InventoryGui::get_instance()
IL_0012: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0017: brfalse.s IL_0032
IL_0019: call InventoryGui InventoryGui::get_instance()
IL_001e: ldfld TMPro.TMP_Text InventoryGui::m_itemCraftType
IL_0023: callvirt UnityEngine.RectTransform TMPro.TMP_Text::get_rectTransform()
IL_0028: ldsfld UnityEngine.Vector2 ZenUI.Section.CraftingPanel::_craftTypeTextOrigPos
IL_002d: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_0032: call System.Void ZenUI.Compatibility.ActivateOnCopy::Shutdown()
IL_0037: ldsfld ZenUI.Section.CraftingPanelGrid ZenUI.Section.CraftingPanel::_craftingGrid
IL_003c: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0041: call System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_0046: call System.Void ZenUI.Section.CraftingPanel::ResetInfoPanel_KBM()
IL_004b: ret

// System.Boolean ZenUI.Section.CraftingPanel::ShowCraftingGrid(System.Boolean)
.locals Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean
IL_0000: ldsfld UnityEngine.GameObject ZenUI.Section.CraftingPanel::_itemInfoTooltip_KBM
IL_0005: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000a: brfalse.s IL_0017
IL_000c: ldsfld UnityEngine.GameObject ZenUI.Section.CraftingPanel::_itemInfoTooltip_KBM
IL_0011: ldarg.0
IL_0012: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0017: ldarg.0
IL_0018: ldsfld ZenUI.Section.CraftingPanelGrid ZenUI.Section.CraftingPanel::_craftingGrid
IL_001d: callvirt System.Boolean UnityEngine.Behaviour::get_isActiveAndEnabled()
IL_0022: bne.un.s IL_0026
IL_0024: ldarg.0
IL_0025: ret
IL_0026: ldc.i4.s 24
IL_0028: ldc.i4.1
IL_0029: ldloca.s V_1
IL_002b: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_0030: stloc.0
IL_0031: ldloc.1
IL_0032: brfalse.s IL_0048
IL_0034: ldloca.s V_0
IL_0036: ldstr "Show the crafting grid: "
IL_003b: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0040: ldloca.s V_0
IL_0042: ldarg.0
IL_0043: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Boolean>(!!0)
IL_0048: ldloc.0
IL_0049: ldc.i4.0
IL_004a: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_004f: ldsfld ZenUI.Section.CraftingPanelGrid ZenUI.Section.CraftingPanel::_craftingGrid
IL_0054: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0059: ldarg.0
IL_005a: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_005f: ldarg.0
IL_0060: ldc.i4.0
IL_0061: ceq
IL_0063: call System.Void ZenUI.Section.CraftingPanel::ShowVanillaUI(System.Boolean)
IL_0068: ldarg.0
IL_0069: ret

// System.Void ZenUI.Section.CraftingPanel::ShowVanillaUI(System.Boolean)
.locals Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean
IL_0000: ldc.i4.s 41
IL_0002: ldc.i4.1
IL_0003: ldloca.s V_1
IL_0005: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_000a: stloc.0
IL_000b: ldloc.1
IL_000c: brfalse.s IL_0022
IL_000e: ldloca.s V_0
IL_0010: ldstr "Show vanilla crafting panel UI elements: "
IL_0015: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_001a: ldloca.s V_0
IL_001c: ldarg.0
IL_001d: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Boolean>(!!0)
IL_0022: ldloc.0
IL_0023: ldc.i4.0
IL_0024: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_0029: call InventoryGui InventoryGui::get_instance()
IL_002e: dup
IL_002f: ldfld TMPro.TMP_Text InventoryGui::m_recipeDecription
IL_0034: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0039: ldarg.0
IL_003a: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_003f: dup
IL_0040: ldfld UnityEngine.UI.Image InventoryGui::m_recipeIcon
IL_0045: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_004a: ldarg.0
IL_004b: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0050: ldfld TMPro.TMP_Text InventoryGui::m_recipeName
IL_0055: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_005a: ldarg.0
IL_005b: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0060: ldsfld UnityEngine.RectTransform ZenUI.Section.CraftingPanel::_rightPanel
IL_0065: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.UI.Image>()
IL_006a: ldarg.0
IL_006b: callvirt System.Void UnityEngine.Behaviour::set_enabled(System.Boolean)
IL_0070: ldsfld UnityEngine.RectTransform ZenUI.Section.CraftingPanel::_rightPanel
IL_0075: ldarg.0
IL_0076: call System.Void ZenUI.Compatibility.OtherModUI::Show(UnityEngine.Transform,System.Boolean)
IL_007b: ret

// System.Void ZenUI.Section.CraftingPanel::ClearLeftPanel()
.locals System.Collections.IEnumerator, System.IDisposable
IL_0000: ldstr "Clear left panel"
IL_0005: ldc.i4.0
IL_0006: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_000b: call InventoryGui InventoryGui::get_instance()
IL_0010: ldfld UnityEngine.RectTransform InventoryGui::m_recipeListRoot
IL_0015: callvirt System.Collections.IEnumerator UnityEngine.Transform::GetEnumerator()
IL_001a: stloc.0
IL_001b: br.s IL_0032
IL_001d: ldloc.0
IL_001e: callvirt System.Object System.Collections.IEnumerator::get_Current()
IL_0023: castclass UnityEngine.Transform
IL_0028: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_002d: call System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_0032: ldloc.0
IL_0033: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0038: brtrue.s IL_001d
IL_003a: leave.s IL_004d
IL_003c: ldloc.0
IL_003d: isinst System.IDisposable
IL_0042: stloc.1
IL_0043: ldloc.1
IL_0044: brfalse.s IL_004c
IL_0046: ldloc.1
IL_0047: callvirt System.Void System.IDisposable::Dispose()
IL_004c: endfinally
IL_004d: ldc.i4.0
IL_004e: stsfld System.Boolean ZenUI.Section.CraftingPanel::_isLeftPanelDirty
IL_0053: ret
// EH Finally: 27 - 60 => 60 - 77

// System.Void ZenUI.Section.CraftingPanel::UpdateCraftingGroupsUI()
.locals InventoryGui, System.Collections.Generic.IEnumerator`1<System.ValueTuple`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Int32>>, ZenUI.Section.CraftingPanel/<>c__DisplayClass68_0, System.Int32, System.ValueTuple`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Int32>, UnityEngine.GameObject
IL_0000: call InventoryGui InventoryGui::get_instance()
IL_0005: stloc.0
IL_0006: ldc.i4.1
IL_0007: stsfld System.Boolean ZenUI.Section.CraftingPanel::_isLeftPanelDirty
IL_000c: ldsfld System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::ActiveGroups
IL_0011: callvirt System.Int32 System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup>::get_Count()
IL_0016: call System.Void ZenUI.Section.CraftingPanel::UpdateGroupListSizeRect(System.Int32)
IL_001b: ldsfld System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::ActiveGroups
IL_0020: call System.Collections.Generic.IEnumerable`1<System.ValueTuple`2<!!0,System.Int32>> Zen.Lib.IEnumerableExt::WithIndex<ZenUI.Section.CraftingPanel/CraftGroup>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0025: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<System.ValueTuple`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Int32>>::GetEnumerator()
IL_002a: stloc.1
IL_002b: br IL_01ac
IL_0030: newobj System.Void ZenUI.Section.CraftingPanel/<>c__DisplayClass68_0::.ctor()
IL_0035: stloc.2
IL_0036: ldloc.1
IL_0037: callvirt !0 System.Collections.Generic.IEnumerator`1<System.ValueTuple`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Int32>>::get_Current()
IL_003c: stloc.s V_4
IL_003e: ldloc.2
IL_003f: ldloc.s V_4
IL_0041: ldfld !0 System.ValueTuple`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Int32>::Item1
IL_0046: stfld ZenUI.Section.CraftingPanel/CraftGroup ZenUI.Section.CraftingPanel/<>c__DisplayClass68_0::group
IL_004b: ldloc.s V_4
IL_004d: ldfld !1 System.ValueTuple`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Int32>::Item2
IL_0052: stloc.3
IL_0053: ldloc.0
IL_0054: ldfld UnityEngine.GameObject InventoryGui::m_recipeElementPrefab
IL_0059: ldloc.0
IL_005a: ldfld UnityEngine.RectTransform InventoryGui::m_recipeListRoot
IL_005f: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Transform)
IL_0064: stloc.s V_5
IL_0066: ldloc.s V_5
IL_0068: ldc.i4.1
IL_0069: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_006e: ldloc.s V_5
IL_0070: ldloc.2
IL_0071: ldflda ZenUI.Section.CraftingPanel/CraftGroup ZenUI.Section.CraftingPanel/<>c__DisplayClass68_0::group
IL_0076: constrained. ZenUI.Section.CraftingPanel/CraftGroup
IL_007c: callvirt System.String System.Object::ToString()
IL_0081: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_0086: ldloc.s V_5
IL_0088: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_008d: castclass UnityEngine.RectTransform
IL_0092: ldc.r4 0
IL_0097: ldloc.3
IL_0098: conv.r4
IL_0099: ldloc.0
IL_009a: ldfld System.Single InventoryGui::m_recipeListSpace
IL_009f: neg
IL_00a0: mul
IL_00a1: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_00a6: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_00ab: ldloc.s V_5
IL_00ad: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_00b2: ldstr "name"
IL_00b7: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_00bc: callvirt !!0 UnityEngine.Component::GetComponent<TMPro.TMP_Text>()
IL_00c1: ldstr "$CraftGroup_{0}"
IL_00c6: ldloc.2
IL_00c7: ldfld ZenUI.Section.CraftingPanel/CraftGroup ZenUI.Section.CraftingPanel/<>c__DisplayClass68_0::group
IL_00cc: box ZenUI.Section.CraftingPanel/CraftGroup
IL_00d1: call System.String System.String::Format(System.String,System.Object)
IL_00d6: call System.String Zen.Lib.StringExt::Localize(System.String)
IL_00db: callvirt System.Void TMPro.TMP_Text::set_text(System.String)
IL_00e0: ldloc.s V_5
IL_00e2: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_00e7: ldstr "icon"
IL_00ec: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_00f1: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.UI.Image>()
IL_00f6: ldsfld System.Collections.Generic.SortedDictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes> ZenUI.Section.CraftingPanel::CraftGroups
IL_00fb: ldloc.2
IL_00fc: ldfld ZenUI.Section.CraftingPanel/CraftGroup ZenUI.Section.CraftingPanel/<>c__DisplayClass68_0::group
IL_0101: callvirt !1 System.Collections.Generic.SortedDictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>::get_Item(!0)
IL_0106: callvirt UnityEngine.Sprite ZenUI.Section.CraftingPanel/CraftGroupItemTypes::get_Icon()
IL_010b: callvirt System.Void UnityEngine.UI.Image::set_sprite(UnityEngine.Sprite)
IL_0110: ldloc.s V_5
IL_0112: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0117: ldstr "Durability"
IL_011c: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0121: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0126: ldc.i4.0
IL_0127: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_012c: ldloc.s V_5
IL_012e: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0133: ldstr "QualityLevel"
IL_0138: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_013d: dup
IL_013e: callvirt !!0 UnityEngine.Component::GetComponent<TMPro.TMP_Text>()
IL_0143: ldstr ""
IL_0148: callvirt System.Void TMPro.TMP_Text::set_text(System.String)
IL_014d: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0152: ldc.i4.0
IL_0153: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0158: ldloc.s V_5
IL_015a: callvirt !!0 UnityEngine.GameObject::GetComponent<UnityEngine.UI.Button>()
IL_015f: callvirt UnityEngine.UI.Button/ButtonClickedEvent UnityEngine.UI.Button::get_onClick()
IL_0164: ldloc.2
IL_0165: ldftn System.Void ZenUI.Section.CraftingPanel/<>c__DisplayClass68_0::<UpdateCraftingGroupsUI>b__0()
IL_016b: newobj System.Void UnityEngine.Events.UnityAction::.ctor(System.Object,System.IntPtr)
IL_0170: callvirt System.Void UnityEngine.Events.UnityEvent::AddListener(UnityEngine.Events.UnityAction)
IL_0175: ldloc.s V_5
IL_0177: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_017c: ldstr "selected"
IL_0181: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0186: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_018b: ldloc.s V_5
IL_018d: callvirt System.String UnityEngine.Object::get_name()
IL_0192: ldsflda System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::_currentGroup
IL_0197: constrained. System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>
IL_019d: callvirt System.String System.Object::ToString()
IL_01a2: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_01a7: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_01ac: ldloc.1
IL_01ad: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_01b2: brtrue IL_0030
IL_01b7: leave.s IL_01c3
IL_01b9: ldloc.1
IL_01ba: brfalse.s IL_01c2
IL_01bc: ldloc.1
IL_01bd: callvirt System.Void System.IDisposable::Dispose()
IL_01c2: endfinally
IL_01c3: ret
// EH Finally: 43 - 441 => 441 - 451

// System.Void ZenUI.Section.CraftingPanel::UpdateGroupListSizeRect(System.Int32)
.locals InventoryGui
IL_0000: call InventoryGui InventoryGui::get_instance()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldfld UnityEngine.RectTransform InventoryGui::m_recipeListRoot
IL_000c: ldc.i4.1
IL_000d: ldloc.0
IL_000e: ldfld System.Single InventoryGui::m_recipeListBaseSize
IL_0013: ldarg.0
IL_0014: conv.r4
IL_0015: ldloc.0
IL_0016: ldfld System.Single InventoryGui::m_recipeListSpace
IL_001b: mul
IL_001c: call System.Single UnityEngine.Mathf::Max(System.Single,System.Single)
IL_0021: callvirt System.Void UnityEngine.RectTransform::SetSizeWithCurrentAnchors(UnityEngine.RectTransform/Axis,System.Single)
IL_0026: ret

// System.Collections.Generic.IEnumerable`1<InventoryGui/RecipeDataPair> ZenUI.Section.CraftingPanel::SortCraftRecipes(System.Collections.Generic.IEnumerable`1<InventoryGui/RecipeDataPair>)
.locals 
IL_0000: ldstr "Sort crafting group recipes"
IL_0005: ldc.i4.0
IL_0006: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_000b: ldarg.0
IL_000c: ldnull
IL_000d: ldftn System.Boolean ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__IsCraftable|70_4(InventoryGui/RecipeDataPair)
IL_0013: newobj System.Void System.Func`2<InventoryGui/RecipeDataPair,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0018: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::OrderByDescending<InventoryGui/RecipeDataPair,System.Boolean>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_001d: ldnull
IL_001e: ldftn System.Boolean ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__IsRealOrCast|70_5(InventoryGui/RecipeDataPair)
IL_0024: newobj System.Void System.Func`2<InventoryGui/RecipeDataPair,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0029: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::ThenBy<InventoryGui/RecipeDataPair,System.Boolean>(System.Linq.IOrderedEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_002e: ldnull
IL_002f: ldftn ZenUI.Section.CraftingPanel/CraftGroup ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__CraftGroupOrder|70_6(InventoryGui/RecipeDataPair)
IL_0035: newobj System.Void System.Func`2<InventoryGui/RecipeDataPair,ZenUI.Section.CraftingPanel/CraftGroup>::.ctor(System.Object,System.IntPtr)
IL_003a: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::ThenBy<InventoryGui/RecipeDataPair,ZenUI.Section.CraftingPanel/CraftGroup>(System.Linq.IOrderedEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_003f: ldnull
IL_0040: ldftn System.Single ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__SkillTypeOrder|70_7(InventoryGui/RecipeDataPair)
IL_0046: newobj System.Void System.Func`2<InventoryGui/RecipeDataPair,System.Single>::.ctor(System.Object,System.IntPtr)
IL_004b: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::ThenBy<InventoryGui/RecipeDataPair,System.Single>(System.Linq.IOrderedEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_0050: ldnull
IL_0051: ldftn System.String ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__AttackAnimationOrder|70_8(InventoryGui/RecipeDataPair)
IL_0057: newobj System.Void System.Func`2<InventoryGui/RecipeDataPair,System.String>::.ctor(System.Object,System.IntPtr)
IL_005c: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::ThenBy<InventoryGui/RecipeDataPair,System.String>(System.Linq.IOrderedEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_0061: ldnull
IL_0062: ldftn ItemDrop/ItemData/ItemType ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__ItemTypeOrder|70_10(InventoryGui/RecipeDataPair)
IL_0068: newobj System.Void System.Func`2<InventoryGui/RecipeDataPair,ItemDrop/ItemData/ItemType>::.ctor(System.Object,System.IntPtr)
IL_006d: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::ThenBy<InventoryGui/RecipeDataPair,ItemDrop/ItemData/ItemType>(System.Linq.IOrderedEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_0072: ldnull
IL_0073: ldftn System.String ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__AmmoTypeOrder|70_9(InventoryGui/RecipeDataPair)
IL_0079: newobj System.Void System.Func`2<InventoryGui/RecipeDataPair,System.String>::.ctor(System.Object,System.IntPtr)
IL_007e: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::ThenBy<InventoryGui/RecipeDataPair,System.String>(System.Linq.IOrderedEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_0083: ldnull
IL_0084: ldftn System.ValueTuple`3<System.Single,System.Single,System.Int32> ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__DamageOrder|70_11(InventoryGui/RecipeDataPair)
IL_008a: newobj System.Void System.Func`2<InventoryGui/RecipeDataPair,System.ValueTuple`3<System.Single,System.Single,System.Int32>>::.ctor(System.Object,System.IntPtr)
IL_008f: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::ThenBy<InventoryGui/RecipeDataPair,System.ValueTuple`3<System.Single,System.Single,System.Int32>>(System.Linq.IOrderedEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_0094: ldnull
IL_0095: ldftn System.Single ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__ArmorOrder|70_13(InventoryGui/RecipeDataPair)
IL_009b: newobj System.Void System.Func`2<InventoryGui/RecipeDataPair,System.Single>::.ctor(System.Object,System.IntPtr)
IL_00a0: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::ThenBy<InventoryGui/RecipeDataPair,System.Single>(System.Linq.IOrderedEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_00a5: ldnull
IL_00a6: ldftn System.ValueTuple`4<System.Boolean,System.Single,System.Single,System.Single> ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__ShieldOrder|70_12(InventoryGui/RecipeDataPair)
IL_00ac: newobj System.Void System.Func`2<InventoryGui/RecipeDataPair,System.ValueTuple`4<System.Boolean,System.Single,System.Single,System.Single>>::.ctor(System.Object,System.IntPtr)
IL_00b1: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::ThenBy<InventoryGui/RecipeDataPair,System.ValueTuple`4<System.Boolean,System.Single,System.Single,System.Single>>(System.Linq.IOrderedEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_00b6: ldnull
IL_00b7: ldftn System.ValueTuple`2<ZenUI.Section.FoodPanel/FoodType,System.Single> ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__FoodOrder|70_14(InventoryGui/RecipeDataPair)
IL_00bd: newobj System.Void System.Func`2<InventoryGui/RecipeDataPair,System.ValueTuple`2<ZenUI.Section.FoodPanel/FoodType,System.Single>>::.ctor(System.Object,System.IntPtr)
IL_00c2: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::ThenBy<InventoryGui/RecipeDataPair,System.ValueTuple`2<ZenUI.Section.FoodPanel/FoodType,System.Single>>(System.Linq.IOrderedEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_00c7: ldsfld System.Func`2<InventoryGui/RecipeDataPair,System.String> ZenUI.Section.CraftingPanel/<>c::<>9__70_0
IL_00cc: dup
IL_00cd: brtrue.s IL_00e6
IL_00cf: pop
IL_00d0: ldsfld ZenUI.Section.CraftingPanel/<>c ZenUI.Section.CraftingPanel/<>c::<>9
IL_00d5: ldftn System.String ZenUI.Section.CraftingPanel/<>c::<SortCraftRecipes>b__70_0(InventoryGui/RecipeDataPair)
IL_00db: newobj System.Void System.Func`2<InventoryGui/RecipeDataPair,System.String>::.ctor(System.Object,System.IntPtr)
IL_00e0: dup
IL_00e1: stsfld System.Func`2<InventoryGui/RecipeDataPair,System.String> ZenUI.Section.CraftingPanel/<>c::<>9__70_0
IL_00e6: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::ThenBy<InventoryGui/RecipeDataPair,System.String>(System.Linq.IOrderedEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_00eb: ldsfld System.Func`2<InventoryGui/RecipeDataPair,System.String> ZenUI.Section.CraftingPanel/<>c::<>9__70_1
IL_00f0: dup
IL_00f1: brtrue.s IL_010a
IL_00f3: pop
IL_00f4: ldsfld ZenUI.Section.CraftingPanel/<>c ZenUI.Section.CraftingPanel/<>c::<>9
IL_00f9: ldftn System.String ZenUI.Section.CraftingPanel/<>c::<SortCraftRecipes>b__70_1(InventoryGui/RecipeDataPair)
IL_00ff: newobj System.Void System.Func`2<InventoryGui/RecipeDataPair,System.String>::.ctor(System.Object,System.IntPtr)
IL_0104: dup
IL_0105: stsfld System.Func`2<InventoryGui/RecipeDataPair,System.String> ZenUI.Section.CraftingPanel/<>c::<>9__70_1
IL_010a: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::ThenBy<InventoryGui/RecipeDataPair,System.String>(System.Linq.IOrderedEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_010f: ldsfld System.Func`2<InventoryGui/RecipeDataPair,System.String> ZenUI.Section.CraftingPanel/<>c::<>9__70_2
IL_0114: dup
IL_0115: brtrue.s IL_012e
IL_0117: pop
IL_0118: ldsfld ZenUI.Section.CraftingPanel/<>c ZenUI.Section.CraftingPanel/<>c::<>9
IL_011d: ldftn System.String ZenUI.Section.CraftingPanel/<>c::<SortCraftRecipes>b__70_2(InventoryGui/RecipeDataPair)
IL_0123: newobj System.Void System.Func`2<InventoryGui/RecipeDataPair,System.String>::.ctor(System.Object,System.IntPtr)
IL_0128: dup
IL_0129: stsfld System.Func`2<InventoryGui/RecipeDataPair,System.String> ZenUI.Section.CraftingPanel/<>c::<>9__70_2
IL_012e: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::ThenBy<InventoryGui/RecipeDataPair,System.String>(System.Linq.IOrderedEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_0133: ldnull
IL_0134: ldftn System.String ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__StationOrder|70_15(InventoryGui/RecipeDataPair)
IL_013a: newobj System.Void System.Func`2<InventoryGui/RecipeDataPair,System.String>::.ctor(System.Object,System.IntPtr)
IL_013f: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::ThenBy<InventoryGui/RecipeDataPair,System.String>(System.Linq.IOrderedEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_0144: ldnull
IL_0145: ldftn System.ValueTuple`2<System.String,System.Int32> ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__NameOrder|70_16(InventoryGui/RecipeDataPair)
IL_014b: newobj System.Void System.Func`2<InventoryGui/RecipeDataPair,System.ValueTuple`2<System.String,System.Int32>>::.ctor(System.Object,System.IntPtr)
IL_0150: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::ThenBy<InventoryGui/RecipeDataPair,System.ValueTuple`2<System.String,System.Int32>>(System.Linq.IOrderedEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_0155: ldnull
IL_0156: ldftn System.Int32 ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__DebugLog|70_3(InventoryGui/RecipeDataPair)
IL_015c: newobj System.Void System.Func`2<InventoryGui/RecipeDataPair,System.Int32>::.ctor(System.Object,System.IntPtr)
IL_0161: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::ThenBy<InventoryGui/RecipeDataPair,System.Int32>(System.Linq.IOrderedEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_0166: ret

// System.Void ZenUI.Section.CraftingPanel::SelectGroup(System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>)
.locals Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean, System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>, System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>, System.Collections.IEnumerator, UnityEngine.Transform, System.IDisposable
IL_0000: ldc.i4.s 16
IL_0002: ldc.i4.1
IL_0003: ldloca.s V_1
IL_0005: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_000a: stloc.0
IL_000b: ldloc.1
IL_000c: brfalse.s IL_0022
IL_000e: ldloca.s V_0
IL_0010: ldstr "Selected group: "
IL_0015: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_001a: ldloca.s V_0
IL_001c: ldarg.0
IL_001d: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>>(!!0)
IL_0022: ldloc.0
IL_0023: ldc.i4.0
IL_0024: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_0029: ldsfld System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::_currentGroup
IL_002e: stloc.2
IL_002f: ldarg.0
IL_0030: stloc.3
IL_0031: ldloca.s V_2
IL_0033: call !0 System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>::GetValueOrDefault()
IL_0038: ldloca.s V_3
IL_003a: call !0 System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>::GetValueOrDefault()
IL_003f: ceq
IL_0041: ldloca.s V_2
IL_0043: call System.Boolean System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>::get_HasValue()
IL_0048: ldloca.s V_3
IL_004a: call System.Boolean System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>::get_HasValue()
IL_004f: ceq
IL_0051: and
IL_0052: ldc.i4.0
IL_0053: ceq
IL_0055: stsfld System.Boolean ZenUI.Section.CraftingPanel::_isGroupChanged
IL_005a: ldarg.0
IL_005b: stsfld System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::_currentGroup
IL_0060: call System.Void ZenUI.Section.CraftingPanel::UpdateGridData()
IL_0065: call InventoryGui InventoryGui::get_instance()
IL_006a: ldfld UnityEngine.RectTransform InventoryGui::m_recipeListRoot
IL_006f: callvirt System.Collections.IEnumerator UnityEngine.Transform::GetEnumerator()
IL_0074: stloc.s V_4
IL_0076: br.s IL_00b5
IL_0078: ldloc.s V_4
IL_007a: callvirt System.Object System.Collections.IEnumerator::get_Current()
IL_007f: castclass UnityEngine.Transform
IL_0084: stloc.s V_5
IL_0086: ldloc.s V_5
IL_0088: ldstr "selected"
IL_008d: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0092: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0097: ldloc.s V_5
IL_0099: callvirt System.String UnityEngine.Object::get_name()
IL_009e: ldarga.s group
IL_00a0: constrained. System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>
IL_00a6: callvirt System.String System.Object::ToString()
IL_00ab: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00b0: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_00b5: ldloc.s V_4
IL_00b7: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_00bc: brtrue.s IL_0078
IL_00be: leave.s IL_00d5
IL_00c0: ldloc.s V_4
IL_00c2: isinst System.IDisposable
IL_00c7: stloc.s V_6
IL_00c9: ldloc.s V_6
IL_00cb: brfalse.s IL_00d4
IL_00cd: ldloc.s V_6
IL_00cf: callvirt System.Void System.IDisposable::Dispose()
IL_00d4: endfinally
IL_00d5: ret
// EH Finally: 118 - 192 => 192 - 213

// System.Boolean ZenUI.Section.CraftingPanel::IsSelectedItem(ItemDrop/ItemData)
.locals InventoryGui, InventoryGui/RecipeDataPair
IL_0000: call InventoryGui InventoryGui::get_instance()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldflda InventoryGui/RecipeDataPair InventoryGui::m_selectedRecipe
IL_000c: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0011: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0016: brtrue.s IL_001a
IL_0018: ldc.i4.0
IL_0019: ret
IL_001a: ldloc.0
IL_001b: ldflda InventoryGui/RecipeDataPair InventoryGui::m_selectedRecipe
IL_0020: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0025: ldsfld System.Collections.Generic.Dictionary`2<ItemDrop/ItemData,InventoryGui/RecipeDataPair> ZenUI.Section.CraftingPanel::ItemRecipeData
IL_002a: ldarg.0
IL_002b: callvirt !1 System.Collections.Generic.Dictionary`2<ItemDrop/ItemData,InventoryGui/RecipeDataPair>::get_Item(!0)
IL_0030: stloc.1
IL_0031: ldloca.s V_1
IL_0033: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0038: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_003d: brfalse.s IL_004e
IL_003f: ldloc.0
IL_0040: ldfld System.Int32 InventoryGui::m_selectedVariant
IL_0045: ldarg.0
IL_0046: ldfld System.Int32 ItemDrop/ItemData::m_variant
IL_004b: ceq
IL_004d: ret
IL_004e: ldc.i4.0
IL_004f: ret

// System.Void ZenUI.Section.CraftingPanel::SelectItem(ItemDrop/ItemData)
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.1
IL_0002: call System.Void ZenUI.Section.CraftingPanel::SelectItem(ItemDrop/ItemData,System.Boolean)
IL_0007: ret

// System.Void ZenUI.Section.CraftingPanel::SelectItem(ItemDrop/ItemData,System.Boolean)
.locals Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean, InventoryGui/RecipeDataPair
IL_0000: ldarg.1
IL_0001: brfalse.s IL_0018
IL_0003: call System.Boolean ZInput::IsGamepadActive()
IL_0008: brtrue.s IL_0018
IL_000a: ldarg.0
IL_000b: brfalse.s IL_0018
IL_000d: ldarg.0
IL_000e: call System.Boolean ZenUI.Section.CraftingPanel::<SelectItem>g__IsSame|74_0(ItemDrop/ItemData)
IL_0013: brfalse.s IL_0018
IL_0015: ldnull
IL_0016: starg.s item
IL_0018: ldc.i4.s 15
IL_001a: ldc.i4.1
IL_001b: ldloca.s V_1
IL_001d: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_0022: stloc.0
IL_0023: ldloc.1
IL_0024: brfalse.s IL_004e
IL_0026: ldloca.s V_0
IL_0028: ldstr "Selected Item: "
IL_002d: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0032: ldloca.s V_0
IL_0034: ldarg.0
IL_0035: brtrue.s IL_003a
IL_0037: ldnull
IL_0038: br.s IL_0040
IL_003a: ldarg.0
IL_003b: call System.String Zen.Lib.ItemDataExt::GetPrefabName(ItemDrop/ItemData)
IL_0040: dup
IL_0041: brtrue.s IL_0049
IL_0043: pop
IL_0044: ldstr "(none)"
IL_0049: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_004e: ldloc.0
IL_004f: ldc.i4.0
IL_0050: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_0055: call InventoryGui InventoryGui::get_instance()
IL_005a: ldarg.0
IL_005b: brfalse.s IL_006a
IL_005d: ldsfld System.Collections.Generic.Dictionary`2<ItemDrop/ItemData,InventoryGui/RecipeDataPair> ZenUI.Section.CraftingPanel::ItemRecipeData
IL_0062: ldarg.0
IL_0063: callvirt !1 System.Collections.Generic.Dictionary`2<ItemDrop/ItemData,InventoryGui/RecipeDataPair>::get_Item(!0)
IL_0068: br.s IL_0073
IL_006a: ldloca.s V_2
IL_006c: initobj InventoryGui/RecipeDataPair
IL_0072: ldloc.2
IL_0073: stfld InventoryGui/RecipeDataPair InventoryGui::m_selectedRecipe
IL_0078: call InventoryGui InventoryGui::get_instance()
IL_007d: ldarg.0
IL_007e: brtrue.s IL_0083
IL_0080: ldc.i4.0
IL_0081: br.s IL_0089
IL_0083: ldarg.0
IL_0084: ldfld System.Int32 ItemDrop/ItemData::m_variant
IL_0089: stfld System.Int32 InventoryGui::m_selectedVariant
IL_008e: ldarg.0
IL_008f: stsfld ItemDrop/ItemData ZenUI.Section.CraftingPanel::_selectedItem
IL_0094: ret

// System.Void ZenUI.Section.CraftingPanel::UpdateSelectedItemInfo_KBM(ItemDrop/ItemData)
.locals System.Boolean, System.Boolean, System.ValueTuple`3<ItemDrop/ItemData,System.Boolean,System.Boolean>, UnityEngine.Transform, TMPro.TMP_Text, UnityEngine.Transform, TMPro.TMP_Text, ItemDrop/ItemData, System.Boolean, System.Boolean, ItemDrop/ItemData, System.Boolean, System.Boolean, UnityEngine.RectTransform, Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, InventoryElement
IL_0000: ldsfld Player Player::m_localPlayer
IL_0005: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000a: brfalse.s IL_000f
IL_000c: ldarg.0
IL_000d: brtrue.s IL_0015
IL_000f: call System.Void ZenUI.Section.CraftingPanel::ResetInfoPanel_KBM()
IL_0014: ret
IL_0015: ldsfld Player Player::m_localPlayer
IL_001a: ldfld System.Boolean Player::m_inCraftingStation
IL_001f: stloc.0
IL_0020: ldloc.0
IL_0021: brfalse.s IL_0035
IL_0023: ldloc.0
IL_0024: brfalse.s IL_0032
IL_0026: ldsfld UnityEngine.GameObject ZenUI.Section.CraftingPanel::_itemInfoTooltip_KBM
IL_002b: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0030: br.s IL_0036
IL_0032: ldc.i4.0
IL_0033: br.s IL_0036
IL_0035: ldc.i4.1
IL_0036: stloc.1
IL_0037: ldloca.s V_2
IL_0039: ldarg.0
IL_003a: call System.Boolean ZenUI.Section.TooltipSummary::IsDetailMode()
IL_003f: call System.Boolean ZenUI.Section.CraftingPanel::get_IsMulticraftPressed()
IL_0044: call System.Void System.ValueTuple`3<ItemDrop/ItemData,System.Boolean,System.Boolean>::.ctor(!0,!1,!2)
IL_0049: ldloc.2
IL_004a: dup
IL_004b: ldfld !0 System.ValueTuple`3<ItemDrop/ItemData,System.Boolean,System.Boolean>::Item1
IL_0050: stloc.s V_7
IL_0052: dup
IL_0053: ldfld !1 System.ValueTuple`3<ItemDrop/ItemData,System.Boolean,System.Boolean>::Item2
IL_0058: stloc.s V_8
IL_005a: ldfld !2 System.ValueTuple`3<ItemDrop/ItemData,System.Boolean,System.Boolean>::Item3
IL_005f: stloc.s V_9
IL_0061: ldsfld System.ValueTuple`3<ItemDrop/ItemData,System.Boolean,System.Boolean> ZenUI.Section.CraftingPanel::_itemStateLastSelected_KBM
IL_0066: dup
IL_0067: ldfld !0 System.ValueTuple`3<ItemDrop/ItemData,System.Boolean,System.Boolean>::Item1
IL_006c: stloc.s V_10
IL_006e: dup
IL_006f: ldfld !1 System.ValueTuple`3<ItemDrop/ItemData,System.Boolean,System.Boolean>::Item2
IL_0074: stloc.s V_11
IL_0076: ldfld !2 System.ValueTuple`3<ItemDrop/ItemData,System.Boolean,System.Boolean>::Item3
IL_007b: stloc.s V_12
IL_007d: ldloc.s V_7
IL_007f: ldloc.s V_10
IL_0081: bne.un.s IL_0091
IL_0083: ldloc.s V_8
IL_0085: ldloc.s V_11
IL_0087: bne.un.s IL_0091
IL_0089: ldloc.s V_9
IL_008b: ldloc.s V_12
IL_008d: ceq
IL_008f: br.s IL_0092
IL_0091: ldc.i4.0
IL_0092: ldloc.1
IL_0093: and
IL_0094: brfalse.s IL_0097
IL_0096: ret
IL_0097: ldloc.2
IL_0098: stsfld System.ValueTuple`3<ItemDrop/ItemData,System.Boolean,System.Boolean> ZenUI.Section.CraftingPanel::_itemStateLastSelected_KBM
IL_009d: call InventoryGui InventoryGui::get_instance()
IL_00a2: ldfld System.Int32 InventoryGui::m_shownFrames
IL_00a7: ldc.i4.1
IL_00a8: ble IL_0165
IL_00ad: ldsfld UnityEngine.GameObject ZenUI.Section.CraftingPanel::_itemInfoTooltip_KBM
IL_00b2: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_00b7: brtrue IL_0165
IL_00bc: call UnityEngine.GameObject ZenUI.Section.TooltipFormat::get_TooltipPrefab()
IL_00c1: ldsfld ZenUI.Section.CraftingPanelGrid ZenUI.Section.CraftingPanel::_craftingGrid
IL_00c6: ldfld UnityEngine.RectTransform InventoryGrid::m_tooltipAnchor
IL_00cb: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Transform)
IL_00d0: stsfld UnityEngine.GameObject ZenUI.Section.CraftingPanel::_itemInfoTooltip_KBM
IL_00d5: ldsfld UnityEngine.GameObject ZenUI.Section.CraftingPanel::_itemInfoTooltip_KBM
IL_00da: ldstr "ZenUI_ItemInfoTooltip_KBM"
IL_00df: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_00e4: ldsfld UnityEngine.GameObject ZenUI.Section.CraftingPanel::_itemInfoTooltip_KBM
IL_00e9: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_00ee: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Vector2> ZenUI.Configs::CraftPanelInfoPosition
IL_00f3: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Vector2>::get_Value()
IL_00f8: call UnityEngine.Vector3 UnityEngine.Vector2::op_Implicit(UnityEngine.Vector2)
IL_00fd: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_0102: ldsfld UnityEngine.GameObject ZenUI.Section.CraftingPanel::_itemInfoTooltip_KBM
IL_0107: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_010c: ldstr "Bkg"
IL_0111: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0116: castclass UnityEngine.RectTransform
IL_011b: stloc.s V_13
IL_011d: ldloc.s V_13
IL_011f: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0124: brfalse.s IL_015a
IL_0126: ldloc.s V_13
IL_0128: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_012d: ldc.r4 4
IL_0132: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::ValheimTooltipTitle
IL_0137: call UnityEngine.Color Zen.Lib.UIColor::op_Implicit(Zen.Lib.UIColor)
IL_013c: call UnityEngine.UI.Outline Zen.Lib.UI::AddOutline(UnityEngine.GameObject,System.Single,UnityEngine.Color)
IL_0141: pop
IL_0142: ldloc.s V_13
IL_0144: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0149: callvirt !!0 UnityEngine.GameObject::GetComponent<UnityEngine.UI.Image>()
IL_014e: call UnityEngine.Material Zen.Lib.UI/Materials::get_LitPanel()
IL_0153: callvirt System.Void UnityEngine.UI.Graphic::set_material(UnityEngine.Material)
IL_0158: br.s IL_0165
IL_015a: ldstr "Could not setup tooltip Bkg node"
IL_015f: ldc.i4.0
IL_0160: call System.Void Zen.Logging`1<ZenUI.Plugin>::Error(System.Object,System.UInt16)
IL_0165: ldsfld UnityEngine.GameObject ZenUI.Section.CraftingPanel::_itemInfoTooltip_KBM
IL_016a: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_016f: brtrue.s IL_0172
IL_0171: ret
IL_0172: ldc.i4.s 38
IL_0174: ldc.i4.1
IL_0175: ldloca.s V_12
IL_0177: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_017c: stloc.s V_14
IL_017e: ldloc.s V_12
IL_0180: brfalse.s IL_019b
IL_0182: ldloca.s V_14
IL_0184: ldstr "Update selected item info UI element: "
IL_0189: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_018e: ldloca.s V_14
IL_0190: ldarg.0
IL_0191: call System.String Zen.Lib.ItemDataExt::GetName(ItemDrop/ItemData)
IL_0196: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_019b: ldloc.s V_14
IL_019d: ldc.i4.0
IL_019e: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_01a3: ldsfld UnityEngine.GameObject ZenUI.Section.CraftingPanel::_itemInfoTooltip_KBM
IL_01a8: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_01ad: ldstr "Bkg/Text"
IL_01b2: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_01b7: stloc.3
IL_01b8: ldloc.3
IL_01b9: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_01be: brfalse.s IL_01ff
IL_01c0: ldloc.3
IL_01c1: ldloca.s V_4
IL_01c3: callvirt System.Boolean UnityEngine.Component::TryGetComponent<TMPro.TMP_Text>(!!0&)
IL_01c8: brfalse.s IL_01ff
IL_01ca: ldsfld ZenUI.Section.CraftingPanelGrid ZenUI.Section.CraftingPanel::_craftingGrid
IL_01cf: ldarg.0
IL_01d0: ldfld Vector2i ItemDrop/ItemData::m_gridPos
IL_01d5: callvirt InventoryElement ZenUI.Section.CraftingPanelGrid::GetElementAt(Vector2i)
IL_01da: stloc.s V_15
IL_01dc: ldloc.s V_15
IL_01de: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_01e3: brfalse.s IL_020a
IL_01e5: ldloc.s V_4
IL_01e7: ldloc.s V_15
IL_01e9: ldfld UITooltip InventoryElement::m_tooltip
IL_01ee: call System.String ZenUI.Section.TooltipState::GetDynamic(UITooltip)
IL_01f3: call System.String Zen.Lib.StringExt::Localize(System.String)
IL_01f8: callvirt System.Void TMPro.TMP_Text::set_text(System.String)
IL_01fd: br.s IL_020a
IL_01ff: ldstr "Unable to set tooltip body text"
IL_0204: ldc.i4.0
IL_0205: call System.Void Zen.Logging`1<ZenUI.Plugin>::Error(System.Object,System.UInt16)
IL_020a: ldsfld UnityEngine.GameObject ZenUI.Section.CraftingPanel::_itemInfoTooltip_KBM
IL_020f: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0214: ldstr "Bkg/Topic"
IL_0219: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_021e: stloc.s V_5
IL_0220: ldloc.s V_5
IL_0222: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0227: brfalse.s IL_0247
IL_0229: ldloc.s V_5
IL_022b: ldloca.s V_6
IL_022d: callvirt System.Boolean UnityEngine.Component::TryGetComponent<TMPro.TMP_Text>(!!0&)
IL_0232: brfalse.s IL_0247
IL_0234: ldloc.s V_6
IL_0236: ldarg.0
IL_0237: call System.String Zen.Lib.ItemDataExt::GetName(ItemDrop/ItemData)
IL_023c: call System.String Zen.Lib.StringExt::Localize(System.String)
IL_0241: callvirt System.Void TMPro.TMP_Text::set_text(System.String)
IL_0246: ret
IL_0247: ldstr "Unable to set tooltip topic text"
IL_024c: ldc.i4.0
IL_024d: call System.Void Zen.Logging`1<ZenUI.Plugin>::Error(System.Object,System.UInt16)
IL_0252: ret

// System.Void ZenUI.Section.CraftingPanel::ApplySoundFx()
.locals ZDOID
IL_0000: call InventoryGui InventoryGui::get_instance()
IL_0005: ldfld EffectList InventoryGui::m_moveItemEffects
IL_000a: call InventoryGui InventoryGui::get_instance()
IL_000f: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0014: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0019: call UnityEngine.Quaternion UnityEngine.Quaternion::get_identity()
IL_001e: ldnull
IL_001f: ldc.r4 1
IL_0024: ldc.i4.m1
IL_0025: ldloca.s V_0
IL_0027: initobj ZDOID
IL_002d: ldloc.0
IL_002e: callvirt UnityEngine.GameObject[] EffectList::Create(UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Transform,System.Single,System.Int32,ZDOID)
IL_0033: pop
IL_0034: ret

// System.Void ZenUI.Section.CraftingPanel::Game_Start()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelEnabled
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse.s IL_0011
IL_000c: call System.Void ZenUI.Section.CraftingPanel::InitPanel()
IL_0011: ret

// System.Void ZenUI.Section.CraftingPanel::InventoryGui_OnDestroy(InventoryGui)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelEnabled
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse.s IL_0011
IL_000c: call System.Void ZenUI.Section.CraftingPanel::Shutdown()
IL_0011: ret

// System.Void ZenUI.Section.CraftingPanel::InventoryGui_AddRecipeToList(InventoryGui,Recipe,ItemDrop/ItemData,System.Boolean,System.Boolean&)
.locals InventoryGui/RecipeDataPair
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelEnabled
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: ldarg.0
IL_000e: callvirt System.Boolean InventoryGui::InCraftTab()
IL_0013: brtrue.s IL_0016
IL_0015: ret
IL_0016: ldarg.s __runOriginal
IL_0018: ldc.i4.0
IL_0019: stind.i1
IL_001a: ldloca.s V_0
IL_001c: ldarg.1
IL_001d: ldarg.2
IL_001e: ldnull
IL_001f: ldarg.3
IL_0020: call System.Void InventoryGui/RecipeDataPair::.ctor(Recipe,ItemDrop/ItemData,UnityEngine.GameObject,System.Boolean)
IL_0025: ldarg.0
IL_0026: ldfld System.Collections.Generic.List`1<InventoryGui/RecipeDataPair> InventoryGui::m_availableRecipes
IL_002b: ldloc.0
IL_002c: callvirt System.Void System.Collections.Generic.List`1<InventoryGui/RecipeDataPair>::Add(!0)
IL_0031: ret

// System.Void ZenUI.Section.CraftingPanel::UpdateRecipeList()
.locals Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean
IL_0000: ldsfld System.Diagnostics.Stopwatch ZenUI.Section.CraftingPanel::Stopwatch
IL_0005: callvirt System.Void System.Diagnostics.Stopwatch::Restart()
IL_000a: ldstr "Update Recipe List"
IL_000f: ldc.i4.0
IL_0010: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_0015: call System.Void ZenUI.Section.CraftingPanel::ClearLeftPanel()
IL_001a: call System.Void ZenUI.Section.CraftingPanel::SelectDefaultGroup()
IL_001f: call System.Void ZenUI.Section.CraftingPanel::UpdateCraftingGroupsUI()
IL_0024: ldc.i4.8
IL_0025: ldc.i4.1
IL_0026: ldloca.s V_1
IL_0028: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_002d: stloc.0
IL_002e: ldloc.1
IL_002f: brfalse.s IL_005a
IL_0031: ldloca.s V_0
IL_0033: ldstr "Time: "
IL_0038: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_003d: ldloca.s V_0
IL_003f: ldsfld System.Diagnostics.Stopwatch ZenUI.Section.CraftingPanel::Stopwatch
IL_0044: callvirt System.Int64 System.Diagnostics.Stopwatch::get_ElapsedMilliseconds()
IL_0049: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Int64>(!!0)
IL_004e: ldloca.s V_0
IL_0050: ldstr "ms"
IL_0055: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_005a: ldloc.0
IL_005b: ldc.i4.0
IL_005c: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_0061: ret

// System.Void ZenUI.Section.CraftingPanel::SelectDefaultGroup()
.locals System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>
IL_0000: ldsfld System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::ActiveGroups
IL_0005: callvirt System.Int32 System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup>::get_Count()
IL_000a: brtrue.s IL_001b
IL_000c: ldloca.s V_0
IL_000e: initobj System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>
IL_0014: ldloc.0
IL_0015: call System.Void ZenUI.Section.CraftingPanel::SelectGroup(System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>)
IL_001a: ret
IL_001b: call System.Boolean ZenUI.Section.CraftingPanel::get_IsStationChanged()
IL_0020: brtrue.s IL_003b
IL_0022: ldsflda System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::_currentGroup
IL_0027: call System.Boolean System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>::get_HasValue()
IL_002c: brtrue.s IL_0050
IL_002e: ldsfld System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::ActiveGroups
IL_0033: callvirt System.Int32 System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup>::get_Count()
IL_0038: ldc.i4.0
IL_0039: ble.s IL_0050
IL_003b: ldsfld System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::ActiveGroups
IL_0040: call !!0 System.Linq.Enumerable::First<ZenUI.Section.CraftingPanel/CraftGroup>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0045: newobj System.Void System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>::.ctor(!0)
IL_004a: call System.Void ZenUI.Section.CraftingPanel::SelectGroup(System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>)
IL_004f: ret
IL_0050: ldsfld System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::_currentGroup
IL_0055: call System.Void ZenUI.Section.CraftingPanel::SelectGroup(System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>)
IL_005a: ret

// System.Boolean ZenUI.Section.CraftingPanel::FocusOn(ItemDrop/ItemData)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean ZenUI.Section.CraftingPanel::InCurrentGroup(ItemDrop/ItemData)
IL_0006: brtrue.s IL_000a
IL_0008: ldc.i4.0
IL_0009: ret
IL_000a: ldsfld ZenUI.Section.CraftingPanelGrid ZenUI.Section.CraftingPanel::_craftingGrid
IL_000f: ldarg.0
IL_0010: callvirt System.Void ZenUI.Section.CraftingPanelGrid::CenterOn(ItemDrop/ItemData)
IL_0015: ldc.i4.1
IL_0016: ret

// System.Void ZenUI.Section.CraftingPanel::InventoryGui_Update(InventoryGui)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelEnabled
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: ldsfld ZenUI.Section.CraftingPanelGrid ZenUI.Section.CraftingPanel::_craftingGrid
IL_0012: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0017: brtrue.s IL_001a
IL_0019: ret
IL_001a: call System.Boolean InventoryGui::IsVisible()
IL_001f: brtrue.s IL_0022
IL_0021: ret
IL_0022: ldarg.0
IL_0023: callvirt System.Boolean InventoryGui::InCraftTab()
IL_0028: call System.Boolean ZenUI.Section.CraftingPanel::ShowCraftingGrid(System.Boolean)
IL_002d: brtrue.s IL_0030
IL_002f: ret
IL_0030: call System.Void ZenUI.Section.CraftingPanel::UpdateGamepad()
IL_0035: ldsfld ZenUI.Section.CraftingPanelGrid ZenUI.Section.CraftingPanel::_craftingGrid
IL_003a: ldsfld ItemDrop/ItemData ZenUI.Section.CraftingPanel::_selectedItem
IL_003f: callvirt System.Void ZenUI.Section.CraftingPanelGrid::UpdateGui(ItemDrop/ItemData)
IL_0044: call System.Void ZenUI.Section.CraftingPanel::UpdateScrollPosition()
IL_0049: call System.Boolean ZInput::IsGamepadActive()
IL_004e: brtrue.s IL_005a
IL_0050: ldsfld ItemDrop/ItemData ZenUI.Section.CraftingPanel::_selectedItem
IL_0055: call System.Void ZenUI.Section.CraftingPanel::UpdateSelectedItemInfo_KBM(ItemDrop/ItemData)
IL_005a: ldc.i4.0
IL_005b: stsfld System.Boolean ZenUI.Section.CraftingPanel::_isGroupChanged
IL_0060: ldsfld Player Player::m_localPlayer
IL_0065: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_006a: brtrue.s IL_006f
IL_006c: ldnull
IL_006d: br.s IL_0079
IL_006f: ldsfld Player Player::m_localPlayer
IL_0074: callvirt CraftingStation Player::GetCurrentCraftingStation()
IL_0079: stsfld CraftingStation ZenUI.Section.CraftingPanel::_currentStation
IL_007e: ret

// System.Void ZenUI.Section.CraftingPanel::UpdateScrollPosition()
.locals System.Boolean
IL_0000: call System.Boolean ZenUI.Section.CraftingPanel::get_IsStationChanged()
IL_0005: stloc.0
IL_0006: ldsfld System.Boolean ZenUI.Section.CraftingPanel::_isGroupChanged
IL_000b: ldloc.0
IL_000c: or
IL_000d: brfalse.s IL_001b
IL_000f: ldsfld ItemDrop/ItemData ZenUI.Section.CraftingPanel::_selectedItem
IL_0014: call System.Boolean ZenUI.Section.CraftingPanel::FocusOn(ItemDrop/ItemData)
IL_0019: brfalse.s IL_001c
IL_001b: ret
IL_001c: ldnull
IL_001d: call System.Void ZenUI.Section.CraftingPanel::SelectItem(ItemDrop/ItemData)
IL_0022: ldloc.0
IL_0023: brfalse.s IL_002a
IL_0025: call System.Void ZenUI.Section.CraftingPanel::ResetScrollCache()
IL_002a: call System.Void ZenUI.Section.CraftingPanel::RestoreScrollPosition()
IL_002f: ret

// System.Void ZenUI.Section.CraftingPanel::InventoryGui_SetRecipe(InventoryGui,System.Boolean&)
.locals System.Boolean, InventoryGui/RecipeDataPair
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelEnabled
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: ldarg.1
IL_000e: ldind.u1
IL_000f: brtrue.s IL_0012
IL_0011: ret
IL_0012: ldc.i4.1
IL_0013: stloc.0
IL_0014: ldarg.0
IL_0015: ldfld System.Collections.Generic.List`1<InventoryGui/RecipeDataPair> InventoryGui::m_availableRecipes
IL_001a: callvirt System.Int32 System.Collections.Generic.List`1<InventoryGui/RecipeDataPair>::get_Count()
IL_001f: ldc.i4.0
IL_0020: ble.s IL_003c
IL_0022: ldarg.0
IL_0023: ldfld System.Collections.Generic.List`1<InventoryGui/RecipeDataPair> InventoryGui::m_availableRecipes
IL_0028: ldc.i4.0
IL_0029: callvirt !0 System.Collections.Generic.List`1<InventoryGui/RecipeDataPair>::get_Item(System.Int32)
IL_002e: stloc.1
IL_002f: ldloca.s V_1
IL_0031: call UnityEngine.GameObject InventoryGui/RecipeDataPair::get_InterfaceElement()
IL_0036: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_003b: stloc.0
IL_003c: ldarg.1
IL_003d: ldloc.0
IL_003e: stind.i1
IL_003f: ret

// System.Void ZenUI.Section.CraftingPanel::Player_ToggleNoPlacementCost(Player)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelEnabled
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: call System.Void ZenUI.Section.CraftingPanel::ForceRefresh()
IL_0012: ret

// System.Void ZenUI.Section.CraftingPanel::Player_ResetCharacterKnownItems(Player)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelEnabled
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: call System.Void ZenUI.Section.CraftingPanel::ForceRefresh()
IL_0012: ret

// System.Void ZenUI.Section.CraftingPanel::InventoryGui_Awake(InventoryGui)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelEnabled
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: ldarg.0
IL_000e: ldfld TMPro.TMP_Text InventoryGui::m_recipeDecription
IL_0013: call System.Void ZenUI.Compatibility.ActivateOnCopy::Register(UnityEngine.MonoBehaviour)
IL_0018: ldarg.0
IL_0019: ldfld UnityEngine.UI.Image InventoryGui::m_recipeIcon
IL_001e: call System.Void ZenUI.Compatibility.ActivateOnCopy::Register(UnityEngine.MonoBehaviour)
IL_0023: ldarg.0
IL_0024: ldfld TMPro.TMP_Text InventoryGui::m_recipeName
IL_0029: call System.Void ZenUI.Compatibility.ActivateOnCopy::Register(UnityEngine.MonoBehaviour)
IL_002e: ldarg.0
IL_002f: call System.Void ZenUI.Section.CraftingPanel::SetRepairPanelPosition(InventoryGui)
IL_0034: ret

// System.Void ZenUI.Section.CraftingPanel::InventoryGrid_CreateItemTooltip(InventoryGrid,ItemDrop/ItemData,UITooltip,System.Boolean&)
.locals System.String, InventoryGui/RecipeDataPair, UnityEngine.Vector2
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelEnabled
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: ldarg.0
IL_000e: ldsfld ZenUI.Section.CraftingPanelGrid ZenUI.Section.CraftingPanel::_craftingGrid
IL_0013: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0018: brfalse.s IL_001b
IL_001a: ret
IL_001b: ldarg.3
IL_001c: ldc.i4.0
IL_001d: stind.i1
IL_001e: ldsfld System.String System.String::Empty
IL_0023: stloc.0
IL_0024: ldsfld System.Collections.Generic.Dictionary`2<ItemDrop/ItemData,InventoryGui/RecipeDataPair> ZenUI.Section.CraftingPanel::ItemRecipeData
IL_0029: ldarg.1
IL_002a: callvirt !1 System.Collections.Generic.Dictionary`2<ItemDrop/ItemData,InventoryGui/RecipeDataPair>::get_Item(!0)
IL_002f: stloc.1
IL_0030: ldloca.s V_1
IL_0032: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0037: ldfld System.Boolean Recipe::m_requireOnlyOneIngredient
IL_003c: brfalse.s IL_0070
IL_003e: ldarg.1
IL_003f: ldstr "$inventory_onlyoneingredient"
IL_0044: call System.Void Zen.Lib.ItemDataExt::SetTooltipExtra(ItemDrop/ItemData,System.String)
IL_0049: ldarg.1
IL_004a: call System.String Zen.Lib.ItemDataExt::GetTooltipExtra(ItemDrop/ItemData)
IL_004f: ldstr "$inventory_onlyoneingredient"
IL_0054: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0059: brfalse.s IL_0070
IL_005b: ldstr "

<color={0}><align=center>$inventory_onlyoneingredient</align></color>"
IL_0060: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::ValheimTooltipTitle
IL_0065: call System.String System.String::Format(System.String,System.Object)
IL_006a: call System.String Zen.Lib.StringExt::Localize(System.String)
IL_006f: stloc.0
IL_0070: ldarg.2
IL_0071: ldarg.1
IL_0072: call System.String Zen.Lib.ItemDataExt::GetName(ItemDrop/ItemData)
IL_0077: ldarg.1
IL_0078: ldc.i4.m1
IL_0079: ldc.i4.0
IL_007a: call System.String Zen.Lib.ItemDataExt::GetTooltipCrafting(ItemDrop/ItemData,System.Int32,System.Boolean)
IL_007f: ldloc.0
IL_0080: call System.String System.String::Concat(System.String,System.String)
IL_0085: ldarg.0
IL_0086: ldfld UnityEngine.RectTransform InventoryGrid::m_tooltipAnchor
IL_008b: ldloca.s V_2
IL_008d: initobj UnityEngine.Vector2
IL_0093: ldloc.2
IL_0094: callvirt System.Void UITooltip::Set(System.String,System.String,UnityEngine.RectTransform,UnityEngine.Vector2)
IL_0099: ret

// System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> ZenUI.Section.CraftingPanel::InventoryGui_SetupRequirement(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>)
.locals HarmonyLib.CodeMatch[], System.Action`4<UITooltip,UnityEngine.Transform,Piece/Requirement,System.Int32>, HarmonyLib.CodeInstruction[]
IL_0000: ldc.i4.1
IL_0001: newarr HarmonyLib.CodeMatch
IL_0006: dup
IL_0007: ldc.i4.0
IL_0008: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Stfld
IL_000d: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_0012: ldtoken UITooltip
IL_0017: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_001c: ldstr "m_text"
IL_0021: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_0026: ldnull
IL_0027: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_002c: stelem.ref
IL_002d: stloc.0
IL_002e: ldsfld System.Action`4<UITooltip,UnityEngine.Transform,Piece/Requirement,System.Int32> ZenUI.Section.CraftingPanel/<>O::<5>__MakeTooltip
IL_0033: dup
IL_0034: brtrue.s IL_0049
IL_0036: pop
IL_0037: ldnull
IL_0038: ldftn System.Void ZenUI.Section.CraftingPanel::<InventoryGui_SetupRequirement>g__MakeTooltip|91_0(UITooltip,UnityEngine.Transform,Piece/Requirement,System.Int32)
IL_003e: newobj System.Void System.Action`4<UITooltip,UnityEngine.Transform,Piece/Requirement,System.Int32>::.ctor(System.Object,System.IntPtr)
IL_0043: dup
IL_0044: stsfld System.Action`4<UITooltip,UnityEngine.Transform,Piece/Requirement,System.Int32> ZenUI.Section.CraftingPanel/<>O::<5>__MakeTooltip
IL_0049: stloc.1
IL_004a: ldc.i4.5
IL_004b: newarr HarmonyLib.CodeInstruction
IL_0050: dup
IL_0051: ldc.i4.0
IL_0052: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldloc_3
IL_0057: ldnull
IL_0058: newobj System.Void HarmonyLib.CodeInstruction::.ctor(System.Reflection.Emit.OpCode,System.Object)
IL_005d: stelem.ref
IL_005e: dup
IL_005f: ldc.i4.1
IL_0060: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldloc_0
IL_0065: ldnull
IL_0066: newobj System.Void HarmonyLib.CodeInstruction::.ctor(System.Reflection.Emit.OpCode,System.Object)
IL_006b: stelem.ref
IL_006c: dup
IL_006d: ldc.i4.2
IL_006e: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldarg_1
IL_0073: ldnull
IL_0074: newobj System.Void HarmonyLib.CodeInstruction::.ctor(System.Reflection.Emit.OpCode,System.Object)
IL_0079: stelem.ref
IL_007a: dup
IL_007b: ldc.i4.3
IL_007c: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldarg_S
IL_0081: ldc.i4.5
IL_0082: box System.Byte
IL_0087: newobj System.Void HarmonyLib.CodeInstruction::.ctor(System.Reflection.Emit.OpCode,System.Object)
IL_008c: stelem.ref
IL_008d: dup
IL_008e: ldc.i4.4
IL_008f: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_0094: ldloc.1
IL_0095: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_009a: newobj System.Void HarmonyLib.CodeInstruction::.ctor(System.Reflection.Emit.OpCode,System.Object)
IL_009f: stelem.ref
IL_00a0: stloc.2
IL_00a1: ldarg.0
IL_00a2: ldnull
IL_00a3: newobj System.Void HarmonyLib.CodeMatcher::.ctor(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>,System.Reflection.Emit.ILGenerator)
IL_00a8: ldloc.0
IL_00a9: call HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::MatchEndForward(HarmonyLib.CodeMatch[])
IL_00ae: ldstr "Unable to match IL sequence"
IL_00b3: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::ThrowIfInvalid(System.String)
IL_00b8: ldc.i4.1
IL_00b9: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Advance(System.Int32)
IL_00be: ldloc.2
IL_00bf: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Insert(HarmonyLib.CodeInstruction[])
IL_00c4: callvirt System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> HarmonyLib.CodeMatcher::InstructionEnumeration()
IL_00c9: ret

// System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> ZenUI.Section.CraftingPanel::Player_GetAvailableRecipes(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>)
.locals System.Reflection.MethodInfo, System.Func`5<Player,Recipe,System.Int32,System.Boolean,System.Boolean>
IL_0000: ldtoken Player
IL_0005: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_000a: ldstr "RequiredCraftingStation"
IL_000f: ldnull
IL_0010: ldnull
IL_0011: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_0016: stloc.0
IL_0017: ldsfld System.Func`5<Player,Recipe,System.Int32,System.Boolean,System.Boolean> ZenUI.Section.CraftingPanel/<>O::<6>__RequiredCraftingStation
IL_001c: dup
IL_001d: brtrue.s IL_0032
IL_001f: pop
IL_0020: ldnull
IL_0021: ldftn System.Boolean ZenUI.Section.CraftingPanel::<Player_GetAvailableRecipes>g__RequiredCraftingStation|92_0(Player,Recipe,System.Int32,System.Boolean)
IL_0027: newobj System.Void System.Func`5<Player,Recipe,System.Int32,System.Boolean,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_002c: dup
IL_002d: stsfld System.Func`5<Player,Recipe,System.Int32,System.Boolean,System.Boolean> ZenUI.Section.CraftingPanel/<>O::<6>__RequiredCraftingStation
IL_0032: stloc.1
IL_0033: ldarg.0
IL_0034: ldloc.0
IL_0035: ldloc.1
IL_0036: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_003b: call System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> HarmonyLib.Transpilers::MethodReplacer(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>,System.Reflection.MethodBase,System.Reflection.MethodBase)
IL_0040: ret

// System.Void ZenUI.Section.CraftingPanel::InventoryGui_UpdateRecipe(InventoryGui)
.locals System.Single, UnityEngine.Vector2, System.String
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelShowAnyKnownStation
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse.s IL_0012
IL_000c: ldarg.0
IL_000d: call System.Void ZenUI.Section.CraftingPanel::ShowAnyKnownStation(InventoryGui)
IL_0012: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelEnabled
IL_0017: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_001c: brtrue.s IL_001f
IL_001e: ret
IL_001f: ldarg.0
IL_0020: ldfld UnityEngine.UI.Button InventoryGui::m_variantButton
IL_0025: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_002a: ldc.i4.0
IL_002b: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0030: ldarg.0
IL_0031: callvirt System.Boolean InventoryGui::InCraftTab()
IL_0036: brtrue.s IL_003f
IL_0038: ldc.r4 20
IL_003d: br.s IL_0044
IL_003f: ldc.r4 -150
IL_0044: stloc.0
IL_0045: ldarg.0
IL_0046: ldfld TMPro.TMP_Text InventoryGui::m_itemCraftType
IL_004b: callvirt UnityEngine.RectTransform TMPro.TMP_Text::get_rectTransform()
IL_0050: ldsfld UnityEngine.Vector2 ZenUI.Section.CraftingPanel::_craftTypeTextOrigPos
IL_0055: stloc.1
IL_0056: ldloca.s V_1
IL_0058: ldloc.0
IL_0059: stfld System.Single UnityEngine.Vector2::y
IL_005e: ldloc.1
IL_005f: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_0064: ldarg.0
IL_0065: callvirt System.Boolean InventoryGui::InCraftTab()
IL_006a: brfalse.s IL_00a0
IL_006c: call System.Boolean ZenUI.Section.CraftingPanel::get_IsMulticraftPressed()
IL_0071: brtrue.s IL_007a
IL_0073: ldstr "$inventory_craftbutton"
IL_0078: br.s IL_008f
IL_007a: ldstr "$inventory_craftbutton x {0}"
IL_007f: ldarg.0
IL_0080: ldfld System.Int32 InventoryGui::m_multiCraftAmount
IL_0085: box System.Int32
IL_008a: call System.String System.String::Format(System.String,System.Object)
IL_008f: stloc.2
IL_0090: call TMPro.TMP_Text ZenUI.Section.CraftingPanel::get_CraftButtonLabel()
IL_0095: ldloc.2
IL_0096: call System.String Zen.Lib.StringExt::Localize(System.String)
IL_009b: callvirt System.Void TMPro.TMP_Text::set_text(System.String)
IL_00a0: ret

// System.Void ZenUI.Section.CraftingPanel::ShowAnyKnownStation(InventoryGui)
.locals CraftingStation, System.String, System.String, TMPro.TMP_Text
IL_0000: ldsfld Player Player::m_localPlayer
IL_0005: callvirt CraftingStation Player::GetCurrentCraftingStation()
IL_000a: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000f: brfalse.s IL_002f
IL_0011: ldarg.0
IL_0012: ldfld UnityEngine.UI.Image InventoryGui::m_craftingStationIcon
IL_0017: ldnull
IL_0018: callvirt System.Void UnityEngine.UI.Image::set_overrideSprite(UnityEngine.Sprite)
IL_001d: ldarg.0
IL_001e: ldfld UnityEngine.UI.Image InventoryGui::m_craftingStationIcon
IL_0023: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0028: ldc.i4.1
IL_0029: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_002e: ret
IL_002f: ldarg.0
IL_0030: ldflda InventoryGui/RecipeDataPair InventoryGui::m_selectedRecipe
IL_0035: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_003a: dup
IL_003b: dup
IL_003c: brtrue.s IL_0042
IL_003e: pop
IL_003f: ldnull
IL_0040: br.s IL_0047
IL_0042: ldfld CraftingStation Recipe::m_craftingStation
IL_0047: stloc.0
IL_0048: ldarg.0
IL_0049: ldfld UnityEngine.UI.Image InventoryGui::m_craftingStationIcon
IL_004e: ldloc.0
IL_004f: brtrue.s IL_0054
IL_0051: ldnull
IL_0052: br.s IL_005a
IL_0054: ldloc.0
IL_0055: ldfld UnityEngine.Sprite CraftingStation::m_icon
IL_005a: callvirt System.Void UnityEngine.UI.Image::set_overrideSprite(UnityEngine.Sprite)
IL_005f: ldarg.0
IL_0060: ldfld UnityEngine.UI.Image InventoryGui::m_craftingStationIcon
IL_0065: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_006a: ldloc.0
IL_006b: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0070: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0075: dup
IL_0076: brtrue.s IL_007c
IL_0078: pop
IL_0079: ldnull
IL_007a: br.s IL_008b
IL_007c: ldfld ItemDrop Recipe::m_item
IL_0081: call System.String Zen.Lib.ItemDataExt::GetName(ItemDrop)
IL_0086: call System.String Zen.Lib.StringExt::Localize(System.String)
IL_008b: stloc.1
IL_008c: ldloc.0
IL_008d: brtrue.s IL_0092
IL_008f: ldnull
IL_0090: br.s IL_009d
IL_0092: ldloc.0
IL_0093: call System.String CraftingStation::GetHoverName()
IL_0098: call System.String Zen.Lib.StringExt::Localize(System.String)
IL_009d: dup
IL_009e: brtrue.s IL_00ab
IL_00a0: pop
IL_00a1: ldstr "$inventory_crafting"
IL_00a6: call System.String Zen.Lib.StringExt::Localize(System.String)
IL_00ab: stloc.2
IL_00ac: ldarg.0
IL_00ad: ldfld TMPro.TMP_Text InventoryGui::m_craftingStationName
IL_00b2: stloc.3
IL_00b3: ldloc.1
IL_00b4: brfalse.s IL_00cd
IL_00b6: ldloc.3
IL_00b7: ldstr "{0}
<size=24><color={1}>{2}</color></size>"
IL_00bc: ldloc.1
IL_00bd: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::Gray
IL_00c2: ldloc.2
IL_00c3: call System.String System.String::Format(System.String,System.Object,System.Object,System.Object)
IL_00c8: callvirt System.Void TMPro.TMP_Text::set_text(System.String)
IL_00cd: ret

// System.Void ZenUI.Section.CraftingPanel::InventoryGui_OnTabCraftPressed(InventoryGui)
.locals 
IL_0000: ldsfld ItemDrop/ItemData ZenUI.Section.CraftingPanel::_selectedItem
IL_0005: ldc.i4.0
IL_0006: call System.Void ZenUI.Section.CraftingPanel::SelectItem(ItemDrop/ItemData,System.Boolean)
IL_000b: ret

// System.Void ZenUI.Section.CraftingPanel::InventoryGui_Hide(InventoryGui)
.locals 
IL_0000: call System.Void ZenUI.Section.CraftingPanel::ResetInfoPanel_KBM()
IL_0005: ret

// System.Void ZenUI.Section.CraftingPanel::InventoryGui_Show(InventoryGui)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::NoSlideAnimation
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: ldarg.0
IL_000e: ldsfld Player Player::m_localPlayer
IL_0013: callvirt System.Void InventoryGui::UpdateContainer(Player)
IL_0018: ldarg.0
IL_0019: ldsfld Player Player::m_localPlayer
IL_001e: call System.Single UnityEngine.Time::get_deltaTime()
IL_0023: callvirt System.Void InventoryGui::UpdateRecipe(Player,System.Single)
IL_0028: ldarg.0
IL_0029: callvirt System.Void InventoryGui::UpdateRepair()
IL_002e: call System.Boolean ZenUI.Section.CraftingPanel::get_IsStationChanged()
IL_0033: brtrue.s IL_0040
IL_0035: ldsfld ItemDrop/ItemData ZenUI.Section.CraftingPanel::_selectedItem
IL_003a: call System.Boolean ZenUI.Section.CraftingPanel::FocusOn(ItemDrop/ItemData)
IL_003f: pop
IL_0040: ret

// System.Void ZenUI.Section.CraftingPanel::UITooltip_OnHoverStart()
.locals UnityEngine.GameObject
IL_0000: ldsfld UnityEngine.GameObject UITooltip::m_tooltip
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000c: brfalse.s IL_004b
IL_000e: ldsfld ZenUI.Section.CraftingPanelGrid ZenUI.Section.CraftingPanel::_craftingGrid
IL_0013: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0018: brfalse.s IL_004b
IL_001a: ldloc.0
IL_001b: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0020: callvirt UnityEngine.Transform UnityEngine.Transform::get_parent()
IL_0025: ldsfld ZenUI.Section.CraftingPanelGrid ZenUI.Section.CraftingPanel::_craftingGrid
IL_002a: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_002f: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0034: brfalse.s IL_004b
IL_0036: ldloc.0
IL_0037: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_003c: call InventoryGui InventoryGui::get_instance()
IL_0041: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0046: callvirt System.Void UnityEngine.Transform::SetParent(UnityEngine.Transform)
IL_004b: ret

// System.Void ZenUI.Section.CraftingPanel::.cctor()
.locals 
IL_0000: newobj System.Void System.Diagnostics.Stopwatch::.ctor()
IL_0005: stsfld System.Diagnostics.Stopwatch ZenUI.Section.CraftingPanel::Stopwatch
IL_000a: ldnull
IL_000b: stsfld ZenUI.Section.CraftingPanelGrid ZenUI.Section.CraftingPanel::_craftingGrid
IL_0010: ldnull
IL_0011: stsfld UnityEngine.RectTransform ZenUI.Section.CraftingPanel::_leftPanel
IL_0016: ldnull
IL_0017: stsfld UnityEngine.RectTransform ZenUI.Section.CraftingPanel::_rightPanel
IL_001c: newobj System.Void System.Collections.Generic.Dictionary`2<System.ValueTuple`2<Recipe,System.Int32>,ItemDrop/ItemData>::.ctor()
IL_0021: stsfld System.Collections.Generic.Dictionary`2<System.ValueTuple`2<Recipe,System.Int32>,ItemDrop/ItemData> ZenUI.Section.CraftingPanel::RecipeItemCloneCache
IL_0026: newobj System.Void System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Single>::.ctor()
IL_002b: stsfld System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Single> ZenUI.Section.CraftingPanel::ScrollPositions
IL_0030: newobj System.Void System.Collections.Generic.Dictionary`2<Recipe,System.Collections.Generic.HashSet`1<ZenUI.Section.CraftingPanel/CraftGroup>>::.ctor()
IL_0035: stsfld System.Collections.Generic.Dictionary`2<Recipe,System.Collections.Generic.HashSet`1<ZenUI.Section.CraftingPanel/CraftGroup>> ZenUI.Section.CraftingPanel::RecipeToGroups
IL_003a: newobj System.Void System.Collections.Generic.Dictionary`2<ItemDrop/ItemData,InventoryGui/RecipeDataPair>::.ctor()
IL_003f: stsfld System.Collections.Generic.Dictionary`2<ItemDrop/ItemData,InventoryGui/RecipeDataPair> ZenUI.Section.CraftingPanel::ItemRecipeData
IL_0044: newobj System.Void System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup>::.ctor()
IL_0049: stsfld System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::ActiveGroups
IL_004e: newobj System.Void System.Collections.Generic.SortedDictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>::.ctor()
IL_0053: dup
IL_0054: ldc.i4.0
IL_0055: ldstr "wisp"
IL_005a: ldtoken ItemDrop/ItemData/ItemType
IL_005f: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0064: call System.Array System.Enum::GetValues(System.Type)
IL_0069: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Cast<ItemDrop/ItemData/ItemType>(System.Collections.IEnumerable)
IL_006e: call System.Collections.Generic.HashSet`1<!!0> System.Linq.Enumerable::ToHashSet<ItemDrop/ItemData/ItemType>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0073: newobj System.Void ZenUI.Section.CraftingPanel/CraftGroupItemTypes::.ctor(System.String,System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>)
IL_0078: callvirt System.Void System.Collections.Generic.SortedDictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>::Add(!0,!1)
IL_007d: dup
IL_007e: ldc.i4.1
IL_007f: ldstr "BattleAxe"
IL_0084: newobj System.Void System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::.ctor()
IL_0089: dup
IL_008a: ldc.i4.3
IL_008b: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_0090: pop
IL_0091: dup
IL_0092: ldc.i4.s 14
IL_0094: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_0099: pop
IL_009a: dup
IL_009b: ldc.i4.4
IL_009c: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_00a1: pop
IL_00a2: dup
IL_00a3: ldc.i4.s 22
IL_00a5: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_00aa: pop
IL_00ab: dup
IL_00ac: ldc.i4.s 20
IL_00ae: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_00b3: pop
IL_00b4: newobj System.Void ZenUI.Section.CraftingPanel/CraftGroupItemTypes::.ctor(System.String,System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>)
IL_00b9: callvirt System.Void System.Collections.Generic.SortedDictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>::Add(!0,!1)
IL_00be: dup
IL_00bf: ldc.i4.2
IL_00c0: ldstr "arrow_iron"
IL_00c5: newobj System.Void System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::.ctor()
IL_00ca: dup
IL_00cb: ldc.i4.s 9
IL_00cd: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_00d2: pop
IL_00d3: dup
IL_00d4: ldc.i4.s 23
IL_00d6: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_00db: pop
IL_00dc: newobj System.Void ZenUI.Section.CraftingPanel/CraftGroupItemTypes::.ctor(System.String,System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>)
IL_00e1: callvirt System.Void System.Collections.Generic.SortedDictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>::Add(!0,!1)
IL_00e6: dup
IL_00e7: ldc.i4.3
IL_00e8: ldstr "HelmetCarapace"
IL_00ed: newobj System.Void System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::.ctor()
IL_00f2: dup
IL_00f3: ldc.i4.6
IL_00f4: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_00f9: pop
IL_00fa: dup
IL_00fb: ldc.i4.7
IL_00fc: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_0101: pop
IL_0102: dup
IL_0103: ldc.i4.s 11
IL_0105: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_010a: pop
IL_010b: dup
IL_010c: ldc.i4.s 17
IL_010e: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_0113: pop
IL_0114: newobj System.Void ZenUI.Section.CraftingPanel/CraftGroupItemTypes::.ctor(System.String,System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>)
IL_0119: callvirt System.Void System.Collections.Generic.SortedDictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>::Add(!0,!1)
IL_011e: dup
IL_011f: ldc.i4.4
IL_0120: ldstr "shield_ironbuckler"
IL_0125: newobj System.Void System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::.ctor()
IL_012a: dup
IL_012b: ldc.i4.5
IL_012c: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_0131: pop
IL_0132: newobj System.Void ZenUI.Section.CraftingPanel/CraftGroupItemTypes::.ctor(System.String,System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>)
IL_0137: callvirt System.Void System.Collections.Generic.SortedDictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>::Add(!0,!1)
IL_013c: dup
IL_013d: ldc.i4.5
IL_013e: ldstr "StaffFireball"
IL_0143: newobj System.Void System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::.ctor()
IL_0148: dup
IL_0149: ldc.i4.s 24
IL_014b: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_0150: pop
IL_0151: newobj System.Void ZenUI.Section.CraftingPanel/CraftGroupItemTypes::.ctor(System.String,System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>)
IL_0156: callvirt System.Void System.Collections.Generic.SortedDictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>::Add(!0,!1)
IL_015b: dup
IL_015c: ldc.i4.6
IL_015d: ldstr "pickaxe_iron"
IL_0162: newobj System.Void System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::.ctor()
IL_0167: dup
IL_0168: ldc.i4.s 19
IL_016a: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_016f: pop
IL_0170: dup
IL_0171: ldc.i4.s 15
IL_0173: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_0178: pop
IL_0179: dup
IL_017a: ldc.i4.s 18
IL_017c: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_0181: pop
IL_0182: dup
IL_0183: ldc.i4.s 16
IL_0185: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_018a: pop
IL_018b: newobj System.Void ZenUI.Section.CraftingPanel/CraftGroupItemTypes::.ctor(System.String,System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>)
IL_0190: callvirt System.Void System.Collections.Generic.SortedDictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>::Add(!0,!1)
IL_0195: dup
IL_0196: ldc.i4.7
IL_0197: ldstr "chest_hildir1"
IL_019c: newobj System.Void System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::.ctor()
IL_01a1: dup
IL_01a2: ldc.i4.s 10
IL_01a4: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_01a9: pop
IL_01aa: newobj System.Void ZenUI.Section.CraftingPanel/CraftGroupItemTypes::.ctor(System.String,System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>)
IL_01af: callvirt System.Void System.Collections.Generic.SortedDictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>::Add(!0,!1)
IL_01b4: dup
IL_01b5: ldc.i4.8
IL_01b6: ldstr "Barrel"
IL_01bb: newobj System.Void System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::.ctor()
IL_01c0: dup
IL_01c1: ldc.i4.1
IL_01c2: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_01c7: pop
IL_01c8: newobj System.Void ZenUI.Section.CraftingPanel/CraftGroupItemTypes::.ctor(System.String,System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>)
IL_01cd: callvirt System.Void System.Collections.Generic.SortedDictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>::Add(!0,!1)
IL_01d2: dup
IL_01d3: ldc.i4.s 9
IL_01d5: ldstr "meat_cooked"
IL_01da: newobj System.Void System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::.ctor()
IL_01df: dup
IL_01e0: ldc.i4.2
IL_01e1: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_01e6: pop
IL_01e7: dup
IL_01e8: ldc.i4.s 21
IL_01ea: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_01ef: pop
IL_01f0: newobj System.Void ZenUI.Section.CraftingPanel/CraftGroupItemTypes::.ctor(System.String,System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>)
IL_01f5: callvirt System.Void System.Collections.Generic.SortedDictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>::Add(!0,!1)
IL_01fa: dup
IL_01fb: ldc.i4.s 10
IL_01fd: ldstr "TrophyDeer"
IL_0202: newobj System.Void System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::.ctor()
IL_0207: dup
IL_0208: ldc.i4.s 13
IL_020a: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_020f: pop
IL_0210: newobj System.Void ZenUI.Section.CraftingPanel/CraftGroupItemTypes::.ctor(System.String,System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>)
IL_0215: callvirt System.Void System.Collections.Generic.SortedDictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>::Add(!0,!1)
IL_021a: dup
IL_021b: ldc.i4.s 11
IL_021d: ldstr "bonefragments"
IL_0222: newobj System.Void System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::.ctor()
IL_0227: dup
IL_0228: ldc.i4.0
IL_0229: callvirt System.Boolean System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>::Add(!0)
IL_022e: pop
IL_022f: newobj System.Void ZenUI.Section.CraftingPanel/CraftGroupItemTypes::.ctor(System.String,System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>)
IL_0234: callvirt System.Void System.Collections.Generic.SortedDictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>::Add(!0,!1)
IL_0239: stsfld System.Collections.Generic.SortedDictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes> ZenUI.Section.CraftingPanel::CraftGroups
IL_023e: newobj System.Void System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>>::.ctor()
IL_0243: dup
IL_0244: ldc.i4.2
IL_0245: newobj System.Void System.Collections.Generic.HashSet`1<System.String>::.ctor()
IL_024a: dup
IL_024b: ldstr "Catapult_ammo"
IL_0250: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.String>::Add(!0)
IL_0255: pop
IL_0256: dup
IL_0257: ldstr "BombSiege"
IL_025c: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.String>::Add(!0)
IL_0261: pop
IL_0262: callvirt System.Void System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>>::Add(!0,!1)
IL_0267: dup
IL_0268: ldc.i4.6
IL_0269: newobj System.Void System.Collections.Generic.HashSet`1<System.String>::.ctor()
IL_026e: dup
IL_026f: ldstr "Pickaxe*"
IL_0274: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.String>::Add(!0)
IL_0279: pop
IL_027a: dup
IL_027b: ldstr "Scythe"
IL_0280: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.String>::Add(!0)
IL_0285: pop
IL_0286: dup
IL_0287: ldstr "FishingRod"
IL_028c: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.String>::Add(!0)
IL_0291: pop
IL_0292: dup
IL_0293: ldstr "Tankard*"
IL_0298: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.String>::Add(!0)
IL_029d: pop
IL_029e: dup
IL_029f: ldstr "KnifeButcher"
IL_02a4: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.String>::Add(!0)
IL_02a9: pop
IL_02aa: dup
IL_02ab: ldstr "Shovel"
IL_02b0: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.String>::Add(!0)
IL_02b5: pop
IL_02b6: callvirt System.Void System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>>::Add(!0,!1)
IL_02bb: dup
IL_02bc: ldc.i4.8
IL_02bd: newobj System.Void System.Collections.Generic.HashSet`1<System.String>::.ctor()
IL_02c2: dup
IL_02c3: ldstr "FishingBait*"
IL_02c8: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.String>::Add(!0)
IL_02cd: pop
IL_02ce: dup
IL_02cf: ldstr "*Uncooked"
IL_02d4: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.String>::Add(!0)
IL_02d9: pop
IL_02da: callvirt System.Void System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>>::Add(!0,!1)
IL_02df: dup
IL_02e0: ldc.i4.5
IL_02e1: newobj System.Void System.Collections.Generic.HashSet`1<System.String>::.ctor()
IL_02e6: dup
IL_02e7: ldstr "Staff*"
IL_02ec: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.String>::Add(!0)
IL_02f1: pop
IL_02f2: dup
IL_02f3: ldstr "-*Uncooked"
IL_02f8: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.String>::Add(!0)
IL_02fd: pop
IL_02fe: callvirt System.Void System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>>::Add(!0,!1)
IL_0303: dup
IL_0304: ldc.i4.s 9
IL_0306: newobj System.Void System.Collections.Generic.HashSet`1<System.String>::.ctor()
IL_030b: dup
IL_030c: ldstr "Feast*"
IL_0311: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.String>::Add(!0)
IL_0316: pop
IL_0317: callvirt System.Void System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>>::Add(!0,!1)
IL_031c: stsfld System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>> ZenUI.Section.CraftingPanel::ExplicitGroupAssignment
IL_0321: newobj System.Void System.Collections.Generic.HashSet`1<System.String>::.ctor()
IL_0326: stsfld System.Collections.Generic.HashSet`1<System.String> ZenUI.Section.CraftingPanel::AllExplicitAssignmentPatterns
IL_032b: ldsfld System.Collections.Generic.SortedDictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes> ZenUI.Section.CraftingPanel::CraftGroups
IL_0330: ldsfld ZenUI.Section.CraftingPanel/<>c ZenUI.Section.CraftingPanel/<>c::<>9
IL_0335: ldftn System.Boolean ZenUI.Section.CraftingPanel/<>c::<.cctor>b__99_0(System.Collections.Generic.KeyValuePair`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>)
IL_033b: newobj System.Void System.Func`2<System.Collections.Generic.KeyValuePair`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0340: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<System.Collections.Generic.KeyValuePair`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0345: ldsfld ZenUI.Section.CraftingPanel/<>c ZenUI.Section.CraftingPanel/<>c::<>9
IL_034a: ldftn System.Collections.Generic.IEnumerable`1<ItemDrop/ItemData/ItemType> ZenUI.Section.CraftingPanel/<>c::<.cctor>b__99_1(System.Collections.Generic.KeyValuePair`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>)
IL_0350: newobj System.Void System.Func`2<System.Collections.Generic.KeyValuePair`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>,System.Collections.Generic.IEnumerable`1<ItemDrop/ItemData/ItemType>>::.ctor(System.Object,System.IntPtr)
IL_0355: call System.Collections.Generic.IEnumerable`1<!!1> System.Linq.Enumerable::SelectMany<System.Collections.Generic.KeyValuePair`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>,ItemDrop/ItemData/ItemType>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Collections.Generic.IEnumerable`1<!!1>>)
IL_035a: call System.Collections.Generic.HashSet`1<!!0> System.Linq.Enumerable::ToHashSet<ItemDrop/ItemData/ItemType>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_035f: stsfld System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType> ZenUI.Section.CraftingPanel::AllKnownTypes
IL_0364: ret

// System.Void ZenUI.Section.CraftingPanel::<InitExplicitGroupConfigs>g__UpdatePatterns|46_0(ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>)
.locals 
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>> ZenUI.Section.CraftingPanel::ExplicitGroupAssignment
IL_0005: ldarg.0
IL_0006: ldarg.1
IL_0007: callvirt System.Void System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>>::set_Item(!0,!1)
IL_000c: call System.Void ZenUI.Section.CraftingPanel::UpdateExplicitAssignmentPatterns()
IL_0011: ret

// System.Boolean ZenUI.Section.CraftingPanel::<AssignRecipeToCraftGroups>g__StartsWith|58_4(System.String,System.String,System.Boolean)
.locals 
IL_0000: ldarg.2
IL_0001: brfalse.s IL_001b
IL_0003: ldarg.1
IL_0004: ldstr "-"
IL_0009: callvirt System.Boolean System.String::StartsWith(System.String)
IL_000e: brtrue.s IL_0012
IL_0010: ldc.i4.0
IL_0011: ret
IL_0012: ldarg.1
IL_0013: ldc.i4.1
IL_0014: callvirt System.String System.String::Substring(System.Int32)
IL_0019: starg.s pattern
IL_001b: ldarg.1
IL_001c: ldstr "*"
IL_0021: callvirt System.Boolean System.String::StartsWith(System.String)
IL_0026: brfalse.s IL_0036
IL_0028: ldarg.0
IL_0029: ldarg.1
IL_002a: ldc.i4.1
IL_002b: callvirt System.String System.String::Substring(System.Int32)
IL_0030: callvirt System.Boolean System.String::EndsWith(System.String)
IL_0035: ret
IL_0036: ldc.i4.0
IL_0037: ret

// System.Boolean ZenUI.Section.CraftingPanel::<AssignRecipeToCraftGroups>g__EndsWith|58_5(System.String,System.String,System.Boolean)
.locals 
IL_0000: ldarg.2
IL_0001: brfalse.s IL_001b
IL_0003: ldarg.1
IL_0004: ldstr "-"
IL_0009: callvirt System.Boolean System.String::StartsWith(System.String)
IL_000e: brtrue.s IL_0012
IL_0010: ldc.i4.0
IL_0011: ret
IL_0012: ldarg.1
IL_0013: ldc.i4.1
IL_0014: callvirt System.String System.String::Substring(System.Int32)
IL_0019: starg.s pattern
IL_001b: ldarg.1
IL_001c: ldstr "*"
IL_0021: callvirt System.Boolean System.String::EndsWith(System.String)
IL_0026: brfalse.s IL_003e
IL_0028: ldarg.0
IL_0029: ldarg.1
IL_002a: ldc.i4.0
IL_002b: ldarg.1
IL_002c: callvirt System.Int32 System.String::get_Length()
IL_0031: ldc.i4.1
IL_0032: sub
IL_0033: callvirt System.String System.String::Substring(System.Int32,System.Int32)
IL_0038: callvirt System.Boolean System.String::StartsWith(System.String)
IL_003d: ret
IL_003e: ldc.i4.0
IL_003f: ret

// System.Int32 ZenUI.Section.CraftingPanel::<UpdateGamepad>g__ActiveGroupIndex|59_0(ZenUI.Section.CraftingPanel/CraftGroup)
.locals System.Int32, System.Collections.Generic.SortedSet`1/Enumerator<ZenUI.Section.CraftingPanel/CraftGroup>, System.Int32
IL_0000: ldc.i4.0
IL_0001: stloc.0
IL_0002: ldsfld System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::ActiveGroups
IL_0007: callvirt System.Collections.Generic.SortedSet`1/Enumerator<!0> System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup>::GetEnumerator()
IL_000c: stloc.1
IL_000d: br.s IL_0021
IL_000f: ldloca.s V_1
IL_0011: call !0 System.Collections.Generic.SortedSet`1/Enumerator<ZenUI.Section.CraftingPanel/CraftGroup>::get_Current()
IL_0016: ldarg.0
IL_0017: bne.un.s IL_001d
IL_0019: ldloc.0
IL_001a: stloc.2
IL_001b: leave.s IL_003c
IL_001d: ldloc.0
IL_001e: ldc.i4.1
IL_001f: add
IL_0020: stloc.0
IL_0021: ldloca.s V_1
IL_0023: call System.Boolean System.Collections.Generic.SortedSet`1/Enumerator<ZenUI.Section.CraftingPanel/CraftGroup>::MoveNext()
IL_0028: brtrue.s IL_000f
IL_002a: leave.s IL_003a
IL_002c: ldloca.s V_1
IL_002e: constrained. System.Collections.Generic.SortedSet`1/Enumerator<ZenUI.Section.CraftingPanel/CraftGroup>
IL_0034: callvirt System.Void System.IDisposable::Dispose()
IL_0039: endfinally
IL_003a: ldc.i4.0
IL_003b: ret
IL_003c: ldloc.2
IL_003d: ret
// EH Finally: 13 - 44 => 44 - 58

// System.Int32 ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__DebugLog|70_3(InventoryGui/RecipeDataPair)
.locals 
IL_0000: call System.Boolean Zen.Logging`1<ZenUI.Plugin>::get_IsEnabled()
IL_0005: pop
IL_0006: ldc.i4.0
IL_0007: ret

// System.Boolean ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__IsCraftable|70_4(InventoryGui/RecipeDataPair)
.locals 
IL_0000: ldarga.s recipeData
IL_0002: call System.Boolean InventoryGui/RecipeDataPair::get_CanCraft()
IL_0007: brfalse.s IL_001e
IL_0009: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelSortCraftable
IL_000e: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0013: brfalse.s IL_001e
IL_0015: call System.Boolean ZenUI.Section.CraftingPanel::get_IsNoCraftCost()
IL_001a: ldc.i4.0
IL_001b: ceq
IL_001d: ret
IL_001e: ldc.i4.0
IL_001f: ret

// System.Boolean ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__IsRealOrCast|70_5(InventoryGui/RecipeDataPair)
.locals ItemDrop/ItemData
IL_0000: ldarga.s recipeData
IL_0002: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0007: ldfld ItemDrop Recipe::m_item
IL_000c: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0011: stloc.0
IL_0012: ldloc.0
IL_0013: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0018: ldfld ItemDrop ItemDrop/ItemData/SharedData::m_appendToolTip
IL_001d: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0022: brfalse.s IL_003a
IL_0024: ldloc.0
IL_0025: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_002a: ldfld ItemDrop ItemDrop/ItemData/SharedData::m_appendToolTip
IL_002f: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0034: callvirt System.Boolean ItemDrop/ItemData::IsEquipable()
IL_0039: ret
IL_003a: ldc.i4.0
IL_003b: ret

// ZenUI.Section.CraftingPanel/CraftGroup ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__CraftGroupOrder|70_6(InventoryGui/RecipeDataPair)
.locals 
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<Recipe,System.Collections.Generic.HashSet`1<ZenUI.Section.CraftingPanel/CraftGroup>> ZenUI.Section.CraftingPanel::RecipeToGroups
IL_0005: ldarga.s recipeData
IL_0007: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_000c: callvirt !1 System.Collections.Generic.Dictionary`2<Recipe,System.Collections.Generic.HashSet`1<ZenUI.Section.CraftingPanel/CraftGroup>>::get_Item(!0)
IL_0011: ldsfld System.Func`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Boolean> ZenUI.Section.CraftingPanel/<>c::<>9__70_17
IL_0016: dup
IL_0017: brtrue.s IL_0030
IL_0019: pop
IL_001a: ldsfld ZenUI.Section.CraftingPanel/<>c ZenUI.Section.CraftingPanel/<>c::<>9
IL_001f: ldftn System.Boolean ZenUI.Section.CraftingPanel/<>c::<SortCraftRecipes>b__70_17(ZenUI.Section.CraftingPanel/CraftGroup)
IL_0025: newobj System.Void System.Func`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_002a: dup
IL_002b: stsfld System.Func`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Boolean> ZenUI.Section.CraftingPanel/<>c::<>9__70_17
IL_0030: call !!0 System.Linq.Enumerable::First<ZenUI.Section.CraftingPanel/CraftGroup>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0035: ret

// System.Single ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__SkillTypeOrder|70_7(InventoryGui/RecipeDataPair)
.locals Skills/SkillType, System.Single
IL_0000: ldarg.0
IL_0001: ldc.i4.1
IL_0002: newarr ZenUI.Section.CraftingPanel/CraftGroup
IL_0007: dup
IL_0008: ldc.i4.0
IL_0009: ldc.i4.2
IL_000a: stelem.i4
IL_000b: call System.Boolean ZenUI.Section.CraftingPanel::IsInGroups(InventoryGui/RecipeDataPair,ZenUI.Section.CraftingPanel/CraftGroup[])
IL_0010: brfalse.s IL_0018
IL_0012: ldc.r4 0
IL_0017: ret
IL_0018: ldarga.s recipeData
IL_001a: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_001f: ldfld ItemDrop Recipe::m_item
IL_0024: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0029: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_002e: ldfld Skills/SkillType ItemDrop/ItemData/SharedData::m_skillType
IL_0033: stloc.0
IL_0034: ldloc.0
IL_0035: ldc.i4.2
IL_0036: beq.s IL_004c
IL_0038: ldloc.0
IL_0039: ldc.i4.s 11
IL_003b: beq.s IL_0044
IL_003d: ldloc.0
IL_003e: ldc.i4.s 14
IL_0040: beq.s IL_0054
IL_0042: br.s IL_005c
IL_0044: ldc.r4 0.5
IL_0049: stloc.1
IL_004a: br.s IL_005f
IL_004c: ldc.r4 0.9
IL_0051: stloc.1
IL_0052: br.s IL_005f
IL_0054: ldc.r4 8.1
IL_0059: stloc.1
IL_005a: br.s IL_005f
IL_005c: ldloc.0
IL_005d: conv.r4
IL_005e: stloc.1
IL_005f: ldloc.1
IL_0060: ret

// System.String ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__AttackAnimationOrder|70_8(InventoryGui/RecipeDataPair)
.locals System.String, System.Int32, System.String, Skills/SkillType, System.Int32
IL_0000: ldarg.0
IL_0001: ldc.i4.2
IL_0002: newarr ZenUI.Section.CraftingPanel/CraftGroup
IL_0007: dup
IL_0008: ldc.i4.0
IL_0009: ldc.i4.1
IL_000a: stelem.i4
IL_000b: dup
IL_000c: ldc.i4.1
IL_000d: ldc.i4.5
IL_000e: stelem.i4
IL_000f: call System.Boolean ZenUI.Section.CraftingPanel::IsInGroups(InventoryGui/RecipeDataPair,ZenUI.Section.CraftingPanel/CraftGroup[])
IL_0014: brtrue.s IL_001c
IL_0016: ldsfld System.String System.String::Empty
IL_001b: ret
IL_001c: ldarga.s recipeData
IL_001e: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0023: ldfld ItemDrop Recipe::m_item
IL_0028: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_002d: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0032: ldfld Attack ItemDrop/ItemData/SharedData::m_attack
IL_0037: ldfld System.String Attack::m_attackAnimation
IL_003c: stloc.0
IL_003d: ldarga.s recipeData
IL_003f: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0044: ldfld ItemDrop Recipe::m_item
IL_0049: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_004e: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0053: ldfld Skills/SkillType ItemDrop/ItemData/SharedData::m_skillType
IL_0058: stloc.3
IL_0059: ldloc.3
IL_005a: ldc.i4.1
IL_005b: beq.s IL_0063
IL_005d: ldloc.3
IL_005e: ldc.i4.2
IL_005f: beq.s IL_0085
IL_0061: br.s IL_00a7
IL_0063: ldloc.0
IL_0064: ldstr "swing_longsword"
IL_0069: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_006e: brtrue.s IL_00a7
IL_0070: ldloc.0
IL_0071: ldstr "greatsword"
IL_0076: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_007b: brtrue.s IL_00a7
IL_007d: ldstr "swing_longsword"
IL_0082: stloc.2
IL_0083: br.s IL_00a9
IL_0085: ldloc.0
IL_0086: ldstr "knife_stab"
IL_008b: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0090: brtrue.s IL_00a7
IL_0092: ldloc.0
IL_0093: ldstr "dual_knives"
IL_0098: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_009d: brtrue.s IL_00a7
IL_009f: ldstr "knife_stab"
IL_00a4: stloc.2
IL_00a5: br.s IL_00a9
IL_00a7: ldloc.0
IL_00a8: stloc.2
IL_00a9: ldloc.2
IL_00aa: stloc.0
IL_00ab: ldloc.0
IL_00ac: ldstr "knife_stab"
IL_00b1: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00b6: brtrue.s IL_00e1
IL_00b8: ldloc.0
IL_00b9: ldstr "dual_knives"
IL_00be: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00c3: brtrue.s IL_00e6
IL_00c5: ldloc.0
IL_00c6: ldstr "swing_longsword"
IL_00cb: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00d0: brtrue.s IL_00eb
IL_00d2: ldloc.0
IL_00d3: ldstr "greatsword"
IL_00d8: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00dd: brtrue.s IL_00f0
IL_00df: br.s IL_00f5
IL_00e1: ldc.i4.1
IL_00e2: stloc.s V_4
IL_00e4: br.s IL_00f8
IL_00e6: ldc.i4.2
IL_00e7: stloc.s V_4
IL_00e9: br.s IL_00f8
IL_00eb: ldc.i4.3
IL_00ec: stloc.s V_4
IL_00ee: br.s IL_00f8
IL_00f0: ldc.i4.4
IL_00f1: stloc.s V_4
IL_00f3: br.s IL_00f8
IL_00f5: ldc.i4.0
IL_00f6: stloc.s V_4
IL_00f8: ldloc.s V_4
IL_00fa: stloc.1
IL_00fb: ldloc.1
IL_00fc: ldc.i4.0
IL_00fd: bgt.s IL_0101
IL_00ff: ldloc.0
IL_0100: ret
IL_0101: ldloca.s V_1
IL_0103: ldstr "00"
IL_0108: call System.String System.Int32::ToString(System.String)
IL_010d: ret

// System.String ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__AmmoTypeOrder|70_9(InventoryGui/RecipeDataPair)
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.1
IL_0002: newarr ZenUI.Section.CraftingPanel/CraftGroup
IL_0007: dup
IL_0008: ldc.i4.0
IL_0009: ldc.i4.2
IL_000a: stelem.i4
IL_000b: call System.Boolean ZenUI.Section.CraftingPanel::IsInGroups(InventoryGui/RecipeDataPair,ZenUI.Section.CraftingPanel/CraftGroup[])
IL_0010: brtrue.s IL_0018
IL_0012: ldsfld System.String System.String::Empty
IL_0017: ret
IL_0018: ldarga.s recipeData
IL_001a: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_001f: ldfld ItemDrop Recipe::m_item
IL_0024: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0029: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_002e: ldfld System.String ItemDrop/ItemData/SharedData::m_ammoType
IL_0033: ret

// ItemDrop/ItemData/ItemType ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__ItemTypeOrder|70_10(InventoryGui/RecipeDataPair)
.locals 
IL_0000: ldarga.s recipeData
IL_0002: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0007: ldfld ItemDrop Recipe::m_item
IL_000c: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0011: call ItemDrop/ItemData/ItemType Zen.Lib.ItemDataExt::GetItemType(ItemDrop/ItemData)
IL_0016: ret

// System.ValueTuple`3<System.Single,System.Single,System.Int32> ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__DamageOrder|70_11(InventoryGui/RecipeDataPair)
.locals ItemDrop/ItemData, HitData/DamageTypes, System.Single, System.Single, System.Int32
IL_0000: ldarga.s recipeData
IL_0002: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0007: ldfld ItemDrop Recipe::m_item
IL_000c: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0011: stloc.0
IL_0012: ldloc.0
IL_0013: callvirt System.Boolean ItemDrop/ItemData::IsWeapon()
IL_0018: brtrue.s IL_003d
IL_001a: ldarg.0
IL_001b: ldc.i4.1
IL_001c: newarr ZenUI.Section.CraftingPanel/CraftGroup
IL_0021: dup
IL_0022: ldc.i4.0
IL_0023: ldc.i4.2
IL_0024: stelem.i4
IL_0025: call System.Boolean ZenUI.Section.CraftingPanel::IsInGroups(InventoryGui/RecipeDataPair,ZenUI.Section.CraftingPanel/CraftGroup[])
IL_002a: brtrue.s IL_003d
IL_002c: ldc.r4 0
IL_0031: ldc.r4 0
IL_0036: ldc.i4.0
IL_0037: newobj System.Void System.ValueTuple`3<System.Single,System.Single,System.Int32>::.ctor(!0,!1,!2)
IL_003c: ret
IL_003d: ldloc.0
IL_003e: callvirt HitData/DamageTypes ItemDrop/ItemData::GetDamage()
IL_0043: stloc.1
IL_0044: ldloca.s V_1
IL_0046: call System.Single HitData/DamageTypes::GetTotalPhysicalDamage()
IL_004b: ldloca.s V_1
IL_004d: call System.Single HitData/DamageTypes::GetTotalElementalDamage()
IL_0052: stloc.2
IL_0053: ldloc.1
IL_0054: ldfld System.Single HitData/DamageTypes::m_spirit
IL_0059: ldloc.1
IL_005a: ldfld System.Single HitData/DamageTypes::m_poison
IL_005f: add
IL_0060: stloc.3
IL_0061: ldarga.s recipeData
IL_0063: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0068: ldfld System.Int32 Recipe::m_minStationLevel
IL_006d: stloc.s V_4
IL_006f: ldloc.2
IL_0070: add
IL_0071: ldloc.3
IL_0072: ldloc.s V_4
IL_0074: newobj System.Void System.ValueTuple`3<System.Single,System.Single,System.Int32>::.ctor(!0,!1,!2)
IL_0079: ret

// System.ValueTuple`4<System.Boolean,System.Single,System.Single,System.Single> ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__ShieldOrder|70_12(InventoryGui/RecipeDataPair)
.locals System.Single, System.Single, System.Single
IL_0000: ldarg.0
IL_0001: ldc.i4.3
IL_0002: newarr ZenUI.Section.CraftingPanel/CraftGroup
IL_0007: dup
IL_0008: ldtoken <PrivateImplementationDetails>/__StaticArrayInitTypeSize=12 <PrivateImplementationDetails>::5BBD5F77399169D2716B4F2AA36EED2B0552B1095BF83C772295A8F5D6A79E18
IL_000d: call System.Void System.Runtime.CompilerServices.RuntimeHelpers::InitializeArray(System.Array,System.RuntimeFieldHandle)
IL_0012: call System.Boolean ZenUI.Section.CraftingPanel::IsInGroups(InventoryGui/RecipeDataPair,ZenUI.Section.CraftingPanel/CraftGroup[])
IL_0017: brtrue.s IL_002f
IL_0019: ldc.i4.0
IL_001a: ldc.r4 0
IL_001f: ldc.r4 0
IL_0024: ldc.r4 0
IL_0029: newobj System.Void System.ValueTuple`4<System.Boolean,System.Single,System.Single,System.Single>::.ctor(!0,!1,!2,!3)
IL_002e: ret
IL_002f: ldarga.s recipeData
IL_0031: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0036: ldfld ItemDrop Recipe::m_item
IL_003b: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0040: dup
IL_0041: callvirt System.Single ItemDrop/ItemData::GetDeflectionForce()
IL_0046: stloc.0
IL_0047: dup
IL_0048: callvirt System.Single ItemDrop/ItemData::GetBaseBlockPower()
IL_004d: stloc.1
IL_004e: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0053: ldfld System.Single ItemDrop/ItemData/SharedData::m_timedBlockBonus
IL_0058: stloc.2
IL_0059: ldloc.2
IL_005a: ldc.r4 0
IL_005f: ceq
IL_0061: ldloc.2
IL_0062: neg
IL_0063: ldloc.1
IL_0064: ldloc.0
IL_0065: newobj System.Void System.ValueTuple`4<System.Boolean,System.Single,System.Single,System.Single>::.ctor(!0,!1,!2,!3)
IL_006a: ret

// System.Single ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__ArmorOrder|70_13(InventoryGui/RecipeDataPair)
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.1
IL_0002: newarr ZenUI.Section.CraftingPanel/CraftGroup
IL_0007: dup
IL_0008: ldc.i4.0
IL_0009: ldc.i4.3
IL_000a: stelem.i4
IL_000b: call System.Boolean ZenUI.Section.CraftingPanel::IsInGroups(InventoryGui/RecipeDataPair,ZenUI.Section.CraftingPanel/CraftGroup[])
IL_0010: brtrue.s IL_0018
IL_0012: ldc.r4 0
IL_0017: ret
IL_0018: ldarga.s recipeData
IL_001a: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_001f: ldfld ItemDrop Recipe::m_item
IL_0024: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0029: callvirt System.Single ItemDrop/ItemData::GetArmor()
IL_002e: ret

// System.ValueTuple`2<ZenUI.Section.FoodPanel/FoodType,System.Single> ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__FoodOrder|70_14(InventoryGui/RecipeDataPair)
.locals ItemDrop/ItemData, System.Single
IL_0000: ldarg.0
IL_0001: ldc.i4.1
IL_0002: newarr ZenUI.Section.CraftingPanel/CraftGroup
IL_0007: dup
IL_0008: ldc.i4.0
IL_0009: ldc.i4.s 9
IL_000b: stelem.i4
IL_000c: call System.Boolean ZenUI.Section.CraftingPanel::IsInGroups(InventoryGui/RecipeDataPair,ZenUI.Section.CraftingPanel/CraftGroup[])
IL_0011: brtrue.s IL_001f
IL_0013: ldc.i4.0
IL_0014: ldc.r4 0
IL_0019: newobj System.Void System.ValueTuple`2<ZenUI.Section.FoodPanel/FoodType,System.Single>::.ctor(!0,!1)
IL_001e: ret
IL_001f: ldarga.s recipeData
IL_0021: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0026: ldfld ItemDrop Recipe::m_item
IL_002b: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0030: stloc.0
IL_0031: ldloc.0
IL_0032: call ZenUI.Section.FoodPanel/FoodType ZenUI.Section.FoodPanel::GetFoodType(ItemDrop/ItemData)
IL_0037: ldloc.0
IL_0038: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_003d: ldfld System.Single ItemDrop/ItemData/SharedData::m_food
IL_0042: ldloc.0
IL_0043: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0048: ldfld System.Single ItemDrop/ItemData/SharedData::m_foodStamina
IL_004d: add
IL_004e: ldloc.0
IL_004f: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0054: ldfld System.Single ItemDrop/ItemData/SharedData::m_foodEitr
IL_0059: add
IL_005a: stloc.1
IL_005b: ldloc.1
IL_005c: newobj System.Void System.ValueTuple`2<ZenUI.Section.FoodPanel/FoodType,System.Single>::.ctor(!0,!1)
IL_0061: ret

// System.String ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__StationOrder|70_15(InventoryGui/RecipeDataPair)
.locals 
IL_0000: ldarga.s recipeData
IL_0002: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0007: ldfld CraftingStation Recipe::m_craftingStation
IL_000c: dup
IL_000d: brtrue.s IL_0013
IL_000f: pop
IL_0010: ldnull
IL_0011: br.s IL_0018
IL_0013: call System.String CraftingStation::GetHoverName()
IL_0018: dup
IL_0019: brtrue.s IL_0021
IL_001b: pop
IL_001c: ldsfld System.String System.String::Empty
IL_0021: ret

// System.ValueTuple`2<System.String,System.Int32> ZenUI.Section.CraftingPanel::<SortCraftRecipes>g__NameOrder|70_16(InventoryGui/RecipeDataPair)
.locals System.Int32
IL_0000: ldarga.s recipeData
IL_0002: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0007: ldfld ItemDrop Recipe::m_item
IL_000c: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0011: call System.String Zen.Lib.ItemDataExt::GetName(ItemDrop/ItemData)
IL_0016: call System.String Zen.Lib.StringExt::Localize(System.String)
IL_001b: ldarga.s recipeData
IL_001d: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0022: ldfld System.Int32 Recipe::m_amount
IL_0027: stloc.0
IL_0028: ldloc.0
IL_0029: newobj System.Void System.ValueTuple`2<System.String,System.Int32>::.ctor(!0,!1)
IL_002e: ret

// System.Boolean ZenUI.Section.CraftingPanel::<SelectItem>g__IsSame|74_0(ItemDrop/ItemData)
.locals System.Int32, InventoryGui/RecipeDataPair
IL_0000: ldarg.0
IL_0001: brtrue.s IL_0005
IL_0003: ldc.i4.0
IL_0004: ret
IL_0005: call InventoryGui InventoryGui::get_instance()
IL_000a: ldflda InventoryGui/RecipeDataPair InventoryGui::m_selectedRecipe
IL_000f: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0014: call InventoryGui InventoryGui::get_instance()
IL_0019: ldfld System.Int32 InventoryGui::m_selectedVariant
IL_001e: stloc.0
IL_001f: ldsfld System.Collections.Generic.Dictionary`2<ItemDrop/ItemData,InventoryGui/RecipeDataPair> ZenUI.Section.CraftingPanel::ItemRecipeData
IL_0024: ldarg.0
IL_0025: callvirt !1 System.Collections.Generic.Dictionary`2<ItemDrop/ItemData,InventoryGui/RecipeDataPair>::get_Item(!0)
IL_002a: stloc.1
IL_002b: ldloca.s V_1
IL_002d: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0032: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0037: brfalse.s IL_0043
IL_0039: ldloc.0
IL_003a: ldarg.0
IL_003b: ldfld System.Int32 ItemDrop/ItemData::m_variant
IL_0040: ceq
IL_0042: ret
IL_0043: ldc.i4.0
IL_0044: ret

// System.Void ZenUI.Section.CraftingPanel::<InventoryGui_SetupRequirement>g__MakeTooltip|91_0(UITooltip,UnityEngine.Transform,Piece/Requirement,System.Int32)
.locals ItemDrop/ItemData, System.Int32, ZenUI.Section.TooltipDataItem, UnityEngine.Vector2
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelTooltipReq
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: ldarg.0
IL_000e: call UnityEngine.GameObject ZenUI.Section.TooltipFormat::get_TooltipPrefab()
IL_0013: stfld UnityEngine.GameObject UITooltip::m_tooltipPrefab
IL_0018: ldarg.0
IL_0019: call System.Boolean ZenUI.Section.TooltipState::IsLastStateChanged(UITooltip)
IL_001e: brfalse.s IL_002d
IL_0020: ldarg.2
IL_0021: ldfld ItemDrop Piece/Requirement::m_resItem
IL_0026: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_002b: brtrue.s IL_002e
IL_002d: ret
IL_002e: ldarg.2
IL_002f: ldfld ItemDrop Piece/Requirement::m_resItem
IL_0034: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0039: stloc.0
IL_003a: ldarg.2
IL_003b: ldfld System.Int32 Piece/Requirement::m_amount
IL_0040: ldarg.3
IL_0041: mul
IL_0042: stloc.1
IL_0043: ldloc.0
IL_0044: ldc.i4.1
IL_0045: ldloc.1
IL_0046: newobj System.Void ZenUI.Section.TooltipDataItem::.ctor(ItemDrop/ItemData,System.Boolean,System.Int32)
IL_004b: stloc.2
IL_004c: ldarg.0
IL_004d: ldloc.0
IL_004e: call System.String Zen.Lib.ItemDataExt::GetName(ItemDrop/ItemData)
IL_0053: ldloc.2
IL_0054: callvirt System.String ZenUI.Section.TooltipDataItem::Detail()
IL_0059: ldarg.1
IL_005a: isinst UnityEngine.RectTransform
IL_005f: ldloca.s V_3
IL_0061: initobj UnityEngine.Vector2
IL_0067: ldloc.3
IL_0068: callvirt System.Void UITooltip::Set(System.String,System.String,UnityEngine.RectTransform,UnityEngine.Vector2)
IL_006d: ldarg.0
IL_006e: ldloc.2
IL_006f: call System.Void ZenUI.Section.TooltipState::SetData(UITooltip,ZenUI.Section.ITooltipData)
IL_0074: ret

// System.Boolean ZenUI.Section.CraftingPanel::<Player_GetAvailableRecipes>g__RequiredCraftingStation|92_0(Player,Recipe,System.Int32,System.Boolean)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelShowAnyKnownStation
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse.s IL_0019
IL_000c: ldarg.0
IL_000d: callvirt CraftingStation Player::GetCurrentCraftingStation()
IL_0012: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0017: brfalse.s IL_0023
IL_0019: ldarg.0
IL_001a: ldarg.1
IL_001b: ldarg.2
IL_001c: ldarg.3
IL_001d: callvirt System.Boolean Player::RequiredCraftingStation(Recipe,System.Int32,System.Boolean)
IL_0022: ret
IL_0023: ldarg.1
IL_0024: ldarg.2
IL_0025: callvirt CraftingStation Recipe::GetRequiredStation(System.Int32)
IL_002a: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_002f: brtrue.s IL_0033
IL_0031: ldc.i4.1
IL_0032: ret
IL_0033: ldarg.3
IL_0034: brtrue.s IL_0038
IL_0036: ldc.i4.1
IL_0037: ret
IL_0038: ldarg.0
IL_0039: ldfld CraftingStation Player::m_currentStation
IL_003e: ldc.i4.1
IL_003f: callvirt System.Int32 CraftingStation::GetLevel(System.Boolean)
IL_0044: ldarg.1
IL_0045: ldarg.2
IL_0046: callvirt System.Int32 Recipe::GetRequiredStationLevel(System.Int32)
IL_004b: bge.s IL_004f
IL_004d: ldc.i4.0
IL_004e: ret
IL_004f: ldc.i4.1
IL_0050: ret

// System.Void ZenUI.Section.CraftingPanel/CraftGroupItemTypes::.ctor(System.String,System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType>)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.String ZenUI.Section.CraftingPanel/CraftGroupItemTypes::<iconSpriteName>P
IL_0007: ldarg.0
IL_0008: ldarg.2
IL_0009: stfld System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType> ZenUI.Section.CraftingPanel/CraftGroupItemTypes::Types
IL_000e: ldarg.0
IL_000f: call System.Void System.Object::.ctor()
IL_0014: ret

// UnityEngine.Sprite ZenUI.Section.CraftingPanel/CraftGroupItemTypes::get_Icon()
.locals UnityEngine.Sprite
IL_0000: ldarg.0
IL_0001: ldfld UnityEngine.Sprite ZenUI.Section.CraftingPanel/CraftGroupItemTypes::_icon
IL_0006: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000b: brtrue.s IL_0027
IL_000d: ldarg.0
IL_000e: call Jotunn.Managers.GUIManager Jotunn.Managers.GUIManager::get_Instance()
IL_0013: ldarg.0
IL_0014: ldfld System.String ZenUI.Section.CraftingPanel/CraftGroupItemTypes::<iconSpriteName>P
IL_0019: callvirt UnityEngine.Sprite Jotunn.Managers.GUIManager::GetSprite(System.String)
IL_001e: dup
IL_001f: stloc.0
IL_0020: stfld UnityEngine.Sprite ZenUI.Section.CraftingPanel/CraftGroupItemTypes::_icon
IL_0025: ldloc.0
IL_0026: ret
IL_0027: ldarg.0
IL_0028: ldfld UnityEngine.Sprite ZenUI.Section.CraftingPanel/CraftGroupItemTypes::_icon
IL_002d: ret

// System.Void ZenUI.Section.CraftingPanel/InventoryGuiUpdateRecipeList::PrefixEarly(InventoryGui)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelEnabled
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: ldarg.0
IL_000e: callvirt System.Boolean InventoryGui::InCraftTab()
IL_0013: brtrue.s IL_0021
IL_0015: ldsfld System.Boolean ZenUI.Section.CraftingPanel::_isLeftPanelDirty
IL_001a: brfalse.s IL_0021
IL_001c: call System.Void ZenUI.Section.CraftingPanel::ClearLeftPanel()
IL_0021: ret

// System.Void ZenUI.Section.CraftingPanel/InventoryGuiUpdateRecipeList::PrefixLate(InventoryGui,System.Collections.Generic.List`1<Recipe>,System.Boolean&)
.locals System.Boolean, System.Collections.Generic.List`1/Enumerator<Recipe>, Recipe, System.Boolean
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelEnabled
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: ldarg.0
IL_000e: callvirt System.Boolean InventoryGui::InCraftTab()
IL_0013: brtrue.s IL_0016
IL_0015: ret
IL_0016: ldsfld System.Boolean ZenUI.Section.CraftingPanel::_isLeftPanelDirty
IL_001b: brfalse.s IL_0022
IL_001d: call System.Void ZenUI.Section.CraftingPanel::ClearLeftPanel()
IL_0022: ldarg.2
IL_0023: ldc.i4.0
IL_0024: stind.i1
IL_0025: call System.Boolean ZenUI.Section.CraftingPanel::get_IsObjectDBRecipesChanged()
IL_002a: brfalse.s IL_0031
IL_002c: call System.Void ZenUI.Section.CraftingPanel::AssignRecipesToCraftGroups()
IL_0031: call ZoneSystem ZoneSystem::get_instance()
IL_0036: ldc.i4.s 25
IL_0038: callvirt System.Boolean ZoneSystem::GetGlobalKey(GlobalKeys)
IL_003d: stloc.0
IL_003e: ldsfld System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::ActiveGroups
IL_0043: callvirt System.Void System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup>::Clear()
IL_0048: ldarg.0
IL_0049: ldfld System.Collections.Generic.List`1<InventoryGui/RecipeDataPair> InventoryGui::m_availableRecipes
IL_004e: callvirt System.Void System.Collections.Generic.List`1<InventoryGui/RecipeDataPair>::Clear()
IL_0053: ldarg.1
IL_0054: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Recipe>::GetEnumerator()
IL_0059: stloc.1
IL_005a: br.s IL_00a0
IL_005c: ldloca.s V_1
IL_005e: call !0 System.Collections.Generic.List`1/Enumerator<Recipe>::get_Current()
IL_0063: stloc.2
IL_0064: ldloc.0
IL_0065: brtrue.s IL_0077
IL_0067: ldsfld Player Player::m_localPlayer
IL_006c: ldloc.2
IL_006d: ldc.i4.0
IL_006e: ldc.i4.1
IL_006f: ldc.i4.1
IL_0070: callvirt System.Boolean Player::HaveRequirements(Recipe,System.Boolean,System.Int32,System.Int32)
IL_0075: br.s IL_0078
IL_0077: ldc.i4.1
IL_0078: stloc.3
IL_0079: call InventoryGui InventoryGui::get_instance()
IL_007e: ldsfld Player Player::m_localPlayer
IL_0083: ldloc.2
IL_0084: ldnull
IL_0085: ldloc.3
IL_0086: callvirt System.Void InventoryGui::AddRecipeToList(Player,Recipe,ItemDrop/ItemData,System.Boolean)
IL_008b: ldsfld System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::ActiveGroups
IL_0090: ldsfld System.Collections.Generic.Dictionary`2<Recipe,System.Collections.Generic.HashSet`1<ZenUI.Section.CraftingPanel/CraftGroup>> ZenUI.Section.CraftingPanel::RecipeToGroups
IL_0095: ldloc.2
IL_0096: callvirt !1 System.Collections.Generic.Dictionary`2<Recipe,System.Collections.Generic.HashSet`1<ZenUI.Section.CraftingPanel/CraftGroup>>::get_Item(!0)
IL_009b: callvirt System.Void System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup>::UnionWith(System.Collections.Generic.IEnumerable`1<!0>)
IL_00a0: ldloca.s V_1
IL_00a2: call System.Boolean System.Collections.Generic.List`1/Enumerator<Recipe>::MoveNext()
IL_00a7: brtrue.s IL_005c
IL_00a9: leave.s IL_00b9
IL_00ab: ldloca.s V_1
IL_00ad: constrained. System.Collections.Generic.List`1/Enumerator<Recipe>
IL_00b3: callvirt System.Void System.IDisposable::Dispose()
IL_00b8: endfinally
IL_00b9: ldsfld System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::ActiveGroups
IL_00be: callvirt System.Int32 System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup>::get_Count()
IL_00c3: ldc.i4.2
IL_00c4: bne.un.s IL_00d2
IL_00c6: ldsfld System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup> ZenUI.Section.CraftingPanel::ActiveGroups
IL_00cb: ldc.i4.0
IL_00cc: callvirt System.Boolean System.Collections.Generic.SortedSet`1<ZenUI.Section.CraftingPanel/CraftGroup>::Remove(!0)
IL_00d1: pop
IL_00d2: ret
// EH Finally: 90 - 171 => 171 - 185

// System.Void ZenUI.Section.CraftingPanel/InventoryGuiUpdateRecipeList::Postfix(InventoryGui)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelEnabled
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: ldarg.0
IL_000e: callvirt System.Boolean InventoryGui::InCraftTab()
IL_0013: brtrue.s IL_0016
IL_0015: ret
IL_0016: call System.Void ZenUI.Section.CraftingPanel::UpdateRecipeList()
IL_001b: ret

// System.Void ZenUI.Section.CraftingPanel/<>c::.cctor()
.locals 
IL_0000: newobj System.Void ZenUI.Section.CraftingPanel/<>c::.ctor()
IL_0005: stsfld ZenUI.Section.CraftingPanel/<>c ZenUI.Section.CraftingPanel/<>c::<>9
IL_000a: ret

// System.Void ZenUI.Section.CraftingPanel/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean ZenUI.Section.CraftingPanel/<>c::<get_ActiveRecipes>b__30_0(InventoryGui/RecipeDataPair)
.locals 
IL_0000: ldarga.s r
IL_0002: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0007: ldfld System.Boolean Recipe::m_noCraftOnlyUpgrade
IL_000c: ldc.i4.0
IL_000d: ceq
IL_000f: ret

// System.Collections.Generic.IEnumerable`1<System.String> ZenUI.Section.CraftingPanel/<>c::<UpdateExplicitAssignmentPatterns>b__47_0(System.Collections.Generic.KeyValuePair`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>>)
.locals 
IL_0000: ldarga.s kv
IL_0002: call !1 System.Collections.Generic.KeyValuePair`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>>::get_Value()
IL_0007: ret

// System.Boolean ZenUI.Section.CraftingPanel/<>c::<AssignRecipesToCraftGroups>b__57_0(Recipe)
.locals 
IL_0000: ldarg.1
IL_0001: ldfld ItemDrop Recipe::m_item
IL_0006: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000b: ret

// System.Boolean ZenUI.Section.CraftingPanel/<>c::<AssignRecipeToCraftGroups>b__58_0(ZenUI.Section.CraftingPanel/CraftGroup)
.locals 
IL_0000: ldarg.1
IL_0001: ldc.i4.0
IL_0002: cgt.un
IL_0004: ret

// System.String ZenUI.Section.CraftingPanel/<>c::<SortCraftRecipes>b__70_0(InventoryGui/RecipeDataPair)
.locals 
IL_0000: ldarga.s data
IL_0002: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0007: ldfld ItemDrop Recipe::m_item
IL_000c: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0011: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0016: ldfld StatusEffect ItemDrop/ItemData/SharedData::m_consumeStatusEffect
IL_001b: dup
IL_001c: brtrue.s IL_0021
IL_001e: pop
IL_001f: ldnull
IL_0020: ret
IL_0021: ldfld System.String StatusEffect::m_category
IL_0026: ret

// System.String ZenUI.Section.CraftingPanel/<>c::<SortCraftRecipes>b__70_1(InventoryGui/RecipeDataPair)
.locals 
IL_0000: ldarga.s data
IL_0002: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0007: ldfld ItemDrop Recipe::m_item
IL_000c: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0011: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0016: ldfld StatusEffect ItemDrop/ItemData/SharedData::m_attackStatusEffect
IL_001b: dup
IL_001c: brtrue.s IL_0021
IL_001e: pop
IL_001f: ldnull
IL_0020: ret
IL_0021: ldfld System.String StatusEffect::m_category
IL_0026: ret

// System.String ZenUI.Section.CraftingPanel/<>c::<SortCraftRecipes>b__70_2(InventoryGui/RecipeDataPair)
.locals 
IL_0000: ldarga.s data
IL_0002: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0007: ldfld ItemDrop Recipe::m_item
IL_000c: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0011: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0016: ldfld StatusEffect ItemDrop/ItemData/SharedData::m_equipStatusEffect
IL_001b: dup
IL_001c: brtrue.s IL_0021
IL_001e: pop
IL_001f: ldnull
IL_0020: ret
IL_0021: ldfld System.String StatusEffect::m_category
IL_0026: ret

// System.Boolean ZenUI.Section.CraftingPanel/<>c::<SortCraftRecipes>b__70_17(ZenUI.Section.CraftingPanel/CraftGroup)
.locals 
IL_0000: ldarg.1
IL_0001: ldc.i4.0
IL_0002: cgt.un
IL_0004: ret

// System.Boolean ZenUI.Section.CraftingPanel/<>c::<.cctor>b__99_0(System.Collections.Generic.KeyValuePair`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>)
.locals 
IL_0000: ldarga.s kvp
IL_0002: call !0 System.Collections.Generic.KeyValuePair`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>::get_Key()
IL_0007: ldc.i4.0
IL_0008: cgt.un
IL_000a: ret

// System.Collections.Generic.IEnumerable`1<ItemDrop/ItemData/ItemType> ZenUI.Section.CraftingPanel/<>c::<.cctor>b__99_1(System.Collections.Generic.KeyValuePair`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>)
.locals 
IL_0000: ldarga.s kvp
IL_0002: call !1 System.Collections.Generic.KeyValuePair`2<ZenUI.Section.CraftingPanel/CraftGroup,ZenUI.Section.CraftingPanel/CraftGroupItemTypes>::get_Value()
IL_0007: ldfld System.Collections.Generic.HashSet`1<ItemDrop/ItemData/ItemType> ZenUI.Section.CraftingPanel/CraftGroupItemTypes::Types
IL_000c: ret

// System.Void ZenUI.Section.CraftingPanel/<>c__DisplayClass46_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void ZenUI.Section.CraftingPanel/<>c__DisplayClass46_0::<InitExplicitGroupConfigs>b__1(System.Object,System.EventArgs)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ZenUI.Section.CraftingPanel/CraftGroup ZenUI.Section.CraftingPanel/<>c__DisplayClass46_0::group
IL_0006: ldarg.0
IL_0007: ldfld BepInEx.Configuration.ConfigEntry`1<Zen.Lib.Config.StringList> ZenUI.Section.CraftingPanel/<>c__DisplayClass46_0::config
IL_000c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<Zen.Lib.Config.StringList>::get_Value()
IL_0011: call System.Collections.Generic.HashSet`1<!!0> System.Linq.Enumerable::ToHashSet<System.String>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0016: call System.Void ZenUI.Section.CraftingPanel::<InitExplicitGroupConfigs>g__UpdatePatterns|46_0(ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>)
IL_001b: ret

// System.Void ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::<AssignRecipeToCraftGroups>g__IsWildcardFound|1(System.Collections.Generic.HashSet`1<System.String>,System.Boolean)
.locals ZenUI.Section.CraftingPanel/<>c__DisplayClass58_1
IL_0000: newobj System.Void ZenUI.Section.CraftingPanel/<>c__DisplayClass58_1::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldarg.0
IL_0008: stfld ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0 ZenUI.Section.CraftingPanel/<>c__DisplayClass58_1::CS$<>8__locals1
IL_000d: ldloc.0
IL_000e: ldarg.2
IL_000f: stfld System.Boolean ZenUI.Section.CraftingPanel/<>c__DisplayClass58_1::isExclude
IL_0014: ldarg.1
IL_0015: ldloc.0
IL_0016: ldfld System.Boolean ZenUI.Section.CraftingPanel/<>c__DisplayClass58_1::isExclude
IL_001b: brtrue.s IL_0025
IL_001d: ldarg.0
IL_001e: ldfld System.String ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::itemPrefabName
IL_0023: br.s IL_0035
IL_0025: ldstr "-"
IL_002a: ldarg.0
IL_002b: ldfld System.String ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::itemPrefabName
IL_0030: call System.String System.String::Concat(System.String,System.String)
IL_0035: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.String>::Contains(!0)
IL_003a: brtrue.s IL_004f
IL_003c: ldarg.1
IL_003d: ldloc.0
IL_003e: ldftn System.Boolean ZenUI.Section.CraftingPanel/<>c__DisplayClass58_1::<AssignRecipeToCraftGroups>b__7(System.String)
IL_0044: newobj System.Void System.Func`2<System.String,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0049: call System.Boolean System.Linq.Enumerable::Any<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_004e: ret
IL_004f: ldc.i4.1
IL_0050: ret

// System.Boolean ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::<AssignRecipeToCraftGroups>g__IsAssignedToGroupExplicitly|2(ZenUI.Section.CraftingPanel/CraftGroup)
.locals System.Collections.Generic.HashSet`1<System.String>, Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>> ZenUI.Section.CraftingPanel::ExplicitGroupAssignment
IL_0005: ldarg.1
IL_0006: ldloca.s V_0
IL_0008: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>>::TryGetValue(!0,!1&)
IL_000d: brfalse.s IL_0019
IL_000f: ldarg.0
IL_0010: ldloc.0
IL_0011: ldc.i4.0
IL_0012: call System.Boolean ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::<AssignRecipeToCraftGroups>g__IsWildcardFound|1(System.Collections.Generic.HashSet`1<System.String>,System.Boolean)
IL_0017: br.s IL_001a
IL_0019: ldc.i4.0
IL_001a: dup
IL_001b: brfalse.s IL_005f
IL_001d: ldc.i4.s 25
IL_001f: ldc.i4.2
IL_0020: ldloca.s V_2
IL_0022: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_0027: stloc.1
IL_0028: ldloc.2
IL_0029: brfalse.s IL_0058
IL_002b: ldloca.s V_1
IL_002d: ldstr "Explicit item: "
IL_0032: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0037: ldloca.s V_1
IL_0039: ldarg.0
IL_003a: ldfld System.String ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::itemPrefabName
IL_003f: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_0044: ldloca.s V_1
IL_0046: ldstr " in group "
IL_004b: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0050: ldloca.s V_1
IL_0052: ldarg.1
IL_0053: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<ZenUI.Section.CraftingPanel/CraftGroup>(!!0)
IL_0058: ldloc.1
IL_0059: ldc.i4.0
IL_005a: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_005f: ret

// System.Boolean ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::<AssignRecipeToCraftGroups>g__IsRemovedFromGroupExplicitly|3(ZenUI.Section.CraftingPanel/CraftGroup)
.locals System.Collections.Generic.HashSet`1<System.String>, Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>> ZenUI.Section.CraftingPanel::ExplicitGroupAssignment
IL_0005: ldarg.1
IL_0006: ldloca.s V_0
IL_0008: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<System.String>>::TryGetValue(!0,!1&)
IL_000d: brfalse.s IL_0019
IL_000f: ldarg.0
IL_0010: ldloc.0
IL_0011: ldc.i4.1
IL_0012: call System.Boolean ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::<AssignRecipeToCraftGroups>g__IsWildcardFound|1(System.Collections.Generic.HashSet`1<System.String>,System.Boolean)
IL_0017: br.s IL_001a
IL_0019: ldc.i4.0
IL_001a: dup
IL_001b: brfalse.s IL_005f
IL_001d: ldc.i4.s 25
IL_001f: ldc.i4.2
IL_0020: ldloca.s V_2
IL_0022: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_0027: stloc.1
IL_0028: ldloc.2
IL_0029: brfalse.s IL_0058
IL_002b: ldloca.s V_1
IL_002d: ldstr "Remove item: "
IL_0032: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0037: ldloca.s V_1
IL_0039: ldarg.0
IL_003a: ldfld System.String ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::itemPrefabName
IL_003f: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_0044: ldloca.s V_1
IL_0046: ldstr " from group "
IL_004b: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0050: ldloca.s V_1
IL_0052: ldarg.1
IL_0053: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<ZenUI.Section.CraftingPanel/CraftGroup>(!!0)
IL_0058: ldloc.1
IL_0059: ldc.i4.0
IL_005a: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_005f: ret

// System.Void ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::<AssignRecipeToCraftGroups>g__AddToGroup|6(ZenUI.Section.CraftingPanel/CraftGroup)
.locals Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean
IL_0000: ldc.i4.s 23
IL_0002: ldc.i4.2
IL_0003: ldloca.s V_1
IL_0005: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_000a: stloc.0
IL_000b: ldloc.1
IL_000c: brfalse.s IL_003b
IL_000e: ldloca.s V_0
IL_0010: ldstr "Add recipe: "
IL_0015: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_001a: ldloca.s V_0
IL_001c: ldarg.0
IL_001d: ldfld System.String ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::itemPrefabName
IL_0022: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_0027: ldloca.s V_0
IL_0029: ldstr " to group: "
IL_002e: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0033: ldloca.s V_0
IL_0035: ldarg.1
IL_0036: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<ZenUI.Section.CraftingPanel/CraftGroup>(!!0)
IL_003b: ldloc.0
IL_003c: ldc.i4.0
IL_003d: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_0042: ldsfld System.Collections.Generic.Dictionary`2<Recipe,System.Collections.Generic.HashSet`1<ZenUI.Section.CraftingPanel/CraftGroup>> ZenUI.Section.CraftingPanel::RecipeToGroups
IL_0047: ldarg.0
IL_0048: ldfld Recipe ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::recipe
IL_004d: ldarg.1
IL_004e: call System.Void Zen.Lib.IDictionaryExt::AddToList<Recipe,ZenUI.Section.CraftingPanel/CraftGroup,System.Collections.Generic.HashSet`1<ZenUI.Section.CraftingPanel/CraftGroup>>(System.Collections.Generic.IDictionary`2<!!0,!!2>,!!0,!!1)
IL_0053: ret

// System.Void ZenUI.Section.CraftingPanel/<>c__DisplayClass58_1::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean ZenUI.Section.CraftingPanel/<>c__DisplayClass58_1::<AssignRecipeToCraftGroups>b__7(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0 ZenUI.Section.CraftingPanel/<>c__DisplayClass58_1::CS$<>8__locals1
IL_0006: ldfld System.String ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::itemPrefabName
IL_000b: ldarg.1
IL_000c: ldarg.0
IL_000d: ldfld System.Boolean ZenUI.Section.CraftingPanel/<>c__DisplayClass58_1::isExclude
IL_0012: call System.Boolean ZenUI.Section.CraftingPanel::<AssignRecipeToCraftGroups>g__StartsWith|58_4(System.String,System.String,System.Boolean)
IL_0017: brtrue.s IL_0031
IL_0019: ldarg.0
IL_001a: ldfld ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0 ZenUI.Section.CraftingPanel/<>c__DisplayClass58_1::CS$<>8__locals1
IL_001f: ldfld System.String ZenUI.Section.CraftingPanel/<>c__DisplayClass58_0::itemPrefabName
IL_0024: ldarg.1
IL_0025: ldarg.0
IL_0026: ldfld System.Boolean ZenUI.Section.CraftingPanel/<>c__DisplayClass58_1::isExclude
IL_002b: call System.Boolean ZenUI.Section.CraftingPanel::<AssignRecipeToCraftGroups>g__EndsWith|58_5(System.String,System.String,System.Boolean)
IL_0030: ret
IL_0031: ldc.i4.1
IL_0032: ret

// System.Void ZenUI.Section.CraftingPanel/<>c__DisplayClass68_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void ZenUI.Section.CraftingPanel/<>c__DisplayClass68_0::<UpdateCraftingGroupsUI>b__0()
.locals 
IL_0000: call System.Void ZenUI.Section.CraftingPanel::ApplySoundFx()
IL_0005: ldarg.0
IL_0006: ldfld ZenUI.Section.CraftingPanel/CraftGroup ZenUI.Section.CraftingPanel/<>c__DisplayClass68_0::group
IL_000b: newobj System.Void System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>::.ctor(!0)
IL_0010: call System.Void ZenUI.Section.CraftingPanel::SelectGroup(System.Nullable`1<ZenUI.Section.CraftingPanel/CraftGroup>)
IL_0015: ret

// System.Boolean ZenUI.Section.CraftingPanelGrid::get_IsUntouchedItemIndicatorEnabled()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelUntouchedItemIndicator
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse.s IL_0023
IL_000c: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::CraftPanelUntouchedItemIndicatorColor
IL_0011: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_0016: ldfld System.Single UnityEngine.Color::a
IL_001b: ldc.r4 0
IL_0020: cgt
IL_0022: ret
IL_0023: ldc.i4.0
IL_0024: ret

// UnityEngine.UI.ScrollRect ZenUI.Section.CraftingPanelGrid::get_ScrollRect()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ScrollRectEnsureVisible InventoryGrid::m_ensureVisible
IL_0006: ldfld UnityEngine.UI.ScrollRect ScrollRectEnsureVisible::mScrollRect
IL_000b: ret

// System.Void ZenUI.Section.CraftingPanelGrid::add_OnSelectedItem(System.Action`1<ItemDrop/ItemData>)
.locals System.Action`1<ItemDrop/ItemData>, System.Action`1<ItemDrop/ItemData>, System.Action`1<ItemDrop/ItemData>
IL_0000: ldarg.0
IL_0001: ldfld System.Action`1<ItemDrop/ItemData> ZenUI.Section.CraftingPanelGrid::OnSelectedItem
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: stloc.1
IL_0009: ldloc.1
IL_000a: ldarg.1
IL_000b: call System.Delegate System.Delegate::Combine(System.Delegate,System.Delegate)
IL_0010: castclass System.Action`1<ItemDrop/ItemData>
IL_0015: stloc.2
IL_0016: ldarg.0
IL_0017: ldflda System.Action`1<ItemDrop/ItemData> ZenUI.Section.CraftingPanelGrid::OnSelectedItem
IL_001c: ldloc.2
IL_001d: ldloc.1
IL_001e: call !!0 System.Threading.Interlocked::CompareExchange<System.Action`1<ItemDrop/ItemData>>(!!0&,!!0,!!0)
IL_0023: stloc.0
IL_0024: ldloc.0
IL_0025: ldloc.1
IL_0026: bne.un.s IL_0007
IL_0028: ret

// System.Void ZenUI.Section.CraftingPanelGrid::remove_OnSelectedItem(System.Action`1<ItemDrop/ItemData>)
.locals System.Action`1<ItemDrop/ItemData>, System.Action`1<ItemDrop/ItemData>, System.Action`1<ItemDrop/ItemData>
IL_0000: ldarg.0
IL_0001: ldfld System.Action`1<ItemDrop/ItemData> ZenUI.Section.CraftingPanelGrid::OnSelectedItem
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: stloc.1
IL_0009: ldloc.1
IL_000a: ldarg.1
IL_000b: call System.Delegate System.Delegate::Remove(System.Delegate,System.Delegate)
IL_0010: castclass System.Action`1<ItemDrop/ItemData>
IL_0015: stloc.2
IL_0016: ldarg.0
IL_0017: ldflda System.Action`1<ItemDrop/ItemData> ZenUI.Section.CraftingPanelGrid::OnSelectedItem
IL_001c: ldloc.2
IL_001d: ldloc.1
IL_001e: call !!0 System.Threading.Interlocked::CompareExchange<System.Action`1<ItemDrop/ItemData>>(!!0&,!!0,!!0)
IL_0023: stloc.0
IL_0024: ldloc.0
IL_0025: ldloc.1
IL_0026: bne.un.s IL_0007
IL_0028: ret

// System.Void ZenUI.Section.CraftingPanelGrid::add_OnScrollChanged(System.Action`1<System.Single>)
.locals System.Action`1<System.Single>, System.Action`1<System.Single>, System.Action`1<System.Single>
IL_0000: ldarg.0
IL_0001: ldfld System.Action`1<System.Single> ZenUI.Section.CraftingPanelGrid::OnScrollChanged
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: stloc.1
IL_0009: ldloc.1
IL_000a: ldarg.1
IL_000b: call System.Delegate System.Delegate::Combine(System.Delegate,System.Delegate)
IL_0010: castclass System.Action`1<System.Single>
IL_0015: stloc.2
IL_0016: ldarg.0
IL_0017: ldflda System.Action`1<System.Single> ZenUI.Section.CraftingPanelGrid::OnScrollChanged
IL_001c: ldloc.2
IL_001d: ldloc.1
IL_001e: call !!0 System.Threading.Interlocked::CompareExchange<System.Action`1<System.Single>>(!!0&,!!0,!!0)
IL_0023: stloc.0
IL_0024: ldloc.0
IL_0025: ldloc.1
IL_0026: bne.un.s IL_0007
IL_0028: ret

// System.Void ZenUI.Section.CraftingPanelGrid::remove_OnScrollChanged(System.Action`1<System.Single>)
.locals System.Action`1<System.Single>, System.Action`1<System.Single>, System.Action`1<System.Single>
IL_0000: ldarg.0
IL_0001: ldfld System.Action`1<System.Single> ZenUI.Section.CraftingPanelGrid::OnScrollChanged
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: stloc.1
IL_0009: ldloc.1
IL_000a: ldarg.1
IL_000b: call System.Delegate System.Delegate::Remove(System.Delegate,System.Delegate)
IL_0010: castclass System.Action`1<System.Single>
IL_0015: stloc.2
IL_0016: ldarg.0
IL_0017: ldflda System.Action`1<System.Single> ZenUI.Section.CraftingPanelGrid::OnScrollChanged
IL_001c: ldloc.2
IL_001d: ldloc.1
IL_001e: call !!0 System.Threading.Interlocked::CompareExchange<System.Action`1<System.Single>>(!!0&,!!0,!!0)
IL_0023: stloc.0
IL_0024: ldloc.0
IL_0025: ldloc.1
IL_0026: bne.un.s IL_0007
IL_0028: ret

// System.Void ZenUI.Section.CraftingPanelGrid::Init(System.Int32,System.Int32)
.locals InventoryGui, UnityEngine.GameObject
IL_0000: call InventoryGui InventoryGui::get_instance()
IL_0005: stloc.0
IL_0006: ldstr "Add Canvas and GraphicRaycaster optimization for large grids"
IL_000b: ldc.i4.0
IL_000c: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_0011: ldarg.0
IL_0012: call UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0017: callvirt !!0 UnityEngine.GameObject::AddComponent<UnityEngine.Canvas>()
IL_001c: pop
IL_001d: ldarg.0
IL_001e: call UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0023: callvirt !!0 UnityEngine.GameObject::AddComponent<UnityEngine.UI.GraphicRaycaster>()
IL_0028: pop
IL_0029: ldstr "Set the default grid root"
IL_002e: ldc.i4.0
IL_002f: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_0034: ldarg.0
IL_0035: call System.Void ZenUI.Section.CraftingPanelGrid::InitGridRoot()
IL_003a: ldstr "Set the element prefab"
IL_003f: ldc.i4.0
IL_0040: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_0045: ldarg.0
IL_0046: ldloc.0
IL_0047: ldfld InventoryGrid InventoryGui::m_playerGrid
IL_004c: ldfld UnityEngine.GameObject InventoryGrid::m_elementPrefab
IL_0051: stfld UnityEngine.GameObject InventoryGrid::m_elementPrefab
IL_0056: ldstr "Set the element space"
IL_005b: ldc.i4.0
IL_005c: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_0061: ldarg.0
IL_0062: ldloc.0
IL_0063: ldfld InventoryGrid InventoryGui::m_playerGrid
IL_0068: ldfld System.Single InventoryGrid::m_elementSpace
IL_006d: stfld System.Single InventoryGrid::m_elementSpace
IL_0072: ldstr "Setup the position defaults"
IL_0077: ldc.i4.0
IL_0078: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_007d: ldarg.0
IL_007e: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0083: castclass UnityEngine.RectTransform
IL_0088: dup
IL_0089: call UnityEngine.Vector2 UnityEngine.Vector2::get_zero()
IL_008e: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_0093: dup
IL_0094: call UnityEngine.Vector2 UnityEngine.Vector2::get_one()
IL_0099: callvirt System.Void UnityEngine.RectTransform::set_anchorMax(UnityEngine.Vector2)
IL_009e: dup
IL_009f: call UnityEngine.Vector2 UnityEngine.Vector2::get_zero()
IL_00a4: callvirt System.Void UnityEngine.RectTransform::set_anchorMin(UnityEngine.Vector2)
IL_00a9: dup
IL_00aa: ldc.r4 0
IL_00af: ldc.r4 -5
IL_00b4: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_00b9: callvirt System.Void UnityEngine.RectTransform::set_offsetMax(UnityEngine.Vector2)
IL_00be: dup
IL_00bf: ldc.r4 0
IL_00c4: ldc.r4 -5
IL_00c9: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_00ce: callvirt System.Void UnityEngine.RectTransform::set_offsetMin(UnityEngine.Vector2)
IL_00d3: dup
IL_00d4: call UnityEngine.Vector2 UnityEngine.Vector2::get_zero()
IL_00d9: callvirt System.Void UnityEngine.RectTransform::set_sizeDelta(UnityEngine.Vector2)
IL_00de: call UnityEngine.Vector2 UnityEngine.Vector2::get_one()
IL_00e3: ldc.r4 0.5
IL_00e8: call UnityEngine.Vector2 UnityEngine.Vector2::op_Multiply(UnityEngine.Vector2,System.Single)
IL_00ed: callvirt System.Void UnityEngine.RectTransform::set_pivot(UnityEngine.Vector2)
IL_00f2: ldstr "Setup the tooltip anchor"
IL_00f7: ldc.i4.0
IL_00f8: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_00fd: ldarg.0
IL_00fe: ldloc.0
IL_00ff: ldfld InventoryGrid InventoryGui::m_playerGrid
IL_0104: ldfld UnityEngine.RectTransform InventoryGrid::m_tooltipAnchor
IL_0109: ldloc.0
IL_010a: ldfld UnityEngine.RectTransform InventoryGui::m_crafting
IL_010f: ldc.i4.0
IL_0110: call !!0 UnityEngine.Object::Instantiate<UnityEngine.RectTransform>(!!0,UnityEngine.Transform,System.Boolean)
IL_0115: stfld UnityEngine.RectTransform InventoryGrid::m_tooltipAnchor
IL_011a: ldarg.0
IL_011b: ldfld UnityEngine.RectTransform InventoryGrid::m_tooltipAnchor
IL_0120: ldstr "ZenUI_CraftingPanelGrid_TooltipAnchor"
IL_0125: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_012a: ldarg.0
IL_012b: ldfld UnityEngine.RectTransform InventoryGrid::m_tooltipAnchor
IL_0130: ldc.r4 -1000
IL_0135: ldc.r4 -70
IL_013a: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_013f: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_0144: ldstr "Setup the UIGroupHandler"
IL_0149: ldc.i4.0
IL_014a: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_014f: ldarg.0
IL_0150: ldloc.0
IL_0151: ldfld UnityEngine.RectTransform InventoryGui::m_crafting
IL_0156: callvirt !!0 UnityEngine.Component::GetComponent<UIGroupHandler>()
IL_015b: stfld UIGroupHandler InventoryGrid::m_uiGroup
IL_0160: ldstr "Setup the inventory for the grid"
IL_0165: ldc.i4.0
IL_0166: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_016b: ldarg.0
IL_016c: ldstr "$hud_crafting"
IL_0171: ldnull
IL_0172: ldarg.1
IL_0173: ldarg.2
IL_0174: newobj System.Void Inventory::.ctor(System.String,UnityEngine.Sprite,System.Int32,System.Int32)
IL_0179: stfld Inventory InventoryGrid::m_inventory
IL_017e: ldstr "Clone the scrollbar"
IL_0183: ldc.i4.0
IL_0184: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_0189: ldloc.0
IL_018a: callvirt InventoryGrid InventoryGui::get_ContainerGrid()
IL_018f: ldfld UnityEngine.UI.Scrollbar InventoryGrid::m_scrollbar
IL_0194: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0199: ldarg.0
IL_019a: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_019f: ldc.i4.0
IL_01a0: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Transform,System.Boolean)
IL_01a5: stloc.1
IL_01a6: ldloc.1
IL_01a7: ldstr "ScrollBar"
IL_01ac: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_01b1: ldloc.1
IL_01b2: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_01b7: castclass UnityEngine.RectTransform
IL_01bc: dup
IL_01bd: ldc.r4 0
IL_01c2: ldc.r4 0
IL_01c7: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_01cc: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_01d1: dup
IL_01d2: ldc.r4 1
IL_01d7: ldc.r4 1
IL_01dc: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_01e1: callvirt System.Void UnityEngine.RectTransform::set_anchorMax(UnityEngine.Vector2)
IL_01e6: dup
IL_01e7: ldc.r4 1
IL_01ec: ldc.r4 0
IL_01f1: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_01f6: callvirt System.Void UnityEngine.RectTransform::set_anchorMin(UnityEngine.Vector2)
IL_01fb: dup
IL_01fc: ldc.r4 4
IL_0201: ldc.r4 0
IL_0206: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_020b: callvirt System.Void UnityEngine.RectTransform::set_offsetMax(UnityEngine.Vector2)
IL_0210: ldc.r4 -4
IL_0215: ldc.r4 0
IL_021a: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_021f: callvirt System.Void UnityEngine.RectTransform::set_offsetMin(UnityEngine.Vector2)
IL_0224: ldstr "Add event handler for SelectedItem"
IL_0229: ldc.i4.0
IL_022a: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_022f: ldarg.0
IL_0230: ldarg.0
IL_0231: ldfld System.Action`4<InventoryGrid,ItemDrop/ItemData,Vector2i,InventoryGrid/Modifier> InventoryGrid::m_onSelected
IL_0236: ldarg.0
IL_0237: ldftn System.Void ZenUI.Section.CraftingPanelGrid::InvokeOnSelectedItem(InventoryGrid,ItemDrop/ItemData,Vector2i,InventoryGrid/Modifier)
IL_023d: newobj System.Void System.Action`4<InventoryGrid,ItemDrop/ItemData,Vector2i,InventoryGrid/Modifier>::.ctor(System.Object,System.IntPtr)
IL_0242: call System.Delegate System.Delegate::Combine(System.Delegate,System.Delegate)
IL_0247: castclass System.Action`4<InventoryGrid,ItemDrop/ItemData,Vector2i,InventoryGrid/Modifier>
IL_024c: stfld System.Action`4<InventoryGrid,ItemDrop/ItemData,Vector2i,InventoryGrid/Modifier> InventoryGrid::m_onSelected
IL_0251: ldstr "Fixup the scrollbar"
IL_0256: ldc.i4.0
IL_0257: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_025c: ldarg.0
IL_025d: ldloc.1
IL_025e: callvirt !!0 UnityEngine.GameObject::GetComponent<UnityEngine.UI.Scrollbar>()
IL_0263: stfld UnityEngine.UI.Scrollbar InventoryGrid::m_scrollbar
IL_0268: ldarg.0
IL_0269: ldfld UnityEngine.UI.Scrollbar InventoryGrid::m_scrollbar
IL_026e: ldloc.1
IL_026f: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0274: ldstr "Sliding Area/Handle"
IL_0279: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_027e: castclass UnityEngine.RectTransform
IL_0283: callvirt System.Void UnityEngine.UI.Scrollbar::set_handleRect(UnityEngine.RectTransform)
IL_0288: ldarg.0
IL_0289: ldfld UnityEngine.UI.Scrollbar InventoryGrid::m_scrollbar
IL_028e: callvirt UnityEngine.UI.Scrollbar/ScrollEvent UnityEngine.UI.Scrollbar::get_onValueChanged()
IL_0293: ldarg.0
IL_0294: ldftn System.Void ZenUI.Section.CraftingPanelGrid::<Init>b__19_0(System.Single)
IL_029a: newobj System.Void UnityEngine.Events.UnityAction`1<System.Single>::.ctor(System.Object,System.IntPtr)
IL_029f: callvirt System.Void UnityEngine.Events.UnityEvent`1<System.Single>::AddListener(UnityEngine.Events.UnityAction`1<!0>)
IL_02a4: ldstr "Reassign the ScrollRect area to point to this crafting grid"
IL_02a9: ldc.i4.0
IL_02aa: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_02af: ldarg.0
IL_02b0: call !!0 UnityEngine.Component::GetComponent<UnityEngine.UI.ScrollRect>()
IL_02b5: dup
IL_02b6: ldc.i4.1
IL_02b7: callvirt System.Void UnityEngine.UI.ScrollRect::set_verticalScrollbarVisibility(UnityEngine.UI.ScrollRect/ScrollbarVisibility)
IL_02bc: dup
IL_02bd: ldarg.0
IL_02be: ldfld UnityEngine.RectTransform InventoryGrid::m_gridRoot
IL_02c3: callvirt System.Void UnityEngine.UI.ScrollRect::set_content(UnityEngine.RectTransform)
IL_02c8: dup
IL_02c9: ldarg.0
IL_02ca: ldfld UnityEngine.UI.Scrollbar InventoryGrid::m_scrollbar
IL_02cf: callvirt System.Void UnityEngine.UI.ScrollRect::set_verticalScrollbar(UnityEngine.UI.Scrollbar)
IL_02d4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ZenUI.Configs::CraftPanelScrollSensitivity
IL_02d9: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_02de: ldc.r4 1000
IL_02e3: mul
IL_02e4: callvirt System.Void UnityEngine.UI.ScrollRect::set_scrollSensitivity(System.Single)
IL_02e9: ldarg.0
IL_02ea: ldarg.0
IL_02eb: call !!0 UnityEngine.Component::GetComponent<ScrollRectEnsureVisible>()
IL_02f0: stfld ScrollRectEnsureVisible InventoryGrid::m_ensureVisible
IL_02f5: ldarg.0
IL_02f6: ldfld ScrollRectEnsureVisible InventoryGrid::m_ensureVisible
IL_02fb: callvirt System.Void ScrollRectEnsureVisible::Initialize()
IL_0300: ret

// System.Void ZenUI.Section.CraftingPanelGrid::OnDestroy()
.locals System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<ZenUI.Section.CraftingPanelGrid/CacheKey,ZenUI.Section.CraftingPanelGrid/CacheData>
IL_0000: ldarg.0
IL_0001: ldfld UnityEngine.UI.Scrollbar InventoryGrid::m_scrollbar
IL_0006: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_000b: call System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_0010: ldarg.0
IL_0011: ldfld UnityEngine.RectTransform InventoryGrid::m_tooltipAnchor
IL_0016: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_001b: call System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_0020: ldarg.0
IL_0021: ldfld System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanelGrid/CacheKey,ZenUI.Section.CraftingPanelGrid/CacheData> ZenUI.Section.CraftingPanelGrid::_cache
IL_0026: callvirt System.Collections.Generic.Dictionary`2/ValueCollection<!0,!1> System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanelGrid/CacheKey,ZenUI.Section.CraftingPanelGrid/CacheData>::get_Values()
IL_002b: callvirt System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2/ValueCollection<ZenUI.Section.CraftingPanelGrid/CacheKey,ZenUI.Section.CraftingPanelGrid/CacheData>::GetEnumerator()
IL_0030: stloc.0
IL_0031: br.s IL_0049
IL_0033: ldloca.s V_0
IL_0035: call !1 System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<ZenUI.Section.CraftingPanelGrid/CacheKey,ZenUI.Section.CraftingPanelGrid/CacheData>::get_Current()
IL_003a: ldfld UnityEngine.RectTransform ZenUI.Section.CraftingPanelGrid/CacheData::Root
IL_003f: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0044: call System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_0049: ldloca.s V_0
IL_004b: call System.Boolean System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<ZenUI.Section.CraftingPanelGrid/CacheKey,ZenUI.Section.CraftingPanelGrid/CacheData>::MoveNext()
IL_0050: brtrue.s IL_0033
IL_0052: leave.s IL_0062
IL_0054: ldloca.s V_0
IL_0056: constrained. System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<ZenUI.Section.CraftingPanelGrid/CacheKey,ZenUI.Section.CraftingPanelGrid/CacheData>
IL_005c: callvirt System.Void System.IDisposable::Dispose()
IL_0061: endfinally
IL_0062: ret
// EH Finally: 49 - 84 => 84 - 98

// System.Void ZenUI.Section.CraftingPanelGrid::InvokeOnSelectedItem(InventoryGrid,ItemDrop/ItemData,Vector2i,InventoryGrid/Modifier)
.locals ZDOID
IL_0000: ldarg.0
IL_0001: ldfld UnityEngine.RectTransform InventoryGrid::m_tooltipAnchor
IL_0006: callvirt System.Void UnityEngine.Transform::SetAsLastSibling()
IL_000b: ldarg.0
IL_000c: ldfld System.Action`1<ItemDrop/ItemData> ZenUI.Section.CraftingPanelGrid::OnSelectedItem
IL_0011: dup
IL_0012: brtrue.s IL_0017
IL_0014: pop
IL_0015: br.s IL_001d
IL_0017: ldarg.2
IL_0018: callvirt System.Void System.Action`1<ItemDrop/ItemData>::Invoke(!0)
IL_001d: call System.Boolean ZInput::IsGamepadActive()
IL_0022: brtrue.s IL_0054
IL_0024: call InventoryGui InventoryGui::get_instance()
IL_0029: ldfld EffectList InventoryGui::m_moveItemEffects
IL_002e: ldarg.0
IL_002f: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0034: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0039: call UnityEngine.Quaternion UnityEngine.Quaternion::get_identity()
IL_003e: ldnull
IL_003f: ldc.r4 1
IL_0044: ldc.i4.m1
IL_0045: ldloca.s V_0
IL_0047: initobj ZDOID
IL_004d: ldloc.0
IL_004e: callvirt UnityEngine.GameObject[] EffectList::Create(UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Transform,System.Single,System.Int32,ZDOID)
IL_0053: pop
IL_0054: ret

// System.Void ZenUI.Section.CraftingPanelGrid::InitGridRoot()
.locals System.Collections.IEnumerator, System.IDisposable
IL_0000: ldarg.0
IL_0001: ldarg.0
IL_0002: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0007: ldstr "Root"
IL_000c: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0011: castclass UnityEngine.RectTransform
IL_0016: stfld UnityEngine.RectTransform ZenUI.Section.CraftingPanelGrid::_originalGridRoot
IL_001b: ldarg.0
IL_001c: ldarg.0
IL_001d: ldfld UnityEngine.RectTransform ZenUI.Section.CraftingPanelGrid::_originalGridRoot
IL_0022: stfld UnityEngine.RectTransform InventoryGrid::m_gridRoot
IL_0027: ldarg.0
IL_0028: ldfld UnityEngine.RectTransform ZenUI.Section.CraftingPanelGrid::_originalGridRoot
IL_002d: callvirt System.Collections.IEnumerator UnityEngine.Transform::GetEnumerator()
IL_0032: stloc.0
IL_0033: br.s IL_004a
IL_0035: ldloc.0
IL_0036: callvirt System.Object System.Collections.IEnumerator::get_Current()
IL_003b: castclass UnityEngine.Transform
IL_0040: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0045: call System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_004a: ldloc.0
IL_004b: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0050: brtrue.s IL_0035
IL_0052: leave.s IL_0065
IL_0054: ldloc.0
IL_0055: isinst System.IDisposable
IL_005a: stloc.1
IL_005b: ldloc.1
IL_005c: brfalse.s IL_0064
IL_005e: ldloc.1
IL_005f: callvirt System.Void System.IDisposable::Dispose()
IL_0064: endfinally
IL_0065: ldarg.0
IL_0066: ldfld UnityEngine.RectTransform ZenUI.Section.CraftingPanelGrid::_originalGridRoot
IL_006b: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0070: ldc.i4.0
IL_0071: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0076: ret
// EH Finally: 51 - 84 => 84 - 101

// ZenUI.Section.CraftingPanelGrid/CacheKey ZenUI.Section.CraftingPanelGrid::GetKey()
.locals Inventory
IL_0000: ldarg.0
IL_0001: call Inventory InventoryGrid::GetInventory()
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: ldfld System.Int32 Inventory::m_width
IL_000d: ldloc.0
IL_000e: ldfld System.Int32 Inventory::m_height
IL_0013: newobj System.Void ZenUI.Section.CraftingPanelGrid/CacheKey::.ctor(System.Int32,System.Int32)
IL_0018: ret

// System.Boolean ZenUI.Section.CraftingPanelGrid::IsSame(ZenUI.Section.CraftingPanelGrid/CacheData)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.List`1<InventoryElement> InventoryGrid::m_elements
IL_0006: ldarg.1
IL_0007: ldfld System.Collections.Generic.List`1<InventoryElement> ZenUI.Section.CraftingPanelGrid/CacheData::Elements
IL_000c: bne.un.s IL_0035
IL_000e: ldarg.0
IL_000f: ldfld Inventory InventoryGrid::m_inventory
IL_0014: ldfld System.Int32 Inventory::m_width
IL_0019: ldarg.1
IL_001a: ldfld System.Int32 ZenUI.Section.CraftingPanelGrid/CacheData::Width
IL_001f: bne.un.s IL_0035
IL_0021: ldarg.0
IL_0022: ldfld Inventory InventoryGrid::m_inventory
IL_0027: ldfld System.Int32 Inventory::m_height
IL_002c: ldarg.1
IL_002d: ldfld System.Int32 ZenUI.Section.CraftingPanelGrid/CacheData::Height
IL_0032: ceq
IL_0034: ret
IL_0035: ldc.i4.0
IL_0036: ret

// System.Void ZenUI.Section.CraftingPanelGrid::CreateCache(ZenUI.Section.CraftingPanelGrid/CacheKey)
.locals UnityEngine.RectTransform, Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean
IL_0000: ldarg.0
IL_0001: ldarga.s key
IL_0003: call System.Int32 ZenUI.Section.CraftingPanelGrid/CacheKey::get_Width()
IL_0008: stfld System.Int32 InventoryGrid::m_width
IL_000d: ldarg.0
IL_000e: ldarga.s key
IL_0010: call System.Int32 ZenUI.Section.CraftingPanelGrid/CacheKey::get_Height()
IL_0015: stfld System.Int32 InventoryGrid::m_height
IL_001a: ldarg.0
IL_001b: newobj System.Void System.Collections.Generic.List`1<InventoryElement>::.ctor()
IL_0020: stfld System.Collections.Generic.List`1<InventoryElement> InventoryGrid::m_elements
IL_0025: ldarg.0
IL_0026: ldfld UnityEngine.RectTransform ZenUI.Section.CraftingPanelGrid::_originalGridRoot
IL_002b: ldarg.0
IL_002c: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0031: ldc.i4.0
IL_0032: call !!0 UnityEngine.Object::Instantiate<UnityEngine.RectTransform>(!!0,UnityEngine.Transform,System.Boolean)
IL_0037: stloc.0
IL_0038: ldloc.0
IL_0039: ldstr "RootCache_{0}_{1}x{2}"
IL_003e: ldstr "ZenUI"
IL_0043: ldarg.0
IL_0044: ldfld System.Int32 InventoryGrid::m_width
IL_0049: box System.Int32
IL_004e: ldarg.0
IL_004f: ldfld System.Int32 InventoryGrid::m_height
IL_0054: box System.Int32
IL_0059: call System.String System.String::Format(System.String,System.Object,System.Object,System.Object)
IL_005e: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_0063: ldloc.0
IL_0064: ldc.i4.1
IL_0065: callvirt System.Void UnityEngine.Transform::SetSiblingIndex(System.Int32)
IL_006a: ldarg.0
IL_006b: ldloc.0
IL_006c: call System.Void ZenUI.Section.CraftingPanelGrid::SetRoot(UnityEngine.RectTransform)
IL_0071: ldc.i4.s 20
IL_0073: ldc.i4.1
IL_0074: ldloca.s V_2
IL_0076: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_007b: stloc.1
IL_007c: ldloc.2
IL_007d: brfalse.s IL_0098
IL_007f: ldloca.s V_1
IL_0081: ldstr "Created cache root: "
IL_0086: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_008b: ldloca.s V_1
IL_008d: ldloc.0
IL_008e: callvirt System.String UnityEngine.Object::get_name()
IL_0093: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_0098: ldloc.1
IL_0099: ldc.i4.0
IL_009a: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_009f: ret

// System.Void ZenUI.Section.CraftingPanelGrid::CreateGridElements()
.locals UnityEngine.Vector2, UnityEngine.Vector2, UnityEngine.Sprite, Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean, UnityEngine.Rect, System.Int32, System.Int32, UnityEngine.Vector2, InventoryElement, System.Collections.IEnumerator, UnityEngine.Transform, System.String, System.Int32, System.Char, System.IDisposable
IL_0000: ldc.i4.s 25
IL_0002: ldc.i4.4
IL_0003: ldloca.s V_4
IL_0005: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_000a: stloc.3
IL_000b: ldloc.s V_4
IL_000d: brfalse.s IL_007d
IL_000f: ldloca.s V_3
IL_0011: ldstr "Size: "
IL_0016: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_001b: ldloca.s V_3
IL_001d: ldarg.0
IL_001e: ldfld System.Int32 InventoryGrid::m_width
IL_0023: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Int32>(!!0)
IL_0028: ldloca.s V_3
IL_002a: ldstr "x"
IL_002f: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0034: ldloca.s V_3
IL_0036: ldarg.0
IL_0037: ldfld System.Int32 InventoryGrid::m_height
IL_003c: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Int32>(!!0)
IL_0041: ldloca.s V_3
IL_0043: ldstr ", InventorySize: "
IL_0048: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_004d: ldloca.s V_3
IL_004f: ldarg.0
IL_0050: ldfld Inventory InventoryGrid::m_inventory
IL_0055: ldfld System.Int32 Inventory::m_width
IL_005a: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Int32>(!!0)
IL_005f: ldloca.s V_3
IL_0061: ldstr "x"
IL_0066: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_006b: ldloca.s V_3
IL_006d: ldarg.0
IL_006e: ldfld Inventory InventoryGrid::m_inventory
IL_0073: ldfld System.Int32 Inventory::m_height
IL_0078: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Int32>(!!0)
IL_007d: ldloc.3
IL_007e: ldc.i4.0
IL_007f: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_0084: ldarg.0
IL_0085: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_008a: castclass UnityEngine.RectTransform
IL_008f: ldarg.0
IL_0090: call UnityEngine.Vector2 InventoryGrid::GetWidgetSize()
IL_0095: stloc.0
IL_0096: callvirt UnityEngine.Rect UnityEngine.RectTransform::get_rect()
IL_009b: stloc.s V_5
IL_009d: ldloca.s V_5
IL_009f: call System.Single UnityEngine.Rect::get_width()
IL_00a4: ldc.r4 2
IL_00a9: div
IL_00aa: ldc.r4 0
IL_00af: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_00b4: ldloc.0
IL_00b5: ldfld System.Single UnityEngine.Vector2::x
IL_00ba: ldc.r4 0
IL_00bf: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_00c4: ldc.r4 0.5
IL_00c9: call UnityEngine.Vector2 UnityEngine.Vector2::op_Multiply(UnityEngine.Vector2,System.Single)
IL_00ce: call UnityEngine.Vector2 UnityEngine.Vector2::op_Subtraction(UnityEngine.Vector2,UnityEngine.Vector2)
IL_00d3: stloc.1
IL_00d4: call !0 Zen.Lib.ZenMod`1<ZenUI.Plugin>::get_Instance()
IL_00d9: ldstr "exclamation.png"
IL_00de: call UnityEngine.Sprite Zen.Lib.AssetIO::LoadSpriteFromResource(BepInEx.BaseUnityPlugin,System.String)
IL_00e3: stloc.2
IL_00e4: ldc.i4.0
IL_00e5: stloc.s V_6
IL_00e7: br IL_03e7
IL_00ec: ldc.i4.0
IL_00ed: stloc.s V_7
IL_00ef: br IL_03d4
IL_00f4: ldloca.s V_8
IL_00f6: ldloc.s V_7
IL_00f8: conv.r4
IL_00f9: ldarg.0
IL_00fa: ldfld System.Single InventoryGrid::m_elementSpace
IL_00ff: mul
IL_0100: ldloc.s V_6
IL_0102: conv.r4
IL_0103: ldarg.0
IL_0104: ldfld System.Single InventoryGrid::m_elementSpace
IL_0109: neg
IL_010a: mul
IL_010b: call System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_0110: ldarg.0
IL_0111: ldfld UnityEngine.GameObject InventoryGrid::m_elementPrefab
IL_0116: ldarg.0
IL_0117: ldfld UnityEngine.RectTransform InventoryGrid::m_gridRoot
IL_011c: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Transform)
IL_0121: dup
IL_0122: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0127: castclass UnityEngine.RectTransform
IL_012c: ldloc.1
IL_012d: ldloc.s V_8
IL_012f: call UnityEngine.Vector2 UnityEngine.Vector2::op_Addition(UnityEngine.Vector2,UnityEngine.Vector2)
IL_0134: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_0139: dup
IL_013a: callvirt !!0 UnityEngine.GameObject::GetComponent<UIInputHandler>()
IL_013f: dup
IL_0140: dup
IL_0141: ldfld System.Action`1<UIInputHandler> UIInputHandler::m_onRightDown
IL_0146: ldarg.0
IL_0147: ldftn System.Void InventoryGrid::OnRightDown(UIInputHandler)
IL_014d: newobj System.Void System.Action`1<UIInputHandler>::.ctor(System.Object,System.IntPtr)
IL_0152: call System.Delegate System.Delegate::Combine(System.Delegate,System.Delegate)
IL_0157: castclass System.Action`1<UIInputHandler>
IL_015c: stfld System.Action`1<UIInputHandler> UIInputHandler::m_onRightDown
IL_0161: dup
IL_0162: dup
IL_0163: ldfld System.Action`1<UIInputHandler> UIInputHandler::m_onLeftDown
IL_0168: ldarg.0
IL_0169: ldftn System.Void InventoryGrid::OnLeftDown(UIInputHandler)
IL_016f: newobj System.Void System.Action`1<UIInputHandler>::.ctor(System.Object,System.IntPtr)
IL_0174: call System.Delegate System.Delegate::Combine(System.Delegate,System.Delegate)
IL_0179: castclass System.Action`1<UIInputHandler>
IL_017e: stfld System.Action`1<UIInputHandler> UIInputHandler::m_onLeftDown
IL_0183: dup
IL_0184: dup
IL_0185: ldfld System.Action`1<UIInputHandler> UIInputHandler::m_onLeftClick
IL_018a: ldarg.0
IL_018b: ldftn System.Void InventoryGrid::OnLeftClick(UIInputHandler)
IL_0191: newobj System.Void System.Action`1<UIInputHandler>::.ctor(System.Object,System.IntPtr)
IL_0196: call System.Delegate System.Delegate::Combine(System.Delegate,System.Delegate)
IL_019b: castclass System.Action`1<UIInputHandler>
IL_01a0: stfld System.Action`1<UIInputHandler> UIInputHandler::m_onLeftClick
IL_01a5: dup
IL_01a6: dup
IL_01a7: ldfld System.Action`1<UIInputHandler> UIInputHandler::m_onLeftUp
IL_01ac: ldarg.0
IL_01ad: ldftn System.Void InventoryGrid::OnLeftRelease(UIInputHandler)
IL_01b3: newobj System.Void System.Action`1<UIInputHandler>::.ctor(System.Object,System.IntPtr)
IL_01b8: call System.Delegate System.Delegate::Combine(System.Delegate,System.Delegate)
IL_01bd: castclass System.Action`1<UIInputHandler>
IL_01c2: stfld System.Action`1<UIInputHandler> UIInputHandler::m_onLeftUp
IL_01c7: dup
IL_01c8: ldfld System.Action`1<UIInputHandler> UIInputHandler::m_onPointerEnter
IL_01cd: ldarg.0
IL_01ce: ldftn System.Void InventoryGrid::OnPointerEnter(UIInputHandler)
IL_01d4: newobj System.Void System.Action`1<UIInputHandler>::.ctor(System.Object,System.IntPtr)
IL_01d9: call System.Delegate System.Delegate::Combine(System.Delegate,System.Delegate)
IL_01de: castclass System.Action`1<UIInputHandler>
IL_01e3: stfld System.Action`1<UIInputHandler> UIInputHandler::m_onPointerEnter
IL_01e8: dup
IL_01e9: callvirt !!0 UnityEngine.GameObject::GetComponent<InventoryElement>()
IL_01ee: stloc.s V_9
IL_01f0: ldloc.s V_9
IL_01f2: ldloc.s V_7
IL_01f4: ldloc.s V_6
IL_01f6: callvirt System.Void InventoryElement::Initialize(System.Int32,System.Int32)
IL_01fb: call System.Boolean ZenUI.Section.CraftingPanelGrid::get_IsUntouchedItemIndicatorEnabled()
IL_0200: brfalse.s IL_026e
IL_0202: ldloc.s V_9
IL_0204: ldfld UnityEngine.UI.Image InventoryElement::m_noteleport
IL_0209: ldloc.2
IL_020a: callvirt System.Void UnityEngine.UI.Image::set_sprite(UnityEngine.Sprite)
IL_020f: ldloc.s V_9
IL_0211: ldfld UnityEngine.UI.Image InventoryElement::m_noteleport
IL_0216: callvirt UnityEngine.RectTransform UnityEngine.UI.Graphic::get_rectTransform()
IL_021b: dup
IL_021c: ldc.r4 0
IL_0221: ldc.r4 1
IL_0226: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_022b: callvirt System.Void UnityEngine.RectTransform::set_anchorMin(UnityEngine.Vector2)
IL_0230: dup
IL_0231: ldc.r4 0
IL_0236: ldc.r4 1
IL_023b: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_0240: callvirt System.Void UnityEngine.RectTransform::set_anchorMax(UnityEngine.Vector2)
IL_0245: dup
IL_0246: ldc.r4 0
IL_024b: ldc.r4 1
IL_0250: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_0255: callvirt System.Void UnityEngine.RectTransform::set_pivot(UnityEngine.Vector2)
IL_025a: ldc.r4 -8.5
IL_025f: ldc.r4 -1
IL_0264: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_0269: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_026e: ldarg.0
IL_026f: ldfld System.Collections.Generic.List`1<InventoryElement> InventoryGrid::m_elements
IL_0274: ldloc.s V_9
IL_0276: callvirt System.Void System.Collections.Generic.List`1<InventoryElement>::Add(!0)
IL_027b: ldloc.s V_9
IL_027d: ldfld UnityEngine.GameObject InventoryElement::m_selected
IL_0282: ldc.i4.0
IL_0283: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0288: ldarg.0
IL_0289: ldloc.s V_9
IL_028b: call System.Void Zen.Lib.InventoryGridExt::DisableElement(InventoryGrid,InventoryElement)
IL_0290: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0295: callvirt System.Collections.IEnumerator UnityEngine.Transform::GetEnumerator()
IL_029a: stloc.s V_10
IL_029c: br IL_03ab
IL_02a1: ldloc.s V_10
IL_02a3: callvirt System.Object System.Collections.IEnumerator::get_Current()
IL_02a8: castclass UnityEngine.Transform
IL_02ad: stloc.s V_11
IL_02af: ldloc.s V_11
IL_02b1: callvirt System.String UnityEngine.Object::get_name()
IL_02b6: stloc.s V_12
IL_02b8: ldloc.s V_12
IL_02ba: brfalse IL_0398
IL_02bf: ldloc.s V_12
IL_02c1: call System.Int32 System.String::get_Length()
IL_02c6: stloc.s V_13
IL_02c8: ldloc.s V_13
IL_02ca: ldc.i4.4
IL_02cb: sub
IL_02cc: switch IL_0325,IL_0398,IL_0335,IL_02f2,IL_030d,IL_0398,IL_0365
IL_02ed: br IL_0398
IL_02f2: ldloc.s V_12
IL_02f4: ldc.i4.0
IL_02f5: call System.Char System.String::get_Chars(System.Int32)
IL_02fa: stloc.s V_14
IL_02fc: ldloc.s V_14
IL_02fe: ldc.i4.s 101
IL_0300: beq.s IL_0355
IL_0302: ldloc.s V_14
IL_0304: ldc.i4.s 113
IL_0306: beq.s IL_0345
IL_0308: br IL_0398
IL_030d: ldloc.s V_12
IL_030f: ldc.i4.0
IL_0310: call System.Char System.String::get_Chars(System.Int32)
IL_0315: stloc.s V_14
IL_0317: ldloc.s V_14
IL_0319: ldc.i4.s 102
IL_031b: beq.s IL_0375
IL_031d: ldloc.s V_14
IL_031f: ldc.i4.s 115
IL_0321: beq.s IL_0385
IL_0323: br.s IL_0398
IL_0325: ldloc.s V_12
IL_0327: ldstr "icon"
IL_032c: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0331: brtrue.s IL_0393
IL_0333: br.s IL_0398
IL_0335: ldloc.s V_12
IL_0337: ldstr "amount"
IL_033c: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0341: brtrue.s IL_0393
IL_0343: br.s IL_0398
IL_0345: ldloc.s V_12
IL_0347: ldstr "quality"
IL_034c: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0351: brtrue.s IL_0393
IL_0353: br.s IL_0398
IL_0355: ldloc.s V_12
IL_0357: ldstr "equiped"
IL_035c: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0361: brtrue.s IL_0393
IL_0363: br.s IL_0398
IL_0365: ldloc.s V_12
IL_0367: ldstr "noteleport"
IL_036c: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0371: brtrue.s IL_0393
IL_0373: br.s IL_0398
IL_0375: ldloc.s V_12
IL_0377: ldstr "foodicon"
IL_037c: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0381: brtrue.s IL_0393
IL_0383: br.s IL_0398
IL_0385: ldloc.s V_12
IL_0387: ldstr "selected"
IL_038c: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0391: brfalse.s IL_0398
IL_0393: ldc.i4.1
IL_0394: stloc.s V_4
IL_0396: br.s IL_039b
IL_0398: ldc.i4.0
IL_0399: stloc.s V_4
IL_039b: ldloc.s V_4
IL_039d: brtrue.s IL_03ab
IL_039f: ldloc.s V_11
IL_03a1: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_03a6: call System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_03ab: ldloc.s V_10
IL_03ad: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_03b2: brtrue IL_02a1
IL_03b7: leave.s IL_03ce
IL_03b9: ldloc.s V_10
IL_03bb: isinst System.IDisposable
IL_03c0: stloc.s V_15
IL_03c2: ldloc.s V_15
IL_03c4: brfalse.s IL_03cd
IL_03c6: ldloc.s V_15
IL_03c8: callvirt System.Void System.IDisposable::Dispose()
IL_03cd: endfinally
IL_03ce: ldloc.s V_7
IL_03d0: ldc.i4.1
IL_03d1: add
IL_03d2: stloc.s V_7
IL_03d4: ldloc.s V_7
IL_03d6: ldarg.0
IL_03d7: ldfld System.Int32 InventoryGrid::m_width
IL_03dc: blt IL_00f4
IL_03e1: ldloc.s V_6
IL_03e3: ldc.i4.1
IL_03e4: add
IL_03e5: stloc.s V_6
IL_03e7: ldloc.s V_6
IL_03e9: ldarg.0
IL_03ea: ldfld System.Int32 InventoryGrid::m_height
IL_03ef: blt IL_00ec
IL_03f4: ret
// EH Finally: 668 - 953 => 953 - 974

// System.Void ZenUI.Section.CraftingPanelGrid::SetRoot(UnityEngine.RectTransform)
.locals UnityEngine.UI.ScrollRect, ScrollRectEnsureVisible
IL_0000: ldarg.0
IL_0001: ldfld UnityEngine.RectTransform InventoryGrid::m_gridRoot
IL_0006: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_000b: ldc.i4.0
IL_000c: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0011: ldarg.0
IL_0012: ldarg.1
IL_0013: stfld UnityEngine.RectTransform InventoryGrid::m_gridRoot
IL_0018: ldarg.0
IL_0019: ldfld UnityEngine.RectTransform InventoryGrid::m_gridRoot
IL_001e: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0023: ldc.i4.1
IL_0024: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0029: ldarg.0
IL_002a: ldloca.s V_0
IL_002c: call System.Boolean UnityEngine.Component::TryGetComponent<UnityEngine.UI.ScrollRect>(!!0&)
IL_0031: brtrue.s IL_003f
IL_0033: ldstr "ScrollRect component missing"
IL_0038: ldc.i4.0
IL_0039: call System.Void Zen.Logging`1<ZenUI.Plugin>::Error(System.Object,System.UInt16)
IL_003e: ret
IL_003f: ldloc.0
IL_0040: ldarg.0
IL_0041: ldfld UnityEngine.RectTransform InventoryGrid::m_gridRoot
IL_0046: callvirt System.Void UnityEngine.UI.ScrollRect::set_content(UnityEngine.RectTransform)
IL_004b: ldloc.0
IL_004c: ldloca.s V_1
IL_004e: callvirt System.Boolean UnityEngine.Component::TryGetComponent<ScrollRectEnsureVisible>(!!0&)
IL_0053: brtrue.s IL_0061
IL_0055: ldstr "ScrollRectEnsureVisible component missing"
IL_005a: ldc.i4.0
IL_005b: call System.Void Zen.Logging`1<ZenUI.Plugin>::Error(System.Object,System.UInt16)
IL_0060: ret
IL_0061: ldloc.1
IL_0062: callvirt System.Void ScrollRectEnsureVisible::Initialize()
IL_0067: ret

// System.Void ZenUI.Section.CraftingPanelGrid::SwitchCache(ZenUI.Section.CraftingPanelGrid/CacheData)
.locals Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean
IL_0000: ldc.i4.s 12
IL_0002: ldc.i4.4
IL_0003: ldloca.s V_1
IL_0005: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_000a: stloc.0
IL_000b: ldloc.1
IL_000c: brfalse.s IL_006b
IL_000e: ldloca.s V_0
IL_0010: ldarg.0
IL_0011: call System.String UnityEngine.Object::get_name()
IL_0016: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_001b: ldloca.s V_0
IL_001d: ldstr " "
IL_0022: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0027: ldloca.s V_0
IL_0029: ldarg.1
IL_002a: ldfld System.Int32 ZenUI.Section.CraftingPanelGrid/CacheData::Width
IL_002f: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Int32>(!!0)
IL_0034: ldloca.s V_0
IL_0036: ldstr "x"
IL_003b: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0040: ldloca.s V_0
IL_0042: ldarg.1
IL_0043: ldfld System.Int32 ZenUI.Section.CraftingPanelGrid/CacheData::Height
IL_0048: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Int32>(!!0)
IL_004d: ldloca.s V_0
IL_004f: ldstr " CacheID: "
IL_0054: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0059: ldloca.s V_0
IL_005b: ldarg.1
IL_005c: ldfld System.Int32 ZenUI.Section.CraftingPanelGrid/CacheData::ID
IL_0061: ldstr "0000"
IL_0066: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Int32>(!!0,System.String)
IL_006b: ldloc.0
IL_006c: ldc.i4.0
IL_006d: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_0072: ldarg.0
IL_0073: ldarg.1
IL_0074: ldfld UnityEngine.RectTransform ZenUI.Section.CraftingPanelGrid/CacheData::Root
IL_0079: call System.Void ZenUI.Section.CraftingPanelGrid::SetRoot(UnityEngine.RectTransform)
IL_007e: ldarg.0
IL_007f: ldarg.1
IL_0080: ldfld System.Collections.Generic.List`1<InventoryElement> ZenUI.Section.CraftingPanelGrid/CacheData::Elements
IL_0085: stfld System.Collections.Generic.List`1<InventoryElement> InventoryGrid::m_elements
IL_008a: ldarg.0
IL_008b: ldarg.1
IL_008c: ldfld System.Int32 ZenUI.Section.CraftingPanelGrid/CacheData::Width
IL_0091: stfld System.Int32 InventoryGrid::m_width
IL_0096: ldarg.0
IL_0097: ldarg.1
IL_0098: ldfld System.Int32 ZenUI.Section.CraftingPanelGrid/CacheData::Height
IL_009d: stfld System.Int32 InventoryGrid::m_height
IL_00a2: ret

// System.Void ZenUI.Section.CraftingPanelGrid::ResetScrollSize()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld UnityEngine.RectTransform InventoryGrid::m_gridRoot
IL_0006: ldc.i4.1
IL_0007: ldarg.0
IL_0008: ldfld System.Int32 InventoryGrid::m_height
IL_000d: conv.r4
IL_000e: ldarg.0
IL_000f: ldfld System.Single InventoryGrid::m_elementSpace
IL_0014: mul
IL_0015: callvirt System.Void UnityEngine.RectTransform::SetSizeWithCurrentAnchors(UnityEngine.RectTransform/Axis,System.Single)
IL_001a: ret

// System.Void ZenUI.Section.CraftingPanelGrid::UpdateGamepad()
.locals 
IL_0000: call System.Boolean ZInput::IsGamepadActive()
IL_0005: brfalse.s IL_0014
IL_0007: ldarg.0
IL_0008: ldfld UIGroupHandler InventoryGrid::m_uiGroup
IL_000d: callvirt System.Boolean UIGroupHandler::get_IsActive()
IL_0012: brtrue.s IL_0015
IL_0014: ret
IL_0015: ldarg.0
IL_0016: ldfld Vector2i InventoryGrid::m_selected
IL_001b: ldstr "JoyLStickLeft"
IL_0020: call System.Boolean ZInput::GetButtonDown(System.String)
IL_0025: brfalse.s IL_0037
IL_0027: ldarg.0
IL_0028: ldflda Vector2i InventoryGrid::m_selected
IL_002d: ldflda System.Int32 Vector2i::x
IL_0032: dup
IL_0033: ldind.i4
IL_0034: ldc.i4.1
IL_0035: sub
IL_0036: stind.i4
IL_0037: ldstr "JoyLStickRight"
IL_003c: call System.Boolean ZInput::GetButtonDown(System.String)
IL_0041: brfalse.s IL_0053
IL_0043: ldarg.0
IL_0044: ldflda Vector2i InventoryGrid::m_selected
IL_0049: ldflda System.Int32 Vector2i::x
IL_004e: dup
IL_004f: ldind.i4
IL_0050: ldc.i4.1
IL_0051: add
IL_0052: stind.i4
IL_0053: ldstr "JoyLStickUp"
IL_0058: call System.Boolean ZInput::GetButtonDown(System.String)
IL_005d: brfalse.s IL_006f
IL_005f: ldarg.0
IL_0060: ldflda Vector2i InventoryGrid::m_selected
IL_0065: ldflda System.Int32 Vector2i::y
IL_006a: dup
IL_006b: ldind.i4
IL_006c: ldc.i4.1
IL_006d: sub
IL_006e: stind.i4
IL_006f: ldstr "JoyLStickDown"
IL_0074: call System.Boolean ZInput::GetButtonDown(System.String)
IL_0079: brfalse.s IL_008b
IL_007b: ldarg.0
IL_007c: ldflda Vector2i InventoryGrid::m_selected
IL_0081: ldflda System.Int32 Vector2i::y
IL_0086: dup
IL_0087: ldind.i4
IL_0088: ldc.i4.1
IL_0089: add
IL_008a: stind.i4
IL_008b: ldarg.0
IL_008c: ldflda Vector2i InventoryGrid::m_selected
IL_0091: ldarg.0
IL_0092: ldflda Vector2i InventoryGrid::m_selected
IL_0097: ldfld System.Int32 Vector2i::x
IL_009c: ldc.i4.0
IL_009d: ldarg.0
IL_009e: ldfld System.Int32 InventoryGrid::m_width
IL_00a3: ldc.i4.1
IL_00a4: sub
IL_00a5: call System.Int32 UnityEngine.Mathf::Clamp(System.Int32,System.Int32,System.Int32)
IL_00aa: stfld System.Int32 Vector2i::x
IL_00af: ldarg.0
IL_00b0: ldflda Vector2i InventoryGrid::m_selected
IL_00b5: ldarg.0
IL_00b6: ldflda Vector2i InventoryGrid::m_selected
IL_00bb: ldfld System.Int32 Vector2i::y
IL_00c0: ldc.i4.0
IL_00c1: ldarg.0
IL_00c2: ldfld System.Int32 InventoryGrid::m_height
IL_00c7: ldc.i4.1
IL_00c8: sub
IL_00c9: call System.Int32 UnityEngine.Mathf::Clamp(System.Int32,System.Int32,System.Int32)
IL_00ce: stfld System.Int32 Vector2i::y
IL_00d3: ldarg.0
IL_00d4: ldfld Vector2i InventoryGrid::m_selected
IL_00d9: call System.Boolean Vector2i::op_Equality(Vector2i,Vector2i)
IL_00de: brfalse.s IL_00e1
IL_00e0: ret
IL_00e1: ldarg.0
IL_00e2: ldfld System.Action`4<InventoryGrid,ItemDrop/ItemData,Vector2i,InventoryGrid/Modifier> InventoryGrid::m_onSelected
IL_00e7: ldarg.0
IL_00e8: ldarg.0
IL_00e9: call ItemDrop/ItemData InventoryGrid::GetGamepadSelectedItem()
IL_00ee: ldarg.0
IL_00ef: ldfld Vector2i InventoryGrid::m_selected
IL_00f4: ldc.i4.0
IL_00f5: callvirt System.Void System.Action`4<InventoryGrid,ItemDrop/ItemData,Vector2i,InventoryGrid/Modifier>::Invoke(!0,!1,!2,!3)
IL_00fa: ldarg.0
IL_00fb: ldarg.0
IL_00fc: ldfld Vector2i InventoryGrid::m_selected
IL_0101: call System.Void ZenUI.Section.CraftingPanelGrid::CenterOn(Vector2i)
IL_0106: ret

// System.Void ZenUI.Section.CraftingPanelGrid::AddItem(ItemDrop/ItemData)
.locals 
IL_0000: ldarg.0
IL_0001: call Inventory InventoryGrid::GetInventory()
IL_0006: ldfld System.Collections.Generic.List`1<ItemDrop/ItemData> Inventory::m_inventory
IL_000b: ldarg.1
IL_000c: callvirt System.Void System.Collections.Generic.List`1<ItemDrop/ItemData>::Add(!0)
IL_0011: ldarg.0
IL_0012: ldfld System.Collections.Generic.Dictionary`2<Vector2i,ItemDrop/ItemData> ZenUI.Section.CraftingPanelGrid::_gridInvPosIndex
IL_0017: ldarg.1
IL_0018: ldfld Vector2i ItemDrop/ItemData::m_gridPos
IL_001d: ldarg.1
IL_001e: callvirt System.Void System.Collections.Generic.Dictionary`2<Vector2i,ItemDrop/ItemData>::set_Item(!0,!1)
IL_0023: ret

// System.Void ZenUI.Section.CraftingPanelGrid::UpdateGuiBefore()
.locals ZenUI.Section.CraftingPanelGrid/CacheKey, ZenUI.Section.CraftingPanelGrid/CacheData
IL_0000: ldarg.0
IL_0001: call ZenUI.Section.CraftingPanelGrid/CacheKey ZenUI.Section.CraftingPanelGrid::GetKey()
IL_0006: stloc.0
IL_0007: ldarg.0
IL_0008: ldfld System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanelGrid/CacheKey,ZenUI.Section.CraftingPanelGrid/CacheData> ZenUI.Section.CraftingPanelGrid::_cache
IL_000d: ldloc.0
IL_000e: ldloca.s V_1
IL_0010: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanelGrid/CacheKey,ZenUI.Section.CraftingPanelGrid/CacheData>::TryGetValue(!0,!1&)
IL_0015: brtrue.s IL_0026
IL_0017: ldarg.0
IL_0018: ldloc.0
IL_0019: call System.Void ZenUI.Section.CraftingPanelGrid::CreateCache(ZenUI.Section.CraftingPanelGrid/CacheKey)
IL_001e: ldarg.0
IL_001f: call System.Void ZenUI.Section.CraftingPanelGrid::CreateGridElements()
IL_0024: br.s IL_0036
IL_0026: ldarg.0
IL_0027: ldloc.1
IL_0028: call System.Boolean ZenUI.Section.CraftingPanelGrid::IsSame(ZenUI.Section.CraftingPanelGrid/CacheData)
IL_002d: brtrue.s IL_0036
IL_002f: ldarg.0
IL_0030: ldloc.1
IL_0031: call System.Void ZenUI.Section.CraftingPanelGrid::SwitchCache(ZenUI.Section.CraftingPanelGrid/CacheData)
IL_0036: ldloc.0
IL_0037: ldarg.0
IL_0038: ldfld ZenUI.Section.CraftingPanelGrid/CacheKey ZenUI.Section.CraftingPanelGrid::_prevCacheKey
IL_003d: call System.Boolean ZenUI.Section.CraftingPanelGrid/CacheKey::op_Inequality(ZenUI.Section.CraftingPanelGrid/CacheKey,ZenUI.Section.CraftingPanelGrid/CacheKey)
IL_0042: brfalse.s IL_004a
IL_0044: ldarg.0
IL_0045: call System.Void ZenUI.Section.CraftingPanelGrid::ResetScrollSize()
IL_004a: ldarg.0
IL_004b: ldloc.0
IL_004c: stfld ZenUI.Section.CraftingPanelGrid/CacheKey ZenUI.Section.CraftingPanelGrid::_prevCacheKey
IL_0051: ret

// System.Void ZenUI.Section.CraftingPanelGrid::UpdateGui(ItemDrop/ItemData)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: brtrue.s IL_000d
IL_0004: ldc.i4.m1
IL_0005: ldc.i4.m1
IL_0006: newobj System.Void Vector2i::.ctor(System.Int32,System.Int32)
IL_000b: br.s IL_0013
IL_000d: ldarg.1
IL_000e: ldfld Vector2i ItemDrop/ItemData::m_gridPos
IL_0013: stfld Vector2i InventoryGrid::m_selected
IL_0018: ldarg.0
IL_0019: call System.Void ZenUI.Section.CraftingPanelGrid::UpdateGamepad()
IL_001e: ldarg.0
IL_001f: call System.Void ZenUI.Section.CraftingPanelGrid::UpdateGuiBefore()
IL_0024: ldarg.0
IL_0025: call System.Void ZenUI.Section.CraftingPanelGrid::UpdateGuiOptimized()
IL_002a: ldarg.0
IL_002b: call System.Void ZenUI.Section.CraftingPanelGrid::UpdateGuiAfter()
IL_0030: ret

// System.Void ZenUI.Section.CraftingPanelGrid::UpdateGuiAfter()
.locals ZenUI.Section.CraftingPanelGrid/CacheKey, Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean
IL_0000: ldarg.0
IL_0001: call ZenUI.Section.CraftingPanelGrid/CacheKey ZenUI.Section.CraftingPanelGrid::GetKey()
IL_0006: stloc.0
IL_0007: ldarg.0
IL_0008: ldfld System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanelGrid/CacheKey,ZenUI.Section.CraftingPanelGrid/CacheData> ZenUI.Section.CraftingPanelGrid::_cache
IL_000d: ldloc.0
IL_000e: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanelGrid/CacheKey,ZenUI.Section.CraftingPanelGrid/CacheData>::ContainsKey(!0)
IL_0013: brfalse.s IL_0016
IL_0015: ret
IL_0016: ldc.i4.s 18
IL_0018: ldc.i4.1
IL_0019: ldloca.s V_2
IL_001b: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_0020: stloc.1
IL_0021: ldloc.2
IL_0022: brfalse.s IL_0038
IL_0024: ldloca.s V_1
IL_0026: ldstr "Update cache key: "
IL_002b: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0030: ldloca.s V_1
IL_0032: ldloc.0
IL_0033: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<ZenUI.Section.CraftingPanelGrid/CacheKey>(!!0)
IL_0038: ldloc.1
IL_0039: ldc.i4.0
IL_003a: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_003f: ldarg.0
IL_0040: ldfld System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanelGrid/CacheKey,ZenUI.Section.CraftingPanelGrid/CacheData> ZenUI.Section.CraftingPanelGrid::_cache
IL_0045: ldloc.0
IL_0046: ldarg.0
IL_0047: newobj System.Void ZenUI.Section.CraftingPanelGrid/CacheData::.ctor(ZenUI.Section.CraftingPanelGrid)
IL_004c: callvirt System.Void System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanelGrid/CacheKey,ZenUI.Section.CraftingPanelGrid/CacheData>::set_Item(!0,!1)
IL_0051: ret

// System.Void ZenUI.Section.CraftingPanelGrid::ResetCache()
.locals 
IL_0000: ldstr "Reset item grid position lookup index"
IL_0005: ldc.i4.0
IL_0006: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_000b: ldarg.0
IL_000c: ldfld System.Collections.Generic.Dictionary`2<Vector2i,ItemDrop/ItemData> ZenUI.Section.CraftingPanelGrid::_gridInvPosIndex
IL_0011: callvirt System.Void System.Collections.Generic.Dictionary`2<Vector2i,ItemDrop/ItemData>::Clear()
IL_0016: ldstr "Remove all render keys"
IL_001b: ldc.i4.0
IL_001c: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_0021: ldarg.0
IL_0022: ldfld System.Collections.Generic.Dictionary`2<InventoryElement,ZenUI.Section.CraftingPanelGrid/RenderKey> ZenUI.Section.CraftingPanelGrid::_renderStateKeys
IL_0027: callvirt System.Void System.Collections.Generic.Dictionary`2<InventoryElement,ZenUI.Section.CraftingPanelGrid/RenderKey>::Clear()
IL_002c: ret

// System.Boolean ZenUI.Section.CraftingPanelGrid::IsRenderStateChanged(InventoryElement,ItemDrop/ItemData,ZenUI.Section.CraftingPanelGrid/RenderKey&)
.locals ZenUI.Section.CraftingPanelGrid/RenderKey
IL_0000: ldarg.3
IL_0001: ldarg.2
IL_0002: ldarg.2
IL_0003: callvirt UnityEngine.Sprite ItemDrop/ItemData::GetIcon()
IL_0008: ldarg.2
IL_0009: call System.Boolean ZenUI.Section.CraftingPanel::IsSelectedItem(ItemDrop/ItemData)
IL_000e: ldarg.2
IL_000f: call System.Boolean ZenUI.Section.CraftingPanel::CanCraft(ItemDrop/ItemData)
IL_0014: ldarg.0
IL_0015: ldarg.1
IL_0016: call System.Boolean ZenUI.Section.CraftingPanelGrid::IsHovering(InventoryElement)
IL_001b: ldarg.2
IL_001c: call System.Int32 Zen.Lib.ItemDataExt::GetCraftAmount(ItemDrop/ItemData)
IL_0021: newobj System.Void ZenUI.Section.CraftingPanelGrid/RenderKey::.ctor(ItemDrop/ItemData,UnityEngine.Sprite,System.Boolean,System.Boolean,System.Boolean,System.Int32)
IL_0026: stobj ZenUI.Section.CraftingPanelGrid/RenderKey
IL_002b: ldarg.0
IL_002c: ldfld System.Collections.Generic.Dictionary`2<InventoryElement,ZenUI.Section.CraftingPanelGrid/RenderKey> ZenUI.Section.CraftingPanelGrid::_renderStateKeys
IL_0031: ldarg.1
IL_0032: ldloca.s V_0
IL_0034: callvirt System.Boolean System.Collections.Generic.Dictionary`2<InventoryElement,ZenUI.Section.CraftingPanelGrid/RenderKey>::TryGetValue(!0,!1&)
IL_0039: brfalse.s IL_004b
IL_003b: ldloc.0
IL_003c: ldarg.3
IL_003d: ldobj ZenUI.Section.CraftingPanelGrid/RenderKey
IL_0042: call System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::op_Equality(ZenUI.Section.CraftingPanelGrid/RenderKey,ZenUI.Section.CraftingPanelGrid/RenderKey)
IL_0047: brfalse.s IL_004b
IL_0049: ldc.i4.0
IL_004a: ret
IL_004b: ldarg.0
IL_004c: ldfld System.Collections.Generic.Dictionary`2<InventoryElement,ZenUI.Section.CraftingPanelGrid/RenderKey> ZenUI.Section.CraftingPanelGrid::_renderStateKeys
IL_0051: ldarg.1
IL_0052: ldarg.3
IL_0053: ldobj ZenUI.Section.CraftingPanelGrid/RenderKey
IL_0058: callvirt System.Void System.Collections.Generic.Dictionary`2<InventoryElement,ZenUI.Section.CraftingPanelGrid/RenderKey>::set_Item(!0,!1)
IL_005d: ldc.i4.1
IL_005e: ret

// System.Void ZenUI.Section.CraftingPanelGrid::UpdateGuiOptimized()
.locals System.Collections.Generic.List`1/Enumerator<InventoryElement>, InventoryElement, ItemDrop/ItemData, ZenUI.Section.CraftingPanelGrid/RenderKey, System.Boolean, Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean
IL_0000: ldarg.0
IL_0001: ldflda Vector2i InventoryGrid::m_selected
IL_0006: ldarg.0
IL_0007: ldflda Vector2i InventoryGrid::m_selected
IL_000c: ldfld System.Int32 Vector2i::x
IL_0011: ldc.i4.0
IL_0012: ldarg.0
IL_0013: ldfld System.Int32 InventoryGrid::m_width
IL_0018: ldc.i4.1
IL_0019: sub
IL_001a: call System.Int32 UnityEngine.Mathf::Clamp(System.Int32,System.Int32,System.Int32)
IL_001f: stfld System.Int32 Vector2i::x
IL_0024: ldarg.0
IL_0025: ldflda Vector2i InventoryGrid::m_selected
IL_002a: ldarg.0
IL_002b: ldflda Vector2i InventoryGrid::m_selected
IL_0030: ldfld System.Int32 Vector2i::y
IL_0035: ldc.i4.0
IL_0036: ldarg.0
IL_0037: ldfld System.Int32 InventoryGrid::m_height
IL_003c: ldc.i4.1
IL_003d: sub
IL_003e: call System.Int32 UnityEngine.Mathf::Clamp(System.Int32,System.Int32,System.Int32)
IL_0043: stfld System.Int32 Vector2i::y
IL_0048: ldarg.0
IL_0049: ldfld System.Collections.Generic.List`1<InventoryElement> InventoryGrid::m_elements
IL_004e: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<InventoryElement>::GetEnumerator()
IL_0053: stloc.0
IL_0054: br IL_0226
IL_0059: ldloca.s V_0
IL_005b: call !0 System.Collections.Generic.List`1/Enumerator<InventoryElement>::get_Current()
IL_0060: stloc.1
IL_0061: call System.Boolean ZInput::IsGamepadActive()
IL_0066: brfalse.s IL_009a
IL_0068: ldarg.0
IL_0069: ldfld UIGroupHandler InventoryGrid::m_uiGroup
IL_006e: callvirt System.Boolean UIGroupHandler::get_IsActive()
IL_0073: brfalse.s IL_0088
IL_0075: ldloc.1
IL_0076: callvirt Vector2i InventoryElement::get_Position()
IL_007b: ldarg.0
IL_007c: ldfld Vector2i InventoryGrid::m_selected
IL_0081: call System.Boolean Vector2i::op_Equality(Vector2i,Vector2i)
IL_0086: br.s IL_0089
IL_0088: ldc.i4.0
IL_0089: stloc.s V_4
IL_008b: ldloc.1
IL_008c: ldfld UnityEngine.GameObject InventoryElement::m_selected
IL_0091: ldloc.s V_4
IL_0093: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0098: br.s IL_00a6
IL_009a: ldloc.1
IL_009b: ldfld UnityEngine.GameObject InventoryElement::m_selected
IL_00a0: ldc.i4.0
IL_00a1: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_00a6: ldarg.0
IL_00a7: ldfld System.Collections.Generic.Dictionary`2<Vector2i,ItemDrop/ItemData> ZenUI.Section.CraftingPanelGrid::_gridInvPosIndex
IL_00ac: ldloc.1
IL_00ad: callvirt Vector2i InventoryElement::get_Position()
IL_00b2: ldloca.s V_2
IL_00b4: callvirt System.Boolean System.Collections.Generic.Dictionary`2<Vector2i,ItemDrop/ItemData>::TryGetValue(!0,!1&)
IL_00b9: brtrue.s IL_00df
IL_00bb: ldarg.0
IL_00bc: ldfld System.Collections.Generic.Dictionary`2<InventoryElement,ZenUI.Section.CraftingPanelGrid/RenderKey> ZenUI.Section.CraftingPanelGrid::_renderStateKeys
IL_00c1: ldloc.1
IL_00c2: callvirt System.Boolean System.Collections.Generic.Dictionary`2<InventoryElement,ZenUI.Section.CraftingPanelGrid/RenderKey>::Remove(!0)
IL_00c7: pop
IL_00c8: ldloc.1
IL_00c9: ldfld System.Boolean InventoryElement::m_used
IL_00ce: brfalse IL_0226
IL_00d3: ldarg.0
IL_00d4: ldloc.1
IL_00d5: call System.Void Zen.Lib.InventoryGridExt::DisableElement(InventoryGrid,InventoryElement)
IL_00da: br IL_0226
IL_00df: ldarg.0
IL_00e0: ldloc.1
IL_00e1: ldloc.2
IL_00e2: ldloca.s V_3
IL_00e4: call System.Boolean ZenUI.Section.CraftingPanelGrid::IsRenderStateChanged(InventoryElement,ItemDrop/ItemData,ZenUI.Section.CraftingPanelGrid/RenderKey&)
IL_00e9: brfalse IL_0226
IL_00ee: ldc.i4.s 34
IL_00f0: ldc.i4.1
IL_00f1: ldloca.s V_6
IL_00f3: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_00f8: stloc.s V_5
IL_00fa: ldloc.s V_6
IL_00fc: brfalse.s IL_0117
IL_00fe: ldloca.s V_5
IL_0100: ldstr "Rebuilding grid element for item: "
IL_0105: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_010a: ldloca.s V_5
IL_010c: ldloc.2
IL_010d: call System.String Zen.Lib.ItemDataExt::GetName(ItemDrop/ItemData)
IL_0112: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_0117: ldloc.s V_5
IL_0119: ldc.i4.0
IL_011a: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_011f: ldloc.1
IL_0120: ldc.i4.1
IL_0121: stfld System.Boolean InventoryElement::m_used
IL_0126: ldloc.1
IL_0127: ldfld UnityEngine.UI.Image InventoryElement::m_icon
IL_012c: ldc.i4.1
IL_012d: callvirt System.Void UnityEngine.Behaviour::set_enabled(System.Boolean)
IL_0132: ldloc.1
IL_0133: ldfld UnityEngine.UI.Image InventoryElement::m_icon
IL_0138: ldloca.s V_3
IL_013a: call UnityEngine.Sprite ZenUI.Section.CraftingPanelGrid/RenderKey::get_Icon()
IL_013f: callvirt System.Void UnityEngine.UI.Image::set_sprite(UnityEngine.Sprite)
IL_0144: ldloc.1
IL_0145: ldfld UnityEngine.UI.Image InventoryElement::m_equiped
IL_014a: ldc.i4.0
IL_014b: callvirt System.Void UnityEngine.Behaviour::set_enabled(System.Boolean)
IL_0150: ldloc.2
IL_0151: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0156: ldfld ItemDrop/ItemData/ItemType ItemDrop/ItemData/SharedData::m_itemType
IL_015b: ldc.i4.2
IL_015c: ceq
IL_015e: brfalse.s IL_01b5
IL_0160: ldloc.2
IL_0161: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0166: ldfld System.Single ItemDrop/ItemData/SharedData::m_food
IL_016b: ldc.r4 0
IL_0170: bgt.s IL_0196
IL_0172: ldloc.2
IL_0173: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0178: ldfld System.Single ItemDrop/ItemData/SharedData::m_foodStamina
IL_017d: ldc.r4 0
IL_0182: bgt.s IL_0196
IL_0184: ldloc.2
IL_0185: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_018a: ldfld System.Single ItemDrop/ItemData/SharedData::m_foodEitr
IL_018f: ldc.r4 0
IL_0194: ble.un.s IL_01b5
IL_0196: ldloc.1
IL_0197: ldfld UnityEngine.UI.Image InventoryElement::m_food
IL_019c: ldc.i4.1
IL_019d: callvirt System.Void UnityEngine.Behaviour::set_enabled(System.Boolean)
IL_01a2: ldloc.1
IL_01a3: ldfld UnityEngine.UI.Image InventoryElement::m_food
IL_01a8: ldloc.2
IL_01a9: call UnityEngine.Color ZenUI.Section.ItemIcon::GetFoodForkColor(ItemDrop/ItemData)
IL_01ae: callvirt System.Void UnityEngine.UI.Graphic::set_color(UnityEngine.Color)
IL_01b3: br.s IL_01c1
IL_01b5: ldloc.1
IL_01b6: ldfld UnityEngine.UI.Image InventoryElement::m_food
IL_01bb: ldc.i4.0
IL_01bc: callvirt System.Void UnityEngine.Behaviour::set_enabled(System.Boolean)
IL_01c1: ldloc.1
IL_01c2: ldfld UITooltip InventoryElement::m_tooltip
IL_01c7: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelTooltipHover
IL_01cc: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_01d1: brtrue.s IL_01da
IL_01d3: call System.Boolean ZInput::IsGamepadActive()
IL_01d8: br.s IL_01db
IL_01da: ldc.i4.1
IL_01db: callvirt System.Void UnityEngine.Behaviour::set_enabled(System.Boolean)
IL_01e0: ldarg.0
IL_01e1: ldloc.2
IL_01e2: ldloc.1
IL_01e3: ldfld UITooltip InventoryElement::m_tooltip
IL_01e8: call System.Void InventoryGrid::CreateItemTooltip(ItemDrop/ItemData,UITooltip)
IL_01ed: ldloc.1
IL_01ee: ldloc.2
IL_01ef: ldloc.3
IL_01f0: call System.Void ZenUI.Section.CraftingPanelGrid::UpdateElement(InventoryElement,ItemDrop/ItemData,ZenUI.Section.CraftingPanelGrid/RenderKey)
IL_01f5: ldc.i4.s 9
IL_01f7: ldc.i4.1
IL_01f8: ldloca.s V_6
IL_01fa: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_01ff: stloc.s V_5
IL_0201: ldloc.s V_6
IL_0203: brfalse.s IL_021e
IL_0205: ldloca.s V_5
IL_0207: ldstr "Updated: "
IL_020c: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0211: ldloca.s V_5
IL_0213: ldloc.2
IL_0214: call System.String Zen.Lib.ItemDataExt::GetName(ItemDrop/ItemData)
IL_0219: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_021e: ldloc.s V_5
IL_0220: ldc.i4.0
IL_0221: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_0226: ldloca.s V_0
IL_0228: call System.Boolean System.Collections.Generic.List`1/Enumerator<InventoryElement>::MoveNext()
IL_022d: brtrue IL_0059
IL_0232: leave.s IL_0242
IL_0234: ldloca.s V_0
IL_0236: constrained. System.Collections.Generic.List`1/Enumerator<InventoryElement>
IL_023c: callvirt System.Void System.IDisposable::Dispose()
IL_0241: endfinally
IL_0242: ret
// EH Finally: 84 - 564 => 564 - 578

// System.Boolean ZenUI.Section.CraftingPanelGrid::IsHovering(InventoryElement)
.locals UnityEngine.RectTransform, UnityEngine.Rect
IL_0000: call System.Boolean ZInput::IsGamepadActive()
IL_0005: brfalse.s IL_0019
IL_0007: ldarg.1
IL_0008: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_000d: ldarg.0
IL_000e: call UnityEngine.RectTransform InventoryGrid::GetGamepadSelectedElement()
IL_0013: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0018: ret
IL_0019: ldarg.1
IL_001a: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_001f: castclass UnityEngine.RectTransform
IL_0024: stloc.0
IL_0025: ldloc.0
IL_0026: callvirt UnityEngine.Rect UnityEngine.RectTransform::get_rect()
IL_002b: stloc.1
IL_002c: ldloca.s V_1
IL_002e: ldloc.0
IL_002f: call UnityEngine.Vector3 ZInput::get_pointerPosition()
IL_0034: callvirt UnityEngine.Vector3 UnityEngine.Transform::InverseTransformPoint(UnityEngine.Vector3)
IL_0039: call System.Boolean UnityEngine.Rect::Contains(UnityEngine.Vector3)
IL_003e: ret

// System.Void ZenUI.Section.CraftingPanelGrid::UpdateElement(InventoryElement,ItemDrop/ItemData,ZenUI.Section.CraftingPanelGrid/RenderKey)
.locals System.Boolean, UnityEngine.Color, UnityEngine.Color, UnityEngine.Color, UnityEngine.Color, UnityEngine.Color, System.Boolean, UnityEngine.Color, UnityEngine.Color, System.Boolean, Zen.Lib.UIColor, System.String, ZenUI.UncraftableSymbolPosition
IL_0000: ldarga.s renderKey
IL_0002: call System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::get_CanCraft()
IL_0007: dup
IL_0008: brtrue.s IL_0013
IL_000a: ldarga.s renderKey
IL_000c: call System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::get_Hovered()
IL_0011: br.s IL_0014
IL_0013: ldc.i4.1
IL_0014: stloc.0
IL_0015: call UnityEngine.Color UnityEngine.Color::get_white()
IL_001a: stloc.1
IL_001b: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ZenUI.Configs::CraftPanelUncraftableBrightness
IL_0020: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0025: ldc.r4 0
IL_002a: bgt.s IL_0033
IL_002c: ldsfld UnityEngine.Color ZenUI.Section.CraftingPanelGrid::BlackAndWhite
IL_0031: br.s IL_0057
IL_0033: call UnityEngine.Color UnityEngine.Color::get_white()
IL_0038: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ZenUI.Configs::CraftPanelUncraftableBrightness
IL_003d: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0042: call UnityEngine.Color UnityEngine.Color::op_Multiply(UnityEngine.Color,System.Single)
IL_0047: stloc.s V_7
IL_0049: ldloca.s V_7
IL_004b: ldc.r4 1
IL_0050: stfld System.Single UnityEngine.Color::a
IL_0055: ldloc.s V_7
IL_0057: stloc.2
IL_0058: ldloc.0
IL_0059: brtrue.s IL_005e
IL_005b: ldloc.2
IL_005c: br.s IL_005f
IL_005e: ldloc.1
IL_005f: stloc.3
IL_0060: ldloc.0
IL_0061: brtrue.s IL_0080
IL_0063: ldloc.1
IL_0064: ldc.r4 0.7
IL_0069: call UnityEngine.Color UnityEngine.Color::op_Multiply(UnityEngine.Color,System.Single)
IL_006e: stloc.s V_7
IL_0070: ldloca.s V_7
IL_0072: ldc.r4 1
IL_0077: stfld System.Single UnityEngine.Color::a
IL_007c: ldloc.s V_7
IL_007e: br.s IL_0081
IL_0080: ldloc.1
IL_0081: stloc.s V_4
IL_0083: ldloc.0
IL_0084: brtrue.s IL_00a3
IL_0086: ldloc.1
IL_0087: ldc.r4 0.6
IL_008c: call UnityEngine.Color UnityEngine.Color::op_Multiply(UnityEngine.Color,System.Single)
IL_0091: stloc.s V_7
IL_0093: ldloca.s V_7
IL_0095: ldc.r4 1
IL_009a: stfld System.Single UnityEngine.Color::a
IL_009f: ldloc.s V_7
IL_00a1: br.s IL_00a4
IL_00a3: ldloc.1
IL_00a4: stloc.s V_5
IL_00a6: ldarg.0
IL_00a7: ldfld UnityEngine.UI.Image InventoryElement::m_equiped
IL_00ac: ldarga.s renderKey
IL_00ae: call System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::get_Selected()
IL_00b3: callvirt System.Void UnityEngine.Behaviour::set_enabled(System.Boolean)
IL_00b8: ldarg.0
IL_00b9: ldfld UnityEngine.UI.Image InventoryElement::m_icon
IL_00be: ldloc.3
IL_00bf: callvirt System.Void UnityEngine.UI.Graphic::set_color(UnityEngine.Color)
IL_00c4: ldarg.0
IL_00c5: ldfld TMPro.TMP_Text InventoryElement::m_amount
IL_00ca: ldloc.s V_5
IL_00cc: callvirt System.Void UnityEngine.UI.Graphic::set_color(UnityEngine.Color)
IL_00d1: ldarg.0
IL_00d2: ldfld UnityEngine.UI.Image InventoryElement::m_food
IL_00d7: dup
IL_00d8: callvirt UnityEngine.Color UnityEngine.UI.Graphic::get_color()
IL_00dd: ldloc.s V_4
IL_00df: call UnityEngine.Color UnityEngine.Color::op_Multiply(UnityEngine.Color,UnityEngine.Color)
IL_00e4: callvirt System.Void UnityEngine.UI.Graphic::set_color(UnityEngine.Color)
IL_00e9: ldarg.0
IL_00ea: ldfld UnityEngine.UI.Image InventoryElement::m_noteleport
IL_00ef: call System.Boolean ZenUI.Section.CraftingPanelGrid::get_IsUntouchedItemIndicatorEnabled()
IL_00f4: brfalse.s IL_0117
IL_00f6: ldsfld Player Player::m_localPlayer
IL_00fb: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0100: brfalse.s IL_0117
IL_0102: ldsfld Player Player::m_localPlayer
IL_0107: ldarg.1
IL_0108: call System.String Zen.Lib.ItemDataExt::GetName(ItemDrop/ItemData)
IL_010d: callvirt System.Boolean Player::IsKnownMaterial(System.String)
IL_0112: ldc.i4.0
IL_0113: ceq
IL_0115: br.s IL_0118
IL_0117: ldc.i4.0
IL_0118: callvirt System.Void UnityEngine.Behaviour::set_enabled(System.Boolean)
IL_011d: ldarg.0
IL_011e: ldfld UnityEngine.UI.Image InventoryElement::m_noteleport
IL_0123: callvirt System.Boolean UnityEngine.Behaviour::get_enabled()
IL_0128: brfalse.s IL_0173
IL_012a: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::CraftPanelUntouchedItemIndicatorColor
IL_012f: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_0134: stloc.s V_8
IL_0136: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> ZenUI.Configs::CraftPanelUncraftableBrightness
IL_013b: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0140: ldc.r4 1
IL_0145: clt
IL_0147: stloc.s V_9
IL_0149: ldarg.0
IL_014a: ldfld UnityEngine.UI.Image InventoryElement::m_noteleport
IL_014f: ldloc.0
IL_0150: ldc.i4.0
IL_0151: ceq
IL_0153: ldloc.s V_9
IL_0155: and
IL_0156: brtrue.s IL_015c
IL_0158: ldloc.s V_8
IL_015a: br.s IL_016e
IL_015c: ldloc.s V_8
IL_015e: stloc.s V_7
IL_0160: ldloca.s V_7
IL_0162: ldc.r4 0.5
IL_0167: stfld System.Single UnityEngine.Color::a
IL_016c: ldloc.s V_7
IL_016e: callvirt System.Void UnityEngine.UI.Graphic::set_color(UnityEngine.Color)
IL_0173: ldarg.1
IL_0174: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0179: ldfld System.Int32 ItemDrop/ItemData/SharedData::m_maxStackSize
IL_017e: ldc.i4.1
IL_017f: ble.s IL_019b
IL_0181: ldarg.0
IL_0182: ldfld TMPro.TMP_Text InventoryElement::m_amount
IL_0187: ldstr "x{0}"
IL_018c: ldarga.s renderKey
IL_018e: call System.Int32 ZenUI.Section.CraftingPanelGrid/RenderKey::get_Amount()
IL_0193: conv.r4
IL_0194: callvirt System.Void TMPro.TMP_Text::SetText(System.String,System.Single)
IL_0199: br.s IL_01ab
IL_019b: ldarg.0
IL_019c: ldfld TMPro.TMP_Text InventoryElement::m_amount
IL_01a1: ldsfld System.String System.String::Empty
IL_01a6: callvirt System.Void TMPro.TMP_Text::SetText(System.String)
IL_01ab: ldarg.0
IL_01ac: ldfld TMPro.TMP_Text InventoryElement::m_amount
IL_01b1: ldarg.0
IL_01b2: ldfld TMPro.TMP_Text InventoryElement::m_amount
IL_01b7: callvirt System.String TMPro.TMP_Text::get_text()
IL_01bc: ldsfld System.String System.String::Empty
IL_01c1: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_01c6: callvirt System.Void UnityEngine.Behaviour::set_enabled(System.Boolean)
IL_01cb: ldarg.0
IL_01cc: ldfld TMPro.TMP_Text InventoryElement::m_quality
IL_01d1: ldc.i4.0
IL_01d2: callvirt System.Void UnityEngine.Behaviour::set_enabled(System.Boolean)
IL_01d7: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ZenUI.Configs::CraftPanelUncraftableSymbol
IL_01dc: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_01e1: call System.Boolean BepInEx.Utility::IsNullOrWhiteSpace(System.String)
IL_01e6: brtrue.s IL_01f7
IL_01e8: ldsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.UncraftableSymbolPosition> ZenUI.Configs::CraftPanelUncraftableSymbolPosition
IL_01ed: callvirt !0 BepInEx.Configuration.ConfigEntry`1<ZenUI.UncraftableSymbolPosition>::get_Value()
IL_01f2: ldc.i4.0
IL_01f3: cgt.un
IL_01f5: br.s IL_01f8
IL_01f7: ldc.i4.0
IL_01f8: stloc.s V_6
IL_01fa: ldc.i4.0
IL_01fb: ceq
IL_01fd: ldloc.s V_6
IL_01ff: and
IL_0200: brfalse IL_03e6
IL_0205: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::CraftPanelUncraftableSymbolColor
IL_020a: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_020f: call Zen.Lib.UIColor Zen.Lib.UIColor::op_Implicit(UnityEngine.Color)
IL_0214: stloc.s V_10
IL_0216: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ZenUI.Configs::CraftPanelUncraftableSymbol
IL_021b: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_0220: stloc.s V_11
IL_0222: ldarg.0
IL_0223: ldfld TMPro.TMP_Text InventoryElement::m_quality
IL_0228: ldstr "<color={0}>{1}</color>"
IL_022d: ldloc.s V_10
IL_022f: ldloc.s V_11
IL_0231: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_0236: callvirt System.Void TMPro.TMP_Text::set_text(System.String)
IL_023b: ldarg.0
IL_023c: ldfld TMPro.TMP_Text InventoryElement::m_quality
IL_0241: ldc.i4.1
IL_0242: callvirt System.Void UnityEngine.Behaviour::set_enabled(System.Boolean)
IL_0247: ldsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.UncraftableSymbolPosition> ZenUI.Configs::CraftPanelUncraftableSymbolPosition
IL_024c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<ZenUI.UncraftableSymbolPosition>::get_Value()
IL_0251: stloc.s V_12
IL_0253: ldloc.s V_12
IL_0255: ldc.i4.1
IL_0256: beq IL_0323
IL_025b: ldloc.s V_12
IL_025d: ldc.i4.2
IL_025e: bne.un IL_03e0
IL_0263: ldarg.0
IL_0264: ldfld TMPro.TMP_Text InventoryElement::m_quality
IL_0269: callvirt UnityEngine.RectTransform TMPro.TMP_Text::get_rectTransform()
IL_026e: ldc.r4 0.5
IL_0273: ldc.r4 0.5
IL_0278: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_027d: callvirt System.Void UnityEngine.RectTransform::set_pivot(UnityEngine.Vector2)
IL_0282: ldarg.0
IL_0283: ldfld TMPro.TMP_Text InventoryElement::m_quality
IL_0288: callvirt UnityEngine.RectTransform TMPro.TMP_Text::get_rectTransform()
IL_028d: ldc.r4 0
IL_0292: ldc.r4 0
IL_0297: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_029c: callvirt System.Void UnityEngine.RectTransform::set_anchorMin(UnityEngine.Vector2)
IL_02a1: ldarg.0
IL_02a2: ldfld TMPro.TMP_Text InventoryElement::m_quality
IL_02a7: callvirt UnityEngine.RectTransform TMPro.TMP_Text::get_rectTransform()
IL_02ac: ldc.r4 0
IL_02b1: ldc.r4 1
IL_02b6: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_02bb: callvirt System.Void UnityEngine.RectTransform::set_anchorMax(UnityEngine.Vector2)
IL_02c0: ldarg.0
IL_02c1: ldfld TMPro.TMP_Text InventoryElement::m_quality
IL_02c6: callvirt UnityEngine.RectTransform TMPro.TMP_Text::get_rectTransform()
IL_02cb: ldc.r4 15
IL_02d0: ldc.r4 0
IL_02d5: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_02da: callvirt System.Void UnityEngine.RectTransform::set_offsetMin(UnityEngine.Vector2)
IL_02df: ldarg.0
IL_02e0: ldfld TMPro.TMP_Text InventoryElement::m_quality
IL_02e5: callvirt UnityEngine.RectTransform TMPro.TMP_Text::get_rectTransform()
IL_02ea: ldc.r4 0
IL_02ef: ldc.r4 -3
IL_02f4: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_02f9: callvirt System.Void UnityEngine.RectTransform::set_offsetMax(UnityEngine.Vector2)
IL_02fe: ldarg.0
IL_02ff: ldfld TMPro.TMP_Text InventoryElement::m_quality
IL_0304: ldc.r4 18
IL_0309: callvirt System.Void TMPro.TMP_Text::set_fontSize(System.Single)
IL_030e: ldarg.0
IL_030f: ldfld TMPro.TMP_Text InventoryElement::m_quality
IL_0314: ldc.i4 258
IL_0319: callvirt System.Void TMPro.TMP_Text::set_alignment(TMPro.TextAlignmentOptions)
IL_031e: br IL_03e6
IL_0323: ldarg.0
IL_0324: ldfld TMPro.TMP_Text InventoryElement::m_quality
IL_0329: callvirt UnityEngine.RectTransform TMPro.TMP_Text::get_rectTransform()
IL_032e: ldc.r4 0.5
IL_0333: ldc.r4 0.5
IL_0338: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_033d: callvirt System.Void UnityEngine.RectTransform::set_pivot(UnityEngine.Vector2)
IL_0342: ldarg.0
IL_0343: ldfld TMPro.TMP_Text InventoryElement::m_quality
IL_0348: callvirt UnityEngine.RectTransform TMPro.TMP_Text::get_rectTransform()
IL_034d: ldc.r4 0
IL_0352: ldc.r4 0
IL_0357: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_035c: callvirt System.Void UnityEngine.RectTransform::set_anchorMin(UnityEngine.Vector2)
IL_0361: ldarg.0
IL_0362: ldfld TMPro.TMP_Text InventoryElement::m_quality
IL_0367: callvirt UnityEngine.RectTransform TMPro.TMP_Text::get_rectTransform()
IL_036c: ldc.r4 1
IL_0371: ldc.r4 1
IL_0376: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_037b: callvirt System.Void UnityEngine.RectTransform::set_anchorMax(UnityEngine.Vector2)
IL_0380: ldarg.0
IL_0381: ldfld TMPro.TMP_Text InventoryElement::m_quality
IL_0386: callvirt UnityEngine.RectTransform TMPro.TMP_Text::get_rectTransform()
IL_038b: ldc.r4 0
IL_0390: ldc.r4 0
IL_0395: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_039a: callvirt System.Void UnityEngine.RectTransform::set_offsetMin(UnityEngine.Vector2)
IL_039f: ldarg.0
IL_03a0: ldfld TMPro.TMP_Text InventoryElement::m_quality
IL_03a5: callvirt UnityEngine.RectTransform TMPro.TMP_Text::get_rectTransform()
IL_03aa: ldc.r4 0
IL_03af: ldc.r4 0
IL_03b4: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_03b9: callvirt System.Void UnityEngine.RectTransform::set_offsetMax(UnityEngine.Vector2)
IL_03be: ldarg.0
IL_03bf: ldfld TMPro.TMP_Text InventoryElement::m_quality
IL_03c4: ldc.r4 32
IL_03c9: callvirt System.Void TMPro.TMP_Text::set_fontSize(System.Single)
IL_03ce: ldarg.0
IL_03cf: ldfld TMPro.TMP_Text InventoryElement::m_quality
IL_03d4: ldc.i4 514
IL_03d9: callvirt System.Void TMPro.TMP_Text::set_alignment(TMPro.TextAlignmentOptions)
IL_03de: br.s IL_03e6
IL_03e0: newobj System.Void System.ArgumentOutOfRangeException::.ctor()
IL_03e5: throw
IL_03e6: ldnull
IL_03e7: ldarg.0
IL_03e8: ldfld UnityEngine.UI.Image InventoryElement::m_icon
IL_03ed: ldarg.0
IL_03ee: ldfld UnityEngine.UI.Image InventoryElement::m_equiped
IL_03f3: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::ItemActivatedColor
IL_03f8: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_03fd: call System.Void ZenUI.Section.ItemIcon::UpdateItemIcon(GuiBar,UnityEngine.UI.Image,UnityEngine.UI.Image,UnityEngine.Color)
IL_0402: ret

// InventoryElement ZenUI.Section.CraftingPanelGrid::GetElementAt(Vector2i)
.locals 
IL_0000: ldarg.1
IL_0001: ldfld System.Int32 Vector2i::x
IL_0006: ldc.i4.0
IL_0007: blt.s IL_002e
IL_0009: ldarg.1
IL_000a: ldfld System.Int32 Vector2i::x
IL_000f: ldarg.0
IL_0010: ldfld System.Int32 InventoryGrid::m_width
IL_0015: bge.s IL_002e
IL_0017: ldarg.1
IL_0018: ldfld System.Int32 Vector2i::y
IL_001d: ldc.i4.0
IL_001e: blt.s IL_002e
IL_0020: ldarg.1
IL_0021: ldfld System.Int32 Vector2i::y
IL_0026: ldarg.0
IL_0027: ldfld System.Int32 InventoryGrid::m_height
IL_002c: blt.s IL_0030
IL_002e: ldnull
IL_002f: ret
IL_0030: ldarg.0
IL_0031: ldarg.1
IL_0032: ldfld System.Int32 Vector2i::x
IL_0037: ldarg.1
IL_0038: ldfld System.Int32 Vector2i::y
IL_003d: ldarg.0
IL_003e: ldfld System.Int32 InventoryGrid::m_width
IL_0043: call InventoryElement InventoryGrid::GetElement(System.Int32,System.Int32,System.Int32)
IL_0048: ret

// UnityEngine.RectTransform ZenUI.Section.CraftingPanelGrid::GetElementTransformAt(Vector2i)
.locals InventoryElement
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: ldfld System.Int32 Vector2i::x
IL_0007: ldarg.1
IL_0008: ldfld System.Int32 Vector2i::y
IL_000d: ldarg.0
IL_000e: ldfld System.Int32 InventoryGrid::m_width
IL_0013: call InventoryElement InventoryGrid::GetElement(System.Int32,System.Int32,System.Int32)
IL_0018: stloc.0
IL_0019: ldloc.0
IL_001a: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_001f: brfalse.s IL_002d
IL_0021: ldloc.0
IL_0022: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0027: isinst UnityEngine.RectTransform
IL_002c: ret
IL_002d: ldnull
IL_002e: ret

// System.Void ZenUI.Section.CraftingPanelGrid::CenterOn(Vector2i)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ScrollRectEnsureVisible InventoryGrid::m_ensureVisible
IL_0006: ldarg.0
IL_0007: ldarg.1
IL_0008: call UnityEngine.RectTransform ZenUI.Section.CraftingPanelGrid::GetElementTransformAt(Vector2i)
IL_000d: callvirt System.Void ScrollRectEnsureVisible::CenterOnItem(UnityEngine.RectTransform)
IL_0012: ret

// System.Void ZenUI.Section.CraftingPanelGrid::CenterOn(ItemDrop/ItemData)
.locals 
IL_0000: ldarg.1
IL_0001: brfalse.s IL_000f
IL_0003: ldarg.0
IL_0004: ldarg.1
IL_0005: ldfld Vector2i ItemDrop/ItemData::m_gridPos
IL_000a: call System.Void ZenUI.Section.CraftingPanelGrid::CenterOn(Vector2i)
IL_000f: ret

// System.Void ZenUI.Section.CraftingPanelGrid::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: newobj System.Void System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanelGrid/CacheKey,ZenUI.Section.CraftingPanelGrid/CacheData>::.ctor()
IL_0006: stfld System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanelGrid/CacheKey,ZenUI.Section.CraftingPanelGrid/CacheData> ZenUI.Section.CraftingPanelGrid::_cache
IL_000b: ldarg.0
IL_000c: newobj System.Void System.Collections.Generic.Dictionary`2<Vector2i,ItemDrop/ItemData>::.ctor()
IL_0011: stfld System.Collections.Generic.Dictionary`2<Vector2i,ItemDrop/ItemData> ZenUI.Section.CraftingPanelGrid::_gridInvPosIndex
IL_0016: ldarg.0
IL_0017: newobj System.Void System.Collections.Generic.Dictionary`2<InventoryElement,ZenUI.Section.CraftingPanelGrid/RenderKey>::.ctor()
IL_001c: stfld System.Collections.Generic.Dictionary`2<InventoryElement,ZenUI.Section.CraftingPanelGrid/RenderKey> ZenUI.Section.CraftingPanelGrid::_renderStateKeys
IL_0021: ldarg.0
IL_0022: call System.Void InventoryGrid::.ctor()
IL_0027: ret

// System.Void ZenUI.Section.CraftingPanelGrid::.cctor()
.locals 
IL_0000: ldsfld UnityEngine.Color Hud::s_colorRedBlueZeroAlpha
IL_0005: stsfld UnityEngine.Color ZenUI.Section.CraftingPanelGrid::BlackAndWhite
IL_000a: ret

// System.Void ZenUI.Section.CraftingPanelGrid::<Init>b__19_0(System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Action`1<System.Single> ZenUI.Section.CraftingPanelGrid::OnScrollChanged
IL_0006: dup
IL_0007: brtrue.s IL_000b
IL_0009: pop
IL_000a: ret
IL_000b: ldarg.1
IL_000c: callvirt System.Void System.Action`1<System.Single>::Invoke(!0)
IL_0011: ret

// System.Void ZenUI.Section.CraftingPanelGrid/CacheKey::.ctor(System.Int32,System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Int32 ZenUI.Section.CraftingPanelGrid/CacheKey::<Width>k__BackingField
IL_0007: ldarg.0
IL_0008: ldarg.2
IL_0009: stfld System.Int32 ZenUI.Section.CraftingPanelGrid/CacheKey::<Height>k__BackingField
IL_000e: ret

// System.Int32 ZenUI.Section.CraftingPanelGrid/CacheKey::get_Width()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 ZenUI.Section.CraftingPanelGrid/CacheKey::<Width>k__BackingField
IL_0006: ret

// System.Void ZenUI.Section.CraftingPanelGrid/CacheKey::set_Width(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Int32 ZenUI.Section.CraftingPanelGrid/CacheKey::<Width>k__BackingField
IL_0007: ret

// System.Int32 ZenUI.Section.CraftingPanelGrid/CacheKey::get_Height()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 ZenUI.Section.CraftingPanelGrid/CacheKey::<Height>k__BackingField
IL_0006: ret

// System.Void ZenUI.Section.CraftingPanelGrid/CacheKey::set_Height(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Int32 ZenUI.Section.CraftingPanelGrid/CacheKey::<Height>k__BackingField
IL_0007: ret

// System.String ZenUI.Section.CraftingPanelGrid/CacheKey::ToString()
.locals System.Text.StringBuilder
IL_0000: newobj System.Void System.Text.StringBuilder::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldstr "CacheKey"
IL_000c: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0011: pop
IL_0012: ldloc.0
IL_0013: ldstr " { "
IL_0018: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_001d: pop
IL_001e: ldarg.0
IL_001f: ldloc.0
IL_0020: call System.Boolean ZenUI.Section.CraftingPanelGrid/CacheKey::PrintMembers(System.Text.StringBuilder)
IL_0025: brfalse.s IL_0030
IL_0027: ldloc.0
IL_0028: ldc.i4.s 32
IL_002a: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.Char)
IL_002f: pop
IL_0030: ldloc.0
IL_0031: ldc.i4.s 125
IL_0033: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.Char)
IL_0038: pop
IL_0039: ldloc.0
IL_003a: callvirt System.String System.Object::ToString()
IL_003f: ret

// System.Boolean ZenUI.Section.CraftingPanelGrid/CacheKey::PrintMembers(System.Text.StringBuilder)
.locals System.Int32
IL_0000: ldarg.1
IL_0001: ldstr "Width = "
IL_0006: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_000b: pop
IL_000c: ldarg.1
IL_000d: ldarg.0
IL_000e: call System.Int32 ZenUI.Section.CraftingPanelGrid/CacheKey::get_Width()
IL_0013: stloc.0
IL_0014: ldloca.s V_0
IL_0016: constrained. System.Int32
IL_001c: callvirt System.String System.Object::ToString()
IL_0021: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0026: pop
IL_0027: ldarg.1
IL_0028: ldstr ", Height = "
IL_002d: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0032: pop
IL_0033: ldarg.1
IL_0034: ldarg.0
IL_0035: call System.Int32 ZenUI.Section.CraftingPanelGrid/CacheKey::get_Height()
IL_003a: stloc.0
IL_003b: ldloca.s V_0
IL_003d: constrained. System.Int32
IL_0043: callvirt System.String System.Object::ToString()
IL_0048: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_004d: pop
IL_004e: ldc.i4.1
IL_004f: ret

// System.Boolean ZenUI.Section.CraftingPanelGrid/CacheKey::op_Inequality(ZenUI.Section.CraftingPanelGrid/CacheKey,ZenUI.Section.CraftingPanelGrid/CacheKey)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: call System.Boolean ZenUI.Section.CraftingPanelGrid/CacheKey::op_Equality(ZenUI.Section.CraftingPanelGrid/CacheKey,ZenUI.Section.CraftingPanelGrid/CacheKey)
IL_0007: ldc.i4.0
IL_0008: ceq
IL_000a: ret

// System.Boolean ZenUI.Section.CraftingPanelGrid/CacheKey::op_Equality(ZenUI.Section.CraftingPanelGrid/CacheKey,ZenUI.Section.CraftingPanelGrid/CacheKey)
.locals 
IL_0000: ldarga.s left
IL_0002: ldarg.1
IL_0003: call System.Boolean ZenUI.Section.CraftingPanelGrid/CacheKey::Equals(ZenUI.Section.CraftingPanelGrid/CacheKey)
IL_0008: ret

// System.Int32 ZenUI.Section.CraftingPanelGrid/CacheKey::GetHashCode()
.locals 
IL_0000: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<System.Int32>::get_Default()
IL_0005: ldarg.0
IL_0006: ldfld System.Int32 ZenUI.Section.CraftingPanelGrid/CacheKey::<Width>k__BackingField
IL_000b: callvirt System.Int32 System.Collections.Generic.EqualityComparer`1<System.Int32>::GetHashCode(!0)
IL_0010: ldc.i4 -1521134295
IL_0015: mul
IL_0016: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<System.Int32>::get_Default()
IL_001b: ldarg.0
IL_001c: ldfld System.Int32 ZenUI.Section.CraftingPanelGrid/CacheKey::<Height>k__BackingField
IL_0021: callvirt System.Int32 System.Collections.Generic.EqualityComparer`1<System.Int32>::GetHashCode(!0)
IL_0026: add
IL_0027: ret

// System.Boolean ZenUI.Section.CraftingPanelGrid/CacheKey::Equals(System.Object)
.locals 
IL_0000: ldarg.1
IL_0001: isinst ZenUI.Section.CraftingPanelGrid/CacheKey
IL_0006: brfalse.s IL_0015
IL_0008: ldarg.0
IL_0009: ldarg.1
IL_000a: unbox.any ZenUI.Section.CraftingPanelGrid/CacheKey
IL_000f: call System.Boolean ZenUI.Section.CraftingPanelGrid/CacheKey::Equals(ZenUI.Section.CraftingPanelGrid/CacheKey)
IL_0014: ret
IL_0015: ldc.i4.0
IL_0016: ret

// System.Boolean ZenUI.Section.CraftingPanelGrid/CacheKey::Equals(ZenUI.Section.CraftingPanelGrid/CacheKey)
.locals 
IL_0000: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<System.Int32>::get_Default()
IL_0005: ldarg.0
IL_0006: ldfld System.Int32 ZenUI.Section.CraftingPanelGrid/CacheKey::<Width>k__BackingField
IL_000b: ldarg.1
IL_000c: ldfld System.Int32 ZenUI.Section.CraftingPanelGrid/CacheKey::<Width>k__BackingField
IL_0011: callvirt System.Boolean System.Collections.Generic.EqualityComparer`1<System.Int32>::Equals(!0,!0)
IL_0016: brfalse.s IL_002f
IL_0018: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<System.Int32>::get_Default()
IL_001d: ldarg.0
IL_001e: ldfld System.Int32 ZenUI.Section.CraftingPanelGrid/CacheKey::<Height>k__BackingField
IL_0023: ldarg.1
IL_0024: ldfld System.Int32 ZenUI.Section.CraftingPanelGrid/CacheKey::<Height>k__BackingField
IL_0029: callvirt System.Boolean System.Collections.Generic.EqualityComparer`1<System.Int32>::Equals(!0,!0)
IL_002e: ret
IL_002f: ldc.i4.0
IL_0030: ret

// System.Void ZenUI.Section.CraftingPanelGrid/CacheKey::Deconstruct(System.Int32&,System.Int32&)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.0
IL_0002: call System.Int32 ZenUI.Section.CraftingPanelGrid/CacheKey::get_Width()
IL_0007: stind.i4
IL_0008: ldarg.2
IL_0009: ldarg.0
IL_000a: call System.Int32 ZenUI.Section.CraftingPanelGrid/CacheKey::get_Height()
IL_000f: stind.i4
IL_0010: ret

// System.Void ZenUI.Section.CraftingPanelGrid/RenderKey::.ctor(ItemDrop/ItemData,UnityEngine.Sprite,System.Boolean,System.Boolean,System.Boolean,System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld ItemDrop/ItemData ZenUI.Section.CraftingPanelGrid/RenderKey::<Item>k__BackingField
IL_0007: ldarg.0
IL_0008: ldarg.2
IL_0009: stfld UnityEngine.Sprite ZenUI.Section.CraftingPanelGrid/RenderKey::<Icon>k__BackingField
IL_000e: ldarg.0
IL_000f: ldarg.3
IL_0010: stfld System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::<Selected>k__BackingField
IL_0015: ldarg.0
IL_0016: ldarg.s CanCraft
IL_0018: stfld System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::<CanCraft>k__BackingField
IL_001d: ldarg.0
IL_001e: ldarg.s Hovered
IL_0020: stfld System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::<Hovered>k__BackingField
IL_0025: ldarg.0
IL_0026: ldarg.s Amount
IL_0028: stfld System.Int32 ZenUI.Section.CraftingPanelGrid/RenderKey::<Amount>k__BackingField
IL_002d: ret

// ItemDrop/ItemData ZenUI.Section.CraftingPanelGrid/RenderKey::get_Item()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ItemDrop/ItemData ZenUI.Section.CraftingPanelGrid/RenderKey::<Item>k__BackingField
IL_0006: ret

// System.Void modreq(System.Runtime.CompilerServices.IsExternalInit) ZenUI.Section.CraftingPanelGrid/RenderKey::set_Item(ItemDrop/ItemData)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld ItemDrop/ItemData ZenUI.Section.CraftingPanelGrid/RenderKey::<Item>k__BackingField
IL_0007: ret

// UnityEngine.Sprite ZenUI.Section.CraftingPanelGrid/RenderKey::get_Icon()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld UnityEngine.Sprite ZenUI.Section.CraftingPanelGrid/RenderKey::<Icon>k__BackingField
IL_0006: ret

// System.Void modreq(System.Runtime.CompilerServices.IsExternalInit) ZenUI.Section.CraftingPanelGrid/RenderKey::set_Icon(UnityEngine.Sprite)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld UnityEngine.Sprite ZenUI.Section.CraftingPanelGrid/RenderKey::<Icon>k__BackingField
IL_0007: ret

// System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::get_Selected()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::<Selected>k__BackingField
IL_0006: ret

// System.Void modreq(System.Runtime.CompilerServices.IsExternalInit) ZenUI.Section.CraftingPanelGrid/RenderKey::set_Selected(System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::<Selected>k__BackingField
IL_0007: ret

// System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::get_CanCraft()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::<CanCraft>k__BackingField
IL_0006: ret

// System.Void modreq(System.Runtime.CompilerServices.IsExternalInit) ZenUI.Section.CraftingPanelGrid/RenderKey::set_CanCraft(System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::<CanCraft>k__BackingField
IL_0007: ret

// System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::get_Hovered()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::<Hovered>k__BackingField
IL_0006: ret

// System.Void modreq(System.Runtime.CompilerServices.IsExternalInit) ZenUI.Section.CraftingPanelGrid/RenderKey::set_Hovered(System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::<Hovered>k__BackingField
IL_0007: ret

// System.Int32 ZenUI.Section.CraftingPanelGrid/RenderKey::get_Amount()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 ZenUI.Section.CraftingPanelGrid/RenderKey::<Amount>k__BackingField
IL_0006: ret

// System.Void modreq(System.Runtime.CompilerServices.IsExternalInit) ZenUI.Section.CraftingPanelGrid/RenderKey::set_Amount(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Int32 ZenUI.Section.CraftingPanelGrid/RenderKey::<Amount>k__BackingField
IL_0007: ret

// System.String ZenUI.Section.CraftingPanelGrid/RenderKey::ToString()
.locals System.Text.StringBuilder
IL_0000: newobj System.Void System.Text.StringBuilder::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldstr "RenderKey"
IL_000c: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0011: pop
IL_0012: ldloc.0
IL_0013: ldstr " { "
IL_0018: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_001d: pop
IL_001e: ldarg.0
IL_001f: ldloc.0
IL_0020: call System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::PrintMembers(System.Text.StringBuilder)
IL_0025: brfalse.s IL_0030
IL_0027: ldloc.0
IL_0028: ldc.i4.s 32
IL_002a: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.Char)
IL_002f: pop
IL_0030: ldloc.0
IL_0031: ldc.i4.s 125
IL_0033: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.Char)
IL_0038: pop
IL_0039: ldloc.0
IL_003a: callvirt System.String System.Object::ToString()
IL_003f: ret

// System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::PrintMembers(System.Text.StringBuilder)
.locals System.Boolean, System.Int32
IL_0000: ldarg.1
IL_0001: ldstr "Item = "
IL_0006: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_000b: pop
IL_000c: ldarg.1
IL_000d: ldarg.0
IL_000e: call ItemDrop/ItemData ZenUI.Section.CraftingPanelGrid/RenderKey::get_Item()
IL_0013: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.Object)
IL_0018: pop
IL_0019: ldarg.1
IL_001a: ldstr ", Icon = "
IL_001f: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0024: pop
IL_0025: ldarg.1
IL_0026: ldarg.0
IL_0027: call UnityEngine.Sprite ZenUI.Section.CraftingPanelGrid/RenderKey::get_Icon()
IL_002c: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.Object)
IL_0031: pop
IL_0032: ldarg.1
IL_0033: ldstr ", Selected = "
IL_0038: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_003d: pop
IL_003e: ldarg.1
IL_003f: ldarg.0
IL_0040: call System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::get_Selected()
IL_0045: stloc.0
IL_0046: ldloca.s V_0
IL_0048: constrained. System.Boolean
IL_004e: callvirt System.String System.Object::ToString()
IL_0053: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0058: pop
IL_0059: ldarg.1
IL_005a: ldstr ", CanCraft = "
IL_005f: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0064: pop
IL_0065: ldarg.1
IL_0066: ldarg.0
IL_0067: call System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::get_CanCraft()
IL_006c: stloc.0
IL_006d: ldloca.s V_0
IL_006f: constrained. System.Boolean
IL_0075: callvirt System.String System.Object::ToString()
IL_007a: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_007f: pop
IL_0080: ldarg.1
IL_0081: ldstr ", Hovered = "
IL_0086: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_008b: pop
IL_008c: ldarg.1
IL_008d: ldarg.0
IL_008e: call System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::get_Hovered()
IL_0093: stloc.0
IL_0094: ldloca.s V_0
IL_0096: constrained. System.Boolean
IL_009c: callvirt System.String System.Object::ToString()
IL_00a1: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_00a6: pop
IL_00a7: ldarg.1
IL_00a8: ldstr ", Amount = "
IL_00ad: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_00b2: pop
IL_00b3: ldarg.1
IL_00b4: ldarg.0
IL_00b5: call System.Int32 ZenUI.Section.CraftingPanelGrid/RenderKey::get_Amount()
IL_00ba: stloc.1
IL_00bb: ldloca.s V_1
IL_00bd: constrained. System.Int32
IL_00c3: callvirt System.String System.Object::ToString()
IL_00c8: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_00cd: pop
IL_00ce: ldc.i4.1
IL_00cf: ret

// System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::op_Inequality(ZenUI.Section.CraftingPanelGrid/RenderKey,ZenUI.Section.CraftingPanelGrid/RenderKey)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: call System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::op_Equality(ZenUI.Section.CraftingPanelGrid/RenderKey,ZenUI.Section.CraftingPanelGrid/RenderKey)
IL_0007: ldc.i4.0
IL_0008: ceq
IL_000a: ret

// System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::op_Equality(ZenUI.Section.CraftingPanelGrid/RenderKey,ZenUI.Section.CraftingPanelGrid/RenderKey)
.locals 
IL_0000: ldarga.s left
IL_0002: ldarg.1
IL_0003: call System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::Equals(ZenUI.Section.CraftingPanelGrid/RenderKey)
IL_0008: ret

// System.Int32 ZenUI.Section.CraftingPanelGrid/RenderKey::GetHashCode()
.locals 
IL_0000: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<ItemDrop/ItemData>::get_Default()
IL_0005: ldarg.0
IL_0006: ldfld ItemDrop/ItemData ZenUI.Section.CraftingPanelGrid/RenderKey::<Item>k__BackingField
IL_000b: callvirt System.Int32 System.Collections.Generic.EqualityComparer`1<ItemDrop/ItemData>::GetHashCode(!0)
IL_0010: ldc.i4 -1521134295
IL_0015: mul
IL_0016: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<UnityEngine.Sprite>::get_Default()
IL_001b: ldarg.0
IL_001c: ldfld UnityEngine.Sprite ZenUI.Section.CraftingPanelGrid/RenderKey::<Icon>k__BackingField
IL_0021: callvirt System.Int32 System.Collections.Generic.EqualityComparer`1<UnityEngine.Sprite>::GetHashCode(!0)
IL_0026: add
IL_0027: ldc.i4 -1521134295
IL_002c: mul
IL_002d: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<System.Boolean>::get_Default()
IL_0032: ldarg.0
IL_0033: ldfld System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::<Selected>k__BackingField
IL_0038: callvirt System.Int32 System.Collections.Generic.EqualityComparer`1<System.Boolean>::GetHashCode(!0)
IL_003d: add
IL_003e: ldc.i4 -1521134295
IL_0043: mul
IL_0044: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<System.Boolean>::get_Default()
IL_0049: ldarg.0
IL_004a: ldfld System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::<CanCraft>k__BackingField
IL_004f: callvirt System.Int32 System.Collections.Generic.EqualityComparer`1<System.Boolean>::GetHashCode(!0)
IL_0054: add
IL_0055: ldc.i4 -1521134295
IL_005a: mul
IL_005b: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<System.Boolean>::get_Default()
IL_0060: ldarg.0
IL_0061: ldfld System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::<Hovered>k__BackingField
IL_0066: callvirt System.Int32 System.Collections.Generic.EqualityComparer`1<System.Boolean>::GetHashCode(!0)
IL_006b: add
IL_006c: ldc.i4 -1521134295
IL_0071: mul
IL_0072: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<System.Int32>::get_Default()
IL_0077: ldarg.0
IL_0078: ldfld System.Int32 ZenUI.Section.CraftingPanelGrid/RenderKey::<Amount>k__BackingField
IL_007d: callvirt System.Int32 System.Collections.Generic.EqualityComparer`1<System.Int32>::GetHashCode(!0)
IL_0082: add
IL_0083: ret

// System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::Equals(System.Object)
.locals 
IL_0000: ldarg.1
IL_0001: isinst ZenUI.Section.CraftingPanelGrid/RenderKey
IL_0006: brfalse.s IL_0015
IL_0008: ldarg.0
IL_0009: ldarg.1
IL_000a: unbox.any ZenUI.Section.CraftingPanelGrid/RenderKey
IL_000f: call System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::Equals(ZenUI.Section.CraftingPanelGrid/RenderKey)
IL_0014: ret
IL_0015: ldc.i4.0
IL_0016: ret

// System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::Equals(ZenUI.Section.CraftingPanelGrid/RenderKey)
.locals 
IL_0000: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<ItemDrop/ItemData>::get_Default()
IL_0005: ldarg.0
IL_0006: ldfld ItemDrop/ItemData ZenUI.Section.CraftingPanelGrid/RenderKey::<Item>k__BackingField
IL_000b: ldarg.1
IL_000c: ldfld ItemDrop/ItemData ZenUI.Section.CraftingPanelGrid/RenderKey::<Item>k__BackingField
IL_0011: callvirt System.Boolean System.Collections.Generic.EqualityComparer`1<ItemDrop/ItemData>::Equals(!0,!0)
IL_0016: brfalse.s IL_008f
IL_0018: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<UnityEngine.Sprite>::get_Default()
IL_001d: ldarg.0
IL_001e: ldfld UnityEngine.Sprite ZenUI.Section.CraftingPanelGrid/RenderKey::<Icon>k__BackingField
IL_0023: ldarg.1
IL_0024: ldfld UnityEngine.Sprite ZenUI.Section.CraftingPanelGrid/RenderKey::<Icon>k__BackingField
IL_0029: callvirt System.Boolean System.Collections.Generic.EqualityComparer`1<UnityEngine.Sprite>::Equals(!0,!0)
IL_002e: brfalse.s IL_008f
IL_0030: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<System.Boolean>::get_Default()
IL_0035: ldarg.0
IL_0036: ldfld System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::<Selected>k__BackingField
IL_003b: ldarg.1
IL_003c: ldfld System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::<Selected>k__BackingField
IL_0041: callvirt System.Boolean System.Collections.Generic.EqualityComparer`1<System.Boolean>::Equals(!0,!0)
IL_0046: brfalse.s IL_008f
IL_0048: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<System.Boolean>::get_Default()
IL_004d: ldarg.0
IL_004e: ldfld System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::<CanCraft>k__BackingField
IL_0053: ldarg.1
IL_0054: ldfld System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::<CanCraft>k__BackingField
IL_0059: callvirt System.Boolean System.Collections.Generic.EqualityComparer`1<System.Boolean>::Equals(!0,!0)
IL_005e: brfalse.s IL_008f
IL_0060: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<System.Boolean>::get_Default()
IL_0065: ldarg.0
IL_0066: ldfld System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::<Hovered>k__BackingField
IL_006b: ldarg.1
IL_006c: ldfld System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::<Hovered>k__BackingField
IL_0071: callvirt System.Boolean System.Collections.Generic.EqualityComparer`1<System.Boolean>::Equals(!0,!0)
IL_0076: brfalse.s IL_008f
IL_0078: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<System.Int32>::get_Default()
IL_007d: ldarg.0
IL_007e: ldfld System.Int32 ZenUI.Section.CraftingPanelGrid/RenderKey::<Amount>k__BackingField
IL_0083: ldarg.1
IL_0084: ldfld System.Int32 ZenUI.Section.CraftingPanelGrid/RenderKey::<Amount>k__BackingField
IL_0089: callvirt System.Boolean System.Collections.Generic.EqualityComparer`1<System.Int32>::Equals(!0,!0)
IL_008e: ret
IL_008f: ldc.i4.0
IL_0090: ret

// System.Void ZenUI.Section.CraftingPanelGrid/RenderKey::Deconstruct(ItemDrop/ItemData&,UnityEngine.Sprite&,System.Boolean&,System.Boolean&,System.Boolean&,System.Int32&)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.0
IL_0002: call ItemDrop/ItemData ZenUI.Section.CraftingPanelGrid/RenderKey::get_Item()
IL_0007: stind.ref
IL_0008: ldarg.2
IL_0009: ldarg.0
IL_000a: call UnityEngine.Sprite ZenUI.Section.CraftingPanelGrid/RenderKey::get_Icon()
IL_000f: stind.ref
IL_0010: ldarg.3
IL_0011: ldarg.0
IL_0012: call System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::get_Selected()
IL_0017: stind.i1
IL_0018: ldarg.s CanCraft
IL_001a: ldarg.0
IL_001b: call System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::get_CanCraft()
IL_0020: stind.i1
IL_0021: ldarg.s Hovered
IL_0023: ldarg.0
IL_0024: call System.Boolean ZenUI.Section.CraftingPanelGrid/RenderKey::get_Hovered()
IL_0029: stind.i1
IL_002a: ldarg.s Amount
IL_002c: ldarg.0
IL_002d: call System.Int32 ZenUI.Section.CraftingPanelGrid/RenderKey::get_Amount()
IL_0032: stind.i4
IL_0033: ret

// System.Void ZenUI.Section.CraftingPanelGrid/CacheData::.ctor(ZenUI.Section.CraftingPanelGrid)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: ldfld System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanelGrid/CacheKey,ZenUI.Section.CraftingPanelGrid/CacheData> ZenUI.Section.CraftingPanelGrid::_cache
IL_0007: callvirt System.Int32 System.Collections.Generic.Dictionary`2<ZenUI.Section.CraftingPanelGrid/CacheKey,ZenUI.Section.CraftingPanelGrid/CacheData>::get_Count()
IL_000c: stfld System.Int32 ZenUI.Section.CraftingPanelGrid/CacheData::ID
IL_0011: ldarg.0
IL_0012: ldarg.1
IL_0013: ldfld UnityEngine.RectTransform InventoryGrid::m_gridRoot
IL_0018: stfld UnityEngine.RectTransform ZenUI.Section.CraftingPanelGrid/CacheData::Root
IL_001d: ldarg.0
IL_001e: ldarg.1
IL_001f: ldfld System.Collections.Generic.List`1<InventoryElement> InventoryGrid::m_elements
IL_0024: stfld System.Collections.Generic.List`1<InventoryElement> ZenUI.Section.CraftingPanelGrid/CacheData::Elements
IL_0029: ldarg.0
IL_002a: ldarg.1
IL_002b: ldfld System.Int32 InventoryGrid::m_width
IL_0030: stfld System.Int32 ZenUI.Section.CraftingPanelGrid/CacheData::Width
IL_0035: ldarg.0
IL_0036: ldarg.1
IL_0037: ldfld System.Int32 InventoryGrid::m_height
IL_003c: stfld System.Int32 ZenUI.Section.CraftingPanelGrid/CacheData::Height
IL_0041: ldarg.0
IL_0042: call System.Void System.Object::.ctor()
IL_0047: ret

// System.Boolean ZenUI.Section.CraftingPanelSearch::get_IsConfigValid()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelEnabled
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse.s IL_0017
IL_000c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelSearch
IL_0011: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0016: ret
IL_0017: ldc.i4.0
IL_0018: ret

// System.Void ZenUI.Section.CraftingPanelSearch::Game_Start()
.locals 
IL_0000: call System.Boolean ZenUI.Section.CraftingPanelSearch::get_IsConfigValid()
IL_0005: brfalse.s IL_000c
IL_0007: call System.Void ZenUI.Section.CraftingPanelSearch::Init()
IL_000c: ret

// System.Void ZenUI.Section.CraftingPanelSearch::Init()
.locals UnityEngine.RectTransform
IL_0000: ldsfld GUIFramework.GuiInputField ZenUI.Section.CraftingPanelSearch::_search
IL_0005: ldnull
IL_0006: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_000b: brfalse.s IL_0019
IL_000d: ldstr "Already initialized"
IL_0012: ldc.i4.0
IL_0013: call System.Void Zen.Logging`1<ZenUI.Plugin>::Warning(System.Object,System.Int32)
IL_0018: ret
IL_0019: call InventoryGui InventoryGui::get_instance()
IL_001e: ldfld UnityEngine.RectTransform InventoryGui::m_crafting
IL_0023: stloc.0
IL_0024: call TextInput TextInput::get_instance()
IL_0029: ldfld GUIFramework.GuiInputField TextInput::m_inputField
IL_002e: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0033: ldloc.0
IL_0034: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Transform)
IL_0039: dup
IL_003a: ldstr "ZenUI_Search"
IL_003f: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_0044: dup
IL_0045: callvirt !!0 UnityEngine.GameObject::GetComponent<GUIFramework.GuiInputField>()
IL_004a: stsfld GUIFramework.GuiInputField ZenUI.Section.CraftingPanelSearch::_search
IL_004f: ldsfld GUIFramework.GuiInputField ZenUI.Section.CraftingPanelSearch::_search
IL_0054: ldstr "$menu_filter"
IL_0059: stfld System.String GUIFramework.GuiInputField::VirtualKeyboardTitle
IL_005e: ldsfld GUIFramework.GuiInputField ZenUI.Section.CraftingPanelSearch::_search
IL_0063: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0068: ldstr "Text Area/Placeholder"
IL_006d: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0072: callvirt !!0 UnityEngine.Component::GetComponent<TMPro.TMP_Text>()
IL_0077: ldstr "$menu_filter"
IL_007c: call System.String Zen.Lib.StringExt::Localize(System.String)
IL_0081: callvirt System.Void TMPro.TMP_Text::set_text(System.String)
IL_0086: ldsfld GUIFramework.GuiInputField ZenUI.Section.CraftingPanelSearch::_search
IL_008b: ldc.i4.0
IL_008c: callvirt System.Void TMPro.TMP_InputField::set_restoreOriginalTextOnEscape(System.Boolean)
IL_0091: callvirt !!0 UnityEngine.GameObject::GetComponent<UnityEngine.RectTransform>()
IL_0096: dup
IL_0097: ldc.r4 0.5
IL_009c: ldc.r4 1
IL_00a1: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_00a6: callvirt System.Void UnityEngine.RectTransform::set_anchorMin(UnityEngine.Vector2)
IL_00ab: dup
IL_00ac: ldc.r4 0.5
IL_00b1: ldc.r4 1
IL_00b6: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_00bb: callvirt System.Void UnityEngine.RectTransform::set_anchorMax(UnityEngine.Vector2)
IL_00c0: dup
IL_00c1: ldc.r4 150
IL_00c6: ldc.r4 28
IL_00cb: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_00d0: callvirt System.Void UnityEngine.RectTransform::set_sizeDelta(UnityEngine.Vector2)
IL_00d5: dup
IL_00d6: ldsfld UnityEngine.Vector2 ZenUI.Section.CraftingPanelSearch::SearchPositionDefault
IL_00db: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_00e0: call UnityEngine.Vector2 UnityEngine.Vector2::get_one()
IL_00e5: ldc.r4 0.5
IL_00ea: call UnityEngine.Vector2 UnityEngine.Vector2::op_Multiply(UnityEngine.Vector2,System.Single)
IL_00ef: callvirt System.Void UnityEngine.RectTransform::set_pivot(UnityEngine.Vector2)
IL_00f4: ldsfld GUIFramework.GuiInputField ZenUI.Section.CraftingPanelSearch::_search
IL_00f9: callvirt TMPro.TMP_InputField/OnChangeEvent TMPro.TMP_InputField::get_onValueChanged()
IL_00fe: ldsfld UnityEngine.Events.UnityAction`1<System.String> ZenUI.Section.CraftingPanelSearch/<>c::<>9__8_0
IL_0103: dup
IL_0104: brtrue.s IL_011d
IL_0106: pop
IL_0107: ldsfld ZenUI.Section.CraftingPanelSearch/<>c ZenUI.Section.CraftingPanelSearch/<>c::<>9
IL_010c: ldftn System.Void ZenUI.Section.CraftingPanelSearch/<>c::<Init>b__8_0(System.String)
IL_0112: newobj System.Void UnityEngine.Events.UnityAction`1<System.String>::.ctor(System.Object,System.IntPtr)
IL_0117: dup
IL_0118: stsfld UnityEngine.Events.UnityAction`1<System.String> ZenUI.Section.CraftingPanelSearch/<>c::<>9__8_0
IL_011d: callvirt System.Void UnityEngine.Events.UnityEvent`1<System.String>::AddListener(UnityEngine.Events.UnityAction`1<!0>)
IL_0122: call System.Void ZenUI.Section.CraftingPanelSearch::ResetSearchFilter()
IL_0127: ldstr "Initialized"
IL_012c: ldc.i4.0
IL_012d: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_0132: ret

// System.Void ZenUI.Section.CraftingPanelSearch::Shutdown()
.locals 
IL_0000: ldsfld GUIFramework.GuiInputField ZenUI.Section.CraftingPanelSearch::_search
IL_0005: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000a: brfalse.s IL_001b
IL_000c: ldsfld GUIFramework.GuiInputField ZenUI.Section.CraftingPanelSearch::_search
IL_0011: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0016: call System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_001b: ret

// System.Void ZenUI.Section.CraftingPanelSearch::Show(System.Boolean)
.locals 
IL_0000: ldsfld GUIFramework.GuiInputField ZenUI.Section.CraftingPanelSearch::_search
IL_0005: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_000a: ldarg.0
IL_000b: brfalse.s IL_001e
IL_000d: call System.Boolean ZenUI.Section.CraftingPanelSearch::get_IsConfigValid()
IL_0012: brfalse.s IL_001e
IL_0014: call System.Boolean ZInput::IsGamepadActive()
IL_0019: ldc.i4.0
IL_001a: ceq
IL_001c: br.s IL_001f
IL_001e: ldc.i4.0
IL_001f: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0024: ldsfld GUIFramework.GuiInputField ZenUI.Section.CraftingPanelSearch::_search
IL_0029: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_002e: castclass UnityEngine.RectTransform
IL_0033: ldsfld UnityEngine.Vector2 ZenUI.Section.CraftingPanelSearch::SearchPositionDefault
IL_0038: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Vector2> ZenUI.Configs::CraftPanelSearchPosition
IL_003d: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Vector2>::get_Value()
IL_0042: call UnityEngine.Vector2 UnityEngine.Vector2::op_Addition(UnityEngine.Vector2,UnityEngine.Vector2)
IL_0047: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_004c: ret

// System.Void ZenUI.Section.CraftingPanelSearch::UpdateSearchFilter()
.locals Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean
IL_0000: ldc.i4.s 24
IL_0002: ldc.i4.1
IL_0003: ldloca.s V_1
IL_0005: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_000a: stloc.0
IL_000b: ldloc.1
IL_000c: brfalse.s IL_0037
IL_000e: ldloca.s V_0
IL_0010: ldstr "Update search filter: '"
IL_0015: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_001a: ldloca.s V_0
IL_001c: ldsfld GUIFramework.GuiInputField ZenUI.Section.CraftingPanelSearch::_search
IL_0021: callvirt System.String TMPro.TMP_InputField::get_text()
IL_0026: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_002b: ldloca.s V_0
IL_002d: ldstr "'"
IL_0032: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0037: ldloc.0
IL_0038: ldc.i4.0
IL_0039: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_003e: ldsfld GUIFramework.GuiInputField ZenUI.Section.CraftingPanelSearch::_search
IL_0043: callvirt System.String TMPro.TMP_InputField::get_text()
IL_0048: callvirt System.String System.String::ToLower()
IL_004d: callvirt System.String System.String::Trim()
IL_0052: stsfld System.String ZenUI.Section.CraftingPanelSearch::_searchText
IL_0057: ret

// System.Void ZenUI.Section.CraftingPanelSearch::ResetSearchFilter()
.locals 
IL_0000: ldstr "Resetting search filter"
IL_0005: ldc.i4.0
IL_0006: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_000b: ldsfld GUIFramework.GuiInputField ZenUI.Section.CraftingPanelSearch::_search
IL_0010: ldsfld System.String System.String::Empty
IL_0015: callvirt System.Void TMPro.TMP_InputField::set_text(System.String)
IL_001a: call System.Void ZenUI.Section.CraftingPanelSearch::UpdateSearchFilter()
IL_001f: ret

// System.Boolean ZenUI.Section.CraftingPanelSearch::ApplySearchFilter(InventoryGui/RecipeDataPair)
.locals ZenUI.Section.CraftingPanelSearch/<>c__DisplayClass13_0
IL_0000: ldsfld System.String ZenUI.Section.CraftingPanelSearch::_searchText
IL_0005: call System.Boolean BepInEx.Utility::IsNullOrWhiteSpace(System.String)
IL_000a: brfalse.s IL_000e
IL_000c: ldc.i4.1
IL_000d: ret
IL_000e: ldloca.s V_0
IL_0010: ldarga.s recipeDataPair
IL_0012: call Recipe InventoryGui/RecipeDataPair::get_Recipe()
IL_0017: stfld Recipe ZenUI.Section.CraftingPanelSearch/<>c__DisplayClass13_0::recipe
IL_001c: ldloca.s V_0
IL_001e: call System.Boolean ZenUI.Section.CraftingPanelSearch::<ApplySearchFilter>g__IsItemFiltered|13_0(ZenUI.Section.CraftingPanelSearch/<>c__DisplayClass13_0&)
IL_0023: brtrue.s IL_0036
IL_0025: ldloca.s V_0
IL_0027: call System.Boolean ZenUI.Section.CraftingPanelSearch::<ApplySearchFilter>g__IsArmorSetFiltered|13_1(ZenUI.Section.CraftingPanelSearch/<>c__DisplayClass13_0&)
IL_002c: brtrue.s IL_0036
IL_002e: ldloca.s V_0
IL_0030: call System.Boolean ZenUI.Section.CraftingPanelSearch::<ApplySearchFilter>g__IsResourceFiltered|13_2(ZenUI.Section.CraftingPanelSearch/<>c__DisplayClass13_0&)
IL_0035: ret
IL_0036: ldc.i4.1
IL_0037: ret

// System.Void ZenUI.Section.CraftingPanelSearch::UpdateCraftingPanel()
.locals 
IL_0000: call System.Void ZenUI.Section.CraftingPanel::ResetScrollCache()
IL_0005: call System.Void ZenUI.Section.CraftingPanel::UpdateRecipeList()
IL_000a: ldnull
IL_000b: call System.Void ZenUI.Section.CraftingPanel::SelectItem(ItemDrop/ItemData)
IL_0010: ret

// System.Void ZenUI.Section.CraftingPanelSearch::InventoryGui_Update(InventoryGui)
.locals 
IL_0000: call System.Boolean ZenUI.Section.CraftingPanelSearch::get_IsConfigValid()
IL_0005: brtrue.s IL_0008
IL_0007: ret
IL_0008: call System.Boolean InventoryGui::IsVisible()
IL_000d: brtrue.s IL_0010
IL_000f: ret
IL_0010: ldarg.0
IL_0011: callvirt System.Boolean InventoryGui::InCraftTab()
IL_0016: call System.Void ZenUI.Section.CraftingPanelSearch::Show(System.Boolean)
IL_001b: ret

// System.Void ZenUI.Section.CraftingPanelSearch::Chat_HasFocus(System.Boolean&)
.locals 
IL_0000: call System.Boolean ZenUI.Section.CraftingPanelSearch::get_IsConfigValid()
IL_0005: brtrue.s IL_0008
IL_0007: ret
IL_0008: ldsfld GUIFramework.GuiInputField ZenUI.Section.CraftingPanelSearch::_search
IL_000d: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0012: brtrue.s IL_0015
IL_0014: ret
IL_0015: ldsfld GUIFramework.GuiInputField ZenUI.Section.CraftingPanelSearch::_search
IL_001a: callvirt System.Boolean TMPro.TMP_InputField::get_isFocused()
IL_001f: brfalse.s IL_0024
IL_0021: ldarg.0
IL_0022: ldc.i4.1
IL_0023: stind.i1
IL_0024: ret

// System.Void ZenUI.Section.CraftingPanelSearch::InventoryGui_UpdateRecipe()
.locals 
IL_0000: call System.Boolean ZenUI.Section.CraftingPanelSearch::get_IsConfigValid()
IL_0005: brtrue.s IL_0008
IL_0007: ret
IL_0008: ldsfld GUIFramework.GuiInputField ZenUI.Section.CraftingPanelSearch::_search
IL_000d: callvirt System.Boolean TMPro.TMP_InputField::get_isFocused()
IL_0012: brfalse.s IL_005c
IL_0014: ldstr "Chat"
IL_0019: call System.Boolean ZInput::GetButtonDown(System.String)
IL_001e: brtrue.s IL_0050
IL_0020: ldstr "Block"
IL_0025: call System.Boolean ZInput::GetButtonDown(System.String)
IL_002a: brtrue.s IL_0050
IL_002c: ldstr "Console"
IL_0031: call System.Boolean ZInput::GetButtonDown(System.String)
IL_0036: brtrue.s IL_0050
IL_0038: ldstr "Escape"
IL_003d: call System.Boolean ZInput::GetButtonDown(System.String)
IL_0042: brtrue.s IL_0050
IL_0044: ldstr "Inventory"
IL_0049: call System.Boolean ZInput::GetButtonDown(System.String)
IL_004e: brfalse.s IL_009a
IL_0050: ldsfld GUIFramework.GuiInputField ZenUI.Section.CraftingPanelSearch::_search
IL_0055: ldc.i4.0
IL_0056: callvirt System.Void TMPro.TMP_InputField::DeactivateInputField(System.Boolean)
IL_005b: ret
IL_005c: ldsfld Player Player::m_localPlayer
IL_0061: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0066: brfalse.s IL_009a
IL_0068: call System.Boolean Console::IsVisible()
IL_006d: brtrue.s IL_009a
IL_006f: call System.Boolean TextInput::IsVisible()
IL_0074: brtrue.s IL_009a
IL_0076: call System.Boolean Minimap::InTextInput()
IL_007b: brtrue.s IL_009a
IL_007d: call System.Boolean Menu::IsVisible()
IL_0082: brtrue.s IL_009a
IL_0084: ldstr "Chat"
IL_0089: call System.Boolean ZInput::GetButtonDown(System.String)
IL_008e: brfalse.s IL_009a
IL_0090: ldsfld GUIFramework.GuiInputField ZenUI.Section.CraftingPanelSearch::_search
IL_0095: callvirt System.Void GUIFramework.GuiInputField::ActivateInputField()
IL_009a: ret

// System.Void ZenUI.Section.CraftingPanelSearch::InventoryGui_Show()
.locals 
IL_0000: call System.Boolean ZenUI.Section.CraftingPanelSearch::get_IsConfigValid()
IL_0005: brtrue.s IL_0008
IL_0007: ret
IL_0008: call System.Boolean ZenUI.Section.CraftingPanel::get_IsStationChanged()
IL_000d: brfalse.s IL_0014
IL_000f: call System.Void ZenUI.Section.CraftingPanelSearch::ResetSearchFilter()
IL_0014: ret

// System.Void ZenUI.Section.CraftingPanelSearch::.cctor()
.locals 
IL_0000: ldc.r4 200
IL_0005: ldc.r4 -82
IL_000a: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_000f: stsfld UnityEngine.Vector2 ZenUI.Section.CraftingPanelSearch::SearchPositionDefault
IL_0014: ldnull
IL_0015: stsfld GUIFramework.GuiInputField ZenUI.Section.CraftingPanelSearch::_search
IL_001a: ldsfld System.String System.String::Empty
IL_001f: stsfld System.String ZenUI.Section.CraftingPanelSearch::_searchText
IL_0024: ret

// System.Boolean ZenUI.Section.CraftingPanelSearch::<ApplySearchFilter>g__IsItemFiltered|13_0(ZenUI.Section.CraftingPanelSearch/<>c__DisplayClass13_0&)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld Recipe ZenUI.Section.CraftingPanelSearch/<>c__DisplayClass13_0::recipe
IL_0006: ldfld ItemDrop Recipe::m_item
IL_000b: call System.String Zen.Lib.ItemDataExt::GetName(ItemDrop)
IL_0010: call System.Boolean ZenUI.Section.CraftingPanelSearch::<ApplySearchFilter>g__IsFiltered|13_3(System.String)
IL_0015: ret

// System.Boolean ZenUI.Section.CraftingPanelSearch::<ApplySearchFilter>g__IsArmorSetFiltered|13_1(ZenUI.Section.CraftingPanelSearch/<>c__DisplayClass13_0&)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelSearchArmorSets
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse.s IL_0041
IL_000c: ldarg.0
IL_000d: ldfld Recipe ZenUI.Section.CraftingPanelSearch/<>c__DisplayClass13_0::recipe
IL_0012: ldfld ItemDrop Recipe::m_item
IL_0017: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_001c: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0021: ldfld StatusEffect ItemDrop/ItemData/SharedData::m_setStatusEffect
IL_0026: dup
IL_0027: brtrue.s IL_002d
IL_0029: pop
IL_002a: ldnull
IL_002b: br.s IL_0032
IL_002d: ldfld System.String StatusEffect::m_name
IL_0032: dup
IL_0033: brtrue.s IL_003b
IL_0035: pop
IL_0036: ldsfld System.String System.String::Empty
IL_003b: call System.Boolean ZenUI.Section.CraftingPanelSearch::<ApplySearchFilter>g__IsFiltered|13_3(System.String)
IL_0040: ret
IL_0041: ldc.i4.0
IL_0042: ret

// System.Boolean ZenUI.Section.CraftingPanelSearch::<ApplySearchFilter>g__IsResourceFiltered|13_2(ZenUI.Section.CraftingPanelSearch/<>c__DisplayClass13_0&)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::CraftPanelSearchResources
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse.s IL_003c
IL_000c: ldarg.0
IL_000d: ldfld Recipe ZenUI.Section.CraftingPanelSearch/<>c__DisplayClass13_0::recipe
IL_0012: ldfld Piece/Requirement[] Recipe::m_resources
IL_0017: ldsfld System.Func`2<Piece/Requirement,System.Boolean> ZenUI.Section.CraftingPanelSearch/<>c::<>9__13_4
IL_001c: dup
IL_001d: brtrue.s IL_0036
IL_001f: pop
IL_0020: ldsfld ZenUI.Section.CraftingPanelSearch/<>c ZenUI.Section.CraftingPanelSearch/<>c::<>9
IL_0025: ldftn System.Boolean ZenUI.Section.CraftingPanelSearch/<>c::<ApplySearchFilter>b__13_4(Piece/Requirement)
IL_002b: newobj System.Void System.Func`2<Piece/Requirement,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0030: dup
IL_0031: stsfld System.Func`2<Piece/Requirement,System.Boolean> ZenUI.Section.CraftingPanelSearch/<>c::<>9__13_4
IL_0036: call System.Boolean System.Linq.Enumerable::Any<Piece/Requirement>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_003b: ret
IL_003c: ldc.i4.0
IL_003d: ret

// System.Boolean ZenUI.Section.CraftingPanelSearch::<ApplySearchFilter>g__IsFiltered|13_3(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call System.String Zen.Lib.StringExt::Localize(System.String)
IL_0006: callvirt System.String System.String::ToLower()
IL_000b: ldc.i4.1
IL_000c: newarr System.Char
IL_0011: dup
IL_0012: ldc.i4.0
IL_0013: ldc.i4.s 32
IL_0015: stelem.i2
IL_0016: callvirt System.String[] System.String::Split(System.Char[])
IL_001b: ldsfld System.Func`2<System.String,System.Boolean> ZenUI.Section.CraftingPanelSearch/<>c::<>9__13_5
IL_0020: dup
IL_0021: brtrue.s IL_003a
IL_0023: pop
IL_0024: ldsfld ZenUI.Section.CraftingPanelSearch/<>c ZenUI.Section.CraftingPanelSearch/<>c::<>9
IL_0029: ldftn System.Boolean ZenUI.Section.CraftingPanelSearch/<>c::<ApplySearchFilter>b__13_5(System.String)
IL_002f: newobj System.Void System.Func`2<System.String,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0034: dup
IL_0035: stsfld System.Func`2<System.String,System.Boolean> ZenUI.Section.CraftingPanelSearch/<>c::<>9__13_5
IL_003a: call System.Boolean System.Linq.Enumerable::Any<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_003f: ret

// System.Void ZenUI.Section.CraftingPanelSearch/<>c::.cctor()
.locals 
IL_0000: newobj System.Void ZenUI.Section.CraftingPanelSearch/<>c::.ctor()
IL_0005: stsfld ZenUI.Section.CraftingPanelSearch/<>c ZenUI.Section.CraftingPanelSearch/<>c::<>9
IL_000a: ret

// System.Void ZenUI.Section.CraftingPanelSearch/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void ZenUI.Section.CraftingPanelSearch/<>c::<Init>b__8_0(System.String)
.locals 
IL_0000: call System.Void ZenUI.Section.CraftingPanelSearch::UpdateSearchFilter()
IL_0005: call System.Void ZenUI.Section.CraftingPanelSearch::UpdateCraftingPanel()
IL_000a: ret

// System.Boolean ZenUI.Section.CraftingPanelSearch/<>c::<ApplySearchFilter>b__13_4(Piece/Requirement)
.locals 
IL_0000: ldarg.1
IL_0001: ldfld System.Int32 Piece/Requirement::m_amount
IL_0006: ldc.i4.0
IL_0007: ble.s IL_001a
IL_0009: ldarg.1
IL_000a: ldfld ItemDrop Piece/Requirement::m_resItem
IL_000f: call System.String Zen.Lib.ItemDataExt::GetName(ItemDrop)
IL_0014: call System.Boolean ZenUI.Section.CraftingPanelSearch::<ApplySearchFilter>g__IsFiltered|13_3(System.String)
IL_0019: ret
IL_001a: ldc.i4.0
IL_001b: ret

// System.Boolean ZenUI.Section.CraftingPanelSearch/<>c::<ApplySearchFilter>b__13_5(System.String)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt System.String System.String::Trim()
IL_0006: ldsfld System.String ZenUI.Section.CraftingPanelSearch::_searchText
IL_000b: callvirt System.Boolean System.String::StartsWith(System.String)
IL_0010: ret

// System.Boolean ZenUI.Section.FitContainerGrid::get_IsFeatureEnabled()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::RescaleContainerGrid
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse.s IL_0017
IL_000c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::NoSlideAnimation
IL_0011: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0016: ret
IL_0017: ldc.i4.0
IL_0018: ret

// InventoryGrid ZenUI.Section.FitContainerGrid::InitContainerGrid(InventoryGui)
.locals InventoryGrid, UnityEngine.Vector2
IL_0000: ldarg.0
IL_0001: callvirt InventoryGrid InventoryGui::get_ContainerGrid()
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: ldfld UnityEngine.RectTransform InventoryGrid::m_gridRoot
IL_000d: ldc.r4 0.5
IL_0012: ldc.r4 1
IL_0017: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_001c: callvirt System.Void UnityEngine.RectTransform::set_anchorMax(UnityEngine.Vector2)
IL_0021: ldloc.0
IL_0022: ldfld UnityEngine.RectTransform InventoryGrid::m_gridRoot
IL_0027: ldc.r4 0.5
IL_002c: ldc.r4 0
IL_0031: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_0036: callvirt System.Void UnityEngine.RectTransform::set_anchorMin(UnityEngine.Vector2)
IL_003b: ldloc.0
IL_003c: ldfld UnityEngine.RectTransform InventoryGrid::m_gridRoot
IL_0041: ldloc.0
IL_0042: ldfld UnityEngine.RectTransform InventoryGrid::m_gridRoot
IL_0047: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_pivot()
IL_004c: stloc.1
IL_004d: ldloca.s V_1
IL_004f: ldc.r4 0.5
IL_0054: stfld System.Single UnityEngine.Vector2::x
IL_0059: ldloc.1
IL_005a: callvirt System.Void UnityEngine.RectTransform::set_pivot(UnityEngine.Vector2)
IL_005f: ldloc.0
IL_0060: ret

// System.Void ZenUI.Section.FitContainerGrid::ResetAnchorPosition(InventoryGrid)
.locals UnityEngine.RectTransform, System.Single, UnityEngine.RectTransform, UnityEngine.Vector2
IL_0000: ldarg.0
IL_0001: ldfld UnityEngine.RectTransform InventoryGrid::m_gridRoot
IL_0006: stloc.0
IL_0007: ldarg.0
IL_0008: callvirt UnityEngine.Vector2 InventoryGrid::GetWidgetSize()
IL_000d: ldfld System.Single UnityEngine.Vector2::x
IL_0012: neg
IL_0013: ldc.r4 0.5
IL_0018: mul
IL_0019: stloc.1
IL_001a: ldarg.0
IL_001b: call System.Boolean ZenUI.Section.FitContainerGrid::IsRotated(InventoryGrid)
IL_0020: brfalse.s IL_0049
IL_0022: ldloc.0
IL_0023: callvirt UnityEngine.Transform UnityEngine.Transform::get_parent()
IL_0028: castclass UnityEngine.RectTransform
IL_002d: stloc.2
IL_002e: ldloc.1
IL_002f: neg
IL_0030: ldloc.2
IL_0031: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_offsetMax()
IL_0036: ldfld System.Single UnityEngine.Vector2::y
IL_003b: ldloc.0
IL_003c: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localScale()
IL_0041: ldfld System.Single UnityEngine.Vector3::x
IL_0046: div
IL_0047: add
IL_0048: stloc.1
IL_0049: ldloc.0
IL_004a: ldloc.0
IL_004b: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_anchoredPosition()
IL_0050: stloc.3
IL_0051: ldloca.s V_3
IL_0053: ldloc.1
IL_0054: stfld System.Single UnityEngine.Vector2::x
IL_0059: ldloc.3
IL_005a: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_005f: ret

// System.Void ZenUI.Section.FitContainerGrid::InventoryGui_Hide(InventoryGui)
.locals 
IL_0000: call System.Boolean ZenUI.Section.FitContainerGrid::get_IsFeatureEnabled()
IL_0005: brtrue.s IL_0008
IL_0007: ret
IL_0008: ldarg.0
IL_0009: callvirt InventoryGrid InventoryGui::get_ContainerGrid()
IL_000e: dup
IL_000f: ldfld UnityEngine.RectTransform InventoryGrid::m_gridRoot
IL_0014: call UnityEngine.Vector3 UnityEngine.Vector3::get_one()
IL_0019: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_001e: ldc.i4.0
IL_001f: call System.Void ZenUI.Section.FitContainerGrid::RotateGrid(InventoryGrid,System.Boolean)
IL_0024: ret

// System.Void ZenUI.Section.FitContainerGrid::RotateGrid(InventoryGrid,System.Boolean)
.locals UnityEngine.Quaternion, System.Collections.IEnumerator, System.IDisposable
IL_0000: ldc.r4 0
IL_0005: ldc.r4 0
IL_000a: ldarg.1
IL_000b: brtrue.s IL_0010
IL_000d: ldc.i4.0
IL_000e: br.s IL_0012
IL_0010: ldc.i4.s -90
IL_0012: conv.r4
IL_0013: call UnityEngine.Quaternion UnityEngine.Quaternion::Euler(System.Single,System.Single,System.Single)
IL_0018: stloc.0
IL_0019: ldarg.0
IL_001a: ldfld UnityEngine.RectTransform InventoryGrid::m_gridRoot
IL_001f: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_0024: ldloc.0
IL_0025: call System.Boolean UnityEngine.Quaternion::op_Equality(UnityEngine.Quaternion,UnityEngine.Quaternion)
IL_002a: brfalse.s IL_002d
IL_002c: ret
IL_002d: ldarg.0
IL_002e: ldfld UnityEngine.RectTransform InventoryGrid::m_gridRoot
IL_0033: ldloc.0
IL_0034: callvirt System.Void UnityEngine.Transform::set_rotation(UnityEngine.Quaternion)
IL_0039: ldarg.0
IL_003a: ldfld UnityEngine.RectTransform InventoryGrid::m_gridRoot
IL_003f: callvirt System.Collections.IEnumerator UnityEngine.Transform::GetEnumerator()
IL_0044: stloc.1
IL_0045: br.s IL_005c
IL_0047: ldloc.1
IL_0048: callvirt System.Object System.Collections.IEnumerator::get_Current()
IL_004d: castclass UnityEngine.Transform
IL_0052: call UnityEngine.Quaternion UnityEngine.Quaternion::get_identity()
IL_0057: callvirt System.Void UnityEngine.Transform::set_rotation(UnityEngine.Quaternion)
IL_005c: ldloc.1
IL_005d: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0062: brtrue.s IL_0047
IL_0064: leave.s IL_0077
IL_0066: ldloc.1
IL_0067: isinst System.IDisposable
IL_006c: stloc.2
IL_006d: ldloc.2
IL_006e: brfalse.s IL_0076
IL_0070: ldloc.2
IL_0071: callvirt System.Void System.IDisposable::Dispose()
IL_0076: endfinally
IL_0077: ret
// EH Finally: 69 - 102 => 102 - 119

// System.Boolean ZenUI.Section.FitContainerGrid::IsContainerGrid(InventoryGrid)
.locals 
IL_0000: call InventoryGui InventoryGui::get_instance()
IL_0005: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000a: brfalse.s IL_001d
IL_000c: call InventoryGui InventoryGui::get_instance()
IL_0011: callvirt InventoryGrid InventoryGui::get_ContainerGrid()
IL_0016: ldarg.0
IL_0017: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_001c: ret
IL_001d: ldc.i4.0
IL_001e: ret

// System.Boolean ZenUI.Section.FitContainerGrid::IsRotated(InventoryGrid)
.locals UnityEngine.Quaternion
IL_0000: call System.Boolean ZenUI.Section.FitContainerGrid::get_IsFeatureEnabled()
IL_0005: brfalse.s IL_0032
IL_0007: ldarg.0
IL_0008: call System.Boolean ZenUI.Section.FitContainerGrid::IsContainerGrid(InventoryGrid)
IL_000d: brfalse.s IL_0032
IL_000f: ldarg.0
IL_0010: ldfld UnityEngine.RectTransform InventoryGrid::m_gridRoot
IL_0015: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_001a: stloc.0
IL_001b: ldloca.s V_0
IL_001d: call UnityEngine.Vector3 UnityEngine.Quaternion::get_eulerAngles()
IL_0022: ldfld System.Single UnityEngine.Vector3::z
IL_0027: ldc.r4 0
IL_002c: ceq
IL_002e: ldc.i4.0
IL_002f: ceq
IL_0031: ret
IL_0032: ldc.i4.0
IL_0033: ret

// System.Boolean ZenUI.Section.FitContainerGrid::IsRotated(Inventory)
.locals InventoryGrid
IL_0000: call InventoryGui InventoryGui::get_instance()
IL_0005: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000a: brtrue.s IL_000e
IL_000c: ldc.i4.0
IL_000d: ret
IL_000e: call InventoryGui InventoryGui::get_instance()
IL_0013: callvirt InventoryGrid InventoryGui::get_ContainerGrid()
IL_0018: stloc.0
IL_0019: ldloc.0
IL_001a: callvirt Inventory InventoryGrid::GetInventory()
IL_001f: ldarg.0
IL_0020: bne.un.s IL_0029
IL_0022: ldloc.0
IL_0023: call System.Boolean ZenUI.Section.FitContainerGrid::IsRotated(InventoryGrid)
IL_0028: ret
IL_0029: ldc.i4.0
IL_002a: ret

// System.Void ZenUI.Section.FitContainerGrid::InventoryGrid_ResetView(InventoryGrid)
.locals 
IL_0000: call System.Boolean ZenUI.Section.FitContainerGrid::get_IsFeatureEnabled()
IL_0005: brfalse.s IL_0015
IL_0007: ldarg.0
IL_0008: call System.Boolean ZenUI.Section.FitContainerGrid::IsContainerGrid(InventoryGrid)
IL_000d: brfalse.s IL_0015
IL_000f: ldarg.0
IL_0010: call System.Void ZenUI.Section.FitContainerGrid::ResetAnchorPosition(InventoryGrid)
IL_0015: ret

// System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> ZenUI.Section.FitContainerGrid::InventoryGrid_UpdateGui(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>)
.locals HarmonyLib.CodeMatch[], System.Func`3<UnityEngine.Vector2,InventoryGrid,UnityEngine.Vector2>, HarmonyLib.CodeInstruction[]
IL_0000: ldc.i4.4
IL_0001: newarr HarmonyLib.CodeMatch
IL_0006: dup
IL_0007: ldc.i4.0
IL_0008: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldc_R4
IL_000d: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_0012: ldc.r4 0.5
IL_0017: box System.Single
IL_001c: ldnull
IL_001d: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0022: stelem.ref
IL_0023: dup
IL_0024: ldc.i4.1
IL_0025: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_002a: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_002f: ldtoken UnityEngine.Vector2
IL_0034: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0039: ldstr "op_Multiply"
IL_003e: ldc.i4.2
IL_003f: newarr System.Type
IL_0044: dup
IL_0045: ldc.i4.0
IL_0046: ldtoken UnityEngine.Vector2
IL_004b: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0050: stelem.ref
IL_0051: dup
IL_0052: ldc.i4.1
IL_0053: ldtoken System.Single
IL_0058: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_005d: stelem.ref
IL_005e: ldnull
IL_005f: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_0064: ldnull
IL_0065: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_006a: stelem.ref
IL_006b: dup
IL_006c: ldc.i4.2
IL_006d: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_0072: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_0077: ldtoken UnityEngine.Vector2
IL_007c: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0081: ldstr "op_Subtraction"
IL_0086: ldc.i4.2
IL_0087: newarr System.Type
IL_008c: dup
IL_008d: ldc.i4.0
IL_008e: ldtoken UnityEngine.Vector2
IL_0093: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0098: stelem.ref
IL_0099: dup
IL_009a: ldc.i4.1
IL_009b: ldtoken UnityEngine.Vector2
IL_00a0: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00a5: stelem.ref
IL_00a6: ldnull
IL_00a7: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_00ac: ldnull
IL_00ad: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_00b2: stelem.ref
IL_00b3: dup
IL_00b4: ldc.i4.3
IL_00b5: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Stloc_S
IL_00ba: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_00bf: ldnull
IL_00c0: ldnull
IL_00c1: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_00c6: stelem.ref
IL_00c7: stloc.0
IL_00c8: ldsfld System.Func`3<UnityEngine.Vector2,InventoryGrid,UnityEngine.Vector2> ZenUI.Section.FitContainerGrid/<>O::<0>__Intercept
IL_00cd: dup
IL_00ce: brtrue.s IL_00e3
IL_00d0: pop
IL_00d1: ldnull
IL_00d2: ldftn UnityEngine.Vector2 ZenUI.Section.FitContainerGrid::<InventoryGrid_UpdateGui>g__Intercept|12_0(UnityEngine.Vector2,InventoryGrid)
IL_00d8: newobj System.Void System.Func`3<UnityEngine.Vector2,InventoryGrid,UnityEngine.Vector2>::.ctor(System.Object,System.IntPtr)
IL_00dd: dup
IL_00de: stsfld System.Func`3<UnityEngine.Vector2,InventoryGrid,UnityEngine.Vector2> ZenUI.Section.FitContainerGrid/<>O::<0>__Intercept
IL_00e3: stloc.1
IL_00e4: ldc.i4.2
IL_00e5: newarr HarmonyLib.CodeInstruction
IL_00ea: dup
IL_00eb: ldc.i4.0
IL_00ec: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldarg_0
IL_00f1: ldnull
IL_00f2: newobj System.Void HarmonyLib.CodeInstruction::.ctor(System.Reflection.Emit.OpCode,System.Object)
IL_00f7: stelem.ref
IL_00f8: dup
IL_00f9: ldc.i4.1
IL_00fa: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_00ff: ldloc.1
IL_0100: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_0105: newobj System.Void HarmonyLib.CodeInstruction::.ctor(System.Reflection.Emit.OpCode,System.Object)
IL_010a: stelem.ref
IL_010b: stloc.2
IL_010c: ldarg.0
IL_010d: ldnull
IL_010e: newobj System.Void HarmonyLib.CodeMatcher::.ctor(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>,System.Reflection.Emit.ILGenerator)
IL_0113: ldloc.0
IL_0114: call HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::MatchEndForward(HarmonyLib.CodeMatch[])
IL_0119: ldstr "Unable to match IL sequence"
IL_011e: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::ThrowIfInvalid(System.String)
IL_0123: ldloc.2
IL_0124: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Insert(HarmonyLib.CodeInstruction[])
IL_0129: callvirt System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> HarmonyLib.CodeMatcher::InstructionEnumeration()
IL_012e: ret

// System.Void ZenUI.Section.FitContainerGrid::ScrollRectEnsureVisible_CenterOnItem(ScrollRectEnsureVisible)
.locals 
IL_0000: call InventoryGui InventoryGui::get_instance()
IL_0005: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: call System.Boolean ZenUI.Section.FitContainerGrid::get_IsFeatureEnabled()
IL_0012: brfalse.s IL_004c
IL_0014: ldarg.0
IL_0015: ldfld UnityEngine.RectTransform ScrollRectEnsureVisible::mContent
IL_001a: call InventoryGui InventoryGui::get_instance()
IL_001f: callvirt InventoryGrid InventoryGui::get_ContainerGrid()
IL_0024: ldfld UnityEngine.RectTransform InventoryGrid::m_gridRoot
IL_0029: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_002e: brfalse.s IL_004c
IL_0030: ldarg.0
IL_0031: ldfld UnityEngine.UI.ScrollRect ScrollRectEnsureVisible::mScrollRect
IL_0036: callvirt System.Boolean UnityEngine.UI.ScrollRect::get_horizontal()
IL_003b: brtrue.s IL_004c
IL_003d: call InventoryGui InventoryGui::get_instance()
IL_0042: callvirt InventoryGrid InventoryGui::get_ContainerGrid()
IL_0047: call System.Void ZenUI.Section.FitContainerGrid::ResetAnchorPosition(InventoryGrid)
IL_004c: ret

// System.Void ZenUI.Section.FitContainerGrid::InventoryGrid_GetWidgetSize(InventoryGrid,UnityEngine.Vector2&)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.1
IL_0002: ldobj UnityEngine.Vector2
IL_0007: ldarg.0
IL_0008: ldfld UnityEngine.RectTransform InventoryGrid::m_gridRoot
IL_000d: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localScale()
IL_0012: call UnityEngine.Vector2 UnityEngine.Vector2::op_Implicit(UnityEngine.Vector3)
IL_0017: call UnityEngine.Vector2 UnityEngine.Vector2::op_Multiply(UnityEngine.Vector2,UnityEngine.Vector2)
IL_001c: stobj UnityEngine.Vector2
IL_0021: ldarg.0
IL_0022: call System.Boolean ZenUI.Section.FitContainerGrid::IsRotated(InventoryGrid)
IL_0027: brfalse.s IL_0040
IL_0029: ldarg.1
IL_002a: ldarg.1
IL_002b: ldfld System.Single UnityEngine.Vector2::y
IL_0030: ldarg.1
IL_0031: ldfld System.Single UnityEngine.Vector2::x
IL_0036: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_003b: stobj UnityEngine.Vector2
IL_0040: ret

// System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> ZenUI.Section.FitContainerGrid::InventoryGrid_UpdateGamepad(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>)
.locals ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0, HarmonyLib.CodeMatch[], HarmonyLib.CodeMatch[], HarmonyLib.CodeMatch[], HarmonyLib.CodeMatch[], HarmonyLib.CodeMatch[], HarmonyLib.CodeMatch[], HarmonyLib.CodeMatch, System.Func`3<System.String,InventoryGrid,System.String>
IL_0000: newobj System.Void ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::.ctor()
IL_0005: stloc.0
IL_0006: ldc.i4.3
IL_0007: newarr HarmonyLib.CodeMatch
IL_000c: dup
IL_000d: ldc.i4.0
IL_000e: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldarg_0
IL_0013: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_0018: ldnull
IL_0019: ldnull
IL_001a: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_001f: stelem.ref
IL_0020: dup
IL_0021: ldc.i4.1
IL_0022: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldflda
IL_0027: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_002c: ldtoken InventoryGrid
IL_0031: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0036: ldstr "m_selected"
IL_003b: call System.Reflection.FieldInfo HarmonyLib.AccessTools::Field(System.Type,System.String)
IL_0040: ldnull
IL_0041: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0046: stelem.ref
IL_0047: dup
IL_0048: ldc.i4.2
IL_0049: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldfld
IL_004e: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_0053: ldtoken Vector2i
IL_0058: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_005d: ldstr "x"
IL_0062: call System.Reflection.FieldInfo HarmonyLib.AccessTools::Field(System.Type,System.String)
IL_0067: ldnull
IL_0068: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_006d: stelem.ref
IL_006e: stloc.1
IL_006f: ldc.i4.3
IL_0070: newarr HarmonyLib.CodeMatch
IL_0075: dup
IL_0076: ldc.i4.0
IL_0077: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldarg_0
IL_007c: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_0081: ldnull
IL_0082: ldnull
IL_0083: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0088: stelem.ref
IL_0089: dup
IL_008a: ldc.i4.1
IL_008b: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldflda
IL_0090: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_0095: ldtoken InventoryGrid
IL_009a: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_009f: ldstr "m_selected"
IL_00a4: call System.Reflection.FieldInfo HarmonyLib.AccessTools::Field(System.Type,System.String)
IL_00a9: ldnull
IL_00aa: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_00af: stelem.ref
IL_00b0: dup
IL_00b1: ldc.i4.2
IL_00b2: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldfld
IL_00b7: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_00bc: ldtoken Vector2i
IL_00c1: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00c6: ldstr "y"
IL_00cb: call System.Reflection.FieldInfo HarmonyLib.AccessTools::Field(System.Type,System.String)
IL_00d0: ldnull
IL_00d1: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_00d6: stelem.ref
IL_00d7: stloc.2
IL_00d8: ldc.i4.1
IL_00d9: newarr HarmonyLib.CodeMatch
IL_00de: dup
IL_00df: ldc.i4.0
IL_00e0: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Stfld
IL_00e5: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_00ea: ldtoken Vector2i
IL_00ef: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00f4: ldstr "x"
IL_00f9: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_00fe: ldnull
IL_00ff: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0104: stelem.ref
IL_0105: stloc.3
IL_0106: ldc.i4.1
IL_0107: newarr HarmonyLib.CodeMatch
IL_010c: dup
IL_010d: ldc.i4.0
IL_010e: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Stfld
IL_0113: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_0118: ldtoken Vector2i
IL_011d: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0122: ldstr "y"
IL_0127: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_012c: ldnull
IL_012d: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0132: stelem.ref
IL_0133: stloc.s V_4
IL_0135: ldc.i4.2
IL_0136: newarr HarmonyLib.CodeMatch
IL_013b: dup
IL_013c: ldc.i4.0
IL_013d: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldarg_0
IL_0142: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_0147: ldnull
IL_0148: ldnull
IL_0149: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_014e: stelem.ref
IL_014f: dup
IL_0150: ldc.i4.1
IL_0151: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldfld
IL_0156: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_015b: ldtoken InventoryGrid
IL_0160: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0165: ldstr "m_width"
IL_016a: call System.Reflection.FieldInfo HarmonyLib.AccessTools::Field(System.Type,System.String)
IL_016f: ldnull
IL_0170: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0175: stelem.ref
IL_0176: stloc.s V_5
IL_0178: ldc.i4.2
IL_0179: newarr HarmonyLib.CodeMatch
IL_017e: dup
IL_017f: ldc.i4.0
IL_0180: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldarg_0
IL_0185: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_018a: ldnull
IL_018b: ldnull
IL_018c: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0191: stelem.ref
IL_0192: dup
IL_0193: ldc.i4.1
IL_0194: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldfld
IL_0199: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_019e: ldtoken InventoryGrid
IL_01a3: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_01a8: ldstr "m_height"
IL_01ad: call System.Reflection.FieldInfo HarmonyLib.AccessTools::Field(System.Type,System.String)
IL_01b2: ldnull
IL_01b3: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_01b8: stelem.ref
IL_01b9: stloc.s V_6
IL_01bb: ldloc.0
IL_01bc: ldsfld System.Func`2<InventoryGrid,System.Int32> ZenUI.Section.FitContainerGrid/<>O::<1>__ReadXtoY
IL_01c1: dup
IL_01c2: brtrue.s IL_01d7
IL_01c4: pop
IL_01c5: ldnull
IL_01c6: ldftn System.Int32 ZenUI.Section.FitContainerGrid::<InventoryGrid_UpdateGamepad>g__ReadXtoY|15_9(InventoryGrid)
IL_01cc: newobj System.Void System.Func`2<InventoryGrid,System.Int32>::.ctor(System.Object,System.IntPtr)
IL_01d1: dup
IL_01d2: stsfld System.Func`2<InventoryGrid,System.Int32> ZenUI.Section.FitContainerGrid/<>O::<1>__ReadXtoY
IL_01d7: stfld System.Func`2<InventoryGrid,System.Int32> ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::readXtoY
IL_01dc: ldloc.0
IL_01dd: ldsfld System.Func`2<InventoryGrid,System.Int32> ZenUI.Section.FitContainerGrid/<>O::<2>__ReadYtoX
IL_01e2: dup
IL_01e3: brtrue.s IL_01f8
IL_01e5: pop
IL_01e6: ldnull
IL_01e7: ldftn System.Int32 ZenUI.Section.FitContainerGrid::<InventoryGrid_UpdateGamepad>g__ReadYtoX|15_10(InventoryGrid)
IL_01ed: newobj System.Void System.Func`2<InventoryGrid,System.Int32>::.ctor(System.Object,System.IntPtr)
IL_01f2: dup
IL_01f3: stsfld System.Func`2<InventoryGrid,System.Int32> ZenUI.Section.FitContainerGrid/<>O::<2>__ReadYtoX
IL_01f8: stfld System.Func`2<InventoryGrid,System.Int32> ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::readYtoX
IL_01fd: ldloc.0
IL_01fe: ldsfld System.Action`2<System.Int32,InventoryGrid> ZenUI.Section.FitContainerGrid/<>O::<3>__WriteXtoY
IL_0203: dup
IL_0204: brtrue.s IL_0219
IL_0206: pop
IL_0207: ldnull
IL_0208: ldftn System.Void ZenUI.Section.FitContainerGrid::<InventoryGrid_UpdateGamepad>g__WriteXtoY|15_11(System.Int32,InventoryGrid)
IL_020e: newobj System.Void System.Action`2<System.Int32,InventoryGrid>::.ctor(System.Object,System.IntPtr)
IL_0213: dup
IL_0214: stsfld System.Action`2<System.Int32,InventoryGrid> ZenUI.Section.FitContainerGrid/<>O::<3>__WriteXtoY
IL_0219: stfld System.Action`2<System.Int32,InventoryGrid> ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::writeXtoY
IL_021e: ldloc.0
IL_021f: ldsfld System.Action`2<System.Int32,InventoryGrid> ZenUI.Section.FitContainerGrid/<>O::<4>__WriteYtoX
IL_0224: dup
IL_0225: brtrue.s IL_023a
IL_0227: pop
IL_0228: ldnull
IL_0229: ldftn System.Void ZenUI.Section.FitContainerGrid::<InventoryGrid_UpdateGamepad>g__WriteYtoX|15_12(System.Int32,InventoryGrid)
IL_022f: newobj System.Void System.Action`2<System.Int32,InventoryGrid>::.ctor(System.Object,System.IntPtr)
IL_0234: dup
IL_0235: stsfld System.Action`2<System.Int32,InventoryGrid> ZenUI.Section.FitContainerGrid/<>O::<4>__WriteYtoX
IL_023a: stfld System.Action`2<System.Int32,InventoryGrid> ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::writeYtoX
IL_023f: ldloc.0
IL_0240: ldsfld System.Func`2<InventoryGrid,System.Int32> ZenUI.Section.FitContainerGrid/<>O::<5>__HeightToWidth
IL_0245: dup
IL_0246: brtrue.s IL_025b
IL_0248: pop
IL_0249: ldnull
IL_024a: ldftn System.Int32 ZenUI.Section.FitContainerGrid::<InventoryGrid_UpdateGamepad>g__HeightToWidth|15_14(InventoryGrid)
IL_0250: newobj System.Void System.Func`2<InventoryGrid,System.Int32>::.ctor(System.Object,System.IntPtr)
IL_0255: dup
IL_0256: stsfld System.Func`2<InventoryGrid,System.Int32> ZenUI.Section.FitContainerGrid/<>O::<5>__HeightToWidth
IL_025b: stfld System.Func`2<InventoryGrid,System.Int32> ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::heightToWidth
IL_0260: ldloc.0
IL_0261: ldsfld System.Func`2<InventoryGrid,System.Int32> ZenUI.Section.FitContainerGrid/<>O::<6>__WidthToHeight
IL_0266: dup
IL_0267: brtrue.s IL_027c
IL_0269: pop
IL_026a: ldnull
IL_026b: ldftn System.Int32 ZenUI.Section.FitContainerGrid::<InventoryGrid_UpdateGamepad>g__WidthToHeight|15_13(InventoryGrid)
IL_0271: newobj System.Void System.Func`2<InventoryGrid,System.Int32>::.ctor(System.Object,System.IntPtr)
IL_0276: dup
IL_0277: stsfld System.Func`2<InventoryGrid,System.Int32> ZenUI.Section.FitContainerGrid/<>O::<6>__WidthToHeight
IL_027c: stfld System.Func`2<InventoryGrid,System.Int32> ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::widthToHeight
IL_0281: ldloc.0
IL_0282: ldc.i4.4
IL_0283: newarr System.String
IL_0288: dup
IL_0289: ldc.i4.0
IL_028a: ldstr "JoyDPadLeft"
IL_028f: stelem.ref
IL_0290: dup
IL_0291: ldc.i4.1
IL_0292: ldstr "JoyDPadRight"
IL_0297: stelem.ref
IL_0298: dup
IL_0299: ldc.i4.2
IL_029a: ldstr "JoyLStickLeft"
IL_029f: stelem.ref
IL_02a0: dup
IL_02a1: ldc.i4.3
IL_02a2: ldstr "JoyLStickRight"
IL_02a7: stelem.ref
IL_02a8: stfld System.String[] ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::inputs
IL_02ad: ldloc.0
IL_02ae: ldftn System.Boolean ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::<InventoryGrid_UpdateGamepad>b__0(HarmonyLib.CodeInstruction)
IL_02b4: newobj System.Void System.Func`2<HarmonyLib.CodeInstruction,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_02b9: ldnull
IL_02ba: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Func`2<HarmonyLib.CodeInstruction,System.Boolean>,System.String)
IL_02bf: stloc.s V_7
IL_02c1: ldsfld System.Func`3<System.String,InventoryGrid,System.String> ZenUI.Section.FitContainerGrid/<>O::<7>__InterceptLeftRight
IL_02c6: dup
IL_02c7: brtrue.s IL_02dc
IL_02c9: pop
IL_02ca: ldnull
IL_02cb: ldftn System.String ZenUI.Section.FitContainerGrid::<InventoryGrid_UpdateGamepad>g__InterceptLeftRight|15_8(System.String,InventoryGrid)
IL_02d1: newobj System.Void System.Func`3<System.String,InventoryGrid,System.String>::.ctor(System.Object,System.IntPtr)
IL_02d6: dup
IL_02d7: stsfld System.Func`3<System.String,InventoryGrid,System.String> ZenUI.Section.FitContainerGrid/<>O::<7>__InterceptLeftRight
IL_02dc: stloc.s V_8
IL_02de: ldloc.0
IL_02df: ldc.i4.2
IL_02e0: newarr HarmonyLib.CodeInstruction
IL_02e5: dup
IL_02e6: ldc.i4.0
IL_02e7: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldarg_0
IL_02ec: ldnull
IL_02ed: newobj System.Void HarmonyLib.CodeInstruction::.ctor(System.Reflection.Emit.OpCode,System.Object)
IL_02f2: stelem.ref
IL_02f3: dup
IL_02f4: ldc.i4.1
IL_02f5: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_02fa: ldloc.s V_8
IL_02fc: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_0301: newobj System.Void HarmonyLib.CodeInstruction::.ctor(System.Reflection.Emit.OpCode,System.Object)
IL_0306: stelem.ref
IL_0307: stfld HarmonyLib.CodeInstruction[] ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::insertInput
IL_030c: ldarg.0
IL_030d: ldnull
IL_030e: newobj System.Void HarmonyLib.CodeMatcher::.ctor(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>,System.Reflection.Emit.ILGenerator)
IL_0313: call HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Start()
IL_0318: ldc.i4.1
IL_0319: newarr HarmonyLib.CodeMatch
IL_031e: dup
IL_031f: ldc.i4.0
IL_0320: ldloc.s V_7
IL_0322: stelem.ref
IL_0323: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::MatchStartForward(HarmonyLib.CodeMatch[])
IL_0328: ldstr "Unable to match IL: sequenceInputs"
IL_032d: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::ThrowIfInvalid(System.String)
IL_0332: ldloc.0
IL_0333: ldftn System.Void ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::<InventoryGrid_UpdateGamepad>b__1(HarmonyLib.CodeMatcher)
IL_0339: newobj System.Void System.Action`1<HarmonyLib.CodeMatcher>::.ctor(System.Object,System.IntPtr)
IL_033e: ldnull
IL_033f: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Repeat(System.Action`1<HarmonyLib.CodeMatcher>,System.Action`1<System.String>)
IL_0344: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Start()
IL_0349: ldloc.1
IL_034a: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::MatchStartForward(HarmonyLib.CodeMatch[])
IL_034f: ldstr "Unable to match IL: sequenceReadX"
IL_0354: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::ThrowIfInvalid(System.String)
IL_0359: ldloc.0
IL_035a: ldftn System.Void ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::<InventoryGrid_UpdateGamepad>b__2(HarmonyLib.CodeMatcher)
IL_0360: newobj System.Void System.Action`1<HarmonyLib.CodeMatcher>::.ctor(System.Object,System.IntPtr)
IL_0365: ldnull
IL_0366: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Repeat(System.Action`1<HarmonyLib.CodeMatcher>,System.Action`1<System.String>)
IL_036b: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Start()
IL_0370: ldloc.2
IL_0371: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::MatchStartForward(HarmonyLib.CodeMatch[])
IL_0376: ldstr "Unable to match IL: sequenceReadY"
IL_037b: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::ThrowIfInvalid(System.String)
IL_0380: ldloc.0
IL_0381: ldftn System.Void ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::<InventoryGrid_UpdateGamepad>b__3(HarmonyLib.CodeMatcher)
IL_0387: newobj System.Void System.Action`1<HarmonyLib.CodeMatcher>::.ctor(System.Object,System.IntPtr)
IL_038c: ldnull
IL_038d: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Repeat(System.Action`1<HarmonyLib.CodeMatcher>,System.Action`1<System.String>)
IL_0392: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Start()
IL_0397: ldloc.3
IL_0398: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::MatchStartForward(HarmonyLib.CodeMatch[])
IL_039d: ldstr "Unable to match IL: sequenceWriteX"
IL_03a2: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::ThrowIfInvalid(System.String)
IL_03a7: ldloc.0
IL_03a8: ldftn System.Void ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::<InventoryGrid_UpdateGamepad>b__4(HarmonyLib.CodeMatcher)
IL_03ae: newobj System.Void System.Action`1<HarmonyLib.CodeMatcher>::.ctor(System.Object,System.IntPtr)
IL_03b3: ldnull
IL_03b4: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Repeat(System.Action`1<HarmonyLib.CodeMatcher>,System.Action`1<System.String>)
IL_03b9: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Start()
IL_03be: ldloc.s V_4
IL_03c0: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::MatchStartForward(HarmonyLib.CodeMatch[])
IL_03c5: ldstr "Unable to match IL: sequenceWriteY"
IL_03ca: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::ThrowIfInvalid(System.String)
IL_03cf: ldloc.0
IL_03d0: ldftn System.Void ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::<InventoryGrid_UpdateGamepad>b__5(HarmonyLib.CodeMatcher)
IL_03d6: newobj System.Void System.Action`1<HarmonyLib.CodeMatcher>::.ctor(System.Object,System.IntPtr)
IL_03db: ldnull
IL_03dc: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Repeat(System.Action`1<HarmonyLib.CodeMatcher>,System.Action`1<System.String>)
IL_03e1: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Start()
IL_03e6: ldloc.s V_5
IL_03e8: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::MatchStartForward(HarmonyLib.CodeMatch[])
IL_03ed: ldstr "Unable to match IL: sequenceWidth"
IL_03f2: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::ThrowIfInvalid(System.String)
IL_03f7: ldloc.0
IL_03f8: ldftn System.Void ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::<InventoryGrid_UpdateGamepad>b__6(HarmonyLib.CodeMatcher)
IL_03fe: newobj System.Void System.Action`1<HarmonyLib.CodeMatcher>::.ctor(System.Object,System.IntPtr)
IL_0403: ldnull
IL_0404: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Repeat(System.Action`1<HarmonyLib.CodeMatcher>,System.Action`1<System.String>)
IL_0409: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Start()
IL_040e: ldloc.s V_6
IL_0410: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::MatchStartForward(HarmonyLib.CodeMatch[])
IL_0415: ldstr "Unable to match IL: sequenceHeight"
IL_041a: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::ThrowIfInvalid(System.String)
IL_041f: ldloc.0
IL_0420: ldftn System.Void ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::<InventoryGrid_UpdateGamepad>b__7(HarmonyLib.CodeMatcher)
IL_0426: newobj System.Void System.Action`1<HarmonyLib.CodeMatcher>::.ctor(System.Object,System.IntPtr)
IL_042b: ldnull
IL_042c: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Repeat(System.Action`1<HarmonyLib.CodeMatcher>,System.Action`1<System.String>)
IL_0431: callvirt System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> HarmonyLib.CodeMatcher::InstructionEnumeration()
IL_0436: ret

// System.Void ZenUI.Section.FitContainerGrid::InventoryGui_MoveToUpperInventoryGrid(InventoryGui,Vector2i&)
.locals System.Int32&, System.Int32, System.Int32
IL_0000: ldarg.0
IL_0001: callvirt InventoryGrid InventoryGui::get_ContainerGrid()
IL_0006: call System.Boolean ZenUI.Section.FitContainerGrid::IsRotated(InventoryGrid)
IL_000b: brfalse.s IL_003b
IL_000d: ldarg.1
IL_000e: ldflda System.Int32 Vector2i::x
IL_0013: stloc.0
IL_0014: ldarg.1
IL_0015: ldflda System.Int32 Vector2i::y
IL_001a: ldarg.0
IL_001b: callvirt InventoryGrid InventoryGui::get_ContainerGrid()
IL_0020: ldfld System.Int32 InventoryGrid::m_height
IL_0025: ldarg.1
IL_0026: ldfld System.Int32 Vector2i::y
IL_002b: sub
IL_002c: ldc.i4.1
IL_002d: sub
IL_002e: stloc.1
IL_002f: ldarg.1
IL_0030: ldfld System.Int32 Vector2i::x
IL_0035: stloc.2
IL_0036: ldloc.0
IL_0037: ldloc.1
IL_0038: stind.i4
IL_0039: ldloc.2
IL_003a: stind.i4
IL_003b: ret

// System.Boolean ZenUI.Section.FitContainerGrid::InventoryGui_MoveToLowerInventoryGrid(InventoryGui,Vector2i&)
.locals System.Int32, Vector2i, System.Int32
IL_0000: ldarg.0
IL_0001: callvirt InventoryGrid InventoryGui::get_ContainerGrid()
IL_0006: call System.Boolean ZenUI.Section.FitContainerGrid::IsRotated(InventoryGrid)
IL_000b: brtrue.s IL_000f
IL_000d: ldc.i4.1
IL_000e: ret
IL_000f: ldarg.0
IL_0010: ldfld UIGroupHandler InventoryGui::m_inventoryGroup
IL_0015: callvirt System.Boolean UIGroupHandler::get_IsActive()
IL_001a: brfalse.s IL_0024
IL_001c: ldarg.0
IL_001d: callvirt System.Boolean InventoryGui::IsContainerOpen()
IL_0022: brtrue.s IL_0026
IL_0024: ldc.i4.0
IL_0025: ret
IL_0026: ldarg.0
IL_0027: ldfld InventoryGrid InventoryGui::m_playerGrid
IL_002c: callvirt System.Int32 InventoryGrid::get_GridWidth()
IL_0031: ldarg.0
IL_0032: ldfld InventoryGrid InventoryGui::m_containerGrid
IL_0037: ldfld System.Int32 InventoryGrid::m_height
IL_003c: sub
IL_003d: stloc.0
IL_003e: ldarg.0
IL_003f: ldfld InventoryGrid InventoryGui::m_containerGrid
IL_0044: callvirt Vector2i InventoryGrid::get_SelectionGridPosition()
IL_0049: stloc.1
IL_004a: ldc.i4.0
IL_004b: ldarg.1
IL_004c: ldfld System.Int32 Vector2i::x
IL_0051: ldloc.0
IL_0052: sub
IL_0053: call System.Int32 UnityEngine.Mathf::Max(System.Int32,System.Int32)
IL_0058: stloc.2
IL_0059: ldloca.s V_1
IL_005b: ldarg.0
IL_005c: ldfld InventoryGrid InventoryGui::m_containerGrid
IL_0061: ldfld System.Int32 InventoryGrid::m_height
IL_0066: ldloc.2
IL_0067: ldarg.0
IL_0068: ldfld InventoryGrid InventoryGui::m_containerGrid
IL_006d: ldfld System.Int32 InventoryGrid::m_height
IL_0072: ldc.i4.1
IL_0073: sub
IL_0074: call System.Int32 System.Math::Min(System.Int32,System.Int32)
IL_0079: sub
IL_007a: stfld System.Int32 Vector2i::y
IL_007f: ldloca.s V_1
IL_0081: ldc.i4.0
IL_0082: stfld System.Int32 Vector2i::x
IL_0087: ldarg.0
IL_0088: ldfld InventoryGrid InventoryGui::m_containerGrid
IL_008d: ldloc.1
IL_008e: callvirt System.Void InventoryGrid::SetGamepadSelection(Vector2i)
IL_0093: ldarg.0
IL_0094: ldarg.0
IL_0095: ldfld System.Int32 InventoryGui::m_activeGroup
IL_009a: ldc.i4.1
IL_009b: sub
IL_009c: ldc.i4.1
IL_009d: callvirt System.Void InventoryGui::SetActiveGroup(System.Int32,System.Boolean)
IL_00a2: ldc.i4.0
IL_00a3: ret

// System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> ZenUI.Section.FitContainerGrid::InventoryGui_MoveToLowerInventoryGrid(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>)
.locals System.Reflection.MethodInfo, System.Func`2<InventoryGrid,Vector2i>
IL_0000: ldtoken InventoryGrid
IL_0005: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_000a: ldstr "SelectionGridPosition"
IL_000f: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredPropertyGetter(System.Type,System.String)
IL_0014: stloc.0
IL_0015: ldsfld System.Func`2<InventoryGrid,Vector2i> ZenUI.Section.FitContainerGrid/<>O::<8>__Intercept
IL_001a: dup
IL_001b: brtrue.s IL_0030
IL_001d: pop
IL_001e: ldnull
IL_001f: ldftn Vector2i ZenUI.Section.FitContainerGrid::<InventoryGui_MoveToLowerInventoryGrid>g__Intercept|18_0(InventoryGrid)
IL_0025: newobj System.Void System.Func`2<InventoryGrid,Vector2i>::.ctor(System.Object,System.IntPtr)
IL_002a: dup
IL_002b: stsfld System.Func`2<InventoryGrid,Vector2i> ZenUI.Section.FitContainerGrid/<>O::<8>__Intercept
IL_0030: stloc.1
IL_0031: ldarg.0
IL_0032: ldloc.0
IL_0033: ldloc.1
IL_0034: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_0039: call System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> HarmonyLib.Transpilers::MethodReplacer(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>,System.Reflection.MethodBase,System.Reflection.MethodBase)
IL_003e: ret

// System.Void ZenUI.Section.FitContainerGrid::InventoryGrid_GridWidth(InventoryGrid,System.Int32&)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean ZenUI.Section.FitContainerGrid::IsRotated(InventoryGrid)
IL_0006: brfalse.s IL_0010
IL_0008: ldarg.1
IL_0009: ldarg.0
IL_000a: ldfld System.Int32 InventoryGrid::m_height
IL_000f: stind.i4
IL_0010: ret

// System.Void ZenUI.Section.FitContainerGrid::Inventory_FindEmptySlot(Inventory,System.Boolean,Vector2i&,System.Boolean&)
.locals System.Int32, System.Int32, System.Int32, System.Int32
IL_0000: ldarg.0
IL_0001: call System.Boolean ZenUI.Section.FitContainerGrid::IsRotated(Inventory)
IL_0006: brtrue.s IL_0009
IL_0008: ret
IL_0009: ldarg.3
IL_000a: ldc.i4.0
IL_000b: stind.i1
IL_000c: ldarg.1
IL_000d: brfalse.s IL_004d
IL_000f: ldc.i4.0
IL_0010: stloc.0
IL_0011: br.s IL_0042
IL_0013: ldarg.0
IL_0014: ldfld System.Int32 Inventory::m_height
IL_0019: ldc.i4.1
IL_001a: sub
IL_001b: stloc.1
IL_001c: br.s IL_003a
IL_001e: ldarg.0
IL_001f: ldloc.0
IL_0020: ldloc.1
IL_0021: callvirt ItemDrop/ItemData Inventory::GetItemAt(System.Int32,System.Int32)
IL_0026: brtrue.s IL_0036
IL_0028: ldarg.2
IL_0029: ldloc.0
IL_002a: ldloc.1
IL_002b: newobj System.Void Vector2i::.ctor(System.Int32,System.Int32)
IL_0030: stobj Vector2i
IL_0035: ret
IL_0036: ldloc.1
IL_0037: ldc.i4.1
IL_0038: sub
IL_0039: stloc.1
IL_003a: ldloc.1
IL_003b: ldc.i4.0
IL_003c: bge.s IL_001e
IL_003e: ldloc.0
IL_003f: ldc.i4.1
IL_0040: add
IL_0041: stloc.0
IL_0042: ldloc.0
IL_0043: ldarg.0
IL_0044: ldfld System.Int32 Inventory::m_width
IL_0049: blt.s IL_0013
IL_004b: br.s IL_008b
IL_004d: ldarg.0
IL_004e: ldfld System.Int32 Inventory::m_width
IL_0053: ldc.i4.1
IL_0054: sub
IL_0055: stloc.2
IL_0056: br.s IL_0087
IL_0058: ldarg.0
IL_0059: ldfld System.Int32 Inventory::m_height
IL_005e: ldc.i4.1
IL_005f: sub
IL_0060: stloc.3
IL_0061: br.s IL_007f
IL_0063: ldarg.0
IL_0064: ldloc.2
IL_0065: ldloc.3
IL_0066: callvirt ItemDrop/ItemData Inventory::GetItemAt(System.Int32,System.Int32)
IL_006b: brtrue.s IL_007b
IL_006d: ldarg.2
IL_006e: ldloc.2
IL_006f: ldloc.3
IL_0070: newobj System.Void Vector2i::.ctor(System.Int32,System.Int32)
IL_0075: stobj Vector2i
IL_007a: ret
IL_007b: ldloc.3
IL_007c: ldc.i4.1
IL_007d: sub
IL_007e: stloc.3
IL_007f: ldloc.3
IL_0080: ldc.i4.0
IL_0081: bge.s IL_0063
IL_0083: ldloc.2
IL_0084: ldc.i4.1
IL_0085: sub
IL_0086: stloc.2
IL_0087: ldloc.2
IL_0088: ldc.i4.0
IL_0089: bge.s IL_0058
IL_008b: ldarg.2
IL_008c: ldc.i4.m1
IL_008d: ldc.i4.m1
IL_008e: newobj System.Void Vector2i::.ctor(System.Int32,System.Int32)
IL_0093: stobj Vector2i
IL_0098: ret

// System.Void ZenUI.Section.FitContainerGrid::.cctor()
.locals 
IL_0000: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.ValueTuple`2<System.Single,System.Boolean>>::.ctor()
IL_0005: dup
IL_0006: ldstr "piece_chest_grausten"
IL_000b: ldc.r4 0.84
IL_0010: ldc.i4.0
IL_0011: newobj System.Void System.ValueTuple`2<System.Single,System.Boolean>::.ctor(!0,!1)
IL_0016: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.ValueTuple`2<System.Single,System.Boolean>>::set_Item(!0,!1)
IL_001b: dup
IL_001c: ldstr "piece_chest_warderobe"
IL_0021: ldc.r4 0.8
IL_0026: ldc.i4.1
IL_0027: newobj System.Void System.ValueTuple`2<System.Single,System.Boolean>::.ctor(!0,!1)
IL_002c: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.ValueTuple`2<System.Single,System.Boolean>>::set_Item(!0,!1)
IL_0031: stsfld System.Collections.Generic.Dictionary`2<System.String,System.ValueTuple`2<System.Single,System.Boolean>> ZenUI.Section.FitContainerGrid::RescaledContainers
IL_0036: ret

// UnityEngine.Vector2 ZenUI.Section.FitContainerGrid::<InventoryGrid_UpdateGui>g__Intercept|12_0(UnityEngine.Vector2,InventoryGrid)
.locals 
IL_0000: call System.Boolean ZenUI.Section.FitContainerGrid::get_IsFeatureEnabled()
IL_0005: brfalse.s IL_000f
IL_0007: ldarg.1
IL_0008: call System.Boolean ZenUI.Section.FitContainerGrid::IsContainerGrid(InventoryGrid)
IL_000d: brtrue.s IL_0011
IL_000f: ldarg.0
IL_0010: ret
IL_0011: call UnityEngine.Vector2 UnityEngine.Vector2::get_zero()
IL_0016: ret

// System.String ZenUI.Section.FitContainerGrid::<InventoryGrid_UpdateGamepad>g__InterceptLeftRight|15_8(System.String,InventoryGrid)
.locals System.String
IL_0000: ldarg.1
IL_0001: call System.Boolean ZenUI.Section.FitContainerGrid::IsRotated(InventoryGrid)
IL_0006: brtrue.s IL_000a
IL_0008: ldarg.0
IL_0009: ret
IL_000a: ldarg.0
IL_000b: ldstr "JoyDPadLeft"
IL_0010: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0015: brtrue.s IL_0040
IL_0017: ldarg.0
IL_0018: ldstr "JoyDPadRight"
IL_001d: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0022: brtrue.s IL_0048
IL_0024: ldarg.0
IL_0025: ldstr "JoyLStickLeft"
IL_002a: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_002f: brtrue.s IL_0050
IL_0031: ldarg.0
IL_0032: ldstr "JoyLStickRight"
IL_0037: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_003c: brtrue.s IL_0058
IL_003e: br.s IL_0060
IL_0040: ldstr "JoyDPadRight"
IL_0045: stloc.0
IL_0046: br.s IL_0062
IL_0048: ldstr "JoyDPadLeft"
IL_004d: stloc.0
IL_004e: br.s IL_0062
IL_0050: ldstr "JoyLStickRight"
IL_0055: stloc.0
IL_0056: br.s IL_0062
IL_0058: ldstr "JoyLStickLeft"
IL_005d: stloc.0
IL_005e: br.s IL_0062
IL_0060: ldarg.0
IL_0061: stloc.0
IL_0062: ldloc.0
IL_0063: ret

// System.Int32 ZenUI.Section.FitContainerGrid::<InventoryGrid_UpdateGamepad>g__ReadXtoY|15_9(InventoryGrid)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean ZenUI.Section.FitContainerGrid::IsRotated(InventoryGrid)
IL_0006: brfalse.s IL_0014
IL_0008: ldarg.0
IL_0009: ldflda Vector2i InventoryGrid::m_selected
IL_000e: ldfld System.Int32 Vector2i::y
IL_0013: ret
IL_0014: ldarg.0
IL_0015: ldflda Vector2i InventoryGrid::m_selected
IL_001a: ldfld System.Int32 Vector2i::x
IL_001f: ret

// System.Int32 ZenUI.Section.FitContainerGrid::<InventoryGrid_UpdateGamepad>g__ReadYtoX|15_10(InventoryGrid)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean ZenUI.Section.FitContainerGrid::IsRotated(InventoryGrid)
IL_0006: brfalse.s IL_0014
IL_0008: ldarg.0
IL_0009: ldflda Vector2i InventoryGrid::m_selected
IL_000e: ldfld System.Int32 Vector2i::x
IL_0013: ret
IL_0014: ldarg.0
IL_0015: ldflda Vector2i InventoryGrid::m_selected
IL_001a: ldfld System.Int32 Vector2i::y
IL_001f: ret

// System.Void ZenUI.Section.FitContainerGrid::<InventoryGrid_UpdateGamepad>g__WriteXtoY|15_11(System.Int32,InventoryGrid)
.locals 
IL_0000: ldarg.1
IL_0001: call System.Boolean ZenUI.Section.FitContainerGrid::IsRotated(InventoryGrid)
IL_0006: brtrue.s IL_0015
IL_0008: ldarg.1
IL_0009: ldflda Vector2i InventoryGrid::m_selected
IL_000e: ldarg.0
IL_000f: stfld System.Int32 Vector2i::x
IL_0014: ret
IL_0015: ldarg.1
IL_0016: ldflda Vector2i InventoryGrid::m_selected
IL_001b: ldarg.0
IL_001c: stfld System.Int32 Vector2i::y
IL_0021: ret

// System.Void ZenUI.Section.FitContainerGrid::<InventoryGrid_UpdateGamepad>g__WriteYtoX|15_12(System.Int32,InventoryGrid)
.locals 
IL_0000: ldarg.1
IL_0001: call System.Boolean ZenUI.Section.FitContainerGrid::IsRotated(InventoryGrid)
IL_0006: brtrue.s IL_0015
IL_0008: ldarg.1
IL_0009: ldflda Vector2i InventoryGrid::m_selected
IL_000e: ldarg.0
IL_000f: stfld System.Int32 Vector2i::y
IL_0014: ret
IL_0015: ldarg.1
IL_0016: ldflda Vector2i InventoryGrid::m_selected
IL_001b: ldarg.0
IL_001c: stfld System.Int32 Vector2i::x
IL_0021: ret

// System.Int32 ZenUI.Section.FitContainerGrid::<InventoryGrid_UpdateGamepad>g__WidthToHeight|15_13(InventoryGrid)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean ZenUI.Section.FitContainerGrid::IsRotated(InventoryGrid)
IL_0006: brfalse.s IL_000f
IL_0008: ldarg.0
IL_0009: ldfld System.Int32 InventoryGrid::m_height
IL_000e: ret
IL_000f: ldarg.0
IL_0010: ldfld System.Int32 InventoryGrid::m_width
IL_0015: ret

// System.Int32 ZenUI.Section.FitContainerGrid::<InventoryGrid_UpdateGamepad>g__HeightToWidth|15_14(InventoryGrid)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean ZenUI.Section.FitContainerGrid::IsRotated(InventoryGrid)
IL_0006: brfalse.s IL_000f
IL_0008: ldarg.0
IL_0009: ldfld System.Int32 InventoryGrid::m_width
IL_000e: ret
IL_000f: ldarg.0
IL_0010: ldfld System.Int32 InventoryGrid::m_height
IL_0015: ret

// Vector2i ZenUI.Section.FitContainerGrid::<InventoryGui_MoveToLowerInventoryGrid>g__Intercept|18_0(InventoryGrid)
.locals Vector2i
IL_0000: call System.Boolean ZenUI.Section.FitContainerGrid::get_IsFeatureEnabled()
IL_0005: brtrue.s IL_000e
IL_0007: ldarg.0
IL_0008: callvirt Vector2i InventoryGrid::get_SelectionGridPosition()
IL_000d: ret
IL_000e: ldarg.0
IL_000f: callvirt Vector2i InventoryGrid::get_SelectionGridPosition()
IL_0014: stloc.0
IL_0015: ldloca.s V_0
IL_0017: ldc.i4.0
IL_0018: stfld System.Int32 Vector2i::y
IL_001d: ldloc.0
IL_001e: ret

// System.Void ZenUI.Section.FitContainerGrid/InventoryGuiShow::Prefix(InventoryGui,Container,System.Boolean&)
.locals InventoryGrid, System.ValueTuple`2<System.Single,System.Boolean>
IL_0000: call System.Boolean ZenUI.Section.FitContainerGrid::get_IsFeatureEnabled()
IL_0005: brtrue.s IL_0008
IL_0007: ret
IL_0008: ldarg.0
IL_0009: call InventoryGrid ZenUI.Section.FitContainerGrid::InitContainerGrid(InventoryGui)
IL_000e: stloc.0
IL_000f: ldarg.1
IL_0010: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0015: brfalse.s IL_0024
IL_0017: ldarg.1
IL_0018: ldfld Piece Container::m_piece
IL_001d: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0022: brtrue.s IL_0025
IL_0024: ret
IL_0025: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.ValueTuple`2<System.Single,System.Boolean>> ZenUI.Section.FitContainerGrid::RescaledContainers
IL_002a: ldarg.1
IL_002b: ldfld Piece Container::m_piece
IL_0030: call System.String Zen.Lib.PieceExt::GetPrefabName(Piece)
IL_0035: ldloca.s V_1
IL_0037: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.ValueTuple`2<System.Single,System.Boolean>>::TryGetValue(!0,!1&)
IL_003c: brtrue.s IL_003f
IL_003e: ret
IL_003f: ldloc.0
IL_0040: ldfld UnityEngine.RectTransform InventoryGrid::m_gridRoot
IL_0045: call UnityEngine.Vector3 UnityEngine.Vector3::get_one()
IL_004a: ldloc.1
IL_004b: ldfld !0 System.ValueTuple`2<System.Single,System.Boolean>::Item1
IL_0050: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_0055: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_005a: ldarg.2
IL_005b: ldloc.1
IL_005c: ldfld !1 System.ValueTuple`2<System.Single,System.Boolean>::Item2
IL_0061: stind.i1
IL_0062: ret

// System.Void ZenUI.Section.FitContainerGrid/InventoryGuiShow::Postfix(InventoryGui,Container,System.Boolean)
.locals 
IL_0000: call System.Boolean ZenUI.Section.FitContainerGrid::get_IsFeatureEnabled()
IL_0005: brfalse.s IL_000f
IL_0007: ldarg.1
IL_0008: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000d: brtrue.s IL_0010
IL_000f: ret
IL_0010: ldarg.2
IL_0011: brfalse.s IL_001f
IL_0013: ldarg.0
IL_0014: callvirt InventoryGrid InventoryGui::get_ContainerGrid()
IL_0019: ldc.i4.1
IL_001a: call System.Void ZenUI.Section.FitContainerGrid::RotateGrid(InventoryGrid,System.Boolean)
IL_001f: ldarg.0
IL_0020: callvirt InventoryGrid InventoryGui::get_ContainerGrid()
IL_0025: call System.Void ZenUI.Section.FitContainerGrid::ResetAnchorPosition(InventoryGrid)
IL_002a: ret

// System.Void ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::<InventoryGrid_UpdateGamepad>b__0(HarmonyLib.CodeInstruction)
.locals 
IL_0000: ldarg.1
IL_0001: ldfld System.Reflection.Emit.OpCode HarmonyLib.CodeInstruction::opcode
IL_0006: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldstr
IL_000b: call System.Boolean System.Reflection.Emit.OpCode::op_Equality(System.Reflection.Emit.OpCode,System.Reflection.Emit.OpCode)
IL_0010: brfalse.s IL_002a
IL_0012: ldarg.0
IL_0013: ldfld System.String[] ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::inputs
IL_0018: ldarg.1
IL_0019: ldfld System.Object HarmonyLib.CodeInstruction::operand
IL_001e: isinst System.String
IL_0023: ldc.i4.4
IL_0024: call System.Boolean StringUtils::ContainsString(System.Collections.Generic.IReadOnlyList`1<System.String>,System.String,System.StringComparison)
IL_0029: ret
IL_002a: ldc.i4.0
IL_002b: ret

// System.Void ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::<InventoryGrid_UpdateGamepad>b__1(HarmonyLib.CodeMatcher)
.locals 
IL_0000: ldarg.1
IL_0001: ldc.i4.1
IL_0002: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Advance(System.Int32)
IL_0007: ldarg.0
IL_0008: ldfld HarmonyLib.CodeInstruction[] ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::insertInput
IL_000d: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Insert(HarmonyLib.CodeInstruction[])
IL_0012: pop
IL_0013: ret

// System.Void ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::<InventoryGrid_UpdateGamepad>b__2(HarmonyLib.CodeMatcher)
.locals 
IL_0000: ldarg.1
IL_0001: ldc.i4.1
IL_0002: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Advance(System.Int32)
IL_0007: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Nop
IL_000c: ldnull
IL_000d: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::SetAndAdvance(System.Reflection.Emit.OpCode,System.Object)
IL_0012: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Nop
IL_0017: ldnull
IL_0018: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::SetAndAdvance(System.Reflection.Emit.OpCode,System.Object)
IL_001d: ldc.i4.1
IL_001e: newarr HarmonyLib.CodeInstruction
IL_0023: dup
IL_0024: ldc.i4.0
IL_0025: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_002a: ldarg.0
IL_002b: ldfld System.Func`2<InventoryGrid,System.Int32> ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::readXtoY
IL_0030: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_0035: newobj System.Void HarmonyLib.CodeInstruction::.ctor(System.Reflection.Emit.OpCode,System.Object)
IL_003a: stelem.ref
IL_003b: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Insert(HarmonyLib.CodeInstruction[])
IL_0040: pop
IL_0041: ret

// System.Void ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::<InventoryGrid_UpdateGamepad>b__3(HarmonyLib.CodeMatcher)
.locals 
IL_0000: ldarg.1
IL_0001: ldc.i4.1
IL_0002: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Advance(System.Int32)
IL_0007: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Nop
IL_000c: ldnull
IL_000d: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::SetAndAdvance(System.Reflection.Emit.OpCode,System.Object)
IL_0012: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Nop
IL_0017: ldnull
IL_0018: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::SetAndAdvance(System.Reflection.Emit.OpCode,System.Object)
IL_001d: ldc.i4.1
IL_001e: newarr HarmonyLib.CodeInstruction
IL_0023: dup
IL_0024: ldc.i4.0
IL_0025: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_002a: ldarg.0
IL_002b: ldfld System.Func`2<InventoryGrid,System.Int32> ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::readYtoX
IL_0030: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_0035: newobj System.Void HarmonyLib.CodeInstruction::.ctor(System.Reflection.Emit.OpCode,System.Object)
IL_003a: stelem.ref
IL_003b: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Insert(HarmonyLib.CodeInstruction[])
IL_0040: pop
IL_0041: ret

// System.Void ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::<InventoryGrid_UpdateGamepad>b__4(HarmonyLib.CodeMatcher)
.locals 
IL_0000: ldarg.1
IL_0001: ldc.i4.1
IL_0002: newarr HarmonyLib.CodeInstruction
IL_0007: dup
IL_0008: ldc.i4.0
IL_0009: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldarg_0
IL_000e: ldnull
IL_000f: newobj System.Void HarmonyLib.CodeInstruction::.ctor(System.Reflection.Emit.OpCode,System.Object)
IL_0014: stelem.ref
IL_0015: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::InsertAndAdvance(HarmonyLib.CodeInstruction[])
IL_001a: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_001f: ldarg.0
IL_0020: ldfld System.Action`2<System.Int32,InventoryGrid> ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::writeXtoY
IL_0025: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_002a: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::SetAndAdvance(System.Reflection.Emit.OpCode,System.Object)
IL_002f: ldc.i4.1
IL_0030: newarr HarmonyLib.CodeInstruction
IL_0035: dup
IL_0036: ldc.i4.0
IL_0037: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Pop
IL_003c: ldnull
IL_003d: newobj System.Void HarmonyLib.CodeInstruction::.ctor(System.Reflection.Emit.OpCode,System.Object)
IL_0042: stelem.ref
IL_0043: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Insert(HarmonyLib.CodeInstruction[])
IL_0048: pop
IL_0049: ret

// System.Void ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::<InventoryGrid_UpdateGamepad>b__5(HarmonyLib.CodeMatcher)
.locals 
IL_0000: ldarg.1
IL_0001: ldc.i4.1
IL_0002: newarr HarmonyLib.CodeInstruction
IL_0007: dup
IL_0008: ldc.i4.0
IL_0009: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldarg_0
IL_000e: ldnull
IL_000f: newobj System.Void HarmonyLib.CodeInstruction::.ctor(System.Reflection.Emit.OpCode,System.Object)
IL_0014: stelem.ref
IL_0015: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::InsertAndAdvance(HarmonyLib.CodeInstruction[])
IL_001a: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_001f: ldarg.0
IL_0020: ldfld System.Action`2<System.Int32,InventoryGrid> ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::writeYtoX
IL_0025: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_002a: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::SetAndAdvance(System.Reflection.Emit.OpCode,System.Object)
IL_002f: ldc.i4.1
IL_0030: newarr HarmonyLib.CodeInstruction
IL_0035: dup
IL_0036: ldc.i4.0
IL_0037: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Pop
IL_003c: ldnull
IL_003d: newobj System.Void HarmonyLib.CodeInstruction::.ctor(System.Reflection.Emit.OpCode,System.Object)
IL_0042: stelem.ref
IL_0043: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Insert(HarmonyLib.CodeInstruction[])
IL_0048: pop
IL_0049: ret

// System.Void ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::<InventoryGrid_UpdateGamepad>b__6(HarmonyLib.CodeMatcher)
.locals 
IL_0000: ldarg.1
IL_0001: ldc.i4.1
IL_0002: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Advance(System.Int32)
IL_0007: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_000c: ldarg.0
IL_000d: ldfld System.Func`2<InventoryGrid,System.Int32> ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::widthToHeight
IL_0012: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_0017: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Set(System.Reflection.Emit.OpCode,System.Object)
IL_001c: pop
IL_001d: ret

// System.Void ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::<InventoryGrid_UpdateGamepad>b__7(HarmonyLib.CodeMatcher)
.locals 
IL_0000: ldarg.1
IL_0001: ldc.i4.1
IL_0002: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Advance(System.Int32)
IL_0007: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_000c: ldarg.0
IL_000d: ldfld System.Func`2<InventoryGrid,System.Int32> ZenUI.Section.FitContainerGrid/<>c__DisplayClass15_0::heightToWidth
IL_0012: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_0017: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Set(System.Reflection.Emit.OpCode,System.Object)
IL_001c: pop
IL_001d: ret

// ZenUI.Section.FoodPanel/FoodType ZenUI.Section.FoodPanel::GetFoodType(ItemDrop/ItemData)
.locals System.Single, System.Single, System.Single, System.Single
IL_0000: ldarg.0
IL_0001: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0006: dup
IL_0007: ldfld System.Single ItemDrop/ItemData/SharedData::m_food
IL_000c: stloc.0
IL_000d: dup
IL_000e: ldfld System.Single ItemDrop/ItemData/SharedData::m_foodStamina
IL_0013: stloc.1
IL_0014: ldfld System.Single ItemDrop/ItemData/SharedData::m_foodEitr
IL_0019: stloc.2
IL_001a: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::ColoredFoodBySimpleMajority
IL_001f: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0024: brtrue.s IL_002d
IL_0026: ldc.r4 2
IL_002b: br.s IL_0032
IL_002d: ldc.r4 1
IL_0032: stloc.3
IL_0033: ldloc.0
IL_0034: ldloc.2
IL_0035: ldloc.3
IL_0036: div
IL_0037: bge.un.s IL_0041
IL_0039: ldloc.1
IL_003a: ldloc.2
IL_003b: ldloc.3
IL_003c: div
IL_003d: bge.un.s IL_0041
IL_003f: ldc.i4.3
IL_0040: ret
IL_0041: ldloc.1
IL_0042: ldloc.0
IL_0043: ldloc.3
IL_0044: div
IL_0045: bge.un.s IL_0049
IL_0047: ldc.i4.1
IL_0048: ret
IL_0049: ldloc.0
IL_004a: ldloc.1
IL_004b: ldloc.3
IL_004c: div
IL_004d: bge.un.s IL_0051
IL_004f: ldc.i4.2
IL_0050: ret
IL_0051: ldc.i4.0
IL_0052: ret

// System.Void ZenUI.Section.FoodPanel::SetFoodPanelColor(System.Collections.Generic.List`1<Player/Food>,System.Int32)
.locals System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>, ZenUI.Section.FoodPanel/FoodType
IL_0000: ldsfld System.Collections.Generic.List`1<System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>> ZenUI.Section.FoodPanel::FoodPanelUIs
IL_0005: ldarg.1
IL_0006: callvirt !0 System.Collections.Generic.List`1<System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>>::get_Item(System.Int32)
IL_000b: stloc.0
IL_000c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::ColoredFoodBars
IL_0011: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0016: brfalse.s IL_0023
IL_0018: ldarg.1
IL_0019: ldarg.0
IL_001a: callvirt System.Int32 System.Collections.Generic.List`1<Player/Food>::get_Count()
IL_001f: ldc.i4.1
IL_0020: sub
IL_0021: ble.s IL_0034
IL_0023: ldloc.0
IL_0024: ldsfld UnityEngine.Color ZenUI.Section.FoodPanel::DefaultColor
IL_0029: ldsfld UnityEngine.Color ZenUI.Section.FoodPanel::DefaultColorAuga
IL_002e: call System.Void ZenUI.Section.FoodPanel::ApplyColor(System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>,UnityEngine.Color,UnityEngine.Color)
IL_0033: ret
IL_0034: ldarg.0
IL_0035: ldarg.1
IL_0036: callvirt !0 System.Collections.Generic.List`1<Player/Food>::get_Item(System.Int32)
IL_003b: ldfld ItemDrop/ItemData Player/Food::m_item
IL_0040: call ZenUI.Section.FoodPanel/FoodType ZenUI.Section.FoodPanel::GetFoodType(ItemDrop/ItemData)
IL_0045: stloc.1
IL_0046: ldloc.1
IL_0047: switch IL_005e,IL_006f,IL_0080,IL_0091
IL_005c: br.s IL_00a2
IL_005e: ldloc.0
IL_005f: ldsfld UnityEngine.Color ZenUI.Section.FoodPanel::DefaultColor
IL_0064: ldsfld UnityEngine.Color ZenUI.Section.FoodPanel::DefaultColorAuga
IL_0069: call System.Void ZenUI.Section.FoodPanel::ApplyColor(System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>,UnityEngine.Color,UnityEngine.Color)
IL_006e: ret
IL_006f: ldloc.0
IL_0070: ldsfld UnityEngine.Color ZenUI.Section.FoodPanel::HealthColor
IL_0075: ldsfld UnityEngine.Color ZenUI.Section.FoodPanel::HealthColorAuga
IL_007a: call System.Void ZenUI.Section.FoodPanel::ApplyColor(System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>,UnityEngine.Color,UnityEngine.Color)
IL_007f: ret
IL_0080: ldloc.0
IL_0081: ldsfld UnityEngine.Color ZenUI.Section.FoodPanel::StaminaColor
IL_0086: ldsfld UnityEngine.Color ZenUI.Section.FoodPanel::StaminaColorAuga
IL_008b: call System.Void ZenUI.Section.FoodPanel::ApplyColor(System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>,UnityEngine.Color,UnityEngine.Color)
IL_0090: ret
IL_0091: ldloc.0
IL_0092: ldsfld UnityEngine.Color ZenUI.Section.FoodPanel::EitrColor
IL_0097: ldsfld UnityEngine.Color ZenUI.Section.FoodPanel::EitrColorAuga
IL_009c: call System.Void ZenUI.Section.FoodPanel::ApplyColor(System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>,UnityEngine.Color,UnityEngine.Color)
IL_00a1: ret
IL_00a2: ldstr "foodType"
IL_00a7: newobj System.Void System.ArgumentOutOfRangeException::.ctor(System.String)
IL_00ac: throw

// System.Void ZenUI.Section.FoodPanel::ApplyColor(System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>,UnityEngine.Color,UnityEngine.Color)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld !0 System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>::Item1
IL_0006: ldarg.1
IL_0007: callvirt System.Void UnityEngine.UI.Graphic::set_color(UnityEngine.Color)
IL_000c: ldsfld System.Boolean ZenUI.Section.FoodPanel::_isAugaLite
IL_0011: brfalse.s IL_001f
IL_0013: ldarg.0
IL_0014: ldfld !1 System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>::Item2
IL_0019: ldarg.2
IL_001a: callvirt System.Void UnityEngine.UI.Graphic::set_color(UnityEngine.Color)
IL_001f: ret

// System.Void ZenUI.Section.FoodPanel::Game_Start()
.locals System.Collections.IEnumerator, UnityEngine.Transform, UnityEngine.UI.Image, UnityEngine.UI.Image, Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean, System.IDisposable, UnityEngine.UI.Image[], System.Int32, UnityEngine.UI.Image, UnityEngine.UI.Image
IL_0000: call System.Collections.Generic.Dictionary`2<System.String,BepInEx.PluginInfo> BepInEx.Bootstrap.Chainloader::get_PluginInfos()
IL_0005: ldstr "ZenDragon.AugaLite"
IL_000a: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,BepInEx.PluginInfo>::ContainsKey(!0)
IL_000f: stsfld System.Boolean ZenUI.Section.FoodPanel::_isAugaLite
IL_0014: ldsfld System.Boolean ZenUI.Section.FoodPanel::_isAugaLite
IL_0019: brfalse IL_00f3
IL_001e: ldstr "AugaLite detected"
IL_0023: ldc.i4.0
IL_0024: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_0029: call Hud Hud::get_instance()
IL_002e: ldfld UnityEngine.GameObject Hud::m_rootObject
IL_0033: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0038: callvirt System.Collections.IEnumerator UnityEngine.Transform::GetEnumerator()
IL_003d: stloc.0
IL_003e: br IL_00d1
IL_0043: ldloc.0
IL_0044: callvirt System.Object System.Collections.IEnumerator::get_Current()
IL_0049: castclass UnityEngine.Transform
IL_004e: stloc.1
IL_004f: ldloc.1
IL_0050: callvirt System.String UnityEngine.Object::get_name()
IL_0055: ldstr "FoodPanel"
IL_005a: callvirt System.Boolean System.String::StartsWith(System.String)
IL_005f: brfalse.s IL_00d1
IL_0061: ldc.i4.s 46
IL_0063: ldc.i4.1
IL_0064: ldloca.s V_5
IL_0066: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_006b: stloc.s V_4
IL_006d: ldloc.s V_5
IL_006f: brfalse.s IL_0096
IL_0071: ldloca.s V_4
IL_0073: ldstr "Get reference to "
IL_0078: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_007d: ldloca.s V_4
IL_007f: ldloc.1
IL_0080: callvirt System.String UnityEngine.Object::get_name()
IL_0085: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_008a: ldloca.s V_4
IL_008c: ldstr " background and border images"
IL_0091: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0096: ldloc.s V_4
IL_0098: ldc.i4.0
IL_0099: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_009e: ldloc.1
IL_009f: ldstr "IconBG"
IL_00a4: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_00a9: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.UI.Image>()
IL_00ae: stloc.2
IL_00af: ldloc.1
IL_00b0: ldstr "IconBG/Countdown"
IL_00b5: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_00ba: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.UI.Image>()
IL_00bf: stloc.3
IL_00c0: ldsfld System.Collections.Generic.List`1<System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>> ZenUI.Section.FoodPanel::FoodPanelUIs
IL_00c5: ldloc.2
IL_00c6: ldloc.3
IL_00c7: newobj System.Void System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>::.ctor(!0,!1)
IL_00cc: callvirt System.Void System.Collections.Generic.List`1<System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>>::Add(!0)
IL_00d1: ldloc.0
IL_00d2: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_00d7: brtrue IL_0043
IL_00dc: leave.s IL_00f2
IL_00de: ldloc.0
IL_00df: isinst System.IDisposable
IL_00e4: stloc.s V_6
IL_00e6: ldloc.s V_6
IL_00e8: brfalse.s IL_00f1
IL_00ea: ldloc.s V_6
IL_00ec: callvirt System.Void System.IDisposable::Dispose()
IL_00f1: endfinally
IL_00f2: ret
IL_00f3: call Hud Hud::get_instance()
IL_00f8: ldfld UnityEngine.UI.Image[] Hud::m_foodIcons
IL_00fd: stloc.s V_7
IL_00ff: ldc.i4.0
IL_0100: stloc.s V_8
IL_0102: br.s IL_0174
IL_0104: ldloc.s V_7
IL_0106: ldloc.s V_8
IL_0108: ldelem.ref
IL_0109: stloc.s V_9
IL_010b: ldc.i4.s 43
IL_010d: ldc.i4.1
IL_010e: ldloca.s V_5
IL_0110: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_0115: stloc.s V_4
IL_0117: ldloc.s V_5
IL_0119: brfalse.s IL_0141
IL_011b: ldloca.s V_4
IL_011d: ldstr "Get reference to "
IL_0122: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0127: ldloca.s V_4
IL_0129: ldloc.s V_9
IL_012b: callvirt System.String UnityEngine.Object::get_name()
IL_0130: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_0135: ldloca.s V_4
IL_0137: ldstr " parent image (background)"
IL_013c: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0141: ldloc.s V_4
IL_0143: ldc.i4.0
IL_0144: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_0149: ldloc.s V_9
IL_014b: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0150: callvirt UnityEngine.Transform UnityEngine.Transform::get_parent()
IL_0155: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.UI.Image>()
IL_015a: stloc.s V_10
IL_015c: ldsfld System.Collections.Generic.List`1<System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>> ZenUI.Section.FoodPanel::FoodPanelUIs
IL_0161: ldloc.s V_10
IL_0163: ldnull
IL_0164: newobj System.Void System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>::.ctor(!0,!1)
IL_0169: callvirt System.Void System.Collections.Generic.List`1<System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>>::Add(!0)
IL_016e: ldloc.s V_8
IL_0170: ldc.i4.1
IL_0171: add
IL_0172: stloc.s V_8
IL_0174: ldloc.s V_8
IL_0176: ldloc.s V_7
IL_0178: ldlen
IL_0179: conv.i4
IL_017a: blt.s IL_0104
IL_017c: ret
// EH Finally: 62 - 222 => 222 - 242

// System.Void ZenUI.Section.FoodPanel::Hud_UpdateFood(Hud,Player)
.locals System.Collections.Generic.List`1<Player/Food>, System.Int32
IL_0000: ldsfld System.Collections.Generic.List`1<System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>> ZenUI.Section.FoodPanel::FoodPanelUIs
IL_0005: callvirt System.Int32 System.Collections.Generic.List`1<System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>>::get_Count()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: ldarg.1
IL_000e: callvirt System.Collections.Generic.List`1<Player/Food> Player::GetFoods()
IL_0013: stloc.0
IL_0014: ldc.i4.0
IL_0015: stloc.1
IL_0016: br.s IL_0023
IL_0018: ldloc.0
IL_0019: ldloc.1
IL_001a: call System.Void ZenUI.Section.FoodPanel::SetFoodPanelColor(System.Collections.Generic.List`1<Player/Food>,System.Int32)
IL_001f: ldloc.1
IL_0020: ldc.i4.1
IL_0021: add
IL_0022: stloc.1
IL_0023: ldloc.1
IL_0024: ldsfld System.Collections.Generic.List`1<System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>> ZenUI.Section.FoodPanel::FoodPanelUIs
IL_0029: callvirt System.Int32 System.Collections.Generic.List`1<System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>>::get_Count()
IL_002e: blt.s IL_0018
IL_0030: ret

// System.Void ZenUI.Section.FoodPanel::Game_OnDestroy()
.locals 
IL_0000: ldstr "FoodPanel: OnDestroy called, clearing references to UI elements"
IL_0005: ldc.i4.0
IL_0006: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_000b: ldsfld System.Collections.Generic.List`1<System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>> ZenUI.Section.FoodPanel::FoodPanelUIs
IL_0010: callvirt System.Void System.Collections.Generic.List`1<System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>>::Clear()
IL_0015: ret

// System.Void ZenUI.Section.FoodPanel::.cctor()
.locals UnityEngine.Color
IL_0000: newobj System.Void System.Collections.Generic.List`1<System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>>::.ctor()
IL_0005: stsfld System.Collections.Generic.List`1<System.ValueTuple`2<UnityEngine.UI.Image,UnityEngine.UI.Image>> ZenUI.Section.FoodPanel::FoodPanelUIs
IL_000a: call UnityEngine.Color UnityEngine.Color::get_black()
IL_000f: stloc.0
IL_0010: ldloca.s V_0
IL_0012: ldc.r4 0.5
IL_0017: stfld System.Single UnityEngine.Color::a
IL_001c: ldloc.0
IL_001d: stsfld UnityEngine.Color ZenUI.Section.FoodPanel::DefaultColor
IL_0022: ldc.r4 0.44
IL_0027: ldc.r4 0.4
IL_002c: ldc.r4 0.34
IL_0031: ldc.r4 1
IL_0036: newobj System.Void UnityEngine.Color::.ctor(System.Single,System.Single,System.Single,System.Single)
IL_003b: stsfld UnityEngine.Color ZenUI.Section.FoodPanel::DefaultColorAuga
IL_0040: ldc.r4 1
IL_0045: ldc.r4 0.5
IL_004a: ldc.r4 0.5
IL_004f: ldc.r4 0.4
IL_0054: newobj System.Void UnityEngine.Color::.ctor(System.Single,System.Single,System.Single,System.Single)
IL_0059: stsfld UnityEngine.Color ZenUI.Section.FoodPanel::HealthColor
IL_005e: ldc.r4 0.6784
IL_0063: ldc.r4 0.0863
IL_0068: ldc.r4 0.0863
IL_006d: ldc.r4 0.5
IL_0072: newobj System.Void UnityEngine.Color::.ctor(System.Single,System.Single,System.Single,System.Single)
IL_0077: stsfld UnityEngine.Color ZenUI.Section.FoodPanel::HealthColorAuga
IL_007c: ldc.r4 1
IL_0081: ldc.r4 1
IL_0086: ldc.r4 0.5
IL_008b: ldc.r4 0.2
IL_0090: newobj System.Void UnityEngine.Color::.ctor(System.Single,System.Single,System.Single,System.Single)
IL_0095: stsfld UnityEngine.Color ZenUI.Section.FoodPanel::StaminaColor
IL_009a: ldc.r4 0.9176
IL_009f: ldc.r4 0.6588
IL_00a4: ldc.r4 0
IL_00a9: ldc.r4 0.5
IL_00ae: newobj System.Void UnityEngine.Color::.ctor(System.Single,System.Single,System.Single,System.Single)
IL_00b3: stsfld UnityEngine.Color ZenUI.Section.FoodPanel::StaminaColorAuga
IL_00b8: ldc.r4 0.6
IL_00bd: ldc.r4 0.6
IL_00c2: ldc.r4 1
IL_00c7: ldc.r4 0.5
IL_00cc: newobj System.Void UnityEngine.Color::.ctor(System.Single,System.Single,System.Single,System.Single)
IL_00d1: stsfld UnityEngine.Color ZenUI.Section.FoodPanel::EitrColor
IL_00d6: ldc.r4 0.6118
IL_00db: ldc.r4 0.3529
IL_00e0: ldc.r4 0.8118
IL_00e5: ldc.r4 0.5
IL_00ea: newobj System.Void UnityEngine.Color::.ctor(System.Single,System.Single,System.Single,System.Single)
IL_00ef: stsfld UnityEngine.Color ZenUI.Section.FoodPanel::EitrColorAuga
IL_00f4: ret

// System.Void ZenUI.Section.InventoryEquip::InitConfigs(System.String)
.locals ItemDrop/ItemData/ItemType[], System.Int32, ZenUI.Section.InventoryEquip/<>c__DisplayClass2_0, Vector2i
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<ItemDrop/ItemData/ItemType,Vector2i> ZenUI.Section.InventoryEquip::SlotPositionsByType
IL_0005: callvirt System.Collections.Generic.Dictionary`2/KeyCollection<!0,!1> System.Collections.Generic.Dictionary`2<ItemDrop/ItemData/ItemType,Vector2i>::get_Keys()
IL_000a: call !!0[] System.Linq.Enumerable::ToArray<ItemDrop/ItemData/ItemType>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_000f: stloc.0
IL_0010: ldc.i4.0
IL_0011: stloc.1
IL_0012: br IL_00bc
IL_0017: newobj System.Void ZenUI.Section.InventoryEquip/<>c__DisplayClass2_0::.ctor()
IL_001c: stloc.2
IL_001d: ldloc.2
IL_001e: ldloc.0
IL_001f: ldloc.1
IL_0020: ldelem.i4
IL_0021: stfld ItemDrop/ItemData/ItemType ZenUI.Section.InventoryEquip/<>c__DisplayClass2_0::key
IL_0026: ldsfld System.Collections.Generic.Dictionary`2<ItemDrop/ItemData/ItemType,Vector2i> ZenUI.Section.InventoryEquip::SlotPositionsByType
IL_002b: ldloc.2
IL_002c: ldfld ItemDrop/ItemData/ItemType ZenUI.Section.InventoryEquip/<>c__DisplayClass2_0::key
IL_0031: callvirt !1 System.Collections.Generic.Dictionary`2<ItemDrop/ItemData/ItemType,Vector2i>::get_Item(!0)
IL_0036: stloc.3
IL_0037: ldloc.2
IL_0038: ldc.i4.0
IL_0039: ldarg.0
IL_003a: ldstr "Assigned Slot {0}"
IL_003f: ldloc.2
IL_0040: ldfld ItemDrop/ItemData/ItemType ZenUI.Section.InventoryEquip/<>c__DisplayClass2_0::key
IL_0045: box ItemDrop/ItemData/ItemType
IL_004a: call System.String System.String::Format(System.String,System.Object)
IL_004f: ldloc.3
IL_0050: ldfld System.Int32 Vector2i::x
IL_0055: conv.r4
IL_0056: ldloc.3
IL_0057: ldfld System.Int32 Vector2i::y
IL_005c: conv.r4
IL_005d: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_0062: ldstr "The inventory slot position for {0} items when equipped.
Integer values only.  Set to -1 to disable.
Be careful that every slot is assigned to a different grid position."
IL_0067: ldloc.2
IL_0068: ldfld ItemDrop/ItemData/ItemType ZenUI.Section.InventoryEquip/<>c__DisplayClass2_0::key
IL_006d: box ItemDrop/ItemData/ItemType
IL_0072: call System.String System.String::Format(System.String,System.Object)
IL_0077: call BepInEx.Configuration.ConfigEntry`1<!!0> Zen.Lib.Config.Config::Define<UnityEngine.Vector2>(System.Boolean,System.String,System.String,!!0,System.String)
IL_007c: stfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Vector2> ZenUI.Section.InventoryEquip/<>c__DisplayClass2_0::config
IL_0081: ldsfld System.Collections.Generic.Dictionary`2<ItemDrop/ItemData/ItemType,Vector2i> ZenUI.Section.InventoryEquip::SlotPositionsByType
IL_0086: ldloc.2
IL_0087: ldfld ItemDrop/ItemData/ItemType ZenUI.Section.InventoryEquip/<>c__DisplayClass2_0::key
IL_008c: ldloc.2
IL_008d: ldfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Vector2> ZenUI.Section.InventoryEquip/<>c__DisplayClass2_0::config
IL_0092: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Vector2>::get_Value()
IL_0097: newobj System.Void Vector2i::.ctor(UnityEngine.Vector2)
IL_009c: callvirt System.Void System.Collections.Generic.Dictionary`2<ItemDrop/ItemData/ItemType,Vector2i>::set_Item(!0,!1)
IL_00a1: ldloc.2
IL_00a2: ldfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Vector2> ZenUI.Section.InventoryEquip/<>c__DisplayClass2_0::config
IL_00a7: ldloc.2
IL_00a8: ldftn System.Void ZenUI.Section.InventoryEquip/<>c__DisplayClass2_0::<InitConfigs>b__0(System.Object,System.EventArgs)
IL_00ae: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_00b3: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<UnityEngine.Vector2>::add_SettingChanged(System.EventHandler)
IL_00b8: ldloc.1
IL_00b9: ldc.i4.1
IL_00ba: add
IL_00bb: stloc.1
IL_00bc: ldloc.1
IL_00bd: ldloc.0
IL_00be: ldlen
IL_00bf: conv.i4
IL_00c0: blt IL_0017
IL_00c5: ret

// System.Void ZenUI.Section.InventoryEquip::MoveToConfigPosition(ItemDrop/ItemData)
.locals Vector2i, Inventory, ItemDrop/ItemData
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<ItemDrop/ItemData/ItemType,Vector2i> ZenUI.Section.InventoryEquip::SlotPositionsByType
IL_0005: ldarg.0
IL_0006: call ItemDrop/ItemData/ItemType Zen.Lib.ItemDataExt::GetItemType(ItemDrop/ItemData)
IL_000b: ldloca.s V_0
IL_000d: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ItemDrop/ItemData/ItemType,Vector2i>::TryGetValue(!0,!1&)
IL_0012: brtrue.s IL_0015
IL_0014: ret
IL_0015: ldsfld Player Player::m_localPlayer
IL_001a: callvirt Inventory Humanoid::GetInventory()
IL_001f: stloc.1
IL_0020: ldloc.1
IL_0021: ldarg.0
IL_0022: callvirt System.Boolean Inventory::ContainsItem(ItemDrop/ItemData)
IL_0027: brtrue.s IL_002a
IL_0029: ret
IL_002a: ldloc.0
IL_002b: ldfld System.Int32 Vector2i::x
IL_0030: ldc.i4.0
IL_0031: blt.s IL_005c
IL_0033: ldloc.0
IL_0034: ldfld System.Int32 Vector2i::x
IL_0039: ldloc.1
IL_003a: ldfld System.Int32 Inventory::m_width
IL_003f: ldc.i4.1
IL_0040: sub
IL_0041: bgt.s IL_005c
IL_0043: ldloc.0
IL_0044: ldfld System.Int32 Vector2i::y
IL_0049: ldc.i4.0
IL_004a: blt.s IL_005c
IL_004c: ldloc.0
IL_004d: ldfld System.Int32 Vector2i::y
IL_0052: ldloc.1
IL_0053: ldfld System.Int32 Inventory::m_height
IL_0058: ldc.i4.1
IL_0059: sub
IL_005a: ble.s IL_005d
IL_005c: ret
IL_005d: ldloc.1
IL_005e: ldloc.0
IL_005f: ldfld System.Int32 Vector2i::x
IL_0064: ldloc.0
IL_0065: ldfld System.Int32 Vector2i::y
IL_006a: callvirt ItemDrop/ItemData Inventory::GetItemAt(System.Int32,System.Int32)
IL_006f: stloc.2
IL_0070: ldloc.2
IL_0071: brfalse.s IL_007b
IL_0073: ldarg.0
IL_0074: ldloc.2
IL_0075: call System.Void ZenUI.Section.InventoryEquip::SwapPosition(ItemDrop/ItemData,ItemDrop/ItemData)
IL_007a: ret
IL_007b: ldarg.0
IL_007c: ldloc.0
IL_007d: stfld Vector2i ItemDrop/ItemData::m_gridPos
IL_0082: ret

// System.Void ZenUI.Section.InventoryEquip::SwapPosition(ItemDrop/ItemData,ItemDrop/ItemData)
.locals Vector2i, Vector2i
IL_0000: ldarg.1
IL_0001: ldfld Vector2i ItemDrop/ItemData::m_gridPos
IL_0006: stloc.0
IL_0007: ldarg.0
IL_0008: ldfld Vector2i ItemDrop/ItemData::m_gridPos
IL_000d: stloc.1
IL_000e: ldarg.1
IL_000f: ldloc.1
IL_0010: stfld Vector2i ItemDrop/ItemData::m_gridPos
IL_0015: ldarg.0
IL_0016: ldloc.0
IL_0017: stfld Vector2i ItemDrop/ItemData::m_gridPos
IL_001c: ret

// System.Void ZenUI.Section.InventoryEquip::Humanoid_EquipItem(Humanoid,ItemDrop/ItemData,System.Boolean&)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::AssignedGearSlots
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: ldsfld Player Player::m_localPlayer
IL_0012: ldarg.0
IL_0013: call System.Boolean Zen.Lib.PlayerExt::Is(Player,Character)
IL_0018: brtrue.s IL_001b
IL_001a: ret
IL_001b: ldsfld System.Boolean ZenUI.Section.InventoryEquip::_autoReposition
IL_0020: brfalse.s IL_0028
IL_0022: ldarg.1
IL_0023: call System.Void ZenUI.Section.InventoryEquip::MoveToConfigPosition(ItemDrop/ItemData)
IL_0028: ret

// System.Void ZenUI.Section.InventoryEquip::InventoryGui_OnSelectedItem(InventoryGui)
.locals 
IL_0000: ldc.i4.1
IL_0001: stsfld System.Boolean ZenUI.Section.InventoryEquip::_autoReposition
IL_0006: ret

// System.Void ZenUI.Section.InventoryEquip::InventoryGrid_DropItem(InventoryGrid)
.locals 
IL_0000: ldc.i4.0
IL_0001: stsfld System.Boolean ZenUI.Section.InventoryEquip::_autoReposition
IL_0006: ret

// System.Void ZenUI.Section.InventoryEquip::.cctor()
.locals 
IL_0000: ldc.i4.1
IL_0001: stsfld System.Boolean ZenUI.Section.InventoryEquip::_autoReposition
IL_0006: newobj System.Void System.Collections.Generic.Dictionary`2<ItemDrop/ItemData/ItemType,Vector2i>::.ctor()
IL_000b: dup
IL_000c: ldc.i4.6
IL_000d: ldc.i4.0
IL_000e: ldc.i4.1
IL_000f: newobj System.Void Vector2i::.ctor(System.Int32,System.Int32)
IL_0014: callvirt System.Void System.Collections.Generic.Dictionary`2<ItemDrop/ItemData/ItemType,Vector2i>::Add(!0,!1)
IL_0019: dup
IL_001a: ldc.i4.7
IL_001b: ldc.i4.0
IL_001c: ldc.i4.2
IL_001d: newobj System.Void Vector2i::.ctor(System.Int32,System.Int32)
IL_0022: callvirt System.Void System.Collections.Generic.Dictionary`2<ItemDrop/ItemData/ItemType,Vector2i>::Add(!0,!1)
IL_0027: dup
IL_0028: ldc.i4.s 11
IL_002a: ldc.i4.0
IL_002b: ldc.i4.3
IL_002c: newobj System.Void Vector2i::.ctor(System.Int32,System.Int32)
IL_0031: callvirt System.Void System.Collections.Generic.Dictionary`2<ItemDrop/ItemData/ItemType,Vector2i>::Add(!0,!1)
IL_0036: dup
IL_0037: ldc.i4.s 17
IL_0039: ldc.i4.1
IL_003a: ldc.i4.1
IL_003b: newobj System.Void Vector2i::.ctor(System.Int32,System.Int32)
IL_0040: callvirt System.Void System.Collections.Generic.Dictionary`2<ItemDrop/ItemData/ItemType,Vector2i>::Add(!0,!1)
IL_0045: dup
IL_0046: ldc.i4.s 18
IL_0048: ldc.i4.1
IL_0049: ldc.i4.2
IL_004a: newobj System.Void Vector2i::.ctor(System.Int32,System.Int32)
IL_004f: callvirt System.Void System.Collections.Generic.Dictionary`2<ItemDrop/ItemData/ItemType,Vector2i>::Add(!0,!1)
IL_0054: dup
IL_0055: ldc.i4.s 24
IL_0057: ldc.i4.1
IL_0058: ldc.i4.3
IL_0059: newobj System.Void Vector2i::.ctor(System.Int32,System.Int32)
IL_005e: callvirt System.Void System.Collections.Generic.Dictionary`2<ItemDrop/ItemData/ItemType,Vector2i>::Add(!0,!1)
IL_0063: dup
IL_0064: ldc.i4.s 15
IL_0066: ldc.i4.m1
IL_0067: ldc.i4.m1
IL_0068: newobj System.Void Vector2i::.ctor(System.Int32,System.Int32)
IL_006d: callvirt System.Void System.Collections.Generic.Dictionary`2<ItemDrop/ItemData/ItemType,Vector2i>::Add(!0,!1)
IL_0072: dup
IL_0073: ldc.i4.s 9
IL_0075: ldc.i4.m1
IL_0076: ldc.i4.m1
IL_0077: newobj System.Void Vector2i::.ctor(System.Int32,System.Int32)
IL_007c: callvirt System.Void System.Collections.Generic.Dictionary`2<ItemDrop/ItemData/ItemType,Vector2i>::Add(!0,!1)
IL_0081: dup
IL_0082: ldc.i4.5
IL_0083: ldc.i4.m1
IL_0084: ldc.i4.m1
IL_0085: newobj System.Void Vector2i::.ctor(System.Int32,System.Int32)
IL_008a: callvirt System.Void System.Collections.Generic.Dictionary`2<ItemDrop/ItemData/ItemType,Vector2i>::Add(!0,!1)
IL_008f: stsfld System.Collections.Generic.Dictionary`2<ItemDrop/ItemData/ItemType,Vector2i> ZenUI.Section.InventoryEquip::SlotPositionsByType
IL_0094: ret

// System.Void ZenUI.Section.InventoryEquip/<>c__DisplayClass2_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void ZenUI.Section.InventoryEquip/<>c__DisplayClass2_0::<InitConfigs>b__0(System.Object,System.EventArgs)
.locals 
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<ItemDrop/ItemData/ItemType,Vector2i> ZenUI.Section.InventoryEquip::SlotPositionsByType
IL_0005: ldarg.0
IL_0006: ldfld ItemDrop/ItemData/ItemType ZenUI.Section.InventoryEquip/<>c__DisplayClass2_0::key
IL_000b: ldarg.0
IL_000c: ldfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Vector2> ZenUI.Section.InventoryEquip/<>c__DisplayClass2_0::config
IL_0011: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Vector2>::get_Value()
IL_0016: newobj System.Void Vector2i::.ctor(UnityEngine.Vector2)
IL_001b: callvirt System.Void System.Collections.Generic.Dictionary`2<ItemDrop/ItemData/ItemType,Vector2i>::set_Item(!0,!1)
IL_0020: ret

// System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> ZenUI.Section.InventoryRules::Inventory_StackAll_Transpile(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>)
.locals System.Reflection.MethodInfo, System.Func`2<Inventory,System.Collections.Generic.List`1<ItemDrop/ItemData>>
IL_0000: ldtoken Inventory
IL_0005: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_000a: ldstr "GetAllItems"
IL_000f: call !!0[] System.Array::Empty<System.Type>()
IL_0014: ldnull
IL_0015: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_001a: stloc.0
IL_001b: ldsfld System.Func`2<Inventory,System.Collections.Generic.List`1<ItemDrop/ItemData>> ZenUI.Section.InventoryRules/<>O::<0>__GetAllItemsIntercept
IL_0020: dup
IL_0021: brtrue.s IL_0036
IL_0023: pop
IL_0024: ldnull
IL_0025: ldftn System.Collections.Generic.List`1<ItemDrop/ItemData> ZenUI.Section.InventoryRules::<Inventory_StackAll_Transpile>g__GetAllItemsIntercept|1_0(Inventory)
IL_002b: newobj System.Void System.Func`2<Inventory,System.Collections.Generic.List`1<ItemDrop/ItemData>>::.ctor(System.Object,System.IntPtr)
IL_0030: dup
IL_0031: stsfld System.Func`2<Inventory,System.Collections.Generic.List`1<ItemDrop/ItemData>> ZenUI.Section.InventoryRules/<>O::<0>__GetAllItemsIntercept
IL_0036: stloc.1
IL_0037: ldarg.0
IL_0038: ldloc.0
IL_0039: ldloc.1
IL_003a: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_003f: call System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> HarmonyLib.Transpilers::MethodReplacer(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>,System.Reflection.MethodBase,System.Reflection.MethodBase)
IL_0044: ret

// System.Void ZenUI.Section.InventoryRules::Inventory_StackAll_Prefix(Inventory)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::StackingCombineExisting
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse.s IL_0012
IL_000c: ldarg.0
IL_000d: call System.Void ZenUI.Section.InventoryRules::CombineStacks(Inventory)
IL_0012: ret

// System.Void ZenUI.Section.InventoryRules::CombineStacks(Inventory)
.locals ZenUI.Section.InventoryRules/<>c__DisplayClass3_0, System.Collections.Generic.IEnumerator`1<System.ValueTuple`2<ItemDrop/ItemData,System.Int32>>, ItemDrop/ItemData, System.Int32
IL_0000: ldloca.s V_0
IL_0002: ldarg.0
IL_0003: callvirt System.Collections.Generic.List`1<ItemDrop/ItemData> Inventory::GetAllItems()
IL_0008: ldsfld System.Func`2<ItemDrop/ItemData,System.Int32> ZenUI.Section.InventoryRules/<>c::<>9__3_0
IL_000d: dup
IL_000e: brtrue.s IL_0027
IL_0010: pop
IL_0011: ldsfld ZenUI.Section.InventoryRules/<>c ZenUI.Section.InventoryRules/<>c::<>9
IL_0016: ldftn System.Int32 ZenUI.Section.InventoryRules/<>c::<CombineStacks>b__3_0(ItemDrop/ItemData)
IL_001c: newobj System.Void System.Func`2<ItemDrop/ItemData,System.Int32>::.ctor(System.Object,System.IntPtr)
IL_0021: dup
IL_0022: stsfld System.Func`2<ItemDrop/ItemData,System.Int32> ZenUI.Section.InventoryRules/<>c::<>9__3_0
IL_0027: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::OrderByDescending<ItemDrop/ItemData,System.Int32>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_002c: ldsfld System.Func`2<ItemDrop/ItemData,System.Int32> ZenUI.Section.InventoryRules/<>c::<>9__3_1
IL_0031: dup
IL_0032: brtrue.s IL_004b
IL_0034: pop
IL_0035: ldsfld ZenUI.Section.InventoryRules/<>c ZenUI.Section.InventoryRules/<>c::<>9
IL_003a: ldftn System.Int32 ZenUI.Section.InventoryRules/<>c::<CombineStacks>b__3_1(ItemDrop/ItemData)
IL_0040: newobj System.Void System.Func`2<ItemDrop/ItemData,System.Int32>::.ctor(System.Object,System.IntPtr)
IL_0045: dup
IL_0046: stsfld System.Func`2<ItemDrop/ItemData,System.Int32> ZenUI.Section.InventoryRules/<>c::<>9__3_1
IL_004b: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::ThenBy<ItemDrop/ItemData,System.Int32>(System.Linq.IOrderedEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_0050: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<ItemDrop/ItemData>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0055: stfld System.Collections.Generic.List`1<ItemDrop/ItemData> ZenUI.Section.InventoryRules/<>c__DisplayClass3_0::allItems
IL_005a: ldloc.0
IL_005b: ldfld System.Collections.Generic.List`1<ItemDrop/ItemData> ZenUI.Section.InventoryRules/<>c__DisplayClass3_0::allItems
IL_0060: call System.Collections.Generic.IEnumerable`1<System.ValueTuple`2<!!0,System.Int32>> Zen.Lib.IEnumerableExt::WithIndex<ItemDrop/ItemData>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0065: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<System.ValueTuple`2<ItemDrop/ItemData,System.Int32>>::GetEnumerator()
IL_006a: stloc.1
IL_006b: br.s IL_0089
IL_006d: ldloc.1
IL_006e: callvirt !0 System.Collections.Generic.IEnumerator`1<System.ValueTuple`2<ItemDrop/ItemData,System.Int32>>::get_Current()
IL_0073: dup
IL_0074: ldfld !0 System.ValueTuple`2<ItemDrop/ItemData,System.Int32>::Item1
IL_0079: stloc.2
IL_007a: ldfld !1 System.ValueTuple`2<ItemDrop/ItemData,System.Int32>::Item2
IL_007f: stloc.3
IL_0080: ldloc.2
IL_0081: ldloc.3
IL_0082: ldloca.s V_0
IL_0084: call System.Void ZenUI.Section.InventoryRules::<CombineStacks>g__FillItem|3_3(ItemDrop/ItemData,System.Int32,ZenUI.Section.InventoryRules/<>c__DisplayClass3_0&)
IL_0089: ldloc.1
IL_008a: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_008f: brtrue.s IL_006d
IL_0091: leave.s IL_009d
IL_0093: ldloc.1
IL_0094: brfalse.s IL_009c
IL_0096: ldloc.1
IL_0097: callvirt System.Void System.IDisposable::Dispose()
IL_009c: endfinally
IL_009d: ldarg.0
IL_009e: callvirt System.Collections.Generic.List`1<ItemDrop/ItemData> Inventory::GetAllItems()
IL_00a3: ldsfld System.Predicate`1<ItemDrop/ItemData> ZenUI.Section.InventoryRules/<>c::<>9__3_2
IL_00a8: dup
IL_00a9: brtrue.s IL_00c2
IL_00ab: pop
IL_00ac: ldsfld ZenUI.Section.InventoryRules/<>c ZenUI.Section.InventoryRules/<>c::<>9
IL_00b1: ldftn System.Boolean ZenUI.Section.InventoryRules/<>c::<CombineStacks>b__3_2(ItemDrop/ItemData)
IL_00b7: newobj System.Void System.Predicate`1<ItemDrop/ItemData>::.ctor(System.Object,System.IntPtr)
IL_00bc: dup
IL_00bd: stsfld System.Predicate`1<ItemDrop/ItemData> ZenUI.Section.InventoryRules/<>c::<>9__3_2
IL_00c2: callvirt System.Int32 System.Collections.Generic.List`1<ItemDrop/ItemData>::RemoveAll(System.Predicate`1<!0>)
IL_00c7: pop
IL_00c8: ret
// EH Finally: 107 - 147 => 147 - 157

// System.Void ZenUI.Section.InventoryRules::Inventory_RemoveItem(Inventory)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::RemoveItemFromSmallestStack
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse.s IL_0036
IL_000c: ldarg.0
IL_000d: ldfld System.Collections.Generic.List`1<ItemDrop/ItemData> Inventory::m_inventory
IL_0012: ldsfld System.Comparison`1<ItemDrop/ItemData> ZenUI.Section.InventoryRules/<>c::<>9__4_0
IL_0017: dup
IL_0018: brtrue.s IL_0031
IL_001a: pop
IL_001b: ldsfld ZenUI.Section.InventoryRules/<>c ZenUI.Section.InventoryRules/<>c::<>9
IL_0020: ldftn System.Int32 ZenUI.Section.InventoryRules/<>c::<Inventory_RemoveItem>b__4_0(ItemDrop/ItemData,ItemDrop/ItemData)
IL_0026: newobj System.Void System.Comparison`1<ItemDrop/ItemData>::.ctor(System.Object,System.IntPtr)
IL_002b: dup
IL_002c: stsfld System.Comparison`1<ItemDrop/ItemData> ZenUI.Section.InventoryRules/<>c::<>9__4_0
IL_0031: callvirt System.Void System.Collections.Generic.List`1<ItemDrop/ItemData>::Sort(System.Comparison`1<!0>)
IL_0036: ret

// System.Void ZenUI.Section.InventoryRules::Humanoid_DropItem(Humanoid)
.locals Player, UnityEngine.Transform, ZenUI.Section.InventoryRules/DropStyle, UnityEngine.Vector3
IL_0000: ldarg.0
IL_0001: isinst Player
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: ldsfld Player Player::m_localPlayer
IL_000d: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0012: brfalse.s IL_0015
IL_0014: ret
IL_0015: ldsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.Section.InventoryRules/DropStyle> ZenUI.Configs::DiscardStyle
IL_001a: callvirt !0 BepInEx.Configuration.ConfigEntry`1<ZenUI.Section.InventoryRules/DropStyle>::get_Value()
IL_001f: stloc.2
IL_0020: ldloc.2
IL_0021: brfalse.s IL_006f
IL_0023: ldloc.2
IL_0024: ldc.i4.1
IL_0025: bne.un.s IL_0069
IL_0027: ldloc.0
IL_0028: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_002d: stloc.1
IL_002e: ldloc.1
IL_002f: call GameCamera GameCamera::get_instance()
IL_0034: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0039: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_forward()
IL_003e: stloc.3
IL_003f: ldloca.s V_3
IL_0041: ldc.r4 0
IL_0046: stfld System.Single UnityEngine.Vector3::y
IL_004b: ldloc.3
IL_004c: callvirt System.Void UnityEngine.Transform::set_forward(UnityEngine.Vector3)
IL_0051: ldloc.0
IL_0052: ldloc.1
IL_0053: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_forward()
IL_0058: ldc.r4 0
IL_005d: callvirt System.Void Character::SetLookDir(UnityEngine.Vector3,System.Single)
IL_0062: ldloc.0
IL_0063: callvirt System.Void Player::FaceLookDirection()
IL_0068: ret
IL_0069: newobj System.Void System.ArgumentOutOfRangeException::.ctor()
IL_006e: throw
IL_006f: ret

// System.Void ZenUI.Section.InventoryRules::Game_SpawnPlayer(Game,Player)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld PlayerProfile Game::m_playerProfile
IL_0006: ldfld System.Boolean PlayerProfile::m_firstSpawn
IL_000b: brtrue.s IL_000e
IL_000d: ret
IL_000e: ldstr "Init new players to have config defined starting gear"
IL_0013: ldc.i4.0
IL_0014: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_0019: ldarg.1
IL_001a: callvirt System.Void Humanoid::UnequipAllItems()
IL_001f: ldarg.1
IL_0020: callvirt Inventory Humanoid::GetInventory()
IL_0025: callvirt System.Void Inventory::RemoveAll()
IL_002a: ldarg.1
IL_002b: callvirt System.Void Humanoid::GiveDefaultItems()
IL_0030: ret

// System.Void ZenUI.Section.InventoryRules::Player_OnSpawned(Player)
.locals System.Int32
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ZenUI.Configs::InventoryRowsDefault
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_000a: stloc.0
IL_000b: ldloc.0
IL_000c: ldc.i4.m1
IL_000d: bne.un.s IL_0010
IL_000f: ret
IL_0010: ldarg.0
IL_0011: ldstr "invrows"
IL_0016: call System.Boolean Zen.Lib.PlayerExt::HaveUniqueKeyValueAny(Player,System.String)
IL_001b: brfalse.s IL_0042
IL_001d: ldstr "Ignoring config "
IL_0022: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ZenUI.Configs::InventoryRowsDefault
IL_0027: callvirt BepInEx.Configuration.ConfigDefinition BepInEx.Configuration.ConfigEntryBase::get_Definition()
IL_002c: callvirt System.String BepInEx.Configuration.ConfigDefinition::get_Key()
IL_0031: ldstr ", key already exists: invrows"
IL_0036: call System.String System.String::Concat(System.String,System.String,System.String)
IL_003b: ldc.i4.0
IL_003c: call System.Void Zen.Logging`1<ZenUI.Plugin>::Message(System.Object,System.Int32)
IL_0041: ret
IL_0042: ldstr "Set default inventory rows: {0}"
IL_0047: ldloc.0
IL_0048: box System.Int32
IL_004d: call System.String System.String::Format(System.String,System.Object)
IL_0052: ldc.i4.0
IL_0053: call System.Void Zen.Logging`1<ZenUI.Plugin>::Message(System.Object,System.Int32)
IL_0058: ldarg.0
IL_0059: ldstr "invrows"
IL_005e: ldloc.0
IL_005f: ldc.i4.1
IL_0060: add
IL_0061: call System.Void Zen.Lib.PlayerExt::AddUniqueKeyValue(Player,System.String,System.Int32)
IL_0066: ret

// System.Collections.Generic.List`1<ItemDrop/ItemData> ZenUI.Section.InventoryRules::<Inventory_StackAll_Transpile>g__GetAllItemsIntercept|1_0(Inventory)
.locals ZenUI.Section.InventoryRules/<>c__DisplayClass1_0
IL_0000: newobj System.Void ZenUI.Section.InventoryRules/<>c__DisplayClass1_0::.ctor()
IL_0005: stloc.0
IL_0006: ldsfld Player Player::m_localPlayer
IL_000b: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0010: brfalse.s IL_0021
IL_0012: ldsfld Player Player::m_localPlayer
IL_0017: callvirt Inventory Humanoid::GetInventory()
IL_001c: ldarg.0
IL_001d: ceq
IL_001f: br.s IL_0022
IL_0021: ldc.i4.0
IL_0022: brtrue.s IL_002b
IL_0024: ldarg.0
IL_0025: callvirt System.Collections.Generic.List`1<ItemDrop/ItemData> Inventory::GetAllItems()
IL_002a: ret
IL_002b: ldloc.0
IL_002c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::StackingExcludeHotbar
IL_0031: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0036: brtrue.s IL_003b
IL_0038: ldc.i4.m1
IL_0039: br.s IL_003c
IL_003b: ldc.i4.0
IL_003c: stfld System.Int32 ZenUI.Section.InventoryRules/<>c__DisplayClass1_0::hotbarRow
IL_0041: ldloc.0
IL_0042: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::StackingExcludeEquipable
IL_0047: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_004c: stfld System.Boolean ZenUI.Section.InventoryRules/<>c__DisplayClass1_0::excludeEquip
IL_0051: ldarg.0
IL_0052: callvirt System.Collections.Generic.List`1<ItemDrop/ItemData> Inventory::GetAllItems()
IL_0057: ldloc.0
IL_0058: ldftn System.Boolean ZenUI.Section.InventoryRules/<>c__DisplayClass1_0::<Inventory_StackAll_Transpile>g__ExcludeHotbar|1(ItemDrop/ItemData)
IL_005e: newobj System.Void System.Func`2<ItemDrop/ItemData,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0063: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ItemDrop/ItemData>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0068: ldloc.0
IL_0069: ldftn System.Boolean ZenUI.Section.InventoryRules/<>c__DisplayClass1_0::<Inventory_StackAll_Transpile>g__ExcludeEquipable|2(ItemDrop/ItemData)
IL_006f: newobj System.Void System.Func`2<ItemDrop/ItemData,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0074: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ItemDrop/ItemData>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0079: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<ItemDrop/ItemData>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_007e: ret

// System.Void ZenUI.Section.InventoryRules::<CombineStacks>g__FillItem|3_3(ItemDrop/ItemData,System.Int32,ZenUI.Section.InventoryRules/<>c__DisplayClass3_0&)
.locals System.Int32, ItemDrop/ItemData, System.Int32
IL_0000: ldarg.0
IL_0001: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0006: ldfld System.Int32 ItemDrop/ItemData/SharedData::m_maxStackSize
IL_000b: ldc.i4.1
IL_000c: bgt.s IL_000f
IL_000e: ret
IL_000f: ldarg.1
IL_0010: ldc.i4.1
IL_0011: add
IL_0012: stloc.0
IL_0013: br.s IL_005f
IL_0015: ldarg.0
IL_0016: ldloc.0
IL_0017: ldarg.2
IL_0018: call ItemDrop/ItemData ZenUI.Section.InventoryRules::<CombineStacks>g__FindNextStack|3_4(ItemDrop/ItemData,System.Int32,ZenUI.Section.InventoryRules/<>c__DisplayClass3_0&)
IL_001d: stloc.1
IL_001e: ldloc.1
IL_001f: brfalse.s IL_0072
IL_0021: ldarg.0
IL_0022: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0027: ldfld System.Int32 ItemDrop/ItemData/SharedData::m_maxStackSize
IL_002c: ldarg.0
IL_002d: ldfld System.Int32 ItemDrop/ItemData::m_stack
IL_0032: sub
IL_0033: ldloc.1
IL_0034: ldfld System.Int32 ItemDrop/ItemData::m_stack
IL_0039: call System.Int32 System.Math::Min(System.Int32,System.Int32)
IL_003e: stloc.2
IL_003f: ldarg.0
IL_0040: dup
IL_0041: ldfld System.Int32 ItemDrop/ItemData::m_stack
IL_0046: ldloc.2
IL_0047: add
IL_0048: stfld System.Int32 ItemDrop/ItemData::m_stack
IL_004d: ldloc.1
IL_004e: dup
IL_004f: ldfld System.Int32 ItemDrop/ItemData::m_stack
IL_0054: ldloc.2
IL_0055: sub
IL_0056: stfld System.Int32 ItemDrop/ItemData::m_stack
IL_005b: ldloc.0
IL_005c: ldc.i4.1
IL_005d: add
IL_005e: stloc.0
IL_005f: ldarg.0
IL_0060: ldfld System.Int32 ItemDrop/ItemData::m_stack
IL_0065: ldarg.0
IL_0066: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_006b: ldfld System.Int32 ItemDrop/ItemData/SharedData::m_maxStackSize
IL_0070: blt.s IL_0015
IL_0072: ret

// ItemDrop/ItemData ZenUI.Section.InventoryRules::<CombineStacks>g__FindNextStack|3_4(ItemDrop/ItemData,System.Int32,ZenUI.Section.InventoryRules/<>c__DisplayClass3_0&)
.locals System.Int32, ItemDrop/ItemData
IL_0000: ldarg.1
IL_0001: stloc.0
IL_0002: br.s IL_0059
IL_0004: ldarg.2
IL_0005: ldfld System.Collections.Generic.List`1<ItemDrop/ItemData> ZenUI.Section.InventoryRules/<>c__DisplayClass3_0::allItems
IL_000a: ldloc.0
IL_000b: callvirt !0 System.Collections.Generic.List`1<ItemDrop/ItemData>::get_Item(System.Int32)
IL_0010: stloc.1
IL_0011: ldloc.1
IL_0012: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0017: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_001c: ldarg.0
IL_001d: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0022: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_0027: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_002c: brfalse.s IL_0055
IL_002e: ldloc.1
IL_002f: ldfld System.Int32 ItemDrop/ItemData::m_quality
IL_0034: ldarg.0
IL_0035: ldfld System.Int32 ItemDrop/ItemData::m_quality
IL_003a: bne.un.s IL_0055
IL_003c: ldloc.1
IL_003d: ldfld System.Int32 ItemDrop/ItemData::m_worldLevel
IL_0042: ldarg.0
IL_0043: ldfld System.Int32 ItemDrop/ItemData::m_worldLevel
IL_0048: bne.un.s IL_0055
IL_004a: ldloc.1
IL_004b: ldfld System.Int32 ItemDrop/ItemData::m_stack
IL_0050: ldc.i4.0
IL_0051: ble.s IL_0055
IL_0053: ldloc.1
IL_0054: ret
IL_0055: ldloc.0
IL_0056: ldc.i4.1
IL_0057: add
IL_0058: stloc.0
IL_0059: ldloc.0
IL_005a: ldarg.2
IL_005b: ldfld System.Collections.Generic.List`1<ItemDrop/ItemData> ZenUI.Section.InventoryRules/<>c__DisplayClass3_0::allItems
IL_0060: callvirt System.Int32 System.Collections.Generic.List`1<ItemDrop/ItemData>::get_Count()
IL_0065: blt.s IL_0004
IL_0067: ldnull
IL_0068: ret

// System.Void ZenUI.Section.InventoryRules/<>c::.cctor()
.locals 
IL_0000: newobj System.Void ZenUI.Section.InventoryRules/<>c::.ctor()
IL_0005: stsfld ZenUI.Section.InventoryRules/<>c ZenUI.Section.InventoryRules/<>c::<>9
IL_000a: ret

// System.Void ZenUI.Section.InventoryRules/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Int32 ZenUI.Section.InventoryRules/<>c::<CombineStacks>b__3_0(ItemDrop/ItemData)
.locals 
IL_0000: ldarg.1
IL_0001: ldflda Vector2i ItemDrop/ItemData::m_gridPos
IL_0006: ldfld System.Int32 Vector2i::y
IL_000b: ret

// System.Int32 ZenUI.Section.InventoryRules/<>c::<CombineStacks>b__3_1(ItemDrop/ItemData)
.locals 
IL_0000: ldarg.1
IL_0001: ldflda Vector2i ItemDrop/ItemData::m_gridPos
IL_0006: ldfld System.Int32 Vector2i::x
IL_000b: ret

// System.Boolean ZenUI.Section.InventoryRules/<>c::<CombineStacks>b__3_2(ItemDrop/ItemData)
.locals 
IL_0000: ldarg.1
IL_0001: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0006: ldfld System.Int32 ItemDrop/ItemData/SharedData::m_maxStackSize
IL_000b: ldc.i4.1
IL_000c: ble.s IL_0018
IL_000e: ldarg.1
IL_000f: ldfld System.Int32 ItemDrop/ItemData::m_stack
IL_0014: ldc.i4.0
IL_0015: ceq
IL_0017: ret
IL_0018: ldc.i4.0
IL_0019: ret

// System.Int32 ZenUI.Section.InventoryRules/<>c::<Inventory_RemoveItem>b__4_0(ItemDrop/ItemData,ItemDrop/ItemData)
.locals 
IL_0000: ldarg.1
IL_0001: ldfld System.Int32 ItemDrop/ItemData::m_stack
IL_0006: ldarg.2
IL_0007: ldfld System.Int32 ItemDrop/ItemData::m_stack
IL_000c: sub
IL_000d: ret

// System.Void ZenUI.Section.InventoryRules/<>c__DisplayClass1_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean ZenUI.Section.InventoryRules/<>c__DisplayClass1_0::<Inventory_StackAll_Transpile>g__ExcludeHotbar|1(ItemDrop/ItemData)
.locals 
IL_0000: ldarg.1
IL_0001: ldflda Vector2i ItemDrop/ItemData::m_gridPos
IL_0006: ldfld System.Int32 Vector2i::y
IL_000b: ldarg.0
IL_000c: ldfld System.Int32 ZenUI.Section.InventoryRules/<>c__DisplayClass1_0::hotbarRow
IL_0011: cgt
IL_0013: ret

// System.Boolean ZenUI.Section.InventoryRules/<>c__DisplayClass1_0::<Inventory_StackAll_Transpile>g__ExcludeEquipable|2(ItemDrop/ItemData)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean ZenUI.Section.InventoryRules/<>c__DisplayClass1_0::excludeEquip
IL_0006: brfalse.s IL_0012
IL_0008: ldarg.1
IL_0009: callvirt System.Boolean ItemDrop/ItemData::IsEquipable()
IL_000e: ldc.i4.0
IL_000f: ceq
IL_0011: ret
IL_0012: ldc.i4.1
IL_0013: ret

// System.Collections.Generic.IEnumerable`1<System.Reflection.MethodInfo> ZenUI.Section.InventoryStackAmountText::TargetMethods()
.locals 
IL_0000: ldc.i4.2
IL_0001: newarr System.Reflection.MethodInfo
IL_0006: dup
IL_0007: ldc.i4.0
IL_0008: ldtoken HotkeyBar
IL_000d: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0012: ldstr "UpdateIcons"
IL_0017: ldnull
IL_0018: ldnull
IL_0019: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_001e: stelem.ref
IL_001f: dup
IL_0020: ldc.i4.1
IL_0021: ldtoken InventoryGrid
IL_0026: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_002b: ldstr "UpdateGui"
IL_0030: ldnull
IL_0031: ldnull
IL_0032: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_0037: stelem.ref
IL_0038: newobj System.Void <>z__ReadOnlyArray`1<System.Reflection.MethodInfo>::.ctor(T[])
IL_003d: ret

// System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> ZenUI.Section.InventoryStackAmountText::Transpiler(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>)
.locals System.Func`4<System.String,System.Object,System.Object,System.String>, HarmonyLib.CodeMatch[]
IL_0000: ldsfld System.Func`4<System.String,System.Object,System.Object,System.String> ZenUI.Section.InventoryStackAmountText/<>O::<0>__FormatIntercept
IL_0005: dup
IL_0006: brtrue.s IL_001b
IL_0008: pop
IL_0009: ldnull
IL_000a: ldftn System.String ZenUI.Section.InventoryStackAmountText::<Transpiler>g__FormatIntercept|2_0(System.String,System.Object,System.Object)
IL_0010: newobj System.Void System.Func`4<System.String,System.Object,System.Object,System.String>::.ctor(System.Object,System.IntPtr)
IL_0015: dup
IL_0016: stsfld System.Func`4<System.String,System.Object,System.Object,System.String> ZenUI.Section.InventoryStackAmountText/<>O::<0>__FormatIntercept
IL_001b: stloc.0
IL_001c: ldc.i4.3
IL_001d: newarr HarmonyLib.CodeMatch
IL_0022: dup
IL_0023: ldc.i4.0
IL_0024: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldfld
IL_0029: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_002e: ldtoken ItemDrop/ItemData/SharedData
IL_0033: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0038: ldstr "m_maxStackSize"
IL_003d: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_0042: ldnull
IL_0043: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0048: stelem.ref
IL_0049: dup
IL_004a: ldc.i4.1
IL_004b: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Box
IL_0050: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_0055: ldnull
IL_0056: ldnull
IL_0057: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_005c: stelem.ref
IL_005d: dup
IL_005e: ldc.i4.2
IL_005f: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_0064: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_0069: ldtoken System.String
IL_006e: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0073: ldstr "Format"
IL_0078: ldc.i4.3
IL_0079: newarr System.Type
IL_007e: dup
IL_007f: ldc.i4.0
IL_0080: ldtoken System.String
IL_0085: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_008a: stelem.ref
IL_008b: dup
IL_008c: ldc.i4.1
IL_008d: ldtoken System.Object
IL_0092: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0097: stelem.ref
IL_0098: dup
IL_0099: ldc.i4.2
IL_009a: ldtoken System.Object
IL_009f: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00a4: stelem.ref
IL_00a5: ldnull
IL_00a6: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_00ab: ldnull
IL_00ac: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_00b1: stelem.ref
IL_00b2: stloc.1
IL_00b3: ldarg.0
IL_00b4: ldnull
IL_00b5: newobj System.Void HarmonyLib.CodeMatcher::.ctor(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>,System.Reflection.Emit.ILGenerator)
IL_00ba: ldloc.1
IL_00bb: call HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::MatchEndForward(HarmonyLib.CodeMatch[])
IL_00c0: ldstr "Unable to match IL"
IL_00c5: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::ThrowIfInvalid(System.String)
IL_00ca: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_00cf: ldloc.0
IL_00d0: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_00d5: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Set(System.Reflection.Emit.OpCode,System.Object)
IL_00da: callvirt System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> HarmonyLib.CodeMatcher::InstructionEnumeration()
IL_00df: ret

// System.String ZenUI.Section.InventoryStackAmountText::<Transpiler>g__FormatIntercept|2_0(System.String,System.Object,System.Object)
.locals System.Int32, System.Int32, Zen.Lib.UIColor, System.Boolean, System.String, System.Boolean, System.Boolean, ZenUI.Section.InventoryStackAmountText/FormatStyle
IL_0000: ldarg.1
IL_0001: unbox.any System.Int32
IL_0006: stloc.0
IL_0007: ldarg.2
IL_0008: unbox.any System.Int32
IL_000d: stloc.1
IL_000e: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::White
IL_0013: stloc.2
IL_0014: ldc.i4.0
IL_0015: stloc.3
IL_0016: ldloc.0
IL_0017: ldc.i4.0
IL_0018: bgt.s IL_0022
IL_001a: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::Red
IL_001f: stloc.2
IL_0020: br.s IL_005a
IL_0022: ldloc.0
IL_0023: ldloc.1
IL_0024: ble.s IL_002e
IL_0026: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::Red
IL_002b: stloc.2
IL_002c: br.s IL_005a
IL_002e: ldloc.0
IL_002f: ldloc.1
IL_0030: bge.s IL_0044
IL_0032: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::ItemStackColorPartial
IL_0037: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_003c: call Zen.Lib.UIColor Zen.Lib.UIColor::op_Implicit(UnityEngine.Color)
IL_0041: stloc.2
IL_0042: br.s IL_005a
IL_0044: ldloc.0
IL_0045: ldloc.1
IL_0046: bne.un.s IL_005a
IL_0048: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::ItemStackColorFull
IL_004d: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_0052: call Zen.Lib.UIColor Zen.Lib.UIColor::op_Implicit(UnityEngine.Color)
IL_0057: stloc.2
IL_0058: ldc.i4.1
IL_0059: stloc.3
IL_005a: call System.Boolean ZenUI.Section.TooltipSummary::IsDetailKeyPressed()
IL_005f: stloc.s V_5
IL_0061: ldloc.s V_5
IL_0063: brtrue.s IL_00a2
IL_0065: ldsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.Section.InventoryStackAmountText/FormatStyle> ZenUI.Configs::ItemStackFormatStyle
IL_006a: callvirt !0 BepInEx.Configuration.ConfigEntry`1<ZenUI.Section.InventoryStackAmountText/FormatStyle>::get_Value()
IL_006f: stloc.s V_7
IL_0071: ldloc.s V_7
IL_0073: switch IL_0086,IL_008b,IL_0093
IL_0084: br.s IL_0098
IL_0086: ldc.i4.1
IL_0087: stloc.s V_6
IL_0089: br.s IL_009e
IL_008b: ldloc.3
IL_008c: ldc.i4.0
IL_008d: ceq
IL_008f: stloc.s V_6
IL_0091: br.s IL_009e
IL_0093: ldc.i4.0
IL_0094: stloc.s V_6
IL_0096: br.s IL_009e
IL_0098: newobj System.Void System.ArgumentOutOfRangeException::.ctor()
IL_009d: throw
IL_009e: ldloc.s V_6
IL_00a0: stloc.s V_5
IL_00a2: ldloc.s V_5
IL_00a4: brtrue.s IL_00af
IL_00a6: ldloca.s V_0
IL_00a8: call System.String System.Int32::ToString()
IL_00ad: br.s IL_00c5
IL_00af: ldstr "{0}/{1}"
IL_00b4: ldloc.0
IL_00b5: box System.Int32
IL_00ba: ldloc.1
IL_00bb: box System.Int32
IL_00c0: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_00c5: stloc.s V_4
IL_00c7: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::ItemStackColorApply
IL_00cc: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_00d1: brtrue.s IL_00d6
IL_00d3: ldloc.s V_4
IL_00d5: ret
IL_00d6: ldstr "<color={0}>{1}</color>"
IL_00db: ldloc.2
IL_00dc: ldloc.s V_4
IL_00de: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_00e3: ret

// System.Boolean ZenUI.Section.InventoryTakeAll::IsSameName(ItemDrop/ItemData,ItemDrop/ItemData)
.locals 
IL_0000: ldarg.0
IL_0001: call System.String Zen.Lib.ItemDataExt::GetPrefabName(ItemDrop/ItemData)
IL_0006: ldarg.1
IL_0007: call System.String Zen.Lib.ItemDataExt::GetPrefabName(ItemDrop/ItemData)
IL_000c: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0011: ret

// System.Void ZenUI.Section.InventoryTakeAll::Hud_Update()
.locals InventoryGui, Inventory, Inventory, System.String, System.String, ZenUI.Section.InventoryTakeAll/TakeMode
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::EnableTakeStacks
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: call InventoryGui InventoryGui::get_instance()
IL_0012: stloc.0
IL_0013: ldloc.0
IL_0014: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0019: brfalse.s IL_0028
IL_001b: ldloc.0
IL_001c: ldfld Container InventoryGui::m_currentContainer
IL_0021: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0026: brtrue.s IL_0029
IL_0028: ret
IL_0029: ldsfld Player Player::m_localPlayer
IL_002e: callvirt Inventory Humanoid::GetInventory()
IL_0033: stloc.1
IL_0034: ldloc.0
IL_0035: ldfld Container InventoryGui::m_currentContainer
IL_003a: callvirt Inventory Container::GetInventory()
IL_003f: stloc.2
IL_0040: ldloc.1
IL_0041: brfalse.s IL_0046
IL_0043: ldloc.2
IL_0044: brtrue.s IL_0047
IL_0046: ret
IL_0047: ldloc.1
IL_0048: ldloc.2
IL_0049: call ZenUI.Section.InventoryTakeAll/TakeMode ZenUI.Section.InventoryTakeAll::GetMoveMode(Inventory,Inventory)
IL_004e: stsfld ZenUI.Section.InventoryTakeAll/TakeMode ZenUI.Section.InventoryTakeAll::_takeMode
IL_0053: ldsfld ZenUI.Section.InventoryTakeAll/TakeMode ZenUI.Section.InventoryTakeAll::_takeMode
IL_0058: stloc.s V_5
IL_005a: ldloc.s V_5
IL_005c: switch IL_006f,IL_0078,IL_0081
IL_006d: br.s IL_008a
IL_006f: ldstr "$inventory_take_stacks"
IL_0074: stloc.s V_4
IL_0076: br.s IL_0090
IL_0078: ldstr "$inventory_take_weight"
IL_007d: stloc.s V_4
IL_007f: br.s IL_0090
IL_0081: ldstr "$inventory_takeall"
IL_0086: stloc.s V_4
IL_0088: br.s IL_0090
IL_008a: newobj System.Void System.ArgumentOutOfRangeException::.ctor()
IL_008f: throw
IL_0090: ldloc.s V_4
IL_0092: stloc.3
IL_0093: ldsfld TMPro.TMP_Text ZenUI.Section.InventoryTakeAll::_takeAllButtonLabel
IL_0098: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_009d: brtrue.s IL_00af
IL_009f: ldloc.0
IL_00a0: ldfld UnityEngine.UI.Button InventoryGui::m_takeAllButton
IL_00a5: callvirt !!0 UnityEngine.Component::GetComponentInChildren<TMPro.TMP_Text>()
IL_00aa: stsfld TMPro.TMP_Text ZenUI.Section.InventoryTakeAll::_takeAllButtonLabel
IL_00af: ldsfld TMPro.TMP_Text ZenUI.Section.InventoryTakeAll::_takeAllButtonLabel
IL_00b4: ldloc.3
IL_00b5: call System.String Zen.Lib.StringExt::Localize(System.String)
IL_00ba: callvirt System.Void TMPro.TMP_Text::set_text(System.String)
IL_00bf: ret

// System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> ZenUI.Section.InventoryTakeAll::InventoryGui_OnTakeAll_Transpiler(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>)
.locals System.Reflection.MethodInfo, System.Action`2<Inventory,Inventory>
IL_0000: ldtoken Inventory
IL_0005: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_000a: ldstr "MoveAll"
IL_000f: ldnull
IL_0010: ldnull
IL_0011: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_0016: stloc.0
IL_0017: ldsfld System.Action`2<Inventory,Inventory> ZenUI.Section.InventoryTakeAll/<>O::<0>__InventoryMoveAll_Intercept
IL_001c: dup
IL_001d: brtrue.s IL_0032
IL_001f: pop
IL_0020: ldnull
IL_0021: ldftn System.Void ZenUI.Section.InventoryTakeAll::InventoryMoveAll_Intercept(Inventory,Inventory)
IL_0027: newobj System.Void System.Action`2<Inventory,Inventory>::.ctor(System.Object,System.IntPtr)
IL_002c: dup
IL_002d: stsfld System.Action`2<Inventory,Inventory> ZenUI.Section.InventoryTakeAll/<>O::<0>__InventoryMoveAll_Intercept
IL_0032: stloc.1
IL_0033: ldarg.0
IL_0034: ldloc.0
IL_0035: ldloc.1
IL_0036: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_003b: call System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> HarmonyLib.Transpilers::MethodReplacer(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>,System.Reflection.MethodBase,System.Reflection.MethodBase)
IL_0040: ret

// System.Void ZenUI.Section.InventoryTakeAll::InventoryMoveAll_Intercept(Inventory,Inventory)
.locals Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean, ZenUI.Section.InventoryTakeAll/TakeMode
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::EnableTakeStacks
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_0013
IL_000c: ldarg.0
IL_000d: ldarg.1
IL_000e: call System.Void ZenUI.Section.InventoryTakeAll::TakeAll(Inventory,Inventory)
IL_0013: ldc.i4.s 11
IL_0015: ldc.i4.1
IL_0016: ldloca.s V_1
IL_0018: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_001d: stloc.0
IL_001e: ldloc.1
IL_001f: brfalse.s IL_0039
IL_0021: ldloca.s V_0
IL_0023: ldstr "Move mode: "
IL_0028: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_002d: ldloca.s V_0
IL_002f: ldsfld ZenUI.Section.InventoryTakeAll/TakeMode ZenUI.Section.InventoryTakeAll::_takeMode
IL_0034: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<ZenUI.Section.InventoryTakeAll/TakeMode>(!!0)
IL_0039: ldloc.0
IL_003a: ldc.i4.0
IL_003b: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_0040: ldsfld ZenUI.Section.InventoryTakeAll/TakeMode ZenUI.Section.InventoryTakeAll::_takeMode
IL_0045: stloc.2
IL_0046: ldloc.2
IL_0047: switch IL_005a,IL_0062,IL_006a
IL_0058: br.s IL_0072
IL_005a: ldarg.0
IL_005b: ldarg.1
IL_005c: call System.Void ZenUI.Section.InventoryTakeAll::TakeStacks(Inventory,Inventory)
IL_0061: ret
IL_0062: ldarg.0
IL_0063: ldarg.1
IL_0064: call System.Void ZenUI.Section.InventoryTakeAll::TakeWeightLimit(Inventory,Inventory)
IL_0069: ret
IL_006a: ldarg.0
IL_006b: ldarg.1
IL_006c: call System.Void ZenUI.Section.InventoryTakeAll::TakeAll(Inventory,Inventory)
IL_0071: ret
IL_0072: newobj System.Void System.ArgumentOutOfRangeException::.ctor()
IL_0077: throw

// ZenUI.Section.InventoryTakeAll/TakeMode ZenUI.Section.InventoryTakeAll::GetMoveMode(Inventory,Inventory)
.locals ZenUI.Section.InventoryTakeAll/<>c__DisplayClass7_0
IL_0000: ldloca.s V_0
IL_0002: ldarg.0
IL_0003: stfld Inventory ZenUI.Section.InventoryTakeAll/<>c__DisplayClass7_0::destInv
IL_0008: ldloca.s V_0
IL_000a: ldarg.1
IL_000b: stfld Inventory ZenUI.Section.InventoryTakeAll/<>c__DisplayClass7_0::sourceInv
IL_0010: ldloca.s V_0
IL_0012: call System.Boolean ZenUI.Section.InventoryTakeAll::<GetMoveMode>g__HasIncompleteStacks|7_0(ZenUI.Section.InventoryTakeAll/<>c__DisplayClass7_0&)
IL_0017: brtrue.s IL_0026
IL_0019: ldloca.s V_0
IL_001b: call System.Boolean ZenUI.Section.InventoryTakeAll::<GetMoveMode>g__CanCarryMore|7_1(ZenUI.Section.InventoryTakeAll/<>c__DisplayClass7_0&)
IL_0020: brtrue.s IL_0024
IL_0022: ldc.i4.2
IL_0023: ret
IL_0024: ldc.i4.1
IL_0025: ret
IL_0026: ldc.i4.0
IL_0027: ret

// System.Void ZenUI.Section.InventoryTakeAll::TakeStacks(Inventory,Inventory)
.locals System.Collections.Generic.IEnumerator`1<ItemDrop/ItemData>, ItemDrop/ItemData
IL_0000: ldstr "Fill stacks"
IL_0005: ldc.i4.0
IL_0006: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_000b: ldarg.0
IL_000c: ldarg.1
IL_000d: call System.Collections.Generic.IEnumerable`1<ItemDrop/ItemData> ZenUI.Section.InventoryTakeAll::GetIncompleteSourceStacks(Inventory,Inventory)
IL_0012: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<ItemDrop/ItemData>::GetEnumerator()
IL_0017: stloc.0
IL_0018: br.s IL_0028
IL_001a: ldloc.0
IL_001b: callvirt !0 System.Collections.Generic.IEnumerator`1<ItemDrop/ItemData>::get_Current()
IL_0020: stloc.1
IL_0021: ldarg.0
IL_0022: ldloc.1
IL_0023: call System.Void ZenUI.Section.InventoryTakeAll::FillStacksFrom(Inventory,ItemDrop/ItemData)
IL_0028: ldloc.0
IL_0029: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_002e: brtrue.s IL_001a
IL_0030: leave.s IL_003c
IL_0032: ldloc.0
IL_0033: brfalse.s IL_003b
IL_0035: ldloc.0
IL_0036: callvirt System.Void System.IDisposable::Dispose()
IL_003b: endfinally
IL_003c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::StackingCombineExisting
IL_0041: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0046: brfalse.s IL_004e
IL_0048: ldarg.0
IL_0049: call System.Void ZenUI.Section.InventoryRules::CombineStacks(Inventory)
IL_004e: ldarg.1
IL_004f: ldfld System.Collections.Generic.List`1<ItemDrop/ItemData> Inventory::m_inventory
IL_0054: ldsfld System.Predicate`1<ItemDrop/ItemData> ZenUI.Section.InventoryTakeAll/<>c::<>9__8_0
IL_0059: dup
IL_005a: brtrue.s IL_0073
IL_005c: pop
IL_005d: ldsfld ZenUI.Section.InventoryTakeAll/<>c ZenUI.Section.InventoryTakeAll/<>c::<>9
IL_0062: ldftn System.Boolean ZenUI.Section.InventoryTakeAll/<>c::<TakeStacks>b__8_0(ItemDrop/ItemData)
IL_0068: newobj System.Void System.Predicate`1<ItemDrop/ItemData>::.ctor(System.Object,System.IntPtr)
IL_006d: dup
IL_006e: stsfld System.Predicate`1<ItemDrop/ItemData> ZenUI.Section.InventoryTakeAll/<>c::<>9__8_0
IL_0073: callvirt System.Int32 System.Collections.Generic.List`1<ItemDrop/ItemData>::RemoveAll(System.Predicate`1<!0>)
IL_0078: pop
IL_0079: ldc.i4.2
IL_007a: newarr Inventory
IL_007f: dup
IL_0080: ldc.i4.0
IL_0081: ldarg.0
IL_0082: stelem.ref
IL_0083: dup
IL_0084: ldc.i4.1
IL_0085: ldarg.1
IL_0086: stelem.ref
IL_0087: call System.Void ZenUI.Section.InventoryTakeAll/InventoryChangedEvent::Invoke(Inventory[])
IL_008c: ret
// EH Finally: 24 - 50 => 50 - 60

// System.Void ZenUI.Section.InventoryTakeAll::FillStacksFrom(Inventory,ItemDrop/ItemData)
.locals ZenUI.Section.InventoryTakeAll/<>c__DisplayClass9_0, Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean, System.Collections.Generic.IEnumerator`1<ItemDrop/ItemData>, System.Func`2<ItemDrop/ItemData,System.Boolean>, ItemDrop/ItemData, System.Int32, System.Int32
IL_0000: newobj System.Void ZenUI.Section.InventoryTakeAll/<>c__DisplayClass9_0::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldarg.1
IL_0008: stfld ItemDrop/ItemData ZenUI.Section.InventoryTakeAll/<>c__DisplayClass9_0::sourceItem
IL_000d: ldc.i4.s 19
IL_000f: ldc.i4.1
IL_0010: ldloca.s V_2
IL_0012: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_0017: stloc.1
IL_0018: ldloc.2
IL_0019: brfalse.s IL_0039
IL_001b: ldloca.s V_1
IL_001d: ldstr "Filling stack from "
IL_0022: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0027: ldloca.s V_1
IL_0029: ldloc.0
IL_002a: ldfld ItemDrop/ItemData ZenUI.Section.InventoryTakeAll/<>c__DisplayClass9_0::sourceItem
IL_002f: call System.String Zen.Lib.ItemDataExt::GetName(ItemDrop/ItemData)
IL_0034: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_0039: ldloc.1
IL_003a: ldc.i4.0
IL_003b: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_0040: ldarg.0
IL_0041: callvirt System.Collections.Generic.List`1<ItemDrop/ItemData> Inventory::GetAllItems()
IL_0046: ldloc.0
IL_0047: ldfld System.Func`2<ItemDrop/ItemData,System.Boolean> ZenUI.Section.InventoryTakeAll/<>c__DisplayClass9_0::<>9__0
IL_004c: dup
IL_004d: brtrue.s IL_0067
IL_004f: pop
IL_0050: ldloc.0
IL_0051: ldloc.0
IL_0052: ldftn System.Boolean ZenUI.Section.InventoryTakeAll/<>c__DisplayClass9_0::<FillStacksFrom>b__0(ItemDrop/ItemData)
IL_0058: newobj System.Void System.Func`2<ItemDrop/ItemData,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_005d: dup
IL_005e: stloc.s V_4
IL_0060: stfld System.Func`2<ItemDrop/ItemData,System.Boolean> ZenUI.Section.InventoryTakeAll/<>c__DisplayClass9_0::<>9__0
IL_0065: ldloc.s V_4
IL_0067: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ItemDrop/ItemData>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_006c: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<ItemDrop/ItemData>::GetEnumerator()
IL_0071: stloc.3
IL_0072: br IL_014e
IL_0077: ldloc.3
IL_0078: callvirt !0 System.Collections.Generic.IEnumerator`1<ItemDrop/ItemData>::get_Current()
IL_007d: stloc.s V_5
IL_007f: ldloc.0
IL_0080: ldfld ItemDrop/ItemData ZenUI.Section.InventoryTakeAll/<>c__DisplayClass9_0::sourceItem
IL_0085: ldfld System.Int32 ItemDrop/ItemData::m_stack
IL_008a: ldloc.s V_5
IL_008c: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0091: ldfld System.Int32 ItemDrop/ItemData/SharedData::m_maxStackSize
IL_0096: ldloc.s V_5
IL_0098: ldfld System.Int32 ItemDrop/ItemData::m_stack
IL_009d: sub
IL_009e: stloc.s V_6
IL_00a0: ldloc.s V_6
IL_00a2: call System.Int32 System.Math::Min(System.Int32,System.Int32)
IL_00a7: stloc.s V_7
IL_00a9: ldloc.s V_5
IL_00ab: dup
IL_00ac: ldfld System.Int32 ItemDrop/ItemData::m_stack
IL_00b1: ldloc.s V_7
IL_00b3: add
IL_00b4: stfld System.Int32 ItemDrop/ItemData::m_stack
IL_00b9: ldloc.0
IL_00ba: ldfld ItemDrop/ItemData ZenUI.Section.InventoryTakeAll/<>c__DisplayClass9_0::sourceItem
IL_00bf: dup
IL_00c0: ldfld System.Int32 ItemDrop/ItemData::m_stack
IL_00c5: ldloc.s V_7
IL_00c7: sub
IL_00c8: stfld System.Int32 ItemDrop/ItemData::m_stack
IL_00cd: ldc.i4.s 19
IL_00cf: ldc.i4.2
IL_00d0: ldloca.s V_2
IL_00d2: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_00d7: stloc.1
IL_00d8: ldloc.2
IL_00d9: brfalse.s IL_010a
IL_00db: ldloca.s V_1
IL_00dd: ldstr "Added "
IL_00e2: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_00e7: ldloca.s V_1
IL_00e9: ldloc.s V_7
IL_00eb: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Int32>(!!0)
IL_00f0: ldloca.s V_1
IL_00f2: ldstr " to stack of "
IL_00f7: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_00fc: ldloca.s V_1
IL_00fe: ldloc.s V_5
IL_0100: call System.String Zen.Lib.ItemDataExt::GetName(ItemDrop/ItemData)
IL_0105: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_010a: ldloc.1
IL_010b: ldc.i4.0
IL_010c: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_0111: ldloc.0
IL_0112: ldfld ItemDrop/ItemData ZenUI.Section.InventoryTakeAll/<>c__DisplayClass9_0::sourceItem
IL_0117: ldfld System.Int32 ItemDrop/ItemData::m_stack
IL_011c: ldc.i4.0
IL_011d: bge.s IL_013f
IL_011f: ldstr "sourceItem"
IL_0124: ldloc.0
IL_0125: ldfld ItemDrop/ItemData ZenUI.Section.InventoryTakeAll/<>c__DisplayClass9_0::sourceItem
IL_012a: ldfld System.Int32 ItemDrop/ItemData::m_stack
IL_012f: box System.Int32
IL_0134: ldstr "Source stack is less than 0"
IL_0139: newobj System.Void System.ArgumentOutOfRangeException::.ctor(System.String,System.Object,System.String)
IL_013e: throw
IL_013f: ldloc.0
IL_0140: ldfld ItemDrop/ItemData ZenUI.Section.InventoryTakeAll/<>c__DisplayClass9_0::sourceItem
IL_0145: ldfld System.Int32 ItemDrop/ItemData::m_stack
IL_014a: brtrue.s IL_014e
IL_014c: leave.s IL_0165
IL_014e: ldloc.3
IL_014f: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0154: brtrue IL_0077
IL_0159: leave.s IL_0165
IL_015b: ldloc.3
IL_015c: brfalse.s IL_0164
IL_015e: ldloc.3
IL_015f: callvirt System.Void System.IDisposable::Dispose()
IL_0164: endfinally
IL_0165: ret
// EH Finally: 114 - 347 => 347 - 357

// System.Collections.Generic.IEnumerable`1<ItemDrop/ItemData> ZenUI.Section.InventoryTakeAll::GetItemsByWeight(Inventory)
.locals 
IL_0000: ldarg.0
IL_0001: callvirt System.Collections.Generic.List`1<ItemDrop/ItemData> Inventory::GetAllItems()
IL_0006: ldsfld System.Func`2<ItemDrop/ItemData,System.Single> ZenUI.Section.InventoryTakeAll/<>c::<>9__10_0
IL_000b: dup
IL_000c: brtrue.s IL_0025
IL_000e: pop
IL_000f: ldsfld ZenUI.Section.InventoryTakeAll/<>c ZenUI.Section.InventoryTakeAll/<>c::<>9
IL_0014: ldftn System.Single ZenUI.Section.InventoryTakeAll/<>c::<GetItemsByWeight>b__10_0(ItemDrop/ItemData)
IL_001a: newobj System.Void System.Func`2<ItemDrop/ItemData,System.Single>::.ctor(System.Object,System.IntPtr)
IL_001f: dup
IL_0020: stsfld System.Func`2<ItemDrop/ItemData,System.Single> ZenUI.Section.InventoryTakeAll/<>c::<>9__10_0
IL_0025: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::OrderBy<ItemDrop/ItemData,System.Single>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_002a: ret

// System.Void ZenUI.Section.InventoryTakeAll::TakeWeightLimit(Inventory,Inventory)
.locals System.Collections.Generic.IEnumerator`1<ItemDrop/ItemData>, ItemDrop/ItemData
IL_0000: ldstr "Take weight limit"
IL_0005: ldc.i4.0
IL_0006: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_000b: ldc.i4.0
IL_000c: stsfld System.Boolean ZenUI.Section.InventoryTakeAll/InventoryChangedEvent::CanInvoke
IL_0011: ldarg.1
IL_0012: call System.Collections.Generic.IEnumerable`1<ItemDrop/ItemData> ZenUI.Section.InventoryTakeAll::GetItemsByWeight(Inventory)
IL_0017: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<ItemDrop/ItemData>::GetEnumerator()
IL_001c: stloc.0
IL_001d: br.s IL_0065
IL_001f: ldloc.0
IL_0020: callvirt !0 System.Collections.Generic.IEnumerator`1<ItemDrop/ItemData>::get_Current()
IL_0025: stloc.1
IL_0026: ldarg.0
IL_0027: callvirt System.Void Inventory::UpdateTotalWeight()
IL_002c: ldarg.0
IL_002d: callvirt System.Single Inventory::GetTotalWeight()
IL_0032: ldloc.1
IL_0033: ldc.i4.m1
IL_0034: callvirt System.Single ItemDrop/ItemData::GetWeight(System.Int32)
IL_0039: add
IL_003a: ldsfld Player Player::m_localPlayer
IL_003f: callvirt System.Single Player::GetMaxCarryWeight()
IL_0044: bgt.un.s IL_0050
IL_0046: ldarg.0
IL_0047: ldarg.1
IL_0048: ldloc.1
IL_0049: callvirt System.Void Inventory::MoveItemToThis(Inventory,ItemDrop/ItemData)
IL_004e: br.s IL_0065
IL_0050: ldsfld Player Player::m_localPlayer
IL_0055: ldc.i4.2
IL_0056: ldstr "$se_max_carryweight"
IL_005b: ldc.i4.0
IL_005c: ldnull
IL_005d: ldc.i4.0
IL_005e: callvirt System.Void Character::Message(MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_0063: leave.s IL_0079
IL_0065: ldloc.0
IL_0066: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_006b: brtrue.s IL_001f
IL_006d: leave.s IL_0079
IL_006f: ldloc.0
IL_0070: brfalse.s IL_0078
IL_0072: ldloc.0
IL_0073: callvirt System.Void System.IDisposable::Dispose()
IL_0078: endfinally
IL_0079: ldc.i4.1
IL_007a: stsfld System.Boolean ZenUI.Section.InventoryTakeAll/InventoryChangedEvent::CanInvoke
IL_007f: ldc.i4.2
IL_0080: newarr Inventory
IL_0085: dup
IL_0086: ldc.i4.0
IL_0087: ldarg.0
IL_0088: stelem.ref
IL_0089: dup
IL_008a: ldc.i4.1
IL_008b: ldarg.1
IL_008c: stelem.ref
IL_008d: call System.Void ZenUI.Section.InventoryTakeAll/InventoryChangedEvent::Invoke(Inventory[])
IL_0092: ret
// EH Finally: 29 - 111 => 111 - 121

// System.Void ZenUI.Section.InventoryTakeAll::TakeAll(Inventory,Inventory)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: callvirt System.Void Inventory::MoveAll(Inventory)
IL_0007: ret

// System.Collections.Generic.IEnumerable`1<ItemDrop/ItemData> ZenUI.Section.InventoryTakeAll::GetIncompleteSourceStacks(Inventory,Inventory)
.locals ZenUI.Section.InventoryTakeAll/<>c__DisplayClass14_0
IL_0000: newobj System.Void ZenUI.Section.InventoryTakeAll/<>c__DisplayClass14_0::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldarg.0
IL_0008: callvirt System.Collections.Generic.List`1<ItemDrop/ItemData> Inventory::GetAllItems()
IL_000d: ldsfld System.Func`2<ItemDrop/ItemData,System.Boolean> ZenUI.Section.InventoryTakeAll/<>c::<>9__14_0
IL_0012: dup
IL_0013: brtrue.s IL_002c
IL_0015: pop
IL_0016: ldsfld ZenUI.Section.InventoryTakeAll/<>c ZenUI.Section.InventoryTakeAll/<>c::<>9
IL_001b: ldftn System.Boolean ZenUI.Section.InventoryTakeAll/<>c::<GetIncompleteSourceStacks>b__14_0(ItemDrop/ItemData)
IL_0021: newobj System.Void System.Func`2<ItemDrop/ItemData,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0026: dup
IL_0027: stsfld System.Func`2<ItemDrop/ItemData,System.Boolean> ZenUI.Section.InventoryTakeAll/<>c::<>9__14_0
IL_002c: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ItemDrop/ItemData>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0031: ldsfld System.Func`2<ItemDrop/ItemData,System.String> ZenUI.Section.InventoryTakeAll/<>c::<>9__14_1
IL_0036: dup
IL_0037: brtrue.s IL_0050
IL_0039: pop
IL_003a: ldsfld ZenUI.Section.InventoryTakeAll/<>c ZenUI.Section.InventoryTakeAll/<>c::<>9
IL_003f: ldftn System.String ZenUI.Section.InventoryTakeAll/<>c::<GetIncompleteSourceStacks>b__14_1(ItemDrop/ItemData)
IL_0045: newobj System.Void System.Func`2<ItemDrop/ItemData,System.String>::.ctor(System.Object,System.IntPtr)
IL_004a: dup
IL_004b: stsfld System.Func`2<ItemDrop/ItemData,System.String> ZenUI.Section.InventoryTakeAll/<>c::<>9__14_1
IL_0050: call System.Collections.Generic.IEnumerable`1<!!1> System.Linq.Enumerable::Select<ItemDrop/ItemData,System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_0055: call System.Collections.Generic.HashSet`1<!!0> System.Linq.Enumerable::ToHashSet<System.String>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_005a: stfld System.Collections.Generic.HashSet`1<System.String> ZenUI.Section.InventoryTakeAll/<>c__DisplayClass14_0::incomplete
IL_005f: ldarg.1
IL_0060: call System.Collections.Generic.IEnumerable`1<ItemDrop/ItemData> ZenUI.Section.InventoryTakeAll::GetItemsByWeight(Inventory)
IL_0065: ldloc.0
IL_0066: ldftn System.Boolean ZenUI.Section.InventoryTakeAll/<>c__DisplayClass14_0::<GetIncompleteSourceStacks>b__2(ItemDrop/ItemData)
IL_006c: newobj System.Void System.Func`2<ItemDrop/ItemData,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0071: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ItemDrop/ItemData>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0076: ret

// System.Boolean ZenUI.Section.InventoryTakeAll::<GetMoveMode>g__HasIncompleteStacks|7_0(ZenUI.Section.InventoryTakeAll/<>c__DisplayClass7_0&)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld Inventory ZenUI.Section.InventoryTakeAll/<>c__DisplayClass7_0::destInv
IL_0006: ldarg.0
IL_0007: ldfld Inventory ZenUI.Section.InventoryTakeAll/<>c__DisplayClass7_0::sourceInv
IL_000c: call System.Collections.Generic.IEnumerable`1<ItemDrop/ItemData> ZenUI.Section.InventoryTakeAll::GetIncompleteSourceStacks(Inventory,Inventory)
IL_0011: call System.Boolean System.Linq.Enumerable::Any<ItemDrop/ItemData>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0016: ret

// System.Boolean ZenUI.Section.InventoryTakeAll::<GetMoveMode>g__CanCarryMore|7_1(ZenUI.Section.InventoryTakeAll/<>c__DisplayClass7_0&)
.locals ItemDrop/ItemData
IL_0000: ldarg.0
IL_0001: ldfld Inventory ZenUI.Section.InventoryTakeAll/<>c__DisplayClass7_0::sourceInv
IL_0006: call System.Collections.Generic.IEnumerable`1<ItemDrop/ItemData> ZenUI.Section.InventoryTakeAll::GetItemsByWeight(Inventory)
IL_000b: call !!0 System.Linq.Enumerable::FirstOrDefault<ItemDrop/ItemData>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0010: stloc.0
IL_0011: ldloc.0
IL_0012: brfalse.s IL_0037
IL_0014: ldarg.0
IL_0015: ldfld Inventory ZenUI.Section.InventoryTakeAll/<>c__DisplayClass7_0::destInv
IL_001a: callvirt System.Single Inventory::GetTotalWeight()
IL_001f: ldloc.0
IL_0020: ldc.i4.m1
IL_0021: callvirt System.Single ItemDrop/ItemData::GetWeight(System.Int32)
IL_0026: add
IL_0027: ldsfld Player Player::m_localPlayer
IL_002c: callvirt System.Single Player::GetMaxCarryWeight()
IL_0031: cgt.un
IL_0033: ldc.i4.0
IL_0034: ceq
IL_0036: ret
IL_0037: ldc.i4.0
IL_0038: ret

// System.Boolean ZenUI.Section.InventoryTakeAll/InventoryChangedEvent::Prefix()
.locals 
IL_0000: ldsfld System.Boolean ZenUI.Section.InventoryTakeAll/InventoryChangedEvent::CanInvoke
IL_0005: ret

// System.Void ZenUI.Section.InventoryTakeAll/InventoryChangedEvent::Invoke(Inventory[])
.locals Inventory[], System.Int32
IL_0000: ldarg.0
IL_0001: stloc.0
IL_0002: ldc.i4.0
IL_0003: stloc.1
IL_0004: br.s IL_0014
IL_0006: ldloc.0
IL_0007: ldloc.1
IL_0008: ldelem.ref
IL_0009: ldc.i4.0
IL_000a: ldc.i4.0
IL_000b: callvirt System.Void Inventory::Changed(System.Boolean,System.Boolean)
IL_0010: ldloc.1
IL_0011: ldc.i4.1
IL_0012: add
IL_0013: stloc.1
IL_0014: ldloc.1
IL_0015: ldloc.0
IL_0016: ldlen
IL_0017: conv.i4
IL_0018: blt.s IL_0006
IL_001a: ret

// System.Void ZenUI.Section.InventoryTakeAll/InventoryChangedEvent::.cctor()
.locals 
IL_0000: ldc.i4.1
IL_0001: stsfld System.Boolean ZenUI.Section.InventoryTakeAll/InventoryChangedEvent::CanInvoke
IL_0006: ret

// System.Void ZenUI.Section.InventoryTakeAll/<>c::.cctor()
.locals 
IL_0000: newobj System.Void ZenUI.Section.InventoryTakeAll/<>c::.ctor()
IL_0005: stsfld ZenUI.Section.InventoryTakeAll/<>c ZenUI.Section.InventoryTakeAll/<>c::<>9
IL_000a: ret

// System.Void ZenUI.Section.InventoryTakeAll/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean ZenUI.Section.InventoryTakeAll/<>c::<TakeStacks>b__8_0(ItemDrop/ItemData)
.locals 
IL_0000: ldarg.1
IL_0001: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0006: ldfld System.Int32 ItemDrop/ItemData/SharedData::m_maxStackSize
IL_000b: ldc.i4.1
IL_000c: ble.s IL_0018
IL_000e: ldarg.1
IL_000f: ldfld System.Int32 ItemDrop/ItemData::m_stack
IL_0014: ldc.i4.0
IL_0015: ceq
IL_0017: ret
IL_0018: ldc.i4.0
IL_0019: ret

// System.Single ZenUI.Section.InventoryTakeAll/<>c::<GetItemsByWeight>b__10_0(ItemDrop/ItemData)
.locals 
IL_0000: ldarg.1
IL_0001: ldc.i4.m1
IL_0002: callvirt System.Single ItemDrop/ItemData::GetWeight(System.Int32)
IL_0007: ret

// System.Boolean ZenUI.Section.InventoryTakeAll/<>c::<GetIncompleteSourceStacks>b__14_0(ItemDrop/ItemData)
.locals 
IL_0000: ldarg.1
IL_0001: ldfld System.Int32 ItemDrop/ItemData::m_stack
IL_0006: ldarg.1
IL_0007: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_000c: ldfld System.Int32 ItemDrop/ItemData/SharedData::m_maxStackSize
IL_0011: clt
IL_0013: ret

// System.String ZenUI.Section.InventoryTakeAll/<>c::<GetIncompleteSourceStacks>b__14_1(ItemDrop/ItemData)
.locals 
IL_0000: ldarg.1
IL_0001: call System.String Zen.Lib.ItemDataExt::GetPrefabName(ItemDrop/ItemData)
IL_0006: ret

// System.Void ZenUI.Section.InventoryTakeAll/<>c__DisplayClass14_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean ZenUI.Section.InventoryTakeAll/<>c__DisplayClass14_0::<GetIncompleteSourceStacks>b__2(ItemDrop/ItemData)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.HashSet`1<System.String> ZenUI.Section.InventoryTakeAll/<>c__DisplayClass14_0::incomplete
IL_0006: ldarg.1
IL_0007: call System.String Zen.Lib.ItemDataExt::GetPrefabName(ItemDrop/ItemData)
IL_000c: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.String>::Contains(!0)
IL_0011: ret

// System.Void ZenUI.Section.InventoryTakeAll/<>c__DisplayClass9_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean ZenUI.Section.InventoryTakeAll/<>c__DisplayClass9_0::<FillStacksFrom>b__0(ItemDrop/ItemData)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.0
IL_0002: ldfld ItemDrop/ItemData ZenUI.Section.InventoryTakeAll/<>c__DisplayClass9_0::sourceItem
IL_0007: call System.Boolean ZenUI.Section.InventoryTakeAll::IsSameName(ItemDrop/ItemData,ItemDrop/ItemData)
IL_000c: ret

// System.Void ZenUI.Section.ItemIcon::Setup()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ZenUI.Configs::ExtraQualityLevelSym
IL_0005: ldsfld System.EventHandler ZenUI.Section.ItemIcon/<>O::<0>__OnQualitySymLevelChanged
IL_000a: dup
IL_000b: brtrue.s IL_0020
IL_000d: pop
IL_000e: ldnull
IL_000f: ldftn System.Void ZenUI.Section.ItemIcon::OnQualitySymLevelChanged(System.Object,System.EventArgs)
IL_0015: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_001a: dup
IL_001b: stsfld System.EventHandler ZenUI.Section.ItemIcon/<>O::<0>__OnQualitySymLevelChanged
IL_0020: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<System.String>::add_SettingChanged(System.EventHandler)
IL_0025: ldsfld System.Action`3<HotkeyBar,HotkeyBar/ElementData,ItemDrop/ItemData> ZenUI.Section.ItemIcon/<>O::<1>__UpdateHotkeyBarElement
IL_002a: dup
IL_002b: brtrue.s IL_0040
IL_002d: pop
IL_002e: ldnull
IL_002f: ldftn System.Void ZenUI.Section.ItemIcon::UpdateHotkeyBarElement(HotkeyBar,HotkeyBar/ElementData,ItemDrop/ItemData)
IL_0035: newobj System.Void System.Action`3<HotkeyBar,HotkeyBar/ElementData,ItemDrop/ItemData>::.ctor(System.Object,System.IntPtr)
IL_003a: dup
IL_003b: stsfld System.Action`3<HotkeyBar,HotkeyBar/ElementData,ItemDrop/ItemData> ZenUI.Section.ItemIcon/<>O::<1>__UpdateHotkeyBarElement
IL_0040: call System.Void Zen.Lib.Events.HotkeyBarUI::add_UpdateElement(System.Action`3<HotkeyBar,HotkeyBar/ElementData,ItemDrop/ItemData>)
IL_0045: ldsfld System.Action`3<InventoryGrid,InventoryElement,ItemDrop/ItemData> ZenUI.Section.ItemIcon/<>O::<2>__UpdateGridElement
IL_004a: dup
IL_004b: brtrue.s IL_0060
IL_004d: pop
IL_004e: ldnull
IL_004f: ldftn System.Void ZenUI.Section.ItemIcon::UpdateGridElement(InventoryGrid,InventoryElement,ItemDrop/ItemData)
IL_0055: newobj System.Void System.Action`3<InventoryGrid,InventoryElement,ItemDrop/ItemData>::.ctor(System.Object,System.IntPtr)
IL_005a: dup
IL_005b: stsfld System.Action`3<InventoryGrid,InventoryElement,ItemDrop/ItemData> ZenUI.Section.ItemIcon/<>O::<2>__UpdateGridElement
IL_0060: call System.Void Zen.Lib.Events.InventoryUI::add_UpdateGridElement(System.Action`3<InventoryGrid,InventoryElement,ItemDrop/ItemData>)
IL_0065: ret

// System.Void ZenUI.Section.ItemIcon::OnQualitySymLevelChanged(System.Object,System.EventArgs)
.locals 
IL_0000: ldstr "Refreshing the item quality symbols"
IL_0005: ldc.i4.0
IL_0006: call System.Void Zen.Logging`1<ZenUI.Plugin>::Message(System.Object,System.Int32)
IL_000b: ldsflda System.Char ZenUI.Section.ItemIcon::_maxQualitySymbol
IL_0010: call System.String[] ZenUI.Section.ItemIcon::CreateQualityStars(System.Char&)
IL_0015: stsfld System.String[] ZenUI.Section.ItemIcon::_itemQualitySymbols
IL_001a: ret

// System.String[] ZenUI.Section.ItemIcon::CreateQualityStars(System.Char&)
.locals System.String, System.Collections.Generic.List`1<System.String>, System.String, System.Int32, System.Char, System.Int32, System.Collections.Generic.IEnumerator`1<System.ValueTuple`2<System.String,System.Int32>>, System.ValueTuple`2<System.String,System.Int32>, Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean
IL_0000: ldstr "*"
IL_0005: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> ZenUI.Configs::ExtraQualityLevelSym
IL_000a: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_000f: call System.String System.String::Concat(System.String,System.String)
IL_0014: stloc.0
IL_0015: ldarg.0
IL_0016: ldloc.0
IL_0017: ldloc.0
IL_0018: callvirt System.Int32 System.String::get_Length()
IL_001d: ldc.i4.1
IL_001e: sub
IL_001f: callvirt System.Char System.String::get_Chars(System.Int32)
IL_0024: stind.i2
IL_0025: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor()
IL_002a: dup
IL_002b: ldsfld System.String System.String::Empty
IL_0030: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_0035: stloc.1
IL_0036: ldloc.0
IL_0037: stloc.2
IL_0038: ldc.i4.0
IL_0039: stloc.3
IL_003a: br.s IL_0074
IL_003c: ldloc.2
IL_003d: ldloc.3
IL_003e: callvirt System.Char System.String::get_Chars(System.Int32)
IL_0043: stloc.s V_4
IL_0045: ldc.i4.0
IL_0046: stloc.s V_5
IL_0048: br.s IL_006b
IL_004a: ldloc.1
IL_004b: ldloca.s V_4
IL_004d: call System.String System.Char::ToString()
IL_0052: ldc.i4.s 42
IL_0054: ldloc.s V_5
IL_0056: newobj System.Void System.String::.ctor(System.Char,System.Int32)
IL_005b: call System.String System.String::Concat(System.String,System.String)
IL_0060: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_0065: ldloc.s V_5
IL_0067: ldc.i4.1
IL_0068: add
IL_0069: stloc.s V_5
IL_006b: ldloc.s V_5
IL_006d: ldc.i4.4
IL_006e: blt.s IL_004a
IL_0070: ldloc.3
IL_0071: ldc.i4.1
IL_0072: add
IL_0073: stloc.3
IL_0074: ldloc.3
IL_0075: ldloc.2
IL_0076: callvirt System.Int32 System.String::get_Length()
IL_007b: blt.s IL_003c
IL_007d: ldloc.1
IL_007e: call System.Collections.Generic.IEnumerable`1<System.ValueTuple`2<!!0,System.Int32>> Zen.Lib.IEnumerableExt::WithIndex<System.String>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0083: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<System.ValueTuple`2<System.String,System.Int32>>::GetEnumerator()
IL_0088: stloc.s V_6
IL_008a: br.s IL_00d9
IL_008c: ldloc.s V_6
IL_008e: callvirt !0 System.Collections.Generic.IEnumerator`1<System.ValueTuple`2<System.String,System.Int32>>::get_Current()
IL_0093: stloc.s V_7
IL_0095: ldc.i4.2
IL_0096: ldc.i4.2
IL_0097: ldloca.s V_9
IL_0099: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_009e: stloc.s V_8
IL_00a0: ldloc.s V_9
IL_00a2: brfalse.s IL_00d1
IL_00a4: ldloca.s V_8
IL_00a6: ldloc.s V_7
IL_00a8: ldfld !1 System.ValueTuple`2<System.String,System.Int32>::Item2
IL_00ad: ldstr "D2"
IL_00b2: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Int32>(!!0,System.String)
IL_00b7: ldloca.s V_8
IL_00b9: ldstr ": "
IL_00be: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_00c3: ldloca.s V_8
IL_00c5: ldloc.s V_7
IL_00c7: ldfld !0 System.ValueTuple`2<System.String,System.Int32>::Item1
IL_00cc: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_00d1: ldloc.s V_8
IL_00d3: ldc.i4.0
IL_00d4: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_00d9: ldloc.s V_6
IL_00db: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_00e0: brtrue.s IL_008c
IL_00e2: leave.s IL_00f0
IL_00e4: ldloc.s V_6
IL_00e6: brfalse.s IL_00ef
IL_00e8: ldloc.s V_6
IL_00ea: callvirt System.Void System.IDisposable::Dispose()
IL_00ef: endfinally
IL_00f0: ldstr "Max item quality level: {0} (overflow is allowed)"
IL_00f5: ldloc.1
IL_00f6: callvirt System.Int32 System.Collections.Generic.List`1<System.String>::get_Count()
IL_00fb: ldc.i4.1
IL_00fc: sub
IL_00fd: box System.Int32
IL_0102: call System.String System.String::Format(System.String,System.Object)
IL_0107: ldc.i4.0
IL_0108: call System.Void Zen.Logging`1<ZenUI.Plugin>::Message(System.Object,System.Int32)
IL_010d: ldloc.1
IL_010e: callvirt !0[] System.Collections.Generic.List`1<System.String>::ToArray()
IL_0113: ret
// EH Finally: 138 - 228 => 228 - 240

// System.Void ZenUI.Section.ItemIcon::UpdateItemIcon(GuiBar,UnityEngine.UI.Image,UnityEngine.UI.Image,UnityEngine.Color)
.locals System.Single
IL_0000: ldarg.2
IL_0001: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0006: brfalse.s IL_0056
IL_0008: ldsfld UnityEngine.Color ZenUI.Section.ItemIcon::_itemEquippedColorOriginal
IL_000d: call UnityEngine.Color UnityEngine.Color::get_clear()
IL_0012: call System.Boolean UnityEngine.Color::op_Equality(UnityEngine.Color,UnityEngine.Color)
IL_0017: brfalse.s IL_0024
IL_0019: ldarg.2
IL_001a: callvirt UnityEngine.Color UnityEngine.UI.Graphic::get_color()
IL_001f: stsfld UnityEngine.Color ZenUI.Section.ItemIcon::_itemEquippedColorOriginal
IL_0024: ldarg.3
IL_0025: call UnityEngine.Color UnityEngine.Color::get_clear()
IL_002a: call System.Boolean UnityEngine.Color::op_Inequality(UnityEngine.Color,UnityEngine.Color)
IL_002f: brfalse.s IL_003a
IL_0031: ldarg.2
IL_0032: ldarg.3
IL_0033: callvirt System.Void UnityEngine.UI.Graphic::set_color(UnityEngine.Color)
IL_0038: br.s IL_0056
IL_003a: ldsfld UnityEngine.Color ZenUI.Section.ItemIcon::_itemEquippedColorOriginal
IL_003f: call UnityEngine.Color UnityEngine.Color::get_clear()
IL_0044: call System.Boolean UnityEngine.Color::op_Inequality(UnityEngine.Color,UnityEngine.Color)
IL_0049: brfalse.s IL_0056
IL_004b: ldarg.2
IL_004c: ldsfld UnityEngine.Color ZenUI.Section.ItemIcon::_itemEquippedColorOriginal
IL_0051: callvirt System.Void UnityEngine.UI.Graphic::set_color(UnityEngine.Color)
IL_0056: ldarg.0
IL_0057: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_005c: brfalse IL_0147
IL_0061: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::DurabilityColorApply
IL_0066: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_006b: brfalse IL_0147
IL_0070: ldarg.0
IL_0071: callvirt System.Single GuiBar::GetSmoothValue()
IL_0076: stloc.0
IL_0077: ldarg.0
IL_0078: ldfld UnityEngine.UI.Image GuiBar::m_barImage
IL_007d: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0082: brtrue.s IL_00a2
IL_0084: ldarg.0
IL_0085: ldfld UnityEngine.RectTransform GuiBar::m_bar
IL_008a: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_008f: brfalse.s IL_00a2
IL_0091: ldarg.0
IL_0092: ldarg.0
IL_0093: ldfld UnityEngine.RectTransform GuiBar::m_bar
IL_0098: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.UI.Image>()
IL_009d: stfld UnityEngine.UI.Image GuiBar::m_barImage
IL_00a2: ldloc.0
IL_00a3: ldc.r4 1
IL_00a8: blt.un.s IL_00ec
IL_00aa: ldarg.0
IL_00ab: callvirt UnityEngine.Color GuiBar::GetColor()
IL_00b0: call UnityEngine.Color UnityEngine.Color::get_red()
IL_00b5: call System.Boolean UnityEngine.Color::op_Equality(UnityEngine.Color,UnityEngine.Color)
IL_00ba: brfalse.s IL_00cd
IL_00bc: ldarg.0
IL_00bd: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::DurabilityBroken
IL_00c2: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_00c7: callvirt System.Void GuiBar::SetColor(UnityEngine.Color)
IL_00cc: ret
IL_00cd: ldarg.0
IL_00ce: callvirt UnityEngine.Color GuiBar::GetColor()
IL_00d3: call UnityEngine.Color UnityEngine.Color::get_clear()
IL_00d8: call System.Boolean UnityEngine.Color::op_Inequality(UnityEngine.Color,UnityEngine.Color)
IL_00dd: brfalse.s IL_0147
IL_00df: ldarg.0
IL_00e0: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_00e5: ldc.i4.0
IL_00e6: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_00eb: ret
IL_00ec: ldloc.0
IL_00ed: ldc.r4 0.75
IL_00f2: blt.un.s IL_0105
IL_00f4: ldarg.0
IL_00f5: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::DurabilityGood
IL_00fa: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_00ff: callvirt System.Void GuiBar::SetColor(UnityEngine.Color)
IL_0104: ret
IL_0105: ldloc.0
IL_0106: ldc.r4 0.5
IL_010b: blt.un.s IL_011e
IL_010d: ldarg.0
IL_010e: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::DurabilityWorn
IL_0113: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_0118: callvirt System.Void GuiBar::SetColor(UnityEngine.Color)
IL_011d: ret
IL_011e: ldloc.0
IL_011f: ldc.r4 0
IL_0124: ble.un.s IL_0137
IL_0126: ldarg.0
IL_0127: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::DurabilityAtRisk
IL_012c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_0131: callvirt System.Void GuiBar::SetColor(UnityEngine.Color)
IL_0136: ret
IL_0137: ldarg.0
IL_0138: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::DurabilityBroken
IL_013d: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_0142: callvirt System.Void GuiBar::SetColor(UnityEngine.Color)
IL_0147: ret

// System.Void ZenUI.Section.ItemIcon::UpdateItemQuality(TMPro.TMP_Text,System.Int32)
.locals System.String, System.String
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::ShowQualityAsSymbols
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: ldarg.0
IL_000e: ldarg.1
IL_000f: ldc.i4.0
IL_0010: clt
IL_0012: ldc.i4.0
IL_0013: ceq
IL_0015: callvirt System.Void UnityEngine.Behaviour::set_enabled(System.Boolean)
IL_001a: ldarg.0
IL_001b: callvirt System.Boolean UnityEngine.Behaviour::get_enabled()
IL_0020: brtrue.s IL_0023
IL_0022: ret
IL_0023: ldstr "{0}{1}"
IL_0028: ldarg.1
IL_0029: box System.Int32
IL_002e: ldsfld System.Char ZenUI.Section.ItemIcon::_maxQualitySymbol
IL_0033: box System.Char
IL_0038: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_003d: stloc.0
IL_003e: ldarg.1
IL_003f: ldsfld System.String[] ZenUI.Section.ItemIcon::_itemQualitySymbols
IL_0044: ldlen
IL_0045: conv.i4
IL_0046: blt.s IL_004b
IL_0048: ldloc.0
IL_0049: br.s IL_0052
IL_004b: ldsfld System.String[] ZenUI.Section.ItemIcon::_itemQualitySymbols
IL_0050: ldarg.1
IL_0051: ldelem.ref
IL_0052: stloc.1
IL_0053: ldarg.0
IL_0054: callvirt System.String TMPro.TMP_Text::get_text()
IL_0059: ldloc.1
IL_005a: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_005f: brfalse.s IL_0062
IL_0061: ret
IL_0062: ldarg.0
IL_0063: ldloc.1
IL_0064: callvirt System.Void TMPro.TMP_Text::set_text(System.String)
IL_0069: ldarg.0
IL_006a: ldc.i4.3
IL_006b: callvirt System.Void TMPro.TMP_Text::set_textWrappingMode(TMPro.TextWrappingModes)
IL_0070: ldarg.0
IL_0071: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::ItemQualitySymbolColor
IL_0076: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_007b: callvirt System.Void UnityEngine.UI.Graphic::set_color(UnityEngine.Color)
IL_0080: ldarg.0
IL_0081: ldc.r4 -35
IL_0086: callvirt System.Void TMPro.TMP_Text::set_lineSpacing(System.Single)
IL_008b: ldarg.0
IL_008c: ldc.r4 8
IL_0091: callvirt System.Void TMPro.TMP_Text::set_characterSpacing(System.Single)
IL_0096: ldarg.0
IL_0097: callvirt UnityEngine.RectTransform TMPro.TMP_Text::get_rectTransform()
IL_009c: ldc.r4 1
IL_00a1: ldc.r4 1
IL_00a6: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_00ab: callvirt System.Void UnityEngine.RectTransform::set_pivot(UnityEngine.Vector2)
IL_00b0: ldarg.0
IL_00b1: callvirt UnityEngine.RectTransform TMPro.TMP_Text::get_rectTransform()
IL_00b6: ldc.r4 1
IL_00bb: ldc.r4 1
IL_00c0: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_00c5: callvirt System.Void UnityEngine.RectTransform::set_anchorMin(UnityEngine.Vector2)
IL_00ca: ldarg.0
IL_00cb: callvirt UnityEngine.RectTransform TMPro.TMP_Text::get_rectTransform()
IL_00d0: ldc.r4 1
IL_00d5: ldc.r4 1
IL_00da: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_00df: callvirt System.Void UnityEngine.RectTransform::set_anchorMax(UnityEngine.Vector2)
IL_00e4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::Rotate90Degrees
IL_00e9: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_00ee: brfalse.s IL_0106
IL_00f0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::ShowQualityAsSymbols
IL_00f5: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_00fa: brfalse.s IL_0106
IL_00fc: ldarg.1
IL_00fd: ldsfld System.String[] ZenUI.Section.ItemIcon::_itemQualitySymbols
IL_0102: ldlen
IL_0103: conv.i4
IL_0104: blt.s IL_015b
IL_0106: ldarg.0
IL_0107: ldc.r4 14
IL_010c: callvirt System.Void TMPro.TMP_Text::set_fontSize(System.Single)
IL_0111: ldarg.0
IL_0112: ldarg.1
IL_0113: ldsfld System.String[] ZenUI.Section.ItemIcon::_itemQualitySymbols
IL_0118: ldlen
IL_0119: conv.i4
IL_011a: clt
IL_011c: callvirt System.Void TMPro.TMP_Text::set_isRightToLeftText(System.Boolean)
IL_0121: ldarg.0
IL_0122: callvirt UnityEngine.RectTransform TMPro.TMP_Text::get_rectTransform()
IL_0127: ldc.r4 0
IL_012c: ldc.r4 0
IL_0131: ldc.r4 0
IL_0136: call UnityEngine.Quaternion UnityEngine.Quaternion::Euler(System.Single,System.Single,System.Single)
IL_013b: callvirt System.Void UnityEngine.Transform::set_localRotation(UnityEngine.Quaternion)
IL_0140: ldarg.0
IL_0141: callvirt UnityEngine.RectTransform TMPro.TMP_Text::get_rectTransform()
IL_0146: ldc.r4 -4
IL_014b: ldc.r4 2
IL_0150: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_0155: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_015a: ret
IL_015b: ldarg.0
IL_015c: ldc.i4.0
IL_015d: callvirt System.Void TMPro.TMP_Text::set_isRightToLeftText(System.Boolean)
IL_0162: ldarg.0
IL_0163: ldarg.1
IL_0164: ldc.i4.4
IL_0165: ble.s IL_016e
IL_0167: ldc.r4 12
IL_016c: br.s IL_0173
IL_016e: ldc.r4 14
IL_0173: callvirt System.Void TMPro.TMP_Text::set_fontSize(System.Single)
IL_0178: ldarg.0
IL_0179: callvirt UnityEngine.RectTransform TMPro.TMP_Text::get_rectTransform()
IL_017e: ldc.r4 0
IL_0183: ldc.r4 0
IL_0188: ldc.r4 -90
IL_018d: call UnityEngine.Quaternion UnityEngine.Quaternion::Euler(System.Single,System.Single,System.Single)
IL_0192: callvirt System.Void UnityEngine.Transform::set_localRotation(UnityEngine.Quaternion)
IL_0197: ldarg.0
IL_0198: callvirt UnityEngine.RectTransform TMPro.TMP_Text::get_rectTransform()
IL_019d: ldc.r4 1
IL_01a2: ldarg.0
IL_01a3: callvirt System.Single TMPro.TMP_Text::get_preferredWidth()
IL_01a8: neg
IL_01a9: ldc.r4 4
IL_01ae: sub
IL_01af: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_01b4: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_01b9: ret

// System.Void ZenUI.Section.ItemIcon::UpdateItemIconAndQuality(InventoryElement,ItemDrop/ItemData,InventoryGrid)
.locals System.Int32
IL_0000: ldarg.2
IL_0001: isinst ZenUI.Section.CraftingPanelGrid
IL_0006: brfalse.s IL_0009
IL_0008: ret
IL_0009: ldarg.1
IL_000a: ldfld System.Int32 ItemDrop/ItemData::m_quality
IL_000f: ldc.i4.2
IL_0010: blt.s IL_002c
IL_0012: ldarg.2
IL_0013: callvirt System.String UnityEngine.Object::get_name()
IL_0018: ldstr "EquipmentSlotGrid"
IL_001d: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0022: brtrue.s IL_002c
IL_0024: ldarg.1
IL_0025: ldfld System.Int32 ItemDrop/ItemData::m_quality
IL_002a: br.s IL_002d
IL_002c: ldc.i4.m1
IL_002d: stloc.0
IL_002e: ldarg.0
IL_002f: ldfld GuiBar InventoryElement::m_durability
IL_0034: ldarg.0
IL_0035: ldfld UnityEngine.UI.Image InventoryElement::m_icon
IL_003a: ldarg.0
IL_003b: ldfld UnityEngine.UI.Image InventoryElement::m_equiped
IL_0040: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::ItemActivatedColor
IL_0045: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_004a: call System.Void ZenUI.Section.ItemIcon::UpdateItemIcon(GuiBar,UnityEngine.UI.Image,UnityEngine.UI.Image,UnityEngine.Color)
IL_004f: ldarg.0
IL_0050: ldfld TMPro.TMP_Text InventoryElement::m_quality
IL_0055: ldloc.0
IL_0056: call System.Void ZenUI.Section.ItemIcon::UpdateItemQuality(TMPro.TMP_Text,System.Int32)
IL_005b: ret

// System.Void ZenUI.Section.ItemIcon::UpdateFoodForkColor(InventoryElement,ItemDrop/ItemData)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld UnityEngine.UI.Image InventoryElement::m_food
IL_0006: callvirt System.Boolean UnityEngine.Behaviour::get_enabled()
IL_000b: brtrue.s IL_000e
IL_000d: ret
IL_000e: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::ColoredFoodBySimpleMajority
IL_0013: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0018: brtrue.s IL_001b
IL_001a: ret
IL_001b: ldarg.0
IL_001c: ldfld UnityEngine.UI.Image InventoryElement::m_food
IL_0021: ldarg.1
IL_0022: call UnityEngine.Color ZenUI.Section.ItemIcon::GetFoodForkColor(ItemDrop/ItemData)
IL_0027: callvirt System.Void UnityEngine.UI.Graphic::set_color(UnityEngine.Color)
IL_002c: ret

// UnityEngine.Color ZenUI.Section.ItemIcon::GetFoodForkColor(ItemDrop/ItemData)
.locals InventoryGrid, UnityEngine.Color, ZenUI.Section.FoodPanel/FoodType
IL_0000: call InventoryGui InventoryGui::get_instance()
IL_0005: ldfld InventoryGrid InventoryGui::m_playerGrid
IL_000a: stloc.0
IL_000b: ldarg.0
IL_000c: call ZenUI.Section.FoodPanel/FoodType ZenUI.Section.FoodPanel::GetFoodType(ItemDrop/ItemData)
IL_0011: stloc.2
IL_0012: ldloc.2
IL_0013: ldc.i4.1
IL_0014: sub
IL_0015: switch IL_0028,IL_0031,IL_003a
IL_0026: br.s IL_0043
IL_0028: ldloc.0
IL_0029: ldfld UnityEngine.Color InventoryGrid::m_foodHealthColor
IL_002e: stloc.1
IL_002f: br.s IL_0049
IL_0031: ldloc.0
IL_0032: ldfld UnityEngine.Color InventoryGrid::m_foodStaminaColor
IL_0037: stloc.1
IL_0038: br.s IL_0049
IL_003a: ldloc.0
IL_003b: ldfld UnityEngine.Color InventoryGrid::m_foodEitrColor
IL_0040: stloc.1
IL_0041: br.s IL_0049
IL_0043: call UnityEngine.Color UnityEngine.Color::get_white()
IL_0048: stloc.1
IL_0049: ldloc.1
IL_004a: ret

// System.Void ZenUI.Section.ItemIcon::UpdateGridElement(InventoryGrid,InventoryElement,ItemDrop/ItemData)
.locals 
IL_0000: ldarg.2
IL_0001: brtrue.s IL_0004
IL_0003: ret
IL_0004: ldarg.1
IL_0005: ldarg.2
IL_0006: ldarg.0
IL_0007: call System.Void ZenUI.Section.ItemIcon::UpdateItemIconAndQuality(InventoryElement,ItemDrop/ItemData,InventoryGrid)
IL_000c: ldarg.1
IL_000d: ldarg.2
IL_000e: call System.Void ZenUI.Section.ItemIcon::UpdateFoodForkColor(InventoryElement,ItemDrop/ItemData)
IL_0013: ret

// System.Void ZenUI.Section.ItemIcon::UpdateHotkeyBarElement(HotkeyBar,HotkeyBar/ElementData,ItemDrop/ItemData)
.locals UnityEngine.UI.Image
IL_0000: ldarg.1
IL_0001: ldfld System.Boolean HotkeyBar/ElementData::m_used
IL_0006: brfalse.s IL_000b
IL_0008: ldarg.2
IL_0009: brtrue.s IL_000c
IL_000b: ret
IL_000c: ldarg.1
IL_000d: ldfld UnityEngine.GameObject HotkeyBar/ElementData::m_equiped
IL_0012: callvirt !!0 UnityEngine.GameObject::GetComponent<UnityEngine.UI.Image>()
IL_0017: stloc.0
IL_0018: ldarg.1
IL_0019: ldfld GuiBar HotkeyBar/ElementData::m_durability
IL_001e: ldarg.1
IL_001f: ldfld UnityEngine.UI.Image HotkeyBar/ElementData::m_icon
IL_0024: ldloc.0
IL_0025: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> ZenUI.Configs::ItemActivatedHotbarColor
IL_002a: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_002f: call System.Void ZenUI.Section.ItemIcon::UpdateItemIcon(GuiBar,UnityEngine.UI.Image,UnityEngine.UI.Image,UnityEngine.Color)
IL_0034: ret

// System.Void ZenUI.Section.ItemIcon::.cctor()
.locals 
IL_0000: call UnityEngine.Color UnityEngine.Color::get_clear()
IL_0005: stsfld UnityEngine.Color ZenUI.Section.ItemIcon::_itemEquippedColorOriginal
IL_000a: ldsflda System.Char ZenUI.Section.ItemIcon::_maxQualitySymbol
IL_000f: call System.String[] ZenUI.Section.ItemIcon::CreateQualityStars(System.Char&)
IL_0014: stsfld System.String[] ZenUI.Section.ItemIcon::_itemQualitySymbols
IL_0019: ret

// System.Void ZenUI.Section.NoticeBiome::ShowBiomeMessage(Player,BiomeSector)
.locals ZenUI.Section.NoticeBiome/<>c__DisplayClass3_0
IL_0000: newobj System.Void ZenUI.Section.NoticeBiome/<>c__DisplayClass3_0::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldarg.0
IL_0008: stfld Player ZenUI.Section.NoticeBiome/<>c__DisplayClass3_0::player
IL_000d: ldloc.0
IL_000e: ldarg.1
IL_000f: stfld BiomeSector ZenUI.Section.NoticeBiome/<>c__DisplayClass3_0::prevBiome
IL_0014: ldloc.0
IL_0015: ldfld Player ZenUI.Section.NoticeBiome/<>c__DisplayClass3_0::player
IL_001a: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_001f: brtrue.s IL_0022
IL_0021: ret
IL_0022: ldloc.0
IL_0023: ldfld Player ZenUI.Section.NoticeBiome/<>c__DisplayClass3_0::player
IL_0028: ldc.r4 3.5
IL_002d: ldloc.0
IL_002e: ldftn System.Void ZenUI.Section.NoticeBiome/<>c__DisplayClass3_0::<ShowBiomeMessage>b__0()
IL_0034: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_0039: call UnityEngine.Coroutine Zen.Lib.Timing::Delay(UnityEngine.MonoBehaviour,System.Single,System.Action)
IL_003e: pop
IL_003f: ret

// System.Void ZenUI.Section.NoticeBiome::Game_SpawnPlayer(Game,Player,System.Boolean)
.locals 
IL_0000: ldarg.2
IL_0001: brfalse.s IL_0004
IL_0003: ret
IL_0004: ldsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.BiomeNoticeType> ZenUI.Configs::NoticeShowBiome
IL_0009: callvirt !0 BepInEx.Configuration.ConfigEntry`1<ZenUI.BiomeNoticeType>::get_Value()
IL_000e: box ZenUI.BiomeNoticeType
IL_0013: ldc.i4.1
IL_0014: box ZenUI.BiomeNoticeType
IL_0019: call System.Boolean System.Enum::HasFlag(System.Enum)
IL_001e: brfalse.s IL_0027
IL_0020: ldarg.1
IL_0021: ldnull
IL_0022: call System.Void ZenUI.Section.NoticeBiome::ShowBiomeMessage(Player,BiomeSector)
IL_0027: ret

// System.Void ZenUI.Section.NoticeBiome::Player_TeleportTo(Player,System.Boolean,System.Boolean)
.locals ZenUI.Section.NoticeBiome/<>c__DisplayClass5_0
IL_0000: newobj System.Void ZenUI.Section.NoticeBiome/<>c__DisplayClass5_0::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldarg.0
IL_0008: stfld Player ZenUI.Section.NoticeBiome/<>c__DisplayClass5_0::__instance
IL_000d: ldsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.BiomeNoticeType> ZenUI.Configs::NoticeShowBiome
IL_0012: callvirt !0 BepInEx.Configuration.ConfigEntry`1<ZenUI.BiomeNoticeType>::get_Value()
IL_0017: box ZenUI.BiomeNoticeType
IL_001c: ldc.i4.2
IL_001d: box ZenUI.BiomeNoticeType
IL_0022: call System.Boolean System.Enum::HasFlag(System.Enum)
IL_0027: brtrue.s IL_002a
IL_0029: ret
IL_002a: ldarg.1
IL_002b: brtrue.s IL_002e
IL_002d: ret
IL_002e: ldarg.2
IL_002f: brtrue.s IL_0032
IL_0031: ret
IL_0032: ldloc.0
IL_0033: call WorldGenerator WorldGenerator::get_instance()
IL_0038: ldloc.0
IL_0039: ldfld Player ZenUI.Section.NoticeBiome/<>c__DisplayClass5_0::__instance
IL_003e: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0043: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0048: ldc.i4.0
IL_0049: callvirt BiomeSector WorldGenerator::GetBiomeSector(UnityEngine.Vector3,System.Boolean)
IL_004e: stfld BiomeSector ZenUI.Section.NoticeBiome/<>c__DisplayClass5_0::prevBiome
IL_0053: ldloc.0
IL_0054: ldfld Player ZenUI.Section.NoticeBiome/<>c__DisplayClass5_0::__instance
IL_0059: ldloc.0
IL_005a: ldfld Player ZenUI.Section.NoticeBiome/<>c__DisplayClass5_0::__instance
IL_005f: dup
IL_0060: ldvirtftn System.Boolean Character::IsTeleporting()
IL_0066: newobj System.Void System.Func`1<System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_006b: ldloc.0
IL_006c: ldftn System.Void ZenUI.Section.NoticeBiome/<>c__DisplayClass5_0::<Player_TeleportTo>b__0()
IL_0072: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_0077: call UnityEngine.Coroutine Zen.Lib.Timing::WhenNot(UnityEngine.MonoBehaviour,System.Func`1<System.Boolean>,System.Action)
IL_007c: pop
IL_007d: ret

// System.Void ZenUI.Section.NoticeBiome::MessageHud_ShowBiomeFoundMsg(System.Boolean&)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.BiomeNoticeType> ZenUI.Configs::NoticeShowBiome
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<ZenUI.BiomeNoticeType>::get_Value()
IL_000a: box ZenUI.BiomeNoticeType
IL_000f: ldc.i4.2
IL_0010: box ZenUI.BiomeNoticeType
IL_0015: call System.Boolean System.Enum::HasFlag(System.Enum)
IL_001a: brtrue.s IL_001d
IL_001c: ret
IL_001d: call System.Double UnityEngine.Time::get_timeAsDouble()
IL_0022: stsfld System.Double ZenUI.Section.NoticeBiome::_lastBiomeMessageTime
IL_0027: ldsfld Player Player::m_localPlayer
IL_002c: callvirt System.Boolean Player::ShowTeleportAnimation()
IL_0031: brfalse.s IL_0036
IL_0033: ldarg.0
IL_0034: ldc.i4.0
IL_0035: stind.i1
IL_0036: ret

// System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> ZenUI.Section.NoticeBiome::Player_AddKnownBiome_Transpiler(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>)
.locals System.Reflection.MethodInfo, System.Action`3<MessageHud,System.String,System.Boolean>
IL_0000: ldtoken MessageHud
IL_0005: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_000a: ldstr "ShowBiomeFoundMsg"
IL_000f: ldnull
IL_0010: ldnull
IL_0011: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_0016: stloc.0
IL_0017: ldsfld System.Action`3<MessageHud,System.String,System.Boolean> ZenUI.Section.NoticeBiome/<>O::<0>__ShowBiomeFoundMsgIntercept
IL_001c: dup
IL_001d: brtrue.s IL_0032
IL_001f: pop
IL_0020: ldnull
IL_0021: ldftn System.Void ZenUI.Section.NoticeBiome::<Player_AddKnownBiome_Transpiler>g__ShowBiomeFoundMsgIntercept|7_0(MessageHud,System.String,System.Boolean)
IL_0027: newobj System.Void System.Action`3<MessageHud,System.String,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_002c: dup
IL_002d: stsfld System.Action`3<MessageHud,System.String,System.Boolean> ZenUI.Section.NoticeBiome/<>O::<0>__ShowBiomeFoundMsgIntercept
IL_0032: stloc.1
IL_0033: ldarg.0
IL_0034: ldloc.0
IL_0035: ldloc.1
IL_0036: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_003b: call System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> HarmonyLib.Transpilers::MethodReplacer(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>,System.Reflection.MethodBase,System.Reflection.MethodBase)
IL_0040: ret

// System.Void ZenUI.Section.NoticeBiome::<Player_AddKnownBiome_Transpiler>g__ShowBiomeFoundMsgIntercept|7_0(MessageHud,System.String,System.Boolean)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.BiomeNoticeType> ZenUI.Configs::NoticeShowBiome
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<ZenUI.BiomeNoticeType>::get_Value()
IL_000a: box ZenUI.BiomeNoticeType
IL_000f: ldc.i4.4
IL_0010: box ZenUI.BiomeNoticeType
IL_0015: call System.Boolean System.Enum::HasFlag(System.Enum)
IL_001a: brfalse.s IL_0024
IL_001c: ldarg.0
IL_001d: ldarg.1
IL_001e: ldarg.2
IL_001f: callvirt System.Void MessageHud::ShowBiomeFoundMsg(System.String,System.Boolean)
IL_0024: ret

// System.Void ZenUI.Section.NoticeBiome/<>c__DisplayClass3_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void ZenUI.Section.NoticeBiome/<>c__DisplayClass3_0::<ShowBiomeMessage>b__0()
.locals BiomeSector, System.String, Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean
IL_0000: call WorldGenerator WorldGenerator::get_instance()
IL_0005: ldarg.0
IL_0006: ldfld Player ZenUI.Section.NoticeBiome/<>c__DisplayClass3_0::player
IL_000b: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0010: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0015: ldc.i4.0
IL_0016: callvirt BiomeSector WorldGenerator::GetBiomeSector(UnityEngine.Vector3,System.Boolean)
IL_001b: stloc.0
IL_001c: ldloc.0
IL_001d: ldc.i4.0
IL_001e: callvirt System.String BiomeSector::GetName(System.Boolean)
IL_0023: stloc.1
IL_0024: ldloc.1
IL_0025: ldarg.0
IL_0026: ldfld BiomeSector ZenUI.Section.NoticeBiome/<>c__DisplayClass3_0::prevBiome
IL_002b: dup
IL_002c: brtrue.s IL_0032
IL_002e: pop
IL_002f: ldnull
IL_0030: br.s IL_0038
IL_0032: ldc.i4.0
IL_0033: call System.String BiomeSector::GetName(System.Boolean)
IL_0038: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_003d: brfalse.s IL_0069
IL_003f: ldc.i4.s 26
IL_0041: ldc.i4.1
IL_0042: ldloca.s V_3
IL_0044: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_0049: stloc.2
IL_004a: ldloc.3
IL_004b: brfalse.s IL_0061
IL_004d: ldloca.s V_2
IL_004f: ldstr "Biome unchanged, skipping "
IL_0054: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0059: ldloca.s V_2
IL_005b: ldloc.1
IL_005c: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_0061: ldloc.2
IL_0062: ldc.i4.0
IL_0063: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_0068: ret
IL_0069: call MessageHud MessageHud::get_instance()
IL_006e: ldfld System.Collections.Generic.Queue`1<MessageHud/BiomeMessage> MessageHud::m_biomeFoundQueue
IL_0073: callvirt System.Int32 System.Collections.Generic.Queue`1<MessageHud/BiomeMessage>::get_Count()
IL_0078: ldc.i4.0
IL_0079: ble.s IL_00a5
IL_007b: ldc.i4.s 39
IL_007d: ldc.i4.1
IL_007e: ldloca.s V_3
IL_0080: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_0085: stloc.2
IL_0086: ldloc.3
IL_0087: brfalse.s IL_009d
IL_0089: ldloca.s V_2
IL_008b: ldstr "Biome message already queued, skipping "
IL_0090: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0095: ldloca.s V_2
IL_0097: ldloc.0
IL_0098: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<BiomeSector>(!!0)
IL_009d: ldloc.2
IL_009e: ldc.i4.0
IL_009f: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_00a4: ret
IL_00a5: call System.Double UnityEngine.Time::get_timeAsDouble()
IL_00aa: ldsfld System.Double ZenUI.Section.NoticeBiome::_lastBiomeMessageTime
IL_00af: ldc.r8 0
IL_00b8: add
IL_00b9: bge.un.s IL_0101
IL_00bb: ldc.i4.s 54
IL_00bd: ldc.i4.2
IL_00be: ldloca.s V_3
IL_00c0: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_00c5: stloc.2
IL_00c6: ldloc.3
IL_00c7: brfalse.s IL_00f9
IL_00c9: ldloca.s V_2
IL_00cb: ldstr "Biome message recently displayed, cooldown: "
IL_00d0: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_00d5: ldloca.s V_2
IL_00d7: ldc.r8 0
IL_00e0: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Double>(!!0)
IL_00e5: ldloca.s V_2
IL_00e7: ldstr " skipping "
IL_00ec: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_00f1: ldloca.s V_2
IL_00f3: ldloc.0
IL_00f4: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<BiomeSector>(!!0)
IL_00f9: ldloc.2
IL_00fa: ldc.i4.0
IL_00fb: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_0100: ret
IL_0101: ldc.i4.s 21
IL_0103: ldc.i4.1
IL_0104: ldloca.s V_3
IL_0106: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_010b: stloc.2
IL_010c: ldloc.3
IL_010d: brfalse.s IL_0123
IL_010f: ldloca.s V_2
IL_0111: ldstr "Show biome messsage: "
IL_0116: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_011b: ldloca.s V_2
IL_011d: ldloc.1
IL_011e: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_0123: ldloc.2
IL_0124: ldc.i4.0
IL_0125: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_012a: call MessageHud MessageHud::get_instance()
IL_012f: ldloc.1
IL_0130: ldc.i4.1
IL_0131: callvirt System.Void MessageHud::ShowBiomeFoundMsg(System.String,System.Boolean)
IL_0136: ret

// System.Void ZenUI.Section.NoticeBiome/<>c__DisplayClass5_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void ZenUI.Section.NoticeBiome/<>c__DisplayClass5_0::<Player_TeleportTo>b__0()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld Player ZenUI.Section.NoticeBiome/<>c__DisplayClass5_0::__instance
IL_0006: ldarg.0
IL_0007: ldfld BiomeSector ZenUI.Section.NoticeBiome/<>c__DisplayClass5_0::prevBiome
IL_000c: call System.Void ZenUI.Section.NoticeBiome::ShowBiomeMessage(Player,BiomeSector)
IL_0011: ret

// System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> ZenUI.Section.NoticePieceRepair::Player_Repair(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>)
.locals System.Reflection.MethodInfo, System.Action`6<Character,MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean>
IL_0000: ldtoken Character
IL_0005: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_000a: ldstr "Message"
IL_000f: ldnull
IL_0010: ldnull
IL_0011: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_0016: stloc.0
IL_0017: ldsfld System.Action`6<Character,MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean> ZenUI.Section.NoticePieceRepair/<>O::<0>__SuppressMessage
IL_001c: dup
IL_001d: brtrue.s IL_0032
IL_001f: pop
IL_0020: ldnull
IL_0021: ldftn System.Void ZenUI.Section.NoticePieceRepair::<Player_Repair>g__SuppressMessage|0_0(Character,MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_0027: newobj System.Void System.Action`6<Character,MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_002c: dup
IL_002d: stsfld System.Action`6<Character,MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean> ZenUI.Section.NoticePieceRepair/<>O::<0>__SuppressMessage
IL_0032: stloc.1
IL_0033: ldarg.0
IL_0034: ldloc.0
IL_0035: ldloc.1
IL_0036: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_003b: call System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> HarmonyLib.Transpilers::MethodReplacer(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>,System.Reflection.MethodBase,System.Reflection.MethodBase)
IL_0040: ret

// System.Void ZenUI.Section.NoticePieceRepair::<Player_Repair>g__SuppressMessage|0_0(Character,MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::NoticeShowPieceRepair
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse.s IL_0019
IL_000c: ldarg.0
IL_000d: ldarg.1
IL_000e: ldarg.2
IL_000f: ldarg.3
IL_0010: ldarg.s icon
IL_0012: ldarg.s log
IL_0014: callvirt System.Void Character::Message(MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_0019: ret

// System.Void ZenUI.Section.PanelSlide::InventoryGui_Show(InventoryGui,Container)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::NoSlideAnimation
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse.s IL_0014
IL_000c: ldarg.0
IL_000d: ldc.i4.1
IL_000e: ldarg.1
IL_000f: call System.Void ZenUI.Section.PanelSlide::ToggleVisibleNoSlide(InventoryGui,System.Boolean,Container)
IL_0014: ret

// System.Void ZenUI.Section.PanelSlide::InventoryGui_Hide(InventoryGui)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::NoSlideAnimation
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: ldarg.0
IL_000e: ldc.i4.0
IL_000f: ldnull
IL_0010: call System.Void ZenUI.Section.PanelSlide::ToggleVisibleNoSlide(InventoryGui,System.Boolean,Container)
IL_0015: ldarg.0
IL_0016: ldfld TMPro.TMP_Text InventoryGui::m_containerName
IL_001b: ldsfld System.String System.String::Empty
IL_0020: callvirt System.Void TMPro.TMP_Text::set_text(System.String)
IL_0025: ldarg.0
IL_0026: callvirt InventoryGrid InventoryGui::get_ContainerGrid()
IL_002b: call System.Void ZenUI.Section.PanelSlide::DisableAllElements(InventoryGrid)
IL_0030: ret

// System.Void ZenUI.Section.PanelSlide::ToggleVisibleNoSlide(InventoryGui,System.Boolean,Container)
.locals System.String
IL_0000: ldarg.1
IL_0001: brfalse.s IL_001e
IL_0003: ldarg.2
IL_0004: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0009: brtrue.s IL_003c
IL_000b: ldarg.0
IL_000c: ldfld UnityEngine.RectTransform InventoryGui::m_container
IL_0011: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0016: ldc.i4.0
IL_0017: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_001c: br.s IL_003c
IL_001e: ldarg.0
IL_001f: ldfld Container InventoryGui::m_currentContainer
IL_0024: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0029: brfalse.s IL_003c
IL_002b: ldarg.0
IL_002c: ldfld UnityEngine.RectTransform InventoryGui::m_container
IL_0031: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0036: ldc.i4.1
IL_0037: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_003c: ldarg.1
IL_003d: brtrue.s IL_0046
IL_003f: ldstr "inventory_hide"
IL_0044: br.s IL_004b
IL_0046: ldstr "inventory_show"
IL_004b: stloc.0
IL_004c: ldarg.0
IL_004d: ldfld UnityEngine.Animator InventoryGui::m_animator
IL_0052: ldloc.0
IL_0053: ldc.i4.0
IL_0054: ldc.r4 1
IL_0059: callvirt System.Void UnityEngine.Animator::Play(System.String,System.Int32,System.Single)
IL_005e: ldarg.0
IL_005f: ldfld UnityEngine.Animator InventoryGui::m_animator
IL_0064: ldc.r4 0
IL_0069: callvirt System.Void UnityEngine.Animator::Update(System.Single)
IL_006e: ret

// System.Void ZenUI.Section.PanelSlide::DisableAllElements(InventoryGrid)
.locals System.Collections.Generic.List`1/Enumerator<InventoryElement>, InventoryElement
IL_0000: ldarg.0
IL_0001: ldnull
IL_0002: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0007: brfalse.s IL_000a
IL_0009: ret
IL_000a: ldarg.0
IL_000b: ldfld System.Collections.Generic.List`1<InventoryElement> InventoryGrid::m_elements
IL_0010: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<InventoryElement>::GetEnumerator()
IL_0015: stloc.0
IL_0016: br.s IL_0027
IL_0018: ldloca.s V_0
IL_001a: call !0 System.Collections.Generic.List`1/Enumerator<InventoryElement>::get_Current()
IL_001f: stloc.1
IL_0020: ldarg.0
IL_0021: ldloc.1
IL_0022: call System.Void Zen.Lib.InventoryGridExt::DisableElement(InventoryGrid,InventoryElement)
IL_0027: ldloca.s V_0
IL_0029: call System.Boolean System.Collections.Generic.List`1/Enumerator<InventoryElement>::MoveNext()
IL_002e: brtrue.s IL_0018
IL_0030: leave.s IL_0040
IL_0032: ldloca.s V_0
IL_0034: constrained. System.Collections.Generic.List`1/Enumerator<InventoryElement>
IL_003a: callvirt System.Void System.IDisposable::Dispose()
IL_003f: endfinally
IL_0040: ret
// EH Finally: 22 - 50 => 50 - 64

// System.Void ZenUI.Section.PieceHealthColor::Hud_UpdateCrosshair(Hud)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::ShowPieceHealthColor
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: ldarg.0
IL_000e: ldfld UnityEngine.RectTransform Hud::m_pieceHealthRoot
IL_0013: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0018: callvirt System.Boolean UnityEngine.GameObject::get_activeSelf()
IL_001d: brtrue.s IL_0020
IL_001f: ret
IL_0020: ldarg.0
IL_0021: ldfld GuiBar Hud::m_pieceHealthBar
IL_0026: ldarg.0
IL_0027: ldfld GuiBar Hud::m_pieceHealthBar
IL_002c: ldfld System.Single GuiBar::m_value
IL_0031: ldc.r4 1
IL_0036: ldc.r4 1
IL_003b: ldc.r4 1
IL_0040: call UnityEngine.Color ZenUI.Section.PieceHealthColor::AdjustColor(System.Single,System.Single,System.Single,System.Single)
IL_0045: callvirt System.Void GuiBar::SetColor(UnityEngine.Color)
IL_004a: ret

// System.Void ZenUI.Section.PieceHealthColor::ResetColor()
.locals 
IL_0000: call Hud Hud::get_instance()
IL_0005: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000a: brfalse.s IL_001b
IL_000c: call Hud Hud::get_instance()
IL_0011: ldfld GuiBar Hud::m_pieceHealthBar
IL_0016: callvirt System.Void GuiBar::ResetColor()
IL_001b: ret

// UnityEngine.Color ZenUI.Section.PieceHealthColor::AdjustColor(System.Single,System.Single,System.Single,System.Single)
.locals 
IL_0000: ldarg.1
IL_0001: ldc.r4 0
IL_0006: bgt.un.s IL_000e
IL_0008: call UnityEngine.Color UnityEngine.Color::get_red()
IL_000d: ret
IL_000e: ldarg.0
IL_000f: ldarg.1
IL_0010: div
IL_0011: call System.Single UnityEngine.Mathf::Clamp01(System.Single)
IL_0016: ldc.r4 0.33333334
IL_001b: mul
IL_001c: ldarg.2
IL_001d: call System.Single UnityEngine.Mathf::Clamp01(System.Single)
IL_0022: ldarg.3
IL_0023: call System.Single UnityEngine.Mathf::Clamp01(System.Single)
IL_0028: call UnityEngine.Color UnityEngine.Color::HSVToRGB(System.Single,System.Single,System.Single)
IL_002d: ret

// System.Void ZenUI.Section.ShipHud::Init()
.locals 
IL_0000: call Hud Hud::get_instance()
IL_0005: ldfld UnityEngine.RectTransform Hud::m_pieceHealthRoot
IL_000a: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_000f: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localPosition()
IL_0014: stsfld UnityEngine.Vector3 ZenUI.Section.ShipHud::_hpBarPosDefault
IL_0019: ldc.r4 -50
IL_001e: ldc.r4 20
IL_0023: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single)
IL_0028: stsfld UnityEngine.Vector3 ZenUI.Section.ShipHud::_hpBarPosShip
IL_002d: call System.Boolean ZenUI.Section.ShipHud::ClearCache()
IL_0032: pop
IL_0033: ret

// System.Boolean ZenUI.Section.ShipHud::ClearCache()
.locals 
IL_0000: ldsflda System.ValueTuple`2<Ship,WearNTear> ZenUI.Section.ShipHud::Cache
IL_0005: initobj System.ValueTuple`2<Ship,WearNTear>
IL_000b: ldc.i4.0
IL_000c: ret

// System.Void ZenUI.Section.ShipHud::Hud_UpdateShipHud(Hud)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::ShowShipSailIndicator
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse.s IL_000d
IL_000c: ret
IL_000d: ldarg.0
IL_000e: ldfld UnityEngine.GameObject Hud::m_shipHudRoot
IL_0013: callvirt System.Boolean UnityEngine.GameObject::get_activeSelf()
IL_0018: brtrue.s IL_001b
IL_001a: ret
IL_001b: ldarg.0
IL_001c: ldfld UnityEngine.GameObject Hud::m_fullSail
IL_0021: ldc.i4.0
IL_0022: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0027: ldarg.0
IL_0028: ldfld UnityEngine.GameObject Hud::m_halfSail
IL_002d: ldc.i4.0
IL_002e: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0033: ret

// System.Void ZenUI.Section.ShipHud::Hud_UpdateCrosshair(Player,Hud)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::ShowShipHP
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse.s IL_0012
IL_000c: call System.Void ZenUI.Section.ShipHud::ShowShipHP()
IL_0011: ret
IL_0012: call System.Boolean ZenUI.Section.ShipHud::ClearCache()
IL_0017: pop
IL_0018: ret

// System.Void ZenUI.Section.ShipHud::ShowShipHP()
.locals UnityEngine.Transform, UnityEngine.Transform, UnityEngine.Transform, UnityEngine.Transform
IL_0000: call Hud Hud::get_instance()
IL_0005: ldfld UnityEngine.RectTransform Hud::m_pieceHealthRoot
IL_000a: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_000f: stloc.0
IL_0010: call Hud Hud::get_instance()
IL_0015: ldfld UnityEngine.GameObject Hud::m_shipControlsRoot
IL_001a: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_001f: stloc.1
IL_0020: call Hud Hud::get_instance()
IL_0025: ldfld UnityEngine.UI.Image Hud::m_crosshair
IL_002a: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_002f: callvirt UnityEngine.Transform UnityEngine.Transform::get_parent()
IL_0034: stloc.2
IL_0035: call System.Boolean ZenUI.Section.ShipHud::<ShowShipHP>g__TryUpdateShipHP|7_0()
IL_003a: brtrue.s IL_003f
IL_003c: ldloc.2
IL_003d: br.s IL_0040
IL_003f: ldloc.1
IL_0040: stloc.3
IL_0041: ldloc.0
IL_0042: callvirt UnityEngine.Transform UnityEngine.Transform::get_parent()
IL_0047: ldloc.3
IL_0048: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_004d: brfalse.s IL_0050
IL_004f: ret
IL_0050: ldloc.0
IL_0051: ldloc.3
IL_0052: ldc.i4.0
IL_0053: callvirt System.Void UnityEngine.Transform::SetParent(UnityEngine.Transform,System.Boolean)
IL_0058: ldloc.0
IL_0059: ldloc.0
IL_005a: callvirt UnityEngine.Transform UnityEngine.Transform::get_parent()
IL_005f: ldloc.1
IL_0060: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0065: brtrue.s IL_006e
IL_0067: ldsfld UnityEngine.Vector3 ZenUI.Section.ShipHud::_hpBarPosDefault
IL_006c: br.s IL_0073
IL_006e: ldsfld UnityEngine.Vector3 ZenUI.Section.ShipHud::_hpBarPosShip
IL_0073: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_0078: ret

// System.Boolean ZenUI.Section.ShipHud::<ShowShipHP>g__TryUpdateShipHP|7_0()
.locals Player, Ship, WearNTear
IL_0000: ldsfld Player Player::m_localPlayer
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: call System.Boolean Zen.Lib.PlayerExt::IsReady(Player)
IL_000c: brfalse.s IL_0016
IL_000e: ldloc.0
IL_000f: callvirt System.Boolean Character::IsAttachedToShip()
IL_0014: brtrue.s IL_001c
IL_0016: call System.Boolean ZenUI.Section.ShipHud::ClearCache()
IL_001b: ret
IL_001c: ldloc.0
IL_001d: callvirt Ship Player::GetControlledShip()
IL_0022: stloc.1
IL_0023: ldloc.1
IL_0024: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0029: brtrue.s IL_0031
IL_002b: call System.Boolean ZenUI.Section.ShipHud::ClearCache()
IL_0030: ret
IL_0031: ldsflda System.ValueTuple`2<Ship,WearNTear> ZenUI.Section.ShipHud::Cache
IL_0036: ldfld !0 System.ValueTuple`2<Ship,WearNTear>::Item1
IL_003b: ldloc.1
IL_003c: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0041: brtrue.s IL_0046
IL_0043: ldnull
IL_0044: br.s IL_0050
IL_0046: ldsflda System.ValueTuple`2<Ship,WearNTear> ZenUI.Section.ShipHud::Cache
IL_004b: ldfld !1 System.ValueTuple`2<Ship,WearNTear>::Item2
IL_0050: stloc.2
IL_0051: ldloc.2
IL_0052: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0057: brtrue.s IL_0069
IL_0059: ldloc.1
IL_005a: ldloca.s V_2
IL_005c: callvirt System.Boolean UnityEngine.Component::TryGetComponent<WearNTear>(!!0&)
IL_0061: brtrue.s IL_0069
IL_0063: call System.Boolean ZenUI.Section.ShipHud::ClearCache()
IL_0068: ret
IL_0069: ldloc.1
IL_006a: ldloc.2
IL_006b: newobj System.Void System.ValueTuple`2<Ship,WearNTear>::.ctor(!0,!1)
IL_0070: stsfld System.ValueTuple`2<Ship,WearNTear> ZenUI.Section.ShipHud::Cache
IL_0075: call Hud Hud::get_instance()
IL_007a: ldfld UnityEngine.RectTransform Hud::m_pieceHealthRoot
IL_007f: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0084: ldc.i4.1
IL_0085: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_008a: call Hud Hud::get_instance()
IL_008f: ldfld GuiBar Hud::m_pieceHealthBar
IL_0094: ldloc.2
IL_0095: callvirt System.Single WearNTear::GetHealthPercentage()
IL_009a: callvirt System.Void GuiBar::SetValue(System.Single)
IL_009f: ldc.i4.1
IL_00a0: ret

// System.Void ZenUI.Section.SkillsPanel::InventoryGui_Show(InventoryGui,Container)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::AutoOpenSkillsPanel
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: ldsfld Player Player::m_localPlayer
IL_0012: ldfld CraftingStation Player::m_currentStation
IL_0017: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_001c: brtrue.s IL_0039
IL_001e: ldarg.1
IL_001f: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0024: brtrue.s IL_0039
IL_0026: ldarg.0
IL_0027: ldarg.0
IL_0028: ldftn System.Void InventoryGui::OnOpenSkills()
IL_002e: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_0033: call UnityEngine.Coroutine Zen.Lib.Timing::NextFrame(UnityEngine.MonoBehaviour,System.Action)
IL_0038: pop
IL_0039: ret

// System.Void ZenUI.Section.SkillsPanel::SkillsDialog_Setup(SkillsDialog,System.Boolean&)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::AutoOpenSkillsPanel
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: call InventoryGui InventoryGui::get_instance()
IL_0012: callvirt System.Boolean InventoryGui::get_IsSkillsPanelOpen()
IL_0017: brtrue.s IL_001a
IL_0019: ret
IL_001a: ldarg.0
IL_001b: callvirt System.Void SkillsDialog::OnClose()
IL_0020: ldarg.1
IL_0021: ldc.i4.0
IL_0022: stind.i1
IL_0023: ret

// System.Void ZenUI.Section.SkillsPanel::InventoryGui_OnOpenSkills(InventoryGui)
.locals SkillsDialog, UnityEngine.Transform, UnityEngine.GameObject
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::AutoOpenSkillsPanel
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: ldarg.0
IL_000e: ldfld SkillsDialog InventoryGui::m_skillsDialog
IL_0013: stloc.0
IL_0014: ldloc.0
IL_0015: callvirt !!0 UnityEngine.Component::GetComponent<UIGroupHandler>()
IL_001a: stsfld UIGroupHandler ZenUI.Section.SkillsPanel::_skillsUIGroup
IL_001f: ldarg.0
IL_0020: ldfld UIGroupHandler[] InventoryGui::m_uiGroups
IL_0025: ldsfld UIGroupHandler ZenUI.Section.SkillsPanel::_skillsUIGroup
IL_002a: call System.Boolean System.Linq.Enumerable::Contains<UIGroupHandler>(System.Collections.Generic.IEnumerable`1<!!0>,!!0)
IL_002f: brfalse.s IL_0032
IL_0031: ret
IL_0032: ldloc.0
IL_0033: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0038: ldstr "SkillsFrame"
IL_003d: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0042: stloc.1
IL_0043: ldarg.0
IL_0044: ldfld UnityEngine.Transform InventoryGui::m_infoPanel
IL_0049: ldstr "selected_frame"
IL_004e: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0053: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0058: ldloc.1
IL_0059: ldc.i4.0
IL_005a: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Transform,System.Boolean)
IL_005f: stloc.2
IL_0060: ldloc.2
IL_0061: ldloc.2
IL_0062: callvirt System.String UnityEngine.Object::get_name()
IL_0067: ldstr "(Clone)"
IL_006c: ldstr ""
IL_0071: callvirt System.String System.String::Replace(System.String,System.String)
IL_0076: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_007b: ldloc.2
IL_007c: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0081: callvirt System.Void UnityEngine.Transform::SetAsFirstSibling()
IL_0086: ldsfld UIGroupHandler ZenUI.Section.SkillsPanel::_skillsUIGroup
IL_008b: ldc.i4.1
IL_008c: callvirt System.Void UnityEngine.Behaviour::set_enabled(System.Boolean)
IL_0091: ldsfld UIGroupHandler ZenUI.Section.SkillsPanel::_skillsUIGroup
IL_0096: ldc.i4.1
IL_0097: stfld System.Int32 UIGroupHandler::m_groupPriority
IL_009c: ldsfld UIGroupHandler ZenUI.Section.SkillsPanel::_skillsUIGroup
IL_00a1: ldloc.2
IL_00a2: stfld UnityEngine.GameObject UIGroupHandler::m_enableWhenActiveAndGamepad
IL_00a7: ldsfld UIGroupHandler ZenUI.Section.SkillsPanel::_skillsUIGroup
IL_00ac: ldc.i4.0
IL_00ad: callvirt System.Void UIGroupHandler::SetActive(System.Boolean)
IL_00b2: ldarg.0
IL_00b3: ldarg.0
IL_00b4: ldfld UIGroupHandler[] InventoryGui::m_uiGroups
IL_00b9: ldsfld UIGroupHandler ZenUI.Section.SkillsPanel::_skillsUIGroup
IL_00be: call !!0[] HarmonyLib.CollectionExtensions::AddToArray<UIGroupHandler>(!!0[],!!0)
IL_00c3: stfld UIGroupHandler[] InventoryGui::m_uiGroups
IL_00c8: ldloc.0
IL_00c9: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_00ce: ldstr "Closebutton"
IL_00d3: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_00d8: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_00dd: ldc.i4.0
IL_00de: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_00e3: ldloc.0
IL_00e4: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_00e9: ldstr "darken"
IL_00ee: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_00f3: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_00f8: ldc.i4.0
IL_00f9: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_00fe: ldloc.0
IL_00ff: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.CanvasGroup>()
IL_0104: ldc.i4.0
IL_0105: callvirt System.Void UnityEngine.Behaviour::set_enabled(System.Boolean)
IL_010a: ldloc.0
IL_010b: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0110: ldc.i4.1
IL_0111: callvirt System.Void UnityEngine.Transform::SetSiblingIndex(System.Int32)
IL_0116: ret

// System.Void ZenUI.Section.SkillsPanel::SkillsDialog_Update(SkillsDialog,System.Boolean&)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::AutoOpenSkillsPanel
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: call System.Boolean ZInput::IsGamepadActive()
IL_0012: brtrue.s IL_0015
IL_0014: ret
IL_0015: ldsfld UIGroupHandler ZenUI.Section.SkillsPanel::_skillsUIGroup
IL_001a: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_001f: brtrue.s IL_0022
IL_0021: ret
IL_0022: ldsfld UIGroupHandler ZenUI.Section.SkillsPanel::_skillsUIGroup
IL_0027: callvirt System.Boolean UIGroupHandler::get_IsActive()
IL_002c: brtrue.s IL_0031
IL_002e: ldarg.1
IL_002f: ldc.i4.0
IL_0030: stind.i1
IL_0031: ret

// System.Void ZenUI.Section.SkillsPanel::SkillsDialog_OnClose(SkillsDialog,System.Boolean&)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::AutoOpenSkillsPanel
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: call System.Boolean ZenUI.Section.SkillsPanel::CloseOtherPanel()
IL_0012: brfalse.s IL_0017
IL_0014: ldarg.1
IL_0015: ldc.i4.0
IL_0016: stind.i1
IL_0017: ret

// System.Boolean ZenUI.Section.SkillsPanel::CloseOtherPanel()
.locals InventoryGui
IL_0000: call InventoryGui InventoryGui::get_instance()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldfld UnityEngine.GameObject InventoryGui::m_trophiesPanel
IL_000c: call System.Boolean ZenUI.Section.SkillsPanel::CloseIfOpen(UnityEngine.GameObject)
IL_0011: brtrue.s IL_0048
IL_0013: ldloc.0
IL_0014: ldfld SplitDialog InventoryGui::m_splitDialog
IL_0019: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_001e: call System.Boolean ZenUI.Section.SkillsPanel::CloseIfOpen(UnityEngine.GameObject)
IL_0023: brtrue.s IL_0048
IL_0025: ldloc.0
IL_0026: ldfld TextsDialog InventoryGui::m_textsDialog
IL_002b: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0030: call System.Boolean ZenUI.Section.SkillsPanel::CloseIfOpen(UnityEngine.GameObject)
IL_0035: brtrue.s IL_0048
IL_0037: ldloc.0
IL_0038: ldfld VariantDialog InventoryGui::m_variantDialog
IL_003d: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0042: call System.Boolean ZenUI.Section.SkillsPanel::CloseIfOpen(UnityEngine.GameObject)
IL_0047: ret
IL_0048: ldc.i4.1
IL_0049: ret

// System.Boolean ZenUI.Section.SkillsPanel::CloseIfOpen(UnityEngine.GameObject)
.locals 
IL_0000: ldarg.0
IL_0001: callvirt System.Boolean UnityEngine.GameObject::get_activeSelf()
IL_0006: brtrue.s IL_000a
IL_0008: ldc.i4.0
IL_0009: ret
IL_000a: ldarg.0
IL_000b: ldc.i4.0
IL_000c: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0011: ldc.i4.1
IL_0012: ret

// System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> ZenUI.Section.SkillsPanel::InventoryGui_SetActiveGroup(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>)
.locals 
IL_0000: ldarg.0
IL_0001: ldnull
IL_0002: newobj System.Void HarmonyLib.CodeMatcher::.ctor(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>,System.Reflection.Emit.ILGenerator)
IL_0007: ldc.i4.3
IL_0008: newarr HarmonyLib.CodeMatch
IL_000d: dup
IL_000e: ldc.i4.0
IL_000f: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldarg_0
IL_0014: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_0019: ldnull
IL_001a: ldnull
IL_001b: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0020: stelem.ref
IL_0021: dup
IL_0022: ldc.i4.1
IL_0023: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldarg_1
IL_0028: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_002d: ldnull
IL_002e: ldnull
IL_002f: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0034: stelem.ref
IL_0035: dup
IL_0036: ldc.i4.2
IL_0037: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Stfld
IL_003c: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_0041: ldnull
IL_0042: ldnull
IL_0043: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0048: stelem.ref
IL_0049: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::MatchStartForward(HarmonyLib.CodeMatch[])
IL_004e: ldstr "Unable to match IL"
IL_0053: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::ThrowIfInvalid(System.String)
IL_0058: ldc.i4.2
IL_0059: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Advance(System.Int32)
IL_005e: ldc.i4.1
IL_005f: newarr HarmonyLib.CodeInstruction
IL_0064: dup
IL_0065: ldc.i4.0
IL_0066: ldtoken ZenUI.Section.SkillsPanel
IL_006b: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0070: ldstr "SetActiveGroupIndexIntercept"
IL_0075: ldnull
IL_0076: ldnull
IL_0077: call HarmonyLib.CodeInstruction HarmonyLib.CodeInstruction::Call(System.Type,System.String,System.Type[],System.Type[])
IL_007c: stelem.ref
IL_007d: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Insert(HarmonyLib.CodeInstruction[])
IL_0082: callvirt System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> HarmonyLib.CodeMatcher::InstructionEnumeration()
IL_0087: ret

// System.Int32 ZenUI.Section.SkillsPanel::SetActiveGroupIndexIntercept(System.Int32)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::AutoOpenSkillsPanel
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse.s IL_0018
IL_000c: call InventoryGui InventoryGui::get_instance()
IL_0011: callvirt System.Boolean InventoryGui::get_IsSkillsPanelOpen()
IL_0016: brfalse.s IL_001a
IL_0018: ldarg.0
IL_0019: ret
IL_001a: ldsfld UIGroupHandler ZenUI.Section.SkillsPanel::_skillsUIGroup
IL_001f: ldsfld InventoryGui InventoryGui::m_instance
IL_0024: ldfld UIGroupHandler[] InventoryGui::m_uiGroups
IL_0029: ldarg.0
IL_002a: ldelem.ref
IL_002b: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0030: brfalse.s IL_0036
IL_0032: ldarg.0
IL_0033: ldc.i4.1
IL_0034: sub
IL_0035: ret
IL_0036: ldarg.0
IL_0037: ret

// System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> ZenUI.Section.SkillsPanel::KeyHints_UpdateHints(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>)
.locals System.Reflection.MethodInfo, System.Reflection.MethodInfo
IL_0000: ldtoken InventoryGui
IL_0005: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_000a: ldstr "IsSkillsPanelOpen"
IL_000f: call System.Reflection.MethodInfo HarmonyLib.AccessTools::PropertyGetter(System.Type,System.String)
IL_0014: stloc.0
IL_0015: ldtoken ZenUI.Section.SkillsPanel
IL_001a: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_001f: ldstr "IsSkillsPanelOpenIntercept"
IL_0024: ldnull
IL_0025: ldnull
IL_0026: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_002b: stloc.1
IL_002c: ldarg.0
IL_002d: ldloc.0
IL_002e: ldloc.1
IL_002f: call System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> HarmonyLib.Transpilers::MethodReplacer(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>,System.Reflection.MethodBase,System.Reflection.MethodBase)
IL_0034: ret

// System.Boolean ZenUI.Section.SkillsPanel::IsSkillsPanelOpenIntercept(InventoryGui)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::AutoOpenSkillsPanel
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_0013
IL_000c: ldarg.0
IL_000d: callvirt System.Boolean InventoryGui::get_IsSkillsPanelOpen()
IL_0012: ret
IL_0013: ldc.i4.0
IL_0014: ret

// System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> ZenUI.Section.StatusEffectRules::SEMan_GetHUDStatusEffects_Transpiler(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>)
.locals System.Func`3<StatusEffect,System.Collections.Generic.List`1<StatusEffect>,System.Boolean>, HarmonyLib.CodeMatch[]
IL_0000: ldsfld System.Func`3<StatusEffect,System.Collections.Generic.List`1<StatusEffect>,System.Boolean> ZenUI.Section.StatusEffectRules/<>O::<0>__ShowStatusEffect
IL_0005: dup
IL_0006: brtrue.s IL_001b
IL_0008: pop
IL_0009: ldnull
IL_000a: ldftn System.Boolean ZenUI.Section.StatusEffectRules::ShowStatusEffect(StatusEffect,System.Collections.Generic.List`1<StatusEffect>)
IL_0010: newobj System.Void System.Func`3<StatusEffect,System.Collections.Generic.List`1<StatusEffect>,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0015: dup
IL_0016: stsfld System.Func`3<StatusEffect,System.Collections.Generic.List`1<StatusEffect>,System.Boolean> ZenUI.Section.StatusEffectRules/<>O::<0>__ShowStatusEffect
IL_001b: stloc.0
IL_001c: ldc.i4.3
IL_001d: newarr HarmonyLib.CodeMatch
IL_0022: dup
IL_0023: ldc.i4.0
IL_0024: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldloc_1
IL_0029: call HarmonyLib.CodeMatch HarmonyLib.CodeMatch::op_Implicit(System.Reflection.Emit.OpCode)
IL_002e: stelem.ref
IL_002f: dup
IL_0030: ldc.i4.1
IL_0031: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldfld
IL_0036: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_003b: ldtoken StatusEffect
IL_0040: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0045: ldstr "m_icon"
IL_004a: call System.Reflection.FieldInfo HarmonyLib.AccessTools::Field(System.Type,System.String)
IL_004f: ldnull
IL_0050: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0055: stelem.ref
IL_0056: dup
IL_0057: ldc.i4.2
IL_0058: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_005d: call HarmonyLib.CodeMatch HarmonyLib.CodeMatch::op_Implicit(System.Reflection.Emit.OpCode)
IL_0062: stelem.ref
IL_0063: stloc.1
IL_0064: ldarg.0
IL_0065: ldnull
IL_0066: newobj System.Void HarmonyLib.CodeMatcher::.ctor(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>,System.Reflection.Emit.ILGenerator)
IL_006b: ldloc.1
IL_006c: call HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::MatchStartForward(HarmonyLib.CodeMatch[])
IL_0071: ldstr "Unable to match IL sequence"
IL_0076: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::ThrowIfInvalid(System.String)
IL_007b: ldc.i4.1
IL_007c: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Advance(System.Int32)
IL_0081: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldarg_1
IL_0086: ldnull
IL_0087: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::SetAndAdvance(System.Reflection.Emit.OpCode,System.Object)
IL_008c: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_0091: ldloc.0
IL_0092: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_0097: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Set(System.Reflection.Emit.OpCode,System.Object)
IL_009c: callvirt System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> HarmonyLib.CodeMatcher::InstructionEnumeration()
IL_00a1: ret

// System.Boolean ZenUI.Section.StatusEffectRules::ShowStatusEffect(StatusEffect,System.Collections.Generic.List`1<StatusEffect>)
.locals 
IL_0000: ldarg.1
IL_0001: call Hud Hud::get_instance()
IL_0006: ldfld System.Collections.Generic.List`1<StatusEffect> Hud::m_tempStatusEffects
IL_000b: bne.un.s IL_0036
IL_000d: ldarg.0
IL_000e: ldfld UnityEngine.Sprite StatusEffect::m_icon
IL_0013: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0018: brfalse.s IL_0034
IL_001a: ldsfld BepInEx.Configuration.ConfigEntry`1<Zen.Lib.Config.StringList> ZenUI.Configs::HideStatusEffects
IL_001f: callvirt !0 BepInEx.Configuration.ConfigEntry`1<Zen.Lib.Config.StringList>::get_Value()
IL_0024: ldarg.0
IL_0025: ldfld System.String StatusEffect::m_name
IL_002a: ldc.i4.1
IL_002b: callvirt System.Boolean Zen.Lib.Config.StringList::Contains(System.String,System.Boolean)
IL_0030: ldc.i4.0
IL_0031: ceq
IL_0033: ret
IL_0034: ldc.i4.0
IL_0035: ret
IL_0036: ldarg.0
IL_0037: ldfld UnityEngine.Sprite StatusEffect::m_icon
IL_003c: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0041: ret

// System.Void ZenUI.Section.StatusEffectRules::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// TMPro.TMP_Text ZenUI.Section.SystemClock::get_ClockUI()
.locals 
IL_0000: ldsfld TMPro.TMP_Text ZenUI.Section.SystemClock::_clockUI
IL_0005: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000a: brtrue.s IL_0018
IL_000c: call TMPro.TMP_Text ZenUI.Section.SystemClock::CreateClockUI()
IL_0011: dup
IL_0012: stsfld TMPro.TMP_Text ZenUI.Section.SystemClock::_clockUI
IL_0017: ret
IL_0018: ldsfld TMPro.TMP_Text ZenUI.Section.SystemClock::_clockUI
IL_001d: ret

// System.Void ZenUI.Section.SystemClock::.cctor()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.Section.SystemClock/DisplayMode> ZenUI.Configs::ShowSystemClock
IL_0005: ldsfld ZenUI.Section.SystemClock/<>c ZenUI.Section.SystemClock/<>c::<>9
IL_000a: ldftn System.Void ZenUI.Section.SystemClock/<>c::<.cctor>b__5_0(System.Object,System.EventArgs)
IL_0010: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_0015: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<ZenUI.Section.SystemClock/DisplayMode>::add_SettingChanged(System.EventHandler)
IL_001a: ret

// System.Void ZenUI.Section.SystemClock::Init()
.locals 
IL_0000: call ZNet ZNet::get_instance()
IL_0005: callvirt System.Boolean ZNet::IsDedicated()
IL_000a: brfalse.s IL_000d
IL_000c: ret
IL_000d: call Hud Hud::get_instance()
IL_0012: call System.Collections.IEnumerator ZenUI.Section.SystemClock::UpdateClock()
IL_0017: callvirt UnityEngine.Coroutine UnityEngine.MonoBehaviour::StartCoroutine(System.Collections.IEnumerator)
IL_001c: stsfld UnityEngine.Coroutine ZenUI.Section.SystemClock::_updater
IL_0021: call System.Void ZenUI.Section.SystemClock::UpdateDisplayMode()
IL_0026: ret

// System.Void ZenUI.Section.SystemClock::Hud_OnDestroy()
.locals 
IL_0000: ldnull
IL_0001: stsfld UnityEngine.Coroutine ZenUI.Section.SystemClock::_updater
IL_0006: ret

// System.Void ZenUI.Section.SystemClock::ShowClock(System.Boolean)
.locals 
IL_0000: ldsfld UnityEngine.Coroutine ZenUI.Section.SystemClock::_updater
IL_0005: brtrue.s IL_0008
IL_0007: ret
IL_0008: call TMPro.TMP_Text ZenUI.Section.SystemClock::get_ClockUI()
IL_000d: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0012: callvirt System.Boolean UnityEngine.GameObject::get_activeSelf()
IL_0017: ldarg.0
IL_0018: beq.s IL_002a
IL_001a: call TMPro.TMP_Text ZenUI.Section.SystemClock::get_ClockUI()
IL_001f: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0024: ldarg.0
IL_0025: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_002a: ret

// System.Void ZenUI.Section.SystemClock::UpdateDisplayMode()
.locals ZenUI.Section.SystemClock/DisplayMode
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.Section.SystemClock/DisplayMode> ZenUI.Configs::ShowSystemClock
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<ZenUI.Section.SystemClock/DisplayMode>::get_Value()
IL_000a: stloc.0
IL_000b: ldloc.0
IL_000c: switch IL_001f,IL_0040,IL_0026
IL_001d: br.s IL_0047
IL_001f: ldc.i4.0
IL_0020: call System.Void ZenUI.Section.SystemClock::ShowClock(System.Boolean)
IL_0025: ret
IL_0026: call Menu Menu::get_instance()
IL_002b: ldfld UnityEngine.Transform Menu::m_root
IL_0030: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0035: callvirt System.Boolean UnityEngine.GameObject::get_activeSelf()
IL_003a: call System.Void ZenUI.Section.SystemClock::ShowClock(System.Boolean)
IL_003f: ret
IL_0040: ldc.i4.1
IL_0041: call System.Void ZenUI.Section.SystemClock::ShowClock(System.Boolean)
IL_0046: ret
IL_0047: newobj System.Void System.ArgumentOutOfRangeException::.ctor()
IL_004c: throw

// System.Void ZenUI.Section.SystemClock::Menu_Show()
.locals 
IL_0000: call System.Void ZenUI.Section.SystemClock::UpdateDisplayMode()
IL_0005: ret

// System.Void ZenUI.Section.SystemClock::Menu_Hide()
.locals 
IL_0000: call System.Void ZenUI.Section.SystemClock::UpdateDisplayMode()
IL_0005: ret

// System.Collections.IEnumerator ZenUI.Section.SystemClock::UpdateClock()
.locals 
IL_0000: ldc.i4.0
IL_0001: newobj System.Void ZenUI.Section.SystemClock/<UpdateClock>d__12::.ctor(System.Int32)
IL_0006: ret

// System.Void ZenUI.Section.SystemClock::Shutdown()
.locals 
IL_0000: call System.Void ZenUI.Section.SystemClock::RemoveUI()
IL_0005: ret

// System.Void ZenUI.Section.SystemClock::RemoveUI()
.locals 
IL_0000: ldsfld UnityEngine.Coroutine ZenUI.Section.SystemClock::_updater
IL_0005: brfalse.s IL_0028
IL_0007: call Hud Hud::get_instance()
IL_000c: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0011: brfalse.s IL_0028
IL_0013: call Hud Hud::get_instance()
IL_0018: ldsfld UnityEngine.Coroutine ZenUI.Section.SystemClock::_updater
IL_001d: callvirt System.Void UnityEngine.MonoBehaviour::StopCoroutine(UnityEngine.Coroutine)
IL_0022: ldnull
IL_0023: stsfld UnityEngine.Coroutine ZenUI.Section.SystemClock::_updater
IL_0028: ldsfld TMPro.TMP_Text ZenUI.Section.SystemClock::_clockUI
IL_002d: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0032: brfalse.s IL_0043
IL_0034: ldsfld TMPro.TMP_Text ZenUI.Section.SystemClock::_clockUI
IL_0039: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_003e: call System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_0043: ret

// TMPro.TMP_Text ZenUI.Section.SystemClock::CreateClockUI()
.locals UnityEngine.GameObject
IL_0000: ldstr "ZenUI_SystemClock"
IL_0005: ldc.i4.1
IL_0006: newarr System.Type
IL_000b: dup
IL_000c: ldc.i4.0
IL_000d: ldtoken UnityEngine.RectTransform
IL_0012: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0017: stelem.ref
IL_0018: newobj System.Void UnityEngine.GameObject::.ctor(System.String,System.Type[])
IL_001d: stloc.0
IL_001e: ldloc.0
IL_001f: ldc.i4.0
IL_0020: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0025: ldloc.0
IL_0026: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_002b: call Hud Hud::get_instance()
IL_0030: ldfld UnityEngine.GameObject Hud::m_rootObject
IL_0035: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_003a: ldc.i4.0
IL_003b: callvirt System.Void UnityEngine.Transform::SetParent(UnityEngine.Transform,System.Boolean)
IL_0040: ldloc.0
IL_0041: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0046: castclass UnityEngine.RectTransform
IL_004b: dup
IL_004c: ldc.r4 1
IL_0051: ldc.r4 0
IL_0056: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_005b: callvirt System.Void UnityEngine.RectTransform::set_anchorMin(UnityEngine.Vector2)
IL_0060: dup
IL_0061: ldc.r4 1
IL_0066: ldc.r4 0
IL_006b: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_0070: callvirt System.Void UnityEngine.RectTransform::set_anchorMax(UnityEngine.Vector2)
IL_0075: dup
IL_0076: ldc.r4 1
IL_007b: ldc.r4 0
IL_0080: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_0085: callvirt System.Void UnityEngine.RectTransform::set_pivot(UnityEngine.Vector2)
IL_008a: dup
IL_008b: ldc.r4 200
IL_0090: ldc.r4 50
IL_0095: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_009a: callvirt System.Void UnityEngine.RectTransform::set_sizeDelta(UnityEngine.Vector2)
IL_009f: ldc.r4 -20
IL_00a4: ldc.r4 -10
IL_00a9: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_00ae: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_00b3: ldloc.0
IL_00b4: callvirt !!0 UnityEngine.GameObject::AddComponent<TMPro.TextMeshProUGUI>()
IL_00b9: dup
IL_00ba: call Hud Hud::get_instance()
IL_00bf: ldfld TMPro.TextMeshProUGUI Hud::m_hoverName
IL_00c4: callvirt TMPro.TMP_FontAsset TMPro.TMP_Text::get_font()
IL_00c9: callvirt System.Void TMPro.TMP_Text::set_font(TMPro.TMP_FontAsset)
IL_00ce: dup
IL_00cf: call Hud Hud::get_instance()
IL_00d4: ldfld TMPro.TextMeshProUGUI Hud::m_hoverName
IL_00d9: callvirt UnityEngine.Color UnityEngine.UI.Graphic::get_color()
IL_00de: callvirt System.Void UnityEngine.UI.Graphic::set_color(UnityEngine.Color)
IL_00e3: dup
IL_00e4: call Hud Hud::get_instance()
IL_00e9: ldfld TMPro.TextMeshProUGUI Hud::m_hoverName
IL_00ee: callvirt System.Single TMPro.TMP_Text::get_fontSize()
IL_00f3: ldc.r4 3
IL_00f8: add
IL_00f9: callvirt System.Void TMPro.TMP_Text::set_fontSize(System.Single)
IL_00fe: dup
IL_00ff: call Hud Hud::get_instance()
IL_0104: ldfld TMPro.TextMeshProUGUI Hud::m_hoverName
IL_0109: callvirt UnityEngine.Material TMPro.TMP_Text::get_fontSharedMaterial()
IL_010e: callvirt System.Void TMPro.TMP_Text::set_fontSharedMaterial(UnityEngine.Material)
IL_0113: dup
IL_0114: call Hud Hud::get_instance()
IL_0119: ldfld TMPro.TextMeshProUGUI Hud::m_hoverName
IL_011e: callvirt TMPro.FontStyles TMPro.TMP_Text::get_fontStyle()
IL_0123: callvirt System.Void TMPro.TMP_Text::set_fontStyle(TMPro.FontStyles)
IL_0128: dup
IL_0129: ldc.i4 4100
IL_012e: callvirt System.Void TMPro.TMP_Text::set_alignment(TMPro.TextAlignmentOptions)
IL_0133: dup
IL_0134: ldc.r4 0
IL_0139: ldc.r4 -5
IL_013e: ldc.r4 0
IL_0143: ldc.r4 5
IL_0148: newobj System.Void UnityEngine.Vector4::.ctor(System.Single,System.Single,System.Single,System.Single)
IL_014d: callvirt System.Void TMPro.TMP_Text::set_margin(UnityEngine.Vector4)
IL_0152: ldloc.0
IL_0153: ldc.i4.1
IL_0154: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0159: ret

// System.Void ZenUI.Section.SystemClock/<>c::.cctor()
.locals 
IL_0000: newobj System.Void ZenUI.Section.SystemClock/<>c::.ctor()
IL_0005: stsfld ZenUI.Section.SystemClock/<>c ZenUI.Section.SystemClock/<>c::<>9
IL_000a: ret

// System.Void ZenUI.Section.SystemClock/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void ZenUI.Section.SystemClock/<>c::<.cctor>b__5_0(System.Object,System.EventArgs)
.locals 
IL_0000: call System.Void ZenUI.Section.SystemClock::UpdateDisplayMode()
IL_0005: ret

// System.Void ZenUI.Section.SystemClock/<UpdateClock>d__12::.ctor(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ldarg.0
IL_0007: ldarg.1
IL_0008: stfld System.Int32 ZenUI.Section.SystemClock/<UpdateClock>d__12::<>1__state
IL_000d: ret

// System.Void ZenUI.Section.SystemClock/<UpdateClock>d__12::System.IDisposable.Dispose()
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.s -2
IL_0003: stfld System.Int32 ZenUI.Section.SystemClock/<UpdateClock>d__12::<>1__state
IL_0008: ret

// System.Boolean ZenUI.Section.SystemClock/<UpdateClock>d__12::MoveNext()
.locals System.Int32, System.Int32, System.DateTime
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 ZenUI.Section.SystemClock/<UpdateClock>d__12::<>1__state
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: brfalse.s IL_0010
IL_000a: ldloc.0
IL_000b: ldc.i4.1
IL_000c: beq.s IL_005c
IL_000e: ldc.i4.0
IL_000f: ret
IL_0010: ldarg.0
IL_0011: ldc.i4.m1
IL_0012: stfld System.Int32 ZenUI.Section.SystemClock/<UpdateClock>d__12::<>1__state
IL_0017: br.s IL_0063
IL_0019: call TMPro.TMP_Text ZenUI.Section.SystemClock::get_ClockUI()
IL_001e: call System.DateTime System.DateTime::get_Now()
IL_0023: stloc.2
IL_0024: ldloca.s V_2
IL_0026: ldstr "t"
IL_002b: call System.String System.DateTime::ToString(System.String)
IL_0030: callvirt System.Void TMPro.TMP_Text::set_text(System.String)
IL_0035: ldc.i4.s 60
IL_0037: call System.DateTime System.DateTime::get_Now()
IL_003c: stloc.2
IL_003d: ldloca.s V_2
IL_003f: call System.Int32 System.DateTime::get_Second()
IL_0044: sub
IL_0045: stloc.1
IL_0046: ldarg.0
IL_0047: ldloc.1
IL_0048: conv.r4
IL_0049: newobj System.Void UnityEngine.WaitForSecondsRealtime::.ctor(System.Single)
IL_004e: stfld System.Object ZenUI.Section.SystemClock/<UpdateClock>d__12::<>2__current
IL_0053: ldarg.0
IL_0054: ldc.i4.1
IL_0055: stfld System.Int32 ZenUI.Section.SystemClock/<UpdateClock>d__12::<>1__state
IL_005a: ldc.i4.1
IL_005b: ret
IL_005c: ldarg.0
IL_005d: ldc.i4.m1
IL_005e: stfld System.Int32 ZenUI.Section.SystemClock/<UpdateClock>d__12::<>1__state
IL_0063: call Hud Hud::get_instance()
IL_0068: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_006d: brtrue.s IL_0019
IL_006f: ldc.i4.0
IL_0070: ret

// System.Object ZenUI.Section.SystemClock/<UpdateClock>d__12::System.Collections.Generic.IEnumerator<System.Object>.get_Current()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Object ZenUI.Section.SystemClock/<UpdateClock>d__12::<>2__current
IL_0006: ret

// System.Void ZenUI.Section.SystemClock/<UpdateClock>d__12::System.Collections.IEnumerator.Reset()
.locals 
IL_0000: newobj System.Void System.NotSupportedException::.ctor()
IL_0005: throw

// System.Object ZenUI.Section.SystemClock/<UpdateClock>d__12::System.Collections.IEnumerator.get_Current()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Object ZenUI.Section.SystemClock/<UpdateClock>d__12::<>2__current
IL_0006: ret

// System.Void ZenUI.Section.TooltipData::.ctor(System.String,System.String)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.String ZenUI.Section.TooltipData::<detail>P
IL_0007: ldarg.0
IL_0008: ldarg.2
IL_0009: stfld System.String ZenUI.Section.TooltipData::<summary>P
IL_000e: ldarg.0
IL_000f: call System.Void System.Object::.ctor()
IL_0014: ret

// System.String ZenUI.Section.TooltipData::Detail()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.String ZenUI.Section.TooltipData::<detail>P
IL_0006: ret

// System.String ZenUI.Section.TooltipData::Summary()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.String ZenUI.Section.TooltipData::<summary>P
IL_0006: ret

// System.Void ZenUI.Section.TooltipDataItem::.ctor(ItemDrop/ItemData,System.Boolean,System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld ItemDrop/ItemData ZenUI.Section.TooltipDataItem::<item>P
IL_0007: ldarg.0
IL_0008: ldarg.2
IL_0009: stfld System.Boolean ZenUI.Section.TooltipDataItem::<isCraftPanel>P
IL_000e: ldarg.0
IL_000f: ldarg.3
IL_0010: stfld System.Int32 ZenUI.Section.TooltipDataItem::<amount>P
IL_0015: ldarg.0
IL_0016: call System.Void System.Object::.ctor()
IL_001b: ret

// ItemDrop/ItemData ZenUI.Section.TooltipDataItem::get_Item()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ItemDrop/ItemData ZenUI.Section.TooltipDataItem::<item>P
IL_0006: ret

// System.Int32 ZenUI.Section.TooltipDataItem::get_StackOverride()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 ZenUI.Section.TooltipDataItem::<amount>P
IL_0006: ldc.i4.0
IL_0007: bge.s IL_001f
IL_0009: ldarg.0
IL_000a: ldfld System.Boolean ZenUI.Section.TooltipDataItem::<isCraftPanel>P
IL_000f: brtrue.s IL_0013
IL_0011: ldc.i4.m1
IL_0012: ret
IL_0013: ldarg.0
IL_0014: ldfld ItemDrop/ItemData ZenUI.Section.TooltipDataItem::<item>P
IL_0019: call System.Int32 Zen.Lib.ItemDataExt::GetCraftAmount(ItemDrop/ItemData)
IL_001e: ret
IL_001f: ldarg.0
IL_0020: ldfld System.Int32 ZenUI.Section.TooltipDataItem::<amount>P
IL_0025: ret

// System.String ZenUI.Section.TooltipDataItem::Detail()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean ZenUI.Section.TooltipDataItem::<isCraftPanel>P
IL_0006: brtrue.s IL_001a
IL_0008: ldarg.0
IL_0009: ldfld ItemDrop/ItemData ZenUI.Section.TooltipDataItem::<item>P
IL_000e: ldarg.0
IL_000f: call System.Int32 ZenUI.Section.TooltipDataItem::get_StackOverride()
IL_0014: callvirt System.String ItemDrop/ItemData::GetTooltip(System.Int32)
IL_0019: ret
IL_001a: ldarg.0
IL_001b: ldfld ItemDrop/ItemData ZenUI.Section.TooltipDataItem::<item>P
IL_0020: ldarg.0
IL_0021: call System.Int32 ZenUI.Section.TooltipDataItem::get_StackOverride()
IL_0026: ldc.i4.0
IL_0027: call System.String Zen.Lib.ItemDataExt::GetTooltipCrafting(ItemDrop/ItemData,System.Int32,System.Boolean)
IL_002c: ret

// System.String ZenUI.Section.TooltipDataItem::Summary()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ItemDrop/ItemData ZenUI.Section.TooltipDataItem::<item>P
IL_0006: ldarg.0
IL_0007: call System.Int32 ZenUI.Section.TooltipDataItem::get_StackOverride()
IL_000c: ldc.i4.0
IL_000d: call System.String ZenUI.Section.TooltipSummary::GetTooltipSummary(ItemDrop/ItemData,System.Int32,System.Boolean)
IL_0012: ret

// UnityEngine.GameObject ZenUI.Section.TooltipFormat::get_TooltipPrefab()
.locals 
IL_0000: ldstr "InventoryTooltip"
IL_0005: ldc.i4.1
IL_0006: call UnityEngine.GameObject Zen.Lib.GlobalStatic::GetPrefab(System.String,System.Boolean)
IL_000b: ret

// System.Void ZenUI.Section.TooltipFormat::ApplyTooltipFormatDefaults()
.locals UnityEngine.Transform
IL_0000: call UnityEngine.GameObject ZenUI.Section.TooltipFormat::get_TooltipPrefab()
IL_0005: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_000a: ldc.i4.0
IL_000b: callvirt UnityEngine.Transform UnityEngine.Transform::GetChild(System.Int32)
IL_0010: stloc.0
IL_0011: ldloc.0
IL_0012: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0017: ldc.r4 2
IL_001c: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::DarkGray
IL_0021: call UnityEngine.Color Zen.Lib.UIColor::op_Implicit(Zen.Lib.UIColor)
IL_0026: call UnityEngine.UI.Outline Zen.Lib.UI::AddOutline(UnityEngine.GameObject,System.Single,UnityEngine.Color)
IL_002b: pop
IL_002c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::TooltipShowTitleNorse
IL_0031: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0036: brfalse.s IL_006f
IL_0038: ldloc.0
IL_0039: ldstr "Topic"
IL_003e: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0043: callvirt !!0 UnityEngine.Component::GetComponent<TMPro.TMP_Text>()
IL_0048: dup
IL_0049: call InventoryGui InventoryGui::get_instance()
IL_004e: ldfld TMPro.TMP_Text InventoryGui::m_craftingStationName
IL_0053: callvirt TMPro.TMP_FontAsset TMPro.TMP_Text::get_font()
IL_0058: callvirt System.Void TMPro.TMP_Text::set_font(TMPro.TMP_FontAsset)
IL_005d: dup
IL_005e: ldc.i4.s 32
IL_0060: callvirt System.Void TMPro.TMP_Text::set_fontStyle(TMPro.FontStyles)
IL_0065: ldc.r4 28
IL_006a: callvirt System.Void TMPro.TMP_Text::set_fontSize(System.Single)
IL_006f: ret

// System.Void ZenUI.Section.TooltipFormat::SE_Stats_GetDamageModifiersTooltipString(System.String&)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.0
IL_0002: ldind.ref
IL_0003: ldstr "$inventory_dmgmod: "
IL_0008: ldsfld System.String System.String::Empty
IL_000d: callvirt System.String System.String::Replace(System.String,System.String)
IL_0012: stind.ref
IL_0013: ret

// ZenUI.Section.TooltipState/TipStyle ZenUI.Section.TooltipState::get_CurrentStyle()
.locals 
IL_0000: call System.Boolean ZenUI.Section.TooltipSummary::IsDetailMode()
IL_0005: brtrue.s IL_0009
IL_0007: ldc.i4.1
IL_0008: ret
IL_0009: ldc.i4.0
IL_000a: ret

// System.Void ZenUI.Section.TooltipState::SetData(UITooltip,ZenUI.Section.ITooltipData)
.locals 
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<UITooltip,ZenUI.Section.ITooltipData> ZenUI.Section.TooltipState::TooltipData
IL_0005: ldarg.0
IL_0006: ldarg.1
IL_0007: callvirt System.Void System.Collections.Generic.Dictionary`2<UITooltip,ZenUI.Section.ITooltipData>::set_Item(!0,!1)
IL_000c: ret

// System.Boolean ZenUI.Section.TooltipState::IsLastStateChanged(UITooltip)
.locals ZenUI.Section.TooltipState/StateID
IL_0000: ldarg.0
IL_0001: ldloca.s V_0
IL_0003: call System.Boolean ZenUI.Section.TooltipState::IsLastStateChanged(UITooltip,ZenUI.Section.TooltipState/StateID&)
IL_0008: ret

// System.Boolean ZenUI.Section.TooltipState::IsLastStateChanged(UITooltip,ZenUI.Section.TooltipState/StateID&)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.0
IL_0002: newobj System.Void ZenUI.Section.TooltipState/StateID::.ctor(UITooltip)
IL_0007: stobj ZenUI.Section.TooltipState/StateID
IL_000c: ldsfld UITooltip UITooltip::m_current
IL_0011: ldarg.0
IL_0012: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0017: brtrue.s IL_002a
IL_0019: ldsfld ZenUI.Section.TooltipState/StateID ZenUI.Section.TooltipState::_lastStateID
IL_001e: ldarg.1
IL_001f: ldobj ZenUI.Section.TooltipState/StateID
IL_0024: call System.Boolean ZenUI.Section.TooltipState/StateID::op_Inequality(ZenUI.Section.TooltipState/StateID,ZenUI.Section.TooltipState/StateID)
IL_0029: ret
IL_002a: ldc.i4.1
IL_002b: ret

// System.String ZenUI.Section.TooltipState::GetDynamic(UITooltip)
.locals ZenUI.Section.ITooltipData
IL_0000: call System.Boolean ZenUI.Section.TooltipSummary::get_IsFeatureEnabled()
IL_0005: brtrue.s IL_000e
IL_0007: ldarg.0
IL_0008: ldfld System.String UITooltip::m_text
IL_000d: ret
IL_000e: ldsfld System.Collections.Generic.Dictionary`2<UITooltip,ZenUI.Section.ITooltipData> ZenUI.Section.TooltipState::TooltipData
IL_0013: ldarg.0
IL_0014: ldloca.s V_0
IL_0016: callvirt System.Boolean System.Collections.Generic.Dictionary`2<UITooltip,ZenUI.Section.ITooltipData>::TryGetValue(!0,!1&)
IL_001b: brfalse.s IL_0032
IL_001d: call ZenUI.Section.TooltipState/TipStyle ZenUI.Section.TooltipState::get_CurrentStyle()
IL_0022: brfalse.s IL_002b
IL_0024: ldloc.0
IL_0025: callvirt System.String ZenUI.Section.ITooltipData::Summary()
IL_002a: ret
IL_002b: ldloc.0
IL_002c: callvirt System.String ZenUI.Section.ITooltipData::Detail()
IL_0031: ret
IL_0032: ldstr "Summary TooltipData is missing, falling back to vanilla tooltip"
IL_0037: ldc.i4.0
IL_0038: call System.Void Zen.Logging`1<ZenUI.Plugin>::Debug(System.String,System.Int32)
IL_003d: ldarg.0
IL_003e: ldfld System.String UITooltip::m_text
IL_0043: ret

// System.Void ZenUI.Section.TooltipState::UITooltip_OnDisable(UITooltip)
.locals 
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<UITooltip,ZenUI.Section.ITooltipData> ZenUI.Section.TooltipState::TooltipData
IL_0005: ldarg.0
IL_0006: callvirt System.Boolean System.Collections.Generic.Dictionary`2<UITooltip,ZenUI.Section.ITooltipData>::Remove(!0)
IL_000b: pop
IL_000c: ldsflda ZenUI.Section.TooltipState/StateID ZenUI.Section.TooltipState::_lastStateID
IL_0011: initobj ZenUI.Section.TooltipState/StateID
IL_0017: ret

// System.Void ZenUI.Section.TooltipState::Inventory_Changed(Inventory)
.locals 
IL_0000: call System.Boolean InventoryGui::IsVisible()
IL_0005: brtrue.s IL_0008
IL_0007: ret
IL_0008: ldsfld Player Player::m_localPlayer
IL_000d: callvirt Inventory Humanoid::GetInventory()
IL_0012: ldarg.0
IL_0013: beq.s IL_003d
IL_0015: call InventoryGui InventoryGui::get_instance()
IL_001a: callvirt InventoryGrid InventoryGui::get_ContainerGrid()
IL_001f: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0024: brfalse.s IL_003a
IL_0026: call InventoryGui InventoryGui::get_instance()
IL_002b: callvirt InventoryGrid InventoryGui::get_ContainerGrid()
IL_0030: callvirt Inventory InventoryGrid::GetInventory()
IL_0035: ldarg.0
IL_0036: ceq
IL_0038: br.s IL_003e
IL_003a: ldc.i4.0
IL_003b: br.s IL_003e
IL_003d: ldc.i4.1
IL_003e: brtrue.s IL_0041
IL_0040: ret
IL_0041: ldsfld System.Collections.Generic.Dictionary`2<UITooltip,ZenUI.Section.ITooltipData> ZenUI.Section.TooltipState::TooltipData
IL_0046: callvirt System.Void System.Collections.Generic.Dictionary`2<UITooltip,ZenUI.Section.ITooltipData>::Clear()
IL_004b: ldsflda ZenUI.Section.TooltipState/StateID ZenUI.Section.TooltipState::_lastStateID
IL_0050: initobj ZenUI.Section.TooltipState/StateID
IL_0056: call System.Void UITooltip::HideTooltip()
IL_005b: ret

// System.Void ZenUI.Section.TooltipState::InventoryGrid_CreateItemTooltip(InventoryGrid,ItemDrop/ItemData,UITooltip)
.locals System.Boolean, ZenUI.Section.TooltipDataItem
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<UITooltip,ZenUI.Section.ITooltipData> ZenUI.Section.TooltipState::TooltipData
IL_0005: ldarg.2
IL_0006: callvirt System.Boolean System.Collections.Generic.Dictionary`2<UITooltip,ZenUI.Section.ITooltipData>::ContainsKey(!0)
IL_000b: brfalse.s IL_0016
IL_000d: ldarg.2
IL_000e: call System.Boolean ZenUI.Section.TooltipState::IsLastStateChanged(UITooltip)
IL_0013: brtrue.s IL_0016
IL_0015: ret
IL_0016: ldarg.0
IL_0017: isinst ZenUI.Section.CraftingPanelGrid
IL_001c: ldnull
IL_001d: cgt.un
IL_001f: stloc.0
IL_0020: ldarg.1
IL_0021: ldloc.0
IL_0022: ldc.i4.m1
IL_0023: newobj System.Void ZenUI.Section.TooltipDataItem::.ctor(ItemDrop/ItemData,System.Boolean,System.Int32)
IL_0028: stloc.1
IL_0029: ldarg.2
IL_002a: ldloc.1
IL_002b: call System.Void ZenUI.Section.TooltipState::SetData(UITooltip,ZenUI.Section.ITooltipData)
IL_0030: ret

// System.Void ZenUI.Section.TooltipState::UITooltip_LateUpdate(UITooltip)
.locals ZenUI.Section.TooltipState/StateID
IL_0000: ldsfld UITooltip UITooltip::m_current
IL_0005: ldarg.0
IL_0006: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_000b: brfalse.s IL_000e
IL_000d: ret
IL_000e: ldarg.0
IL_000f: ldloca.s V_0
IL_0011: call System.Boolean ZenUI.Section.TooltipState::IsLastStateChanged(UITooltip,ZenUI.Section.TooltipState/StateID&)
IL_0016: brtrue.s IL_0019
IL_0018: ret
IL_0019: ldloc.0
IL_001a: stsfld ZenUI.Section.TooltipState/StateID ZenUI.Section.TooltipState::_lastStateID
IL_001f: ldarg.0
IL_0020: callvirt System.Void UITooltip::UpdateTextElements()
IL_0025: ret

// System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> ZenUI.Section.TooltipState::UITooltip_UpdateTextElements(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>)
.locals ZenUI.Section.TooltipState/<>c__DisplayClass14_0
IL_0000: newobj System.Void ZenUI.Section.TooltipState/<>c__DisplayClass14_0::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldtoken UITooltip
IL_000c: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0011: ldstr "m_text"
IL_0016: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_001b: stfld System.Reflection.FieldInfo ZenUI.Section.TooltipState/<>c__DisplayClass14_0::textField
IL_0020: ldarg.0
IL_0021: ldloc.0
IL_0022: ldftn System.Boolean ZenUI.Section.TooltipState/<>c__DisplayClass14_0::<UITooltip_UpdateTextElements>b__0(HarmonyLib.CodeInstruction)
IL_0028: newobj System.Void System.Func`2<HarmonyLib.CodeInstruction,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_002d: ldsfld System.Action`1<HarmonyLib.CodeInstruction> ZenUI.Section.TooltipState/<>c::<>9__14_1
IL_0032: dup
IL_0033: brtrue.s IL_004c
IL_0035: pop
IL_0036: ldsfld ZenUI.Section.TooltipState/<>c ZenUI.Section.TooltipState/<>c::<>9
IL_003b: ldftn System.Void ZenUI.Section.TooltipState/<>c::<UITooltip_UpdateTextElements>b__14_1(HarmonyLib.CodeInstruction)
IL_0041: newobj System.Void System.Action`1<HarmonyLib.CodeInstruction>::.ctor(System.Object,System.IntPtr)
IL_0046: dup
IL_0047: stsfld System.Action`1<HarmonyLib.CodeInstruction> ZenUI.Section.TooltipState/<>c::<>9__14_1
IL_004c: call System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> HarmonyLib.Transpilers::Manipulator(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>,System.Func`2<HarmonyLib.CodeInstruction,System.Boolean>,System.Action`1<HarmonyLib.CodeInstruction>)
IL_0051: ret

// System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> ZenUI.Section.TooltipState::StoreGui_FillList(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>)
.locals ZenUI.Section.TooltipState/<>c__DisplayClass15_0, HarmonyLib.CodeMatch[]
IL_0000: newobj System.Void ZenUI.Section.TooltipState/<>c__DisplayClass15_0::.ctor()
IL_0005: stloc.0
IL_0006: ldc.i4.1
IL_0007: newarr HarmonyLib.CodeMatch
IL_000c: dup
IL_000d: ldc.i4.0
IL_000e: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Callvirt
IL_0013: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_0018: ldtoken UITooltip
IL_001d: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0022: ldstr "Set"
IL_0027: ldnull
IL_0028: ldnull
IL_0029: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_002e: ldnull
IL_002f: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0034: stelem.ref
IL_0035: stloc.1
IL_0036: ldloc.0
IL_0037: ldsfld System.Action`6<UITooltip,System.String,System.String,UnityEngine.RectTransform,UnityEngine.Vector2,Trader/TradeItem> ZenUI.Section.TooltipState/<>O::<1>__SetTooltip
IL_003c: dup
IL_003d: brtrue.s IL_0052
IL_003f: pop
IL_0040: ldnull
IL_0041: ldftn System.Void ZenUI.Section.TooltipState::<StoreGui_FillList>g__SetTooltip|15_1(UITooltip,System.String,System.String,UnityEngine.RectTransform,UnityEngine.Vector2,Trader/TradeItem)
IL_0047: newobj System.Void System.Action`6<UITooltip,System.String,System.String,UnityEngine.RectTransform,UnityEngine.Vector2,Trader/TradeItem>::.ctor(System.Object,System.IntPtr)
IL_004c: dup
IL_004d: stsfld System.Action`6<UITooltip,System.String,System.String,UnityEngine.RectTransform,UnityEngine.Vector2,Trader/TradeItem> ZenUI.Section.TooltipState/<>O::<1>__SetTooltip
IL_0052: stfld System.Action`6<UITooltip,System.String,System.String,UnityEngine.RectTransform,UnityEngine.Vector2,Trader/TradeItem> ZenUI.Section.TooltipState/<>c__DisplayClass15_0::intercept
IL_0057: ldarg.0
IL_0058: ldnull
IL_0059: newobj System.Void HarmonyLib.CodeMatcher::.ctor(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>,System.Reflection.Emit.ILGenerator)
IL_005e: ldloc.1
IL_005f: call HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::MatchStartForward(HarmonyLib.CodeMatch[])
IL_0064: ldstr "Unable to match IL sequence"
IL_0069: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::ThrowIfInvalid(System.String)
IL_006e: ldloc.0
IL_006f: ldftn System.Void ZenUI.Section.TooltipState/<>c__DisplayClass15_0::<StoreGui_FillList>b__0(HarmonyLib.CodeMatcher)
IL_0075: newobj System.Void System.Action`1<HarmonyLib.CodeMatcher>::.ctor(System.Object,System.IntPtr)
IL_007a: ldnull
IL_007b: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Repeat(System.Action`1<HarmonyLib.CodeMatcher>,System.Action`1<System.String>)
IL_0080: callvirt System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> HarmonyLib.CodeMatcher::InstructionEnumeration()
IL_0085: ret

// System.Void ZenUI.Section.TooltipState::.cctor()
.locals 
IL_0000: newobj System.Void System.Collections.Generic.Dictionary`2<UITooltip,ZenUI.Section.ITooltipData>::.ctor()
IL_0005: stsfld System.Collections.Generic.Dictionary`2<UITooltip,ZenUI.Section.ITooltipData> ZenUI.Section.TooltipState::TooltipData
IL_000a: ret

// System.String ZenUI.Section.TooltipState::<UITooltip_UpdateTextElements>g__Intercept|14_2(UITooltip)
.locals 
IL_0000: ldarg.0
IL_0001: call System.String ZenUI.Section.TooltipState::GetDynamic(UITooltip)
IL_0006: ret

// System.Void ZenUI.Section.TooltipState::<StoreGui_FillList>g__SetTooltip|15_1(UITooltip,System.String,System.String,UnityEngine.RectTransform,UnityEngine.Vector2,Trader/TradeItem)
.locals ZenUI.Section.ITooltipData, System.String
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: ldarg.2
IL_0003: ldarg.3
IL_0004: ldarg.s fixedPosition
IL_0006: callvirt System.Void UITooltip::Set(System.String,System.String,UnityEngine.RectTransform,UnityEngine.Vector2)
IL_000b: ldarg.s tradeItem
IL_000d: ldfld ItemDrop Trader/TradeItem::m_prefab
IL_0012: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0017: brfalse.s IL_002f
IL_0019: ldarg.s tradeItem
IL_001b: ldfld ItemDrop Trader/TradeItem::m_prefab
IL_0020: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0025: ldc.i4.0
IL_0026: ldc.i4.m1
IL_0027: newobj System.Void ZenUI.Section.TooltipDataItem::.ctor(ItemDrop/ItemData,System.Boolean,System.Int32)
IL_002c: stloc.0
IL_002d: br.s IL_0053
IL_002f: ldarg.s tradeItem
IL_0031: ldfld System.String Trader/TradeItem::m_tooltip
IL_0036: ldstr ""
IL_003b: ldstr ""
IL_0040: call System.String ZenUI.Section.TooltipSummary::Format(System.String,System.String,System.String)
IL_0045: call System.String Zen.Lib.StringExt::Localize(System.String)
IL_004a: stloc.1
IL_004b: ldarg.2
IL_004c: ldloc.1
IL_004d: newobj System.Void ZenUI.Section.TooltipData::.ctor(System.String,System.String)
IL_0052: stloc.0
IL_0053: ldarg.0
IL_0054: ldloc.0
IL_0055: call System.Void ZenUI.Section.TooltipState::SetData(UITooltip,ZenUI.Section.ITooltipData)
IL_005a: ret

// System.Void ZenUI.Section.TooltipState/StateID::.ctor(UITooltip)
.locals ZenUI.Section.ITooltipData, ZenUI.Section.TooltipDataItem, ItemDrop/ItemData
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: ldfld System.String UITooltip::m_topic
IL_0007: stfld System.String ZenUI.Section.TooltipState/StateID::_topic
IL_000c: ldarg.0
IL_000d: call ZenUI.Section.TooltipState/TipStyle ZenUI.Section.TooltipState::get_CurrentStyle()
IL_0012: stfld ZenUI.Section.TooltipState/TipStyle ZenUI.Section.TooltipState/StateID::_style
IL_0017: ldarg.0
IL_0018: call System.Boolean ZenUI.Section.CraftingPanel::get_IsMulticraftPressed()
IL_001d: stfld System.Boolean ZenUI.Section.TooltipState/StateID::_isMulticraft
IL_0022: ldarg.0
IL_0023: ldsfld System.Collections.Generic.Dictionary`2<UITooltip,ZenUI.Section.ITooltipData> ZenUI.Section.TooltipState::TooltipData
IL_0028: ldarg.1
IL_0029: ldloca.s V_0
IL_002b: callvirt System.Boolean System.Collections.Generic.Dictionary`2<UITooltip,ZenUI.Section.ITooltipData>::TryGetValue(!0,!1&)
IL_0030: brfalse.s IL_0051
IL_0032: ldloc.0
IL_0033: isinst ZenUI.Section.TooltipDataItem
IL_0038: stloc.1
IL_0039: ldloc.1
IL_003a: brfalse.s IL_004e
IL_003c: ldloc.1
IL_003d: callvirt ItemDrop/ItemData ZenUI.Section.TooltipDataItem::get_Item()
IL_0042: stloc.2
IL_0043: ldloc.2
IL_0044: brfalse.s IL_004e
IL_0046: ldloc.2
IL_0047: ldfld System.Boolean ItemDrop/ItemData::m_equipped
IL_004c: br.s IL_0052
IL_004e: ldc.i4.0
IL_004f: br.s IL_0052
IL_0051: ldc.i4.0
IL_0052: stfld System.Boolean ZenUI.Section.TooltipState/StateID::_isEquipped
IL_0057: ret

// System.String ZenUI.Section.TooltipState/StateID::ToString()
.locals System.Text.StringBuilder
IL_0000: newobj System.Void System.Text.StringBuilder::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldstr "StateID"
IL_000c: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0011: pop
IL_0012: ldloc.0
IL_0013: ldstr " { "
IL_0018: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_001d: pop
IL_001e: ldarg.0
IL_001f: ldloc.0
IL_0020: call System.Boolean ZenUI.Section.TooltipState/StateID::PrintMembers(System.Text.StringBuilder)
IL_0025: brfalse.s IL_0030
IL_0027: ldloc.0
IL_0028: ldc.i4.s 32
IL_002a: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.Char)
IL_002f: pop
IL_0030: ldloc.0
IL_0031: ldc.i4.s 125
IL_0033: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.Char)
IL_0038: pop
IL_0039: ldloc.0
IL_003a: callvirt System.String System.Object::ToString()
IL_003f: ret

// System.Boolean ZenUI.Section.TooltipState/StateID::PrintMembers(System.Text.StringBuilder)
.locals 
IL_0000: ldc.i4.0
IL_0001: ret

// System.Boolean ZenUI.Section.TooltipState/StateID::op_Inequality(ZenUI.Section.TooltipState/StateID,ZenUI.Section.TooltipState/StateID)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: call System.Boolean ZenUI.Section.TooltipState/StateID::op_Equality(ZenUI.Section.TooltipState/StateID,ZenUI.Section.TooltipState/StateID)
IL_0007: ldc.i4.0
IL_0008: ceq
IL_000a: ret

// System.Boolean ZenUI.Section.TooltipState/StateID::op_Equality(ZenUI.Section.TooltipState/StateID,ZenUI.Section.TooltipState/StateID)
.locals 
IL_0000: ldarga.s left
IL_0002: ldarg.1
IL_0003: call System.Boolean ZenUI.Section.TooltipState/StateID::Equals(ZenUI.Section.TooltipState/StateID)
IL_0008: ret

// System.Int32 ZenUI.Section.TooltipState/StateID::GetHashCode()
.locals 
IL_0000: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<System.String>::get_Default()
IL_0005: ldarg.0
IL_0006: ldfld System.String ZenUI.Section.TooltipState/StateID::_topic
IL_000b: callvirt System.Int32 System.Collections.Generic.EqualityComparer`1<System.String>::GetHashCode(!0)
IL_0010: ldc.i4 -1521134295
IL_0015: mul
IL_0016: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<ZenUI.Section.TooltipState/TipStyle>::get_Default()
IL_001b: ldarg.0
IL_001c: ldfld ZenUI.Section.TooltipState/TipStyle ZenUI.Section.TooltipState/StateID::_style
IL_0021: callvirt System.Int32 System.Collections.Generic.EqualityComparer`1<ZenUI.Section.TooltipState/TipStyle>::GetHashCode(!0)
IL_0026: add
IL_0027: ldc.i4 -1521134295
IL_002c: mul
IL_002d: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<System.Boolean>::get_Default()
IL_0032: ldarg.0
IL_0033: ldfld System.Boolean ZenUI.Section.TooltipState/StateID::_isMulticraft
IL_0038: callvirt System.Int32 System.Collections.Generic.EqualityComparer`1<System.Boolean>::GetHashCode(!0)
IL_003d: add
IL_003e: ldc.i4 -1521134295
IL_0043: mul
IL_0044: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<System.Boolean>::get_Default()
IL_0049: ldarg.0
IL_004a: ldfld System.Boolean ZenUI.Section.TooltipState/StateID::_isEquipped
IL_004f: callvirt System.Int32 System.Collections.Generic.EqualityComparer`1<System.Boolean>::GetHashCode(!0)
IL_0054: add
IL_0055: ret

// System.Boolean ZenUI.Section.TooltipState/StateID::Equals(System.Object)
.locals 
IL_0000: ldarg.1
IL_0001: isinst ZenUI.Section.TooltipState/StateID
IL_0006: brfalse.s IL_0015
IL_0008: ldarg.0
IL_0009: ldarg.1
IL_000a: unbox.any ZenUI.Section.TooltipState/StateID
IL_000f: call System.Boolean ZenUI.Section.TooltipState/StateID::Equals(ZenUI.Section.TooltipState/StateID)
IL_0014: ret
IL_0015: ldc.i4.0
IL_0016: ret

// System.Boolean ZenUI.Section.TooltipState/StateID::Equals(ZenUI.Section.TooltipState/StateID)
.locals 
IL_0000: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<System.String>::get_Default()
IL_0005: ldarg.0
IL_0006: ldfld System.String ZenUI.Section.TooltipState/StateID::_topic
IL_000b: ldarg.1
IL_000c: ldfld System.String ZenUI.Section.TooltipState/StateID::_topic
IL_0011: callvirt System.Boolean System.Collections.Generic.EqualityComparer`1<System.String>::Equals(!0,!0)
IL_0016: brfalse.s IL_005f
IL_0018: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<ZenUI.Section.TooltipState/TipStyle>::get_Default()
IL_001d: ldarg.0
IL_001e: ldfld ZenUI.Section.TooltipState/TipStyle ZenUI.Section.TooltipState/StateID::_style
IL_0023: ldarg.1
IL_0024: ldfld ZenUI.Section.TooltipState/TipStyle ZenUI.Section.TooltipState/StateID::_style
IL_0029: callvirt System.Boolean System.Collections.Generic.EqualityComparer`1<ZenUI.Section.TooltipState/TipStyle>::Equals(!0,!0)
IL_002e: brfalse.s IL_005f
IL_0030: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<System.Boolean>::get_Default()
IL_0035: ldarg.0
IL_0036: ldfld System.Boolean ZenUI.Section.TooltipState/StateID::_isMulticraft
IL_003b: ldarg.1
IL_003c: ldfld System.Boolean ZenUI.Section.TooltipState/StateID::_isMulticraft
IL_0041: callvirt System.Boolean System.Collections.Generic.EqualityComparer`1<System.Boolean>::Equals(!0,!0)
IL_0046: brfalse.s IL_005f
IL_0048: call System.Collections.Generic.EqualityComparer`1<!0> System.Collections.Generic.EqualityComparer`1<System.Boolean>::get_Default()
IL_004d: ldarg.0
IL_004e: ldfld System.Boolean ZenUI.Section.TooltipState/StateID::_isEquipped
IL_0053: ldarg.1
IL_0054: ldfld System.Boolean ZenUI.Section.TooltipState/StateID::_isEquipped
IL_0059: callvirt System.Boolean System.Collections.Generic.EqualityComparer`1<System.Boolean>::Equals(!0,!0)
IL_005e: ret
IL_005f: ldc.i4.0
IL_0060: ret

// System.Void ZenUI.Section.TooltipState/<>c::.cctor()
.locals 
IL_0000: newobj System.Void ZenUI.Section.TooltipState/<>c::.ctor()
IL_0005: stsfld ZenUI.Section.TooltipState/<>c ZenUI.Section.TooltipState/<>c::<>9
IL_000a: ret

// System.Void ZenUI.Section.TooltipState/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void ZenUI.Section.TooltipState/<>c::<UITooltip_UpdateTextElements>b__14_1(HarmonyLib.CodeInstruction)
.locals System.Func`2<UITooltip,System.String>
IL_0000: ldsfld System.Func`2<UITooltip,System.String> ZenUI.Section.TooltipState/<>O::<0>__Intercept
IL_0005: dup
IL_0006: brtrue.s IL_001b
IL_0008: pop
IL_0009: ldnull
IL_000a: ldftn System.String ZenUI.Section.TooltipState::<UITooltip_UpdateTextElements>g__Intercept|14_2(UITooltip)
IL_0010: newobj System.Void System.Func`2<UITooltip,System.String>::.ctor(System.Object,System.IntPtr)
IL_0015: dup
IL_0016: stsfld System.Func`2<UITooltip,System.String> ZenUI.Section.TooltipState/<>O::<0>__Intercept
IL_001b: stloc.0
IL_001c: ldarg.1
IL_001d: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_0022: stfld System.Reflection.Emit.OpCode HarmonyLib.CodeInstruction::opcode
IL_0027: ldarg.1
IL_0028: ldloc.0
IL_0029: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_002e: stfld System.Object HarmonyLib.CodeInstruction::operand
IL_0033: ret

// System.Void ZenUI.Section.TooltipState/<>c__DisplayClass14_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean ZenUI.Section.TooltipState/<>c__DisplayClass14_0::<UITooltip_UpdateTextElements>b__0(HarmonyLib.CodeInstruction)
.locals 
IL_0000: ldarg.1
IL_0001: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldfld
IL_0006: ldarg.0
IL_0007: ldfld System.Reflection.FieldInfo ZenUI.Section.TooltipState/<>c__DisplayClass14_0::textField
IL_000c: call System.Boolean HarmonyLib.CodeInstructionExtensions::Is(HarmonyLib.CodeInstruction,System.Reflection.Emit.OpCode,System.Reflection.MemberInfo)
IL_0011: ret

// System.Void ZenUI.Section.TooltipState/<>c__DisplayClass15_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void ZenUI.Section.TooltipState/<>c__DisplayClass15_0::<StoreGui_FillList>b__0(HarmonyLib.CodeMatcher)
.locals 
IL_0000: ldarg.1
IL_0001: ldc.i4.1
IL_0002: newarr HarmonyLib.CodeInstruction
IL_0007: dup
IL_0008: ldc.i4.0
IL_0009: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldloc_S
IL_000e: ldc.i4.7
IL_000f: box System.Byte
IL_0014: newobj System.Void HarmonyLib.CodeInstruction::.ctor(System.Reflection.Emit.OpCode,System.Object)
IL_0019: stelem.ref
IL_001a: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::InsertAndAdvance(HarmonyLib.CodeInstruction[])
IL_001f: pop
IL_0020: ldarg.1
IL_0021: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_0026: ldarg.0
IL_0027: ldfld System.Action`6<UITooltip,System.String,System.String,UnityEngine.RectTransform,UnityEngine.Vector2,Trader/TradeItem> ZenUI.Section.TooltipState/<>c__DisplayClass15_0::intercept
IL_002c: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_0031: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Set(System.Reflection.Emit.OpCode,System.Object)
IL_0036: pop
IL_0037: ret

// System.Boolean ZenUI.Section.TooltipSummary::get_IsFeatureEnabled()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.TooltipStyle> ZenUI.Configs::TooltipDisplayMode
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<ZenUI.TooltipStyle>::get_Value()
IL_000a: ldc.i4.2
IL_000b: ceq
IL_000d: ldc.i4.0
IL_000e: ceq
IL_0010: ret

// System.String ZenUI.Section.TooltipSummary::Format(System.String,System.String,System.String)
.locals 
IL_0000: ldarg.0
IL_0001: brtrue.s IL_000a
IL_0003: ldsfld System.String System.String::Empty
IL_0008: starg.s description
IL_000a: ldc.i4.7
IL_000b: newarr System.String
IL_0010: dup
IL_0011: ldc.i4.0
IL_0012: ldstr "
<align=center>"
IL_0017: stelem.ref
IL_0018: dup
IL_0019: ldc.i4.1
IL_001a: ldarg.0
IL_001b: stelem.ref
IL_001c: dup
IL_001d: ldc.i4.2
IL_001e: ldstr "</align><line-height=3em>
</line-height><line-height=0><size=-1>"
IL_0023: stelem.ref
IL_0024: dup
IL_0025: ldc.i4.3
IL_0026: ldstr "<align=left><color={0}>{1}</color></align>
"
IL_002b: ldsfld Zen.Lib.UIColor ZenUI.Section.TooltipSummary::ColorFooter
IL_0030: ldarg.1
IL_0031: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_0036: stelem.ref
IL_0037: dup
IL_0038: ldc.i4.4
IL_0039: ldstr "<align=center><color={0}>{1}</color></align>
"
IL_003e: ldsfld Zen.Lib.UIColor ZenUI.Section.TooltipSummary::ColorFooter
IL_0043: ldarg.2
IL_0044: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_0049: stelem.ref
IL_004a: dup
IL_004b: ldc.i4.5
IL_004c: ldstr "<align=right><color={0}>{1}</color></align>"
IL_0051: ldsfld Zen.Lib.UIColor ZenUI.Section.TooltipSummary::ColorFooter
IL_0056: call System.String ZenUI.Section.TooltipSummary::<Format>g__HintShowMore|10_0()
IL_005b: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_0060: stelem.ref
IL_0061: dup
IL_0062: ldc.i4.6
IL_0063: ldstr "</size></line-height>"
IL_0068: stelem.ref
IL_0069: call System.String System.String::Concat(System.String[])
IL_006e: ret

// System.String ZenUI.Section.TooltipSummary::GetTooltipSummary(ItemDrop/ItemData,System.Int32,System.Boolean)
.locals ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0, Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean
IL_0000: ldloca.s V_0
IL_0002: ldarg.0
IL_0003: stfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0008: ldloca.s V_0
IL_000a: ldarg.1
IL_000b: stfld System.Int32 ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::stackOverride
IL_0010: ldloca.s V_0
IL_0012: ldarg.2
IL_0013: stfld System.Boolean ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::appended
IL_0018: ldc.i4.s 35
IL_001a: ldc.i4.3
IL_001b: ldloca.s V_2
IL_001d: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_0022: stloc.1
IL_0023: ldloc.2
IL_0024: brfalse.s IL_0078
IL_0026: ldloca.s V_1
IL_0028: ldloc.0
IL_0029: ldfld System.Boolean ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::appended
IL_002e: brtrue.s IL_0037
IL_0030: ldstr "Generate"
IL_0035: br.s IL_003c
IL_0037: ldstr "Append"
IL_003c: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_0041: ldloca.s V_1
IL_0043: ldstr " summary tooltip info for "
IL_0048: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_004d: ldloca.s V_1
IL_004f: ldloc.0
IL_0050: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0055: call System.String Zen.Lib.ItemDataExt::GetName(ItemDrop/ItemData)
IL_005a: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_005f: ldloca.s V_1
IL_0061: ldstr ", stack: "
IL_0066: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_006b: ldloca.s V_1
IL_006d: ldloc.0
IL_006e: ldfld System.Int32 ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::stackOverride
IL_0073: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted<System.Int32>(!!0)
IL_0078: ldloc.1
IL_0079: ldc.i4.0
IL_007a: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_007f: ldloca.s V_0
IL_0081: ldc.i4.0
IL_0082: stfld System.Boolean ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::hasIcons
IL_0087: ldloc.0
IL_0088: ldfld System.Boolean ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::appended
IL_008d: brtrue.s IL_0097
IL_008f: ldloca.s V_0
IL_0091: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__CreateTooltip|11_0(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
IL_0096: ret
IL_0097: ldloca.s V_0
IL_0099: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__Summary|11_1(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
IL_009e: ret

// System.Boolean ZenUI.Section.TooltipSummary::IsDetailMode()
.locals 
IL_0000: call System.Boolean ZenUI.Section.TooltipSummary::get_IsFeatureEnabled()
IL_0005: brfalse.s IL_000d
IL_0007: call System.Boolean ZenUI.Section.TooltipSummary::IsDetailKeyPressed()
IL_000c: ret
IL_000d: ldc.i4.1
IL_000e: ret

// System.Boolean ZenUI.Section.TooltipSummary::IsDetailKeyPressed()
.locals UnityEngine.KeyCode, System.Boolean
IL_0000: call System.Boolean ZInput::IsGamepadActive()
IL_0005: brfalse.s IL_0012
IL_0007: ldstr "JoyButtonY"
IL_000c: call System.Boolean ZInput::GetButton(System.String)
IL_0011: ret
IL_0012: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.KeyCode> ZenUI.Configs::TooltipDetailKey
IL_0017: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.KeyCode>::get_Value()
IL_001c: stloc.0
IL_001d: ldloc.0
IL_001e: ldc.i4 303
IL_0023: sub
IL_0024: switch IL_0095,IL_0095,IL_0056,IL_0056,IL_0077,IL_0077,IL_00b3,IL_00b3,IL_00d1,IL_00d1
IL_0051: br IL_00ef
IL_0056: ldc.i4 306
IL_005b: ldc.i4.1
IL_005c: call System.Boolean ZInput::GetKey(UnityEngine.KeyCode,System.Boolean)
IL_0061: brtrue.s IL_0070
IL_0063: ldc.i4 305
IL_0068: ldc.i4.1
IL_0069: call System.Boolean ZInput::GetKey(UnityEngine.KeyCode,System.Boolean)
IL_006e: br.s IL_0071
IL_0070: ldc.i4.1
IL_0071: stloc.1
IL_0072: br IL_00f7
IL_0077: ldc.i4 308
IL_007c: ldc.i4.1
IL_007d: call System.Boolean ZInput::GetKey(UnityEngine.KeyCode,System.Boolean)
IL_0082: brtrue.s IL_0091
IL_0084: ldc.i4 307
IL_0089: ldc.i4.1
IL_008a: call System.Boolean ZInput::GetKey(UnityEngine.KeyCode,System.Boolean)
IL_008f: br.s IL_0092
IL_0091: ldc.i4.1
IL_0092: stloc.1
IL_0093: br.s IL_00f7
IL_0095: ldc.i4 304
IL_009a: ldc.i4.1
IL_009b: call System.Boolean ZInput::GetKey(UnityEngine.KeyCode,System.Boolean)
IL_00a0: brtrue.s IL_00af
IL_00a2: ldc.i4 303
IL_00a7: ldc.i4.1
IL_00a8: call System.Boolean ZInput::GetKey(UnityEngine.KeyCode,System.Boolean)
IL_00ad: br.s IL_00b0
IL_00af: ldc.i4.1
IL_00b0: stloc.1
IL_00b1: br.s IL_00f7
IL_00b3: ldc.i4 310
IL_00b8: ldc.i4.1
IL_00b9: call System.Boolean ZInput::GetKey(UnityEngine.KeyCode,System.Boolean)
IL_00be: brtrue.s IL_00cd
IL_00c0: ldc.i4 309
IL_00c5: ldc.i4.1
IL_00c6: call System.Boolean ZInput::GetKey(UnityEngine.KeyCode,System.Boolean)
IL_00cb: br.s IL_00ce
IL_00cd: ldc.i4.1
IL_00ce: stloc.1
IL_00cf: br.s IL_00f7
IL_00d1: ldc.i4 311
IL_00d6: ldc.i4.1
IL_00d7: call System.Boolean ZInput::GetKey(UnityEngine.KeyCode,System.Boolean)
IL_00dc: brtrue.s IL_00eb
IL_00de: ldc.i4 312
IL_00e3: ldc.i4.1
IL_00e4: call System.Boolean ZInput::GetKey(UnityEngine.KeyCode,System.Boolean)
IL_00e9: br.s IL_00ec
IL_00eb: ldc.i4.1
IL_00ec: stloc.1
IL_00ed: br.s IL_00f7
IL_00ef: ldloc.0
IL_00f0: ldc.i4.1
IL_00f1: call System.Boolean ZInput::GetKey(UnityEngine.KeyCode,System.Boolean)
IL_00f6: stloc.1
IL_00f7: ldloc.1
IL_00f8: ret

// System.String ZenUI.Section.TooltipSummary::KeyStr(UnityEngine.KeyCode)
.locals System.String
IL_0000: call System.Boolean ZInput::IsGamepadActive()
IL_0005: brfalse.s IL_000d
IL_0007: ldstr "$KEY_JoyButtonY"
IL_000c: ret
IL_000d: ldarg.0
IL_000e: ldc.i4 303
IL_0013: sub
IL_0014: switch IL_006b,IL_0063,IL_004b,IL_0043,IL_005b,IL_0053,IL_007b,IL_0073,IL_0083,IL_008b
IL_0041: br.s IL_0093
IL_0043: ldstr "Ctrl"
IL_0048: stloc.0
IL_0049: br.s IL_00a1
IL_004b: ldstr "Ctrl"
IL_0050: stloc.0
IL_0051: br.s IL_00a1
IL_0053: ldstr "Alt"
IL_0058: stloc.0
IL_0059: br.s IL_00a1
IL_005b: ldstr "Alt"
IL_0060: stloc.0
IL_0061: br.s IL_00a1
IL_0063: ldstr "Shift"
IL_0068: stloc.0
IL_0069: br.s IL_00a1
IL_006b: ldstr "Shift"
IL_0070: stloc.0
IL_0071: br.s IL_00a1
IL_0073: ldstr "Cmd"
IL_0078: stloc.0
IL_0079: br.s IL_00a1
IL_007b: ldstr "Cmd"
IL_0080: stloc.0
IL_0081: br.s IL_00a1
IL_0083: ldstr "Win"
IL_0088: stloc.0
IL_0089: br.s IL_00a1
IL_008b: ldstr "Win"
IL_0090: stloc.0
IL_0091: br.s IL_00a1
IL_0093: ldarga.s key
IL_0095: constrained. UnityEngine.KeyCode
IL_009b: callvirt System.String System.Object::ToString()
IL_00a0: stloc.0
IL_00a1: ldloc.0
IL_00a2: ret

// System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> ZenUI.Section.TooltipSummary::UITooltip_LateUpdate(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>)
.locals System.Func`2<System.Single,System.Single>, HarmonyLib.CodeMatch[]
IL_0000: ldsfld System.Func`2<System.Single,System.Single> ZenUI.Section.TooltipSummary/<>O::<0>__ConfigDelay
IL_0005: dup
IL_0006: brtrue.s IL_001b
IL_0008: pop
IL_0009: ldnull
IL_000a: ldftn System.Single ZenUI.Section.TooltipSummary::<UITooltip_LateUpdate>g__ConfigDelay|15_0(System.Single)
IL_0010: newobj System.Void System.Func`2<System.Single,System.Single>::.ctor(System.Object,System.IntPtr)
IL_0015: dup
IL_0016: stsfld System.Func`2<System.Single,System.Single> ZenUI.Section.TooltipSummary/<>O::<0>__ConfigDelay
IL_001b: stloc.0
IL_001c: ldc.i4.2
IL_001d: newarr HarmonyLib.CodeMatch
IL_0022: dup
IL_0023: ldc.i4.0
IL_0024: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldfld
IL_0029: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_002e: ldtoken UITooltip
IL_0033: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0038: ldstr "m_showTimer"
IL_003d: call System.Reflection.FieldInfo HarmonyLib.AccessTools::Field(System.Type,System.String)
IL_0042: ldnull
IL_0043: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0048: stelem.ref
IL_0049: dup
IL_004a: ldc.i4.1
IL_004b: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldc_R4
IL_0050: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_0055: ldc.r4 0.5
IL_005a: box System.Single
IL_005f: ldnull
IL_0060: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0065: stelem.ref
IL_0066: stloc.1
IL_0067: ldarg.0
IL_0068: ldnull
IL_0069: newobj System.Void HarmonyLib.CodeMatcher::.ctor(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>,System.Reflection.Emit.ILGenerator)
IL_006e: ldloc.1
IL_006f: call HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::MatchEndForward(HarmonyLib.CodeMatch[])
IL_0074: ldstr "Unable to match IL sequence for tooltip delay"
IL_0079: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::ThrowIfInvalid(System.String)
IL_007e: ldc.i4.1
IL_007f: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Advance(System.Int32)
IL_0084: ldc.i4.1
IL_0085: newarr HarmonyLib.CodeInstruction
IL_008a: dup
IL_008b: ldc.i4.0
IL_008c: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_0091: ldloc.0
IL_0092: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_0097: newobj System.Void HarmonyLib.CodeInstruction::.ctor(System.Reflection.Emit.OpCode,System.Object)
IL_009c: stelem.ref
IL_009d: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Insert(HarmonyLib.CodeInstruction[])
IL_00a2: callvirt System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> HarmonyLib.CodeMatcher::InstructionEnumeration()
IL_00a7: ret

// System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> ZenUI.Section.TooltipSummary::InventoryGui_Update(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>)
.locals System.Func`2<System.Boolean,System.Boolean>, HarmonyLib.CodeMatch[]
IL_0000: ldsfld System.Func`2<System.Boolean,System.Boolean> ZenUI.Section.TooltipSummary/<>O::<1>__Intercept
IL_0005: dup
IL_0006: brtrue.s IL_001b
IL_0008: pop
IL_0009: ldnull
IL_000a: ldftn System.Boolean ZenUI.Section.TooltipSummary::<InventoryGui_Update>g__Intercept|16_0(System.Boolean)
IL_0010: newobj System.Void System.Func`2<System.Boolean,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0015: dup
IL_0016: stsfld System.Func`2<System.Boolean,System.Boolean> ZenUI.Section.TooltipSummary/<>O::<1>__Intercept
IL_001b: stloc.0
IL_001c: ldc.i4.5
IL_001d: newarr HarmonyLib.CodeMatch
IL_0022: dup
IL_0023: ldc.i4.0
IL_0024: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldstr
IL_0029: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_002e: ldstr "JoyButtonB"
IL_0033: ldnull
IL_0034: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0039: stelem.ref
IL_003a: dup
IL_003b: ldc.i4.1
IL_003c: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_0041: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_0046: ldtoken ZInput
IL_004b: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0050: ldstr "GetButtonDown"
IL_0055: ldnull
IL_0056: ldnull
IL_0057: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_005c: ldnull
IL_005d: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0062: stelem.ref
IL_0063: dup
IL_0064: ldc.i4.2
IL_0065: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Brtrue
IL_006a: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_006f: ldnull
IL_0070: ldnull
IL_0071: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_0076: stelem.ref
IL_0077: dup
IL_0078: ldc.i4.3
IL_0079: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Ldstr
IL_007e: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_0083: ldstr "JoyButtonY"
IL_0088: ldnull
IL_0089: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_008e: stelem.ref
IL_008f: dup
IL_0090: ldc.i4.4
IL_0091: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_0096: newobj System.Void System.Nullable`1<System.Reflection.Emit.OpCode>::.ctor(!0)
IL_009b: ldtoken ZInput
IL_00a0: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00a5: ldstr "GetButtonDown"
IL_00aa: ldnull
IL_00ab: ldnull
IL_00ac: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_00b1: ldnull
IL_00b2: newobj System.Void HarmonyLib.CodeMatch::.ctor(System.Nullable`1<System.Reflection.Emit.OpCode>,System.Object,System.String)
IL_00b7: stelem.ref
IL_00b8: stloc.1
IL_00b9: ldarg.0
IL_00ba: ldnull
IL_00bb: newobj System.Void HarmonyLib.CodeMatcher::.ctor(System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction>,System.Reflection.Emit.ILGenerator)
IL_00c0: ldloc.1
IL_00c1: call HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::MatchEndForward(HarmonyLib.CodeMatch[])
IL_00c6: ldstr "Unable to match JoyButtonY IL sequence for tooltip style toggle"
IL_00cb: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::ThrowIfInvalid(System.String)
IL_00d0: ldc.i4.1
IL_00d1: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Advance(System.Int32)
IL_00d6: ldc.i4.1
IL_00d7: newarr HarmonyLib.CodeInstruction
IL_00dc: dup
IL_00dd: ldc.i4.0
IL_00de: ldsfld System.Reflection.Emit.OpCode System.Reflection.Emit.OpCodes::Call
IL_00e3: ldloc.0
IL_00e4: callvirt System.Reflection.MethodInfo System.Delegate::get_Method()
IL_00e9: newobj System.Void HarmonyLib.CodeInstruction::.ctor(System.Reflection.Emit.OpCode,System.Object)
IL_00ee: stelem.ref
IL_00ef: callvirt HarmonyLib.CodeMatcher HarmonyLib.CodeMatcher::Insert(HarmonyLib.CodeInstruction[])
IL_00f4: callvirt System.Collections.Generic.IEnumerable`1<HarmonyLib.CodeInstruction> HarmonyLib.CodeMatcher::InstructionEnumeration()
IL_00f9: ret

// System.Void ZenUI.Section.TooltipSummary::.cctor()
.locals UnityEngine.Color
IL_0000: call UnityEngine.Color UnityEngine.Color::get_white()
IL_0005: stloc.0
IL_0006: ldloca.s V_0
IL_0008: ldc.r4 0.75
IL_000d: stfld System.Single UnityEngine.Color::a
IL_0012: ldloc.0
IL_0013: call Zen.Lib.UIColor Zen.Lib.UIColor::op_Implicit(UnityEngine.Color)
IL_0018: stsfld Zen.Lib.UIColor ZenUI.Section.TooltipSummary::ColorOffWhite
IL_001d: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::ValheimBeige
IL_0022: stsfld Zen.Lib.UIColor ZenUI.Section.TooltipSummary::ColorNumbers
IL_0027: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::ValheimTooltipTitle
IL_002c: stsfld Zen.Lib.UIColor ZenUI.Section.TooltipSummary::ColorDefaultIcon
IL_0031: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::ValheimBeige
IL_0036: stsfld Zen.Lib.UIColor ZenUI.Section.TooltipSummary::ColorFooter
IL_003b: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::ValheimBeige
IL_0040: ldfld UnityEngine.Color Zen.Lib.UIColor::Color
IL_0045: stloc.0
IL_0046: ldloca.s V_0
IL_0048: ldc.r4 0.2
IL_004d: stfld System.Single UnityEngine.Color::a
IL_0052: ldloc.0
IL_0053: call Zen.Lib.UIColor Zen.Lib.UIColor::op_Implicit(UnityEngine.Color)
IL_0058: stsfld Zen.Lib.UIColor ZenUI.Section.TooltipSummary::ColorFooterDim
IL_005d: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::Orange
IL_0062: stsfld Zen.Lib.UIColor ZenUI.Section.TooltipSummary::ColorDefaultMsg
IL_0067: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::DarkOrange
IL_006c: stsfld Zen.Lib.UIColor ZenUI.Section.TooltipSummary::ColorDefaultMsgDim
IL_0071: ret

// System.String ZenUI.Section.TooltipSummary::<Format>g__HintShowMore|10_0()
.locals UnityEngine.KeyCode
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.KeyCode> ZenUI.Configs::TooltipDetailKey
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.KeyCode>::get_Value()
IL_000a: stloc.0
IL_000b: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> ZenUI.Configs::TooltipShowHint
IL_0010: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0015: brfalse.s IL_001d
IL_0017: ldloc.0
IL_0018: ldc.i4.0
IL_0019: cgt.un
IL_001b: br.s IL_001e
IL_001d: ldc.i4.0
IL_001e: brtrue.s IL_0026
IL_0020: ldsfld System.String System.String::Empty
IL_0025: ret
IL_0026: ldstr "⬇ $ui_hold "
IL_002b: ldloc.0
IL_002c: call System.String ZenUI.Section.TooltipSummary::KeyStr(UnityEngine.KeyCode)
IL_0031: call System.String System.String::Concat(System.String,System.String)
IL_0036: ret

// System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__CreateTooltip|11_0(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
.locals System.String
IL_0000: ldarg.0
IL_0001: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__Weight|11_5(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
IL_0006: ldstr "<pos=60>"
IL_000b: ldarg.0
IL_000c: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__Movement|11_15(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
IL_0011: ldstr "</pos>"
IL_0016: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_001b: stloc.0
IL_001c: ldarg.0
IL_001d: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__Summary|11_1(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
IL_0022: ldloc.0
IL_0023: ldstr ""
IL_0028: call System.String ZenUI.Section.TooltipSummary::Format(System.String,System.String,System.String)
IL_002d: ret

// System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__Summary|11_1(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
.locals System.Text.StringBuilder, System.Collections.Generic.IEnumerator`1<System.ValueTuple`2<System.String,System.Int32>>, System.String
IL_0000: ldc.i4.8
IL_0001: newarr System.String
IL_0006: dup
IL_0007: ldc.i4.0
IL_0008: ldarg.0
IL_0009: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__Description|11_3(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
IL_000e: stelem.ref
IL_000f: dup
IL_0010: ldc.i4.1
IL_0011: ldarg.0
IL_0012: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__StatsIcons|11_11(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
IL_0017: stelem.ref
IL_0018: dup
IL_0019: ldc.i4.2
IL_001a: ldarg.0
IL_001b: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__SpecialAttackMessages|11_13(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
IL_0020: stelem.ref
IL_0021: dup
IL_0022: ldc.i4.3
IL_0023: ldarg.0
IL_0024: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__ExternalModInfo|11_4(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
IL_0029: stelem.ref
IL_002a: dup
IL_002b: ldc.i4.4
IL_002c: ldarg.0
IL_002d: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__Resistances|11_9(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
IL_0032: stelem.ref
IL_0033: dup
IL_0034: ldc.i4.5
IL_0035: ldarg.0
IL_0036: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__NoTeleport|11_7(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
IL_003b: stelem.ref
IL_003c: dup
IL_003d: ldc.i4.6
IL_003e: ldarg.0
IL_003f: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__StatusEffects|11_8(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
IL_0044: stelem.ref
IL_0045: dup
IL_0046: ldc.i4.7
IL_0047: ldarg.0
IL_0048: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AppendedItemData|11_2(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
IL_004d: stelem.ref
IL_004e: newobj System.Void System.Text.StringBuilder::.ctor()
IL_0053: stloc.0
IL_0054: ldsfld System.Func`2<System.String,System.Boolean> ZenUI.Section.TooltipSummary/<>c::<>9__11_20
IL_0059: dup
IL_005a: brtrue.s IL_0073
IL_005c: pop
IL_005d: ldsfld ZenUI.Section.TooltipSummary/<>c ZenUI.Section.TooltipSummary/<>c::<>9
IL_0062: ldftn System.Boolean ZenUI.Section.TooltipSummary/<>c::<GetTooltipSummary>b__11_20(System.String)
IL_0068: newobj System.Void System.Func`2<System.String,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_006d: dup
IL_006e: stsfld System.Func`2<System.String,System.Boolean> ZenUI.Section.TooltipSummary/<>c::<>9__11_20
IL_0073: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0078: call System.Collections.Generic.IEnumerable`1<System.ValueTuple`2<!!0,System.Int32>> Zen.Lib.IEnumerableExt::WithIndex<System.String>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_007d: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<System.ValueTuple`2<System.String,System.Int32>>::GetEnumerator()
IL_0082: stloc.1
IL_0083: br.s IL_00c1
IL_0085: ldloc.1
IL_0086: callvirt !0 System.Collections.Generic.IEnumerator`1<System.ValueTuple`2<System.String,System.Int32>>::get_Current()
IL_008b: dup
IL_008c: ldfld !0 System.ValueTuple`2<System.String,System.Int32>::Item1
IL_0091: stloc.2
IL_0092: ldfld !1 System.ValueTuple`2<System.String,System.Int32>::Item2
IL_0097: ldc.i4.1
IL_0098: ceq
IL_009a: ldarg.0
IL_009b: ldfld System.Boolean ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::hasIcons
IL_00a0: and
IL_00a1: brfalse.s IL_00af
IL_00a3: ldloc.0
IL_00a4: ldstr "
"
IL_00a9: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_00ae: pop
IL_00af: ldloc.0
IL_00b0: ldloc.2
IL_00b1: ldstr "
"
IL_00b6: call System.String System.String::Concat(System.String,System.String)
IL_00bb: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_00c0: pop
IL_00c1: ldloc.1
IL_00c2: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_00c7: brtrue.s IL_0085
IL_00c9: leave.s IL_00d5
IL_00cb: ldloc.1
IL_00cc: brfalse.s IL_00d4
IL_00ce: ldloc.1
IL_00cf: callvirt System.Void System.IDisposable::Dispose()
IL_00d4: endfinally
IL_00d5: ldloc.0
IL_00d6: callvirt System.String System.Object::ToString()
IL_00db: callvirt System.String System.String::Trim()
IL_00e0: ret
// EH Finally: 131 - 203 => 203 - 213

// System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AppendedItemData|11_2(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0006: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_000b: ldfld ItemDrop ItemDrop/ItemData/SharedData::m_appendToolTip
IL_0010: dup
IL_0011: brtrue.s IL_0017
IL_0013: pop
IL_0014: ldnull
IL_0015: br.s IL_001c
IL_0017: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_001c: dup
IL_001d: brtrue.s IL_0023
IL_001f: pop
IL_0020: ldnull
IL_0021: br.s IL_002f
IL_0023: ldarg.0
IL_0024: ldfld System.Int32 ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::stackOverride
IL_0029: ldc.i4.1
IL_002a: call System.String ZenUI.Section.TooltipSummary::GetTooltipSummary(ItemDrop/ItemData,System.Int32,System.Boolean)
IL_002f: dup
IL_0030: brtrue.s IL_0038
IL_0032: pop
IL_0033: ldsfld System.String System.String::Empty
IL_0038: ret

// System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__Description|11_3(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
.locals System.String
IL_0000: ldarg.0
IL_0001: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0006: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_000b: ldfld System.String ItemDrop/ItemData/SharedData::m_description
IL_0010: stloc.0
IL_0011: ldarg.0
IL_0012: ldfld System.Boolean ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::appended
IL_0017: brtrue.s IL_003c
IL_0019: ldloc.0
IL_001a: call System.String Zen.Lib.StringExt::Localize(System.String)
IL_001f: callvirt System.String System.String::Trim()
IL_0024: ldsfld System.String System.String::Empty
IL_0029: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_002e: brfalse.s IL_003c
IL_0030: ldarg.0
IL_0031: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0036: call System.String Zen.Lib.ItemDataExt::GetName(ItemDrop/ItemData)
IL_003b: stloc.0
IL_003c: ldarg.0
IL_003d: ldfld System.Boolean ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::appended
IL_0042: brfalse.s IL_0059
IL_0044: ldloc.0
IL_0045: callvirt System.Int32 System.String::get_Length()
IL_004a: ldc.i4.0
IL_004b: ble.s IL_0059
IL_004d: ldstr "
"
IL_0052: ldloc.0
IL_0053: call System.String System.String::Concat(System.String,System.String)
IL_0058: stloc.0
IL_0059: ldstr "<color={0}>{1}</color>"
IL_005e: ldsfld Zen.Lib.UIColor ZenUI.Section.TooltipSummary::ColorOffWhite
IL_0063: ldloc.0
IL_0064: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_0069: ret

// System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__ExternalModInfo|11_4(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
.locals System.String
IL_0000: ldarg.0
IL_0001: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0006: call System.String Zen.Lib.ItemDataExt::GetTooltipExtra(ItemDrop/ItemData)
IL_000b: callvirt System.String System.String::Trim()
IL_0010: stloc.0
IL_0011: ldloc.0
IL_0012: ldsfld System.String System.String::Empty
IL_0017: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_001c: brtrue.s IL_0024
IL_001e: ldsfld System.String System.String::Empty
IL_0023: ret
IL_0024: ldstr "
<color={0}>{1}</color>"
IL_0029: ldsfld Zen.Lib.UIColor ZenUI.Section.TooltipSummary::ColorDefaultMsg
IL_002e: ldloc.0
IL_002f: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_0034: ret

// System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__Weight|11_5(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
.locals 
IL_0000: ldstr "{0} {1:0.#}"
IL_0005: ldstr "⚖"
IL_000a: ldarg.0
IL_000b: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0010: ldarg.0
IL_0011: ldfld System.Int32 ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::stackOverride
IL_0016: callvirt System.Single ItemDrop/ItemData::GetWeight(System.Int32)
IL_001b: box System.Single
IL_0020: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_0025: ret

// System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__CoinValue|11_6(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
.locals System.Int32
IL_0000: ldarg.0
IL_0001: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0006: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_000b: ldfld System.Int32 ItemDrop/ItemData/SharedData::m_value
IL_0010: ldc.i4.0
IL_0011: bgt.s IL_0019
IL_0013: ldsfld System.String System.String::Empty
IL_0018: ret
IL_0019: ldstr "💰"
IL_001e: ldarg.0
IL_001f: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0024: callvirt System.Int32 ItemDrop/ItemData::GetValue()
IL_0029: stloc.0
IL_002a: ldloca.s V_0
IL_002c: ldstr "N0"
IL_0031: call System.String System.Int32::ToString(System.String)
IL_0036: ldnull
IL_0037: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__MakeIcon|11_18(System.String,System.String,Zen.Lib.UIColor)
IL_003c: dup
IL_003d: brtrue.s IL_0045
IL_003f: pop
IL_0040: ldstr ""
IL_0045: ret

// System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__NoTeleport|11_7(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0006: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_000b: ldfld System.Boolean ItemDrop/ItemData/SharedData::m_teleportable
IL_0010: brtrue.s IL_0020
IL_0012: call ZoneSystem ZoneSystem::get_instance()
IL_0017: ldc.i4.s 35
IL_0019: callvirt System.Boolean ZoneSystem::GetGlobalKey(GlobalKeys)
IL_001e: brfalse.s IL_0026
IL_0020: ldsfld System.String System.String::Empty
IL_0025: ret
IL_0026: ldstr "
<color={0}>$item_noteleport</color>"
IL_002b: ldsfld Zen.Lib.UIColor ZenUI.Section.TooltipSummary::ColorDefaultMsg
IL_0030: call System.String System.String::Format(System.String,System.Object)
IL_0035: ret

// System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__StatusEffects|11_8(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
.locals System.Collections.Generic.List`1<StatusEffect>, System.Collections.Generic.List`1<System.String>, System.Text.StringBuilder, System.Single, System.Collections.Generic.List`1/Enumerator<StatusEffect>, StatusEffect, StatusEffect, Zen.Lib.UIColor, System.String, System.Int32, System.String, System.Text.RegularExpressions.Match, System.Int32
IL_0000: newobj System.Void System.Collections.Generic.List`1<StatusEffect>::.ctor()
IL_0005: dup
IL_0006: ldarg.0
IL_0007: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_000c: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0011: ldfld StatusEffect ItemDrop/ItemData/SharedData::m_fullAdrenalineSE
IL_0016: callvirt System.Void System.Collections.Generic.List`1<StatusEffect>::Add(!0)
IL_001b: dup
IL_001c: ldarg.0
IL_001d: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0022: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0027: ldfld StatusEffect ItemDrop/ItemData/SharedData::m_attackStatusEffect
IL_002c: callvirt System.Void System.Collections.Generic.List`1<StatusEffect>::Add(!0)
IL_0031: dup
IL_0032: ldarg.0
IL_0033: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0038: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_003d: ldfld StatusEffect ItemDrop/ItemData/SharedData::m_equipStatusEffect
IL_0042: callvirt System.Void System.Collections.Generic.List`1<StatusEffect>::Add(!0)
IL_0047: dup
IL_0048: ldarg.0
IL_0049: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_004e: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0053: ldfld StatusEffect ItemDrop/ItemData/SharedData::m_consumeStatusEffect
IL_0058: callvirt System.Void System.Collections.Generic.List`1<StatusEffect>::Add(!0)
IL_005d: dup
IL_005e: ldarg.0
IL_005f: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0064: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0069: ldfld StatusEffect ItemDrop/ItemData/SharedData::m_perfectBlockStatusEffect
IL_006e: callvirt System.Void System.Collections.Generic.List`1<StatusEffect>::Add(!0)
IL_0073: dup
IL_0074: ldarg.0
IL_0075: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_007a: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_007f: ldfld StatusEffect ItemDrop/ItemData/SharedData::m_setStatusEffect
IL_0084: callvirt System.Void System.Collections.Generic.List`1<StatusEffect>::Add(!0)
IL_0089: stloc.0
IL_008a: ldloc.0
IL_008b: ldsfld System.Predicate`1<StatusEffect> ZenUI.Section.TooltipSummary/<>c::<>9__11_21
IL_0090: dup
IL_0091: brtrue.s IL_00aa
IL_0093: pop
IL_0094: ldsfld ZenUI.Section.TooltipSummary/<>c ZenUI.Section.TooltipSummary/<>c::<>9
IL_0099: ldftn System.Boolean ZenUI.Section.TooltipSummary/<>c::<GetTooltipSummary>b__11_21(StatusEffect)
IL_009f: newobj System.Void System.Predicate`1<StatusEffect>::.ctor(System.Object,System.IntPtr)
IL_00a4: dup
IL_00a5: stsfld System.Predicate`1<StatusEffect> ZenUI.Section.TooltipSummary/<>c::<>9__11_21
IL_00aa: callvirt System.Int32 System.Collections.Generic.List`1<StatusEffect>::RemoveAll(System.Predicate`1<!0>)
IL_00af: pop
IL_00b0: ldloc.0
IL_00b1: callvirt System.Int32 System.Collections.Generic.List`1<StatusEffect>::get_Count()
IL_00b6: brtrue.s IL_00be
IL_00b8: ldsfld System.String System.String::Empty
IL_00bd: ret
IL_00be: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor()
IL_00c3: stloc.1
IL_00c4: newobj System.Void System.Text.StringBuilder::.ctor()
IL_00c9: stloc.2
IL_00ca: ldarg.0
IL_00cb: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_00d0: ldc.i4.2
IL_00d1: call System.Boolean Zen.Lib.ItemDataExt::IsItemType(ItemDrop/ItemData,ItemDrop/ItemData/ItemType)
IL_00d6: brfalse.s IL_0119
IL_00d8: ldloc.0
IL_00d9: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<StatusEffect>::GetEnumerator()
IL_00de: stloc.s V_4
IL_00e0: br.s IL_0100
IL_00e2: ldloca.s V_4
IL_00e4: call !0 System.Collections.Generic.List`1/Enumerator<StatusEffect>::get_Current()
IL_00e9: stloc.s V_5
IL_00eb: ldloc.1
IL_00ec: ldstr "⏱"
IL_00f1: ldloc.s V_5
IL_00f3: ldfld System.Single StatusEffect::m_ttl
IL_00f8: ldnull
IL_00f9: ldnull
IL_00fa: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIconIfValue|11_17(System.Collections.Generic.List`1<System.String>,System.String,System.Single,System.String,Zen.Lib.UIColor)
IL_00ff: pop
IL_0100: ldloca.s V_4
IL_0102: call System.Boolean System.Collections.Generic.List`1/Enumerator<StatusEffect>::MoveNext()
IL_0107: brtrue.s IL_00e2
IL_0109: leave.s IL_0119
IL_010b: ldloca.s V_4
IL_010d: constrained. System.Collections.Generic.List`1/Enumerator<StatusEffect>
IL_0113: callvirt System.Void System.IDisposable::Dispose()
IL_0118: endfinally
IL_0119: ldloc.1
IL_011a: callvirt System.Int32 System.Collections.Generic.List`1<System.String>::get_Count()
IL_011f: ldc.i4.0
IL_0120: ble.s IL_013a
IL_0122: ldloc.2
IL_0123: ldloc.1
IL_0124: ldarg.0
IL_0125: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__CombineIcons|11_19(System.Collections.Generic.List`1<System.String>,ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
IL_012a: ldstr "
"
IL_012f: call System.String System.String::Concat(System.String,System.String)
IL_0134: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0139: pop
IL_013a: ldsfld Player Player::m_localPlayer
IL_013f: ldarg.0
IL_0140: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0145: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_014a: ldfld Skills/SkillType ItemDrop/ItemData/SharedData::m_skillType
IL_014f: callvirt System.Single Character::GetSkillLevel(Skills/SkillType)
IL_0154: stloc.3
IL_0155: ldloc.0
IL_0156: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<StatusEffect>::GetEnumerator()
IL_015b: stloc.s V_4
IL_015d: br IL_02de
IL_0162: ldloca.s V_4
IL_0164: call !0 System.Collections.Generic.List`1/Enumerator<StatusEffect>::get_Current()
IL_0169: stloc.s V_6
IL_016b: ldloc.s V_6
IL_016d: ldarg.0
IL_016e: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0173: ldfld System.Int32 ItemDrop/ItemData::m_quality
IL_0178: ldloc.3
IL_0179: callvirt System.Void StatusEffect::SetLevel(System.Int32,System.Single)
IL_017e: ldsfld Zen.Lib.UIColor ZenUI.Section.TooltipSummary::ColorDefaultMsg
IL_0183: stloc.s V_7
IL_0185: ldsfld System.String System.String::Empty
IL_018a: stloc.s V_8
IL_018c: ldarg.0
IL_018d: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0192: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0197: ldfld System.Int32 ItemDrop/ItemData/SharedData::m_setSize
IL_019c: stloc.s V_9
IL_019e: ldloc.s V_9
IL_01a0: ldc.i4.0
IL_01a1: ble.s IL_0212
IL_01a3: ldloc.s V_6
IL_01a5: ldarg.0
IL_01a6: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_01ab: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_01b0: ldfld StatusEffect ItemDrop/ItemData/SharedData::m_setStatusEffect
IL_01b5: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_01ba: brfalse.s IL_0212
IL_01bc: ldsfld Player Player::m_localPlayer
IL_01c1: ldarg.0
IL_01c2: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_01c7: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_01cc: ldfld System.String ItemDrop/ItemData/SharedData::m_setName
IL_01d1: callvirt System.Int32 Humanoid::GetSetCount(System.String)
IL_01d6: stloc.s V_12
IL_01d8: ldloc.s V_12
IL_01da: ldloc.s V_9
IL_01dc: bge.s IL_01e5
IL_01de: ldsfld Zen.Lib.UIColor ZenUI.Section.TooltipSummary::ColorDefaultMsgDim
IL_01e3: stloc.s V_7
IL_01e5: ldstr "
"
IL_01ea: ldstr "🔘"
IL_01ef: ldstr "🟣"
IL_01f4: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::Orange
IL_01f9: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::DarkOrange
IL_01fe: ldloc.s V_12
IL_0200: conv.r4
IL_0201: ldloc.s V_9
IL_0203: conv.r4
IL_0204: ldloc.s V_9
IL_0206: call System.String Zen.Lib.UI::CreateMeter(System.String,System.String,Zen.Lib.UIColor,Zen.Lib.UIColor,System.Single,System.Single,System.Int32)
IL_020b: call System.String System.String::Concat(System.String,System.String)
IL_0210: stloc.s V_8
IL_0212: ldloc.s V_6
IL_0214: ldarg.0
IL_0215: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_021a: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_021f: ldfld StatusEffect ItemDrop/ItemData/SharedData::m_consumeStatusEffect
IL_0224: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0229: brtrue.s IL_024e
IL_022b: ldarg.0
IL_022c: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0231: call System.String Zen.Lib.ItemDataExt::GetName(ItemDrop/ItemData)
IL_0236: call System.String Zen.Lib.StringExt::Localize(System.String)
IL_023b: ldloc.s V_6
IL_023d: ldfld System.String StatusEffect::m_name
IL_0242: call System.String Zen.Lib.StringExt::Localize(System.String)
IL_0247: callvirt System.Boolean System.String::Contains(System.String)
IL_024c: br.s IL_024f
IL_024e: ldc.i4.1
IL_024f: brfalse.s IL_0258
IL_0251: ldsfld System.String System.String::Empty
IL_0256: br.s IL_0269
IL_0258: ldloc.s V_6
IL_025a: ldfld System.String StatusEffect::m_name
IL_025f: ldstr ": "
IL_0264: call System.String System.String::Concat(System.String,System.String)
IL_0269: stloc.s V_10
IL_026b: ldloc.s V_6
IL_026d: callvirt System.String StatusEffect::GetTooltipString()
IL_0272: ldstr "\$se_[^
]+"
IL_0277: call System.Text.RegularExpressions.Match System.Text.RegularExpressions.Regex::Match(System.String,System.String)
IL_027c: stloc.s V_11
IL_027e: ldloc.s V_11
IL_0280: callvirt System.Boolean System.Text.RegularExpressions.Group::get_Success()
IL_0285: brfalse.s IL_02b9
IL_0287: ldloc.2
IL_0288: ldstr "
<color={0}>{1}{2}{3}</color>"
IL_028d: ldc.i4.4
IL_028e: newarr System.Object
IL_0293: dup
IL_0294: ldc.i4.0
IL_0295: ldloc.s V_7
IL_0297: stelem.ref
IL_0298: dup
IL_0299: ldc.i4.1
IL_029a: ldloc.s V_10
IL_029c: stelem.ref
IL_029d: dup
IL_029e: ldc.i4.2
IL_029f: ldloc.s V_11
IL_02a1: callvirt System.String System.Text.RegularExpressions.Capture::get_Value()
IL_02a6: stelem.ref
IL_02a7: dup
IL_02a8: ldc.i4.3
IL_02a9: ldloc.s V_8
IL_02ab: stelem.ref
IL_02ac: call System.String System.String::Format(System.String,System.Object[])
IL_02b1: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_02b6: pop
IL_02b7: br.s IL_02de
IL_02b9: ldloc.s V_10
IL_02bb: ldsfld System.String System.String::Empty
IL_02c0: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_02c5: brfalse.s IL_02de
IL_02c7: ldloc.2
IL_02c8: ldstr "
<color={0}>{1}{2}</color>"
IL_02cd: ldloc.s V_7
IL_02cf: ldloc.s V_10
IL_02d1: ldloc.s V_8
IL_02d3: call System.String System.String::Format(System.String,System.Object,System.Object,System.Object)
IL_02d8: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_02dd: pop
IL_02de: ldloca.s V_4
IL_02e0: call System.Boolean System.Collections.Generic.List`1/Enumerator<StatusEffect>::MoveNext()
IL_02e5: brtrue IL_0162
IL_02ea: leave.s IL_02fa
IL_02ec: ldloca.s V_4
IL_02ee: constrained. System.Collections.Generic.List`1/Enumerator<StatusEffect>
IL_02f4: callvirt System.Void System.IDisposable::Dispose()
IL_02f9: endfinally
IL_02fa: ldloc.2
IL_02fb: callvirt System.String System.Object::ToString()
IL_0300: ret
// EH Finally: 224 - 267 => 267 - 281
// EH Finally: 349 - 748 => 748 - 762

// System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__Resistances|11_9(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0006: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_000b: ldfld System.Collections.Generic.List`1<HitData/DamageModPair> ItemDrop/ItemData/SharedData::m_damageModifiers
IL_0010: call System.String SE_Stats::GetDamageModifiersTooltipString(System.Collections.Generic.List`1<HitData/DamageModPair>)
IL_0015: ret

// System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__Defense|11_10(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
.locals System.Collections.Generic.List`1<System.String>, System.Int32
IL_0000: ldarg.0
IL_0001: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0006: callvirt System.Boolean ItemDrop/ItemData::IsEquipable()
IL_000b: brtrue.s IL_0013
IL_000d: ldsfld System.String System.String::Empty
IL_0012: ret
IL_0013: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor()
IL_0018: stloc.0
IL_0019: ldarg.0
IL_001a: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_001f: callvirt System.Boolean ItemDrop/ItemData::IsWeapon()
IL_0024: brtrue.s IL_0033
IL_0026: ldarg.0
IL_0027: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_002c: call System.Boolean Zen.Lib.ItemDataExt::IsShield(ItemDrop/ItemData)
IL_0031: brfalse.s IL_0082
IL_0033: ldloc.0
IL_0034: ldstr "🛡️"
IL_0039: ldarg.0
IL_003a: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_003f: callvirt System.Single ItemDrop/ItemData::GetBaseBlockPower()
IL_0044: ldnull
IL_0045: ldnull
IL_0046: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIconIfValue|11_17(System.Collections.Generic.List`1<System.String>,System.String,System.Single,System.String,Zen.Lib.UIColor)
IL_004b: pop
IL_004c: ldarg.0
IL_004d: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0052: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0057: ldfld System.Boolean ItemDrop/ItemData/SharedData::m_buildBlockCharges
IL_005c: brtrue.s IL_0061
IL_005e: ldc.i4.0
IL_005f: br.s IL_0071
IL_0061: ldarg.0
IL_0062: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0067: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_006c: ldfld System.Int32 ItemDrop/ItemData/SharedData::m_maxBlockCharges
IL_0071: stloc.1
IL_0072: ldloc.0
IL_0073: ldstr "💥"
IL_0078: ldloc.1
IL_0079: conv.r4
IL_007a: ldnull
IL_007b: ldnull
IL_007c: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIconIfValue|11_17(System.Collections.Generic.List`1<System.String>,System.String,System.Single,System.String,Zen.Lib.UIColor)
IL_0081: pop
IL_0082: ldarg.0
IL_0083: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0088: ldc.i4.0
IL_0089: call System.Boolean Zen.Lib.ItemDataExt::IsArmor(ItemDrop/ItemData,System.Boolean)
IL_008e: brfalse.s IL_00a9
IL_0090: ldloc.0
IL_0091: ldstr "🔰"
IL_0096: ldarg.0
IL_0097: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_009c: callvirt System.Single ItemDrop/ItemData::GetArmor()
IL_00a1: ldnull
IL_00a2: ldnull
IL_00a3: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIconIfValue|11_17(System.Collections.Generic.List`1<System.String>,System.String,System.Single,System.String,Zen.Lib.UIColor)
IL_00a8: pop
IL_00a9: ldloc.0
IL_00aa: ldarg.0
IL_00ab: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__CombineIcons|11_19(System.Collections.Generic.List`1<System.String>,ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
IL_00b0: ret

// System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__StatsIcons|11_11(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
.locals 
IL_0000: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor()
IL_0005: dup
IL_0006: ldarg.0
IL_0007: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__Attack|11_12(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
IL_000c: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIfExists|11_16(System.Collections.Generic.List`1<System.String>,System.String)
IL_0011: pop
IL_0012: dup
IL_0013: ldarg.0
IL_0014: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__Defense|11_10(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
IL_0019: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIfExists|11_16(System.Collections.Generic.List`1<System.String>,System.String)
IL_001e: pop
IL_001f: dup
IL_0020: ldarg.0
IL_0021: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__Food|11_14(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
IL_0026: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIfExists|11_16(System.Collections.Generic.List`1<System.String>,System.String)
IL_002b: pop
IL_002c: dup
IL_002d: ldarg.0
IL_002e: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__CoinValue|11_6(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
IL_0033: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIfExists|11_16(System.Collections.Generic.List`1<System.String>,System.String)
IL_0038: pop
IL_0039: ldarg.0
IL_003a: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__CombineIcons|11_19(System.Collections.Generic.List`1<System.String>,ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
IL_003f: ret

// System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__Attack|11_12(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
.locals System.String, System.Collections.Generic.List`1<System.String>, HitData/DamageTypes, Attack, Skills/SkillType, System.Boolean
IL_0000: ldarg.0
IL_0001: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0006: callvirt System.Boolean ItemDrop/ItemData::IsWeapon()
IL_000b: brtrue.s IL_002b
IL_000d: ldarg.0
IL_000e: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0013: ldc.i4.s 9
IL_0015: call System.Boolean Zen.Lib.ItemDataExt::IsItemType(ItemDrop/ItemData,ItemDrop/ItemData/ItemType)
IL_001a: brtrue.s IL_002b
IL_001c: ldarg.0
IL_001d: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0022: ldc.i4.s 23
IL_0024: call System.Boolean Zen.Lib.ItemDataExt::IsItemType(ItemDrop/ItemData,ItemDrop/ItemData/ItemType)
IL_0029: br.s IL_002c
IL_002b: ldc.i4.1
IL_002c: brtrue.s IL_0034
IL_002e: ldsfld System.String System.String::Empty
IL_0033: ret
IL_0034: ldnull
IL_0035: stloc.0
IL_0036: ldarg.0
IL_0037: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_003c: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0041: ldfld Skills/SkillType ItemDrop/ItemData/SharedData::m_skillType
IL_0046: stloc.s V_4
IL_0048: ldloc.s V_4
IL_004a: ldc.i4.8
IL_004b: beq.s IL_0053
IL_004d: ldloc.s V_4
IL_004f: ldc.i4.s 14
IL_0051: bne.un.s IL_0058
IL_0053: ldc.i4.1
IL_0054: stloc.s V_5
IL_0056: br.s IL_005b
IL_0058: ldc.i4.0
IL_0059: stloc.s V_5
IL_005b: ldloc.s V_5
IL_005d: brfalse.s IL_0065
IL_005f: ldstr "🏹"
IL_0064: stloc.0
IL_0065: ldarg.0
IL_0066: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_006b: ldc.i4.s 9
IL_006d: call System.Boolean Zen.Lib.ItemDataExt::IsItemType(ItemDrop/ItemData,ItemDrop/ItemData/ItemType)
IL_0072: brtrue.s IL_0083
IL_0074: ldarg.0
IL_0075: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_007a: ldc.i4.s 23
IL_007c: call System.Boolean Zen.Lib.ItemDataExt::IsItemType(ItemDrop/ItemData,ItemDrop/ItemData/ItemType)
IL_0081: brfalse.s IL_0089
IL_0083: ldstr "🎯"
IL_0088: stloc.0
IL_0089: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor()
IL_008e: stloc.1
IL_008f: ldarg.0
IL_0090: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0095: callvirt HitData/DamageTypes ItemDrop/ItemData::GetDamage()
IL_009a: stloc.2
IL_009b: ldloc.1
IL_009c: ldloc.0
IL_009d: dup
IL_009e: brtrue.s IL_00a6
IL_00a0: pop
IL_00a1: ldstr "⚔"
IL_00a6: ldloc.2
IL_00a7: ldfld System.Single HitData/DamageTypes::m_damage
IL_00ac: ldnull
IL_00ad: ldnull
IL_00ae: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIconIfValue|11_17(System.Collections.Generic.List`1<System.String>,System.String,System.Single,System.String,Zen.Lib.UIColor)
IL_00b3: pop
IL_00b4: ldloc.1
IL_00b5: ldloc.0
IL_00b6: dup
IL_00b7: brtrue.s IL_00bf
IL_00b9: pop
IL_00ba: ldstr "⚔"
IL_00bf: ldloc.2
IL_00c0: ldfld System.Single HitData/DamageTypes::m_slash
IL_00c5: ldnull
IL_00c6: ldnull
IL_00c7: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIconIfValue|11_17(System.Collections.Generic.List`1<System.String>,System.String,System.Single,System.String,Zen.Lib.UIColor)
IL_00cc: pop
IL_00cd: ldloc.1
IL_00ce: ldloc.0
IL_00cf: dup
IL_00d0: brtrue.s IL_00d8
IL_00d2: pop
IL_00d3: ldstr "⚒"
IL_00d8: ldloc.2
IL_00d9: ldfld System.Single HitData/DamageTypes::m_blunt
IL_00de: ldnull
IL_00df: ldnull
IL_00e0: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIconIfValue|11_17(System.Collections.Generic.List`1<System.String>,System.String,System.Single,System.String,Zen.Lib.UIColor)
IL_00e5: pop
IL_00e6: ldloc.1
IL_00e7: ldstr "⛏"
IL_00ec: ldloc.2
IL_00ed: ldfld System.Single HitData/DamageTypes::m_pickaxe
IL_00f2: ldnull
IL_00f3: ldnull
IL_00f4: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIconIfValue|11_17(System.Collections.Generic.List`1<System.String>,System.String,System.Single,System.String,Zen.Lib.UIColor)
IL_00f9: pop
IL_00fa: ldloc.2
IL_00fb: ldfld System.Single HitData/DamageTypes::m_pickaxe
IL_0100: ldloc.2
IL_0101: ldfld System.Single HitData/DamageTypes::m_pierce
IL_0106: call System.Boolean UnityEngine.Mathf::Approximately(System.Single,System.Single)
IL_010b: brtrue.s IL_0126
IL_010d: ldloc.1
IL_010e: ldloc.0
IL_010f: dup
IL_0110: brtrue.s IL_0118
IL_0112: pop
IL_0113: ldstr "🔱"
IL_0118: ldloc.2
IL_0119: ldfld System.Single HitData/DamageTypes::m_pierce
IL_011e: ldnull
IL_011f: ldnull
IL_0120: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIconIfValue|11_17(System.Collections.Generic.List`1<System.String>,System.String,System.Single,System.String,Zen.Lib.UIColor)
IL_0125: pop
IL_0126: ldloc.1
IL_0127: ldstr "🪓"
IL_012c: ldloc.2
IL_012d: ldfld System.Single HitData/DamageTypes::m_chop
IL_0132: ldnull
IL_0133: ldnull
IL_0134: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIconIfValue|11_17(System.Collections.Generic.List`1<System.String>,System.String,System.Single,System.String,Zen.Lib.UIColor)
IL_0139: pop
IL_013a: ldloc.1
IL_013b: ldstr "🔥"
IL_0140: ldloc.2
IL_0141: ldfld System.Single HitData/DamageTypes::m_fire
IL_0146: ldnull
IL_0147: ldnull
IL_0148: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIconIfValue|11_17(System.Collections.Generic.List`1<System.String>,System.String,System.Single,System.String,Zen.Lib.UIColor)
IL_014d: pop
IL_014e: ldloc.1
IL_014f: ldstr "❄"
IL_0154: ldloc.2
IL_0155: ldfld System.Single HitData/DamageTypes::m_frost
IL_015a: ldnull
IL_015b: ldnull
IL_015c: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIconIfValue|11_17(System.Collections.Generic.List`1<System.String>,System.String,System.Single,System.String,Zen.Lib.UIColor)
IL_0161: pop
IL_0162: ldloc.1
IL_0163: ldstr "⚡"
IL_0168: ldloc.2
IL_0169: ldfld System.Single HitData/DamageTypes::m_lightning
IL_016e: ldnull
IL_016f: ldnull
IL_0170: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIconIfValue|11_17(System.Collections.Generic.List`1<System.String>,System.String,System.Single,System.String,Zen.Lib.UIColor)
IL_0175: pop
IL_0176: ldloc.1
IL_0177: ldstr "💀︎"
IL_017c: ldloc.2
IL_017d: ldfld System.Single HitData/DamageTypes::m_poison
IL_0182: ldnull
IL_0183: ldnull
IL_0184: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIconIfValue|11_17(System.Collections.Generic.List`1<System.String>,System.String,System.Single,System.String,Zen.Lib.UIColor)
IL_0189: pop
IL_018a: ldloc.1
IL_018b: ldstr "🌀"
IL_0190: ldloc.2
IL_0191: ldfld System.Single HitData/DamageTypes::m_spirit
IL_0196: ldnull
IL_0197: ldnull
IL_0198: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIconIfValue|11_17(System.Collections.Generic.List`1<System.String>,System.String,System.Single,System.String,Zen.Lib.UIColor)
IL_019d: pop
IL_019e: ldarg.0
IL_019f: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_01a4: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_01a9: ldfld Attack ItemDrop/ItemData/SharedData::m_attack
IL_01ae: dup
IL_01af: brtrue.s IL_01c2
IL_01b1: pop
IL_01b2: ldarg.0
IL_01b3: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_01b8: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_01bd: ldfld Attack ItemDrop/ItemData/SharedData::m_secondaryAttack
IL_01c2: stloc.3
IL_01c3: ldloc.3
IL_01c4: brfalse.s IL_0213
IL_01c6: ldarg.0
IL_01c7: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_01cc: callvirt System.Boolean ItemDrop/ItemData::IsWeapon()
IL_01d1: brfalse.s IL_0213
IL_01d3: ldloc.1
IL_01d4: ldstr "✨"
IL_01d9: ldloc.3
IL_01da: ldfld System.Single Attack::m_attackEitr
IL_01df: ldnull
IL_01e0: ldnull
IL_01e1: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIconIfValue|11_17(System.Collections.Generic.List`1<System.String>,System.String,System.Single,System.String,Zen.Lib.UIColor)
IL_01e6: pop
IL_01e7: ldloc.1
IL_01e8: ldstr "🩸"
IL_01ed: ldloc.3
IL_01ee: ldfld System.Single Attack::m_attackHealth
IL_01f3: ldnull
IL_01f4: ldnull
IL_01f5: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIconIfValue|11_17(System.Collections.Generic.List`1<System.String>,System.String,System.Single,System.String,Zen.Lib.UIColor)
IL_01fa: pop
IL_01fb: ldloc.1
IL_01fc: ldstr "🩸"
IL_0201: ldloc.3
IL_0202: ldfld System.Single Attack::m_attackHealthPercentage
IL_0207: ldstr "%"
IL_020c: ldnull
IL_020d: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIconIfValue|11_17(System.Collections.Generic.List`1<System.String>,System.String,System.Single,System.String,Zen.Lib.UIColor)
IL_0212: pop
IL_0213: ldloc.1
IL_0214: ldarg.0
IL_0215: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__CombineIcons|11_19(System.Collections.Generic.List`1<System.String>,ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
IL_021a: ret

// System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__SpecialAttackMessages|11_13(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
.locals Attack, System.Collections.Generic.List`1<System.String>, UnityEngine.GameObject, Aoe, ItemDrop
IL_0000: ldarg.0
IL_0001: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0006: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_000b: ldfld Attack ItemDrop/ItemData/SharedData::m_attack
IL_0010: dup
IL_0011: brtrue.s IL_0024
IL_0013: pop
IL_0014: ldarg.0
IL_0015: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_001a: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_001f: ldfld Attack ItemDrop/ItemData/SharedData::m_secondaryAttack
IL_0024: stloc.0
IL_0025: ldarg.0
IL_0026: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_002b: callvirt System.Boolean ItemDrop/ItemData::IsWeapon()
IL_0030: brfalse.s IL_0035
IL_0032: ldloc.0
IL_0033: brtrue.s IL_003b
IL_0035: ldsfld System.String System.String::Empty
IL_003a: ret
IL_003b: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor()
IL_0040: stloc.1
IL_0041: ldarg.0
IL_0042: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0047: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_004c: ldfld System.Boolean ItemDrop/ItemData/SharedData::m_tamedOnly
IL_0051: brfalse.s IL_005e
IL_0053: ldloc.1
IL_0054: ldstr "$item_tamedonly"
IL_0059: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_005e: ldloc.0
IL_005f: ldfld System.Single Attack::m_damageMultiplierPerMissingHP
IL_0064: ldc.r4 0
IL_0069: beq.s IL_0076
IL_006b: ldloc.1
IL_006c: ldstr "$item_damagemultiplierhp"
IL_0071: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_0076: ldloc.0
IL_0077: ldfld System.Single Attack::m_damageMultiplierByTotalHealthMissing
IL_007c: ldc.r4 0
IL_0081: beq.s IL_008e
IL_0083: ldloc.1
IL_0084: ldstr "$item_damagemultipliertotal"
IL_0089: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_008e: ldloc.0
IL_008f: ldfld UnityEngine.GameObject Attack::m_spawnOnHit
IL_0094: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0099: brfalse.s IL_00df
IL_009b: ldloc.0
IL_009c: ldfld UnityEngine.GameObject Attack::m_spawnOnHit
IL_00a1: stloc.2
IL_00a2: ldloc.2
IL_00a3: ldloca.s V_3
IL_00a5: callvirt System.Boolean UnityEngine.GameObject::TryGetComponent<Aoe>(!!0&)
IL_00aa: brfalse.s IL_00ba
IL_00ac: ldloc.1
IL_00ad: ldloc.3
IL_00ae: ldfld System.String Aoe::m_name
IL_00b3: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_00b8: br.s IL_00df
IL_00ba: ldloc.2
IL_00bb: ldloca.s V_4
IL_00bd: callvirt System.Boolean UnityEngine.GameObject::TryGetComponent<ItemDrop>(!!0&)
IL_00c2: brfalse.s IL_00d3
IL_00c4: ldloc.1
IL_00c5: ldloc.s V_4
IL_00c7: call System.String Zen.Lib.ItemDataExt::GetName(ItemDrop)
IL_00cc: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_00d1: br.s IL_00df
IL_00d3: ldloc.1
IL_00d4: ldloc.2
IL_00d5: callvirt System.String UnityEngine.Object::get_name()
IL_00da: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_00df: ldloc.1
IL_00e0: callvirt System.Int32 System.Collections.Generic.List`1<System.String>::get_Count()
IL_00e5: brfalse.s IL_0103
IL_00e7: ldstr "
<color={0}>{1}</color>"
IL_00ec: ldsfld Zen.Lib.UIColor ZenUI.Section.TooltipSummary::ColorDefaultMsg
IL_00f1: ldloc.1
IL_00f2: ldnull
IL_00f3: ldstr "
"
IL_00f8: call System.String HarmonyLib.GeneralExtensions::Join<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.String>,System.String)
IL_00fd: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_0102: ret
IL_0103: ldsfld System.String System.String::Empty
IL_0108: ret

// System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__Food|11_14(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
.locals ItemDrop/ItemData, System.Single, System.Single, System.Single
IL_0000: ldarg.0
IL_0001: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: ldc.i4.2
IL_0009: call System.Boolean Zen.Lib.ItemDataExt::IsItemType(ItemDrop/ItemData,ItemDrop/ItemData/ItemType)
IL_000e: brtrue.s IL_0016
IL_0010: ldsfld System.String System.String::Empty
IL_0015: ret
IL_0016: ldloc.0
IL_0017: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_001c: ldfld System.Single ItemDrop/ItemData/SharedData::m_food
IL_0021: stloc.1
IL_0022: ldloc.0
IL_0023: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0028: ldfld System.Single ItemDrop/ItemData/SharedData::m_foodStamina
IL_002d: stloc.2
IL_002e: ldloc.0
IL_002f: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0034: ldfld System.Single ItemDrop/ItemData/SharedData::m_foodEitr
IL_0039: stloc.3
IL_003a: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor()
IL_003f: dup
IL_0040: ldstr "💖"
IL_0045: ldloc.1
IL_0046: ldnull
IL_0047: ldnull
IL_0048: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIconIfValue|11_17(System.Collections.Generic.List`1<System.String>,System.String,System.Single,System.String,Zen.Lib.UIColor)
IL_004d: pop
IL_004e: dup
IL_004f: ldstr "💪"
IL_0054: ldloc.2
IL_0055: ldnull
IL_0056: ldnull
IL_0057: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIconIfValue|11_17(System.Collections.Generic.List`1<System.String>,System.String,System.Single,System.String,Zen.Lib.UIColor)
IL_005c: pop
IL_005d: dup
IL_005e: ldstr "✨"
IL_0063: ldloc.3
IL_0064: ldnull
IL_0065: ldnull
IL_0066: call System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIconIfValue|11_17(System.Collections.Generic.List`1<System.String>,System.String,System.Single,System.String,Zen.Lib.UIColor)
IL_006b: pop
IL_006c: ldarg.0
IL_006d: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__CombineIcons|11_19(System.Collections.Generic.List`1<System.String>,ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
IL_0072: ret

// System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__Movement|11_15(ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
.locals System.Single, System.String, System.String
IL_0000: ldarg.0
IL_0001: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0006: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_000b: ldfld System.Single ItemDrop/ItemData/SharedData::m_movementModifier
IL_0010: stloc.0
IL_0011: ldloc.0
IL_0012: ldc.r4 0
IL_0017: bne.un.s IL_001f
IL_0019: ldsfld System.String System.String::Empty
IL_001e: ret
IL_001f: ldloc.0
IL_0020: ldc.r4 0
IL_0025: bgt.s IL_002e
IL_0027: ldsfld System.String System.String::Empty
IL_002c: br.s IL_0033
IL_002e: ldstr "+"
IL_0033: stloc.1
IL_0034: ldstr "{0} {1}{2}%"
IL_0039: ldstr "🏃"
IL_003e: ldloc.1
IL_003f: ldloc.0
IL_0040: ldc.r4 100
IL_0045: mul
IL_0046: box System.Single
IL_004b: call System.String System.String::Format(System.String,System.Object,System.Object,System.Object)
IL_0050: stloc.2
IL_0051: ldarg.0
IL_0052: ldfld ItemDrop/ItemData ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::item
IL_0057: ldfld System.Boolean ItemDrop/ItemData::m_equipped
IL_005c: brtrue.s IL_006f
IL_005e: ldstr "<color={0}>{1}</color>"
IL_0063: ldsfld Zen.Lib.UIColor ZenUI.Section.TooltipSummary::ColorFooterDim
IL_0068: ldloc.2
IL_0069: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_006e: ret
IL_006f: ldloc.2
IL_0070: ret

// System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIfExists|11_16(System.Collections.Generic.List`1<System.String>,System.String)
.locals 
IL_0000: ldarg.1
IL_0001: call System.Boolean BepInEx.Utility::IsNullOrWhiteSpace(System.String)
IL_0006: brfalse.s IL_000a
IL_0008: ldc.i4.0
IL_0009: ret
IL_000a: ldarg.0
IL_000b: ldarg.1
IL_000c: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_0011: ldc.i4.1
IL_0012: ret

// System.Boolean ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__AddIconIfValue|11_17(System.Collections.Generic.List`1<System.String>,System.String,System.Single,System.String,Zen.Lib.UIColor)
.locals 
IL_0000: ldarg.2
IL_0001: ldc.r4 0
IL_0006: beq.s IL_0014
IL_0008: ldsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.TooltipStyle> ZenUI.Configs::TooltipDisplayMode
IL_000d: callvirt !0 BepInEx.Configuration.ConfigEntry`1<ZenUI.TooltipStyle>::get_Value()
IL_0012: brtrue.s IL_0016
IL_0014: ldc.i4.0
IL_0015: ret
IL_0016: ldarg.3
IL_0017: brtrue.s IL_0020
IL_0019: ldsfld System.String System.String::Empty
IL_001e: starg.s suffix
IL_0020: ldarg.0
IL_0021: ldarg.1
IL_0022: ldstr "{0:0.#}{1}"
IL_0027: ldarg.2
IL_0028: box System.Single
IL_002d: ldarg.3
IL_002e: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_0033: ldarg.s color
IL_0035: call System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__MakeIcon|11_18(System.String,System.String,Zen.Lib.UIColor)
IL_003a: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_003f: ldc.i4.1
IL_0040: ret

// System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__MakeIcon|11_18(System.String,System.String,Zen.Lib.UIColor)
.locals 
IL_0000: ldarg.2
IL_0001: brtrue.s IL_000b
IL_0003: ldarg.0
IL_0004: call Zen.Lib.UIColor ZenUI.Section.TooltipSummary/Icon::GetColor(System.String)
IL_0009: starg.s color
IL_000b: ldstr "<nobr><size=+4><color={0}>{1}</color></size>{2}<color={3}><size=-2>{4}</size></color></nobr>"
IL_0010: ldc.i4.5
IL_0011: newarr System.Object
IL_0016: dup
IL_0017: ldc.i4.0
IL_0018: ldarg.2
IL_0019: stelem.ref
IL_001a: dup
IL_001b: ldc.i4.1
IL_001c: ldarg.0
IL_001d: stelem.ref
IL_001e: dup
IL_001f: ldc.i4.2
IL_0020: ldstr "<space=2px>"
IL_0025: stelem.ref
IL_0026: dup
IL_0027: ldc.i4.3
IL_0028: ldsfld Zen.Lib.UIColor ZenUI.Section.TooltipSummary::ColorNumbers
IL_002d: stelem.ref
IL_002e: dup
IL_002f: ldc.i4.4
IL_0030: ldarg.1
IL_0031: stelem.ref
IL_0032: call System.String System.String::Format(System.String,System.Object[])
IL_0037: ret

// System.String ZenUI.Section.TooltipSummary::<GetTooltipSummary>g__CombineIcons|11_19(System.Collections.Generic.List`1<System.String>,ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0&)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<ZenUI.TooltipStyle> ZenUI.Configs::TooltipDisplayMode
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<ZenUI.TooltipStyle>::get_Value()
IL_000a: brtrue.s IL_0012
IL_000c: ldsfld System.String System.String::Empty
IL_0011: ret
IL_0012: ldarg.0
IL_0013: callvirt System.Int32 System.Collections.Generic.List`1<System.String>::get_Count()
IL_0018: ldc.i4.0
IL_0019: ble.s IL_0022
IL_001b: ldarg.1
IL_001c: ldc.i4.1
IL_001d: stfld System.Boolean ZenUI.Section.TooltipSummary/<>c__DisplayClass11_0::hasIcons
IL_0022: ldarg.0
IL_0023: ldnull
IL_0024: ldstr "    "
IL_0029: call System.String HarmonyLib.GeneralExtensions::Join<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.String>,System.String)
IL_002e: ret

// System.Single ZenUI.Section.TooltipSummary::<UITooltip_LateUpdate>g__ConfigDelay|15_0(System.Single)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ZenUI.Configs::TooltipDelay
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_000a: ldc.i4.0
IL_000b: blt.s IL_001f
IL_000d: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> ZenUI.Configs::TooltipDelay
IL_0012: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0017: conv.r4
IL_0018: ldc.r4 10
IL_001d: div
IL_001e: ret
IL_001f: ldarg.0
IL_0020: ret

// System.Boolean ZenUI.Section.TooltipSummary::<InventoryGui_Update>g__Intercept|16_0(System.Boolean)
.locals 
IL_0000: call System.Boolean ZenUI.Section.TooltipSummary::get_IsFeatureEnabled()
IL_0005: ldc.i4.0
IL_0006: ceq
IL_0008: ldarg.0
IL_0009: and
IL_000a: ret

// Zen.Lib.UIColor ZenUI.Section.TooltipSummary/Icon::GetColor(System.String)
.locals Zen.Lib.UIColor
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<System.String,Zen.Lib.UIColor> ZenUI.Section.TooltipSummary/Icon::ColorMap
IL_0005: ldarg.0
IL_0006: ldloca.s V_0
IL_0008: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,Zen.Lib.UIColor>::TryGetValue(!0,!1&)
IL_000d: brtrue.s IL_0015
IL_000f: ldsfld Zen.Lib.UIColor ZenUI.Section.TooltipSummary::ColorDefaultIcon
IL_0014: ret
IL_0015: ldloc.0
IL_0016: ret

// System.Void ZenUI.Section.TooltipSummary/Icon::.cctor()
.locals 
IL_0000: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,Zen.Lib.UIColor>::.ctor()
IL_0005: dup
IL_0006: ldstr "💖"
IL_000b: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::LightRed
IL_0010: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,Zen.Lib.UIColor>::Add(!0,!1)
IL_0015: dup
IL_0016: ldstr "💪"
IL_001b: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::LightYellow
IL_0020: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,Zen.Lib.UIColor>::Add(!0,!1)
IL_0025: dup
IL_0026: ldstr "✨"
IL_002b: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::LightPurple
IL_0030: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,Zen.Lib.UIColor>::Add(!0,!1)
IL_0035: dup
IL_0036: ldstr "🔥"
IL_003b: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::LightRed
IL_0040: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,Zen.Lib.UIColor>::Add(!0,!1)
IL_0045: dup
IL_0046: ldstr "❄"
IL_004b: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::FrostBlue
IL_0050: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,Zen.Lib.UIColor>::Add(!0,!1)
IL_0055: dup
IL_0056: ldstr "💀︎"
IL_005b: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::ForestGreen
IL_0060: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,Zen.Lib.UIColor>::Add(!0,!1)
IL_0065: dup
IL_0066: ldstr "⚡"
IL_006b: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::Yellow
IL_0070: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,Zen.Lib.UIColor>::Add(!0,!1)
IL_0075: dup
IL_0076: ldstr "🌀"
IL_007b: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::Gray
IL_0080: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,Zen.Lib.UIColor>::Add(!0,!1)
IL_0085: dup
IL_0086: ldstr "🩸"
IL_008b: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::BrightRed
IL_0090: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,Zen.Lib.UIColor>::Add(!0,!1)
IL_0095: dup
IL_0096: ldstr "💗"
IL_009b: ldsfld Zen.Lib.UIColor Zen.Lib.UIColor::LightYellow
IL_00a0: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,Zen.Lib.UIColor>::Add(!0,!1)
IL_00a5: stsfld System.Collections.Generic.Dictionary`2<System.String,Zen.Lib.UIColor> ZenUI.Section.TooltipSummary/Icon::ColorMap
IL_00aa: ret

// System.Void ZenUI.Section.TooltipSummary/<>c::.cctor()
.locals 
IL_0000: newobj System.Void ZenUI.Section.TooltipSummary/<>c::.ctor()
IL_0005: stsfld ZenUI.Section.TooltipSummary/<>c ZenUI.Section.TooltipSummary/<>c::<>9
IL_000a: ret

// System.Void ZenUI.Section.TooltipSummary/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean ZenUI.Section.TooltipSummary/<>c::<GetTooltipSummary>b__11_20(System.String)
.locals 
IL_0000: ldarg.1
IL_0001: call System.Boolean BepInEx.Utility::IsNullOrWhiteSpace(System.String)
IL_0006: ldc.i4.0
IL_0007: ceq
IL_0009: ret

// System.Boolean ZenUI.Section.TooltipSummary/<>c::<GetTooltipSummary>b__11_21(StatusEffect)
.locals 
IL_0000: ldarg.1
IL_0001: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0006: ldc.i4.0
IL_0007: ceq
IL_0009: ret

// System.Void ZenUI.Compatibility.ActivateOnCopy::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void UnityEngine.MonoBehaviour::.ctor()
IL_0006: ldarg.0
IL_0007: ldsfld System.Boolean ZenUI.Compatibility.ActivateOnCopy::_isRegistering
IL_000c: stfld System.Boolean ZenUI.Compatibility.ActivateOnCopy::_isSource
IL_0011: ldarg.0
IL_0012: ldfld System.Boolean ZenUI.Compatibility.ActivateOnCopy::_isSource
IL_0017: brfalse.s IL_0025
IL_0019: ldsfld System.Collections.Generic.List`1<ZenUI.Compatibility.ActivateOnCopy> ZenUI.Compatibility.ActivateOnCopy::SourceTrackers
IL_001e: ldarg.0
IL_001f: callvirt System.Void System.Collections.Generic.List`1<ZenUI.Compatibility.ActivateOnCopy>::Add(!0)
IL_0024: ret
IL_0025: ldsfld System.Collections.Generic.List`1<ZenUI.Compatibility.ActivateOnCopy> ZenUI.Compatibility.ActivateOnCopy::ActiveTrackers
IL_002a: ldarg.0
IL_002b: callvirt System.Void System.Collections.Generic.List`1<ZenUI.Compatibility.ActivateOnCopy>::Add(!0)
IL_0030: ret

// System.Void ZenUI.Compatibility.ActivateOnCopy::Register(UnityEngine.MonoBehaviour)
.locals Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean
IL_0000: ldstr "Add ActivateOnCopy"
IL_0005: ldc.i4.0
IL_0006: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(System.String,System.Int32)
IL_000b: ldc.i4.s 21
IL_000d: ldc.i4.1
IL_000e: ldloca.s V_1
IL_0010: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_0015: stloc.0
IL_0016: ldloc.1
IL_0017: brfalse.s IL_0032
IL_0019: ldloca.s V_0
IL_001b: ldstr "Adding to component: "
IL_0020: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0025: ldloca.s V_0
IL_0027: ldarg.0
IL_0028: callvirt System.String UnityEngine.Object::get_name()
IL_002d: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_0032: ldloc.0
IL_0033: ldc.i4.0
IL_0034: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_0039: ldc.i4.1
IL_003a: stsfld System.Boolean ZenUI.Compatibility.ActivateOnCopy::_isRegistering
IL_003f: ldarg.0
IL_0040: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0045: callvirt !!0 UnityEngine.GameObject::AddComponent<ZenUI.Compatibility.ActivateOnCopy>()
IL_004a: ldarg.0
IL_004b: stfld UnityEngine.MonoBehaviour ZenUI.Compatibility.ActivateOnCopy::refComponent
IL_0050: ldc.i4.0
IL_0051: stsfld System.Boolean ZenUI.Compatibility.ActivateOnCopy::_isRegistering
IL_0056: ret

// System.Void ZenUI.Compatibility.ActivateOnCopy::Shutdown()
.locals System.Collections.Generic.IEnumerator`1<ZenUI.Compatibility.ActivateOnCopy>
IL_0000: ldsfld System.Collections.Generic.List`1<ZenUI.Compatibility.ActivateOnCopy> ZenUI.Compatibility.ActivateOnCopy::ActiveTrackers
IL_0005: ldsfld System.Collections.Generic.List`1<ZenUI.Compatibility.ActivateOnCopy> ZenUI.Compatibility.ActivateOnCopy::SourceTrackers
IL_000a: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Union<ZenUI.Compatibility.ActivateOnCopy>(System.Collections.Generic.IEnumerable`1<!!0>,System.Collections.Generic.IEnumerable`1<!!0>)
IL_000f: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<ZenUI.Compatibility.ActivateOnCopy>::GetEnumerator()
IL_0014: stloc.0
IL_0015: br.s IL_0022
IL_0017: ldloc.0
IL_0018: callvirt !0 System.Collections.Generic.IEnumerator`1<ZenUI.Compatibility.ActivateOnCopy>::get_Current()
IL_001d: call System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_0022: ldloc.0
IL_0023: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0028: brtrue.s IL_0017
IL_002a: leave.s IL_0036
IL_002c: ldloc.0
IL_002d: brfalse.s IL_0035
IL_002f: ldloc.0
IL_0030: callvirt System.Void System.IDisposable::Dispose()
IL_0035: endfinally
IL_0036: ldsfld System.Collections.Generic.List`1<ZenUI.Compatibility.ActivateOnCopy> ZenUI.Compatibility.ActivateOnCopy::ActiveTrackers
IL_003b: callvirt System.Void System.Collections.Generic.List`1<ZenUI.Compatibility.ActivateOnCopy>::Clear()
IL_0040: ldsfld System.Collections.Generic.List`1<ZenUI.Compatibility.ActivateOnCopy> ZenUI.Compatibility.ActivateOnCopy::SourceTrackers
IL_0045: callvirt System.Void System.Collections.Generic.List`1<ZenUI.Compatibility.ActivateOnCopy>::Clear()
IL_004a: ret
// EH Finally: 21 - 44 => 44 - 54

// System.Void ZenUI.Compatibility.ActivateOnCopy::Awake()
.locals Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean ZenUI.Compatibility.ActivateOnCopy::_isSource
IL_0006: brfalse.s IL_0009
IL_0008: ret
IL_0009: ldc.i4.s 10
IL_000b: ldc.i4.1
IL_000c: ldloca.s V_1
IL_000e: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_0013: stloc.0
IL_0014: ldloc.1
IL_0015: brfalse.s IL_0030
IL_0017: ldloca.s V_0
IL_0019: ldstr "Awakening "
IL_001e: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_0023: ldloca.s V_0
IL_0025: ldarg.0
IL_0026: call System.String UnityEngine.Object::get_name()
IL_002b: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_0030: ldloc.0
IL_0031: ldc.i4.0
IL_0032: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_0037: ldarg.0
IL_0038: ldfld UnityEngine.MonoBehaviour ZenUI.Compatibility.ActivateOnCopy::refComponent
IL_003d: ldc.i4.1
IL_003e: callvirt System.Void UnityEngine.Behaviour::set_enabled(System.Boolean)
IL_0043: ldarg.0
IL_0044: call System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_0049: ret

// System.Void ZenUI.Compatibility.ActivateOnCopy::OnDestroy()
.locals Zen.Logging`1/InterpolatedString<ZenUI.Plugin>, System.Boolean
IL_0000: ldc.i4.s 14
IL_0002: ldc.i4.1
IL_0003: ldloca.s V_1
IL_0005: newobj System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::.ctor(System.Int32,System.Int32,System.Boolean&)
IL_000a: stloc.0
IL_000b: ldloc.1
IL_000c: brfalse.s IL_0027
IL_000e: ldloca.s V_0
IL_0010: ldstr "Removing from "
IL_0015: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendLiteral(System.String)
IL_001a: ldloca.s V_0
IL_001c: ldarg.0
IL_001d: call System.String UnityEngine.Object::get_name()
IL_0022: call System.Void Zen.Logging`1/InterpolatedString<ZenUI.Plugin>::AppendFormatted(System.String)
IL_0027: ldloc.0
IL_0028: ldc.i4.0
IL_0029: call System.Void Zen.Logging`1<ZenUI.Plugin>::Info(Zen.Logging`1/InterpolatedString<!0>,System.Int32)
IL_002e: ldarg.0
IL_002f: ldfld System.Boolean ZenUI.Compatibility.ActivateOnCopy::_isSource
IL_0034: brfalse.s IL_0043
IL_0036: ldsfld System.Collections.Generic.List`1<ZenUI.Compatibility.ActivateOnCopy> ZenUI.Compatibility.ActivateOnCopy::SourceTrackers
IL_003b: ldarg.0
IL_003c: callvirt System.Boolean System.Collections.Generic.List`1<ZenUI.Compatibility.ActivateOnCopy>::Remove(!0)
IL_0041: pop
IL_0042: ret
IL_0043: ldsfld System.Collections.Generic.List`1<ZenUI.Compatibility.ActivateOnCopy> ZenUI.Compatibility.ActivateOnCopy::ActiveTrackers
IL_0048: ldarg.0
IL_0049: callvirt System.Boolean System.Collections.Generic.List`1<ZenUI.Compatibility.ActivateOnCopy>::Remove(!0)
IL_004e: pop
IL_004f: ret

// System.Void ZenUI.Compatibility.ActivateOnCopy::Game_Update()
.locals System.Collections.Generic.List`1/Enumerator<ZenUI.Compatibility.ActivateOnCopy>
IL_0000: ldsfld System.Collections.Generic.List`1<ZenUI.Compatibility.ActivateOnCopy> ZenUI.Compatibility.ActivateOnCopy::ActiveTrackers
IL_0005: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<ZenUI.Compatibility.ActivateOnCopy>::GetEnumerator()
IL_000a: stloc.0
IL_000b: br.s IL_001f
IL_000d: ldloca.s V_0
IL_000f: call !0 System.Collections.Generic.List`1/Enumerator<ZenUI.Compatibility.ActivateOnCopy>::get_Current()
IL_0014: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0019: ldc.i4.1
IL_001a: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_001f: ldloca.s V_0
IL_0021: call System.Boolean System.Collections.Generic.List`1/Enumerator<ZenUI.Compatibility.ActivateOnCopy>::MoveNext()
IL_0026: brtrue.s IL_000d
IL_0028: leave.s IL_0038
IL_002a: ldloca.s V_0
IL_002c: constrained. System.Collections.Generic.List`1/Enumerator<ZenUI.Compatibility.ActivateOnCopy>
IL_0032: callvirt System.Void System.IDisposable::Dispose()
IL_0037: endfinally
IL_0038: ret
// EH Finally: 11 - 42 => 42 - 56

// System.Void ZenUI.Compatibility.ActivateOnCopy::.cctor()
.locals 
IL_0000: newobj System.Void System.Collections.Generic.List`1<ZenUI.Compatibility.ActivateOnCopy>::.ctor()
IL_0005: stsfld System.Collections.Generic.List`1<ZenUI.Compatibility.ActivateOnCopy> ZenUI.Compatibility.ActivateOnCopy::SourceTrackers
IL_000a: newobj System.Void System.Collections.Generic.List`1<ZenUI.Compatibility.ActivateOnCopy>::.ctor()
IL_000f: stsfld System.Collections.Generic.List`1<ZenUI.Compatibility.ActivateOnCopy> ZenUI.Compatibility.ActivateOnCopy::ActiveTrackers
IL_0014: ret

// System.Void ZenUI.Compatibility.OtherModUI::Show(UnityEngine.Transform,System.Boolean)
.locals System.Collections.IEnumerator, UnityEngine.Transform, System.IDisposable
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> ZenUI.Compatibility.OtherModUI::OtherModNodes
IL_0005: callvirt System.Collections.Generic.Dictionary`2/ValueCollection<!0,!1> System.Collections.Generic.Dictionary`2<System.String,System.String>::get_Values()
IL_000a: ldsfld System.Func`2<System.String,System.Boolean> ZenUI.Compatibility.OtherModUI/<>c::<>9__1_0
IL_000f: dup
IL_0010: brtrue.s IL_0029
IL_0012: pop
IL_0013: ldsfld ZenUI.Compatibility.OtherModUI/<>c ZenUI.Compatibility.OtherModUI/<>c::<>9
IL_0018: ldftn System.Boolean ZenUI.Compatibility.OtherModUI/<>c::<Show>b__1_0(System.String)
IL_001e: newobj System.Void System.Func`2<System.String,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0023: dup
IL_0024: stsfld System.Func`2<System.String,System.Boolean> ZenUI.Compatibility.OtherModUI/<>c::<>9__1_0
IL_0029: call System.Boolean System.Linq.Enumerable::Any<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_002e: brtrue.s IL_0031
IL_0030: ret
IL_0031: ldarg.0
IL_0032: callvirt System.Collections.IEnumerator UnityEngine.Transform::GetEnumerator()
IL_0037: stloc.0
IL_0038: br.s IL_0064
IL_003a: ldloc.0
IL_003b: callvirt System.Object System.Collections.IEnumerator::get_Current()
IL_0040: castclass UnityEngine.Transform
IL_0045: stloc.1
IL_0046: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> ZenUI.Compatibility.OtherModUI::OtherModNodes
IL_004b: ldloc.1
IL_004c: callvirt System.String UnityEngine.Object::get_name()
IL_0051: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::ContainsKey(!0)
IL_0056: brfalse.s IL_0064
IL_0058: ldloc.1
IL_0059: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_005e: ldarg.1
IL_005f: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0064: ldloc.0
IL_0065: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_006a: brtrue.s IL_003a
IL_006c: leave.s IL_007f
IL_006e: ldloc.0
IL_006f: isinst System.IDisposable
IL_0074: stloc.2
IL_0075: ldloc.2
IL_0076: brfalse.s IL_007e
IL_0078: ldloc.2
IL_0079: callvirt System.Void System.IDisposable::Dispose()
IL_007e: endfinally
IL_007f: ret
// EH Finally: 56 - 110 => 110 - 127

// System.Void ZenUI.Compatibility.OtherModUI::.cctor()
.locals 
IL_0000: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::.ctor()
IL_0005: dup
IL_0006: ldstr "RecipeExpansionScrollView"
IL_000b: ldstr "Azumatt.ItemCompare"
IL_0010: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::set_Item(!0,!1)
IL_0015: stsfld System.Collections.Generic.Dictionary`2<System.String,System.String> ZenUI.Compatibility.OtherModUI::OtherModNodes
IL_001a: ret

// System.Void ZenUI.Compatibility.OtherModUI/<>c::.cctor()
.locals 
IL_0000: newobj System.Void ZenUI.Compatibility.OtherModUI/<>c::.ctor()
IL_0005: stsfld ZenUI.Compatibility.OtherModUI/<>c ZenUI.Compatibility.OtherModUI/<>c::<>9
IL_000a: ret

// System.Void ZenUI.Compatibility.OtherModUI/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean ZenUI.Compatibility.OtherModUI/<>c::<Show>b__1_0(System.String)
.locals 
IL_0000: call System.Collections.Generic.Dictionary`2<System.String,BepInEx.PluginInfo> BepInEx.Bootstrap.Chainloader::get_PluginInfos()
IL_0005: ldarg.1
IL_0006: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,BepInEx.PluginInfo>::ContainsKey(!0)
IL_000b: ret

// System.Void <>z__ReadOnlyArray`1::.ctor(T[])
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ldarg.0
IL_0007: ldarg.1
IL_0008: stfld T[] <>z__ReadOnlyArray`1<T>::_items
IL_000d: ret

// System.Collections.IEnumerator <>z__ReadOnlyArray`1::System.Collections.IEnumerable.GetEnumerator()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld T[] <>z__ReadOnlyArray`1<T>::_items
IL_0006: callvirt System.Collections.IEnumerator System.Collections.IEnumerable::GetEnumerator()
IL_000b: ret

// System.Int32 <>z__ReadOnlyArray`1::System.Collections.ICollection.get_Count()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld T[] <>z__ReadOnlyArray`1<T>::_items
IL_0006: ldlen
IL_0007: conv.i4
IL_0008: ret

// System.Boolean <>z__ReadOnlyArray`1::System.Collections.ICollection.get_IsSynchronized()
.locals 
IL_0000: ldc.i4.0
IL_0001: ret

// System.Object <>z__ReadOnlyArray`1::System.Collections.ICollection.get_SyncRoot()
.locals 
IL_0000: ldarg.0
IL_0001: ret

// System.Void <>z__ReadOnlyArray`1::System.Collections.ICollection.CopyTo(System.Array,System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld T[] <>z__ReadOnlyArray`1<T>::_items
IL_0006: ldarg.1
IL_0007: ldarg.2
IL_0008: callvirt System.Void System.Collections.ICollection::CopyTo(System.Array,System.Int32)
IL_000d: ret

// System.Object <>z__ReadOnlyArray`1::System.Collections.IList.get_Item(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld T[] <>z__ReadOnlyArray`1<T>::_items
IL_0006: ldarg.1
IL_0007: ldelem.any T
IL_000c: box T
IL_0011: ret

// System.Void <>z__ReadOnlyArray`1::System.Collections.IList.set_Item(System.Int32,System.Object)
.locals 
IL_0000: newobj System.Void System.NotSupportedException::.ctor()
IL_0005: throw

// System.Boolean <>z__ReadOnlyArray`1::System.Collections.IList.get_IsFixedSize()
.locals 
IL_0000: ldc.i4.1
IL_0001: ret

// System.Boolean <>z__ReadOnlyArray`1::System.Collections.IList.get_IsReadOnly()
.locals 
IL_0000: ldc.i4.1
IL_0001: ret

// System.Int32 <>z__ReadOnlyArray`1::System.Collections.IList.Add(System.Object)
.locals 
IL_0000: newobj System.Void System.NotSupportedException::.ctor()
IL_0005: throw

// System.Void <>z__ReadOnlyArray`1::System.Collections.IList.Clear()
.locals 
IL_0000: newobj System.Void System.NotSupportedException::.ctor()
IL_0005: throw

// System.Boolean <>z__ReadOnlyArray`1::System.Collections.IList.Contains(System.Object)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld T[] <>z__ReadOnlyArray`1<T>::_items
IL_0006: ldarg.1
IL_0007: callvirt System.Boolean System.Collections.IList::Contains(System.Object)
IL_000c: ret

// System.Int32 <>z__ReadOnlyArray`1::System.Collections.IList.IndexOf(System.Object)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld T[] <>z__ReadOnlyArray`1<T>::_items
IL_0006: ldarg.1
IL_0007: callvirt System.Int32 System.Collections.IList::IndexOf(System.Object)
IL_000c: ret

// System.Void <>z__ReadOnlyArray`1::System.Collections.IList.Insert(System.Int32,System.Object)
.locals 
IL_0000: newobj System.Void System.NotSupportedException::.ctor()
IL_0005: throw

// System.Void <>z__ReadOnlyArray`1::System.Collections.IList.Remove(System.Object)
.locals 
IL_0000: newobj System.Void System.NotSupportedException::.ctor()
IL_0005: throw

// System.Void <>z__ReadOnlyArray`1::System.Collections.IList.RemoveAt(System.Int32)
.locals 
IL_0000: newobj System.Void System.NotSupportedException::.ctor()
IL_0005: throw

// System.Collections.Generic.IEnumerator`1<T> <>z__ReadOnlyArray`1::System.Collections.Generic.IEnumerable<T>.GetEnumerator()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld T[] <>z__ReadOnlyArray`1<T>::_items
IL_0006: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<T>::GetEnumerator()
IL_000b: ret

// System.Int32 <>z__ReadOnlyArray`1::System.Collections.Generic.IReadOnlyCollection<T>.get_Count()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld T[] <>z__ReadOnlyArray`1<T>::_items
IL_0006: ldlen
IL_0007: conv.i4
IL_0008: ret

// T <>z__ReadOnlyArray`1::System.Collections.Generic.IReadOnlyList<T>.get_Item(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld T[] <>z__ReadOnlyArray`1<T>::_items
IL_0006: ldarg.1
IL_0007: ldelem.any T
IL_000c: ret

// System.Int32 <>z__ReadOnlyArray`1::System.Collections.Generic.ICollection<T>.get_Count()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld T[] <>z__ReadOnlyArray`1<T>::_items
IL_0006: ldlen
IL_0007: conv.i4
IL_0008: ret

// System.Boolean <>z__ReadOnlyArray`1::System.Collections.Generic.ICollection<T>.get_IsReadOnly()
.locals 
IL_0000: ldc.i4.1
IL_0001: ret

// System.Void <>z__ReadOnlyArray`1::System.Collections.Generic.ICollection<T>.Add(T)
.locals 
IL_0000: newobj System.Void System.NotSupportedException::.ctor()
IL_0005: throw

// System.Void <>z__ReadOnlyArray`1::System.Collections.Generic.ICollection<T>.Clear()
.locals 
IL_0000: newobj System.Void System.NotSupportedException::.ctor()
IL_0005: throw

// System.Boolean <>z__ReadOnlyArray`1::System.Collections.Generic.ICollection<T>.Contains(T)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld T[] <>z__ReadOnlyArray`1<T>::_items
IL_0006: ldarg.1
IL_0007: callvirt System.Boolean System.Collections.Generic.ICollection`1<T>::Contains(!0)
IL_000c: ret

// System.Void <>z__ReadOnlyArray`1::System.Collections.Generic.ICollection<T>.CopyTo(T[],System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld T[] <>z__ReadOnlyArray`1<T>::_items
IL_0006: ldarg.1
IL_0007: ldarg.2
IL_0008: callvirt System.Void System.Collections.Generic.ICollection`1<T>::CopyTo(!0[],System.Int32)
IL_000d: ret

// System.Boolean <>z__ReadOnlyArray`1::System.Collections.Generic.ICollection<T>.Remove(T)
.locals 
IL_0000: newobj System.Void System.NotSupportedException::.ctor()
IL_0005: throw

// T <>z__ReadOnlyArray`1::System.Collections.Generic.IList<T>.get_Item(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld T[] <>z__ReadOnlyArray`1<T>::_items
IL_0006: ldarg.1
IL_0007: ldelem.any T
IL_000c: ret

// System.Void <>z__ReadOnlyArray`1::System.Collections.Generic.IList<T>.set_Item(System.Int32,T)
.locals 
IL_0000: newobj System.Void System.NotSupportedException::.ctor()
IL_0005: throw

// System.Int32 <>z__ReadOnlyArray`1::System.Collections.Generic.IList<T>.IndexOf(T)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld T[] <>z__ReadOnlyArray`1<T>::_items
IL_0006: ldarg.1
IL_0007: callvirt System.Int32 System.Collections.Generic.IList`1<T>::IndexOf(!0)
IL_000c: ret

// System.Void <>z__ReadOnlyArray`1::System.Collections.Generic.IList<T>.Insert(System.Int32,T)
.locals 
IL_0000: newobj System.Void System.NotSupportedException::.ctor()
IL_0005: throw

// System.Void <>z__ReadOnlyArray`1::System.Collections.Generic.IList<T>.RemoveAt(System.Int32)
.locals 
IL_0000: newobj System.Void System.NotSupportedException::.ctor()
IL_0005: throw
