
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

// BepInEx.Logging.ManualLogSource GlowingSigns.Plugin::get_Log()
.locals 
IL_0000: ldsfld BepInEx.Logging.ManualLogSource GlowingSigns.Plugin::<Log>k__BackingField
IL_0005: ret

// System.Void GlowingSigns.Plugin::set_Log(BepInEx.Logging.ManualLogSource)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld BepInEx.Logging.ManualLogSource GlowingSigns.Plugin::<Log>k__BackingField
IL_0006: ret

// System.Void GlowingSigns.Plugin::Awake()
.locals 
IL_0000: ldarg.0
IL_0001: call BepInEx.Logging.ManualLogSource BepInEx.BaseUnityPlugin::get_Logger()
IL_0006: call System.Void GlowingSigns.Plugin::set_Log(BepInEx.Logging.ManualLogSource)
IL_000b: ldarg.0
IL_000c: ldstr "com.robert.glowingsigns"
IL_0011: newobj System.Void HarmonyLib.Harmony::.ctor(System.String)
IL_0016: stfld HarmonyLib.Harmony GlowingSigns.Plugin::_harmony
IL_001b: ldarg.0
IL_001c: ldfld HarmonyLib.Harmony GlowingSigns.Plugin::_harmony
IL_0021: call System.Reflection.Assembly System.Reflection.Assembly::GetExecutingAssembly()
IL_0026: callvirt System.Void HarmonyLib.Harmony::PatchAll(System.Reflection.Assembly)
IL_002b: ldarg.0
IL_002c: call BepInEx.Logging.ManualLogSource BepInEx.BaseUnityPlugin::get_Logger()
IL_0031: ldstr "Glowing Signs 1.0.0 loaded. Restoring legacy color-matched sign glow."
IL_0036: callvirt System.Void BepInEx.Logging.ManualLogSource::LogInfo(System.Object)
IL_003b: ret

// System.Void GlowingSigns.Plugin::OnDestroy()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld HarmonyLib.Harmony GlowingSigns.Plugin::_harmony
IL_0006: dup
IL_0007: brtrue.s IL_000c
IL_0009: pop
IL_000a: br.s IL_0011
IL_000c: call System.Void HarmonyLib.Harmony::UnpatchSelf()
IL_0011: call System.Void GlowingSigns.LegacySignGlow::DisposeMaterials()
IL_0016: ret

// System.Void GlowingSigns.Plugin::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void BepInEx.BaseUnityPlugin::.ctor()
IL_0006: ret

// System.Void GlowingSigns.LegacySignGlow::Apply(Sign)
.locals TMPro.TextMeshProUGUI, UnityEngine.Shader, UnityEngine.Material, UnityEngine.Material, System.Exception
IL_0000: ldarg.0
IL_0001: ldfld TMPro.TextMeshProUGUI Sign::m_textWidget
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: ldnull
IL_0009: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_000e: brfalse.s IL_0015
IL_0010: leave IL_00b7
IL_0015: call UnityEngine.Shader GlowingSigns.LegacySignGlow::FindLegacyShader()
IL_001a: stloc.1
IL_001b: ldloc.1
IL_001c: ldnull
IL_001d: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0022: brfalse.s IL_0029
IL_0024: leave IL_00b7
IL_0029: ldloc.0
IL_002a: callvirt TMPro.TMP_FontAsset TMPro.TMP_Text::get_font()
IL_002f: dup
IL_0030: brtrue.s IL_0036
IL_0032: pop
IL_0033: ldnull
IL_0034: br.s IL_003b
IL_0036: call UnityEngine.Material TMPro.TMP_Asset::get_material()
IL_003b: stloc.2
IL_003c: ldloc.2
IL_003d: ldnull
IL_003e: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0043: brfalse.s IL_0047
IL_0045: leave.s IL_00b7
IL_0047: ldloc.2
IL_0048: ldloc.1
IL_0049: call UnityEngine.Material GlowingSigns.LegacySignGlow::GetOrCreateLegacyMaterial(UnityEngine.Material,UnityEngine.Shader)
IL_004e: stloc.3
IL_004f: ldloc.0
IL_0050: callvirt UnityEngine.Material TMPro.TMP_Text::get_fontSharedMaterial()
IL_0055: ldloc.3
IL_0056: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_005b: brfalse.s IL_005f
IL_005d: leave.s IL_00b7
IL_005f: ldloc.0
IL_0060: ldloc.3
IL_0061: callvirt System.Void TMPro.TMP_Text::set_fontSharedMaterial(UnityEngine.Material)
IL_0066: ldloc.0
IL_0067: callvirt System.Void TMPro.TMP_Text::UpdateMeshPadding()
IL_006c: ldloc.0
IL_006d: callvirt System.Void UnityEngine.UI.Graphic::SetMaterialDirty()
IL_0072: ldsfld System.Boolean GlowingSigns.LegacySignGlow::_loggedSuccess
IL_0077: brtrue.s IL_008e
IL_0079: ldc.i4.1
IL_007a: stsfld System.Boolean GlowingSigns.LegacySignGlow::_loggedSuccess
IL_007f: call BepInEx.Logging.ManualLogSource GlowingSigns.Plugin::get_Log()
IL_0084: ldstr "Legacy sign glow is active; glow colors follow the displayed text colors."
IL_0089: callvirt System.Void BepInEx.Logging.ManualLogSource::LogInfo(System.Object)
IL_008e: leave.s IL_00b7
IL_0090: stloc.s V_4
IL_0092: ldsfld System.Boolean GlowingSigns.LegacySignGlow::_loggedFailure
IL_0097: brtrue.s IL_00b5
IL_0099: ldc.i4.1
IL_009a: stsfld System.Boolean GlowingSigns.LegacySignGlow::_loggedFailure
IL_009f: call BepInEx.Logging.ManualLogSource GlowingSigns.Plugin::get_Log()
IL_00a4: ldstr "Could not restore sign glow: {0}"
IL_00a9: ldloc.s V_4
IL_00ab: call System.String System.String::Format(System.String,System.Object)
IL_00b0: callvirt System.Void BepInEx.Logging.ManualLogSource::LogError(System.Object)
IL_00b5: leave.s IL_00b7
IL_00b7: ret
// EH Catch: 0 - 144 => 144 - 183

// System.Void GlowingSigns.LegacySignGlow::DisposeMaterials()
.locals System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<System.Int32,UnityEngine.Material>, UnityEngine.Material
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,UnityEngine.Material> GlowingSigns.LegacySignGlow::MaterialsByFontMaterial
IL_0005: callvirt System.Collections.Generic.Dictionary`2/ValueCollection<!0,!1> System.Collections.Generic.Dictionary`2<System.Int32,UnityEngine.Material>::get_Values()
IL_000a: callvirt System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2/ValueCollection<System.Int32,UnityEngine.Material>::GetEnumerator()
IL_000f: stloc.0
IL_0010: br.s IL_0029
IL_0012: ldloca.s V_0
IL_0014: call !1 System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<System.Int32,UnityEngine.Material>::get_Current()
IL_0019: stloc.1
IL_001a: ldloc.1
IL_001b: ldnull
IL_001c: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0021: brfalse.s IL_0029
IL_0023: ldloc.1
IL_0024: call System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_0029: ldloca.s V_0
IL_002b: call System.Boolean System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<System.Int32,UnityEngine.Material>::MoveNext()
IL_0030: brtrue.s IL_0012
IL_0032: leave.s IL_0042
IL_0034: ldloca.s V_0
IL_0036: constrained. System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<System.Int32,UnityEngine.Material>
IL_003c: callvirt System.Void System.IDisposable::Dispose()
IL_0041: endfinally
IL_0042: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,UnityEngine.Material> GlowingSigns.LegacySignGlow::MaterialsByFontMaterial
IL_0047: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Int32,UnityEngine.Material>::Clear()
IL_004c: ldnull
IL_004d: stsfld UnityEngine.Shader GlowingSigns.LegacySignGlow::_legacyShader
IL_0052: ret
// EH Finally: 16 - 52 => 52 - 66

// UnityEngine.Material GlowingSigns.LegacySignGlow::GetOrCreateLegacyMaterial(UnityEngine.Material,UnityEngine.Shader)
.locals System.Int32, UnityEngine.Material
IL_0000: ldarg.0
IL_0001: callvirt System.Int32 UnityEngine.Object::GetInstanceID()
IL_0006: stloc.0
IL_0007: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,UnityEngine.Material> GlowingSigns.LegacySignGlow::MaterialsByFontMaterial
IL_000c: ldloc.0
IL_000d: ldloca.s V_1
IL_000f: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,UnityEngine.Material>::TryGetValue(!0,!1&)
IL_0014: brfalse.s IL_0021
IL_0016: ldloc.1
IL_0017: ldnull
IL_0018: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_001d: brfalse.s IL_0021
IL_001f: ldloc.1
IL_0020: ret
IL_0021: ldarg.0
IL_0022: newobj System.Void UnityEngine.Material::.ctor(UnityEngine.Material)
IL_0027: dup
IL_0028: ldarg.0
IL_0029: callvirt System.String UnityEngine.Object::get_name()
IL_002e: ldstr " (Glowing Signs)"
IL_0033: call System.String System.String::Concat(System.String,System.String)
IL_0038: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_003d: dup
IL_003e: ldc.i4.s 61
IL_0040: callvirt System.Void UnityEngine.Object::set_hideFlags(UnityEngine.HideFlags)
IL_0045: dup
IL_0046: ldarg.1
IL_0047: callvirt System.Void UnityEngine.Material::set_shader(UnityEngine.Shader)
IL_004c: stloc.1
IL_004d: ldloc.1
IL_004e: ldsfld System.Int32 GlowingSigns.LegacySignGlow::FaceColorId
IL_0053: callvirt System.Boolean UnityEngine.Material::HasProperty(System.Int32)
IL_0058: brfalse.s IL_006a
IL_005a: ldloc.1
IL_005b: ldsfld System.Int32 GlowingSigns.LegacySignGlow::FaceColorId
IL_0060: call UnityEngine.Color UnityEngine.Color::get_white()
IL_0065: callvirt System.Void UnityEngine.Material::SetColor(System.Int32,UnityEngine.Color)
IL_006a: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,UnityEngine.Material> GlowingSigns.LegacySignGlow::MaterialsByFontMaterial
IL_006f: ldloc.0
IL_0070: ldloc.1
IL_0071: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Int32,UnityEngine.Material>::set_Item(!0,!1)
IL_0076: ldloc.1
IL_0077: ret

// UnityEngine.Shader GlowingSigns.LegacySignGlow::FindLegacyShader()
.locals 
IL_0000: ldsfld UnityEngine.Shader GlowingSigns.LegacySignGlow::_legacyShader
IL_0005: ldnull
IL_0006: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_000b: brfalse.s IL_0013
IL_000d: ldsfld UnityEngine.Shader GlowingSigns.LegacySignGlow::_legacyShader
IL_0012: ret
IL_0013: ldstr "TextMeshPro/Distance Field"
IL_0018: call UnityEngine.Shader UnityEngine.Shader::Find(System.String)
IL_001d: stsfld UnityEngine.Shader GlowingSigns.LegacySignGlow::_legacyShader
IL_0022: ldsfld UnityEngine.Shader GlowingSigns.LegacySignGlow::_legacyShader
IL_0027: ldnull
IL_0028: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_002d: brfalse.s IL_004b
IL_002f: ldsfld System.Boolean GlowingSigns.LegacySignGlow::_loggedMissingShader
IL_0034: brtrue.s IL_004b
IL_0036: ldc.i4.1
IL_0037: stsfld System.Boolean GlowingSigns.LegacySignGlow::_loggedMissingShader
IL_003c: call BepInEx.Logging.ManualLogSource GlowingSigns.Plugin::get_Log()
IL_0041: ldstr "Required shader 'TextMeshPro/Distance Field' was not found. Sign glow cannot be restored."
IL_0046: callvirt System.Void BepInEx.Logging.ManualLogSource::LogError(System.Object)
IL_004b: ldsfld UnityEngine.Shader GlowingSigns.LegacySignGlow::_legacyShader
IL_0050: ret

// System.Void GlowingSigns.LegacySignGlow::.cctor()
.locals 
IL_0000: ldstr "_FaceColor"
IL_0005: call System.Int32 UnityEngine.Shader::PropertyToID(System.String)
IL_000a: stsfld System.Int32 GlowingSigns.LegacySignGlow::FaceColorId
IL_000f: newobj System.Void System.Collections.Generic.Dictionary`2<System.Int32,UnityEngine.Material>::.ctor()
IL_0014: stsfld System.Collections.Generic.Dictionary`2<System.Int32,UnityEngine.Material> GlowingSigns.LegacySignGlow::MaterialsByFontMaterial
IL_0019: ret

// System.Void GlowingSigns.SignPatches::AwakePostfix(Sign)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void GlowingSigns.LegacySignGlow::Apply(Sign)
IL_0006: ret

// System.Void GlowingSigns.SignPatches::PermissionCompletedPostfix(Sign)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void GlowingSigns.LegacySignGlow::Apply(Sign)
IL_0006: ret
