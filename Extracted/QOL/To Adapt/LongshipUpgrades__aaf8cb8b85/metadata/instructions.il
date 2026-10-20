
// System.Void Microsoft.CodeAnalysis.EmbeddedAttribute::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: nop
IL_0007: ret

// System.Void System.Runtime.CompilerServices.NullableAttribute::.ctor(System.Byte)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: nop
IL_0007: ldarg.0
IL_0008: ldc.i4.1
IL_0009: newarr System.Byte
IL_000e: dup
IL_000f: ldc.i4.0
IL_0010: ldarg.1
IL_0011: stelem.i1
IL_0012: stfld System.Byte[] System.Runtime.CompilerServices.NullableAttribute::NullableFlags
IL_0017: ret

// System.Void System.Runtime.CompilerServices.NullableAttribute::.ctor(System.Byte[])
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: nop
IL_0007: ldarg.0
IL_0008: ldarg.1
IL_0009: stfld System.Byte[] System.Runtime.CompilerServices.NullableAttribute::NullableFlags
IL_000e: ret

// System.Void System.Runtime.CompilerServices.NullableContextAttribute::.ctor(System.Byte)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: nop
IL_0007: ldarg.0
IL_0008: ldarg.1
IL_0009: stfld System.Byte System.Runtime.CompilerServices.NullableContextAttribute::Flag
IL_000e: ret

// BepInEx.BaseUnityPlugin LocalizationManager.Localizer::get_Plugin()
.locals System.Boolean, System.Collections.Generic.IEnumerable`1<System.Reflection.TypeInfo>, System.Reflection.ReflectionTypeLoadException, BepInEx.BaseUnityPlugin
IL_0000: nop
IL_0001: ldsfld BepInEx.BaseUnityPlugin LocalizationManager.Localizer::_plugin
IL_0006: ldnull
IL_0007: ceq
IL_0009: stloc.0
IL_000a: ldloc.0
IL_000b: brfalse IL_00b3
IL_0010: nop
IL_0011: nop
IL_0012: call System.Reflection.Assembly System.Reflection.Assembly::GetExecutingAssembly()
IL_0017: callvirt System.Collections.Generic.IEnumerable`1<System.Reflection.TypeInfo> System.Reflection.Assembly::get_DefinedTypes()
IL_001c: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.Reflection.TypeInfo>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0021: stloc.1
IL_0022: nop
IL_0023: leave.s IL_0079
IL_0025: stloc.2
IL_0026: nop
IL_0027: ldloc.2
IL_0028: callvirt System.Type[] System.Reflection.ReflectionTypeLoadException::get_Types()
IL_002d: ldsfld System.Func`2<System.Type,System.Boolean> LocalizationManager.Localizer/<>c::<>9__7_1
IL_0032: dup
IL_0033: brtrue.s IL_004c
IL_0035: pop
IL_0036: ldsfld LocalizationManager.Localizer/<>c LocalizationManager.Localizer/<>c::<>9
IL_003b: ldftn System.Boolean LocalizationManager.Localizer/<>c::<get_Plugin>b__7_1(System.Type)
IL_0041: newobj System.Void System.Func`2<System.Type,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0046: dup
IL_0047: stsfld System.Func`2<System.Type,System.Boolean> LocalizationManager.Localizer/<>c::<>9__7_1
IL_004c: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<System.Type>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0051: ldsfld System.Func`2<System.Type,System.Reflection.TypeInfo> LocalizationManager.Localizer/<>c::<>9__7_2
IL_0056: dup
IL_0057: brtrue.s IL_0070
IL_0059: pop
IL_005a: ldsfld LocalizationManager.Localizer/<>c LocalizationManager.Localizer/<>c::<>9
IL_005f: ldftn System.Reflection.TypeInfo LocalizationManager.Localizer/<>c::<get_Plugin>b__7_2(System.Type)
IL_0065: newobj System.Void System.Func`2<System.Type,System.Reflection.TypeInfo>::.ctor(System.Object,System.IntPtr)
IL_006a: dup
IL_006b: stsfld System.Func`2<System.Type,System.Reflection.TypeInfo> LocalizationManager.Localizer/<>c::<>9__7_2
IL_0070: call System.Collections.Generic.IEnumerable`1<!!1> System.Linq.Enumerable::Select<System.Type,System.Reflection.TypeInfo>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_0075: stloc.1
IL_0076: nop
IL_0077: leave.s IL_0079
IL_0079: call UnityEngine.GameObject BepInEx.Bootstrap.Chainloader::get_ManagerObject()
IL_007e: ldloc.1
IL_007f: ldsfld System.Func`2<System.Reflection.TypeInfo,System.Boolean> LocalizationManager.Localizer/<>c::<>9__7_0
IL_0084: dup
IL_0085: brtrue.s IL_009e
IL_0087: pop
IL_0088: ldsfld LocalizationManager.Localizer/<>c LocalizationManager.Localizer/<>c::<>9
IL_008d: ldftn System.Boolean LocalizationManager.Localizer/<>c::<get_Plugin>b__7_0(System.Reflection.TypeInfo)
IL_0093: newobj System.Void System.Func`2<System.Reflection.TypeInfo,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0098: dup
IL_0099: stsfld System.Func`2<System.Reflection.TypeInfo,System.Boolean> LocalizationManager.Localizer/<>c::<>9__7_0
IL_009e: call !!0 System.Linq.Enumerable::First<System.Reflection.TypeInfo>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_00a3: callvirt UnityEngine.Component UnityEngine.GameObject::GetComponent(System.Type)
IL_00a8: castclass BepInEx.BaseUnityPlugin
IL_00ad: stsfld BepInEx.BaseUnityPlugin LocalizationManager.Localizer::_plugin
IL_00b2: nop
IL_00b3: ldsfld BepInEx.BaseUnityPlugin LocalizationManager.Localizer::_plugin
IL_00b8: stloc.3
IL_00b9: br.s IL_00bb
IL_00bb: ldloc.3
IL_00bc: ret
// EH Catch: 17 - 37 => 37 - 121

// System.Void LocalizationManager.Localizer::UpdatePlaceholderText(Localization,System.String)
.locals System.String, System.String, System.Collections.Generic.Dictionary`2<System.String,System.Func`1<System.String>>, System.Boolean
IL_0000: nop
IL_0001: ldsfld System.Runtime.CompilerServices.ConditionalWeakTable`2<Localization,System.String> LocalizationManager.Localizer::localizationLanguage
IL_0006: ldarg.0
IL_0007: ldloca.s V_0
IL_0009: callvirt System.Boolean System.Runtime.CompilerServices.ConditionalWeakTable`2<Localization,System.String>::TryGetValue(!0,!1&)
IL_000e: pop
IL_000f: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.Dictionary`2<System.String,System.String>> LocalizationManager.Localizer::loadedTexts
IL_0014: ldloc.0
IL_0015: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.Dictionary`2<System.String,System.String>>::get_Item(!0)
IL_001a: ldarg.1
IL_001b: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,System.String>::get_Item(!0)
IL_0020: stloc.1
IL_0021: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.Dictionary`2<System.String,System.Func`1<System.String>>> LocalizationManager.Localizer::PlaceholderProcessors
IL_0026: ldarg.1
IL_0027: ldloca.s V_2
IL_0029: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.Dictionary`2<System.String,System.Func`1<System.String>>>::TryGetValue(!0,!1&)
IL_002e: stloc.3
IL_002f: ldloc.3
IL_0030: brfalse.s IL_0059
IL_0032: ldloc.2
IL_0033: ldloc.1
IL_0034: ldsfld System.Func`3<System.String,System.Collections.Generic.KeyValuePair`2<System.String,System.Func`1<System.String>>,System.String> LocalizationManager.Localizer/<>c::<>9__9_0
IL_0039: dup
IL_003a: brtrue.s IL_0053
IL_003c: pop
IL_003d: ldsfld LocalizationManager.Localizer/<>c LocalizationManager.Localizer/<>c::<>9
IL_0042: ldftn System.String LocalizationManager.Localizer/<>c::<UpdatePlaceholderText>b__9_0(System.String,System.Collections.Generic.KeyValuePair`2<System.String,System.Func`1<System.String>>)
IL_0048: newobj System.Void System.Func`3<System.String,System.Collections.Generic.KeyValuePair`2<System.String,System.Func`1<System.String>>,System.String>::.ctor(System.Object,System.IntPtr)
IL_004d: dup
IL_004e: stsfld System.Func`3<System.String,System.Collections.Generic.KeyValuePair`2<System.String,System.Func`1<System.String>>,System.String> LocalizationManager.Localizer/<>c::<>9__9_0
IL_0053: call !!1 System.Linq.Enumerable::Aggregate<System.Collections.Generic.KeyValuePair`2<System.String,System.Func`1<System.String>>,System.String>(System.Collections.Generic.IEnumerable`1<!!0>,!!1,System.Func`3<!!1,!!0,!!1>)
IL_0058: stloc.1
IL_0059: ldarg.0
IL_005a: ldarg.1
IL_005b: ldloc.1
IL_005c: callvirt System.Void Localization::AddWord(System.String,System.String)
IL_0061: nop
IL_0062: ret

// System.Void LocalizationManager.Localizer::AddPlaceholder(System.String,System.String,BepInEx.Configuration.ConfigEntry`1<T>,System.Func`2<T,System.String>)
.locals LocalizationManager.Localizer/<>c__DisplayClass10_0`1<T>, System.Boolean, System.Boolean
IL_0000: newobj System.Void LocalizationManager.Localizer/<>c__DisplayClass10_0`1<T>::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldarg.0
IL_0008: stfld System.String LocalizationManager.Localizer/<>c__DisplayClass10_0`1<T>::key
IL_000d: ldloc.0
IL_000e: ldarg.1
IL_000f: stfld System.String LocalizationManager.Localizer/<>c__DisplayClass10_0`1<T>::placeholder
IL_0014: ldloc.0
IL_0015: ldarg.3
IL_0016: stfld System.Func`2<T,System.String> LocalizationManager.Localizer/<>c__DisplayClass10_0`1<T>::convertConfigValue
IL_001b: ldloc.0
IL_001c: ldarg.2
IL_001d: stfld BepInEx.Configuration.ConfigEntry`1<T> LocalizationManager.Localizer/<>c__DisplayClass10_0`1<T>::config
IL_0022: nop
IL_0023: ldloc.0
IL_0024: ldfld System.Func`2<T,System.String> LocalizationManager.Localizer/<>c__DisplayClass10_0`1<T>::convertConfigValue
IL_0029: brtrue.s IL_0050
IL_002b: ldloc.0
IL_002c: ldsfld System.Func`2<T,System.String> LocalizationManager.Localizer/<>c__10`1<T>::<>9__10_0
IL_0031: dup
IL_0032: brtrue.s IL_004b
IL_0034: pop
IL_0035: ldsfld LocalizationManager.Localizer/<>c__10`1<T> LocalizationManager.Localizer/<>c__10`1<T>::<>9
IL_003a: ldftn System.String LocalizationManager.Localizer/<>c__10`1<T>::<AddPlaceholder>b__10_0(T)
IL_0040: newobj System.Void System.Func`2<T,System.String>::.ctor(System.Object,System.IntPtr)
IL_0045: dup
IL_0046: stsfld System.Func`2<T,System.String> LocalizationManager.Localizer/<>c__10`1<T>::<>9__10_0
IL_004b: stfld System.Func`2<T,System.String> LocalizationManager.Localizer/<>c__DisplayClass10_0`1<T>::convertConfigValue
IL_0050: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.Dictionary`2<System.String,System.Func`1<System.String>>> LocalizationManager.Localizer::PlaceholderProcessors
IL_0055: ldloc.0
IL_0056: ldfld System.String LocalizationManager.Localizer/<>c__DisplayClass10_0`1<T>::key
IL_005b: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.Dictionary`2<System.String,System.Func`1<System.String>>>::ContainsKey(!0)
IL_0060: ldc.i4.0
IL_0061: ceq
IL_0063: stloc.1
IL_0064: ldloc.1
IL_0065: brfalse.s IL_007d
IL_0067: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.Dictionary`2<System.String,System.Func`1<System.String>>> LocalizationManager.Localizer::PlaceholderProcessors
IL_006c: ldloc.0
IL_006d: ldfld System.String LocalizationManager.Localizer/<>c__DisplayClass10_0`1<T>::key
IL_0072: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.Func`1<System.String>>::.ctor()
IL_0077: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.Dictionary`2<System.String,System.Func`1<System.String>>>::set_Item(!0,!1)
IL_007c: nop
IL_007d: ldloc.0
IL_007e: ldfld BepInEx.Configuration.ConfigEntry`1<T> LocalizationManager.Localizer/<>c__DisplayClass10_0`1<T>::config
IL_0083: ldloc.0
IL_0084: ldftn System.Void LocalizationManager.Localizer/<>c__DisplayClass10_0`1<T>::<AddPlaceholder>b__1(System.Object,System.EventArgs)
IL_008a: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_008f: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<T>::add_SettingChanged(System.EventHandler)
IL_0094: nop
IL_0095: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.Dictionary`2<System.String,System.String>> LocalizationManager.Localizer::loadedTexts
IL_009a: call Localization Localization::get_instance()
IL_009f: callvirt System.String Localization::GetSelectedLanguage()
IL_00a4: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.Dictionary`2<System.String,System.String>>::ContainsKey(!0)
IL_00a9: stloc.2
IL_00aa: ldloc.2
IL_00ab: brfalse.s IL_00b4
IL_00ad: ldloc.0
IL_00ae: callvirt System.Void LocalizationManager.Localizer/<>c__DisplayClass10_0`1<T>::<AddPlaceholder>g__UpdatePlaceholder|2()
IL_00b3: nop
IL_00b4: nop
IL_00b5: ret

// System.Void LocalizationManager.Localizer::AddText(System.String,System.String)
.locals System.Collections.Generic.List`1<System.WeakReference`1<Localization>>, System.Collections.Generic.List`1/Enumerator<System.WeakReference`1<Localization>>, System.WeakReference`1<Localization>, Localization, System.Boolean, System.Collections.Generic.Dictionary`2<System.String,System.String>, System.Boolean, System.Collections.Generic.List`1/Enumerator<System.WeakReference`1<Localization>>, System.WeakReference`1<Localization>
IL_0000: nop
IL_0001: newobj System.Void System.Collections.Generic.List`1<System.WeakReference`1<Localization>>::.ctor()
IL_0006: stloc.0
IL_0007: nop
IL_0008: ldsfld System.Collections.Generic.List`1<System.WeakReference`1<Localization>> LocalizationManager.Localizer::localizationObjects
IL_000d: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.WeakReference`1<Localization>>::GetEnumerator()
IL_0012: stloc.1
IL_0013: br.s IL_0078
IL_0015: ldloca.s V_1
IL_0017: call !0 System.Collections.Generic.List`1/Enumerator<System.WeakReference`1<Localization>>::get_Current()
IL_001c: stloc.2
IL_001d: ldloc.2
IL_001e: ldloca.s V_3
IL_0020: callvirt System.Boolean System.WeakReference`1<Localization>::TryGetTarget(!0&)
IL_0025: stloc.s V_4
IL_0027: ldloc.s V_4
IL_0029: brfalse.s IL_0070
IL_002b: nop
IL_002c: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.Dictionary`2<System.String,System.String>> LocalizationManager.Localizer::loadedTexts
IL_0031: ldsfld System.Runtime.CompilerServices.ConditionalWeakTable`2<Localization,System.String> LocalizationManager.Localizer::localizationLanguage
IL_0036: ldloc.3
IL_0037: callvirt !1 System.Runtime.CompilerServices.ConditionalWeakTable`2<Localization,System.String>::GetOrCreateValue(!0)
IL_003c: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.Dictionary`2<System.String,System.String>>::get_Item(!0)
IL_0041: stloc.s V_5
IL_0043: ldloc.3
IL_0044: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> Localization::m_translations
IL_0049: ldarg.0
IL_004a: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::ContainsKey(!0)
IL_004f: ldc.i4.0
IL_0050: ceq
IL_0052: stloc.s V_6
IL_0054: ldloc.s V_6
IL_0056: brfalse.s IL_006d
IL_0058: nop
IL_0059: ldloc.s V_5
IL_005b: ldarg.0
IL_005c: ldarg.1
IL_005d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::set_Item(!0,!1)
IL_0062: nop
IL_0063: ldloc.3
IL_0064: ldarg.0
IL_0065: ldarg.1
IL_0066: callvirt System.Void Localization::AddWord(System.String,System.String)
IL_006b: nop
IL_006c: nop
IL_006d: nop
IL_006e: br.s IL_0078
IL_0070: ldloc.0
IL_0071: ldloc.2
IL_0072: callvirt System.Void System.Collections.Generic.List`1<System.WeakReference`1<Localization>>::Add(!0)
IL_0077: nop
IL_0078: ldloca.s V_1
IL_007a: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.WeakReference`1<Localization>>::MoveNext()
IL_007f: brtrue.s IL_0015
IL_0081: leave.s IL_0092
IL_0083: ldloca.s V_1
IL_0085: constrained. System.Collections.Generic.List`1/Enumerator<System.WeakReference`1<Localization>>
IL_008b: callvirt System.Void System.IDisposable::Dispose()
IL_0090: nop
IL_0091: endfinally
IL_0092: nop
IL_0093: ldloc.0
IL_0094: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.WeakReference`1<Localization>>::GetEnumerator()
IL_0099: stloc.s V_7
IL_009b: br.s IL_00b3
IL_009d: ldloca.s V_7
IL_009f: call !0 System.Collections.Generic.List`1/Enumerator<System.WeakReference`1<Localization>>::get_Current()
IL_00a4: stloc.s V_8
IL_00a6: ldsfld System.Collections.Generic.List`1<System.WeakReference`1<Localization>> LocalizationManager.Localizer::localizationObjects
IL_00ab: ldloc.s V_8
IL_00ad: callvirt System.Boolean System.Collections.Generic.List`1<System.WeakReference`1<Localization>>::Remove(!0)
IL_00b2: pop
IL_00b3: ldloca.s V_7
IL_00b5: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.WeakReference`1<Localization>>::MoveNext()
IL_00ba: brtrue.s IL_009d
IL_00bc: leave.s IL_00cd
IL_00be: ldloca.s V_7
IL_00c0: constrained. System.Collections.Generic.List`1/Enumerator<System.WeakReference`1<Localization>>
IL_00c6: callvirt System.Void System.IDisposable::Dispose()
IL_00cb: nop
IL_00cc: endfinally
IL_00cd: ret
// EH Finally: 19 - 131 => 131 - 146
// EH Finally: 155 - 190 => 190 - 205

// System.Void LocalizationManager.Localizer::Initialize()
.locals HarmonyLib.Harmony, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldsfld System.Boolean LocalizationManager.Localizer::initialized
IL_0006: stloc.1
IL_0007: ldloc.1
IL_0008: brfalse.s IL_000c
IL_000a: br.s IL_0073
IL_000c: ldc.i4.1
IL_000d: stsfld System.Boolean LocalizationManager.Localizer::initialized
IL_0012: call UnityEngine.Rendering.GraphicsDeviceType UnityEngine.SystemInfo::get_graphicsDeviceType()
IL_0017: ldc.i4.4
IL_0018: ceq
IL_001a: stloc.2
IL_001b: ldloc.2
IL_001c: brfalse.s IL_0020
IL_001e: br.s IL_0073
IL_0020: call System.Void LocalizationManager.Localizer::EnsureYamlDotNetAvailable()
IL_0025: nop
IL_0026: ldstr "org.bepinex.helpers.LocalizationManager"
IL_002b: newobj System.Void HarmonyLib.Harmony::.ctor(System.String)
IL_0030: stloc.0
IL_0031: ldloc.0
IL_0032: ldtoken Localization
IL_0037: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_003c: ldstr "SetupLanguage"
IL_0041: ldnull
IL_0042: ldnull
IL_0043: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_0048: ldnull
IL_0049: ldtoken LocalizationManager.Localizer
IL_004e: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0053: ldstr "LoadLocalization"
IL_0058: ldnull
IL_0059: ldnull
IL_005a: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_005f: newobj System.Void HarmonyLib.HarmonyMethod::.ctor(System.Reflection.MethodInfo)
IL_0064: ldnull
IL_0065: ldnull
IL_0066: ldnull
IL_0067: callvirt System.Reflection.MethodInfo HarmonyLib.Harmony::Patch(System.Reflection.MethodBase,HarmonyLib.HarmonyMethod,HarmonyLib.HarmonyMethod,HarmonyLib.HarmonyMethod,HarmonyLib.HarmonyMethod,HarmonyLib.HarmonyMethod)
IL_006c: pop
IL_006d: ldc.i4.1
IL_006e: stsfld System.Boolean LocalizationManager.Localizer::localizationEnabled
IL_0073: ret

// System.Void LocalizationManager.Localizer::ApplyCurrentLocalization()
.locals System.String, System.Boolean, System.Boolean, System.String, System.Boolean
IL_0000: nop
IL_0001: ldsfld System.Boolean LocalizationManager.Localizer::localizationEnabled
IL_0006: brfalse.s IL_0012
IL_0008: ldsfld Localization Localization::m_instance
IL_000d: ldnull
IL_000e: ceq
IL_0010: br.s IL_0013
IL_0012: ldc.i4.1
IL_0013: stloc.1
IL_0014: ldloc.1
IL_0015: brfalse.s IL_0019
IL_0017: br.s IL_006b
IL_0019: ldstr "English"
IL_001e: stloc.0
IL_001f: call Splatform.IDistributionPlatform Splatform.PlatformManager::get_DistributionPlatform()
IL_0024: brfalse.s IL_002d
IL_0026: call System.Boolean PlatformInitializer::get_PreferencesInitialized()
IL_002b: br.s IL_002e
IL_002d: ldc.i4.0
IL_002e: stloc.2
IL_002f: ldloc.2
IL_0030: brfalse.s IL_005f
IL_0032: nop
IL_0033: ldsfld Localization Localization::m_instance
IL_0038: callvirt System.String Localization::GetSelectedLanguage()
IL_003d: stloc.3
IL_003e: ldloc.3
IL_003f: call System.Boolean System.String::IsNullOrEmpty(System.String)
IL_0044: stloc.s V_4
IL_0046: ldloc.s V_4
IL_0048: brfalse.s IL_005c
IL_004a: ldstr "language"
IL_004f: ldstr "English"
IL_0054: call System.Void PlatformPrefs::SetString(System.String,System.String)
IL_0059: nop
IL_005a: br.s IL_005e
IL_005c: ldloc.3
IL_005d: stloc.0
IL_005e: nop
IL_005f: ldsfld Localization Localization::m_instance
IL_0064: ldloc.0
IL_0065: call System.Void LocalizationManager.Localizer::LoadLocalization(Localization,System.String)
IL_006a: nop
IL_006b: ret

// System.Void LocalizationManager.Localizer::EnsureYamlDotNetAvailable()
.locals System.Boolean, System.Exception
IL_0000: nop
IL_0001: nop
IL_0002: ldstr "YamlDotNet.Serialization.DeserializerBuilder, YamlDotNet"
IL_0007: ldc.i4.0
IL_0008: call System.Type System.Type::GetType(System.String,System.Boolean)
IL_000d: ldnull
IL_000e: call System.Boolean System.Type::op_Inequality(System.Type,System.Type)
IL_0013: stloc.0
IL_0014: ldloc.0
IL_0015: brfalse.s IL_0019
IL_0017: leave.s IL_0035
IL_0019: nop
IL_001a: leave.s IL_002a
IL_001c: stloc.1
IL_001d: nop
IL_001e: ldstr "YamlDotNet is required for localization but could not be loaded. Install ValheimModding-YamlDotNet."
IL_0023: ldloc.1
IL_0024: newobj System.Void System.IO.FileNotFoundException::.ctor(System.String,System.Exception)
IL_0029: throw
IL_002a: ldstr "YamlDotNet is required for localization but could not be loaded. Install ValheimModding-YamlDotNet."
IL_002f: newobj System.Void System.IO.FileNotFoundException::.ctor(System.String)
IL_0034: throw
IL_0035: ret
// EH Catch: 1 - 28 => 28 - 42

// System.Void LocalizationManager.Localizer::LoadLocalization(Localization,System.String)
.locals LocalizationManager.Localizer/<>c__DisplayClass17_0, System.Byte[], System.Collections.Generic.Dictionary`2<System.String,System.String>, System.String, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Byte[], System.Boolean, System.Boolean, System.Boolean, System.Collections.Generic.Dictionary`2<System.String,System.String>, System.Exception, System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>, System.Collections.Generic.KeyValuePair`2<System.String,System.String>, System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>, System.Collections.Generic.KeyValuePair`2<System.String,System.String>
IL_0000: nop
IL_0001: ldsfld System.Runtime.CompilerServices.ConditionalWeakTable`2<Localization,System.String> LocalizationManager.Localizer::localizationLanguage
IL_0006: ldarg.0
IL_0007: callvirt System.Boolean System.Runtime.CompilerServices.ConditionalWeakTable`2<Localization,System.String>::Remove(!0)
IL_000c: ldc.i4.0
IL_000d: ceq
IL_000f: stloc.s V_4
IL_0011: ldloc.s V_4
IL_0013: brfalse.s IL_0026
IL_0015: ldsfld System.Collections.Generic.List`1<System.WeakReference`1<Localization>> LocalizationManager.Localizer::localizationObjects
IL_001a: ldarg.0
IL_001b: newobj System.Void System.WeakReference`1<Localization>::.ctor(!0)
IL_0020: callvirt System.Void System.Collections.Generic.List`1<System.WeakReference`1<Localization>>::Add(!0)
IL_0025: nop
IL_0026: ldsfld System.Runtime.CompilerServices.ConditionalWeakTable`2<Localization,System.String> LocalizationManager.Localizer::localizationLanguage
IL_002b: ldarg.0
IL_002c: ldarg.1
IL_002d: callvirt System.Void System.Runtime.CompilerServices.ConditionalWeakTable`2<Localization,System.String>::Add(!0,!1)
IL_0032: nop
IL_0033: ldloca.s V_0
IL_0035: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::.ctor()
IL_003a: stfld System.Collections.Generic.Dictionary`2<System.String,System.String> LocalizationManager.Localizer/<>c__DisplayClass17_0::localizationFiles
IL_003f: ldloca.s V_0
IL_0041: ldc.i4.2
IL_0042: newarr System.String
IL_0047: dup
IL_0048: ldc.i4.0
IL_0049: call BepInEx.BaseUnityPlugin LocalizationManager.Localizer::get_Plugin()
IL_004e: callvirt BepInEx.PluginInfo BepInEx.BaseUnityPlugin::get_Info()
IL_0053: callvirt BepInEx.BepInPlugin BepInEx.PluginInfo::get_Metadata()
IL_0058: callvirt System.String BepInEx.BepInPlugin::get_Name()
IL_005d: ldstr "."
IL_0062: call System.String System.String::Concat(System.String,System.String)
IL_0067: stelem.ref
IL_0068: dup
IL_0069: ldc.i4.1
IL_006a: call BepInEx.BaseUnityPlugin LocalizationManager.Localizer::get_Plugin()
IL_006f: callvirt BepInEx.PluginInfo BepInEx.BaseUnityPlugin::get_Info()
IL_0074: callvirt BepInEx.BepInPlugin BepInEx.PluginInfo::get_Metadata()
IL_0079: callvirt System.String BepInEx.BepInPlugin::get_Name()
IL_007e: ldstr " "
IL_0083: ldstr ""
IL_0088: callvirt System.String System.String::Replace(System.String,System.String)
IL_008d: ldstr "."
IL_0092: call System.String System.String::Concat(System.String,System.String)
IL_0097: stelem.ref
IL_0098: stfld System.String[] LocalizationManager.Localizer/<>c__DisplayClass17_0::prefixes
IL_009d: nop
IL_009e: call System.String BepInEx.Paths::get_ConfigPath()
IL_00a3: ldc.i4.1
IL_00a4: ldloca.s V_0
IL_00a6: call System.Void LocalizationManager.Localizer::<LoadLocalization>g__Scan|17_0(System.String,System.Boolean,LocalizationManager.Localizer/<>c__DisplayClass17_0&)
IL_00ab: nop
IL_00ac: call System.String BepInEx.Paths::get_PluginPath()
IL_00b1: ldc.i4.0
IL_00b2: ldloca.s V_0
IL_00b4: call System.Void LocalizationManager.Localizer::<LoadLocalization>g__Scan|17_0(System.String,System.Boolean,LocalizationManager.Localizer/<>c__DisplayClass17_0&)
IL_00b9: nop
IL_00ba: ldstr "English"
IL_00bf: call System.Byte[] LocalizationManager.Localizer::LoadTranslationFromAssembly(System.String)
IL_00c4: stloc.1
IL_00c5: ldloc.1
IL_00c6: ldnull
IL_00c7: cgt.un
IL_00c9: ldc.i4.0
IL_00ca: ceq
IL_00cc: stloc.s V_5
IL_00ce: ldloc.s V_5
IL_00d0: brfalse.s IL_00fb
IL_00d2: ldstr "Found no English localizations in mod "
IL_00d7: call BepInEx.BaseUnityPlugin LocalizationManager.Localizer::get_Plugin()
IL_00dc: callvirt BepInEx.PluginInfo BepInEx.BaseUnityPlugin::get_Info()
IL_00e1: callvirt BepInEx.BepInPlugin BepInEx.PluginInfo::get_Metadata()
IL_00e6: callvirt System.String BepInEx.BepInPlugin::get_Name()
IL_00eb: ldstr ". Expected an embedded resource Translations/English.json or Translations/English.yml."
IL_00f0: call System.String System.String::Concat(System.String,System.String,System.String)
IL_00f5: newobj System.Void System.Exception::.ctor(System.String)
IL_00fa: throw
IL_00fb: newobj System.Void YamlDotNet.Serialization.DeserializerBuilder::.ctor()
IL_0100: call !0 YamlDotNet.Serialization.BuilderSkeleton`1<YamlDotNet.Serialization.DeserializerBuilder>::IgnoreFields()
IL_0105: callvirt YamlDotNet.Serialization.IDeserializer YamlDotNet.Serialization.DeserializerBuilder::Build()
IL_010a: call System.Text.Encoding System.Text.Encoding::get_UTF8()
IL_010f: ldloc.1
IL_0110: callvirt System.String System.Text.Encoding::GetString(System.Byte[])
IL_0115: callvirt !!0 YamlDotNet.Serialization.IDeserializer::Deserialize<System.Collections.Generic.Dictionary`2<System.String,System.String>>(System.String)
IL_011a: stloc.2
IL_011b: ldloc.2
IL_011c: ldnull
IL_011d: ceq
IL_011f: stloc.s V_6
IL_0121: ldloc.s V_6
IL_0123: brfalse.s IL_014e
IL_0125: ldstr "Localization for mod "
IL_012a: call BepInEx.BaseUnityPlugin LocalizationManager.Localizer::get_Plugin()
IL_012f: callvirt BepInEx.PluginInfo BepInEx.BaseUnityPlugin::get_Info()
IL_0134: callvirt BepInEx.BepInPlugin BepInEx.PluginInfo::get_Metadata()
IL_0139: callvirt System.String BepInEx.BepInPlugin::get_Name()
IL_013e: ldstr " failed: Localization file was empty."
IL_0143: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0148: newobj System.Void System.Exception::.ctor(System.String)
IL_014d: throw
IL_014e: ldnull
IL_014f: stloc.3
IL_0150: ldarg.1
IL_0151: ldstr "English"
IL_0156: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_015b: stloc.s V_7
IL_015d: ldloc.s V_7
IL_015f: brfalse.s IL_01a7
IL_0161: ldloc.0
IL_0162: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> LocalizationManager.Localizer/<>c__DisplayClass17_0::localizationFiles
IL_0167: ldarg.1
IL_0168: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::ContainsKey(!0)
IL_016d: stloc.s V_8
IL_016f: ldloc.s V_8
IL_0171: brfalse.s IL_0187
IL_0173: ldloc.0
IL_0174: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> LocalizationManager.Localizer/<>c__DisplayClass17_0::localizationFiles
IL_0179: ldarg.1
IL_017a: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,System.String>::get_Item(!0)
IL_017f: call System.String System.IO.File::ReadAllText(System.String)
IL_0184: stloc.3
IL_0185: br.s IL_01a7
IL_0187: ldarg.1
IL_0188: call System.Byte[] LocalizationManager.Localizer::LoadTranslationFromAssembly(System.String)
IL_018d: stloc.s V_9
IL_018f: ldloc.s V_9
IL_0191: ldnull
IL_0192: cgt.un
IL_0194: stloc.s V_10
IL_0196: ldloc.s V_10
IL_0198: brfalse.s IL_01a7
IL_019a: call System.Text.Encoding System.Text.Encoding::get_UTF8()
IL_019f: ldloc.s V_9
IL_01a1: callvirt System.String System.Text.Encoding::GetString(System.Byte[])
IL_01a6: stloc.3
IL_01a7: ldloc.3
IL_01a8: brtrue.s IL_01bc
IL_01aa: ldloc.0
IL_01ab: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> LocalizationManager.Localizer/<>c__DisplayClass17_0::localizationFiles
IL_01b0: ldstr "English"
IL_01b5: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::ContainsKey(!0)
IL_01ba: br.s IL_01bd
IL_01bc: ldc.i4.0
IL_01bd: stloc.s V_11
IL_01bf: ldloc.s V_11
IL_01c1: brfalse.s IL_01d9
IL_01c3: ldloc.0
IL_01c4: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> LocalizationManager.Localizer/<>c__DisplayClass17_0::localizationFiles
IL_01c9: ldstr "English"
IL_01ce: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,System.String>::get_Item(!0)
IL_01d3: call System.String System.IO.File::ReadAllText(System.String)
IL_01d8: stloc.3
IL_01d9: ldloc.3
IL_01da: ldnull
IL_01db: cgt.un
IL_01dd: stloc.s V_12
IL_01df: ldloc.s V_12
IL_01e1: brfalse IL_0270
IL_01e6: nop
IL_01e7: nop
IL_01e8: newobj System.Void YamlDotNet.Serialization.DeserializerBuilder::.ctor()
IL_01ed: call !0 YamlDotNet.Serialization.BuilderSkeleton`1<YamlDotNet.Serialization.DeserializerBuilder>::IgnoreFields()
IL_01f2: callvirt YamlDotNet.Serialization.IDeserializer YamlDotNet.Serialization.DeserializerBuilder::Build()
IL_01f7: ldloc.3
IL_01f8: callvirt !!0 YamlDotNet.Serialization.IDeserializer::Deserialize<System.Collections.Generic.Dictionary`2<System.String,System.String>>(System.String)
IL_01fd: dup
IL_01fe: brtrue.s IL_0206
IL_0200: pop
IL_0201: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::.ctor()
IL_0206: stloc.s V_13
IL_0208: nop
IL_0209: leave.s IL_022b
IL_020b: stloc.s V_14
IL_020d: nop
IL_020e: ldstr "Failed to deserialize localization for language '{0}'. Using base localization only.
{1}"
IL_0213: ldarg.1
IL_0214: ldloc.s V_14
IL_0216: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_021b: call System.Void LongshipUpgrades.LongshipUpgrades::LogInfo(System.Object)
IL_0220: nop
IL_0221: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::.ctor()
IL_0226: stloc.s V_13
IL_0228: nop
IL_0229: leave.s IL_022b
IL_022b: nop
IL_022c: ldloc.s V_13
IL_022e: callvirt System.Collections.Generic.Dictionary`2/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2<System.String,System.String>::GetEnumerator()
IL_0233: stloc.s V_15
IL_0235: br.s IL_0255
IL_0237: ldloca.s V_15
IL_0239: call System.Collections.Generic.KeyValuePair`2<!0,!1> System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>::get_Current()
IL_023e: stloc.s V_16
IL_0240: ldloc.2
IL_0241: ldloca.s V_16
IL_0243: call !0 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Key()
IL_0248: ldloca.s V_16
IL_024a: call !1 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Value()
IL_024f: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::set_Item(!0,!1)
IL_0254: nop
IL_0255: ldloca.s V_15
IL_0257: call System.Boolean System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>::MoveNext()
IL_025c: brtrue.s IL_0237
IL_025e: leave.s IL_026f
IL_0260: ldloca.s V_15
IL_0262: constrained. System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>
IL_0268: callvirt System.Void System.IDisposable::Dispose()
IL_026d: nop
IL_026e: endfinally
IL_026f: nop
IL_0270: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.Dictionary`2<System.String,System.String>> LocalizationManager.Localizer::loadedTexts
IL_0275: ldarg.1
IL_0276: ldloc.2
IL_0277: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.Dictionary`2<System.String,System.String>>::set_Item(!0,!1)
IL_027c: nop
IL_027d: nop
IL_027e: ldloc.2
IL_027f: callvirt System.Collections.Generic.Dictionary`2/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2<System.String,System.String>::GetEnumerator()
IL_0284: stloc.s V_17
IL_0286: br.s IL_029f
IL_0288: ldloca.s V_17
IL_028a: call System.Collections.Generic.KeyValuePair`2<!0,!1> System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>::get_Current()
IL_028f: stloc.s V_18
IL_0291: ldarg.0
IL_0292: ldloca.s V_18
IL_0294: call !0 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Key()
IL_0299: call System.Void LocalizationManager.Localizer::UpdatePlaceholderText(Localization,System.String)
IL_029e: nop
IL_029f: ldloca.s V_17
IL_02a1: call System.Boolean System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>::MoveNext()
IL_02a6: brtrue.s IL_0288
IL_02a8: leave.s IL_02b9
IL_02aa: ldloca.s V_17
IL_02ac: constrained. System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>
IL_02b2: callvirt System.Void System.IDisposable::Dispose()
IL_02b7: nop
IL_02b8: endfinally
IL_02b9: ret
// EH Catch: 487 - 523 => 523 - 555
// EH Finally: 565 - 608 => 608 - 623
// EH Finally: 646 - 682 => 682 - 697

// System.Byte[] LocalizationManager.Localizer::LoadTranslationFromAssembly(System.String)
.locals System.Collections.Generic.List`1/Enumerator<System.String>, System.String, System.Byte[], System.Boolean, System.Byte[]
IL_0000: nop
IL_0001: nop
IL_0002: ldsfld System.Collections.Generic.List`1<System.String> LocalizationManager.Localizer::fileExtensions
IL_0007: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_000c: stloc.0
IL_000d: br.s IL_0037
IL_000f: ldloca.s V_0
IL_0011: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_0016: stloc.1
IL_0017: ldstr "translations."
IL_001c: ldarg.0
IL_001d: ldloc.1
IL_001e: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0023: ldnull
IL_0024: call System.Byte[] LocalizationManager.Localizer::ReadEmbeddedFileBytes(System.String,System.Reflection.Assembly)
IL_0029: stloc.2
IL_002a: ldloc.2
IL_002b: ldnull
IL_002c: cgt.un
IL_002e: stloc.3
IL_002f: ldloc.3
IL_0030: brfalse.s IL_0037
IL_0032: ldloc.2
IL_0033: stloc.s V_4
IL_0035: leave.s IL_0056
IL_0037: ldloca.s V_0
IL_0039: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_003e: brtrue.s IL_000f
IL_0040: leave.s IL_0051
IL_0042: ldloca.s V_0
IL_0044: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_004a: callvirt System.Void System.IDisposable::Dispose()
IL_004f: nop
IL_0050: endfinally
IL_0051: ldnull
IL_0052: stloc.s V_4
IL_0054: br.s IL_0056
IL_0056: ldloc.s V_4
IL_0058: ret
// EH Finally: 13 - 66 => 66 - 81

// System.Byte[] LocalizationManager.Localizer::ReadEmbeddedFileBytes(System.String,System.Reflection.Assembly)
.locals LocalizationManager.Localizer/<>c__DisplayClass19_0, System.IO.MemoryStream, System.String, System.Boolean, System.Byte[]
IL_0000: newobj System.Void LocalizationManager.Localizer/<>c__DisplayClass19_0::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldarg.0
IL_0008: stfld System.String LocalizationManager.Localizer/<>c__DisplayClass19_0::resourceFileName
IL_000d: nop
IL_000e: newobj System.Void System.IO.MemoryStream::.ctor()
IL_0013: stloc.1
IL_0014: ldarg.1
IL_0015: brtrue.s IL_001e
IL_0017: call System.Reflection.Assembly System.Reflection.Assembly::GetCallingAssembly()
IL_001c: starg.s containingAssembly
IL_001e: ldarg.1
IL_001f: callvirt System.String[] System.Reflection.Assembly::GetManifestResourceNames()
IL_0024: ldloc.0
IL_0025: ldftn System.Boolean LocalizationManager.Localizer/<>c__DisplayClass19_0::<ReadEmbeddedFileBytes>b__0(System.String)
IL_002b: newobj System.Void System.Func`2<System.String,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0030: call !!0 System.Linq.Enumerable::FirstOrDefault<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0035: stloc.2
IL_0036: ldloc.2
IL_0037: ldnull
IL_0038: cgt.un
IL_003a: stloc.3
IL_003b: ldloc.3
IL_003c: brfalse.s IL_0052
IL_003e: ldarg.1
IL_003f: ldloc.2
IL_0040: callvirt System.IO.Stream System.Reflection.Assembly::GetManifestResourceStream(System.String)
IL_0045: dup
IL_0046: brtrue.s IL_004b
IL_0048: pop
IL_0049: br.s IL_0052
IL_004b: ldloc.1
IL_004c: call System.Void System.IO.Stream::CopyTo(System.IO.Stream)
IL_0051: nop
IL_0052: ldloc.1
IL_0053: callvirt System.Int64 System.IO.Stream::get_Length()
IL_0058: brfalse.s IL_0062
IL_005a: ldloc.1
IL_005b: callvirt System.Byte[] System.IO.MemoryStream::ToArray()
IL_0060: br.s IL_0063
IL_0062: ldnull
IL_0063: stloc.s V_4
IL_0065: leave.s IL_0072
IL_0067: ldloc.1
IL_0068: brfalse.s IL_0071
IL_006a: ldloc.1
IL_006b: callvirt System.Void System.IDisposable::Dispose()
IL_0070: nop
IL_0071: endfinally
IL_0072: ldloc.s V_4
IL_0074: ret
// EH Finally: 20 - 103 => 103 - 114

// System.Void LocalizationManager.Localizer::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Void LocalizationManager.Localizer::.cctor()
.locals 
IL_0000: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.Dictionary`2<System.String,System.Func`1<System.String>>>::.ctor()
IL_0005: stsfld System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.Dictionary`2<System.String,System.Func`1<System.String>>> LocalizationManager.Localizer::PlaceholderProcessors
IL_000a: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.Dictionary`2<System.String,System.String>>::.ctor()
IL_000f: stsfld System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.Dictionary`2<System.String,System.String>> LocalizationManager.Localizer::loadedTexts
IL_0014: newobj System.Void System.Runtime.CompilerServices.ConditionalWeakTable`2<Localization,System.String>::.ctor()
IL_0019: stsfld System.Runtime.CompilerServices.ConditionalWeakTable`2<Localization,System.String> LocalizationManager.Localizer::localizationLanguage
IL_001e: newobj System.Void System.Collections.Generic.List`1<System.WeakReference`1<Localization>>::.ctor()
IL_0023: stsfld System.Collections.Generic.List`1<System.WeakReference`1<Localization>> LocalizationManager.Localizer::localizationObjects
IL_0028: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor()
IL_002d: dup
IL_002e: ldstr ".json"
IL_0033: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_0038: nop
IL_0039: dup
IL_003a: ldstr ".yml"
IL_003f: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_0044: nop
IL_0045: stsfld System.Collections.Generic.List`1<System.String> LocalizationManager.Localizer::fileExtensions
IL_004a: ret

// System.Void LocalizationManager.Localizer::<LoadLocalization>g__Scan|17_0(System.String,System.Boolean,LocalizationManager.Localizer/<>c__DisplayClass17_0&)
.locals System.Collections.Generic.IEnumerator`1<System.String>, System.String, System.String, System.String[], System.Int32, System.String, System.String, System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: nop
IL_0002: ldarg.0
IL_0003: ldstr "*.*"
IL_0008: ldc.i4.1
IL_0009: call System.String[] System.IO.Directory::GetFiles(System.String,System.String,System.IO.SearchOption)
IL_000e: ldsfld System.Func`2<System.String,System.Boolean> LocalizationManager.Localizer/<>c::<>9__17_1
IL_0013: dup
IL_0014: brtrue.s IL_002d
IL_0016: pop
IL_0017: ldsfld LocalizationManager.Localizer/<>c LocalizationManager.Localizer/<>c::<>9
IL_001c: ldftn System.Boolean LocalizationManager.Localizer/<>c::<LoadLocalization>b__17_1(System.String)
IL_0022: newobj System.Void System.Func`2<System.String,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0027: dup
IL_0028: stsfld System.Func`2<System.String,System.Boolean> LocalizationManager.Localizer/<>c::<>9__17_1
IL_002d: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0032: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<System.String>::GetEnumerator()
IL_0037: stloc.0
IL_0038: br IL_0122
IL_003d: ldloc.0
IL_003e: callvirt !0 System.Collections.Generic.IEnumerator`1<System.String>::get_Current()
IL_0043: stloc.1
IL_0044: nop
IL_0045: ldloc.1
IL_0046: call System.String System.IO.Path::GetFileNameWithoutExtension(System.String)
IL_004b: stloc.2
IL_004c: nop
IL_004d: ldarg.2
IL_004e: ldfld System.String[] LocalizationManager.Localizer/<>c__DisplayClass17_0::prefixes
IL_0053: stloc.3
IL_0054: ldc.i4.0
IL_0055: stloc.s V_4
IL_0057: br IL_0117
IL_005c: ldloc.3
IL_005d: ldloc.s V_4
IL_005f: ldelem.ref
IL_0060: stloc.s V_5
IL_0062: nop
IL_0063: ldloc.2
IL_0064: ldloc.s V_5
IL_0066: callvirt System.Boolean System.String::StartsWith(System.String)
IL_006b: ldc.i4.0
IL_006c: ceq
IL_006e: stloc.s V_7
IL_0070: ldloc.s V_7
IL_0072: brfalse.s IL_0079
IL_0074: br IL_0111
IL_0079: ldloc.2
IL_007a: ldloc.s V_5
IL_007c: callvirt System.Int32 System.String::get_Length()
IL_0081: callvirt System.String System.String::Substring(System.Int32)
IL_0086: stloc.s V_6
IL_0088: ldloc.s V_6
IL_008a: call System.Boolean System.String::IsNullOrWhiteSpace(System.String)
IL_008f: stloc.s V_8
IL_0091: ldloc.s V_8
IL_0093: brfalse.s IL_009a
IL_0095: br IL_0121
IL_009a: ldarg.2
IL_009b: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> LocalizationManager.Localizer/<>c__DisplayClass17_0::localizationFiles
IL_00a0: ldloc.s V_6
IL_00a2: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::ContainsKey(!0)
IL_00a7: stloc.s V_9
IL_00a9: ldloc.s V_9
IL_00ab: brfalse.s IL_0100
IL_00ad: nop
IL_00ae: ldarg.1
IL_00af: stloc.s V_10
IL_00b1: ldloc.s V_10
IL_00b3: brfalse.s IL_00fe
IL_00b5: ldc.i4.6
IL_00b6: newarr System.String
IL_00bb: dup
IL_00bc: ldc.i4.0
IL_00bd: ldstr "Duplicate localization '"
IL_00c2: stelem.ref
IL_00c3: dup
IL_00c4: ldc.i4.1
IL_00c5: ldloc.s V_6
IL_00c7: stelem.ref
IL_00c8: dup
IL_00c9: ldc.i4.2
IL_00ca: ldstr "' for "
IL_00cf: stelem.ref
IL_00d0: dup
IL_00d1: ldc.i4.3
IL_00d2: call BepInEx.BaseUnityPlugin LocalizationManager.Localizer::get_Plugin()
IL_00d7: callvirt BepInEx.PluginInfo BepInEx.BaseUnityPlugin::get_Info()
IL_00dc: callvirt BepInEx.BepInPlugin BepInEx.PluginInfo::get_Metadata()
IL_00e1: callvirt System.String BepInEx.BepInPlugin::get_Name()
IL_00e6: stelem.ref
IL_00e7: dup
IL_00e8: ldc.i4.4
IL_00e9: ldstr ". Skipping "
IL_00ee: stelem.ref
IL_00ef: dup
IL_00f0: ldc.i4.5
IL_00f1: ldloc.1
IL_00f2: stelem.ref
IL_00f3: call System.String System.String::Concat(System.String[])
IL_00f8: call System.Void LongshipUpgrades.LongshipUpgrades::LogWarning(System.Object)
IL_00fd: nop
IL_00fe: br.s IL_0121
IL_0100: ldarg.2
IL_0101: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> LocalizationManager.Localizer/<>c__DisplayClass17_0::localizationFiles
IL_0106: ldloc.s V_6
IL_0108: ldloc.1
IL_0109: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::set_Item(!0,!1)
IL_010e: nop
IL_010f: br.s IL_0121
IL_0111: ldloc.s V_4
IL_0113: ldc.i4.1
IL_0114: add
IL_0115: stloc.s V_4
IL_0117: ldloc.s V_4
IL_0119: ldloc.3
IL_011a: ldlen
IL_011b: conv.i4
IL_011c: blt IL_005c
IL_0121: nop
IL_0122: ldloc.0
IL_0123: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0128: brtrue IL_003d
IL_012d: leave.s IL_013a
IL_012f: ldloc.0
IL_0130: brfalse.s IL_0139
IL_0132: ldloc.0
IL_0133: callvirt System.Void System.IDisposable::Dispose()
IL_0138: nop
IL_0139: endfinally
IL_013a: ret
// EH Finally: 56 - 303 => 303 - 314

// System.Void LocalizationManager.Localizer/<>c::.cctor()
.locals 
IL_0000: newobj System.Void LocalizationManager.Localizer/<>c::.ctor()
IL_0005: stsfld LocalizationManager.Localizer/<>c LocalizationManager.Localizer/<>c::<>9
IL_000a: ret

// System.Void LocalizationManager.Localizer/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Boolean LocalizationManager.Localizer/<>c::<get_Plugin>b__7_1(System.Type)
.locals 
IL_0000: ldarg.1
IL_0001: ldnull
IL_0002: call System.Boolean System.Type::op_Inequality(System.Type,System.Type)
IL_0007: ret

// System.Reflection.TypeInfo LocalizationManager.Localizer/<>c::<get_Plugin>b__7_2(System.Type)
.locals 
IL_0000: ldarg.1
IL_0001: call System.Reflection.TypeInfo System.Reflection.IntrospectionExtensions::GetTypeInfo(System.Type)
IL_0006: ret

// System.Boolean LocalizationManager.Localizer/<>c::<get_Plugin>b__7_0(System.Reflection.TypeInfo)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt System.Boolean System.Type::get_IsClass()
IL_0006: brfalse.s IL_001a
IL_0008: ldtoken BepInEx.BaseUnityPlugin
IL_000d: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0012: ldarg.1
IL_0013: callvirt System.Boolean System.Type::IsAssignableFrom(System.Type)
IL_0018: br.s IL_001b
IL_001a: ldc.i4.0
IL_001b: ret

// System.String LocalizationManager.Localizer/<>c::<UpdatePlaceholderText>b__9_0(System.String,System.Collections.Generic.KeyValuePair`2<System.String,System.Func`1<System.String>>)
.locals 
IL_0000: ldarg.1
IL_0001: ldstr "{"
IL_0006: ldarga.s kv
IL_0008: call !0 System.Collections.Generic.KeyValuePair`2<System.String,System.Func`1<System.String>>::get_Key()
IL_000d: ldstr "}"
IL_0012: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0017: ldarga.s kv
IL_0019: call !1 System.Collections.Generic.KeyValuePair`2<System.String,System.Func`1<System.String>>::get_Value()
IL_001e: callvirt !0 System.Func`1<System.String>::Invoke()
IL_0023: callvirt System.String System.String::Replace(System.String,System.String)
IL_0028: ret

// System.Boolean LocalizationManager.Localizer/<>c::<LoadLocalization>b__17_1(System.String)
.locals 
IL_0000: ldsfld System.Collections.Generic.List`1<System.String> LocalizationManager.Localizer::fileExtensions
IL_0005: ldarg.1
IL_0006: call System.String System.IO.Path::GetExtension(System.String)
IL_000b: callvirt System.Boolean System.Collections.Generic.List`1<System.String>::Contains(!0)
IL_0010: ret

// System.Void LocalizationManager.Localizer/<>c__10`1::.cctor()
.locals 
IL_0000: newobj System.Void LocalizationManager.Localizer/<>c__10`1<T>::.ctor()
IL_0005: stsfld LocalizationManager.Localizer/<>c__10`1<T> LocalizationManager.Localizer/<>c__10`1<T>::<>9
IL_000a: ret

// System.Void LocalizationManager.Localizer/<>c__10`1::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.String LocalizationManager.Localizer/<>c__10`1::<AddPlaceholder>b__10_0(T)
.locals 
IL_0000: ldarga.s val
IL_0002: constrained. T
IL_0008: callvirt System.String System.Object::ToString()
IL_000d: ret

// System.Void LocalizationManager.Localizer/<>c__DisplayClass10_0`1::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Void LocalizationManager.Localizer/<>c__DisplayClass10_0`1::<AddPlaceholder>b__1(System.Object,System.EventArgs)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void LocalizationManager.Localizer/<>c__DisplayClass10_0`1<T>::<AddPlaceholder>g__UpdatePlaceholder|2()
IL_0006: nop
IL_0007: ret

// System.Void LocalizationManager.Localizer/<>c__DisplayClass10_0`1::<AddPlaceholder>g__UpdatePlaceholder|2()
.locals 
IL_0000: nop
IL_0001: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.Dictionary`2<System.String,System.Func`1<System.String>>> LocalizationManager.Localizer::PlaceholderProcessors
IL_0006: ldarg.0
IL_0007: ldfld System.String LocalizationManager.Localizer/<>c__DisplayClass10_0`1<T>::key
IL_000c: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.Dictionary`2<System.String,System.Func`1<System.String>>>::get_Item(!0)
IL_0011: ldarg.0
IL_0012: ldfld System.String LocalizationManager.Localizer/<>c__DisplayClass10_0`1<T>::placeholder
IL_0017: ldarg.0
IL_0018: ldftn System.String LocalizationManager.Localizer/<>c__DisplayClass10_0`1<T>::<AddPlaceholder>b__3()
IL_001e: newobj System.Void System.Func`1<System.String>::.ctor(System.Object,System.IntPtr)
IL_0023: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.Func`1<System.String>>::set_Item(!0,!1)
IL_0028: nop
IL_0029: call Localization Localization::get_instance()
IL_002e: ldarg.0
IL_002f: ldfld System.String LocalizationManager.Localizer/<>c__DisplayClass10_0`1<T>::key
IL_0034: call System.Void LocalizationManager.Localizer::UpdatePlaceholderText(Localization,System.String)
IL_0039: nop
IL_003a: ret

// System.String LocalizationManager.Localizer/<>c__DisplayClass10_0`1::<AddPlaceholder>b__3()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Func`2<T,System.String> LocalizationManager.Localizer/<>c__DisplayClass10_0`1<T>::convertConfigValue
IL_0006: ldarg.0
IL_0007: ldfld BepInEx.Configuration.ConfigEntry`1<T> LocalizationManager.Localizer/<>c__DisplayClass10_0`1<T>::config
IL_000c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<T>::get_Value()
IL_0011: callvirt !1 System.Func`2<T,System.String>::Invoke(!0)
IL_0016: ret

// System.Void LocalizationManager.Localizer/<>c__DisplayClass19_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Boolean LocalizationManager.Localizer/<>c__DisplayClass19_0::<ReadEmbeddedFileBytes>b__0(System.String)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.0
IL_0002: ldfld System.String LocalizationManager.Localizer/<>c__DisplayClass19_0::resourceFileName
IL_0007: ldc.i4.4
IL_0008: callvirt System.Boolean System.String::EndsWith(System.String,System.StringComparison)
IL_000d: ret

// System.Void LongshipUpgrades.ItemNameTokens::UpdateRegisters()
.locals System.Boolean, System.Collections.Generic.List`1/Enumerator<UnityEngine.GameObject>, UnityEngine.GameObject, ItemDrop, ItemDrop/ItemData/SharedData, System.Boolean, System.Boolean, System.Collections.Generic.List`1/Enumerator<Recipe>, Recipe, System.Boolean, System.Collections.Generic.List`1/Enumerator<UnityEngine.GameObject>, UnityEngine.GameObject, CraftingStation, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: call ObjectDB ObjectDB::get_instance()
IL_0006: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000b: ldc.i4.0
IL_000c: ceq
IL_000e: stloc.0
IL_000f: ldloc.0
IL_0010: brfalse.s IL_0017
IL_0012: br IL_01b6
IL_0017: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> LongshipUpgrades.ItemNameTokens::itemNames
IL_001c: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Clear()
IL_0021: nop
IL_0022: ldsfld System.Collections.Generic.Dictionary`2<System.String,UnityEngine.GameObject> LongshipUpgrades.ItemNameTokens::itemPrefabs
IL_0027: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,UnityEngine.GameObject>::Clear()
IL_002c: nop
IL_002d: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> LongshipUpgrades.ItemNameTokens::craftingStationNames
IL_0032: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Clear()
IL_0037: nop
IL_0038: nop
IL_0039: call ObjectDB ObjectDB::get_instance()
IL_003e: ldfld System.Collections.Generic.List`1<UnityEngine.GameObject> ObjectDB::m_items
IL_0043: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<UnityEngine.GameObject>::GetEnumerator()
IL_0048: stloc.1
IL_0049: br.s IL_00b6
IL_004b: ldloca.s V_1
IL_004d: call !0 System.Collections.Generic.List`1/Enumerator<UnityEngine.GameObject>::get_Current()
IL_0052: stloc.2
IL_0053: nop
IL_0054: ldloc.2
IL_0055: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_005a: brfalse.s IL_0069
IL_005c: ldloc.2
IL_005d: ldloca.s V_3
IL_005f: callvirt System.Boolean UnityEngine.GameObject::TryGetComponent<ItemDrop>(!!0&)
IL_0064: ldc.i4.0
IL_0065: ceq
IL_0067: br.s IL_006a
IL_0069: ldc.i4.1
IL_006a: stloc.s V_5
IL_006c: ldloc.s V_5
IL_006e: brfalse.s IL_0072
IL_0070: br.s IL_00b6
IL_0072: ldloc.3
IL_0073: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0078: dup
IL_0079: brtrue.s IL_007f
IL_007b: pop
IL_007c: ldnull
IL_007d: br.s IL_0084
IL_007f: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0084: stloc.s V_4
IL_0086: ldloc.s V_4
IL_0088: brfalse.s IL_0098
IL_008a: ldloc.s V_4
IL_008c: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_0091: call System.Boolean System.String::IsNullOrWhiteSpace(System.String)
IL_0096: br.s IL_0099
IL_0098: ldc.i4.1
IL_0099: stloc.s V_6
IL_009b: ldloc.s V_6
IL_009d: brfalse.s IL_00a1
IL_009f: br.s IL_00b6
IL_00a1: ldloc.2
IL_00a2: callvirt System.String UnityEngine.Object::get_name()
IL_00a7: ldloc.s V_4
IL_00a9: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_00ae: ldloc.2
IL_00af: call System.Void LongshipUpgrades.ItemNameTokens::RegisterItem(System.String,System.String,UnityEngine.GameObject)
IL_00b4: nop
IL_00b5: nop
IL_00b6: ldloca.s V_1
IL_00b8: call System.Boolean System.Collections.Generic.List`1/Enumerator<UnityEngine.GameObject>::MoveNext()
IL_00bd: brtrue.s IL_004b
IL_00bf: leave.s IL_00d0
IL_00c1: ldloca.s V_1
IL_00c3: constrained. System.Collections.Generic.List`1/Enumerator<UnityEngine.GameObject>
IL_00c9: callvirt System.Void System.IDisposable::Dispose()
IL_00ce: nop
IL_00cf: endfinally
IL_00d0: nop
IL_00d1: call ObjectDB ObjectDB::get_instance()
IL_00d6: ldfld System.Collections.Generic.List`1<Recipe> ObjectDB::m_recipes
IL_00db: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Recipe>::GetEnumerator()
IL_00e0: stloc.s V_7
IL_00e2: br.s IL_0119
IL_00e4: ldloca.s V_7
IL_00e6: call !0 System.Collections.Generic.List`1/Enumerator<Recipe>::get_Current()
IL_00eb: stloc.s V_8
IL_00ed: nop
IL_00ee: ldloc.s V_8
IL_00f0: brtrue.s IL_00f5
IL_00f2: ldnull
IL_00f3: br.s IL_00fc
IL_00f5: ldloc.s V_8
IL_00f7: ldfld CraftingStation Recipe::m_craftingStation
IL_00fc: ldnull
IL_00fd: call System.Void LongshipUpgrades.ItemNameTokens::RegisterCraftingStation(CraftingStation,System.String)
IL_0102: nop
IL_0103: ldloc.s V_8
IL_0105: brtrue.s IL_010a
IL_0107: ldnull
IL_0108: br.s IL_0111
IL_010a: ldloc.s V_8
IL_010c: ldfld CraftingStation Recipe::m_repairStation
IL_0111: ldnull
IL_0112: call System.Void LongshipUpgrades.ItemNameTokens::RegisterCraftingStation(CraftingStation,System.String)
IL_0117: nop
IL_0118: nop
IL_0119: ldloca.s V_7
IL_011b: call System.Boolean System.Collections.Generic.List`1/Enumerator<Recipe>::MoveNext()
IL_0120: brtrue.s IL_00e4
IL_0122: leave.s IL_0133
IL_0124: ldloca.s V_7
IL_0126: constrained. System.Collections.Generic.List`1/Enumerator<Recipe>
IL_012c: callvirt System.Void System.IDisposable::Dispose()
IL_0131: nop
IL_0132: endfinally
IL_0133: call ZNetScene ZNetScene::get_instance()
IL_0138: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_013d: stloc.s V_9
IL_013f: ldloc.s V_9
IL_0141: brfalse.s IL_01b6
IL_0143: nop
IL_0144: nop
IL_0145: call ZNetScene ZNetScene::get_instance()
IL_014a: ldfld System.Collections.Generic.List`1<UnityEngine.GameObject> ZNetScene::m_prefabs
IL_014f: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<UnityEngine.GameObject>::GetEnumerator()
IL_0154: stloc.s V_10
IL_0156: br.s IL_019b
IL_0158: ldloca.s V_10
IL_015a: call !0 System.Collections.Generic.List`1/Enumerator<UnityEngine.GameObject>::get_Current()
IL_015f: stloc.s V_11
IL_0161: nop
IL_0162: ldloc.s V_11
IL_0164: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0169: ldc.i4.0
IL_016a: ceq
IL_016c: stloc.s V_13
IL_016e: ldloc.s V_13
IL_0170: brfalse.s IL_0174
IL_0172: br.s IL_019b
IL_0174: ldloc.s V_11
IL_0176: ldc.i4.1
IL_0177: callvirt !!0 UnityEngine.GameObject::GetComponentInChildren<CraftingStation>(System.Boolean)
IL_017c: stloc.s V_12
IL_017e: ldloc.s V_12
IL_0180: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0185: stloc.s V_14
IL_0187: ldloc.s V_14
IL_0189: brfalse.s IL_019a
IL_018b: ldloc.s V_12
IL_018d: ldloc.s V_11
IL_018f: callvirt System.String UnityEngine.Object::get_name()
IL_0194: call System.Void LongshipUpgrades.ItemNameTokens::RegisterCraftingStation(CraftingStation,System.String)
IL_0199: nop
IL_019a: nop
IL_019b: ldloca.s V_10
IL_019d: call System.Boolean System.Collections.Generic.List`1/Enumerator<UnityEngine.GameObject>::MoveNext()
IL_01a2: brtrue.s IL_0158
IL_01a4: leave.s IL_01b5
IL_01a6: ldloca.s V_10
IL_01a8: constrained. System.Collections.Generic.List`1/Enumerator<UnityEngine.GameObject>
IL_01ae: callvirt System.Void System.IDisposable::Dispose()
IL_01b3: nop
IL_01b4: endfinally
IL_01b5: nop
IL_01b6: ret
// EH Finally: 73 - 193 => 193 - 208
// EH Finally: 226 - 292 => 292 - 307
// EH Finally: 342 - 422 => 422 - 437

// System.Void LongshipUpgrades.ItemNameTokens::RegisterItem(System.String,System.String,UnityEngine.GameObject)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.Boolean System.String::IsNullOrWhiteSpace(System.String)
IL_0007: brtrue.s IL_001c
IL_0009: ldarg.1
IL_000a: call System.Boolean System.String::IsNullOrWhiteSpace(System.String)
IL_000f: brtrue.s IL_001c
IL_0011: ldarg.2
IL_0012: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0017: ldc.i4.0
IL_0018: ceq
IL_001a: br.s IL_001d
IL_001c: ldc.i4.1
IL_001d: stloc.0
IL_001e: ldloc.0
IL_001f: brfalse.s IL_0023
IL_0021: br.s IL_0057
IL_0023: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> LongshipUpgrades.ItemNameTokens::itemNames
IL_0028: ldarg.0
IL_0029: ldarg.1
IL_002a: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::set_Item(!0,!1)
IL_002f: nop
IL_0030: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> LongshipUpgrades.ItemNameTokens::itemNames
IL_0035: ldarg.1
IL_0036: ldarg.1
IL_0037: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::set_Item(!0,!1)
IL_003c: nop
IL_003d: ldsfld System.Collections.Generic.Dictionary`2<System.String,UnityEngine.GameObject> LongshipUpgrades.ItemNameTokens::itemPrefabs
IL_0042: ldarg.0
IL_0043: ldarg.2
IL_0044: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,UnityEngine.GameObject>::set_Item(!0,!1)
IL_0049: nop
IL_004a: ldsfld System.Collections.Generic.Dictionary`2<System.String,UnityEngine.GameObject> LongshipUpgrades.ItemNameTokens::itemPrefabs
IL_004f: ldarg.1
IL_0050: ldarg.2
IL_0051: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,UnityEngine.GameObject>::set_Item(!0,!1)
IL_0056: nop
IL_0057: ret

// System.Void LongshipUpgrades.ItemNameTokens::RegisterCraftingStation(CraftingStation,System.String)
.locals System.String, System.String, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0007: brfalse.s IL_0016
IL_0009: ldarg.0
IL_000a: ldfld System.String CraftingStation::m_name
IL_000f: call System.Boolean System.String::IsNullOrWhiteSpace(System.String)
IL_0014: br.s IL_0017
IL_0016: ldc.i4.1
IL_0017: stloc.2
IL_0018: ldloc.2
IL_0019: brfalse.s IL_001d
IL_001b: br.s IL_0071
IL_001d: ldarg.0
IL_001e: ldfld System.String CraftingStation::m_name
IL_0023: callvirt System.String System.String::Trim()
IL_0028: stloc.0
IL_0029: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> LongshipUpgrades.ItemNameTokens::craftingStationNames
IL_002e: ldloc.0
IL_002f: ldloc.0
IL_0030: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::set_Item(!0,!1)
IL_0035: nop
IL_0036: ldarg.1
IL_0037: call System.Boolean System.String::IsNullOrWhiteSpace(System.String)
IL_003c: brtrue.s IL_0046
IL_003e: ldarg.1
IL_003f: call System.String Utils::GetPrefabName(System.String)
IL_0044: br.s IL_0056
IL_0046: ldarg.0
IL_0047: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_004c: callvirt System.String UnityEngine.Object::get_name()
IL_0051: call System.String Utils::GetPrefabName(System.String)
IL_0056: stloc.1
IL_0057: ldloc.1
IL_0058: call System.Boolean System.String::IsNullOrWhiteSpace(System.String)
IL_005d: ldc.i4.0
IL_005e: ceq
IL_0060: stloc.3
IL_0061: ldloc.3
IL_0062: brfalse.s IL_0071
IL_0064: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> LongshipUpgrades.ItemNameTokens::craftingStationNames
IL_0069: ldloc.1
IL_006a: ldloc.0
IL_006b: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::set_Item(!0,!1)
IL_0070: nop
IL_0071: ret

// System.String LongshipUpgrades.ItemNameTokens::GetItemName(System.String)
.locals System.String, System.String, System.String
IL_0000: nop
IL_0001: ldarg.0
IL_0002: brtrue.s IL_0007
IL_0004: ldnull
IL_0005: br.s IL_000d
IL_0007: ldarg.0
IL_0008: call System.String System.String::Trim()
IL_000d: dup
IL_000e: brtrue.s IL_0016
IL_0010: pop
IL_0011: ldsfld System.String System.String::Empty
IL_0016: stloc.0
IL_0017: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> LongshipUpgrades.ItemNameTokens::itemNames
IL_001c: ldloc.0
IL_001d: ldloca.s V_1
IL_001f: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::TryGetValue(!0,!1&)
IL_0024: brtrue.s IL_0029
IL_0026: ldloc.0
IL_0027: br.s IL_002a
IL_0029: ldloc.1
IL_002a: stloc.2
IL_002b: br.s IL_002d
IL_002d: ldloc.2
IL_002e: ret

// System.Boolean LongshipUpgrades.ItemNameTokens::TryGetItemPrefab(System.String,UnityEngine.GameObject&)
.locals System.String, System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: brtrue.s IL_0007
IL_0004: ldnull
IL_0005: br.s IL_000d
IL_0007: ldarg.0
IL_0008: call System.String System.String::Trim()
IL_000d: dup
IL_000e: brtrue.s IL_0016
IL_0010: pop
IL_0011: ldsfld System.String System.String::Empty
IL_0016: stloc.0
IL_0017: ldsfld System.Collections.Generic.Dictionary`2<System.String,UnityEngine.GameObject> LongshipUpgrades.ItemNameTokens::itemPrefabs
IL_001c: callvirt System.Int32 System.Collections.Generic.Dictionary`2<System.String,UnityEngine.GameObject>::get_Count()
IL_0021: ldc.i4.0
IL_0022: ceq
IL_0024: stloc.1
IL_0025: ldloc.1
IL_0026: brfalse.s IL_002e
IL_0028: call System.Void LongshipUpgrades.ItemNameTokens::UpdateRegisters()
IL_002d: nop
IL_002e: ldsfld System.Collections.Generic.Dictionary`2<System.String,UnityEngine.GameObject> LongshipUpgrades.ItemNameTokens::itemPrefabs
IL_0033: ldloc.0
IL_0034: ldarg.1
IL_0035: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,UnityEngine.GameObject>::TryGetValue(!0,!1&)
IL_003a: brfalse.s IL_0045
IL_003c: ldarg.1
IL_003d: ldind.ref
IL_003e: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0043: br.s IL_0046
IL_0045: ldc.i4.0
IL_0046: stloc.2
IL_0047: ldloc.2
IL_0048: brfalse.s IL_004e
IL_004a: ldc.i4.1
IL_004b: stloc.3
IL_004c: br.s IL_007d
IL_004e: call System.Void LongshipUpgrades.ItemNameTokens::UpdateRegisters()
IL_0053: nop
IL_0054: ldsfld System.Collections.Generic.Dictionary`2<System.String,UnityEngine.GameObject> LongshipUpgrades.ItemNameTokens::itemPrefabs
IL_0059: ldloc.0
IL_005a: ldarg.1
IL_005b: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,UnityEngine.GameObject>::TryGetValue(!0,!1&)
IL_0060: brfalse.s IL_006b
IL_0062: ldarg.1
IL_0063: ldind.ref
IL_0064: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0069: br.s IL_006c
IL_006b: ldc.i4.0
IL_006c: stloc.s V_4
IL_006e: ldloc.s V_4
IL_0070: brfalse.s IL_0076
IL_0072: ldc.i4.1
IL_0073: stloc.3
IL_0074: br.s IL_007d
IL_0076: ldarg.1
IL_0077: ldnull
IL_0078: stind.ref
IL_0079: ldc.i4.0
IL_007a: stloc.3
IL_007b: br.s IL_007d
IL_007d: ldloc.3
IL_007e: ret

// System.String LongshipUpgrades.ItemNameTokens::GetCraftingStationName(System.String)
.locals System.String, System.String, System.Boolean, System.String, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: brtrue.s IL_0007
IL_0004: ldnull
IL_0005: br.s IL_000d
IL_0007: ldarg.0
IL_0008: call System.String System.String::Trim()
IL_000d: dup
IL_000e: brtrue.s IL_0016
IL_0010: pop
IL_0011: ldsfld System.String System.String::Empty
IL_0016: stloc.0
IL_0017: ldloc.0
IL_0018: call System.Boolean System.String::IsNullOrWhiteSpace(System.String)
IL_001d: stloc.2
IL_001e: ldloc.2
IL_001f: brfalse.s IL_0029
IL_0021: ldsfld System.String System.String::Empty
IL_0026: stloc.3
IL_0027: br.s IL_0075
IL_0029: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> LongshipUpgrades.ItemNameTokens::craftingStationNames
IL_002e: callvirt System.Int32 System.Collections.Generic.Dictionary`2<System.String,System.String>::get_Count()
IL_0033: ldc.i4.0
IL_0034: ceq
IL_0036: stloc.s V_4
IL_0038: ldloc.s V_4
IL_003a: brfalse.s IL_0042
IL_003c: call System.Void LongshipUpgrades.ItemNameTokens::UpdateRegisters()
IL_0041: nop
IL_0042: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> LongshipUpgrades.ItemNameTokens::craftingStationNames
IL_0047: ldloc.0
IL_0048: ldloca.s V_1
IL_004a: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::TryGetValue(!0,!1&)
IL_004f: stloc.s V_5
IL_0051: ldloc.s V_5
IL_0053: brfalse.s IL_0059
IL_0055: ldloc.1
IL_0056: stloc.3
IL_0057: br.s IL_0075
IL_0059: call System.Void LongshipUpgrades.ItemNameTokens::UpdateRegisters()
IL_005e: nop
IL_005f: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> LongshipUpgrades.ItemNameTokens::craftingStationNames
IL_0064: ldloc.0
IL_0065: ldloca.s V_1
IL_0067: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::TryGetValue(!0,!1&)
IL_006c: brtrue.s IL_0071
IL_006e: ldloc.0
IL_006f: br.s IL_0072
IL_0071: ldloc.1
IL_0072: stloc.3
IL_0073: br.s IL_0075
IL_0075: ldloc.3
IL_0076: ret

// System.Void LongshipUpgrades.ItemNameTokens::.cctor()
.locals 
IL_0000: call System.StringComparer System.StringComparer::get_OrdinalIgnoreCase()
IL_0005: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::.ctor(System.Collections.Generic.IEqualityComparer`1<!0>)
IL_000a: stsfld System.Collections.Generic.Dictionary`2<System.String,System.String> LongshipUpgrades.ItemNameTokens::itemNames
IL_000f: call System.StringComparer System.StringComparer::get_OrdinalIgnoreCase()
IL_0014: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,UnityEngine.GameObject>::.ctor(System.Collections.Generic.IEqualityComparer`1<!0>)
IL_0019: stsfld System.Collections.Generic.Dictionary`2<System.String,UnityEngine.GameObject> LongshipUpgrades.ItemNameTokens::itemPrefabs
IL_001e: call System.StringComparer System.StringComparer::get_OrdinalIgnoreCase()
IL_0023: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::.ctor(System.Collections.Generic.IEqualityComparer`1<!0>)
IL_0028: stsfld System.Collections.Generic.Dictionary`2<System.String,System.String> LongshipUpgrades.ItemNameTokens::craftingStationNames
IL_002d: ret

// System.Void LongshipUpgrades.ItemNameTokens/Player_Load_UpdateRegisters::Prefix()
.locals 
IL_0000: call System.Void LongshipUpgrades.ItemNameTokens::UpdateRegisters()
IL_0005: nop
IL_0006: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::Awake()
.locals System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldsfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::prefabInit
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: brfalse.s IL_000f
IL_000a: br IL_01d9
IL_000f: ldarg.0
IL_0010: ldarg.0
IL_0011: call !!0 UnityEngine.Component::GetComponent<Ship>()
IL_0016: stfld Ship LongshipUpgrades.LongshipCustomizableParts::m_ship
IL_001b: ldarg.0
IL_001c: ldarg.0
IL_001d: call !!0 UnityEngine.Component::GetComponent<WearNTear>()
IL_0022: stfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_0027: ldarg.0
IL_0028: ldarg.0
IL_0029: call !!0 UnityEngine.Component::GetComponent<ZNetView>()
IL_002e: stfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0033: ldarg.0
IL_0034: ldarg.0
IL_0035: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_003a: dup
IL_003b: brtrue.s IL_0041
IL_003d: pop
IL_003e: ldnull
IL_003f: br.s IL_0046
IL_0041: call ZDO ZNetView::GetZDO()
IL_0046: stfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_004b: ldarg.0
IL_004c: ldarg.0
IL_004d: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0052: callvirt System.Boolean ZNetView::IsValid()
IL_0057: call System.Void UnityEngine.Behaviour::set_enabled(System.Boolean)
IL_005c: nop
IL_005d: ldarg.0
IL_005e: call System.Boolean UnityEngine.Behaviour::get_enabled()
IL_0063: stloc.1
IL_0064: ldloc.1
IL_0065: brfalse.s IL_00c0
IL_0067: nop
IL_0068: ldarg.0
IL_0069: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_006e: ldstr "SetVariant"
IL_0073: ldarg.0
IL_0074: ldftn System.Void LongshipUpgrades.LongshipCustomizableParts::RPC_SetVariant(System.Int64,System.Int32,System.Int32,System.Int32,System.String)
IL_007a: newobj System.Void RoutedMethod`4/Method<System.Int32,System.Int32,System.Int32,System.String>::.ctor(System.Object,System.IntPtr)
IL_007f: callvirt System.Void ZNetView::Register<System.Int32,System.Int32,System.Int32,System.String>(System.String,RoutedMethod`4/Method<!!0,!!1,!!2,!!3>)
IL_0084: nop
IL_0085: ldarg.0
IL_0086: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_008b: ldstr "SetActive"
IL_0090: ldarg.0
IL_0091: ldftn System.Void LongshipUpgrades.LongshipCustomizableParts::RPC_SetActive(System.Int64,System.Int32,System.Boolean,System.Int32,System.String)
IL_0097: newobj System.Void RoutedMethod`4/Method<System.Int32,System.Boolean,System.Int32,System.String>::.ctor(System.Object,System.IntPtr)
IL_009c: callvirt System.Void ZNetView::Register<System.Int32,System.Boolean,System.Int32,System.String>(System.String,RoutedMethod`4/Method<!!0,!!1,!!2,!!3>)
IL_00a1: nop
IL_00a2: ldarg.0
IL_00a3: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_00a8: ldstr "SetBuilt"
IL_00ad: ldarg.0
IL_00ae: ldftn System.Void LongshipUpgrades.LongshipCustomizableParts::RPC_SetBuilt(System.Int64,System.Int32,System.String,System.String)
IL_00b4: newobj System.Void System.Action`4<System.Int64,System.Int32,System.String,System.String>::.ctor(System.Object,System.IntPtr)
IL_00b9: callvirt System.Void ZNetView::Register<System.Int32,System.String,System.String>(System.String,System.Action`4<System.Int64,!!0,!!1,!!2>)
IL_00be: nop
IL_00bf: nop
IL_00c0: ldarg.0
IL_00c1: ldc.i4.0
IL_00c2: stfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_lastRequestedShipMapRevision
IL_00c7: ldarg.0
IL_00c8: ldarg.0
IL_00c9: call !!0[] UnityEngine.Component::GetComponentsInChildren<Container>()
IL_00ce: ldsfld System.Func`2<Container,System.Boolean> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__114_0
IL_00d3: dup
IL_00d4: brtrue.s IL_00ed
IL_00d6: pop
IL_00d7: ldsfld LongshipUpgrades.LongshipCustomizableParts/<>c LongshipUpgrades.LongshipCustomizableParts/<>c::<>9
IL_00dc: ldftn System.Boolean LongshipUpgrades.LongshipCustomizableParts/<>c::<Awake>b__114_0(Container)
IL_00e2: newobj System.Void System.Func`2<Container,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_00e7: dup
IL_00e8: stsfld System.Func`2<Container,System.Boolean> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__114_0
IL_00ed: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<Container>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_00f2: call !!0 System.Linq.Enumerable::FirstOrDefault<Container>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_00f7: stfld Container LongshipUpgrades.LongshipCustomizableParts::m_container
IL_00fc: ldarg.0
IL_00fd: ldarg.0
IL_00fe: ldfld Container LongshipUpgrades.LongshipCustomizableParts::m_container
IL_0103: dup
IL_0104: brtrue.s IL_010a
IL_0106: pop
IL_0107: ldnull
IL_0108: br.s IL_010f
IL_010a: ldfld UnityEngine.GameObject Container::m_destroyedLootPrefab
IL_010f: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_destroyedLootPrefab
IL_0114: ldarg.0
IL_0115: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_011a: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_011f: stloc.2
IL_0120: ldloc.2
IL_0121: brfalse.s IL_014f
IL_0123: ldarg.0
IL_0124: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_0129: ldarg.0
IL_012a: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_012f: ldfld System.Action WearNTear::m_onDestroyed
IL_0134: ldarg.0
IL_0135: ldftn System.Void LongshipUpgrades.LongshipCustomizableParts::OnDestroyed()
IL_013b: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_0140: call System.Delegate System.Delegate::Combine(System.Delegate,System.Delegate)
IL_0145: castclass System.Action
IL_014a: stfld System.Action WearNTear::m_onDestroyed
IL_014f: ldsfld System.Collections.Generic.Dictionary`2<System.String,EffectList> LongshipUpgrades.LongshipCustomizableParts::buildEffects
IL_0154: callvirt System.Int32 System.Collections.Generic.Dictionary`2<System.String,EffectList>::get_Count()
IL_0159: ldc.i4.0
IL_015a: ceq
IL_015c: stloc.3
IL_015d: ldloc.3
IL_015e: brfalse.s IL_01bb
IL_0160: nop
IL_0161: call ObjectDB ObjectDB::get_instance()
IL_0166: dup
IL_0167: brtrue.s IL_016c
IL_0169: pop
IL_016a: br.s IL_01ba
IL_016c: ldfld System.Collections.Generic.List`1<Recipe> ObjectDB::m_recipes
IL_0171: ldsfld System.Func`2<Recipe,System.Boolean> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__114_1
IL_0176: dup
IL_0177: brtrue.s IL_0190
IL_0179: pop
IL_017a: ldsfld LongshipUpgrades.LongshipCustomizableParts/<>c LongshipUpgrades.LongshipCustomizableParts/<>c::<>9
IL_017f: ldftn System.Boolean LongshipUpgrades.LongshipCustomizableParts/<>c::<Awake>b__114_1(Recipe)
IL_0185: newobj System.Void System.Func`2<Recipe,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_018a: dup
IL_018b: stsfld System.Func`2<Recipe,System.Boolean> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__114_1
IL_0190: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<Recipe>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0195: ldsfld System.Action`1<Recipe> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__114_2
IL_019a: dup
IL_019b: brtrue.s IL_01b4
IL_019d: pop
IL_019e: ldsfld LongshipUpgrades.LongshipCustomizableParts/<>c LongshipUpgrades.LongshipCustomizableParts/<>c::<>9
IL_01a3: ldftn System.Void LongshipUpgrades.LongshipCustomizableParts/<>c::<Awake>b__114_2(Recipe)
IL_01a9: newobj System.Void System.Action`1<Recipe>::.ctor(System.Object,System.IntPtr)
IL_01ae: dup
IL_01af: stsfld System.Action`1<Recipe> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__114_2
IL_01b4: call System.Void HarmonyLib.CollectionExtensions::Do<Recipe>(System.Collections.Generic.IEnumerable`1<!!0>,System.Action`1<!!0>)
IL_01b9: nop
IL_01ba: nop
IL_01bb: call System.Void LongshipUpgrades.LongshipCustomizableParts::CheckEffects()
IL_01c0: nop
IL_01c1: call System.Void LongshipUpgrades.LongshipCustomizableParts::GetHildirMapTable()
IL_01c6: nop
IL_01c7: ldsfld System.Collections.Generic.Dictionary`2<UnityEngine.GameObject,LongshipUpgrades.LongshipCustomizableParts> LongshipUpgrades.LongshipCustomizableParts::s_allInstances
IL_01cc: ldarg.0
IL_01cd: call UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_01d2: ldarg.0
IL_01d3: callvirt System.Void System.Collections.Generic.Dictionary`2<UnityEngine.GameObject,LongshipUpgrades.LongshipCustomizableParts>::Add(!0,!1)
IL_01d8: nop
IL_01d9: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::Start()
.locals System.Boolean
IL_0000: nop
IL_0001: ldsfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::prefabInit
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: brfalse.s IL_000c
IL_000a: br.s IL_0013
IL_000c: ldarg.0
IL_000d: call System.Void LongshipUpgrades.LongshipCustomizableParts::InitializeParts()
IL_0012: nop
IL_0013: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::OnDisable()
.locals 
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldc.i4.0
IL_0003: call System.Void LongshipUpgrades.LongshipCustomizableParts::UpdateFireWarmth(System.Boolean)
IL_0008: nop
IL_0009: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::OnDestroy()
.locals System.Boolean
IL_0000: nop
IL_0001: ldsfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::prefabInit
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: brfalse.s IL_000c
IL_000a: br.s IL_0025
IL_000c: ldarg.0
IL_000d: ldc.i4.0
IL_000e: call System.Void LongshipUpgrades.LongshipCustomizableParts::UpdateFireWarmth(System.Boolean)
IL_0013: nop
IL_0014: ldsfld System.Collections.Generic.Dictionary`2<UnityEngine.GameObject,LongshipUpgrades.LongshipCustomizableParts> LongshipUpgrades.LongshipCustomizableParts::s_allInstances
IL_0019: ldarg.0
IL_001a: call UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_001f: callvirt System.Boolean System.Collections.Generic.Dictionary`2<UnityEngine.GameObject,LongshipUpgrades.LongshipCustomizableParts>::Remove(!0)
IL_0024: pop
IL_0025: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::FixedUpdate()
.locals System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.String, System.Boolean, System.String, System.Boolean, System.Boolean, System.String, System.Boolean, System.String, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.String, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Int32, System.Boolean, UnityEngine.GameObject[], System.Int32, UnityEngine.GameObject
IL_0000: nop
IL_0001: ldsfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::prefabInit
IL_0006: stloc.2
IL_0007: ldloc.2
IL_0008: brfalse.s IL_000f
IL_000a: br IL_1026
IL_000f: ldarg.0
IL_0010: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0015: brfalse.s IL_0027
IL_0017: ldarg.0
IL_0018: ldfld Ship LongshipUpgrades.LongshipCustomizableParts::m_ship
IL_001d: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0022: ldc.i4.0
IL_0023: ceq
IL_0025: br.s IL_0028
IL_0027: ldc.i4.1
IL_0028: stloc.3
IL_0029: ldloc.3
IL_002a: brfalse.s IL_003a
IL_002c: nop
IL_002d: ldarg.0
IL_002e: ldc.i4.0
IL_002f: call System.Void LongshipUpgrades.LongshipCustomizableParts::UpdateFireWarmth(System.Boolean)
IL_0034: nop
IL_0035: br IL_1026
IL_003a: ldarg.0
IL_003b: call System.Void LongshipUpgrades.LongshipCustomizableParts::RequestMissingShipMapData()
IL_0040: nop
IL_0041: ldarg.0
IL_0042: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::mastEnabled
IL_0047: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_004c: brfalse.s IL_0061
IL_004e: ldarg.0
IL_004f: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0054: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_mastUpgraded
IL_0059: ldc.i4.0
IL_005a: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_005f: br.s IL_0062
IL_0061: ldc.i4.0
IL_0062: stfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_customMast
IL_0067: ldarg.0
IL_0068: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mastUpgrade
IL_006d: dup
IL_006e: brtrue.s IL_0073
IL_0070: pop
IL_0071: br.s IL_009a
IL_0073: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::mastEnabled
IL_0078: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_007d: brfalse.s IL_0087
IL_007f: ldarg.0
IL_0080: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_customMast
IL_0085: brfalse.s IL_0093
IL_0087: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::mastRemovable
IL_008c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0091: br.s IL_0094
IL_0093: ldc.i4.1
IL_0094: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0099: nop
IL_009a: ldarg.0
IL_009b: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mast
IL_00a0: dup
IL_00a1: brtrue.s IL_00a6
IL_00a3: pop
IL_00a4: br.s IL_00c0
IL_00a6: ldarg.0
IL_00a7: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_00ac: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_mastRemoved
IL_00b1: ldc.i4.0
IL_00b2: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_00b7: ldc.i4.0
IL_00b8: ceq
IL_00ba: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_00bf: nop
IL_00c0: ldarg.0
IL_00c1: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_ropes
IL_00c6: dup
IL_00c7: brtrue.s IL_00cc
IL_00c9: pop
IL_00ca: br.s IL_00dd
IL_00cc: ldarg.0
IL_00cd: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mast
IL_00d2: callvirt System.Boolean UnityEngine.GameObject::get_activeSelf()
IL_00d7: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_00dc: nop
IL_00dd: ldarg.0
IL_00de: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_wisp
IL_00e3: dup
IL_00e4: brtrue.s IL_00e9
IL_00e6: pop
IL_00e7: br.s IL_0132
IL_00e9: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::wispEnabled
IL_00ee: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_00f3: brfalse.s IL_012b
IL_00f5: ldarg.0
IL_00f6: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mast
IL_00fb: callvirt System.Boolean UnityEngine.GameObject::get_activeSelf()
IL_0100: brfalse.s IL_012b
IL_0102: ldarg.0
IL_0103: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0108: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_wispUpgraded
IL_010d: ldc.i4.0
IL_010e: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_0113: brfalse.s IL_012b
IL_0115: ldarg.0
IL_0116: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_011b: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_wispRemoved
IL_0120: ldc.i4.0
IL_0121: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_0126: ldc.i4.0
IL_0127: ceq
IL_0129: br.s IL_012c
IL_012b: ldc.i4.0
IL_012c: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0131: nop
IL_0132: ldarg.0
IL_0133: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mapTable
IL_0138: dup
IL_0139: brtrue.s IL_013e
IL_013b: pop
IL_013c: br.s IL_0164
IL_013e: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::mapTableEnabled
IL_0143: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0148: brfalse.s IL_015d
IL_014a: ldarg.0
IL_014b: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0150: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_mapTableUpgraded
IL_0155: ldc.i4.0
IL_0156: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_015b: br.s IL_015e
IL_015d: ldc.i4.0
IL_015e: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0163: nop
IL_0164: ldarg.0
IL_0165: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamTent
IL_016a: dup
IL_016b: brtrue.s IL_0170
IL_016d: pop
IL_016e: br.s IL_019a
IL_0170: ldarg.0
IL_0171: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_customMast
IL_0176: brfalse.s IL_0193
IL_0178: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::lanternEnabled
IL_017d: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0182: brtrue.s IL_0190
IL_0184: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::tentEnabled
IL_0189: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_018e: br.s IL_0191
IL_0190: ldc.i4.1
IL_0191: br.s IL_0194
IL_0193: ldc.i4.0
IL_0194: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0199: nop
IL_019a: ldarg.0
IL_019b: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamMast
IL_01a0: dup
IL_01a1: brtrue.s IL_01a6
IL_01a3: pop
IL_01a4: br.s IL_01d5
IL_01a6: ldarg.0
IL_01a7: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mast
IL_01ac: callvirt System.Boolean UnityEngine.GameObject::get_activeSelf()
IL_01b1: brtrue.s IL_01ce
IL_01b3: ldarg.0
IL_01b4: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamTent
IL_01b9: ldnull
IL_01ba: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_01bf: brfalse.s IL_01ce
IL_01c1: ldarg.0
IL_01c2: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamTent
IL_01c7: callvirt System.Boolean UnityEngine.GameObject::get_activeInHierarchy()
IL_01cc: br.s IL_01cf
IL_01ce: ldc.i4.0
IL_01cf: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_01d4: nop
IL_01d5: ldarg.0
IL_01d6: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamSailCollider
IL_01db: dup
IL_01dc: brtrue.s IL_01e1
IL_01de: pop
IL_01df: br.s IL_020f
IL_01e1: ldarg.0
IL_01e2: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamMast
IL_01e7: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_01ec: brfalse.s IL_01fb
IL_01ee: ldarg.0
IL_01ef: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamMast
IL_01f4: callvirt System.Boolean UnityEngine.GameObject::get_activeSelf()
IL_01f9: brtrue.s IL_0208
IL_01fb: ldarg.0
IL_01fc: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mast
IL_0201: callvirt System.Boolean UnityEngine.GameObject::get_activeSelf()
IL_0206: br.s IL_0209
IL_0208: ldc.i4.0
IL_0209: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_020e: nop
IL_020f: ldarg.0
IL_0210: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_wispUpgrade
IL_0215: dup
IL_0216: brtrue.s IL_021b
IL_0218: pop
IL_0219: br.s IL_023b
IL_021b: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::wispEnabled
IL_0220: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0225: brfalse.s IL_0234
IL_0227: ldarg.0
IL_0228: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mast
IL_022d: callvirt System.Boolean UnityEngine.GameObject::get_activeSelf()
IL_0232: br.s IL_0235
IL_0234: ldc.i4.0
IL_0235: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_023a: nop
IL_023b: ldarg.0
IL_023c: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mapTableUpgrade
IL_0241: dup
IL_0242: brtrue.s IL_0247
IL_0244: pop
IL_0245: br.s IL_026a
IL_0247: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::mapTableEnabled
IL_024c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0251: brfalse.s IL_0263
IL_0253: ldarg.0
IL_0254: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mapTable
IL_0259: callvirt System.Boolean UnityEngine.GameObject::get_activeSelf()
IL_025e: ldc.i4.0
IL_025f: ceq
IL_0261: br.s IL_0264
IL_0263: ldc.i4.0
IL_0264: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0269: nop
IL_026a: ldarg.0
IL_026b: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_tent
IL_0270: dup
IL_0271: brtrue.s IL_0276
IL_0273: pop
IL_0274: br.s IL_02ba
IL_0276: ldarg.0
IL_0277: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_customMast
IL_027c: brfalse.s IL_02b3
IL_027e: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::tentEnabled
IL_0283: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0288: brfalse.s IL_02b3
IL_028a: ldarg.0
IL_028b: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0290: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_tentUpgraded
IL_0295: ldc.i4.0
IL_0296: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_029b: brfalse.s IL_02b3
IL_029d: ldarg.0
IL_029e: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_02a3: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_tentDisabled
IL_02a8: ldc.i4.0
IL_02a9: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_02ae: ldc.i4.0
IL_02af: ceq
IL_02b1: br.s IL_02b4
IL_02b3: ldc.i4.0
IL_02b4: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_02b9: nop
IL_02ba: ldarg.0
IL_02bb: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_lantern
IL_02c0: dup
IL_02c1: brtrue.s IL_02c6
IL_02c3: pop
IL_02c4: br.s IL_030a
IL_02c6: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::lanternEnabled
IL_02cb: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_02d0: brfalse.s IL_0303
IL_02d2: ldarg.0
IL_02d3: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_customMast
IL_02d8: brfalse.s IL_0303
IL_02da: ldarg.0
IL_02db: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_02e0: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_lanternUpgraded
IL_02e5: ldc.i4.0
IL_02e6: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_02eb: brfalse.s IL_0303
IL_02ed: ldarg.0
IL_02ee: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_02f3: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_lanternDisabled
IL_02f8: ldc.i4.0
IL_02f9: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_02fe: ldc.i4.0
IL_02ff: ceq
IL_0301: br.s IL_0304
IL_0303: ldc.i4.0
IL_0304: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0309: nop
IL_030a: ldarg.0
IL_030b: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_holdersRight
IL_0310: dup
IL_0311: brtrue.s IL_0316
IL_0313: pop
IL_0314: br.s IL_0322
IL_0316: ldarg.0
IL_0317: call System.Boolean LongshipUpgrades.LongshipCustomizableParts::IsTentActive()
IL_031c: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0321: nop
IL_0322: ldarg.0
IL_0323: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_holdersLeft
IL_0328: dup
IL_0329: brtrue.s IL_032e
IL_032b: pop
IL_032c: br.s IL_033a
IL_032e: ldarg.0
IL_032f: call System.Boolean LongshipUpgrades.LongshipCustomizableParts::IsTentActive()
IL_0334: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0339: nop
IL_033a: ldarg.0
IL_033b: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::tentHeat
IL_0340: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0345: brfalse.s IL_0369
IL_0347: ldarg.0
IL_0348: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_lantern
IL_034d: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0352: brfalse.s IL_0369
IL_0354: ldarg.0
IL_0355: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_lantern
IL_035a: callvirt System.Boolean UnityEngine.GameObject::get_activeInHierarchy()
IL_035f: brfalse.s IL_0369
IL_0361: ldarg.0
IL_0362: call System.Boolean LongshipUpgrades.LongshipCustomizableParts::IsTentActive()
IL_0367: br.s IL_036a
IL_0369: ldc.i4.0
IL_036a: call System.Void LongshipUpgrades.LongshipCustomizableParts::UpdateFireWarmth(System.Boolean)
IL_036f: nop
IL_0370: ldarg.0
IL_0371: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_turretsUpgrade
IL_0376: dup
IL_0377: brtrue.s IL_037c
IL_0379: pop
IL_037a: br.s IL_038c
IL_037c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::turretsEnabled
IL_0381: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0386: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_038b: nop
IL_038c: ldarg.0
IL_038d: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_turrets
IL_0392: dup
IL_0393: brtrue.s IL_0398
IL_0395: pop
IL_0396: br.s IL_03be
IL_0398: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::turretsEnabled
IL_039d: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_03a2: brfalse.s IL_03b7
IL_03a4: ldarg.0
IL_03a5: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_03aa: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_turretsUpgraded
IL_03af: ldc.i4.0
IL_03b0: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_03b5: br.s IL_03b8
IL_03b7: ldc.i4.0
IL_03b8: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_03bd: nop
IL_03be: ldarg.0
IL_03bf: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_itemstandObject
IL_03c4: dup
IL_03c5: brtrue.s IL_03ca
IL_03c7: pop
IL_03c8: br.s IL_03da
IL_03ca: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::itemStandEnabled
IL_03cf: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_03d4: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_03d9: nop
IL_03da: ldc.i4.0
IL_03db: stloc.0
IL_03dc: ldarg.0
IL_03dd: ldfld UnityEngine.Light LongshipUpgrades.LongshipCustomizableParts::m_light
IL_03e2: ldnull
IL_03e3: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_03e8: brfalse.s IL_0444
IL_03ea: ldarg.0
IL_03eb: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_lantern
IL_03f0: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_03f5: brfalse.s IL_0444
IL_03f7: ldarg.0
IL_03f8: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_lantern
IL_03fd: callvirt System.Boolean UnityEngine.GameObject::get_activeInHierarchy()
IL_0402: brfalse.s IL_0444
IL_0404: ldarg.0
IL_0405: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_isLampLightDisabled
IL_040a: ldarg.0
IL_040b: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0410: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_lightsDisabled
IL_0415: ldc.i4.0
IL_0416: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_041b: bne.un.s IL_0441
IL_041d: ldsfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::isTimeToLight
IL_0422: call System.Boolean LongshipUpgrades.LongshipCustomizableParts::IsTimeToLight()
IL_0427: ceq
IL_0429: ldc.i4.0
IL_042a: ceq
IL_042c: dup
IL_042d: stloc.0
IL_042e: brtrue.s IL_0441
IL_0430: ldsfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::isNightTime
IL_0435: call System.Boolean LongshipUpgrades.LongshipCustomizableParts::IsNightTime()
IL_043a: ceq
IL_043c: ldc.i4.0
IL_043d: ceq
IL_043f: br.s IL_0442
IL_0441: ldc.i4.1
IL_0442: br.s IL_0445
IL_0444: ldc.i4.0
IL_0445: stloc.s V_4
IL_0447: ldloc.s V_4
IL_0449: brfalse.s IL_04c7
IL_044b: nop
IL_044c: call System.Boolean LongshipUpgrades.LongshipCustomizableParts::IsNightTime()
IL_0451: stsfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::isNightTime
IL_0456: call System.Boolean LongshipUpgrades.LongshipCustomizableParts::IsTimeToLight()
IL_045b: stsfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::isTimeToLight
IL_0460: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::lanternAutoSwtich
IL_0465: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_046a: ldloc.0
IL_046b: and
IL_046c: brfalse.s IL_0488
IL_046e: ldarg.0
IL_046f: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0474: callvirt System.Boolean ZNetView::IsValid()
IL_0479: brfalse.s IL_0488
IL_047b: ldarg.0
IL_047c: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0481: callvirt System.Boolean ZNetView::IsOwner()
IL_0486: br.s IL_0489
IL_0488: ldc.i4.0
IL_0489: stloc.s V_5
IL_048b: ldloc.s V_5
IL_048d: brfalse.s IL_04a8
IL_048f: ldarg.0
IL_0490: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0495: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_lightsDisabled
IL_049a: ldsfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::isTimeToLight
IL_049f: ldc.i4.0
IL_04a0: ceq
IL_04a2: callvirt System.Void ZDO::Set(System.Int32,System.Boolean)
IL_04a7: nop
IL_04a8: ldarg.0
IL_04a9: ldarg.0
IL_04aa: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_04af: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_lightsDisabled
IL_04b4: ldc.i4.0
IL_04b5: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_04ba: stfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_isLampLightDisabled
IL_04bf: ldarg.0
IL_04c0: call System.Void LongshipUpgrades.LongshipCustomizableParts::UpdateLights()
IL_04c5: nop
IL_04c6: nop
IL_04c7: ldarg.0
IL_04c8: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamMesh
IL_04cd: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_04d2: stloc.s V_6
IL_04d4: ldloc.s V_6
IL_04d6: brfalse IL_05ad
IL_04db: nop
IL_04dc: ldarg.0
IL_04dd: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamMesh
IL_04e2: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_04e7: ldc.r4 0
IL_04ec: ldc.r4 0
IL_04f1: ldarg.0
IL_04f2: call System.Boolean LongshipUpgrades.LongshipCustomizableParts::IsTentActive()
IL_04f7: brtrue.s IL_0500
IL_04f9: ldc.r4 -0.9
IL_04fe: br.s IL_0505
IL_0500: ldc.r4 0
IL_0505: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_050a: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_050f: nop
IL_0510: ldarg.0
IL_0511: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamMesh
IL_0516: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_051b: ldc.r4 1
IL_0520: ldc.r4 1
IL_0525: ldarg.0
IL_0526: call System.Boolean LongshipUpgrades.LongshipCustomizableParts::IsTentActive()
IL_052b: brtrue.s IL_0534
IL_052d: ldc.r4 0.5
IL_0532: br.s IL_0539
IL_0534: ldc.r4 1
IL_0539: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_053e: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_0543: nop
IL_0544: ldarg.0
IL_0545: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamTentCollider
IL_054a: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_054f: ldc.r4 0
IL_0554: ldc.r4 1.58
IL_0559: ldarg.0
IL_055a: call System.Boolean LongshipUpgrades.LongshipCustomizableParts::IsTentActive()
IL_055f: brtrue.s IL_0568
IL_0561: ldc.r4 -0.49
IL_0566: br.s IL_056d
IL_0568: ldc.r4 0.23
IL_056d: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0572: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_0577: nop
IL_0578: ldarg.0
IL_0579: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamTentCollider
IL_057e: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0583: ldc.r4 0.16
IL_0588: ldc.r4 0.16
IL_058d: ldarg.0
IL_058e: call System.Boolean LongshipUpgrades.LongshipCustomizableParts::IsTentActive()
IL_0593: brtrue.s IL_059c
IL_0595: ldc.r4 0.6
IL_059a: br.s IL_05a1
IL_059c: ldc.r4 2.05
IL_05a1: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_05a6: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_05ab: nop
IL_05ac: nop
IL_05ad: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::containerEnabled
IL_05b2: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_05b7: brfalse.s IL_05e4
IL_05b9: ldarg.0
IL_05ba: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_storageUpgrade
IL_05bf: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_05c4: brfalse.s IL_05e4
IL_05c6: ldarg.0
IL_05c7: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_containerUpgradedLvl2
IL_05cc: ldarg.0
IL_05cd: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_05d2: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_containerUpgradedLvl2
IL_05d7: ldc.i4.0
IL_05d8: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_05dd: ceq
IL_05df: ldc.i4.0
IL_05e0: ceq
IL_05e2: br.s IL_05e5
IL_05e4: ldc.i4.0
IL_05e5: stloc.s V_7
IL_05e7: ldloc.s V_7
IL_05e9: brfalse IL_077d
IL_05ee: nop
IL_05ef: ldarg.0
IL_05f0: ldarg.0
IL_05f1: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_05f6: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_containerUpgradedLvl2
IL_05fb: ldc.i4.0
IL_05fc: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_0601: stfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_containerUpgradedLvl2
IL_0606: ldarg.0
IL_0607: ldfld UnityEngine.GameObject[] LongshipUpgrades.LongshipCustomizableParts::m_containerPartsLvl2
IL_060c: dup
IL_060d: brtrue.s IL_0612
IL_060f: pop
IL_0610: br.s IL_0624
IL_0612: ldarg.0
IL_0613: ldftn System.Void LongshipUpgrades.LongshipCustomizableParts::<FixedUpdate>b__118_0(UnityEngine.GameObject)
IL_0619: newobj System.Void System.Action`1<UnityEngine.GameObject>::.ctor(System.Object,System.IntPtr)
IL_061e: call System.Void HarmonyLib.CollectionExtensions::Do<UnityEngine.GameObject>(System.Collections.Generic.IEnumerable`1<!!0>,System.Action`1<!!0>)
IL_0623: nop
IL_0624: ldarg.0
IL_0625: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_containerUpgradedLvl2
IL_062a: brfalse.s IL_0645
IL_062c: ldarg.0
IL_062d: ldfld Container LongshipUpgrades.LongshipCustomizableParts::m_container
IL_0632: ldfld System.Int32 Container::m_height
IL_0637: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerHeight
IL_063c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0641: clt
IL_0643: br.s IL_0646
IL_0645: ldc.i4.0
IL_0646: stloc.s V_8
IL_0648: ldloc.s V_8
IL_064a: brfalse.s IL_06c7
IL_064c: nop
IL_064d: ldarg.0
IL_064e: ldfld Container LongshipUpgrades.LongshipCustomizableParts::m_container
IL_0653: callvirt System.Type System.Object::GetType()
IL_0658: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_065d: stloc.s V_9
IL_065f: ldarg.0
IL_0660: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0665: ldstr "HasFields"
IL_066a: ldc.i4.1
IL_066b: callvirt System.Void ZDO::Set(System.String,System.Boolean)
IL_0670: nop
IL_0671: ldarg.0
IL_0672: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0677: ldstr "HasFields"
IL_067c: ldloc.s V_9
IL_067e: call System.String System.String::Concat(System.String,System.String)
IL_0683: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0688: ldc.i4.1
IL_0689: callvirt System.Void ZDO::Set(System.Int32,System.Boolean)
IL_068e: nop
IL_068f: ldarg.0
IL_0690: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0695: ldloc.s V_9
IL_0697: ldstr ".m_height"
IL_069c: call System.String System.String::Concat(System.String,System.String)
IL_06a1: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerHeight
IL_06a6: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_06ab: callvirt System.Void ZDO::Set(System.String,System.Int32)
IL_06b0: nop
IL_06b1: ldarg.0
IL_06b2: ldfld Container LongshipUpgrades.LongshipCustomizableParts::m_container
IL_06b7: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerHeight
IL_06bc: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_06c1: stfld System.Int32 Container::m_height
IL_06c6: nop
IL_06c7: ldarg.0
IL_06c8: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_containerUpgradedLvl2
IL_06cd: brfalse.s IL_06ed
IL_06cf: ldarg.0
IL_06d0: ldfld Container LongshipUpgrades.LongshipCustomizableParts::m_container
IL_06d5: callvirt Inventory Container::GetInventory()
IL_06da: callvirt System.Int32 Inventory::GetHeight()
IL_06df: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerHeight
IL_06e4: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_06e9: clt
IL_06eb: br.s IL_06ee
IL_06ed: ldc.i4.0
IL_06ee: stloc.s V_10
IL_06f0: ldloc.s V_10
IL_06f2: brfalse IL_077c
IL_06f7: nop
IL_06f8: ldarg.0
IL_06f9: ldfld Container LongshipUpgrades.LongshipCustomizableParts::m_container
IL_06fe: callvirt Inventory Container::GetInventory()
IL_0703: callvirt System.Type System.Object::GetType()
IL_0708: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_070d: stloc.s V_11
IL_070f: ldarg.0
IL_0710: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0715: ldstr "HasFields"
IL_071a: ldc.i4.1
IL_071b: callvirt System.Void ZDO::Set(System.String,System.Boolean)
IL_0720: nop
IL_0721: ldarg.0
IL_0722: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0727: ldstr "HasFields"
IL_072c: ldloc.s V_11
IL_072e: call System.String System.String::Concat(System.String,System.String)
IL_0733: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0738: ldc.i4.1
IL_0739: callvirt System.Void ZDO::Set(System.Int32,System.Boolean)
IL_073e: nop
IL_073f: ldarg.0
IL_0740: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0745: ldloc.s V_11
IL_0747: ldstr ".m_height"
IL_074c: call System.String System.String::Concat(System.String,System.String)
IL_0751: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerHeight
IL_0756: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_075b: callvirt System.Void ZDO::Set(System.String,System.Int32)
IL_0760: nop
IL_0761: ldarg.0
IL_0762: ldfld Container LongshipUpgrades.LongshipCustomizableParts::m_container
IL_0767: callvirt Inventory Container::GetInventory()
IL_076c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerHeight
IL_0771: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0776: stfld System.Int32 Inventory::m_height
IL_077b: nop
IL_077c: nop
IL_077d: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::containerEnabled
IL_0782: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0787: brfalse.s IL_07b4
IL_0789: ldarg.0
IL_078a: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_storageUpgrade
IL_078f: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0794: brfalse.s IL_07b4
IL_0796: ldarg.0
IL_0797: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_containerUpgradedLvl1
IL_079c: ldarg.0
IL_079d: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_07a2: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_containerUpgradedLvl1
IL_07a7: ldc.i4.0
IL_07a8: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_07ad: ceq
IL_07af: ldc.i4.0
IL_07b0: ceq
IL_07b2: br.s IL_07b5
IL_07b4: ldc.i4.0
IL_07b5: stloc.s V_12
IL_07b7: ldloc.s V_12
IL_07b9: brfalse IL_094d
IL_07be: nop
IL_07bf: ldarg.0
IL_07c0: ldarg.0
IL_07c1: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_07c6: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_containerUpgradedLvl1
IL_07cb: ldc.i4.0
IL_07cc: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_07d1: stfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_containerUpgradedLvl1
IL_07d6: ldarg.0
IL_07d7: ldfld UnityEngine.GameObject[] LongshipUpgrades.LongshipCustomizableParts::m_containerPartsLvl1
IL_07dc: dup
IL_07dd: brtrue.s IL_07e2
IL_07df: pop
IL_07e0: br.s IL_07f4
IL_07e2: ldarg.0
IL_07e3: ldftn System.Void LongshipUpgrades.LongshipCustomizableParts::<FixedUpdate>b__118_1(UnityEngine.GameObject)
IL_07e9: newobj System.Void System.Action`1<UnityEngine.GameObject>::.ctor(System.Object,System.IntPtr)
IL_07ee: call System.Void HarmonyLib.CollectionExtensions::Do<UnityEngine.GameObject>(System.Collections.Generic.IEnumerable`1<!!0>,System.Action`1<!!0>)
IL_07f3: nop
IL_07f4: ldarg.0
IL_07f5: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_containerUpgradedLvl1
IL_07fa: brfalse.s IL_0815
IL_07fc: ldarg.0
IL_07fd: ldfld Container LongshipUpgrades.LongshipCustomizableParts::m_container
IL_0802: ldfld System.Int32 Container::m_width
IL_0807: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerWidth
IL_080c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0811: clt
IL_0813: br.s IL_0816
IL_0815: ldc.i4.0
IL_0816: stloc.s V_13
IL_0818: ldloc.s V_13
IL_081a: brfalse.s IL_0897
IL_081c: nop
IL_081d: ldarg.0
IL_081e: ldfld Container LongshipUpgrades.LongshipCustomizableParts::m_container
IL_0823: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerWidth
IL_0828: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_082d: stfld System.Int32 Container::m_width
IL_0832: ldarg.0
IL_0833: ldfld Container LongshipUpgrades.LongshipCustomizableParts::m_container
IL_0838: callvirt System.Type System.Object::GetType()
IL_083d: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_0842: stloc.s V_14
IL_0844: ldarg.0
IL_0845: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_084a: ldstr "HasFields"
IL_084f: ldc.i4.1
IL_0850: callvirt System.Void ZDO::Set(System.String,System.Boolean)
IL_0855: nop
IL_0856: ldarg.0
IL_0857: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_085c: ldstr "HasFields"
IL_0861: ldloc.s V_14
IL_0863: call System.String System.String::Concat(System.String,System.String)
IL_0868: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_086d: ldc.i4.1
IL_086e: callvirt System.Void ZDO::Set(System.Int32,System.Boolean)
IL_0873: nop
IL_0874: ldarg.0
IL_0875: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_087a: ldloc.s V_14
IL_087c: ldstr ".m_width"
IL_0881: call System.String System.String::Concat(System.String,System.String)
IL_0886: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerWidth
IL_088b: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0890: callvirt System.Void ZDO::Set(System.String,System.Int32)
IL_0895: nop
IL_0896: nop
IL_0897: ldarg.0
IL_0898: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_containerUpgradedLvl1
IL_089d: brfalse.s IL_08bd
IL_089f: ldarg.0
IL_08a0: ldfld Container LongshipUpgrades.LongshipCustomizableParts::m_container
IL_08a5: callvirt Inventory Container::GetInventory()
IL_08aa: callvirt System.Int32 Inventory::GetWidth()
IL_08af: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerWidth
IL_08b4: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_08b9: clt
IL_08bb: br.s IL_08be
IL_08bd: ldc.i4.0
IL_08be: stloc.s V_15
IL_08c0: ldloc.s V_15
IL_08c2: brfalse IL_094c
IL_08c7: nop
IL_08c8: ldarg.0
IL_08c9: ldfld Container LongshipUpgrades.LongshipCustomizableParts::m_container
IL_08ce: callvirt Inventory Container::GetInventory()
IL_08d3: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerWidth
IL_08d8: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_08dd: stfld System.Int32 Inventory::m_width
IL_08e2: ldarg.0
IL_08e3: ldfld Container LongshipUpgrades.LongshipCustomizableParts::m_container
IL_08e8: callvirt Inventory Container::GetInventory()
IL_08ed: callvirt System.Type System.Object::GetType()
IL_08f2: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_08f7: stloc.s V_16
IL_08f9: ldarg.0
IL_08fa: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_08ff: ldstr "HasFields"
IL_0904: ldc.i4.1
IL_0905: callvirt System.Void ZDO::Set(System.String,System.Boolean)
IL_090a: nop
IL_090b: ldarg.0
IL_090c: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0911: ldstr "HasFields"
IL_0916: ldloc.s V_16
IL_0918: call System.String System.String::Concat(System.String,System.String)
IL_091d: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0922: ldc.i4.1
IL_0923: callvirt System.Void ZDO::Set(System.Int32,System.Boolean)
IL_0928: nop
IL_0929: ldarg.0
IL_092a: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_092f: ldloc.s V_16
IL_0931: ldstr ".m_width"
IL_0936: call System.String System.String::Concat(System.String,System.String)
IL_093b: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerWidth
IL_0940: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0945: callvirt System.Void ZDO::Set(System.String,System.Int32)
IL_094a: nop
IL_094b: nop
IL_094c: nop
IL_094d: ldarg.0
IL_094e: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_storageUpgrade
IL_0953: dup
IL_0954: brtrue.s IL_0959
IL_0956: pop
IL_0957: br.s IL_0977
IL_0959: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::containerEnabled
IL_095e: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0963: brfalse.s IL_0970
IL_0965: ldarg.0
IL_0966: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_containerUpgradedLvl2
IL_096b: ldc.i4.0
IL_096c: ceq
IL_096e: br.s IL_0971
IL_0970: ldc.i4.0
IL_0971: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0976: nop
IL_0977: ldc.i4.0
IL_0978: stloc.1
IL_0979: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::healthEnabled
IL_097e: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0983: brfalse.s IL_09b8
IL_0985: ldarg.0
IL_0986: ldfld UnityEngine.GameObject[] LongshipUpgrades.LongshipCustomizableParts::m_protectiveParts
IL_098b: brfalse.s IL_09b8
IL_098d: ldarg.0
IL_098e: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_0993: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0998: brfalse.s IL_09b8
IL_099a: ldarg.0
IL_099b: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_healthUpgraded
IL_09a0: ldarg.0
IL_09a1: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_09a6: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_healthUpgraded
IL_09ab: ldc.i4.0
IL_09ac: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_09b1: ceq
IL_09b3: ldc.i4.0
IL_09b4: ceq
IL_09b6: br.s IL_09b9
IL_09b8: ldc.i4.0
IL_09b9: stloc.s V_17
IL_09bb: ldloc.s V_17
IL_09bd: brfalse.s IL_0a33
IL_09bf: nop
IL_09c0: ldarg.0
IL_09c1: ldarg.0
IL_09c2: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_09c7: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_healthUpgraded
IL_09cc: ldc.i4.0
IL_09cd: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_09d2: stfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_healthUpgraded
IL_09d7: ldarg.0
IL_09d8: ldfld UnityEngine.GameObject[] LongshipUpgrades.LongshipCustomizableParts::m_protectiveParts
IL_09dd: ldarg.0
IL_09de: ldftn System.Void LongshipUpgrades.LongshipCustomizableParts::<FixedUpdate>b__118_2(UnityEngine.GameObject)
IL_09e4: newobj System.Void System.Action`1<UnityEngine.GameObject>::.ctor(System.Object,System.IntPtr)
IL_09e9: call System.Void HarmonyLib.CollectionExtensions::Do<UnityEngine.GameObject>(System.Collections.Generic.IEnumerable`1<!!0>,System.Action`1<!!0>)
IL_09ee: nop
IL_09ef: ldarg.0
IL_09f0: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_healthUpgraded
IL_09f5: brfalse.s IL_0a11
IL_09f7: ldarg.0
IL_09f8: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_09fd: ldfld System.Single WearNTear::m_health
IL_0a02: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::healthUpgradeLvl1
IL_0a07: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0a0c: conv.r4
IL_0a0d: clt
IL_0a0f: br.s IL_0a12
IL_0a11: ldc.i4.0
IL_0a12: stloc.s V_18
IL_0a14: ldloc.s V_18
IL_0a16: brfalse.s IL_0a32
IL_0a18: nop
IL_0a19: ldarg.0
IL_0a1a: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_0a1f: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::healthUpgradeLvl1
IL_0a24: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0a29: conv.r4
IL_0a2a: stfld System.Single WearNTear::m_health
IL_0a2f: ldc.i4.1
IL_0a30: stloc.1
IL_0a31: nop
IL_0a32: nop
IL_0a33: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::healthEnabled
IL_0a38: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0a3d: brfalse.s IL_0a4c
IL_0a3f: ldarg.0
IL_0a40: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_0a45: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0a4a: br.s IL_0a4d
IL_0a4c: ldc.i4.0
IL_0a4d: stloc.s V_19
IL_0a4f: ldloc.s V_19
IL_0a51: brfalse IL_0c80
IL_0a56: nop
IL_0a57: ldarg.0
IL_0a58: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_ashlandsUpgraded
IL_0a5d: ldarg.0
IL_0a5e: ldarg.0
IL_0a5f: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0a64: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_ashlandsUpgraded
IL_0a69: ldc.i4.0
IL_0a6a: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_0a6f: dup
IL_0a70: stloc.s V_21
IL_0a72: stfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_ashlandsUpgraded
IL_0a77: ldloc.s V_21
IL_0a79: ceq
IL_0a7b: ldc.i4.0
IL_0a7c: ceq
IL_0a7e: stloc.s V_20
IL_0a80: ldloc.s V_20
IL_0a82: brfalse IL_0ba5
IL_0a87: nop
IL_0a88: ldarg.0
IL_0a89: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_ashlandsUpgraded
IL_0a8e: brfalse.s IL_0a9f
IL_0a90: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::healthUpgradeLvl2
IL_0a95: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0a9a: ldc.i4.0
IL_0a9b: cgt
IL_0a9d: br.s IL_0aa0
IL_0a9f: ldc.i4.0
IL_0aa0: stloc.s V_23
IL_0aa2: ldloc.s V_23
IL_0aa4: brfalse.s IL_0ae0
IL_0aa6: nop
IL_0aa7: ldarg.0
IL_0aa8: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_0aad: ldfld System.Single WearNTear::m_health
IL_0ab2: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::healthUpgradeLvl2
IL_0ab7: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0abc: conv.r4
IL_0abd: clt
IL_0abf: stloc.s V_24
IL_0ac1: ldloc.s V_24
IL_0ac3: brfalse.s IL_0adf
IL_0ac5: nop
IL_0ac6: ldarg.0
IL_0ac7: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_0acc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::healthUpgradeLvl2
IL_0ad1: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0ad6: conv.r4
IL_0ad7: stfld System.Single WearNTear::m_health
IL_0adc: ldc.i4.1
IL_0add: stloc.1
IL_0ade: nop
IL_0adf: nop
IL_0ae0: ldarg.0
IL_0ae1: ldfld Ship LongshipUpgrades.LongshipCustomizableParts::m_ship
IL_0ae6: callvirt System.Type System.Object::GetType()
IL_0aeb: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_0af0: stloc.s V_22
IL_0af2: ldarg.0
IL_0af3: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0af8: ldstr "HasFields"
IL_0afd: ldc.i4.1
IL_0afe: callvirt System.Void ZDO::Set(System.String,System.Boolean)
IL_0b03: nop
IL_0b04: ldarg.0
IL_0b05: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0b0a: ldstr "HasFields"
IL_0b0f: ldloc.s V_22
IL_0b11: call System.String System.String::Concat(System.String,System.String)
IL_0b16: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0b1b: ldc.i4.1
IL_0b1c: callvirt System.Void ZDO::Set(System.Int32,System.Boolean)
IL_0b21: nop
IL_0b22: ldarg.0
IL_0b23: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0b28: ldloc.s V_22
IL_0b2a: ldstr ".m_ashlandsReady"
IL_0b2f: call System.String System.String::Concat(System.String,System.String)
IL_0b34: ldc.i4.1
IL_0b35: callvirt System.Void ZDO::Set(System.String,System.Boolean)
IL_0b3a: nop
IL_0b3b: ldarg.0
IL_0b3c: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_0b41: callvirt System.Type System.Object::GetType()
IL_0b46: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_0b4b: stloc.s V_22
IL_0b4d: ldarg.0
IL_0b4e: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0b53: ldstr "HasFields"
IL_0b58: ldloc.s V_22
IL_0b5a: call System.String System.String::Concat(System.String,System.String)
IL_0b5f: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0b64: ldc.i4.1
IL_0b65: callvirt System.Void ZDO::Set(System.Int32,System.Boolean)
IL_0b6a: nop
IL_0b6b: ldarg.0
IL_0b6c: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0b71: ldloc.s V_22
IL_0b73: ldstr ".m_ashDamageResist"
IL_0b78: call System.String System.String::Concat(System.String,System.String)
IL_0b7d: ldc.i4.1
IL_0b7e: callvirt System.Void ZDO::Set(System.String,System.Boolean)
IL_0b83: nop
IL_0b84: ldarg.0
IL_0b85: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0b8a: ldloc.s V_22
IL_0b8c: ldstr ".m_burnable"
IL_0b91: call System.String System.String::Concat(System.String,System.String)
IL_0b96: ldc.i4.0
IL_0b97: callvirt System.Void ZDO::Set(System.String,System.Boolean)
IL_0b9c: nop
IL_0b9d: ldarg.0
IL_0b9e: call System.Void LongshipUpgrades.LongshipCustomizableParts::UpdateHullPropertyBlocks()
IL_0ba3: nop
IL_0ba4: nop
IL_0ba5: ldarg.0
IL_0ba6: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_ashlandsUpgraded
IL_0bab: brfalse.s IL_0bb9
IL_0bad: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::ashlandsProtection
IL_0bb2: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0bb7: br.s IL_0bba
IL_0bb9: ldc.i4.0
IL_0bba: stloc.s V_25
IL_0bbc: ldloc.s V_25
IL_0bbe: brfalse IL_0c7f
IL_0bc3: nop
IL_0bc4: ldarg.0
IL_0bc5: ldfld Ship LongshipUpgrades.LongshipCustomizableParts::m_ship
IL_0bca: ldc.i4.1
IL_0bcb: stfld System.Boolean Ship::m_ashlandsReady
IL_0bd0: ldarg.0
IL_0bd1: ldfld Ship LongshipUpgrades.LongshipCustomizableParts::m_ship
IL_0bd6: ldc.r4 0
IL_0bdb: stfld System.Single Ship::m_ashlandsDmgTimer
IL_0be0: ldarg.0
IL_0be1: ldfld Ship LongshipUpgrades.LongshipCustomizableParts::m_ship
IL_0be6: ldfld UnityEngine.GameObject Ship::m_ashdamageEffects
IL_0beb: callvirt System.Boolean UnityEngine.GameObject::get_activeSelf()
IL_0bf0: stloc.s V_26
IL_0bf2: ldloc.s V_26
IL_0bf4: brfalse.s IL_0c3a
IL_0bf6: nop
IL_0bf7: ldarg.0
IL_0bf8: ldfld Ship LongshipUpgrades.LongshipCustomizableParts::m_ship
IL_0bfd: ldfld UnityEngine.GameObject Ship::m_ashdamageEffects
IL_0c02: ldc.i4.0
IL_0c03: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0c08: nop
IL_0c09: ldarg.0
IL_0c0a: ldfld Ship LongshipUpgrades.LongshipCustomizableParts::m_ship
IL_0c0f: ldfld System.Collections.Generic.List`1<UnityEngine.AudioSource> Ship::m_ashlandsFxAudio
IL_0c14: ldsfld System.Action`1<UnityEngine.AudioSource> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__118_3
IL_0c19: dup
IL_0c1a: brtrue.s IL_0c33
IL_0c1c: pop
IL_0c1d: ldsfld LongshipUpgrades.LongshipCustomizableParts/<>c LongshipUpgrades.LongshipCustomizableParts/<>c::<>9
IL_0c22: ldftn System.Void LongshipUpgrades.LongshipCustomizableParts/<>c::<FixedUpdate>b__118_3(UnityEngine.AudioSource)
IL_0c28: newobj System.Void System.Action`1<UnityEngine.AudioSource>::.ctor(System.Object,System.IntPtr)
IL_0c2d: dup
IL_0c2e: stsfld System.Action`1<UnityEngine.AudioSource> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__118_3
IL_0c33: call System.Void HarmonyLib.CollectionExtensions::Do<UnityEngine.AudioSource>(System.Collections.Generic.IEnumerable`1<!!0>,System.Action`1<!!0>)
IL_0c38: nop
IL_0c39: nop
IL_0c3a: ldarg.0
IL_0c3b: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_0c40: ldfld System.Boolean WearNTear::m_ashDamageResist
IL_0c45: ldc.i4.0
IL_0c46: ceq
IL_0c48: stloc.s V_27
IL_0c4a: ldloc.s V_27
IL_0c4c: brfalse.s IL_0c7e
IL_0c4e: nop
IL_0c4f: ldarg.0
IL_0c50: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_0c55: ldc.i4.1
IL_0c56: stfld System.Boolean WearNTear::m_ashDamageResist
IL_0c5b: ldarg.0
IL_0c5c: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_0c61: ldc.i4.0
IL_0c62: stfld System.Boolean WearNTear::m_burnable
IL_0c67: ldarg.0
IL_0c68: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_0c6d: ldflda HitData/DamageModifiers WearNTear::m_damages
IL_0c72: ldsfld System.Collections.Generic.List`1<HitData/DamageModPair> LongshipUpgrades.LongshipCustomizableParts::s_fireResistantModifiers
IL_0c77: call System.Void HitData/DamageModifiers::Apply(System.Collections.Generic.List`1<HitData/DamageModPair>)
IL_0c7c: nop
IL_0c7d: nop
IL_0c7e: nop
IL_0c7f: nop
IL_0c80: ldloc.1
IL_0c81: brfalse.s IL_0c9d
IL_0c83: ldarg.0
IL_0c84: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0c89: callvirt System.Boolean ZNetView::IsValid()
IL_0c8e: brfalse.s IL_0c9d
IL_0c90: ldarg.0
IL_0c91: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0c96: callvirt System.Boolean ZNetView::IsOwner()
IL_0c9b: br.s IL_0c9e
IL_0c9d: ldc.i4.0
IL_0c9e: stloc.s V_28
IL_0ca0: ldloc.s V_28
IL_0ca2: brfalse.s IL_0ce8
IL_0ca4: ldarg.0
IL_0ca5: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0caa: ldsfld System.Int64 ZNetView::Everybody
IL_0caf: ldstr "RPC_HealthChanged"
IL_0cb4: ldc.i4.1
IL_0cb5: newarr System.Object
IL_0cba: dup
IL_0cbb: ldc.i4.0
IL_0cbc: ldarg.0
IL_0cbd: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0cc2: callvirt ZDO ZNetView::GetZDO()
IL_0cc7: ldsfld System.Int32 ZDOVars::s_health
IL_0ccc: ldarg.0
IL_0ccd: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_0cd2: ldfld System.Single WearNTear::m_health
IL_0cd7: callvirt System.Single ZDO::GetFloat(System.Int32,System.Single)
IL_0cdc: box System.Single
IL_0ce1: stelem.ref
IL_0ce2: callvirt System.Void ZNetView::InvokeRPC(System.Int64,System.String,System.Object[])
IL_0ce7: nop
IL_0ce8: ldarg.0
IL_0ce9: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_healthUpgrade
IL_0cee: dup
IL_0cef: brtrue.s IL_0cf4
IL_0cf1: pop
IL_0cf2: br.s IL_0d12
IL_0cf4: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::healthEnabled
IL_0cf9: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0cfe: brfalse.s IL_0d0b
IL_0d00: ldarg.0
IL_0d01: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_ashlandsUpgraded
IL_0d06: ldc.i4.0
IL_0d07: ceq
IL_0d09: br.s IL_0d0c
IL_0d0b: ldc.i4.0
IL_0d0c: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0d11: nop
IL_0d12: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::changeShields
IL_0d17: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0d1c: brfalse.s IL_0d58
IL_0d1e: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::healthEnabled
IL_0d23: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0d28: brfalse.s IL_0d58
IL_0d2a: ldarg.0
IL_0d2b: ldfld UnityEngine.GameObject[] LongshipUpgrades.LongshipCustomizableParts::m_protectiveParts
IL_0d30: brfalse.s IL_0d58
IL_0d32: ldarg.0
IL_0d33: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_healthUpgraded
IL_0d38: brfalse.s IL_0d58
IL_0d3a: ldarg.0
IL_0d3b: ldfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_shieldsStyle
IL_0d40: ldarg.0
IL_0d41: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0d46: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_shieldsStyle
IL_0d4b: ldc.i4.0
IL_0d4c: callvirt System.Int32 ZDO::GetInt(System.Int32,System.Int32)
IL_0d51: ceq
IL_0d53: ldc.i4.0
IL_0d54: ceq
IL_0d56: br.s IL_0d59
IL_0d58: ldc.i4.0
IL_0d59: stloc.s V_29
IL_0d5b: ldloc.s V_29
IL_0d5d: brfalse IL_0df2
IL_0d62: nop
IL_0d63: ldarg.0
IL_0d64: ldarg.0
IL_0d65: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0d6a: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_shieldsStyle
IL_0d6f: ldc.i4.0
IL_0d70: callvirt System.Int32 ZDO::GetInt(System.Int32,System.Int32)
IL_0d75: stfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_shieldsStyle
IL_0d7a: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::maxShields
IL_0d7f: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0d84: brfalse.s IL_0db2
IL_0d86: ldarg.0
IL_0d87: ldfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_shieldsStyle
IL_0d8c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::maxShields
IL_0d91: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0d96: ble.s IL_0db2
IL_0d98: ldarg.0
IL_0d99: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0d9e: callvirt System.Boolean ZNetView::IsValid()
IL_0da3: brfalse.s IL_0db2
IL_0da5: ldarg.0
IL_0da6: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0dab: callvirt System.Boolean ZNetView::IsOwner()
IL_0db0: br.s IL_0db3
IL_0db2: ldc.i4.0
IL_0db3: stloc.s V_30
IL_0db5: ldloc.s V_30
IL_0db7: brfalse.s IL_0dea
IL_0db9: nop
IL_0dba: ldarg.0
IL_0dbb: ldarg.0
IL_0dbc: ldfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_shieldsStyle
IL_0dc1: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::maxShields
IL_0dc6: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0dcb: rem
IL_0dcc: stfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_shieldsStyle
IL_0dd1: ldarg.0
IL_0dd2: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0dd7: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_shieldsStyle
IL_0ddc: ldarg.0
IL_0ddd: ldfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_shieldsStyle
IL_0de2: ldc.i4.0
IL_0de3: callvirt System.Void ZDO::Set(System.Int32,System.Int32,System.Boolean)
IL_0de8: nop
IL_0de9: nop
IL_0dea: ldarg.0
IL_0deb: call System.Void LongshipUpgrades.LongshipCustomizableParts::UpdateShieldsPropertyBlocks()
IL_0df0: nop
IL_0df1: nop
IL_0df2: ldarg.0
IL_0df3: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_shieldsStyles
IL_0df8: dup
IL_0df9: brtrue.s IL_0dfe
IL_0dfb: pop
IL_0dfc: br.s IL_0e0a
IL_0dfe: ldarg.0
IL_0dff: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_healthUpgraded
IL_0e04: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0e09: nop
IL_0e0a: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::changeTent
IL_0e0f: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0e14: brfalse.s IL_0e3c
IL_0e16: ldarg.0
IL_0e17: call System.Boolean LongshipUpgrades.LongshipCustomizableParts::IsTentActive()
IL_0e1c: brfalse.s IL_0e3c
IL_0e1e: ldarg.0
IL_0e1f: ldfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_tentStyle
IL_0e24: ldarg.0
IL_0e25: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0e2a: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_tentStyle
IL_0e2f: ldc.i4.0
IL_0e30: callvirt System.Int32 ZDO::GetInt(System.Int32,System.Int32)
IL_0e35: ceq
IL_0e37: ldc.i4.0
IL_0e38: ceq
IL_0e3a: br.s IL_0e3d
IL_0e3c: ldc.i4.0
IL_0e3d: stloc.s V_31
IL_0e3f: ldloc.s V_31
IL_0e41: brfalse.s IL_0e63
IL_0e43: nop
IL_0e44: ldarg.0
IL_0e45: ldarg.0
IL_0e46: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0e4b: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_tentStyle
IL_0e50: ldc.i4.0
IL_0e51: callvirt System.Int32 ZDO::GetInt(System.Int32,System.Int32)
IL_0e56: stfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_tentStyle
IL_0e5b: ldarg.0
IL_0e5c: call System.Void LongshipUpgrades.LongshipCustomizableParts::UpdateTentPropertyBlocks()
IL_0e61: nop
IL_0e62: nop
IL_0e63: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::changeSail
IL_0e68: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0e6d: brfalse.s IL_0ea8
IL_0e6f: ldarg.0
IL_0e70: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_sail
IL_0e75: ldnull
IL_0e76: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0e7b: brfalse.s IL_0ea8
IL_0e7d: ldarg.0
IL_0e7e: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_sail
IL_0e83: callvirt System.Boolean UnityEngine.GameObject::get_activeInHierarchy()
IL_0e88: brfalse.s IL_0ea8
IL_0e8a: ldarg.0
IL_0e8b: ldfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_sailStyle
IL_0e90: ldarg.0
IL_0e91: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0e96: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_sailStyle
IL_0e9b: ldc.i4.0
IL_0e9c: callvirt System.Int32 ZDO::GetInt(System.Int32,System.Int32)
IL_0ea1: ceq
IL_0ea3: ldc.i4.0
IL_0ea4: ceq
IL_0ea6: br.s IL_0ea9
IL_0ea8: ldc.i4.0
IL_0ea9: stloc.s V_32
IL_0eab: ldloc.s V_32
IL_0ead: brfalse.s IL_0ecf
IL_0eaf: nop
IL_0eb0: ldarg.0
IL_0eb1: ldarg.0
IL_0eb2: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0eb7: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_sailStyle
IL_0ebc: ldc.i4.0
IL_0ebd: callvirt System.Int32 ZDO::GetInt(System.Int32,System.Int32)
IL_0ec2: stfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_sailStyle
IL_0ec7: ldarg.0
IL_0ec8: call System.Void LongshipUpgrades.LongshipCustomizableParts::UpdateSailPropertyBlocks()
IL_0ecd: nop
IL_0ece: nop
IL_0ecf: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::changeHead
IL_0ed4: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0ed9: brfalse.s IL_0f0e
IL_0edb: ldarg.0
IL_0edc: ldfld UnityEngine.GameObject[] LongshipUpgrades.LongshipCustomizableParts::m_heads
IL_0ee1: brfalse.s IL_0f0e
IL_0ee3: ldarg.0
IL_0ee4: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_0ee9: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0eee: brfalse.s IL_0f0e
IL_0ef0: ldarg.0
IL_0ef1: ldfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_headStyle
IL_0ef6: ldarg.0
IL_0ef7: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0efc: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_headStyle
IL_0f01: ldc.i4.0
IL_0f02: callvirt System.Int32 ZDO::GetInt(System.Int32,System.Int32)
IL_0f07: ceq
IL_0f09: ldc.i4.0
IL_0f0a: ceq
IL_0f0c: br.s IL_0f0f
IL_0f0e: ldc.i4.0
IL_0f0f: stloc.s V_33
IL_0f11: ldloc.s V_33
IL_0f13: brfalse IL_1003
IL_0f18: nop
IL_0f19: ldarg.0
IL_0f1a: ldarg.0
IL_0f1b: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0f20: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_headStyle
IL_0f25: ldc.i4.0
IL_0f26: callvirt System.Int32 ZDO::GetInt(System.Int32,System.Int32)
IL_0f2b: stfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_headStyle
IL_0f30: ldc.i4.0
IL_0f31: stloc.s V_34
IL_0f33: br.s IL_0f56
IL_0f35: ldarg.0
IL_0f36: ldfld UnityEngine.GameObject[] LongshipUpgrades.LongshipCustomizableParts::m_heads
IL_0f3b: ldloc.s V_34
IL_0f3d: ldelem.ref
IL_0f3e: ldarg.0
IL_0f3f: ldfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_headStyle
IL_0f44: ldloc.s V_34
IL_0f46: ldc.i4.1
IL_0f47: add
IL_0f48: ceq
IL_0f4a: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0f4f: nop
IL_0f50: ldloc.s V_34
IL_0f52: ldc.i4.1
IL_0f53: add
IL_0f54: stloc.s V_34
IL_0f56: ldloc.s V_34
IL_0f58: ldarg.0
IL_0f59: ldfld UnityEngine.GameObject[] LongshipUpgrades.LongshipCustomizableParts::m_heads
IL_0f5e: ldlen
IL_0f5f: conv.i4
IL_0f60: clt
IL_0f62: stloc.s V_35
IL_0f64: ldloc.s V_35
IL_0f66: brtrue.s IL_0f35
IL_0f68: nop
IL_0f69: ldc.i4.3
IL_0f6a: newarr UnityEngine.GameObject
IL_0f6f: dup
IL_0f70: ldc.i4.0
IL_0f71: ldarg.0
IL_0f72: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_0f77: ldfld UnityEngine.GameObject WearNTear::m_new
IL_0f7c: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0f81: ldstr "skull_head"
IL_0f86: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0f8b: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0f90: stelem.ref
IL_0f91: dup
IL_0f92: ldc.i4.1
IL_0f93: ldarg.0
IL_0f94: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_0f99: ldfld UnityEngine.GameObject WearNTear::m_worn
IL_0f9e: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0fa3: ldstr "skull_head"
IL_0fa8: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0fad: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0fb2: stelem.ref
IL_0fb3: dup
IL_0fb4: ldc.i4.2
IL_0fb5: ldarg.0
IL_0fb6: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_0fbb: ldfld UnityEngine.GameObject WearNTear::m_broken
IL_0fc0: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0fc5: ldstr "skull_head"
IL_0fca: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0fcf: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0fd4: stelem.ref
IL_0fd5: stloc.s V_36
IL_0fd7: ldc.i4.0
IL_0fd8: stloc.s V_37
IL_0fda: br.s IL_0ffa
IL_0fdc: ldloc.s V_36
IL_0fde: ldloc.s V_37
IL_0fe0: ldelem.ref
IL_0fe1: stloc.s V_38
IL_0fe3: ldloc.s V_38
IL_0fe5: ldarg.0
IL_0fe6: ldfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_headStyle
IL_0feb: ldc.i4.0
IL_0fec: ceq
IL_0fee: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0ff3: nop
IL_0ff4: ldloc.s V_37
IL_0ff6: ldc.i4.1
IL_0ff7: add
IL_0ff8: stloc.s V_37
IL_0ffa: ldloc.s V_37
IL_0ffc: ldloc.s V_36
IL_0ffe: ldlen
IL_0fff: conv.i4
IL_1000: blt.s IL_0fdc
IL_1002: nop
IL_1003: ldarg.0
IL_1004: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_headStyles
IL_1009: dup
IL_100a: brtrue.s IL_100f
IL_100c: pop
IL_100d: br.s IL_101f
IL_100f: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::changeHead
IL_1014: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_1019: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_101e: nop
IL_101f: ldarg.0
IL_1020: call System.Void LongshipUpgrades.LongshipCustomizableParts::SetPropertyBlocks()
IL_1025: nop
IL_1026: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::UpdateFireWarmth(System.Boolean)
.locals UnityEngine.Collider, System.Collections.Generic.List`1<Character>, Player, System.Boolean, System.Boolean, System.Int32, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld EffectArea LongshipUpgrades.LongshipCustomizableParts::m_fireWarmth
IL_0007: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000c: ldc.i4.0
IL_000d: ceq
IL_000f: stloc.3
IL_0010: ldloc.3
IL_0011: brfalse.s IL_0018
IL_0013: br IL_00f4
IL_0018: ldarg.0
IL_0019: ldfld EffectArea LongshipUpgrades.LongshipCustomizableParts::m_fireWarmth
IL_001e: ldfld UnityEngine.Collider EffectArea::m_collider
IL_0023: stloc.0
IL_0024: ldarg.1
IL_0025: brfalse.s IL_0044
IL_0027: ldarg.0
IL_0028: ldfld EffectArea LongshipUpgrades.LongshipCustomizableParts::m_fireWarmth
IL_002d: callvirt System.Boolean UnityEngine.Behaviour::get_isActiveAndEnabled()
IL_0032: brfalse.s IL_0044
IL_0034: ldloc.0
IL_0035: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_003a: brfalse.s IL_0044
IL_003c: ldloc.0
IL_003d: callvirt System.Boolean UnityEngine.Collider::get_enabled()
IL_0042: br.s IL_0045
IL_0044: ldc.i4.0
IL_0045: starg.s heatActive
IL_0047: ldarg.0
IL_0048: ldfld EffectArea LongshipUpgrades.LongshipCustomizableParts::m_fireWarmth
IL_004d: ldarg.1
IL_004e: stfld System.Boolean EffectArea::m_isHeatType
IL_0053: ldarg.0
IL_0054: ldfld EffectArea LongshipUpgrades.LongshipCustomizableParts::m_fireWarmth
IL_0059: ldarg.1
IL_005a: brtrue.s IL_005f
IL_005c: ldc.i4.0
IL_005d: br.s IL_0060
IL_005f: ldc.i4.3
IL_0060: stfld EffectArea/Type EffectArea::m_type
IL_0065: ldarg.0
IL_0066: ldfld EffectArea LongshipUpgrades.LongshipCustomizableParts::m_fireWarmth
IL_006b: ldfld System.Collections.Generic.List`1<Character> EffectArea::m_collidedWithCharacter
IL_0070: stloc.1
IL_0071: ldarg.1
IL_0072: ldc.i4.0
IL_0073: ceq
IL_0075: stloc.s V_4
IL_0077: ldloc.s V_4
IL_0079: brfalse.s IL_0085
IL_007b: nop
IL_007c: ldloc.1
IL_007d: callvirt System.Void System.Collections.Generic.List`1<Character>::Clear()
IL_0082: nop
IL_0083: br.s IL_00f4
IL_0085: ldloc.1
IL_0086: callvirt System.Int32 System.Collections.Generic.List`1<Character>::get_Count()
IL_008b: ldc.i4.1
IL_008c: sub
IL_008d: stloc.s V_5
IL_008f: br.s IL_00b7
IL_0091: ldloc.1
IL_0092: ldloc.s V_5
IL_0094: callvirt !0 System.Collections.Generic.List`1<Character>::get_Item(System.Int32)
IL_0099: ldloc.0
IL_009a: call System.Boolean LongshipUpgrades.LongshipCustomizableParts::IsInsideFireWarmth(Character,UnityEngine.Collider)
IL_009f: ldc.i4.0
IL_00a0: ceq
IL_00a2: stloc.s V_6
IL_00a4: ldloc.s V_6
IL_00a6: brfalse.s IL_00b1
IL_00a8: ldloc.1
IL_00a9: ldloc.s V_5
IL_00ab: callvirt System.Void System.Collections.Generic.List`1<Character>::RemoveAt(System.Int32)
IL_00b0: nop
IL_00b1: ldloc.s V_5
IL_00b3: ldc.i4.1
IL_00b4: sub
IL_00b5: stloc.s V_5
IL_00b7: ldloc.s V_5
IL_00b9: ldc.i4.0
IL_00ba: clt
IL_00bc: ldc.i4.0
IL_00bd: ceq
IL_00bf: stloc.s V_7
IL_00c1: ldloc.s V_7
IL_00c3: brtrue.s IL_0091
IL_00c5: ldsfld Player Player::m_localPlayer
IL_00ca: stloc.2
IL_00cb: ldloc.2
IL_00cc: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_00d1: brfalse.s IL_00e5
IL_00d3: ldloc.1
IL_00d4: ldloc.2
IL_00d5: callvirt System.Boolean System.Collections.Generic.List`1<Character>::Contains(!0)
IL_00da: brtrue.s IL_00e5
IL_00dc: ldloc.2
IL_00dd: ldloc.0
IL_00de: call System.Boolean LongshipUpgrades.LongshipCustomizableParts::IsInsideFireWarmth(Character,UnityEngine.Collider)
IL_00e3: br.s IL_00e6
IL_00e5: ldc.i4.0
IL_00e6: stloc.s V_8
IL_00e8: ldloc.s V_8
IL_00ea: brfalse.s IL_00f4
IL_00ec: ldloc.1
IL_00ed: ldloc.2
IL_00ee: callvirt System.Void System.Collections.Generic.List`1<Character>::Add(!0)
IL_00f3: nop
IL_00f4: ret

// System.Boolean LongshipUpgrades.LongshipCustomizableParts::IsInsideFireWarmth(Character,UnityEngine.Collider)
.locals UnityEngine.CapsuleCollider, UnityEngine.Transform, UnityEngine.Transform, System.Boolean, System.Boolean, System.Boolean, System.Boolean, UnityEngine.Bounds, UnityEngine.Vector3, System.Single
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0007: brfalse.s IL_0046
IL_0009: ldarg.0
IL_000a: callvirt System.Boolean UnityEngine.Behaviour::get_isActiveAndEnabled()
IL_000f: brfalse.s IL_0046
IL_0011: ldarg.0
IL_0012: callvirt System.Boolean Character::IsPlayer()
IL_0017: brfalse.s IL_0046
IL_0019: ldarg.0
IL_001a: callvirt System.Boolean Character::IsDead()
IL_001f: brtrue.s IL_0046
IL_0021: ldarg.0
IL_0022: ldfld ZNetView Character::m_nview
IL_0027: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_002c: brfalse.s IL_0046
IL_002e: ldarg.0
IL_002f: ldfld ZNetView Character::m_nview
IL_0034: callvirt System.Boolean ZNetView::IsValid()
IL_0039: brfalse.s IL_0046
IL_003b: ldarg.0
IL_003c: callvirt System.Boolean Character::IsOwner()
IL_0041: ldc.i4.0
IL_0042: ceq
IL_0044: br.s IL_0047
IL_0046: ldc.i4.1
IL_0047: stloc.3
IL_0048: ldloc.3
IL_0049: brfalse.s IL_0053
IL_004b: ldc.i4.0
IL_004c: stloc.s V_4
IL_004e: br IL_00de
IL_0053: ldarg.0
IL_0054: callvirt UnityEngine.CapsuleCollider Character::GetCollider()
IL_0059: stloc.0
IL_005a: ldloc.0
IL_005b: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0060: brfalse.s IL_007a
IL_0062: ldloc.0
IL_0063: callvirt System.Boolean UnityEngine.Collider::get_enabled()
IL_0068: brfalse.s IL_007a
IL_006a: ldloc.0
IL_006b: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0070: callvirt System.Boolean UnityEngine.GameObject::get_activeInHierarchy()
IL_0075: ldc.i4.0
IL_0076: ceq
IL_0078: br.s IL_007b
IL_007a: ldc.i4.1
IL_007b: stloc.s V_5
IL_007d: ldloc.s V_5
IL_007f: brfalse.s IL_0086
IL_0081: ldc.i4.0
IL_0082: stloc.s V_4
IL_0084: br.s IL_00de
IL_0086: ldarg.1
IL_0087: callvirt UnityEngine.Bounds UnityEngine.Collider::get_bounds()
IL_008c: stloc.s V_7
IL_008e: ldloca.s V_7
IL_0090: ldloc.0
IL_0091: callvirt UnityEngine.Bounds UnityEngine.Collider::get_bounds()
IL_0096: call System.Boolean UnityEngine.Bounds::Intersects(UnityEngine.Bounds)
IL_009b: ldc.i4.0
IL_009c: ceq
IL_009e: stloc.s V_6
IL_00a0: ldloc.s V_6
IL_00a2: brfalse.s IL_00a9
IL_00a4: ldc.i4.0
IL_00a5: stloc.s V_4
IL_00a7: br.s IL_00de
IL_00a9: ldarg.1
IL_00aa: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_00af: stloc.1
IL_00b0: ldloc.0
IL_00b1: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_00b6: stloc.2
IL_00b7: ldarg.1
IL_00b8: ldloc.1
IL_00b9: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_00be: ldloc.1
IL_00bf: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_00c4: ldloc.0
IL_00c5: ldloc.2
IL_00c6: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_00cb: ldloc.2
IL_00cc: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_00d1: ldloca.s V_8
IL_00d3: ldloca.s V_9
IL_00d5: call System.Boolean UnityEngine.Physics::ComputePenetration(UnityEngine.Collider,UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Collider,UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Vector3&,System.Single&)
IL_00da: stloc.s V_4
IL_00dc: br.s IL_00de
IL_00de: ldloc.s V_4
IL_00e0: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::RPC_SetVariant(System.Int64,System.Int32,System.Int32,System.Int32,System.String)
.locals System.Boolean, ZDOID
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0007: callvirt System.Boolean ZNetView::IsValid()
IL_000c: brfalse.s IL_001b
IL_000e: ldarg.0
IL_000f: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0014: callvirt System.Boolean ZNetView::IsOwner()
IL_0019: br.s IL_001c
IL_001b: ldc.i4.0
IL_001c: stloc.0
IL_001d: ldloc.0
IL_001e: brfalse.s IL_0059
IL_0020: nop
IL_0021: ldarg.0
IL_0022: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0027: ldarg.2
IL_0028: ldarg.3
IL_0029: ldc.i4.0
IL_002a: callvirt System.Void ZDO::Set(System.Int32,System.Int32,System.Boolean)
IL_002f: nop
IL_0030: ldsfld EffectList LongshipUpgrades.LongshipCustomizableParts::partEffects
IL_0035: ldarg.s position
IL_0037: call UnityEngine.Vector3 LongshipUpgrades.LongshipCustomizableParts::ParseVector3(System.String)
IL_003c: call UnityEngine.Quaternion UnityEngine.Quaternion::get_identity()
IL_0041: ldnull
IL_0042: ldc.r4 1
IL_0047: ldarg.s effectVariant
IL_0049: ldloca.s V_1
IL_004b: initobj ZDOID
IL_0051: ldloc.1
IL_0052: callvirt UnityEngine.GameObject[] EffectList::Create(UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Transform,System.Single,System.Int32,ZDOID)
IL_0057: pop
IL_0058: nop
IL_0059: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::RPC_SetActive(System.Int64,System.Int32,System.Boolean,System.Int32,System.String)
.locals System.Boolean, ZDOID
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0007: callvirt System.Boolean ZNetView::IsValid()
IL_000c: brfalse.s IL_001b
IL_000e: ldarg.0
IL_000f: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0014: callvirt System.Boolean ZNetView::IsOwner()
IL_0019: br.s IL_001c
IL_001b: ldc.i4.0
IL_001c: stloc.0
IL_001d: ldloc.0
IL_001e: brfalse.s IL_0058
IL_0020: nop
IL_0021: ldarg.0
IL_0022: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0027: ldarg.2
IL_0028: ldarg.3
IL_0029: callvirt System.Void ZDO::Set(System.Int32,System.Boolean)
IL_002e: nop
IL_002f: ldsfld EffectList LongshipUpgrades.LongshipCustomizableParts::partEffects
IL_0034: ldarg.s position
IL_0036: call UnityEngine.Vector3 LongshipUpgrades.LongshipCustomizableParts::ParseVector3(System.String)
IL_003b: call UnityEngine.Quaternion UnityEngine.Quaternion::get_identity()
IL_0040: ldnull
IL_0041: ldc.r4 1
IL_0046: ldarg.s effectVariant
IL_0048: ldloca.s V_1
IL_004a: initobj ZDOID
IL_0050: ldloc.1
IL_0051: callvirt UnityEngine.GameObject[] EffectList::Create(UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Transform,System.Single,System.Int32,ZDOID)
IL_0056: pop
IL_0057: nop
IL_0058: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::RPC_SetBuilt(System.Int64,System.Int32,System.String,System.String)
.locals System.Boolean, EffectList, System.Boolean, ZDOID
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0007: callvirt System.Boolean ZNetView::IsValid()
IL_000c: brfalse.s IL_001b
IL_000e: ldarg.0
IL_000f: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0014: callvirt System.Boolean ZNetView::IsOwner()
IL_0019: br.s IL_001c
IL_001b: ldc.i4.0
IL_001c: stloc.0
IL_001d: ldloc.0
IL_001e: brfalse.s IL_0074
IL_0020: nop
IL_0021: ldarg.0
IL_0022: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0027: ldarg.2
IL_0028: ldc.i4.1
IL_0029: callvirt System.Void ZDO::Set(System.Int32,System.Boolean)
IL_002e: nop
IL_002f: ldarg.3
IL_0030: call System.Boolean System.String::IsNullOrWhiteSpace(System.String)
IL_0035: brtrue.s IL_0046
IL_0037: ldsfld System.Collections.Generic.Dictionary`2<System.String,EffectList> LongshipUpgrades.LongshipCustomizableParts::buildEffects
IL_003c: ldarg.3
IL_003d: ldloca.s V_1
IL_003f: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,EffectList>::TryGetValue(!0,!1&)
IL_0044: br.s IL_0047
IL_0046: ldc.i4.0
IL_0047: stloc.2
IL_0048: ldloc.2
IL_0049: brfalse.s IL_0073
IL_004b: ldloc.1
IL_004c: brtrue.s IL_0050
IL_004e: br.s IL_0073
IL_0050: ldloc.1
IL_0051: ldarg.s position
IL_0053: call UnityEngine.Vector3 LongshipUpgrades.LongshipCustomizableParts::ParseVector3(System.String)
IL_0058: call UnityEngine.Quaternion UnityEngine.Quaternion::get_identity()
IL_005d: ldnull
IL_005e: ldc.r4 1
IL_0063: ldc.i4.m1
IL_0064: ldloca.s V_3
IL_0066: initobj ZDOID
IL_006c: ldloc.3
IL_006d: call UnityEngine.GameObject[] EffectList::Create(UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Transform,System.Single,System.Int32,ZDOID)
IL_0072: pop
IL_0073: nop
IL_0074: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::RequestMissingShipMapData()
.locals System.Int32, System.Boolean, LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: call System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
IL_0006: brfalse.s IL_0031
IL_0008: ldarg.0
IL_0009: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_000e: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_mapTableUpgraded
IL_0013: ldc.i4.0
IL_0014: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_0019: brfalse.s IL_0031
IL_001b: ldarg.0
IL_001c: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0021: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_mapDataCompressed
IL_0026: ldc.i4.0
IL_0027: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_002c: ldc.i4.0
IL_002d: ceq
IL_002f: br.s IL_0032
IL_0031: ldc.i4.1
IL_0032: stloc.s V_4
IL_0034: ldloc.s V_4
IL_0036: brfalse.s IL_0050
IL_0038: nop
IL_0039: ldarg.0
IL_003a: ldc.i4.0
IL_003b: stfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_lastRequestedShipMapRevision
IL_0040: ldarg.0
IL_0041: ldc.r4 0
IL_0046: stfld System.Single LongshipUpgrades.LongshipCustomizableParts::m_nextShipMapDataRequestTime
IL_004b: br IL_00ff
IL_0050: ldarg.0
IL_0051: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_0056: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_shipMapDataRevision
IL_005b: ldc.i4.0
IL_005c: callvirt System.Int32 ZDO::GetInt(System.Int32,System.Int32)
IL_0061: stloc.0
IL_0062: ldloc.0
IL_0063: ldc.i4.0
IL_0064: cgt
IL_0066: ldc.i4.0
IL_0067: ceq
IL_0069: stloc.s V_5
IL_006b: ldloc.s V_5
IL_006d: brfalse.s IL_0074
IL_006f: br IL_00ff
IL_0074: ldarg.0
IL_0075: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_007a: ldfld ZDOID ZDO::m_uid
IL_007f: ldloca.s V_2
IL_0081: call System.Boolean LongshipUpgrades.LongshipUpgrades::TryGetShipMapData(ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry&)
IL_0086: brfalse.s IL_0093
IL_0088: ldloc.2
IL_0089: ldfld System.Byte[] LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Data
IL_008e: ldnull
IL_008f: cgt.un
IL_0091: br.s IL_0094
IL_0093: ldc.i4.0
IL_0094: stloc.1
IL_0095: ldloc.1
IL_0096: brfalse.s IL_00a3
IL_0098: ldloc.2
IL_0099: ldfld System.Int32 LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Revision
IL_009e: ldloc.0
IL_009f: clt
IL_00a1: br.s IL_00a4
IL_00a3: ldc.i4.1
IL_00a4: stloc.3
IL_00a5: ldloc.3
IL_00a6: ldc.i4.0
IL_00a7: ceq
IL_00a9: stloc.s V_6
IL_00ab: ldloc.s V_6
IL_00ad: brfalse.s IL_00b9
IL_00af: nop
IL_00b0: ldarg.0
IL_00b1: ldc.i4.0
IL_00b2: stfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_lastRequestedShipMapRevision
IL_00b7: br.s IL_00ff
IL_00b9: call System.Single UnityEngine.Time::get_time()
IL_00be: ldarg.0
IL_00bf: ldfld System.Single LongshipUpgrades.LongshipCustomizableParts::m_nextShipMapDataRequestTime
IL_00c4: bge.un.s IL_00d1
IL_00c6: ldarg.0
IL_00c7: ldfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_lastRequestedShipMapRevision
IL_00cc: ldloc.0
IL_00cd: ceq
IL_00cf: br.s IL_00d2
IL_00d1: ldc.i4.0
IL_00d2: stloc.s V_7
IL_00d4: ldloc.s V_7
IL_00d6: brfalse.s IL_00da
IL_00d8: br.s IL_00ff
IL_00da: ldarg.0
IL_00db: ldloc.0
IL_00dc: stfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_lastRequestedShipMapRevision
IL_00e1: ldarg.0
IL_00e2: call System.Single UnityEngine.Time::get_time()
IL_00e7: ldc.r4 2
IL_00ec: add
IL_00ed: stfld System.Single LongshipUpgrades.LongshipCustomizableParts::m_nextShipMapDataRequestTime
IL_00f2: ldarg.0
IL_00f3: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_00f8: ldloc.0
IL_00f9: call System.Boolean LongshipUpgrades.LongshipUpgrades::RequestShipMapDataFromServer(ZDO,System.Int32)
IL_00fe: pop
IL_00ff: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::UpdateSailPropertyBlocks()
.locals UnityEngine.Renderer, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_sail
IL_0007: dup
IL_0008: brtrue.s IL_000e
IL_000a: pop
IL_000b: ldnull
IL_000c: br.s IL_0013
IL_000e: call !!0 UnityEngine.GameObject::GetComponentInChildren<UnityEngine.Renderer>()
IL_0013: stloc.0
IL_0014: ldloc.0
IL_0015: ldnull
IL_0016: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_001b: stloc.1
IL_001c: ldloc.1
IL_001d: brfalse.s IL_0021
IL_001f: br.s IL_0098
IL_0021: ldarg.0
IL_0022: ldfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_sailStyle
IL_0027: brfalse.s IL_0038
IL_0029: ldsfld System.Collections.Generic.List`1<UnityEngine.Texture2D> LongshipUpgrades.LongshipCustomizableParts::customSails
IL_002e: callvirt System.Int32 System.Collections.Generic.List`1<UnityEngine.Texture2D>::get_Count()
IL_0033: ldc.i4.0
IL_0034: ceq
IL_0036: br.s IL_0039
IL_0038: ldc.i4.1
IL_0039: stloc.2
IL_003a: ldloc.2
IL_003b: brfalse.s IL_0047
IL_003d: ldarg.0
IL_003e: ldloc.0
IL_003f: call System.Void LongshipUpgrades.LongshipCustomizableParts::ResetPropertyBlock(UnityEngine.Renderer)
IL_0044: nop
IL_0045: br.s IL_0098
IL_0047: ldarg.0
IL_0048: ldloc.0
IL_0049: ldsfld System.Int32 ShaderProps::_MainTex
IL_004e: ldsfld System.Collections.Generic.List`1<UnityEngine.Texture2D> LongshipUpgrades.LongshipCustomizableParts::customSails
IL_0053: ldarg.0
IL_0054: ldfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_sailStyle
IL_0059: ldc.i4.1
IL_005a: sub
IL_005b: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::maxSails
IL_0060: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0065: brfalse.s IL_0082
IL_0067: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::maxSails
IL_006c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0071: ldsfld System.Collections.Generic.List`1<UnityEngine.Texture2D> LongshipUpgrades.LongshipCustomizableParts::customSails
IL_0076: callvirt System.Int32 System.Collections.Generic.List`1<UnityEngine.Texture2D>::get_Count()
IL_007b: call System.Int32 System.Math::Min(System.Int32,System.Int32)
IL_0080: br.s IL_008c
IL_0082: ldsfld System.Collections.Generic.List`1<UnityEngine.Texture2D> LongshipUpgrades.LongshipCustomizableParts::customSails
IL_0087: callvirt System.Int32 System.Collections.Generic.List`1<UnityEngine.Texture2D>::get_Count()
IL_008c: rem
IL_008d: callvirt !0 System.Collections.Generic.List`1<UnityEngine.Texture2D>::get_Item(System.Int32)
IL_0092: call System.Void LongshipUpgrades.LongshipCustomizableParts::SetPropertyBlock(UnityEngine.Renderer,System.Int32,UnityEngine.Texture2D)
IL_0097: nop
IL_0098: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::UpdateTentPropertyBlocks()
.locals UnityEngine.Renderer, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_tent
IL_0007: dup
IL_0008: brtrue.s IL_000e
IL_000a: pop
IL_000b: ldnull
IL_000c: br.s IL_0013
IL_000e: call !!0 UnityEngine.GameObject::GetComponentInChildren<UnityEngine.Renderer>()
IL_0013: stloc.0
IL_0014: ldloc.0
IL_0015: ldnull
IL_0016: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_001b: stloc.1
IL_001c: ldloc.1
IL_001d: brfalse.s IL_0021
IL_001f: br.s IL_0098
IL_0021: ldarg.0
IL_0022: ldfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_tentStyle
IL_0027: brfalse.s IL_0038
IL_0029: ldsfld System.Collections.Generic.List`1<UnityEngine.Texture2D> LongshipUpgrades.LongshipCustomizableParts::customTents
IL_002e: callvirt System.Int32 System.Collections.Generic.List`1<UnityEngine.Texture2D>::get_Count()
IL_0033: ldc.i4.0
IL_0034: ceq
IL_0036: br.s IL_0039
IL_0038: ldc.i4.1
IL_0039: stloc.2
IL_003a: ldloc.2
IL_003b: brfalse.s IL_0047
IL_003d: ldarg.0
IL_003e: ldloc.0
IL_003f: call System.Void LongshipUpgrades.LongshipCustomizableParts::ResetPropertyBlock(UnityEngine.Renderer)
IL_0044: nop
IL_0045: br.s IL_0098
IL_0047: ldarg.0
IL_0048: ldloc.0
IL_0049: ldsfld System.Int32 ShaderProps::_MainTex
IL_004e: ldsfld System.Collections.Generic.List`1<UnityEngine.Texture2D> LongshipUpgrades.LongshipCustomizableParts::customTents
IL_0053: ldarg.0
IL_0054: ldfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_tentStyle
IL_0059: ldc.i4.1
IL_005a: sub
IL_005b: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::maxTents
IL_0060: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0065: brfalse.s IL_0082
IL_0067: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::maxTents
IL_006c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0071: ldsfld System.Collections.Generic.List`1<UnityEngine.Texture2D> LongshipUpgrades.LongshipCustomizableParts::customTents
IL_0076: callvirt System.Int32 System.Collections.Generic.List`1<UnityEngine.Texture2D>::get_Count()
IL_007b: call System.Int32 System.Math::Min(System.Int32,System.Int32)
IL_0080: br.s IL_008c
IL_0082: ldsfld System.Collections.Generic.List`1<UnityEngine.Texture2D> LongshipUpgrades.LongshipCustomizableParts::customTents
IL_0087: callvirt System.Int32 System.Collections.Generic.List`1<UnityEngine.Texture2D>::get_Count()
IL_008c: rem
IL_008d: callvirt !0 System.Collections.Generic.List`1<UnityEngine.Texture2D>::get_Item(System.Int32)
IL_0092: call System.Void LongshipUpgrades.LongshipCustomizableParts::SetPropertyBlock(UnityEngine.Renderer,System.Int32,UnityEngine.Texture2D)
IL_0097: nop
IL_0098: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::UpdateHullPropertyBlocks()
.locals System.Boolean, System.Boolean, System.Collections.Generic.List`1/Enumerator<UnityEngine.Renderer>, UnityEngine.Renderer, System.Collections.Generic.List`1/Enumerator<UnityEngine.Renderer>, UnityEngine.Renderer, System.Boolean, System.Collections.Generic.IEnumerator`1<UnityEngine.Renderer>, UnityEngine.Renderer
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_ashlandsUpgraded
IL_0007: brfalse.s IL_0018
IL_0009: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::healthUpgradeLvl2
IL_000e: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0013: ldc.i4.0
IL_0014: cgt
IL_0016: br.s IL_0019
IL_0018: ldc.i4.0
IL_0019: stloc.0
IL_001a: ldloc.0
IL_001b: brfalse IL_0239
IL_0020: nop
IL_0021: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::ashlandsProtection
IL_0026: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_002b: stloc.1
IL_002c: ldloc.1
IL_002d: brfalse IL_0238
IL_0032: nop
IL_0033: nop
IL_0034: newobj System.Void System.Collections.Generic.List`1<UnityEngine.Renderer>::.ctor()
IL_0039: dup
IL_003a: ldarg.0
IL_003b: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_0040: ldfld UnityEngine.GameObject WearNTear::m_new
IL_0045: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_004a: ldstr "hull"
IL_004f: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0054: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0059: callvirt !!0 UnityEngine.GameObject::GetComponent<UnityEngine.Renderer>()
IL_005e: callvirt System.Void System.Collections.Generic.List`1<UnityEngine.Renderer>::Add(!0)
IL_0063: nop
IL_0064: dup
IL_0065: ldarg.0
IL_0066: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_006b: ldfld UnityEngine.GameObject WearNTear::m_new
IL_0070: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0075: ldstr "skull_head"
IL_007a: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_007f: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0084: callvirt !!0 UnityEngine.GameObject::GetComponent<UnityEngine.Renderer>()
IL_0089: callvirt System.Void System.Collections.Generic.List`1<UnityEngine.Renderer>::Add(!0)
IL_008e: nop
IL_008f: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<UnityEngine.Renderer>::GetEnumerator()
IL_0094: stloc.2
IL_0095: br.s IL_00b3
IL_0097: ldloca.s V_2
IL_0099: call !0 System.Collections.Generic.List`1/Enumerator<UnityEngine.Renderer>::get_Current()
IL_009e: stloc.3
IL_009f: nop
IL_00a0: ldarg.0
IL_00a1: ldloc.3
IL_00a2: ldsfld System.Int32 ShaderProps::_MainTex
IL_00a7: ldsfld UnityEngine.Texture2D LongshipUpgrades.LongshipCustomizableParts::s_ashlandsHull
IL_00ac: call System.Void LongshipUpgrades.LongshipCustomizableParts::SetPropertyBlock(UnityEngine.Renderer,System.Int32,UnityEngine.Texture2D)
IL_00b1: nop
IL_00b2: nop
IL_00b3: ldloca.s V_2
IL_00b5: call System.Boolean System.Collections.Generic.List`1/Enumerator<UnityEngine.Renderer>::MoveNext()
IL_00ba: brtrue.s IL_0097
IL_00bc: leave.s IL_00cd
IL_00be: ldloca.s V_2
IL_00c0: constrained. System.Collections.Generic.List`1/Enumerator<UnityEngine.Renderer>
IL_00c6: callvirt System.Void System.IDisposable::Dispose()
IL_00cb: nop
IL_00cc: endfinally
IL_00cd: nop
IL_00ce: newobj System.Void System.Collections.Generic.List`1<UnityEngine.Renderer>::.ctor()
IL_00d3: dup
IL_00d4: ldarg.0
IL_00d5: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_00da: ldfld UnityEngine.GameObject WearNTear::m_worn
IL_00df: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_00e4: ldstr "hull"
IL_00e9: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_00ee: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_00f3: callvirt !!0 UnityEngine.GameObject::GetComponent<UnityEngine.Renderer>()
IL_00f8: callvirt System.Void System.Collections.Generic.List`1<UnityEngine.Renderer>::Add(!0)
IL_00fd: nop
IL_00fe: dup
IL_00ff: ldarg.0
IL_0100: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_0105: ldfld UnityEngine.GameObject WearNTear::m_broken
IL_010a: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_010f: ldstr "hull"
IL_0114: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0119: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_011e: callvirt !!0 UnityEngine.GameObject::GetComponent<UnityEngine.Renderer>()
IL_0123: callvirt System.Void System.Collections.Generic.List`1<UnityEngine.Renderer>::Add(!0)
IL_0128: nop
IL_0129: dup
IL_012a: ldarg.0
IL_012b: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_0130: ldfld UnityEngine.GameObject WearNTear::m_worn
IL_0135: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_013a: ldstr "skull_head"
IL_013f: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0144: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0149: callvirt !!0 UnityEngine.GameObject::GetComponent<UnityEngine.Renderer>()
IL_014e: callvirt System.Void System.Collections.Generic.List`1<UnityEngine.Renderer>::Add(!0)
IL_0153: nop
IL_0154: dup
IL_0155: ldarg.0
IL_0156: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_015b: ldfld UnityEngine.GameObject WearNTear::m_broken
IL_0160: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0165: ldstr "skull_head"
IL_016a: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_016f: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0174: callvirt !!0 UnityEngine.GameObject::GetComponent<UnityEngine.Renderer>()
IL_0179: callvirt System.Void System.Collections.Generic.List`1<UnityEngine.Renderer>::Add(!0)
IL_017e: nop
IL_017f: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<UnityEngine.Renderer>::GetEnumerator()
IL_0184: stloc.s V_4
IL_0186: br.s IL_01a6
IL_0188: ldloca.s V_4
IL_018a: call !0 System.Collections.Generic.List`1/Enumerator<UnityEngine.Renderer>::get_Current()
IL_018f: stloc.s V_5
IL_0191: nop
IL_0192: ldarg.0
IL_0193: ldloc.s V_5
IL_0195: ldsfld System.Int32 ShaderProps::_MainTex
IL_019a: ldsfld UnityEngine.Texture2D LongshipUpgrades.LongshipCustomizableParts::s_ashlandsHullDamaged
IL_019f: call System.Void LongshipUpgrades.LongshipCustomizableParts::SetPropertyBlock(UnityEngine.Renderer,System.Int32,UnityEngine.Texture2D)
IL_01a4: nop
IL_01a5: nop
IL_01a6: ldloca.s V_4
IL_01a8: call System.Boolean System.Collections.Generic.List`1/Enumerator<UnityEngine.Renderer>::MoveNext()
IL_01ad: brtrue.s IL_0188
IL_01af: leave.s IL_01c0
IL_01b1: ldloca.s V_4
IL_01b3: constrained. System.Collections.Generic.List`1/Enumerator<UnityEngine.Renderer>
IL_01b9: callvirt System.Void System.IDisposable::Dispose()
IL_01be: nop
IL_01bf: endfinally
IL_01c0: ldarg.0
IL_01c1: ldfld UnityEngine.GameObject[] LongshipUpgrades.LongshipCustomizableParts::m_heads
IL_01c6: ldnull
IL_01c7: cgt.un
IL_01c9: stloc.s V_6
IL_01cb: ldloc.s V_6
IL_01cd: brfalse.s IL_0237
IL_01cf: nop
IL_01d0: ldarg.0
IL_01d1: ldfld UnityEngine.GameObject[] LongshipUpgrades.LongshipCustomizableParts::m_heads
IL_01d6: ldsfld System.Func`2<UnityEngine.GameObject,UnityEngine.Renderer> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__127_0
IL_01db: dup
IL_01dc: brtrue.s IL_01f5
IL_01de: pop
IL_01df: ldsfld LongshipUpgrades.LongshipCustomizableParts/<>c LongshipUpgrades.LongshipCustomizableParts/<>c::<>9
IL_01e4: ldftn UnityEngine.Renderer LongshipUpgrades.LongshipCustomizableParts/<>c::<UpdateHullPropertyBlocks>b__127_0(UnityEngine.GameObject)
IL_01ea: newobj System.Void System.Func`2<UnityEngine.GameObject,UnityEngine.Renderer>::.ctor(System.Object,System.IntPtr)
IL_01ef: dup
IL_01f0: stsfld System.Func`2<UnityEngine.GameObject,UnityEngine.Renderer> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__127_0
IL_01f5: call System.Collections.Generic.IEnumerable`1<!!1> System.Linq.Enumerable::Select<UnityEngine.GameObject,UnityEngine.Renderer>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_01fa: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<UnityEngine.Renderer>::GetEnumerator()
IL_01ff: stloc.s V_7
IL_0201: br.s IL_021f
IL_0203: ldloc.s V_7
IL_0205: callvirt !0 System.Collections.Generic.IEnumerator`1<UnityEngine.Renderer>::get_Current()
IL_020a: stloc.s V_8
IL_020c: ldarg.0
IL_020d: ldloc.s V_8
IL_020f: ldsfld System.Int32 ShaderProps::_MainTex
IL_0214: ldsfld UnityEngine.Texture2D LongshipUpgrades.LongshipCustomizableParts::s_ashlandsHull
IL_0219: call System.Void LongshipUpgrades.LongshipCustomizableParts::SetPropertyBlock(UnityEngine.Renderer,System.Int32,UnityEngine.Texture2D)
IL_021e: nop
IL_021f: ldloc.s V_7
IL_0221: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0226: brtrue.s IL_0203
IL_0228: leave.s IL_0237
IL_022a: ldloc.s V_7
IL_022c: brfalse.s IL_0236
IL_022e: ldloc.s V_7
IL_0230: callvirt System.Void System.IDisposable::Dispose()
IL_0235: nop
IL_0236: endfinally
IL_0237: nop
IL_0238: nop
IL_0239: ret
// EH Finally: 149 - 190 => 190 - 205
// EH Finally: 390 - 433 => 433 - 448
// EH Finally: 513 - 554 => 554 - 567

// System.Void LongshipUpgrades.LongshipCustomizableParts::UpdateShieldsPropertyBlocks()
.locals System.Boolean, System.Int32, System.Int32, System.Collections.Generic.IEnumerator`1<UnityEngine.Renderer>, UnityEngine.Renderer, System.Boolean
IL_0000: nop
IL_0001: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::changeShields
IL_0006: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000b: brfalse.s IL_0029
IL_000d: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::healthEnabled
IL_0012: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0017: brfalse.s IL_0029
IL_0019: ldarg.0
IL_001a: ldfld UnityEngine.GameObject[] LongshipUpgrades.LongshipCustomizableParts::m_protectiveParts
IL_001f: brfalse.s IL_0029
IL_0021: ldarg.0
IL_0022: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_healthUpgraded
IL_0027: br.s IL_002a
IL_0029: ldc.i4.0
IL_002a: stloc.0
IL_002b: ldloc.0
IL_002c: brfalse IL_0105
IL_0031: nop
IL_0032: ldarg.0
IL_0033: ldfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_shieldsStyle
IL_0038: ldc.i4.3
IL_0039: bgt.s IL_0043
IL_003b: ldarg.0
IL_003c: ldfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_shieldsStyle
IL_0041: br.s IL_004f
IL_0043: ldarg.0
IL_0044: ldfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_shieldsStyle
IL_0049: ldc.i4.1
IL_004a: sub
IL_004b: ldc.i4.3
IL_004c: rem
IL_004d: ldc.i4.1
IL_004e: add
IL_004f: stloc.1
IL_0050: ldarg.0
IL_0051: ldfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_shieldsStyle
IL_0056: ldc.i4.3
IL_0057: bgt.s IL_005c
IL_0059: ldc.i4.m1
IL_005a: br.s IL_0066
IL_005c: ldarg.0
IL_005d: ldfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::m_shieldsStyle
IL_0062: ldc.i4.4
IL_0063: sub
IL_0064: ldc.i4.3
IL_0065: div
IL_0066: stloc.2
IL_0067: nop
IL_0068: ldarg.0
IL_0069: ldfld UnityEngine.GameObject[] LongshipUpgrades.LongshipCustomizableParts::m_protectiveParts
IL_006e: ldsfld System.Func`2<UnityEngine.GameObject,UnityEngine.Renderer> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__128_0
IL_0073: dup
IL_0074: brtrue.s IL_008d
IL_0076: pop
IL_0077: ldsfld LongshipUpgrades.LongshipCustomizableParts/<>c LongshipUpgrades.LongshipCustomizableParts/<>c::<>9
IL_007c: ldftn UnityEngine.Renderer LongshipUpgrades.LongshipCustomizableParts/<>c::<UpdateShieldsPropertyBlocks>b__128_0(UnityEngine.GameObject)
IL_0082: newobj System.Void System.Func`2<UnityEngine.GameObject,UnityEngine.Renderer>::.ctor(System.Object,System.IntPtr)
IL_0087: dup
IL_0088: stsfld System.Func`2<UnityEngine.GameObject,UnityEngine.Renderer> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__128_0
IL_008d: call System.Collections.Generic.IEnumerable`1<!!1> System.Linq.Enumerable::Select<UnityEngine.GameObject,UnityEngine.Renderer>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_0092: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<UnityEngine.Renderer>::GetEnumerator()
IL_0097: stloc.3
IL_0098: br.s IL_00ef
IL_009a: ldloc.3
IL_009b: callvirt !0 System.Collections.Generic.IEnumerator`1<UnityEngine.Renderer>::get_Current()
IL_00a0: stloc.s V_4
IL_00a2: nop
IL_00a3: ldarg.0
IL_00a4: ldloc.s V_4
IL_00a6: call System.Void LongshipUpgrades.LongshipCustomizableParts::ResetPropertyBlock(UnityEngine.Renderer)
IL_00ab: nop
IL_00ac: ldarg.0
IL_00ad: ldloc.s V_4
IL_00af: ldsfld System.Int32 ShaderProps::_Style
IL_00b4: ldloc.1
IL_00b5: call System.Void LongshipUpgrades.LongshipCustomizableParts::SetPropertyBlock(UnityEngine.Renderer,System.Int32,System.Int32)
IL_00ba: nop
IL_00bb: ldc.i4.m1
IL_00bc: ldloc.2
IL_00bd: bge.s IL_00ce
IL_00bf: ldloc.2
IL_00c0: ldsfld System.Collections.Generic.List`1<UnityEngine.Texture2D> LongshipUpgrades.LongshipCustomizableParts::customShields
IL_00c5: callvirt System.Int32 System.Collections.Generic.List`1<UnityEngine.Texture2D>::get_Count()
IL_00ca: clt
IL_00cc: br.s IL_00cf
IL_00ce: ldc.i4.0
IL_00cf: stloc.s V_5
IL_00d1: ldloc.s V_5
IL_00d3: brfalse.s IL_00ee
IL_00d5: ldarg.0
IL_00d6: ldloc.s V_4
IL_00d8: ldsfld System.Int32 LongshipUpgrades.LongshipPropertyBlocks::_StyleTex
IL_00dd: ldsfld System.Collections.Generic.List`1<UnityEngine.Texture2D> LongshipUpgrades.LongshipCustomizableParts::customShields
IL_00e2: ldloc.2
IL_00e3: callvirt !0 System.Collections.Generic.List`1<UnityEngine.Texture2D>::get_Item(System.Int32)
IL_00e8: call System.Void LongshipUpgrades.LongshipCustomizableParts::SetPropertyBlock(UnityEngine.Renderer,System.Int32,UnityEngine.Texture2D)
IL_00ed: nop
IL_00ee: nop
IL_00ef: ldloc.3
IL_00f0: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_00f5: brtrue.s IL_009a
IL_00f7: leave.s IL_0104
IL_00f9: ldloc.3
IL_00fa: brfalse.s IL_0103
IL_00fc: ldloc.3
IL_00fd: callvirt System.Void System.IDisposable::Dispose()
IL_0102: nop
IL_0103: endfinally
IL_0104: nop
IL_0105: ret
// EH Finally: 152 - 249 => 249 - 260

// System.Void LongshipUpgrades.LongshipCustomizableParts::UpdatePropertyBlocks()
.locals 
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.Collections.Generic.Dictionary`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock> LongshipUpgrades.LongshipCustomizableParts::s_propertyBlocks
IL_0007: callvirt System.Collections.Generic.Dictionary`2/KeyCollection<!0,!1> System.Collections.Generic.Dictionary`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock>::get_Keys()
IL_000c: ldsfld System.Action`1<UnityEngine.Renderer> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__129_0
IL_0011: dup
IL_0012: brtrue.s IL_002b
IL_0014: pop
IL_0015: ldsfld LongshipUpgrades.LongshipCustomizableParts/<>c LongshipUpgrades.LongshipCustomizableParts/<>c::<>9
IL_001a: ldftn System.Void LongshipUpgrades.LongshipCustomizableParts/<>c::<UpdatePropertyBlocks>b__129_0(UnityEngine.Renderer)
IL_0020: newobj System.Void System.Action`1<UnityEngine.Renderer>::.ctor(System.Object,System.IntPtr)
IL_0025: dup
IL_0026: stsfld System.Action`1<UnityEngine.Renderer> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__129_0
IL_002b: call System.Void HarmonyLib.CollectionExtensions::Do<UnityEngine.Renderer>(System.Collections.Generic.IEnumerable`1<!!0>,System.Action`1<!!0>)
IL_0030: nop
IL_0031: ldarg.0
IL_0032: ldfld System.Collections.Generic.Dictionary`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock> LongshipUpgrades.LongshipCustomizableParts::s_propertyBlocks
IL_0037: callvirt System.Void System.Collections.Generic.Dictionary`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock>::Clear()
IL_003c: nop
IL_003d: ldarg.0
IL_003e: call System.Void LongshipUpgrades.LongshipCustomizableParts::UpdateHullPropertyBlocks()
IL_0043: nop
IL_0044: ldarg.0
IL_0045: call System.Void LongshipUpgrades.LongshipCustomizableParts::UpdateShieldsPropertyBlocks()
IL_004a: nop
IL_004b: ldarg.0
IL_004c: call System.Void LongshipUpgrades.LongshipCustomizableParts::UpdateTentPropertyBlocks()
IL_0051: nop
IL_0052: ldarg.0
IL_0053: call System.Void LongshipUpgrades.LongshipCustomizableParts::UpdateSailPropertyBlocks()
IL_0058: nop
IL_0059: ldarg.0
IL_005a: call System.Void LongshipUpgrades.LongshipCustomizableParts::SetPropertyBlocks()
IL_005f: nop
IL_0060: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::UpdateLights()
.locals UnityEngine.Color, System.Boolean, System.Boolean, UnityEngine.ParticleSystem/MainModule, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_insects
IL_0007: dup
IL_0008: brtrue.s IL_000d
IL_000a: pop
IL_000b: br.s IL_0026
IL_000d: ldsfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::isNightTime
IL_0012: brfalse.s IL_001f
IL_0014: ldarg.0
IL_0015: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_isLampLightDisabled
IL_001a: ldc.i4.0
IL_001b: ceq
IL_001d: br.s IL_0020
IL_001f: ldc.i4.0
IL_0020: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0025: nop
IL_0026: ldarg.0
IL_0027: ldfld UnityEngine.Light LongshipUpgrades.LongshipCustomizableParts::m_light
IL_002c: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0031: stloc.1
IL_0032: ldloc.1
IL_0033: brfalse.s IL_0067
IL_0035: nop
IL_0036: ldarg.0
IL_0037: ldfld UnityEngine.Light LongshipUpgrades.LongshipCustomizableParts::m_light
IL_003c: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0041: ldarg.0
IL_0042: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_isLampLightDisabled
IL_0047: ldc.i4.0
IL_0048: ceq
IL_004a: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_004f: nop
IL_0050: ldarg.0
IL_0051: ldfld UnityEngine.Light LongshipUpgrades.LongshipCustomizableParts::m_light
IL_0056: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> LongshipUpgrades.LongshipUpgrades::lanternLightColor
IL_005b: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_0060: callvirt System.Void UnityEngine.Light::set_color(UnityEngine.Color)
IL_0065: nop
IL_0066: nop
IL_0067: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> LongshipUpgrades.LongshipUpgrades::lanternLightColor
IL_006c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_0071: stloc.0
IL_0072: ldloca.s V_0
IL_0074: ldc.r4 0
IL_0079: stfld System.Single UnityEngine.Color::a
IL_007e: ldarg.0
IL_007f: ldfld UnityEngine.ParticleSystem LongshipUpgrades.LongshipCustomizableParts::m_flare
IL_0084: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0089: stloc.2
IL_008a: ldloc.2
IL_008b: brfalse.s IL_00d2
IL_008d: nop
IL_008e: ldarg.0
IL_008f: ldfld UnityEngine.ParticleSystem LongshipUpgrades.LongshipCustomizableParts::m_flare
IL_0094: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0099: ldarg.0
IL_009a: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_isLampLightDisabled
IL_009f: ldc.i4.0
IL_00a0: ceq
IL_00a2: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_00a7: nop
IL_00a8: ldarg.0
IL_00a9: ldfld UnityEngine.ParticleSystem LongshipUpgrades.LongshipCustomizableParts::m_flare
IL_00ae: callvirt UnityEngine.ParticleSystem/MainModule UnityEngine.ParticleSystem::get_main()
IL_00b3: stloc.3
IL_00b4: ldloca.s V_3
IL_00b6: ldsfld UnityEngine.Color LongshipUpgrades.LongshipCustomizableParts::flareColor
IL_00bb: ldloc.0
IL_00bc: ldc.r4 0.5
IL_00c1: call UnityEngine.Color UnityEngine.Color::Lerp(UnityEngine.Color,UnityEngine.Color,System.Single)
IL_00c6: call UnityEngine.ParticleSystem/MinMaxGradient UnityEngine.ParticleSystem/MinMaxGradient::op_Implicit(UnityEngine.Color)
IL_00cb: call System.Void UnityEngine.ParticleSystem/MainModule::set_startColor(UnityEngine.ParticleSystem/MinMaxGradient)
IL_00d0: nop
IL_00d1: nop
IL_00d2: ldarg.0
IL_00d3: ldfld UnityEngine.MeshRenderer LongshipUpgrades.LongshipCustomizableParts::m_lampRenderer
IL_00d8: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_00dd: stloc.s V_4
IL_00df: ldloc.s V_4
IL_00e1: brfalse.s IL_010f
IL_00e3: ldarg.0
IL_00e4: ldarg.0
IL_00e5: ldfld UnityEngine.MeshRenderer LongshipUpgrades.LongshipCustomizableParts::m_lampRenderer
IL_00ea: ldsfld System.Int32 ShaderProps::_EmissionColor
IL_00ef: ldarg.0
IL_00f0: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_isLampLightDisabled
IL_00f5: brtrue.s IL_0104
IL_00f7: call UnityEngine.Color UnityEngine.Color::get_white()
IL_00fc: ldloc.0
IL_00fd: call UnityEngine.Color UnityEngine.Color::op_Addition(UnityEngine.Color,UnityEngine.Color)
IL_0102: br.s IL_0109
IL_0104: call UnityEngine.Color UnityEngine.Color::get_grey()
IL_0109: call System.Void LongshipUpgrades.LongshipCustomizableParts::SetPropertyBlock(UnityEngine.Renderer,System.Int32,UnityEngine.Color)
IL_010e: nop
IL_010f: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::SetPropertyBlock(UnityEngine.Renderer,System.Int32,UnityEngine.Texture2D)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0008: stloc.0
IL_0009: ldloc.0
IL_000a: brfalse.s IL_000e
IL_000c: br.s IL_001d
IL_000e: ldarg.0
IL_000f: ldarg.1
IL_0010: call UnityEngine.MaterialPropertyBlock LongshipUpgrades.LongshipCustomizableParts::GetPropertyBlock(UnityEngine.Renderer)
IL_0015: ldarg.2
IL_0016: ldarg.3
IL_0017: callvirt System.Void UnityEngine.MaterialPropertyBlock::SetTexture(System.Int32,UnityEngine.Texture)
IL_001c: nop
IL_001d: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::SetPropertyBlock(UnityEngine.Renderer,System.Int32,System.Int32)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0008: stloc.0
IL_0009: ldloc.0
IL_000a: brfalse.s IL_000e
IL_000c: br.s IL_001d
IL_000e: ldarg.0
IL_000f: ldarg.1
IL_0010: call UnityEngine.MaterialPropertyBlock LongshipUpgrades.LongshipCustomizableParts::GetPropertyBlock(UnityEngine.Renderer)
IL_0015: ldarg.2
IL_0016: ldarg.3
IL_0017: callvirt System.Void UnityEngine.MaterialPropertyBlock::SetInt(System.Int32,System.Int32)
IL_001c: nop
IL_001d: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::SetPropertyBlock(UnityEngine.Renderer,System.Int32,UnityEngine.Color)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0008: stloc.0
IL_0009: ldloc.0
IL_000a: brfalse.s IL_000e
IL_000c: br.s IL_001d
IL_000e: ldarg.0
IL_000f: ldarg.1
IL_0010: call UnityEngine.MaterialPropertyBlock LongshipUpgrades.LongshipCustomizableParts::GetPropertyBlock(UnityEngine.Renderer)
IL_0015: ldarg.2
IL_0016: ldarg.3
IL_0017: callvirt System.Void UnityEngine.MaterialPropertyBlock::SetColor(System.Int32,UnityEngine.Color)
IL_001c: nop
IL_001d: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::ResetPropertyBlock(UnityEngine.Renderer)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.Collections.Generic.Dictionary`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock> LongshipUpgrades.LongshipCustomizableParts::s_propertyBlocks
IL_0007: ldarg.1
IL_0008: callvirt System.Boolean System.Collections.Generic.Dictionary`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock>::ContainsKey(!0)
IL_000d: ldc.i4.0
IL_000e: ceq
IL_0010: stloc.0
IL_0011: ldloc.0
IL_0012: brfalse.s IL_0016
IL_0014: br.s IL_0032
IL_0016: ldarg.1
IL_0017: ldnull
IL_0018: callvirt System.Void UnityEngine.Renderer::SetPropertyBlock(UnityEngine.MaterialPropertyBlock)
IL_001d: nop
IL_001e: ldarg.0
IL_001f: ldfld System.Collections.Generic.Dictionary`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock> LongshipUpgrades.LongshipCustomizableParts::s_propertyBlocks
IL_0024: ldarg.1
IL_0025: callvirt System.Boolean System.Collections.Generic.Dictionary`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock>::Remove(!0)
IL_002a: pop
IL_002b: ldarg.0
IL_002c: ldc.i4.1
IL_002d: stfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::blocksIsDirty
IL_0032: ret

// UnityEngine.MaterialPropertyBlock LongshipUpgrades.LongshipCustomizableParts::GetPropertyBlock(UnityEngine.Renderer)
.locals UnityEngine.MaterialPropertyBlock, System.Boolean, UnityEngine.MaterialPropertyBlock
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldc.i4.1
IL_0003: stfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::blocksIsDirty
IL_0008: ldarg.0
IL_0009: ldfld System.Collections.Generic.Dictionary`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock> LongshipUpgrades.LongshipCustomizableParts::s_propertyBlocks
IL_000e: ldarg.1
IL_000f: ldloca.s V_0
IL_0011: callvirt System.Boolean System.Collections.Generic.Dictionary`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock>::TryGetValue(!0,!1&)
IL_0016: ldc.i4.0
IL_0017: ceq
IL_0019: stloc.1
IL_001a: ldloc.1
IL_001b: brfalse.s IL_0033
IL_001d: nop
IL_001e: newobj System.Void UnityEngine.MaterialPropertyBlock::.ctor()
IL_0023: stloc.0
IL_0024: ldarg.0
IL_0025: ldfld System.Collections.Generic.Dictionary`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock> LongshipUpgrades.LongshipCustomizableParts::s_propertyBlocks
IL_002a: ldarg.1
IL_002b: ldloc.0
IL_002c: callvirt System.Void System.Collections.Generic.Dictionary`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock>::set_Item(!0,!1)
IL_0031: nop
IL_0032: nop
IL_0033: ldloc.0
IL_0034: stloc.2
IL_0035: br.s IL_0037
IL_0037: ldloc.2
IL_0038: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::CombinePropertyBlocks(UnityEngine.MaterialPropertyBlock)
.locals System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock>, UnityEngine.MaterialPropertyBlock, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: nop
IL_0002: ldarg.0
IL_0003: ldfld System.Collections.Generic.Dictionary`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock> LongshipUpgrades.LongshipCustomizableParts::s_propertyBlocks
IL_0008: callvirt System.Collections.Generic.Dictionary`2/ValueCollection<!0,!1> System.Collections.Generic.Dictionary`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock>::get_Values()
IL_000d: callvirt System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2/ValueCollection<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock>::GetEnumerator()
IL_0012: stloc.0
IL_0013: br.s IL_007d
IL_0015: ldloca.s V_0
IL_0017: call !1 System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock>::get_Current()
IL_001c: stloc.1
IL_001d: nop
IL_001e: ldarg.1
IL_001f: ldsfld System.Int32 ShaderProps::_Color
IL_0024: callvirt System.Boolean UnityEngine.MaterialPropertyBlock::HasColor(System.Int32)
IL_0029: stloc.2
IL_002a: ldloc.2
IL_002b: brfalse.s IL_004d
IL_002d: nop
IL_002e: ldloc.1
IL_002f: ldsfld System.Int32 ShaderProps::_Color
IL_0034: ldarg.1
IL_0035: ldsfld System.Int32 ShaderProps::_Color
IL_003a: callvirt UnityEngine.Color UnityEngine.MaterialPropertyBlock::GetColor(System.Int32)
IL_003f: callvirt System.Void UnityEngine.MaterialPropertyBlock::SetColor(System.Int32,UnityEngine.Color)
IL_0044: nop
IL_0045: ldarg.0
IL_0046: ldc.i4.1
IL_0047: stfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::blocksIsDirty
IL_004c: nop
IL_004d: ldarg.1
IL_004e: ldsfld System.Int32 ShaderProps::_EmissionColor
IL_0053: callvirt System.Boolean UnityEngine.MaterialPropertyBlock::HasColor(System.Int32)
IL_0058: stloc.3
IL_0059: ldloc.3
IL_005a: brfalse.s IL_007c
IL_005c: nop
IL_005d: ldloc.1
IL_005e: ldsfld System.Int32 ShaderProps::_EmissionColor
IL_0063: ldarg.1
IL_0064: ldsfld System.Int32 ShaderProps::_EmissionColor
IL_0069: callvirt UnityEngine.Color UnityEngine.MaterialPropertyBlock::GetColor(System.Int32)
IL_006e: callvirt System.Void UnityEngine.MaterialPropertyBlock::SetColor(System.Int32,UnityEngine.Color)
IL_0073: nop
IL_0074: ldarg.0
IL_0075: ldc.i4.1
IL_0076: stfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::blocksIsDirty
IL_007b: nop
IL_007c: nop
IL_007d: ldloca.s V_0
IL_007f: call System.Boolean System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock>::MoveNext()
IL_0084: brtrue.s IL_0015
IL_0086: leave.s IL_0097
IL_0088: ldloca.s V_0
IL_008a: constrained. System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock>
IL_0090: callvirt System.Void System.IDisposable::Dispose()
IL_0095: nop
IL_0096: endfinally
IL_0097: ldarg.0
IL_0098: call System.Void LongshipUpgrades.LongshipCustomizableParts::SetPropertyBlocks()
IL_009d: nop
IL_009e: ret
// EH Finally: 19 - 136 => 136 - 151

// System.Void LongshipUpgrades.LongshipCustomizableParts::SetPropertyBlocks()
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::blocksIsDirty
IL_0007: stloc.0
IL_0008: ldloc.0
IL_0009: brfalse.s IL_0036
IL_000b: ldarg.0
IL_000c: ldfld System.Collections.Generic.Dictionary`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock> LongshipUpgrades.LongshipCustomizableParts::s_propertyBlocks
IL_0011: ldsfld System.Action`1<System.Collections.Generic.KeyValuePair`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock>> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__137_0
IL_0016: dup
IL_0017: brtrue.s IL_0030
IL_0019: pop
IL_001a: ldsfld LongshipUpgrades.LongshipCustomizableParts/<>c LongshipUpgrades.LongshipCustomizableParts/<>c::<>9
IL_001f: ldftn System.Void LongshipUpgrades.LongshipCustomizableParts/<>c::<SetPropertyBlocks>b__137_0(System.Collections.Generic.KeyValuePair`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock>)
IL_0025: newobj System.Void System.Action`1<System.Collections.Generic.KeyValuePair`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock>>::.ctor(System.Object,System.IntPtr)
IL_002a: dup
IL_002b: stsfld System.Action`1<System.Collections.Generic.KeyValuePair`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock>> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__137_0
IL_0030: call System.Void HarmonyLib.CollectionExtensions::Do<System.Collections.Generic.KeyValuePair`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock>>(System.Collections.Generic.IEnumerable`1<!!0>,System.Action`1<!!0>)
IL_0035: nop
IL_0036: ldarg.0
IL_0037: ldc.i4.0
IL_0038: stfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::blocksIsDirty
IL_003d: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::InitializeParts()
.locals UnityEngine.Transform, UnityEngine.Transform, UnityEngine.Transform, UnityEngine.Transform, UnityEngine.GameObject, UnityEngine.Transform, UnityEngine.Transform, System.Boolean, System.Boolean, System.Collections.Generic.List`1<UnityEngine.GameObject>, System.Collections.Generic.List`1<UnityEngine.GameObject>, System.Collections.Generic.List`1<UnityEngine.GameObject>, UnityEngine.Random/State, System.Int32, UnityEngine.GameObject, System.Boolean, System.Boolean, System.Boolean, System.Int32, UnityEngine.BoxCollider, UnityEngine.GameObject, System.Int32, System.Int32, System.Boolean, System.Int32, UnityEngine.Transform, Ladder, System.Int32, System.Int32, System.Boolean, System.Boolean, UnityEngine.Transform, UnityEngine.Transform, UnityEngine.Transform, UnityEngine.Transform, System.Boolean, LongshipUpgrades.LongshipPartController, System.Boolean, LongshipUpgrades.LongshipPartController, System.Boolean, LongshipUpgrades.LongshipPartController, System.Boolean, UnityEngine.Transform, UnityEngine.Transform, UnityEngine.Transform, UnityEngine.Transform, System.Boolean, System.Int32, LongshipUpgrades.LongshipPartController, System.Boolean, System.Boolean, System.Boolean, UnityEngine.Transform, UnityEngine.Transform, UnityEngine.ConfigurableJoint, UnityEngine.Transform, UnityEngine.Transform, UnityEngine.GameObject, UnityEngine.SphereCollider, System.Boolean, UnityEngine.ParticleSystem/MainModule, UnityEngine.ParticleSystem/MinMaxGradient, System.Boolean, UnityEngine.Transform, System.Boolean, System.Boolean, LongshipUpgrades.LongshipPartController, System.Boolean, UnityEngine.Transform, LongshipUpgrades.LongshipPartController, System.Boolean, UnityEngine.Transform, UnityEngine.BoxCollider, UnityEngine.BoxCollider, LongshipUpgrades.LongshipPartController, System.Boolean, LongshipUpgrades.LongshipCustomizableParts/<>c__DisplayClass138_0, UnityEngine.Transform, UnityEngine.Transform, System.Boolean, System.Int32, System.Boolean, System.Boolean, System.Int32, System.Boolean, System.Boolean, UnityEngine.Transform, UnityEngine.Transform, UnityEngine.Transform, UnityEngine.Transform, UnityEngine.Transform, UnityEngine.Transform, UnityEngine.Transform, System.Boolean, System.Int32, LongshipUpgrades.LongshipPartController, System.Boolean, System.Boolean, UnityEngine.Material, UnityEngine.GameObject, UnityEngine.Transform, System.Collections.Generic.List`1<UnityEngine.GameObject>, UnityEngine.Transform, UnityEngine.Transform, UnityEngine.Transform, System.Boolean, UnityEngine.GameObject, System.Boolean, UnityEngine.GameObject, System.Boolean, UnityEngine.GameObject, System.Boolean, UnityEngine.Transform, LongshipUpgrades.LongshipPartController, System.Boolean, UnityEngine.Transform, UnityEngine.Transform, LongshipUpgrades.LongshipPartController, UnityEngine.GameObject, UnityEngine.BoxCollider, UnityEngine.GameObject, Turret, System.Boolean, UnityEngine.Transform, UnityEngine.GameObject, UnityEngine.Transform, UnityEngine.Transform, UnityEngine.MeshRenderer, UnityEngine.Transform, UnityEngine.Transform, ItemStand, System.Boolean, System.Boolean, System.Boolean, UnityEngine.Transform, Demister, UnityEngine.ParticleSystem/MainModule, System.Boolean, UnityEngine.Transform, LongshipUpgrades.LongshipPartController, System.Boolean, MapTable, System.Boolean, UnityEngine.Transform, LongshipUpgrades.LongshipPartController
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldarg.0
IL_0003: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0008: ldstr "ship/visual/Mast"
IL_000d: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0012: dup
IL_0013: brtrue.s IL_0019
IL_0015: pop
IL_0016: ldnull
IL_0017: br.s IL_001e
IL_0019: call UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_001e: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mast
IL_0023: ldarg.0
IL_0024: ldarg.0
IL_0025: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_002a: ldstr "ship/visual/ropes"
IL_002f: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0034: dup
IL_0035: brtrue.s IL_003b
IL_0037: pop
IL_0038: ldnull
IL_0039: br.s IL_0040
IL_003b: call UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0040: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_ropes
IL_0045: ldarg.0
IL_0046: ldarg.0
IL_0047: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_004c: ldstr "ship/visual/Mast/Karve_Sail/Karve_Sail"
IL_0051: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0056: dup
IL_0057: brtrue.s IL_005d
IL_0059: pop
IL_005a: ldnull
IL_005b: br.s IL_0062
IL_005d: call UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0062: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_sail
IL_0067: ldarg.0
IL_0068: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_006d: ldstr "ship/visual/Customize"
IL_0072: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0077: stloc.0
IL_0078: ldloc.0
IL_0079: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_007e: ldc.i4.0
IL_007f: ceq
IL_0081: stloc.s V_7
IL_0083: ldloc.s V_7
IL_0085: brfalse.s IL_008c
IL_0087: br IL_2685
IL_008c: ldloc.0
IL_008d: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0092: ldc.i4.1
IL_0093: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0098: nop
IL_0099: ldarg.0
IL_009a: ldloc.0
IL_009b: ldstr "ShipTentHolders"
IL_00a0: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_00a5: dup
IL_00a6: brtrue.s IL_00ac
IL_00a8: pop
IL_00a9: ldnull
IL_00aa: br.s IL_00b1
IL_00ac: call UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_00b1: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_holdersRight
IL_00b6: ldarg.0
IL_00b7: ldloc.0
IL_00b8: ldstr "ShipTentHolders (1)"
IL_00bd: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_00c2: dup
IL_00c3: brtrue.s IL_00c9
IL_00c5: pop
IL_00c6: ldnull
IL_00c7: br.s IL_00ce
IL_00c9: call UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_00ce: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_holdersLeft
IL_00d3: ldarg.0
IL_00d4: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_holdersRight
IL_00d9: dup
IL_00da: brtrue.s IL_00df
IL_00dc: pop
IL_00dd: br.s IL_00e6
IL_00df: ldc.i4.0
IL_00e0: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_00e5: nop
IL_00e6: ldarg.0
IL_00e7: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_holdersLeft
IL_00ec: dup
IL_00ed: brtrue.s IL_00f2
IL_00ef: pop
IL_00f0: br.s IL_00f9
IL_00f2: ldc.i4.0
IL_00f3: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_00f8: nop
IL_00f9: ldloc.0
IL_00fa: ldstr "storage"
IL_00ff: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0104: stloc.1
IL_0105: ldloc.1
IL_0106: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_010b: stloc.s V_8
IL_010d: ldloc.s V_8
IL_010f: brfalse IL_0546
IL_0114: nop
IL_0115: newobj System.Void System.Collections.Generic.List`1<UnityEngine.GameObject>::.ctor()
IL_011a: stloc.s V_9
IL_011c: newobj System.Void System.Collections.Generic.List`1<UnityEngine.GameObject>::.ctor()
IL_0121: stloc.s V_10
IL_0123: newobj System.Void System.Collections.Generic.List`1<UnityEngine.GameObject>::.ctor()
IL_0128: stloc.s V_11
IL_012a: ldc.i4.0
IL_012b: stloc.s V_13
IL_012d: br.s IL_019f
IL_012f: nop
IL_0130: ldloc.1
IL_0131: ldloc.s V_13
IL_0133: callvirt UnityEngine.Transform UnityEngine.Transform::GetChild(System.Int32)
IL_0138: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_013d: stloc.s V_14
IL_013f: ldloc.s V_14
IL_0141: callvirt System.String UnityEngine.Object::get_name()
IL_0146: ldstr "barrel"
IL_014b: callvirt System.Boolean System.String::StartsWith(System.String)
IL_0150: stloc.s V_15
IL_0152: ldloc.s V_15
IL_0154: brfalse.s IL_0162
IL_0156: ldloc.s V_9
IL_0158: ldloc.s V_14
IL_015a: callvirt System.Void System.Collections.Generic.List`1<UnityEngine.GameObject>::Add(!0)
IL_015f: nop
IL_0160: br.s IL_018f
IL_0162: ldloc.s V_14
IL_0164: callvirt System.String UnityEngine.Object::get_name()
IL_0169: ldstr "Shield"
IL_016e: callvirt System.Boolean System.String::StartsWith(System.String)
IL_0173: stloc.s V_16
IL_0175: ldloc.s V_16
IL_0177: brfalse.s IL_0185
IL_0179: ldloc.s V_11
IL_017b: ldloc.s V_14
IL_017d: callvirt System.Void System.Collections.Generic.List`1<UnityEngine.GameObject>::Add(!0)
IL_0182: nop
IL_0183: br.s IL_018f
IL_0185: ldloc.s V_10
IL_0187: ldloc.s V_14
IL_0189: callvirt System.Void System.Collections.Generic.List`1<UnityEngine.GameObject>::Add(!0)
IL_018e: nop
IL_018f: ldloc.s V_14
IL_0191: ldc.i4.0
IL_0192: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0197: nop
IL_0198: nop
IL_0199: ldloc.s V_13
IL_019b: ldc.i4.1
IL_019c: add
IL_019d: stloc.s V_13
IL_019f: ldloc.s V_13
IL_01a1: ldloc.1
IL_01a2: callvirt System.Int32 UnityEngine.Transform::get_childCount()
IL_01a7: clt
IL_01a9: stloc.s V_17
IL_01ab: ldloc.s V_17
IL_01ad: brtrue.s IL_012f
IL_01af: ldarg.0
IL_01b0: ldloc.s V_9
IL_01b2: callvirt !0[] System.Collections.Generic.List`1<UnityEngine.GameObject>::ToArray()
IL_01b7: stfld UnityEngine.GameObject[] LongshipUpgrades.LongshipCustomizableParts::m_containerPartsLvl1
IL_01bc: ldarg.0
IL_01bd: ldloc.s V_10
IL_01bf: callvirt !0[] System.Collections.Generic.List`1<UnityEngine.GameObject>::ToArray()
IL_01c4: stfld UnityEngine.GameObject[] LongshipUpgrades.LongshipCustomizableParts::m_containerPartsLvl2
IL_01c9: ldarg.0
IL_01ca: ldloc.s V_11
IL_01cc: callvirt !0[] System.Collections.Generic.List`1<UnityEngine.GameObject>::ToArray()
IL_01d1: stfld UnityEngine.GameObject[] LongshipUpgrades.LongshipCustomizableParts::m_protectiveParts
IL_01d6: call UnityEngine.Random/State UnityEngine.Random::get_state()
IL_01db: stloc.s V_12
IL_01dd: ldarg.0
IL_01de: ldfld ZDO LongshipUpgrades.LongshipCustomizableParts::m_zdo
IL_01e3: ldflda ZDOID ZDO::m_uid
IL_01e8: call System.UInt32 ZDOID::get_ID()
IL_01ed: call System.Void UnityEngine.Random::InitState(System.Int32)
IL_01f2: nop
IL_01f3: ldc.i4.0
IL_01f4: stloc.s V_18
IL_01f6: br IL_02d2
IL_01fb: nop
IL_01fc: ldloc.s V_9
IL_01fe: ldloc.s V_18
IL_0200: callvirt !0 System.Collections.Generic.List`1<UnityEngine.GameObject>::get_Item(System.Int32)
IL_0205: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_020a: dup
IL_020b: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localEulerAngles()
IL_0210: ldc.r4 0
IL_0215: ldc.r4 0
IL_021a: ldc.r4 360
IL_021f: call System.Single UnityEngine.Random::Range(System.Single,System.Single)
IL_0224: ldc.r4 0
IL_0229: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_022e: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0233: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_0238: nop
IL_0239: ldloc.s V_18
IL_023b: stloc.s V_22
IL_023d: ldloc.s V_22
IL_023f: stloc.s V_21
IL_0241: ldloc.s V_21
IL_0243: brfalse.s IL_024e
IL_0245: br.s IL_0247
IL_0247: ldloc.s V_21
IL_0249: ldc.i4.1
IL_024a: beq.s IL_0278
IL_024c: br.s IL_02a2
IL_024e: ldloc.s V_9
IL_0250: ldloc.s V_18
IL_0252: callvirt !0 System.Collections.Generic.List`1<UnityEngine.GameObject>::get_Item(System.Int32)
IL_0257: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_025c: ldc.r4 -0.69
IL_0261: ldc.r4 0.18
IL_0266: ldc.r4 -0.88
IL_026b: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0270: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_0275: nop
IL_0276: br.s IL_02a2
IL_0278: ldloc.s V_9
IL_027a: ldloc.s V_18
IL_027c: callvirt !0 System.Collections.Generic.List`1<UnityEngine.GameObject>::get_Item(System.Int32)
IL_0281: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0286: ldc.r4 -0.36
IL_028b: ldc.r4 0.18
IL_0290: ldc.r4 -0.87
IL_0295: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_029a: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_029f: nop
IL_02a0: br.s IL_02a2
IL_02a2: ldloc.s V_9
IL_02a4: ldloc.s V_18
IL_02a6: callvirt !0 System.Collections.Generic.List`1<UnityEngine.GameObject>::get_Item(System.Int32)
IL_02ab: callvirt !!0 UnityEngine.GameObject::GetComponentInChildren<UnityEngine.BoxCollider>()
IL_02b0: stloc.s V_19
IL_02b2: ldloc.s V_19
IL_02b4: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_02b9: stloc.s V_20
IL_02bb: ldloc.s V_19
IL_02bd: call System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_02c2: nop
IL_02c3: ldloc.s V_20
IL_02c5: callvirt !!0 UnityEngine.GameObject::AddComponent<UnityEngine.CapsuleCollider>()
IL_02ca: pop
IL_02cb: nop
IL_02cc: ldloc.s V_18
IL_02ce: ldc.i4.1
IL_02cf: add
IL_02d0: stloc.s V_18
IL_02d2: ldloc.s V_18
IL_02d4: ldloc.s V_9
IL_02d6: callvirt System.Int32 System.Collections.Generic.List`1<UnityEngine.GameObject>::get_Count()
IL_02db: clt
IL_02dd: stloc.s V_23
IL_02df: ldloc.s V_23
IL_02e1: brtrue IL_01fb
IL_02e6: ldc.i4.0
IL_02e7: stloc.s V_24
IL_02e9: br IL_0529
IL_02ee: nop
IL_02ef: ldloc.s V_24
IL_02f1: stloc.s V_28
IL_02f3: ldloc.s V_28
IL_02f5: stloc.s V_27
IL_02f7: ldloc.s V_27
IL_02f9: switch IL_0327,IL_03bd,IL_04e5,IL_03ea,IL_043f,IL_0327,IL_0491,IL_04e5,IL_04bb
IL_0322: br IL_04e5
IL_0327: ldstr "ladder_TargetPoint"
IL_032c: newobj System.Void UnityEngine.GameObject::.ctor(System.String)
IL_0331: call UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0336: stloc.s V_25
IL_0338: ldloc.s V_25
IL_033a: ldloc.s V_10
IL_033c: ldloc.s V_24
IL_033e: callvirt !0 System.Collections.Generic.List`1<UnityEngine.GameObject>::get_Item(System.Int32)
IL_0343: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0348: ldc.i4.0
IL_0349: callvirt System.Void UnityEngine.Transform::SetParent(UnityEngine.Transform,System.Boolean)
IL_034e: nop
IL_034f: ldloc.s V_25
IL_0351: ldc.r4 0.4
IL_0356: ldc.r4 0.82
IL_035b: ldc.r4 0
IL_0360: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0365: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_036a: nop
IL_036b: ldloc.s V_25
IL_036d: ldc.r4 0
IL_0372: ldc.r4 270
IL_0377: ldc.r4 0
IL_037c: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0381: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_0386: nop
IL_0387: ldloc.s V_10
IL_0389: ldloc.s V_24
IL_038b: callvirt !0 System.Collections.Generic.List`1<UnityEngine.GameObject>::get_Item(System.Int32)
IL_0390: callvirt !!0 UnityEngine.GameObject::AddComponent<Ladder>()
IL_0395: stloc.s V_26
IL_0397: ldloc.s V_26
IL_0399: ldc.r4 1.5
IL_039e: stfld System.Single Ladder::m_useDistance
IL_03a3: ldloc.s V_26
IL_03a5: ldloc.s V_25
IL_03a7: stfld UnityEngine.Transform Ladder::m_targetPos
IL_03ac: ldloc.s V_26
IL_03ae: ldstr "$lu_box_name"
IL_03b3: stfld System.String Ladder::m_name
IL_03b8: br IL_0523
IL_03bd: ldloc.s V_10
IL_03bf: ldloc.s V_24
IL_03c1: callvirt !0 System.Collections.Generic.List`1<UnityEngine.GameObject>::get_Item(System.Int32)
IL_03c6: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_03cb: ldc.r4 0.08
IL_03d0: ldc.r4 0
IL_03d5: ldc.r4 -0.45
IL_03da: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_03df: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_03e4: nop
IL_03e5: br IL_04e5
IL_03ea: ldloc.s V_10
IL_03ec: ldloc.s V_24
IL_03ee: callvirt !0 System.Collections.Generic.List`1<UnityEngine.GameObject>::get_Item(System.Int32)
IL_03f3: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_03f8: ldc.r4 0
IL_03fd: ldc.r4 0
IL_0402: ldc.r4 -0.84
IL_0407: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_040c: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_0411: nop
IL_0412: ldloc.s V_10
IL_0414: ldloc.s V_24
IL_0416: callvirt !0 System.Collections.Generic.List`1<UnityEngine.GameObject>::get_Item(System.Int32)
IL_041b: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0420: ldc.r4 0.35
IL_0425: ldc.r4 0.4
IL_042a: ldc.r4 0.35
IL_042f: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0434: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_0439: nop
IL_043a: br IL_04e5
IL_043f: ldloc.s V_10
IL_0441: ldloc.s V_24
IL_0443: callvirt !0 System.Collections.Generic.List`1<UnityEngine.GameObject>::get_Item(System.Int32)
IL_0448: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_044d: ldc.r4 0.36
IL_0452: ldc.r4 -0.02
IL_0457: ldc.r4 -0.82
IL_045c: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0461: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_0466: nop
IL_0467: ldloc.s V_10
IL_0469: ldloc.s V_24
IL_046b: callvirt !0 System.Collections.Generic.List`1<UnityEngine.GameObject>::get_Item(System.Int32)
IL_0470: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0475: ldc.r4 0.35
IL_047a: ldc.r4 0.4
IL_047f: ldc.r4 0.35
IL_0484: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0489: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_048e: nop
IL_048f: br.s IL_04e5
IL_0491: ldloc.s V_10
IL_0493: ldloc.s V_24
IL_0495: callvirt !0 System.Collections.Generic.List`1<UnityEngine.GameObject>::get_Item(System.Int32)
IL_049a: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_049f: ldc.r4 0
IL_04a4: ldc.r4 0.26
IL_04a9: ldc.r4 -0.57
IL_04ae: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_04b3: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_04b8: nop
IL_04b9: br.s IL_04e5
IL_04bb: ldloc.s V_10
IL_04bd: ldloc.s V_24
IL_04bf: callvirt !0 System.Collections.Generic.List`1<UnityEngine.GameObject>::get_Item(System.Int32)
IL_04c4: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_04c9: ldc.r4 0.35
IL_04ce: ldc.r4 0.4
IL_04d3: ldc.r4 0.35
IL_04d8: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_04dd: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_04e2: nop
IL_04e3: br.s IL_04e5
IL_04e5: ldloc.s V_10
IL_04e7: ldloc.s V_24
IL_04e9: callvirt !0 System.Collections.Generic.List`1<UnityEngine.GameObject>::get_Item(System.Int32)
IL_04ee: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_04f3: dup
IL_04f4: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localEulerAngles()
IL_04f9: ldc.r4 0
IL_04fe: ldc.r4 0
IL_0503: ldc.r4 360
IL_0508: call System.Single UnityEngine.Random::Range(System.Single,System.Single)
IL_050d: ldc.r4 0
IL_0512: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0517: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_051c: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_0521: nop
IL_0522: nop
IL_0523: ldloc.s V_24
IL_0525: ldc.i4.1
IL_0526: add
IL_0527: stloc.s V_24
IL_0529: ldloc.s V_24
IL_052b: ldloc.s V_10
IL_052d: callvirt System.Int32 System.Collections.Generic.List`1<UnityEngine.GameObject>::get_Count()
IL_0532: clt
IL_0534: stloc.s V_29
IL_0536: ldloc.s V_29
IL_0538: brtrue IL_02ee
IL_053d: ldloc.s V_12
IL_053f: call System.Void UnityEngine.Random::set_state(UnityEngine.Random/State)
IL_0544: nop
IL_0545: nop
IL_0546: ldloc.0
IL_0547: ldstr "ShipTen2_beam"
IL_054c: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0551: stloc.2
IL_0552: ldloc.2
IL_0553: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0558: stloc.s V_30
IL_055a: ldloc.s V_30
IL_055c: brfalse IL_099d
IL_0561: nop
IL_0562: ldarg.0
IL_0563: ldloc.2
IL_0564: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0569: ldloc.2
IL_056a: callvirt UnityEngine.Transform UnityEngine.Transform::get_parent()
IL_056f: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Transform)
IL_0574: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamMast
IL_0579: ldarg.0
IL_057a: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamMast
IL_057f: ldstr "ShipTen2_mast"
IL_0584: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_0589: nop
IL_058a: ldarg.0
IL_058b: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamMast
IL_0590: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0595: dup
IL_0596: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localEulerAngles()
IL_059b: ldc.r4 90
IL_05a0: ldc.r4 0.1
IL_05a5: ldc.r4 0
IL_05aa: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_05af: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_05b4: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_05b9: nop
IL_05ba: ldarg.0
IL_05bb: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamMast
IL_05c0: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_05c5: ldc.r4 0.58
IL_05ca: ldc.r4 0.35
IL_05cf: ldc.r4 0
IL_05d4: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_05d9: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_05de: nop
IL_05df: ldarg.0
IL_05e0: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamMast
IL_05e5: ldc.i4.0
IL_05e6: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_05eb: nop
IL_05ec: ldloc.2
IL_05ed: dup
IL_05ee: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localPosition()
IL_05f3: ldc.r4 0.1
IL_05f8: ldc.r4 0
IL_05fd: ldc.r4 0
IL_0602: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0607: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_060c: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_0611: nop
IL_0612: ldarg.0
IL_0613: ldloc.2
IL_0614: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0619: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamTent
IL_061e: ldarg.0
IL_061f: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamTent
IL_0624: ldc.i4.0
IL_0625: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_062a: nop
IL_062b: ldarg.0
IL_062c: ldloc.2
IL_062d: callvirt !!0 UnityEngine.Component::GetComponentInChildren<UnityEngine.Renderer>()
IL_0632: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0637: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamMesh
IL_063c: ldarg.0
IL_063d: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamMast
IL_0642: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0647: ldstr "mast_beam"
IL_064c: ldtoken UnityEngine.BoxCollider
IL_0651: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0656: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_065b: stloc.s V_31
IL_065d: ldloc.s V_31
IL_065f: ldc.r4 0
IL_0664: ldc.r4 1.58
IL_0669: ldc.r4 -0.48
IL_066e: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0673: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_0678: nop
IL_0679: ldloc.s V_31
IL_067b: ldc.r4 0.16
IL_0680: ldc.r4 0.16
IL_0685: ldc.r4 2.5
IL_068a: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_068f: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_0694: nop
IL_0695: ldloc.2
IL_0696: ldstr "lantern_beam"
IL_069b: ldtoken UnityEngine.BoxCollider
IL_06a0: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_06a5: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_06aa: stloc.s V_32
IL_06ac: ldloc.s V_32
IL_06ae: ldc.r4 0
IL_06b3: ldc.r4 1.58
IL_06b8: ldc.r4 -1.41
IL_06bd: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_06c2: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_06c7: nop
IL_06c8: ldloc.s V_32
IL_06ca: ldc.r4 0.16
IL_06cf: ldc.r4 0.16
IL_06d4: ldc.r4 0.8
IL_06d9: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_06de: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_06e3: nop
IL_06e4: ldloc.2
IL_06e5: ldstr "tent_beam"
IL_06ea: ldtoken UnityEngine.BoxCollider
IL_06ef: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_06f4: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_06f9: stloc.s V_33
IL_06fb: ldloc.s V_33
IL_06fd: ldc.r4 0
IL_0702: ldc.r4 1.58
IL_0707: ldc.r4 0.23
IL_070c: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0711: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_0716: nop
IL_0717: ldloc.s V_33
IL_0719: ldc.r4 0.16
IL_071e: ldc.r4 0.16
IL_0723: ldc.r4 2.05
IL_0728: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_072d: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_0732: nop
IL_0733: ldloc.2
IL_0734: ldstr "sail_beam"
IL_0739: ldtoken UnityEngine.BoxCollider
IL_073e: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0743: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_0748: stloc.s V_34
IL_074a: ldloc.s V_34
IL_074c: ldc.r4 0
IL_0751: ldc.r4 1.4
IL_0756: ldc.r4 -0.9
IL_075b: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0760: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_0765: nop
IL_0766: ldloc.s V_34
IL_0768: ldc.r4 0.23
IL_076d: ldc.r4 0.55
IL_0772: ldc.r4 0.2
IL_0777: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_077c: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_0781: nop
IL_0782: ldarg.0
IL_0783: ldloc.s V_33
IL_0785: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_078a: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamTentCollider
IL_078f: ldarg.0
IL_0790: ldloc.s V_34
IL_0792: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0797: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_beamSailCollider
IL_079c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::lanternEnabled
IL_07a1: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_07a6: stloc.s V_35
IL_07a8: ldloc.s V_35
IL_07aa: brfalse IL_0866
IL_07af: nop
IL_07b0: ldloc.s V_32
IL_07b2: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_07b7: callvirt !!0 UnityEngine.GameObject::AddComponent<LongshipUpgrades.LongshipPartController>()
IL_07bc: stloc.s V_36
IL_07be: ldloc.s V_36
IL_07c0: ldstr "$lu_part_lantern_name"
IL_07c5: stfld System.String LongshipUpgrades.LongshipPartController::m_name
IL_07ca: ldloc.s V_36
IL_07cc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::lanternRemovable
IL_07d1: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_07d6: brtrue.s IL_07db
IL_07d8: ldc.i4.0
IL_07d9: br.s IL_07e0
IL_07db: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_lanternDisabled
IL_07e0: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_zdoPartDisabled
IL_07e5: ldloc.s V_36
IL_07e7: ldstr "$lu_part_lantern_enable"
IL_07ec: stfld System.String LongshipUpgrades.LongshipPartController::m_messageEnable
IL_07f1: ldloc.s V_36
IL_07f3: ldc.i4.1
IL_07f4: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_enableEffects
IL_07f9: ldloc.s V_36
IL_07fb: ldstr "$lu_part_lantern_disable"
IL_0800: stfld System.String LongshipUpgrades.LongshipPartController::m_messageDisable
IL_0805: ldloc.s V_36
IL_0807: ldc.i4.1
IL_0808: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_disableEffects
IL_080d: ldloc.s V_36
IL_080f: ldarg.0
IL_0810: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0815: stfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_081a: ldloc.s V_36
IL_081c: ldc.r4 3
IL_0821: stfld System.Single LongshipUpgrades.LongshipPartController::m_useDistance
IL_0826: ldloc.s V_36
IL_0828: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_lanternUpgraded
IL_082d: ldstr "$lu_part_lantern_upgrade"
IL_0832: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::lanternUpgradeRecipe
IL_0837: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_083c: call Piece/Requirement[] LongshipUpgrades.LongshipUpgrades::ParseRequirements(System.String)
IL_0841: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::lanternStation
IL_0846: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_084b: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::lanternStationLvl
IL_0850: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0855: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::lanternStationRange
IL_085a: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_085f: callvirt System.Void LongshipUpgrades.LongshipPartController::AddUpgradeRequirement(System.Int32,System.String,Piece/Requirement[],System.String,System.Int32,System.Int32)
IL_0864: nop
IL_0865: nop
IL_0866: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::tentEnabled
IL_086b: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0870: stloc.s V_37
IL_0872: ldloc.s V_37
IL_0874: brfalse IL_0930
IL_0879: nop
IL_087a: ldloc.s V_33
IL_087c: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0881: callvirt !!0 UnityEngine.GameObject::AddComponent<LongshipUpgrades.LongshipPartController>()
IL_0886: stloc.s V_38
IL_0888: ldloc.s V_38
IL_088a: ldstr "$lu_part_tent_name"
IL_088f: stfld System.String LongshipUpgrades.LongshipPartController::m_name
IL_0894: ldloc.s V_38
IL_0896: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::tentRemovable
IL_089b: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_08a0: brtrue.s IL_08a5
IL_08a2: ldc.i4.0
IL_08a3: br.s IL_08aa
IL_08a5: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_tentDisabled
IL_08aa: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_zdoPartDisabled
IL_08af: ldloc.s V_38
IL_08b1: ldstr "$lu_part_tent_enable"
IL_08b6: stfld System.String LongshipUpgrades.LongshipPartController::m_messageEnable
IL_08bb: ldloc.s V_38
IL_08bd: ldc.i4.0
IL_08be: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_enableEffects
IL_08c3: ldloc.s V_38
IL_08c5: ldstr "$lu_part_tent_disable"
IL_08ca: stfld System.String LongshipUpgrades.LongshipPartController::m_messageDisable
IL_08cf: ldloc.s V_38
IL_08d1: ldc.i4.0
IL_08d2: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_disableEffects
IL_08d7: ldloc.s V_38
IL_08d9: ldarg.0
IL_08da: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_08df: stfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_08e4: ldloc.s V_38
IL_08e6: ldc.r4 3
IL_08eb: stfld System.Single LongshipUpgrades.LongshipPartController::m_useDistance
IL_08f0: ldloc.s V_38
IL_08f2: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_tentUpgraded
IL_08f7: ldstr "$lu_part_tent_upgrade"
IL_08fc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::tentUpgradeRecipe
IL_0901: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_0906: call Piece/Requirement[] LongshipUpgrades.LongshipUpgrades::ParseRequirements(System.String)
IL_090b: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::tentStation
IL_0910: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_0915: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::tentStationLvl
IL_091a: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_091f: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::tentStationRange
IL_0924: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0929: callvirt System.Void LongshipUpgrades.LongshipPartController::AddUpgradeRequirement(System.Int32,System.String,Piece/Requirement[],System.String,System.Int32,System.Int32)
IL_092e: nop
IL_092f: nop
IL_0930: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::changeSail
IL_0935: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_093a: stloc.s V_39
IL_093c: ldloc.s V_39
IL_093e: brfalse.s IL_099c
IL_0940: nop
IL_0941: ldloc.s V_34
IL_0943: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0948: callvirt !!0 UnityEngine.GameObject::AddComponent<LongshipUpgrades.LongshipPartController>()
IL_094d: stloc.s V_40
IL_094f: ldloc.s V_40
IL_0951: ldstr "$lu_part_sail_name"
IL_0956: stfld System.String LongshipUpgrades.LongshipPartController::m_name
IL_095b: ldloc.s V_40
IL_095d: ldarg.0
IL_095e: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0963: stfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_0968: ldloc.s V_40
IL_096a: ldstr "$lu_part_sail_switch"
IL_096f: stfld System.String LongshipUpgrades.LongshipPartController::m_messageSwitch
IL_0974: ldloc.s V_40
IL_0976: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_sailStyle
IL_097b: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_zdoPartVariant
IL_0980: ldloc.s V_40
IL_0982: ldsfld System.Collections.Generic.List`1<UnityEngine.Texture2D> LongshipUpgrades.LongshipCustomizableParts::customSails
IL_0987: callvirt System.Int32 System.Collections.Generic.List`1<UnityEngine.Texture2D>::get_Count()
IL_098c: ldc.i4.1
IL_098d: add
IL_098e: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_variants
IL_0993: ldloc.s V_40
IL_0995: ldc.i4.0
IL_0996: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_switchEffects
IL_099b: nop
IL_099c: nop
IL_099d: ldloc.0
IL_099e: ldstr "ShipTen2 (1)"
IL_09a3: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_09a8: stloc.3
IL_09a9: ldloc.3
IL_09aa: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_09af: stloc.s V_41
IL_09b1: ldloc.s V_41
IL_09b3: brfalse IL_0bcb
IL_09b8: nop
IL_09b9: ldarg.0
IL_09ba: ldloc.3
IL_09bb: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_09c0: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_tent
IL_09c5: ldstr "colliders"
IL_09ca: newobj System.Void UnityEngine.GameObject::.ctor(System.String)
IL_09cf: call UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_09d4: stloc.s V_42
IL_09d6: ldloc.s V_42
IL_09d8: ldarg.0
IL_09d9: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_tent
IL_09de: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_09e3: ldc.i4.0
IL_09e4: callvirt System.Void UnityEngine.Transform::SetParent(UnityEngine.Transform,System.Boolean)
IL_09e9: nop
IL_09ea: ldloc.s V_42
IL_09ec: ldstr "collider_right"
IL_09f1: ldtoken UnityEngine.BoxCollider
IL_09f6: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_09fb: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_0a00: stloc.s V_43
IL_0a02: ldloc.s V_43
IL_0a04: ldc.r4 1.58
IL_0a09: ldc.r4 1.18
IL_0a0e: ldc.r4 -0.65
IL_0a13: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0a18: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_0a1d: nop
IL_0a1e: ldloc.s V_43
IL_0a20: ldc.r4 1.9
IL_0a25: ldc.r4 0.01
IL_0a2a: ldc.r4 2.6
IL_0a2f: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0a34: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_0a39: nop
IL_0a3a: ldloc.s V_43
IL_0a3c: ldc.r4 0
IL_0a41: ldc.r4 0
IL_0a46: ldc.r4 -6
IL_0a4b: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0a50: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_0a55: nop
IL_0a56: ldloc.s V_42
IL_0a58: ldstr "collider_left"
IL_0a5d: ldtoken UnityEngine.BoxCollider
IL_0a62: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0a67: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_0a6c: stloc.s V_44
IL_0a6e: ldloc.s V_44
IL_0a70: ldc.r4 -1.05
IL_0a75: ldc.r4 0.95
IL_0a7a: ldc.r4 -0.65
IL_0a7f: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0a84: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_0a89: nop
IL_0a8a: ldloc.s V_44
IL_0a8c: ldc.r4 1
IL_0a91: ldc.r4 0.01
IL_0a96: ldc.r4 2.5
IL_0a9b: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0aa0: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_0aa5: nop
IL_0aa6: ldloc.s V_44
IL_0aa8: ldc.r4 0
IL_0aad: ldc.r4 0
IL_0ab2: ldc.r4 23
IL_0ab7: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0abc: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_0ac1: nop
IL_0ac2: ldloc.s V_42
IL_0ac4: ldstr "collider_left (1)"
IL_0ac9: ldtoken UnityEngine.BoxCollider
IL_0ace: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0ad3: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_0ad8: stloc.s V_45
IL_0ada: ldloc.s V_45
IL_0adc: ldc.r4 -2.1
IL_0ae1: ldc.r4 0.7
IL_0ae6: ldc.r4 -0.55
IL_0aeb: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0af0: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_0af5: nop
IL_0af6: ldloc.s V_45
IL_0af8: ldc.r4 1.15
IL_0afd: ldc.r4 0.01
IL_0b02: ldc.r4 3
IL_0b07: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0b0c: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_0b11: nop
IL_0b12: ldloc.s V_45
IL_0b14: ldc.r4 0
IL_0b19: ldc.r4 0
IL_0b1e: ldc.r4 6
IL_0b23: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0b28: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_0b2d: nop
IL_0b2e: ldarg.0
IL_0b2f: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_tent
IL_0b34: ldc.i4.0
IL_0b35: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0b3a: nop
IL_0b3b: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::changeTent
IL_0b40: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0b45: stloc.s V_46
IL_0b47: ldloc.s V_46
IL_0b49: brfalse.s IL_0bca
IL_0b4b: ldc.i4.0
IL_0b4c: stloc.s V_47
IL_0b4e: br.s IL_0bb9
IL_0b50: nop
IL_0b51: ldloc.s V_42
IL_0b53: ldloc.s V_47
IL_0b55: callvirt UnityEngine.Transform UnityEngine.Transform::GetChild(System.Int32)
IL_0b5a: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0b5f: callvirt !!0 UnityEngine.GameObject::AddComponent<LongshipUpgrades.LongshipPartController>()
IL_0b64: stloc.s V_48
IL_0b66: ldloc.s V_48
IL_0b68: ldstr "$lu_part_tent_name"
IL_0b6d: stfld System.String LongshipUpgrades.LongshipPartController::m_name
IL_0b72: ldloc.s V_48
IL_0b74: ldarg.0
IL_0b75: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0b7a: stfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_0b7f: ldloc.s V_48
IL_0b81: ldstr "$lu_part_tent_switch"
IL_0b86: stfld System.String LongshipUpgrades.LongshipPartController::m_messageSwitch
IL_0b8b: ldloc.s V_48
IL_0b8d: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_tentStyle
IL_0b92: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_zdoPartVariant
IL_0b97: ldloc.s V_48
IL_0b99: ldsfld System.Collections.Generic.List`1<UnityEngine.Texture2D> LongshipUpgrades.LongshipCustomizableParts::customTents
IL_0b9e: callvirt System.Int32 System.Collections.Generic.List`1<UnityEngine.Texture2D>::get_Count()
IL_0ba3: ldc.i4.1
IL_0ba4: add
IL_0ba5: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_variants
IL_0baa: ldloc.s V_48
IL_0bac: ldc.i4.0
IL_0bad: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_switchEffects
IL_0bb2: nop
IL_0bb3: ldloc.s V_47
IL_0bb5: ldc.i4.1
IL_0bb6: add
IL_0bb7: stloc.s V_47
IL_0bb9: ldloc.s V_47
IL_0bbb: ldloc.s V_42
IL_0bbd: callvirt System.Int32 UnityEngine.Transform::get_childCount()
IL_0bc2: clt
IL_0bc4: stloc.s V_49
IL_0bc6: ldloc.s V_49
IL_0bc8: brtrue.s IL_0b50
IL_0bca: nop
IL_0bcb: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_lanternPrefab
IL_0bd0: ldnull
IL_0bd1: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0bd6: stloc.s V_50
IL_0bd8: ldloc.s V_50
IL_0bda: brfalse.s IL_0c17
IL_0bdc: call ObjectDB ObjectDB::get_instance()
IL_0be1: ldstr "Lantern"
IL_0be6: callvirt UnityEngine.GameObject ObjectDB::GetItemPrefab(System.String)
IL_0beb: dup
IL_0bec: brtrue.s IL_0bf2
IL_0bee: pop
IL_0bef: ldnull
IL_0bf0: br.s IL_0c0d
IL_0bf2: call UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0bf7: ldstr "attach/equiped"
IL_0bfc: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0c01: dup
IL_0c02: brtrue.s IL_0c08
IL_0c04: pop
IL_0c05: ldnull
IL_0c06: br.s IL_0c0d
IL_0c08: call UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0c0d: call UnityEngine.GameObject LongshipUpgrades.PrefabAudio::Clone(UnityEngine.GameObject)
IL_0c12: stsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_lanternPrefab
IL_0c17: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_lanternPrefab
IL_0c1c: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0c21: stloc.s V_51
IL_0c23: ldloc.s V_51
IL_0c25: brfalse IL_0fe2
IL_0c2a: nop
IL_0c2b: ldarg.0
IL_0c2c: ldstr "Lantern"
IL_0c31: newobj System.Void UnityEngine.GameObject::.ctor(System.String)
IL_0c36: dup
IL_0c37: ldc.i4.s 28
IL_0c39: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_0c3e: nop
IL_0c3f: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_lantern
IL_0c44: ldarg.0
IL_0c45: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_lantern
IL_0c4a: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0c4f: stloc.s V_52
IL_0c51: ldloc.s V_52
IL_0c53: ldloc.0
IL_0c54: ldc.i4.0
IL_0c55: callvirt System.Void UnityEngine.Transform::SetParent(UnityEngine.Transform,System.Boolean)
IL_0c5a: nop
IL_0c5b: ldloc.s V_52
IL_0c5d: call UnityEngine.Vector3 UnityEngine.Vector3::get_one()
IL_0c62: ldc.r4 0.45
IL_0c67: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_0c6c: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_0c71: nop
IL_0c72: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_lanternPrefab
IL_0c77: ldloc.s V_52
IL_0c79: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Transform)
IL_0c7e: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0c83: stloc.s V_53
IL_0c85: ldloc.s V_53
IL_0c87: ldstr "Lamp"
IL_0c8c: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_0c91: nop
IL_0c92: ldloc.s V_53
IL_0c94: ldc.r4 0.23
IL_0c99: ldc.r4 1.9
IL_0c9e: ldc.r4 0
IL_0ca3: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0ca8: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_0cad: nop
IL_0cae: ldloc.s V_53
IL_0cb0: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0cb5: ldc.i4.s 28
IL_0cb7: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_0cbc: nop
IL_0cbd: ldarg.0
IL_0cbe: ldloc.s V_53
IL_0cc0: callvirt !!0 UnityEngine.Component::GetComponentInChildren<UnityEngine.Light>()
IL_0cc5: stfld UnityEngine.Light LongshipUpgrades.LongshipCustomizableParts::m_light
IL_0cca: ldarg.0
IL_0ccb: ldfld UnityEngine.Light LongshipUpgrades.LongshipCustomizableParts::m_light
IL_0cd0: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> LongshipUpgrades.LongshipUpgrades::lanternLightColor
IL_0cd5: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_0cda: callvirt System.Void UnityEngine.Light::set_color(UnityEngine.Color)
IL_0cdf: nop
IL_0ce0: ldarg.0
IL_0ce1: ldloc.s V_53
IL_0ce3: ldstr "flare"
IL_0ce8: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0ced: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.ParticleSystem>()
IL_0cf2: stfld UnityEngine.ParticleSystem LongshipUpgrades.LongshipCustomizableParts::m_flare
IL_0cf7: ldsfld UnityEngine.Color LongshipUpgrades.LongshipCustomizableParts::flareColor
IL_0cfc: call UnityEngine.Color UnityEngine.Color::get_clear()
IL_0d01: call System.Boolean UnityEngine.Color::op_Equality(UnityEngine.Color,UnityEngine.Color)
IL_0d06: stloc.s V_59
IL_0d08: ldloc.s V_59
IL_0d0a: brfalse.s IL_0d2e
IL_0d0c: ldarg.0
IL_0d0d: ldfld UnityEngine.ParticleSystem LongshipUpgrades.LongshipCustomizableParts::m_flare
IL_0d12: callvirt UnityEngine.ParticleSystem/MainModule UnityEngine.ParticleSystem::get_main()
IL_0d17: stloc.s V_60
IL_0d19: ldloca.s V_60
IL_0d1b: call UnityEngine.ParticleSystem/MinMaxGradient UnityEngine.ParticleSystem/MainModule::get_startColor()
IL_0d20: stloc.s V_61
IL_0d22: ldloca.s V_61
IL_0d24: call UnityEngine.Color UnityEngine.ParticleSystem/MinMaxGradient::get_color()
IL_0d29: stsfld UnityEngine.Color LongshipUpgrades.LongshipCustomizableParts::flareColor
IL_0d2e: ldarg.0
IL_0d2f: ldloc.s V_53
IL_0d31: ldstr "default"
IL_0d36: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0d3b: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.MeshRenderer>()
IL_0d40: stfld UnityEngine.MeshRenderer LongshipUpgrades.LongshipCustomizableParts::m_lampRenderer
IL_0d45: ldloc.s V_53
IL_0d47: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.ConfigurableJoint>()
IL_0d4c: stloc.s V_54
IL_0d4e: ldloc.s V_54
IL_0d50: ldc.i4.0
IL_0d51: callvirt System.Void UnityEngine.Joint::set_autoConfigureConnectedAnchor(System.Boolean)
IL_0d56: nop
IL_0d57: ldloc.s V_54
IL_0d59: ldarg.0
IL_0d5a: call !!0 UnityEngine.Component::GetComponent<UnityEngine.Rigidbody>()
IL_0d5f: callvirt System.Void UnityEngine.Joint::set_connectedBody(UnityEngine.Rigidbody)
IL_0d64: nop
IL_0d65: ldloc.s V_54
IL_0d67: ldc.r4 0
IL_0d6c: ldc.r4 3.01
IL_0d71: ldc.r4 -0.45
IL_0d76: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0d7b: callvirt System.Void UnityEngine.Joint::set_connectedAnchor(UnityEngine.Vector3)
IL_0d80: nop
IL_0d81: ldloc.s V_53
IL_0d83: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.CapsuleCollider>()
IL_0d88: ldc.r4 0.44
IL_0d8d: callvirt System.Void UnityEngine.CapsuleCollider::set_height(System.Single)
IL_0d92: nop
IL_0d93: ldloc.s V_52
IL_0d95: ldstr "collider"
IL_0d9a: ldtoken UnityEngine.BoxCollider
IL_0d9f: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0da4: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_0da9: stloc.s V_55
IL_0dab: ldloc.s V_55
IL_0dad: ldc.r4 0.2
IL_0db2: ldc.r4 2
IL_0db7: ldc.r4 0
IL_0dbc: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0dc1: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_0dc6: nop
IL_0dc7: ldloc.s V_55
IL_0dc9: ldc.r4 0.02
IL_0dce: ldc.r4 0.02
IL_0dd3: ldc.r4 0.5
IL_0dd8: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0ddd: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_0de2: nop
IL_0de3: ldloc.s V_55
IL_0de5: ldc.r4 90
IL_0dea: ldc.r4 0
IL_0def: ldc.r4 0
IL_0df4: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0df9: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_0dfe: nop
IL_0dff: ldloc.0
IL_0e00: ldstr "TraderLamp"
IL_0e05: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0e0a: stloc.s V_56
IL_0e0c: ldloc.s V_56
IL_0e0e: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0e13: stloc.s V_62
IL_0e15: ldloc.s V_62
IL_0e17: brfalse IL_0ead
IL_0e1c: nop
IL_0e1d: ldloc.s V_56
IL_0e1f: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0e24: ldc.i4.0
IL_0e25: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0e2a: nop
IL_0e2b: ldloc.s V_56
IL_0e2d: ldstr "insects"
IL_0e32: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0e37: stloc.s V_63
IL_0e39: ldloc.s V_63
IL_0e3b: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0e40: stloc.s V_64
IL_0e42: ldloc.s V_64
IL_0e44: brfalse.s IL_0eac
IL_0e46: nop
IL_0e47: ldarg.0
IL_0e48: ldloc.s V_63
IL_0e4a: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0e4f: ldloc.s V_52
IL_0e51: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Transform)
IL_0e56: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_insects
IL_0e5b: ldarg.0
IL_0e5c: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_insects
IL_0e61: ldstr "insects"
IL_0e66: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_0e6b: nop
IL_0e6c: ldarg.0
IL_0e6d: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_insects
IL_0e72: ldc.i4.0
IL_0e73: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0e78: nop
IL_0e79: ldarg.0
IL_0e7a: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_insects
IL_0e7f: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0e84: ldc.r4 0.42
IL_0e89: ldc.r4 1.85
IL_0e8e: ldc.r4 0
IL_0e93: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0e98: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_0e9d: nop
IL_0e9e: ldarg.0
IL_0e9f: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_insects
IL_0ea4: ldc.i4.8
IL_0ea5: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_0eaa: nop
IL_0eab: nop
IL_0eac: nop
IL_0ead: ldloc.0
IL_0eae: ldstr "FireWarmth"
IL_0eb3: ldtoken UnityEngine.SphereCollider
IL_0eb8: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0ebd: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_0ec2: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0ec7: stloc.s V_57
IL_0ec9: ldloc.s V_57
IL_0ecb: ldc.i4.s 14
IL_0ecd: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_0ed2: nop
IL_0ed3: ldloc.s V_57
IL_0ed5: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0eda: ldc.r4 -1
IL_0edf: ldc.r4 0
IL_0ee4: ldc.r4 0
IL_0ee9: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0eee: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_0ef3: nop
IL_0ef4: ldloc.s V_57
IL_0ef6: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0efb: call UnityEngine.Vector3 UnityEngine.Vector3::get_one()
IL_0f00: ldc.r4 0.45
IL_0f05: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_0f0a: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_0f0f: nop
IL_0f10: ldloc.s V_57
IL_0f12: callvirt !!0 UnityEngine.GameObject::GetComponent<UnityEngine.SphereCollider>()
IL_0f17: stloc.s V_58
IL_0f19: ldloc.s V_58
IL_0f1b: ldc.r4 3
IL_0f20: callvirt System.Void UnityEngine.SphereCollider::set_radius(System.Single)
IL_0f25: nop
IL_0f26: ldloc.s V_58
IL_0f28: ldc.i4.1
IL_0f29: callvirt System.Void UnityEngine.Collider::set_isTrigger(System.Boolean)
IL_0f2e: nop
IL_0f2f: ldarg.0
IL_0f30: ldloc.s V_57
IL_0f32: callvirt UnityEngine.GameObject UnityEngine.GameObject::get_gameObject()
IL_0f37: callvirt !!0 UnityEngine.GameObject::AddComponent<EffectArea>()
IL_0f3c: stfld EffectArea LongshipUpgrades.LongshipCustomizableParts::m_fireWarmth
IL_0f41: ldarg.0
IL_0f42: ldfld EffectArea LongshipUpgrades.LongshipCustomizableParts::m_fireWarmth
IL_0f47: ldc.i4.1
IL_0f48: stfld System.Boolean EffectArea::m_playerOnly
IL_0f4d: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::lanternSwitchable
IL_0f52: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0f57: stloc.s V_65
IL_0f59: ldloc.s V_65
IL_0f5b: brfalse.s IL_0fc6
IL_0f5d: nop
IL_0f5e: ldloc.s V_52
IL_0f60: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0f65: callvirt !!0 UnityEngine.GameObject::AddComponent<LongshipUpgrades.LongshipPartController>()
IL_0f6a: stloc.s V_66
IL_0f6c: ldloc.s V_66
IL_0f6e: ldstr "$lu_part_lamp_name"
IL_0f73: stfld System.String LongshipUpgrades.LongshipPartController::m_name
IL_0f78: ldloc.s V_66
IL_0f7a: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_lightsDisabled
IL_0f7f: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_zdoPartDisabled
IL_0f84: ldloc.s V_66
IL_0f86: ldstr "$lu_part_lamp_enable"
IL_0f8b: stfld System.String LongshipUpgrades.LongshipPartController::m_messageEnable
IL_0f90: ldloc.s V_66
IL_0f92: ldstr "$lu_part_lamp_disable"
IL_0f97: stfld System.String LongshipUpgrades.LongshipPartController::m_messageDisable
IL_0f9c: ldloc.s V_66
IL_0f9e: ldc.i4.2
IL_0f9f: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_enableEffects
IL_0fa4: ldloc.s V_66
IL_0fa6: ldc.i4.3
IL_0fa7: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_disableEffects
IL_0fac: ldloc.s V_66
IL_0fae: ldarg.0
IL_0faf: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0fb4: stfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_0fb9: ldloc.s V_66
IL_0fbb: ldc.r4 2
IL_0fc0: stfld System.Single LongshipUpgrades.LongshipPartController::m_useDistance
IL_0fc5: nop
IL_0fc6: ldloc.s V_53
IL_0fc8: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0fcd: ldc.i4.1
IL_0fce: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0fd3: nop
IL_0fd4: ldarg.0
IL_0fd5: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_lantern
IL_0fda: ldc.i4.0
IL_0fdb: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0fe0: nop
IL_0fe1: nop
IL_0fe2: ldstr "interactive"
IL_0fe7: newobj System.Void UnityEngine.GameObject::.ctor(System.String)
IL_0fec: stloc.s V_4
IL_0fee: ldloc.s V_4
IL_0ff0: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0ff5: stloc.s V_5
IL_0ff7: ldloc.s V_5
IL_0ff9: ldloc.0
IL_0ffa: ldc.i4.0
IL_0ffb: callvirt System.Void UnityEngine.Transform::SetParent(UnityEngine.Transform,System.Boolean)
IL_1000: nop
IL_1001: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::mastEnabled
IL_1006: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_100b: brtrue.s IL_1019
IL_100d: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::mastRemovable
IL_1012: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_1017: br.s IL_101a
IL_1019: ldc.i4.1
IL_101a: stloc.s V_67
IL_101c: ldloc.s V_67
IL_101e: brfalse IL_1161
IL_1023: nop
IL_1024: ldloc.s V_5
IL_1026: ldstr "mast_controller"
IL_102b: ldtoken UnityEngine.BoxCollider
IL_1030: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_1035: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_103a: stloc.s V_68
IL_103c: ldloc.s V_68
IL_103e: ldc.r4 -0.05
IL_1043: ldc.r4 0.08
IL_1048: ldc.r4 0
IL_104d: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_1052: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_1057: nop
IL_1058: ldloc.s V_68
IL_105a: ldc.r4 0.6
IL_105f: ldc.r4 0.17
IL_1064: ldc.r4 0.26
IL_1069: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_106e: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_1073: nop
IL_1074: ldarg.0
IL_1075: ldloc.s V_68
IL_1077: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_107c: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mastUpgrade
IL_1081: ldarg.0
IL_1082: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mastUpgrade
IL_1087: ldc.i4.s 16
IL_1089: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_108e: nop
IL_108f: ldarg.0
IL_1090: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mastUpgrade
IL_1095: ldc.i4.1
IL_1096: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_109b: nop
IL_109c: ldloc.s V_68
IL_109e: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_10a3: callvirt !!0 UnityEngine.GameObject::AddComponent<LongshipUpgrades.LongshipPartController>()
IL_10a8: stloc.s V_69
IL_10aa: ldloc.s V_69
IL_10ac: ldstr "$lu_part_mast_name"
IL_10b1: stfld System.String LongshipUpgrades.LongshipPartController::m_name
IL_10b6: ldloc.s V_69
IL_10b8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::mastRemovable
IL_10bd: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_10c2: brtrue.s IL_10c7
IL_10c4: ldc.i4.0
IL_10c5: br.s IL_10cc
IL_10c7: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_mastRemoved
IL_10cc: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_zdoPartDisabled
IL_10d1: ldloc.s V_69
IL_10d3: ldstr "$lu_part_mast_enable"
IL_10d8: stfld System.String LongshipUpgrades.LongshipPartController::m_messageEnable
IL_10dd: ldloc.s V_69
IL_10df: ldstr "$lu_part_mast_disable"
IL_10e4: stfld System.String LongshipUpgrades.LongshipPartController::m_messageDisable
IL_10e9: ldloc.s V_69
IL_10eb: ldc.i4.1
IL_10ec: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_enableEffects
IL_10f1: ldloc.s V_69
IL_10f3: ldc.i4.1
IL_10f4: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_disableEffects
IL_10f9: ldloc.s V_69
IL_10fb: ldarg.0
IL_10fc: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_1101: stfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_1106: ldloc.s V_69
IL_1108: ldc.r4 2.5
IL_110d: stfld System.Single LongshipUpgrades.LongshipPartController::m_useDistance
IL_1112: ldloc.s V_69
IL_1114: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::mastEnabled
IL_1119: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_111e: brtrue.s IL_1123
IL_1120: ldc.i4.0
IL_1121: br.s IL_1128
IL_1123: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_mastUpgraded
IL_1128: ldstr "$lu_part_mast_upgrade"
IL_112d: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::mastUpgradeRecipe
IL_1132: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_1137: call Piece/Requirement[] LongshipUpgrades.LongshipUpgrades::ParseRequirements(System.String)
IL_113c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::mastStation
IL_1141: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_1146: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::mastStationLvl
IL_114b: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_1150: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::mastStationRange
IL_1155: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_115a: callvirt System.Void LongshipUpgrades.LongshipPartController::AddUpgradeRequirement(System.Int32,System.String,Piece/Requirement[],System.String,System.Int32,System.Int32)
IL_115f: nop
IL_1160: nop
IL_1161: ldarg.0
IL_1162: ldfld Container LongshipUpgrades.LongshipCustomizableParts::m_container
IL_1167: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_116c: stloc.s V_70
IL_116e: ldloc.s V_70
IL_1170: brfalse IL_1308
IL_1175: nop
IL_1176: ldloc.s V_5
IL_1178: ldstr "storage_controller"
IL_117d: ldtoken UnityEngine.BoxCollider
IL_1182: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_1187: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_118c: stloc.s V_71
IL_118e: ldloc.s V_71
IL_1190: ldc.r4 -1.9
IL_1195: ldc.r4 -0.02
IL_119a: ldc.r4 0
IL_119f: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_11a4: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_11a9: nop
IL_11aa: ldloc.s V_71
IL_11ac: ldc.r4 0.45
IL_11b1: ldc.r4 0.45
IL_11b6: ldc.r4 0.18
IL_11bb: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_11c0: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_11c5: nop
IL_11c6: ldloc.s V_71
IL_11c8: ldc.r4 0
IL_11cd: ldc.r4 270
IL_11d2: ldc.r4 0
IL_11d7: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_11dc: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_11e1: nop
IL_11e2: ldarg.0
IL_11e3: ldfld Container LongshipUpgrades.LongshipCustomizableParts::m_container
IL_11e8: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.BoxCollider>()
IL_11ed: stloc.s V_72
IL_11ef: ldloc.s V_71
IL_11f1: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.BoxCollider>()
IL_11f6: stloc.s V_73
IL_11f8: ldloc.s V_73
IL_11fa: ldloc.s V_72
IL_11fc: callvirt UnityEngine.Vector3 UnityEngine.BoxCollider::get_center()
IL_1201: callvirt System.Void UnityEngine.BoxCollider::set_center(UnityEngine.Vector3)
IL_1206: nop
IL_1207: ldloc.s V_73
IL_1209: ldloc.s V_72
IL_120b: callvirt UnityEngine.Vector3 UnityEngine.BoxCollider::get_size()
IL_1210: callvirt System.Void UnityEngine.BoxCollider::set_size(UnityEngine.Vector3)
IL_1215: nop
IL_1216: ldloc.s V_71
IL_1218: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_121d: callvirt !!0 UnityEngine.GameObject::AddComponent<LongshipUpgrades.LongshipPartController>()
IL_1222: stloc.s V_74
IL_1224: ldloc.s V_74
IL_1226: ldarg.0
IL_1227: ldfld Container LongshipUpgrades.LongshipCustomizableParts::m_container
IL_122c: ldfld System.String Container::m_name
IL_1231: ldstr "$"
IL_1236: callvirt System.Boolean System.String::StartsWith(System.String)
IL_123b: brtrue.s IL_1244
IL_123d: ldstr "$msg_cart_storage"
IL_1242: br.s IL_124f
IL_1244: ldarg.0
IL_1245: ldfld Container LongshipUpgrades.LongshipCustomizableParts::m_container
IL_124a: ldfld System.String Container::m_name
IL_124f: stfld System.String LongshipUpgrades.LongshipPartController::m_name
IL_1254: ldloc.s V_74
IL_1256: ldarg.0
IL_1257: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_125c: stfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_1261: ldloc.s V_74
IL_1263: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_containerUpgradedLvl1
IL_1268: ldstr "$lu_part_container_upgrade1"
IL_126d: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::containerLvl1UpgradeRecipe
IL_1272: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_1277: call Piece/Requirement[] LongshipUpgrades.LongshipUpgrades::ParseRequirements(System.String)
IL_127c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::containerLvl1Station
IL_1281: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_1286: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerLvl1StationLvl
IL_128b: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_1290: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerLvl1StationRange
IL_1295: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_129a: callvirt System.Void LongshipUpgrades.LongshipPartController::AddUpgradeRequirement(System.Int32,System.String,Piece/Requirement[],System.String,System.Int32,System.Int32)
IL_129f: nop
IL_12a0: ldloc.s V_74
IL_12a2: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_containerUpgradedLvl2
IL_12a7: ldstr "$lu_part_container_upgrade2"
IL_12ac: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::containerLvl2UpgradeRecipe
IL_12b1: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_12b6: call Piece/Requirement[] LongshipUpgrades.LongshipUpgrades::ParseRequirements(System.String)
IL_12bb: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::containerLvl2Station
IL_12c0: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_12c5: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerLvl2StationLvl
IL_12ca: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_12cf: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerLvl2StationRange
IL_12d4: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_12d9: callvirt System.Void LongshipUpgrades.LongshipPartController::AddUpgradeRequirement(System.Int32,System.String,Piece/Requirement[],System.String,System.Int32,System.Int32)
IL_12de: nop
IL_12df: ldarg.0
IL_12e0: ldloc.s V_71
IL_12e2: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_12e7: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_storageUpgrade
IL_12ec: ldarg.0
IL_12ed: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_storageUpgrade
IL_12f2: ldc.i4.s 16
IL_12f4: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_12f9: nop
IL_12fa: ldarg.0
IL_12fb: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_storageUpgrade
IL_1300: ldc.i4.0
IL_1301: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_1306: nop
IL_1307: nop
IL_1308: ldarg.0
IL_1309: ldfld UnityEngine.GameObject[] LongshipUpgrades.LongshipCustomizableParts::m_protectiveParts
IL_130e: ldnull
IL_130f: cgt.un
IL_1311: stloc.s V_75
IL_1313: ldloc.s V_75
IL_1315: brfalse IL_13ff
IL_131a: nop
IL_131b: ldarg.0
IL_131c: ldstr "health"
IL_1321: newobj System.Void UnityEngine.GameObject::.ctor(System.String)
IL_1326: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_healthUpgrade
IL_132b: ldloca.s V_76
IL_132d: ldarg.0
IL_132e: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_healthUpgrade
IL_1333: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_1338: stfld UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts/<>c__DisplayClass138_0::healthParent
IL_133d: ldloc.s V_76
IL_133f: ldfld UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts/<>c__DisplayClass138_0::healthParent
IL_1344: ldloc.s V_5
IL_1346: ldc.i4.0
IL_1347: callvirt System.Void UnityEngine.Transform::SetParent(UnityEngine.Transform,System.Boolean)
IL_134c: nop
IL_134d: ldarg.0
IL_134e: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_1353: ldstr "ship/colliders/left_side"
IL_1358: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_135d: stloc.s V_77
IL_135f: ldloc.s V_77
IL_1361: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_1366: stloc.s V_79
IL_1368: ldloc.s V_79
IL_136a: brfalse.s IL_13a5
IL_136c: ldc.i4.1
IL_136d: stloc.s V_80
IL_136f: br.s IL_138e
IL_1371: ldarg.0
IL_1372: ldloc.s V_77
IL_1374: ldloc.s V_80
IL_1376: ldstr "health_controller_left"
IL_137b: ldc.r4 0.01
IL_1380: ldloca.s V_76
IL_1382: call System.Void LongshipUpgrades.LongshipCustomizableParts::<InitializeParts>g__AddHealthController|138_2(UnityEngine.Transform,System.Int32,System.String,System.Single,LongshipUpgrades.LongshipCustomizableParts/<>c__DisplayClass138_0&)
IL_1387: nop
IL_1388: ldloc.s V_80
IL_138a: ldc.i4.1
IL_138b: add
IL_138c: stloc.s V_80
IL_138e: ldloc.s V_80
IL_1390: ldloc.s V_77
IL_1392: callvirt System.Int32 UnityEngine.Transform::get_childCount()
IL_1397: ldc.i4.5
IL_1398: call System.Int32 UnityEngine.Mathf::Min(System.Int32,System.Int32)
IL_139d: clt
IL_139f: stloc.s V_81
IL_13a1: ldloc.s V_81
IL_13a3: brtrue.s IL_1371
IL_13a5: ldarg.0
IL_13a6: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_13ab: ldstr "ship/colliders/left_side (1)"
IL_13b0: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_13b5: stloc.s V_78
IL_13b7: ldloc.s V_78
IL_13b9: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_13be: stloc.s V_82
IL_13c0: ldloc.s V_82
IL_13c2: brfalse.s IL_13fd
IL_13c4: ldc.i4.1
IL_13c5: stloc.s V_83
IL_13c7: br.s IL_13e6
IL_13c9: ldarg.0
IL_13ca: ldloc.s V_78
IL_13cc: ldloc.s V_83
IL_13ce: ldstr "health_controller_right"
IL_13d3: ldc.r4 -0.01
IL_13d8: ldloca.s V_76
IL_13da: call System.Void LongshipUpgrades.LongshipCustomizableParts::<InitializeParts>g__AddHealthController|138_2(UnityEngine.Transform,System.Int32,System.String,System.Single,LongshipUpgrades.LongshipCustomizableParts/<>c__DisplayClass138_0&)
IL_13df: nop
IL_13e0: ldloc.s V_83
IL_13e2: ldc.i4.1
IL_13e3: add
IL_13e4: stloc.s V_83
IL_13e6: ldloc.s V_83
IL_13e8: ldloc.s V_78
IL_13ea: callvirt System.Int32 UnityEngine.Transform::get_childCount()
IL_13ef: ldc.i4.5
IL_13f0: call System.Int32 UnityEngine.Mathf::Min(System.Int32,System.Int32)
IL_13f5: clt
IL_13f7: stloc.s V_84
IL_13f9: ldloc.s V_84
IL_13fb: brtrue.s IL_13c9
IL_13fd: nop
IL_13fe: nop
IL_13ff: ldarg.0
IL_1400: ldfld UnityEngine.GameObject[] LongshipUpgrades.LongshipCustomizableParts::m_protectiveParts
IL_1405: ldnull
IL_1406: cgt.un
IL_1408: stloc.s V_85
IL_140a: ldloc.s V_85
IL_140c: brfalse IL_1757
IL_1411: nop
IL_1412: ldarg.0
IL_1413: ldstr "shields"
IL_1418: newobj System.Void UnityEngine.GameObject::.ctor(System.String)
IL_141d: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_shieldsStyles
IL_1422: ldarg.0
IL_1423: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_shieldsStyles
IL_1428: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_142d: stloc.s V_86
IL_142f: ldloc.s V_86
IL_1431: ldloc.s V_5
IL_1433: ldc.i4.0
IL_1434: callvirt System.Void UnityEngine.Transform::SetParent(UnityEngine.Transform,System.Boolean)
IL_1439: nop
IL_143a: ldloc.s V_86
IL_143c: ldstr "shield_controller_right"
IL_1441: ldtoken UnityEngine.BoxCollider
IL_1446: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_144b: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_1450: stloc.s V_87
IL_1452: ldloc.s V_87
IL_1454: ldc.r4 -1.16
IL_1459: ldc.r4 0.2
IL_145e: ldc.r4 1.11
IL_1463: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_1468: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_146d: nop
IL_146e: ldloc.s V_87
IL_1470: ldc.r4 0.95
IL_1475: ldc.r4 0.45
IL_147a: ldc.r4 0.05
IL_147f: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_1484: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_1489: nop
IL_148a: ldloc.s V_87
IL_148c: ldc.r4 3
IL_1491: ldc.r4 355
IL_1496: ldc.r4 0
IL_149b: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_14a0: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_14a5: nop
IL_14a6: ldloc.s V_86
IL_14a8: ldstr "shield_controller_right (1)"
IL_14ad: ldtoken UnityEngine.BoxCollider
IL_14b2: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_14b7: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_14bc: stloc.s V_88
IL_14be: ldloc.s V_88
IL_14c0: ldc.r4 -0.23
IL_14c5: ldc.r4 0.2
IL_14ca: ldc.r4 1.16
IL_14cf: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_14d4: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_14d9: nop
IL_14da: ldloc.s V_88
IL_14dc: ldc.r4 0.91
IL_14e1: ldc.r4 0.43
IL_14e6: ldc.r4 0.05
IL_14eb: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_14f0: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_14f5: nop
IL_14f6: ldloc.s V_88
IL_14f8: ldc.r4 3
IL_14fd: ldc.r4 0
IL_1502: ldc.r4 0
IL_1507: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_150c: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_1511: nop
IL_1512: ldloc.s V_86
IL_1514: ldstr "shield_controller_right (2)"
IL_1519: ldtoken UnityEngine.BoxCollider
IL_151e: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_1523: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_1528: stloc.s V_89
IL_152a: ldloc.s V_89
IL_152c: ldc.r4 1.35
IL_1531: ldc.r4 0.16
IL_1536: ldc.r4 1.05
IL_153b: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_1540: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_1545: nop
IL_1546: ldloc.s V_89
IL_1548: ldc.r4 1.5
IL_154d: ldc.r4 0.45
IL_1552: ldc.r4 0.05
IL_1557: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_155c: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_1561: nop
IL_1562: ldloc.s V_89
IL_1564: ldc.r4 3
IL_1569: ldc.r4 8
IL_156e: ldc.r4 0
IL_1573: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_1578: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_157d: nop
IL_157e: ldloc.s V_86
IL_1580: ldstr "shield_controller_left"
IL_1585: ldtoken UnityEngine.BoxCollider
IL_158a: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_158f: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_1594: stloc.s V_90
IL_1596: ldloc.s V_90
IL_1598: ldc.r4 -1.18
IL_159d: ldc.r4 0.27
IL_15a2: ldc.r4 -1.11
IL_15a7: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_15ac: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_15b1: nop
IL_15b2: ldloc.s V_90
IL_15b4: ldc.r4 0.95
IL_15b9: ldc.r4 0.45
IL_15be: ldc.r4 0.05
IL_15c3: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_15c8: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_15cd: nop
IL_15ce: ldloc.s V_90
IL_15d0: ldc.r4 0
IL_15d5: ldc.r4 4
IL_15da: ldc.r4 0
IL_15df: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_15e4: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_15e9: nop
IL_15ea: ldloc.s V_86
IL_15ec: ldstr "shield_controller_left (1)"
IL_15f1: ldtoken UnityEngine.BoxCollider
IL_15f6: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_15fb: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_1600: stloc.s V_91
IL_1602: ldloc.s V_91
IL_1604: ldc.r4 -0.25
IL_1609: ldc.r4 0.27
IL_160e: ldc.r4 -1.16
IL_1613: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_1618: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_161d: nop
IL_161e: ldloc.s V_91
IL_1620: ldc.r4 0.89
IL_1625: ldc.r4 0.45
IL_162a: ldc.r4 0.05
IL_162f: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_1634: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_1639: nop
IL_163a: ldloc.s V_91
IL_163c: ldc.r4 0
IL_1641: ldc.r4 2
IL_1646: ldc.r4 0
IL_164b: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_1650: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_1655: nop
IL_1656: ldloc.s V_86
IL_1658: ldstr "shield_controller_left (2)"
IL_165d: ldtoken UnityEngine.BoxCollider
IL_1662: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_1667: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_166c: stloc.s V_92
IL_166e: ldloc.s V_92
IL_1670: ldc.r4 1.33
IL_1675: ldc.r4 0.23
IL_167a: ldc.r4 -1.1
IL_167f: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_1684: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_1689: nop
IL_168a: ldloc.s V_92
IL_168c: ldc.r4 1.37
IL_1691: ldc.r4 0.45
IL_1696: ldc.r4 0.05
IL_169b: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_16a0: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_16a5: nop
IL_16a6: ldloc.s V_92
IL_16a8: ldc.r4 0
IL_16ad: ldc.r4 352
IL_16b2: ldc.r4 0
IL_16b7: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_16bc: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_16c1: nop
IL_16c2: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::changeShields
IL_16c7: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_16cc: stloc.s V_93
IL_16ce: ldloc.s V_93
IL_16d0: brfalse IL_1756
IL_16d5: ldc.i4.0
IL_16d6: stloc.s V_94
IL_16d8: br.s IL_1745
IL_16da: nop
IL_16db: ldloc.s V_86
IL_16dd: ldloc.s V_94
IL_16df: callvirt UnityEngine.Transform UnityEngine.Transform::GetChild(System.Int32)
IL_16e4: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_16e9: callvirt !!0 UnityEngine.GameObject::AddComponent<LongshipUpgrades.LongshipPartController>()
IL_16ee: stloc.s V_95
IL_16f0: ldloc.s V_95
IL_16f2: ldstr "$lu_part_shields_name"
IL_16f7: stfld System.String LongshipUpgrades.LongshipPartController::m_name
IL_16fc: ldloc.s V_95
IL_16fe: ldarg.0
IL_16ff: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_1704: stfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_1709: ldloc.s V_95
IL_170b: ldstr "$lu_part_shields_switch"
IL_1710: stfld System.String LongshipUpgrades.LongshipPartController::m_messageSwitch
IL_1715: ldloc.s V_95
IL_1717: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_shieldsStyle
IL_171c: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_zdoPartVariant
IL_1721: ldloc.s V_95
IL_1723: ldc.i4.4
IL_1724: ldc.i4.3
IL_1725: ldsfld System.Collections.Generic.List`1<UnityEngine.Texture2D> LongshipUpgrades.LongshipCustomizableParts::customShields
IL_172a: callvirt System.Int32 System.Collections.Generic.List`1<UnityEngine.Texture2D>::get_Count()
IL_172f: mul
IL_1730: add
IL_1731: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_variants
IL_1736: ldloc.s V_95
IL_1738: ldc.i4.1
IL_1739: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_switchEffects
IL_173e: nop
IL_173f: ldloc.s V_94
IL_1741: ldc.i4.1
IL_1742: add
IL_1743: stloc.s V_94
IL_1745: ldloc.s V_94
IL_1747: ldloc.s V_86
IL_1749: callvirt System.Int32 UnityEngine.Transform::get_childCount()
IL_174e: clt
IL_1750: stloc.s V_96
IL_1752: ldloc.s V_96
IL_1754: brtrue.s IL_16da
IL_1756: nop
IL_1757: ldloc.0
IL_1758: callvirt UnityEngine.Transform UnityEngine.Transform::get_parent()
IL_175d: ldstr "unused"
IL_1762: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_1767: stloc.s V_6
IL_1769: ldloc.s V_6
IL_176b: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_1770: stloc.s V_97
IL_1772: ldloc.s V_97
IL_1774: brfalse IL_191f
IL_1779: nop
IL_177a: ldarg.0
IL_177b: ldfld WearNTear LongshipUpgrades.LongshipCustomizableParts::m_wnt
IL_1780: dup
IL_1781: brtrue.s IL_1787
IL_1783: pop
IL_1784: ldnull
IL_1785: br.s IL_17ba
IL_1787: ldfld UnityEngine.GameObject WearNTear::m_new
IL_178c: dup
IL_178d: brtrue.s IL_1793
IL_178f: pop
IL_1790: ldnull
IL_1791: br.s IL_17ba
IL_1793: call UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_1798: dup
IL_1799: brtrue.s IL_179f
IL_179b: pop
IL_179c: ldnull
IL_179d: br.s IL_17ba
IL_179f: ldstr "skull_head"
IL_17a4: call UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_17a9: dup
IL_17aa: brtrue.s IL_17b0
IL_17ac: pop
IL_17ad: ldnull
IL_17ae: br.s IL_17ba
IL_17b0: call !!0 UnityEngine.Component::GetComponent<UnityEngine.MeshRenderer>()
IL_17b5: callvirt UnityEngine.Material UnityEngine.Renderer::get_sharedMaterial()
IL_17ba: stloc.s V_98
IL_17bc: ldstr "heads"
IL_17c1: newobj System.Void UnityEngine.GameObject::.ctor(System.String)
IL_17c6: stloc.s V_99
IL_17c8: ldloc.s V_99
IL_17ca: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_17cf: stloc.s V_100
IL_17d1: ldloc.s V_100
IL_17d3: ldloc.0
IL_17d4: ldc.i4.0
IL_17d5: callvirt System.Void UnityEngine.Transform::SetParent(UnityEngine.Transform,System.Boolean)
IL_17da: nop
IL_17db: newobj System.Void System.Collections.Generic.List`1<UnityEngine.GameObject>::.ctor()
IL_17e0: stloc.s V_101
IL_17e2: ldloc.s V_6
IL_17e4: ldstr "carnyx_head"
IL_17e9: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_17ee: stloc.s V_102
IL_17f0: ldloc.s V_102
IL_17f2: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_17f7: stloc.s V_105
IL_17f9: ldloc.s V_105
IL_17fb: brfalse.s IL_1841
IL_17fd: nop
IL_17fe: ldloc.s V_102
IL_1800: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_1805: ldloc.s V_100
IL_1807: ldc.i4.1
IL_1808: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Transform,System.Boolean)
IL_180d: stloc.s V_106
IL_180f: ldloc.s V_106
IL_1811: ldloc.s V_102
IL_1813: callvirt System.String UnityEngine.Object::get_name()
IL_1818: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_181d: nop
IL_181e: ldloc.s V_106
IL_1820: callvirt !!0 UnityEngine.GameObject::GetComponent<UnityEngine.MeshRenderer>()
IL_1825: ldloc.s V_98
IL_1827: callvirt System.Void UnityEngine.Renderer::set_sharedMaterial(UnityEngine.Material)
IL_182c: nop
IL_182d: ldloc.s V_106
IL_182f: ldc.i4.0
IL_1830: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_1835: nop
IL_1836: ldloc.s V_101
IL_1838: ldloc.s V_106
IL_183a: callvirt System.Void System.Collections.Generic.List`1<UnityEngine.GameObject>::Add(!0)
IL_183f: nop
IL_1840: nop
IL_1841: ldloc.s V_6
IL_1843: ldstr "dragon_head"
IL_1848: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_184d: stloc.s V_103
IL_184f: ldloc.s V_103
IL_1851: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_1856: stloc.s V_107
IL_1858: ldloc.s V_107
IL_185a: brfalse.s IL_18a0
IL_185c: nop
IL_185d: ldloc.s V_103
IL_185f: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_1864: ldloc.s V_100
IL_1866: ldc.i4.1
IL_1867: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Transform,System.Boolean)
IL_186c: stloc.s V_108
IL_186e: ldloc.s V_108
IL_1870: ldloc.s V_103
IL_1872: callvirt System.String UnityEngine.Object::get_name()
IL_1877: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_187c: nop
IL_187d: ldloc.s V_108
IL_187f: callvirt !!0 UnityEngine.GameObject::GetComponent<UnityEngine.MeshRenderer>()
IL_1884: ldloc.s V_98
IL_1886: callvirt System.Void UnityEngine.Renderer::set_sharedMaterial(UnityEngine.Material)
IL_188b: nop
IL_188c: ldloc.s V_108
IL_188e: ldc.i4.0
IL_188f: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_1894: nop
IL_1895: ldloc.s V_101
IL_1897: ldloc.s V_108
IL_1899: callvirt System.Void System.Collections.Generic.List`1<UnityEngine.GameObject>::Add(!0)
IL_189e: nop
IL_189f: nop
IL_18a0: ldloc.s V_6
IL_18a2: ldstr "oseberg_head"
IL_18a7: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_18ac: stloc.s V_104
IL_18ae: ldloc.s V_104
IL_18b0: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_18b5: stloc.s V_109
IL_18b7: ldloc.s V_109
IL_18b9: brfalse.s IL_1911
IL_18bb: nop
IL_18bc: ldloc.s V_104
IL_18be: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_18c3: ldloc.s V_100
IL_18c5: ldc.i4.1
IL_18c6: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Transform,System.Boolean)
IL_18cb: stloc.s V_110
IL_18cd: ldloc.s V_110
IL_18cf: ldloc.s V_104
IL_18d1: callvirt System.String UnityEngine.Object::get_name()
IL_18d6: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_18db: nop
IL_18dc: ldloc.s V_110
IL_18de: callvirt !!0 UnityEngine.GameObject::GetComponent<UnityEngine.MeshRenderer>()
IL_18e3: ldloc.s V_98
IL_18e5: callvirt System.Void UnityEngine.Renderer::set_sharedMaterial(UnityEngine.Material)
IL_18ea: nop
IL_18eb: ldloc.s V_110
IL_18ed: ldc.i4.0
IL_18ee: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_18f3: nop
IL_18f4: ldloc.s V_110
IL_18f6: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_18fb: call UnityEngine.Vector3 UnityEngine.Vector3::get_zero()
IL_1900: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_1905: nop
IL_1906: ldloc.s V_101
IL_1908: ldloc.s V_110
IL_190a: callvirt System.Void System.Collections.Generic.List`1<UnityEngine.GameObject>::Add(!0)
IL_190f: nop
IL_1910: nop
IL_1911: ldarg.0
IL_1912: ldloc.s V_101
IL_1914: callvirt !0[] System.Collections.Generic.List`1<UnityEngine.GameObject>::ToArray()
IL_1919: stfld UnityEngine.GameObject[] LongshipUpgrades.LongshipCustomizableParts::m_heads
IL_191e: nop
IL_191f: ldarg.0
IL_1920: ldfld UnityEngine.GameObject[] LongshipUpgrades.LongshipCustomizableParts::m_heads
IL_1925: ldnull
IL_1926: cgt.un
IL_1928: stloc.s V_111
IL_192a: ldloc.s V_111
IL_192c: brfalse IL_1a16
IL_1931: nop
IL_1932: ldloc.s V_5
IL_1934: ldstr "heads_controller"
IL_1939: ldtoken UnityEngine.BoxCollider
IL_193e: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_1943: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_1948: stloc.s V_112
IL_194a: ldloc.s V_112
IL_194c: ldc.r4 -3.9
IL_1951: ldc.r4 0.53
IL_1956: ldc.r4 0
IL_195b: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_1960: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_1965: nop
IL_1966: ldloc.s V_112
IL_1968: ldc.r4 0.1
IL_196d: ldc.r4 0.45
IL_1972: ldc.r4 0.4
IL_1977: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_197c: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_1981: nop
IL_1982: ldloc.s V_112
IL_1984: ldc.r4 0
IL_1989: ldc.r4 0
IL_198e: ldc.r4 63
IL_1993: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_1998: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_199d: nop
IL_199e: ldarg.0
IL_199f: ldloc.s V_112
IL_19a1: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_19a6: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_headStyles
IL_19ab: ldarg.0
IL_19ac: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_headStyles
IL_19b1: ldc.i4.s 16
IL_19b3: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_19b8: nop
IL_19b9: ldarg.0
IL_19ba: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_headStyles
IL_19bf: ldc.i4.1
IL_19c0: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_19c5: nop
IL_19c6: ldloc.s V_112
IL_19c8: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_19cd: callvirt !!0 UnityEngine.GameObject::AddComponent<LongshipUpgrades.LongshipPartController>()
IL_19d2: stloc.s V_113
IL_19d4: ldloc.s V_113
IL_19d6: ldstr "$lu_part_head_name"
IL_19db: stfld System.String LongshipUpgrades.LongshipPartController::m_name
IL_19e0: ldloc.s V_113
IL_19e2: ldarg.0
IL_19e3: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_19e8: stfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_19ed: ldloc.s V_113
IL_19ef: ldstr "$lu_part_head_switch"
IL_19f4: stfld System.String LongshipUpgrades.LongshipPartController::m_messageSwitch
IL_19f9: ldloc.s V_113
IL_19fb: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_headStyle
IL_1a00: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_zdoPartVariant
IL_1a05: ldloc.s V_113
IL_1a07: ldc.i4.4
IL_1a08: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_variants
IL_1a0d: ldloc.s V_113
IL_1a0f: ldc.i4.1
IL_1a10: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_switchEffects
IL_1a15: nop
IL_1a16: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_turretPrefab
IL_1a1b: brtrue.s IL_1a57
IL_1a1d: call !!0[] UnityEngine.Resources::FindObjectsOfTypeAll<Turret>()
IL_1a22: ldsfld System.Func`2<Turret,System.Boolean> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__138_0
IL_1a27: dup
IL_1a28: brtrue.s IL_1a41
IL_1a2a: pop
IL_1a2b: ldsfld LongshipUpgrades.LongshipCustomizableParts/<>c LongshipUpgrades.LongshipCustomizableParts/<>c::<>9
IL_1a30: ldftn System.Boolean LongshipUpgrades.LongshipCustomizableParts/<>c::<InitializeParts>b__138_0(Turret)
IL_1a36: newobj System.Void System.Func`2<Turret,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_1a3b: dup
IL_1a3c: stsfld System.Func`2<Turret,System.Boolean> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__138_0
IL_1a41: call !!0 System.Linq.Enumerable::FirstOrDefault<Turret>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_1a46: dup
IL_1a47: brtrue.s IL_1a4d
IL_1a49: pop
IL_1a4a: ldnull
IL_1a4b: br.s IL_1a52
IL_1a4d: call UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_1a52: stsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_turretPrefab
IL_1a57: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_turretPrefab
IL_1a5c: ldnull
IL_1a5d: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_1a62: stloc.s V_114
IL_1a64: ldloc.s V_114
IL_1a66: brfalse IL_1dc9
IL_1a6b: nop
IL_1a6c: ldarg.0
IL_1a6d: ldstr "turrets"
IL_1a72: newobj System.Void UnityEngine.GameObject::.ctor(System.String)
IL_1a77: dup
IL_1a78: ldc.i4.s 28
IL_1a7a: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_1a7f: nop
IL_1a80: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_turrets
IL_1a85: ldarg.0
IL_1a86: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_turrets
IL_1a8b: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_1a90: stloc.s V_115
IL_1a92: ldloc.s V_115
IL_1a94: ldloc.0
IL_1a95: ldc.i4.0
IL_1a96: callvirt System.Void UnityEngine.Transform::SetParent(UnityEngine.Transform,System.Boolean)
IL_1a9b: nop
IL_1a9c: ldloc.s V_5
IL_1a9e: ldstr "turrets_controller"
IL_1aa3: ldtoken UnityEngine.BoxCollider
IL_1aa8: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_1aad: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_1ab2: stloc.s V_116
IL_1ab4: ldloc.s V_116
IL_1ab6: ldc.r4 -3.35
IL_1abb: ldc.r4 0.1
IL_1ac0: ldc.r4 0
IL_1ac5: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_1aca: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_1acf: nop
IL_1ad0: ldloc.s V_116
IL_1ad2: ldc.r4 0.04
IL_1ad7: ldc.r4 0.35
IL_1adc: ldc.r4 0.45
IL_1ae1: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_1ae6: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_1aeb: nop
IL_1aec: ldarg.0
IL_1aed: ldloc.s V_116
IL_1aef: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_1af4: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_turretsUpgrade
IL_1af9: ldarg.0
IL_1afa: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_turretsUpgrade
IL_1aff: ldc.i4.s 16
IL_1b01: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_1b06: nop
IL_1b07: ldarg.0
IL_1b08: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_turretsUpgrade
IL_1b0d: ldc.i4.1
IL_1b0e: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_1b13: nop
IL_1b14: ldloc.s V_116
IL_1b16: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_1b1b: callvirt !!0 UnityEngine.GameObject::AddComponent<LongshipUpgrades.LongshipPartController>()
IL_1b20: stloc.s V_117
IL_1b22: ldloc.s V_117
IL_1b24: ldstr "$lu_part_turrets_name"
IL_1b29: stfld System.String LongshipUpgrades.LongshipPartController::m_name
IL_1b2e: ldloc.s V_117
IL_1b30: ldarg.0
IL_1b31: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_1b36: stfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_1b3b: ldloc.s V_117
IL_1b3d: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_turretsDisabled
IL_1b42: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_zdoPartDisabled
IL_1b47: ldloc.s V_117
IL_1b49: ldstr "$lu_part_turrets_enable"
IL_1b4e: stfld System.String LongshipUpgrades.LongshipPartController::m_messageEnable
IL_1b53: ldloc.s V_117
IL_1b55: ldc.i4.4
IL_1b56: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_enableEffects
IL_1b5b: ldloc.s V_117
IL_1b5d: ldstr "$lu_part_turrets_disable"
IL_1b62: stfld System.String LongshipUpgrades.LongshipPartController::m_messageDisable
IL_1b67: ldloc.s V_117
IL_1b69: ldc.i4.5
IL_1b6a: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_disableEffects
IL_1b6f: ldloc.s V_117
IL_1b71: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_turretsUpgraded
IL_1b76: ldstr "$lu_part_turrets_upgrade"
IL_1b7b: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::turretsUpgradeRecipe
IL_1b80: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_1b85: call Piece/Requirement[] LongshipUpgrades.LongshipUpgrades::ParseRequirements(System.String)
IL_1b8a: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::turretsStation
IL_1b8f: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_1b94: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::turretsStationLvl
IL_1b99: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_1b9e: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::turretsStationRange
IL_1ba3: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_1ba8: callvirt System.Void LongshipUpgrades.LongshipPartController::AddUpgradeRequirement(System.Int32,System.String,Piece/Requirement[],System.String,System.Int32,System.Int32)
IL_1bad: nop
IL_1bae: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_turretPrefab
IL_1bb3: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_1bb8: ldstr "New"
IL_1bbd: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_1bc2: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_1bc7: ldloc.s V_115
IL_1bc9: ldc.i4.0
IL_1bca: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Transform,System.Boolean)
IL_1bcf: stloc.s V_118
IL_1bd1: ldloc.s V_118
IL_1bd3: ldstr "turret_right"
IL_1bd8: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_1bdd: nop
IL_1bde: ldloc.s V_118
IL_1be0: ldc.i4.s 16
IL_1be2: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_1be7: nop
IL_1be8: ldloc.s V_118
IL_1bea: ldc.i4.1
IL_1beb: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_1bf0: nop
IL_1bf1: ldloc.s V_118
IL_1bf3: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_1bf8: ldstr "Base"
IL_1bfd: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_1c02: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_1c07: ldc.i4.0
IL_1c08: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_1c0d: nop
IL_1c0e: ldloc.s V_118
IL_1c10: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_1c15: call UnityEngine.Vector3 UnityEngine.Vector3::get_one()
IL_1c1a: ldc.r4 0.25
IL_1c1f: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_1c24: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_1c29: nop
IL_1c2a: ldloc.s V_118
IL_1c2c: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_1c31: ldc.r4 -3.3
IL_1c36: ldc.r4 -0.01
IL_1c3b: ldc.r4 0.53
IL_1c40: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_1c45: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_1c4a: nop
IL_1c4b: ldloc.s V_118
IL_1c4d: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_1c52: ldc.r4 0
IL_1c57: ldc.r4 350
IL_1c5c: ldc.r4 0
IL_1c61: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_1c66: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_1c6b: nop
IL_1c6c: ldloc.s V_118
IL_1c6e: callvirt !!0 UnityEngine.GameObject::AddComponent<UnityEngine.BoxCollider>()
IL_1c73: stloc.s V_119
IL_1c75: ldloc.s V_119
IL_1c77: ldc.r4 0
IL_1c7c: ldc.r4 0.7
IL_1c81: ldc.r4 0.1
IL_1c86: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_1c8b: callvirt System.Void UnityEngine.BoxCollider::set_center(UnityEngine.Vector3)
IL_1c90: nop
IL_1c91: ldloc.s V_119
IL_1c93: ldc.r4 1
IL_1c98: ldc.r4 2
IL_1c9d: ldc.r4 1
IL_1ca2: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_1ca7: callvirt System.Void UnityEngine.BoxCollider::set_size(UnityEngine.Vector3)
IL_1cac: nop
IL_1cad: ldloc.s V_118
IL_1caf: ldloc.s V_115
IL_1cb1: ldc.i4.1
IL_1cb2: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Transform,System.Boolean)
IL_1cb7: stloc.s V_120
IL_1cb9: ldloc.s V_120
IL_1cbb: ldstr "turret_left"
IL_1cc0: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_1cc5: nop
IL_1cc6: ldloc.s V_120
IL_1cc8: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_1ccd: ldc.r4 -3.3
IL_1cd2: ldc.r4 -0.01
IL_1cd7: ldc.r4 -0.53
IL_1cdc: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_1ce1: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_1ce6: nop
IL_1ce7: ldloc.s V_120
IL_1ce9: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_1cee: ldc.r4 0
IL_1cf3: ldc.r4 190
IL_1cf8: ldc.r4 0
IL_1cfd: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_1d02: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_1d07: nop
IL_1d08: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_turretPrefab
IL_1d0d: callvirt !!0 UnityEngine.GameObject::GetComponent<Turret>()
IL_1d12: stloc.s V_121
IL_1d14: ldloc.s V_121
IL_1d16: ldfld EffectList Turret::m_shootEffect
IL_1d1b: stsfld EffectList LongshipUpgrades.ShipTurret::m_shootEffect
IL_1d20: ldloc.s V_121
IL_1d22: ldfld EffectList Turret::m_addAmmoEffect
IL_1d27: stsfld EffectList LongshipUpgrades.ShipTurret::m_addAmmoEffect
IL_1d2c: ldloc.s V_121
IL_1d2e: ldfld EffectList Turret::m_reloadEffect
IL_1d33: stsfld EffectList LongshipUpgrades.ShipTurret::m_reloadEffect
IL_1d38: ldloc.s V_121
IL_1d3a: ldfld EffectList Turret::m_warmUpStartEffect
IL_1d3f: stsfld EffectList LongshipUpgrades.ShipTurret::m_warmUpStartEffect
IL_1d44: ldloc.s V_121
IL_1d46: ldfld EffectList Turret::m_newTargetEffect
IL_1d4b: stsfld EffectList LongshipUpgrades.ShipTurret::m_newTargetEffect
IL_1d50: ldloc.s V_121
IL_1d52: ldfld EffectList Turret::m_lostTargetEffect
IL_1d57: stsfld EffectList LongshipUpgrades.ShipTurret::m_lostTargetEffect
IL_1d5c: ldloc.s V_121
IL_1d5e: ldfld EffectList Turret::m_setTargetEffect
IL_1d63: stsfld EffectList LongshipUpgrades.ShipTurret::m_setTargetEffect
IL_1d68: ldloc.s V_118
IL_1d6a: callvirt !!0 UnityEngine.GameObject::AddComponent<LongshipUpgrades.ShipTurret>()
IL_1d6f: ldc.i4.0
IL_1d70: callvirt LongshipUpgrades.ShipTurret LongshipUpgrades.ShipTurret::SetPositionAtShip(System.Boolean)
IL_1d75: ldloc.s V_121
IL_1d77: ldfld System.Collections.Generic.List`1<Turret/AmmoType> Turret::m_allowedAmmo
IL_1d7c: callvirt LongshipUpgrades.ShipTurret LongshipUpgrades.ShipTurret::FillAllowedAmmo(System.Collections.Generic.List`1<Turret/AmmoType>)
IL_1d81: ldloc.s V_121
IL_1d83: ldfld System.Collections.Generic.List`1<Turret/TrophyTarget> Turret::m_configTargets
IL_1d88: callvirt LongshipUpgrades.ShipTurret LongshipUpgrades.ShipTurret::FillTrophyTargets(System.Collections.Generic.List`1<Turret/TrophyTarget>)
IL_1d8d: ldarg.0
IL_1d8e: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_destroyedLootPrefab
IL_1d93: stfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_destroyedLootPrefab
IL_1d98: ldloc.s V_120
IL_1d9a: callvirt !!0 UnityEngine.GameObject::AddComponent<LongshipUpgrades.ShipTurret>()
IL_1d9f: ldc.i4.1
IL_1da0: callvirt LongshipUpgrades.ShipTurret LongshipUpgrades.ShipTurret::SetPositionAtShip(System.Boolean)
IL_1da5: ldloc.s V_121
IL_1da7: ldfld System.Collections.Generic.List`1<Turret/AmmoType> Turret::m_allowedAmmo
IL_1dac: callvirt LongshipUpgrades.ShipTurret LongshipUpgrades.ShipTurret::FillAllowedAmmo(System.Collections.Generic.List`1<Turret/AmmoType>)
IL_1db1: ldloc.s V_121
IL_1db3: ldfld System.Collections.Generic.List`1<Turret/TrophyTarget> Turret::m_configTargets
IL_1db8: callvirt LongshipUpgrades.ShipTurret LongshipUpgrades.ShipTurret::FillTrophyTargets(System.Collections.Generic.List`1<Turret/TrophyTarget>)
IL_1dbd: ldarg.0
IL_1dbe: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_destroyedLootPrefab
IL_1dc3: stfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_destroyedLootPrefab
IL_1dc8: nop
IL_1dc9: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_standBossDragonPrefab
IL_1dce: brtrue.s IL_1e0a
IL_1dd0: call !!0[] UnityEngine.Resources::FindObjectsOfTypeAll<ItemStand>()
IL_1dd5: ldsfld System.Func`2<ItemStand,System.Boolean> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__138_1
IL_1dda: dup
IL_1ddb: brtrue.s IL_1df4
IL_1ddd: pop
IL_1dde: ldsfld LongshipUpgrades.LongshipCustomizableParts/<>c LongshipUpgrades.LongshipCustomizableParts/<>c::<>9
IL_1de3: ldftn System.Boolean LongshipUpgrades.LongshipCustomizableParts/<>c::<InitializeParts>b__138_1(ItemStand)
IL_1de9: newobj System.Void System.Func`2<ItemStand,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_1dee: dup
IL_1def: stsfld System.Func`2<ItemStand,System.Boolean> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__138_1
IL_1df4: call !!0 System.Linq.Enumerable::FirstOrDefault<ItemStand>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_1df9: dup
IL_1dfa: brtrue.s IL_1e00
IL_1dfc: pop
IL_1dfd: ldnull
IL_1dfe: br.s IL_1e05
IL_1e00: call UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_1e05: stsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_standBossDragonPrefab
IL_1e0a: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_standBossDragonPrefab
IL_1e0f: ldnull
IL_1e10: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_1e15: stloc.s V_122
IL_1e17: ldloc.s V_122
IL_1e19: brfalse IL_211d
IL_1e1e: nop
IL_1e1f: ldarg.0
IL_1e20: ldstr "ItemStand_Bow"
IL_1e25: newobj System.Void UnityEngine.GameObject::.ctor(System.String)
IL_1e2a: dup
IL_1e2b: ldc.i4.s 28
IL_1e2d: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_1e32: nop
IL_1e33: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_itemstandObject
IL_1e38: ldarg.0
IL_1e39: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_itemstandObject
IL_1e3e: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_1e43: stloc.s V_123
IL_1e45: ldloc.s V_123
IL_1e47: ldloc.0
IL_1e48: ldc.i4.0
IL_1e49: callvirt System.Void UnityEngine.Transform::SetParent(UnityEngine.Transform,System.Boolean)
IL_1e4e: nop
IL_1e4f: ldarg.0
IL_1e50: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_itemstandObject
IL_1e55: ldc.i4.0
IL_1e56: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_1e5b: nop
IL_1e5c: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_standBossDragonPrefab
IL_1e61: ldloc.s V_123
IL_1e63: ldc.i4.0
IL_1e64: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Transform,System.Boolean)
IL_1e69: stloc.s V_124
IL_1e6b: ldloc.s V_124
IL_1e6d: ldstr "itemstand"
IL_1e72: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_1e77: nop
IL_1e78: ldloc.s V_124
IL_1e7a: ldc.i4.s 16
IL_1e7c: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_1e81: nop
IL_1e82: ldloc.s V_124
IL_1e84: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_1e89: ldstr "model/wood_pole (2)"
IL_1e8e: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_1e93: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_1e98: call System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_1e9d: nop
IL_1e9e: ldloc.s V_124
IL_1ea0: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_1ea5: ldstr "model"
IL_1eaa: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_1eaf: stloc.s V_125
IL_1eb1: ldloc.s V_125
IL_1eb3: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_1eb8: ldc.i4.s 16
IL_1eba: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_1ebf: nop
IL_1ec0: ldloc.s V_125
IL_1ec2: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_1ec7: ldc.i4.1
IL_1ec8: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_1ecd: nop
IL_1ece: ldloc.s V_125
IL_1ed0: ldstr "plate"
IL_1ed5: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_1eda: stloc.s V_126
IL_1edc: ldloc.s V_126
IL_1ede: call UnityEngine.Vector3 UnityEngine.Vector3::get_one()
IL_1ee3: ldc.r4 0.3
IL_1ee8: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_1eed: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_1ef2: nop
IL_1ef3: ldloc.s V_126
IL_1ef5: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_1efa: ldc.i4.s 16
IL_1efc: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_1f01: nop
IL_1f02: ldloc.s V_126
IL_1f04: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.MeshCollider>()
IL_1f09: call System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_1f0e: nop
IL_1f0f: ldloc.s V_126
IL_1f11: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.MeshRenderer>()
IL_1f16: stloc.s V_127
IL_1f18: ldsfld UnityEngine.Material LongshipUpgrades.LongshipCustomizableParts::standSharedMaterial
IL_1f1d: ldnull
IL_1f1e: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_1f23: stloc.s V_131
IL_1f25: ldloc.s V_131
IL_1f27: brfalse.s IL_1f48
IL_1f29: nop
IL_1f2a: ldloc.s V_127
IL_1f2c: callvirt UnityEngine.Material UnityEngine.Renderer::get_sharedMaterial()
IL_1f31: newobj System.Void UnityEngine.Material::.ctor(UnityEngine.Material)
IL_1f36: dup
IL_1f37: ldsfld UnityEngine.Shader LongshipUpgrades.LongshipCustomizableParts::shaderStandard
IL_1f3c: callvirt System.Void UnityEngine.Material::set_shader(UnityEngine.Shader)
IL_1f41: nop
IL_1f42: stsfld UnityEngine.Material LongshipUpgrades.LongshipCustomizableParts::standSharedMaterial
IL_1f47: nop
IL_1f48: ldloc.s V_127
IL_1f4a: ldsfld UnityEngine.Material LongshipUpgrades.LongshipCustomizableParts::standSharedMaterial
IL_1f4f: callvirt System.Void UnityEngine.Renderer::set_sharedMaterial(UnityEngine.Material)
IL_1f54: nop
IL_1f55: ldloc.s V_124
IL_1f57: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_1f5c: ldstr "attach_trophie"
IL_1f61: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_1f66: stloc.s V_128
IL_1f68: ldloc.s V_128
IL_1f6a: call UnityEngine.Vector3 UnityEngine.Vector3::get_zero()
IL_1f6f: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_1f74: nop
IL_1f75: ldloc.s V_128
IL_1f77: call UnityEngine.Vector3 UnityEngine.Vector3::get_one()
IL_1f7c: ldc.r4 0.75
IL_1f81: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_1f86: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_1f8b: nop
IL_1f8c: ldloc.s V_128
IL_1f8e: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_1f93: ldc.i4.s 16
IL_1f95: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_1f9a: nop
IL_1f9b: ldloc.s V_124
IL_1f9d: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_1fa2: ldstr "dropspawn"
IL_1fa7: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_1fac: stloc.s V_129
IL_1fae: ldloc.s V_129
IL_1fb0: ldc.r4 0.01
IL_1fb5: ldc.r4 0.5
IL_1fba: ldc.r4 -0.69
IL_1fbf: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_1fc4: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_1fc9: nop
IL_1fca: ldloc.s V_129
IL_1fcc: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_1fd1: ldc.i4.s 16
IL_1fd3: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_1fd8: nop
IL_1fd9: ldloc.s V_124
IL_1fdb: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_1fe0: call UnityEngine.Vector3 UnityEngine.Vector3::get_one()
IL_1fe5: ldc.r4 0.45
IL_1fea: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_1fef: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_1ff4: nop
IL_1ff5: ldloc.s V_124
IL_1ff7: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_1ffc: ldc.r4 -4.6
IL_2001: ldc.r4 0.7
IL_2006: ldc.r4 0
IL_200b: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_2010: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_2015: nop
IL_2016: ldloc.s V_124
IL_2018: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_201d: ldc.r4 0
IL_2022: ldc.r4 270
IL_2027: ldc.r4 0
IL_202c: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_2031: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_2036: nop
IL_2037: ldloc.s V_124
IL_2039: callvirt !!0 UnityEngine.GameObject::GetComponent<UnityEngine.BoxCollider>()
IL_203e: ldc.r4 0.75
IL_2043: ldc.r4 1
IL_2048: ldc.r4 0.5
IL_204d: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_2052: callvirt System.Void UnityEngine.BoxCollider::set_size(UnityEngine.Vector3)
IL_2057: nop
IL_2058: ldloc.s V_124
IL_205a: callvirt !!0 UnityEngine.GameObject::GetComponent<ItemStand>()
IL_205f: stloc.s V_130
IL_2061: ldarg.0
IL_2062: ldloc.s V_124
IL_2064: callvirt !!0 UnityEngine.GameObject::AddComponent<LongshipUpgrades.ShipTrophyStand>()
IL_2069: stfld LongshipUpgrades.ShipTrophyStand LongshipUpgrades.LongshipCustomizableParts::m_trophyStand
IL_206e: ldarg.0
IL_206f: ldfld LongshipUpgrades.ShipTrophyStand LongshipUpgrades.LongshipCustomizableParts::m_trophyStand
IL_2074: ldloc.s V_130
IL_2076: ldfld EffectList ItemStand::m_activatePowerEffects
IL_207b: stfld EffectList LongshipUpgrades.ShipTrophyStand::m_activatePowerEffects
IL_2080: ldarg.0
IL_2081: ldfld LongshipUpgrades.ShipTrophyStand LongshipUpgrades.LongshipCustomizableParts::m_trophyStand
IL_2086: ldloc.s V_130
IL_2088: ldfld EffectList ItemStand::m_activatePowerEffectsPlayer
IL_208d: stfld EffectList LongshipUpgrades.ShipTrophyStand::m_activatePowerEffectsPlayer
IL_2092: ldarg.0
IL_2093: ldfld LongshipUpgrades.ShipTrophyStand LongshipUpgrades.LongshipCustomizableParts::m_trophyStand
IL_2098: ldloc.s V_130
IL_209a: ldfld UnityEngine.Transform ItemStand::m_attachOther
IL_209f: stfld UnityEngine.Transform LongshipUpgrades.ShipTrophyStand::m_attachOther
IL_20a4: ldarg.0
IL_20a5: ldfld LongshipUpgrades.ShipTrophyStand LongshipUpgrades.LongshipCustomizableParts::m_trophyStand
IL_20aa: ldloc.s V_130
IL_20ac: ldfld UnityEngine.Transform ItemStand::m_dropSpawnPoint
IL_20b1: stfld UnityEngine.Transform LongshipUpgrades.ShipTrophyStand::m_dropSpawnPoint
IL_20b6: ldarg.0
IL_20b7: ldfld LongshipUpgrades.ShipTrophyStand LongshipUpgrades.LongshipCustomizableParts::m_trophyStand
IL_20bc: ldloc.s V_130
IL_20be: ldfld EffectList ItemStand::m_effects
IL_20c3: stfld EffectList LongshipUpgrades.ShipTrophyStand::m_effects
IL_20c8: ldarg.0
IL_20c9: ldfld LongshipUpgrades.ShipTrophyStand LongshipUpgrades.LongshipCustomizableParts::m_trophyStand
IL_20ce: ldloc.s V_130
IL_20d0: ldfld EffectList ItemStand::m_destroyEffects
IL_20d5: stfld EffectList LongshipUpgrades.ShipTrophyStand::m_destroyEffects
IL_20da: ldloc.s V_130
IL_20dc: call System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_20e1: nop
IL_20e2: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::itemStandDisableSpeaking
IL_20e7: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_20ec: stloc.s V_132
IL_20ee: ldloc.s V_132
IL_20f0: brfalse.s IL_210f
IL_20f2: ldarg.0
IL_20f3: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_itemstandObject
IL_20f8: callvirt !!0 UnityEngine.GameObject::GetComponentInChildren<RandomSpeak>()
IL_20fd: dup
IL_20fe: brtrue.s IL_2103
IL_2100: pop
IL_2101: br.s IL_210f
IL_2103: call UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_2108: ldc.i4.0
IL_2109: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_210e: nop
IL_210f: ldarg.0
IL_2110: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_itemstandObject
IL_2115: ldc.i4.1
IL_2116: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_211b: nop
IL_211c: nop
IL_211d: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_wisptorchPrefab
IL_2122: brtrue.s IL_2144
IL_2124: call ZNetScene ZNetScene::get_instance()
IL_2129: ldstr "piece_groundtorch_mist"
IL_212e: callvirt UnityEngine.GameObject ZNetScene::GetPrefab(System.String)
IL_2133: dup
IL_2134: brtrue.s IL_213a
IL_2136: pop
IL_2137: ldnull
IL_2138: br.s IL_213f
IL_213a: call UnityEngine.GameObject UnityEngine.GameObject::get_gameObject()
IL_213f: stsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_wisptorchPrefab
IL_2144: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_wisptorchPrefab
IL_2149: ldnull
IL_214a: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_214f: stloc.s V_133
IL_2151: ldloc.s V_133
IL_2153: brfalse IL_2391
IL_2158: nop
IL_2159: ldarg.0
IL_215a: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_wisptorchPrefab
IL_215f: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_2164: ldstr "_enabled"
IL_2169: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_216e: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_2173: ldloc.0
IL_2174: ldc.i4.0
IL_2175: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Transform,System.Boolean)
IL_217a: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_wisp
IL_217f: ldarg.0
IL_2180: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_wisp
IL_2185: ldstr "wisptorch"
IL_218a: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_218f: nop
IL_2190: ldarg.0
IL_2191: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_wisp
IL_2196: ldc.i4.s 16
IL_2198: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_219d: nop
IL_219e: ldarg.0
IL_219f: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_wisp
IL_21a4: ldc.i4.0
IL_21a5: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_21aa: nop
IL_21ab: ldarg.0
IL_21ac: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_wisp
IL_21b1: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_21b6: call UnityEngine.Vector3 UnityEngine.Vector3::get_one()
IL_21bb: ldc.r4 0.35
IL_21c0: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_21c5: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_21ca: nop
IL_21cb: ldarg.0
IL_21cc: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_wisp
IL_21d1: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_21d6: ldc.r4 -0.125
IL_21db: ldc.r4 4.77
IL_21e0: ldc.r4 -0.002
IL_21e5: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_21ea: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_21ef: nop
IL_21f0: ldarg.0
IL_21f1: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_wisp
IL_21f6: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_21fb: ldstr "Particle System Force Field"
IL_2200: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_2205: stloc.s V_134
IL_2207: ldloc.s V_134
IL_2209: callvirt !!0 UnityEngine.Component::GetComponent<Demister>()
IL_220e: stloc.s V_135
IL_2210: ldloc.s V_135
IL_2212: ldc.r4 0
IL_2217: stfld System.Single Demister::m_disableForcefieldDelay
IL_221c: ldloc.s V_135
IL_221e: ldstr "DisableForcefield"
IL_2223: callvirt System.Void UnityEngine.MonoBehaviour::CancelInvoke(System.String)
IL_2228: nop
IL_2229: ldloc.s V_134
IL_222b: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.ParticleSystemForceField>()
IL_2230: ldc.r4 13
IL_2235: callvirt System.Void UnityEngine.ParticleSystemForceField::set_endRange(System.Single)
IL_223a: nop
IL_223b: ldloc.s V_134
IL_223d: ldc.r4 -2
IL_2242: ldc.r4 -10
IL_2247: ldc.r4 0
IL_224c: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_2251: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_2256: nop
IL_2257: ldarg.0
IL_2258: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_wisp
IL_225d: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_2262: ldstr "sparcs_front"
IL_2267: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_226c: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.ParticleSystem>()
IL_2271: callvirt UnityEngine.ParticleSystem/MainModule UnityEngine.ParticleSystem::get_main()
IL_2276: stloc.s V_136
IL_2278: ldloca.s V_136
IL_227a: ldc.i4.1
IL_227b: call System.Void UnityEngine.ParticleSystem/MainModule::set_simulationSpace(UnityEngine.ParticleSystemSimulationSpace)
IL_2280: nop
IL_2281: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::wispEnabled
IL_2286: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_228b: stloc.s V_137
IL_228d: ldloc.s V_137
IL_228f: brfalse IL_2390
IL_2294: nop
IL_2295: ldloc.s V_5
IL_2297: ldstr "wisp_controller"
IL_229c: ldtoken UnityEngine.BoxCollider
IL_22a1: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_22a6: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_22ab: stloc.s V_138
IL_22ad: ldloc.s V_138
IL_22af: ldc.r4 -0.13
IL_22b4: ldc.r4 1.22
IL_22b9: ldc.r4 0
IL_22be: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_22c3: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_22c8: nop
IL_22c9: ldloc.s V_138
IL_22cb: ldc.r4 0.11
IL_22d0: ldc.r4 0.25
IL_22d5: ldc.r4 0.12
IL_22da: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_22df: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_22e4: nop
IL_22e5: ldarg.0
IL_22e6: ldloc.s V_138
IL_22e8: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_22ed: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_wispUpgrade
IL_22f2: ldarg.0
IL_22f3: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_wispUpgrade
IL_22f8: ldc.i4.s 16
IL_22fa: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_22ff: nop
IL_2300: ldarg.0
IL_2301: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_wispUpgrade
IL_2306: ldc.i4.1
IL_2307: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_230c: nop
IL_230d: ldloc.s V_138
IL_230f: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_2314: callvirt !!0 UnityEngine.GameObject::AddComponent<LongshipUpgrades.LongshipPartController>()
IL_2319: stloc.s V_139
IL_231b: ldloc.s V_139
IL_231d: ldstr "$lu_part_wisp_name"
IL_2322: stfld System.String LongshipUpgrades.LongshipPartController::m_name
IL_2327: ldloc.s V_139
IL_2329: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_wispRemoved
IL_232e: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_zdoPartDisabled
IL_2333: ldloc.s V_139
IL_2335: ldc.i4.6
IL_2336: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_enableEffects
IL_233b: ldloc.s V_139
IL_233d: ldc.i4.1
IL_233e: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_disableEffects
IL_2343: ldloc.s V_139
IL_2345: ldarg.0
IL_2346: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_234b: stfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_2350: ldloc.s V_139
IL_2352: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_wispUpgraded
IL_2357: ldstr "$lu_part_wisp_upgrade"
IL_235c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::wispUpgradeRecipe
IL_2361: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_2366: call Piece/Requirement[] LongshipUpgrades.LongshipUpgrades::ParseRequirements(System.String)
IL_236b: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::wispStation
IL_2370: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_2375: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::wispStationLvl
IL_237a: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_237f: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::wispStationRange
IL_2384: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_2389: callvirt System.Void LongshipUpgrades.LongshipPartController::AddUpgradeRequirement(System.Int32,System.String,Piece/Requirement[],System.String,System.Int32,System.Int32)
IL_238e: nop
IL_238f: nop
IL_2390: nop
IL_2391: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_mapTablePrefab
IL_2396: ldnull
IL_2397: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_239c: stloc.s V_140
IL_239e: ldloc.s V_140
IL_23a0: brfalse IL_2685
IL_23a5: nop
IL_23a6: ldarg.0
IL_23a7: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_mapTablePrefab
IL_23ac: ldloc.0
IL_23ad: ldc.i4.0
IL_23ae: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Transform,System.Boolean)
IL_23b3: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mapTable
IL_23b8: ldarg.0
IL_23b9: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mapTable
IL_23be: ldstr "maptable"
IL_23c3: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_23c8: nop
IL_23c9: ldarg.0
IL_23ca: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mapTable
IL_23cf: ldc.i4.s 16
IL_23d1: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_23d6: nop
IL_23d7: ldarg.0
IL_23d8: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mapTable
IL_23dd: ldc.i4.0
IL_23de: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_23e3: nop
IL_23e4: ldarg.0
IL_23e5: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mapTable
IL_23ea: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_23ef: call UnityEngine.Vector3 UnityEngine.Vector3::get_one()
IL_23f4: ldc.r4 0.45
IL_23f9: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_23fe: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_2403: nop
IL_2404: ldarg.0
IL_2405: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mapTable
IL_240a: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_240f: ldc.r4 -1.14
IL_2414: ldc.r4 -0.05
IL_2419: ldc.r4 -0.73
IL_241e: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_2423: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_2428: nop
IL_2429: ldarg.0
IL_242a: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mapTable
IL_242f: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_2434: ldc.r4 0
IL_2439: ldc.r4 342.6
IL_243e: ldc.r4 0
IL_2443: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_2448: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_244d: nop
IL_244e: ldarg.0
IL_244f: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mapTable
IL_2454: callvirt !!0 UnityEngine.GameObject::GetComponent<MapTable>()
IL_2459: stloc.s V_141
IL_245b: ldloc.s V_141
IL_245d: ldarg.0
IL_245e: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_2463: stfld ZNetView MapTable::m_nview
IL_2468: ldloc.s V_141
IL_246a: ldfld ZNetView MapTable::m_nview
IL_246f: ldstr "MapData"
IL_2474: ldloc.s V_141
IL_2476: ldftn System.Void MapTable::RPC_MapData(System.Int64,ZPackage)
IL_247c: newobj System.Void System.Action`2<System.Int64,ZPackage>::.ctor(System.Object,System.IntPtr)
IL_2481: callvirt System.Void ZNetView::Register<ZPackage>(System.String,System.Action`2<System.Int64,!!0>)
IL_2486: nop
IL_2487: ldloc.s V_141
IL_2489: ldloc.s V_141
IL_248b: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_2490: ldstr "ReadMap"
IL_2495: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_249a: callvirt !!0 UnityEngine.Component::GetComponent<Switch>()
IL_249f: stfld Switch MapTable::m_readSwitch
IL_24a4: ldloc.s V_141
IL_24a6: ldfld Switch MapTable::m_readSwitch
IL_24ab: ldloc.s V_141
IL_24ad: ldfld Switch MapTable::m_readSwitch
IL_24b2: ldfld Switch/Callback Switch::m_onUse
IL_24b7: ldloc.s V_141
IL_24b9: ldftn System.Boolean MapTable::OnRead(Switch,Humanoid,ItemDrop/ItemData)
IL_24bf: newobj System.Void Switch/Callback::.ctor(System.Object,System.IntPtr)
IL_24c4: call System.Delegate System.Delegate::Combine(System.Delegate,System.Delegate)
IL_24c9: castclass Switch/Callback
IL_24ce: stfld Switch/Callback Switch::m_onUse
IL_24d3: ldloc.s V_141
IL_24d5: ldfld Switch MapTable::m_readSwitch
IL_24da: ldloc.s V_141
IL_24dc: ldfld Switch MapTable::m_readSwitch
IL_24e1: ldfld Switch/TooltipCallback Switch::m_onHover
IL_24e6: ldloc.s V_141
IL_24e8: ldftn System.String MapTable::GetReadHoverText()
IL_24ee: newobj System.Void Switch/TooltipCallback::.ctor(System.Object,System.IntPtr)
IL_24f3: call System.Delegate System.Delegate::Combine(System.Delegate,System.Delegate)
IL_24f8: castclass Switch/TooltipCallback
IL_24fd: stfld Switch/TooltipCallback Switch::m_onHover
IL_2502: ldloc.s V_141
IL_2504: ldloc.s V_141
IL_2506: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_250b: ldstr "WriteMap"
IL_2510: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_2515: callvirt !!0 UnityEngine.Component::GetComponent<Switch>()
IL_251a: stfld Switch MapTable::m_writeSwitch
IL_251f: ldloc.s V_141
IL_2521: ldfld Switch MapTable::m_writeSwitch
IL_2526: ldloc.s V_141
IL_2528: ldfld Switch MapTable::m_writeSwitch
IL_252d: ldfld Switch/Callback Switch::m_onUse
IL_2532: ldloc.s V_141
IL_2534: ldftn System.Boolean MapTable::OnWrite(Switch,Humanoid,ItemDrop/ItemData)
IL_253a: newobj System.Void Switch/Callback::.ctor(System.Object,System.IntPtr)
IL_253f: call System.Delegate System.Delegate::Combine(System.Delegate,System.Delegate)
IL_2544: castclass Switch/Callback
IL_2549: stfld Switch/Callback Switch::m_onUse
IL_254e: ldloc.s V_141
IL_2550: ldfld Switch MapTable::m_writeSwitch
IL_2555: ldloc.s V_141
IL_2557: ldfld Switch MapTable::m_writeSwitch
IL_255c: ldfld Switch/TooltipCallback Switch::m_onHover
IL_2561: ldloc.s V_141
IL_2563: ldftn System.String MapTable::GetWriteHoverText()
IL_2569: newobj System.Void Switch/TooltipCallback::.ctor(System.Object,System.IntPtr)
IL_256e: call System.Delegate System.Delegate::Combine(System.Delegate,System.Delegate)
IL_2573: castclass Switch/TooltipCallback
IL_2578: stfld Switch/TooltipCallback Switch::m_onHover
IL_257d: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::mapTableEnabled
IL_2582: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_2587: stloc.s V_142
IL_2589: ldloc.s V_142
IL_258b: brfalse IL_2684
IL_2590: nop
IL_2591: ldloc.s V_5
IL_2593: ldstr "mapTable_controller"
IL_2598: ldtoken UnityEngine.BoxCollider
IL_259d: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_25a2: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_25a7: stloc.s V_143
IL_25a9: ldloc.s V_143
IL_25ab: ldarg.0
IL_25ac: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mapTable
IL_25b1: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_25b6: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localPosition()
IL_25bb: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_25c0: nop
IL_25c1: ldloc.s V_143
IL_25c3: ldc.r4 0.27
IL_25c8: ldc.r4 0.04
IL_25cd: ldc.r4 0.27
IL_25d2: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_25d7: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_25dc: nop
IL_25dd: ldloc.s V_143
IL_25df: ldarg.0
IL_25e0: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mapTable
IL_25e5: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_25ea: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localEulerAngles()
IL_25ef: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_25f4: nop
IL_25f5: ldarg.0
IL_25f6: ldloc.s V_143
IL_25f8: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_25fd: stfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mapTableUpgrade
IL_2602: ldarg.0
IL_2603: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mapTableUpgrade
IL_2608: ldc.i4.s 16
IL_260a: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_260f: nop
IL_2610: ldarg.0
IL_2611: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_mapTableUpgrade
IL_2616: ldc.i4.1
IL_2617: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_261c: nop
IL_261d: ldloc.s V_143
IL_261f: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_2624: callvirt !!0 UnityEngine.GameObject::AddComponent<LongshipUpgrades.LongshipPartController>()
IL_2629: stloc.s V_144
IL_262b: ldloc.s V_144
IL_262d: ldstr "$lu_part_maptable_name"
IL_2632: stfld System.String LongshipUpgrades.LongshipPartController::m_name
IL_2637: ldloc.s V_144
IL_2639: ldarg.0
IL_263a: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_263f: stfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_2644: ldloc.s V_144
IL_2646: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_mapTableUpgraded
IL_264b: ldstr "$lu_part_maptable_upgrade"
IL_2650: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::mapTableUpgradeRecipe
IL_2655: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_265a: call Piece/Requirement[] LongshipUpgrades.LongshipUpgrades::ParseRequirements(System.String)
IL_265f: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::mapTableStation
IL_2664: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_2669: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::mapTableStationLvl
IL_266e: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_2673: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::mapTableStationRange
IL_2678: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_267d: callvirt System.Void LongshipUpgrades.LongshipPartController::AddUpgradeRequirement(System.Int32,System.String,Piece/Requirement[],System.String,System.Int32,System.Int32)
IL_2682: nop
IL_2683: nop
IL_2684: nop
IL_2685: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::OnDestroyed()
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0007: callvirt System.Boolean ZNetView::IsValid()
IL_000c: brfalse.s IL_001b
IL_000e: ldarg.0
IL_000f: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0014: callvirt System.Boolean ZNetView::IsOwner()
IL_0019: br.s IL_001c
IL_001b: ldc.i4.0
IL_001c: stloc.0
IL_001d: ldloc.0
IL_001e: brfalse.s IL_0030
IL_0020: nop
IL_0021: ldarg.0
IL_0022: call System.Void LongshipUpgrades.LongshipCustomizableParts::DropItemStand()
IL_0027: nop
IL_0028: ldarg.0
IL_0029: call System.Void LongshipUpgrades.LongshipCustomizableParts::DropSpentUpgrades()
IL_002e: nop
IL_002f: nop
IL_0030: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::DropItemStand()
.locals UnityEngine.GameObject, System.Boolean, System.Boolean, System.Boolean, UnityEngine.Vector3, UnityEngine.Quaternion, UnityEngine.Transform, UnityEngine.GameObject, ItemDrop, System.Boolean, System.Boolean, Inventory, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld LongshipUpgrades.ShipTrophyStand LongshipUpgrades.LongshipCustomizableParts::m_trophyStand
IL_0007: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000c: ldc.i4.0
IL_000d: ceq
IL_000f: stloc.1
IL_0010: ldloc.1
IL_0011: brfalse.s IL_0018
IL_0013: br IL_016e
IL_0018: ldarg.0
IL_0019: ldfld LongshipUpgrades.ShipTrophyStand LongshipUpgrades.LongshipCustomizableParts::m_trophyStand
IL_001e: callvirt System.Boolean LongshipUpgrades.ShipTrophyStand::HaveAttachment()
IL_0023: ldc.i4.0
IL_0024: ceq
IL_0026: stloc.2
IL_0027: ldloc.2
IL_0028: brfalse.s IL_002f
IL_002a: br IL_016e
IL_002f: call ObjectDB ObjectDB::get_instance()
IL_0034: ldarg.0
IL_0035: ldfld LongshipUpgrades.ShipTrophyStand LongshipUpgrades.LongshipCustomizableParts::m_trophyStand
IL_003a: callvirt System.Int32 LongshipUpgrades.ShipTrophyStand::GetAttachedItem()
IL_003f: callvirt UnityEngine.GameObject ObjectDB::GetItemPrefab(System.Int32)
IL_0044: stloc.0
IL_0045: ldloc.0
IL_0046: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_004b: stloc.3
IL_004c: ldloc.3
IL_004d: brfalse IL_016e
IL_0052: nop
IL_0053: call UnityEngine.Vector3 UnityEngine.Vector3::get_zero()
IL_0058: stloc.s V_4
IL_005a: call UnityEngine.Quaternion UnityEngine.Quaternion::get_identity()
IL_005f: stloc.s V_5
IL_0061: ldloc.0
IL_0062: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0067: ldstr "attach"
IL_006c: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0071: stloc.s V_6
IL_0073: ldloc.0
IL_0074: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0079: ldstr "attachobj"
IL_007e: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0083: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0088: brfalse.s IL_0093
IL_008a: ldloc.s V_6
IL_008c: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0091: br.s IL_0094
IL_0093: ldc.i4.0
IL_0094: stloc.s V_9
IL_0096: ldloc.s V_9
IL_0098: brfalse.s IL_00b8
IL_009a: nop
IL_009b: ldloc.s V_6
IL_009d: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_00a2: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_localRotation()
IL_00a7: stloc.s V_5
IL_00a9: ldloc.s V_6
IL_00ab: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_00b0: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localPosition()
IL_00b5: stloc.s V_4
IL_00b7: nop
IL_00b8: ldloc.0
IL_00b9: ldarg.0
IL_00ba: ldfld LongshipUpgrades.ShipTrophyStand LongshipUpgrades.LongshipCustomizableParts::m_trophyStand
IL_00bf: ldfld UnityEngine.Transform LongshipUpgrades.ShipTrophyStand::m_dropSpawnPoint
IL_00c4: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_00c9: ldloc.s V_4
IL_00cb: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_00d0: ldarg.0
IL_00d1: ldfld LongshipUpgrades.ShipTrophyStand LongshipUpgrades.LongshipCustomizableParts::m_trophyStand
IL_00d6: ldfld UnityEngine.Transform LongshipUpgrades.ShipTrophyStand::m_dropSpawnPoint
IL_00db: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_00e0: ldloc.s V_5
IL_00e2: call UnityEngine.Quaternion UnityEngine.Quaternion::op_Multiply(UnityEngine.Quaternion,UnityEngine.Quaternion)
IL_00e7: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Vector3,UnityEngine.Quaternion)
IL_00ec: stloc.s V_7
IL_00ee: ldloc.s V_7
IL_00f0: callvirt !!0 UnityEngine.GameObject::GetComponent<ItemDrop>()
IL_00f5: stloc.s V_8
IL_00f7: ldloc.s V_8
IL_00f9: ldarg.0
IL_00fa: ldfld LongshipUpgrades.ShipTrophyStand LongshipUpgrades.LongshipCustomizableParts::m_trophyStand
IL_00ff: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_0104: callvirt ZDO ZNetView::GetZDO()
IL_0109: callvirt System.Void ItemDrop::LoadFromExternalZDO(ZDO)
IL_010e: nop
IL_010f: ldloc.s V_7
IL_0111: callvirt !!0 UnityEngine.GameObject::GetComponent<UnityEngine.Rigidbody>()
IL_0116: call UnityEngine.Vector3 UnityEngine.Vector3::get_up()
IL_011b: ldc.r4 4
IL_0120: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_0125: callvirt System.Void UnityEngine.Rigidbody::set_linearVelocity(UnityEngine.Vector3)
IL_012a: nop
IL_012b: ldarg.0
IL_012c: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_destroyedLootPrefab
IL_0131: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0136: stloc.s V_10
IL_0138: ldloc.s V_10
IL_013a: brfalse.s IL_016d
IL_013c: nop
IL_013d: ldarg.0
IL_013e: ldarg.0
IL_013f: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_destroyedLootPrefab
IL_0144: call Inventory LongshipUpgrades.LongshipCustomizableParts::SpawnContainer(UnityEngine.GameObject)
IL_0149: stloc.s V_11
IL_014b: ldloc.s V_11
IL_014d: ldloc.s V_8
IL_014f: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0154: callvirt System.Boolean Inventory::AddItem(ItemDrop/ItemData)
IL_0159: stloc.s V_12
IL_015b: ldloc.s V_12
IL_015d: brfalse.s IL_016c
IL_015f: call ZNetScene ZNetScene::get_instance()
IL_0164: ldloc.s V_7
IL_0166: callvirt System.Void ZNetScene::Destroy(UnityEngine.GameObject)
IL_016b: nop
IL_016c: nop
IL_016d: nop
IL_016e: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::DropSpentUpgrades()
.locals System.Collections.Generic.Dictionary`2<System.Int32,Piece/Requirement[]>, System.Boolean, LongshipUpgrades.LongshipPartController[], System.Int32, LongshipUpgrades.LongshipPartController, System.Boolean
IL_0000: nop
IL_0001: call ZoneSystem ZoneSystem::get_instance()
IL_0006: ldc.i4.s 24
IL_0008: callvirt System.Boolean ZoneSystem::GetGlobalKey(GlobalKeys)
IL_000d: stloc.1
IL_000e: ldloc.1
IL_000f: brfalse.s IL_0013
IL_0011: br.s IL_0067
IL_0013: newobj System.Void System.Collections.Generic.Dictionary`2<System.Int32,Piece/Requirement[]>::.ctor()
IL_0018: stloc.0
IL_0019: nop
IL_001a: ldarg.0
IL_001b: ldc.i4.1
IL_001c: call !!0[] UnityEngine.Component::GetComponentsInChildren<LongshipUpgrades.LongshipPartController>(System.Boolean)
IL_0021: stloc.2
IL_0022: ldc.i4.0
IL_0023: stloc.3
IL_0024: br.s IL_0038
IL_0026: ldloc.2
IL_0027: ldloc.3
IL_0028: ldelem.ref
IL_0029: stloc.s V_4
IL_002b: ldloc.s V_4
IL_002d: ldloc.0
IL_002e: callvirt System.Void LongshipUpgrades.LongshipPartController::AddSpentUpgrades(System.Collections.Generic.Dictionary`2<System.Int32,Piece/Requirement[]>)
IL_0033: nop
IL_0034: ldloc.3
IL_0035: ldc.i4.1
IL_0036: add
IL_0037: stloc.3
IL_0038: ldloc.3
IL_0039: ldloc.2
IL_003a: ldlen
IL_003b: conv.i4
IL_003c: blt.s IL_0026
IL_003e: ldloc.0
IL_003f: callvirt System.Int32 System.Collections.Generic.Dictionary`2<System.Int32,Piece/Requirement[]>::get_Count()
IL_0044: ldc.i4.0
IL_0045: ceq
IL_0047: stloc.s V_5
IL_0049: ldloc.s V_5
IL_004b: brfalse.s IL_004f
IL_004d: br.s IL_0067
IL_004f: ldloc.0
IL_0050: callvirt System.Collections.Generic.Dictionary`2/ValueCollection<!0,!1> System.Collections.Generic.Dictionary`2<System.Int32,Piece/Requirement[]>::get_Values()
IL_0055: ldarg.0
IL_0056: ldftn System.Void LongshipUpgrades.LongshipCustomizableParts::<DropSpentUpgrades>b__141_0(Piece/Requirement[])
IL_005c: newobj System.Void System.Action`1<Piece/Requirement[]>::.ctor(System.Object,System.IntPtr)
IL_0061: call System.Void HarmonyLib.CollectionExtensions::Do<Piece/Requirement[]>(System.Collections.Generic.IEnumerable`1<!!0>,System.Action`1<!!0>)
IL_0066: nop
IL_0067: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::DropRequirements(System.Collections.Generic.List`1<Piece/Requirement>)
.locals System.Boolean, Inventory, Piece/Requirement, System.Boolean, System.Boolean, System.Boolean, System.Boolean, Piece/Requirement, UnityEngine.Vector3, UnityEngine.Quaternion, ItemDrop, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_destroyedLootPrefab
IL_0007: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000c: stloc.0
IL_000d: ldloc.0
IL_000e: brfalse IL_00b7
IL_0013: nop
IL_0014: ldarg.0
IL_0015: ldarg.0
IL_0016: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_destroyedLootPrefab
IL_001b: call Inventory LongshipUpgrades.LongshipCustomizableParts::SpawnContainer(UnityEngine.GameObject)
IL_0020: stloc.1
IL_0021: br.s IL_009f
IL_0023: nop
IL_0024: ldarg.1
IL_0025: ldc.i4.0
IL_0026: callvirt !0 System.Collections.Generic.List`1<Piece/Requirement>::get_Item(System.Int32)
IL_002b: stloc.2
IL_002c: ldloc.2
IL_002d: ldfld System.Int32 Piece/Requirement::m_amount
IL_0032: ldc.i4.0
IL_0033: cgt
IL_0035: ldc.i4.0
IL_0036: ceq
IL_0038: stloc.3
IL_0039: ldloc.3
IL_003a: brfalse.s IL_0046
IL_003c: ldarg.1
IL_003d: ldc.i4.0
IL_003e: callvirt System.Void System.Collections.Generic.List`1<Piece/Requirement>::RemoveAt(System.Int32)
IL_0043: nop
IL_0044: br.s IL_009e
IL_0046: ldloc.1
IL_0047: call ObjectDB ObjectDB::get_instance()
IL_004c: ldloc.2
IL_004d: ldfld ItemDrop Piece/Requirement::m_resItem
IL_0052: callvirt System.String UnityEngine.Object::get_name()
IL_0057: callvirt UnityEngine.GameObject ObjectDB::GetItemPrefab(System.String)
IL_005c: ldc.i4.1
IL_005d: callvirt System.Boolean Inventory::AddItem(UnityEngine.GameObject,System.Int32)
IL_0062: stloc.s V_4
IL_0064: ldloc.s V_4
IL_0066: brfalse.s IL_0078
IL_0068: ldloc.2
IL_0069: dup
IL_006a: ldfld System.Int32 Piece/Requirement::m_amount
IL_006f: ldc.i4.1
IL_0070: sub
IL_0071: stfld System.Int32 Piece/Requirement::m_amount
IL_0076: br.s IL_009e
IL_0078: ldloc.1
IL_0079: callvirt System.Boolean Inventory::HaveEmptySlot()
IL_007e: ldc.i4.0
IL_007f: ceq
IL_0081: stloc.s V_5
IL_0083: ldloc.s V_5
IL_0085: brfalse.s IL_0096
IL_0087: ldarg.0
IL_0088: ldarg.0
IL_0089: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_destroyedLootPrefab
IL_008e: call Inventory LongshipUpgrades.LongshipCustomizableParts::SpawnContainer(UnityEngine.GameObject)
IL_0093: stloc.1
IL_0094: br.s IL_009e
IL_0096: ldarg.1
IL_0097: ldc.i4.0
IL_0098: callvirt System.Void System.Collections.Generic.List`1<Piece/Requirement>::RemoveAt(System.Int32)
IL_009d: nop
IL_009e: nop
IL_009f: ldarg.1
IL_00a0: callvirt System.Int32 System.Collections.Generic.List`1<Piece/Requirement>::get_Count()
IL_00a5: ldc.i4.0
IL_00a6: cgt
IL_00a8: stloc.s V_6
IL_00aa: ldloc.s V_6
IL_00ac: brtrue IL_0023
IL_00b1: nop
IL_00b2: br IL_01ae
IL_00b7: nop
IL_00b8: br IL_019b
IL_00bd: nop
IL_00be: ldarg.1
IL_00bf: ldc.i4.0
IL_00c0: callvirt !0 System.Collections.Generic.List`1<Piece/Requirement>::get_Item(System.Int32)
IL_00c5: stloc.s V_7
IL_00c7: br IL_017f
IL_00cc: nop
IL_00cd: ldarg.0
IL_00ce: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_00d3: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_00d8: call UnityEngine.Vector3 UnityEngine.Vector3::get_up()
IL_00dd: ldc.r4 0.5
IL_00e2: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_00e7: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_00ec: call UnityEngine.Vector3 UnityEngine.Random::get_insideUnitSphere()
IL_00f1: ldc.r4 0.3
IL_00f6: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_00fb: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0100: stloc.s V_8
IL_0102: ldc.r4 0
IL_0107: ldc.i4.0
IL_0108: ldc.i4 360
IL_010d: call System.Int32 UnityEngine.Random::Range(System.Int32,System.Int32)
IL_0112: conv.r4
IL_0113: ldc.r4 0
IL_0118: call UnityEngine.Quaternion UnityEngine.Quaternion::Euler(System.Single,System.Single,System.Single)
IL_011d: stloc.s V_9
IL_011f: call ObjectDB ObjectDB::get_instance()
IL_0124: ldloc.s V_7
IL_0126: ldfld ItemDrop Piece/Requirement::m_resItem
IL_012b: callvirt System.String UnityEngine.Object::get_name()
IL_0130: callvirt UnityEngine.GameObject ObjectDB::GetItemPrefab(System.String)
IL_0135: ldloc.s V_8
IL_0137: ldloc.s V_9
IL_0139: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Vector3,UnityEngine.Quaternion)
IL_013e: callvirt !!0 UnityEngine.GameObject::GetComponent<ItemDrop>()
IL_0143: stloc.s V_10
IL_0145: ldloc.s V_10
IL_0147: ldnull
IL_0148: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_014d: stloc.s V_11
IL_014f: ldloc.s V_11
IL_0151: brfalse.s IL_0155
IL_0153: br.s IL_0192
IL_0155: ldloc.s V_10
IL_0157: ldloc.s V_7
IL_0159: ldfld System.Int32 Piece/Requirement::m_amount
IL_015e: callvirt System.Void ItemDrop::SetStack(System.Int32)
IL_0163: nop
IL_0164: ldloc.s V_7
IL_0166: dup
IL_0167: ldfld System.Int32 Piece/Requirement::m_amount
IL_016c: ldloc.s V_10
IL_016e: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0173: ldfld System.Int32 ItemDrop/ItemData::m_stack
IL_0178: sub
IL_0179: stfld System.Int32 Piece/Requirement::m_amount
IL_017e: nop
IL_017f: ldloc.s V_7
IL_0181: ldfld System.Int32 Piece/Requirement::m_amount
IL_0186: ldc.i4.0
IL_0187: cgt
IL_0189: stloc.s V_12
IL_018b: ldloc.s V_12
IL_018d: brtrue IL_00cc
IL_0192: ldarg.1
IL_0193: ldc.i4.0
IL_0194: callvirt System.Void System.Collections.Generic.List`1<Piece/Requirement>::RemoveAt(System.Int32)
IL_0199: nop
IL_019a: nop
IL_019b: ldarg.1
IL_019c: callvirt System.Int32 System.Collections.Generic.List`1<Piece/Requirement>::get_Count()
IL_01a1: ldc.i4.0
IL_01a2: cgt
IL_01a4: stloc.s V_13
IL_01a6: ldloc.s V_13
IL_01a8: brtrue IL_00bd
IL_01ad: nop
IL_01ae: ret

// Inventory LongshipUpgrades.LongshipCustomizableParts::SpawnContainer(UnityEngine.GameObject)
.locals UnityEngine.Vector3, Inventory
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0007: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_000c: call UnityEngine.Vector3 UnityEngine.Random::get_insideUnitSphere()
IL_0011: ldc.r4 1
IL_0016: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_001b: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0020: stloc.0
IL_0021: ldarg.1
IL_0022: ldloc.0
IL_0023: call UnityEngine.Quaternion UnityEngine.Random::get_rotation()
IL_0028: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Vector3,UnityEngine.Quaternion)
IL_002d: callvirt !!0 UnityEngine.GameObject::GetComponent<Container>()
IL_0032: callvirt Inventory Container::GetInventory()
IL_0037: stloc.1
IL_0038: br.s IL_003a
IL_003a: ldloc.1
IL_003b: ret

// System.Boolean LongshipUpgrades.LongshipCustomizableParts::IsTentActive()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_tent
IL_0006: ldnull
IL_0007: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_000c: brfalse.s IL_001b
IL_000e: ldarg.0
IL_000f: ldfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::m_tent
IL_0014: callvirt System.Boolean UnityEngine.GameObject::get_activeInHierarchy()
IL_0019: br.s IL_001c
IL_001b: ldc.i4.0
IL_001c: ret

// System.Boolean LongshipUpgrades.LongshipCustomizableParts::IsHeatActive()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld EffectArea LongshipUpgrades.LongshipCustomizableParts::m_fireWarmth
IL_0006: ldnull
IL_0007: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_000c: brfalse.s IL_001b
IL_000e: ldarg.0
IL_000f: ldfld EffectArea LongshipUpgrades.LongshipCustomizableParts::m_fireWarmth
IL_0014: ldfld System.Boolean EffectArea::m_isHeatType
IL_0019: br.s IL_001c
IL_001b: ldc.i4.0
IL_001c: ret

// System.Boolean LongshipUpgrades.LongshipCustomizableParts::IsNightTime()
.locals System.Boolean
IL_0000: nop
IL_0001: call System.Boolean EnvMan::IsNight()
IL_0006: stloc.0
IL_0007: br.s IL_0009
IL_0009: ldloc.0
IL_000a: ret

// System.Boolean LongshipUpgrades.LongshipCustomizableParts::IsTimeToLight()
.locals System.Single, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: call System.Boolean EnvMan::IsDaylight()
IL_0006: brfalse.s IL_0017
IL_0008: call EnvMan EnvMan::get_instance()
IL_000d: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0012: ldc.i4.0
IL_0013: ceq
IL_0015: br.s IL_0018
IL_0017: ldc.i4.1
IL_0018: stloc.1
IL_0019: ldloc.1
IL_001a: brfalse.s IL_0020
IL_001c: ldc.i4.1
IL_001d: stloc.2
IL_001e: br.s IL_0049
IL_0020: call EnvMan EnvMan::get_instance()
IL_0025: callvirt System.Single EnvMan::GetDayFraction()
IL_002a: stloc.0
IL_002b: ldloc.0
IL_002c: ldc.r4 0.28
IL_0031: cgt.un
IL_0033: stloc.3
IL_0034: ldloc.3
IL_0035: brfalse.s IL_0045
IL_0037: ldloc.0
IL_0038: ldc.r4 0.71
IL_003d: clt.un
IL_003f: ldc.i4.0
IL_0040: ceq
IL_0042: stloc.2
IL_0043: br.s IL_0049
IL_0045: ldc.i4.1
IL_0046: stloc.2
IL_0047: br.s IL_0049
IL_0049: ldloc.2
IL_004a: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::OnGlobalStart()
.locals 
IL_0000: nop
IL_0001: ldnull
IL_0002: stsfld UnityEngine.Shader LongshipUpgrades.LongshipCustomizableParts::shaderStandard
IL_0007: ldc.i4.0
IL_0008: stsfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::isNightTime
IL_000d: ldc.i4.1
IL_000e: stsfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::isTimeToLight
IL_0013: call System.Void LongshipUpgrades.LongshipCustomizableParts::FixPrefab()
IL_0018: nop
IL_0019: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::OnGlobalDestroy()
.locals 
IL_0000: nop
IL_0001: ldnull
IL_0002: stsfld UnityEngine.Shader LongshipUpgrades.LongshipCustomizableParts::shaderStandard
IL_0007: call System.Void LongshipUpgrades.PrefabAudio::Clear()
IL_000c: nop
IL_000d: ldsfld EffectList LongshipUpgrades.LongshipCustomizableParts::partEffects
IL_0012: call !!0[] System.Array::Empty<EffectList/EffectData>()
IL_0017: stfld EffectList/EffectData[] EffectList::m_effectPrefabs
IL_001c: ldnull
IL_001d: stsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_lanternPrefab
IL_0022: ldnull
IL_0023: stsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_turretPrefab
IL_0028: ldnull
IL_0029: stsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_standBossDragonPrefab
IL_002e: ldnull
IL_002f: stsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_wisptorchPrefab
IL_0034: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_mapTablePrefab
IL_0039: call System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_003e: nop
IL_003f: ldnull
IL_0040: stsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_mapTablePrefab
IL_0045: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::FixPrefab()
.locals UnityEngine.GameObject, UnityEngine.Transform, UnityEngine.MeshRenderer, UnityEngine.Transform, UnityEngine.Transform, UnityEngine.Transform, UnityEngine.Material, UnityEngine.Transform, UnityEngine.Transform, System.Boolean, System.Int32, UnityEngine.Transform, UnityEngine.MeshRenderer, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: call ZNetScene ZNetScene::get_instance()
IL_0006: dup
IL_0007: brtrue.s IL_000d
IL_0009: pop
IL_000a: ldnull
IL_000b: br.s IL_0017
IL_000d: ldstr "VikingShip"
IL_0012: call UnityEngine.GameObject ZNetScene::GetPrefab(System.String)
IL_0017: dup
IL_0018: brtrue.s IL_0050
IL_001a: pop
IL_001b: call !!0[] UnityEngine.Resources::FindObjectsOfTypeAll<Ship>()
IL_0020: ldsfld System.Func`2<Ship,System.Boolean> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__150_0
IL_0025: dup
IL_0026: brtrue.s IL_003f
IL_0028: pop
IL_0029: ldsfld LongshipUpgrades.LongshipCustomizableParts/<>c LongshipUpgrades.LongshipCustomizableParts/<>c::<>9
IL_002e: ldftn System.Boolean LongshipUpgrades.LongshipCustomizableParts/<>c::<FixPrefab>b__150_0(Ship)
IL_0034: newobj System.Void System.Func`2<Ship,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0039: dup
IL_003a: stsfld System.Func`2<Ship,System.Boolean> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__150_0
IL_003f: call !!0 System.Linq.Enumerable::FirstOrDefault<Ship>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0044: dup
IL_0045: brtrue.s IL_004b
IL_0047: pop
IL_0048: ldnull
IL_0049: br.s IL_0050
IL_004b: call UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0050: stloc.0
IL_0051: ldloc.0
IL_0052: ldnull
IL_0053: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0058: stloc.s V_9
IL_005a: ldloc.s V_9
IL_005c: brfalse.s IL_0063
IL_005e: br IL_0435
IL_0063: ldloc.0
IL_0064: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0069: ldstr "piece_chest/visual/Cube"
IL_006e: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0073: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.MeshRenderer>()
IL_0078: callvirt UnityEngine.Material UnityEngine.Renderer::get_sharedMaterial()
IL_007d: callvirt UnityEngine.Shader UnityEngine.Material::get_shader()
IL_0082: stsfld UnityEngine.Shader LongshipUpgrades.LongshipCustomizableParts::shaderStandard
IL_0087: ldloc.0
IL_0088: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_008d: ldstr "ship/visual/Customize/storage"
IL_0092: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0097: stloc.1
IL_0098: ldc.i4.0
IL_0099: stloc.s V_10
IL_009b: br IL_0131
IL_00a0: nop
IL_00a1: ldloc.1
IL_00a2: ldloc.s V_10
IL_00a4: callvirt UnityEngine.Transform UnityEngine.Transform::GetChild(System.Int32)
IL_00a9: stloc.s V_11
IL_00ab: ldloc.s V_11
IL_00ad: callvirt System.String UnityEngine.Object::get_name()
IL_00b2: ldstr "default"
IL_00b7: callvirt System.Boolean System.String::StartsWith(System.String)
IL_00bc: ldc.i4.0
IL_00bd: ceq
IL_00bf: stloc.s V_13
IL_00c1: ldloc.s V_13
IL_00c3: brfalse.s IL_00c7
IL_00c5: br.s IL_012b
IL_00c7: ldloc.s V_11
IL_00c9: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.MeshRenderer>()
IL_00ce: stloc.s V_12
IL_00d0: ldsfld UnityEngine.Material LongshipUpgrades.LongshipCustomizableParts::storageSharedMaterial
IL_00d5: ldnull
IL_00d6: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_00db: brtrue.s IL_00e7
IL_00dd: ldsfld UnityEngine.Material LongshipUpgrades.LongshipCustomizableParts::storageSharedMaterial
IL_00e2: ldnull
IL_00e3: ceq
IL_00e5: br.s IL_00e8
IL_00e7: ldc.i4.1
IL_00e8: stloc.s V_14
IL_00ea: ldloc.s V_14
IL_00ec: brfalse.s IL_010d
IL_00ee: ldloc.s V_12
IL_00f0: callvirt UnityEngine.Material UnityEngine.Renderer::get_sharedMaterial()
IL_00f5: newobj System.Void UnityEngine.Material::.ctor(UnityEngine.Material)
IL_00fa: dup
IL_00fb: ldsfld UnityEngine.Shader LongshipUpgrades.LongshipCustomizableParts::shaderStandard
IL_0100: callvirt System.Void UnityEngine.Material::set_shader(UnityEngine.Shader)
IL_0105: nop
IL_0106: stsfld UnityEngine.Material LongshipUpgrades.LongshipCustomizableParts::storageSharedMaterial
IL_010b: br.s IL_011d
IL_010d: ldsfld UnityEngine.Material LongshipUpgrades.LongshipCustomizableParts::storageSharedMaterial
IL_0112: ldsfld UnityEngine.Shader LongshipUpgrades.LongshipCustomizableParts::shaderStandard
IL_0117: callvirt System.Void UnityEngine.Material::set_shader(UnityEngine.Shader)
IL_011c: nop
IL_011d: ldloc.s V_12
IL_011f: ldsfld UnityEngine.Material LongshipUpgrades.LongshipCustomizableParts::storageSharedMaterial
IL_0124: callvirt System.Void UnityEngine.Renderer::set_sharedMaterial(UnityEngine.Material)
IL_0129: nop
IL_012a: nop
IL_012b: ldloc.s V_10
IL_012d: ldc.i4.1
IL_012e: add
IL_012f: stloc.s V_10
IL_0131: ldloc.s V_10
IL_0133: ldloc.1
IL_0134: callvirt System.Int32 UnityEngine.Transform::get_childCount()
IL_0139: clt
IL_013b: stloc.s V_15
IL_013d: ldloc.s V_15
IL_013f: brtrue IL_00a0
IL_0144: ldloc.0
IL_0145: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_014a: ldstr "ship/visual/hull_worn/plank"
IL_014f: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0154: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.MeshRenderer>()
IL_0159: stloc.2
IL_015a: ldsfld UnityEngine.Material LongshipUpgrades.LongshipCustomizableParts::plankSharedMaterial
IL_015f: ldnull
IL_0160: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0165: brtrue.s IL_0171
IL_0167: ldsfld UnityEngine.Material LongshipUpgrades.LongshipCustomizableParts::plankSharedMaterial
IL_016c: ldnull
IL_016d: ceq
IL_016f: br.s IL_0172
IL_0171: ldc.i4.1
IL_0172: stloc.s V_16
IL_0174: ldloc.s V_16
IL_0176: brfalse.s IL_0196
IL_0178: ldloc.2
IL_0179: callvirt UnityEngine.Material UnityEngine.Renderer::get_sharedMaterial()
IL_017e: newobj System.Void UnityEngine.Material::.ctor(UnityEngine.Material)
IL_0183: dup
IL_0184: ldsfld UnityEngine.Shader LongshipUpgrades.LongshipCustomizableParts::shaderStandard
IL_0189: callvirt System.Void UnityEngine.Material::set_shader(UnityEngine.Shader)
IL_018e: nop
IL_018f: stsfld UnityEngine.Material LongshipUpgrades.LongshipCustomizableParts::plankSharedMaterial
IL_0194: br.s IL_01a6
IL_0196: ldsfld UnityEngine.Material LongshipUpgrades.LongshipCustomizableParts::plankSharedMaterial
IL_019b: ldsfld UnityEngine.Shader LongshipUpgrades.LongshipCustomizableParts::shaderStandard
IL_01a0: callvirt System.Void UnityEngine.Material::set_shader(UnityEngine.Shader)
IL_01a5: nop
IL_01a6: ldloc.2
IL_01a7: ldsfld UnityEngine.Material LongshipUpgrades.LongshipCustomizableParts::plankSharedMaterial
IL_01ac: callvirt System.Void UnityEngine.Renderer::set_sharedMaterial(UnityEngine.Material)
IL_01b1: nop
IL_01b2: ldloc.0
IL_01b3: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_01b8: ldstr "ship/visual/hull_worn/plank (1)"
IL_01bd: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_01c2: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.MeshRenderer>()
IL_01c7: ldsfld UnityEngine.Material LongshipUpgrades.LongshipCustomizableParts::plankSharedMaterial
IL_01cc: callvirt System.Void UnityEngine.Renderer::set_sharedMaterial(UnityEngine.Material)
IL_01d1: nop
IL_01d2: ldloc.0
IL_01d3: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_01d8: ldstr "ship/visual/hull_broken/plank"
IL_01dd: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_01e2: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.MeshRenderer>()
IL_01e7: ldsfld UnityEngine.Material LongshipUpgrades.LongshipCustomizableParts::plankSharedMaterial
IL_01ec: callvirt System.Void UnityEngine.Renderer::set_sharedMaterial(UnityEngine.Material)
IL_01f1: nop
IL_01f2: ldloc.0
IL_01f3: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_01f8: ldstr "ship/visual/hull_broken/plank (1)"
IL_01fd: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0202: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.MeshRenderer>()
IL_0207: ldsfld UnityEngine.Material LongshipUpgrades.LongshipCustomizableParts::plankSharedMaterial
IL_020c: callvirt System.Void UnityEngine.Renderer::set_sharedMaterial(UnityEngine.Material)
IL_0211: nop
IL_0212: ldsfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::prefabInitialized
IL_0217: stloc.s V_17
IL_0219: ldloc.s V_17
IL_021b: brfalse.s IL_0222
IL_021d: br IL_0435
IL_0222: ldc.i4.1
IL_0223: stsfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::prefabInitialized
IL_0228: ldloc.0
IL_0229: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_022e: ldstr "ship/visual/Customize/ShipTen2_beam"
IL_0233: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0238: stloc.3
IL_0239: ldloc.3
IL_023a: dup
IL_023b: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localPosition()
IL_0240: ldc.r4 0
IL_0245: ldc.r4 0.1
IL_024a: ldc.r4 0
IL_024f: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0254: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0259: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_025e: nop
IL_025f: ldloc.3
IL_0260: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0265: ldc.i4.s 28
IL_0267: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_026c: nop
IL_026d: ldloc.0
IL_026e: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0273: ldstr "ship/visual/Customize/ShipTen2 (1)"
IL_0278: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_027d: stloc.s V_4
IL_027f: ldloc.s V_4
IL_0281: dup
IL_0282: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localPosition()
IL_0287: ldc.r4 0
IL_028c: ldc.r4 0.08
IL_0291: ldc.r4 0
IL_0296: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_029b: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_02a0: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_02a5: nop
IL_02a6: ldloc.0
IL_02a7: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_02ac: ldstr "OnboardTrigger"
IL_02b1: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_02b6: stloc.s V_5
IL_02b8: ldloc.s V_5
IL_02ba: dup
IL_02bb: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localScale()
IL_02c0: ldc.r4 0.1
IL_02c5: ldc.r4 2
IL_02ca: ldc.r4 0
IL_02cf: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_02d4: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_02d9: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_02de: nop
IL_02df: ldloc.s V_5
IL_02e1: dup
IL_02e2: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localPosition()
IL_02e7: ldc.r4 -0.05
IL_02ec: ldc.r4 1
IL_02f1: ldc.r4 0
IL_02f6: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_02fb: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0300: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_0305: nop
IL_0306: ldloc.s V_4
IL_0308: callvirt !!0 UnityEngine.Component::GetComponentInChildren<UnityEngine.MeshRenderer>()
IL_030d: callvirt UnityEngine.Material UnityEngine.Renderer::get_sharedMaterial()
IL_0312: stloc.s V_6
IL_0314: ldloc.s V_6
IL_0316: ldstr "_RippleSpeed"
IL_031b: ldc.r4 75
IL_0320: callvirt System.Void UnityEngine.Material::SetFloat(System.String,System.Single)
IL_0325: nop
IL_0326: ldloc.s V_6
IL_0328: ldstr "_RippleDistance"
IL_032d: ldc.r4 1.25
IL_0332: callvirt System.Void UnityEngine.Material::SetFloat(System.String,System.Single)
IL_0337: nop
IL_0338: ldloc.0
IL_0339: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_033e: ldstr "ship/visual/Mast"
IL_0343: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0348: dup
IL_0349: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localPosition()
IL_034e: ldc.r4 0
IL_0353: ldc.r4 0.21
IL_0358: ldc.r4 0
IL_035d: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0362: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0367: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_036c: nop
IL_036d: ldloc.0
IL_036e: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0373: ldstr "ship/visual/Customize/ShipTentHolders"
IL_0378: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_037d: dup
IL_037e: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localPosition()
IL_0383: ldc.r4 0
IL_0388: ldc.r4 0.01
IL_038d: ldc.r4 0
IL_0392: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0397: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_039c: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_03a1: nop
IL_03a2: ldloc.0
IL_03a3: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_03a8: ldstr "ship/visual/Customize/ShipTentHolders (1)"
IL_03ad: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_03b2: stloc.s V_7
IL_03b4: ldloc.s V_7
IL_03b6: dup
IL_03b7: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localPosition()
IL_03bc: ldc.r4 0.1
IL_03c1: ldc.r4 -0.18
IL_03c6: ldc.r4 0.11
IL_03cb: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_03d0: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_03d5: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_03da: nop
IL_03db: ldloc.s V_7
IL_03dd: dup
IL_03de: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localEulerAngles()
IL_03e3: ldc.r4 0
IL_03e8: ldc.r4 5
IL_03ed: ldc.r4 6.6
IL_03f2: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_03f7: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_03fc: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_0401: nop
IL_0402: ldloc.0
IL_0403: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0408: ldstr "ship/visual/Customize/TraderLamp"
IL_040d: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0412: stloc.s V_8
IL_0414: ldloc.s V_8
IL_0416: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_041b: ldc.i4.0
IL_041c: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0421: nop
IL_0422: ldc.i4.1
IL_0423: stsfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::prefabInit
IL_0428: ldloc.0
IL_0429: callvirt !!0 UnityEngine.GameObject::AddComponent<LongshipUpgrades.LongshipCustomizableParts>()
IL_042e: pop
IL_042f: ldc.i4.0
IL_0430: stsfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::prefabInit
IL_0435: ret

// UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
.locals UnityEngine.Transform, UnityEngine.Transform
IL_0000: nop
IL_0001: ldarg.1
IL_0002: ldc.i4.1
IL_0003: newarr System.Type
IL_0008: dup
IL_0009: ldc.i4.0
IL_000a: ldarg.2
IL_000b: stelem.ref
IL_000c: newobj System.Void UnityEngine.GameObject::.ctor(System.String,System.Type[])
IL_0011: call UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0016: stloc.0
IL_0017: ldloc.0
IL_0018: ldarg.0
IL_0019: ldc.i4.0
IL_001a: callvirt System.Void UnityEngine.Transform::SetParent(UnityEngine.Transform,System.Boolean)
IL_001f: nop
IL_0020: ldloc.0
IL_0021: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0026: ldc.i4.s 28
IL_0028: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_002d: nop
IL_002e: ldloc.0
IL_002f: stloc.1
IL_0030: br.s IL_0032
IL_0032: ldloc.1
IL_0033: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::AddCustomTent(System.String)
.locals 
IL_0000: nop
IL_0001: ldsfld System.Collections.Generic.List`1<UnityEngine.Texture2D> LongshipUpgrades.LongshipCustomizableParts::customTents
IL_0006: ldarg.0
IL_0007: call System.Void LongshipUpgrades.LongshipCustomizableParts::AddCustomTexture(System.Collections.Generic.List`1<UnityEngine.Texture2D>,System.String)
IL_000c: nop
IL_000d: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::AddCustomSail(System.String)
.locals 
IL_0000: nop
IL_0001: ldsfld System.Collections.Generic.List`1<UnityEngine.Texture2D> LongshipUpgrades.LongshipCustomizableParts::customSails
IL_0006: ldarg.0
IL_0007: call System.Void LongshipUpgrades.LongshipCustomizableParts::AddCustomTexture(System.Collections.Generic.List`1<UnityEngine.Texture2D>,System.String)
IL_000c: nop
IL_000d: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::AddCustomShields(System.String)
.locals 
IL_0000: nop
IL_0001: ldsfld System.Collections.Generic.List`1<UnityEngine.Texture2D> LongshipUpgrades.LongshipCustomizableParts::customShields
IL_0006: ldarg.0
IL_0007: call System.Void LongshipUpgrades.LongshipCustomizableParts::AddCustomTexture(System.Collections.Generic.List`1<UnityEngine.Texture2D>,System.String)
IL_000c: nop
IL_000d: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::AddCustomTexture(System.Collections.Generic.List`1<UnityEngine.Texture2D>,System.String)
.locals UnityEngine.Texture2D, System.Boolean
IL_0000: nop
IL_0001: ldc.i4.2
IL_0002: ldc.i4.2
IL_0003: newobj System.Void UnityEngine.Texture2D::.ctor(System.Int32,System.Int32)
IL_0008: stloc.0
IL_0009: ldarg.1
IL_000a: ldloca.s V_0
IL_000c: call System.Boolean LongshipUpgrades.LongshipUpgrades::LoadTextureFromConfigDirectory(System.String,UnityEngine.Texture2D&)
IL_0011: stloc.1
IL_0012: ldloc.1
IL_0013: brfalse.s IL_001d
IL_0015: ldarg.0
IL_0016: ldloc.0
IL_0017: callvirt System.Void System.Collections.Generic.List`1<UnityEngine.Texture2D>::Add(!0)
IL_001c: nop
IL_001d: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::CheckEffects()
.locals LongshipUpgrades.LongshipCustomizableParts/<>c__DisplayClass156_0, System.Boolean
IL_0000: nop
IL_0001: ldsfld EffectList LongshipUpgrades.LongshipCustomizableParts::partEffects
IL_0006: callvirt System.Boolean EffectList::HasEffects()
IL_000b: stloc.1
IL_000c: ldloc.1
IL_000d: brfalse.s IL_0014
IL_000f: br IL_0098
IL_0014: ldloca.s V_0
IL_0016: newobj System.Void System.Collections.Generic.List`1<EffectList/EffectData>::.ctor()
IL_001b: stfld System.Collections.Generic.List`1<EffectList/EffectData> LongshipUpgrades.LongshipCustomizableParts/<>c__DisplayClass156_0::effectPrefabs
IL_0020: ldc.i4.0
IL_0021: ldstr "vfx_Place_HildirFabricRoll"
IL_0026: ldloca.s V_0
IL_0028: call System.Void LongshipUpgrades.LongshipCustomizableParts::<CheckEffects>g__AddEffect|156_0(System.Int32,System.String,LongshipUpgrades.LongshipCustomizableParts/<>c__DisplayClass156_0&)
IL_002d: nop
IL_002e: ldc.i4.1
IL_002f: ldstr "sfx_gui_repairitem_workbench"
IL_0034: ldloca.s V_0
IL_0036: call System.Void LongshipUpgrades.LongshipCustomizableParts::<CheckEffects>g__AddEffect|156_0(System.Int32,System.String,LongshipUpgrades.LongshipCustomizableParts/<>c__DisplayClass156_0&)
IL_003b: nop
IL_003c: ldc.i4.2
IL_003d: ldstr "sfx_FireAddFuel"
IL_0042: ldloca.s V_0
IL_0044: call System.Void LongshipUpgrades.LongshipCustomizableParts::<CheckEffects>g__AddEffect|156_0(System.Int32,System.String,LongshipUpgrades.LongshipCustomizableParts/<>c__DisplayClass156_0&)
IL_0049: nop
IL_004a: ldc.i4.3
IL_004b: ldstr "fx_candle_off"
IL_0050: ldloca.s V_0
IL_0052: call System.Void LongshipUpgrades.LongshipCustomizableParts::<CheckEffects>g__AddEffect|156_0(System.Int32,System.String,LongshipUpgrades.LongshipCustomizableParts/<>c__DisplayClass156_0&)
IL_0057: nop
IL_0058: ldc.i4.4
IL_0059: ldstr "fx_guardstone_permitted_add"
IL_005e: ldloca.s V_0
IL_0060: call System.Void LongshipUpgrades.LongshipCustomizableParts::<CheckEffects>g__AddEffect|156_0(System.Int32,System.String,LongshipUpgrades.LongshipCustomizableParts/<>c__DisplayClass156_0&)
IL_0065: nop
IL_0066: ldc.i4.5
IL_0067: ldstr "fx_guardstone_permitted_removed"
IL_006c: ldloca.s V_0
IL_006e: call System.Void LongshipUpgrades.LongshipCustomizableParts::<CheckEffects>g__AddEffect|156_0(System.Int32,System.String,LongshipUpgrades.LongshipCustomizableParts/<>c__DisplayClass156_0&)
IL_0073: nop
IL_0074: ldc.i4.6
IL_0075: ldstr "sfx_demister_start"
IL_007a: ldloca.s V_0
IL_007c: call System.Void LongshipUpgrades.LongshipCustomizableParts::<CheckEffects>g__AddEffect|156_0(System.Int32,System.String,LongshipUpgrades.LongshipCustomizableParts/<>c__DisplayClass156_0&)
IL_0081: nop
IL_0082: ldsfld EffectList LongshipUpgrades.LongshipCustomizableParts::partEffects
IL_0087: ldloc.0
IL_0088: ldfld System.Collections.Generic.List`1<EffectList/EffectData> LongshipUpgrades.LongshipCustomizableParts/<>c__DisplayClass156_0::effectPrefabs
IL_008d: callvirt !0[] System.Collections.Generic.List`1<EffectList/EffectData>::ToArray()
IL_0092: stfld EffectList/EffectData[] EffectList::m_effectPrefabs
IL_0097: nop
IL_0098: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::UpdatePropertyBlocks(UnityEngine.GameObject)
.locals LongshipUpgrades.LongshipCustomizableParts, System.Boolean
IL_0000: nop
IL_0001: ldsfld System.Collections.Generic.Dictionary`2<UnityEngine.GameObject,LongshipUpgrades.LongshipCustomizableParts> LongshipUpgrades.LongshipCustomizableParts::s_allInstances
IL_0006: ldarg.0
IL_0007: ldloca.s V_0
IL_0009: callvirt System.Boolean System.Collections.Generic.Dictionary`2<UnityEngine.GameObject,LongshipUpgrades.LongshipCustomizableParts>::TryGetValue(!0,!1&)
IL_000e: stloc.1
IL_000f: ldloc.1
IL_0010: brfalse.s IL_0019
IL_0012: ldloc.0
IL_0013: callvirt System.Void LongshipUpgrades.LongshipCustomizableParts::UpdatePropertyBlocks()
IL_0018: nop
IL_0019: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::CombinePropertyBlocks(UnityEngine.GameObject,UnityEngine.MaterialPropertyBlock)
.locals LongshipUpgrades.LongshipCustomizableParts, System.Boolean
IL_0000: nop
IL_0001: ldsfld System.Collections.Generic.Dictionary`2<UnityEngine.GameObject,LongshipUpgrades.LongshipCustomizableParts> LongshipUpgrades.LongshipCustomizableParts::s_allInstances
IL_0006: ldarg.0
IL_0007: ldloca.s V_0
IL_0009: callvirt System.Boolean System.Collections.Generic.Dictionary`2<UnityEngine.GameObject,LongshipUpgrades.LongshipCustomizableParts>::TryGetValue(!0,!1&)
IL_000e: stloc.1
IL_000f: ldloc.1
IL_0010: brfalse.s IL_001a
IL_0012: ldloc.0
IL_0013: ldarg.1
IL_0014: callvirt System.Void LongshipUpgrades.LongshipCustomizableParts::CombinePropertyBlocks(UnityEngine.MaterialPropertyBlock)
IL_0019: nop
IL_001a: ret

// System.Boolean LongshipUpgrades.LongshipCustomizableParts::HasShipComponent(UnityEngine.GameObject)
.locals 
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<UnityEngine.GameObject,LongshipUpgrades.LongshipCustomizableParts> LongshipUpgrades.LongshipCustomizableParts::s_allInstances
IL_0005: ldarg.0
IL_0006: callvirt System.Boolean System.Collections.Generic.Dictionary`2<UnityEngine.GameObject,LongshipUpgrades.LongshipCustomizableParts>::ContainsKey(!0)
IL_000b: ret

// System.Boolean LongshipUpgrades.LongshipCustomizableParts::TryGetShipComponent(Ship,LongshipUpgrades.LongshipCustomizableParts&)
.locals 
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<UnityEngine.GameObject,LongshipUpgrades.LongshipCustomizableParts> LongshipUpgrades.LongshipCustomizableParts::s_allInstances
IL_0005: ldarg.0
IL_0006: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_000b: ldarg.1
IL_000c: callvirt System.Boolean System.Collections.Generic.Dictionary`2<UnityEngine.GameObject,LongshipUpgrades.LongshipCustomizableParts>::TryGetValue(!0,!1&)
IL_0011: brtrue.s IL_001c
IL_0013: ldarg.0
IL_0014: ldarg.1
IL_0015: callvirt System.Boolean UnityEngine.Component::TryGetComponent<LongshipUpgrades.LongshipCustomizableParts>(!!0&)
IL_001a: br.s IL_001d
IL_001c: ldc.i4.1
IL_001d: ret

// UnityEngine.Vector3 LongshipUpgrades.LongshipCustomizableParts::ParseVector3(System.String)
.locals System.String[], System.Single, System.Single, System.Single, UnityEngine.Vector3
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldc.i4.1
IL_0003: ldarg.0
IL_0004: callvirt System.Int32 System.String::get_Length()
IL_0009: ldc.i4.2
IL_000a: sub
IL_000b: callvirt System.String System.String::Substring(System.Int32,System.Int32)
IL_0010: ldc.i4.s 44
IL_0012: ldc.i4.0
IL_0013: callvirt System.String[] System.String::Split(System.Char,System.StringSplitOptions)
IL_0018: stloc.0
IL_0019: ldloc.0
IL_001a: ldc.i4.0
IL_001b: ldelem.ref
IL_001c: ldc.i4.s 46
IL_001e: ldc.i4.s 44
IL_0020: callvirt System.String System.String::Replace(System.Char,System.Char)
IL_0025: call System.Single System.Single::Parse(System.String)
IL_002a: stloc.1
IL_002b: ldloc.0
IL_002c: ldc.i4.1
IL_002d: ldelem.ref
IL_002e: ldc.i4.s 46
IL_0030: ldc.i4.s 44
IL_0032: callvirt System.String System.String::Replace(System.Char,System.Char)
IL_0037: call System.Single System.Single::Parse(System.String)
IL_003c: stloc.2
IL_003d: ldloc.0
IL_003e: ldc.i4.2
IL_003f: ldelem.ref
IL_0040: ldc.i4.s 46
IL_0042: ldc.i4.s 44
IL_0044: callvirt System.String System.String::Replace(System.Char,System.Char)
IL_0049: call System.Single System.Single::Parse(System.String)
IL_004e: stloc.3
IL_004f: ldloc.1
IL_0050: ldloc.2
IL_0051: ldloc.3
IL_0052: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0057: stloc.s V_4
IL_0059: br.s IL_005b
IL_005b: ldloc.s V_4
IL_005d: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::GetHildirMapTable()
.locals ZoneSystem/ZoneLocation, UnityEngine.Transform, UnityEngine.Transform, Switch, UnityEngine.Transform, Switch, MapTable, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_mapTablePrefab
IL_0006: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000b: stloc.s V_7
IL_000d: ldloc.s V_7
IL_000f: brfalse.s IL_0016
IL_0011: br IL_0297
IL_0016: call ZoneSystem ZoneSystem::get_instance()
IL_001b: ldfld System.Collections.Generic.List`1<ZoneSystem/ZoneLocation> ZoneSystem::m_locations
IL_0020: ldsfld System.Predicate`1<ZoneSystem/ZoneLocation> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__162_0
IL_0025: dup
IL_0026: brtrue.s IL_003f
IL_0028: pop
IL_0029: ldsfld LongshipUpgrades.LongshipCustomizableParts/<>c LongshipUpgrades.LongshipCustomizableParts/<>c::<>9
IL_002e: ldftn System.Boolean LongshipUpgrades.LongshipCustomizableParts/<>c::<GetHildirMapTable>b__162_0(ZoneSystem/ZoneLocation)
IL_0034: newobj System.Void System.Predicate`1<ZoneSystem/ZoneLocation>::.ctor(System.Object,System.IntPtr)
IL_0039: dup
IL_003a: stsfld System.Predicate`1<ZoneSystem/ZoneLocation> LongshipUpgrades.LongshipCustomizableParts/<>c::<>9__162_0
IL_003f: callvirt !0 System.Collections.Generic.List`1<ZoneSystem/ZoneLocation>::Find(System.Predicate`1<!0>)
IL_0044: stloc.0
IL_0045: ldloc.0
IL_0046: brfalse.s IL_0058
IL_0048: ldloc.0
IL_0049: ldflda SoftReferenceableAssets.SoftReference`1<UnityEngine.GameObject> ZoneSystem/ZoneLocation::m_prefab
IL_004e: call System.Boolean SoftReferenceableAssets.SoftReference`1<UnityEngine.GameObject>::get_IsValid()
IL_0053: ldc.i4.0
IL_0054: ceq
IL_0056: br.s IL_0059
IL_0058: ldc.i4.1
IL_0059: stloc.s V_8
IL_005b: ldloc.s V_8
IL_005d: brfalse.s IL_0064
IL_005f: br IL_0297
IL_0064: ldloc.0
IL_0065: ldflda SoftReferenceableAssets.SoftReference`1<UnityEngine.GameObject> ZoneSystem/ZoneLocation::m_prefab
IL_006a: call SoftReferenceableAssets.LoadResult SoftReferenceableAssets.SoftReference`1<UnityEngine.GameObject>::Load()
IL_006f: pop
IL_0070: ldloc.0
IL_0071: ldflda SoftReferenceableAssets.SoftReference`1<UnityEngine.GameObject> ZoneSystem/ZoneLocation::m_prefab
IL_0076: call !0 SoftReferenceableAssets.SoftReference`1<UnityEngine.GameObject>::get_Asset()
IL_007b: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0080: ldstr "stuff/hildir_maptable"
IL_0085: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_008a: dup
IL_008b: brtrue.s IL_0091
IL_008d: pop
IL_008e: ldnull
IL_008f: br.s IL_0096
IL_0091: call UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0096: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0)
IL_009b: stsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_mapTablePrefab
IL_00a0: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_mapTablePrefab
IL_00a5: ldstr "LongshipUpgrades_MapTable"
IL_00aa: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_00af: nop
IL_00b0: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_mapTablePrefab
IL_00b5: ldc.i4.0
IL_00b6: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_00bb: nop
IL_00bc: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_mapTablePrefab
IL_00c1: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_00c6: ldstr "default"
IL_00cb: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_00d0: stloc.1
IL_00d1: ldloc.1
IL_00d2: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.MeshRenderer>()
IL_00d7: call System.Void LongshipUpgrades.LongshipUpgrades::FixMeshRendererProperties(UnityEngine.MeshRenderer)
IL_00dc: nop
IL_00dd: ldloc.0
IL_00de: ldflda SoftReferenceableAssets.SoftReference`1<UnityEngine.GameObject> ZoneSystem/ZoneLocation::m_prefab
IL_00e3: call System.Void SoftReferenceableAssets.SoftReference`1<UnityEngine.GameObject>::Release()
IL_00e8: nop
IL_00e9: ldloc.1
IL_00ea: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.MeshCollider>()
IL_00ef: call System.Void UnityEngine.Object::DestroyImmediate(UnityEngine.Object)
IL_00f4: nop
IL_00f5: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_mapTablePrefab
IL_00fa: callvirt !!0 UnityEngine.GameObject::GetComponent<Vegvisir>()
IL_00ff: call System.Void UnityEngine.Object::DestroyImmediate(UnityEngine.Object)
IL_0104: nop
IL_0105: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_mapTablePrefab
IL_010a: callvirt !!0 UnityEngine.GameObject::GetComponent<UnityEngine.LODGroup>()
IL_010f: call System.Void UnityEngine.Object::DestroyImmediate(UnityEngine.Object)
IL_0114: nop
IL_0115: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_mapTablePrefab
IL_011a: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_011f: ldstr "low"
IL_0124: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0129: dup
IL_012a: brtrue.s IL_0130
IL_012c: pop
IL_012d: ldnull
IL_012e: br.s IL_0135
IL_0130: call UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0135: call System.Void UnityEngine.Object::DestroyImmediate(UnityEngine.Object)
IL_013a: nop
IL_013b: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_mapTablePrefab
IL_0140: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0145: ldstr "ReadMap"
IL_014a: ldtoken UnityEngine.BoxCollider
IL_014f: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0154: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_0159: stloc.2
IL_015a: ldloc.2
IL_015b: ldc.r4 -0.2
IL_0160: ldc.r4 0.9
IL_0165: ldc.r4 0
IL_016a: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_016f: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_0174: nop
IL_0175: ldloc.2
IL_0176: ldc.r4 0.4
IL_017b: ldc.r4 0.1
IL_0180: ldc.r4 0.6
IL_0185: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_018a: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_018f: nop
IL_0190: ldloc.2
IL_0191: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0196: callvirt !!0 UnityEngine.GameObject::AddComponent<Switch>()
IL_019b: stloc.3
IL_019c: ldloc.3
IL_019d: ldstr "$piece_cartographytable"
IL_01a2: stfld System.String Switch::m_name
IL_01a7: ldloc.2
IL_01a8: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_01ad: ldc.i4.s 28
IL_01af: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_01b4: nop
IL_01b5: ldloc.2
IL_01b6: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_01bb: ldc.i4.1
IL_01bc: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_01c1: nop
IL_01c2: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_mapTablePrefab
IL_01c7: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_01cc: ldstr "WriteMap"
IL_01d1: ldtoken UnityEngine.BoxCollider
IL_01d6: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_01db: call UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts::AddCollider(UnityEngine.Transform,System.String,System.Type)
IL_01e0: stloc.s V_4
IL_01e2: ldloc.s V_4
IL_01e4: ldc.r4 0.2
IL_01e9: ldc.r4 0.9
IL_01ee: ldc.r4 0
IL_01f3: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_01f8: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_01fd: nop
IL_01fe: ldloc.s V_4
IL_0200: ldc.r4 0.4
IL_0205: ldc.r4 0.1
IL_020a: ldc.r4 0.6
IL_020f: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0214: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_0219: nop
IL_021a: ldloc.s V_4
IL_021c: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0221: callvirt !!0 UnityEngine.GameObject::AddComponent<Switch>()
IL_0226: stloc.s V_5
IL_0228: ldloc.s V_5
IL_022a: ldstr "$piece_cartographytable"
IL_022f: stfld System.String Switch::m_name
IL_0234: ldloc.s V_4
IL_0236: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_023b: ldc.i4.s 28
IL_023d: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_0242: nop
IL_0243: ldloc.s V_4
IL_0245: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_024a: ldc.i4.1
IL_024b: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0250: nop
IL_0251: ldsfld UnityEngine.GameObject LongshipUpgrades.LongshipCustomizableParts::s_mapTablePrefab
IL_0256: callvirt !!0 UnityEngine.GameObject::AddComponent<MapTable>()
IL_025b: stloc.s V_6
IL_025d: ldloc.s V_6
IL_025f: call ZNetScene ZNetScene::get_instance()
IL_0264: ldstr "piece_cartographytable"
IL_0269: callvirt UnityEngine.GameObject ZNetScene::GetPrefab(System.String)
IL_026e: dup
IL_026f: brtrue.s IL_0275
IL_0271: pop
IL_0272: ldnull
IL_0273: br.s IL_0286
IL_0275: call !!0 UnityEngine.GameObject::GetComponent<MapTable>()
IL_027a: dup
IL_027b: brtrue.s IL_0281
IL_027d: pop
IL_027e: ldnull
IL_027f: br.s IL_0286
IL_0281: ldfld EffectList MapTable::m_writeEffects
IL_0286: stfld EffectList MapTable::m_writeEffects
IL_028b: ldloc.s V_6
IL_028d: ldstr "$piece_cartographytable"
IL_0292: stfld System.String MapTable::m_name
IL_0297: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: newobj System.Void System.Collections.Generic.Dictionary`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock>::.ctor()
IL_0006: stfld System.Collections.Generic.Dictionary`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock> LongshipUpgrades.LongshipCustomizableParts::s_propertyBlocks
IL_000b: ldarg.0
IL_000c: call System.Void UnityEngine.MonoBehaviour::.ctor()
IL_0011: nop
IL_0012: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::.cctor()
.locals HitData/DamageModPair
IL_0000: ldc.i4.0
IL_0001: stsfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::prefabInit
IL_0006: ldc.i4.0
IL_0007: stsfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::prefabInitialized
IL_000c: ldstr "VikingShip"
IL_0011: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0016: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::prefabInt
IL_001b: ldc.i4.1
IL_001c: stsfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::isTimeToLight
IL_0021: ldstr "MastUpgraded"
IL_0026: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_002b: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_mastUpgraded
IL_0030: ldstr "MastRemoved"
IL_0035: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_003a: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_mastRemoved
IL_003f: ldstr "LanternUpgraded"
IL_0044: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0049: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_lanternUpgraded
IL_004e: ldstr "LanternDisabled"
IL_0053: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0058: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_lanternDisabled
IL_005d: ldstr "TentUpgraded"
IL_0062: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0067: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_tentUpgraded
IL_006c: ldstr "TentDisabled"
IL_0071: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0076: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_tentDisabled
IL_007b: ldstr "LightDisabled"
IL_0080: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0085: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_lightsDisabled
IL_008a: ldstr "WispUpgraded"
IL_008f: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0094: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_wispUpgraded
IL_0099: ldstr "WispRemoved"
IL_009e: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_00a3: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_wispRemoved
IL_00a8: ldstr "MapTableUpgraded"
IL_00ad: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_00b2: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_mapTableUpgraded
IL_00b7: ldstr "MapDataCompressed"
IL_00bc: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_00c1: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_mapDataCompressed
IL_00c6: ldstr "ContainerUpgradedLvl1"
IL_00cb: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_00d0: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_containerUpgradedLvl1
IL_00d5: ldstr "ContainerUpgradedLvl2"
IL_00da: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_00df: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_containerUpgradedLvl2
IL_00e4: ldstr "HealthUpgraded"
IL_00e9: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_00ee: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_healthUpgraded
IL_00f3: ldstr "AshlandsUpgraded"
IL_00f8: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_00fd: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_ashlandsUpgraded
IL_0102: ldstr "TurretsUpgraded"
IL_0107: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_010c: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_turretsUpgraded
IL_0111: ldstr "TurretsDisabled"
IL_0116: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_011b: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_turretsDisabled
IL_0120: ldstr "HeadStyle"
IL_0125: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_012a: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_headStyle
IL_012f: ldstr "ShieldsStyle"
IL_0134: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0139: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_shieldsStyle
IL_013e: ldstr "TentStyle"
IL_0143: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0148: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_tentStyle
IL_014d: ldstr "SailStyle"
IL_0152: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0157: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_sailStyle
IL_015c: ldc.i4.2
IL_015d: ldc.i4.2
IL_015e: newobj System.Void UnityEngine.Texture2D::.ctor(System.Int32,System.Int32)
IL_0163: stsfld UnityEngine.Texture2D LongshipUpgrades.LongshipCustomizableParts::s_ashlandsHull
IL_0168: ldc.i4.2
IL_0169: ldc.i4.2
IL_016a: newobj System.Void UnityEngine.Texture2D::.ctor(System.Int32,System.Int32)
IL_016f: stsfld UnityEngine.Texture2D LongshipUpgrades.LongshipCustomizableParts::s_ashlandsHullDamaged
IL_0174: newobj System.Void System.Collections.Generic.List`1<UnityEngine.Texture2D>::.ctor()
IL_0179: stsfld System.Collections.Generic.List`1<UnityEngine.Texture2D> LongshipUpgrades.LongshipCustomizableParts::customTents
IL_017e: newobj System.Void System.Collections.Generic.List`1<UnityEngine.Texture2D>::.ctor()
IL_0183: stsfld System.Collections.Generic.List`1<UnityEngine.Texture2D> LongshipUpgrades.LongshipCustomizableParts::customSails
IL_0188: newobj System.Void System.Collections.Generic.List`1<UnityEngine.Texture2D>::.ctor()
IL_018d: stsfld System.Collections.Generic.List`1<UnityEngine.Texture2D> LongshipUpgrades.LongshipCustomizableParts::customShields
IL_0192: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,EffectList>::.ctor()
IL_0197: stsfld System.Collections.Generic.Dictionary`2<System.String,EffectList> LongshipUpgrades.LongshipCustomizableParts::buildEffects
IL_019c: newobj System.Void EffectList::.ctor()
IL_01a1: stsfld EffectList LongshipUpgrades.LongshipCustomizableParts::partEffects
IL_01a6: newobj System.Void System.Collections.Generic.Dictionary`2<UnityEngine.GameObject,LongshipUpgrades.LongshipCustomizableParts>::.ctor()
IL_01ab: stsfld System.Collections.Generic.Dictionary`2<UnityEngine.GameObject,LongshipUpgrades.LongshipCustomizableParts> LongshipUpgrades.LongshipCustomizableParts::s_allInstances
IL_01b0: newobj System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::.ctor()
IL_01b5: dup
IL_01b6: ldloca.s V_0
IL_01b8: initobj HitData/DamageModPair
IL_01be: ldloca.s V_0
IL_01c0: ldc.i4.s 32
IL_01c2: stfld HitData/DamageType HitData/DamageModPair::m_type
IL_01c7: ldloca.s V_0
IL_01c9: ldc.i4.5
IL_01ca: stfld HitData/DamageModifier HitData/DamageModPair::m_modifier
IL_01cf: ldloc.0
IL_01d0: callvirt System.Void System.Collections.Generic.List`1<HitData/DamageModPair>::Add(!0)
IL_01d5: nop
IL_01d6: stsfld System.Collections.Generic.List`1<HitData/DamageModPair> LongshipUpgrades.LongshipCustomizableParts::s_fireResistantModifiers
IL_01db: ldstr "ShipMapDataRevision"
IL_01e0: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_01e5: stsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_shipMapDataRevision
IL_01ea: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::<FixedUpdate>b__118_0(UnityEngine.GameObject)
.locals 
IL_0000: ldarg.1
IL_0001: brtrue.s IL_0005
IL_0003: br.s IL_0012
IL_0005: ldarg.1
IL_0006: ldarg.0
IL_0007: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_containerUpgradedLvl2
IL_000c: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0011: nop
IL_0012: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::<FixedUpdate>b__118_1(UnityEngine.GameObject)
.locals 
IL_0000: ldarg.1
IL_0001: brtrue.s IL_0005
IL_0003: br.s IL_0012
IL_0005: ldarg.1
IL_0006: ldarg.0
IL_0007: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_containerUpgradedLvl1
IL_000c: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0011: nop
IL_0012: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::<FixedUpdate>b__118_2(UnityEngine.GameObject)
.locals 
IL_0000: ldarg.1
IL_0001: brtrue.s IL_0005
IL_0003: br.s IL_0012
IL_0005: ldarg.1
IL_0006: ldarg.0
IL_0007: ldfld System.Boolean LongshipUpgrades.LongshipCustomizableParts::m_healthUpgraded
IL_000c: call System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0011: nop
IL_0012: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::<InitializeParts>g__AddHealthController|138_2(UnityEngine.Transform,System.Int32,System.String,System.Single,LongshipUpgrades.LongshipCustomizableParts/<>c__DisplayClass138_0&)
.locals UnityEngine.GameObject, LongshipUpgrades.LongshipPartController, System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: ldarg.2
IL_0003: callvirt UnityEngine.Transform UnityEngine.Transform::GetChild(System.Int32)
IL_0008: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_000d: ldarg.s 
IL_000f: ldfld UnityEngine.Transform LongshipUpgrades.LongshipCustomizableParts/<>c__DisplayClass138_0::healthParent
IL_0014: ldc.i4.1
IL_0015: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Transform,System.Boolean)
IL_001a: stloc.0
IL_001b: ldloc.0
IL_001c: ldarg.2
IL_001d: brfalse.s IL_0032
IL_001f: ldstr "{0} ({1})"
IL_0024: ldarg.3
IL_0025: ldarg.2
IL_0026: box System.Int32
IL_002b: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_0030: br.s IL_0033
IL_0032: ldarg.3
IL_0033: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_0038: nop
IL_0039: ldloc.0
IL_003a: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_003f: dup
IL_0040: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localPosition()
IL_0045: ldc.r4 0
IL_004a: ldc.r4 0
IL_004f: ldarg.s offset
IL_0051: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0056: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_005b: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_0060: nop
IL_0061: ldloc.0
IL_0062: callvirt UnityEngine.GameObject UnityEngine.GameObject::get_gameObject()
IL_0067: callvirt !!0 UnityEngine.GameObject::AddComponent<LongshipUpgrades.LongshipPartController>()
IL_006c: stloc.1
IL_006d: ldloc.1
IL_006e: ldarg.0
IL_006f: ldfld ZNetView LongshipUpgrades.LongshipCustomizableParts::m_nview
IL_0074: stfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_0079: ldloc.1
IL_007a: ldstr "$lu_part_hull_name"
IL_007f: stfld System.String LongshipUpgrades.LongshipPartController::m_name
IL_0084: ldloc.1
IL_0085: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_healthUpgraded
IL_008a: ldstr "$lu_part_hull_upgrade1"
IL_008f: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::healthUpgradeRecipe
IL_0094: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_0099: call Piece/Requirement[] LongshipUpgrades.LongshipUpgrades::ParseRequirements(System.String)
IL_009e: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::healthLvl1Station
IL_00a3: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_00a8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::healthLvl1StationLvl
IL_00ad: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_00b2: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::healthLvl1StationRange
IL_00b7: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_00bc: callvirt System.Void LongshipUpgrades.LongshipPartController::AddUpgradeRequirement(System.Int32,System.String,Piece/Requirement[],System.String,System.Int32,System.Int32)
IL_00c1: nop
IL_00c2: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::healthUpgradeLvl2
IL_00c7: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_00cc: ldc.i4.0
IL_00cd: cgt.un
IL_00cf: stloc.2
IL_00d0: ldloc.2
IL_00d1: brfalse.s IL_013e
IL_00d3: nop
IL_00d4: ldloc.1
IL_00d5: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_ashlandsUpgraded
IL_00da: call Localization Localization::get_instance()
IL_00df: ldstr "$lu_part_hull_upgrade2"
IL_00e4: ldc.i4.1
IL_00e5: newarr System.String
IL_00ea: dup
IL_00eb: ldc.i4.0
IL_00ec: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::ashlandsProtection
IL_00f1: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_00f6: brtrue.s IL_00ff
IL_00f8: ldstr ""
IL_00fd: br.s IL_0104
IL_00ff: ldstr "
$lu_part_hull_upgrade2_ashlands"
IL_0104: stelem.ref
IL_0105: callvirt System.String Localization::Localize(System.String,System.String[])
IL_010a: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::ashlandsUpgradeRecipe
IL_010f: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_0114: call Piece/Requirement[] LongshipUpgrades.LongshipUpgrades::ParseRequirements(System.String)
IL_0119: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::healthLvl2Station
IL_011e: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_0123: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::healthLvl2StationLvl
IL_0128: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_012d: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::healthLvl2StationRange
IL_0132: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0137: callvirt System.Void LongshipUpgrades.LongshipPartController::AddUpgradeRequirement(System.Int32,System.String,Piece/Requirement[],System.String,System.Int32,System.Int32)
IL_013c: nop
IL_013d: nop
IL_013e: ldloc.0
IL_013f: callvirt UnityEngine.GameObject UnityEngine.GameObject::get_gameObject()
IL_0144: ldc.i4.1
IL_0145: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_014a: nop
IL_014b: ldloc.0
IL_014c: callvirt UnityEngine.GameObject UnityEngine.GameObject::get_gameObject()
IL_0151: ldc.i4.s 16
IL_0153: callvirt System.Void UnityEngine.GameObject::set_layer(System.Int32)
IL_0158: nop
IL_0159: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::<DropSpentUpgrades>b__141_0(Piece/Requirement[])
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<Piece/Requirement>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0007: call System.Void LongshipUpgrades.LongshipCustomizableParts::DropRequirements(System.Collections.Generic.List`1<Piece/Requirement>)
IL_000c: nop
IL_000d: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts::<CheckEffects>g__AddEffect|156_0(System.Int32,System.String,LongshipUpgrades.LongshipCustomizableParts/<>c__DisplayClass156_0&)
.locals UnityEngine.GameObject
IL_0000: nop
IL_0001: call ZNetScene ZNetScene::get_instance()
IL_0006: ldarg.1
IL_0007: callvirt UnityEngine.GameObject ZNetScene::GetPrefab(System.String)
IL_000c: call UnityEngine.GameObject LongshipUpgrades.PrefabAudio::Clone(UnityEngine.GameObject)
IL_0011: stloc.0
IL_0012: ldarg.2
IL_0013: ldfld System.Collections.Generic.List`1<EffectList/EffectData> LongshipUpgrades.LongshipCustomizableParts/<>c__DisplayClass156_0::effectPrefabs
IL_0018: ldarg.0
IL_0019: newobj System.Void EffectList/EffectData::.ctor()
IL_001e: dup
IL_001f: ldloc.0
IL_0020: stfld UnityEngine.GameObject EffectList/EffectData::m_prefab
IL_0025: dup
IL_0026: ldloc.0
IL_0027: ldnull
IL_0028: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_002d: stfld System.Boolean EffectList/EffectData::m_enabled
IL_0032: dup
IL_0033: ldarg.0
IL_0034: stfld System.Int32 EffectList/EffectData::m_variant
IL_0039: callvirt System.Void System.Collections.Generic.List`1<EffectList/EffectData>::Insert(System.Int32,!0)
IL_003e: nop
IL_003f: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts/<>c::.cctor()
.locals 
IL_0000: newobj System.Void LongshipUpgrades.LongshipCustomizableParts/<>c::.ctor()
IL_0005: stsfld LongshipUpgrades.LongshipCustomizableParts/<>c LongshipUpgrades.LongshipCustomizableParts/<>c::<>9
IL_000a: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Boolean LongshipUpgrades.LongshipCustomizableParts/<>c::<Awake>b__114_0(Container)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0006: callvirt System.String UnityEngine.Object::get_name()
IL_000b: ldstr "piece_chest"
IL_0010: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0015: ret

// System.Boolean LongshipUpgrades.LongshipCustomizableParts/<>c::<Awake>b__114_1(Recipe)
.locals 
IL_0000: ldarg.1
IL_0001: ldfld CraftingStation Recipe::m_craftingStation
IL_0006: ldnull
IL_0007: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_000c: brfalse.s IL_0020
IL_000e: ldarg.1
IL_000f: ldfld CraftingStation Recipe::m_craftingStation
IL_0014: ldfld EffectList CraftingStation::m_craftItemEffects
IL_0019: callvirt System.Boolean EffectList::HasEffects()
IL_001e: br.s IL_0021
IL_0020: ldc.i4.0
IL_0021: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts/<>c::<Awake>b__114_2(Recipe)
.locals 
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<System.String,EffectList> LongshipUpgrades.LongshipCustomizableParts::buildEffects
IL_0005: ldarg.1
IL_0006: ldfld CraftingStation Recipe::m_craftingStation
IL_000b: ldfld System.String CraftingStation::m_name
IL_0010: ldarg.1
IL_0011: ldfld CraftingStation Recipe::m_craftingStation
IL_0016: ldfld EffectList CraftingStation::m_craftItemEffects
IL_001b: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,EffectList>::set_Item(!0,!1)
IL_0020: nop
IL_0021: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts/<>c::<FixedUpdate>b__118_3(UnityEngine.AudioSource)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt System.Void UnityEngine.AudioSource::Stop()
IL_0006: nop
IL_0007: ret

// UnityEngine.Renderer LongshipUpgrades.LongshipCustomizableParts/<>c::<UpdateHullPropertyBlocks>b__127_0(UnityEngine.GameObject)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt !!0 UnityEngine.GameObject::GetComponent<UnityEngine.Renderer>()
IL_0006: ret

// UnityEngine.Renderer LongshipUpgrades.LongshipCustomizableParts/<>c::<UpdateShieldsPropertyBlocks>b__128_0(UnityEngine.GameObject)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt !!0 UnityEngine.GameObject::GetComponent<UnityEngine.Renderer>()
IL_0006: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts/<>c::<UpdatePropertyBlocks>b__129_0(UnityEngine.Renderer)
.locals 
IL_0000: ldarg.1
IL_0001: ldnull
IL_0002: callvirt System.Void UnityEngine.Renderer::SetPropertyBlock(UnityEngine.MaterialPropertyBlock)
IL_0007: nop
IL_0008: ret

// System.Void LongshipUpgrades.LongshipCustomizableParts/<>c::<SetPropertyBlocks>b__137_0(System.Collections.Generic.KeyValuePair`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock>)
.locals 
IL_0000: ldarga.s rendererBlock
IL_0002: call !0 System.Collections.Generic.KeyValuePair`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock>::get_Key()
IL_0007: ldarga.s rendererBlock
IL_0009: call !1 System.Collections.Generic.KeyValuePair`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock>::get_Value()
IL_000e: callvirt System.Boolean UnityEngine.MaterialPropertyBlock::get_isEmpty()
IL_0013: brtrue.s IL_001e
IL_0015: ldarga.s rendererBlock
IL_0017: call !1 System.Collections.Generic.KeyValuePair`2<UnityEngine.Renderer,UnityEngine.MaterialPropertyBlock>::get_Value()
IL_001c: br.s IL_001f
IL_001e: ldnull
IL_001f: callvirt System.Void UnityEngine.Renderer::SetPropertyBlock(UnityEngine.MaterialPropertyBlock)
IL_0024: nop
IL_0025: ret

// System.Boolean LongshipUpgrades.LongshipCustomizableParts/<>c::<InitializeParts>b__138_0(Turret)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt System.String UnityEngine.Object::get_name()
IL_0006: ldstr "piece_turret"
IL_000b: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0010: ret

// System.Boolean LongshipUpgrades.LongshipCustomizableParts/<>c::<InitializeParts>b__138_1(ItemStand)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0006: callvirt UnityEngine.Transform UnityEngine.Transform::get_root()
IL_000b: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0010: callvirt System.String UnityEngine.Object::get_name()
IL_0015: ldstr "BossStone_DragonQueen"
IL_001a: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_001f: ret

// System.Boolean LongshipUpgrades.LongshipCustomizableParts/<>c::<FixPrefab>b__150_0(Ship)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt System.String UnityEngine.Object::get_name()
IL_0006: ldstr "VikingShip"
IL_000b: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0010: ret

// System.Boolean LongshipUpgrades.LongshipCustomizableParts/<>c::<GetHildirMapTable>b__162_0(ZoneSystem/ZoneLocation)
.locals 
IL_0000: ldarg.1
IL_0001: ldfld System.String ZoneSystem/ZoneLocation::m_prefabName
IL_0006: ldstr "Hildir_camp"
IL_000b: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0010: ret

// System.Void LongshipUpgrades.LongshipPartController::Awake()
.locals System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldsfld Recipe LongshipUpgrades.LongshipPartController::tempRecipe
IL_0006: ldnull
IL_0007: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_000c: stloc.0
IL_000d: ldloc.0
IL_000e: brfalse.s IL_002c
IL_0010: nop
IL_0011: call !!0 UnityEngine.ScriptableObject::CreateInstance<Recipe>()
IL_0016: stsfld Recipe LongshipUpgrades.LongshipPartController::tempRecipe
IL_001b: ldsfld Recipe LongshipUpgrades.LongshipPartController::tempRecipe
IL_0020: ldstr "LongshipPartUpgradeTempRecipe"
IL_0025: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_002a: nop
IL_002b: nop
IL_002c: ldarg.0
IL_002d: ldfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_0032: ldnull
IL_0033: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0038: stloc.1
IL_0039: ldloc.1
IL_003a: brfalse.s IL_0048
IL_003c: ldarg.0
IL_003d: ldarg.0
IL_003e: call !!0 UnityEngine.Component::GetComponentInParent<ZNetView>()
IL_0043: stfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_0048: ldarg.0
IL_0049: ldarg.0
IL_004a: call !!0 UnityEngine.Component::GetComponentInParent<Ship>()
IL_004f: stfld Ship LongshipUpgrades.LongshipPartController::m_ship
IL_0054: ldarg.0
IL_0055: ldarg.0
IL_0056: call !!0 UnityEngine.Component::GetComponentInParent<Piece>()
IL_005b: stfld Piece LongshipUpgrades.LongshipPartController::m_piece
IL_0060: ret

// System.String LongshipUpgrades.LongshipPartController::GetHoverText()
.locals ZDO, System.Boolean, System.String, System.Boolean, System.Boolean, System.Boolean, System.Boolean, LongshipUpgrades.LongshipPartController/UpgradeRequirements[], System.Int32, LongshipUpgrades.LongshipPartController/UpgradeRequirements, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_0007: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000c: brfalse.s IL_001e
IL_000e: ldarg.0
IL_000f: ldfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_0014: callvirt System.Boolean ZNetView::IsValid()
IL_0019: ldc.i4.0
IL_001a: ceq
IL_001c: br.s IL_001f
IL_001e: ldc.i4.1
IL_001f: stloc.1
IL_0020: ldloc.1
IL_0021: brfalse.s IL_002e
IL_0023: ldstr ""
IL_0028: stloc.2
IL_0029: br IL_0252
IL_002e: ldarg.0
IL_002f: call System.Boolean LongshipUpgrades.LongshipPartController::IsPositionToInteract()
IL_0034: ldc.i4.0
IL_0035: ceq
IL_0037: stloc.3
IL_0038: ldloc.3
IL_0039: brfalse.s IL_0046
IL_003b: ldstr ""
IL_0040: stloc.2
IL_0041: br IL_0252
IL_0046: ldarg.0
IL_0047: ldsfld Player Player::m_localPlayer
IL_004c: call System.Boolean LongshipUpgrades.LongshipPartController::InUseDistance(Humanoid)
IL_0051: ldc.i4.0
IL_0052: ceq
IL_0054: stloc.s V_4
IL_0056: ldloc.s V_4
IL_0058: brfalse.s IL_006f
IL_005a: call Localization Localization::get_instance()
IL_005f: ldstr "<color=#888888>$piece_toofar</color>"
IL_0064: callvirt System.String Localization::Localize(System.String)
IL_0069: stloc.2
IL_006a: br IL_0252
IL_006f: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::onlyCreatorUpgrades
IL_0074: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0079: brfalse.s IL_0099
IL_007b: ldarg.0
IL_007c: ldfld Piece LongshipUpgrades.LongshipPartController::m_piece
IL_0081: ldnull
IL_0082: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0087: brfalse.s IL_0099
IL_0089: ldarg.0
IL_008a: ldfld Piece LongshipUpgrades.LongshipPartController::m_piece
IL_008f: callvirt System.Boolean Piece::IsCreator()
IL_0094: ldc.i4.0
IL_0095: ceq
IL_0097: br.s IL_009a
IL_0099: ldc.i4.0
IL_009a: stloc.s V_5
IL_009c: ldloc.s V_5
IL_009e: brfalse.s IL_00b5
IL_00a0: call Localization Localization::get_instance()
IL_00a5: ldstr "<color=#888888>$piece_noaccess</color>"
IL_00aa: callvirt System.String Localization::Localize(System.String)
IL_00af: stloc.2
IL_00b0: br IL_0252
IL_00b5: ldarg.0
IL_00b6: ldfld System.Boolean LongshipUpgrades.LongshipPartController::m_checkGuardStone
IL_00bb: brfalse.s IL_00d9
IL_00bd: ldarg.0
IL_00be: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_00c3: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_00c8: ldc.r4 0
IL_00cd: ldc.i4.0
IL_00ce: ldc.i4.0
IL_00cf: call System.Boolean PrivateArea::CheckAccess(UnityEngine.Vector3,System.Single,System.Boolean,System.Boolean)
IL_00d4: ldc.i4.0
IL_00d5: ceq
IL_00d7: br.s IL_00da
IL_00d9: ldc.i4.0
IL_00da: stloc.s V_6
IL_00dc: ldloc.s V_6
IL_00de: brfalse.s IL_0100
IL_00e0: call Localization Localization::get_instance()
IL_00e5: ldarg.0
IL_00e6: ldfld System.String LongshipUpgrades.LongshipPartController::m_name
IL_00eb: ldstr "
$piece_noaccess"
IL_00f0: call System.String System.String::Concat(System.String,System.String)
IL_00f5: callvirt System.String Localization::Localize(System.String)
IL_00fa: stloc.2
IL_00fb: br IL_0252
IL_0100: ldarg.0
IL_0101: ldfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_0106: callvirt ZDO ZNetView::GetZDO()
IL_010b: stloc.0
IL_010c: nop
IL_010d: ldarg.0
IL_010e: ldfld LongshipUpgrades.LongshipPartController/UpgradeRequirements[] LongshipUpgrades.LongshipPartController::m_upgradeRequirements
IL_0113: stloc.s V_7
IL_0115: ldc.i4.0
IL_0116: stloc.s V_8
IL_0118: br.s IL_0155
IL_011a: ldloc.s V_7
IL_011c: ldloc.s V_8
IL_011e: ldelem.ref
IL_011f: stloc.s V_9
IL_0121: ldloc.s V_9
IL_0123: ldloc.0
IL_0124: ldarg.0
IL_0125: ldfld System.String LongshipUpgrades.LongshipPartController::m_name
IL_012a: callvirt System.Boolean LongshipUpgrades.LongshipPartController/UpgradeRequirements::FillUpgradeHover(ZDO,System.String)
IL_012f: stloc.s V_10
IL_0131: ldloc.s V_10
IL_0133: brfalse.s IL_014f
IL_0135: call Localization Localization::get_instance()
IL_013a: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_013f: callvirt System.String System.Object::ToString()
IL_0144: callvirt System.String Localization::Localize(System.String)
IL_0149: stloc.2
IL_014a: br IL_0252
IL_014f: ldloc.s V_8
IL_0151: ldc.i4.1
IL_0152: add
IL_0153: stloc.s V_8
IL_0155: ldloc.s V_8
IL_0157: ldloc.s V_7
IL_0159: ldlen
IL_015a: conv.i4
IL_015b: blt.s IL_011a
IL_015d: ldarg.0
IL_015e: ldfld System.Int32 LongshipUpgrades.LongshipPartController::m_zdoPartVariant
IL_0163: brfalse.s IL_0170
IL_0165: ldarg.0
IL_0166: ldfld System.Int32 LongshipUpgrades.LongshipPartController::m_variants
IL_016b: ldc.i4.1
IL_016c: cgt
IL_016e: br.s IL_0171
IL_0170: ldc.i4.0
IL_0171: stloc.s V_11
IL_0173: ldloc.s V_11
IL_0175: brfalse.s IL_01cf
IL_0177: nop
IL_0178: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_017d: callvirt System.Text.StringBuilder System.Text.StringBuilder::Clear()
IL_0182: pop
IL_0183: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_0188: ldarg.0
IL_0189: ldfld System.String LongshipUpgrades.LongshipPartController::m_name
IL_018e: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0193: pop
IL_0194: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_0199: ldstr "
[<color=yellow><b>$KEY_Use</b></color>] "
IL_019e: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_01a3: pop
IL_01a4: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_01a9: ldarg.0
IL_01aa: ldfld System.String LongshipUpgrades.LongshipPartController::m_messageSwitch
IL_01af: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_01b4: pop
IL_01b5: call Localization Localization::get_instance()
IL_01ba: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_01bf: callvirt System.String System.Object::ToString()
IL_01c4: callvirt System.String Localization::Localize(System.String)
IL_01c9: stloc.2
IL_01ca: br IL_0252
IL_01cf: ldarg.0
IL_01d0: ldfld System.Int32 LongshipUpgrades.LongshipPartController::m_zdoPartDisabled
IL_01d5: ldc.i4.0
IL_01d6: cgt.un
IL_01d8: stloc.s V_12
IL_01da: ldloc.s V_12
IL_01dc: brfalse.s IL_024a
IL_01de: nop
IL_01df: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_01e4: callvirt System.Text.StringBuilder System.Text.StringBuilder::Clear()
IL_01e9: pop
IL_01ea: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_01ef: ldarg.0
IL_01f0: ldfld System.String LongshipUpgrades.LongshipPartController::m_name
IL_01f5: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_01fa: pop
IL_01fb: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_0200: ldstr "
[<color=yellow><b>$KEY_Use</b></color>] "
IL_0205: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_020a: pop
IL_020b: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_0210: ldloc.0
IL_0211: ldarg.0
IL_0212: ldfld System.Int32 LongshipUpgrades.LongshipPartController::m_zdoPartDisabled
IL_0217: ldc.i4.0
IL_0218: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_021d: brtrue.s IL_0227
IL_021f: ldarg.0
IL_0220: ldfld System.String LongshipUpgrades.LongshipPartController::m_messageDisable
IL_0225: br.s IL_022d
IL_0227: ldarg.0
IL_0228: ldfld System.String LongshipUpgrades.LongshipPartController::m_messageEnable
IL_022d: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0232: pop
IL_0233: call Localization Localization::get_instance()
IL_0238: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_023d: callvirt System.String System.Object::ToString()
IL_0242: callvirt System.String Localization::Localize(System.String)
IL_0247: stloc.2
IL_0248: br.s IL_0252
IL_024a: ldstr ""
IL_024f: stloc.2
IL_0250: br.s IL_0252
IL_0252: ldloc.2
IL_0253: ret

// System.String LongshipUpgrades.LongshipPartController::GetHoverName()
.locals System.String
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.String LongshipUpgrades.LongshipPartController::m_name
IL_0007: stloc.0
IL_0008: br.s IL_000a
IL_000a: ldloc.0
IL_000b: ret

// System.Single LongshipUpgrades.LongshipPartController::GetHoverOffset()
.locals System.Single
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.Single LongshipUpgrades.LongshipPartController::m_hoverOffset
IL_0007: stloc.0
IL_0008: br.s IL_000a
IL_000a: ldloc.0
IL_000b: ret

// System.Boolean LongshipUpgrades.LongshipPartController::Interact(Humanoid,System.Boolean,System.Boolean)
.locals Player, ZDO, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, LongshipUpgrades.LongshipPartController/UpgradeRequirements[], System.Int32, LongshipUpgrades.LongshipPartController/UpgradeRequirements, System.Boolean, System.Boolean, System.Boolean, UnityEngine.Vector3, System.Boolean
IL_0000: nop
IL_0001: ldarg.2
IL_0002: stloc.3
IL_0003: ldloc.3
IL_0004: brfalse.s IL_000e
IL_0006: ldc.i4.0
IL_0007: stloc.s V_4
IL_0009: br IL_0254
IL_000e: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::onlyCreatorUpgrades
IL_0013: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0018: brfalse.s IL_0038
IL_001a: ldarg.0
IL_001b: ldfld Piece LongshipUpgrades.LongshipPartController::m_piece
IL_0020: ldnull
IL_0021: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0026: brfalse.s IL_0038
IL_0028: ldarg.0
IL_0029: ldfld Piece LongshipUpgrades.LongshipPartController::m_piece
IL_002e: callvirt System.Boolean Piece::IsCreator()
IL_0033: ldc.i4.0
IL_0034: ceq
IL_0036: br.s IL_0039
IL_0038: ldc.i4.0
IL_0039: stloc.s V_5
IL_003b: ldloc.s V_5
IL_003d: brfalse.s IL_0047
IL_003f: ldc.i4.0
IL_0040: stloc.s V_4
IL_0042: br IL_0254
IL_0047: ldarg.0
IL_0048: ldfld System.Boolean LongshipUpgrades.LongshipPartController::m_checkGuardStone
IL_004d: brfalse.s IL_006b
IL_004f: ldarg.0
IL_0050: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0055: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_005a: ldc.r4 0
IL_005f: ldc.i4.1
IL_0060: ldc.i4.0
IL_0061: call System.Boolean PrivateArea::CheckAccess(UnityEngine.Vector3,System.Single,System.Boolean,System.Boolean)
IL_0066: ldc.i4.0
IL_0067: ceq
IL_0069: br.s IL_006c
IL_006b: ldc.i4.0
IL_006c: stloc.s V_6
IL_006e: ldloc.s V_6
IL_0070: brfalse.s IL_007a
IL_0072: ldc.i4.0
IL_0073: stloc.s V_4
IL_0075: br IL_0254
IL_007a: ldarg.0
IL_007b: ldarg.1
IL_007c: call System.Boolean LongshipUpgrades.LongshipPartController::InUseDistance(Humanoid)
IL_0081: ldc.i4.0
IL_0082: ceq
IL_0084: stloc.s V_7
IL_0086: ldloc.s V_7
IL_0088: brfalse.s IL_0092
IL_008a: ldc.i4.0
IL_008b: stloc.s V_4
IL_008d: br IL_0254
IL_0092: ldarg.0
IL_0093: ldfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_0098: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_009d: brfalse.s IL_00af
IL_009f: ldarg.0
IL_00a0: ldfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_00a5: callvirt System.Boolean ZNetView::IsValid()
IL_00aa: ldc.i4.0
IL_00ab: ceq
IL_00ad: br.s IL_00b0
IL_00af: ldc.i4.1
IL_00b0: stloc.s V_8
IL_00b2: ldloc.s V_8
IL_00b4: brfalse.s IL_00be
IL_00b6: ldc.i4.0
IL_00b7: stloc.s V_4
IL_00b9: br IL_0254
IL_00be: ldarg.0
IL_00bf: call System.Boolean LongshipUpgrades.LongshipPartController::IsPositionToInteract()
IL_00c4: ldc.i4.0
IL_00c5: ceq
IL_00c7: stloc.s V_9
IL_00c9: ldloc.s V_9
IL_00cb: brfalse.s IL_00d5
IL_00cd: ldc.i4.0
IL_00ce: stloc.s V_4
IL_00d0: br IL_0254
IL_00d5: ldarg.1
IL_00d6: isinst Player
IL_00db: stloc.0
IL_00dc: ldarg.0
IL_00dd: ldfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_00e2: callvirt ZDO ZNetView::GetZDO()
IL_00e7: stloc.1
IL_00e8: nop
IL_00e9: ldarg.0
IL_00ea: ldfld LongshipUpgrades.LongshipPartController/UpgradeRequirements[] LongshipUpgrades.LongshipPartController::m_upgradeRequirements
IL_00ef: stloc.s V_10
IL_00f1: ldc.i4.0
IL_00f2: stloc.s V_11
IL_00f4: br.s IL_012d
IL_00f6: ldloc.s V_10
IL_00f8: ldloc.s V_11
IL_00fa: ldelem.ref
IL_00fb: stloc.s V_12
IL_00fd: ldloc.s V_12
IL_00ff: ldarg.0
IL_0100: ldfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_0105: ldloc.0
IL_0106: ldarg.0
IL_0107: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_010c: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0111: ldloca.s V_13
IL_0113: callvirt System.Boolean LongshipUpgrades.LongshipPartController/UpgradeRequirements::CheckConsume(ZNetView,Player,UnityEngine.Vector3,System.Boolean&)
IL_0118: stloc.s V_14
IL_011a: ldloc.s V_14
IL_011c: brfalse.s IL_0127
IL_011e: ldloc.s V_13
IL_0120: stloc.s V_4
IL_0122: br IL_0254
IL_0127: ldloc.s V_11
IL_0129: ldc.i4.1
IL_012a: add
IL_012b: stloc.s V_11
IL_012d: ldloc.s V_11
IL_012f: ldloc.s V_10
IL_0131: ldlen
IL_0132: conv.i4
IL_0133: blt.s IL_00f6
IL_0135: ldarg.0
IL_0136: ldfld System.Int32 LongshipUpgrades.LongshipPartController::m_zdoPartVariant
IL_013b: brfalse.s IL_0148
IL_013d: ldarg.0
IL_013e: ldfld System.Int32 LongshipUpgrades.LongshipPartController::m_variants
IL_0143: ldc.i4.1
IL_0144: cgt
IL_0146: br.s IL_0149
IL_0148: ldc.i4.0
IL_0149: stloc.s V_15
IL_014b: ldloc.s V_15
IL_014d: brfalse.s IL_01c6
IL_014f: nop
IL_0150: ldarg.0
IL_0151: ldfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_0156: ldstr "SetVariant"
IL_015b: ldc.i4.4
IL_015c: newarr System.Object
IL_0161: dup
IL_0162: ldc.i4.0
IL_0163: ldarg.0
IL_0164: ldfld System.Int32 LongshipUpgrades.LongshipPartController::m_zdoPartVariant
IL_0169: box System.Int32
IL_016e: stelem.ref
IL_016f: dup
IL_0170: ldc.i4.1
IL_0171: ldloc.1
IL_0172: ldarg.0
IL_0173: ldfld System.Int32 LongshipUpgrades.LongshipPartController::m_zdoPartVariant
IL_0178: ldc.i4.0
IL_0179: callvirt System.Int32 ZDO::GetInt(System.Int32,System.Int32)
IL_017e: ldc.i4.1
IL_017f: add
IL_0180: ldarg.0
IL_0181: ldfld System.Int32 LongshipUpgrades.LongshipPartController::m_variants
IL_0186: rem
IL_0187: box System.Int32
IL_018c: stelem.ref
IL_018d: dup
IL_018e: ldc.i4.2
IL_018f: ldarg.0
IL_0190: ldfld System.Int32 LongshipUpgrades.LongshipPartController::m_switchEffects
IL_0195: box System.Int32
IL_019a: stelem.ref
IL_019b: dup
IL_019c: ldc.i4.3
IL_019d: ldarg.0
IL_019e: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_01a3: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_01a8: stloc.s V_16
IL_01aa: ldloca.s V_16
IL_01ac: constrained. UnityEngine.Vector3
IL_01b2: callvirt System.String System.Object::ToString()
IL_01b7: stelem.ref
IL_01b8: callvirt System.Void ZNetView::InvokeRPC(System.String,System.Object[])
IL_01bd: nop
IL_01be: ldc.i4.1
IL_01bf: stloc.s V_4
IL_01c1: br IL_0254
IL_01c6: ldarg.0
IL_01c7: ldfld System.Int32 LongshipUpgrades.LongshipPartController::m_zdoPartDisabled
IL_01cc: ldc.i4.0
IL_01cd: ceq
IL_01cf: stloc.s V_17
IL_01d1: ldloc.s V_17
IL_01d3: brfalse.s IL_01da
IL_01d5: ldc.i4.0
IL_01d6: stloc.s V_4
IL_01d8: br.s IL_0254
IL_01da: ldloc.1
IL_01db: ldarg.0
IL_01dc: ldfld System.Int32 LongshipUpgrades.LongshipPartController::m_zdoPartDisabled
IL_01e1: ldc.i4.0
IL_01e2: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_01e7: ldc.i4.0
IL_01e8: ceq
IL_01ea: stloc.2
IL_01eb: ldarg.0
IL_01ec: ldfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_01f1: ldstr "SetActive"
IL_01f6: ldc.i4.4
IL_01f7: newarr System.Object
IL_01fc: dup
IL_01fd: ldc.i4.0
IL_01fe: ldarg.0
IL_01ff: ldfld System.Int32 LongshipUpgrades.LongshipPartController::m_zdoPartDisabled
IL_0204: box System.Int32
IL_0209: stelem.ref
IL_020a: dup
IL_020b: ldc.i4.1
IL_020c: ldloc.2
IL_020d: box System.Boolean
IL_0212: stelem.ref
IL_0213: dup
IL_0214: ldc.i4.2
IL_0215: ldloc.2
IL_0216: brtrue.s IL_0220
IL_0218: ldarg.0
IL_0219: ldfld System.Int32 LongshipUpgrades.LongshipPartController::m_enableEffects
IL_021e: br.s IL_0226
IL_0220: ldarg.0
IL_0221: ldfld System.Int32 LongshipUpgrades.LongshipPartController::m_disableEffects
IL_0226: box System.Int32
IL_022b: stelem.ref
IL_022c: dup
IL_022d: ldc.i4.3
IL_022e: ldarg.0
IL_022f: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0234: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0239: stloc.s V_16
IL_023b: ldloca.s V_16
IL_023d: constrained. UnityEngine.Vector3
IL_0243: callvirt System.String System.Object::ToString()
IL_0248: stelem.ref
IL_0249: callvirt System.Void ZNetView::InvokeRPC(System.String,System.Object[])
IL_024e: nop
IL_024f: ldc.i4.1
IL_0250: stloc.s V_4
IL_0252: br.s IL_0254
IL_0254: ldloc.s V_4
IL_0256: ret

// System.Boolean LongshipUpgrades.LongshipPartController::UseItem(Humanoid,ItemDrop/ItemData)
.locals System.Boolean
IL_0000: nop
IL_0001: ldc.i4.0
IL_0002: stloc.0
IL_0003: br.s IL_0005
IL_0005: ldloc.0
IL_0006: ret

// System.Boolean LongshipUpgrades.LongshipPartController::InUseDistance(Humanoid)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.Single LongshipUpgrades.LongshipPartController::m_useDistance
IL_0007: ldc.r4 0
IL_000c: beq.s IL_0033
IL_000e: ldarg.1
IL_000f: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0014: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0019: ldarg.0
IL_001a: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_001f: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0024: call System.Single UnityEngine.Vector3::Distance(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0029: ldarg.0
IL_002a: ldfld System.Single LongshipUpgrades.LongshipPartController::m_useDistance
IL_002f: clt
IL_0031: br.s IL_0034
IL_0033: ldc.i4.1
IL_0034: stloc.0
IL_0035: br.s IL_0037
IL_0037: ldloc.0
IL_0038: ret

// System.Void LongshipUpgrades.LongshipPartController::AddUpgradeRequirement(System.Int32,System.String,Piece/Requirement[],System.String,System.Int32,System.Int32)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: ldc.i4.0
IL_0003: cgt.un
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: brfalse.s IL_002d
IL_0009: ldarg.0
IL_000a: ldarg.0
IL_000b: ldfld LongshipUpgrades.LongshipPartController/UpgradeRequirements[] LongshipUpgrades.LongshipPartController::m_upgradeRequirements
IL_0010: ldarg.1
IL_0011: ldarg.2
IL_0012: ldarg.3
IL_0013: ldarg.s station
IL_0015: ldarg.s level
IL_0017: ldarg.s range
IL_0019: newobj System.Void LongshipUpgrades.LongshipPartController/UpgradeRequirements::.ctor(System.Int32,System.String,Piece/Requirement[],System.String,System.Int32,System.Int32)
IL_001e: call System.Collections.Generic.IEnumerable`1<!!0> HarmonyLib.CollectionExtensions::AddItem<LongshipUpgrades.LongshipPartController/UpgradeRequirements>(System.Collections.Generic.IEnumerable`1<!!0>,!!0)
IL_0023: call !!0[] System.Linq.Enumerable::ToArray<LongshipUpgrades.LongshipPartController/UpgradeRequirements>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0028: stfld LongshipUpgrades.LongshipPartController/UpgradeRequirements[] LongshipUpgrades.LongshipPartController::m_upgradeRequirements
IL_002d: ret

// System.Void LongshipUpgrades.LongshipPartController::AddSpentUpgrades(System.Collections.Generic.Dictionary`2<System.Int32,Piece/Requirement[]>)
.locals ZDO, LongshipUpgrades.LongshipPartController/UpgradeRequirements[], System.Int32, LongshipUpgrades.LongshipPartController/UpgradeRequirements
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.LongshipPartController::m_nview
IL_0007: callvirt ZDO ZNetView::GetZDO()
IL_000c: stloc.0
IL_000d: nop
IL_000e: ldarg.0
IL_000f: ldfld LongshipUpgrades.LongshipPartController/UpgradeRequirements[] LongshipUpgrades.LongshipPartController::m_upgradeRequirements
IL_0014: stloc.1
IL_0015: ldc.i4.0
IL_0016: stloc.2
IL_0017: br.s IL_002a
IL_0019: ldloc.1
IL_001a: ldloc.2
IL_001b: ldelem.ref
IL_001c: stloc.3
IL_001d: ldloc.3
IL_001e: ldloc.0
IL_001f: ldarg.1
IL_0020: callvirt System.Void LongshipUpgrades.LongshipPartController/UpgradeRequirements::AddSpentUpgrades(ZDO,System.Collections.Generic.Dictionary`2<System.Int32,Piece/Requirement[]>)
IL_0025: nop
IL_0026: ldloc.2
IL_0027: ldc.i4.1
IL_0028: add
IL_0029: stloc.2
IL_002a: ldloc.2
IL_002b: ldloc.1
IL_002c: ldlen
IL_002d: conv.i4
IL_002e: blt.s IL_0019
IL_0030: ret

// System.Boolean LongshipUpgrades.LongshipPartController::IsPositionToInteract()
.locals System.Boolean
IL_0000: nop
IL_0001: call Ship Ship::GetLocalShip()
IL_0006: ldarg.0
IL_0007: ldfld Ship LongshipUpgrades.LongshipPartController::m_ship
IL_000c: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0011: brfalse IL_00a7
IL_0016: ldarg.0
IL_0017: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_001c: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0021: ldsfld Player Player::m_localPlayer
IL_0026: callvirt UnityEngine.Vector3 Character::GetEyePoint()
IL_002b: call UnityEngine.Vector3 UnityEngine.Vector3::op_Subtraction(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0030: ldarg.0
IL_0031: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0036: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_003b: call UnityEngine.Camera Utils::GetMainCamera()
IL_0040: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0045: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_004a: call UnityEngine.Vector3 UnityEngine.Vector3::op_Subtraction(UnityEngine.Vector3,UnityEngine.Vector3)
IL_004f: call System.Single UnityEngine.Vector3::Dot(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0054: ldc.r4 0
IL_0059: ble.un.s IL_00a7
IL_005b: ldarg.0
IL_005c: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0061: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0066: ldsfld Player Player::m_localPlayer
IL_006b: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0070: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0075: call UnityEngine.Vector3 UnityEngine.Vector3::op_Subtraction(UnityEngine.Vector3,UnityEngine.Vector3)
IL_007a: ldarg.0
IL_007b: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0080: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0085: call UnityEngine.Camera Utils::GetMainCamera()
IL_008a: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_008f: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0094: call UnityEngine.Vector3 UnityEngine.Vector3::op_Subtraction(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0099: call System.Single UnityEngine.Vector3::Dot(UnityEngine.Vector3,UnityEngine.Vector3)
IL_009e: ldc.r4 0
IL_00a3: cgt
IL_00a5: br.s IL_00a8
IL_00a7: ldc.i4.0
IL_00a8: stloc.0
IL_00a9: br.s IL_00ab
IL_00ab: ldloc.0
IL_00ac: ret

// System.Void LongshipUpgrades.LongshipPartController::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: ldstr "Part"
IL_0006: stfld System.String LongshipUpgrades.LongshipPartController::m_name
IL_000b: ldarg.0
IL_000c: ldc.i4.1
IL_000d: stfld System.Boolean LongshipUpgrades.LongshipPartController::m_checkGuardStone
IL_0012: ldarg.0
IL_0013: ldc.r4 0
IL_0018: stfld System.Single LongshipUpgrades.LongshipPartController::m_useDistance
IL_001d: ldarg.0
IL_001e: ldstr "$lu_controller_message_enable"
IL_0023: stfld System.String LongshipUpgrades.LongshipPartController::m_messageEnable
IL_0028: ldarg.0
IL_0029: ldstr "$lu_controller_message_switch"
IL_002e: stfld System.String LongshipUpgrades.LongshipPartController::m_messageSwitch
IL_0033: ldarg.0
IL_0034: ldstr "$lu_controller_message_disable"
IL_0039: stfld System.String LongshipUpgrades.LongshipPartController::m_messageDisable
IL_003e: ldarg.0
IL_003f: ldc.i4.0
IL_0040: newarr LongshipUpgrades.LongshipPartController/UpgradeRequirements
IL_0045: stfld LongshipUpgrades.LongshipPartController/UpgradeRequirements[] LongshipUpgrades.LongshipPartController::m_upgradeRequirements
IL_004a: ldarg.0
IL_004b: ldc.i4.m1
IL_004c: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_switchEffects
IL_0051: ldarg.0
IL_0052: ldc.i4.m1
IL_0053: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_enableEffects
IL_0058: ldarg.0
IL_0059: ldc.i4.m1
IL_005a: stfld System.Int32 LongshipUpgrades.LongshipPartController::m_disableEffects
IL_005f: ldarg.0
IL_0060: call System.Void UnityEngine.MonoBehaviour::.ctor()
IL_0065: nop
IL_0066: ret

// System.Void LongshipUpgrades.LongshipPartController::.cctor()
.locals 
IL_0000: ldc.i4.s 20
IL_0002: newobj System.Void System.Text.StringBuilder::.ctor(System.Int32)
IL_0007: stsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_000c: newobj System.Void System.Collections.Generic.List`1<CraftingStation>::.ctor()
IL_0011: stsfld System.Collections.Generic.List`1<CraftingStation> LongshipUpgrades.LongshipPartController::craftingStations
IL_0016: ret

// System.Void LongshipUpgrades.LongshipPartController/UpgradeRequirements::.ctor(System.Int32,System.String,Piece/Requirement[],System.String,System.Int32,System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.0
IL_0002: newarr Piece/Requirement
IL_0007: stfld Piece/Requirement[] LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_requirements
IL_000c: ldarg.0
IL_000d: ldstr ""
IL_0012: stfld System.String LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_messageUpgrade
IL_0017: ldarg.0
IL_0018: call System.Void System.Object::.ctor()
IL_001d: nop
IL_001e: nop
IL_001f: ldarg.0
IL_0020: ldarg.1
IL_0021: stfld System.Int32 LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_zdoVar
IL_0026: ldarg.0
IL_0027: ldarg.3
IL_0028: stfld Piece/Requirement[] LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_requirements
IL_002d: ldarg.0
IL_002e: ldarg.2
IL_002f: stfld System.String LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_messageUpgrade
IL_0034: ldarg.0
IL_0035: ldarg.s station
IL_0037: call System.String LongshipUpgrades.ItemNameTokens::GetCraftingStationName(System.String)
IL_003c: stfld System.String LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationName
IL_0041: ldarg.0
IL_0042: ldarg.s level
IL_0044: stfld System.Int32 LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationLevel
IL_0049: ldarg.0
IL_004a: ldarg.s range
IL_004c: stfld System.Int32 LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationRange
IL_0051: ret

// System.Boolean LongshipUpgrades.LongshipPartController/UpgradeRequirements::FillUpgradeHover(ZDO,System.String)
.locals System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.Int32 LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_zdoVar
IL_0007: brfalse.s IL_0018
IL_0009: ldarg.1
IL_000a: ldarg.0
IL_000b: ldfld System.Int32 LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_zdoVar
IL_0010: ldc.i4.0
IL_0011: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_0016: br.s IL_0019
IL_0018: ldc.i4.1
IL_0019: stloc.1
IL_001a: ldloc.1
IL_001b: brfalse.s IL_0024
IL_001d: ldc.i4.0
IL_001e: stloc.2
IL_001f: br IL_00ed
IL_0024: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_0029: callvirt System.Text.StringBuilder System.Text.StringBuilder::Clear()
IL_002e: pop
IL_002f: ldsfld Player Player::m_localPlayer
IL_0034: callvirt System.Boolean Player::NoCostCheat()
IL_0039: brtrue.s IL_0063
IL_003b: ldarg.0
IL_003c: ldfld System.String LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationName
IL_0041: call System.Boolean System.String::IsNullOrWhiteSpace(System.String)
IL_0046: brtrue.s IL_0063
IL_0048: ldsfld Player Player::m_localPlayer
IL_004d: ldarg.0
IL_004e: ldfld System.String LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationName
IL_0053: ldarg.0
IL_0054: ldfld System.Int32 LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationLevel
IL_0059: callvirt System.Boolean Player::KnowStationLevel(System.String,System.Int32)
IL_005e: ldc.i4.0
IL_005f: ceq
IL_0061: br.s IL_0064
IL_0063: ldc.i4.0
IL_0064: stloc.3
IL_0065: ldloc.3
IL_0066: brfalse.s IL_0079
IL_0068: nop
IL_0069: ldarg.0
IL_006a: ldstr "$lu_controller_message_unknownupgrade"
IL_006f: call System.Void LongshipUpgrades.LongshipPartController/UpgradeRequirements::AddUpgradeHintToHover(System.String)
IL_0074: nop
IL_0075: ldc.i4.1
IL_0076: stloc.2
IL_0077: br.s IL_00ed
IL_0079: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_007e: ldarg.2
IL_007f: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0084: pop
IL_0085: ldarg.0
IL_0086: ldloca.s V_0
IL_0088: call System.Boolean LongshipUpgrades.LongshipPartController/UpgradeRequirements::HaveCraftinStationInRange(System.Boolean&)
IL_008d: stloc.s V_4
IL_008f: ldloc.s V_4
IL_0091: brfalse.s IL_00c3
IL_0093: nop
IL_0094: ldloc.0
IL_0095: stloc.s V_5
IL_0097: ldloc.s V_5
IL_0099: brfalse.s IL_00ab
IL_009b: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_00a0: ldstr "
[<color=yellow><b>$KEY_Use</b></color>] $inventory_upgradebutton"
IL_00a5: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_00aa: pop
IL_00ab: ldarg.0
IL_00ac: ldarg.0
IL_00ad: ldfld System.String LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_messageUpgrade
IL_00b2: call System.Void LongshipUpgrades.LongshipPartController/UpgradeRequirements::AddUpgradeHintToHover(System.String)
IL_00b7: nop
IL_00b8: ldarg.0
IL_00b9: ldloc.0
IL_00ba: call System.Void LongshipUpgrades.LongshipPartController/UpgradeRequirements::AddUpgradeRequirementsToHint(System.Boolean)
IL_00bf: nop
IL_00c0: nop
IL_00c1: br.s IL_00e9
IL_00c3: nop
IL_00c4: ldarg.0
IL_00c5: ldarg.0
IL_00c6: ldfld System.String LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_messageUpgrade
IL_00cb: call System.Void LongshipUpgrades.LongshipPartController/UpgradeRequirements::AddUpgradeHintToHover(System.String)
IL_00d0: nop
IL_00d1: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_00d6: ldstr "

$msg_missingrequirement:"
IL_00db: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_00e0: pop
IL_00e1: ldarg.0
IL_00e2: call System.Void LongshipUpgrades.LongshipPartController/UpgradeRequirements::AddRequiredStationToHover()
IL_00e7: nop
IL_00e8: nop
IL_00e9: ldc.i4.1
IL_00ea: stloc.2
IL_00eb: br.s IL_00ed
IL_00ed: ldloc.2
IL_00ee: ret

// System.Boolean LongshipUpgrades.LongshipPartController/UpgradeRequirements::CheckConsume(ZNetView,Player,UnityEngine.Vector3,System.Boolean&)
.locals PlayerProfile, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.s result
IL_0003: ldc.i4.0
IL_0004: stind.i1
IL_0005: ldarg.0
IL_0006: ldfld System.Int32 LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_zdoVar
IL_000b: brfalse.s IL_0021
IL_000d: ldarg.1
IL_000e: callvirt ZDO ZNetView::GetZDO()
IL_0013: ldarg.0
IL_0014: ldfld System.Int32 LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_zdoVar
IL_0019: ldc.i4.0
IL_001a: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_001f: br.s IL_0022
IL_0021: ldc.i4.1
IL_0022: stloc.1
IL_0023: ldloc.1
IL_0024: brfalse.s IL_002d
IL_0026: ldc.i4.0
IL_0027: stloc.2
IL_0028: br IL_00b9
IL_002d: ldarg.0
IL_002e: ldarg.2
IL_002f: call System.Boolean LongshipUpgrades.LongshipPartController/UpgradeRequirements::RemoveRequiredItems(Player)
IL_0034: ldc.i4.0
IL_0035: ceq
IL_0037: stloc.3
IL_0038: ldloc.3
IL_0039: brfalse.s IL_0050
IL_003b: nop
IL_003c: ldarg.2
IL_003d: ldc.i4.2
IL_003e: ldstr "$msg_missingrequirement"
IL_0043: ldc.i4.0
IL_0044: ldnull
IL_0045: ldc.i4.0
IL_0046: callvirt System.Void Character::Message(MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_004b: nop
IL_004c: ldc.i4.1
IL_004d: stloc.2
IL_004e: br.s IL_00b9
IL_0050: ldarg.1
IL_0051: ldstr "SetBuilt"
IL_0056: ldc.i4.3
IL_0057: newarr System.Object
IL_005c: dup
IL_005d: ldc.i4.0
IL_005e: ldarg.0
IL_005f: ldfld System.Int32 LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_zdoVar
IL_0064: box System.Int32
IL_0069: stelem.ref
IL_006a: dup
IL_006b: ldc.i4.1
IL_006c: ldarg.0
IL_006d: ldfld System.String LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationName
IL_0072: stelem.ref
IL_0073: dup
IL_0074: ldc.i4.2
IL_0075: ldarga.s position
IL_0077: constrained. UnityEngine.Vector3
IL_007d: callvirt System.String System.Object::ToString()
IL_0082: stelem.ref
IL_0083: callvirt System.Void ZNetView::InvokeRPC(System.String,System.Object[])
IL_0088: nop
IL_0089: call Game Game::get_instance()
IL_008e: callvirt PlayerProfile Game::GetPlayerProfile()
IL_0093: stloc.0
IL_0094: ldloc.0
IL_0095: ldc.i4.1
IL_0096: ldc.r4 1
IL_009b: ldc.i4.0
IL_009c: callvirt System.Void PlayerProfile::IncrementStat(PlayerStatType,System.Single,System.Boolean)
IL_00a1: nop
IL_00a2: ldloc.0
IL_00a3: ldc.i4.s 14
IL_00a5: ldc.r4 1
IL_00aa: ldc.i4.0
IL_00ab: callvirt System.Void PlayerProfile::IncrementStat(PlayerStatType,System.Single,System.Boolean)
IL_00b0: nop
IL_00b1: ldarg.s result
IL_00b3: ldc.i4.1
IL_00b4: stind.i1
IL_00b5: ldc.i4.1
IL_00b6: stloc.2
IL_00b7: br.s IL_00b9
IL_00b9: ldloc.2
IL_00ba: ret

// System.Void LongshipUpgrades.LongshipPartController/UpgradeRequirements::AddSpentUpgrades(ZDO,System.Collections.Generic.Dictionary`2<System.Int32,Piece/Requirement[]>)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.Int32 LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_zdoVar
IL_0007: brfalse.s IL_0024
IL_0009: ldarg.1
IL_000a: ldarg.0
IL_000b: ldfld System.Int32 LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_zdoVar
IL_0010: ldc.i4.0
IL_0011: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_0016: brfalse.s IL_0024
IL_0018: ldarg.0
IL_0019: ldfld Piece/Requirement[] LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_requirements
IL_001e: ldlen
IL_001f: ldc.i4.0
IL_0020: cgt.un
IL_0022: br.s IL_0025
IL_0024: ldc.i4.0
IL_0025: stloc.0
IL_0026: ldloc.0
IL_0027: brfalse.s IL_003c
IL_0029: ldarg.2
IL_002a: ldarg.0
IL_002b: ldfld System.Int32 LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_zdoVar
IL_0030: ldarg.0
IL_0031: ldfld Piece/Requirement[] LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_requirements
IL_0036: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Int32,Piece/Requirement[]>::set_Item(!0,!1)
IL_003b: nop
IL_003c: ret

// System.Void LongshipUpgrades.LongshipPartController/UpgradeRequirements::AddUpgradeRequirementsToHint(System.Boolean)
.locals System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld Piece/Requirement[] LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_requirements
IL_0007: brfalse.s IL_001f
IL_0009: ldarg.0
IL_000a: ldfld Piece/Requirement[] LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_requirements
IL_000f: ldlen
IL_0010: brfalse.s IL_001f
IL_0012: ldarg.0
IL_0013: ldfld System.String LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationName
IL_0018: call System.Boolean System.String::IsNullOrWhiteSpace(System.String)
IL_001d: br.s IL_0020
IL_001f: ldc.i4.1
IL_0020: stloc.0
IL_0021: ldloc.0
IL_0022: brfalse.s IL_0029
IL_0024: br IL_010c
IL_0029: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_002e: ldstr "
"
IL_0033: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0038: pop
IL_0039: call ZoneSystem ZoneSystem::get_instance()
IL_003e: ldc.i4.s 24
IL_0040: callvirt System.Boolean ZoneSystem::GetGlobalKey(GlobalKeys)
IL_0045: stloc.1
IL_0046: ldloc.1
IL_0047: brfalse.s IL_0068
IL_0049: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_004e: ldstr "
<color=#{0}>$menu_nobuildcost</color>"
IL_0053: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> LongshipUpgrades.LongshipUpgrades::hintStationColor
IL_0058: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_005d: call System.String UnityEngine.ColorUtility::ToHtmlStringRGBA(UnityEngine.Color)
IL_0062: callvirt System.Text.StringBuilder System.Text.StringBuilder::AppendFormat(System.String,System.Object)
IL_0067: pop
IL_0068: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_006d: ldstr "
$hud_require"
IL_0072: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0077: pop
IL_0078: ldarg.1
IL_0079: stloc.2
IL_007a: ldloc.2
IL_007b: brfalse.s IL_009a
IL_007d: ldarg.0
IL_007e: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> LongshipUpgrades.LongshipUpgrades::hintStationColor
IL_0083: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_0088: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> LongshipUpgrades.LongshipUpgrades::hintStationColor
IL_008d: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_0092: call System.Void LongshipUpgrades.LongshipPartController/UpgradeRequirements::AddRequiredStationToHover(UnityEngine.Color,UnityEngine.Color)
IL_0097: nop
IL_0098: br.s IL_00de
IL_009a: call System.Single UnityEngine.Time::get_time()
IL_009f: ldc.r4 10
IL_00a4: mul
IL_00a5: call System.Single UnityEngine.Mathf::Sin(System.Single)
IL_00aa: ldc.r4 0
IL_00af: cgt
IL_00b1: stloc.3
IL_00b2: ldloc.3
IL_00b3: brfalse.s IL_00cd
IL_00b5: ldarg.0
IL_00b6: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> LongshipUpgrades.LongshipUpgrades::hintStationColor
IL_00bb: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_00c0: call UnityEngine.Color UnityEngine.Color::get_red()
IL_00c5: call System.Void LongshipUpgrades.LongshipPartController/UpgradeRequirements::AddRequiredStationToHover(UnityEngine.Color,UnityEngine.Color)
IL_00ca: nop
IL_00cb: br.s IL_00de
IL_00cd: ldarg.0
IL_00ce: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> LongshipUpgrades.LongshipUpgrades::hintStationColor
IL_00d3: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_00d8: call System.Void LongshipUpgrades.LongshipPartController/UpgradeRequirements::AddRequiredStationToHover(UnityEngine.Color)
IL_00dd: nop
IL_00de: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_00e3: ldstr ":"
IL_00e8: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_00ed: pop
IL_00ee: ldarg.0
IL_00ef: ldfld Piece/Requirement[] LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_requirements
IL_00f4: dup
IL_00f5: brtrue.s IL_00fa
IL_00f7: pop
IL_00f8: br.s IL_010c
IL_00fa: ldarg.0
IL_00fb: ldftn System.Void LongshipUpgrades.LongshipPartController/UpgradeRequirements::<AddUpgradeRequirementsToHint>b__10_0(Piece/Requirement)
IL_0101: newobj System.Void System.Action`1<Piece/Requirement>::.ctor(System.Object,System.IntPtr)
IL_0106: call System.Void HarmonyLib.CollectionExtensions::Do<Piece/Requirement>(System.Collections.Generic.IEnumerable`1<!!0>,System.Action`1<!!0>)
IL_010b: nop
IL_010c: ret

// System.Void LongshipUpgrades.LongshipPartController/UpgradeRequirements::AddRequiredStationToHover()
.locals System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.String LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationName
IL_0007: call System.Boolean System.String::IsNullOrWhiteSpace(System.String)
IL_000c: stloc.0
IL_000d: ldloc.0
IL_000e: brfalse.s IL_0012
IL_0010: br.s IL_0050
IL_0012: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_0017: ldstr " {0}"
IL_001c: ldarg.0
IL_001d: ldfld System.String LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationName
IL_0022: callvirt System.Text.StringBuilder System.Text.StringBuilder::AppendFormat(System.String,System.Object)
IL_0027: pop
IL_0028: ldarg.0
IL_0029: ldfld System.Int32 LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationLevel
IL_002e: ldc.i4.1
IL_002f: cgt
IL_0031: stloc.1
IL_0032: ldloc.1
IL_0033: brfalse.s IL_0050
IL_0035: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_003a: ldstr " $msg_level {0}"
IL_003f: ldarg.0
IL_0040: ldfld System.Int32 LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationLevel
IL_0045: box System.Int32
IL_004a: callvirt System.Text.StringBuilder System.Text.StringBuilder::AppendFormat(System.String,System.Object)
IL_004f: pop
IL_0050: ret

// System.Void LongshipUpgrades.LongshipPartController/UpgradeRequirements::AddRequiredStationToHover(UnityEngine.Color,UnityEngine.Color)
.locals System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.String LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationName
IL_0007: call System.Boolean System.String::IsNullOrWhiteSpace(System.String)
IL_000c: stloc.0
IL_000d: ldloc.0
IL_000e: brfalse.s IL_0012
IL_0010: br.s IL_005c
IL_0012: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_0017: ldstr " <color=#{0}>{1}</color>"
IL_001c: ldarg.1
IL_001d: call System.String UnityEngine.ColorUtility::ToHtmlStringRGBA(UnityEngine.Color)
IL_0022: ldarg.0
IL_0023: ldfld System.String LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationName
IL_0028: callvirt System.Text.StringBuilder System.Text.StringBuilder::AppendFormat(System.String,System.Object,System.Object)
IL_002d: pop
IL_002e: ldarg.0
IL_002f: ldfld System.Int32 LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationLevel
IL_0034: ldc.i4.1
IL_0035: cgt
IL_0037: stloc.1
IL_0038: ldloc.1
IL_0039: brfalse.s IL_005c
IL_003b: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_0040: ldstr " $msg_level <color=#{0}>{1}</color>"
IL_0045: ldarg.2
IL_0046: call System.String UnityEngine.ColorUtility::ToHtmlStringRGBA(UnityEngine.Color)
IL_004b: ldarg.0
IL_004c: ldfld System.Int32 LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationLevel
IL_0051: box System.Int32
IL_0056: callvirt System.Text.StringBuilder System.Text.StringBuilder::AppendFormat(System.String,System.Object,System.Object)
IL_005b: pop
IL_005c: ret

// System.Void LongshipUpgrades.LongshipPartController/UpgradeRequirements::AddRequiredStationToHover(UnityEngine.Color)
.locals System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.String LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationName
IL_0007: call System.Boolean System.String::IsNullOrWhiteSpace(System.String)
IL_000c: stloc.0
IL_000d: ldloc.0
IL_000e: brfalse.s IL_0012
IL_0010: br.s IL_0056
IL_0012: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_0017: ldstr " <color=#{0}>{1}</color>"
IL_001c: ldarg.1
IL_001d: call System.String UnityEngine.ColorUtility::ToHtmlStringRGBA(UnityEngine.Color)
IL_0022: ldarg.0
IL_0023: ldfld System.String LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationName
IL_0028: callvirt System.Text.StringBuilder System.Text.StringBuilder::AppendFormat(System.String,System.Object,System.Object)
IL_002d: pop
IL_002e: ldarg.0
IL_002f: ldfld System.Int32 LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationLevel
IL_0034: ldc.i4.1
IL_0035: cgt
IL_0037: stloc.1
IL_0038: ldloc.1
IL_0039: brfalse.s IL_0056
IL_003b: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_0040: ldstr " $msg_level {0}"
IL_0045: ldarg.0
IL_0046: ldfld System.Int32 LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationLevel
IL_004b: box System.Int32
IL_0050: callvirt System.Text.StringBuilder System.Text.StringBuilder::AppendFormat(System.String,System.Object)
IL_0055: pop
IL_0056: ret

// System.Void LongshipUpgrades.LongshipPartController/UpgradeRequirements::AddUpgradeHintToHover(System.String)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: call System.Boolean System.String::IsNullOrWhiteSpace(System.String)
IL_0007: ldc.i4.0
IL_0008: ceq
IL_000a: stloc.0
IL_000b: ldloc.0
IL_000c: brfalse.s IL_002e
IL_000e: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_0013: ldstr "
<color=#{0}>{1}</color>"
IL_0018: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> LongshipUpgrades.LongshipUpgrades::hintColor
IL_001d: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_0022: call System.String UnityEngine.ColorUtility::ToHtmlStringRGBA(UnityEngine.Color)
IL_0027: ldarg.1
IL_0028: callvirt System.Text.StringBuilder System.Text.StringBuilder::AppendFormat(System.String,System.Object,System.Object)
IL_002d: pop
IL_002e: ret

// System.Boolean LongshipUpgrades.LongshipPartController/UpgradeRequirements::HaveCraftinStationInRange(System.Boolean&)
.locals System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: ldc.i4.1
IL_0003: stind.i1
IL_0004: ldarg.0
IL_0005: ldfld System.String LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationName
IL_000a: call System.Boolean System.String::IsNullOrWhiteSpace(System.String)
IL_000f: brtrue.s IL_001d
IL_0011: ldsfld Player Player::m_localPlayer
IL_0016: callvirt System.Boolean Player::NoCostCheat()
IL_001b: br.s IL_001e
IL_001d: ldc.i4.1
IL_001e: stloc.0
IL_001f: ldloc.0
IL_0020: brfalse.s IL_0026
IL_0022: ldc.i4.1
IL_0023: stloc.1
IL_0024: br.s IL_008c
IL_0026: ldarg.1
IL_0027: ldc.i4.0
IL_0028: stind.i1
IL_0029: ldsfld System.Collections.Generic.List`1<CraftingStation> LongshipUpgrades.LongshipPartController::craftingStations
IL_002e: callvirt System.Void System.Collections.Generic.List`1<CraftingStation>::Clear()
IL_0033: nop
IL_0034: ldarg.0
IL_0035: ldfld System.String LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationName
IL_003a: ldsfld Player Player::m_localPlayer
IL_003f: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0044: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0049: ldarg.0
IL_004a: ldfld System.Int32 LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationRange
IL_004f: conv.r4
IL_0050: ldsfld System.Collections.Generic.List`1<CraftingStation> LongshipUpgrades.LongshipPartController::craftingStations
IL_0055: call System.Void CraftingStation::FindStationsInRange(System.String,UnityEngine.Vector3,System.Single,System.Collections.Generic.List`1<CraftingStation>)
IL_005a: nop
IL_005b: ldsfld System.Collections.Generic.List`1<CraftingStation> LongshipUpgrades.LongshipPartController::craftingStations
IL_0060: callvirt System.Int32 System.Collections.Generic.List`1<CraftingStation>::get_Count()
IL_0065: ldc.i4.0
IL_0066: ceq
IL_0068: stloc.2
IL_0069: ldloc.2
IL_006a: brfalse.s IL_0070
IL_006c: ldc.i4.0
IL_006d: stloc.1
IL_006e: br.s IL_008c
IL_0070: ldarg.1
IL_0071: ldsfld System.Collections.Generic.List`1<CraftingStation> LongshipUpgrades.LongshipPartController::craftingStations
IL_0076: ldarg.0
IL_0077: ldftn System.Boolean LongshipUpgrades.LongshipPartController/UpgradeRequirements::<HaveCraftinStationInRange>b__15_0(CraftingStation)
IL_007d: newobj System.Void System.Func`2<CraftingStation,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0082: call System.Boolean System.Linq.Enumerable::Any<CraftingStation>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0087: stind.i1
IL_0088: ldc.i4.1
IL_0089: stloc.1
IL_008a: br.s IL_008c
IL_008c: ldloc.1
IL_008d: ret

// System.Void LongshipUpgrades.LongshipPartController/UpgradeRequirements::AddItemRequirementToHover(Piece/Requirement)
.locals System.String, System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: ldfld ItemDrop Piece/Requirement::m_resItem
IL_0007: ldnull
IL_0008: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_000d: stloc.1
IL_000e: ldloc.1
IL_000f: brfalse.s IL_0016
IL_0011: br IL_0099
IL_0016: ldarg.1
IL_0017: ldfld ItemDrop Piece/Requirement::m_resItem
IL_001c: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0021: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0026: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_002b: stloc.0
IL_002c: ldsfld System.Text.StringBuilder LongshipUpgrades.LongshipPartController::sb
IL_0031: ldstr "
<color=#{0}>{1}</color> <color=#{2}>{3}</color>"
IL_0036: ldc.i4.4
IL_0037: newarr System.Object
IL_003c: dup
IL_003d: ldc.i4.0
IL_003e: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> LongshipUpgrades.LongshipUpgrades::hintAmountColor
IL_0043: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_0048: call System.String UnityEngine.ColorUtility::ToHtmlStringRGBA(UnityEngine.Color)
IL_004d: stelem.ref
IL_004e: dup
IL_004f: ldc.i4.1
IL_0050: ldarg.1
IL_0051: ldc.i4.1
IL_0052: callvirt System.Int32 Piece/Requirement::GetAmount(System.Int32)
IL_0057: box System.Int32
IL_005c: stelem.ref
IL_005d: dup
IL_005e: ldc.i4.2
IL_005f: ldsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> LongshipUpgrades.LongshipUpgrades::hintItemColor
IL_0064: callvirt !0 BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color>::get_Value()
IL_0069: call System.String UnityEngine.ColorUtility::ToHtmlStringRGBA(UnityEngine.Color)
IL_006e: stelem.ref
IL_006f: dup
IL_0070: ldc.i4.3
IL_0071: ldsfld Player Player::m_localPlayer
IL_0076: callvirt System.Boolean Player::NoCostCheat()
IL_007b: brtrue.s IL_0091
IL_007d: ldsfld Player Player::m_localPlayer
IL_0082: ldloc.0
IL_0083: callvirt System.Boolean Player::IsMaterialKnown(System.String)
IL_0088: brtrue.s IL_0091
IL_008a: ldstr "$lu_controller_message_unknownitem"
IL_008f: br.s IL_0092
IL_0091: ldloc.0
IL_0092: stelem.ref
IL_0093: callvirt System.Text.StringBuilder System.Text.StringBuilder::AppendFormat(System.String,System.Object[])
IL_0098: pop
IL_0099: ret

// System.Boolean LongshipUpgrades.LongshipPartController/UpgradeRequirements::RemoveRequiredItems(Player)
.locals System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: callvirt System.Boolean Player::NoCostCheat()
IL_0007: stloc.1
IL_0008: ldloc.1
IL_0009: brfalse.s IL_0012
IL_000b: ldc.i4.1
IL_000c: stloc.2
IL_000d: br IL_00cf
IL_0012: ldarg.0
IL_0013: ldfld System.String LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationName
IL_0018: call System.Boolean System.String::IsNullOrWhiteSpace(System.String)
IL_001d: brtrue.s IL_003f
IL_001f: ldarg.0
IL_0020: ldfld System.Int32 LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationLevel
IL_0025: ldc.i4.0
IL_0026: ble.s IL_003f
IL_0028: ldarg.1
IL_0029: ldarg.0
IL_002a: ldfld System.String LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationName
IL_002f: ldarg.0
IL_0030: ldfld System.Int32 LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationLevel
IL_0035: callvirt System.Boolean Player::KnowStationLevel(System.String,System.Int32)
IL_003a: ldc.i4.0
IL_003b: ceq
IL_003d: br.s IL_0040
IL_003f: ldc.i4.0
IL_0040: stloc.3
IL_0041: ldloc.3
IL_0042: brfalse.s IL_004b
IL_0044: ldc.i4.0
IL_0045: stloc.2
IL_0046: br IL_00cf
IL_004b: ldarg.0
IL_004c: ldloca.s V_0
IL_004e: call System.Boolean LongshipUpgrades.LongshipPartController/UpgradeRequirements::HaveCraftinStationInRange(System.Boolean&)
IL_0053: brfalse.s IL_005b
IL_0055: ldloc.0
IL_0056: ldc.i4.0
IL_0057: ceq
IL_0059: br.s IL_005c
IL_005b: ldc.i4.1
IL_005c: stloc.s V_4
IL_005e: ldloc.s V_4
IL_0060: brfalse.s IL_0066
IL_0062: ldc.i4.0
IL_0063: stloc.2
IL_0064: br.s IL_00cf
IL_0066: call ZoneSystem ZoneSystem::get_instance()
IL_006b: ldc.i4.s 24
IL_006d: callvirt System.Boolean ZoneSystem::GetGlobalKey(GlobalKeys)
IL_0072: stloc.s V_5
IL_0074: ldloc.s V_5
IL_0076: brfalse.s IL_007c
IL_0078: ldc.i4.1
IL_0079: stloc.2
IL_007a: br.s IL_00cf
IL_007c: ldarg.0
IL_007d: ldfld Piece/Requirement[] LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_requirements
IL_0082: ldlen
IL_0083: ldc.i4.0
IL_0084: ceq
IL_0086: stloc.s V_6
IL_0088: ldloc.s V_6
IL_008a: brfalse.s IL_0090
IL_008c: ldc.i4.1
IL_008d: stloc.2
IL_008e: br.s IL_00cf
IL_0090: ldsfld Recipe LongshipUpgrades.LongshipPartController::tempRecipe
IL_0095: ldarg.0
IL_0096: ldfld Piece/Requirement[] LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_requirements
IL_009b: stfld Piece/Requirement[] Recipe::m_resources
IL_00a0: ldarg.1
IL_00a1: ldsfld Recipe LongshipUpgrades.LongshipPartController::tempRecipe
IL_00a6: ldc.i4.0
IL_00a7: ldc.i4.1
IL_00a8: ldc.i4.1
IL_00a9: callvirt System.Boolean Player::HaveRequirementItems(Recipe,System.Boolean,System.Int32,System.Int32)
IL_00ae: ldc.i4.0
IL_00af: ceq
IL_00b1: stloc.s V_7
IL_00b3: ldloc.s V_7
IL_00b5: brfalse.s IL_00bb
IL_00b7: ldc.i4.0
IL_00b8: stloc.2
IL_00b9: br.s IL_00cf
IL_00bb: ldarg.1
IL_00bc: ldarg.0
IL_00bd: ldfld Piece/Requirement[] LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_requirements
IL_00c2: ldc.i4.1
IL_00c3: ldc.i4.m1
IL_00c4: ldc.i4.1
IL_00c5: callvirt System.Void Player::ConsumeResources(Piece/Requirement[],System.Int32,System.Int32,System.Int32)
IL_00ca: nop
IL_00cb: ldc.i4.1
IL_00cc: stloc.2
IL_00cd: br.s IL_00cf
IL_00cf: ldloc.2
IL_00d0: ret

// System.Void LongshipUpgrades.LongshipPartController/UpgradeRequirements::<AddUpgradeRequirementsToHint>b__10_0(Piece/Requirement)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: call System.Void LongshipUpgrades.LongshipPartController/UpgradeRequirements::AddItemRequirementToHover(Piece/Requirement)
IL_0007: nop
IL_0008: ret

// System.Boolean LongshipUpgrades.LongshipPartController/UpgradeRequirements::<HaveCraftinStationInRange>b__15_0(CraftingStation)
.locals 
IL_0000: ldarg.1
IL_0001: ldc.i4.1
IL_0002: callvirt System.Int32 CraftingStation::GetLevel(System.Boolean)
IL_0007: ldarg.0
IL_0008: ldfld System.Int32 LongshipUpgrades.LongshipPartController/UpgradeRequirements::m_stationLevel
IL_000d: clt
IL_000f: ldc.i4.0
IL_0010: ceq
IL_0012: ret

// System.Void LongshipUpgrades.LongshipPropertyBlocks::.cctor()
.locals 
IL_0000: ldstr "_StyleTex"
IL_0005: call System.Int32 UnityEngine.Shader::PropertyToID(System.String)
IL_000a: stsfld System.Int32 LongshipUpgrades.LongshipPropertyBlocks::_StyleTex
IL_000f: newobj System.Void System.Collections.Generic.Dictionary`2<MaterialMan/PropertyContainer,UnityEngine.GameObject>::.ctor()
IL_0014: stsfld System.Collections.Generic.Dictionary`2<MaterialMan/PropertyContainer,UnityEngine.GameObject> LongshipUpgrades.LongshipPropertyBlocks::s_objectProperties
IL_0019: ret

// System.Void LongshipUpgrades.LongshipPropertyBlocks/MaterialMan_RegisterRenderers_KeepPropertyBlocks::Postfix(MaterialMan,UnityEngine.GameObject)
.locals MaterialMan/PropertyContainer, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: call System.Boolean LongshipUpgrades.LongshipCustomizableParts::HasShipComponent(UnityEngine.GameObject)
IL_0007: ldc.i4.0
IL_0008: ceq
IL_000a: stloc.1
IL_000b: ldloc.1
IL_000c: brfalse.s IL_0010
IL_000e: br.s IL_0034
IL_0010: ldarg.0
IL_0011: ldfld System.Collections.Generic.Dictionary`2<System.Int32,MaterialMan/PropertyContainer> MaterialMan::m_blocks
IL_0016: ldarg.1
IL_0017: callvirt System.Int32 UnityEngine.Object::GetInstanceID()
IL_001c: ldloca.s V_0
IL_001e: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,MaterialMan/PropertyContainer>::TryGetValue(!0,!1&)
IL_0023: stloc.2
IL_0024: ldloc.2
IL_0025: brfalse.s IL_0034
IL_0027: ldsfld System.Collections.Generic.Dictionary`2<MaterialMan/PropertyContainer,UnityEngine.GameObject> LongshipUpgrades.LongshipPropertyBlocks::s_objectProperties
IL_002c: ldloc.0
IL_002d: ldarg.1
IL_002e: callvirt System.Void System.Collections.Generic.Dictionary`2<MaterialMan/PropertyContainer,UnityEngine.GameObject>::set_Item(!0,!1)
IL_0033: nop
IL_0034: ret

// System.Void LongshipUpgrades.LongshipPropertyBlocks/MaterialMan_ResetValue_KeepPropertyBlocks::Postfix(MaterialMan,UnityEngine.GameObject)
.locals MaterialMan/PropertyContainer, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: call System.Boolean LongshipUpgrades.LongshipCustomizableParts::HasShipComponent(UnityEngine.GameObject)
IL_0007: ldc.i4.0
IL_0008: ceq
IL_000a: stloc.1
IL_000b: ldloc.1
IL_000c: brfalse.s IL_0010
IL_000e: br.s IL_0034
IL_0010: ldarg.0
IL_0011: ldfld System.Collections.Generic.Dictionary`2<System.Int32,MaterialMan/PropertyContainer> MaterialMan::m_blocks
IL_0016: ldarg.1
IL_0017: callvirt System.Int32 UnityEngine.Object::GetInstanceID()
IL_001c: ldloca.s V_0
IL_001e: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,MaterialMan/PropertyContainer>::TryGetValue(!0,!1&)
IL_0023: stloc.2
IL_0024: ldloc.2
IL_0025: brfalse.s IL_0034
IL_0027: ldsfld System.Collections.Generic.Dictionary`2<MaterialMan/PropertyContainer,UnityEngine.GameObject> LongshipUpgrades.LongshipPropertyBlocks::s_objectProperties
IL_002c: ldloc.0
IL_002d: ldarg.1
IL_002e: callvirt System.Void System.Collections.Generic.Dictionary`2<MaterialMan/PropertyContainer,UnityEngine.GameObject>::set_Item(!0,!1)
IL_0033: nop
IL_0034: ret

// System.Void LongshipUpgrades.LongshipPropertyBlocks/MaterialMan_PropertyContainer_UpdateBlock_AfterPropertyBlock::Postfix(MaterialMan/PropertyContainer,UnityEngine.MaterialPropertyBlock)
.locals UnityEngine.GameObject, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldsfld System.Collections.Generic.Dictionary`2<MaterialMan/PropertyContainer,UnityEngine.GameObject> LongshipUpgrades.LongshipPropertyBlocks::s_objectProperties
IL_0006: ldarg.0
IL_0007: ldloca.s V_0
IL_0009: callvirt System.Boolean System.Collections.Generic.Dictionary`2<MaterialMan/PropertyContainer,UnityEngine.GameObject>::TryGetValue(!0,!1&)
IL_000e: stloc.1
IL_000f: ldloc.1
IL_0010: brfalse.s IL_0032
IL_0012: nop
IL_0013: ldarg.1
IL_0014: callvirt System.Boolean UnityEngine.MaterialPropertyBlock::get_isEmpty()
IL_0019: ldc.i4.0
IL_001a: ceq
IL_001c: stloc.2
IL_001d: ldloc.2
IL_001e: brfalse.s IL_002a
IL_0020: ldloc.0
IL_0021: ldarg.1
IL_0022: call System.Void LongshipUpgrades.LongshipCustomizableParts::CombinePropertyBlocks(UnityEngine.GameObject,UnityEngine.MaterialPropertyBlock)
IL_0027: nop
IL_0028: br.s IL_0031
IL_002a: ldloc.0
IL_002b: call System.Void LongshipUpgrades.LongshipCustomizableParts::UpdatePropertyBlocks(UnityEngine.GameObject)
IL_0030: nop
IL_0031: nop
IL_0032: ret

// System.Void LongshipUpgrades.LongshipPropertyBlocks/MaterialMan_UnregisterRenderers_Remove::Prefix(MaterialMan,UnityEngine.GameObject)
.locals MaterialMan/PropertyContainer, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.Collections.Generic.Dictionary`2<System.Int32,MaterialMan/PropertyContainer> MaterialMan::m_blocks
IL_0007: ldarg.1
IL_0008: callvirt System.Int32 UnityEngine.Object::GetInstanceID()
IL_000d: ldloca.s V_0
IL_000f: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,MaterialMan/PropertyContainer>::TryGetValue(!0,!1&)
IL_0014: stloc.1
IL_0015: ldloc.1
IL_0016: brfalse.s IL_0024
IL_0018: ldsfld System.Collections.Generic.Dictionary`2<MaterialMan/PropertyContainer,UnityEngine.GameObject> LongshipUpgrades.LongshipPropertyBlocks::s_objectProperties
IL_001d: ldloc.0
IL_001e: callvirt System.Boolean System.Collections.Generic.Dictionary`2<MaterialMan/PropertyContainer,UnityEngine.GameObject>::Remove(!0)
IL_0023: pop
IL_0024: ret

// System.Void LongshipUpgrades.LongshipUpgrades::Awake()
.locals 
IL_0000: nop
IL_0001: call System.Void LocalizationManager.Localizer::Initialize()
IL_0006: nop
IL_0007: ldarg.0
IL_0008: ldfld HarmonyLib.Harmony LongshipUpgrades.LongshipUpgrades::harmony
IL_000d: callvirt System.Void HarmonyLib.Harmony::PatchAll()
IL_0012: nop
IL_0013: ldarg.0
IL_0014: stsfld LongshipUpgrades.LongshipUpgrades LongshipUpgrades.LongshipUpgrades::instance
IL_0019: ldarg.0
IL_001a: call System.Void LongshipUpgrades.LongshipUpgrades::ConfigInit()
IL_001f: nop
IL_0020: ldsfld ConditionalConfigSync.ConfigSync LongshipUpgrades.LongshipUpgrades::configSync
IL_0025: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::configLocked
IL_002a: callvirt ConditionalConfigSync.SyncedConfigEntry`1<!!0> ConditionalConfigSync.ConditionalConfigSync::AddLockingConfigEntry<System.Boolean>(BepInEx.Configuration.ConfigEntry`1<!!0>)
IL_002f: pop
IL_0030: call System.Void LocalizationManager.Localizer::ApplyCurrentLocalization()
IL_0035: nop
IL_0036: call System.String BepInEx.Paths::get_ConfigPath()
IL_003b: ldstr "shudnal.LongshipUpgrades"
IL_0040: call System.String System.IO.Path::Combine(System.String,System.String)
IL_0045: stsfld System.String LongshipUpgrades.LongshipUpgrades::configDirectory
IL_004a: ldc.i4.1
IL_004b: stsfld System.Boolean Game::isModded
IL_0050: ldarg.0
IL_0051: call System.Void LongshipUpgrades.LongshipUpgrades::LoadTextures()
IL_0056: nop
IL_0057: ret

// System.Void LongshipUpgrades.LongshipUpgrades::ConfigInit()
.locals 
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldstr "General"
IL_0007: ldstr "Lock Configuration"
IL_000c: ldc.i4.1
IL_000d: ldstr "Configuration is locked and can be changed by server admins only."
IL_0012: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_0017: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::configLocked
IL_001c: ldarg.0
IL_001d: ldstr "General"
IL_0022: ldstr "Logging enabled"
IL_0027: ldc.i4.0
IL_0028: ldstr "Enable logging."
IL_002d: ldc.i4.0
IL_002e: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::config<System.Boolean>(System.String,System.String,T,System.String,System.Boolean)
IL_0033: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::loggingEnabled
IL_0038: ldarg.0
IL_0039: ldstr "General"
IL_003e: ldstr "Only creator can upgrade ship"
IL_0043: ldc.i4.1
IL_0044: ldstr "Only ship's creator can upgrade it."
IL_0049: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_004e: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::onlyCreatorUpgrades
IL_0053: ldarg.0
IL_0054: ldstr "General"
IL_0059: ldstr "Only creator can change trophy"
IL_005e: ldc.i4.1
IL_005f: ldstr "Only ship's creator can put and get trophy from stand."
IL_0064: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_0069: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::onlyCreatorStand
IL_006e: ldarg.0
IL_006f: ldstr "Hint"
IL_0074: ldstr "Station color"
IL_0079: ldc.r4 0.75
IL_007e: ldc.r4 1
IL_0083: ldc.r4 0.75
IL_0088: ldc.r4 1
IL_008d: newobj System.Void UnityEngine.Color::.ctor(System.Single,System.Single,System.Single,System.Single)
IL_0092: ldstr "Color of hint in upgrade tooltip."
IL_0097: ldc.i4.0
IL_0098: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::config<UnityEngine.Color>(System.String,System.String,T,System.String,System.Boolean)
IL_009d: stsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> LongshipUpgrades.LongshipUpgrades::hintStationColor
IL_00a2: ldarg.0
IL_00a3: ldstr "Hint"
IL_00a8: ldstr "Hint color"
IL_00ad: ldc.r4 0.678
IL_00b2: ldc.r4 0.847
IL_00b7: ldc.r4 0.902
IL_00bc: ldc.r4 1
IL_00c1: newobj System.Void UnityEngine.Color::.ctor(System.Single,System.Single,System.Single,System.Single)
IL_00c6: ldstr "Color of hint in upgrade tooltip."
IL_00cb: ldc.i4.0
IL_00cc: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::config<UnityEngine.Color>(System.String,System.String,T,System.String,System.Boolean)
IL_00d1: stsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> LongshipUpgrades.LongshipUpgrades::hintColor
IL_00d6: ldarg.0
IL_00d7: ldstr "Hint"
IL_00dc: ldstr "Entry amount color"
IL_00e1: call UnityEngine.Color UnityEngine.Color::get_yellow()
IL_00e6: ldstr "Color for amount."
IL_00eb: ldc.i4.0
IL_00ec: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::config<UnityEngine.Color>(System.String,System.String,T,System.String,System.Boolean)
IL_00f1: stsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> LongshipUpgrades.LongshipUpgrades::hintAmountColor
IL_00f6: ldarg.0
IL_00f7: ldstr "Hint"
IL_00fc: ldstr "Entry item name color"
IL_0101: ldc.r4 0.85
IL_0106: ldc.r4 0.85
IL_010b: ldc.r4 0.85
IL_0110: ldc.r4 1
IL_0115: newobj System.Void UnityEngine.Color::.ctor(System.Single,System.Single,System.Single,System.Single)
IL_011a: ldstr "Color for item name."
IL_011f: ldc.i4.0
IL_0120: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::config<UnityEngine.Color>(System.String,System.String,T,System.String,System.Boolean)
IL_0125: stsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> LongshipUpgrades.LongshipUpgrades::hintItemColor
IL_012a: ldarg.0
IL_012b: ldstr "Container"
IL_0130: ldstr "Enable upgrades"
IL_0135: ldc.i4.1
IL_0136: ldstr "Container upgrades. Pls be aware items in upgraded slots will be unavailable after mod disabling. But it will drop on ship destruction."
IL_013b: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_0140: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::containerEnabled
IL_0145: ldarg.0
IL_0146: ldstr "Container"
IL_014b: ldstr "Upgrade - Lvl 1 - Container Width"
IL_0150: ldc.i4.7
IL_0151: ldstr "Width of ship container after first upgrade."
IL_0156: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_015b: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerWidth
IL_0160: ldarg.0
IL_0161: ldstr "Container"
IL_0166: ldstr "Upgrade - Lvl 1 - Station name"
IL_016b: ldstr "$piece_workbench"
IL_0170: ldstr "Station localization token or prefab name. Matching is case-insensitive. The center of the ship is the starting point of the check."
IL_0175: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.String>(System.String,System.String,T,System.String)
IL_017a: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::containerLvl1Station
IL_017f: ldarg.0
IL_0180: ldstr "Container"
IL_0185: ldstr "Upgrade - Lvl 1 - Station level"
IL_018a: ldc.i4.4
IL_018b: ldstr "Station level. At least one station in the range must meet the level requirement."
IL_0190: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_0195: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerLvl1StationLvl
IL_019a: ldarg.0
IL_019b: ldstr "Container"
IL_01a0: ldstr "Upgrade - Lvl 1 - Station range"
IL_01a5: ldc.i4.s 100
IL_01a7: ldstr "Station range check. You don't have to park the ship inside your main house to be able to upgrade it."
IL_01ac: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_01b1: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerLvl1StationRange
IL_01b6: ldarg.0
IL_01b7: ldstr "Container"
IL_01bc: ldstr "Upgrade - Lvl 1 - Recipe"
IL_01c1: ldstr "ElderBark:20,Silver:5,Obsidian:10"
IL_01c6: ldstr "Container lvl 1 upgrade recipe. Item identifiers accept prefab names or localization tokens without case sensitivity. World restart or ship rebuild required to apply changes."
IL_01cb: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.String>(System.String,System.String,T,System.String)
IL_01d0: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::containerLvl1UpgradeRecipe
IL_01d5: ldarg.0
IL_01d6: ldstr "Container"
IL_01db: ldstr "Upgrade - Lvl 2 - Container Height"
IL_01e0: ldc.i4.4
IL_01e1: ldstr "Height of ship container after second upgrade."
IL_01e6: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_01eb: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerHeight
IL_01f0: ldarg.0
IL_01f1: ldstr "Container"
IL_01f6: ldstr "Upgrade - Lvl 2 - Station name"
IL_01fb: ldstr "$piece_artisanstation"
IL_0200: ldstr "Station localization token or prefab name. Matching is case-insensitive. The center of the ship is the starting point of the check."
IL_0205: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.String>(System.String,System.String,T,System.String)
IL_020a: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::containerLvl2Station
IL_020f: ldarg.0
IL_0210: ldstr "Container"
IL_0215: ldstr "Upgrade - Lvl 2 - Station level"
IL_021a: ldc.i4.1
IL_021b: ldstr "Station level. At least one station in the range must meet the level requirement."
IL_0220: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_0225: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerLvl2StationLvl
IL_022a: ldarg.0
IL_022b: ldstr "Container"
IL_0230: ldstr "Upgrade - Lvl 2 - Station range"
IL_0235: ldc.i4.s 100
IL_0237: ldstr "Station range check. You don't have to park the ship inside your main house to be able to upgrade it."
IL_023c: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_0241: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerLvl2StationRange
IL_0246: ldarg.0
IL_0247: ldstr "Container"
IL_024c: ldstr "Upgrade - Lvl 2 - Recipe"
IL_0251: ldstr "BlackMetal:20,YggdrasilWood:20,FineWood:20"
IL_0256: ldstr "Container lvl 2 upgrade recipe. Item identifiers accept prefab names or localization tokens without case sensitivity. World restart or ship rebuild required to apply changes."
IL_025b: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.String>(System.String,System.String,T,System.String)
IL_0260: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::containerLvl2UpgradeRecipe
IL_0265: ldarg.0
IL_0266: ldstr "Hull"
IL_026b: ldstr "Enable upgrades"
IL_0270: ldc.i4.1
IL_0271: ldstr "Health upgrades."
IL_0276: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_027b: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::healthEnabled
IL_0280: ldarg.0
IL_0281: ldstr "Hull"
IL_0286: ldstr "Upgrade - Lvl 1 - Health"
IL_028b: ldc.i4 1500
IL_0290: ldstr "Health of ship hull after first upgrade."
IL_0295: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_029a: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::healthUpgradeLvl1
IL_029f: ldarg.0
IL_02a0: ldstr "Hull"
IL_02a5: ldstr "Upgrade - Lvl 1 - Station name"
IL_02aa: ldstr "$piece_forge"
IL_02af: ldstr "Station localization token or prefab name. Matching is case-insensitive. The center of the ship is the starting point of the check."
IL_02b4: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.String>(System.String,System.String,T,System.String)
IL_02b9: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::healthLvl1Station
IL_02be: ldarg.0
IL_02bf: ldstr "Hull"
IL_02c4: ldstr "Upgrade - Lvl 1 - Station level"
IL_02c9: ldc.i4.7
IL_02ca: ldstr "Station level. At least one station in the range must meet the level requirement."
IL_02cf: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_02d4: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::healthLvl1StationLvl
IL_02d9: ldarg.0
IL_02da: ldstr "Hull"
IL_02df: ldstr "Upgrade - Lvl 1 - Station range"
IL_02e4: ldc.i4.s 100
IL_02e6: ldstr "Station range check. You don't have to park the ship inside your main house to be able to upgrade it."
IL_02eb: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_02f0: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::healthLvl1StationRange
IL_02f5: ldarg.0
IL_02f6: ldstr "Hull"
IL_02fb: ldstr "Upgrade - Lvl 1 - Recipe"
IL_0300: ldstr "FineWood:20,BlackMetal:10,Raspberry:2,Blueberries:2,Coal:2"
IL_0305: ldstr "Hull lvl 1 upgrade recipe. Item identifiers accept prefab names or localization tokens without case sensitivity. World restart or ship rebuild required to apply changes."
IL_030a: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.String>(System.String,System.String,T,System.String)
IL_030f: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::healthUpgradeRecipe
IL_0314: ldarg.0
IL_0315: ldstr "Hull"
IL_031a: ldstr "Upgrade - Lvl 2 - Health"
IL_031f: ldc.i4 2000
IL_0324: ldstr "Health of ship hull after second upgrade. Set to 0 to disable upgrade."
IL_0329: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_032e: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::healthUpgradeLvl2
IL_0333: ldarg.0
IL_0334: ldstr "Hull"
IL_0339: ldstr "Upgrade - Lvl 2 - Ashlands protection"
IL_033e: ldc.i4.1
IL_033f: ldstr "Should ship be protected from ashlands ocean after second upgrade. If disabled - second upgrade will not be available."
IL_0344: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_0349: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::ashlandsProtection
IL_034e: ldarg.0
IL_034f: ldstr "Hull"
IL_0354: ldstr "Upgrade - Lvl 2 - Station name"
IL_0359: ldstr "$piece_blackforge"
IL_035e: ldstr "Station localization token or prefab name. Matching is case-insensitive. The center of the ship is the starting point of the check."
IL_0363: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.String>(System.String,System.String,T,System.String)
IL_0368: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::healthLvl2Station
IL_036d: ldarg.0
IL_036e: ldstr "Hull"
IL_0373: ldstr "Upgrade - Lvl 2 - Station level"
IL_0378: ldc.i4.3
IL_0379: ldstr "Station level. At least one station in the range must meet the level requirement."
IL_037e: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_0383: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::healthLvl2StationLvl
IL_0388: ldarg.0
IL_0389: ldstr "Hull"
IL_038e: ldstr "Upgrade - Lvl 2 - Station range"
IL_0393: ldc.i4.s 100
IL_0395: ldstr "Station range check. You don't have to park the ship inside your main house to be able to upgrade it."
IL_039a: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_039f: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::healthLvl2StationRange
IL_03a4: ldarg.0
IL_03a5: ldstr "Hull"
IL_03aa: ldstr "Upgrade - Lvl 2 - Recipe"
IL_03af: ldstr "CeramicPlate:20,Tar:20,YggdrasilWood:20,IronNails:50"
IL_03b4: ldstr "Hull lvl 2 upgrade recipe. Item identifiers accept prefab names or localization tokens without case sensitivity. World restart or ship rebuild required to apply changes."
IL_03b9: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.String>(System.String,System.String,T,System.String)
IL_03be: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::ashlandsUpgradeRecipe
IL_03c3: ldarg.0
IL_03c4: ldstr "Lantern"
IL_03c9: ldstr "Enable upgrades"
IL_03ce: ldc.i4.1
IL_03cf: ldstr "Lantern upgrades requires mast to be upgraded."
IL_03d4: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_03d9: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::lanternEnabled
IL_03de: ldarg.0
IL_03df: ldstr "Lantern"
IL_03e4: ldstr "Make removable"
IL_03e9: ldc.i4.1
IL_03ea: ldstr "Make lantern removable. World restart or ship rebuild required to apply changes."
IL_03ef: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_03f4: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::lanternRemovable
IL_03f9: ldarg.0
IL_03fa: ldstr "Lantern"
IL_03ff: ldstr "Light auto enabled and disabled"
IL_0404: ldc.i4.1
IL_0405: ldstr "Light will be automatically enabled in night time or dark environments and automatically disabled in day light"
IL_040a: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_040f: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::lanternAutoSwtich
IL_0414: ldarg.0
IL_0415: ldstr "Lantern"
IL_041a: ldstr "Light switch enabled"
IL_041f: ldc.i4.1
IL_0420: ldstr "Enable manual light switch. World restart or ship rebuild required to apply changes."
IL_0425: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_042a: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::lanternSwitchable
IL_042f: ldarg.0
IL_0430: ldstr "Lantern"
IL_0435: ldstr "Light color"
IL_043a: ldc.r4 0.96
IL_043f: ldc.r4 0.78
IL_0444: ldc.r4 0.68
IL_0449: ldc.r4 1
IL_044e: newobj System.Void UnityEngine.Color::.ctor(System.Single,System.Single,System.Single,System.Single)
IL_0453: ldstr "Color of lantern light. Switch light to apply changes."
IL_0458: ldc.i4.1
IL_0459: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::config<UnityEngine.Color>(System.String,System.String,T,System.String,System.Boolean)
IL_045e: stsfld BepInEx.Configuration.ConfigEntry`1<UnityEngine.Color> LongshipUpgrades.LongshipUpgrades::lanternLightColor
IL_0463: ldarg.0
IL_0464: ldstr "Lantern"
IL_0469: ldstr "Recipe"
IL_046e: ldstr "SurtlingCore:3,BronzeNails:10,FineWood:6,Chain:1"
IL_0473: ldstr "Lantern upgrade recipe. Item identifiers accept prefab names or localization tokens without case sensitivity. World restart or ship rebuild required to apply changes."
IL_0478: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.String>(System.String,System.String,T,System.String)
IL_047d: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::lanternUpgradeRecipe
IL_0482: ldarg.0
IL_0483: ldstr "Lantern"
IL_0488: ldstr "Station name"
IL_048d: ldstr "$piece_forge"
IL_0492: ldstr "Station localization token or prefab name. Matching is case-insensitive. The center of the ship is the starting point of the check."
IL_0497: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.String>(System.String,System.String,T,System.String)
IL_049c: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::lanternStation
IL_04a1: ldarg.0
IL_04a2: ldstr "Lantern"
IL_04a7: ldstr "Station level"
IL_04ac: ldc.i4.4
IL_04ad: ldstr "Station level. At least one station in the range must meet the level requirement."
IL_04b2: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_04b7: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::lanternStationLvl
IL_04bc: ldarg.0
IL_04bd: ldstr "Lantern"
IL_04c2: ldstr "Station range"
IL_04c7: ldc.i4.s 100
IL_04c9: ldstr "Station range check. You don't have to park the ship inside your main house to be able to upgrade it."
IL_04ce: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_04d3: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::lanternStationRange
IL_04d8: ldarg.0
IL_04d9: ldstr "Mast"
IL_04de: ldstr "Enable upgrades"
IL_04e3: ldc.i4.1
IL_04e4: ldstr "Mast upgrade also makes lantern, tent and wisp torch upgrades possible."
IL_04e9: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_04ee: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::mastEnabled
IL_04f3: ldarg.0
IL_04f4: ldstr "Mast"
IL_04f9: ldstr "Make removable"
IL_04fe: ldc.i4.1
IL_04ff: ldstr "Enable mast removal. World restart or ship rebuild required to apply changes."
IL_0504: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_0509: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::mastRemovable
IL_050e: ldarg.0
IL_050f: ldstr "Mast"
IL_0514: ldstr "Recipe"
IL_0519: ldstr "RoundLog:2,IronNails:10,FineWood:4,Raspberry:2,Blueberries:2,Coal:2"
IL_051e: ldstr "Mast upgrade recipe. Item identifiers accept prefab names or localization tokens without case sensitivity. World restart or ship rebuild required to apply changes."
IL_0523: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.String>(System.String,System.String,T,System.String)
IL_0528: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::mastUpgradeRecipe
IL_052d: ldarg.0
IL_052e: ldstr "Mast"
IL_0533: ldstr "Station name"
IL_0538: ldstr "$piece_workbench"
IL_053d: ldstr "Station localization token or prefab name. Matching is case-insensitive. The center of the ship is the starting point of the check."
IL_0542: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.String>(System.String,System.String,T,System.String)
IL_0547: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::mastStation
IL_054c: ldarg.0
IL_054d: ldstr "Mast"
IL_0552: ldstr "Station level"
IL_0557: ldc.i4.4
IL_0558: ldstr "Station level. At least one station in the range must meet the level requirement."
IL_055d: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_0562: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::mastStationLvl
IL_0567: ldarg.0
IL_0568: ldstr "Mast"
IL_056d: ldstr "Station range"
IL_0572: ldc.i4.s 100
IL_0574: ldstr "Station range check. You don't have to park the ship inside your main house to be able to upgrade it."
IL_0579: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_057e: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::mastStationRange
IL_0583: ldarg.0
IL_0584: ldstr "Tent"
IL_0589: ldstr "Enable upgrades"
IL_058e: ldc.i4.1
IL_058f: ldstr "Tent upgrades requires mast to be upgraded."
IL_0594: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_0599: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::tentEnabled
IL_059e: ldarg.0
IL_059f: ldstr "Tent"
IL_05a4: ldstr "Heat enabled"
IL_05a9: ldc.i4.1
IL_05aa: ldstr "Enable heat zone under the tent to get place to rest. Enabled lantern required."
IL_05af: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_05b4: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::tentHeat
IL_05b9: ldarg.0
IL_05ba: ldstr "Tent"
IL_05bf: ldstr "Make removable"
IL_05c4: ldc.i4.1
IL_05c5: ldstr "Enable tent removal. World restart or ship rebuild required to apply changes."
IL_05ca: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_05cf: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::tentRemovable
IL_05d4: ldarg.0
IL_05d5: ldstr "Tent"
IL_05da: ldstr "Recipe"
IL_05df: ldstr "JuteRed:2,LoxPelt:2,LinenThread:6,RoundLog:2"
IL_05e4: ldstr "Tent upgrade recipe. Item identifiers accept prefab names or localization tokens without case sensitivity. World restart or ship rebuild required to apply changes."
IL_05e9: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.String>(System.String,System.String,T,System.String)
IL_05ee: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::tentUpgradeRecipe
IL_05f3: ldarg.0
IL_05f4: ldstr "Tent"
IL_05f9: ldstr "Station name"
IL_05fe: ldstr "$piece_workbench"
IL_0603: ldstr "Station localization token or prefab name. Matching is case-insensitive. The center of the ship is the starting point of the check."
IL_0608: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.String>(System.String,System.String,T,System.String)
IL_060d: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::tentStation
IL_0612: ldarg.0
IL_0613: ldstr "Tent"
IL_0618: ldstr "Station level"
IL_061d: ldc.i4.4
IL_061e: ldstr "Station level. At least one station in the range must meet the level requirement."
IL_0623: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_0628: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::tentStationLvl
IL_062d: ldarg.0
IL_062e: ldstr "Tent"
IL_0633: ldstr "Station range"
IL_0638: ldc.i4.s 100
IL_063a: ldstr "Station range check. You don't have to park the ship inside your main house to be able to upgrade it."
IL_063f: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_0644: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::tentStationRange
IL_0649: ldarg.0
IL_064a: ldstr "Wisp torch"
IL_064f: ldstr "Enable upgrades"
IL_0654: ldc.i4.1
IL_0655: ldstr "Wisp torch pushes away the surrounding magic mist."
IL_065a: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_065f: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::wispEnabled
IL_0664: ldarg.0
IL_0665: ldstr "Wisp torch"
IL_066a: ldstr "Recipe"
IL_066f: ldstr "YggdrasilWood:10,Wisp:5,Eitr:5"
IL_0674: ldstr "Wisp Torch upgrade recipe. Item identifiers accept prefab names or localization tokens without case sensitivity. World restart or ship rebuild required to apply changes."
IL_0679: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.String>(System.String,System.String,T,System.String)
IL_067e: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::wispUpgradeRecipe
IL_0683: ldarg.0
IL_0684: ldstr "Wisp torch"
IL_0689: ldstr "Station name"
IL_068e: ldstr "$piece_magetable"
IL_0693: ldstr "Station localization token or prefab name. Matching is case-insensitive. The center of the ship is the starting point of the check."
IL_0698: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.String>(System.String,System.String,T,System.String)
IL_069d: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::wispStation
IL_06a2: ldarg.0
IL_06a3: ldstr "Wisp torch"
IL_06a8: ldstr "Station level"
IL_06ad: ldc.i4.1
IL_06ae: ldstr "Station level. At least one station in the range must meet the level requirement."
IL_06b3: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_06b8: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::wispStationLvl
IL_06bd: ldarg.0
IL_06be: ldstr "Wisp torch"
IL_06c3: ldstr "Station range"
IL_06c8: ldc.i4.s 100
IL_06ca: ldstr "Station range check. You don't have to park the ship inside your main house to be able to upgrade it."
IL_06cf: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_06d4: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::wispStationRange
IL_06d9: ldarg.0
IL_06da: ldstr "Turrets"
IL_06df: ldstr "Enable upgrades"
IL_06e4: ldc.i4.1
IL_06e5: ldstr "Enable turrets upgrades."
IL_06ea: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_06ef: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::turretsEnabled
IL_06f4: ldarg.0
IL_06f5: ldstr "Turrets"
IL_06fa: ldstr "Recipe"
IL_06ff: ldstr "BlackMetal:15,YggdrasilWood:15,MechanicalSpring:5"
IL_0704: ldstr "Turrets upgrade recipe. Item identifiers accept prefab names or localization tokens without case sensitivity. World restart or ship rebuild required to apply changes."
IL_0709: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.String>(System.String,System.String,T,System.String)
IL_070e: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::turretsUpgradeRecipe
IL_0713: ldarg.0
IL_0714: ldstr "Turrets"
IL_0719: ldstr "Station name"
IL_071e: ldstr "$piece_artisanstation"
IL_0723: ldstr "Station localization token or prefab name. Matching is case-insensitive. The center of the ship is the starting point of the check."
IL_0728: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.String>(System.String,System.String,T,System.String)
IL_072d: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::turretsStation
IL_0732: ldarg.0
IL_0733: ldstr "Turrets"
IL_0738: ldstr "Station level"
IL_073d: ldc.i4.1
IL_073e: ldstr "Station level. At least one station in the range must meet the level requirement."
IL_0743: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_0748: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::turretsStationLvl
IL_074d: ldarg.0
IL_074e: ldstr "Turrets"
IL_0753: ldstr "Station range"
IL_0758: ldc.i4.s 100
IL_075a: ldstr "Station range check. You don't have to park the ship inside your main house to be able to upgrade it."
IL_075f: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_0764: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::turretsStationRange
IL_0769: ldarg.0
IL_076a: ldstr "Item stand"
IL_076f: ldstr "Enabled"
IL_0774: ldc.i4.1
IL_0775: ldstr "Enable item stand on bow for trophy."
IL_077a: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_077f: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::itemStandEnabled
IL_0784: ldarg.0
IL_0785: ldstr "Item stand"
IL_078a: ldstr "Trophy speaking disabled"
IL_078f: ldc.i4.0
IL_0790: ldstr "Trophis will not do random speak. World restart or ship rebuild required to apply changes."
IL_0795: ldc.i4.1
IL_0796: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::config<System.Boolean>(System.String,System.String,T,System.String,System.Boolean)
IL_079b: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::itemStandDisableSpeaking
IL_07a0: ldarg.0
IL_07a1: ldstr "Item stand"
IL_07a6: ldstr "Trophy rescale"
IL_07ab: ldstr "TrophyBonemass:0,7;TrophyBonemawSerpent:0,7;TrophySeekerQueen:0,7;TrophyGoblinKing:0,7"
IL_07b0: ldstr "Some trophies are ginormous. Set smaller scale for them. Trophy rehook required to apply changes."
IL_07b5: ldc.i4.1
IL_07b6: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::config<System.String>(System.String,System.String,T,System.String,System.Boolean)
IL_07bb: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::itemStandTrophyRescale
IL_07c0: ldarg.0
IL_07c1: ldstr "Item stand"
IL_07c6: ldstr "Forsaken power enabled"
IL_07cb: ldc.i4.1
IL_07cc: ldstr "Boss trophies brings an option to cast another Forsaken power while on ship."
IL_07d1: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_07d6: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::itemStandForsakenPower
IL_07db: ldarg.0
IL_07dc: ldstr "Map table"
IL_07e1: ldstr "Enable upgrades"
IL_07e6: ldc.i4.1
IL_07e7: ldstr "Cartography table allows to exchange map data between players. Disabling this permanently clears recorded map data from all longships, including unloaded ships. Ship upgrades, cargo, personal exploration and land-based map tables are not affected. The server checks for remaining map data before every world save while this setting is disabled. Before disabling or uninstalling Longship Upgrades, disable this setting, complete a successful world save, then stop the server or game and remove the mod."
IL_07ec: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_07f1: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::mapTableEnabled
IL_07f6: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::mapTableEnabled
IL_07fb: ldsfld System.EventHandler LongshipUpgrades.LongshipUpgrades/<>c::<>9__90_0
IL_0800: dup
IL_0801: brtrue.s IL_081a
IL_0803: pop
IL_0804: ldsfld LongshipUpgrades.LongshipUpgrades/<>c LongshipUpgrades.LongshipUpgrades/<>c::<>9
IL_0809: ldftn System.Void LongshipUpgrades.LongshipUpgrades/<>c::<ConfigInit>b__90_0(System.Object,System.EventArgs)
IL_080f: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_0814: dup
IL_0815: stsfld System.EventHandler LongshipUpgrades.LongshipUpgrades/<>c::<>9__90_0
IL_081a: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<System.Boolean>::add_SettingChanged(System.EventHandler)
IL_081f: nop
IL_0820: ldarg.0
IL_0821: ldstr "Map table"
IL_0826: ldstr "Recipe"
IL_082b: ldstr "FineWood:10,Bronze:2,LeatherScraps:5,Raspberry:4"
IL_0830: ldstr "Map Table upgrade recipe. Item identifiers accept prefab names or localization tokens without case sensitivity. World restart or ship rebuild required to apply changes."
IL_0835: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.String>(System.String,System.String,T,System.String)
IL_083a: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::mapTableUpgradeRecipe
IL_083f: ldarg.0
IL_0840: ldstr "Map table"
IL_0845: ldstr "Station name"
IL_084a: ldstr "$piece_forge"
IL_084f: ldstr "Station localization token or prefab name. Matching is case-insensitive. The center of the ship is the starting point of the check."
IL_0854: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.String>(System.String,System.String,T,System.String)
IL_0859: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::mapTableStation
IL_085e: ldarg.0
IL_085f: ldstr "Map table"
IL_0864: ldstr "Station level"
IL_0869: ldc.i4.3
IL_086a: ldstr "Station level. At least one station in the range must meet the level requirement."
IL_086f: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_0874: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::mapTableStationLvl
IL_0879: ldarg.0
IL_087a: ldstr "Map table"
IL_087f: ldstr "Station range"
IL_0884: ldc.i4.s 100
IL_0886: ldstr "Station range check. You don't have to park the ship inside your main house to be able to upgrade it."
IL_088b: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_0890: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::mapTableStationRange
IL_0895: ldarg.0
IL_0896: ldstr "Style"
IL_089b: ldstr "Change heads"
IL_08a0: ldc.i4.1
IL_08a1: ldstr "Change ship's head style."
IL_08a6: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_08ab: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::changeHead
IL_08b0: ldarg.0
IL_08b1: ldstr "Style"
IL_08b6: ldstr "Change shields color"
IL_08bb: ldc.i4.1
IL_08bc: ldstr "Change shields colors. World restart or ship rebuild required to apply changes."
IL_08c1: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_08c6: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::changeShields
IL_08cb: ldarg.0
IL_08cc: ldstr "Style"
IL_08d1: ldstr "Change tent color"
IL_08d6: ldc.i4.1
IL_08d7: ldstr "Change tent colors. World restart or ship rebuild required to apply changes."
IL_08dc: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_08e1: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::changeTent
IL_08e6: ldarg.0
IL_08e7: ldstr "Style"
IL_08ec: ldstr "Change sail color"
IL_08f1: ldc.i4.1
IL_08f2: ldstr "Change sail colors. World restart or ship rebuild required to apply changes."
IL_08f7: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Boolean>(System.String,System.String,T,System.String)
IL_08fc: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::changeSail
IL_0901: ldarg.0
IL_0902: ldstr "Style"
IL_0907: ldstr "Max shields amount"
IL_090c: ldc.i4.0
IL_090d: ldstr "Maximum amount of shield variants. If 0 - amount is taken from custom textures count.
 By default every custom texture counts as 3 shields. World restart or ship rebuild required to apply changes."
IL_0912: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_0917: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::maxShields
IL_091c: ldarg.0
IL_091d: ldstr "Style"
IL_0922: ldstr "Max tents amount"
IL_0927: ldc.i4.0
IL_0928: ldstr "Maximum amount of tent variants. If 0 - amount is taken from custom textures count. World restart or ship rebuild required to apply changes."
IL_092d: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_0932: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::maxTents
IL_0937: ldarg.0
IL_0938: ldstr "Style"
IL_093d: ldstr "Max sails amount"
IL_0942: ldc.i4.0
IL_0943: ldstr "Maximum amount of sail variants. If 0 - amount is taken from custom textures count. "
IL_0948: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<System.Int32>(System.String,System.String,T,System.String)
IL_094d: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::maxSails
IL_0952: ret

// System.Void LongshipUpgrades.LongshipUpgrades::OnDestroy()
.locals 
IL_0000: nop
IL_0001: call System.Void LongshipUpgrades.PrefabAudio::Clear()
IL_0006: nop
IL_0007: ldarg.0
IL_0008: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_000d: callvirt System.Void BepInEx.Configuration.ConfigFile::Save()
IL_0012: nop
IL_0013: ldnull
IL_0014: stsfld LongshipUpgrades.LongshipUpgrades LongshipUpgrades.LongshipUpgrades::instance
IL_0019: ldarg.0
IL_001a: ldfld HarmonyLib.Harmony LongshipUpgrades.LongshipUpgrades::harmony
IL_001f: dup
IL_0020: brtrue.s IL_0025
IL_0022: pop
IL_0023: br.s IL_002b
IL_0025: call System.Void HarmonyLib.Harmony::UnpatchSelf()
IL_002a: nop
IL_002b: ret

// System.Void LongshipUpgrades.LongshipUpgrades::LogInfo(System.Object)
.locals System.Boolean
IL_0000: nop
IL_0001: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::loggingEnabled
IL_0006: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000b: stloc.0
IL_000c: ldloc.0
IL_000d: brfalse.s IL_0020
IL_000f: ldsfld LongshipUpgrades.LongshipUpgrades LongshipUpgrades.LongshipUpgrades::instance
IL_0014: callvirt BepInEx.Logging.ManualLogSource BepInEx.BaseUnityPlugin::get_Logger()
IL_0019: ldarg.0
IL_001a: callvirt System.Void BepInEx.Logging.ManualLogSource::LogInfo(System.Object)
IL_001f: nop
IL_0020: ret

// System.Void LongshipUpgrades.LongshipUpgrades::LogWarning(System.Object)
.locals 
IL_0000: nop
IL_0001: ldsfld LongshipUpgrades.LongshipUpgrades LongshipUpgrades.LongshipUpgrades::instance
IL_0006: callvirt BepInEx.Logging.ManualLogSource BepInEx.BaseUnityPlugin::get_Logger()
IL_000b: ldarg.0
IL_000c: callvirt System.Void BepInEx.Logging.ManualLogSource::LogWarning(System.Object)
IL_0011: nop
IL_0012: ret

// BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::config(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
.locals 
IL_0000: ldsfld ConditionalConfigSync.ConfigSync LongshipUpgrades.LongshipUpgrades::configSync
IL_0005: ldarg.0
IL_0006: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_000b: ldarg.1
IL_000c: ldarg.2
IL_000d: ldarg.3
IL_000e: ldarg.s description
IL_0010: ldc.i4.1
IL_0011: ldarg.s synchronizedSetting
IL_0013: callvirt ConditionalConfigSync.SyncedConfigEntry`1<!!0> ConditionalConfigSync.ConditionalConfigSync::AddConfigEntry<T>(BepInEx.Configuration.ConfigFile,System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription,ConditionalConfigSync.ConfigSyncMode,System.Boolean)
IL_0018: ldfld BepInEx.Configuration.ConfigEntry`1<!0> ConditionalConfigSync.SyncedConfigEntry`1<T>::SourceConfig
IL_001d: ret

// BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::config(System.String,System.String,T,System.String,System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: ldarg.2
IL_0003: ldarg.3
IL_0004: ldarg.s description
IL_0006: ldnull
IL_0007: call !!0[] System.Array::Empty<System.Object>()
IL_000c: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0011: ldarg.s synchronizedSetting
IL_0013: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::config<T>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_0018: ret

// BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig(System.String,System.String,T,BepInEx.Configuration.ConfigDescription)
.locals 
IL_0000: ldsfld ConditionalConfigSync.ConfigSync LongshipUpgrades.LongshipUpgrades::configSync
IL_0005: ldarg.0
IL_0006: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_000b: ldarg.1
IL_000c: ldarg.2
IL_000d: ldarg.3
IL_000e: ldarg.s description
IL_0010: ldc.i4.0
IL_0011: ldc.i4.1
IL_0012: callvirt ConditionalConfigSync.SyncedConfigEntry`1<!!0> ConditionalConfigSync.ConditionalConfigSync::AddConfigEntry<T>(BepInEx.Configuration.ConfigFile,System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription,ConditionalConfigSync.ConfigSyncMode,System.Boolean)
IL_0017: ldfld BepInEx.Configuration.ConfigEntry`1<!0> ConditionalConfigSync.SyncedConfigEntry`1<T>::SourceConfig
IL_001c: ret

// BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig(System.String,System.String,T,System.String)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: ldarg.2
IL_0003: ldarg.3
IL_0004: ldarg.s description
IL_0006: ldnull
IL_0007: call !!0[] System.Array::Empty<System.Object>()
IL_000c: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0011: call BepInEx.Configuration.ConfigEntry`1<T> LongshipUpgrades.LongshipUpgrades::serverConfig<T>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription)
IL_0016: ret

// System.Void LongshipUpgrades.LongshipUpgrades::LoadTextures()
.locals System.String, System.String, System.String, System.String, System.String, System.String, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Collections.Generic.IEnumerator`1<System.IO.FileInfo>, System.IO.FileInfo, System.Collections.Generic.IEnumerator`1<System.IO.FileInfo>, System.IO.FileInfo, System.Collections.Generic.IEnumerator`1<System.IO.FileInfo>, System.IO.FileInfo
IL_0000: nop
IL_0001: ldstr "ashlands_hull.png"
IL_0006: ldsflda UnityEngine.Texture2D LongshipUpgrades.LongshipCustomizableParts::s_ashlandsHull
IL_000b: call System.Boolean LongshipUpgrades.LongshipUpgrades::LoadTexture(System.String,UnityEngine.Texture2D&)
IL_0010: pop
IL_0011: ldstr "ashlands_hull_damaged.png"
IL_0016: ldsflda UnityEngine.Texture2D LongshipUpgrades.LongshipCustomizableParts::s_ashlandsHullDamaged
IL_001b: call System.Boolean LongshipUpgrades.LongshipUpgrades::LoadTexture(System.String,UnityEngine.Texture2D&)
IL_0020: pop
IL_0021: ldsfld System.String LongshipUpgrades.LongshipUpgrades::configDirectory
IL_0026: call System.IO.DirectoryInfo System.IO.Directory::CreateDirectory(System.String)
IL_002b: pop
IL_002c: ldsfld System.String LongshipUpgrades.LongshipUpgrades::configDirectory
IL_0031: ldstr "sail_original.png"
IL_0036: call System.String System.IO.Path::Combine(System.String,System.String)
IL_003b: stloc.0
IL_003c: ldsfld System.String LongshipUpgrades.LongshipUpgrades::configDirectory
IL_0041: ldstr "tent_original.png"
IL_0046: call System.String System.IO.Path::Combine(System.String,System.String)
IL_004b: stloc.1
IL_004c: ldsfld System.String LongshipUpgrades.LongshipUpgrades::configDirectory
IL_0051: ldstr "shields_original.png"
IL_0056: call System.String System.IO.Path::Combine(System.String,System.String)
IL_005b: stloc.2
IL_005c: ldloc.0
IL_005d: call System.Boolean System.IO.File::Exists(System.String)
IL_0062: brfalse.s IL_0077
IL_0064: ldloc.1
IL_0065: call System.Boolean System.IO.File::Exists(System.String)
IL_006a: brfalse.s IL_0077
IL_006c: ldloc.2
IL_006d: call System.Boolean System.IO.File::Exists(System.String)
IL_0072: ldc.i4.0
IL_0073: ceq
IL_0075: br.s IL_0078
IL_0077: ldc.i4.1
IL_0078: stloc.s V_6
IL_007a: ldloc.s V_6
IL_007c: brfalse.s IL_00b3
IL_007e: nop
IL_007f: ldloc.0
IL_0080: ldstr "sail_original.png"
IL_0085: call System.Byte[] LongshipUpgrades.LongshipUpgrades::GetEmbeddedFileData(System.String)
IL_008a: call System.Void System.IO.File::WriteAllBytes(System.String,System.Byte[])
IL_008f: nop
IL_0090: ldloc.1
IL_0091: ldstr "tent_original.png"
IL_0096: call System.Byte[] LongshipUpgrades.LongshipUpgrades::GetEmbeddedFileData(System.String)
IL_009b: call System.Void System.IO.File::WriteAllBytes(System.String,System.Byte[])
IL_00a0: nop
IL_00a1: ldloc.2
IL_00a2: ldstr "shields_original.png"
IL_00a7: call System.Byte[] LongshipUpgrades.LongshipUpgrades::GetEmbeddedFileData(System.String)
IL_00ac: call System.Void System.IO.File::WriteAllBytes(System.String,System.Byte[])
IL_00b1: nop
IL_00b2: nop
IL_00b3: ldsfld System.String LongshipUpgrades.LongshipUpgrades::configDirectory
IL_00b8: ldstr "tents"
IL_00bd: call System.String System.IO.Path::Combine(System.String,System.String)
IL_00c2: stloc.3
IL_00c3: ldloc.3
IL_00c4: call System.Boolean System.IO.Directory::Exists(System.String)
IL_00c9: ldc.i4.0
IL_00ca: ceq
IL_00cc: stloc.s V_7
IL_00ce: ldloc.s V_7
IL_00d0: brfalse IL_0165
IL_00d5: nop
IL_00d6: ldloc.3
IL_00d7: call System.IO.DirectoryInfo System.IO.Directory::CreateDirectory(System.String)
IL_00dc: pop
IL_00dd: ldloc.3
IL_00de: ldstr "tent_01.png"
IL_00e3: call System.String System.IO.Path::Combine(System.String,System.String)
IL_00e8: ldstr "tent_01.png"
IL_00ed: call System.Byte[] LongshipUpgrades.LongshipUpgrades::GetEmbeddedFileData(System.String)
IL_00f2: call System.Void System.IO.File::WriteAllBytes(System.String,System.Byte[])
IL_00f7: nop
IL_00f8: ldloc.3
IL_00f9: ldstr "tent_02.png"
IL_00fe: call System.String System.IO.Path::Combine(System.String,System.String)
IL_0103: ldstr "tent_02.png"
IL_0108: call System.Byte[] LongshipUpgrades.LongshipUpgrades::GetEmbeddedFileData(System.String)
IL_010d: call System.Void System.IO.File::WriteAllBytes(System.String,System.Byte[])
IL_0112: nop
IL_0113: ldloc.3
IL_0114: ldstr "tent_03.png"
IL_0119: call System.String System.IO.Path::Combine(System.String,System.String)
IL_011e: ldstr "tent_03.png"
IL_0123: call System.Byte[] LongshipUpgrades.LongshipUpgrades::GetEmbeddedFileData(System.String)
IL_0128: call System.Void System.IO.File::WriteAllBytes(System.String,System.Byte[])
IL_012d: nop
IL_012e: ldloc.3
IL_012f: ldstr "tent_04.png"
IL_0134: call System.String System.IO.Path::Combine(System.String,System.String)
IL_0139: ldstr "tent_04.png"
IL_013e: call System.Byte[] LongshipUpgrades.LongshipUpgrades::GetEmbeddedFileData(System.String)
IL_0143: call System.Void System.IO.File::WriteAllBytes(System.String,System.Byte[])
IL_0148: nop
IL_0149: ldloc.3
IL_014a: ldstr "tent_05.png"
IL_014f: call System.String System.IO.Path::Combine(System.String,System.String)
IL_0154: ldstr "tent_05.png"
IL_0159: call System.Byte[] LongshipUpgrades.LongshipUpgrades::GetEmbeddedFileData(System.String)
IL_015e: call System.Void System.IO.File::WriteAllBytes(System.String,System.Byte[])
IL_0163: nop
IL_0164: nop
IL_0165: ldsfld System.String LongshipUpgrades.LongshipUpgrades::configDirectory
IL_016a: ldstr "sails"
IL_016f: call System.String System.IO.Path::Combine(System.String,System.String)
IL_0174: stloc.s V_4
IL_0176: ldloc.s V_4
IL_0178: call System.Boolean System.IO.Directory::Exists(System.String)
IL_017d: ldc.i4.0
IL_017e: ceq
IL_0180: stloc.s V_8
IL_0182: ldloc.s V_8
IL_0184: brfalse IL_021f
IL_0189: nop
IL_018a: ldloc.s V_4
IL_018c: call System.IO.DirectoryInfo System.IO.Directory::CreateDirectory(System.String)
IL_0191: pop
IL_0192: ldloc.s V_4
IL_0194: ldstr "sail_01.png"
IL_0199: call System.String System.IO.Path::Combine(System.String,System.String)
IL_019e: ldstr "sail_01.png"
IL_01a3: call System.Byte[] LongshipUpgrades.LongshipUpgrades::GetEmbeddedFileData(System.String)
IL_01a8: call System.Void System.IO.File::WriteAllBytes(System.String,System.Byte[])
IL_01ad: nop
IL_01ae: ldloc.s V_4
IL_01b0: ldstr "sail_02.png"
IL_01b5: call System.String System.IO.Path::Combine(System.String,System.String)
IL_01ba: ldstr "sail_02.png"
IL_01bf: call System.Byte[] LongshipUpgrades.LongshipUpgrades::GetEmbeddedFileData(System.String)
IL_01c4: call System.Void System.IO.File::WriteAllBytes(System.String,System.Byte[])
IL_01c9: nop
IL_01ca: ldloc.s V_4
IL_01cc: ldstr "sail_03.png"
IL_01d1: call System.String System.IO.Path::Combine(System.String,System.String)
IL_01d6: ldstr "sail_03.png"
IL_01db: call System.Byte[] LongshipUpgrades.LongshipUpgrades::GetEmbeddedFileData(System.String)
IL_01e0: call System.Void System.IO.File::WriteAllBytes(System.String,System.Byte[])
IL_01e5: nop
IL_01e6: ldloc.s V_4
IL_01e8: ldstr "sail_04.png"
IL_01ed: call System.String System.IO.Path::Combine(System.String,System.String)
IL_01f2: ldstr "sail_04.png"
IL_01f7: call System.Byte[] LongshipUpgrades.LongshipUpgrades::GetEmbeddedFileData(System.String)
IL_01fc: call System.Void System.IO.File::WriteAllBytes(System.String,System.Byte[])
IL_0201: nop
IL_0202: ldloc.s V_4
IL_0204: ldstr "sail_05.png"
IL_0209: call System.String System.IO.Path::Combine(System.String,System.String)
IL_020e: ldstr "sail_05.png"
IL_0213: call System.Byte[] LongshipUpgrades.LongshipUpgrades::GetEmbeddedFileData(System.String)
IL_0218: call System.Void System.IO.File::WriteAllBytes(System.String,System.Byte[])
IL_021d: nop
IL_021e: nop
IL_021f: ldsfld System.String LongshipUpgrades.LongshipUpgrades::configDirectory
IL_0224: ldstr "shields"
IL_0229: call System.String System.IO.Path::Combine(System.String,System.String)
IL_022e: stloc.s V_5
IL_0230: ldloc.s V_5
IL_0232: call System.Boolean System.IO.Directory::Exists(System.String)
IL_0237: ldc.i4.0
IL_0238: ceq
IL_023a: stloc.s V_9
IL_023c: ldloc.s V_9
IL_023e: brfalse.s IL_0266
IL_0240: nop
IL_0241: ldloc.s V_5
IL_0243: call System.IO.DirectoryInfo System.IO.Directory::CreateDirectory(System.String)
IL_0248: pop
IL_0249: ldloc.s V_5
IL_024b: ldstr "shields_01.png"
IL_0250: call System.String System.IO.Path::Combine(System.String,System.String)
IL_0255: ldstr "shields_01.png"
IL_025a: call System.Byte[] LongshipUpgrades.LongshipUpgrades::GetEmbeddedFileData(System.String)
IL_025f: call System.Void System.IO.File::WriteAllBytes(System.String,System.Byte[])
IL_0264: nop
IL_0265: nop
IL_0266: nop
IL_0267: ldloc.3
IL_0268: newobj System.Void System.IO.DirectoryInfo::.ctor(System.String)
IL_026d: call System.Collections.Generic.IEnumerable`1<System.IO.FileInfo> System.IO.DirectoryInfo::EnumerateFiles()
IL_0272: ldsfld System.Func`2<System.IO.FileInfo,System.String> LongshipUpgrades.LongshipUpgrades/<>c::<>9__98_0
IL_0277: dup
IL_0278: brtrue.s IL_0291
IL_027a: pop
IL_027b: ldsfld LongshipUpgrades.LongshipUpgrades/<>c LongshipUpgrades.LongshipUpgrades/<>c::<>9
IL_0280: ldftn System.String LongshipUpgrades.LongshipUpgrades/<>c::<LoadTextures>b__98_0(System.IO.FileInfo)
IL_0286: newobj System.Void System.Func`2<System.IO.FileInfo,System.String>::.ctor(System.Object,System.IntPtr)
IL_028b: dup
IL_028c: stsfld System.Func`2<System.IO.FileInfo,System.String> LongshipUpgrades.LongshipUpgrades/<>c::<>9__98_0
IL_0291: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::OrderBy<System.IO.FileInfo,System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_0296: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<System.IO.FileInfo>::GetEnumerator()
IL_029b: stloc.s V_10
IL_029d: br.s IL_02bf
IL_029f: ldloc.s V_10
IL_02a1: callvirt !0 System.Collections.Generic.IEnumerator`1<System.IO.FileInfo>::get_Current()
IL_02a6: stloc.s V_11
IL_02a8: ldstr "tents"
IL_02ad: ldloc.s V_11
IL_02af: callvirt System.String System.IO.FileSystemInfo::get_Name()
IL_02b4: call System.String System.IO.Path::Combine(System.String,System.String)
IL_02b9: call System.Void LongshipUpgrades.LongshipCustomizableParts::AddCustomTent(System.String)
IL_02be: nop
IL_02bf: ldloc.s V_10
IL_02c1: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_02c6: brtrue.s IL_029f
IL_02c8: leave.s IL_02d7
IL_02ca: ldloc.s V_10
IL_02cc: brfalse.s IL_02d6
IL_02ce: ldloc.s V_10
IL_02d0: callvirt System.Void System.IDisposable::Dispose()
IL_02d5: nop
IL_02d6: endfinally
IL_02d7: nop
IL_02d8: ldloc.s V_4
IL_02da: newobj System.Void System.IO.DirectoryInfo::.ctor(System.String)
IL_02df: call System.Collections.Generic.IEnumerable`1<System.IO.FileInfo> System.IO.DirectoryInfo::EnumerateFiles()
IL_02e4: ldsfld System.Func`2<System.IO.FileInfo,System.String> LongshipUpgrades.LongshipUpgrades/<>c::<>9__98_1
IL_02e9: dup
IL_02ea: brtrue.s IL_0303
IL_02ec: pop
IL_02ed: ldsfld LongshipUpgrades.LongshipUpgrades/<>c LongshipUpgrades.LongshipUpgrades/<>c::<>9
IL_02f2: ldftn System.String LongshipUpgrades.LongshipUpgrades/<>c::<LoadTextures>b__98_1(System.IO.FileInfo)
IL_02f8: newobj System.Void System.Func`2<System.IO.FileInfo,System.String>::.ctor(System.Object,System.IntPtr)
IL_02fd: dup
IL_02fe: stsfld System.Func`2<System.IO.FileInfo,System.String> LongshipUpgrades.LongshipUpgrades/<>c::<>9__98_1
IL_0303: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::OrderBy<System.IO.FileInfo,System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_0308: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<System.IO.FileInfo>::GetEnumerator()
IL_030d: stloc.s V_12
IL_030f: br.s IL_0331
IL_0311: ldloc.s V_12
IL_0313: callvirt !0 System.Collections.Generic.IEnumerator`1<System.IO.FileInfo>::get_Current()
IL_0318: stloc.s V_13
IL_031a: ldstr "sails"
IL_031f: ldloc.s V_13
IL_0321: callvirt System.String System.IO.FileSystemInfo::get_Name()
IL_0326: call System.String System.IO.Path::Combine(System.String,System.String)
IL_032b: call System.Void LongshipUpgrades.LongshipCustomizableParts::AddCustomSail(System.String)
IL_0330: nop
IL_0331: ldloc.s V_12
IL_0333: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0338: brtrue.s IL_0311
IL_033a: leave.s IL_0349
IL_033c: ldloc.s V_12
IL_033e: brfalse.s IL_0348
IL_0340: ldloc.s V_12
IL_0342: callvirt System.Void System.IDisposable::Dispose()
IL_0347: nop
IL_0348: endfinally
IL_0349: nop
IL_034a: ldloc.s V_5
IL_034c: newobj System.Void System.IO.DirectoryInfo::.ctor(System.String)
IL_0351: call System.Collections.Generic.IEnumerable`1<System.IO.FileInfo> System.IO.DirectoryInfo::EnumerateFiles()
IL_0356: ldsfld System.Func`2<System.IO.FileInfo,System.String> LongshipUpgrades.LongshipUpgrades/<>c::<>9__98_2
IL_035b: dup
IL_035c: brtrue.s IL_0375
IL_035e: pop
IL_035f: ldsfld LongshipUpgrades.LongshipUpgrades/<>c LongshipUpgrades.LongshipUpgrades/<>c::<>9
IL_0364: ldftn System.String LongshipUpgrades.LongshipUpgrades/<>c::<LoadTextures>b__98_2(System.IO.FileInfo)
IL_036a: newobj System.Void System.Func`2<System.IO.FileInfo,System.String>::.ctor(System.Object,System.IntPtr)
IL_036f: dup
IL_0370: stsfld System.Func`2<System.IO.FileInfo,System.String> LongshipUpgrades.LongshipUpgrades/<>c::<>9__98_2
IL_0375: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::OrderBy<System.IO.FileInfo,System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_037a: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<System.IO.FileInfo>::GetEnumerator()
IL_037f: stloc.s V_14
IL_0381: br.s IL_03a3
IL_0383: ldloc.s V_14
IL_0385: callvirt !0 System.Collections.Generic.IEnumerator`1<System.IO.FileInfo>::get_Current()
IL_038a: stloc.s V_15
IL_038c: ldstr "shields"
IL_0391: ldloc.s V_15
IL_0393: callvirt System.String System.IO.FileSystemInfo::get_Name()
IL_0398: call System.String System.IO.Path::Combine(System.String,System.String)
IL_039d: call System.Void LongshipUpgrades.LongshipCustomizableParts::AddCustomShields(System.String)
IL_03a2: nop
IL_03a3: ldloc.s V_14
IL_03a5: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_03aa: brtrue.s IL_0383
IL_03ac: leave.s IL_03bb
IL_03ae: ldloc.s V_14
IL_03b0: brfalse.s IL_03ba
IL_03b2: ldloc.s V_14
IL_03b4: callvirt System.Void System.IDisposable::Dispose()
IL_03b9: nop
IL_03ba: endfinally
IL_03bb: ret
// EH Finally: 669 - 714 => 714 - 727
// EH Finally: 783 - 828 => 828 - 841
// EH Finally: 897 - 942 => 942 - 955

// System.Void LongshipUpgrades.LongshipUpgrades::LoadIcon(System.String,UnityEngine.Sprite&)
.locals UnityEngine.Texture2D, System.Boolean
IL_0000: nop
IL_0001: ldc.i4.2
IL_0002: ldc.i4.2
IL_0003: newobj System.Void UnityEngine.Texture2D::.ctor(System.Int32,System.Int32)
IL_0008: stloc.0
IL_0009: ldarg.0
IL_000a: ldloca.s V_0
IL_000c: call System.Boolean LongshipUpgrades.LongshipUpgrades::LoadTexture(System.String,UnityEngine.Texture2D&)
IL_0011: stloc.1
IL_0012: ldloc.1
IL_0013: brfalse.s IL_003f
IL_0015: ldarg.1
IL_0016: ldloc.0
IL_0017: ldc.r4 0
IL_001c: ldc.r4 0
IL_0021: ldloc.0
IL_0022: callvirt System.Int32 UnityEngine.Texture::get_width()
IL_0027: conv.r4
IL_0028: ldloc.0
IL_0029: callvirt System.Int32 UnityEngine.Texture::get_height()
IL_002e: conv.r4
IL_002f: newobj System.Void UnityEngine.Rect::.ctor(System.Single,System.Single,System.Single,System.Single)
IL_0034: call UnityEngine.Vector2 UnityEngine.Vector2::get_zero()
IL_0039: call UnityEngine.Sprite UnityEngine.Sprite::Create(UnityEngine.Texture2D,UnityEngine.Rect,UnityEngine.Vector2)
IL_003e: stind.ref
IL_003f: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades::LoadTextureFromConfigDirectory(System.String,UnityEngine.Texture2D&)
.locals System.String, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldsfld System.String LongshipUpgrades.LongshipUpgrades::configDirectory
IL_0006: ldarg.0
IL_0007: call System.String System.IO.Path::Combine(System.String,System.String)
IL_000c: stloc.0
IL_000d: ldloc.0
IL_000e: call System.Boolean System.IO.File::Exists(System.String)
IL_0013: ldc.i4.0
IL_0014: ceq
IL_0016: stloc.1
IL_0017: ldloc.1
IL_0018: brfalse.s IL_001e
IL_001a: ldc.i4.0
IL_001b: stloc.2
IL_001c: br.s IL_003f
IL_001e: ldstr "Loaded image from config folder: "
IL_0023: ldarg.0
IL_0024: call System.String System.String::Concat(System.String,System.String)
IL_0029: call System.Void LongshipUpgrades.LongshipUpgrades::LogInfo(System.Object)
IL_002e: nop
IL_002f: ldarg.1
IL_0030: ldind.ref
IL_0031: ldloc.0
IL_0032: call System.Byte[] System.IO.File::ReadAllBytes(System.String)
IL_0037: call System.Boolean UnityEngine.ImageConversion::LoadImage(UnityEngine.Texture2D,System.Byte[])
IL_003c: stloc.2
IL_003d: br.s IL_003f
IL_003f: ldloc.2
IL_0040: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades::LoadTexture(System.String,UnityEngine.Texture2D&)
.locals System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldarg.1
IL_0003: call System.Boolean LongshipUpgrades.LongshipUpgrades::LoadTextureFromConfigDirectory(System.String,UnityEngine.Texture2D&)
IL_0008: stloc.0
IL_0009: ldloc.0
IL_000a: brfalse.s IL_0010
IL_000c: ldc.i4.1
IL_000d: stloc.1
IL_000e: br.s IL_002f
IL_0010: ldarg.1
IL_0011: ldind.ref
IL_0012: ldarg.0
IL_0013: call System.String System.IO.Path::GetFileNameWithoutExtension(System.String)
IL_0018: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_001d: nop
IL_001e: ldarg.1
IL_001f: ldind.ref
IL_0020: ldarg.0
IL_0021: call System.Byte[] LongshipUpgrades.LongshipUpgrades::GetEmbeddedFileData(System.String)
IL_0026: ldc.i4.1
IL_0027: call System.Boolean UnityEngine.ImageConversion::LoadImage(UnityEngine.Texture2D,System.Byte[],System.Boolean)
IL_002c: stloc.1
IL_002d: br.s IL_002f
IL_002f: ldloc.1
IL_0030: ret

// System.Byte[] LongshipUpgrades.LongshipUpgrades::GetEmbeddedFileData(System.String)
.locals LongshipUpgrades.LongshipUpgrades/<>c__DisplayClass102_0, System.Reflection.Assembly, System.String, System.IO.Stream, System.Byte[], System.Byte[]
IL_0000: newobj System.Void LongshipUpgrades.LongshipUpgrades/<>c__DisplayClass102_0::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldarg.0
IL_0008: stfld System.String LongshipUpgrades.LongshipUpgrades/<>c__DisplayClass102_0::filename
IL_000d: nop
IL_000e: call System.Reflection.Assembly System.Reflection.Assembly::GetExecutingAssembly()
IL_0013: stloc.1
IL_0014: ldloc.1
IL_0015: callvirt System.String[] System.Reflection.Assembly::GetManifestResourceNames()
IL_001a: ldloc.0
IL_001b: ldftn System.Boolean LongshipUpgrades.LongshipUpgrades/<>c__DisplayClass102_0::<GetEmbeddedFileData>b__0(System.String)
IL_0021: newobj System.Void System.Func`2<System.String,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0026: call !!0 System.Linq.Enumerable::Single<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_002b: stloc.2
IL_002c: ldloc.1
IL_002d: ldloc.2
IL_002e: callvirt System.IO.Stream System.Reflection.Assembly::GetManifestResourceStream(System.String)
IL_0033: stloc.3
IL_0034: ldloc.3
IL_0035: callvirt System.Int64 System.IO.Stream::get_Length()
IL_003a: conv.ovf.i
IL_003b: newarr System.Byte
IL_0040: stloc.s V_4
IL_0042: ldloc.3
IL_0043: ldloc.s V_4
IL_0045: ldc.i4.0
IL_0046: ldloc.s V_4
IL_0048: ldlen
IL_0049: conv.i4
IL_004a: callvirt System.Int32 System.IO.Stream::Read(System.Byte[],System.Int32,System.Int32)
IL_004f: pop
IL_0050: ldloc.s V_4
IL_0052: stloc.s V_5
IL_0054: br.s IL_0056
IL_0056: ldloc.s V_5
IL_0058: ret

// Piece/Requirement[] LongshipUpgrades.LongshipUpgrades::ParseRequirements(System.String)
.locals System.Collections.Generic.List`1<Piece/Requirement>, System.String[], System.Int32, System.String, System.String[], System.Int32, System.String, UnityEngine.GameObject, ItemDrop, System.Boolean, System.Boolean, Piece/Requirement[]
IL_0000: nop
IL_0001: newobj System.Void System.Collections.Generic.List`1<Piece/Requirement>::.ctor()
IL_0006: stloc.0
IL_0007: nop
IL_0008: ldarg.0
IL_0009: ldc.i4.1
IL_000a: newarr System.Char
IL_000f: dup
IL_0010: ldc.i4.0
IL_0011: ldc.i4.s 44
IL_0013: stelem.i2
IL_0014: ldc.i4.1
IL_0015: callvirt System.String[] System.String::Split(System.Char[],System.StringSplitOptions)
IL_001a: stloc.1
IL_001b: ldc.i4.0
IL_001c: stloc.2
IL_001d: br IL_00d4
IL_0022: ldloc.1
IL_0023: ldloc.2
IL_0024: ldelem.ref
IL_0025: stloc.3
IL_0026: nop
IL_0027: ldloc.3
IL_0028: ldc.i4.1
IL_0029: newarr System.Char
IL_002e: dup
IL_002f: ldc.i4.0
IL_0030: ldc.i4.s 58
IL_0032: stelem.i2
IL_0033: ldc.i4.1
IL_0034: callvirt System.String[] System.String::Split(System.Char[],System.StringSplitOptions)
IL_0039: stloc.s V_4
IL_003b: ldloc.s V_4
IL_003d: ldlen
IL_003e: conv.i4
IL_003f: ldc.i4.2
IL_0040: bne.un.s IL_005e
IL_0042: ldloc.s V_4
IL_0044: ldc.i4.1
IL_0045: ldelem.ref
IL_0046: callvirt System.String System.String::Trim()
IL_004b: ldloca.s V_5
IL_004d: call System.Boolean System.Int32::TryParse(System.String,System.Int32&)
IL_0052: brfalse.s IL_005e
IL_0054: ldloc.s V_5
IL_0056: ldc.i4.0
IL_0057: cgt
IL_0059: ldc.i4.0
IL_005a: ceq
IL_005c: br.s IL_005f
IL_005e: ldc.i4.1
IL_005f: stloc.s V_9
IL_0061: ldloc.s V_9
IL_0063: brfalse.s IL_0067
IL_0065: br.s IL_00d0
IL_0067: ldloc.s V_4
IL_0069: ldc.i4.0
IL_006a: ldelem.ref
IL_006b: callvirt System.String System.String::Trim()
IL_0070: stloc.s V_6
IL_0072: ldloc.s V_6
IL_0074: ldloca.s V_7
IL_0076: call System.Boolean LongshipUpgrades.ItemNameTokens::TryGetItemPrefab(System.String,UnityEngine.GameObject&)
IL_007b: brfalse.s IL_008b
IL_007d: ldloc.s V_7
IL_007f: ldloca.s V_8
IL_0081: callvirt System.Boolean UnityEngine.GameObject::TryGetComponent<ItemDrop>(!!0&)
IL_0086: ldc.i4.0
IL_0087: ceq
IL_0089: br.s IL_008c
IL_008b: ldc.i4.1
IL_008c: stloc.s V_10
IL_008e: ldloc.s V_10
IL_0090: brfalse.s IL_00ac
IL_0092: nop
IL_0093: ldstr "Upgrade recipe item '"
IL_0098: ldloc.s V_6
IL_009a: ldstr "' was not found."
IL_009f: call System.String System.String::Concat(System.String,System.String,System.String)
IL_00a4: call System.Void LongshipUpgrades.LongshipUpgrades::LogWarning(System.Object)
IL_00a9: nop
IL_00aa: br.s IL_00d0
IL_00ac: ldloc.0
IL_00ad: newobj System.Void Piece/Requirement::.ctor()
IL_00b2: dup
IL_00b3: ldloc.s V_5
IL_00b5: stfld System.Int32 Piece/Requirement::m_amount
IL_00ba: dup
IL_00bb: ldloc.s V_8
IL_00bd: stfld ItemDrop Piece/Requirement::m_resItem
IL_00c2: dup
IL_00c3: ldc.i4.1
IL_00c4: stfld System.Boolean Piece/Requirement::m_recover
IL_00c9: callvirt System.Void System.Collections.Generic.List`1<Piece/Requirement>::Add(!0)
IL_00ce: nop
IL_00cf: nop
IL_00d0: ldloc.2
IL_00d1: ldc.i4.1
IL_00d2: add
IL_00d3: stloc.2
IL_00d4: ldloc.2
IL_00d5: ldloc.1
IL_00d6: ldlen
IL_00d7: conv.i4
IL_00d8: blt IL_0022
IL_00dd: ldloc.0
IL_00de: callvirt !0[] System.Collections.Generic.List`1<Piece/Requirement>::ToArray()
IL_00e3: stloc.s V_11
IL_00e5: br.s IL_00e7
IL_00e7: ldloc.s V_11
IL_00e9: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades::IsControlledComponent(UnityEngine.Component)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0007: callvirt UnityEngine.Transform UnityEngine.Transform::get_root()
IL_000c: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0011: call System.String Utils::GetPrefabName(UnityEngine.GameObject)
IL_0016: ldstr "VikingShip"
IL_001b: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0020: stloc.0
IL_0021: br.s IL_0023
IL_0023: ldloc.0
IL_0024: ret

// System.Int32 LongshipUpgrades.LongshipUpgrades::GetShipMapHash(System.Byte[])
.locals System.Boolean, System.Int32, System.Int32, System.Int32, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldnull
IL_0003: ceq
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: brfalse.s IL_000d
IL_0009: ldc.i4.0
IL_000a: stloc.1
IL_000b: br.s IL_0032
IL_000d: nop
IL_000e: ldc.i4.s 17
IL_0010: stloc.2
IL_0011: ldc.i4.0
IL_0012: stloc.3
IL_0013: br.s IL_0022
IL_0015: ldloc.2
IL_0016: ldc.i4.s 31
IL_0018: mul
IL_0019: ldarg.0
IL_001a: ldloc.3
IL_001b: ldelem.u1
IL_001c: add
IL_001d: stloc.2
IL_001e: ldloc.3
IL_001f: ldc.i4.1
IL_0020: add
IL_0021: stloc.3
IL_0022: ldloc.3
IL_0023: ldarg.0
IL_0024: ldlen
IL_0025: conv.i4
IL_0026: clt
IL_0028: stloc.s V_4
IL_002a: ldloc.s V_4
IL_002c: brtrue.s IL_0015
IL_002e: ldloc.2
IL_002f: stloc.1
IL_0030: br.s IL_0032
IL_0032: ldloc.1
IL_0033: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades::IsShipZdo(ZDO)
.locals 
IL_0000: ldarg.0
IL_0001: brfalse.s IL_0012
IL_0003: ldarg.0
IL_0004: callvirt System.Int32 ZDO::GetPrefab()
IL_0009: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::prefabInt
IL_000e: ceq
IL_0010: br.s IL_0013
IL_0012: ldc.i4.0
IL_0013: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades::IsShipZdo(ZDOID)
.locals 
IL_0000: call ZDOMan ZDOMan::get_instance()
IL_0005: brfalse.s IL_0019
IL_0007: call ZDOMan ZDOMan::get_instance()
IL_000c: ldarg.0
IL_000d: callvirt ZDO ZDOMan::GetZDO(ZDOID)
IL_0012: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsShipZdo(ZDO)
IL_0017: br.s IL_001a
IL_0019: ldc.i4.0
IL_001a: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades::IsValidMapTable(MapTable)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ZNetView MapTable::m_nview
IL_0006: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000b: brfalse.s IL_001a
IL_000d: ldarg.0
IL_000e: ldfld ZNetView MapTable::m_nview
IL_0013: callvirt System.Boolean ZNetView::IsValid()
IL_0018: br.s IL_001b
IL_001a: ldc.i4.0
IL_001b: ret

// System.Void LongshipUpgrades.LongshipUpgrades::RegisterShipMapRpcs()
.locals System.Boolean
IL_0000: nop
IL_0001: ldsfld System.Boolean LongshipUpgrades.LongshipUpgrades::s_shipMapRpcsRegistered
IL_0006: brtrue.s IL_0012
IL_0008: call ZRoutedRpc ZRoutedRpc::get_instance()
IL_000d: ldnull
IL_000e: ceq
IL_0010: br.s IL_0013
IL_0012: ldc.i4.1
IL_0013: stloc.0
IL_0014: ldloc.0
IL_0015: brfalse.s IL_0019
IL_0017: br.s IL_0073
IL_0019: call ZRoutedRpc ZRoutedRpc::get_instance()
IL_001e: ldstr "LU_RequestShipMapData"
IL_0023: ldnull
IL_0024: ldftn System.Void LongshipUpgrades.LongshipUpgrades::RPC_RequestShipMapData(System.Int64,ZPackage)
IL_002a: newobj System.Void System.Action`2<System.Int64,ZPackage>::.ctor(System.Object,System.IntPtr)
IL_002f: callvirt System.Void ZRoutedRpc::Register<ZPackage>(System.String,System.Action`2<System.Int64,!!0>)
IL_0034: nop
IL_0035: call ZRoutedRpc ZRoutedRpc::get_instance()
IL_003a: ldstr "LU_ShipMapDataResponse"
IL_003f: ldnull
IL_0040: ldftn System.Void LongshipUpgrades.LongshipUpgrades::RPC_ShipMapDataResponse(System.Int64,ZPackage)
IL_0046: newobj System.Void System.Action`2<System.Int64,ZPackage>::.ctor(System.Object,System.IntPtr)
IL_004b: callvirt System.Void ZRoutedRpc::Register<ZPackage>(System.String,System.Action`2<System.Int64,!!0>)
IL_0050: nop
IL_0051: call ZRoutedRpc ZRoutedRpc::get_instance()
IL_0056: ldstr "LU_SubmitShipMapData"
IL_005b: ldnull
IL_005c: ldftn System.Void LongshipUpgrades.LongshipUpgrades::RPC_SubmitShipMapData(System.Int64,ZPackage)
IL_0062: newobj System.Void System.Action`2<System.Int64,ZPackage>::.ctor(System.Object,System.IntPtr)
IL_0067: callvirt System.Void ZRoutedRpc::Register<ZPackage>(System.String,System.Action`2<System.Int64,!!0>)
IL_006c: nop
IL_006d: ldc.i4.1
IL_006e: stsfld System.Boolean LongshipUpgrades.LongshipUpgrades::s_shipMapRpcsRegistered
IL_0073: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades::TryGetShipMapData(ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry&)
.locals System.Boolean, System.Boolean
IL_0000: nop
IL_0001: call System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
IL_0006: brfalse.s IL_0026
IL_0008: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry> LongshipUpgrades.LongshipUpgrades::s_shipMapStore
IL_000d: ldarg.0
IL_000e: ldarg.1
IL_000f: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry>::TryGetValue(!0,!1&)
IL_0014: brfalse.s IL_0026
IL_0016: ldarg.1
IL_0017: ldind.ref
IL_0018: brfalse.s IL_0026
IL_001a: ldarg.1
IL_001b: ldind.ref
IL_001c: ldfld System.Byte[] LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Data
IL_0021: ldnull
IL_0022: cgt.un
IL_0024: br.s IL_0027
IL_0026: ldc.i4.0
IL_0027: stloc.0
IL_0028: ldloc.0
IL_0029: brfalse.s IL_003c
IL_002b: nop
IL_002c: ldarg.1
IL_002d: ldind.ref
IL_002e: call System.Single UnityEngine.Time::get_time()
IL_0033: stfld System.Single LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::LastAccessTime
IL_0038: ldc.i4.1
IL_0039: stloc.1
IL_003a: br.s IL_0043
IL_003c: ldarg.1
IL_003d: ldnull
IL_003e: stind.ref
IL_003f: ldc.i4.0
IL_0040: stloc.1
IL_0041: br.s IL_0043
IL_0043: ldloc.1
IL_0044: ret

// System.Int32 LongshipUpgrades.LongshipUpgrades::GetShipMapRevision(ZDOID)
.locals LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry, System.Int32
IL_0000: nop
IL_0001: call System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
IL_0006: brfalse.s IL_0017
IL_0008: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry> LongshipUpgrades.LongshipUpgrades::s_shipMapStore
IL_000d: ldarg.0
IL_000e: ldloca.s V_0
IL_0010: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry>::TryGetValue(!0,!1&)
IL_0015: brtrue.s IL_001a
IL_0017: ldc.i4.0
IL_0018: br.s IL_0020
IL_001a: ldloc.0
IL_001b: ldfld System.Int32 LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Revision
IL_0020: stloc.1
IL_0021: br.s IL_0023
IL_0023: ldloc.1
IL_0024: ret

// System.Int32 LongshipUpgrades.LongshipUpgrades::SyncShipMapRevision(ZDO,System.Nullable`1<System.Int32>)
.locals System.Int32, LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry, System.Boolean, System.Int32, System.Nullable`1<System.Int32>, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: call System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
IL_0006: brfalse.s IL_0013
IL_0008: ldarg.0
IL_0009: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsShipZdo(ZDO)
IL_000e: ldc.i4.0
IL_000f: ceq
IL_0011: br.s IL_0014
IL_0013: ldc.i4.1
IL_0014: stloc.2
IL_0015: ldloc.2
IL_0016: brfalse.s IL_001c
IL_0018: ldc.i4.0
IL_0019: stloc.3
IL_001a: br.s IL_0098
IL_001c: ldarg.1
IL_001d: stloc.s V_4
IL_001f: ldloca.s V_4
IL_0021: call System.Boolean System.Nullable`1<System.Int32>::get_HasValue()
IL_0026: brtrue.s IL_0046
IL_0028: ldarg.0
IL_0029: ldsfld System.Int32 LongshipUpgrades.LongshipUpgrades::s_shipMapDataRevision
IL_002e: ldc.i4.0
IL_002f: callvirt System.Int32 ZDO::GetInt(System.Int32,System.Int32)
IL_0034: ldarg.0
IL_0035: ldfld ZDOID ZDO::m_uid
IL_003a: call System.Int32 LongshipUpgrades.LongshipUpgrades::GetShipMapRevision(ZDOID)
IL_003f: call System.Int32 System.Math::Max(System.Int32,System.Int32)
IL_0044: br.s IL_004d
IL_0046: ldloca.s V_4
IL_0048: call !0 System.Nullable`1<System.Int32>::GetValueOrDefault()
IL_004d: stloc.0
IL_004e: ldloc.0
IL_004f: ldc.i4.0
IL_0050: cgt
IL_0052: ldc.i4.0
IL_0053: ceq
IL_0055: stloc.s V_5
IL_0057: ldloc.s V_5
IL_0059: brfalse.s IL_005d
IL_005b: ldc.i4.1
IL_005c: stloc.0
IL_005d: ldarg.0
IL_005e: ldsfld System.Int32 LongshipUpgrades.LongshipUpgrades::s_shipMapDataRevision
IL_0063: ldloc.0
IL_0064: call System.Void LongshipUpgrades.LongshipUpgrades::SetShipMapInt(ZDO,System.Int32,System.Int32)
IL_0069: nop
IL_006a: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry> LongshipUpgrades.LongshipUpgrades::s_shipMapStore
IL_006f: ldarg.0
IL_0070: ldfld ZDOID ZDO::m_uid
IL_0075: ldloca.s V_1
IL_0077: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry>::TryGetValue(!0,!1&)
IL_007c: stloc.s V_6
IL_007e: ldloc.s V_6
IL_0080: brfalse.s IL_0094
IL_0082: ldloc.1
IL_0083: ldloc.1
IL_0084: ldfld System.Int32 LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Revision
IL_0089: ldloc.0
IL_008a: call System.Int32 System.Math::Max(System.Int32,System.Int32)
IL_008f: stfld System.Int32 LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Revision
IL_0094: ldloc.0
IL_0095: stloc.3
IL_0096: br.s IL_0098
IL_0098: ldloc.3
IL_0099: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades::RemoveShipMapDataFromRuntime(ZDOID)
.locals System.Boolean
IL_0000: nop
IL_0001: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,System.Byte[]>> ZDOExtraData::s_byteArrays
IL_0006: ldarg.0
IL_0007: ldsfld System.Int32 ZDOVars::s_data
IL_000c: call System.Boolean LongshipUpgrades.LongshipUpgrades::RemoveDetachedZdoField<System.Byte[]>(System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,T>>,ZDOID,System.Int32)
IL_0011: stloc.0
IL_0012: br.s IL_0014
IL_0014: ldloc.0
IL_0015: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades::InjectShipMapDataIntoZdo(ZDO)
.locals LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: call System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
IL_0006: brfalse.s IL_0022
IL_0008: ldarg.0
IL_0009: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsShipZdo(ZDO)
IL_000e: brfalse.s IL_0022
IL_0010: ldarg.0
IL_0011: ldfld ZDOID ZDO::m_uid
IL_0016: ldloca.s V_0
IL_0018: call System.Boolean LongshipUpgrades.LongshipUpgrades::TryGetShipMapData(ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry&)
IL_001d: ldc.i4.0
IL_001e: ceq
IL_0020: br.s IL_0023
IL_0022: ldc.i4.1
IL_0023: stloc.1
IL_0024: ldloc.1
IL_0025: brfalse.s IL_002b
IL_0027: ldc.i4.0
IL_0028: stloc.2
IL_0029: br.s IL_0041
IL_002b: ldarg.0
IL_002c: ldfld ZDOID ZDO::m_uid
IL_0031: ldloc.0
IL_0032: ldfld System.Byte[] LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Data
IL_0037: call System.Void LongshipUpgrades.LongshipUpgrades::SetShipMapDataInRuntime(ZDOID,System.Byte[])
IL_003c: nop
IL_003d: ldc.i4.1
IL_003e: stloc.2
IL_003f: br.s IL_0041
IL_0041: ldloc.2
IL_0042: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades::ExtractShipMapDataFromZdo(ZDO,System.Boolean)
.locals System.Byte[], System.Int32, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Nullable`1<System.Int32>, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsShipZdo(ZDO)
IL_0007: ldc.i4.0
IL_0008: ceq
IL_000a: stloc.2
IL_000b: ldloc.2
IL_000c: brfalse.s IL_0012
IL_000e: ldc.i4.0
IL_000f: stloc.3
IL_0010: br.s IL_007d
IL_0012: call System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
IL_0017: ldc.i4.0
IL_0018: ceq
IL_001a: stloc.s V_4
IL_001c: ldloc.s V_4
IL_001e: brfalse.s IL_002c
IL_0020: nop
IL_0021: ldarg.0
IL_0022: call System.Boolean LongshipUpgrades.LongshipUpgrades::PurgeShipMapData(ZDO)
IL_0027: pop
IL_0028: ldc.i4.0
IL_0029: stloc.3
IL_002a: br.s IL_007d
IL_002c: ldarg.0
IL_002d: ldsfld System.Int32 ZDOVars::s_data
IL_0032: ldnull
IL_0033: callvirt System.Byte[] ZDO::GetByteArray(System.Int32,System.Byte[])
IL_0038: stloc.0
IL_0039: ldloc.0
IL_003a: ldnull
IL_003b: ceq
IL_003d: stloc.s V_5
IL_003f: ldloc.s V_5
IL_0041: brfalse.s IL_0047
IL_0043: ldc.i4.0
IL_0044: stloc.3
IL_0045: br.s IL_007d
IL_0047: ldarg.0
IL_0048: ldloca.s V_6
IL_004a: initobj System.Nullable`1<System.Int32>
IL_0050: ldloc.s V_6
IL_0052: call System.Int32 LongshipUpgrades.LongshipUpgrades::SyncShipMapRevision(ZDO,System.Nullable`1<System.Int32>)
IL_0057: stloc.1
IL_0058: ldarg.0
IL_0059: ldfld ZDOID ZDO::m_uid
IL_005e: ldloc.1
IL_005f: ldloc.0
IL_0060: call System.Boolean LongshipUpgrades.LongshipUpgrades::SetShipMapData(ZDOID,System.Int32,System.Byte[])
IL_0065: pop
IL_0066: ldarg.1
IL_0067: stloc.s V_7
IL_0069: ldloc.s V_7
IL_006b: brfalse.s IL_0079
IL_006d: ldarg.0
IL_006e: ldfld ZDOID ZDO::m_uid
IL_0073: call System.Boolean LongshipUpgrades.LongshipUpgrades::RemoveShipMapDataFromRuntime(ZDOID)
IL_0078: pop
IL_0079: ldc.i4.1
IL_007a: stloc.3
IL_007b: br.s IL_007d
IL_007d: ldloc.3
IL_007e: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades::SetShipMapData(ZDOID,System.Int32,System.Byte[])
.locals LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry, System.Byte[], System.Int32, LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: call System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
IL_0006: brfalse.s IL_0014
IL_0008: ldarg.2
IL_0009: brfalse.s IL_0014
IL_000b: ldarg.1
IL_000c: ldc.i4.0
IL_000d: cgt
IL_000f: ldc.i4.0
IL_0010: ceq
IL_0012: br.s IL_0015
IL_0014: ldc.i4.1
IL_0015: stloc.s V_4
IL_0017: ldloc.s V_4
IL_0019: brfalse.s IL_0023
IL_001b: ldc.i4.0
IL_001c: stloc.s V_5
IL_001e: br IL_0122
IL_0023: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry> LongshipUpgrades.LongshipUpgrades::s_shipMapStore
IL_0028: ldarg.0
IL_0029: ldloca.s V_0
IL_002b: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry>::TryGetValue(!0,!1&)
IL_0030: brfalse.s IL_003d
IL_0032: ldarg.1
IL_0033: ldloc.0
IL_0034: ldfld System.Int32 LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Revision
IL_0039: clt
IL_003b: br.s IL_003e
IL_003d: ldc.i4.0
IL_003e: stloc.s V_6
IL_0040: ldloc.s V_6
IL_0042: brfalse.s IL_004c
IL_0044: ldc.i4.0
IL_0045: stloc.s V_5
IL_0047: br IL_0122
IL_004c: ldarg.2
IL_004d: callvirt System.Object System.Array::Clone()
IL_0052: castclass System.Byte[]
IL_0057: stloc.1
IL_0058: ldloc.1
IL_0059: call System.Int32 LongshipUpgrades.LongshipUpgrades::GetShipMapHash(System.Byte[])
IL_005e: stloc.2
IL_005f: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry> LongshipUpgrades.LongshipUpgrades::s_shipMapStore
IL_0064: ldarg.0
IL_0065: ldloca.s V_3
IL_0067: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry>::TryGetValue(!0,!1&)
IL_006c: stloc.s V_7
IL_006e: ldloc.s V_7
IL_0070: brfalse.s IL_00ec
IL_0072: nop
IL_0073: ldarg.1
IL_0074: ldloc.3
IL_0075: ldfld System.Int32 LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Revision
IL_007a: clt
IL_007c: stloc.s V_8
IL_007e: ldloc.s V_8
IL_0080: brfalse.s IL_008a
IL_0082: ldc.i4.0
IL_0083: stloc.s V_5
IL_0085: br IL_0122
IL_008a: ldarg.1
IL_008b: ldloc.3
IL_008c: ldfld System.Int32 LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Revision
IL_0091: bne.un.s IL_00af
IL_0093: ldloc.3
IL_0094: ldfld System.Int32 LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Hash
IL_0099: ldloc.2
IL_009a: bne.un.s IL_00af
IL_009c: call System.Collections.IEqualityComparer System.Collections.StructuralComparisons::get_StructuralEqualityComparer()
IL_00a1: ldloc.3
IL_00a2: ldfld System.Byte[] LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Data
IL_00a7: ldloc.1
IL_00a8: callvirt System.Boolean System.Collections.IEqualityComparer::Equals(System.Object,System.Object)
IL_00ad: br.s IL_00b0
IL_00af: ldc.i4.0
IL_00b0: stloc.s V_9
IL_00b2: ldloc.s V_9
IL_00b4: brfalse.s IL_00c7
IL_00b6: nop
IL_00b7: ldloc.3
IL_00b8: call System.Single UnityEngine.Time::get_time()
IL_00bd: stfld System.Single LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::LastAccessTime
IL_00c2: ldc.i4.0
IL_00c3: stloc.s V_5
IL_00c5: br.s IL_0122
IL_00c7: ldloc.3
IL_00c8: ldarg.1
IL_00c9: stfld System.Int32 LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Revision
IL_00ce: ldloc.3
IL_00cf: ldloc.1
IL_00d0: stfld System.Byte[] LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Data
IL_00d5: ldloc.3
IL_00d6: ldloc.2
IL_00d7: stfld System.Int32 LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Hash
IL_00dc: ldloc.3
IL_00dd: call System.Single UnityEngine.Time::get_time()
IL_00e2: stfld System.Single LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::LastAccessTime
IL_00e7: ldc.i4.1
IL_00e8: stloc.s V_5
IL_00ea: br.s IL_0122
IL_00ec: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry> LongshipUpgrades.LongshipUpgrades::s_shipMapStore
IL_00f1: ldarg.0
IL_00f2: newobj System.Void LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::.ctor()
IL_00f7: dup
IL_00f8: ldarg.1
IL_00f9: stfld System.Int32 LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Revision
IL_00fe: dup
IL_00ff: ldloc.1
IL_0100: stfld System.Byte[] LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Data
IL_0105: dup
IL_0106: ldloc.2
IL_0107: stfld System.Int32 LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Hash
IL_010c: dup
IL_010d: call System.Single UnityEngine.Time::get_time()
IL_0112: stfld System.Single LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::LastAccessTime
IL_0117: callvirt System.Void System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry>::set_Item(!0,!1)
IL_011c: nop
IL_011d: ldc.i4.1
IL_011e: stloc.s V_5
IL_0120: br.s IL_0122
IL_0122: ldloc.s V_5
IL_0124: ret

// System.Void LongshipUpgrades.LongshipUpgrades::RemoveShipMapData(ZDOID)
.locals 
IL_0000: nop
IL_0001: ldsfld System.Collections.Generic.HashSet`1<ZDOID> LongshipUpgrades.LongshipUpgrades::s_trackedShipZdos
IL_0006: ldarg.0
IL_0007: callvirt System.Boolean System.Collections.Generic.HashSet`1<ZDOID>::Remove(!0)
IL_000c: pop
IL_000d: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry> LongshipUpgrades.LongshipUpgrades::s_shipMapStore
IL_0012: ldarg.0
IL_0013: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry>::Remove(!0)
IL_0018: pop
IL_0019: ldarg.0
IL_001a: call System.Boolean LongshipUpgrades.LongshipUpgrades::RemoveShipMapDataFromRuntime(ZDOID)
IL_001f: pop
IL_0020: ret

// System.Void LongshipUpgrades.LongshipUpgrades::ClearShipMapRuntime()
.locals 
IL_0000: nop
IL_0001: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry> LongshipUpgrades.LongshipUpgrades::s_shipMapStore
IL_0006: callvirt System.Void System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry>::Clear()
IL_000b: nop
IL_000c: ldsfld System.Collections.Generic.HashSet`1<ZDOID> LongshipUpgrades.LongshipUpgrades::s_trackedShipZdos
IL_0011: callvirt System.Void System.Collections.Generic.HashSet`1<ZDOID>::Clear()
IL_0016: nop
IL_0017: call System.Void LongshipUpgrades.LongshipUpgrades::RequestShipMapConfigurationUpdate()
IL_001c: nop
IL_001d: ldc.i4.0
IL_001e: stsfld System.Boolean LongshipUpgrades.LongshipUpgrades::s_shipMapRpcsRegistered
IL_0023: ldc.r4 0
IL_0028: stsfld System.Single LongshipUpgrades.LongshipUpgrades::s_nextClientShipMapPruneTime
IL_002d: ret

// System.Void LongshipUpgrades.LongshipUpgrades::TrackShipZdo(ZDO,System.Boolean)
.locals System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsShipZdo(ZDO)
IL_0007: ldc.i4.0
IL_0008: ceq
IL_000a: stloc.0
IL_000b: ldloc.0
IL_000c: brfalse.s IL_0010
IL_000e: br.s IL_002e
IL_0010: ldsfld System.Collections.Generic.HashSet`1<ZDOID> LongshipUpgrades.LongshipUpgrades::s_trackedShipZdos
IL_0015: ldarg.0
IL_0016: ldfld ZDOID ZDO::m_uid
IL_001b: callvirt System.Boolean System.Collections.Generic.HashSet`1<ZDOID>::Add(!0)
IL_0020: pop
IL_0021: ldarg.1
IL_0022: stloc.1
IL_0023: ldloc.1
IL_0024: brfalse.s IL_002e
IL_0026: ldarg.0
IL_0027: ldc.i4.1
IL_0028: call System.Boolean LongshipUpgrades.LongshipUpgrades::ExtractShipMapDataFromZdo(ZDO,System.Boolean)
IL_002d: pop
IL_002e: ret

// System.Void LongshipUpgrades.LongshipUpgrades::RebuildTrackedShipZdos(System.Collections.Generic.IEnumerable`1<ZDO>)
.locals System.Collections.Generic.IEnumerator`1<ZDO>, ZDO, System.Boolean
IL_0000: nop
IL_0001: ldsfld System.Collections.Generic.HashSet`1<ZDOID> LongshipUpgrades.LongshipUpgrades::s_trackedShipZdos
IL_0006: callvirt System.Void System.Collections.Generic.HashSet`1<ZDOID>::Clear()
IL_000b: nop
IL_000c: nop
IL_000d: ldarg.0
IL_000e: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<ZDO>::GetEnumerator()
IL_0013: stloc.0
IL_0014: br.s IL_0025
IL_0016: ldloc.0
IL_0017: callvirt !0 System.Collections.Generic.IEnumerator`1<ZDO>::get_Current()
IL_001c: stloc.1
IL_001d: ldloc.1
IL_001e: ldc.i4.1
IL_001f: call System.Void LongshipUpgrades.LongshipUpgrades::TrackShipZdo(ZDO,System.Boolean)
IL_0024: nop
IL_0025: ldloc.0
IL_0026: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_002b: brtrue.s IL_0016
IL_002d: leave.s IL_003a
IL_002f: ldloc.0
IL_0030: brfalse.s IL_0039
IL_0032: ldloc.0
IL_0033: callvirt System.Void System.IDisposable::Dispose()
IL_0038: nop
IL_0039: endfinally
IL_003a: call System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
IL_003f: ldc.i4.0
IL_0040: ceq
IL_0042: stloc.2
IL_0043: ldloc.2
IL_0044: brfalse.s IL_0051
IL_0046: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry> LongshipUpgrades.LongshipUpgrades::s_shipMapStore
IL_004b: callvirt System.Void System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry>::Clear()
IL_0050: nop
IL_0051: call System.Void LongshipUpgrades.LongshipUpgrades::RequestShipMapConfigurationUpdate()
IL_0056: nop
IL_0057: ret
// EH Finally: 20 - 47 => 47 - 58

// System.Boolean LongshipUpgrades.LongshipUpgrades::RequestShipMapDataFromServer(ZDO,System.Int32)
.locals ZPackage, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: call System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
IL_0006: brfalse.s IL_003c
IL_0008: ldarg.0
IL_0009: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsShipZdo(ZDO)
IL_000e: brfalse.s IL_003c
IL_0010: ldarg.0
IL_0011: callvirt System.Boolean ZDO::IsValid()
IL_0016: brfalse.s IL_003c
IL_0018: ldarg.1
IL_0019: ldc.i4.0
IL_001a: ble.s IL_003c
IL_001c: call ZRoutedRpc ZRoutedRpc::get_instance()
IL_0021: brfalse.s IL_003c
IL_0023: call ZNet ZNet::get_instance()
IL_0028: ldnull
IL_0029: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_002e: brtrue.s IL_003c
IL_0030: call ZNet ZNet::get_instance()
IL_0035: callvirt System.Boolean ZNet::IsServer()
IL_003a: br.s IL_003d
IL_003c: ldc.i4.1
IL_003d: stloc.1
IL_003e: ldloc.1
IL_003f: brfalse.s IL_0045
IL_0041: ldc.i4.0
IL_0042: stloc.2
IL_0043: br.s IL_008f
IL_0045: newobj System.Void ZPackage::.ctor()
IL_004a: stloc.0
IL_004b: ldloc.0
IL_004c: ldarg.0
IL_004d: ldfld ZDOID ZDO::m_uid
IL_0052: callvirt System.Void ZPackage::Write(ZDOID)
IL_0057: nop
IL_0058: ldloc.0
IL_0059: ldarg.1
IL_005a: callvirt System.Void ZPackage::Write(System.Int32)
IL_005f: nop
IL_0060: call ZRoutedRpc ZRoutedRpc::get_instance()
IL_0065: ldstr "LU_RequestShipMapData"
IL_006a: ldc.i4.1
IL_006b: newarr System.Object
IL_0070: dup
IL_0071: ldc.i4.0
IL_0072: ldloc.0
IL_0073: stelem.ref
IL_0074: callvirt System.Void ZRoutedRpc::InvokeRoutedRPC(System.String,System.Object[])
IL_0079: nop
IL_007a: ldstr "Ship map data requested for {0}"
IL_007f: ldarg.0
IL_0080: call System.String System.String::Format(System.String,System.Object)
IL_0085: call System.Void LongshipUpgrades.LongshipUpgrades::LogInfo(System.Object)
IL_008a: nop
IL_008b: ldc.i4.1
IL_008c: stloc.2
IL_008d: br.s IL_008f
IL_008f: ldloc.2
IL_0090: ret

// System.Void LongshipUpgrades.LongshipUpgrades::SubmitShipMapDataToServer(ZDO,System.Int32,System.Byte[])
.locals ZPackage, System.Boolean
IL_0000: nop
IL_0001: call System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
IL_0006: brfalse.s IL_003a
IL_0008: ldarg.0
IL_0009: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsShipZdo(ZDO)
IL_000e: brfalse.s IL_003a
IL_0010: ldarg.1
IL_0011: ldc.i4.0
IL_0012: ble.s IL_003a
IL_0014: ldarg.2
IL_0015: brfalse.s IL_003a
IL_0017: call ZRoutedRpc ZRoutedRpc::get_instance()
IL_001c: brfalse.s IL_003a
IL_001e: call ZNet ZNet::get_instance()
IL_0023: ldnull
IL_0024: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0029: brfalse.s IL_0037
IL_002b: call ZNet ZNet::get_instance()
IL_0030: callvirt System.Boolean ZNet::IsServer()
IL_0035: br.s IL_0038
IL_0037: ldc.i4.0
IL_0038: br.s IL_003b
IL_003a: ldc.i4.1
IL_003b: stloc.1
IL_003c: ldloc.1
IL_003d: brfalse.s IL_0041
IL_003f: br.s IL_008f
IL_0041: newobj System.Void ZPackage::.ctor()
IL_0046: stloc.0
IL_0047: ldloc.0
IL_0048: ldarg.0
IL_0049: ldfld ZDOID ZDO::m_uid
IL_004e: callvirt System.Void ZPackage::Write(ZDOID)
IL_0053: nop
IL_0054: ldloc.0
IL_0055: ldarg.1
IL_0056: callvirt System.Void ZPackage::Write(System.Int32)
IL_005b: nop
IL_005c: ldloc.0
IL_005d: ldarg.2
IL_005e: callvirt System.Void ZPackage::Write(System.Byte[])
IL_0063: nop
IL_0064: call ZRoutedRpc ZRoutedRpc::get_instance()
IL_0069: ldstr "LU_SubmitShipMapData"
IL_006e: ldc.i4.1
IL_006f: newarr System.Object
IL_0074: dup
IL_0075: ldc.i4.0
IL_0076: ldloc.0
IL_0077: stelem.ref
IL_0078: callvirt System.Void ZRoutedRpc::InvokeRoutedRPC(System.String,System.Object[])
IL_007d: nop
IL_007e: ldstr "Ship map data submitted to server for {0}"
IL_0083: ldarg.0
IL_0084: call System.String System.String::Format(System.String,System.Object)
IL_0089: call System.Void LongshipUpgrades.LongshipUpgrades::LogInfo(System.Object)
IL_008e: nop
IL_008f: ret

// System.Void LongshipUpgrades.LongshipUpgrades::PruneClientShipMapStore()
.locals System.Boolean, System.Boolean, System.Collections.Generic.List`1/Enumerator<ZDOID>, ZDOID, System.Boolean
IL_0000: nop
IL_0001: call ZNet ZNet::get_instance()
IL_0006: ldnull
IL_0007: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_000c: brtrue.s IL_0024
IL_000e: call ZNet ZNet::get_instance()
IL_0013: callvirt System.Boolean ZNet::IsServer()
IL_0018: brtrue.s IL_0024
IL_001a: call ZDOMan ZDOMan::get_instance()
IL_001f: ldnull
IL_0020: ceq
IL_0022: br.s IL_0025
IL_0024: ldc.i4.1
IL_0025: stloc.0
IL_0026: ldloc.0
IL_0027: brfalse.s IL_002b
IL_0029: br.s IL_00a4
IL_002b: call System.Single UnityEngine.Time::get_time()
IL_0030: ldsfld System.Single LongshipUpgrades.LongshipUpgrades::s_nextClientShipMapPruneTime
IL_0035: clt
IL_0037: stloc.1
IL_0038: ldloc.1
IL_0039: brfalse.s IL_003d
IL_003b: br.s IL_00a4
IL_003d: call System.Single UnityEngine.Time::get_time()
IL_0042: ldc.r4 10
IL_0047: add
IL_0048: stsfld System.Single LongshipUpgrades.LongshipUpgrades::s_nextClientShipMapPruneTime
IL_004d: nop
IL_004e: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry> LongshipUpgrades.LongshipUpgrades::s_shipMapStore
IL_0053: callvirt System.Collections.Generic.Dictionary`2/KeyCollection<!0,!1> System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry>::get_Keys()
IL_0058: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<ZDOID>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_005d: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<ZDOID>::GetEnumerator()
IL_0062: stloc.2
IL_0063: br.s IL_008a
IL_0065: ldloca.s V_2
IL_0067: call !0 System.Collections.Generic.List`1/Enumerator<ZDOID>::get_Current()
IL_006c: stloc.3
IL_006d: nop
IL_006e: call ZDOMan ZDOMan::get_instance()
IL_0073: ldloc.3
IL_0074: callvirt ZDO ZDOMan::GetZDO(ZDOID)
IL_0079: ldnull
IL_007a: ceq
IL_007c: stloc.s V_4
IL_007e: ldloc.s V_4
IL_0080: brfalse.s IL_0089
IL_0082: ldloc.3
IL_0083: call System.Void LongshipUpgrades.LongshipUpgrades::RemoveShipMapData(ZDOID)
IL_0088: nop
IL_0089: nop
IL_008a: ldloca.s V_2
IL_008c: call System.Boolean System.Collections.Generic.List`1/Enumerator<ZDOID>::MoveNext()
IL_0091: brtrue.s IL_0065
IL_0093: leave.s IL_00a4
IL_0095: ldloca.s V_2
IL_0097: constrained. System.Collections.Generic.List`1/Enumerator<ZDOID>
IL_009d: callvirt System.Void System.IDisposable::Dispose()
IL_00a2: nop
IL_00a3: endfinally
IL_00a4: ret
// EH Finally: 99 - 149 => 149 - 164

// System.Void LongshipUpgrades.LongshipUpgrades::RPC_RequestShipMapData(System.Int64,ZPackage)
.locals ZDOID, System.Int32, LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry, ZPackage, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: call System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
IL_0006: brfalse.s IL_0027
IL_0008: call ZNet ZNet::get_instance()
IL_000d: ldnull
IL_000e: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0013: brtrue.s IL_0027
IL_0015: call ZNet ZNet::get_instance()
IL_001a: callvirt System.Boolean ZNet::IsServer()
IL_001f: brfalse.s IL_0027
IL_0021: ldarg.1
IL_0022: ldnull
IL_0023: ceq
IL_0025: br.s IL_0028
IL_0027: ldc.i4.1
IL_0028: stloc.s V_4
IL_002a: ldloc.s V_4
IL_002c: brfalse.s IL_0033
IL_002e: br IL_00ca
IL_0033: ldarg.1
IL_0034: callvirt ZDOID ZPackage::ReadZDOID()
IL_0039: stloc.0
IL_003a: ldarg.1
IL_003b: callvirt System.Int32 ZPackage::ReadInt()
IL_0040: stloc.1
IL_0041: ldloc.0
IL_0042: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsShipZdo(ZDOID)
IL_0047: brfalse.s IL_0062
IL_0049: ldloc.1
IL_004a: ldc.i4.0
IL_004b: ble.s IL_0062
IL_004d: ldloc.0
IL_004e: ldloca.s V_2
IL_0050: call System.Boolean LongshipUpgrades.LongshipUpgrades::TryGetShipMapData(ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry&)
IL_0055: brfalse.s IL_0062
IL_0057: ldloc.2
IL_0058: ldfld System.Int32 LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Revision
IL_005d: ldloc.1
IL_005e: clt
IL_0060: br.s IL_0063
IL_0062: ldc.i4.1
IL_0063: stloc.s V_5
IL_0065: ldloc.s V_5
IL_0067: brfalse.s IL_006b
IL_0069: br.s IL_00ca
IL_006b: newobj System.Void ZPackage::.ctor()
IL_0070: stloc.3
IL_0071: ldloc.3
IL_0072: ldloc.0
IL_0073: callvirt System.Void ZPackage::Write(ZDOID)
IL_0078: nop
IL_0079: ldloc.3
IL_007a: ldloc.2
IL_007b: ldfld System.Int32 LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Revision
IL_0080: callvirt System.Void ZPackage::Write(System.Int32)
IL_0085: nop
IL_0086: ldloc.3
IL_0087: ldloc.2
IL_0088: ldfld System.Byte[] LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Data
IL_008d: callvirt System.Void ZPackage::Write(System.Byte[])
IL_0092: nop
IL_0093: call ZRoutedRpc ZRoutedRpc::get_instance()
IL_0098: ldarg.0
IL_0099: ldstr "LU_ShipMapDataResponse"
IL_009e: ldc.i4.1
IL_009f: newarr System.Object
IL_00a4: dup
IL_00a5: ldc.i4.0
IL_00a6: ldloc.3
IL_00a7: stelem.ref
IL_00a8: callvirt System.Void ZRoutedRpc::InvokeRoutedRPC(System.Int64,System.String,System.Object[])
IL_00ad: nop
IL_00ae: ldstr "Ship map data for {0} sent to {1}"
IL_00b3: ldloc.0
IL_00b4: box ZDOID
IL_00b9: ldarg.0
IL_00ba: box System.Int64
IL_00bf: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_00c4: call System.Void LongshipUpgrades.LongshipUpgrades::LogInfo(System.Object)
IL_00c9: nop
IL_00ca: ret

// System.Void LongshipUpgrades.LongshipUpgrades::RPC_ShipMapDataResponse(System.Int64,ZPackage)
.locals ZDOID, System.Int32, ZDO, System.Byte[], System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: call System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
IL_0006: brfalse.s IL_0027
IL_0008: call ZNet ZNet::get_instance()
IL_000d: ldnull
IL_000e: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0013: brtrue.s IL_0027
IL_0015: call ZNet ZNet::get_instance()
IL_001a: callvirt System.Boolean ZNet::IsServer()
IL_001f: brtrue.s IL_0027
IL_0021: ldarg.1
IL_0022: ldnull
IL_0023: ceq
IL_0025: br.s IL_0028
IL_0027: ldc.i4.1
IL_0028: stloc.s V_4
IL_002a: ldloc.s V_4
IL_002c: brfalse.s IL_0033
IL_002e: br IL_00b9
IL_0033: ldarg.1
IL_0034: callvirt ZDOID ZPackage::ReadZDOID()
IL_0039: stloc.0
IL_003a: ldarg.1
IL_003b: callvirt System.Int32 ZPackage::ReadInt()
IL_0040: stloc.1
IL_0041: call ZDOMan ZDOMan::get_instance()
IL_0046: dup
IL_0047: brtrue.s IL_004d
IL_0049: pop
IL_004a: ldnull
IL_004b: br.s IL_0053
IL_004d: ldloc.0
IL_004e: call ZDO ZDOMan::GetZDO(ZDOID)
IL_0053: stloc.2
IL_0054: ldloc.2
IL_0055: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsShipZdo(ZDO)
IL_005a: brfalse.s IL_0078
IL_005c: ldloc.2
IL_005d: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_mapDataCompressed
IL_0062: ldc.i4.0
IL_0063: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_0068: brfalse.s IL_0078
IL_006a: ldloc.1
IL_006b: ldloc.0
IL_006c: call System.Int32 LongshipUpgrades.LongshipUpgrades::GetShipMapRevision(ZDOID)
IL_0071: cgt
IL_0073: ldc.i4.0
IL_0074: ceq
IL_0076: br.s IL_0079
IL_0078: ldc.i4.1
IL_0079: stloc.s V_5
IL_007b: ldloc.s V_5
IL_007d: brfalse.s IL_0081
IL_007f: br.s IL_00b9
IL_0081: ldarg.1
IL_0082: callvirt System.Byte[] ZPackage::ReadByteArray()
IL_0087: stloc.3
IL_0088: ldloc.3
IL_0089: ldnull
IL_008a: ceq
IL_008c: stloc.s V_6
IL_008e: ldloc.s V_6
IL_0090: brfalse.s IL_0094
IL_0092: br.s IL_00b9
IL_0094: ldloc.0
IL_0095: ldloc.1
IL_0096: ldloc.3
IL_0097: call System.Boolean LongshipUpgrades.LongshipUpgrades::SetShipMapData(ZDOID,System.Int32,System.Byte[])
IL_009c: pop
IL_009d: ldstr "Ship map data response for {0} from {1}"
IL_00a2: ldloc.0
IL_00a3: box ZDOID
IL_00a8: ldarg.0
IL_00a9: box System.Int64
IL_00ae: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_00b3: call System.Void LongshipUpgrades.LongshipUpgrades::LogInfo(System.Object)
IL_00b8: nop
IL_00b9: ret

// System.Void LongshipUpgrades.LongshipUpgrades::RPC_SubmitShipMapData(System.Int64,ZPackage)
.locals ZDOID, System.Int32, ZDO, System.Byte[], System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: call System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
IL_0006: brfalse.s IL_0027
IL_0008: call ZNet ZNet::get_instance()
IL_000d: ldnull
IL_000e: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0013: brtrue.s IL_0027
IL_0015: call ZNet ZNet::get_instance()
IL_001a: callvirt System.Boolean ZNet::IsServer()
IL_001f: brfalse.s IL_0027
IL_0021: ldarg.1
IL_0022: ldnull
IL_0023: ceq
IL_0025: br.s IL_0028
IL_0027: ldc.i4.1
IL_0028: stloc.s V_4
IL_002a: ldloc.s V_4
IL_002c: brfalse.s IL_0033
IL_002e: br IL_00ec
IL_0033: ldarg.1
IL_0034: callvirt ZDOID ZPackage::ReadZDOID()
IL_0039: stloc.0
IL_003a: ldarg.1
IL_003b: callvirt System.Int32 ZPackage::ReadInt()
IL_0040: stloc.1
IL_0041: call ZDOMan ZDOMan::get_instance()
IL_0046: dup
IL_0047: brtrue.s IL_004d
IL_0049: pop
IL_004a: ldnull
IL_004b: br.s IL_0053
IL_004d: ldloc.0
IL_004e: call ZDO ZDOMan::GetZDO(ZDOID)
IL_0053: stloc.2
IL_0054: ldloc.2
IL_0055: brfalse.s IL_005f
IL_0057: ldloc.2
IL_0058: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsShipZdo(ZDO)
IL_005d: brfalse.s IL_006e
IL_005f: ldloc.1
IL_0060: ldc.i4.0
IL_0061: ble.s IL_006e
IL_0063: ldloc.1
IL_0064: ldloc.0
IL_0065: call System.Int32 LongshipUpgrades.LongshipUpgrades::GetShipMapRevision(ZDOID)
IL_006a: clt
IL_006c: br.s IL_006f
IL_006e: ldc.i4.1
IL_006f: stloc.s V_5
IL_0071: ldloc.s V_5
IL_0073: brfalse.s IL_0077
IL_0075: br.s IL_00ec
IL_0077: ldarg.1
IL_0078: callvirt System.Byte[] ZPackage::ReadByteArray()
IL_007d: stloc.3
IL_007e: ldloc.3
IL_007f: brfalse.s IL_008e
IL_0081: ldloc.0
IL_0082: ldloc.1
IL_0083: ldloc.3
IL_0084: call System.Boolean LongshipUpgrades.LongshipUpgrades::SetShipMapData(ZDOID,System.Int32,System.Byte[])
IL_0089: ldc.i4.0
IL_008a: ceq
IL_008c: br.s IL_008f
IL_008e: ldc.i4.1
IL_008f: stloc.s V_6
IL_0091: ldloc.s V_6
IL_0093: brfalse.s IL_0097
IL_0095: br.s IL_00ec
IL_0097: ldloc.2
IL_0098: ldnull
IL_0099: cgt.un
IL_009b: stloc.s V_7
IL_009d: ldloc.s V_7
IL_009f: brfalse.s IL_00d0
IL_00a1: nop
IL_00a2: ldloc.2
IL_00a3: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_mapDataCompressed
IL_00a8: ldc.i4.1
IL_00a9: call System.Void LongshipUpgrades.LongshipUpgrades::SetShipMapInt(ZDO,System.Int32,System.Int32)
IL_00ae: nop
IL_00af: ldloc.2
IL_00b0: ldloc.1
IL_00b1: newobj System.Void System.Nullable`1<System.Int32>::.ctor(!0)
IL_00b6: call System.Int32 LongshipUpgrades.LongshipUpgrades::SyncShipMapRevision(ZDO,System.Nullable`1<System.Int32>)
IL_00bb: pop
IL_00bc: call ZDOMan ZDOMan::get_instance()
IL_00c1: ldloc.2
IL_00c2: callvirt System.Void ZDOMan::SetDirtySector(ZDO)
IL_00c7: nop
IL_00c8: ldloc.0
IL_00c9: call System.Boolean LongshipUpgrades.LongshipUpgrades::RemoveShipMapDataFromRuntime(ZDOID)
IL_00ce: pop
IL_00cf: nop
IL_00d0: ldstr "Ship map data for {0} submitted from {1}"
IL_00d5: ldloc.0
IL_00d6: box ZDOID
IL_00db: ldarg.0
IL_00dc: box System.Int64
IL_00e1: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_00e6: call System.Void LongshipUpgrades.LongshipUpgrades::LogInfo(System.Object)
IL_00eb: nop
IL_00ec: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades::IsBoxLadder(Ladder)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.String Ladder::m_name
IL_0006: ldstr "$lu_box_name"
IL_000b: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0010: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades::IsShipMapTable(MapTable)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: callvirt System.String UnityEngine.Object::get_name()
IL_0007: ldstr "maptable"
IL_000c: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0011: brfalse.s IL_001b
IL_0013: ldarg.0
IL_0014: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsControlledComponent(UnityEngine.Component)
IL_0019: br.s IL_001c
IL_001b: ldc.i4.0
IL_001c: stloc.0
IL_001d: br.s IL_001f
IL_001f: ldloc.0
IL_0020: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades::IsCompressedMapDataContext()
.locals System.Boolean
IL_0000: nop
IL_0001: ldsfld System.Collections.Generic.Stack`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::s_mapTableDataCompressionFlags
IL_0006: callvirt System.Int32 System.Collections.Generic.Stack`1<System.Boolean>::get_Count()
IL_000b: ldc.i4.0
IL_000c: ble.s IL_001a
IL_000e: ldsfld System.Collections.Generic.Stack`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::s_mapTableDataCompressionFlags
IL_0013: callvirt !0 System.Collections.Generic.Stack`1<System.Boolean>::Peek()
IL_0018: br.s IL_001b
IL_001a: ldc.i4.0
IL_001b: stloc.0
IL_001c: br.s IL_001e
IL_001e: ldloc.0
IL_001f: ret

// System.Void LongshipUpgrades.LongshipUpgrades::FixMeshRendererProperties(UnityEngine.MeshRenderer)
.locals UnityEngine.MeshFilter, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldarg.0
IL_0003: callvirt UnityEngine.Material UnityEngine.Renderer::get_sharedMaterial()
IL_0008: call UnityEngine.Material LongshipUpgrades.LongshipUpgrades::DeepCopyMaterial(UnityEngine.Material)
IL_000d: callvirt System.Void UnityEngine.Renderer::set_sharedMaterial(UnityEngine.Material)
IL_0012: nop
IL_0013: ldarg.0
IL_0014: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.MeshFilter>()
IL_0019: stloc.0
IL_001a: ldloc.0
IL_001b: ldnull
IL_001c: cgt.un
IL_001e: stloc.1
IL_001f: ldloc.1
IL_0020: brfalse.s IL_0029
IL_0022: ldloc.0
IL_0023: call System.Void LongshipUpgrades.LongshipUpgrades::FixSharedMesh(UnityEngine.MeshFilter)
IL_0028: nop
IL_0029: ret

// UnityEngine.Texture2D LongshipUpgrades.LongshipUpgrades::CopyTexture(UnityEngine.Texture2D)
.locals UnityEngine.Texture2D, UnityEngine.RenderTexture, System.Boolean, UnityEngine.Texture2D
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0008: stloc.2
IL_0009: ldloc.2
IL_000a: brfalse.s IL_0013
IL_000c: ldnull
IL_000d: stloc.3
IL_000e: br IL_00a8
IL_0013: ldarg.0
IL_0014: callvirt System.Int32 UnityEngine.Texture::get_width()
IL_0019: ldarg.0
IL_001a: callvirt System.Int32 UnityEngine.Texture::get_height()
IL_001f: ldc.i4.4
IL_0020: ldarg.0
IL_0021: callvirt System.Int32 UnityEngine.Texture::get_mipmapCount()
IL_0026: ldc.i4.1
IL_0027: cgt
IL_0029: newobj System.Void UnityEngine.Texture2D::.ctor(System.Int32,System.Int32,UnityEngine.TextureFormat,System.Boolean)
IL_002e: stloc.0
IL_002f: ldarg.0
IL_0030: callvirt System.Int32 UnityEngine.Texture::get_width()
IL_0035: ldarg.0
IL_0036: callvirt System.Int32 UnityEngine.Texture::get_height()
IL_003b: ldc.i4.0
IL_003c: ldc.i4.7
IL_003d: ldc.i4.0
IL_003e: call UnityEngine.RenderTexture UnityEngine.RenderTexture::GetTemporary(System.Int32,System.Int32,System.Int32,UnityEngine.RenderTextureFormat,UnityEngine.RenderTextureReadWrite)
IL_0043: stloc.1
IL_0044: nop
IL_0045: ldarg.0
IL_0046: ldloc.1
IL_0047: call System.Void UnityEngine.Graphics::Blit(UnityEngine.Texture,UnityEngine.RenderTexture)
IL_004c: nop
IL_004d: ldloc.1
IL_004e: call System.Void UnityEngine.RenderTexture::set_active(UnityEngine.RenderTexture)
IL_0053: nop
IL_0054: ldloc.0
IL_0055: ldc.r4 0
IL_005a: ldc.r4 0
IL_005f: ldarg.0
IL_0060: callvirt System.Int32 UnityEngine.Texture::get_width()
IL_0065: conv.r4
IL_0066: ldarg.0
IL_0067: callvirt System.Int32 UnityEngine.Texture::get_height()
IL_006c: conv.r4
IL_006d: newobj System.Void UnityEngine.Rect::.ctor(System.Single,System.Single,System.Single,System.Single)
IL_0072: ldc.i4.0
IL_0073: ldc.i4.0
IL_0074: callvirt System.Void UnityEngine.Texture2D::ReadPixels(UnityEngine.Rect,System.Int32,System.Int32)
IL_0079: nop
IL_007a: ldloc.0
IL_007b: ldc.i4.1
IL_007c: ldc.i4.1
IL_007d: callvirt System.Void UnityEngine.Texture2D::Apply(System.Boolean,System.Boolean)
IL_0082: nop
IL_0083: ldloc.0
IL_0084: ldarg.0
IL_0085: callvirt UnityEngine.FilterMode UnityEngine.Texture::get_filterMode()
IL_008a: callvirt System.Void UnityEngine.Texture::set_filterMode(UnityEngine.FilterMode)
IL_008f: nop
IL_0090: nop
IL_0091: leave.s IL_00a4
IL_0093: nop
IL_0094: ldnull
IL_0095: call System.Void UnityEngine.RenderTexture::set_active(UnityEngine.RenderTexture)
IL_009a: nop
IL_009b: ldloc.1
IL_009c: call System.Void UnityEngine.RenderTexture::ReleaseTemporary(UnityEngine.RenderTexture)
IL_00a1: nop
IL_00a2: nop
IL_00a3: endfinally
IL_00a4: ldloc.0
IL_00a5: stloc.3
IL_00a6: br.s IL_00a8
IL_00a8: ldloc.3
IL_00a9: ret
// EH Finally: 68 - 147 => 147 - 164

// UnityEngine.Material LongshipUpgrades.LongshipUpgrades::DeepCopyMaterial(UnityEngine.Material)
.locals UnityEngine.Material, System.String[], System.Int32, System.String, UnityEngine.Material
IL_0000: nop
IL_0001: ldarg.0
IL_0002: callvirt UnityEngine.Shader UnityEngine.Material::get_shader()
IL_0007: newobj System.Void UnityEngine.Material::.ctor(UnityEngine.Shader)
IL_000c: stloc.0
IL_000d: ldloc.0
IL_000e: ldarg.0
IL_000f: callvirt System.Void UnityEngine.Material::CopyPropertiesFromMaterial(UnityEngine.Material)
IL_0014: nop
IL_0015: nop
IL_0016: ldarg.0
IL_0017: callvirt System.String[] UnityEngine.Material::GetTexturePropertyNames()
IL_001c: stloc.1
IL_001d: ldc.i4.0
IL_001e: stloc.2
IL_001f: br.s IL_0032
IL_0021: ldloc.1
IL_0022: ldloc.2
IL_0023: ldelem.ref
IL_0024: stloc.3
IL_0025: ldarg.0
IL_0026: ldloc.0
IL_0027: ldloc.3
IL_0028: call System.Void LongshipUpgrades.LongshipUpgrades::CopyTextureIfExists(UnityEngine.Material,UnityEngine.Material,System.String)
IL_002d: nop
IL_002e: ldloc.2
IL_002f: ldc.i4.1
IL_0030: add
IL_0031: stloc.2
IL_0032: ldloc.2
IL_0033: ldloc.1
IL_0034: ldlen
IL_0035: conv.i4
IL_0036: blt.s IL_0021
IL_0038: ldloc.0
IL_0039: stloc.s V_4
IL_003b: br.s IL_003d
IL_003d: ldloc.s V_4
IL_003f: ret

// System.Void LongshipUpgrades.LongshipUpgrades::CopyTextureIfExists(UnityEngine.Material,UnityEngine.Material,System.String)
.locals UnityEngine.Texture2D, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldarg.2
IL_0003: callvirt System.Boolean UnityEngine.Material::HasProperty(System.String)
IL_0008: ldc.i4.0
IL_0009: ceq
IL_000b: stloc.1
IL_000c: ldloc.1
IL_000d: brfalse.s IL_0011
IL_000f: br.s IL_0039
IL_0011: ldarg.0
IL_0012: ldarg.2
IL_0013: callvirt UnityEngine.Texture UnityEngine.Material::GetTexture(System.String)
IL_0018: isinst UnityEngine.Texture2D
IL_001d: stloc.0
IL_001e: ldloc.0
IL_001f: ldnull
IL_0020: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0025: stloc.2
IL_0026: ldloc.2
IL_0027: brfalse.s IL_002b
IL_0029: br.s IL_0039
IL_002b: ldarg.1
IL_002c: ldarg.2
IL_002d: ldloc.0
IL_002e: call UnityEngine.Texture2D LongshipUpgrades.LongshipUpgrades::CopyTexture(UnityEngine.Texture2D)
IL_0033: callvirt System.Void UnityEngine.Material::SetTexture(System.String,UnityEngine.Texture)
IL_0038: nop
IL_0039: ret

// System.Void LongshipUpgrades.LongshipUpgrades::FixSharedMesh(UnityEngine.MeshFilter)
.locals UnityEngine.Mesh, System.Boolean, System.Int32, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: callvirt UnityEngine.Mesh UnityEngine.MeshFilter::get_sharedMesh()
IL_0007: ldnull
IL_0008: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_000d: stloc.1
IL_000e: ldloc.1
IL_000f: brfalse.s IL_0016
IL_0011: br IL_0115
IL_0016: newobj System.Void UnityEngine.Mesh::.ctor()
IL_001b: dup
IL_001c: ldarg.0
IL_001d: callvirt UnityEngine.Mesh UnityEngine.MeshFilter::get_sharedMesh()
IL_0022: callvirt UnityEngine.Vector3[] UnityEngine.Mesh::get_vertices()
IL_0027: callvirt System.Void UnityEngine.Mesh::set_vertices(UnityEngine.Vector3[])
IL_002c: nop
IL_002d: dup
IL_002e: ldarg.0
IL_002f: callvirt UnityEngine.Mesh UnityEngine.MeshFilter::get_sharedMesh()
IL_0034: callvirt System.Int32[] UnityEngine.Mesh::get_triangles()
IL_0039: callvirt System.Void UnityEngine.Mesh::set_triangles(System.Int32[])
IL_003e: nop
IL_003f: dup
IL_0040: ldarg.0
IL_0041: callvirt UnityEngine.Mesh UnityEngine.MeshFilter::get_sharedMesh()
IL_0046: callvirt UnityEngine.Vector3[] UnityEngine.Mesh::get_normals()
IL_004b: callvirt System.Void UnityEngine.Mesh::set_normals(UnityEngine.Vector3[])
IL_0050: nop
IL_0051: dup
IL_0052: ldarg.0
IL_0053: callvirt UnityEngine.Mesh UnityEngine.MeshFilter::get_sharedMesh()
IL_0058: callvirt UnityEngine.Vector2[] UnityEngine.Mesh::get_uv()
IL_005d: callvirt System.Void UnityEngine.Mesh::set_uv(UnityEngine.Vector2[])
IL_0062: nop
IL_0063: dup
IL_0064: ldarg.0
IL_0065: callvirt UnityEngine.Mesh UnityEngine.MeshFilter::get_sharedMesh()
IL_006a: callvirt UnityEngine.Vector2[] UnityEngine.Mesh::get_uv2()
IL_006f: callvirt System.Void UnityEngine.Mesh::set_uv2(UnityEngine.Vector2[])
IL_0074: nop
IL_0075: dup
IL_0076: ldarg.0
IL_0077: callvirt UnityEngine.Mesh UnityEngine.MeshFilter::get_sharedMesh()
IL_007c: callvirt UnityEngine.Vector4[] UnityEngine.Mesh::get_tangents()
IL_0081: callvirt System.Void UnityEngine.Mesh::set_tangents(UnityEngine.Vector4[])
IL_0086: nop
IL_0087: dup
IL_0088: ldarg.0
IL_0089: callvirt UnityEngine.Mesh UnityEngine.MeshFilter::get_sharedMesh()
IL_008e: callvirt UnityEngine.Color[] UnityEngine.Mesh::get_colors()
IL_0093: callvirt System.Void UnityEngine.Mesh::set_colors(UnityEngine.Color[])
IL_0098: nop
IL_0099: dup
IL_009a: ldarg.0
IL_009b: callvirt UnityEngine.Mesh UnityEngine.MeshFilter::get_sharedMesh()
IL_00a0: callvirt UnityEngine.Matrix4x4[] UnityEngine.Mesh::get_bindposes()
IL_00a5: callvirt System.Void UnityEngine.Mesh::set_bindposes(UnityEngine.Matrix4x4[])
IL_00aa: nop
IL_00ab: dup
IL_00ac: ldarg.0
IL_00ad: callvirt UnityEngine.Mesh UnityEngine.MeshFilter::get_sharedMesh()
IL_00b2: callvirt UnityEngine.BoneWeight[] UnityEngine.Mesh::get_boneWeights()
IL_00b7: callvirt System.Void UnityEngine.Mesh::set_boneWeights(UnityEngine.BoneWeight[])
IL_00bc: nop
IL_00bd: dup
IL_00be: ldarg.0
IL_00bf: callvirt UnityEngine.Mesh UnityEngine.MeshFilter::get_sharedMesh()
IL_00c4: callvirt System.Int32 UnityEngine.Mesh::get_subMeshCount()
IL_00c9: callvirt System.Void UnityEngine.Mesh::set_subMeshCount(System.Int32)
IL_00ce: nop
IL_00cf: stloc.0
IL_00d0: ldc.i4.0
IL_00d1: stloc.2
IL_00d2: br.s IL_00ec
IL_00d4: ldloc.0
IL_00d5: ldarg.0
IL_00d6: callvirt UnityEngine.Mesh UnityEngine.MeshFilter::get_sharedMesh()
IL_00db: ldloc.2
IL_00dc: callvirt System.Int32[] UnityEngine.Mesh::GetTriangles(System.Int32)
IL_00e1: ldloc.2
IL_00e2: callvirt System.Void UnityEngine.Mesh::SetTriangles(System.Int32[],System.Int32)
IL_00e7: nop
IL_00e8: ldloc.2
IL_00e9: ldc.i4.1
IL_00ea: add
IL_00eb: stloc.2
IL_00ec: ldloc.2
IL_00ed: ldarg.0
IL_00ee: callvirt UnityEngine.Mesh UnityEngine.MeshFilter::get_sharedMesh()
IL_00f3: callvirt System.Int32 UnityEngine.Mesh::get_subMeshCount()
IL_00f8: clt
IL_00fa: stloc.3
IL_00fb: ldloc.3
IL_00fc: brtrue.s IL_00d4
IL_00fe: ldloc.0
IL_00ff: callvirt System.Void UnityEngine.Mesh::RecalculateBounds()
IL_0104: nop
IL_0105: ldarg.0
IL_0106: ldloc.0
IL_0107: callvirt System.Void UnityEngine.MeshFilter::set_mesh(UnityEngine.Mesh)
IL_010c: nop
IL_010d: ldarg.0
IL_010e: ldloc.0
IL_010f: callvirt System.Void UnityEngine.MeshFilter::set_sharedMesh(UnityEngine.Mesh)
IL_0114: nop
IL_0115: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::mapTableEnabled
IL_0005: brfalse.s IL_0013
IL_0007: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::mapTableEnabled
IL_000c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0011: br.s IL_0014
IL_0013: ldc.i4.1
IL_0014: ret

// System.Void LongshipUpgrades.LongshipUpgrades::RequestShipMapConfigurationUpdate()
.locals 
IL_0000: nop
IL_0001: ldsflda System.Int32 LongshipUpgrades.LongshipUpgrades::s_shipMapConfigurationUpdateRequested
IL_0006: ldc.i4.1
IL_0007: call System.Int32 System.Threading.Interlocked::Exchange(System.Int32&,System.Int32)
IL_000c: pop
IL_000d: ret

// System.Void LongshipUpgrades.LongshipUpgrades::ApplyShipMapConfiguration(System.Boolean)
.locals System.Boolean, System.Int32, System.Boolean, System.Boolean, System.Collections.Generic.List`1/Enumerator<ZDO>, ZDO, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::mapTableEnabled
IL_0006: brfalse.s IL_001f
IL_0008: call ZNet ZNet::get_instance()
IL_000d: ldnull
IL_000e: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0013: brtrue.s IL_001f
IL_0015: call ZDOMan ZDOMan::get_instance()
IL_001a: ldnull
IL_001b: ceq
IL_001d: br.s IL_0020
IL_001f: ldc.i4.1
IL_0020: stloc.2
IL_0021: ldloc.2
IL_0022: brfalse.s IL_0029
IL_0024: br IL_0104
IL_0029: ldsflda System.Int32 LongshipUpgrades.LongshipUpgrades::s_shipMapConfigurationUpdateRequested
IL_002e: ldc.i4.0
IL_002f: call System.Int32 System.Threading.Interlocked::Exchange(System.Int32&,System.Int32)
IL_0034: ldc.i4.0
IL_0035: cgt.un
IL_0037: stloc.0
IL_0038: ldarg.0
IL_0039: brtrue.s IL_003e
IL_003b: ldloc.0
IL_003c: brfalse.s IL_0045
IL_003e: call System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
IL_0043: br.s IL_0046
IL_0045: ldc.i4.1
IL_0046: stloc.3
IL_0047: ldloc.3
IL_0048: brfalse.s IL_004f
IL_004a: br IL_0104
IL_004f: ldc.i4.0
IL_0050: stloc.1
IL_0051: nop
IL_0052: nop
IL_0053: call ZDOMan ZDOMan::get_instance()
IL_0058: ldfld System.Collections.Generic.Dictionary`2<ZDOID,ZDO> ZDOMan::m_objectsByID
IL_005d: callvirt System.Collections.Generic.Dictionary`2/ValueCollection<!0,!1> System.Collections.Generic.Dictionary`2<ZDOID,ZDO>::get_Values()
IL_0062: ldnull
IL_0063: ldftn System.Boolean LongshipUpgrades.LongshipUpgrades::IsShipZdo(ZDO)
IL_0069: newobj System.Void System.Func`2<ZDO,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_006e: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ZDO>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0073: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<ZDO>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0078: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<ZDO>::GetEnumerator()
IL_007d: stloc.s V_4
IL_007f: br.s IL_009d
IL_0081: ldloca.s V_4
IL_0083: call !0 System.Collections.Generic.List`1/Enumerator<ZDO>::get_Current()
IL_0088: stloc.s V_5
IL_008a: nop
IL_008b: ldloc.s V_5
IL_008d: call System.Boolean LongshipUpgrades.LongshipUpgrades::PurgeShipMapData(ZDO)
IL_0092: stloc.s V_6
IL_0094: ldloc.s V_6
IL_0096: brfalse.s IL_009c
IL_0098: ldloc.1
IL_0099: ldc.i4.1
IL_009a: add
IL_009b: stloc.1
IL_009c: nop
IL_009d: ldloca.s V_4
IL_009f: call System.Boolean System.Collections.Generic.List`1/Enumerator<ZDO>::MoveNext()
IL_00a4: brtrue.s IL_0081
IL_00a6: leave.s IL_00b7
IL_00a8: ldloca.s V_4
IL_00aa: constrained. System.Collections.Generic.List`1/Enumerator<ZDO>
IL_00b0: callvirt System.Void System.IDisposable::Dispose()
IL_00b5: nop
IL_00b6: endfinally
IL_00b7: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry> LongshipUpgrades.LongshipUpgrades::s_shipMapStore
IL_00bc: callvirt System.Void System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry>::Clear()
IL_00c1: nop
IL_00c2: nop
IL_00c3: leave.s IL_00cf
IL_00c5: pop
IL_00c6: nop
IL_00c7: call System.Void LongshipUpgrades.LongshipUpgrades::RequestShipMapConfigurationUpdate()
IL_00cc: nop
IL_00cd: rethrow
IL_00cf: ldarg.0
IL_00d0: stloc.s V_7
IL_00d2: ldloc.s V_7
IL_00d4: brfalse.s IL_00ee
IL_00d6: ldstr "Ship map tables are disabled: pre-save cleanup removed recorded map data from {0} ship(s). No cached maps will be injected. Wait for this world save to finish successfully before disabling or uninstalling Longship Upgrades."
IL_00db: ldloc.1
IL_00dc: box System.Int32
IL_00e1: call System.String System.String::Format(System.String,System.Object)
IL_00e6: call System.Void LongshipUpgrades.LongshipUpgrades::LogInfo(System.Object)
IL_00eb: nop
IL_00ec: br.s IL_0104
IL_00ee: ldstr "Ship map tables are disabled: cleared recorded map data from {0} ship(s). Changes will be persisted by the next world save started after cleanup."
IL_00f3: ldloc.1
IL_00f4: box System.Int32
IL_00f9: call System.String System.String::Format(System.String,System.Object)
IL_00fe: call System.Void LongshipUpgrades.LongshipUpgrades::LogInfo(System.Object)
IL_0103: nop
IL_0104: ret
// EH Finally: 127 - 168 => 168 - 183
// EH Catch: 81 - 197 => 197 - 207

// System.Boolean LongshipUpgrades.LongshipUpgrades::PurgeShipMapData(ZDO)
.locals System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsShipZdo(ZDO)
IL_0007: brfalse.s IL_0011
IL_0009: ldarg.0
IL_000a: callvirt System.Boolean ZDO::get_SaveClone()
IL_000f: br.s IL_0012
IL_0011: ldc.i4.1
IL_0012: stloc.1
IL_0013: ldloc.1
IL_0014: brfalse.s IL_001a
IL_0016: ldc.i4.0
IL_0017: stloc.2
IL_0018: br.s IL_0095
IL_001a: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry> LongshipUpgrades.LongshipUpgrades::s_shipMapStore
IL_001f: ldarg.0
IL_0020: ldfld ZDOID ZDO::m_uid
IL_0025: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry>::Remove(!0)
IL_002a: stloc.0
IL_002b: ldloc.0
IL_002c: ldarg.0
IL_002d: ldfld ZDOID ZDO::m_uid
IL_0032: call System.Boolean LongshipUpgrades.LongshipUpgrades::RemoveShipMapDataFromRuntime(ZDOID)
IL_0037: or
IL_0038: stloc.0
IL_0039: ldloc.0
IL_003a: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,System.Int32>> ZDOExtraData::s_ints
IL_003f: ldarg.0
IL_0040: ldfld ZDOID ZDO::m_uid
IL_0045: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_mapDataCompressed
IL_004a: call System.Boolean LongshipUpgrades.LongshipUpgrades::RemoveDetachedZdoField<System.Int32>(System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,T>>,ZDOID,System.Int32)
IL_004f: or
IL_0050: stloc.0
IL_0051: ldloc.0
IL_0052: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,System.Int32>> ZDOExtraData::s_ints
IL_0057: ldarg.0
IL_0058: ldfld ZDOID ZDO::m_uid
IL_005d: ldsfld System.Int32 LongshipUpgrades.LongshipUpgrades::s_shipMapDataRevision
IL_0062: call System.Boolean LongshipUpgrades.LongshipUpgrades::RemoveDetachedZdoField<System.Int32>(System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,T>>,ZDOID,System.Int32)
IL_0067: or
IL_0068: stloc.0
IL_0069: ldloc.0
IL_006a: brfalse.s IL_0085
IL_006c: call ZNet ZNet::get_instance()
IL_0071: ldnull
IL_0072: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0077: brfalse.s IL_0085
IL_0079: call ZNet ZNet::get_instance()
IL_007e: callvirt System.Boolean ZNet::IsServer()
IL_0083: br.s IL_0086
IL_0085: ldc.i4.0
IL_0086: stloc.3
IL_0087: ldloc.3
IL_0088: brfalse.s IL_0091
IL_008a: ldarg.0
IL_008b: callvirt System.Void ZDO::IncreaseDataRevision()
IL_0090: nop
IL_0091: ldloc.0
IL_0092: stloc.2
IL_0093: br.s IL_0095
IL_0095: ldloc.2
IL_0096: ret

// BinarySearchDictionary`2<System.Int32,T> LongshipUpgrades.LongshipUpgrades::CopyZdoFields(BinarySearchDictionary`2<System.Int32,T>,System.Int32)
.locals BinarySearchDictionary`2<System.Int32,T>, System.Boolean, System.Collections.Generic.IEnumerator`1<System.Collections.Generic.KeyValuePair`2<System.Int32,T>>, System.Collections.Generic.KeyValuePair`2<System.Int32,T>, BinarySearchDictionary`2<System.Int32,T>
IL_0000: nop
IL_0001: newobj System.Void BinarySearchDictionary`2<System.Int32,T>::.ctor()
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: ldarg.0
IL_0009: brtrue.s IL_000e
IL_000b: ldc.i4.0
IL_000c: br.s IL_0014
IL_000e: ldarg.0
IL_000f: call System.Int32 BinarySearchDictionary`2<System.Int32,T>::get_Count()
IL_0014: ldarg.1
IL_0015: add
IL_0016: callvirt System.Void BinarySearchDictionary`2<System.Int32,T>::Reserve(System.Int32)
IL_001b: nop
IL_001c: ldarg.0
IL_001d: ldnull
IL_001e: cgt.un
IL_0020: stloc.1
IL_0021: ldloc.1
IL_0022: brfalse.s IL_0061
IL_0024: nop
IL_0025: nop
IL_0026: ldarg.0
IL_0027: callvirt System.Collections.Generic.IEnumerator`1<System.Collections.Generic.KeyValuePair`2<!0,!1>> BinarySearchDictionary`2<System.Int32,T>::GetEnumerator()
IL_002c: stloc.2
IL_002d: br.s IL_004b
IL_002f: ldloc.2
IL_0030: callvirt !0 System.Collections.Generic.IEnumerator`1<System.Collections.Generic.KeyValuePair`2<System.Int32,T>>::get_Current()
IL_0035: stloc.3
IL_0036: ldloc.0
IL_0037: ldloca.s V_3
IL_0039: call !0 System.Collections.Generic.KeyValuePair`2<System.Int32,T>::get_Key()
IL_003e: ldloca.s V_3
IL_0040: call !1 System.Collections.Generic.KeyValuePair`2<System.Int32,T>::get_Value()
IL_0045: callvirt System.Void BinarySearchDictionary`2<System.Int32,T>::Add(!0,!1)
IL_004a: nop
IL_004b: ldloc.2
IL_004c: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0051: brtrue.s IL_002f
IL_0053: leave.s IL_0060
IL_0055: ldloc.2
IL_0056: brfalse.s IL_005f
IL_0058: ldloc.2
IL_0059: callvirt System.Void System.IDisposable::Dispose()
IL_005e: nop
IL_005f: endfinally
IL_0060: nop
IL_0061: ldloc.0
IL_0062: stloc.s V_4
IL_0064: br.s IL_0066
IL_0066: ldloc.s V_4
IL_0068: ret
// EH Finally: 45 - 85 => 85 - 96

// System.Void LongshipUpgrades.LongshipUpgrades::DetachZdoFields(System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,T>>,ZDOID)
.locals BinarySearchDictionary`2<System.Int32,T>, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldarg.1
IL_0003: ldloca.s V_0
IL_0005: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,T>>::TryGetValue(!0,!1&)
IL_000a: brfalse.s IL_0012
IL_000c: ldloc.0
IL_000d: ldnull
IL_000e: cgt.un
IL_0010: br.s IL_0013
IL_0012: ldc.i4.0
IL_0013: stloc.1
IL_0014: ldloc.1
IL_0015: brfalse.s IL_0026
IL_0017: ldarg.0
IL_0018: ldarg.1
IL_0019: ldloc.0
IL_001a: ldc.i4.0
IL_001b: call BinarySearchDictionary`2<System.Int32,T> LongshipUpgrades.LongshipUpgrades::CopyZdoFields<T>(BinarySearchDictionary`2<System.Int32,T>,System.Int32)
IL_0020: callvirt System.Void System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,T>>::set_Item(!0,!1)
IL_0025: nop
IL_0026: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades::RemoveDetachedZdoField(System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,T>>,ZDOID,System.Int32)
.locals BinarySearchDictionary`2<System.Int32,T>, BinarySearchDictionary`2<System.Int32,T>, System.Boolean, System.Boolean, System.Boolean, System.Collections.Generic.IEnumerator`1<System.Collections.Generic.KeyValuePair`2<System.Int32,T>>, System.Collections.Generic.KeyValuePair`2<System.Int32,T>, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldarg.1
IL_0003: ldloca.s V_0
IL_0005: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,T>>::TryGetValue(!0,!1&)
IL_000a: brfalse.s IL_001b
IL_000c: ldloc.0
IL_000d: brfalse.s IL_001b
IL_000f: ldloc.0
IL_0010: ldarg.2
IL_0011: callvirt System.Boolean BinarySearchDictionary`2<System.Int32,T>::ContainsKey(!0)
IL_0016: ldc.i4.0
IL_0017: ceq
IL_0019: br.s IL_001c
IL_001b: ldc.i4.1
IL_001c: stloc.2
IL_001d: ldloc.2
IL_001e: brfalse.s IL_0027
IL_0020: ldc.i4.0
IL_0021: stloc.3
IL_0022: br IL_00bb
IL_0027: ldloc.0
IL_0028: callvirt System.Int32 BinarySearchDictionary`2<System.Int32,T>::get_Count()
IL_002d: ldc.i4.1
IL_002e: ceq
IL_0030: stloc.s V_4
IL_0032: ldloc.s V_4
IL_0034: brfalse.s IL_0043
IL_0036: nop
IL_0037: ldarg.0
IL_0038: ldarg.1
IL_0039: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,T>>::Remove(!0)
IL_003e: pop
IL_003f: ldc.i4.1
IL_0040: stloc.3
IL_0041: br.s IL_00bb
IL_0043: newobj System.Void BinarySearchDictionary`2<System.Int32,T>::.ctor()
IL_0048: stloc.1
IL_0049: ldloc.1
IL_004a: ldloc.0
IL_004b: callvirt System.Int32 BinarySearchDictionary`2<System.Int32,T>::get_Count()
IL_0050: ldc.i4.1
IL_0051: sub
IL_0052: callvirt System.Void BinarySearchDictionary`2<System.Int32,T>::Reserve(System.Int32)
IL_0057: nop
IL_0058: nop
IL_0059: ldloc.0
IL_005a: callvirt System.Collections.Generic.IEnumerator`1<System.Collections.Generic.KeyValuePair`2<!0,!1>> BinarySearchDictionary`2<System.Int32,T>::GetEnumerator()
IL_005f: stloc.s V_5
IL_0061: br.s IL_0096
IL_0063: ldloc.s V_5
IL_0065: callvirt !0 System.Collections.Generic.IEnumerator`1<System.Collections.Generic.KeyValuePair`2<System.Int32,T>>::get_Current()
IL_006a: stloc.s V_6
IL_006c: nop
IL_006d: ldloca.s V_6
IL_006f: call !0 System.Collections.Generic.KeyValuePair`2<System.Int32,T>::get_Key()
IL_0074: ldarg.2
IL_0075: ceq
IL_0077: ldc.i4.0
IL_0078: ceq
IL_007a: stloc.s V_7
IL_007c: ldloc.s V_7
IL_007e: brfalse.s IL_0095
IL_0080: ldloc.1
IL_0081: ldloca.s V_6
IL_0083: call !0 System.Collections.Generic.KeyValuePair`2<System.Int32,T>::get_Key()
IL_0088: ldloca.s V_6
IL_008a: call !1 System.Collections.Generic.KeyValuePair`2<System.Int32,T>::get_Value()
IL_008f: callvirt System.Void BinarySearchDictionary`2<System.Int32,T>::Add(!0,!1)
IL_0094: nop
IL_0095: nop
IL_0096: ldloc.s V_5
IL_0098: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_009d: brtrue.s IL_0063
IL_009f: leave.s IL_00ae
IL_00a1: ldloc.s V_5
IL_00a3: brfalse.s IL_00ad
IL_00a5: ldloc.s V_5
IL_00a7: callvirt System.Void System.IDisposable::Dispose()
IL_00ac: nop
IL_00ad: endfinally
IL_00ae: ldarg.0
IL_00af: ldarg.1
IL_00b0: ldloc.1
IL_00b1: callvirt System.Void System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,T>>::set_Item(!0,!1)
IL_00b6: nop
IL_00b7: ldc.i4.1
IL_00b8: stloc.3
IL_00b9: br.s IL_00bb
IL_00bb: ldloc.3
IL_00bc: ret
// EH Finally: 97 - 161 => 161 - 174

// System.Void LongshipUpgrades.LongshipUpgrades::SetShipMapDataInRuntime(ZDOID,System.Byte[])
.locals BinarySearchDictionary`2<System.Int32,System.Byte[]>, System.Byte[], BinarySearchDictionary`2<System.Int32,System.Byte[]>, System.Boolean
IL_0000: nop
IL_0001: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,System.Byte[]>> ZDOExtraData::s_byteArrays
IL_0006: ldarg.0
IL_0007: ldloca.s V_0
IL_0009: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,System.Byte[]>>::TryGetValue(!0,!1&)
IL_000e: pop
IL_000f: ldloc.0
IL_0010: brfalse.s IL_0027
IL_0012: ldloc.0
IL_0013: ldsfld System.Int32 ZDOVars::s_data
IL_0018: ldloca.s V_1
IL_001a: callvirt System.Boolean BinarySearchDictionary`2<System.Int32,System.Byte[]>::TryGetValue(!0,!1&)
IL_001f: brfalse.s IL_0027
IL_0021: ldloc.1
IL_0022: ldarg.1
IL_0023: ceq
IL_0025: br.s IL_0028
IL_0027: ldc.i4.0
IL_0028: stloc.3
IL_0029: ldloc.3
IL_002a: brfalse.s IL_002e
IL_002c: br.s IL_0050
IL_002e: ldloc.0
IL_002f: ldc.i4.1
IL_0030: call BinarySearchDictionary`2<System.Int32,T> LongshipUpgrades.LongshipUpgrades::CopyZdoFields<System.Byte[]>(BinarySearchDictionary`2<System.Int32,T>,System.Int32)
IL_0035: stloc.2
IL_0036: ldloc.2
IL_0037: ldsfld System.Int32 ZDOVars::s_data
IL_003c: ldarg.1
IL_003d: callvirt System.Void BinarySearchDictionary`2<System.Int32,System.Byte[]>::set_Item(!0,!1)
IL_0042: nop
IL_0043: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,System.Byte[]>> ZDOExtraData::s_byteArrays
IL_0048: ldarg.0
IL_0049: ldloc.2
IL_004a: callvirt System.Void System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,System.Byte[]>>::set_Item(!0,!1)
IL_004f: nop
IL_0050: ret

// System.Void LongshipUpgrades.LongshipUpgrades::SetShipMapInt(ZDO,System.Int32,System.Int32)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldarg.1
IL_0003: ldc.i4.0
IL_0004: callvirt System.Int32 ZDO::GetInt(System.Int32,System.Int32)
IL_0009: ldarg.2
IL_000a: ceq
IL_000c: stloc.0
IL_000d: ldloc.0
IL_000e: brfalse.s IL_0012
IL_0010: br.s IL_002d
IL_0012: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,System.Int32>> ZDOExtraData::s_ints
IL_0017: ldarg.0
IL_0018: ldfld ZDOID ZDO::m_uid
IL_001d: call System.Void LongshipUpgrades.LongshipUpgrades::DetachZdoFields<System.Int32>(System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,T>>,ZDOID)
IL_0022: nop
IL_0023: ldarg.0
IL_0024: ldarg.1
IL_0025: ldarg.2
IL_0026: ldc.i4.0
IL_0027: callvirt System.Void ZDO::Set(System.Int32,System.Int32,System.Boolean)
IL_002c: nop
IL_002d: ret

// System.Void LongshipUpgrades.LongshipUpgrades::InjectShipMapDataForSave(LongshipUpgrades.LongshipUpgrades/ShipMapSaveState)
.locals System.Int64, System.Collections.Generic.List`1/Enumerator<ZDOID>, ZDOID, ZDO, LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry, System.Boolean, System.Boolean, System.TimeSpan
IL_0000: nop
IL_0001: ldstr "Ship map save preparation started: {0} cached map(s)."
IL_0006: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry> LongshipUpgrades.LongshipUpgrades::s_shipMapStore
IL_000b: callvirt System.Int32 System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry>::get_Count()
IL_0010: box System.Int32
IL_0015: call System.String System.String::Format(System.String,System.Object)
IL_001a: call System.Void LongshipUpgrades.LongshipUpgrades::LogInfo(System.Object)
IL_001f: nop
IL_0020: ldc.i4.0
IL_0021: conv.i8
IL_0022: stloc.0
IL_0023: nop
IL_0024: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry> LongshipUpgrades.LongshipUpgrades::s_shipMapStore
IL_0029: callvirt System.Collections.Generic.Dictionary`2/KeyCollection<!0,!1> System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry>::get_Keys()
IL_002e: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<ZDOID>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0033: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<ZDOID>::GetEnumerator()
IL_0038: stloc.1
IL_0039: br IL_00d8
IL_003e: ldloca.s V_1
IL_0040: call !0 System.Collections.Generic.List`1/Enumerator<ZDOID>::get_Current()
IL_0045: stloc.2
IL_0046: nop
IL_0047: call ZDOMan ZDOMan::get_instance()
IL_004c: dup
IL_004d: brtrue.s IL_0053
IL_004f: pop
IL_0050: ldnull
IL_0051: br.s IL_0059
IL_0053: ldloc.2
IL_0054: call ZDO ZDOMan::GetZDO(ZDOID)
IL_0059: stloc.3
IL_005a: ldloc.3
IL_005b: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsShipZdo(ZDO)
IL_0060: brfalse.s IL_0084
IL_0062: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry> LongshipUpgrades.LongshipUpgrades::s_shipMapStore
IL_0067: ldloc.2
IL_0068: ldloca.s V_4
IL_006a: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry>::TryGetValue(!0,!1&)
IL_006f: brfalse.s IL_0084
IL_0071: ldloc.s V_4
IL_0073: brtrue.s IL_0078
IL_0075: ldnull
IL_0076: br.s IL_007f
IL_0078: ldloc.s V_4
IL_007a: ldfld System.Byte[] LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Data
IL_007f: ldnull
IL_0080: ceq
IL_0082: br.s IL_0085
IL_0084: ldc.i4.1
IL_0085: stloc.s V_5
IL_0087: ldloc.s V_5
IL_0089: brfalse.s IL_008d
IL_008b: br.s IL_00d8
IL_008d: ldloc.3
IL_008e: ldsfld System.Int32 ZDOVars::s_data
IL_0093: ldnull
IL_0094: callvirt System.Byte[] ZDO::GetByteArray(System.Int32,System.Byte[])
IL_0099: ldnull
IL_009a: cgt.un
IL_009c: stloc.s V_6
IL_009e: ldloc.s V_6
IL_00a0: brfalse.s IL_00a4
IL_00a2: br.s IL_00d8
IL_00a4: ldarg.0
IL_00a5: ldfld System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<ZDOID,System.Byte[]>> LongshipUpgrades.LongshipUpgrades/ShipMapSaveState::InjectedMaps
IL_00aa: ldloc.2
IL_00ab: ldloc.s V_4
IL_00ad: ldfld System.Byte[] LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Data
IL_00b2: newobj System.Void System.Collections.Generic.KeyValuePair`2<ZDOID,System.Byte[]>::.ctor(!0,!1)
IL_00b7: callvirt System.Void System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<ZDOID,System.Byte[]>>::Add(!0)
IL_00bc: nop
IL_00bd: ldloc.2
IL_00be: ldloc.s V_4
IL_00c0: ldfld System.Byte[] LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Data
IL_00c5: call System.Void LongshipUpgrades.LongshipUpgrades::SetShipMapDataInRuntime(ZDOID,System.Byte[])
IL_00ca: nop
IL_00cb: ldloc.0
IL_00cc: ldloc.s V_4
IL_00ce: ldfld System.Byte[] LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Data
IL_00d3: ldlen
IL_00d4: conv.i8
IL_00d5: add
IL_00d6: stloc.0
IL_00d7: nop
IL_00d8: ldloca.s V_1
IL_00da: call System.Boolean System.Collections.Generic.List`1/Enumerator<ZDOID>::MoveNext()
IL_00df: brtrue IL_003e
IL_00e4: leave.s IL_00f5
IL_00e6: ldloca.s V_1
IL_00e8: constrained. System.Collections.Generic.List`1/Enumerator<ZDOID>
IL_00ee: callvirt System.Void System.IDisposable::Dispose()
IL_00f3: nop
IL_00f4: endfinally
IL_00f5: ldstr "Ship map save injection ready: {0} map(s), {1} payload bytes, {2:F2} ms. Entering world snapshot preparation."
IL_00fa: ldarg.0
IL_00fb: ldfld System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<ZDOID,System.Byte[]>> LongshipUpgrades.LongshipUpgrades/ShipMapSaveState::InjectedMaps
IL_0100: callvirt System.Int32 System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<ZDOID,System.Byte[]>>::get_Count()
IL_0105: box System.Int32
IL_010a: ldloc.0
IL_010b: box System.Int64
IL_0110: ldarg.0
IL_0111: ldfld System.Diagnostics.Stopwatch LongshipUpgrades.LongshipUpgrades/ShipMapSaveState::Timer
IL_0116: callvirt System.TimeSpan System.Diagnostics.Stopwatch::get_Elapsed()
IL_011b: stloc.s V_7
IL_011d: ldloca.s V_7
IL_011f: call System.Double System.TimeSpan::get_TotalMilliseconds()
IL_0124: box System.Double
IL_0129: call System.String System.String::Format(System.String,System.Object,System.Object,System.Object)
IL_012e: call System.Void LongshipUpgrades.LongshipUpgrades::LogInfo(System.Object)
IL_0133: nop
IL_0134: ret
// EH Finally: 57 - 230 => 230 - 245

// System.Void LongshipUpgrades.LongshipUpgrades::RemoveShipMapSaveInjection(LongshipUpgrades.LongshipUpgrades/ShipMapSaveState)
.locals System.Boolean, System.Collections.Generic.List`1/Enumerator<System.Collections.Generic.KeyValuePair`2<ZDOID,System.Byte[]>>, System.Collections.Generic.KeyValuePair`2<ZDOID,System.Byte[]>, BinarySearchDictionary`2<System.Int32,System.Byte[]>, System.Byte[], System.Boolean, System.TimeSpan
IL_0000: nop
IL_0001: ldarg.0
IL_0002: brfalse.s IL_000c
IL_0004: ldarg.0
IL_0005: ldfld System.Boolean LongshipUpgrades.LongshipUpgrades/ShipMapSaveState::CleanupCompleted
IL_000a: br.s IL_000d
IL_000c: ldc.i4.1
IL_000d: stloc.0
IL_000e: ldloc.0
IL_000f: brfalse.s IL_0016
IL_0011: br IL_00f1
IL_0016: ldarg.0
IL_0017: ldc.i4.1
IL_0018: stfld System.Boolean LongshipUpgrades.LongshipUpgrades/ShipMapSaveState::CleanupCompleted
IL_001d: nop
IL_001e: ldarg.0
IL_001f: ldfld System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<ZDOID,System.Byte[]>> LongshipUpgrades.LongshipUpgrades/ShipMapSaveState::InjectedMaps
IL_0024: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<ZDOID,System.Byte[]>>::GetEnumerator()
IL_0029: stloc.1
IL_002a: br.s IL_0092
IL_002c: ldloca.s V_1
IL_002e: call !0 System.Collections.Generic.List`1/Enumerator<System.Collections.Generic.KeyValuePair`2<ZDOID,System.Byte[]>>::get_Current()
IL_0033: stloc.2
IL_0034: nop
IL_0035: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,System.Byte[]>> ZDOExtraData::s_byteArrays
IL_003a: ldloca.s V_2
IL_003c: call !0 System.Collections.Generic.KeyValuePair`2<ZDOID,System.Byte[]>::get_Key()
IL_0041: ldloca.s V_3
IL_0043: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,System.Byte[]>>::TryGetValue(!0,!1&)
IL_0048: brfalse.s IL_0069
IL_004a: ldloc.3
IL_004b: brfalse.s IL_0069
IL_004d: ldloc.3
IL_004e: ldsfld System.Int32 ZDOVars::s_data
IL_0053: ldloca.s V_4
IL_0055: callvirt System.Boolean BinarySearchDictionary`2<System.Int32,System.Byte[]>::TryGetValue(!0,!1&)
IL_005a: brfalse.s IL_0069
IL_005c: ldloc.s V_4
IL_005e: ldloca.s V_2
IL_0060: call !1 System.Collections.Generic.KeyValuePair`2<ZDOID,System.Byte[]>::get_Value()
IL_0065: ceq
IL_0067: br.s IL_006a
IL_0069: ldc.i4.0
IL_006a: stloc.s V_5
IL_006c: ldloc.s V_5
IL_006e: brfalse.s IL_007f
IL_0070: nop
IL_0071: ldloca.s V_2
IL_0073: call !0 System.Collections.Generic.KeyValuePair`2<ZDOID,System.Byte[]>::get_Key()
IL_0078: call System.Boolean LongshipUpgrades.LongshipUpgrades::RemoveShipMapDataFromRuntime(ZDOID)
IL_007d: pop
IL_007e: nop
IL_007f: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,System.Int32>> ZDOExtraData::s_ints
IL_0084: ldloca.s V_2
IL_0086: call !0 System.Collections.Generic.KeyValuePair`2<ZDOID,System.Byte[]>::get_Key()
IL_008b: call System.Void LongshipUpgrades.LongshipUpgrades::DetachZdoFields<System.Int32>(System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,T>>,ZDOID)
IL_0090: nop
IL_0091: nop
IL_0092: ldloca.s V_1
IL_0094: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.Collections.Generic.KeyValuePair`2<ZDOID,System.Byte[]>>::MoveNext()
IL_0099: brtrue.s IL_002c
IL_009b: leave.s IL_00ac
IL_009d: ldloca.s V_1
IL_009f: constrained. System.Collections.Generic.List`1/Enumerator<System.Collections.Generic.KeyValuePair`2<ZDOID,System.Byte[]>>
IL_00a5: callvirt System.Void System.IDisposable::Dispose()
IL_00aa: nop
IL_00ab: endfinally
IL_00ac: ldarg.0
IL_00ad: ldfld System.Diagnostics.Stopwatch LongshipUpgrades.LongshipUpgrades/ShipMapSaveState::Timer
IL_00b2: callvirt System.Void System.Diagnostics.Stopwatch::Stop()
IL_00b7: nop
IL_00b8: ldstr "Ship map save injection cleared: {0} map(s); total PrepareSave scope {1:F2} ms (including game and other patches)."
IL_00bd: ldarg.0
IL_00be: ldfld System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<ZDOID,System.Byte[]>> LongshipUpgrades.LongshipUpgrades/ShipMapSaveState::InjectedMaps
IL_00c3: callvirt System.Int32 System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<ZDOID,System.Byte[]>>::get_Count()
IL_00c8: box System.Int32
IL_00cd: ldarg.0
IL_00ce: ldfld System.Diagnostics.Stopwatch LongshipUpgrades.LongshipUpgrades/ShipMapSaveState::Timer
IL_00d3: callvirt System.TimeSpan System.Diagnostics.Stopwatch::get_Elapsed()
IL_00d8: stloc.s V_6
IL_00da: ldloca.s V_6
IL_00dc: call System.Double System.TimeSpan::get_TotalMilliseconds()
IL_00e1: box System.Double
IL_00e6: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_00eb: call System.Void LongshipUpgrades.LongshipUpgrades::LogInfo(System.Object)
IL_00f0: nop
IL_00f1: ret
// EH Finally: 42 - 157 => 157 - 172

// System.Void LongshipUpgrades.LongshipUpgrades::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: ldstr "shudnal.LongshipUpgrades"
IL_0006: newobj System.Void HarmonyLib.Harmony::.ctor(System.String)
IL_000b: stfld HarmonyLib.Harmony LongshipUpgrades.LongshipUpgrades::harmony
IL_0010: ldarg.0
IL_0011: call System.Void BepInEx.BaseUnityPlugin::.ctor()
IL_0016: nop
IL_0017: ret

// System.Void LongshipUpgrades.LongshipUpgrades::.cctor()
.locals 
IL_0000: ldstr "shudnal.LongshipUpgrades"
IL_0005: newobj System.Void ConditionalConfigSync.ConfigSync::.ctor(System.String)
IL_000a: dup
IL_000b: ldstr "Longship Upgrades"
IL_0010: stfld System.String ConditionalConfigSync.ConditionalConfigSync::DisplayName
IL_0015: dup
IL_0016: ldstr "1.0.23"
IL_001b: stfld System.String ConditionalConfigSync.ConditionalConfigSync::CurrentVersion
IL_0020: dup
IL_0021: ldstr "1.0.23"
IL_0026: stfld System.String ConditionalConfigSync.ConditionalConfigSync::MinimumRequiredVersion
IL_002b: dup
IL_002c: ldc.i4.1
IL_002d: callvirt System.Void ConditionalConfigSync.ConditionalConfigSync::set_ModRequired(System.Boolean)
IL_0032: nop
IL_0033: stsfld ConditionalConfigSync.ConfigSync LongshipUpgrades.LongshipUpgrades::configSync
IL_0038: newobj System.Void System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry>::.ctor()
IL_003d: stsfld System.Collections.Generic.Dictionary`2<ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry> LongshipUpgrades.LongshipUpgrades::s_shipMapStore
IL_0042: newobj System.Void System.Collections.Generic.HashSet`1<ZDOID>::.ctor()
IL_0047: stsfld System.Collections.Generic.HashSet`1<ZDOID> LongshipUpgrades.LongshipUpgrades::s_trackedShipZdos
IL_004c: ldc.i4.0
IL_004d: stsfld System.Boolean LongshipUpgrades.LongshipUpgrades::s_shipMapRpcsRegistered
IL_0052: ldc.r4 0
IL_0057: stsfld System.Single LongshipUpgrades.LongshipUpgrades::s_nextClientShipMapPruneTime
IL_005c: newobj System.Void System.Collections.Generic.Stack`1<System.Boolean>::.ctor()
IL_0061: stsfld System.Collections.Generic.Stack`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::s_mapTableDataCompressionFlags
IL_0066: ldc.i4.0
IL_0067: stsfld System.Int32 LongshipUpgrades.LongshipUpgrades::s_mapTableWriteDepth
IL_006c: ldstr "ShipMapDataRevision"
IL_0071: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0076: stsfld System.Int32 LongshipUpgrades.LongshipUpgrades::s_shipMapDataRevision
IL_007b: ldc.i4.1
IL_007c: stsfld System.Int32 LongshipUpgrades.LongshipUpgrades::s_shipMapConfigurationUpdateRequested
IL_0081: ret

// System.Void LongshipUpgrades.LongshipUpgrades/ZoneSystem_Start_FixCustomizableParts::Postfix()
.locals 
IL_0000: nop
IL_0001: call System.Void LongshipUpgrades.ItemNameTokens::UpdateRegisters()
IL_0006: nop
IL_0007: call System.Void LongshipUpgrades.LongshipUpgrades::RegisterShipMapRpcs()
IL_000c: nop
IL_000d: call System.Void LongshipUpgrades.LongshipCustomizableParts::OnGlobalStart()
IL_0012: nop
IL_0013: ret

// System.Void LongshipUpgrades.LongshipUpgrades/ZoneSystem_OnDestroy_ClearValues::Postfix()
.locals 
IL_0000: nop
IL_0001: call System.Void LongshipUpgrades.LongshipUpgrades::ClearShipMapRuntime()
IL_0006: nop
IL_0007: call System.Void LongshipUpgrades.LongshipCustomizableParts::OnGlobalDestroy()
IL_000c: nop
IL_000d: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades/Ship_OnTrigger_IgnoreFireWarmthCollider::IsHeatActive(Ship)
.locals LongshipUpgrades.LongshipCustomizableParts
IL_0000: ldarg.0
IL_0001: ldloca.s V_0
IL_0003: call System.Boolean LongshipUpgrades.LongshipCustomizableParts::TryGetShipComponent(Ship,LongshipUpgrades.LongshipCustomizableParts&)
IL_0008: brfalse.s IL_0012
IL_000a: ldloc.0
IL_000b: callvirt System.Boolean LongshipUpgrades.LongshipCustomizableParts::IsHeatActive()
IL_0010: br.s IL_0013
IL_0012: ldc.i4.0
IL_0013: ret

// System.Void LongshipUpgrades.LongshipUpgrades/Ship_OnTrigger_IgnoreFireWarmthCollider::OnEnablePostfix(Ship)
.locals 
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<Ship,System.Collections.Generic.Dictionary`2<UnityEngine.Collider,System.Int32>> LongshipUpgrades.LongshipUpgrades/Ship_OnTrigger_IgnoreFireWarmthCollider::triggerCounter
IL_0005: ldarg.0
IL_0006: newobj System.Void System.Collections.Generic.Dictionary`2<UnityEngine.Collider,System.Int32>::.ctor()
IL_000b: callvirt System.Void System.Collections.Generic.Dictionary`2<Ship,System.Collections.Generic.Dictionary`2<UnityEngine.Collider,System.Int32>>::Add(!0,!1)
IL_0010: nop
IL_0011: ret

// System.Void LongshipUpgrades.LongshipUpgrades/Ship_OnTrigger_IgnoreFireWarmthCollider::OnDisablePostfix(Ship)
.locals 
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<Ship,System.Collections.Generic.Dictionary`2<UnityEngine.Collider,System.Int32>> LongshipUpgrades.LongshipUpgrades/Ship_OnTrigger_IgnoreFireWarmthCollider::triggerCounter
IL_0005: ldarg.0
IL_0006: callvirt System.Boolean System.Collections.Generic.Dictionary`2<Ship,System.Collections.Generic.Dictionary`2<UnityEngine.Collider,System.Int32>>::Remove(!0)
IL_000b: pop
IL_000c: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades/Ship_OnTrigger_IgnoreFireWarmthCollider::OnTriggerEnterPrefix(Ship,UnityEngine.Collider)
.locals System.Collections.Generic.Dictionary`2<UnityEngine.Collider,System.Int32>, System.Boolean, System.Boolean, System.Boolean, System.Boolean, UnityEngine.Collider, System.Int32
IL_0000: nop
IL_0001: ldarg.1
IL_0002: callvirt !!0 UnityEngine.Component::GetComponent<Character>()
IL_0007: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000c: ldc.i4.0
IL_000d: ceq
IL_000f: stloc.1
IL_0010: ldloc.1
IL_0011: brfalse.s IL_0017
IL_0013: ldc.i4.1
IL_0014: stloc.2
IL_0015: br.s IL_006b
IL_0017: ldsfld System.Collections.Generic.Dictionary`2<Ship,System.Collections.Generic.Dictionary`2<UnityEngine.Collider,System.Int32>> LongshipUpgrades.LongshipUpgrades/Ship_OnTrigger_IgnoreFireWarmthCollider::triggerCounter
IL_001c: ldarg.0
IL_001d: ldloca.s V_0
IL_001f: callvirt System.Boolean System.Collections.Generic.Dictionary`2<Ship,System.Collections.Generic.Dictionary`2<UnityEngine.Collider,System.Int32>>::TryGetValue(!0,!1&)
IL_0024: ldc.i4.0
IL_0025: ceq
IL_0027: stloc.3
IL_0028: ldloc.3
IL_0029: brfalse.s IL_002f
IL_002b: ldc.i4.1
IL_002c: stloc.2
IL_002d: br.s IL_006b
IL_002f: ldloc.0
IL_0030: ldarg.1
IL_0031: callvirt System.Boolean System.Collections.Generic.Dictionary`2<UnityEngine.Collider,System.Int32>::ContainsKey(!0)
IL_0036: ldc.i4.0
IL_0037: ceq
IL_0039: stloc.s V_4
IL_003b: ldloc.s V_4
IL_003d: brfalse.s IL_004d
IL_003f: nop
IL_0040: ldloc.0
IL_0041: ldarg.1
IL_0042: ldc.i4.1
IL_0043: callvirt System.Void System.Collections.Generic.Dictionary`2<UnityEngine.Collider,System.Int32>::set_Item(!0,!1)
IL_0048: nop
IL_0049: ldc.i4.1
IL_004a: stloc.2
IL_004b: br.s IL_006b
IL_004d: ldloc.0
IL_004e: ldarg.1
IL_004f: stloc.s V_5
IL_0051: dup
IL_0052: ldloc.s V_5
IL_0054: callvirt !1 System.Collections.Generic.Dictionary`2<UnityEngine.Collider,System.Int32>::get_Item(!0)
IL_0059: stloc.s V_6
IL_005b: ldloc.s V_5
IL_005d: ldloc.s V_6
IL_005f: ldc.i4.1
IL_0060: add
IL_0061: callvirt System.Void System.Collections.Generic.Dictionary`2<UnityEngine.Collider,System.Int32>::set_Item(!0,!1)
IL_0066: nop
IL_0067: ldc.i4.0
IL_0068: stloc.2
IL_0069: br.s IL_006b
IL_006b: ldloc.2
IL_006c: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades/Ship_OnTrigger_IgnoreFireWarmthCollider::OnTriggerExitPrefix(Ship,UnityEngine.Collider)
.locals System.Collections.Generic.Dictionary`2<UnityEngine.Collider,System.Int32>, System.Int32, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, UnityEngine.Collider, System.Int32
IL_0000: nop
IL_0001: ldarg.1
IL_0002: callvirt !!0 UnityEngine.Component::GetComponent<Character>()
IL_0007: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000c: ldc.i4.0
IL_000d: ceq
IL_000f: stloc.2
IL_0010: ldloc.2
IL_0011: brfalse.s IL_0017
IL_0013: ldc.i4.1
IL_0014: stloc.3
IL_0015: br.s IL_007c
IL_0017: ldsfld System.Collections.Generic.Dictionary`2<Ship,System.Collections.Generic.Dictionary`2<UnityEngine.Collider,System.Int32>> LongshipUpgrades.LongshipUpgrades/Ship_OnTrigger_IgnoreFireWarmthCollider::triggerCounter
IL_001c: ldarg.0
IL_001d: ldloca.s V_0
IL_001f: callvirt System.Boolean System.Collections.Generic.Dictionary`2<Ship,System.Collections.Generic.Dictionary`2<UnityEngine.Collider,System.Int32>>::TryGetValue(!0,!1&)
IL_0024: ldc.i4.0
IL_0025: ceq
IL_0027: stloc.s V_4
IL_0029: ldloc.s V_4
IL_002b: brfalse.s IL_0031
IL_002d: ldc.i4.1
IL_002e: stloc.3
IL_002f: br.s IL_007c
IL_0031: ldloc.0
IL_0032: ldarg.1
IL_0033: ldloca.s V_1
IL_0035: callvirt System.Boolean System.Collections.Generic.Dictionary`2<UnityEngine.Collider,System.Int32>::TryGetValue(!0,!1&)
IL_003a: ldc.i4.0
IL_003b: ceq
IL_003d: stloc.s V_5
IL_003f: ldloc.s V_5
IL_0041: brfalse.s IL_0047
IL_0043: ldc.i4.1
IL_0044: stloc.3
IL_0045: br.s IL_007c
IL_0047: ldloc.1
IL_0048: ldc.i4.1
IL_0049: ceq
IL_004b: stloc.s V_6
IL_004d: ldloc.s V_6
IL_004f: brfalse.s IL_005e
IL_0051: nop
IL_0052: ldloc.0
IL_0053: ldarg.1
IL_0054: callvirt System.Boolean System.Collections.Generic.Dictionary`2<UnityEngine.Collider,System.Int32>::Remove(!0)
IL_0059: pop
IL_005a: ldc.i4.1
IL_005b: stloc.3
IL_005c: br.s IL_007c
IL_005e: ldloc.0
IL_005f: ldarg.1
IL_0060: stloc.s V_7
IL_0062: dup
IL_0063: ldloc.s V_7
IL_0065: callvirt !1 System.Collections.Generic.Dictionary`2<UnityEngine.Collider,System.Int32>::get_Item(!0)
IL_006a: stloc.s V_8
IL_006c: ldloc.s V_7
IL_006e: ldloc.s V_8
IL_0070: ldc.i4.1
IL_0071: sub
IL_0072: callvirt System.Void System.Collections.Generic.Dictionary`2<UnityEngine.Collider,System.Int32>::set_Item(!0,!1)
IL_0077: nop
IL_0078: ldc.i4.0
IL_0079: stloc.3
IL_007a: br.s IL_007c
IL_007c: ldloc.3
IL_007d: ret

// System.Void LongshipUpgrades.LongshipUpgrades/Ship_OnTrigger_IgnoreFireWarmthCollider::.cctor()
.locals 
IL_0000: newobj System.Void System.Collections.Generic.Dictionary`2<Ship,System.Collections.Generic.Dictionary`2<UnityEngine.Collider,System.Int32>>::.ctor()
IL_0005: stsfld System.Collections.Generic.Dictionary`2<Ship,System.Collections.Generic.Dictionary`2<UnityEngine.Collider,System.Int32>> LongshipUpgrades.LongshipUpgrades/Ship_OnTrigger_IgnoreFireWarmthCollider::triggerCounter
IL_000a: ret

// System.Void LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Collections.Generic.IEnumerable`1<System.Reflection.MethodBase> LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos::TargetMethods()
.locals 
IL_0000: ldc.i4.s -2
IL_0002: newobj System.Void LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::.ctor(System.Int32)
IL_0007: ret

// System.Void LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos::Postfix(ZDOMan)
.locals 
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.Collections.Generic.Dictionary`2<ZDOID,ZDO> ZDOMan::m_objectsByID
IL_0007: callvirt System.Collections.Generic.Dictionary`2/ValueCollection<!0,!1> System.Collections.Generic.Dictionary`2<ZDOID,ZDO>::get_Values()
IL_000c: call System.Void LongshipUpgrades.LongshipUpgrades::RebuildTrackedShipZdos(System.Collections.Generic.IEnumerable`1<ZDO>)
IL_0011: nop
IL_0012: ret

// System.Void LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::.ctor(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ldarg.0
IL_0008: ldarg.1
IL_0009: stfld System.Int32 LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::<>1__state
IL_000e: ldarg.0
IL_000f: call System.Int32 System.Environment::get_CurrentManagedThreadId()
IL_0014: stfld System.Int32 LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::<>l__initialThreadId
IL_0019: ret

// System.Void LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::System.IDisposable.Dispose()
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.s -2
IL_0003: stfld System.Int32 LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::<>1__state
IL_0008: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::MoveNext()
.locals System.Int32
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::<>1__state
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: switch IL_001b,IL_001d,IL_001f
IL_0019: br.s IL_0021
IL_001b: br.s IL_0023
IL_001d: br.s IL_0050
IL_001f: br.s IL_007c
IL_0021: ldc.i4.0
IL_0022: ret
IL_0023: ldarg.0
IL_0024: ldc.i4.m1
IL_0025: stfld System.Int32 LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::<>1__state
IL_002a: nop
IL_002b: ldarg.0
IL_002c: ldtoken ZDOMan
IL_0031: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0036: ldstr "Load"
IL_003b: ldnull
IL_003c: ldnull
IL_003d: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_0042: stfld System.Reflection.MethodBase LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::<>2__current
IL_0047: ldarg.0
IL_0048: ldc.i4.1
IL_0049: stfld System.Int32 LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::<>1__state
IL_004e: ldc.i4.1
IL_004f: ret
IL_0050: ldarg.0
IL_0051: ldc.i4.m1
IL_0052: stfld System.Int32 LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::<>1__state
IL_0057: ldarg.0
IL_0058: ldtoken ZDOMan
IL_005d: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0062: ldstr "LoadChunks"
IL_0067: ldnull
IL_0068: ldnull
IL_0069: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_006e: stfld System.Reflection.MethodBase LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::<>2__current
IL_0073: ldarg.0
IL_0074: ldc.i4.2
IL_0075: stfld System.Int32 LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::<>1__state
IL_007a: ldc.i4.1
IL_007b: ret
IL_007c: ldarg.0
IL_007d: ldc.i4.m1
IL_007e: stfld System.Int32 LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::<>1__state
IL_0083: ldc.i4.0
IL_0084: ret

// System.Reflection.MethodBase LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::System.Collections.Generic.IEnumerator<System.Reflection.MethodBase>.get_Current()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Reflection.MethodBase LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::<>2__current
IL_0006: ret

// System.Void LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::System.Collections.IEnumerator.Reset()
.locals 
IL_0000: newobj System.Void System.NotSupportedException::.ctor()
IL_0005: throw

// System.Object LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::System.Collections.IEnumerator.get_Current()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Reflection.MethodBase LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::<>2__current
IL_0006: ret

// System.Collections.Generic.IEnumerator`1<System.Reflection.MethodBase> LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::System.Collections.Generic.IEnumerable<System.Reflection.MethodBase>.GetEnumerator()
.locals LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::<>1__state
IL_0006: ldc.i4.s -2
IL_0008: bne.un.s IL_0022
IL_000a: ldarg.0
IL_000b: ldfld System.Int32 LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::<>l__initialThreadId
IL_0010: call System.Int32 System.Environment::get_CurrentManagedThreadId()
IL_0015: bne.un.s IL_0022
IL_0017: ldarg.0
IL_0018: ldc.i4.0
IL_0019: stfld System.Int32 LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::<>1__state
IL_001e: ldarg.0
IL_001f: stloc.0
IL_0020: br.s IL_0029
IL_0022: ldc.i4.0
IL_0023: newobj System.Void LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::.ctor(System.Int32)
IL_0028: stloc.0
IL_0029: ldloc.0
IL_002a: ret

// System.Collections.IEnumerator LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::System.Collections.IEnumerable.GetEnumerator()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Collections.Generic.IEnumerator`1<System.Reflection.MethodBase> LongshipUpgrades.LongshipUpgrades/ZDOMan_Load_TrackShipMapZdos/<TargetMethods>d__0::System.Collections.Generic.IEnumerable<System.Reflection.MethodBase>.GetEnumerator()
IL_0006: ret

// System.Void LongshipUpgrades.LongshipUpgrades/ZDOMan_CreateNewZDO_TrackShipMapZdos::Postfix(ZDO)
.locals 
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldc.i4.1
IL_0003: call System.Void LongshipUpgrades.LongshipUpgrades::TrackShipZdo(ZDO,System.Boolean)
IL_0008: nop
IL_0009: ret

// System.Void LongshipUpgrades.LongshipUpgrades/ZDOMan_CreateNewZDO_WithUid_TrackShipMapZdos::Postfix(ZDO)
.locals 
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldc.i4.1
IL_0003: call System.Void LongshipUpgrades.LongshipUpgrades::TrackShipZdo(ZDO,System.Boolean)
IL_0008: nop
IL_0009: ret

// System.Void LongshipUpgrades.LongshipUpgrades/ZDOMan_HandleDestroyedZDO_ClearShipMapStore::Prefix(ZDOID)
.locals 
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.Void LongshipUpgrades.LongshipUpgrades::RemoveShipMapData(ZDOID)
IL_0007: nop
IL_0008: ret

// System.Void LongshipUpgrades.LongshipUpgrades/ZDO_Deserialize_TrackShipMapData::Postfix(ZDO)
.locals 
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldc.i4.1
IL_0003: call System.Void LongshipUpgrades.LongshipUpgrades::TrackShipZdo(ZDO,System.Boolean)
IL_0008: nop
IL_0009: ret

// System.Void LongshipUpgrades.LongshipUpgrades/ZDOMan_PrepareSave_InjectShipMapData::Prefix(LongshipUpgrades.LongshipUpgrades/ShipMapSaveState&)
.locals System.Boolean, System.Boolean
IL_0000: nop
IL_0001: call ZNet ZNet::get_instance()
IL_0006: ldnull
IL_0007: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_000c: brtrue.s IL_001d
IL_000e: call ZNet ZNet::get_instance()
IL_0013: callvirt System.Boolean ZNet::IsServer()
IL_0018: ldc.i4.0
IL_0019: ceq
IL_001b: br.s IL_001e
IL_001d: ldc.i4.1
IL_001e: stloc.0
IL_001f: ldloc.0
IL_0020: brfalse.s IL_0024
IL_0022: br.s IL_0048
IL_0024: ldc.i4.1
IL_0025: call System.Void LongshipUpgrades.LongshipUpgrades::ApplyShipMapConfiguration(System.Boolean)
IL_002a: nop
IL_002b: call System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
IL_0030: ldc.i4.0
IL_0031: ceq
IL_0033: stloc.1
IL_0034: ldloc.1
IL_0035: brfalse.s IL_0039
IL_0037: br.s IL_0048
IL_0039: ldarg.0
IL_003a: newobj System.Void LongshipUpgrades.LongshipUpgrades/ShipMapSaveState::.ctor()
IL_003f: stind.ref
IL_0040: ldarg.0
IL_0041: ldind.ref
IL_0042: call System.Void LongshipUpgrades.LongshipUpgrades::InjectShipMapDataForSave(LongshipUpgrades.LongshipUpgrades/ShipMapSaveState)
IL_0047: nop
IL_0048: ret

// System.Exception LongshipUpgrades.LongshipUpgrades/ZDOMan_PrepareSave_InjectShipMapData::Finalizer(LongshipUpgrades.LongshipUpgrades/ShipMapSaveState,System.Exception)
.locals System.Exception, System.Exception
IL_0000: nop
IL_0001: nop
IL_0002: ldarg.0
IL_0003: call System.Void LongshipUpgrades.LongshipUpgrades::RemoveShipMapSaveInjection(LongshipUpgrades.LongshipUpgrades/ShipMapSaveState)
IL_0008: nop
IL_0009: nop
IL_000a: leave.s IL_0028
IL_000c: stloc.0
IL_000d: nop
IL_000e: ldstr "Ship map save cleanup failed: {0}"
IL_0013: ldloc.0
IL_0014: call System.String System.String::Format(System.String,System.Object)
IL_0019: call System.Void LongshipUpgrades.LongshipUpgrades::LogWarning(System.Object)
IL_001e: nop
IL_001f: ldarg.1
IL_0020: dup
IL_0021: brtrue.s IL_0025
IL_0023: pop
IL_0024: ldloc.0
IL_0025: stloc.1
IL_0026: leave.s IL_002c
IL_0028: ldarg.1
IL_0029: stloc.1
IL_002a: br.s IL_002c
IL_002c: ldloc.1
IL_002d: ret
// EH Catch: 1 - 12 => 12 - 40

// System.Void LongshipUpgrades.LongshipUpgrades/ZDOMan_Update_PruneClientShipMapStore::Prefix()
.locals 
IL_0000: nop
IL_0001: ldc.i4.0
IL_0002: call System.Void LongshipUpgrades.LongshipUpgrades::ApplyShipMapConfiguration(System.Boolean)
IL_0007: nop
IL_0008: ret

// System.Void LongshipUpgrades.LongshipUpgrades/ZDOMan_Update_PruneClientShipMapStore::Postfix()
.locals 
IL_0000: nop
IL_0001: call System.Void LongshipUpgrades.LongshipUpgrades::PruneClientShipMapStore()
IL_0006: nop
IL_0007: ret

// System.Void LongshipUpgrades.LongshipUpgrades/Ship_UpdateControlls_SpeedLimitWithoutMast::Prefix(Ship)
.locals System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsControlledComponent(UnityEngine.Component)
IL_0007: ldc.i4.0
IL_0008: ceq
IL_000a: stloc.0
IL_000b: ldloc.0
IL_000c: brfalse.s IL_0010
IL_000e: br.s IL_0056
IL_0010: ldarg.0
IL_0011: ldfld ZNetView Ship::m_nview
IL_0016: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_001b: brfalse.s IL_004a
IL_001d: ldarg.0
IL_001e: ldfld ZNetView Ship::m_nview
IL_0023: callvirt System.Boolean ZNetView::IsValid()
IL_0028: brfalse.s IL_004a
IL_002a: ldarg.0
IL_002b: callvirt System.Boolean Ship::IsSailUp()
IL_0030: brfalse.s IL_004a
IL_0032: ldarg.0
IL_0033: ldfld ZNetView Ship::m_nview
IL_0038: callvirt ZDO ZNetView::GetZDO()
IL_003d: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_mastRemoved
IL_0042: ldc.i4.0
IL_0043: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_0048: br.s IL_004b
IL_004a: ldc.i4.0
IL_004b: stloc.1
IL_004c: ldloc.1
IL_004d: brfalse.s IL_0056
IL_004f: ldarg.0
IL_0050: ldc.i4.2
IL_0051: stfld Ship/Speed Ship::m_speed
IL_0056: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades/Container_Awake_CargoUpgrades::CheckAccess(Container)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.Boolean Container::m_checkGuardStone
IL_0007: brfalse.s IL_0022
IL_0009: ldarg.0
IL_000a: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_000f: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0014: ldc.r4 0
IL_0019: ldc.i4.0
IL_001a: ldc.i4.0
IL_001b: call System.Boolean PrivateArea::CheckAccess(UnityEngine.Vector3,System.Single,System.Boolean,System.Boolean)
IL_0020: brfalse.s IL_0039
IL_0022: ldarg.0
IL_0023: call Game Game::get_instance()
IL_0028: callvirt PlayerProfile Game::GetPlayerProfile()
IL_002d: callvirt System.Int64 PlayerProfile::GetPlayerID()
IL_0032: callvirt System.Boolean Container::CheckAccess(System.Int64)
IL_0037: br.s IL_003a
IL_0039: ldc.i4.0
IL_003a: stloc.0
IL_003b: br.s IL_003d
IL_003d: ldloc.0
IL_003e: ret

// System.Void LongshipUpgrades.LongshipUpgrades/Container_Awake_CargoUpgrades::Prefix(Container)
.locals ZNetView, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.String, System.Boolean, System.String
IL_0000: nop
IL_0001: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::containerEnabled
IL_0006: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000b: ldc.i4.0
IL_000c: ceq
IL_000e: stloc.1
IL_000f: ldloc.1
IL_0010: brfalse.s IL_0017
IL_0012: br IL_01a6
IL_0017: ldarg.0
IL_0018: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsControlledComponent(UnityEngine.Component)
IL_001d: ldc.i4.0
IL_001e: ceq
IL_0020: stloc.2
IL_0021: ldloc.2
IL_0022: brfalse.s IL_0029
IL_0024: br IL_01a6
IL_0029: ldarg.0
IL_002a: ldfld ZNetView Container::m_rootObjectOverride
IL_002f: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0034: brtrue.s IL_003e
IL_0036: ldarg.0
IL_0037: callvirt !!0 UnityEngine.Component::GetComponent<ZNetView>()
IL_003c: br.s IL_0049
IL_003e: ldarg.0
IL_003f: ldfld ZNetView Container::m_rootObjectOverride
IL_0044: callvirt !!0 UnityEngine.Component::GetComponent<ZNetView>()
IL_0049: stloc.0
IL_004a: ldloc.0
IL_004b: ldnull
IL_004c: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0051: brtrue.s IL_005e
IL_0053: ldloc.0
IL_0054: callvirt System.Boolean ZNetView::IsValid()
IL_0059: ldc.i4.0
IL_005a: ceq
IL_005c: br.s IL_005f
IL_005e: ldc.i4.1
IL_005f: stloc.3
IL_0060: ldloc.3
IL_0061: brfalse.s IL_0068
IL_0063: br IL_01a6
IL_0068: ldloc.0
IL_0069: callvirt ZDO ZNetView::GetZDO()
IL_006e: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_containerUpgradedLvl1
IL_0073: ldc.i4.0
IL_0074: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_0079: brfalse.s IL_008f
IL_007b: ldarg.0
IL_007c: ldfld System.Int32 Container::m_width
IL_0081: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerWidth
IL_0086: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_008b: clt
IL_008d: br.s IL_0090
IL_008f: ldc.i4.0
IL_0090: stloc.s V_4
IL_0092: ldloc.s V_4
IL_0094: brfalse.s IL_0107
IL_0096: nop
IL_0097: ldarg.0
IL_0098: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerWidth
IL_009d: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_00a2: stfld System.Int32 Container::m_width
IL_00a7: ldarg.0
IL_00a8: callvirt System.Type System.Object::GetType()
IL_00ad: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_00b2: stloc.s V_5
IL_00b4: ldloc.0
IL_00b5: callvirt ZDO ZNetView::GetZDO()
IL_00ba: ldstr "HasFields"
IL_00bf: ldc.i4.1
IL_00c0: callvirt System.Void ZDO::Set(System.String,System.Boolean)
IL_00c5: nop
IL_00c6: ldloc.0
IL_00c7: callvirt ZDO ZNetView::GetZDO()
IL_00cc: ldstr "HasFields"
IL_00d1: ldloc.s V_5
IL_00d3: call System.String System.String::Concat(System.String,System.String)
IL_00d8: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_00dd: ldc.i4.1
IL_00de: callvirt System.Void ZDO::Set(System.Int32,System.Boolean)
IL_00e3: nop
IL_00e4: ldloc.0
IL_00e5: callvirt ZDO ZNetView::GetZDO()
IL_00ea: ldloc.s V_5
IL_00ec: ldstr ".m_width"
IL_00f1: call System.String System.String::Concat(System.String,System.String)
IL_00f6: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerWidth
IL_00fb: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0100: callvirt System.Void ZDO::Set(System.String,System.Int32)
IL_0105: nop
IL_0106: nop
IL_0107: ldloc.0
IL_0108: callvirt ZDO ZNetView::GetZDO()
IL_010d: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_containerUpgradedLvl2
IL_0112: ldc.i4.0
IL_0113: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_0118: brfalse.s IL_012e
IL_011a: ldarg.0
IL_011b: ldfld System.Int32 Container::m_height
IL_0120: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerHeight
IL_0125: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_012a: clt
IL_012c: br.s IL_012f
IL_012e: ldc.i4.0
IL_012f: stloc.s V_6
IL_0131: ldloc.s V_6
IL_0133: brfalse.s IL_01a6
IL_0135: nop
IL_0136: ldarg.0
IL_0137: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerHeight
IL_013c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0141: stfld System.Int32 Container::m_height
IL_0146: ldarg.0
IL_0147: callvirt System.Type System.Object::GetType()
IL_014c: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_0151: stloc.s V_7
IL_0153: ldloc.0
IL_0154: callvirt ZDO ZNetView::GetZDO()
IL_0159: ldstr "HasFields"
IL_015e: ldc.i4.1
IL_015f: callvirt System.Void ZDO::Set(System.String,System.Boolean)
IL_0164: nop
IL_0165: ldloc.0
IL_0166: callvirt ZDO ZNetView::GetZDO()
IL_016b: ldstr "HasFields"
IL_0170: ldloc.s V_7
IL_0172: call System.String System.String::Concat(System.String,System.String)
IL_0177: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_017c: ldc.i4.1
IL_017d: callvirt System.Void ZDO::Set(System.Int32,System.Boolean)
IL_0182: nop
IL_0183: ldloc.0
IL_0184: callvirt ZDO ZNetView::GetZDO()
IL_0189: ldloc.s V_7
IL_018b: ldstr ".m_height"
IL_0190: call System.String System.String::Concat(System.String,System.String)
IL_0195: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> LongshipUpgrades.LongshipUpgrades::containerHeight
IL_019a: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_019f: callvirt System.Void ZDO::Set(System.String,System.Int32)
IL_01a4: nop
IL_01a5: nop
IL_01a6: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades/Ladder_GetHoverText_BoxClimb::Prefix(Ladder,System.String&)
.locals System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsBoxLadder(Ladder)
IL_0007: ldc.i4.0
IL_0008: ceq
IL_000a: stloc.0
IL_000b: ldloc.0
IL_000c: brfalse.s IL_0012
IL_000e: ldc.i4.1
IL_000f: stloc.1
IL_0010: br.s IL_005c
IL_0012: ldarg.0
IL_0013: ldsfld Player Player::m_localPlayer
IL_0018: callvirt System.Boolean Ladder::InUseDistance(Humanoid)
IL_001d: brfalse.s IL_002e
IL_001f: ldsfld Player Player::m_localPlayer
IL_0024: callvirt System.Boolean Character::IsAttached()
IL_0029: ldc.i4.0
IL_002a: ceq
IL_002c: br.s IL_002f
IL_002e: ldc.i4.0
IL_002f: stloc.2
IL_0030: ldloc.2
IL_0031: brfalse.s IL_0051
IL_0033: ldarg.1
IL_0034: call Localization Localization::get_instance()
IL_0039: ldarg.0
IL_003a: ldfld System.String Ladder::m_name
IL_003f: ldstr "
[<color=yellow><b>$KEY_Use</b></color>] $lu_box_climb"
IL_0044: call System.String System.String::Concat(System.String,System.String)
IL_0049: callvirt System.String Localization::Localize(System.String)
IL_004e: stind.ref
IL_004f: br.s IL_0058
IL_0051: ldarg.1
IL_0052: ldstr ""
IL_0057: stind.ref
IL_0058: ldc.i4.0
IL_0059: stloc.1
IL_005a: br.s IL_005c
IL_005c: ldloc.1
IL_005d: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades/Ladder_Interact_BoxClimb::Prefix(Ladder,Humanoid)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsBoxLadder(Ladder)
IL_0006: brfalse.s IL_0013
IL_0008: ldarg.1
IL_0009: callvirt System.Boolean Character::IsAttached()
IL_000e: ldc.i4.0
IL_000f: ceq
IL_0011: br.s IL_0014
IL_0013: ldc.i4.1
IL_0014: ret

// System.Void LongshipUpgrades.LongshipUpgrades/Ladder_Interact_BoxClimb::Postfix(Ladder,Humanoid,System.Boolean)
.locals System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsBoxLadder(Ladder)
IL_0007: ldc.i4.0
IL_0008: ceq
IL_000a: stloc.0
IL_000b: ldloc.0
IL_000c: brfalse.s IL_0010
IL_000e: br.s IL_004c
IL_0010: ldarg.2
IL_0011: brtrue.s IL_0027
IL_0013: ldarg.0
IL_0014: ldarg.1
IL_0015: callvirt System.Boolean Ladder::InUseDistance(Humanoid)
IL_001a: brfalse.s IL_0027
IL_001c: ldarg.1
IL_001d: callvirt System.Boolean Character::IsAttached()
IL_0022: ldc.i4.0
IL_0023: ceq
IL_0025: br.s IL_0028
IL_0027: ldc.i4.0
IL_0028: stloc.1
IL_0029: ldloc.1
IL_002a: brfalse.s IL_004c
IL_002c: nop
IL_002d: ldarg.1
IL_002e: ldarg.0
IL_002f: ldfld UnityEngine.Transform Ladder::m_targetPos
IL_0034: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_forward()
IL_0039: callvirt System.Void Character::SetMoveDir(UnityEngine.Vector3)
IL_003e: nop
IL_003f: ldarg.1
IL_0040: call System.Single UnityEngine.Time::get_deltaTime()
IL_0045: callvirt System.Void Character::UpdateWalking(System.Single)
IL_004a: nop
IL_004b: nop
IL_004c: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades/MapTable_OnRead_TrackCompressionContext::Prefix(MapTable,System.Boolean&)
.locals System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: ldc.i4.0
IL_0003: stind.i1
IL_0004: ldarg.0
IL_0005: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsShipMapTable(MapTable)
IL_000a: ldc.i4.0
IL_000b: ceq
IL_000d: stloc.0
IL_000e: ldloc.0
IL_000f: brfalse.s IL_0015
IL_0011: ldc.i4.1
IL_0012: stloc.1
IL_0013: br.s IL_0073
IL_0015: call System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
IL_001a: ldc.i4.0
IL_001b: ceq
IL_001d: stloc.2
IL_001e: ldloc.2
IL_001f: brfalse.s IL_0025
IL_0021: ldc.i4.0
IL_0022: stloc.1
IL_0023: br.s IL_0073
IL_0025: ldarg.0
IL_0026: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsValidMapTable(MapTable)
IL_002b: stloc.3
IL_002c: ldloc.3
IL_002d: brfalse.s IL_0040
IL_002f: ldarg.0
IL_0030: ldfld ZNetView MapTable::m_nview
IL_0035: callvirt ZDO ZNetView::GetZDO()
IL_003a: call System.Boolean LongshipUpgrades.LongshipUpgrades::InjectShipMapDataIntoZdo(ZDO)
IL_003f: pop
IL_0040: ldsfld System.Collections.Generic.Stack`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::s_mapTableDataCompressionFlags
IL_0045: ldarg.0
IL_0046: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsValidMapTable(MapTable)
IL_004b: brfalse.s IL_0065
IL_004d: ldarg.0
IL_004e: ldfld ZNetView MapTable::m_nview
IL_0053: callvirt ZDO ZNetView::GetZDO()
IL_0058: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_mapDataCompressed
IL_005d: ldc.i4.0
IL_005e: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_0063: br.s IL_0066
IL_0065: ldc.i4.0
IL_0066: callvirt System.Void System.Collections.Generic.Stack`1<System.Boolean>::Push(!0)
IL_006b: nop
IL_006c: ldarg.1
IL_006d: ldc.i4.1
IL_006e: stind.i1
IL_006f: ldc.i4.1
IL_0070: stloc.1
IL_0071: br.s IL_0073
IL_0073: ldloc.1
IL_0074: ret

// System.Exception LongshipUpgrades.LongshipUpgrades/MapTable_OnRead_TrackCompressionContext::Finalizer(MapTable,System.Boolean,System.Exception)
.locals System.Boolean, System.Boolean, System.Boolean, System.Exception
IL_0000: nop
IL_0001: ldarg.1
IL_0002: stloc.0
IL_0003: ldloc.0
IL_0004: brfalse.s IL_004e
IL_0006: nop
IL_0007: ldsfld System.Int32 LongshipUpgrades.LongshipUpgrades::s_mapTableWriteDepth
IL_000c: brtrue.s IL_0016
IL_000e: ldarg.0
IL_000f: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsValidMapTable(MapTable)
IL_0014: br.s IL_0017
IL_0016: ldc.i4.0
IL_0017: stloc.1
IL_0018: ldloc.1
IL_0019: brfalse.s IL_0031
IL_001b: ldarg.0
IL_001c: ldfld ZNetView MapTable::m_nview
IL_0021: callvirt ZDO ZNetView::GetZDO()
IL_0026: ldfld ZDOID ZDO::m_uid
IL_002b: call System.Boolean LongshipUpgrades.LongshipUpgrades::RemoveShipMapDataFromRuntime(ZDOID)
IL_0030: pop
IL_0031: ldsfld System.Collections.Generic.Stack`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::s_mapTableDataCompressionFlags
IL_0036: callvirt System.Int32 System.Collections.Generic.Stack`1<System.Boolean>::get_Count()
IL_003b: ldc.i4.0
IL_003c: cgt
IL_003e: stloc.2
IL_003f: ldloc.2
IL_0040: brfalse.s IL_004d
IL_0042: ldsfld System.Collections.Generic.Stack`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::s_mapTableDataCompressionFlags
IL_0047: callvirt !0 System.Collections.Generic.Stack`1<System.Boolean>::Pop()
IL_004c: pop
IL_004d: nop
IL_004e: ldarg.2
IL_004f: stloc.3
IL_0050: br.s IL_0052
IL_0052: ldloc.3
IL_0053: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades/MapTable_OnWrite_ScaleWriteEffects::Prefix(MapTable,System.Boolean&)
.locals System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: ldc.i4.0
IL_0003: stind.i1
IL_0004: ldarg.0
IL_0005: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsShipMapTable(MapTable)
IL_000a: brfalse.s IL_0013
IL_000c: call System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
IL_0011: br.s IL_0014
IL_0013: ldc.i4.0
IL_0014: stsfld System.Boolean LongshipUpgrades.LongshipUpgrades/MapTable_OnWrite_ScaleWriteEffects::inCall
IL_0019: ldarg.0
IL_001a: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsShipMapTable(MapTable)
IL_001f: ldc.i4.0
IL_0020: ceq
IL_0022: stloc.0
IL_0023: ldloc.0
IL_0024: brfalse.s IL_002a
IL_0026: ldc.i4.1
IL_0027: stloc.1
IL_0028: br.s IL_0094
IL_002a: call System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
IL_002f: ldc.i4.0
IL_0030: ceq
IL_0032: stloc.2
IL_0033: ldloc.2
IL_0034: brfalse.s IL_003a
IL_0036: ldc.i4.0
IL_0037: stloc.1
IL_0038: br.s IL_0094
IL_003a: ldarg.0
IL_003b: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsValidMapTable(MapTable)
IL_0040: stloc.3
IL_0041: ldloc.3
IL_0042: brfalse.s IL_0055
IL_0044: ldarg.0
IL_0045: ldfld ZNetView MapTable::m_nview
IL_004a: callvirt ZDO ZNetView::GetZDO()
IL_004f: call System.Boolean LongshipUpgrades.LongshipUpgrades::InjectShipMapDataIntoZdo(ZDO)
IL_0054: pop
IL_0055: ldsfld System.Collections.Generic.Stack`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::s_mapTableDataCompressionFlags
IL_005a: ldarg.0
IL_005b: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsValidMapTable(MapTable)
IL_0060: brfalse.s IL_007a
IL_0062: ldarg.0
IL_0063: ldfld ZNetView MapTable::m_nview
IL_0068: callvirt ZDO ZNetView::GetZDO()
IL_006d: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_mapDataCompressed
IL_0072: ldc.i4.0
IL_0073: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_0078: br.s IL_007b
IL_007a: ldc.i4.0
IL_007b: callvirt System.Void System.Collections.Generic.Stack`1<System.Boolean>::Push(!0)
IL_0080: nop
IL_0081: ldsfld System.Int32 LongshipUpgrades.LongshipUpgrades::s_mapTableWriteDepth
IL_0086: ldc.i4.1
IL_0087: add
IL_0088: stsfld System.Int32 LongshipUpgrades.LongshipUpgrades::s_mapTableWriteDepth
IL_008d: ldarg.1
IL_008e: ldc.i4.1
IL_008f: stind.i1
IL_0090: ldc.i4.1
IL_0091: stloc.1
IL_0092: br.s IL_0094
IL_0094: ldloc.1
IL_0095: ret

// System.Exception LongshipUpgrades.LongshipUpgrades/MapTable_OnWrite_ScaleWriteEffects::Finalizer(MapTable,System.Boolean,System.Exception)
.locals System.Boolean, System.Boolean, System.Boolean, System.Exception
IL_0000: nop
IL_0001: ldc.i4.0
IL_0002: stsfld System.Boolean LongshipUpgrades.LongshipUpgrades/MapTable_OnWrite_ScaleWriteEffects::inCall
IL_0007: ldarg.1
IL_0008: stloc.0
IL_0009: ldloc.0
IL_000a: brfalse.s IL_005c
IL_000c: nop
IL_000d: ldarg.0
IL_000e: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsValidMapTable(MapTable)
IL_0013: stloc.1
IL_0014: ldloc.1
IL_0015: brfalse.s IL_002d
IL_0017: ldarg.0
IL_0018: ldfld ZNetView MapTable::m_nview
IL_001d: callvirt ZDO ZNetView::GetZDO()
IL_0022: ldfld ZDOID ZDO::m_uid
IL_0027: call System.Boolean LongshipUpgrades.LongshipUpgrades::RemoveShipMapDataFromRuntime(ZDOID)
IL_002c: pop
IL_002d: ldsfld System.Collections.Generic.Stack`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::s_mapTableDataCompressionFlags
IL_0032: callvirt System.Int32 System.Collections.Generic.Stack`1<System.Boolean>::get_Count()
IL_0037: ldc.i4.0
IL_0038: cgt
IL_003a: stloc.2
IL_003b: ldloc.2
IL_003c: brfalse.s IL_0049
IL_003e: ldsfld System.Collections.Generic.Stack`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::s_mapTableDataCompressionFlags
IL_0043: callvirt !0 System.Collections.Generic.Stack`1<System.Boolean>::Pop()
IL_0048: pop
IL_0049: ldc.i4.0
IL_004a: ldsfld System.Int32 LongshipUpgrades.LongshipUpgrades::s_mapTableWriteDepth
IL_004f: ldc.i4.1
IL_0050: sub
IL_0051: call System.Int32 System.Math::Max(System.Int32,System.Int32)
IL_0056: stsfld System.Int32 LongshipUpgrades.LongshipUpgrades::s_mapTableWriteDepth
IL_005b: nop
IL_005c: ldarg.2
IL_005d: stloc.3
IL_005e: br.s IL_0060
IL_0060: ldloc.3
IL_0061: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades/MapTable_RPC_MapData_MarkCompressed::Prefix(MapTable,System.Byte[]&)
.locals ZDO, LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: ldnull
IL_0003: stind.ref
IL_0004: ldarg.0
IL_0005: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsShipMapTable(MapTable)
IL_000a: ldc.i4.0
IL_000b: ceq
IL_000d: stloc.2
IL_000e: ldloc.2
IL_000f: brfalse.s IL_0018
IL_0011: ldc.i4.1
IL_0012: stloc.3
IL_0013: br IL_00a8
IL_0018: call System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
IL_001d: ldc.i4.0
IL_001e: ceq
IL_0020: stloc.s V_4
IL_0022: ldloc.s V_4
IL_0024: brfalse.s IL_002a
IL_0026: ldc.i4.0
IL_0027: stloc.3
IL_0028: br.s IL_00a8
IL_002a: ldarg.0
IL_002b: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsValidMapTable(MapTable)
IL_0030: brfalse.s IL_0042
IL_0032: ldarg.0
IL_0033: ldfld ZNetView MapTable::m_nview
IL_0038: callvirt System.Boolean ZNetView::IsOwner()
IL_003d: ldc.i4.0
IL_003e: ceq
IL_0040: br.s IL_0043
IL_0042: ldc.i4.1
IL_0043: stloc.s V_5
IL_0045: ldloc.s V_5
IL_0047: brfalse.s IL_004d
IL_0049: ldc.i4.1
IL_004a: stloc.3
IL_004b: br.s IL_00a8
IL_004d: ldarg.0
IL_004e: ldfld ZNetView MapTable::m_nview
IL_0053: callvirt ZDO ZNetView::GetZDO()
IL_0058: stloc.0
IL_0059: ldloc.0
IL_005a: call System.Boolean LongshipUpgrades.LongshipUpgrades::InjectShipMapDataIntoZdo(ZDO)
IL_005f: pop
IL_0060: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,System.Byte[]>> ZDOExtraData::s_byteArrays
IL_0065: ldloc.0
IL_0066: ldfld ZDOID ZDO::m_uid
IL_006b: call System.Void LongshipUpgrades.LongshipUpgrades::DetachZdoFields<System.Byte[]>(System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,T>>,ZDOID)
IL_0070: nop
IL_0071: ldloc.0
IL_0072: ldfld ZDOID ZDO::m_uid
IL_0077: ldloca.s V_1
IL_0079: call System.Boolean LongshipUpgrades.LongshipUpgrades::TryGetShipMapData(ZDOID,LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry&)
IL_007e: brfalse.s IL_008b
IL_0080: ldloc.1
IL_0081: ldfld System.Byte[] LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Data
IL_0086: ldnull
IL_0087: cgt.un
IL_0089: br.s IL_008c
IL_008b: ldc.i4.0
IL_008c: stloc.s V_6
IL_008e: ldloc.s V_6
IL_0090: brfalse.s IL_00a4
IL_0092: ldarg.1
IL_0093: ldloc.1
IL_0094: ldfld System.Byte[] LongshipUpgrades.LongshipUpgrades/ShipMapDataEntry::Data
IL_0099: callvirt System.Object System.Array::Clone()
IL_009e: castclass System.Byte[]
IL_00a3: stind.ref
IL_00a4: ldc.i4.1
IL_00a5: stloc.3
IL_00a6: br.s IL_00a8
IL_00a8: ldloc.3
IL_00a9: ret

// System.Void LongshipUpgrades.LongshipUpgrades/MapTable_RPC_MapData_MarkCompressed::Postfix(MapTable,System.Byte[])
.locals ZDO, System.Byte[], System.Boolean, System.Int32, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: call System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
IL_0006: brfalse.s IL_0028
IL_0008: ldarg.0
IL_0009: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsShipMapTable(MapTable)
IL_000e: brfalse.s IL_0028
IL_0010: ldarg.0
IL_0011: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsValidMapTable(MapTable)
IL_0016: brfalse.s IL_0028
IL_0018: ldarg.0
IL_0019: ldfld ZNetView MapTable::m_nview
IL_001e: callvirt System.Boolean ZNetView::IsOwner()
IL_0023: ldc.i4.0
IL_0024: ceq
IL_0026: br.s IL_0029
IL_0028: ldc.i4.1
IL_0029: stloc.s V_4
IL_002b: ldloc.s V_4
IL_002d: brfalse.s IL_0034
IL_002f: br IL_010b
IL_0034: ldarg.0
IL_0035: ldfld ZNetView MapTable::m_nview
IL_003a: callvirt ZDO ZNetView::GetZDO()
IL_003f: stloc.0
IL_0040: ldloc.0
IL_0041: ldsfld System.Int32 ZDOVars::s_data
IL_0046: ldnull
IL_0047: callvirt System.Byte[] ZDO::GetByteArray(System.Int32,System.Byte[])
IL_004c: stloc.1
IL_004d: ldarg.1
IL_004e: brfalse.s IL_0067
IL_0050: ldloc.1
IL_0051: brfalse.s IL_0064
IL_0053: call System.Collections.IEqualityComparer System.Collections.StructuralComparisons::get_StructuralEqualityComparer()
IL_0058: ldarg.1
IL_0059: ldloc.1
IL_005a: callvirt System.Boolean System.Collections.IEqualityComparer::Equals(System.Object,System.Object)
IL_005f: ldc.i4.0
IL_0060: ceq
IL_0062: br.s IL_0065
IL_0064: ldc.i4.1
IL_0065: br.s IL_006b
IL_0067: ldloc.1
IL_0068: ldnull
IL_0069: cgt.un
IL_006b: stloc.2
IL_006c: ldloc.0
IL_006d: ldsfld System.Int32 LongshipUpgrades.LongshipUpgrades::s_shipMapDataRevision
IL_0072: ldc.i4.0
IL_0073: callvirt System.Int32 ZDO::GetInt(System.Int32,System.Int32)
IL_0078: ldloc.0
IL_0079: ldfld ZDOID ZDO::m_uid
IL_007e: call System.Int32 LongshipUpgrades.LongshipUpgrades::GetShipMapRevision(ZDOID)
IL_0083: call System.Int32 System.Math::Max(System.Int32,System.Int32)
IL_0088: stloc.3
IL_0089: ldloc.1
IL_008a: ldnull
IL_008b: cgt.un
IL_008d: stloc.s V_5
IL_008f: ldloc.s V_5
IL_0091: brfalse.s IL_00ff
IL_0093: nop
IL_0094: ldloc.2
IL_0095: brtrue.s IL_00a0
IL_0097: ldc.i4.1
IL_0098: ldloc.3
IL_0099: call System.Int32 System.Math::Max(System.Int32,System.Int32)
IL_009e: br.s IL_00a9
IL_00a0: ldc.i4.1
IL_00a1: ldloc.3
IL_00a2: ldc.i4.1
IL_00a3: add
IL_00a4: call System.Int32 System.Math::Max(System.Int32,System.Int32)
IL_00a9: stloc.3
IL_00aa: ldloc.0
IL_00ab: ldfld ZDOID ZDO::m_uid
IL_00b0: ldloc.3
IL_00b1: ldloc.1
IL_00b2: call System.Boolean LongshipUpgrades.LongshipUpgrades::SetShipMapData(ZDOID,System.Int32,System.Byte[])
IL_00b7: pop
IL_00b8: ldloc.0
IL_00b9: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_mapDataCompressed
IL_00be: ldc.i4.1
IL_00bf: call System.Void LongshipUpgrades.LongshipUpgrades::SetShipMapInt(ZDO,System.Int32,System.Int32)
IL_00c4: nop
IL_00c5: ldloc.0
IL_00c6: ldloc.3
IL_00c7: newobj System.Void System.Nullable`1<System.Int32>::.ctor(!0)
IL_00cc: call System.Int32 LongshipUpgrades.LongshipUpgrades::SyncShipMapRevision(ZDO,System.Nullable`1<System.Int32>)
IL_00d1: pop
IL_00d2: call ZNet ZNet::get_instance()
IL_00d7: ldnull
IL_00d8: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_00dd: brfalse.s IL_00ee
IL_00df: call ZNet ZNet::get_instance()
IL_00e4: callvirt System.Boolean ZNet::IsServer()
IL_00e9: ldc.i4.0
IL_00ea: ceq
IL_00ec: br.s IL_00ef
IL_00ee: ldc.i4.0
IL_00ef: stloc.s V_6
IL_00f1: ldloc.s V_6
IL_00f3: brfalse.s IL_00fe
IL_00f5: ldloc.0
IL_00f6: ldloc.3
IL_00f7: ldloc.1
IL_00f8: call System.Void LongshipUpgrades.LongshipUpgrades::SubmitShipMapDataToServer(ZDO,System.Int32,System.Byte[])
IL_00fd: nop
IL_00fe: nop
IL_00ff: ldloc.0
IL_0100: ldfld ZDOID ZDO::m_uid
IL_0105: call System.Boolean LongshipUpgrades.LongshipUpgrades::RemoveShipMapDataFromRuntime(ZDOID)
IL_010a: pop
IL_010b: ret

// System.Void LongshipUpgrades.LongshipUpgrades/ZDO_Serialize_SkipUnchangedShipMapData::Prefix(ZDO,LongshipUpgrades.LongshipUpgrades/ZDO_Serialize_SkipUnchangedShipMapData/SerializeState&)
.locals BinarySearchDictionary`2<System.Int32,System.Byte[]>, System.Byte[], System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: initobj LongshipUpgrades.LongshipUpgrades/ZDO_Serialize_SkipUnchangedShipMapData/SerializeState
IL_0008: ldarg.0
IL_0009: callvirt System.Int32 ZDO::GetPrefab()
IL_000e: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::prefabInt
IL_0013: ceq
IL_0015: ldc.i4.0
IL_0016: ceq
IL_0018: stloc.2
IL_0019: ldloc.2
IL_001a: brfalse.s IL_001e
IL_001c: br.s IL_0095
IL_001e: call System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
IL_0023: ldc.i4.0
IL_0024: ceq
IL_0026: stloc.3
IL_0027: ldloc.3
IL_0028: brfalse.s IL_0034
IL_002a: nop
IL_002b: ldarg.0
IL_002c: call System.Boolean LongshipUpgrades.LongshipUpgrades::PurgeShipMapData(ZDO)
IL_0031: pop
IL_0032: br.s IL_0095
IL_0034: ldarg.0
IL_0035: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_mapDataCompressed
IL_003a: ldc.i4.0
IL_003b: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_0040: ldc.i4.0
IL_0041: ceq
IL_0043: stloc.s V_4
IL_0045: ldloc.s V_4
IL_0047: brfalse.s IL_004b
IL_0049: br.s IL_0095
IL_004b: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,System.Byte[]>> ZDOExtraData::s_byteArrays
IL_0050: ldarg.0
IL_0051: ldfld ZDOID ZDO::m_uid
IL_0056: ldloca.s V_0
IL_0058: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZDOID,BinarySearchDictionary`2<System.Int32,System.Byte[]>>::TryGetValue(!0,!1&)
IL_005d: brfalse.s IL_0074
IL_005f: ldloc.0
IL_0060: ldsfld System.Int32 ZDOVars::s_data
IL_0065: ldloca.s V_1
IL_0067: callvirt System.Boolean BinarySearchDictionary`2<System.Int32,System.Byte[]>::TryGetValue(!0,!1&)
IL_006c: brfalse.s IL_0074
IL_006e: ldloc.1
IL_006f: ldnull
IL_0070: ceq
IL_0072: br.s IL_0075
IL_0074: ldc.i4.1
IL_0075: stloc.s V_5
IL_0077: ldloc.s V_5
IL_0079: brfalse.s IL_007d
IL_007b: br.s IL_0095
IL_007d: ldarg.1
IL_007e: ldloc.1
IL_007f: stfld System.Byte[] LongshipUpgrades.LongshipUpgrades/ZDO_Serialize_SkipUnchangedShipMapData/SerializeState::Data
IL_0084: ldarg.1
IL_0085: ldarg.0
IL_0086: ldfld ZDOID ZDO::m_uid
IL_008b: call System.Boolean LongshipUpgrades.LongshipUpgrades::RemoveShipMapDataFromRuntime(ZDOID)
IL_0090: stfld System.Boolean LongshipUpgrades.LongshipUpgrades/ZDO_Serialize_SkipUnchangedShipMapData/SerializeState::Removed
IL_0095: ret

// System.Void LongshipUpgrades.LongshipUpgrades/ZDO_Serialize_SkipUnchangedShipMapData::Finalizer(ZDO,LongshipUpgrades.LongshipUpgrades/ZDO_Serialize_SkipUnchangedShipMapData/SerializeState)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: ldfld System.Boolean LongshipUpgrades.LongshipUpgrades/ZDO_Serialize_SkipUnchangedShipMapData/SerializeState::Removed
IL_0007: brfalse.s IL_0018
IL_0009: call System.Boolean LongshipUpgrades.LongshipUpgrades::get_ShipMapsEnabled()
IL_000e: brfalse.s IL_0018
IL_0010: ldarg.0
IL_0011: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsShipZdo(ZDO)
IL_0016: br.s IL_0019
IL_0018: ldc.i4.0
IL_0019: stloc.0
IL_001a: ldloc.0
IL_001b: brfalse.s IL_002f
IL_001d: ldarg.0
IL_001e: ldfld ZDOID ZDO::m_uid
IL_0023: ldarg.1
IL_0024: ldfld System.Byte[] LongshipUpgrades.LongshipUpgrades/ZDO_Serialize_SkipUnchangedShipMapData/SerializeState::Data
IL_0029: call System.Void LongshipUpgrades.LongshipUpgrades::SetShipMapDataInRuntime(ZDOID,System.Byte[])
IL_002e: nop
IL_002f: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades/Minimap_ReadExploredArray_CompressedShipMapData::Prefix(Minimap,ZPackage,System.Collections.Generic.List`1<System.Boolean>&)
.locals System.Int32, System.Byte[], System.Collections.BitArray, System.Collections.Generic.List`1<System.Boolean>, System.Boolean, System.Boolean, System.Boolean, System.Int32, System.Int32, System.Boolean
IL_0000: nop
IL_0001: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsCompressedMapDataContext()
IL_0006: ldc.i4.0
IL_0007: ceq
IL_0009: stloc.s V_4
IL_000b: ldloc.s V_4
IL_000d: brfalse.s IL_0017
IL_000f: ldc.i4.1
IL_0010: stloc.s V_5
IL_0012: br IL_00eb
IL_0017: ldarg.1
IL_0018: callvirt System.Int32 ZPackage::ReadInt()
IL_001d: stloc.0
IL_001e: ldloc.0
IL_001f: ldarg.0
IL_0020: ldfld System.Collections.BitArray Minimap::m_explored
IL_0025: callvirt System.Int32 System.Collections.BitArray::get_Length()
IL_002a: ceq
IL_002c: ldc.i4.0
IL_002d: ceq
IL_002f: stloc.s V_6
IL_0031: ldloc.s V_6
IL_0033: brfalse.s IL_006e
IL_0035: nop
IL_0036: ldstr "Map exploration array size missmatch:"
IL_003b: ldloca.s V_0
IL_003d: call System.String System.Int32::ToString()
IL_0042: ldstr " VS "
IL_0047: ldarg.0
IL_0048: ldfld System.Collections.BitArray Minimap::m_explored
IL_004d: callvirt System.Int32 System.Collections.BitArray::get_Length()
IL_0052: stloc.s V_7
IL_0054: ldloca.s V_7
IL_0056: call System.String System.Int32::ToString()
IL_005b: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_0060: call System.Void ZLog::LogWarning(System.Object)
IL_0065: nop
IL_0066: ldarg.2
IL_0067: ldnull
IL_0068: stind.ref
IL_0069: ldc.i4.0
IL_006a: stloc.s V_5
IL_006c: br.s IL_00eb
IL_006e: ldarg.1
IL_006f: callvirt System.Byte[] ZPackage::ReadByteArray()
IL_0074: stloc.1
IL_0075: ldloc.1
IL_0076: newobj System.Void System.Collections.BitArray::.ctor(System.Byte[])
IL_007b: stloc.2
IL_007c: ldloc.0
IL_007d: newobj System.Void System.Collections.Generic.List`1<System.Boolean>::.ctor(System.Int32)
IL_0082: stloc.3
IL_0083: ldc.i4.0
IL_0084: stloc.s V_8
IL_0086: br.s IL_00aa
IL_0088: ldloc.3
IL_0089: ldloc.s V_8
IL_008b: ldloc.2
IL_008c: callvirt System.Int32 System.Collections.BitArray::get_Count()
IL_0091: bge.s IL_009d
IL_0093: ldloc.2
IL_0094: ldloc.s V_8
IL_0096: callvirt System.Boolean System.Collections.BitArray::get_Item(System.Int32)
IL_009b: br.s IL_009e
IL_009d: ldc.i4.0
IL_009e: callvirt System.Void System.Collections.Generic.List`1<System.Boolean>::Add(!0)
IL_00a3: nop
IL_00a4: ldloc.s V_8
IL_00a6: ldc.i4.1
IL_00a7: add
IL_00a8: stloc.s V_8
IL_00aa: ldloc.s V_8
IL_00ac: ldloc.0
IL_00ad: clt
IL_00af: stloc.s V_9
IL_00b1: ldloc.s V_9
IL_00b3: brtrue.s IL_0088
IL_00b5: ldstr "Ship map data read: explored payload unpacked {0} -> {1} bytes ({2} bytes added)"
IL_00ba: ldloc.1
IL_00bb: ldlen
IL_00bc: conv.i4
IL_00bd: box System.Int32
IL_00c2: ldloc.0
IL_00c3: box System.Int32
IL_00c8: ldc.i4.0
IL_00c9: ldloc.0
IL_00ca: ldloc.1
IL_00cb: ldlen
IL_00cc: conv.i4
IL_00cd: sub
IL_00ce: call System.Int32 System.Math::Max(System.Int32,System.Int32)
IL_00d3: box System.Int32
IL_00d8: call System.String System.String::Format(System.String,System.Object,System.Object,System.Object)
IL_00dd: call System.Void LongshipUpgrades.LongshipUpgrades::LogInfo(System.Object)
IL_00e2: nop
IL_00e3: ldarg.2
IL_00e4: ldloc.3
IL_00e5: stind.ref
IL_00e6: ldc.i4.0
IL_00e7: stloc.s V_5
IL_00e9: br.s IL_00eb
IL_00eb: ldloc.s V_5
IL_00ed: ret

// System.Void LongshipUpgrades.LongshipUpgrades/Minimap_GetSharedMapData_CompressShipMapData::Postfix(System.Byte[]&)
.locals ZPackage, System.Int32, System.Int32, System.Boolean[], System.Collections.BitArray, System.Byte[], ZPackage, System.Boolean, System.Int32, System.Boolean, System.Boolean, System.Int32, System.Int32, System.Int64, System.String, UnityEngine.Vector3, System.Int32, System.Boolean, System.String, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldsfld System.Int32 LongshipUpgrades.LongshipUpgrades::s_mapTableWriteDepth
IL_0006: ldc.i4.0
IL_0007: ceq
IL_0009: stloc.s V_7
IL_000b: ldloc.s V_7
IL_000d: brfalse.s IL_0014
IL_000f: br IL_019b
IL_0014: ldarg.0
IL_0015: ldind.ref
IL_0016: newobj System.Void ZPackage::.ctor(System.Byte[])
IL_001b: stloc.0
IL_001c: ldloc.0
IL_001d: callvirt System.Int32 ZPackage::ReadInt()
IL_0022: stloc.1
IL_0023: ldloc.0
IL_0024: callvirt System.Int32 ZPackage::ReadInt()
IL_0029: stloc.2
IL_002a: ldloc.2
IL_002b: newarr System.Boolean
IL_0030: stloc.3
IL_0031: ldc.i4.0
IL_0032: stloc.s V_8
IL_0034: br.s IL_0046
IL_0036: ldloc.3
IL_0037: ldloc.s V_8
IL_0039: ldloc.0
IL_003a: callvirt System.Boolean ZPackage::ReadBool()
IL_003f: stelem.i1
IL_0040: ldloc.s V_8
IL_0042: ldc.i4.1
IL_0043: add
IL_0044: stloc.s V_8
IL_0046: ldloc.s V_8
IL_0048: ldloc.2
IL_0049: clt
IL_004b: stloc.s V_9
IL_004d: ldloc.s V_9
IL_004f: brtrue.s IL_0036
IL_0051: ldloc.3
IL_0052: newobj System.Void System.Collections.BitArray::.ctor(System.Boolean[])
IL_0057: stloc.s V_4
IL_0059: ldloc.s V_4
IL_005b: callvirt System.Int32 System.Collections.BitArray::get_Length()
IL_0060: ldc.i4.1
IL_0061: sub
IL_0062: ldc.i4.8
IL_0063: div
IL_0064: ldc.i4.1
IL_0065: add
IL_0066: newarr System.Byte
IL_006b: stloc.s V_5
IL_006d: ldloc.s V_4
IL_006f: ldloc.s V_5
IL_0071: ldc.i4.0
IL_0072: callvirt System.Void System.Collections.BitArray::CopyTo(System.Array,System.Int32)
IL_0077: nop
IL_0078: ldstr "Ship map data write: explored payload compressed {0} -> {1} bytes ({2} bytes saved)"
IL_007d: ldloc.2
IL_007e: box System.Int32
IL_0083: ldloc.s V_5
IL_0085: ldlen
IL_0086: conv.i4
IL_0087: box System.Int32
IL_008c: ldc.i4.0
IL_008d: ldloc.2
IL_008e: ldloc.s V_5
IL_0090: ldlen
IL_0091: conv.i4
IL_0092: sub
IL_0093: call System.Int32 System.Math::Max(System.Int32,System.Int32)
IL_0098: box System.Int32
IL_009d: call System.String System.String::Format(System.String,System.Object,System.Object,System.Object)
IL_00a2: call System.Void LongshipUpgrades.LongshipUpgrades::LogInfo(System.Object)
IL_00a7: nop
IL_00a8: newobj System.Void ZPackage::.ctor()
IL_00ad: stloc.s V_6
IL_00af: ldloc.s V_6
IL_00b1: ldloc.1
IL_00b2: callvirt System.Void ZPackage::Write(System.Int32)
IL_00b7: nop
IL_00b8: ldloc.s V_6
IL_00ba: ldloc.2
IL_00bb: callvirt System.Void ZPackage::Write(System.Int32)
IL_00c0: nop
IL_00c1: ldloc.s V_6
IL_00c3: ldloc.s V_5
IL_00c5: callvirt System.Void ZPackage::Write(System.Byte[])
IL_00ca: nop
IL_00cb: ldloc.1
IL_00cc: ldc.i4.2
IL_00cd: clt
IL_00cf: ldc.i4.0
IL_00d0: ceq
IL_00d2: stloc.s V_10
IL_00d4: ldloc.s V_10
IL_00d6: brfalse IL_0192
IL_00db: nop
IL_00dc: ldloc.0
IL_00dd: callvirt System.Int32 ZPackage::ReadInt()
IL_00e2: stloc.s V_11
IL_00e4: ldloc.s V_6
IL_00e6: ldloc.s V_11
IL_00e8: callvirt System.Void ZPackage::Write(System.Int32)
IL_00ed: nop
IL_00ee: ldc.i4.0
IL_00ef: stloc.s V_12
IL_00f1: br IL_0182
IL_00f6: nop
IL_00f7: ldloc.0
IL_00f8: callvirt System.Int64 ZPackage::ReadLong()
IL_00fd: stloc.s V_13
IL_00ff: ldloc.0
IL_0100: callvirt System.String ZPackage::ReadString()
IL_0105: stloc.s V_14
IL_0107: ldloc.0
IL_0108: callvirt UnityEngine.Vector3 ZPackage::ReadVector3()
IL_010d: stloc.s V_15
IL_010f: ldloc.0
IL_0110: callvirt System.Int32 ZPackage::ReadInt()
IL_0115: stloc.s V_16
IL_0117: ldloc.0
IL_0118: callvirt System.Boolean ZPackage::ReadBool()
IL_011d: stloc.s V_17
IL_011f: ldloc.1
IL_0120: ldc.i4.3
IL_0121: bge.s IL_012a
IL_0123: ldsfld System.String System.String::Empty
IL_0128: br.s IL_0130
IL_012a: ldloc.0
IL_012b: callvirt System.String ZPackage::ReadString()
IL_0130: stloc.s V_18
IL_0132: ldloc.s V_6
IL_0134: ldloc.s V_13
IL_0136: callvirt System.Void ZPackage::Write(System.Int64)
IL_013b: nop
IL_013c: ldloc.s V_6
IL_013e: ldloc.s V_14
IL_0140: callvirt System.Void ZPackage::Write(System.String)
IL_0145: nop
IL_0146: ldloc.s V_6
IL_0148: ldloc.s V_15
IL_014a: callvirt System.Void ZPackage::Write(UnityEngine.Vector3)
IL_014f: nop
IL_0150: ldloc.s V_6
IL_0152: ldloc.s V_16
IL_0154: callvirt System.Void ZPackage::Write(System.Int32)
IL_0159: nop
IL_015a: ldloc.s V_6
IL_015c: ldloc.s V_17
IL_015e: callvirt System.Void ZPackage::Write(System.Boolean)
IL_0163: nop
IL_0164: ldloc.1
IL_0165: ldc.i4.3
IL_0166: clt
IL_0168: ldc.i4.0
IL_0169: ceq
IL_016b: stloc.s V_19
IL_016d: ldloc.s V_19
IL_016f: brfalse.s IL_017b
IL_0171: ldloc.s V_6
IL_0173: ldloc.s V_18
IL_0175: callvirt System.Void ZPackage::Write(System.String)
IL_017a: nop
IL_017b: nop
IL_017c: ldloc.s V_12
IL_017e: ldc.i4.1
IL_017f: add
IL_0180: stloc.s V_12
IL_0182: ldloc.s V_12
IL_0184: ldloc.s V_11
IL_0186: clt
IL_0188: stloc.s V_20
IL_018a: ldloc.s V_20
IL_018c: brtrue IL_00f6
IL_0191: nop
IL_0192: ldarg.0
IL_0193: ldloc.s V_6
IL_0195: callvirt System.Byte[] ZPackage::GetArray()
IL_019a: stind.ref
IL_019b: ret

// System.Void LongshipUpgrades.LongshipUpgrades/EffectList_Create_ScaleWriteEffects::Prefix(EffectList,System.Single&,System.Boolean&)
.locals System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldsfld System.Boolean LongshipUpgrades.LongshipUpgrades/MapTable_OnWrite_ScaleWriteEffects::inCall
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: brfalse.s IL_0045
IL_000a: nop
IL_000b: ldarg.1
IL_000c: ldc.r4 0.1
IL_0011: stind.r4
IL_0012: ldarg.0
IL_0013: callvirt System.Boolean EffectList::HasEffects()
IL_0018: brfalse.s IL_002c
IL_001a: ldarg.0
IL_001b: ldfld EffectList/EffectData[] EffectList::m_effectPrefabs
IL_0020: ldc.i4.0
IL_0021: ldelem.ref
IL_0022: ldfld System.Boolean EffectList/EffectData::m_scale
IL_0027: ldc.i4.0
IL_0028: ceq
IL_002a: br.s IL_002d
IL_002c: ldc.i4.0
IL_002d: stloc.1
IL_002e: ldloc.1
IL_002f: brfalse.s IL_0044
IL_0031: nop
IL_0032: ldarg.2
IL_0033: ldc.i4.1
IL_0034: stind.i1
IL_0035: ldarg.0
IL_0036: ldfld EffectList/EffectData[] EffectList::m_effectPrefabs
IL_003b: ldc.i4.0
IL_003c: ldelem.ref
IL_003d: ldc.i4.1
IL_003e: stfld System.Boolean EffectList/EffectData::m_scale
IL_0043: nop
IL_0044: nop
IL_0045: ret

// System.Void LongshipUpgrades.LongshipUpgrades/EffectList_Create_ScaleWriteEffects::Finalizer(EffectList,System.Boolean)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: stloc.0
IL_0003: ldloc.0
IL_0004: brfalse.s IL_0014
IL_0006: ldarg.0
IL_0007: ldfld EffectList/EffectData[] EffectList::m_effectPrefabs
IL_000c: ldc.i4.0
IL_000d: ldelem.ref
IL_000e: ldc.i4.0
IL_000f: stfld System.Boolean EffectList/EffectData::m_scale
IL_0014: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades/MapTable_Start_PreventStartScript::Prefix(MapTable)
.locals 
IL_0000: ldarg.0
IL_0001: callvirt System.String UnityEngine.Object::get_name()
IL_0006: ldstr "maptable"
IL_000b: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_0010: brtrue.s IL_001d
IL_0012: ldarg.0
IL_0013: call System.Boolean LongshipUpgrades.LongshipUpgrades::IsControlledComponent(UnityEngine.Component)
IL_0018: ldc.i4.0
IL_0019: ceq
IL_001b: br.s IL_001e
IL_001d: ldc.i4.1
IL_001e: ret

// System.Void LongshipUpgrades.LongshipUpgrades/ShipMapSaveState::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: newobj System.Void System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<ZDOID,System.Byte[]>>::.ctor()
IL_0006: stfld System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<ZDOID,System.Byte[]>> LongshipUpgrades.LongshipUpgrades/ShipMapSaveState::InjectedMaps
IL_000b: ldarg.0
IL_000c: call System.Diagnostics.Stopwatch System.Diagnostics.Stopwatch::StartNew()
IL_0011: stfld System.Diagnostics.Stopwatch LongshipUpgrades.LongshipUpgrades/ShipMapSaveState::Timer
IL_0016: ldarg.0
IL_0017: call System.Void System.Object::.ctor()
IL_001c: nop
IL_001d: ret

// System.Void LongshipUpgrades.LongshipUpgrades/<>c::.cctor()
.locals 
IL_0000: newobj System.Void LongshipUpgrades.LongshipUpgrades/<>c::.ctor()
IL_0005: stsfld LongshipUpgrades.LongshipUpgrades/<>c LongshipUpgrades.LongshipUpgrades/<>c::<>9
IL_000a: ret

// System.Void LongshipUpgrades.LongshipUpgrades/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Void LongshipUpgrades.LongshipUpgrades/<>c::<ConfigInit>b__90_0(System.Object,System.EventArgs)
.locals 
IL_0000: call System.Void LongshipUpgrades.LongshipUpgrades::RequestShipMapConfigurationUpdate()
IL_0005: nop
IL_0006: ret

// System.String LongshipUpgrades.LongshipUpgrades/<>c::<LoadTextures>b__98_0(System.IO.FileInfo)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt System.String System.IO.FileSystemInfo::get_Name()
IL_0006: ret

// System.String LongshipUpgrades.LongshipUpgrades/<>c::<LoadTextures>b__98_1(System.IO.FileInfo)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt System.String System.IO.FileSystemInfo::get_Name()
IL_0006: ret

// System.String LongshipUpgrades.LongshipUpgrades/<>c::<LoadTextures>b__98_2(System.IO.FileInfo)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt System.String System.IO.FileSystemInfo::get_Name()
IL_0006: ret

// System.Void LongshipUpgrades.LongshipUpgrades/<>c__DisplayClass102_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Boolean LongshipUpgrades.LongshipUpgrades/<>c__DisplayClass102_0::<GetEmbeddedFileData>b__0(System.String)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.0
IL_0002: ldfld System.String LongshipUpgrades.LongshipUpgrades/<>c__DisplayClass102_0::filename
IL_0007: callvirt System.Boolean System.String::EndsWith(System.String)
IL_000c: ret

// System.Boolean LongshipUpgrades.PrefabAudio::get_IsHeadless()
.locals 
IL_0000: call UnityEngine.Rendering.GraphicsDeviceType UnityEngine.SystemInfo::get_graphicsDeviceType()
IL_0005: ldc.i4.4
IL_0006: ceq
IL_0008: ret

// UnityEngine.GameObject LongshipUpgrades.PrefabAudio::Clone(UnityEngine.GameObject)
.locals UnityEngine.GameObject, System.Boolean, UnityEngine.GameObject, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0008: brtrue.s IL_0011
IL_000a: call System.Boolean LongshipUpgrades.PrefabAudio::get_IsHeadless()
IL_000f: br.s IL_0012
IL_0011: ldc.i4.1
IL_0012: stloc.1
IL_0013: ldloc.1
IL_0014: brfalse.s IL_001a
IL_0016: ldarg.0
IL_0017: stloc.2
IL_0018: br.s IL_007b
IL_001a: ldsfld UnityEngine.GameObject LongshipUpgrades.PrefabAudio::templates
IL_001f: ldnull
IL_0020: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0025: stloc.3
IL_0026: ldloc.3
IL_0027: brfalse.s IL_0051
IL_0029: nop
IL_002a: ldstr "shudnal.LongshipUpgrades.AudioPrefabs"
IL_002f: newobj System.Void UnityEngine.GameObject::.ctor(System.String)
IL_0034: stsfld UnityEngine.GameObject LongshipUpgrades.PrefabAudio::templates
IL_0039: ldsfld UnityEngine.GameObject LongshipUpgrades.PrefabAudio::templates
IL_003e: ldc.i4.0
IL_003f: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0044: nop
IL_0045: ldsfld UnityEngine.GameObject LongshipUpgrades.PrefabAudio::templates
IL_004a: call System.Void UnityEngine.Object::DontDestroyOnLoad(UnityEngine.Object)
IL_004f: nop
IL_0050: nop
IL_0051: ldarg.0
IL_0052: ldsfld UnityEngine.GameObject LongshipUpgrades.PrefabAudio::templates
IL_0057: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_005c: ldc.i4.0
IL_005d: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Transform,System.Boolean)
IL_0062: stloc.0
IL_0063: ldloc.0
IL_0064: ldarg.0
IL_0065: callvirt System.String UnityEngine.Object::get_name()
IL_006a: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_006f: nop
IL_0070: ldloc.0
IL_0071: call System.Void LongshipUpgrades.PrefabAudio::Register(UnityEngine.GameObject)
IL_0076: nop
IL_0077: ldloc.0
IL_0078: stloc.2
IL_0079: br.s IL_007b
IL_007b: ldloc.2
IL_007c: ret

// System.Void LongshipUpgrades.PrefabAudio::Register(UnityEngine.GameObject)
.locals System.Boolean, UnityEngine.AudioSource[], System.Int32, UnityEngine.AudioSource, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0008: brtrue.s IL_0011
IL_000a: call System.Boolean LongshipUpgrades.PrefabAudio::get_IsHeadless()
IL_000f: br.s IL_0012
IL_0011: ldc.i4.1
IL_0012: stloc.0
IL_0013: ldloc.0
IL_0014: brfalse.s IL_0018
IL_0016: br.s IL_0057
IL_0018: nop
IL_0019: ldarg.0
IL_001a: ldc.i4.1
IL_001b: callvirt !!0[] UnityEngine.GameObject::GetComponentsInChildren<UnityEngine.AudioSource>(System.Boolean)
IL_0020: stloc.1
IL_0021: ldc.i4.0
IL_0022: stloc.2
IL_0023: br.s IL_0046
IL_0025: ldloc.1
IL_0026: ldloc.2
IL_0027: ldelem.ref
IL_0028: stloc.3
IL_0029: ldloc.3
IL_002a: ldnull
IL_002b: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0030: stloc.s V_4
IL_0032: ldloc.s V_4
IL_0034: brfalse.s IL_0042
IL_0036: ldsfld System.Collections.Generic.HashSet`1<UnityEngine.AudioSource> LongshipUpgrades.PrefabAudio::sources
IL_003b: ldloc.3
IL_003c: callvirt System.Boolean System.Collections.Generic.HashSet`1<UnityEngine.AudioSource>::Add(!0)
IL_0041: pop
IL_0042: ldloc.2
IL_0043: ldc.i4.1
IL_0044: add
IL_0045: stloc.2
IL_0046: ldloc.2
IL_0047: ldloc.1
IL_0048: ldlen
IL_0049: conv.i4
IL_004a: blt.s IL_0025
IL_004c: call AudioMan AudioMan::get_instance()
IL_0051: call System.Void LongshipUpgrades.PrefabAudio::Apply(AudioMan)
IL_0056: nop
IL_0057: ret

// System.Void LongshipUpgrades.PrefabAudio::Apply(AudioMan)
.locals UnityEngine.Audio.AudioMixer, System.Int32, System.Boolean, System.Boolean, System.Boolean, UnityEngine.Audio.AudioMixerGroup[], System.Int32, UnityEngine.Audio.AudioMixerGroup, System.Boolean, System.Boolean, System.Boolean, System.Collections.Generic.HashSet`1/Enumerator<UnityEngine.AudioSource>, UnityEngine.AudioSource, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0008: brtrue.s IL_002c
IL_000a: ldarg.0
IL_000b: call AudioMan AudioMan::get_instance()
IL_0010: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0015: brtrue.s IL_002c
IL_0017: ldarg.0
IL_0018: ldfld UnityEngine.Audio.AudioMixer AudioMan::m_masterMixer
IL_001d: ldnull
IL_001e: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0023: brtrue.s IL_002c
IL_0025: call System.Boolean LongshipUpgrades.PrefabAudio::get_IsHeadless()
IL_002a: br.s IL_002d
IL_002c: ldc.i4.1
IL_002d: stloc.2
IL_002e: ldloc.2
IL_002f: brfalse.s IL_0036
IL_0031: br IL_01c3
IL_0036: ldsfld System.Collections.Generic.HashSet`1<UnityEngine.AudioSource> LongshipUpgrades.PrefabAudio::sources
IL_003b: ldsfld System.Predicate`1<UnityEngine.AudioSource> LongshipUpgrades.PrefabAudio/<>c::<>9__8_0
IL_0040: dup
IL_0041: brtrue.s IL_005a
IL_0043: pop
IL_0044: ldsfld LongshipUpgrades.PrefabAudio/<>c LongshipUpgrades.PrefabAudio/<>c::<>9
IL_0049: ldftn System.Boolean LongshipUpgrades.PrefabAudio/<>c::<Apply>b__8_0(UnityEngine.AudioSource)
IL_004f: newobj System.Void System.Predicate`1<UnityEngine.AudioSource>::.ctor(System.Object,System.IntPtr)
IL_0054: dup
IL_0055: stsfld System.Predicate`1<UnityEngine.AudioSource> LongshipUpgrades.PrefabAudio/<>c::<>9__8_0
IL_005a: callvirt System.Int32 System.Collections.Generic.HashSet`1<UnityEngine.AudioSource>::RemoveWhere(System.Predicate`1<!0>)
IL_005f: pop
IL_0060: ldsfld System.Collections.Generic.HashSet`1<UnityEngine.AudioSource> LongshipUpgrades.PrefabAudio::sources
IL_0065: callvirt System.Int32 System.Collections.Generic.HashSet`1<UnityEngine.AudioSource>::get_Count()
IL_006a: ldc.i4.0
IL_006b: ceq
IL_006d: stloc.3
IL_006e: ldloc.3
IL_006f: brfalse.s IL_0076
IL_0071: br IL_01c3
IL_0076: ldarg.0
IL_0077: ldfld UnityEngine.Audio.AudioMixer AudioMan::m_masterMixer
IL_007c: stloc.0
IL_007d: ldsfld UnityEngine.Audio.AudioMixerGroup LongshipUpgrades.PrefabAudio::sfxGroup
IL_0082: ldnull
IL_0083: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0088: brtrue.s IL_009c
IL_008a: ldsfld UnityEngine.Audio.AudioMixerGroup LongshipUpgrades.PrefabAudio::sfxGroup
IL_008f: callvirt UnityEngine.Audio.AudioMixer UnityEngine.Audio.AudioMixerGroup::get_audioMixer()
IL_0094: ldloc.0
IL_0095: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_009a: br.s IL_009d
IL_009c: ldc.i4.1
IL_009d: stloc.s V_4
IL_009f: ldloc.s V_4
IL_00a1: brfalse.s IL_0102
IL_00a3: nop
IL_00a4: ldnull
IL_00a5: stsfld UnityEngine.Audio.AudioMixerGroup LongshipUpgrades.PrefabAudio::sfxGroup
IL_00aa: nop
IL_00ab: ldloc.0
IL_00ac: ldsfld System.String System.String::Empty
IL_00b1: callvirt UnityEngine.Audio.AudioMixerGroup[] UnityEngine.Audio.AudioMixer::FindMatchingGroups(System.String)
IL_00b6: stloc.s V_5
IL_00b8: ldc.i4.0
IL_00b9: stloc.s V_6
IL_00bb: br.s IL_00f9
IL_00bd: ldloc.s V_5
IL_00bf: ldloc.s V_6
IL_00c1: ldelem.ref
IL_00c2: stloc.s V_7
IL_00c4: ldloc.s V_7
IL_00c6: ldnull
IL_00c7: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_00cc: brfalse.s IL_00e2
IL_00ce: ldloc.s V_7
IL_00d0: callvirt System.String UnityEngine.Object::get_name()
IL_00d5: ldstr "Sfx"
IL_00da: ldc.i4.5
IL_00db: call System.Boolean System.String::Equals(System.String,System.String,System.StringComparison)
IL_00e0: br.s IL_00e3
IL_00e2: ldc.i4.0
IL_00e3: stloc.s V_8
IL_00e5: ldloc.s V_8
IL_00e7: brfalse.s IL_00f3
IL_00e9: nop
IL_00ea: ldloc.s V_7
IL_00ec: stsfld UnityEngine.Audio.AudioMixerGroup LongshipUpgrades.PrefabAudio::sfxGroup
IL_00f1: br.s IL_0101
IL_00f3: ldloc.s V_6
IL_00f5: ldc.i4.1
IL_00f6: add
IL_00f7: stloc.s V_6
IL_00f9: ldloc.s V_6
IL_00fb: ldloc.s V_5
IL_00fd: ldlen
IL_00fe: conv.i4
IL_00ff: blt.s IL_00bd
IL_0101: nop
IL_0102: ldsfld UnityEngine.Audio.AudioMixerGroup LongshipUpgrades.PrefabAudio::sfxGroup
IL_0107: ldnull
IL_0108: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_010d: stloc.s V_9
IL_010f: ldloc.s V_9
IL_0111: brfalse.s IL_013d
IL_0113: nop
IL_0114: ldsfld UnityEngine.Audio.AudioMixer LongshipUpgrades.PrefabAudio::warnedMixer
IL_0119: ldloc.0
IL_011a: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_011f: stloc.s V_10
IL_0121: ldloc.s V_10
IL_0123: brfalse.s IL_0138
IL_0125: nop
IL_0126: ldloc.0
IL_0127: stsfld UnityEngine.Audio.AudioMixer LongshipUpgrades.PrefabAudio::warnedMixer
IL_012c: ldstr "shudnal.LongshipUpgrades: the game's Sfx mixer group was not found; audio routing was not changed."
IL_0131: call System.Void UnityEngine.Debug::LogWarning(System.Object)
IL_0136: nop
IL_0137: nop
IL_0138: br IL_01c3
IL_013d: ldnull
IL_013e: stsfld UnityEngine.Audio.AudioMixer LongshipUpgrades.PrefabAudio::warnedMixer
IL_0143: ldc.i4.0
IL_0144: stloc.1
IL_0145: nop
IL_0146: ldsfld System.Collections.Generic.HashSet`1<UnityEngine.AudioSource> LongshipUpgrades.PrefabAudio::sources
IL_014b: callvirt System.Collections.Generic.HashSet`1/Enumerator<!0> System.Collections.Generic.HashSet`1<UnityEngine.AudioSource>::GetEnumerator()
IL_0150: stloc.s V_11
IL_0152: br.s IL_0189
IL_0154: ldloca.s V_11
IL_0156: call !0 System.Collections.Generic.HashSet`1/Enumerator<UnityEngine.AudioSource>::get_Current()
IL_015b: stloc.s V_12
IL_015d: nop
IL_015e: ldloc.s V_12
IL_0160: callvirt UnityEngine.Audio.AudioMixerGroup UnityEngine.AudioSource::get_outputAudioMixerGroup()
IL_0165: ldsfld UnityEngine.Audio.AudioMixerGroup LongshipUpgrades.PrefabAudio::sfxGroup
IL_016a: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_016f: stloc.s V_13
IL_0171: ldloc.s V_13
IL_0173: brfalse.s IL_0177
IL_0175: br.s IL_0189
IL_0177: ldloc.s V_12
IL_0179: ldsfld UnityEngine.Audio.AudioMixerGroup LongshipUpgrades.PrefabAudio::sfxGroup
IL_017e: callvirt System.Void UnityEngine.AudioSource::set_outputAudioMixerGroup(UnityEngine.Audio.AudioMixerGroup)
IL_0183: nop
IL_0184: ldloc.1
IL_0185: ldc.i4.1
IL_0186: add
IL_0187: stloc.1
IL_0188: nop
IL_0189: ldloca.s V_11
IL_018b: call System.Boolean System.Collections.Generic.HashSet`1/Enumerator<UnityEngine.AudioSource>::MoveNext()
IL_0190: brtrue.s IL_0154
IL_0192: leave.s IL_01a3
IL_0194: ldloca.s V_11
IL_0196: constrained. System.Collections.Generic.HashSet`1/Enumerator<UnityEngine.AudioSource>
IL_019c: callvirt System.Void System.IDisposable::Dispose()
IL_01a1: nop
IL_01a2: endfinally
IL_01a3: ldloc.1
IL_01a4: ldc.i4.0
IL_01a5: cgt
IL_01a7: stloc.s V_14
IL_01a9: ldloc.s V_14
IL_01ab: brfalse.s IL_01c3
IL_01ad: ldstr "Routed {0} audio source(s) to the game's Sfx mixer."
IL_01b2: ldloc.1
IL_01b3: box System.Int32
IL_01b8: call System.String System.String::Format(System.String,System.Object)
IL_01bd: call System.Void LongshipUpgrades.LongshipUpgrades::LogInfo(System.Object)
IL_01c2: nop
IL_01c3: ret
// EH Finally: 338 - 404 => 404 - 419

// System.Void LongshipUpgrades.PrefabAudio::Clear()
.locals System.Boolean
IL_0000: nop
IL_0001: ldsfld System.Collections.Generic.HashSet`1<UnityEngine.AudioSource> LongshipUpgrades.PrefabAudio::sources
IL_0006: callvirt System.Void System.Collections.Generic.HashSet`1<UnityEngine.AudioSource>::Clear()
IL_000b: nop
IL_000c: ldnull
IL_000d: stsfld UnityEngine.Audio.AudioMixerGroup LongshipUpgrades.PrefabAudio::sfxGroup
IL_0012: ldnull
IL_0013: stsfld UnityEngine.Audio.AudioMixer LongshipUpgrades.PrefabAudio::warnedMixer
IL_0018: ldsfld UnityEngine.GameObject LongshipUpgrades.PrefabAudio::templates
IL_001d: ldnull
IL_001e: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0023: stloc.0
IL_0024: ldloc.0
IL_0025: brfalse.s IL_0032
IL_0027: ldsfld UnityEngine.GameObject LongshipUpgrades.PrefabAudio::templates
IL_002c: call System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_0031: nop
IL_0032: ldnull
IL_0033: stsfld UnityEngine.GameObject LongshipUpgrades.PrefabAudio::templates
IL_0038: ret

// System.Void LongshipUpgrades.PrefabAudio::.cctor()
.locals 
IL_0000: newobj System.Void System.Collections.Generic.HashSet`1<UnityEngine.AudioSource>::.ctor()
IL_0005: stsfld System.Collections.Generic.HashSet`1<UnityEngine.AudioSource> LongshipUpgrades.PrefabAudio::sources
IL_000a: ret

// System.Void LongshipUpgrades.PrefabAudio/AudioMan_Awake_RouteAudio::Postfix(AudioMan)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void LongshipUpgrades.PrefabAudio::Apply(AudioMan)
IL_0006: nop
IL_0007: ret

// System.Void LongshipUpgrades.PrefabAudio/<>c::.cctor()
.locals 
IL_0000: newobj System.Void LongshipUpgrades.PrefabAudio/<>c::.ctor()
IL_0005: stsfld LongshipUpgrades.PrefabAudio/<>c LongshipUpgrades.PrefabAudio/<>c::<>9
IL_000a: ret

// System.Void LongshipUpgrades.PrefabAudio/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Boolean LongshipUpgrades.PrefabAudio/<>c::<Apply>b__8_0(UnityEngine.AudioSource)
.locals 
IL_0000: ldarg.1
IL_0001: ldnull
IL_0002: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0007: ret

// System.Void LongshipUpgrades.ShipTrophyStand::Awake()
.locals System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldarg.0
IL_0003: call !!0 UnityEngine.Component::GetComponentInParent<ZNetView>()
IL_0008: stfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_000d: ldarg.0
IL_000e: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_0013: callvirt System.Boolean ZNetView::IsValid()
IL_0018: stloc.0
IL_0019: ldloc.0
IL_001a: brfalse IL_00ab
IL_001f: nop
IL_0020: ldarg.0
IL_0021: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_0026: ldstr "DropItem"
IL_002b: ldarg.0
IL_002c: ldftn System.Void LongshipUpgrades.ShipTrophyStand::RPC_DropItem(System.Int64)
IL_0032: newobj System.Void System.Action`1<System.Int64>::.ctor(System.Object,System.IntPtr)
IL_0037: callvirt System.Void ZNetView::Register(System.String,System.Action`1<System.Int64>)
IL_003c: nop
IL_003d: ldarg.0
IL_003e: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_0043: ldstr "RequestOwn"
IL_0048: ldarg.0
IL_0049: ldftn System.Void LongshipUpgrades.ShipTrophyStand::RPC_RequestOwn(System.Int64)
IL_004f: newobj System.Void System.Action`1<System.Int64>::.ctor(System.Object,System.IntPtr)
IL_0054: callvirt System.Void ZNetView::Register(System.String,System.Action`1<System.Int64>)
IL_0059: nop
IL_005a: ldarg.0
IL_005b: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_0060: ldstr "DestroyAttachment"
IL_0065: ldarg.0
IL_0066: ldftn System.Void LongshipUpgrades.ShipTrophyStand::RPC_DestroyAttachment(System.Int64)
IL_006c: newobj System.Void System.Action`1<System.Int64>::.ctor(System.Object,System.IntPtr)
IL_0071: callvirt System.Void ZNetView::Register(System.String,System.Action`1<System.Int64>)
IL_0076: nop
IL_0077: ldarg.0
IL_0078: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_007d: ldstr "SetVisualItem"
IL_0082: ldarg.0
IL_0083: ldftn System.Void LongshipUpgrades.ShipTrophyStand::RPC_SetVisualItem(System.Int64,System.Int32,System.Int32,System.Int32)
IL_0089: newobj System.Void System.Action`4<System.Int64,System.Int32,System.Int32,System.Int32>::.ctor(System.Object,System.IntPtr)
IL_008e: callvirt System.Void ZNetView::Register<System.Int32,System.Int32,System.Int32>(System.String,System.Action`4<System.Int64,!!0,!!1,!!2>)
IL_0093: nop
IL_0094: ldarg.0
IL_0095: ldstr "UpdateVisual"
IL_009a: ldc.r4 1
IL_009f: ldc.r4 4
IL_00a4: call System.Void UnityEngine.MonoBehaviour::InvokeRepeating(System.String,System.Single,System.Single)
IL_00a9: nop
IL_00aa: nop
IL_00ab: ldsfld System.Collections.Generic.Dictionary`2<System.String,SE_Stats> LongshipUpgrades.ShipTrophyStand::trophyEffects
IL_00b0: callvirt System.Int32 System.Collections.Generic.Dictionary`2<System.String,SE_Stats>::get_Count()
IL_00b5: ldc.i4.0
IL_00b6: ceq
IL_00b8: stloc.1
IL_00b9: ldloc.1
IL_00ba: brfalse.s IL_00c2
IL_00bc: call System.Void LongshipUpgrades.ShipTrophyStand::FillTrophyEffects()
IL_00c1: nop
IL_00c2: ldarg.0
IL_00c3: ldarg.0
IL_00c4: call !!0 UnityEngine.Component::GetComponentInParent<Piece>()
IL_00c9: stfld Piece LongshipUpgrades.ShipTrophyStand::m_piece
IL_00ce: ret

// System.String LongshipUpgrades.ShipTrophyStand::GetHoverText()
.locals System.Boolean, System.String, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.String, System.Boolean
IL_0000: nop
IL_0001: ldsfld Player Player::m_localPlayer
IL_0006: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000b: ldc.i4.0
IL_000c: ceq
IL_000e: stloc.0
IL_000f: ldloc.0
IL_0010: brfalse.s IL_001d
IL_0012: ldstr ""
IL_0017: stloc.1
IL_0018: br IL_0237
IL_001d: ldarg.0
IL_001e: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0023: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0028: ldc.r4 0
IL_002d: ldc.i4.0
IL_002e: ldc.i4.0
IL_002f: call System.Boolean PrivateArea::CheckAccess(UnityEngine.Vector3,System.Single,System.Boolean,System.Boolean)
IL_0034: ldc.i4.0
IL_0035: ceq
IL_0037: stloc.2
IL_0038: ldloc.2
IL_0039: brfalse.s IL_005b
IL_003b: call Localization Localization::get_instance()
IL_0040: ldarg.0
IL_0041: ldfld System.String LongshipUpgrades.ShipTrophyStand::m_name
IL_0046: ldstr "
$piece_noaccess"
IL_004b: call System.String System.String::Concat(System.String,System.String)
IL_0050: callvirt System.String Localization::Localize(System.String)
IL_0055: stloc.1
IL_0056: br IL_0237
IL_005b: ldsfld System.Text.StringBuilder LongshipUpgrades.ShipTrophyStand::sb
IL_0060: callvirt System.Text.StringBuilder System.Text.StringBuilder::Clear()
IL_0065: pop
IL_0066: ldarg.0
IL_0067: call System.Boolean LongshipUpgrades.ShipTrophyStand::HaveAttachment()
IL_006c: stloc.3
IL_006d: ldloc.3
IL_006e: brfalse IL_01cf
IL_0073: nop
IL_0074: ldsfld System.Text.StringBuilder LongshipUpgrades.ShipTrophyStand::sb
IL_0079: ldarg.0
IL_007a: ldfld System.String LongshipUpgrades.ShipTrophyStand::m_currentItemName
IL_007f: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0084: pop
IL_0085: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::onlyCreatorStand
IL_008a: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_008f: brfalse.s IL_00ac
IL_0091: ldarg.0
IL_0092: ldfld Piece LongshipUpgrades.ShipTrophyStand::m_piece
IL_0097: ldnull
IL_0098: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_009d: brtrue.s IL_00ac
IL_009f: ldarg.0
IL_00a0: ldfld Piece LongshipUpgrades.ShipTrophyStand::m_piece
IL_00a5: callvirt System.Boolean Piece::IsCreator()
IL_00aa: br.s IL_00ad
IL_00ac: ldc.i4.1
IL_00ad: stloc.s V_4
IL_00af: ldloc.s V_4
IL_00b1: brfalse.s IL_00c3
IL_00b3: ldsfld System.Text.StringBuilder LongshipUpgrades.ShipTrophyStand::sb
IL_00b8: ldstr "
[<color=yellow><b>$KEY_Use</b></color>] $piece_itemstand_take"
IL_00bd: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_00c2: pop
IL_00c3: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::itemStandForsakenPower
IL_00c8: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_00cd: brfalse.s IL_00dd
IL_00cf: ldarg.0
IL_00d0: ldfld StatusEffect LongshipUpgrades.ShipTrophyStand::m_guardianPower
IL_00d5: ldnull
IL_00d6: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_00db: br.s IL_00de
IL_00dd: ldc.i4.0
IL_00de: stloc.s V_5
IL_00e0: ldloc.s V_5
IL_00e2: brfalse IL_01cc
IL_00e7: nop
IL_00e8: ldarg.0
IL_00e9: ldstr "DelayedPowerActivation"
IL_00ee: call System.Boolean UnityEngine.MonoBehaviour::IsInvoking(System.String)
IL_00f3: stloc.s V_6
IL_00f5: ldloc.s V_6
IL_00f7: brfalse.s IL_0104
IL_00f9: ldstr ""
IL_00fe: stloc.1
IL_00ff: br IL_0237
IL_0104: ldsfld System.Text.StringBuilder LongshipUpgrades.ShipTrophyStand::sb
IL_0109: ldstr "
"
IL_010e: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0113: pop
IL_0114: ldsfld System.Text.StringBuilder LongshipUpgrades.ShipTrophyStand::sb
IL_0119: ldstr "
<color=orange>{0}</color>"
IL_011e: ldarg.0
IL_011f: ldfld StatusEffect LongshipUpgrades.ShipTrophyStand::m_guardianPower
IL_0124: ldfld System.String StatusEffect::m_name
IL_0129: callvirt System.Text.StringBuilder System.Text.StringBuilder::AppendFormat(System.String,System.Object)
IL_012e: pop
IL_012f: ldarg.0
IL_0130: ldsfld Player Player::m_localPlayer
IL_0135: call System.Boolean LongshipUpgrades.ShipTrophyStand::IsGuardianPowerActive(Humanoid)
IL_013a: stloc.s V_7
IL_013c: ldloc.s V_7
IL_013e: brfalse.s IL_0152
IL_0140: ldsfld System.Text.StringBuilder LongshipUpgrades.ShipTrophyStand::sb
IL_0145: ldstr "
$guardianstone_hook_power_activate"
IL_014a: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_014f: pop
IL_0150: br.s IL_01a5
IL_0152: ldarg.0
IL_0153: ldsfld Player Player::m_localPlayer
IL_0158: call System.Boolean LongshipUpgrades.ShipTrophyStand::IsGuardianPowerOnCooldown(Player)
IL_015d: stloc.s V_8
IL_015f: ldloc.s V_8
IL_0161: brfalse.s IL_0175
IL_0163: ldsfld System.Text.StringBuilder LongshipUpgrades.ShipTrophyStand::sb
IL_0168: ldstr "
$hud_powernotready"
IL_016d: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0172: pop
IL_0173: br.s IL_01a5
IL_0175: nop
IL_0176: call System.Boolean ZInput::IsNonClassicFunctionality()
IL_017b: brfalse.s IL_018b
IL_017d: call System.Boolean ZInput::IsGamepadActive()
IL_0182: brfalse.s IL_018b
IL_0184: ldstr "$KEY_JoyAltKeys"
IL_0189: br.s IL_0190
IL_018b: ldstr "$KEY_AltPlace"
IL_0190: stloc.s V_9
IL_0192: ldsfld System.Text.StringBuilder LongshipUpgrades.ShipTrophyStand::sb
IL_0197: ldstr "
[<color=yellow><b>{0} + $KEY_Use</b></color>] $guardianstone_hook_activate"
IL_019c: ldloc.s V_9
IL_019e: callvirt System.Text.StringBuilder System.Text.StringBuilder::AppendFormat(System.String,System.Object)
IL_01a3: pop
IL_01a4: nop
IL_01a5: ldsfld System.Text.StringBuilder LongshipUpgrades.ShipTrophyStand::sb
IL_01aa: ldstr "

"
IL_01af: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_01b4: pop
IL_01b5: ldsfld System.Text.StringBuilder LongshipUpgrades.ShipTrophyStand::sb
IL_01ba: ldarg.0
IL_01bb: ldfld StatusEffect LongshipUpgrades.ShipTrophyStand::m_guardianPower
IL_01c0: callvirt System.String StatusEffect::GetTooltipString()
IL_01c5: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_01ca: pop
IL_01cb: nop
IL_01cc: nop
IL_01cd: br.s IL_0220
IL_01cf: nop
IL_01d0: ldsfld System.Text.StringBuilder LongshipUpgrades.ShipTrophyStand::sb
IL_01d5: ldarg.0
IL_01d6: ldfld System.String LongshipUpgrades.ShipTrophyStand::m_name
IL_01db: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_01e0: pop
IL_01e1: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::onlyCreatorStand
IL_01e6: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_01eb: brfalse.s IL_0208
IL_01ed: ldarg.0
IL_01ee: ldfld Piece LongshipUpgrades.ShipTrophyStand::m_piece
IL_01f3: ldnull
IL_01f4: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_01f9: brtrue.s IL_0208
IL_01fb: ldarg.0
IL_01fc: ldfld Piece LongshipUpgrades.ShipTrophyStand::m_piece
IL_0201: callvirt System.Boolean Piece::IsCreator()
IL_0206: br.s IL_0209
IL_0208: ldc.i4.1
IL_0209: stloc.s V_10
IL_020b: ldloc.s V_10
IL_020d: brfalse.s IL_021f
IL_020f: ldsfld System.Text.StringBuilder LongshipUpgrades.ShipTrophyStand::sb
IL_0214: ldstr "
[<color=yellow><b>$KEY_Use</b></color>][<color=yellow><b>1-8</b></color>] $piece_itemstand_attach"
IL_0219: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_021e: pop
IL_021f: nop
IL_0220: call Localization Localization::get_instance()
IL_0225: ldsfld System.Text.StringBuilder LongshipUpgrades.ShipTrophyStand::sb
IL_022a: callvirt System.String System.Object::ToString()
IL_022f: callvirt System.String Localization::Localize(System.String)
IL_0234: stloc.1
IL_0235: br.s IL_0237
IL_0237: ldloc.1
IL_0238: ret

// System.String LongshipUpgrades.ShipTrophyStand::GetHoverName()
.locals System.String
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.String LongshipUpgrades.ShipTrophyStand::m_name
IL_0007: stloc.0
IL_0008: br.s IL_000a
IL_000a: ldloc.0
IL_000b: ret

// System.Single LongshipUpgrades.ShipTrophyStand::GetHoverOffset()
.locals System.Single
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.Single LongshipUpgrades.ShipTrophyStand::m_hoverOffset
IL_0007: stloc.0
IL_0008: br.s IL_000a
IL_000a: ldloc.0
IL_000b: ret

// System.Boolean LongshipUpgrades.ShipTrophyStand::Interact(Humanoid,System.Boolean,System.Boolean)
.locals System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, ZDOID, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.2
IL_0002: stloc.0
IL_0003: ldloc.0
IL_0004: brfalse.s IL_000d
IL_0006: ldc.i4.0
IL_0007: stloc.1
IL_0008: br IL_021b
IL_000d: ldarg.0
IL_000e: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0013: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0018: ldc.r4 0
IL_001d: ldc.i4.1
IL_001e: ldc.i4.0
IL_001f: call System.Boolean PrivateArea::CheckAccess(UnityEngine.Vector3,System.Single,System.Boolean,System.Boolean)
IL_0024: ldc.i4.0
IL_0025: ceq
IL_0027: stloc.2
IL_0028: ldloc.2
IL_0029: brfalse.s IL_0032
IL_002b: ldc.i4.1
IL_002c: stloc.1
IL_002d: br IL_021b
IL_0032: ldarg.0
IL_0033: call System.Boolean LongshipUpgrades.ShipTrophyStand::HaveAttachment()
IL_0038: stloc.3
IL_0039: ldloc.3
IL_003a: brfalse IL_0194
IL_003f: nop
IL_0040: ldarg.3
IL_0041: ldc.i4.0
IL_0042: ceq
IL_0044: stloc.s V_4
IL_0046: ldloc.s V_4
IL_0048: brfalse.s IL_0096
IL_004a: nop
IL_004b: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::onlyCreatorStand
IL_0050: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0055: brfalse.s IL_0072
IL_0057: ldarg.0
IL_0058: ldfld Piece LongshipUpgrades.ShipTrophyStand::m_piece
IL_005d: ldnull
IL_005e: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0063: brtrue.s IL_0072
IL_0065: ldarg.0
IL_0066: ldfld Piece LongshipUpgrades.ShipTrophyStand::m_piece
IL_006b: callvirt System.Boolean Piece::IsCreator()
IL_0070: br.s IL_0073
IL_0072: ldc.i4.1
IL_0073: stloc.s V_5
IL_0075: ldloc.s V_5
IL_0077: brfalse.s IL_008f
IL_0079: ldarg.0
IL_007a: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_007f: ldstr "DropItem"
IL_0084: call !!0[] System.Array::Empty<System.Object>()
IL_0089: callvirt System.Void ZNetView::InvokeRPC(System.String,System.Object[])
IL_008e: nop
IL_008f: ldc.i4.1
IL_0090: stloc.1
IL_0091: br IL_021b
IL_0096: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::itemStandForsakenPower
IL_009b: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_00a0: brfalse.s IL_00b0
IL_00a2: ldarg.0
IL_00a3: ldfld StatusEffect LongshipUpgrades.ShipTrophyStand::m_guardianPower
IL_00a8: ldnull
IL_00a9: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_00ae: br.s IL_00b1
IL_00b0: ldc.i4.0
IL_00b1: stloc.s V_6
IL_00b3: ldloc.s V_6
IL_00b5: brfalse IL_018e
IL_00ba: nop
IL_00bb: ldarg.0
IL_00bc: ldstr "DelayedPowerActivation"
IL_00c1: call System.Boolean UnityEngine.MonoBehaviour::IsInvoking(System.String)
IL_00c6: stloc.s V_7
IL_00c8: ldloc.s V_7
IL_00ca: brfalse.s IL_00d3
IL_00cc: ldc.i4.0
IL_00cd: stloc.1
IL_00ce: br IL_021b
IL_00d3: ldarg.0
IL_00d4: ldarg.1
IL_00d5: call System.Boolean LongshipUpgrades.ShipTrophyStand::IsGuardianPowerActive(Humanoid)
IL_00da: stloc.s V_8
IL_00dc: ldloc.s V_8
IL_00de: brfalse.s IL_00e7
IL_00e0: ldc.i4.0
IL_00e1: stloc.1
IL_00e2: br IL_021b
IL_00e7: ldarg.0
IL_00e8: ldarg.1
IL_00e9: isinst Player
IL_00ee: call System.Boolean LongshipUpgrades.ShipTrophyStand::IsGuardianPowerOnCooldown(Player)
IL_00f3: stloc.s V_9
IL_00f5: ldloc.s V_9
IL_00f7: brfalse.s IL_0100
IL_00f9: ldc.i4.0
IL_00fa: stloc.1
IL_00fb: br IL_021b
IL_0100: ldarg.1
IL_0101: ldc.i4.2
IL_0102: ldstr "$guardianstone_hook_power_activate"
IL_0107: ldc.i4.0
IL_0108: ldnull
IL_0109: ldc.i4.0
IL_010a: callvirt System.Void Character::Message(MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_010f: nop
IL_0110: ldarg.0
IL_0111: ldfld EffectList LongshipUpgrades.ShipTrophyStand::m_activatePowerEffects
IL_0116: ldarg.0
IL_0117: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_011c: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0121: ldarg.0
IL_0122: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0127: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_012c: ldnull
IL_012d: ldc.r4 1
IL_0132: ldc.i4.m1
IL_0133: ldloca.s V_10
IL_0135: initobj ZDOID
IL_013b: ldloc.s V_10
IL_013d: callvirt UnityEngine.GameObject[] EffectList::Create(UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Transform,System.Single,System.Int32,ZDOID)
IL_0142: pop
IL_0143: ldarg.0
IL_0144: ldfld EffectList LongshipUpgrades.ShipTrophyStand::m_activatePowerEffectsPlayer
IL_0149: ldarg.1
IL_014a: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_014f: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0154: call UnityEngine.Quaternion UnityEngine.Quaternion::get_identity()
IL_0159: ldarg.1
IL_015a: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_015f: ldc.r4 1
IL_0164: ldc.i4.m1
IL_0165: ldloca.s V_10
IL_0167: initobj ZDOID
IL_016d: ldloc.s V_10
IL_016f: callvirt UnityEngine.GameObject[] EffectList::Create(UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Transform,System.Single,System.Int32,ZDOID)
IL_0174: pop
IL_0175: ldarg.0
IL_0176: ldstr "DelayedPowerActivation"
IL_017b: ldarg.0
IL_017c: ldfld System.Single LongshipUpgrades.ShipTrophyStand::m_powerActivationDelay
IL_0181: call System.Void UnityEngine.MonoBehaviour::Invoke(System.String,System.Single)
IL_0186: nop
IL_0187: ldc.i4.1
IL_0188: stloc.1
IL_0189: br IL_021b
IL_018e: nop
IL_018f: br IL_0217
IL_0194: nop
IL_0195: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::onlyCreatorStand
IL_019a: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_019f: brfalse.s IL_01bc
IL_01a1: ldarg.0
IL_01a2: ldfld Piece LongshipUpgrades.ShipTrophyStand::m_piece
IL_01a7: ldnull
IL_01a8: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_01ad: brtrue.s IL_01bc
IL_01af: ldarg.0
IL_01b0: ldfld Piece LongshipUpgrades.ShipTrophyStand::m_piece
IL_01b5: callvirt System.Boolean Piece::IsCreator()
IL_01ba: br.s IL_01bd
IL_01bc: ldc.i4.1
IL_01bd: stloc.s V_11
IL_01bf: ldloc.s V_11
IL_01c1: brfalse.s IL_0206
IL_01c3: nop
IL_01c4: ldarg.1
IL_01c5: callvirt Inventory Humanoid::GetInventory()
IL_01ca: ldsfld ItemDrop/ItemData/ItemType LongshipUpgrades.ShipTrophyStand::supportedItemType
IL_01cf: ldsfld System.Collections.Generic.List`1<ItemDrop/ItemData> LongshipUpgrades.ShipTrophyStand::tempItems
IL_01d4: callvirt System.Void Inventory::GetAllItems(ItemDrop/ItemData/ItemType,System.Collections.Generic.List`1<ItemDrop/ItemData>)
IL_01d9: nop
IL_01da: ldsfld System.Collections.Generic.List`1<ItemDrop/ItemData> LongshipUpgrades.ShipTrophyStand::tempItems
IL_01df: callvirt System.Int32 System.Collections.Generic.List`1<ItemDrop/ItemData>::get_Count()
IL_01e4: ldc.i4.0
IL_01e5: cgt
IL_01e7: stloc.s V_12
IL_01e9: ldloc.s V_12
IL_01eb: brfalse.s IL_0205
IL_01ed: nop
IL_01ee: ldarg.0
IL_01ef: ldarg.1
IL_01f0: ldsfld System.Collections.Generic.List`1<ItemDrop/ItemData> LongshipUpgrades.ShipTrophyStand::tempItems
IL_01f5: ldc.i4.0
IL_01f6: callvirt !0 System.Collections.Generic.List`1<ItemDrop/ItemData>::get_Item(System.Int32)
IL_01fb: call System.Boolean LongshipUpgrades.ShipTrophyStand::UseItem(Humanoid,ItemDrop/ItemData)
IL_0200: pop
IL_0201: ldc.i4.1
IL_0202: stloc.1
IL_0203: br.s IL_021b
IL_0205: nop
IL_0206: ldarg.1
IL_0207: ldc.i4.2
IL_0208: ldstr "$piece_itemstand_missingitem"
IL_020d: ldc.i4.0
IL_020e: ldnull
IL_020f: ldc.i4.0
IL_0210: callvirt System.Void Character::Message(MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_0215: nop
IL_0216: nop
IL_0217: ldc.i4.0
IL_0218: stloc.1
IL_0219: br.s IL_021b
IL_021b: ldloc.1
IL_021c: ret

// System.Boolean LongshipUpgrades.ShipTrophyStand::IsGuardianPowerActive(Humanoid)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: callvirt SEMan Character::GetSEMan()
IL_0007: ldarg.0
IL_0008: ldfld StatusEffect LongshipUpgrades.ShipTrophyStand::m_guardianPower
IL_000d: ldfld System.Int32 StatusEffect::m_nameHash
IL_0012: callvirt System.Boolean SEMan::HaveStatusEffect(System.Int32)
IL_0017: stloc.0
IL_0018: br.s IL_001a
IL_001a: ldloc.0
IL_001b: ret

// System.Boolean LongshipUpgrades.ShipTrophyStand::IsGuardianPowerOnCooldown(Player)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0008: brfalse.s IL_002b
IL_000a: ldarg.1
IL_000b: callvirt System.String Player::GetGuardianPowerName()
IL_0010: ldstr ""
IL_0015: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_001a: brfalse.s IL_002b
IL_001c: ldarg.1
IL_001d: ldfld System.Single Player::m_guardianPowerCooldown
IL_0022: ldc.r4 0
IL_0027: cgt
IL_0029: br.s IL_002c
IL_002b: ldc.i4.0
IL_002c: stloc.0
IL_002d: br.s IL_002f
IL_002f: ldloc.0
IL_0030: ret

// System.Void LongshipUpgrades.ShipTrophyStand::DelayedPowerActivation()
.locals Player, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldsfld Player Player::m_localPlayer
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000d: brfalse.s IL_001d
IL_000f: ldarg.0
IL_0010: ldfld StatusEffect LongshipUpgrades.ShipTrophyStand::m_guardianPower
IL_0015: ldnull
IL_0016: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_001b: br.s IL_001e
IL_001d: ldc.i4.0
IL_001e: stloc.1
IL_001f: ldloc.1
IL_0020: brfalse.s IL_0075
IL_0022: nop
IL_0023: ldloc.0
IL_0024: callvirt System.String Player::GetGuardianPowerName()
IL_0029: ldstr ""
IL_002e: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0033: stloc.2
IL_0034: ldloc.2
IL_0035: brfalse.s IL_0049
IL_0037: ldloc.0
IL_0038: ldarg.0
IL_0039: ldfld StatusEffect LongshipUpgrades.ShipTrophyStand::m_guardianPower
IL_003e: callvirt System.String UnityEngine.Object::get_name()
IL_0043: callvirt System.Void Player::SetGuardianPower(System.String)
IL_0048: nop
IL_0049: ldloc.0
IL_004a: callvirt SEMan Character::GetSEMan()
IL_004f: ldarg.0
IL_0050: ldfld StatusEffect LongshipUpgrades.ShipTrophyStand::m_guardianPower
IL_0055: ldc.i4.0
IL_0056: ldc.i4.0
IL_0057: ldc.r4 0
IL_005c: ldc.i4.m1
IL_005d: callvirt StatusEffect SEMan::AddStatusEffect(StatusEffect,System.Boolean,System.Int32,System.Single,System.Int16)
IL_0062: pop
IL_0063: ldloc.0
IL_0064: ldarg.0
IL_0065: ldfld StatusEffect LongshipUpgrades.ShipTrophyStand::m_guardianPower
IL_006a: ldfld System.Single StatusEffect::m_cooldown
IL_006f: stfld System.Single Player::m_guardianPowerCooldown
IL_0074: nop
IL_0075: ret

// System.Boolean LongshipUpgrades.ShipTrophyStand::UseItem(Humanoid,ItemDrop/ItemData)
.locals System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.Boolean LongshipUpgrades.ShipTrophyStand::HaveAttachment()
IL_0007: stloc.0
IL_0008: ldloc.0
IL_0009: brfalse.s IL_000f
IL_000b: ldc.i4.0
IL_000c: stloc.1
IL_000d: br.s IL_0087
IL_000f: ldarg.0
IL_0010: ldarg.2
IL_0011: call System.Boolean LongshipUpgrades.ShipTrophyStand::CanAttach(ItemDrop/ItemData)
IL_0016: ldc.i4.0
IL_0017: ceq
IL_0019: stloc.2
IL_001a: ldloc.2
IL_001b: brfalse.s IL_0032
IL_001d: nop
IL_001e: ldarg.1
IL_001f: ldc.i4.2
IL_0020: ldstr "$piece_itemstand_cantattach"
IL_0025: ldc.i4.0
IL_0026: ldnull
IL_0027: ldc.i4.0
IL_0028: callvirt System.Void Character::Message(MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_002d: nop
IL_002e: ldc.i4.1
IL_002f: stloc.1
IL_0030: br.s IL_0087
IL_0032: ldarg.0
IL_0033: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_0038: callvirt System.Boolean ZNetView::IsOwner()
IL_003d: ldc.i4.0
IL_003e: ceq
IL_0040: stloc.3
IL_0041: ldloc.3
IL_0042: brfalse.s IL_005a
IL_0044: ldarg.0
IL_0045: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_004a: ldstr "RequestOwn"
IL_004f: call !!0[] System.Array::Empty<System.Object>()
IL_0054: callvirt System.Void ZNetView::InvokeRPC(System.String,System.Object[])
IL_0059: nop
IL_005a: ldarg.0
IL_005b: ldarg.2
IL_005c: stfld ItemDrop/ItemData LongshipUpgrades.ShipTrophyStand::m_queuedItem
IL_0061: ldarg.0
IL_0062: ldstr "UpdateAttach"
IL_0067: call System.Void UnityEngine.MonoBehaviour::CancelInvoke(System.String)
IL_006c: nop
IL_006d: ldarg.0
IL_006e: ldstr "UpdateAttach"
IL_0073: ldc.r4 0
IL_0078: ldc.r4 0.1
IL_007d: call System.Void UnityEngine.MonoBehaviour::InvokeRepeating(System.String,System.Single,System.Single)
IL_0082: nop
IL_0083: ldc.i4.1
IL_0084: stloc.1
IL_0085: br.s IL_0087
IL_0087: ldloc.1
IL_0088: ret

// System.Void LongshipUpgrades.ShipTrophyStand::RPC_DropItem(System.Int64)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_0007: callvirt System.Boolean ZNetView::IsOwner()
IL_000c: stloc.0
IL_000d: ldloc.0
IL_000e: brfalse.s IL_0017
IL_0010: ldarg.0
IL_0011: call System.Void LongshipUpgrades.ShipTrophyStand::DropItem()
IL_0016: nop
IL_0017: ret

// System.Void LongshipUpgrades.ShipTrophyStand::DestroyAttachment()
.locals 
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_0007: ldstr "DestroyAttachment"
IL_000c: call !!0[] System.Array::Empty<System.Object>()
IL_0011: callvirt System.Void ZNetView::InvokeRPC(System.String,System.Object[])
IL_0016: nop
IL_0017: ret

// System.Void LongshipUpgrades.ShipTrophyStand::RPC_DestroyAttachment(System.Int64)
.locals System.Boolean, ZDOID
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_0007: callvirt System.Boolean ZNetView::IsOwner()
IL_000c: brfalse.s IL_0016
IL_000e: ldarg.0
IL_000f: call System.Boolean LongshipUpgrades.ShipTrophyStand::HaveAttachment()
IL_0014: br.s IL_0017
IL_0016: ldc.i4.0
IL_0017: stloc.0
IL_0018: ldloc.0
IL_0019: brfalse.s IL_0088
IL_001b: nop
IL_001c: ldarg.0
IL_001d: ldc.i4.0
IL_001e: call System.Void LongshipUpgrades.ShipTrophyStand::SetAttachedItem(System.Int32)
IL_0023: nop
IL_0024: ldarg.0
IL_0025: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_002a: ldsfld System.Int64 ZNetView::Everybody
IL_002f: ldstr "SetVisualItem"
IL_0034: ldc.i4.3
IL_0035: newarr System.Object
IL_003a: dup
IL_003b: ldc.i4.0
IL_003c: ldc.i4.0
IL_003d: box System.Int32
IL_0042: stelem.ref
IL_0043: dup
IL_0044: ldc.i4.1
IL_0045: ldc.i4.0
IL_0046: box System.Int32
IL_004b: stelem.ref
IL_004c: dup
IL_004d: ldc.i4.2
IL_004e: ldc.i4.0
IL_004f: box System.Int32
IL_0054: stelem.ref
IL_0055: callvirt System.Void ZNetView::InvokeRPC(System.Int64,System.String,System.Object[])
IL_005a: nop
IL_005b: ldarg.0
IL_005c: ldfld EffectList LongshipUpgrades.ShipTrophyStand::m_destroyEffects
IL_0061: ldarg.0
IL_0062: ldfld UnityEngine.Transform LongshipUpgrades.ShipTrophyStand::m_dropSpawnPoint
IL_0067: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_006c: call UnityEngine.Quaternion UnityEngine.Quaternion::get_identity()
IL_0071: ldnull
IL_0072: ldc.r4 1
IL_0077: ldc.i4.m1
IL_0078: ldloca.s V_1
IL_007a: initobj ZDOID
IL_0080: ldloc.1
IL_0081: callvirt UnityEngine.GameObject[] EffectList::Create(UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Transform,System.Single,System.Int32,ZDOID)
IL_0086: pop
IL_0087: nop
IL_0088: ret

// System.Void LongshipUpgrades.ShipTrophyStand::DropItem()
.locals System.Int32, UnityEngine.GameObject, System.Boolean, System.Boolean, System.Boolean, UnityEngine.Vector3, UnityEngine.Quaternion, UnityEngine.Transform, UnityEngine.GameObject, System.Boolean, ZDOID
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.Boolean LongshipUpgrades.ShipTrophyStand::HaveAttachment()
IL_0007: ldc.i4.0
IL_0008: ceq
IL_000a: stloc.2
IL_000b: ldloc.2
IL_000c: brfalse.s IL_0013
IL_000e: br IL_0192
IL_0013: ldarg.0
IL_0014: call System.Int32 LongshipUpgrades.ShipTrophyStand::GetAttachedItem()
IL_0019: stloc.0
IL_001a: call ObjectDB ObjectDB::get_instance()
IL_001f: ldloc.0
IL_0020: callvirt UnityEngine.GameObject ObjectDB::GetItemPrefab(System.Int32)
IL_0025: stloc.1
IL_0026: ldloc.1
IL_0027: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_002c: ldc.i4.0
IL_002d: ceq
IL_002f: stloc.3
IL_0030: ldloc.3
IL_0031: brfalse.s IL_0050
IL_0033: nop
IL_0034: ldstr "Cannot drop trophy because its item prefab is missing: "
IL_0039: ldloca.s V_0
IL_003b: call System.String System.Int32::ToString()
IL_0040: call System.String System.String::Concat(System.String,System.String)
IL_0045: call System.Void LongshipUpgrades.LongshipUpgrades::LogWarning(System.Object)
IL_004a: nop
IL_004b: br IL_0192
IL_0050: ldloc.1
IL_0051: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0056: stloc.s V_4
IL_0058: ldloc.s V_4
IL_005a: brfalse IL_0153
IL_005f: nop
IL_0060: call UnityEngine.Vector3 UnityEngine.Vector3::get_zero()
IL_0065: stloc.s V_5
IL_0067: call UnityEngine.Quaternion UnityEngine.Quaternion::get_identity()
IL_006c: stloc.s V_6
IL_006e: ldloc.1
IL_006f: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0074: ldstr "attach"
IL_0079: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_007e: stloc.s V_7
IL_0080: ldloc.1
IL_0081: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0086: ldstr "attachobj"
IL_008b: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0090: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0095: brfalse.s IL_00a0
IL_0097: ldloc.s V_7
IL_0099: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_009e: br.s IL_00a1
IL_00a0: ldc.i4.0
IL_00a1: stloc.s V_9
IL_00a3: ldloc.s V_9
IL_00a5: brfalse.s IL_00c5
IL_00a7: nop
IL_00a8: ldloc.s V_7
IL_00aa: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_00af: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_localRotation()
IL_00b4: stloc.s V_6
IL_00b6: ldloc.s V_7
IL_00b8: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_00bd: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localPosition()
IL_00c2: stloc.s V_5
IL_00c4: nop
IL_00c5: ldloc.1
IL_00c6: ldarg.0
IL_00c7: ldfld UnityEngine.Transform LongshipUpgrades.ShipTrophyStand::m_dropSpawnPoint
IL_00cc: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_00d1: ldloc.s V_5
IL_00d3: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_00d8: ldarg.0
IL_00d9: ldfld UnityEngine.Transform LongshipUpgrades.ShipTrophyStand::m_dropSpawnPoint
IL_00de: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_00e3: ldloc.s V_6
IL_00e5: call UnityEngine.Quaternion UnityEngine.Quaternion::op_Multiply(UnityEngine.Quaternion,UnityEngine.Quaternion)
IL_00ea: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Vector3,UnityEngine.Quaternion)
IL_00ef: stloc.s V_8
IL_00f1: ldloc.s V_8
IL_00f3: callvirt !!0 UnityEngine.GameObject::GetComponent<ItemDrop>()
IL_00f8: ldarg.0
IL_00f9: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_00fe: callvirt ZDO ZNetView::GetZDO()
IL_0103: callvirt System.Void ItemDrop::LoadFromExternalZDO(ZDO)
IL_0108: nop
IL_0109: ldloc.s V_8
IL_010b: callvirt !!0 UnityEngine.GameObject::GetComponent<UnityEngine.Rigidbody>()
IL_0110: call UnityEngine.Vector3 UnityEngine.Vector3::get_up()
IL_0115: ldc.r4 4
IL_011a: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_011f: callvirt System.Void UnityEngine.Rigidbody::set_linearVelocity(UnityEngine.Vector3)
IL_0124: nop
IL_0125: ldarg.0
IL_0126: ldfld EffectList LongshipUpgrades.ShipTrophyStand::m_effects
IL_012b: ldarg.0
IL_012c: ldfld UnityEngine.Transform LongshipUpgrades.ShipTrophyStand::m_dropSpawnPoint
IL_0131: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0136: call UnityEngine.Quaternion UnityEngine.Quaternion::get_identity()
IL_013b: ldnull
IL_013c: ldc.r4 1
IL_0141: ldc.i4.m1
IL_0142: ldloca.s V_10
IL_0144: initobj ZDOID
IL_014a: ldloc.s V_10
IL_014c: callvirt UnityEngine.GameObject[] EffectList::Create(UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Transform,System.Single,System.Int32,ZDOID)
IL_0151: pop
IL_0152: nop
IL_0153: ldarg.0
IL_0154: ldc.i4.0
IL_0155: call System.Void LongshipUpgrades.ShipTrophyStand::SetAttachedItem(System.Int32)
IL_015a: nop
IL_015b: ldarg.0
IL_015c: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_0161: ldsfld System.Int64 ZNetView::Everybody
IL_0166: ldstr "SetVisualItem"
IL_016b: ldc.i4.3
IL_016c: newarr System.Object
IL_0171: dup
IL_0172: ldc.i4.0
IL_0173: ldc.i4.0
IL_0174: box System.Int32
IL_0179: stelem.ref
IL_017a: dup
IL_017b: ldc.i4.1
IL_017c: ldc.i4.0
IL_017d: box System.Int32
IL_0182: stelem.ref
IL_0183: dup
IL_0184: ldc.i4.2
IL_0185: ldc.i4.0
IL_0186: box System.Int32
IL_018b: stelem.ref
IL_018c: callvirt System.Void ZNetView::InvokeRPC(System.Int64,System.String,System.Object[])
IL_0191: nop
IL_0192: ret

// UnityEngine.Transform LongshipUpgrades.ShipTrophyStand::GetAttach(ItemDrop/ItemData)
.locals UnityEngine.Transform
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld UnityEngine.Transform LongshipUpgrades.ShipTrophyStand::m_attachOther
IL_0007: stloc.0
IL_0008: br.s IL_000a
IL_000a: ldloc.0
IL_000b: ret

// System.Void LongshipUpgrades.ShipTrophyStand::UpdateAttach()
.locals System.Boolean, Player, System.Boolean, ItemDrop/ItemData, System.Int32, UnityEngine.Transform, ZDOID
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_0007: callvirt System.Boolean ZNetView::IsOwner()
IL_000c: stloc.0
IL_000d: ldloc.0
IL_000e: brfalse IL_0198
IL_0013: nop
IL_0014: ldarg.0
IL_0015: ldstr "UpdateAttach"
IL_001a: call System.Void UnityEngine.MonoBehaviour::CancelInvoke(System.String)
IL_001f: nop
IL_0020: ldsfld Player Player::m_localPlayer
IL_0025: stloc.1
IL_0026: ldarg.0
IL_0027: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTrophyStand::m_queuedItem
IL_002c: brfalse.s IL_0055
IL_002e: ldloc.1
IL_002f: ldnull
IL_0030: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0035: brfalse.s IL_0055
IL_0037: ldloc.1
IL_0038: callvirt Inventory Humanoid::GetInventory()
IL_003d: ldarg.0
IL_003e: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTrophyStand::m_queuedItem
IL_0043: callvirt System.Boolean Inventory::ContainsItem(ItemDrop/ItemData)
IL_0048: brfalse.s IL_0055
IL_004a: ldarg.0
IL_004b: call System.Boolean LongshipUpgrades.ShipTrophyStand::HaveAttachment()
IL_0050: ldc.i4.0
IL_0051: ceq
IL_0053: br.s IL_0056
IL_0055: ldc.i4.0
IL_0056: stloc.2
IL_0057: ldloc.2
IL_0058: brfalse IL_0190
IL_005d: nop
IL_005e: ldarg.0
IL_005f: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTrophyStand::m_queuedItem
IL_0064: callvirt ItemDrop/ItemData ItemDrop/ItemData::Clone()
IL_0069: stloc.3
IL_006a: ldloc.3
IL_006b: ldc.i4.1
IL_006c: stfld System.Int32 ItemDrop/ItemData::m_stack
IL_0071: ldarg.0
IL_0072: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTrophyStand::m_queuedItem
IL_0077: ldfld UnityEngine.GameObject ItemDrop/ItemData::m_dropPrefab
IL_007c: callvirt System.String UnityEngine.Object::get_name()
IL_0081: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0086: stloc.s V_4
IL_0088: ldarg.0
IL_0089: ldloc.s V_4
IL_008b: call System.Void LongshipUpgrades.ShipTrophyStand::SetAttachedItem(System.Int32)
IL_0090: nop
IL_0091: ldloc.3
IL_0092: ldarg.0
IL_0093: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_0098: callvirt ZDO ZNetView::GetZDO()
IL_009d: ldc.i4.m1
IL_009e: call System.Void ItemDrop::SaveToZDO(ItemDrop/ItemData,ZDO,System.Int32)
IL_00a3: nop
IL_00a4: ldarg.0
IL_00a5: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_00aa: callvirt ZDO ZNetView::GetZDO()
IL_00af: ldsfld System.Int32 ZDOVars::s_variant
IL_00b4: ldloc.3
IL_00b5: ldfld System.Int32 ItemDrop/ItemData::m_variant
IL_00ba: ldc.i4.0
IL_00bb: callvirt System.Void ZDO::Set(System.Int32,System.Int32,System.Boolean)
IL_00c0: nop
IL_00c1: ldarg.0
IL_00c2: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_00c7: callvirt ZDO ZNetView::GetZDO()
IL_00cc: ldsfld System.Int32 ZDOVars::s_quality
IL_00d1: ldloc.3
IL_00d2: ldfld System.Int32 ItemDrop/ItemData::m_quality
IL_00d7: ldc.i4.0
IL_00d8: callvirt System.Void ZDO::Set(System.Int32,System.Int32,System.Boolean)
IL_00dd: nop
IL_00de: ldloc.1
IL_00df: ldarg.0
IL_00e0: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTrophyStand::m_queuedItem
IL_00e5: ldc.i4.1
IL_00e6: callvirt System.Void Humanoid::UnequipItem(ItemDrop/ItemData,System.Boolean)
IL_00eb: nop
IL_00ec: ldloc.1
IL_00ed: callvirt Inventory Humanoid::GetInventory()
IL_00f2: ldarg.0
IL_00f3: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTrophyStand::m_queuedItem
IL_00f8: callvirt System.Boolean Inventory::RemoveOneItem(ItemDrop/ItemData)
IL_00fd: pop
IL_00fe: ldarg.0
IL_00ff: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_0104: ldsfld System.Int64 ZNetView::Everybody
IL_0109: ldstr "SetVisualItem"
IL_010e: ldc.i4.3
IL_010f: newarr System.Object
IL_0114: dup
IL_0115: ldc.i4.0
IL_0116: ldloc.s V_4
IL_0118: box System.Int32
IL_011d: stelem.ref
IL_011e: dup
IL_011f: ldc.i4.1
IL_0120: ldloc.3
IL_0121: ldfld System.Int32 ItemDrop/ItemData::m_variant
IL_0126: box System.Int32
IL_012b: stelem.ref
IL_012c: dup
IL_012d: ldc.i4.2
IL_012e: ldloc.3
IL_012f: ldfld System.Int32 ItemDrop/ItemData::m_quality
IL_0134: box System.Int32
IL_0139: stelem.ref
IL_013a: callvirt System.Void ZNetView::InvokeRPC(System.Int64,System.String,System.Object[])
IL_013f: nop
IL_0140: ldarg.0
IL_0141: ldarg.0
IL_0142: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTrophyStand::m_queuedItem
IL_0147: call UnityEngine.Transform LongshipUpgrades.ShipTrophyStand::GetAttach(ItemDrop/ItemData)
IL_014c: stloc.s V_5
IL_014e: ldarg.0
IL_014f: ldfld EffectList LongshipUpgrades.ShipTrophyStand::m_effects
IL_0154: ldloc.s V_5
IL_0156: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_015b: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0160: call UnityEngine.Quaternion UnityEngine.Quaternion::get_identity()
IL_0165: ldnull
IL_0166: ldc.r4 1
IL_016b: ldc.i4.m1
IL_016c: ldloca.s V_6
IL_016e: initobj ZDOID
IL_0174: ldloc.s V_6
IL_0176: callvirt UnityEngine.GameObject[] EffectList::Create(UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Transform,System.Single,System.Int32,ZDOID)
IL_017b: pop
IL_017c: call Game Game::get_instance()
IL_0181: ldc.i4.s 24
IL_0183: ldc.r4 1
IL_0188: ldc.i4.0
IL_0189: callvirt System.Void Game::IncrementPlayerStat(PlayerStatType,System.Single,System.Boolean)
IL_018e: nop
IL_018f: nop
IL_0190: ldarg.0
IL_0191: ldnull
IL_0192: stfld ItemDrop/ItemData LongshipUpgrades.ShipTrophyStand::m_queuedItem
IL_0197: nop
IL_0198: ret

// System.Void LongshipUpgrades.ShipTrophyStand::RPC_RequestOwn(System.Int64)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_0007: callvirt System.Boolean ZNetView::IsOwner()
IL_000c: stloc.0
IL_000d: ldloc.0
IL_000e: brfalse.s IL_0022
IL_0010: ldarg.0
IL_0011: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_0016: callvirt ZDO ZNetView::GetZDO()
IL_001b: ldarg.1
IL_001c: callvirt System.Void ZDO::SetOwner(System.Int64)
IL_0021: nop
IL_0022: ret

// System.Void LongshipUpgrades.ShipTrophyStand::UpdateVisual()
.locals System.Boolean, System.Int32, System.Int32, System.Int32
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_0007: ldnull
IL_0008: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_000d: brtrue.s IL_001c
IL_000f: ldarg.0
IL_0010: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_0015: callvirt System.Boolean ZNetView::IsValid()
IL_001a: br.s IL_001d
IL_001c: ldc.i4.0
IL_001d: stloc.0
IL_001e: ldloc.0
IL_001f: brfalse.s IL_0062
IL_0021: nop
IL_0022: ldarg.0
IL_0023: call System.Int32 LongshipUpgrades.ShipTrophyStand::GetAttachedItem()
IL_0028: stloc.1
IL_0029: ldarg.0
IL_002a: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_002f: callvirt ZDO ZNetView::GetZDO()
IL_0034: ldsfld System.Int32 ZDOVars::s_variant
IL_0039: ldc.i4.0
IL_003a: callvirt System.Int32 ZDO::GetInt(System.Int32,System.Int32)
IL_003f: stloc.2
IL_0040: ldarg.0
IL_0041: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_0046: callvirt ZDO ZNetView::GetZDO()
IL_004b: ldsfld System.Int32 ZDOVars::s_quality
IL_0050: ldc.i4.1
IL_0051: callvirt System.Int32 ZDO::GetInt(System.Int32,System.Int32)
IL_0056: stloc.3
IL_0057: ldarg.0
IL_0058: ldloc.1
IL_0059: ldloc.2
IL_005a: ldloc.3
IL_005b: call System.Void LongshipUpgrades.ShipTrophyStand::SetVisualItem(System.Int32,System.Int32,System.Int32)
IL_0060: nop
IL_0061: nop
IL_0062: ret

// System.Void LongshipUpgrades.ShipTrophyStand::RPC_SetVisualItem(System.Int64,System.Int32,System.Int32,System.Int32)
.locals 
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldarg.2
IL_0003: ldarg.3
IL_0004: ldarg.s quality
IL_0006: call System.Void LongshipUpgrades.ShipTrophyStand::SetVisualItem(System.Int32,System.Int32,System.Int32)
IL_000b: nop
IL_000c: ret

// System.Void LongshipUpgrades.ShipTrophyStand::SetVisualItem(System.Int32,System.Int32,System.Int32)
.locals UnityEngine.GameObject, System.String, SE_Stats, UnityEngine.GameObject, ItemDrop, UnityEngine.Transform, UnityEngine.GameObject, System.Single, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.Int32 LongshipUpgrades.ShipTrophyStand::m_visualHash
IL_0007: ldarg.1
IL_0008: bne.un.s IL_001e
IL_000a: ldarg.0
IL_000b: ldfld System.Int32 LongshipUpgrades.ShipTrophyStand::m_visualVariant
IL_0010: ldarg.2
IL_0011: bne.un.s IL_001e
IL_0013: ldarg.0
IL_0014: ldfld System.Int32 LongshipUpgrades.ShipTrophyStand::m_visualQuality
IL_0019: ldarg.3
IL_001a: ceq
IL_001c: br.s IL_001f
IL_001e: ldc.i4.0
IL_001f: stloc.s V_8
IL_0021: ldloc.s V_8
IL_0023: brfalse.s IL_002a
IL_0025: br IL_0244
IL_002a: ldarg.0
IL_002b: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTrophyStand::m_visualItem
IL_0030: call System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_0035: nop
IL_0036: ldarg.0
IL_0037: ldnull
IL_0038: stfld UnityEngine.GameObject LongshipUpgrades.ShipTrophyStand::m_visualItem
IL_003d: ldarg.0
IL_003e: ldarg.1
IL_003f: stfld System.Int32 LongshipUpgrades.ShipTrophyStand::m_visualHash
IL_0044: ldarg.0
IL_0045: ldarg.3
IL_0046: stfld System.Int32 LongshipUpgrades.ShipTrophyStand::m_visualQuality
IL_004b: ldarg.0
IL_004c: ldarg.2
IL_004d: stfld System.Int32 LongshipUpgrades.ShipTrophyStand::m_visualVariant
IL_0052: ldarg.0
IL_0053: ldstr ""
IL_0058: stfld System.String LongshipUpgrades.ShipTrophyStand::m_currentItemName
IL_005d: ldarg.0
IL_005e: ldnull
IL_005f: stfld StatusEffect LongshipUpgrades.ShipTrophyStand::m_guardianPower
IL_0064: ldarg.0
IL_0065: ldfld System.Int32 LongshipUpgrades.ShipTrophyStand::m_visualHash
IL_006a: ldc.i4.0
IL_006b: ceq
IL_006d: stloc.s V_9
IL_006f: ldloc.s V_9
IL_0071: brfalse.s IL_0085
IL_0073: nop
IL_0074: ldarg.0
IL_0075: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTrophyStand::m_visualItem
IL_007a: call System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_007f: nop
IL_0080: br IL_0244
IL_0085: call ObjectDB ObjectDB::get_instance()
IL_008a: ldarg.1
IL_008b: callvirt UnityEngine.GameObject ObjectDB::GetItemPrefab(System.Int32)
IL_0090: stloc.0
IL_0091: ldloc.0
IL_0092: ldnull
IL_0093: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0098: stloc.s V_10
IL_009a: ldloc.s V_10
IL_009c: brfalse.s IL_00bb
IL_009e: nop
IL_009f: ldstr "Missing item prefab "
IL_00a4: ldarga.s itemHash
IL_00a6: call System.String System.Int32::ToString()
IL_00ab: call System.String System.String::Concat(System.String,System.String)
IL_00b0: call System.Void LongshipUpgrades.LongshipUpgrades::LogWarning(System.Object)
IL_00b5: nop
IL_00b6: br IL_0244
IL_00bb: ldloc.0
IL_00bc: callvirt System.String UnityEngine.Object::get_name()
IL_00c1: stloc.1
IL_00c2: ldarg.0
IL_00c3: ldsfld System.Collections.Generic.Dictionary`2<System.String,SE_Stats> LongshipUpgrades.ShipTrophyStand::trophyEffects
IL_00c8: ldloc.1
IL_00c9: ldloca.s V_2
IL_00cb: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,SE_Stats>::TryGetValue(!0,!1&)
IL_00d0: brtrue.s IL_00d5
IL_00d2: ldnull
IL_00d3: br.s IL_00d6
IL_00d5: ldloc.2
IL_00d6: stfld StatusEffect LongshipUpgrades.ShipTrophyStand::m_guardianPower
IL_00db: ldloc.0
IL_00dc: call UnityEngine.GameObject LongshipUpgrades.ShipTrophyStand::GetAttachPrefab(UnityEngine.GameObject)
IL_00e1: stloc.3
IL_00e2: ldloc.3
IL_00e3: ldnull
IL_00e4: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_00e9: stloc.s V_11
IL_00eb: ldloc.s V_11
IL_00ed: brfalse.s IL_0106
IL_00ef: nop
IL_00f0: ldstr "Failed to get attach prefab for item "
IL_00f5: ldloc.1
IL_00f6: call System.String System.String::Concat(System.String,System.String)
IL_00fb: call System.Void LongshipUpgrades.LongshipUpgrades::LogWarning(System.Object)
IL_0100: nop
IL_0101: br IL_0244
IL_0106: ldloc.0
IL_0107: callvirt !!0 UnityEngine.GameObject::GetComponent<ItemDrop>()
IL_010c: stloc.s V_4
IL_010e: ldarg.0
IL_010f: ldloc.s V_4
IL_0111: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0116: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_011b: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_0120: stfld System.String LongshipUpgrades.ShipTrophyStand::m_currentItemName
IL_0125: ldarg.0
IL_0126: ldloc.s V_4
IL_0128: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_012d: call UnityEngine.Transform LongshipUpgrades.ShipTrophyStand::GetAttach(ItemDrop/ItemData)
IL_0132: stloc.s V_5
IL_0134: ldloc.3
IL_0135: call UnityEngine.GameObject LongshipUpgrades.ShipTrophyStand::GetAttachGameObject(UnityEngine.GameObject)
IL_013a: stloc.s V_6
IL_013c: ldarg.0
IL_013d: ldloc.s V_6
IL_013f: ldloc.s V_5
IL_0141: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0146: ldloc.s V_5
IL_0148: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_014d: ldloc.s V_5
IL_014f: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Transform)
IL_0154: stfld UnityEngine.GameObject LongshipUpgrades.ShipTrophyStand::m_visualItem
IL_0159: ldarg.0
IL_015a: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTrophyStand::m_visualItem
IL_015f: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0164: ldloc.3
IL_0165: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_016a: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localPosition()
IL_016f: callvirt System.Void UnityEngine.Transform::set_localPosition(UnityEngine.Vector3)
IL_0174: nop
IL_0175: ldarg.0
IL_0176: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTrophyStand::m_visualItem
IL_017b: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0180: ldloc.3
IL_0181: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0186: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_localRotation()
IL_018b: callvirt System.Void UnityEngine.Transform::set_localRotation(UnityEngine.Quaternion)
IL_0190: nop
IL_0191: ldarg.0
IL_0192: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTrophyStand::m_visualItem
IL_0197: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_019c: ldloc.3
IL_019d: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_01a2: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localScale()
IL_01a7: ldloc.s V_4
IL_01a9: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_01ae: ldarg.3
IL_01af: conv.r4
IL_01b0: callvirt UnityEngine.Vector3 ItemDrop/ItemData::GetScale(System.Single)
IL_01b5: call UnityEngine.Vector3 UnityEngine.Vector3::Scale(UnityEngine.Vector3,UnityEngine.Vector3)
IL_01ba: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_01bf: nop
IL_01c0: ldloc.1
IL_01c1: ldloca.s V_7
IL_01c3: call System.Boolean LongshipUpgrades.ShipTrophyStand::TryFindScaleOverride(System.String,System.Single&)
IL_01c8: stloc.s V_12
IL_01ca: ldloc.s V_12
IL_01cc: brfalse.s IL_01eb
IL_01ce: ldarg.0
IL_01cf: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTrophyStand::m_visualItem
IL_01d4: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_01d9: call UnityEngine.Vector3 UnityEngine.Vector3::get_one()
IL_01de: ldloc.s V_7
IL_01e0: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_01e5: callvirt System.Void UnityEngine.Transform::set_localScale(UnityEngine.Vector3)
IL_01ea: nop
IL_01eb: ldarg.0
IL_01ec: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTrophyStand::m_visualItem
IL_01f1: callvirt !!0 UnityEngine.GameObject::GetComponentInChildren<IEquipmentVisual>()
IL_01f6: dup
IL_01f7: brtrue.s IL_01fc
IL_01f9: pop
IL_01fa: br.s IL_0208
IL_01fc: ldarg.0
IL_01fd: ldfld System.Int32 LongshipUpgrades.ShipTrophyStand::m_visualVariant
IL_0202: callvirt System.Void IEquipmentVisual::Setup(System.Int32)
IL_0207: nop
IL_0208: ldarg.0
IL_0209: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTrophyStand::m_visualItem
IL_020e: callvirt !!0[] UnityEngine.GameObject::GetComponentsInChildren<UnityEngine.Collider>()
IL_0213: ldsfld System.Func`2<UnityEngine.Collider,System.Boolean> LongshipUpgrades.ShipTrophyStand/<>c::<>9__40_0
IL_0218: dup
IL_0219: brtrue.s IL_0232
IL_021b: pop
IL_021c: ldsfld LongshipUpgrades.ShipTrophyStand/<>c LongshipUpgrades.ShipTrophyStand/<>c::<>9
IL_0221: ldftn System.Boolean LongshipUpgrades.ShipTrophyStand/<>c::<SetVisualItem>b__40_0(UnityEngine.Collider)
IL_0227: newobj System.Void System.Func`2<UnityEngine.Collider,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_022c: dup
IL_022d: stsfld System.Func`2<UnityEngine.Collider,System.Boolean> LongshipUpgrades.ShipTrophyStand/<>c::<>9__40_0
IL_0232: ldnull
IL_0233: ldftn System.Void UnityEngine.Object::Destroy(UnityEngine.Object)
IL_0239: newobj System.Void System.Action`1<UnityEngine.Collider>::.ctor(System.Object,System.IntPtr)
IL_023e: call System.Void HarmonyLib.CollectionExtensions::DoIf<UnityEngine.Collider>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>,System.Action`1<!!0>)
IL_0243: nop
IL_0244: ret

// System.Boolean LongshipUpgrades.ShipTrophyStand::CanAttach(ItemDrop/ItemData)
.locals System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> LongshipUpgrades.LongshipUpgrades::onlyCreatorStand
IL_0006: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000b: brfalse.s IL_002b
IL_000d: ldarg.0
IL_000e: ldfld Piece LongshipUpgrades.ShipTrophyStand::m_piece
IL_0013: ldnull
IL_0014: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0019: brfalse.s IL_002b
IL_001b: ldarg.0
IL_001c: ldfld Piece LongshipUpgrades.ShipTrophyStand::m_piece
IL_0021: callvirt System.Boolean Piece::IsCreator()
IL_0026: ldc.i4.0
IL_0027: ceq
IL_0029: br.s IL_002c
IL_002b: ldc.i4.0
IL_002c: stloc.0
IL_002d: ldloc.0
IL_002e: brfalse.s IL_0034
IL_0030: ldc.i4.0
IL_0031: stloc.1
IL_0032: br.s IL_0070
IL_0034: ldarg.1
IL_0035: brfalse.s IL_006c
IL_0037: ldarg.1
IL_0038: ldfld UnityEngine.GameObject ItemDrop/ItemData::m_dropPrefab
IL_003d: ldnull
IL_003e: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0043: brfalse.s IL_006c
IL_0045: ldarg.1
IL_0046: ldfld UnityEngine.GameObject ItemDrop/ItemData::m_dropPrefab
IL_004b: call UnityEngine.GameObject LongshipUpgrades.ShipTrophyStand::GetAttachPrefab(UnityEngine.GameObject)
IL_0050: ldnull
IL_0051: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0056: brfalse.s IL_006c
IL_0058: ldarg.1
IL_0059: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_005e: ldfld ItemDrop/ItemData/ItemType ItemDrop/ItemData/SharedData::m_itemType
IL_0063: ldsfld ItemDrop/ItemData/ItemType LongshipUpgrades.ShipTrophyStand::supportedItemType
IL_0068: ceq
IL_006a: br.s IL_006d
IL_006c: ldc.i4.0
IL_006d: stloc.1
IL_006e: br.s IL_0070
IL_0070: ldloc.1
IL_0071: ret

// System.Boolean LongshipUpgrades.ShipTrophyStand::HaveAttachment()
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.Int32 LongshipUpgrades.ShipTrophyStand::GetAttachedItem()
IL_0007: ldc.i4.0
IL_0008: cgt.un
IL_000a: stloc.0
IL_000b: br.s IL_000d
IL_000d: ldloc.0
IL_000e: ret

// System.Int32 LongshipUpgrades.ShipTrophyStand::GetAttachedItem()
.locals ZDO, System.Int32, System.String, System.Boolean, System.Int32, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_0007: ldnull
IL_0008: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_000d: brtrue.s IL_001f
IL_000f: ldarg.0
IL_0010: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_0015: callvirt System.Boolean ZNetView::IsValid()
IL_001a: ldc.i4.0
IL_001b: ceq
IL_001d: br.s IL_0020
IL_001f: ldc.i4.1
IL_0020: stloc.3
IL_0021: ldloc.3
IL_0022: brfalse.s IL_0029
IL_0024: ldc.i4.0
IL_0025: stloc.s V_4
IL_0027: br.s IL_0077
IL_0029: ldarg.0
IL_002a: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_002f: callvirt ZDO ZNetView::GetZDO()
IL_0034: stloc.0
IL_0035: ldloc.0
IL_0036: ldsfld System.Int32 ZDOVars::s_item
IL_003b: ldc.i4.0
IL_003c: callvirt System.Int32 ZDO::GetInt(System.Int32,System.Int32)
IL_0041: stloc.1
IL_0042: ldloc.1
IL_0043: ldc.i4.0
IL_0044: cgt.un
IL_0046: stloc.s V_5
IL_0048: ldloc.s V_5
IL_004a: brfalse.s IL_0051
IL_004c: ldloc.1
IL_004d: stloc.s V_4
IL_004f: br.s IL_0077
IL_0051: ldloc.0
IL_0052: ldsfld System.Int32 ZDOVars::s_item
IL_0057: ldstr ""
IL_005c: callvirt System.String ZDO::GetString(System.Int32,System.String)
IL_0061: stloc.2
IL_0062: ldloc.2
IL_0063: call System.Boolean System.String::IsNullOrEmpty(System.String)
IL_0068: brtrue.s IL_0072
IL_006a: ldloc.2
IL_006b: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0070: br.s IL_0073
IL_0072: ldc.i4.0
IL_0073: stloc.s V_4
IL_0075: br.s IL_0077
IL_0077: ldloc.s V_4
IL_0079: ret

// System.Void LongshipUpgrades.ShipTrophyStand::SetAttachedItem(System.Int32)
.locals ZDO
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.ShipTrophyStand::m_nview
IL_0007: callvirt ZDO ZNetView::GetZDO()
IL_000c: stloc.0
IL_000d: ldloc.0
IL_000e: ldsfld System.Int32 ZDOVars::s_item
IL_0013: callvirt System.Boolean ZDO::RemoveString(System.Int32)
IL_0018: pop
IL_0019: ldloc.0
IL_001a: ldsfld System.Int32 ZDOVars::s_item
IL_001f: ldarg.1
IL_0020: ldc.i4.0
IL_0021: callvirt System.Void ZDO::Set(System.Int32,System.Int32,System.Boolean)
IL_0026: nop
IL_0027: ret

// System.Boolean LongshipUpgrades.ShipTrophyStand::TryFindScaleOverride(System.String,System.Single&)
.locals System.String[], System.Int32, System.String, System.String[], System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: nop
IL_0002: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> LongshipUpgrades.LongshipUpgrades::itemStandTrophyRescale
IL_0007: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_000c: ldc.i4.1
IL_000d: newarr System.Char
IL_0012: dup
IL_0013: ldc.i4.0
IL_0014: ldc.i4.s 59
IL_0016: stelem.i2
IL_0017: ldc.i4.1
IL_0018: callvirt System.String[] System.String::Split(System.Char[],System.StringSplitOptions)
IL_001d: stloc.0
IL_001e: ldc.i4.0
IL_001f: stloc.1
IL_0020: br.s IL_0072
IL_0022: ldloc.0
IL_0023: ldloc.1
IL_0024: ldelem.ref
IL_0025: stloc.2
IL_0026: nop
IL_0027: ldloc.2
IL_0028: ldc.i4.1
IL_0029: newarr System.Char
IL_002e: dup
IL_002f: ldc.i4.0
IL_0030: ldc.i4.s 58
IL_0032: stelem.i2
IL_0033: ldc.i4.1
IL_0034: callvirt System.String[] System.String::Split(System.Char[],System.StringSplitOptions)
IL_0039: stloc.3
IL_003a: ldloc.3
IL_003b: ldlen
IL_003c: conv.i4
IL_003d: ldc.i4.2
IL_003e: ceq
IL_0040: ldc.i4.0
IL_0041: ceq
IL_0043: stloc.s V_4
IL_0045: ldloc.s V_4
IL_0047: brfalse.s IL_004b
IL_0049: br.s IL_006e
IL_004b: ldloc.3
IL_004c: ldc.i4.0
IL_004d: ldelem.ref
IL_004e: ldarg.0
IL_004f: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0054: brfalse.s IL_0061
IL_0056: ldloc.3
IL_0057: ldc.i4.1
IL_0058: ldelem.ref
IL_0059: ldarg.1
IL_005a: call System.Boolean System.Single::TryParse(System.String,System.Single&)
IL_005f: br.s IL_0062
IL_0061: ldc.i4.0
IL_0062: stloc.s V_5
IL_0064: ldloc.s V_5
IL_0066: brfalse.s IL_006d
IL_0068: ldc.i4.1
IL_0069: stloc.s V_6
IL_006b: br.s IL_0085
IL_006d: nop
IL_006e: ldloc.1
IL_006f: ldc.i4.1
IL_0070: add
IL_0071: stloc.1
IL_0072: ldloc.1
IL_0073: ldloc.0
IL_0074: ldlen
IL_0075: conv.i4
IL_0076: blt.s IL_0022
IL_0078: nop
IL_0079: ldarg.1
IL_007a: ldc.r4 0
IL_007f: stind.r4
IL_0080: ldc.i4.0
IL_0081: stloc.s V_6
IL_0083: br.s IL_0085
IL_0085: ldloc.s V_6
IL_0087: ret

// UnityEngine.GameObject LongshipUpgrades.ShipTrophyStand::GetAttachPrefab(UnityEngine.GameObject)
.locals UnityEngine.GameObject
IL_0000: nop
IL_0001: ldarg.0
IL_0002: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0007: ldstr "attach"
IL_000c: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0011: dup
IL_0012: brtrue.s IL_0018
IL_0014: pop
IL_0015: ldnull
IL_0016: br.s IL_001d
IL_0018: call UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_001d: stloc.0
IL_001e: br.s IL_0020
IL_0020: ldloc.0
IL_0021: ret

// UnityEngine.GameObject LongshipUpgrades.ShipTrophyStand::GetAttachGameObject(UnityEngine.GameObject)
.locals UnityEngine.GameObject
IL_0000: nop
IL_0001: ldarg.0
IL_0002: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0007: ldstr "attachobj"
IL_000c: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0011: dup
IL_0012: brtrue.s IL_0018
IL_0014: pop
IL_0015: ldnull
IL_0016: br.s IL_001d
IL_0018: call UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_001d: dup
IL_001e: brtrue.s IL_0022
IL_0020: pop
IL_0021: ldarg.0
IL_0022: stloc.0
IL_0023: br.s IL_0025
IL_0025: ldloc.0
IL_0026: ret

// System.Void LongshipUpgrades.ShipTrophyStand::FillTrophyEffects()
.locals System.Collections.Generic.IEnumerator`1<ItemStand>, ItemStand
IL_0000: nop
IL_0001: ldsfld System.Collections.Generic.Dictionary`2<System.String,SE_Stats> LongshipUpgrades.ShipTrophyStand::trophyEffects
IL_0006: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,SE_Stats>::Clear()
IL_000b: nop
IL_000c: nop
IL_000d: call !!0[] UnityEngine.Resources::FindObjectsOfTypeAll<ItemStand>()
IL_0012: ldsfld System.Func`2<ItemStand,System.Boolean> LongshipUpgrades.ShipTrophyStand/<>c::<>9__48_0
IL_0017: dup
IL_0018: brtrue.s IL_0031
IL_001a: pop
IL_001b: ldsfld LongshipUpgrades.ShipTrophyStand/<>c LongshipUpgrades.ShipTrophyStand/<>c::<>9
IL_0020: ldftn System.Boolean LongshipUpgrades.ShipTrophyStand/<>c::<FillTrophyEffects>b__48_0(ItemStand)
IL_0026: newobj System.Void System.Func`2<ItemStand,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_002b: dup
IL_002c: stsfld System.Func`2<ItemStand,System.Boolean> LongshipUpgrades.ShipTrophyStand/<>c::<>9__48_0
IL_0031: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ItemStand>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0036: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<ItemStand>::GetEnumerator()
IL_003b: stloc.0
IL_003c: br.s IL_006c
IL_003e: ldloc.0
IL_003f: callvirt !0 System.Collections.Generic.IEnumerator`1<ItemStand>::get_Current()
IL_0044: stloc.1
IL_0045: ldsfld System.Collections.Generic.Dictionary`2<System.String,SE_Stats> LongshipUpgrades.ShipTrophyStand::trophyEffects
IL_004a: ldloc.1
IL_004b: ldfld System.Collections.Generic.List`1<ItemDrop> ItemStand::m_supportedItems
IL_0050: ldc.i4.0
IL_0051: callvirt !0 System.Collections.Generic.List`1<ItemDrop>::get_Item(System.Int32)
IL_0056: callvirt System.String UnityEngine.Object::get_name()
IL_005b: ldloc.1
IL_005c: ldfld StatusEffect ItemStand::m_guardianPower
IL_0061: isinst SE_Stats
IL_0066: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,SE_Stats>::set_Item(!0,!1)
IL_006b: nop
IL_006c: ldloc.0
IL_006d: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0072: brtrue.s IL_003e
IL_0074: leave.s IL_0081
IL_0076: ldloc.0
IL_0077: brfalse.s IL_0080
IL_0079: ldloc.0
IL_007a: callvirt System.Void System.IDisposable::Dispose()
IL_007f: nop
IL_0080: endfinally
IL_0081: ret
// EH Finally: 60 - 118 => 118 - 129

// System.Void LongshipUpgrades.ShipTrophyStand::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: ldstr "$guardianstone_hook_name"
IL_0006: stfld System.String LongshipUpgrades.ShipTrophyStand::m_name
IL_000b: ldarg.0
IL_000c: newobj System.Void EffectList::.ctor()
IL_0011: stfld EffectList LongshipUpgrades.ShipTrophyStand::m_effects
IL_0016: ldarg.0
IL_0017: newobj System.Void EffectList::.ctor()
IL_001c: stfld EffectList LongshipUpgrades.ShipTrophyStand::m_destroyEffects
IL_0021: ldarg.0
IL_0022: ldc.r4 2
IL_0027: stfld System.Single LongshipUpgrades.ShipTrophyStand::m_powerActivationDelay
IL_002c: ldarg.0
IL_002d: newobj System.Void EffectList::.ctor()
IL_0032: stfld EffectList LongshipUpgrades.ShipTrophyStand::m_activatePowerEffects
IL_0037: ldarg.0
IL_0038: newobj System.Void EffectList::.ctor()
IL_003d: stfld EffectList LongshipUpgrades.ShipTrophyStand::m_activatePowerEffectsPlayer
IL_0042: ldarg.0
IL_0043: ldstr ""
IL_0048: stfld System.String LongshipUpgrades.ShipTrophyStand::m_currentItemName
IL_004d: ldarg.0
IL_004e: call System.Void UnityEngine.MonoBehaviour::.ctor()
IL_0053: nop
IL_0054: ret

// System.Void LongshipUpgrades.ShipTrophyStand::.cctor()
.locals 
IL_0000: ldc.i4.s 13
IL_0002: stsfld ItemDrop/ItemData/ItemType LongshipUpgrades.ShipTrophyStand::supportedItemType
IL_0007: newobj System.Void System.Collections.Generic.List`1<ItemDrop/ItemData>::.ctor()
IL_000c: stsfld System.Collections.Generic.List`1<ItemDrop/ItemData> LongshipUpgrades.ShipTrophyStand::tempItems
IL_0011: ldc.i4.s 20
IL_0013: newobj System.Void System.Text.StringBuilder::.ctor(System.Int32)
IL_0018: stsfld System.Text.StringBuilder LongshipUpgrades.ShipTrophyStand::sb
IL_001d: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,SE_Stats>::.ctor()
IL_0022: stsfld System.Collections.Generic.Dictionary`2<System.String,SE_Stats> LongshipUpgrades.ShipTrophyStand::trophyEffects
IL_0027: ret

// System.Void LongshipUpgrades.ShipTrophyStand/<>c::.cctor()
.locals 
IL_0000: newobj System.Void LongshipUpgrades.ShipTrophyStand/<>c::.ctor()
IL_0005: stsfld LongshipUpgrades.ShipTrophyStand/<>c LongshipUpgrades.ShipTrophyStand/<>c::<>9
IL_000a: ret

// System.Void LongshipUpgrades.ShipTrophyStand/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Boolean LongshipUpgrades.ShipTrophyStand/<>c::<SetVisualItem>b__40_0(UnityEngine.Collider)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt System.Boolean UnityEngine.Collider::get_enabled()
IL_0006: brfalse.s IL_0013
IL_0008: ldarg.1
IL_0009: callvirt System.Boolean UnityEngine.Collider::get_isTrigger()
IL_000e: ldc.i4.0
IL_000f: ceq
IL_0011: br.s IL_0014
IL_0013: ldc.i4.0
IL_0014: ret

// System.Boolean LongshipUpgrades.ShipTrophyStand/<>c::<FillTrophyEffects>b__48_0(ItemStand)
.locals 
IL_0000: ldarg.1
IL_0001: ldfld StatusEffect ItemStand::m_guardianPower
IL_0006: isinst SE_Stats
IL_000b: brfalse.s IL_002f
IL_000d: ldarg.1
IL_000e: ldfld System.Collections.Generic.List`1<ItemDrop> ItemStand::m_supportedItems
IL_0013: callvirt System.Int32 System.Collections.Generic.List`1<ItemDrop>::get_Count()
IL_0018: ldc.i4.1
IL_0019: bne.un.s IL_002f
IL_001b: ldarg.1
IL_001c: ldfld System.Collections.Generic.List`1<ItemDrop> ItemStand::m_supportedItems
IL_0021: ldc.i4.0
IL_0022: callvirt !0 System.Collections.Generic.List`1<ItemDrop>::get_Item(System.Int32)
IL_0027: ldnull
IL_0028: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_002d: br.s IL_0030
IL_002f: ldc.i4.0
IL_0030: ret

// LongshipUpgrades.ShipTurret LongshipUpgrades.ShipTurret::SetPositionAtShip(System.Boolean)
.locals System.Boolean, WearNTear, System.Boolean, System.Boolean, System.Boolean, LongshipUpgrades.ShipTurret
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldarg.1
IL_0003: stfld System.Boolean LongshipUpgrades.ShipTurret::m_isLeftTurret
IL_0008: ldarg.0
IL_0009: ldfld System.Boolean LongshipUpgrades.ShipTurret::m_isLeftTurret
IL_000e: stloc.0
IL_000f: ldloc.0
IL_0010: brfalse.s IL_0060
IL_0012: nop
IL_0013: ldarg.0
IL_0014: ldc.i4.m1
IL_0015: stfld System.Int32 LongshipUpgrades.ShipTurret::m_scanDirection
IL_001a: ldarg.0
IL_001b: ldarg.0
IL_001c: ldfld System.Single LongshipUpgrades.ShipTurret::m_noTargetScanRate
IL_0021: ldc.r4 0.05
IL_0026: mul
IL_0027: stfld System.Single LongshipUpgrades.ShipTurret::m_scan
IL_002c: ldarg.0
IL_002d: call !!0 UnityEngine.Component::GetComponentInParent<WearNTear>()
IL_0032: stloc.1
IL_0033: ldloc.1
IL_0034: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0039: stloc.2
IL_003a: ldloc.2
IL_003b: brfalse.s IL_005f
IL_003d: ldloc.1
IL_003e: ldloc.1
IL_003f: ldfld System.Action WearNTear::m_onDestroyed
IL_0044: ldarg.0
IL_0045: ldftn System.Void LongshipUpgrades.ShipTurret::OnDestroyed()
IL_004b: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_0050: call System.Delegate System.Delegate::Combine(System.Delegate,System.Delegate)
IL_0055: castclass System.Action
IL_005a: stfld System.Action WearNTear::m_onDestroyed
IL_005f: nop
IL_0060: ldarg.0
IL_0061: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0066: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_006b: brfalse.s IL_007a
IL_006d: ldarg.0
IL_006e: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0073: callvirt System.Boolean ZNetView::IsValid()
IL_0078: br.s IL_007b
IL_007a: ldc.i4.0
IL_007b: stloc.3
IL_007c: ldloc.3
IL_007d: brfalse.s IL_00c8
IL_007f: nop
IL_0080: ldarg.0
IL_0081: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0086: ldarg.0
IL_0087: call System.String LongshipUpgrades.ShipTurret::GetNameSetTargetRPC()
IL_008c: ldarg.0
IL_008d: ldftn System.Void LongshipUpgrades.ShipTurret::RPC_SetTarget(System.Int64,ZDOID)
IL_0093: newobj System.Void System.Action`2<System.Int64,ZDOID>::.ctor(System.Object,System.IntPtr)
IL_0098: callvirt System.Void ZNetView::Register<ZDOID>(System.String,System.Action`2<System.Int64,!!0>)
IL_009d: nop
IL_009e: ldarg.0
IL_009f: ldfld System.Boolean LongshipUpgrades.ShipTurret::m_isLeftTurret
IL_00a4: stloc.s V_4
IL_00a6: ldloc.s V_4
IL_00a8: brfalse.s IL_00c7
IL_00aa: ldarg.0
IL_00ab: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_00b0: ldstr "RPC_AddAmmo"
IL_00b5: ldarg.0
IL_00b6: ldftn System.Void LongshipUpgrades.ShipTurret::RPC_AddAmmo(System.Int64,System.String)
IL_00bc: newobj System.Void System.Action`2<System.Int64,System.String>::.ctor(System.Object,System.IntPtr)
IL_00c1: callvirt System.Void ZNetView::Register<System.String>(System.String,System.Action`2<System.Int64,!!0>)
IL_00c6: nop
IL_00c7: nop
IL_00c8: ldarg.0
IL_00c9: stloc.s V_5
IL_00cb: br.s IL_00cd
IL_00cd: ldloc.s V_5
IL_00cf: ret

// LongshipUpgrades.ShipTurret LongshipUpgrades.ShipTurret::FillAllowedAmmo(System.Collections.Generic.List`1<Turret/AmmoType>)
.locals System.Collections.Generic.List`1/Enumerator<Turret/AmmoType>, Turret/AmmoType, Turret/AmmoType, System.Boolean, LongshipUpgrades.ShipTurret
IL_0000: nop
IL_0001: nop
IL_0002: ldarg.1
IL_0003: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Turret/AmmoType>::GetEnumerator()
IL_0008: stloc.0
IL_0009: br.s IL_005e
IL_000b: ldloca.s V_0
IL_000d: call !0 System.Collections.Generic.List`1/Enumerator<Turret/AmmoType>::get_Current()
IL_0012: stloc.1
IL_0013: nop
IL_0014: ldarg.0
IL_0015: ldfld System.Collections.Generic.List`1<Turret/AmmoType> LongshipUpgrades.ShipTurret::m_allowedAmmo
IL_001a: ldloca.s V_2
IL_001c: initobj Turret/AmmoType
IL_0022: ldloca.s V_2
IL_0024: ldloc.1
IL_0025: ldfld ItemDrop Turret/AmmoType::m_ammo
IL_002a: stfld ItemDrop Turret/AmmoType::m_ammo
IL_002f: ldloca.s V_2
IL_0031: ldarg.0
IL_0032: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_turretBody
IL_0037: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_003c: ldloc.1
IL_003d: ldfld UnityEngine.GameObject Turret/AmmoType::m_visual
IL_0042: callvirt System.String UnityEngine.Object::get_name()
IL_0047: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_004c: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0051: stfld UnityEngine.GameObject Turret/AmmoType::m_visual
IL_0056: ldloc.2
IL_0057: callvirt System.Void System.Collections.Generic.List`1<Turret/AmmoType>::Add(!0)
IL_005c: nop
IL_005d: nop
IL_005e: ldloca.s V_0
IL_0060: call System.Boolean System.Collections.Generic.List`1/Enumerator<Turret/AmmoType>::MoveNext()
IL_0065: brtrue.s IL_000b
IL_0067: leave.s IL_0078
IL_0069: ldloca.s V_0
IL_006b: constrained. System.Collections.Generic.List`1/Enumerator<Turret/AmmoType>
IL_0071: callvirt System.Void System.IDisposable::Dispose()
IL_0076: nop
IL_0077: endfinally
IL_0078: ldarg.0
IL_0079: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_007e: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0083: brfalse.s IL_0092
IL_0085: ldarg.0
IL_0086: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_008b: callvirt System.Boolean ZNetView::IsValid()
IL_0090: br.s IL_0093
IL_0092: ldc.i4.0
IL_0093: stloc.3
IL_0094: ldloc.3
IL_0095: brfalse.s IL_009e
IL_0097: ldarg.0
IL_0098: call System.Void LongshipUpgrades.ShipTurret::UpdateVisualBolt()
IL_009d: nop
IL_009e: ldarg.0
IL_009f: stloc.s V_4
IL_00a1: br.s IL_00a3
IL_00a3: ldloc.s V_4
IL_00a5: ret
// EH Finally: 9 - 105 => 105 - 120

// LongshipUpgrades.ShipTurret LongshipUpgrades.ShipTurret::FillTrophyTargets(System.Collections.Generic.List`1<Turret/TrophyTarget>)
.locals System.Collections.Generic.List`1/Enumerator<Turret/TrophyTarget>, Turret/TrophyTarget, Turret/TrophyTarget, System.Boolean, LongshipUpgrades.ShipTurret
IL_0000: nop
IL_0001: nop
IL_0002: ldarg.1
IL_0003: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Turret/TrophyTarget>::GetEnumerator()
IL_0008: stloc.0
IL_0009: br.s IL_0056
IL_000b: ldloca.s V_0
IL_000d: call !0 System.Collections.Generic.List`1/Enumerator<Turret/TrophyTarget>::get_Current()
IL_0012: stloc.1
IL_0013: nop
IL_0014: ldarg.0
IL_0015: ldfld System.Collections.Generic.List`1<Turret/TrophyTarget> LongshipUpgrades.ShipTurret::m_configTargets
IL_001a: ldloca.s V_2
IL_001c: initobj Turret/TrophyTarget
IL_0022: ldloca.s V_2
IL_0024: ldloc.1
IL_0025: ldfld System.String Turret/TrophyTarget::m_nameOverride
IL_002a: stfld System.String Turret/TrophyTarget::m_nameOverride
IL_002f: ldloca.s V_2
IL_0031: ldloc.1
IL_0032: ldfld ItemDrop Turret/TrophyTarget::m_item
IL_0037: stfld ItemDrop Turret/TrophyTarget::m_item
IL_003c: ldloca.s V_2
IL_003e: ldloc.1
IL_003f: ldfld System.Collections.Generic.List`1<Character> Turret/TrophyTarget::m_targets
IL_0044: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<Character>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0049: stfld System.Collections.Generic.List`1<Character> Turret/TrophyTarget::m_targets
IL_004e: ldloc.2
IL_004f: callvirt System.Void System.Collections.Generic.List`1<Turret/TrophyTarget>::Add(!0)
IL_0054: nop
IL_0055: nop
IL_0056: ldloca.s V_0
IL_0058: call System.Boolean System.Collections.Generic.List`1/Enumerator<Turret/TrophyTarget>::MoveNext()
IL_005d: brtrue.s IL_000b
IL_005f: leave.s IL_0070
IL_0061: ldloca.s V_0
IL_0063: constrained. System.Collections.Generic.List`1/Enumerator<Turret/TrophyTarget>
IL_0069: callvirt System.Void System.IDisposable::Dispose()
IL_006e: nop
IL_006f: endfinally
IL_0070: ldarg.0
IL_0071: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0076: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_007b: brfalse.s IL_008a
IL_007d: ldarg.0
IL_007e: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0083: callvirt System.Boolean ZNetView::IsValid()
IL_0088: br.s IL_008b
IL_008a: ldc.i4.0
IL_008b: stloc.3
IL_008c: ldloc.3
IL_008d: brfalse.s IL_0096
IL_008f: ldarg.0
IL_0090: call System.Void LongshipUpgrades.ShipTurret::ReadTargets()
IL_0095: nop
IL_0096: ldarg.0
IL_0097: stloc.s V_4
IL_0099: br.s IL_009b
IL_009b: ldloc.s V_4
IL_009d: ret
// EH Finally: 9 - 97 => 97 - 112

// System.Void LongshipUpgrades.ShipTurret::Awake()
.locals 
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldarg.0
IL_0003: call !!0 UnityEngine.Component::GetComponentInParent<ZNetView>()
IL_0008: stfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_000d: ldarg.0
IL_000e: ldarg.0
IL_000f: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0014: ldstr "BodyRotation"
IL_0019: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_001e: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0023: stfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_turretBody
IL_0028: ldarg.0
IL_0029: ldarg.0
IL_002a: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_002f: ldstr "BodyRotation/Body"
IL_0034: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0039: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_003e: stfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_turretBodyArmed
IL_0043: ldarg.0
IL_0044: ldarg.0
IL_0045: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_004a: ldstr "BodyRotation/Body_Unarmed"
IL_004f: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0054: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0059: stfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_turretBodyUnarmed
IL_005e: ldarg.0
IL_005f: ldarg.0
IL_0060: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0065: ldstr "NeckRotation"
IL_006a: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_006f: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0074: stfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_turretNeck
IL_0079: ldarg.0
IL_007a: ldarg.0
IL_007b: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0080: ldstr "BodyRotation/Eye"
IL_0085: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_008a: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_008f: stfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_eye
IL_0094: ldarg.0
IL_0095: ldc.r4 0
IL_009a: ldarg.0
IL_009b: ldfld System.Single LongshipUpgrades.ShipTurret::m_updateTargetIntervalNear
IL_00a0: call System.Single UnityEngine.Random::Range(System.Single,System.Single)
IL_00a5: stfld System.Single LongshipUpgrades.ShipTurret::m_updateTargetTimer
IL_00aa: ldarg.0
IL_00ab: call System.Void LongshipUpgrades.ShipTurret::ReadTargets()
IL_00b0: nop
IL_00b1: ret

// System.Void LongshipUpgrades.ShipTurret::FixedUpdate()
.locals System.Single, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: call System.Single UnityEngine.Time::get_fixedDeltaTime()
IL_0006: stloc.0
IL_0007: ldarg.0
IL_0008: call System.Void LongshipUpgrades.ShipTurret::UpdateReloadState()
IL_000d: nop
IL_000e: ldarg.0
IL_000f: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0014: callvirt System.Boolean ZNetView::IsValid()
IL_0019: ldc.i4.0
IL_001a: ceq
IL_001c: stloc.1
IL_001d: ldloc.1
IL_001e: brfalse.s IL_0025
IL_0020: br IL_00a9
IL_0025: ldarg.0
IL_0026: ldloc.0
IL_0027: call System.Void LongshipUpgrades.ShipTurret::UpdateTurretRotation(System.Single)
IL_002c: nop
IL_002d: ldarg.0
IL_002e: call System.Void LongshipUpgrades.ShipTurret::UpdateVisualBolt()
IL_0033: nop
IL_0034: ldarg.0
IL_0035: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_003a: callvirt System.Boolean ZNetView::IsOwner()
IL_003f: ldc.i4.0
IL_0040: ceq
IL_0042: stloc.2
IL_0043: ldloc.2
IL_0044: brfalse.s IL_0098
IL_0046: nop
IL_0047: ldarg.0
IL_0048: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_004d: callvirt System.Boolean ZNetView::IsValid()
IL_0052: brfalse.s IL_0071
IL_0054: ldarg.0
IL_0055: ldfld System.UInt32 LongshipUpgrades.ShipTurret::m_lastUpdateTargetRevision
IL_005a: ldarg.0
IL_005b: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0060: callvirt ZDO ZNetView::GetZDO()
IL_0065: callvirt System.UInt32 ZDO::get_DataRevision()
IL_006a: ceq
IL_006c: ldc.i4.0
IL_006d: ceq
IL_006f: br.s IL_0072
IL_0071: ldc.i4.0
IL_0072: stloc.3
IL_0073: ldloc.3
IL_0074: brfalse.s IL_0095
IL_0076: nop
IL_0077: ldarg.0
IL_0078: ldarg.0
IL_0079: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_007e: callvirt ZDO ZNetView::GetZDO()
IL_0083: callvirt System.UInt32 ZDO::get_DataRevision()
IL_0088: stfld System.UInt32 LongshipUpgrades.ShipTurret::m_lastUpdateTargetRevision
IL_008d: ldarg.0
IL_008e: call System.Void LongshipUpgrades.ShipTurret::ReadTargets()
IL_0093: nop
IL_0094: nop
IL_0095: nop
IL_0096: br.s IL_00a9
IL_0098: nop
IL_0099: ldarg.0
IL_009a: ldloc.0
IL_009b: call System.Void LongshipUpgrades.ShipTurret::UpdateTarget(System.Single)
IL_00a0: nop
IL_00a1: ldarg.0
IL_00a2: call System.Void LongshipUpgrades.ShipTurret::UpdateAttack()
IL_00a7: nop
IL_00a8: nop
IL_00a9: ret

// System.Void LongshipUpgrades.ShipTurret::UpdateTurretRotation(System.Single)
.locals System.Boolean, UnityEngine.Vector3, UnityEngine.Quaternion, UnityEngine.Vector3, System.Single, UnityEngine.Quaternion, System.Boolean, System.Boolean, System.Boolean, System.Single, UnityEngine.Vector3, UnityEngine.CapsuleCollider, System.Boolean, System.Boolean, UnityEngine.Quaternion, System.Boolean, System.Single, System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.Boolean LongshipUpgrades.ShipTurret::IsCoolingDown()
IL_0007: stloc.s V_6
IL_0009: ldloc.s V_6
IL_000b: brfalse.s IL_0012
IL_000d: br IL_03fb
IL_0012: ldc.i4.0
IL_0013: stloc.0
IL_0014: ldarg.0
IL_0015: call System.Boolean LongshipUpgrades.ShipTurret::HasAmmoAndEnabled()
IL_001a: stloc.s V_7
IL_001c: ldloc.s V_7
IL_001e: brfalse IL_020a
IL_0023: nop
IL_0024: ldarg.0
IL_0025: ldfld Character LongshipUpgrades.ShipTurret::m_target
IL_002a: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_002f: stloc.0
IL_0030: ldloc.0
IL_0031: stloc.s V_8
IL_0033: ldloc.s V_8
IL_0035: brfalse IL_0155
IL_003a: nop
IL_003b: ldarg.0
IL_003c: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_0041: brtrue.s IL_004f
IL_0043: ldarg.0
IL_0044: ldarg.0
IL_0045: call ItemDrop/ItemData LongshipUpgrades.ShipTurret::GetAmmoItem()
IL_004a: stfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_004f: ldarg.0
IL_0050: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_0055: ldnull
IL_0056: ceq
IL_0058: stloc.s V_12
IL_005a: ldloc.s V_12
IL_005c: brfalse.s IL_0087
IL_005e: nop
IL_005f: ldstr "Turret had invalid ammo, resetting ammo"
IL_0064: call System.Void LongshipUpgrades.LongshipUpgrades::LogWarning(System.Object)
IL_0069: nop
IL_006a: ldarg.0
IL_006b: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0070: callvirt ZDO ZNetView::GetZDO()
IL_0075: ldsfld System.Int32 ZDOVars::s_ammo
IL_007a: ldc.i4.0
IL_007b: ldc.i4.0
IL_007c: callvirt System.Void ZDO::Set(System.Int32,System.Int32,System.Boolean)
IL_0081: nop
IL_0082: br IL_03fb
IL_0087: ldarg.0
IL_0088: ldfld Character LongshipUpgrades.ShipTurret::m_target
IL_008d: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0092: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0097: call UnityEngine.Vector2 UnityEngine.Vector2::op_Implicit(UnityEngine.Vector3)
IL_009c: ldarg.0
IL_009d: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_eye
IL_00a2: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_00a7: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_00ac: call UnityEngine.Vector2 UnityEngine.Vector2::op_Implicit(UnityEngine.Vector3)
IL_00b1: call System.Single UnityEngine.Vector2::Distance(UnityEngine.Vector2,UnityEngine.Vector2)
IL_00b6: ldarg.0
IL_00b7: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_00bc: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_00c1: ldfld Attack ItemDrop/ItemData/SharedData::m_attack
IL_00c6: ldfld System.Single Attack::m_projectileVel
IL_00cb: div
IL_00cc: stloc.s V_9
IL_00ce: ldarg.0
IL_00cf: ldfld Character LongshipUpgrades.ShipTurret::m_target
IL_00d4: callvirt UnityEngine.Vector3 Character::GetVelocity()
IL_00d9: ldloc.s V_9
IL_00db: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_00e0: ldarg.0
IL_00e1: ldfld System.Single LongshipUpgrades.ShipTurret::m_predictionModifier
IL_00e6: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_00eb: stloc.s V_10
IL_00ed: ldarg.0
IL_00ee: ldfld Character LongshipUpgrades.ShipTurret::m_target
IL_00f3: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_00f8: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_00fd: ldloc.s V_10
IL_00ff: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0104: ldarg.0
IL_0105: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_turretBody
IL_010a: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_010f: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0114: call UnityEngine.Vector3 UnityEngine.Vector3::op_Subtraction(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0119: stloc.1
IL_011a: ldarg.0
IL_011b: ldfld Character LongshipUpgrades.ShipTurret::m_target
IL_0120: callvirt !!0 UnityEngine.Component::GetComponentInChildren<UnityEngine.CapsuleCollider>()
IL_0125: stloc.s V_11
IL_0127: ldloca.s V_1
IL_0129: ldflda System.Single UnityEngine.Vector3::y
IL_012e: dup
IL_012f: ldind.r4
IL_0130: ldloc.s V_11
IL_0132: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0137: brtrue.s IL_0140
IL_0139: ldc.r4 1
IL_013e: br.s IL_014d
IL_0140: ldloc.s V_11
IL_0142: callvirt System.Single UnityEngine.CapsuleCollider::get_height()
IL_0147: ldc.r4 2
IL_014c: div
IL_014d: add
IL_014e: stind.r4
IL_014f: nop
IL_0150: br IL_0207
IL_0155: nop
IL_0156: ldarg.0
IL_0157: ldarg.0
IL_0158: ldfld System.Single LongshipUpgrades.ShipTurret::m_scan
IL_015d: ldarg.1
IL_015e: add
IL_015f: stfld System.Single LongshipUpgrades.ShipTurret::m_scan
IL_0164: ldarg.0
IL_0165: ldfld System.Single LongshipUpgrades.ShipTurret::m_scan
IL_016a: ldarg.0
IL_016b: ldfld System.Single LongshipUpgrades.ShipTurret::m_noTargetScanRate
IL_0170: ldc.r4 2
IL_0175: mul
IL_0176: cgt
IL_0178: stloc.s V_13
IL_017a: ldloc.s V_13
IL_017c: brfalse.s IL_01a0
IL_017e: nop
IL_017f: ldarg.0
IL_0180: ldc.r4 0
IL_0185: stfld System.Single LongshipUpgrades.ShipTurret::m_scan
IL_018a: ldarg.0
IL_018b: ldc.r4 0.5
IL_0190: ldc.r4 1
IL_0195: call System.Single UnityEngine.Random::Range(System.Single,System.Single)
IL_019a: stfld System.Single LongshipUpgrades.ShipTurret::m_scanDistance
IL_019f: nop
IL_01a0: ldc.r4 0
IL_01a5: ldarg.0
IL_01a6: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_01ab: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_01b0: stloc.s V_14
IL_01b2: ldloca.s V_14
IL_01b4: call UnityEngine.Vector3 UnityEngine.Quaternion::get_eulerAngles()
IL_01b9: ldfld System.Single UnityEngine.Vector3::y
IL_01be: ldarg.0
IL_01bf: ldfld System.Single LongshipUpgrades.ShipTurret::m_scan
IL_01c4: ldarg.0
IL_01c5: ldfld System.Single LongshipUpgrades.ShipTurret::m_noTargetScanRate
IL_01ca: sub
IL_01cb: ldc.r4 0
IL_01d0: bgt.s IL_01db
IL_01d2: ldarg.0
IL_01d3: ldfld System.Int32 LongshipUpgrades.ShipTurret::m_scanDirection
IL_01d8: neg
IL_01d9: br.s IL_01e1
IL_01db: ldarg.0
IL_01dc: ldfld System.Int32 LongshipUpgrades.ShipTurret::m_scanDirection
IL_01e1: conv.r4
IL_01e2: ldarg.0
IL_01e3: ldfld System.Single LongshipUpgrades.ShipTurret::m_horizontalAngle
IL_01e8: mul
IL_01e9: ldarg.0
IL_01ea: ldfld System.Single LongshipUpgrades.ShipTurret::m_scanDistance
IL_01ef: mul
IL_01f0: add
IL_01f1: ldc.r4 0
IL_01f6: call UnityEngine.Quaternion UnityEngine.Quaternion::Euler(System.Single,System.Single,System.Single)
IL_01fb: call UnityEngine.Vector3 UnityEngine.Vector3::get_forward()
IL_0200: call UnityEngine.Vector3 UnityEngine.Quaternion::op_Multiply(UnityEngine.Quaternion,UnityEngine.Vector3)
IL_0205: stloc.1
IL_0206: nop
IL_0207: nop
IL_0208: br.s IL_0231
IL_020a: nop
IL_020b: ldarg.0
IL_020c: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0211: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_forward()
IL_0216: ldc.r4 0
IL_021b: ldc.r4 -0.3
IL_0220: ldc.r4 0
IL_0225: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_022a: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_022f: stloc.1
IL_0230: nop
IL_0231: ldloca.s V_1
IL_0233: call System.Void UnityEngine.Vector3::Normalize()
IL_0238: nop
IL_0239: ldloc.1
IL_023a: call UnityEngine.Vector3 UnityEngine.Vector3::get_up()
IL_023f: call UnityEngine.Quaternion UnityEngine.Quaternion::LookRotation(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0244: stloc.2
IL_0245: ldloca.s V_2
IL_0247: call UnityEngine.Vector3 UnityEngine.Quaternion::get_eulerAngles()
IL_024c: stloc.3
IL_024d: ldarg.0
IL_024e: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0253: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_0258: stloc.s V_14
IL_025a: ldloca.s V_14
IL_025c: call UnityEngine.Vector3 UnityEngine.Quaternion::get_eulerAngles()
IL_0261: ldfld System.Single UnityEngine.Vector3::y
IL_0266: stloc.s V_4
IL_0268: ldloca.s V_3
IL_026a: ldflda System.Single UnityEngine.Vector3::y
IL_026f: dup
IL_0270: ldind.r4
IL_0271: ldloc.s V_4
IL_0273: sub
IL_0274: stind.r4
IL_0275: ldarg.0
IL_0276: ldfld System.Single LongshipUpgrades.ShipTurret::m_horizontalAngle
IL_027b: ldc.r4 0
IL_0280: clt.un
IL_0282: ldc.i4.0
IL_0283: ceq
IL_0285: stloc.s V_15
IL_0287: ldloc.s V_15
IL_0289: brfalse IL_0348
IL_028e: nop
IL_028f: ldloc.3
IL_0290: ldfld System.Single UnityEngine.Vector3::y
IL_0295: stloc.s V_16
IL_0297: ldloc.s V_16
IL_0299: ldc.r4 180
IL_029e: cgt
IL_02a0: stloc.s V_17
IL_02a2: ldloc.s V_17
IL_02a4: brfalse.s IL_02b2
IL_02a6: ldloc.s V_16
IL_02a8: ldc.r4 360
IL_02ad: sub
IL_02ae: stloc.s V_16
IL_02b0: br.s IL_02cb
IL_02b2: ldloc.s V_16
IL_02b4: ldc.r4 -180
IL_02b9: clt
IL_02bb: stloc.s V_18
IL_02bd: ldloc.s V_18
IL_02bf: brfalse.s IL_02cb
IL_02c1: ldloc.s V_16
IL_02c3: ldc.r4 360
IL_02c8: add
IL_02c9: stloc.s V_16
IL_02cb: ldloc.s V_16
IL_02cd: ldarg.0
IL_02ce: ldfld System.Single LongshipUpgrades.ShipTurret::m_horizontalAngle
IL_02d3: cgt
IL_02d5: stloc.s V_19
IL_02d7: ldloc.s V_19
IL_02d9: brfalse.s IL_0304
IL_02db: nop
IL_02dc: ldloca.s V_3
IL_02de: ldloc.3
IL_02df: ldfld System.Single UnityEngine.Vector3::x
IL_02e4: ldarg.0
IL_02e5: ldfld System.Single LongshipUpgrades.ShipTurret::m_horizontalAngle
IL_02ea: ldloc.s V_4
IL_02ec: add
IL_02ed: ldloc.3
IL_02ee: ldfld System.Single UnityEngine.Vector3::z
IL_02f3: call System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_02f8: ldloca.s V_2
IL_02fa: ldloc.3
IL_02fb: call System.Void UnityEngine.Quaternion::set_eulerAngles(UnityEngine.Vector3)
IL_0300: nop
IL_0301: nop
IL_0302: br.s IL_0347
IL_0304: ldloc.s V_16
IL_0306: ldc.r4 0
IL_030b: ldarg.0
IL_030c: ldfld System.Single LongshipUpgrades.ShipTurret::m_horizontalAngle
IL_0311: sub
IL_0312: clt
IL_0314: stloc.s V_20
IL_0316: ldloc.s V_20
IL_0318: brfalse.s IL_0347
IL_031a: nop
IL_031b: ldloca.s V_3
IL_031d: ldloc.3
IL_031e: ldfld System.Single UnityEngine.Vector3::x
IL_0323: ldc.r4 0
IL_0328: ldarg.0
IL_0329: ldfld System.Single LongshipUpgrades.ShipTurret::m_horizontalAngle
IL_032e: sub
IL_032f: ldloc.s V_4
IL_0331: add
IL_0332: ldloc.3
IL_0333: ldfld System.Single UnityEngine.Vector3::z
IL_0338: call System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_033d: ldloca.s V_2
IL_033f: ldloc.3
IL_0340: call System.Void UnityEngine.Quaternion::set_eulerAngles(UnityEngine.Vector3)
IL_0345: nop
IL_0346: nop
IL_0347: nop
IL_0348: ldarg.0
IL_0349: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_turretBody
IL_034e: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0353: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_0358: ldloc.2
IL_0359: ldarg.0
IL_035a: ldfld UnityEngine.Quaternion LongshipUpgrades.ShipTurret::m_lastRotation
IL_035f: ldarg.0
IL_0360: ldfld System.Single LongshipUpgrades.ShipTurret::m_turnRate
IL_0365: ldarg.1
IL_0366: mul
IL_0367: ldarg.0
IL_0368: ldfld System.Single LongshipUpgrades.ShipTurret::m_lookAcceleration
IL_036d: ldarg.0
IL_036e: ldfld System.Single LongshipUpgrades.ShipTurret::m_lookDeacceleration
IL_0373: ldarg.0
IL_0374: ldfld System.Single LongshipUpgrades.ShipTurret::m_lookMinDegreesDelta
IL_0379: call UnityEngine.Quaternion Utils::RotateTorwardsSmooth(UnityEngine.Quaternion,UnityEngine.Quaternion,UnityEngine.Quaternion,System.Single,System.Single,System.Single,System.Single)
IL_037e: stloc.s V_5
IL_0380: ldarg.0
IL_0381: ldarg.0
IL_0382: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_turretBody
IL_0387: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_038c: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_0391: stfld UnityEngine.Quaternion LongshipUpgrades.ShipTurret::m_lastRotation
IL_0396: ldarg.0
IL_0397: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_turretBody
IL_039c: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_03a1: ldloc.s V_5
IL_03a3: callvirt System.Void UnityEngine.Transform::set_rotation(UnityEngine.Quaternion)
IL_03a8: nop
IL_03a9: ldarg.0
IL_03aa: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_turretNeck
IL_03af: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_03b4: ldc.r4 0
IL_03b9: ldarg.0
IL_03ba: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_turretBody
IL_03bf: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_03c4: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_localEulerAngles()
IL_03c9: ldfld System.Single UnityEngine.Vector3::y
IL_03ce: ldc.r4 0
IL_03d3: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_03d8: callvirt System.Void UnityEngine.Transform::set_localEulerAngles(UnityEngine.Vector3)
IL_03dd: nop
IL_03de: ldarg.0
IL_03df: ldloc.0
IL_03e0: brtrue.s IL_03e9
IL_03e2: ldc.r4 -1
IL_03e7: br.s IL_03f6
IL_03e9: ldloc.s V_5
IL_03eb: ldloc.2
IL_03ec: call System.Single UnityEngine.Quaternion::Dot(UnityEngine.Quaternion,UnityEngine.Quaternion)
IL_03f1: call System.Single System.Math::Abs(System.Single)
IL_03f6: stfld System.Single LongshipUpgrades.ShipTurret::m_aimDiffToTarget
IL_03fb: ret

// System.Void LongshipUpgrades.ShipTurret::UpdateTarget(System.Single)
.locals System.Boolean, System.Boolean, System.Boolean, System.Boolean, Character, System.Boolean, System.Boolean, ZDOID, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0007: callvirt System.Boolean ZNetView::IsValid()
IL_000c: ldc.i4.0
IL_000d: ceq
IL_000f: stloc.0
IL_0010: ldloc.0
IL_0011: brfalse.s IL_0019
IL_0013: nop
IL_0014: br IL_0269
IL_0019: ldarg.0
IL_001a: call System.Boolean LongshipUpgrades.ShipTurret::HasAmmoAndEnabled()
IL_001f: ldc.i4.0
IL_0020: ceq
IL_0022: stloc.1
IL_0023: ldloc.1
IL_0024: brfalse.s IL_0062
IL_0026: nop
IL_0027: ldarg.0
IL_0028: ldfld System.Boolean LongshipUpgrades.ShipTurret::m_haveTarget
IL_002d: stloc.2
IL_002e: ldloc.2
IL_002f: brfalse.s IL_005d
IL_0031: nop
IL_0032: ldarg.0
IL_0033: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0038: ldsfld System.Int64 ZNetView::Everybody
IL_003d: ldarg.0
IL_003e: call System.String LongshipUpgrades.ShipTurret::GetNameSetTargetRPC()
IL_0043: ldc.i4.1
IL_0044: newarr System.Object
IL_0049: dup
IL_004a: ldc.i4.0
IL_004b: ldsfld ZDOID ZDOID::None
IL_0050: box ZDOID
IL_0055: stelem.ref
IL_0056: callvirt System.Void ZNetView::InvokeRPC(System.Int64,System.String,System.Object[])
IL_005b: nop
IL_005c: nop
IL_005d: br IL_0269
IL_0062: ldarg.0
IL_0063: ldarg.0
IL_0064: ldfld System.Single LongshipUpgrades.ShipTurret::m_updateTargetTimer
IL_0069: ldarg.1
IL_006a: sub
IL_006b: stfld System.Single LongshipUpgrades.ShipTurret::m_updateTargetTimer
IL_0070: ldarg.0
IL_0071: ldfld System.Single LongshipUpgrades.ShipTurret::m_updateTargetTimer
IL_0076: ldc.r4 0
IL_007b: cgt.un
IL_007d: ldc.i4.0
IL_007e: ceq
IL_0080: stloc.3
IL_0081: ldloc.3
IL_0082: brfalse IL_01d4
IL_0087: nop
IL_0088: ldarg.0
IL_0089: ldarg.0
IL_008a: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_008f: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0094: ldc.r4 40
IL_0099: call System.Boolean Character::IsCharacterInRange(UnityEngine.Vector3,System.Single)
IL_009e: brtrue.s IL_00a8
IL_00a0: ldarg.0
IL_00a1: ldfld System.Single LongshipUpgrades.ShipTurret::m_updateTargetIntervalFar
IL_00a6: br.s IL_00ae
IL_00a8: ldarg.0
IL_00a9: ldfld System.Single LongshipUpgrades.ShipTurret::m_updateTargetIntervalNear
IL_00ae: stfld System.Single LongshipUpgrades.ShipTurret::m_updateTargetTimer
IL_00b3: ldarg.0
IL_00b4: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_00b9: ldarg.0
IL_00ba: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_eye
IL_00bf: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_00c4: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_00c9: ldc.r4 0
IL_00ce: ldarg.0
IL_00cf: ldfld System.Single LongshipUpgrades.ShipTurret::m_viewDistance
IL_00d4: ldarg.0
IL_00d5: ldfld System.Single LongshipUpgrades.ShipTurret::m_horizontalAngle
IL_00da: ldc.i4.0
IL_00db: ldc.i4.0
IL_00dc: ldc.i4.1
IL_00dd: ldc.i4.0
IL_00de: ldarg.0
IL_00df: ldfld System.Collections.Generic.List`1<ItemDrop> LongshipUpgrades.ShipTurret::m_targetItems
IL_00e4: callvirt System.Int32 System.Collections.Generic.List`1<ItemDrop>::get_Count()
IL_00e9: ldc.i4.0
IL_00ea: ble.s IL_00f4
IL_00ec: ldarg.0
IL_00ed: ldfld System.Boolean LongshipUpgrades.ShipTurret::m_targetTamedConfig
IL_00f2: br.s IL_00f5
IL_00f4: ldc.i4.0
IL_00f5: ldarg.0
IL_00f6: ldfld System.Boolean LongshipUpgrades.ShipTurret::m_targetEnemies
IL_00fb: ldarg.0
IL_00fc: ldfld System.Collections.Generic.List`1<Character> LongshipUpgrades.ShipTurret::m_targetCharacters
IL_0101: call Character BaseAI::FindClosestCreature(UnityEngine.Transform,UnityEngine.Vector3,System.Single,System.Single,System.Single,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Collections.Generic.List`1<Character>)
IL_0106: stloc.s V_4
IL_0108: ldloc.s V_4
IL_010a: ldarg.0
IL_010b: ldfld Character LongshipUpgrades.ShipTurret::m_target
IL_0110: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0115: stloc.s V_5
IL_0117: ldloc.s V_5
IL_0119: brfalse IL_01d3
IL_011e: nop
IL_011f: ldloc.s V_4
IL_0121: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0126: stloc.s V_6
IL_0128: ldloc.s V_6
IL_012a: brfalse.s IL_0162
IL_012c: nop
IL_012d: ldsfld EffectList LongshipUpgrades.ShipTurret::m_newTargetEffect
IL_0132: ldarg.0
IL_0133: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0138: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_013d: ldarg.0
IL_013e: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0143: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_0148: ldnull
IL_0149: ldc.r4 1
IL_014e: ldc.i4.m1
IL_014f: ldloca.s V_7
IL_0151: initobj ZDOID
IL_0157: ldloc.s V_7
IL_0159: callvirt UnityEngine.GameObject[] EffectList::Create(UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Transform,System.Single,System.Int32,ZDOID)
IL_015e: pop
IL_015f: nop
IL_0160: br.s IL_0196
IL_0162: nop
IL_0163: ldsfld EffectList LongshipUpgrades.ShipTurret::m_lostTargetEffect
IL_0168: ldarg.0
IL_0169: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_016e: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0173: ldarg.0
IL_0174: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0179: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_017e: ldnull
IL_017f: ldc.r4 1
IL_0184: ldc.i4.m1
IL_0185: ldloca.s V_7
IL_0187: initobj ZDOID
IL_018d: ldloc.s V_7
IL_018f: callvirt UnityEngine.GameObject[] EffectList::Create(UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Transform,System.Single,System.Int32,ZDOID)
IL_0194: pop
IL_0195: nop
IL_0196: ldarg.0
IL_0197: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_019c: ldsfld System.Int64 ZNetView::Everybody
IL_01a1: ldarg.0
IL_01a2: call System.String LongshipUpgrades.ShipTurret::GetNameSetTargetRPC()
IL_01a7: ldc.i4.1
IL_01a8: newarr System.Object
IL_01ad: dup
IL_01ae: ldc.i4.0
IL_01af: ldloc.s V_4
IL_01b1: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_01b6: brtrue.s IL_01bf
IL_01b8: ldsfld ZDOID ZDOID::None
IL_01bd: br.s IL_01c6
IL_01bf: ldloc.s V_4
IL_01c1: callvirt ZDOID Character::GetZDOID()
IL_01c6: box ZDOID
IL_01cb: stelem.ref
IL_01cc: callvirt System.Void ZNetView::InvokeRPC(System.Int64,System.String,System.Object[])
IL_01d1: nop
IL_01d2: nop
IL_01d3: nop
IL_01d4: ldarg.0
IL_01d5: ldfld System.Boolean LongshipUpgrades.ShipTurret::m_haveTarget
IL_01da: brfalse.s IL_01f9
IL_01dc: ldarg.0
IL_01dd: ldfld Character LongshipUpgrades.ShipTurret::m_target
IL_01e2: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_01e7: brfalse.s IL_01f6
IL_01e9: ldarg.0
IL_01ea: ldfld Character LongshipUpgrades.ShipTurret::m_target
IL_01ef: callvirt System.Boolean Character::IsDead()
IL_01f4: br.s IL_01f7
IL_01f6: ldc.i4.1
IL_01f7: br.s IL_01fa
IL_01f9: ldc.i4.0
IL_01fa: stloc.s V_8
IL_01fc: ldloc.s V_8
IL_01fe: brfalse.s IL_0269
IL_0200: nop
IL_0201: ldstr "Target is gone"
IL_0206: call System.Void LongshipUpgrades.LongshipUpgrades::LogInfo(System.Object)
IL_020b: nop
IL_020c: ldarg.0
IL_020d: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0212: ldsfld System.Int64 ZNetView::Everybody
IL_0217: ldarg.0
IL_0218: call System.String LongshipUpgrades.ShipTurret::GetNameSetTargetRPC()
IL_021d: ldc.i4.1
IL_021e: newarr System.Object
IL_0223: dup
IL_0224: ldc.i4.0
IL_0225: ldsfld ZDOID ZDOID::None
IL_022a: box ZDOID
IL_022f: stelem.ref
IL_0230: callvirt System.Void ZNetView::InvokeRPC(System.Int64,System.String,System.Object[])
IL_0235: nop
IL_0236: ldsfld EffectList LongshipUpgrades.ShipTurret::m_lostTargetEffect
IL_023b: ldarg.0
IL_023c: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0241: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0246: ldarg.0
IL_0247: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_024c: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_0251: ldnull
IL_0252: ldc.r4 1
IL_0257: ldc.i4.m1
IL_0258: ldloca.s V_7
IL_025a: initobj ZDOID
IL_0260: ldloc.s V_7
IL_0262: callvirt UnityEngine.GameObject[] EffectList::Create(UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Transform,System.Single,System.Int32,ZDOID)
IL_0267: pop
IL_0268: nop
IL_0269: ret

// System.Void LongshipUpgrades.ShipTurret::UpdateAttack()
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld Character LongshipUpgrades.ShipTurret::m_target
IL_0007: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000c: brfalse.s IL_002f
IL_000e: ldarg.0
IL_000f: ldfld System.Single LongshipUpgrades.ShipTurret::m_aimDiffToTarget
IL_0014: ldarg.0
IL_0015: ldfld System.Single LongshipUpgrades.ShipTurret::m_shootWhenAimDiff
IL_001a: blt.s IL_002f
IL_001c: ldarg.0
IL_001d: call System.Boolean LongshipUpgrades.ShipTurret::HasAmmoAndEnabled()
IL_0022: brfalse.s IL_002f
IL_0024: ldarg.0
IL_0025: call System.Boolean LongshipUpgrades.ShipTurret::IsCoolingDown()
IL_002a: ldc.i4.0
IL_002b: ceq
IL_002d: br.s IL_0030
IL_002f: ldc.i4.0
IL_0030: stloc.0
IL_0031: ldloc.0
IL_0032: brfalse.s IL_003b
IL_0034: ldarg.0
IL_0035: call System.Void LongshipUpgrades.ShipTurret::ShootProjectile()
IL_003a: nop
IL_003b: ret

// System.Void LongshipUpgrades.ShipTurret::ShootProjectile()
.locals UnityEngine.Transform, System.Int32, System.Int32, ZDOID, System.Boolean, System.Int32, UnityEngine.Vector3, UnityEngine.Vector3, System.Single, UnityEngine.Quaternion, HitData, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_eye
IL_0007: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_000c: stloc.0
IL_000d: ldsfld EffectList LongshipUpgrades.ShipTurret::m_shootEffect
IL_0012: ldloc.0
IL_0013: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0018: ldloc.0
IL_0019: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_001e: ldnull
IL_001f: ldc.r4 1
IL_0024: ldc.i4.m1
IL_0025: ldloca.s V_3
IL_0027: initobj ZDOID
IL_002d: ldloc.3
IL_002e: callvirt UnityEngine.GameObject[] EffectList::Create(UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Transform,System.Single,System.Int32,ZDOID)
IL_0033: pop
IL_0034: ldarg.0
IL_0035: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_003a: callvirt ZDO ZNetView::GetZDO()
IL_003f: ldarg.0
IL_0040: call System.Int32 LongshipUpgrades.ShipTurret::GetLastAttackZDO()
IL_0045: call ZNet ZNet::get_instance()
IL_004a: callvirt System.Double ZNet::GetTimeSeconds()
IL_004f: conv.r4
IL_0050: callvirt System.Void ZDO::Set(System.Int32,System.Single)
IL_0055: nop
IL_0056: ldarg.0
IL_0057: ldarg.0
IL_0058: call ItemDrop/ItemData LongshipUpgrades.ShipTurret::GetAmmoItem()
IL_005d: stfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_0062: ldarg.0
IL_0063: call System.Int32 LongshipUpgrades.ShipTurret::GetAmmo()
IL_0068: stloc.1
IL_0069: ldc.i4.1
IL_006a: ldarg.0
IL_006b: ldfld System.Int32 LongshipUpgrades.ShipTurret::m_maxAmmo
IL_0070: brfalse.s IL_008f
IL_0072: ldloc.1
IL_0073: ldarg.0
IL_0074: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_0079: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_007e: ldfld Attack ItemDrop/ItemData/SharedData::m_attack
IL_0083: ldfld System.Int32 Attack::m_projectiles
IL_0088: call System.Int32 UnityEngine.Mathf::Min(System.Int32,System.Int32)
IL_008d: br.s IL_00a4
IL_008f: ldarg.0
IL_0090: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_0095: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_009a: ldfld Attack ItemDrop/ItemData/SharedData::m_attack
IL_009f: ldfld System.Int32 Attack::m_projectiles
IL_00a4: call System.Int32 UnityEngine.Mathf::Min(System.Int32,System.Int32)
IL_00a9: stloc.2
IL_00aa: ldarg.0
IL_00ab: ldfld System.Int32 LongshipUpgrades.ShipTurret::m_maxAmmo
IL_00b0: ldc.i4.0
IL_00b1: cgt
IL_00b3: stloc.s V_4
IL_00b5: ldloc.s V_4
IL_00b7: brfalse.s IL_00d5
IL_00b9: nop
IL_00ba: ldarg.0
IL_00bb: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_00c0: callvirt ZDO ZNetView::GetZDO()
IL_00c5: ldsfld System.Int32 ZDOVars::s_ammo
IL_00ca: ldloc.1
IL_00cb: ldloc.2
IL_00cc: sub
IL_00cd: ldc.i4.0
IL_00ce: callvirt System.Void ZDO::Set(System.Int32,System.Int32,System.Boolean)
IL_00d3: nop
IL_00d4: nop
IL_00d5: ldstr "Turret '{0}' is shooting {1} projectiles, ammo: {2}/{3}"
IL_00da: ldc.i4.4
IL_00db: newarr System.Object
IL_00e0: dup
IL_00e1: ldc.i4.0
IL_00e2: ldarg.0
IL_00e3: call System.String UnityEngine.Object::get_name()
IL_00e8: stelem.ref
IL_00e9: dup
IL_00ea: ldc.i4.1
IL_00eb: ldloc.2
IL_00ec: box System.Int32
IL_00f1: stelem.ref
IL_00f2: dup
IL_00f3: ldc.i4.2
IL_00f4: ldloc.1
IL_00f5: box System.Int32
IL_00fa: stelem.ref
IL_00fb: dup
IL_00fc: ldc.i4.3
IL_00fd: ldarg.0
IL_00fe: ldfld System.Int32 LongshipUpgrades.ShipTurret::m_maxAmmo
IL_0103: box System.Int32
IL_0108: stelem.ref
IL_0109: call System.String System.String::Format(System.String,System.Object[])
IL_010e: call System.Void LongshipUpgrades.LongshipUpgrades::LogInfo(System.Object)
IL_0113: nop
IL_0114: ldc.i4.0
IL_0115: stloc.s V_5
IL_0117: br IL_0346
IL_011c: nop
IL_011d: ldloc.0
IL_011e: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_forward()
IL_0123: stloc.s V_6
IL_0125: ldloc.s V_6
IL_0127: call UnityEngine.Vector3 UnityEngine.Vector3::get_up()
IL_012c: call UnityEngine.Vector3 UnityEngine.Vector3::Cross(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0131: stloc.s V_7
IL_0133: ldarg.0
IL_0134: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_0139: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_013e: ldfld Attack ItemDrop/ItemData/SharedData::m_attack
IL_0143: ldfld System.Single Attack::m_projectileAccuracy
IL_0148: stloc.s V_8
IL_014a: ldc.r4 0
IL_014f: ldloc.s V_8
IL_0151: sub
IL_0152: ldloc.s V_8
IL_0154: call System.Single UnityEngine.Random::Range(System.Single,System.Single)
IL_0159: call UnityEngine.Vector3 UnityEngine.Vector3::get_up()
IL_015e: call UnityEngine.Quaternion UnityEngine.Quaternion::AngleAxis(System.Single,UnityEngine.Vector3)
IL_0163: stloc.s V_9
IL_0165: ldc.r4 0
IL_016a: ldloc.s V_8
IL_016c: sub
IL_016d: ldloc.s V_8
IL_016f: call System.Single UnityEngine.Random::Range(System.Single,System.Single)
IL_0174: ldloc.s V_7
IL_0176: call UnityEngine.Quaternion UnityEngine.Quaternion::AngleAxis(System.Single,UnityEngine.Vector3)
IL_017b: ldloc.s V_6
IL_017d: call UnityEngine.Vector3 UnityEngine.Quaternion::op_Multiply(UnityEngine.Quaternion,UnityEngine.Vector3)
IL_0182: stloc.s V_6
IL_0184: ldloc.s V_9
IL_0186: ldloc.s V_6
IL_0188: call UnityEngine.Vector3 UnityEngine.Quaternion::op_Multiply(UnityEngine.Quaternion,UnityEngine.Vector3)
IL_018d: stloc.s V_6
IL_018f: ldarg.0
IL_0190: ldarg.0
IL_0191: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_0196: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_019b: ldfld Attack ItemDrop/ItemData/SharedData::m_attack
IL_01a0: ldfld UnityEngine.GameObject Attack::m_attackProjectile
IL_01a5: ldloc.0
IL_01a6: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_01ab: ldloc.0
IL_01ac: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_01b1: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Vector3,UnityEngine.Quaternion)
IL_01b6: stfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_lastProjectile
IL_01bb: newobj System.Void HitData::.ctor()
IL_01c0: dup
IL_01c1: ldarg.0
IL_01c2: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_01c7: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_01cc: ldfld System.Int32 ItemDrop/ItemData/SharedData::m_toolTier
IL_01d1: conv.i2
IL_01d2: stfld System.Int16 HitData::m_toolTier
IL_01d7: dup
IL_01d8: ldarg.0
IL_01d9: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_01de: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_01e3: ldfld System.Single ItemDrop/ItemData/SharedData::m_attackForce
IL_01e8: stfld System.Single HitData::m_pushForce
IL_01ed: dup
IL_01ee: ldarg.0
IL_01ef: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_01f4: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_01f9: ldfld System.Single ItemDrop/ItemData/SharedData::m_backstabBonus
IL_01fe: stfld System.Single HitData::m_backstabBonus
IL_0203: dup
IL_0204: ldarg.0
IL_0205: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_020a: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_020f: ldfld Attack ItemDrop/ItemData/SharedData::m_attack
IL_0214: ldfld System.Single Attack::m_staggerMultiplier
IL_0219: stfld System.Single HitData::m_staggerMultiplier
IL_021e: dup
IL_021f: ldarg.0
IL_0220: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_0225: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_022a: ldfld StatusEffect ItemDrop/ItemData/SharedData::m_attackStatusEffect
IL_022f: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0234: brtrue.s IL_0239
IL_0236: ldc.i4.0
IL_0237: br.s IL_024e
IL_0239: ldarg.0
IL_023a: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_023f: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0244: ldfld StatusEffect ItemDrop/ItemData/SharedData::m_attackStatusEffect
IL_0249: callvirt System.Int32 StatusEffect::NameHash()
IL_024e: stfld System.Int32 HitData::m_statusEffectHash
IL_0253: dup
IL_0254: ldarg.0
IL_0255: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_025a: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_025f: ldfld System.Boolean ItemDrop/ItemData/SharedData::m_blockable
IL_0264: stfld System.Boolean HitData::m_blockable
IL_0269: dup
IL_026a: ldarg.0
IL_026b: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_0270: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0275: ldfld System.Boolean ItemDrop/ItemData/SharedData::m_dodgeable
IL_027a: stfld System.Boolean HitData::m_dodgeable
IL_027f: dup
IL_0280: ldarg.0
IL_0281: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_0286: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_028b: ldfld Skills/SkillType ItemDrop/ItemData/SharedData::m_skillType
IL_0290: stfld Skills/SkillType HitData::m_skill
IL_0295: dup
IL_0296: ldsfld System.Int32 Game::m_worldLevel
IL_029b: conv.u1
IL_029c: stfld System.Byte HitData::m_itemWorldLevel
IL_02a1: dup
IL_02a2: ldc.i4.s 16
IL_02a4: stfld HitData/HitType HitData::m_hitType
IL_02a9: stloc.s V_10
IL_02ab: ldloc.s V_10
IL_02ad: ldflda HitData/DamageTypes HitData::m_damage
IL_02b2: ldarg.0
IL_02b3: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_02b8: callvirt HitData/DamageTypes ItemDrop/ItemData::GetDamage()
IL_02bd: ldc.i4.1
IL_02be: call System.Void HitData/DamageTypes::Add(HitData/DamageTypes,System.Int32)
IL_02c3: nop
IL_02c4: ldarg.0
IL_02c5: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_02ca: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_02cf: ldfld StatusEffect ItemDrop/ItemData/SharedData::m_attackStatusEffect
IL_02d4: ldnull
IL_02d5: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_02da: stloc.s V_11
IL_02dc: ldloc.s V_11
IL_02de: brfalse.s IL_02fc
IL_02e0: ldloc.s V_10
IL_02e2: ldarg.0
IL_02e3: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_02e8: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_02ed: ldfld StatusEffect ItemDrop/ItemData/SharedData::m_attackStatusEffect
IL_02f2: callvirt System.Int32 StatusEffect::NameHash()
IL_02f7: stfld System.Int32 HitData::m_statusEffectHash
IL_02fc: ldarg.0
IL_02fd: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_lastProjectile
IL_0302: callvirt !!0 UnityEngine.GameObject::GetComponent<IProjectile>()
IL_0307: dup
IL_0308: brtrue.s IL_030d
IL_030a: pop
IL_030b: br.s IL_033f
IL_030d: ldnull
IL_030e: ldloc.s V_6
IL_0310: ldarg.0
IL_0311: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_0316: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_031b: ldfld Attack ItemDrop/ItemData/SharedData::m_attack
IL_0320: ldfld System.Single Attack::m_projectileVel
IL_0325: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_032a: ldarg.0
IL_032b: ldfld System.Single LongshipUpgrades.ShipTurret::m_hitNoise
IL_0330: ldloc.s V_10
IL_0332: ldnull
IL_0333: ldarg.0
IL_0334: ldfld ItemDrop/ItemData LongshipUpgrades.ShipTurret::m_lastAmmo
IL_0339: callvirt System.Void IProjectile::Setup(Character,UnityEngine.Vector3,System.Single,HitData,ItemDrop/ItemData,ItemDrop/ItemData)
IL_033e: nop
IL_033f: nop
IL_0340: ldloc.s V_5
IL_0342: ldc.i4.1
IL_0343: add
IL_0344: stloc.s V_5
IL_0346: ldloc.s V_5
IL_0348: ldloc.2
IL_0349: clt
IL_034b: stloc.s V_12
IL_034d: ldloc.s V_12
IL_034f: brtrue IL_011c
IL_0354: ret

// System.Boolean LongshipUpgrades.ShipTurret::IsCoolingDown()
.locals System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0007: callvirt System.Boolean ZNetView::IsValid()
IL_000c: ldc.i4.0
IL_000d: ceq
IL_000f: stloc.0
IL_0010: ldloc.0
IL_0011: brfalse.s IL_0018
IL_0013: nop
IL_0014: ldc.i4.0
IL_0015: stloc.1
IL_0016: br.s IL_004a
IL_0018: ldarg.0
IL_0019: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_001e: callvirt ZDO ZNetView::GetZDO()
IL_0023: ldarg.0
IL_0024: call System.Int32 LongshipUpgrades.ShipTurret::GetLastAttackZDO()
IL_0029: ldc.r4 0
IL_002e: callvirt System.Single ZDO::GetFloat(System.Int32,System.Single)
IL_0033: ldarg.0
IL_0034: ldfld System.Single LongshipUpgrades.ShipTurret::m_attackCooldown
IL_0039: add
IL_003a: conv.r8
IL_003b: call ZNet ZNet::get_instance()
IL_0040: callvirt System.Double ZNet::GetTimeSeconds()
IL_0045: cgt
IL_0047: stloc.1
IL_0048: br.s IL_004a
IL_004a: ldloc.1
IL_004b: ret

// System.Boolean LongshipUpgrades.ShipTurret::HasAmmoAndEnabled()
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.Boolean LongshipUpgrades.ShipTurret::IsDeactivated()
IL_0007: brtrue.s IL_0011
IL_0009: ldarg.0
IL_000a: call System.Boolean LongshipUpgrades.ShipTurret::HasAmmo()
IL_000f: br.s IL_0012
IL_0011: ldc.i4.0
IL_0012: stloc.0
IL_0013: br.s IL_0015
IL_0015: ldloc.0
IL_0016: ret

// System.Boolean LongshipUpgrades.ShipTurret::IsDeactivated()
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0007: callvirt ZDO ZNetView::GetZDO()
IL_000c: ldsfld System.Int32 LongshipUpgrades.LongshipCustomizableParts::s_turretsDisabled
IL_0011: ldc.i4.0
IL_0012: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_0017: stloc.0
IL_0018: br.s IL_001a
IL_001a: ldloc.0
IL_001b: ret

// System.Boolean LongshipUpgrades.ShipTurret::HasAmmo()
.locals System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.Int32 LongshipUpgrades.ShipTurret::m_maxAmmo
IL_0007: ldc.i4.0
IL_0008: cgt.un
IL_000a: stloc.0
IL_000b: ldloc.0
IL_000c: brfalse.s IL_001b
IL_000e: nop
IL_000f: ldarg.0
IL_0010: call System.Int32 LongshipUpgrades.ShipTurret::GetAmmo()
IL_0015: ldc.i4.0
IL_0016: cgt
IL_0018: stloc.1
IL_0019: br.s IL_001f
IL_001b: ldc.i4.1
IL_001c: stloc.1
IL_001d: br.s IL_001f
IL_001f: ldloc.1
IL_0020: ret

// System.Int32 LongshipUpgrades.ShipTurret::GetAmmo()
.locals System.Int32
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0007: callvirt ZDO ZNetView::GetZDO()
IL_000c: ldsfld System.Int32 ZDOVars::s_ammo
IL_0011: ldc.i4.0
IL_0012: callvirt System.Int32 ZDO::GetInt(System.Int32,System.Int32)
IL_0017: stloc.0
IL_0018: br.s IL_001a
IL_001a: ldloc.0
IL_001b: ret

// System.String LongshipUpgrades.ShipTurret::GetAmmoType()
.locals System.Boolean, System.String
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ItemDrop LongshipUpgrades.ShipTurret::m_defaultAmmo
IL_0007: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000c: ldc.i4.0
IL_000d: ceq
IL_000f: stloc.0
IL_0010: ldloc.0
IL_0011: brfalse.s IL_0031
IL_0013: nop
IL_0014: ldarg.0
IL_0015: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_001a: callvirt ZDO ZNetView::GetZDO()
IL_001f: ldsfld System.Int32 ZDOVars::s_ammoType
IL_0024: ldstr ""
IL_0029: callvirt System.String ZDO::GetString(System.Int32,System.String)
IL_002e: stloc.1
IL_002f: br.s IL_003f
IL_0031: ldarg.0
IL_0032: ldfld ItemDrop LongshipUpgrades.ShipTurret::m_defaultAmmo
IL_0037: callvirt System.String UnityEngine.Object::get_name()
IL_003c: stloc.1
IL_003d: br.s IL_003f
IL_003f: ldloc.1
IL_0040: ret

// System.Void LongshipUpgrades.ShipTurret::UpdateReloadState()
.locals System.Boolean, System.Boolean, ZDOID
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.Boolean LongshipUpgrades.ShipTurret::IsCoolingDown()
IL_0007: stloc.0
IL_0008: ldarg.0
IL_0009: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_turretBodyArmed
IL_000e: callvirt System.Boolean UnityEngine.GameObject::get_activeInHierarchy()
IL_0013: brtrue.s IL_001b
IL_0015: ldloc.0
IL_0016: ldc.i4.0
IL_0017: ceq
IL_0019: br.s IL_001c
IL_001b: ldc.i4.0
IL_001c: stloc.1
IL_001d: ldloc.1
IL_001e: brfalse.s IL_0053
IL_0020: nop
IL_0021: ldsfld EffectList LongshipUpgrades.ShipTurret::m_reloadEffect
IL_0026: ldarg.0
IL_0027: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_002c: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0031: ldarg.0
IL_0032: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0037: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_003c: ldnull
IL_003d: ldc.r4 1
IL_0042: ldc.i4.m1
IL_0043: ldloca.s V_2
IL_0045: initobj ZDOID
IL_004b: ldloc.2
IL_004c: callvirt UnityEngine.GameObject[] EffectList::Create(UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Transform,System.Single,System.Int32,ZDOID)
IL_0051: pop
IL_0052: nop
IL_0053: ldarg.0
IL_0054: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_turretBodyArmed
IL_0059: ldloc.0
IL_005a: ldc.i4.0
IL_005b: ceq
IL_005d: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0062: nop
IL_0063: ldarg.0
IL_0064: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_turretBodyUnarmed
IL_0069: ldloc.0
IL_006a: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_006f: nop
IL_0070: ret

// ItemDrop/ItemData LongshipUpgrades.ShipTurret::GetAmmoItem()
.locals System.String, UnityEngine.GameObject, System.Boolean, ItemDrop/ItemData
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.String LongshipUpgrades.ShipTurret::GetAmmoType()
IL_0007: stloc.0
IL_0008: call ZNetScene ZNetScene::get_instance()
IL_000d: ldloc.0
IL_000e: callvirt UnityEngine.GameObject ZNetScene::GetPrefab(System.String)
IL_0013: stloc.1
IL_0014: ldloc.1
IL_0015: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_001a: ldc.i4.0
IL_001b: ceq
IL_001d: stloc.2
IL_001e: ldloc.2
IL_001f: brfalse.s IL_0041
IL_0021: nop
IL_0022: ldstr "Turret '"
IL_0027: ldarg.0
IL_0028: call System.String UnityEngine.Object::get_name()
IL_002d: ldstr "' is trying to fire but has no ammo or default ammo!"
IL_0032: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0037: call System.Void LongshipUpgrades.LongshipUpgrades::LogWarning(System.Object)
IL_003c: nop
IL_003d: ldnull
IL_003e: stloc.3
IL_003f: br.s IL_004f
IL_0041: ldloc.1
IL_0042: callvirt !!0 UnityEngine.GameObject::GetComponent<ItemDrop>()
IL_0047: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_004c: stloc.3
IL_004d: br.s IL_004f
IL_004f: ldloc.3
IL_0050: ret

// System.String LongshipUpgrades.ShipTurret::GetHoverText()
.locals System.Boolean, System.String, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0007: callvirt System.Boolean ZNetView::IsValid()
IL_000c: ldc.i4.0
IL_000d: ceq
IL_000f: stloc.0
IL_0010: ldloc.0
IL_0011: brfalse.s IL_001e
IL_0013: ldstr ""
IL_0018: stloc.1
IL_0019: br IL_0177
IL_001e: ldarg.0
IL_001f: ldfld System.Boolean LongshipUpgrades.ShipTurret::m_targetEnemies
IL_0024: ldc.i4.0
IL_0025: ceq
IL_0027: stloc.2
IL_0028: ldloc.2
IL_0029: brfalse.s IL_0041
IL_002b: call Localization Localization::get_instance()
IL_0030: ldarg.0
IL_0031: ldfld System.String LongshipUpgrades.ShipTurret::m_name
IL_0036: callvirt System.String Localization::Localize(System.String)
IL_003b: stloc.1
IL_003c: br IL_0177
IL_0041: ldarg.0
IL_0042: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0047: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_004c: ldc.r4 0
IL_0051: ldc.i4.0
IL_0052: ldc.i4.0
IL_0053: call System.Boolean PrivateArea::CheckAccess(UnityEngine.Vector3,System.Single,System.Boolean,System.Boolean)
IL_0058: ldc.i4.0
IL_0059: ceq
IL_005b: stloc.3
IL_005c: ldloc.3
IL_005d: brfalse.s IL_007f
IL_005f: call Localization Localization::get_instance()
IL_0064: ldarg.0
IL_0065: ldfld System.String LongshipUpgrades.ShipTurret::m_name
IL_006a: ldstr "
$piece_noaccess"
IL_006f: call System.String System.String::Concat(System.String,System.String)
IL_0074: callvirt System.String Localization::Localize(System.String)
IL_0079: stloc.1
IL_007a: br IL_0177
IL_007f: ldarg.0
IL_0080: ldfld System.Text.StringBuilder LongshipUpgrades.ShipTurret::sb
IL_0085: callvirt System.Text.StringBuilder System.Text.StringBuilder::Clear()
IL_008a: pop
IL_008b: ldarg.0
IL_008c: ldfld System.Text.StringBuilder LongshipUpgrades.ShipTurret::sb
IL_0091: ldarg.0
IL_0092: ldfld System.String LongshipUpgrades.ShipTurret::m_name
IL_0097: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_009c: pop
IL_009d: ldarg.0
IL_009e: call System.Boolean LongshipUpgrades.ShipTurret::IsDeactivated()
IL_00a3: stloc.s V_4
IL_00a5: ldloc.s V_4
IL_00a7: brfalse.s IL_00ba
IL_00a9: ldarg.0
IL_00aa: ldfld System.Text.StringBuilder LongshipUpgrades.ShipTurret::sb
IL_00af: ldstr " disabled"
IL_00b4: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_00b9: pop
IL_00ba: ldarg.0
IL_00bb: call System.Boolean LongshipUpgrades.ShipTurret::HasAmmo()
IL_00c0: stloc.s V_5
IL_00c2: ldloc.s V_5
IL_00c4: brfalse.s IL_00ef
IL_00c6: ldarg.0
IL_00c7: ldfld System.Text.StringBuilder LongshipUpgrades.ShipTurret::sb
IL_00cc: ldstr " ({0} / {1})"
IL_00d1: ldarg.0
IL_00d2: call System.Int32 LongshipUpgrades.ShipTurret::GetAmmo()
IL_00d7: box System.Int32
IL_00dc: ldarg.0
IL_00dd: ldfld System.Int32 LongshipUpgrades.ShipTurret::m_maxAmmo
IL_00e2: box System.Int32
IL_00e7: callvirt System.Text.StringBuilder System.Text.StringBuilder::AppendFormat(System.String,System.Object,System.Object)
IL_00ec: pop
IL_00ed: br.s IL_0100
IL_00ef: ldarg.0
IL_00f0: ldfld System.Text.StringBuilder LongshipUpgrades.ShipTurret::sb
IL_00f5: ldstr " ($piece_turret_noammo)"
IL_00fa: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_00ff: pop
IL_0100: ldarg.0
IL_0101: ldfld System.Collections.Generic.List`1<Character> LongshipUpgrades.ShipTurret::m_targetCharacters
IL_0106: callvirt System.Int32 System.Collections.Generic.List`1<Character>::get_Count()
IL_010b: ldc.i4.0
IL_010c: ceq
IL_010e: stloc.s V_6
IL_0110: ldloc.s V_6
IL_0112: brfalse.s IL_0129
IL_0114: nop
IL_0115: ldarg.0
IL_0116: ldfld System.Text.StringBuilder LongshipUpgrades.ShipTurret::sb
IL_011b: ldstr "
$piece_turret_target $piece_turret_target_everything"
IL_0120: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_0125: pop
IL_0126: nop
IL_0127: br.s IL_014e
IL_0129: nop
IL_012a: ldarg.0
IL_012b: ldfld System.Text.StringBuilder LongshipUpgrades.ShipTurret::sb
IL_0130: ldstr "
$piece_turret_target "
IL_0135: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_013a: pop
IL_013b: ldarg.0
IL_013c: ldfld System.Text.StringBuilder LongshipUpgrades.ShipTurret::sb
IL_0141: ldarg.0
IL_0142: ldfld System.String LongshipUpgrades.ShipTurret::m_targetsText
IL_0147: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_014c: pop
IL_014d: nop
IL_014e: ldarg.0
IL_014f: ldfld System.Text.StringBuilder LongshipUpgrades.ShipTurret::sb
IL_0154: ldstr "
[<color=yellow><b>$KEY_Use</b></color>] $piece_turret_addammo
[<color=yellow><b>1-8</b></color>] $piece_turret_target_set"
IL_0159: callvirt System.Text.StringBuilder System.Text.StringBuilder::Append(System.String)
IL_015e: pop
IL_015f: call Localization Localization::get_instance()
IL_0164: ldarg.0
IL_0165: ldfld System.Text.StringBuilder LongshipUpgrades.ShipTurret::sb
IL_016a: callvirt System.String System.Object::ToString()
IL_016f: callvirt System.String Localization::Localize(System.String)
IL_0174: stloc.1
IL_0175: br.s IL_0177
IL_0177: ldloc.1
IL_0178: ret

// System.String LongshipUpgrades.ShipTurret::GetHoverName()
.locals System.String
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.String LongshipUpgrades.ShipTurret::m_name
IL_0007: stloc.0
IL_0008: br.s IL_000a
IL_000a: ldloc.0
IL_000b: ret

// System.Single LongshipUpgrades.ShipTurret::GetHoverOffset()
.locals System.Single
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.Single LongshipUpgrades.ShipTurret::m_hoverOffset
IL_0007: stloc.0
IL_0008: br.s IL_000a
IL_000a: ldloc.0
IL_000b: ret

// System.Boolean LongshipUpgrades.ShipTurret::Interact(Humanoid,System.Boolean,System.Boolean)
.locals System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.2
IL_0002: stloc.0
IL_0003: ldloc.0
IL_0004: brfalse.s IL_003c
IL_0006: nop
IL_0007: ldarg.0
IL_0008: ldfld System.Single LongshipUpgrades.ShipTurret::m_holdRepeatInterval
IL_000d: ldc.r4 0
IL_0012: cgt.un
IL_0014: ldc.i4.0
IL_0015: ceq
IL_0017: stloc.1
IL_0018: ldloc.1
IL_0019: brfalse.s IL_001f
IL_001b: ldc.i4.0
IL_001c: stloc.2
IL_001d: br.s IL_0052
IL_001f: call System.Single UnityEngine.Time::get_time()
IL_0024: ldarg.0
IL_0025: ldfld System.Single LongshipUpgrades.ShipTurret::m_lastUseTime
IL_002a: sub
IL_002b: ldarg.0
IL_002c: ldfld System.Single LongshipUpgrades.ShipTurret::m_holdRepeatInterval
IL_0031: clt
IL_0033: stloc.3
IL_0034: ldloc.3
IL_0035: brfalse.s IL_003b
IL_0037: ldc.i4.0
IL_0038: stloc.2
IL_0039: br.s IL_0052
IL_003b: nop
IL_003c: ldarg.0
IL_003d: call System.Single UnityEngine.Time::get_time()
IL_0042: stfld System.Single LongshipUpgrades.ShipTurret::m_lastUseTime
IL_0047: ldarg.0
IL_0048: ldarg.1
IL_0049: ldnull
IL_004a: call System.Boolean LongshipUpgrades.ShipTurret::UseItem(Humanoid,ItemDrop/ItemData)
IL_004f: stloc.2
IL_0050: br.s IL_0052
IL_0052: ldloc.2
IL_0053: ret

// System.Boolean LongshipUpgrades.ShipTurret::UseItem(Humanoid,ItemDrop/ItemData)
.locals System.Boolean, System.Boolean, System.Boolean, ItemDrop, System.Boolean, System.Collections.Generic.List`1/Enumerator<Turret/TrophyTarget>, Turret/TrophyTarget, System.Boolean, System.Boolean, System.Boolean, ZDOID, System.Boolean, System.Boolean, ItemDrop, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.2
IL_0002: ldnull
IL_0003: ceq
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: brfalse IL_00b9
IL_000c: nop
IL_000d: ldarg.0
IL_000e: ldarg.1
IL_000f: callvirt Inventory Humanoid::GetInventory()
IL_0014: ldc.i4.1
IL_0015: call ItemDrop/ItemData LongshipUpgrades.ShipTurret::FindAmmoItem(Inventory,System.Boolean)
IL_001a: starg.s item
IL_001c: ldarg.2
IL_001d: ldnull
IL_001e: ceq
IL_0020: stloc.1
IL_0021: ldloc.1
IL_0022: brfalse IL_00b8
IL_0027: nop
IL_0028: ldarg.0
IL_0029: call System.Int32 LongshipUpgrades.ShipTurret::GetAmmo()
IL_002e: ldc.i4.0
IL_002f: ble.s IL_0043
IL_0031: ldarg.0
IL_0032: ldarg.1
IL_0033: callvirt Inventory Humanoid::GetInventory()
IL_0038: ldc.i4.0
IL_0039: call ItemDrop/ItemData LongshipUpgrades.ShipTurret::FindAmmoItem(Inventory,System.Boolean)
IL_003e: ldnull
IL_003f: cgt.un
IL_0041: br.s IL_0044
IL_0043: ldc.i4.0
IL_0044: stloc.2
IL_0045: ldloc.2
IL_0046: brfalse.s IL_00a0
IL_0048: nop
IL_0049: call ZNetScene ZNetScene::get_instance()
IL_004e: ldarg.0
IL_004f: call System.String LongshipUpgrades.ShipTurret::GetAmmoType()
IL_0054: callvirt UnityEngine.GameObject ZNetScene::GetPrefab(System.String)
IL_0059: callvirt !!0 UnityEngine.GameObject::GetComponent<ItemDrop>()
IL_005e: stloc.3
IL_005f: ldarg.1
IL_0060: ldc.i4.2
IL_0061: call Localization Localization::get_instance()
IL_0066: ldstr "$msg_turretotherammo "
IL_006b: callvirt System.String Localization::Localize(System.String)
IL_0070: call Localization Localization::get_instance()
IL_0075: ldloc.3
IL_0076: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_007b: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0080: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_0085: callvirt System.String Localization::Localize(System.String)
IL_008a: call System.String System.String::Concat(System.String,System.String)
IL_008f: ldc.i4.0
IL_0090: ldnull
IL_0091: ldc.i4.0
IL_0092: callvirt System.Void Character::Message(MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_0097: nop
IL_0098: ldc.i4.0
IL_0099: stloc.s V_4
IL_009b: br IL_03b8
IL_00a0: ldarg.1
IL_00a1: ldc.i4.2
IL_00a2: ldstr "$msg_noturretammo"
IL_00a7: ldc.i4.0
IL_00a8: ldnull
IL_00a9: ldc.i4.0
IL_00aa: callvirt System.Void Character::Message(MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_00af: nop
IL_00b0: ldc.i4.0
IL_00b1: stloc.s V_4
IL_00b3: br IL_03b8
IL_00b8: nop
IL_00b9: nop
IL_00ba: ldarg.0
IL_00bb: ldfld System.Collections.Generic.List`1<Turret/TrophyTarget> LongshipUpgrades.ShipTurret::m_configTargets
IL_00c0: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Turret/TrophyTarget>::GetEnumerator()
IL_00c5: stloc.s V_5
IL_00c7: br IL_020b
IL_00cc: ldloca.s V_5
IL_00ce: call !0 System.Collections.Generic.List`1/Enumerator<Turret/TrophyTarget>::get_Current()
IL_00d3: stloc.s V_6
IL_00d5: nop
IL_00d6: ldarg.2
IL_00d7: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_00dc: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_00e1: ldloc.s V_6
IL_00e3: ldfld ItemDrop Turret/TrophyTarget::m_item
IL_00e8: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_00ed: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_00f2: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_00f7: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00fc: ldc.i4.0
IL_00fd: ceq
IL_00ff: stloc.s V_7
IL_0101: ldloc.s V_7
IL_0103: brfalse.s IL_010b
IL_0105: nop
IL_0106: br IL_020b
IL_010b: ldarg.0
IL_010c: ldfld System.Collections.Generic.List`1<ItemDrop> LongshipUpgrades.ShipTurret::m_targetItems
IL_0111: ldloc.s V_6
IL_0113: ldfld ItemDrop Turret/TrophyTarget::m_item
IL_0118: callvirt System.Boolean System.Collections.Generic.List`1<ItemDrop>::Contains(!0)
IL_011d: stloc.s V_8
IL_011f: ldloc.s V_8
IL_0121: brfalse.s IL_013a
IL_0123: nop
IL_0124: ldarg.0
IL_0125: ldfld System.Collections.Generic.List`1<ItemDrop> LongshipUpgrades.ShipTurret::m_targetItems
IL_012a: ldloc.s V_6
IL_012c: ldfld ItemDrop Turret/TrophyTarget::m_item
IL_0131: callvirt System.Boolean System.Collections.Generic.List`1<ItemDrop>::Remove(!0)
IL_0136: pop
IL_0137: nop
IL_0138: br.s IL_017a
IL_013a: nop
IL_013b: ldarg.0
IL_013c: ldfld System.Collections.Generic.List`1<ItemDrop> LongshipUpgrades.ShipTurret::m_targetItems
IL_0141: callvirt System.Int32 System.Collections.Generic.List`1<ItemDrop>::get_Count()
IL_0146: ldarg.0
IL_0147: ldfld System.Int32 LongshipUpgrades.ShipTurret::m_maxConfigTargets
IL_014c: clt
IL_014e: ldc.i4.0
IL_014f: ceq
IL_0151: stloc.s V_9
IL_0153: ldloc.s V_9
IL_0155: brfalse.s IL_0166
IL_0157: nop
IL_0158: ldarg.0
IL_0159: ldfld System.Collections.Generic.List`1<ItemDrop> LongshipUpgrades.ShipTurret::m_targetItems
IL_015e: ldc.i4.0
IL_015f: callvirt System.Void System.Collections.Generic.List`1<ItemDrop>::RemoveAt(System.Int32)
IL_0164: nop
IL_0165: nop
IL_0166: ldarg.0
IL_0167: ldfld System.Collections.Generic.List`1<ItemDrop> LongshipUpgrades.ShipTurret::m_targetItems
IL_016c: ldloc.s V_6
IL_016e: ldfld ItemDrop Turret/TrophyTarget::m_item
IL_0173: callvirt System.Void System.Collections.Generic.List`1<ItemDrop>::Add(!0)
IL_0178: nop
IL_0179: nop
IL_017a: ldarg.0
IL_017b: call System.Void LongshipUpgrades.ShipTurret::SetTargets()
IL_0180: nop
IL_0181: ldsfld Player Player::m_localPlayer
IL_0186: ldc.i4.2
IL_0187: call Localization Localization::get_instance()
IL_018c: ldstr "$piece_turret_target_set_msg "
IL_0191: ldarg.0
IL_0192: ldfld System.Collections.Generic.List`1<Character> LongshipUpgrades.ShipTurret::m_targetCharacters
IL_0197: callvirt System.Int32 System.Collections.Generic.List`1<Character>::get_Count()
IL_019c: brfalse.s IL_01a6
IL_019e: ldarg.0
IL_019f: ldfld System.String LongshipUpgrades.ShipTurret::m_targetsText
IL_01a4: br.s IL_01ab
IL_01a6: ldstr "$piece_turret_target_everything"
IL_01ab: call System.String System.String::Concat(System.String,System.String)
IL_01b0: callvirt System.String Localization::Localize(System.String)
IL_01b5: ldc.i4.0
IL_01b6: ldnull
IL_01b7: ldc.i4.0
IL_01b8: callvirt System.Void Character::Message(MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_01bd: nop
IL_01be: ldsfld EffectList LongshipUpgrades.ShipTurret::m_setTargetEffect
IL_01c3: ldarg.0
IL_01c4: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_01c9: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_01ce: ldarg.0
IL_01cf: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_01d4: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_01d9: ldnull
IL_01da: ldc.r4 1
IL_01df: ldc.i4.m1
IL_01e0: ldloca.s V_10
IL_01e2: initobj ZDOID
IL_01e8: ldloc.s V_10
IL_01ea: callvirt UnityEngine.GameObject[] EffectList::Create(UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Transform,System.Single,System.Int32,ZDOID)
IL_01ef: pop
IL_01f0: call Game Game::get_instance()
IL_01f5: ldc.i4.s 79
IL_01f7: ldc.r4 1
IL_01fc: ldc.i4.0
IL_01fd: callvirt System.Void Game::IncrementPlayerStat(PlayerStatType,System.Single,System.Boolean)
IL_0202: nop
IL_0203: ldc.i4.1
IL_0204: stloc.s V_4
IL_0206: leave IL_03b8
IL_020b: ldloca.s V_5
IL_020d: call System.Boolean System.Collections.Generic.List`1/Enumerator<Turret/TrophyTarget>::MoveNext()
IL_0212: brtrue IL_00cc
IL_0217: leave.s IL_0228
IL_0219: ldloca.s V_5
IL_021b: constrained. System.Collections.Generic.List`1/Enumerator<Turret/TrophyTarget>
IL_0221: callvirt System.Void System.IDisposable::Dispose()
IL_0226: nop
IL_0227: endfinally
IL_0228: ldarg.0
IL_0229: ldarg.2
IL_022a: ldfld UnityEngine.GameObject ItemDrop/ItemData::m_dropPrefab
IL_022f: callvirt System.String UnityEngine.Object::get_name()
IL_0234: call System.Boolean LongshipUpgrades.ShipTurret::IsItemAllowed(System.String)
IL_0239: ldc.i4.0
IL_023a: ceq
IL_023c: stloc.s V_11
IL_023e: ldloc.s V_11
IL_0240: brfalse.s IL_025b
IL_0242: nop
IL_0243: ldarg.1
IL_0244: ldc.i4.2
IL_0245: ldstr "$msg_wontwork"
IL_024a: ldc.i4.0
IL_024b: ldnull
IL_024c: ldc.i4.0
IL_024d: callvirt System.Void Character::Message(MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_0252: nop
IL_0253: ldc.i4.0
IL_0254: stloc.s V_4
IL_0256: br IL_03b8
IL_025b: ldarg.0
IL_025c: call System.Int32 LongshipUpgrades.ShipTurret::GetAmmo()
IL_0261: ldc.i4.0
IL_0262: ble.s IL_027c
IL_0264: ldarg.0
IL_0265: call System.String LongshipUpgrades.ShipTurret::GetAmmoType()
IL_026a: ldarg.2
IL_026b: ldfld UnityEngine.GameObject ItemDrop/ItemData::m_dropPrefab
IL_0270: callvirt System.String UnityEngine.Object::get_name()
IL_0275: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_027a: br.s IL_027d
IL_027c: ldc.i4.0
IL_027d: stloc.s V_12
IL_027f: ldloc.s V_12
IL_0281: brfalse.s IL_02dd
IL_0283: nop
IL_0284: call ZNetScene ZNetScene::get_instance()
IL_0289: ldarg.0
IL_028a: call System.String LongshipUpgrades.ShipTurret::GetAmmoType()
IL_028f: callvirt UnityEngine.GameObject ZNetScene::GetPrefab(System.String)
IL_0294: callvirt !!0 UnityEngine.GameObject::GetComponent<ItemDrop>()
IL_0299: stloc.s V_13
IL_029b: ldarg.1
IL_029c: ldc.i4.2
IL_029d: call Localization Localization::get_instance()
IL_02a2: ldstr "$msg_turretotherammo "
IL_02a7: callvirt System.String Localization::Localize(System.String)
IL_02ac: call Localization Localization::get_instance()
IL_02b1: ldloc.s V_13
IL_02b3: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_02b8: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_02bd: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_02c2: callvirt System.String Localization::Localize(System.String)
IL_02c7: call System.String System.String::Concat(System.String,System.String)
IL_02cc: ldc.i4.0
IL_02cd: ldnull
IL_02ce: ldc.i4.0
IL_02cf: callvirt System.Void Character::Message(MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_02d4: nop
IL_02d5: ldc.i4.0
IL_02d6: stloc.s V_4
IL_02d8: br IL_03b8
IL_02dd: ldstr "trying to add ammo "
IL_02e2: ldarg.2
IL_02e3: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_02e8: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_02ed: call System.String System.String::Concat(System.String,System.String)
IL_02f2: call System.Void LongshipUpgrades.LongshipUpgrades::LogInfo(System.Object)
IL_02f7: nop
IL_02f8: ldarg.0
IL_02f9: call System.Int32 LongshipUpgrades.ShipTurret::GetAmmo()
IL_02fe: ldarg.0
IL_02ff: ldfld System.Int32 LongshipUpgrades.ShipTurret::m_maxAmmo
IL_0304: clt
IL_0306: ldc.i4.0
IL_0307: ceq
IL_0309: stloc.s V_14
IL_030b: ldloc.s V_14
IL_030d: brfalse.s IL_0328
IL_030f: nop
IL_0310: ldarg.1
IL_0311: ldc.i4.2
IL_0312: ldstr "$msg_itsfull"
IL_0317: ldc.i4.0
IL_0318: ldnull
IL_0319: ldc.i4.0
IL_031a: callvirt System.Void Character::Message(MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_031f: nop
IL_0320: ldc.i4.0
IL_0321: stloc.s V_4
IL_0323: br IL_03b8
IL_0328: ldarg.1
IL_0329: ldc.i4.2
IL_032a: ldstr "$msg_added "
IL_032f: ldarg.2
IL_0330: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0335: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_033a: call System.String System.String::Concat(System.String,System.String)
IL_033f: ldc.i4.0
IL_0340: ldnull
IL_0341: ldc.i4.0
IL_0342: callvirt System.Void Character::Message(MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_0347: nop
IL_0348: ldarg.1
IL_0349: isinst Player
IL_034e: callvirt System.Boolean Player::NoCostCheat()
IL_0353: brtrue.s IL_0366
IL_0355: call ZoneSystem ZoneSystem::get_instance()
IL_035a: ldc.i4.s 25
IL_035c: callvirt System.Boolean ZoneSystem::GetGlobalKey(GlobalKeys)
IL_0361: ldc.i4.0
IL_0362: ceq
IL_0364: br.s IL_0367
IL_0366: ldc.i4.0
IL_0367: stloc.s V_15
IL_0369: ldloc.s V_15
IL_036b: brfalse.s IL_037b
IL_036d: ldarg.1
IL_036e: callvirt Inventory Humanoid::GetInventory()
IL_0373: ldarg.2
IL_0374: ldc.i4.1
IL_0375: callvirt System.Boolean Inventory::RemoveItem(ItemDrop/ItemData,System.Int32)
IL_037a: pop
IL_037b: call Game Game::get_instance()
IL_0380: ldc.i4.s 78
IL_0382: ldc.r4 1
IL_0387: ldc.i4.0
IL_0388: callvirt System.Void Game::IncrementPlayerStat(PlayerStatType,System.Single,System.Boolean)
IL_038d: nop
IL_038e: ldarg.0
IL_038f: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0394: ldstr "RPC_AddAmmo"
IL_0399: ldc.i4.1
IL_039a: newarr System.Object
IL_039f: dup
IL_03a0: ldc.i4.0
IL_03a1: ldarg.2
IL_03a2: ldfld UnityEngine.GameObject ItemDrop/ItemData::m_dropPrefab
IL_03a7: callvirt System.String UnityEngine.Object::get_name()
IL_03ac: stelem.ref
IL_03ad: callvirt System.Void ZNetView::InvokeRPC(System.String,System.Object[])
IL_03b2: nop
IL_03b3: ldc.i4.1
IL_03b4: stloc.s V_4
IL_03b6: br.s IL_03b8
IL_03b8: ldloc.s V_4
IL_03ba: ret
// EH Finally: 199 - 537 => 537 - 552

// System.Void LongshipUpgrades.ShipTurret::RPC_AddAmmo(System.Int64,System.String)
.locals System.Boolean, System.Boolean, LongshipUpgrades.ShipTurret[], System.Int32, LongshipUpgrades.ShipTurret, ZDOID
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0007: callvirt System.Boolean ZNetView::IsOwner()
IL_000c: stloc.0
IL_000d: ldloc.0
IL_000e: brfalse IL_00eb
IL_0013: nop
IL_0014: ldarg.0
IL_0015: ldarg.2
IL_0016: call System.Boolean LongshipUpgrades.ShipTurret::IsItemAllowed(System.String)
IL_001b: ldc.i4.0
IL_001c: ceq
IL_001e: stloc.1
IL_001f: ldloc.1
IL_0020: brfalse.s IL_0039
IL_0022: nop
IL_0023: ldstr "Item not allowed "
IL_0028: ldarg.2
IL_0029: call System.String System.String::Concat(System.String,System.String)
IL_002e: call System.Void LongshipUpgrades.LongshipUpgrades::LogInfo(System.Object)
IL_0033: nop
IL_0034: br IL_00eb
IL_0039: ldarg.0
IL_003a: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_003f: callvirt ZDO ZNetView::GetZDO()
IL_0044: ldsfld System.Int32 ZDOVars::s_ammo
IL_0049: ldarg.0
IL_004a: call System.Int32 LongshipUpgrades.ShipTurret::GetAmmo()
IL_004f: ldc.i4.1
IL_0050: add
IL_0051: ldc.i4.0
IL_0052: callvirt System.Void ZDO::Set(System.Int32,System.Int32,System.Boolean)
IL_0057: nop
IL_0058: ldarg.0
IL_0059: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_005e: callvirt ZDO ZNetView::GetZDO()
IL_0063: ldsfld System.Int32 ZDOVars::s_ammoType
IL_0068: ldarg.2
IL_0069: callvirt System.Void ZDO::Set(System.Int32,System.String)
IL_006e: nop
IL_006f: nop
IL_0070: ldarg.0
IL_0071: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0076: callvirt UnityEngine.Transform UnityEngine.Transform::get_parent()
IL_007b: callvirt !!0[] UnityEngine.Component::GetComponentsInChildren<LongshipUpgrades.ShipTurret>()
IL_0080: stloc.2
IL_0081: ldc.i4.0
IL_0082: stloc.3
IL_0083: br.s IL_00cc
IL_0085: ldloc.2
IL_0086: ldloc.3
IL_0087: ldelem.ref
IL_0088: stloc.s V_4
IL_008a: ldsfld EffectList LongshipUpgrades.ShipTurret::m_addAmmoEffect
IL_008f: ldloc.s V_4
IL_0091: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_turretBody
IL_0096: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_009b: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_00a0: ldloc.s V_4
IL_00a2: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_turretBody
IL_00a7: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_00ac: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_00b1: ldnull
IL_00b2: ldc.r4 1
IL_00b7: ldc.i4.m1
IL_00b8: ldloca.s V_5
IL_00ba: initobj ZDOID
IL_00c0: ldloc.s V_5
IL_00c2: callvirt UnityEngine.GameObject[] EffectList::Create(UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Transform,System.Single,System.Int32,ZDOID)
IL_00c7: pop
IL_00c8: ldloc.3
IL_00c9: ldc.i4.1
IL_00ca: add
IL_00cb: stloc.3
IL_00cc: ldloc.3
IL_00cd: ldloc.2
IL_00ce: ldlen
IL_00cf: conv.i4
IL_00d0: blt.s IL_0085
IL_00d2: ldarg.0
IL_00d3: call System.Void LongshipUpgrades.ShipTurret::UpdateVisualBolt()
IL_00d8: nop
IL_00d9: ldstr "Added ammo "
IL_00de: ldarg.2
IL_00df: call System.String System.String::Concat(System.String,System.String)
IL_00e4: call System.Void LongshipUpgrades.LongshipUpgrades::LogInfo(System.Object)
IL_00e9: nop
IL_00ea: nop
IL_00eb: ret

// System.Void LongshipUpgrades.ShipTurret::RPC_SetTarget(System.Int64,ZDOID)
.locals UnityEngine.GameObject, System.Boolean, Character, System.Boolean
IL_0000: nop
IL_0001: call ZNetScene ZNetScene::get_instance()
IL_0006: ldarg.2
IL_0007: callvirt UnityEngine.GameObject ZNetScene::FindInstance(ZDOID)
IL_000c: stloc.0
IL_000d: ldloc.0
IL_000e: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0013: stloc.1
IL_0014: ldloc.1
IL_0015: brfalse.s IL_003b
IL_0017: nop
IL_0018: ldloc.0
IL_0019: callvirt !!0 UnityEngine.GameObject::GetComponent<Character>()
IL_001e: stloc.2
IL_001f: ldloc.2
IL_0020: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0025: stloc.3
IL_0026: ldloc.3
IL_0027: brfalse.s IL_003a
IL_0029: nop
IL_002a: ldarg.0
IL_002b: ldloc.2
IL_002c: stfld Character LongshipUpgrades.ShipTurret::m_target
IL_0031: ldarg.0
IL_0032: ldc.i4.1
IL_0033: stfld System.Boolean LongshipUpgrades.ShipTurret::m_haveTarget
IL_0038: br.s IL_0054
IL_003a: nop
IL_003b: ldarg.0
IL_003c: ldnull
IL_003d: stfld Character LongshipUpgrades.ShipTurret::m_target
IL_0042: ldarg.0
IL_0043: ldc.i4.0
IL_0044: stfld System.Boolean LongshipUpgrades.ShipTurret::m_haveTarget
IL_0049: ldarg.0
IL_004a: ldc.r4 0
IL_004f: stfld System.Single LongshipUpgrades.ShipTurret::m_scan
IL_0054: ret

// System.Void LongshipUpgrades.ShipTurret::UpdateVisualBolt()
.locals System.String, System.Boolean, System.Collections.Generic.List`1/Enumerator<Turret/AmmoType>, Turret/AmmoType, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.String LongshipUpgrades.ShipTurret::GetAmmoType()
IL_0007: stloc.0
IL_0008: ldarg.0
IL_0009: call System.Boolean LongshipUpgrades.ShipTurret::HasAmmo()
IL_000e: brfalse.s IL_001b
IL_0010: ldarg.0
IL_0011: call System.Boolean LongshipUpgrades.ShipTurret::IsCoolingDown()
IL_0016: ldc.i4.0
IL_0017: ceq
IL_0019: br.s IL_001c
IL_001b: ldc.i4.0
IL_001c: stloc.1
IL_001d: nop
IL_001e: ldarg.0
IL_001f: ldfld System.Collections.Generic.List`1<Turret/AmmoType> LongshipUpgrades.ShipTurret::m_allowedAmmo
IL_0024: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Turret/AmmoType>::GetEnumerator()
IL_0029: stloc.2
IL_002a: br.s IL_0059
IL_002c: ldloca.s V_2
IL_002e: call !0 System.Collections.Generic.List`1/Enumerator<Turret/AmmoType>::get_Current()
IL_0033: stloc.3
IL_0034: nop
IL_0035: ldloc.3
IL_0036: ldfld ItemDrop Turret/AmmoType::m_ammo
IL_003b: callvirt System.String UnityEngine.Object::get_name()
IL_0040: ldloc.0
IL_0041: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0046: stloc.s V_4
IL_0048: ldloc.3
IL_0049: ldfld UnityEngine.GameObject Turret/AmmoType::m_visual
IL_004e: ldloc.s V_4
IL_0050: ldloc.1
IL_0051: and
IL_0052: callvirt System.Void UnityEngine.GameObject::SetActive(System.Boolean)
IL_0057: nop
IL_0058: nop
IL_0059: ldloca.s V_2
IL_005b: call System.Boolean System.Collections.Generic.List`1/Enumerator<Turret/AmmoType>::MoveNext()
IL_0060: brtrue.s IL_002c
IL_0062: leave.s IL_0073
IL_0064: ldloca.s V_2
IL_0066: constrained. System.Collections.Generic.List`1/Enumerator<Turret/AmmoType>
IL_006c: callvirt System.Void System.IDisposable::Dispose()
IL_0071: nop
IL_0072: endfinally
IL_0073: ret
// EH Finally: 42 - 100 => 100 - 115

// System.Boolean LongshipUpgrades.ShipTurret::IsItemAllowed(System.String)
.locals System.Collections.Generic.List`1/Enumerator<Turret/AmmoType>, Turret/AmmoType, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: nop
IL_0002: ldarg.0
IL_0003: ldfld System.Collections.Generic.List`1<Turret/AmmoType> LongshipUpgrades.ShipTurret::m_allowedAmmo
IL_0008: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Turret/AmmoType>::GetEnumerator()
IL_000d: stloc.0
IL_000e: br.s IL_0031
IL_0010: ldloca.s V_0
IL_0012: call !0 System.Collections.Generic.List`1/Enumerator<Turret/AmmoType>::get_Current()
IL_0017: stloc.1
IL_0018: ldloc.1
IL_0019: ldfld ItemDrop Turret/AmmoType::m_ammo
IL_001e: callvirt System.String UnityEngine.Object::get_name()
IL_0023: ldarg.1
IL_0024: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0029: stloc.2
IL_002a: ldloc.2
IL_002b: brfalse.s IL_0031
IL_002d: ldc.i4.1
IL_002e: stloc.3
IL_002f: leave.s IL_004f
IL_0031: ldloca.s V_0
IL_0033: call System.Boolean System.Collections.Generic.List`1/Enumerator<Turret/AmmoType>::MoveNext()
IL_0038: brtrue.s IL_0010
IL_003a: leave.s IL_004b
IL_003c: ldloca.s V_0
IL_003e: constrained. System.Collections.Generic.List`1/Enumerator<Turret/AmmoType>
IL_0044: callvirt System.Void System.IDisposable::Dispose()
IL_0049: nop
IL_004a: endfinally
IL_004b: ldc.i4.0
IL_004c: stloc.3
IL_004d: br.s IL_004f
IL_004f: ldloc.3
IL_0050: ret
// EH Finally: 14 - 60 => 60 - 75

// ItemDrop/ItemData LongshipUpgrades.ShipTurret::FindAmmoItem(Inventory,System.Boolean)
.locals System.Boolean, ItemDrop/ItemData
IL_0000: nop
IL_0001: ldarg.2
IL_0002: brfalse.s IL_000c
IL_0004: ldarg.0
IL_0005: call System.Boolean LongshipUpgrades.ShipTurret::HasAmmo()
IL_000a: br.s IL_000d
IL_000c: ldc.i4.0
IL_000d: stloc.0
IL_000e: ldloc.0
IL_000f: brfalse.s IL_0026
IL_0011: ldarg.1
IL_0012: ldarg.0
IL_0013: ldfld System.String LongshipUpgrades.ShipTurret::m_ammoType
IL_0018: ldarg.0
IL_0019: call System.String LongshipUpgrades.ShipTurret::GetAmmoType()
IL_001e: callvirt ItemDrop/ItemData Inventory::GetAmmoItem(System.String,System.String)
IL_0023: stloc.1
IL_0024: br.s IL_0036
IL_0026: ldarg.1
IL_0027: ldarg.0
IL_0028: ldfld System.String LongshipUpgrades.ShipTurret::m_ammoType
IL_002d: ldnull
IL_002e: callvirt ItemDrop/ItemData Inventory::GetAmmoItem(System.String,System.String)
IL_0033: stloc.1
IL_0034: br.s IL_0036
IL_0036: ldloc.1
IL_0037: ret

// System.Void LongshipUpgrades.ShipTurret::OnDestroyed()
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0007: callvirt System.Boolean ZNetView::IsOwner()
IL_000c: brfalse.s IL_0016
IL_000e: ldarg.0
IL_000f: ldfld System.Boolean LongshipUpgrades.ShipTurret::m_returnAmmoOnDestroy
IL_0014: br.s IL_0017
IL_0016: ldc.i4.0
IL_0017: stloc.0
IL_0018: ldloc.0
IL_0019: brfalse.s IL_0022
IL_001b: ldarg.0
IL_001c: call System.Void LongshipUpgrades.ShipTurret::DropAllItems()
IL_0021: nop
IL_0022: ret

// System.Void LongshipUpgrades.ShipTurret::DropAllItems()
.locals System.Int32, UnityEngine.GameObject, System.Boolean, System.Boolean, Inventory, System.Boolean, System.Boolean, System.Boolean, UnityEngine.Vector3, UnityEngine.Quaternion, ItemDrop, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.Int32 LongshipUpgrades.ShipTurret::GetAmmo()
IL_0007: stloc.0
IL_0008: ldloc.0
IL_0009: ldc.i4.0
IL_000a: cgt
IL_000c: ldc.i4.0
IL_000d: ceq
IL_000f: stloc.2
IL_0010: ldloc.2
IL_0011: brfalse.s IL_0018
IL_0013: br IL_0133
IL_0018: call ZNetScene ZNetScene::get_instance()
IL_001d: ldarg.0
IL_001e: call System.String LongshipUpgrades.ShipTurret::GetAmmoType()
IL_0023: callvirt UnityEngine.GameObject ZNetScene::GetPrefab(System.String)
IL_0028: stloc.1
IL_0029: ldarg.0
IL_002a: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_destroyedLootPrefab
IL_002f: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0034: stloc.3
IL_0035: ldloc.3
IL_0036: brfalse.s IL_0092
IL_0038: nop
IL_0039: ldarg.0
IL_003a: ldarg.0
IL_003b: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_destroyedLootPrefab
IL_0040: call Inventory LongshipUpgrades.ShipTurret::SpawnContainer(UnityEngine.GameObject)
IL_0045: stloc.s V_4
IL_0047: br.s IL_0082
IL_0049: nop
IL_004a: ldloc.s V_4
IL_004c: ldloc.1
IL_004d: ldc.i4.1
IL_004e: callvirt System.Boolean Inventory::AddItem(UnityEngine.GameObject,System.Int32)
IL_0053: stloc.s V_5
IL_0055: ldloc.s V_5
IL_0057: brfalse.s IL_005f
IL_0059: ldloc.0
IL_005a: ldc.i4.1
IL_005b: sub
IL_005c: stloc.0
IL_005d: br.s IL_0081
IL_005f: ldloc.s V_4
IL_0061: callvirt System.Boolean Inventory::HaveEmptySlot()
IL_0066: ldc.i4.0
IL_0067: ceq
IL_0069: stloc.s V_6
IL_006b: ldloc.s V_6
IL_006d: brfalse.s IL_007f
IL_006f: ldarg.0
IL_0070: ldarg.0
IL_0071: ldfld UnityEngine.GameObject LongshipUpgrades.ShipTurret::m_destroyedLootPrefab
IL_0076: call Inventory LongshipUpgrades.ShipTurret::SpawnContainer(UnityEngine.GameObject)
IL_007b: stloc.s V_4
IL_007d: br.s IL_0081
IL_007f: br.s IL_008c
IL_0081: nop
IL_0082: ldloc.0
IL_0083: ldc.i4.0
IL_0084: cgt
IL_0086: stloc.s V_7
IL_0088: ldloc.s V_7
IL_008a: brtrue.s IL_0049
IL_008c: nop
IL_008d: br IL_0133
IL_0092: nop
IL_0093: br IL_0125
IL_0098: nop
IL_0099: ldarg.0
IL_009a: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_009f: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_00a4: call UnityEngine.Vector3 UnityEngine.Vector3::get_up()
IL_00a9: ldc.r4 0.5
IL_00ae: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_00b3: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_00b8: call UnityEngine.Vector3 UnityEngine.Random::get_insideUnitSphere()
IL_00bd: ldc.r4 0.3
IL_00c2: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_00c7: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_00cc: stloc.s V_8
IL_00ce: ldc.r4 0
IL_00d3: ldc.i4.0
IL_00d4: ldc.i4 360
IL_00d9: call System.Int32 UnityEngine.Random::Range(System.Int32,System.Int32)
IL_00de: conv.r4
IL_00df: ldc.r4 0
IL_00e4: call UnityEngine.Quaternion UnityEngine.Quaternion::Euler(System.Single,System.Single,System.Single)
IL_00e9: stloc.s V_9
IL_00eb: ldloc.1
IL_00ec: ldloc.s V_8
IL_00ee: ldloc.s V_9
IL_00f0: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Vector3,UnityEngine.Quaternion)
IL_00f5: callvirt !!0 UnityEngine.GameObject::GetComponent<ItemDrop>()
IL_00fa: stloc.s V_10
IL_00fc: ldloc.s V_10
IL_00fe: ldnull
IL_00ff: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0104: stloc.s V_11
IL_0106: ldloc.s V_11
IL_0108: brfalse.s IL_010c
IL_010a: br.s IL_0132
IL_010c: ldloc.s V_10
IL_010e: ldloc.0
IL_010f: callvirt System.Void ItemDrop::SetStack(System.Int32)
IL_0114: nop
IL_0115: ldloc.0
IL_0116: ldloc.s V_10
IL_0118: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_011d: ldfld System.Int32 ItemDrop/ItemData::m_stack
IL_0122: sub
IL_0123: stloc.0
IL_0124: nop
IL_0125: ldloc.0
IL_0126: ldc.i4.0
IL_0127: cgt
IL_0129: stloc.s V_12
IL_012b: ldloc.s V_12
IL_012d: brtrue IL_0098
IL_0132: nop
IL_0133: ret

// Inventory LongshipUpgrades.ShipTurret::SpawnContainer(UnityEngine.GameObject)
.locals UnityEngine.Vector3, Inventory
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0007: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_000c: call UnityEngine.Vector3 UnityEngine.Random::get_insideUnitSphere()
IL_0011: ldc.r4 1
IL_0016: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_001b: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0020: stloc.0
IL_0021: ldarg.1
IL_0022: ldloc.0
IL_0023: call UnityEngine.Quaternion UnityEngine.Random::get_rotation()
IL_0028: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Vector3,UnityEngine.Quaternion)
IL_002d: callvirt !!0 UnityEngine.GameObject::GetComponent<Container>()
IL_0032: callvirt Inventory Container::GetInventory()
IL_0037: stloc.1
IL_0038: br.s IL_003a
IL_003a: ldloc.1
IL_003b: ret

// System.Void LongshipUpgrades.ShipTurret::SetTargets()
.locals System.Boolean, System.Int32, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0007: callvirt System.Boolean ZNetView::IsOwner()
IL_000c: ldc.i4.0
IL_000d: ceq
IL_000f: stloc.0
IL_0010: ldloc.0
IL_0011: brfalse.s IL_001f
IL_0013: ldarg.0
IL_0014: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0019: callvirt System.Void ZNetView::ClaimOwnership()
IL_001e: nop
IL_001f: ldarg.0
IL_0020: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0025: callvirt ZDO ZNetView::GetZDO()
IL_002a: ldarg.0
IL_002b: call System.Int32 LongshipUpgrades.ShipTurret::GetTargetsZDO()
IL_0030: ldarg.0
IL_0031: ldfld System.Collections.Generic.List`1<ItemDrop> LongshipUpgrades.ShipTurret::m_targetItems
IL_0036: callvirt System.Int32 System.Collections.Generic.List`1<ItemDrop>::get_Count()
IL_003b: ldc.i4.0
IL_003c: callvirt System.Void ZDO::Set(System.Int32,System.Int32,System.Boolean)
IL_0041: nop
IL_0042: ldc.i4.0
IL_0043: stloc.1
IL_0044: br.s IL_007d
IL_0046: ldarg.0
IL_0047: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_004c: callvirt ZDO ZNetView::GetZDO()
IL_0051: ldarg.0
IL_0052: ldloc.1
IL_0053: call System.String LongshipUpgrades.ShipTurret::GetTargetZDO(System.Int32)
IL_0058: ldarg.0
IL_0059: ldfld System.Collections.Generic.List`1<ItemDrop> LongshipUpgrades.ShipTurret::m_targetItems
IL_005e: ldloc.1
IL_005f: callvirt !0 System.Collections.Generic.List`1<ItemDrop>::get_Item(System.Int32)
IL_0064: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0069: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_006e: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_0073: callvirt System.Void ZDO::Set(System.String,System.String)
IL_0078: nop
IL_0079: ldloc.1
IL_007a: ldc.i4.1
IL_007b: add
IL_007c: stloc.1
IL_007d: ldloc.1
IL_007e: ldarg.0
IL_007f: ldfld System.Collections.Generic.List`1<ItemDrop> LongshipUpgrades.ShipTurret::m_targetItems
IL_0084: callvirt System.Int32 System.Collections.Generic.List`1<ItemDrop>::get_Count()
IL_0089: clt
IL_008b: stloc.2
IL_008c: ldloc.2
IL_008d: brtrue.s IL_0046
IL_008f: ldarg.0
IL_0090: call System.Void LongshipUpgrades.ShipTurret::ReadTargets()
IL_0095: nop
IL_0096: ret

// System.String LongshipUpgrades.ShipTurret::GetNameSetTargetRPC()
.locals System.String
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.Boolean LongshipUpgrades.ShipTurret::m_isLeftTurret
IL_0007: brtrue.s IL_0010
IL_0009: ldstr "RPC_SetTargetRight"
IL_000e: br.s IL_0015
IL_0010: ldstr "RPC_SetTargetLeft"
IL_0015: stloc.0
IL_0016: br.s IL_0018
IL_0018: ldloc.0
IL_0019: ret

// System.Int32 LongshipUpgrades.ShipTurret::GetTargetsZDO()
.locals System.Int32
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.Boolean LongshipUpgrades.ShipTurret::m_isLeftTurret
IL_0007: brtrue.s IL_0010
IL_0009: ldsfld System.Int32 LongshipUpgrades.ShipTurret::s_targetsRight
IL_000e: br.s IL_0015
IL_0010: ldsfld System.Int32 LongshipUpgrades.ShipTurret::s_targetsLeft
IL_0015: stloc.0
IL_0016: br.s IL_0018
IL_0018: ldloc.0
IL_0019: ret

// System.Int32 LongshipUpgrades.ShipTurret::GetLastAttackZDO()
.locals System.Int32
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.Boolean LongshipUpgrades.ShipTurret::m_isLeftTurret
IL_0007: brtrue.s IL_0010
IL_0009: ldsfld System.Int32 LongshipUpgrades.ShipTurret::s_lastAttackRight
IL_000e: br.s IL_0015
IL_0010: ldsfld System.Int32 LongshipUpgrades.ShipTurret::s_lastAttackLeft
IL_0015: stloc.0
IL_0016: br.s IL_0018
IL_0018: ldloc.0
IL_0019: ret

// System.String LongshipUpgrades.ShipTurret::GetTargetZDO(System.Int32)
.locals System.String
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.Boolean LongshipUpgrades.ShipTurret::m_isLeftTurret
IL_0007: brtrue.s IL_0010
IL_0009: ldstr "targetright"
IL_000e: br.s IL_0015
IL_0010: ldstr "targetleft"
IL_0015: ldarga.s i
IL_0017: call System.String System.Int32::ToString()
IL_001c: call System.String System.String::Concat(System.String,System.String)
IL_0021: stloc.0
IL_0022: br.s IL_0024
IL_0024: ldloc.0
IL_0025: ret

// System.Void LongshipUpgrades.ShipTurret::ReadTargets()
.locals System.Int32, System.Boolean, System.Int32, System.String, System.Collections.Generic.List`1/Enumerator<Turret/TrophyTarget>, Turret/TrophyTarget, System.Boolean, System.Boolean, System.Boolean, System.Int32, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0007: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000c: brfalse.s IL_001e
IL_000e: ldarg.0
IL_000f: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0014: callvirt System.Boolean ZNetView::IsValid()
IL_0019: ldc.i4.0
IL_001a: ceq
IL_001c: br.s IL_001f
IL_001e: ldc.i4.1
IL_001f: stloc.1
IL_0020: ldloc.1
IL_0021: brfalse.s IL_0028
IL_0023: br IL_01fd
IL_0028: ldarg.0
IL_0029: ldfld System.Collections.Generic.List`1<ItemDrop> LongshipUpgrades.ShipTurret::m_targetItems
IL_002e: callvirt System.Void System.Collections.Generic.List`1<ItemDrop>::Clear()
IL_0033: nop
IL_0034: ldarg.0
IL_0035: ldfld System.Collections.Generic.List`1<Character> LongshipUpgrades.ShipTurret::m_targetCharacters
IL_003a: callvirt System.Void System.Collections.Generic.List`1<Character>::Clear()
IL_003f: nop
IL_0040: ldarg.0
IL_0041: ldstr ""
IL_0046: stfld System.String LongshipUpgrades.ShipTurret::m_targetsText
IL_004b: ldarg.0
IL_004c: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0051: callvirt ZDO ZNetView::GetZDO()
IL_0056: ldarg.0
IL_0057: call System.Int32 LongshipUpgrades.ShipTurret::GetTargetsZDO()
IL_005c: ldc.i4.0
IL_005d: callvirt System.Int32 ZDO::GetInt(System.Int32,System.Int32)
IL_0062: stloc.0
IL_0063: ldc.i4.0
IL_0064: stloc.2
IL_0065: br IL_01f0
IL_006a: nop
IL_006b: ldarg.0
IL_006c: ldfld ZNetView LongshipUpgrades.ShipTurret::m_nview
IL_0071: callvirt ZDO ZNetView::GetZDO()
IL_0076: ldarg.0
IL_0077: ldloc.2
IL_0078: call System.String LongshipUpgrades.ShipTurret::GetTargetZDO(System.Int32)
IL_007d: ldstr ""
IL_0082: callvirt System.String ZDO::GetString(System.String,System.String)
IL_0087: stloc.3
IL_0088: nop
IL_0089: ldarg.0
IL_008a: ldfld System.Collections.Generic.List`1<Turret/TrophyTarget> LongshipUpgrades.ShipTurret::m_configTargets
IL_008f: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Turret/TrophyTarget>::GetEnumerator()
IL_0094: stloc.s V_4
IL_0096: br IL_01ce
IL_009b: ldloca.s V_4
IL_009d: call !0 System.Collections.Generic.List`1/Enumerator<Turret/TrophyTarget>::get_Current()
IL_00a2: stloc.s V_5
IL_00a4: nop
IL_00a5: ldloc.s V_5
IL_00a7: ldfld ItemDrop Turret/TrophyTarget::m_item
IL_00ac: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_00b1: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_00b6: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_00bb: ldloc.3
IL_00bc: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00c1: ldc.i4.0
IL_00c2: ceq
IL_00c4: stloc.s V_6
IL_00c6: ldloc.s V_6
IL_00c8: brfalse.s IL_00d0
IL_00ca: nop
IL_00cb: br IL_01ce
IL_00d0: ldarg.0
IL_00d1: ldfld System.Collections.Generic.List`1<ItemDrop> LongshipUpgrades.ShipTurret::m_targetItems
IL_00d6: ldloc.s V_5
IL_00d8: ldfld ItemDrop Turret/TrophyTarget::m_item
IL_00dd: callvirt System.Void System.Collections.Generic.List`1<ItemDrop>::Add(!0)
IL_00e2: nop
IL_00e3: ldarg.0
IL_00e4: ldfld System.Collections.Generic.List`1<Character> LongshipUpgrades.ShipTurret::m_targetCharacters
IL_00e9: ldloc.s V_5
IL_00eb: ldfld System.Collections.Generic.List`1<Character> Turret/TrophyTarget::m_targets
IL_00f0: callvirt System.Void System.Collections.Generic.List`1<Character>::AddRange(System.Collections.Generic.IEnumerable`1<!0>)
IL_00f5: nop
IL_00f6: ldarg.0
IL_00f7: ldfld System.String LongshipUpgrades.ShipTurret::m_targetsText
IL_00fc: callvirt System.Int32 System.String::get_Length()
IL_0101: ldc.i4.0
IL_0102: cgt
IL_0104: stloc.s V_7
IL_0106: ldloc.s V_7
IL_0108: brfalse.s IL_0122
IL_010a: nop
IL_010b: ldarg.0
IL_010c: ldarg.0
IL_010d: ldfld System.String LongshipUpgrades.ShipTurret::m_targetsText
IL_0112: ldstr ", "
IL_0117: call System.String System.String::Concat(System.String,System.String)
IL_011c: stfld System.String LongshipUpgrades.ShipTurret::m_targetsText
IL_0121: nop
IL_0122: ldloc.s V_5
IL_0124: ldfld System.String Turret/TrophyTarget::m_nameOverride
IL_0129: call System.Boolean System.String::IsNullOrEmpty(System.String)
IL_012e: ldc.i4.0
IL_012f: ceq
IL_0131: stloc.s V_8
IL_0133: ldloc.s V_8
IL_0135: brfalse.s IL_0155
IL_0137: nop
IL_0138: ldarg.0
IL_0139: ldarg.0
IL_013a: ldfld System.String LongshipUpgrades.ShipTurret::m_targetsText
IL_013f: ldloc.s V_5
IL_0141: ldfld System.String Turret/TrophyTarget::m_nameOverride
IL_0146: call System.String System.String::Concat(System.String,System.String)
IL_014b: stfld System.String LongshipUpgrades.ShipTurret::m_targetsText
IL_0150: br IL_01da
IL_0155: ldc.i4.0
IL_0156: stloc.s V_9
IL_0158: br.s IL_01b6
IL_015a: nop
IL_015b: ldarg.0
IL_015c: ldarg.0
IL_015d: ldfld System.String LongshipUpgrades.ShipTurret::m_targetsText
IL_0162: ldloc.s V_5
IL_0164: ldfld System.Collections.Generic.List`1<Character> Turret/TrophyTarget::m_targets
IL_0169: ldloc.s V_9
IL_016b: callvirt !0 System.Collections.Generic.List`1<Character>::get_Item(System.Int32)
IL_0170: ldfld System.String Character::m_name
IL_0175: call System.String System.String::Concat(System.String,System.String)
IL_017a: stfld System.String LongshipUpgrades.ShipTurret::m_targetsText
IL_017f: ldloc.s V_9
IL_0181: ldc.i4.1
IL_0182: add
IL_0183: ldloc.s V_5
IL_0185: ldfld System.Collections.Generic.List`1<Character> Turret/TrophyTarget::m_targets
IL_018a: callvirt System.Int32 System.Collections.Generic.List`1<Character>::get_Count()
IL_018f: clt
IL_0191: stloc.s V_10
IL_0193: ldloc.s V_10
IL_0195: brfalse.s IL_01af
IL_0197: nop
IL_0198: ldarg.0
IL_0199: ldarg.0
IL_019a: ldfld System.String LongshipUpgrades.ShipTurret::m_targetsText
IL_019f: ldstr ", "
IL_01a4: call System.String System.String::Concat(System.String,System.String)
IL_01a9: stfld System.String LongshipUpgrades.ShipTurret::m_targetsText
IL_01ae: nop
IL_01af: nop
IL_01b0: ldloc.s V_9
IL_01b2: ldc.i4.1
IL_01b3: add
IL_01b4: stloc.s V_9
IL_01b6: ldloc.s V_9
IL_01b8: ldloc.s V_5
IL_01ba: ldfld System.Collections.Generic.List`1<Character> Turret/TrophyTarget::m_targets
IL_01bf: callvirt System.Int32 System.Collections.Generic.List`1<Character>::get_Count()
IL_01c4: clt
IL_01c6: stloc.s V_11
IL_01c8: ldloc.s V_11
IL_01ca: brtrue.s IL_015a
IL_01cc: br.s IL_01da
IL_01ce: ldloca.s V_4
IL_01d0: call System.Boolean System.Collections.Generic.List`1/Enumerator<Turret/TrophyTarget>::MoveNext()
IL_01d5: brtrue IL_009b
IL_01da: leave.s IL_01eb
IL_01dc: ldloca.s V_4
IL_01de: constrained. System.Collections.Generic.List`1/Enumerator<Turret/TrophyTarget>
IL_01e4: callvirt System.Void System.IDisposable::Dispose()
IL_01e9: nop
IL_01ea: endfinally
IL_01eb: nop
IL_01ec: ldloc.2
IL_01ed: ldc.i4.1
IL_01ee: add
IL_01ef: stloc.2
IL_01f0: ldloc.2
IL_01f1: ldloc.0
IL_01f2: clt
IL_01f4: stloc.s V_12
IL_01f6: ldloc.s V_12
IL_01f8: brtrue IL_006a
IL_01fd: ret
// EH Finally: 150 - 476 => 476 - 491

// System.Void LongshipUpgrades.ShipTurret::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: ldstr "$piece_turret"
IL_0006: stfld System.String LongshipUpgrades.ShipTurret::m_name
IL_000b: ldarg.0
IL_000c: ldc.r4 50
IL_0011: stfld System.Single LongshipUpgrades.ShipTurret::m_turnRate
IL_0016: ldarg.0
IL_0017: ldc.r4 60
IL_001c: stfld System.Single LongshipUpgrades.ShipTurret::m_horizontalAngle
IL_0021: ldarg.0
IL_0022: ldc.r4 70
IL_0027: stfld System.Single LongshipUpgrades.ShipTurret::m_verticalAngle
IL_002c: ldarg.0
IL_002d: ldc.r4 30
IL_0032: stfld System.Single LongshipUpgrades.ShipTurret::m_viewDistance
IL_0037: ldarg.0
IL_0038: ldc.r4 7
IL_003d: stfld System.Single LongshipUpgrades.ShipTurret::m_noTargetScanRate
IL_0042: ldarg.0
IL_0043: ldc.r4 1.4
IL_0048: stfld System.Single LongshipUpgrades.ShipTurret::m_lookAcceleration
IL_004d: ldarg.0
IL_004e: ldc.r4 0.05
IL_0053: stfld System.Single LongshipUpgrades.ShipTurret::m_lookDeacceleration
IL_0058: ldarg.0
IL_0059: ldc.r4 0.005
IL_005e: stfld System.Single LongshipUpgrades.ShipTurret::m_lookMinDegreesDelta
IL_0063: ldarg.0
IL_0064: ldc.r4 2
IL_0069: stfld System.Single LongshipUpgrades.ShipTurret::m_attackCooldown
IL_006e: ldarg.0
IL_006f: ldc.r4 1
IL_0074: stfld System.Single LongshipUpgrades.ShipTurret::m_attackWarmup
IL_0079: ldarg.0
IL_007a: ldc.r4 10
IL_007f: stfld System.Single LongshipUpgrades.ShipTurret::m_hitNoise
IL_0084: ldarg.0
IL_0085: ldc.r4 0.99998
IL_008a: stfld System.Single LongshipUpgrades.ShipTurret::m_shootWhenAimDiff
IL_008f: ldarg.0
IL_0090: ldc.r4 2
IL_0095: stfld System.Single LongshipUpgrades.ShipTurret::m_predictionModifier
IL_009a: ldarg.0
IL_009b: ldc.r4 1
IL_00a0: stfld System.Single LongshipUpgrades.ShipTurret::m_updateTargetIntervalNear
IL_00a5: ldarg.0
IL_00a6: ldc.r4 4
IL_00ab: stfld System.Single LongshipUpgrades.ShipTurret::m_updateTargetIntervalFar
IL_00b0: ldarg.0
IL_00b1: ldc.i4.s 100
IL_00b3: stfld System.Int32 LongshipUpgrades.ShipTurret::m_maxAmmo
IL_00b8: ldarg.0
IL_00b9: ldstr "$ammo_turretbolt"
IL_00be: stfld System.String LongshipUpgrades.ShipTurret::m_ammoType
IL_00c3: ldarg.0
IL_00c4: newobj System.Void System.Collections.Generic.List`1<Turret/AmmoType>::.ctor()
IL_00c9: stfld System.Collections.Generic.List`1<Turret/AmmoType> LongshipUpgrades.ShipTurret::m_allowedAmmo
IL_00ce: ldarg.0
IL_00cf: ldc.i4.1
IL_00d0: stfld System.Boolean LongshipUpgrades.ShipTurret::m_returnAmmoOnDestroy
IL_00d5: ldarg.0
IL_00d6: ldc.r4 0.2
IL_00db: stfld System.Single LongshipUpgrades.ShipTurret::m_holdRepeatInterval
IL_00e0: ldarg.0
IL_00e1: ldc.i4.1
IL_00e2: stfld System.Boolean LongshipUpgrades.ShipTurret::m_targetEnemies
IL_00e7: ldarg.0
IL_00e8: ldc.i4.1
IL_00e9: stfld System.Boolean LongshipUpgrades.ShipTurret::m_targetTamedConfig
IL_00ee: ldarg.0
IL_00ef: newobj System.Void System.Collections.Generic.List`1<Turret/TrophyTarget>::.ctor()
IL_00f4: stfld System.Collections.Generic.List`1<Turret/TrophyTarget> LongshipUpgrades.ShipTurret::m_configTargets
IL_00f9: ldarg.0
IL_00fa: ldc.i4.1
IL_00fb: stfld System.Int32 LongshipUpgrades.ShipTurret::m_maxConfigTargets
IL_0100: ldarg.0
IL_0101: newobj System.Void System.Collections.Generic.List`1<ItemDrop>::.ctor()
IL_0106: stfld System.Collections.Generic.List`1<ItemDrop> LongshipUpgrades.ShipTurret::m_targetItems
IL_010b: ldarg.0
IL_010c: newobj System.Void System.Collections.Generic.List`1<Character>::.ctor()
IL_0111: stfld System.Collections.Generic.List`1<Character> LongshipUpgrades.ShipTurret::m_targetCharacters
IL_0116: ldarg.0
IL_0117: ldc.i4.s 20
IL_0119: newobj System.Void System.Text.StringBuilder::.ctor(System.Int32)
IL_011e: stfld System.Text.StringBuilder LongshipUpgrades.ShipTurret::sb
IL_0123: ldarg.0
IL_0124: ldc.i4.m1
IL_0125: stfld System.UInt32 LongshipUpgrades.ShipTurret::m_lastUpdateTargetRevision
IL_012a: ldarg.0
IL_012b: ldc.i4.1
IL_012c: stfld System.Int32 LongshipUpgrades.ShipTurret::m_scanDirection
IL_0131: ldarg.0
IL_0132: ldc.r4 1
IL_0137: stfld System.Single LongshipUpgrades.ShipTurret::m_scanDistance
IL_013c: ldarg.0
IL_013d: call System.Void UnityEngine.MonoBehaviour::.ctor()
IL_0142: nop
IL_0143: ret

// System.Void LongshipUpgrades.ShipTurret::.cctor()
.locals 
IL_0000: ldstr "lastAttackLeft"
IL_0005: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_000a: stsfld System.Int32 LongshipUpgrades.ShipTurret::s_lastAttackLeft
IL_000f: ldstr "lastAttackRight"
IL_0014: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0019: stsfld System.Int32 LongshipUpgrades.ShipTurret::s_lastAttackRight
IL_001e: ldstr "targetsLeft"
IL_0023: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0028: stsfld System.Int32 LongshipUpgrades.ShipTurret::s_targetsLeft
IL_002d: ldstr "targetsRight"
IL_0032: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0037: stsfld System.Int32 LongshipUpgrades.ShipTurret::s_targetsRight
IL_003c: newobj System.Void EffectList::.ctor()
IL_0041: stsfld EffectList LongshipUpgrades.ShipTurret::m_shootEffect
IL_0046: newobj System.Void EffectList::.ctor()
IL_004b: stsfld EffectList LongshipUpgrades.ShipTurret::m_addAmmoEffect
IL_0050: newobj System.Void EffectList::.ctor()
IL_0055: stsfld EffectList LongshipUpgrades.ShipTurret::m_reloadEffect
IL_005a: newobj System.Void EffectList::.ctor()
IL_005f: stsfld EffectList LongshipUpgrades.ShipTurret::m_warmUpStartEffect
IL_0064: newobj System.Void EffectList::.ctor()
IL_0069: stsfld EffectList LongshipUpgrades.ShipTurret::m_newTargetEffect
IL_006e: newobj System.Void EffectList::.ctor()
IL_0073: stsfld EffectList LongshipUpgrades.ShipTurret::m_lostTargetEffect
IL_0078: newobj System.Void EffectList::.ctor()
IL_007d: stsfld EffectList LongshipUpgrades.ShipTurret::m_setTargetEffect
IL_0082: ret
