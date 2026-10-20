
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

// System.Void Runic.Localization.LanguageCatalog::.ctor(System.String,System.Func`2<System.String,System.String>)
.locals 
IL_0000: ldarg.0
IL_0001: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::.ctor()
IL_0006: stfld System.Collections.Generic.Dictionary`2<System.String,System.String> Runic.Localization.LanguageCatalog::_selected
IL_000b: ldarg.0
IL_000c: call System.Void System.Object::.ctor()
IL_0011: ldarg.0
IL_0012: ldarg.1
IL_0013: call System.Collections.Generic.Dictionary`2<System.String,System.String> Runic.Localization.LanguageCatalog::Parse(System.String)
IL_0018: stfld System.Collections.Generic.Dictionary`2<System.String,System.String> Runic.Localization.LanguageCatalog::_english
IL_001d: ldarg.0
IL_001e: ldarg.2
IL_001f: stfld System.Func`2<System.String,System.String> Runic.Localization.LanguageCatalog::_read
IL_0024: ret

// System.Collections.Generic.Dictionary`2<System.String,System.String> Runic.Localization.LanguageCatalog::Parse(System.String)
.locals System.Runtime.Serialization.Json.DataContractJsonSerializer, System.IO.MemoryStream, System.Collections.Generic.Dictionary`2<System.String,System.String>
IL_0000: ldarg.0
IL_0001: call System.Boolean System.String::IsNullOrWhiteSpace(System.String)
IL_0006: brfalse.s IL_000e
IL_0008: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::.ctor()
IL_000d: ret
IL_000e: ldarg.0
IL_000f: callvirt System.Int32 System.String::get_Length()
IL_0014: ldc.i4 2097152
IL_0019: ble.s IL_0026
IL_001b: ldstr "Language file exceeds 2 MiB."
IL_0020: newobj System.Void System.IO.InvalidDataException::.ctor(System.String)
IL_0025: throw
IL_0026: ldtoken System.Collections.Generic.Dictionary`2<System.String,System.String>
IL_002b: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0030: newobj System.Void System.Runtime.Serialization.Json.DataContractJsonSerializerSettings::.ctor()
IL_0035: dup
IL_0036: ldc.i4.1
IL_0037: callvirt System.Void System.Runtime.Serialization.Json.DataContractJsonSerializerSettings::set_UseSimpleDictionaryFormat(System.Boolean)
IL_003c: newobj System.Void System.Runtime.Serialization.Json.DataContractJsonSerializer::.ctor(System.Type,System.Runtime.Serialization.Json.DataContractJsonSerializerSettings)
IL_0041: stloc.0
IL_0042: call System.Text.Encoding System.Text.Encoding::get_UTF8()
IL_0047: ldarg.0
IL_0048: ldc.i4 65279
IL_004d: callvirt System.String System.String::TrimStart(System.Char)
IL_0052: callvirt System.Byte[] System.Text.Encoding::GetBytes(System.String)
IL_0057: newobj System.Void System.IO.MemoryStream::.ctor(System.Byte[])
IL_005c: stloc.1
IL_005d: ldloc.0
IL_005e: ldloc.1
IL_005f: callvirt System.Object System.Runtime.Serialization.XmlObjectSerializer::ReadObject(System.IO.Stream)
IL_0064: castclass System.Collections.Generic.Dictionary`2<System.String,System.String>
IL_0069: dup
IL_006a: brtrue.s IL_0072
IL_006c: pop
IL_006d: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::.ctor()
IL_0072: stloc.2
IL_0073: leave.s IL_007f
IL_0075: ldloc.1
IL_0076: brfalse.s IL_007e
IL_0078: ldloc.1
IL_0079: callvirt System.Void System.IDisposable::Dispose()
IL_007e: endfinally
IL_007f: ldloc.2
IL_0080: ret
// EH Finally: 93 - 117 => 117 - 127

// System.Void Runic.Localization.LanguageCatalog::Select(System.String)
.locals 
IL_0000: ldarg.1
IL_0001: call System.Boolean System.String::IsNullOrWhiteSpace(System.String)
IL_0006: brtrue.s IL_000b
IL_0008: ldarg.1
IL_0009: br.s IL_0010
IL_000b: ldstr "English"
IL_0010: starg.s language
IL_0012: ldarg.1
IL_0013: ldarg.0
IL_0014: ldfld System.String Runic.Localization.LanguageCatalog::_language
IL_0019: ldc.i4.4
IL_001a: call System.Boolean System.String::Equals(System.String,System.String,System.StringComparison)
IL_001f: brfalse.s IL_0022
IL_0021: ret
IL_0022: ldarg.0
IL_0023: ldarg.1
IL_0024: stfld System.String Runic.Localization.LanguageCatalog::_language
IL_0029: ldarg.0
IL_002a: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::.ctor()
IL_002f: stfld System.Collections.Generic.Dictionary`2<System.String,System.String> Runic.Localization.LanguageCatalog::_selected
IL_0034: ldarg.1
IL_0035: ldc.i4.4
IL_0036: newarr System.Char
IL_003b: dup
IL_003c: ldtoken System.Int64 <PrivateImplementationDetails>::236CC836A7318B1119D0BEFDDB9925CA5760C2AE835F378BBED826C25150B82D
IL_0041: call System.Void System.Runtime.CompilerServices.RuntimeHelpers::InitializeArray(System.Array,System.RuntimeFieldHandle)
IL_0046: callvirt System.Int32 System.String::IndexOfAny(System.Char[])
IL_004b: ldc.i4.0
IL_004c: bge.s IL_0068
IL_004e: ldarg.1
IL_004f: ldstr "."
IL_0054: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0059: brtrue.s IL_0068
IL_005b: ldarg.1
IL_005c: ldstr ".."
IL_0061: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0066: brfalse.s IL_0069
IL_0068: ret
IL_0069: nop
IL_006a: ldarg.0
IL_006b: ldarg.0
IL_006c: ldfld System.Func`2<System.String,System.String> Runic.Localization.LanguageCatalog::_read
IL_0071: ldarg.1
IL_0072: callvirt !1 System.Func`2<System.String,System.String>::Invoke(!0)
IL_0077: call System.Collections.Generic.Dictionary`2<System.String,System.String> Runic.Localization.LanguageCatalog::Parse(System.String)
IL_007c: stfld System.Collections.Generic.Dictionary`2<System.String,System.String> Runic.Localization.LanguageCatalog::_selected
IL_0081: leave.s IL_0086
IL_0083: pop
IL_0084: leave.s IL_0086
IL_0086: ret
// EH Catch: 106 - 131 => 131 - 134

// System.String Runic.Localization.LanguageCatalog::Get(System.String)
.locals System.String, System.String
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> Runic.Localization.LanguageCatalog::_english
IL_0006: ldarg.1
IL_0007: ldloca.s V_0
IL_0009: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::TryGetValue(!0,!1&)
IL_000e: pop
IL_000f: ldarg.0
IL_0010: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> Runic.Localization.LanguageCatalog::_selected
IL_0015: ldarg.1
IL_0016: ldloca.s V_1
IL_0018: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::TryGetValue(!0,!1&)
IL_001d: brfalse.s IL_0035
IL_001f: ldloc.1
IL_0020: call System.Boolean System.String::IsNullOrWhiteSpace(System.String)
IL_0025: brtrue.s IL_0035
IL_0027: ldloc.0
IL_0028: brfalse.s IL_0033
IL_002a: ldloc.0
IL_002b: ldloc.1
IL_002c: call System.Boolean Runic.Localization.LanguageCatalog::SameFields(System.String,System.String)
IL_0031: brfalse.s IL_0035
IL_0033: ldloc.1
IL_0034: ret
IL_0035: ldloc.0
IL_0036: dup
IL_0037: brtrue.s IL_003b
IL_0039: pop
IL_003a: ldarg.1
IL_003b: ret

// System.String Runic.Localization.LanguageCatalog::English(System.String)
.locals System.String
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> Runic.Localization.LanguageCatalog::_english
IL_0006: ldarg.1
IL_0007: ldloca.s V_0
IL_0009: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::TryGetValue(!0,!1&)
IL_000e: brtrue.s IL_0012
IL_0010: ldarg.1
IL_0011: ret
IL_0012: ldloc.0
IL_0013: ret

// System.String Runic.Localization.LanguageCatalog::TranslateEnglish(System.String)
.locals System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>, System.Collections.Generic.KeyValuePair`2<System.String,System.String>, System.String
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> Runic.Localization.LanguageCatalog::_english
IL_0006: callvirt System.Collections.Generic.Dictionary`2/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2<System.String,System.String>::GetEnumerator()
IL_000b: stloc.0
IL_000c: br.s IL_0035
IL_000e: ldloca.s V_0
IL_0010: call System.Collections.Generic.KeyValuePair`2<!0,!1> System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>::get_Current()
IL_0015: stloc.1
IL_0016: ldloca.s V_1
IL_0018: call !1 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Value()
IL_001d: ldarg.1
IL_001e: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0023: brfalse.s IL_0035
IL_0025: ldarg.0
IL_0026: ldloca.s V_1
IL_0028: call !0 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Key()
IL_002d: call System.String Runic.Localization.LanguageCatalog::Get(System.String)
IL_0032: stloc.2
IL_0033: leave.s IL_0050
IL_0035: ldloca.s V_0
IL_0037: call System.Boolean System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>::MoveNext()
IL_003c: brtrue.s IL_000e
IL_003e: leave.s IL_004e
IL_0040: ldloca.s V_0
IL_0042: constrained. System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>
IL_0048: callvirt System.Void System.IDisposable::Dispose()
IL_004d: endfinally
IL_004e: ldarg.1
IL_004f: ret
IL_0050: ldloc.2
IL_0051: ret
// EH Finally: 12 - 64 => 64 - 78

// System.String Runic.Localization.LanguageCatalog::Format(System.String,System.Object[])
.locals System.String, System.String, System.String
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> Runic.Localization.LanguageCatalog::_english
IL_0006: ldarg.1
IL_0007: ldloca.s V_0
IL_0009: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::TryGetValue(!0,!1&)
IL_000e: pop
IL_000f: ldarg.0
IL_0010: ldarg.1
IL_0011: call System.String Runic.Localization.LanguageCatalog::Get(System.String)
IL_0016: stloc.1
IL_0017: ldloc.0
IL_0018: brfalse.s IL_0025
IL_001a: ldloc.0
IL_001b: ldloc.1
IL_001c: call System.Boolean Runic.Localization.LanguageCatalog::SameFields(System.String,System.String)
IL_0021: brtrue.s IL_0025
IL_0023: ldloc.0
IL_0024: stloc.1
IL_0025: nop
IL_0026: call System.Globalization.CultureInfo System.Globalization.CultureInfo::get_CurrentCulture()
IL_002b: ldloc.1
IL_002c: ldarg.2
IL_002d: call System.String System.String::Format(System.IFormatProvider,System.String,System.Object[])
IL_0032: stloc.2
IL_0033: leave.s IL_0054
IL_0035: pop
IL_0036: call System.Globalization.CultureInfo System.Globalization.CultureInfo::get_CurrentCulture()
IL_003b: ldloc.0
IL_003c: dup
IL_003d: brtrue.s IL_0041
IL_003f: pop
IL_0040: ldarg.1
IL_0041: ldarg.2
IL_0042: call System.String System.String::Format(System.IFormatProvider,System.String,System.Object[])
IL_0047: stloc.2
IL_0048: leave.s IL_0054
IL_004a: pop
IL_004b: ldloc.0
IL_004c: dup
IL_004d: brtrue.s IL_0051
IL_004f: pop
IL_0050: ldarg.1
IL_0051: stloc.2
IL_0052: leave.s IL_0054
IL_0054: ldloc.2
IL_0055: ret
// EH Catch: 54 - 74 => 74 - 84
// EH Catch: 38 - 53 => 53 - 84

// System.Boolean Runic.Localization.LanguageCatalog::SameFields(System.String,System.String)
.locals System.Boolean
IL_0000: ldarg.0
IL_0001: call System.Collections.Generic.HashSet`1<System.Int32> Runic.Localization.LanguageCatalog::Fields(System.String)
IL_0006: ldarg.1
IL_0007: call System.Collections.Generic.HashSet`1<System.Int32> Runic.Localization.LanguageCatalog::Fields(System.String)
IL_000c: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.Int32>::SetEquals(System.Collections.Generic.IEnumerable`1<!0>)
IL_0011: stloc.0
IL_0012: leave.s IL_0019
IL_0014: pop
IL_0015: ldc.i4.0
IL_0016: stloc.0
IL_0017: leave.s IL_0019
IL_0019: ldloc.0
IL_001a: ret
// EH Catch: 0 - 20 => 20 - 25

// System.Collections.Generic.HashSet`1<System.Int32> Runic.Localization.LanguageCatalog::Fields(System.String)
.locals System.Collections.Generic.HashSet`1<System.Int32>, System.Int32, System.Int32, System.Int32
IL_0000: newobj System.Void System.Collections.Generic.HashSet`1<System.Int32>::.ctor()
IL_0005: stloc.0
IL_0006: ldc.i4.0
IL_0007: stloc.1
IL_0008: br IL_00f4
IL_000d: ldarg.0
IL_000e: ldloc.1
IL_000f: callvirt System.Char System.String::get_Chars(System.Int32)
IL_0014: ldc.i4.s 125
IL_0016: bne.un.s IL_003f
IL_0018: ldloc.1
IL_0019: ldc.i4.1
IL_001a: add
IL_001b: ldarg.0
IL_001c: callvirt System.Int32 System.String::get_Length()
IL_0021: bge.s IL_0039
IL_0023: ldarg.0
IL_0024: ldloc.1
IL_0025: ldc.i4.1
IL_0026: add
IL_0027: callvirt System.Char System.String::get_Chars(System.Int32)
IL_002c: ldc.i4.s 125
IL_002e: bne.un.s IL_0039
IL_0030: ldloc.1
IL_0031: ldc.i4.1
IL_0032: add
IL_0033: stloc.1
IL_0034: br IL_00f0
IL_0039: newobj System.Void System.FormatException::.ctor()
IL_003e: throw
IL_003f: ldarg.0
IL_0040: ldloc.1
IL_0041: callvirt System.Char System.String::get_Chars(System.Int32)
IL_0046: ldc.i4.s 123
IL_0048: bne.un IL_00f0
IL_004d: ldloc.1
IL_004e: ldc.i4.1
IL_004f: add
IL_0050: ldarg.0
IL_0051: callvirt System.Int32 System.String::get_Length()
IL_0056: bge.s IL_006e
IL_0058: ldarg.0
IL_0059: ldloc.1
IL_005a: ldc.i4.1
IL_005b: add
IL_005c: callvirt System.Char System.String::get_Chars(System.Int32)
IL_0061: ldc.i4.s 123
IL_0063: bne.un.s IL_006e
IL_0065: ldloc.1
IL_0066: ldc.i4.1
IL_0067: add
IL_0068: stloc.1
IL_0069: br IL_00f0
IL_006e: ldloc.1
IL_006f: ldc.i4.1
IL_0070: add
IL_0071: dup
IL_0072: stloc.1
IL_0073: stloc.2
IL_0074: br.s IL_007a
IL_0076: ldloc.1
IL_0077: ldc.i4.1
IL_0078: add
IL_0079: stloc.1
IL_007a: ldloc.1
IL_007b: ldarg.0
IL_007c: callvirt System.Int32 System.String::get_Length()
IL_0081: bge.s IL_0091
IL_0083: ldarg.0
IL_0084: ldloc.1
IL_0085: callvirt System.Char System.String::get_Chars(System.Int32)
IL_008a: call System.Boolean System.Char::IsDigit(System.Char)
IL_008f: brtrue.s IL_0076
IL_0091: ldloc.2
IL_0092: ldloc.1
IL_0093: beq.s IL_00a8
IL_0095: ldarg.0
IL_0096: ldloc.2
IL_0097: ldloc.1
IL_0098: ldloc.2
IL_0099: sub
IL_009a: callvirt System.String System.String::Substring(System.Int32,System.Int32)
IL_009f: ldloca.s V_3
IL_00a1: call System.Boolean System.Int32::TryParse(System.String,System.Int32&)
IL_00a6: brtrue.s IL_00ae
IL_00a8: newobj System.Void System.FormatException::.ctor()
IL_00ad: throw
IL_00ae: ldloc.0
IL_00af: ldloc.3
IL_00b0: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.Int32>::Add(!0)
IL_00b5: pop
IL_00b6: br.s IL_00cd
IL_00b8: ldarg.0
IL_00b9: ldloc.1
IL_00ba: callvirt System.Char System.String::get_Chars(System.Int32)
IL_00bf: ldc.i4.s 123
IL_00c1: bne.un.s IL_00c9
IL_00c3: newobj System.Void System.FormatException::.ctor()
IL_00c8: throw
IL_00c9: ldloc.1
IL_00ca: ldc.i4.1
IL_00cb: add
IL_00cc: stloc.1
IL_00cd: ldloc.1
IL_00ce: ldarg.0
IL_00cf: callvirt System.Int32 System.String::get_Length()
IL_00d4: bge.s IL_00e1
IL_00d6: ldarg.0
IL_00d7: ldloc.1
IL_00d8: callvirt System.Char System.String::get_Chars(System.Int32)
IL_00dd: ldc.i4.s 125
IL_00df: bne.un.s IL_00b8
IL_00e1: ldloc.1
IL_00e2: ldarg.0
IL_00e3: callvirt System.Int32 System.String::get_Length()
IL_00e8: bne.un.s IL_00f0
IL_00ea: newobj System.Void System.FormatException::.ctor()
IL_00ef: throw
IL_00f0: ldloc.1
IL_00f1: ldc.i4.1
IL_00f2: add
IL_00f3: stloc.1
IL_00f4: ldloc.1
IL_00f5: ldarg.0
IL_00f6: callvirt System.Int32 System.String::get_Length()
IL_00fb: blt IL_000d
IL_0100: ldloc.0
IL_0101: ret

// Runic.Localization.LanguageCatalog Runic.Localization.RunicText::Create()
.locals System.IO.Stream, System.IO.StreamReader, Runic.Localization.LanguageCatalog
IL_0000: ldsfld System.Reflection.Assembly Runic.Localization.RunicText::Owner
IL_0005: ldstr "Runic.Localization.English.json"
IL_000a: callvirt System.IO.Stream System.Reflection.Assembly::GetManifestResourceStream(System.String)
IL_000f: stloc.0
IL_0010: ldloc.0
IL_0011: brfalse.s IL_001b
IL_0013: ldloc.0
IL_0014: newobj System.Void System.IO.StreamReader::.ctor(System.IO.Stream)
IL_0019: br.s IL_001c
IL_001b: ldnull
IL_001c: stloc.1
IL_001d: ldloc.1
IL_001e: brtrue.s IL_0023
IL_0020: ldnull
IL_0021: br.s IL_0029
IL_0023: ldloc.1
IL_0024: callvirt System.String System.IO.TextReader::ReadToEnd()
IL_0029: dup
IL_002a: brtrue.s IL_0032
IL_002c: pop
IL_002d: ldstr "{}"
IL_0032: ldsfld System.Func`2<System.String,System.String> Runic.Localization.RunicText/<>O::<0>__ReadLanguage
IL_0037: dup
IL_0038: brtrue.s IL_004d
IL_003a: pop
IL_003b: ldnull
IL_003c: ldftn System.String Runic.Localization.RunicText::ReadLanguage(System.String)
IL_0042: newobj System.Void System.Func`2<System.String,System.String>::.ctor(System.Object,System.IntPtr)
IL_0047: dup
IL_0048: stsfld System.Func`2<System.String,System.String> Runic.Localization.RunicText/<>O::<0>__ReadLanguage
IL_004d: newobj System.Void Runic.Localization.LanguageCatalog::.ctor(System.String,System.Func`2<System.String,System.String>)
IL_0052: stloc.2
IL_0053: leave.s IL_0069
IL_0055: ldloc.1
IL_0056: brfalse.s IL_005e
IL_0058: ldloc.1
IL_0059: callvirt System.Void System.IDisposable::Dispose()
IL_005e: endfinally
IL_005f: ldloc.0
IL_0060: brfalse.s IL_0068
IL_0062: ldloc.0
IL_0063: callvirt System.Void System.IDisposable::Dispose()
IL_0068: endfinally
IL_0069: ldloc.2
IL_006a: ret
// EH Finally: 29 - 85 => 85 - 95
// EH Finally: 16 - 95 => 95 - 105

// System.String Runic.Localization.RunicText::ReadLanguage(System.String)
.locals System.String
IL_0000: ldsfld System.Reflection.Assembly Runic.Localization.RunicText::Owner
IL_0005: callvirt System.String System.Reflection.Assembly::get_Location()
IL_000a: call System.String System.IO.Path::GetDirectoryName(System.String)
IL_000f: ldstr "Translations"
IL_0014: ldsfld System.String Runic.Localization.RunicText::Module
IL_0019: call System.String System.IO.Path::Combine(System.String,System.String,System.String)
IL_001e: ldarg.0
IL_001f: ldstr ".json"
IL_0024: call System.String System.String::Concat(System.String,System.String)
IL_0029: call System.String System.IO.Path::Combine(System.String,System.String)
IL_002e: stloc.0
IL_002f: ldloc.0
IL_0030: call System.Boolean System.IO.File::Exists(System.String)
IL_0035: brtrue.s IL_0039
IL_0037: ldnull
IL_0038: ret
IL_0039: ldloc.0
IL_003a: call System.String System.IO.File::ReadAllText(System.String)
IL_003f: ret

// System.Void Runic.Localization.RunicText::SelectLanguage()
.locals System.String
IL_0000: ldstr "English"
IL_0005: stloc.0
IL_0006: call Localization Localization::get_instance()
IL_000b: dup
IL_000c: brtrue.s IL_0012
IL_000e: pop
IL_000f: ldnull
IL_0010: br.s IL_0017
IL_0012: call System.String Localization::GetSelectedLanguage()
IL_0017: dup
IL_0018: brtrue.s IL_0020
IL_001a: pop
IL_001b: ldstr "English"
IL_0020: stloc.0
IL_0021: leave.s IL_0026
IL_0023: pop
IL_0024: leave.s IL_0026
IL_0026: ldsfld Runic.Localization.LanguageCatalog Runic.Localization.RunicText::Catalog
IL_002b: ldloc.0
IL_002c: callvirt System.Void Runic.Localization.LanguageCatalog::Select(System.String)
IL_0031: ret
// EH Catch: 6 - 35 => 35 - 38

// System.String Runic.Localization.RunicText::Get(System.String)
.locals 
IL_0000: call System.Void Runic.Localization.RunicText::SelectLanguage()
IL_0005: ldsfld Runic.Localization.LanguageCatalog Runic.Localization.RunicText::Catalog
IL_000a: ldarg.0
IL_000b: callvirt System.String Runic.Localization.LanguageCatalog::Get(System.String)
IL_0010: ret

// System.String Runic.Localization.RunicText::English(System.String)
.locals 
IL_0000: ldsfld Runic.Localization.LanguageCatalog Runic.Localization.RunicText::Catalog
IL_0005: ldarg.0
IL_0006: callvirt System.String Runic.Localization.LanguageCatalog::English(System.String)
IL_000b: ret

// System.String Runic.Localization.RunicText::TranslateEnglish(System.String)
.locals 
IL_0000: call System.Void Runic.Localization.RunicText::SelectLanguage()
IL_0005: ldsfld Runic.Localization.LanguageCatalog Runic.Localization.RunicText::Catalog
IL_000a: ldarg.0
IL_000b: callvirt System.String Runic.Localization.LanguageCatalog::TranslateEnglish(System.String)
IL_0010: ret

// System.String Runic.Localization.RunicText::Format(System.String,System.Object[])
.locals 
IL_0000: call System.Void Runic.Localization.RunicText::SelectLanguage()
IL_0005: ldsfld Runic.Localization.LanguageCatalog Runic.Localization.RunicText::Catalog
IL_000a: ldarg.0
IL_000b: ldarg.1
IL_000c: callvirt System.String Runic.Localization.LanguageCatalog::Format(System.String,System.Object[])
IL_0011: ret

// System.Void Runic.Localization.RunicText::.cctor()
.locals 
IL_0000: ldtoken Runic.Localization.RunicText
IL_0005: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_000a: callvirt System.Reflection.Assembly System.Type::get_Assembly()
IL_000f: stsfld System.Reflection.Assembly Runic.Localization.RunicText::Owner
IL_0014: ldsfld System.Reflection.Assembly Runic.Localization.RunicText::Owner
IL_0019: callvirt System.Reflection.AssemblyName System.Reflection.Assembly::GetName()
IL_001e: callvirt System.String System.Reflection.AssemblyName::get_Name()
IL_0023: stsfld System.String Runic.Localization.RunicText::Module
IL_0028: call Runic.Localization.LanguageCatalog Runic.Localization.RunicText::Create()
IL_002d: stsfld Runic.Localization.LanguageCatalog Runic.Localization.RunicText::Catalog
IL_0032: ret

// System.Boolean RunicBuildCamera.CompatibilityGuard::TryFindHardConflict(System.String&)
.locals System.Boolean, System.Collections.Generic.Dictionary`2/Enumerator<System.String,BepInEx.PluginInfo>, System.Collections.Generic.KeyValuePair`2<System.String,BepInEx.PluginInfo>, System.String, System.Boolean, System.Reflection.Assembly[], System.Int32, System.Reflection.Assembly
IL_0000: ldarg.0
IL_0001: ldnull
IL_0002: stind.ref
IL_0003: call System.Collections.Generic.Dictionary`2<System.String,BepInEx.PluginInfo> BepInEx.Bootstrap.Chainloader::get_PluginInfos()
IL_0008: callvirt System.Collections.Generic.Dictionary`2/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2<System.String,BepInEx.PluginInfo>::GetEnumerator()
IL_000d: stloc.1
IL_000e: br IL_00b9
IL_0013: ldloca.s V_1
IL_0015: call System.Collections.Generic.KeyValuePair`2<!0,!1> System.Collections.Generic.Dictionary`2/Enumerator<System.String,BepInEx.PluginInfo>::get_Current()
IL_001a: stloc.2
IL_001b: ldloca.s V_2
IL_001d: call !1 System.Collections.Generic.KeyValuePair`2<System.String,BepInEx.PluginInfo>::get_Value()
IL_0022: dup
IL_0023: brtrue.s IL_0029
IL_0025: pop
IL_0026: ldnull
IL_0027: br.s IL_003a
IL_0029: call BepInEx.BepInPlugin BepInEx.PluginInfo::get_Metadata()
IL_002e: dup
IL_002f: brtrue.s IL_0035
IL_0031: pop
IL_0032: ldnull
IL_0033: br.s IL_003a
IL_0035: call System.String BepInEx.BepInPlugin::get_GUID()
IL_003a: ldloca.s V_2
IL_003c: call !1 System.Collections.Generic.KeyValuePair`2<System.String,BepInEx.PluginInfo>::get_Value()
IL_0041: dup
IL_0042: brtrue.s IL_0048
IL_0044: pop
IL_0045: ldnull
IL_0046: br.s IL_0059
IL_0048: call BepInEx.BepInPlugin BepInEx.PluginInfo::get_Metadata()
IL_004d: dup
IL_004e: brtrue.s IL_0054
IL_0050: pop
IL_0051: ldnull
IL_0052: br.s IL_0059
IL_0054: call System.String BepInEx.BepInPlugin::get_Name()
IL_0059: stloc.3
IL_005a: ldstr "Azumatt.BuildCameraCHE"
IL_005f: ldc.i4.5
IL_0060: call System.Boolean System.String::Equals(System.String,System.String,System.StringComparison)
IL_0065: brtrue.s IL_0083
IL_0067: ldloc.3
IL_0068: ldstr "BuildCameraCHE"
IL_006d: ldc.i4.5
IL_006e: call System.Boolean System.String::Equals(System.String,System.String,System.StringComparison)
IL_0073: brtrue.s IL_0083
IL_0075: ldloc.3
IL_0076: ldstr "Build Camera Custom Hammers Edition"
IL_007b: ldc.i4.5
IL_007c: call System.Boolean System.String::Equals(System.String,System.String,System.StringComparison)
IL_0081: brfalse.s IL_00b9
IL_0083: ldarg.0
IL_0084: ldstr "text_acac6a5e4a61"
IL_0089: ldc.i4.1
IL_008a: newarr System.Object
IL_008f: dup
IL_0090: ldc.i4.0
IL_0091: ldloc.3
IL_0092: dup
IL_0093: brtrue.s IL_009b
IL_0095: pop
IL_0096: ldstr "Azumatt.BuildCameraCHE"
IL_009b: stelem.ref
IL_009c: call System.String Runic.Localization.RunicText::Format(System.String,System.Object[])
IL_00a1: ldstr "text_ba927d542b6f"
IL_00a6: call System.String Runic.Localization.RunicText::Get(System.String)
IL_00ab: call System.String System.String::Concat(System.String,System.String)
IL_00b0: stind.ref
IL_00b1: ldc.i4.1
IL_00b2: stloc.s V_4
IL_00b4: leave IL_013e
IL_00b9: ldloca.s V_1
IL_00bb: call System.Boolean System.Collections.Generic.Dictionary`2/Enumerator<System.String,BepInEx.PluginInfo>::MoveNext()
IL_00c0: brtrue IL_0013
IL_00c5: leave.s IL_00d5
IL_00c7: ldloca.s V_1
IL_00c9: constrained. System.Collections.Generic.Dictionary`2/Enumerator<System.String,BepInEx.PluginInfo>
IL_00cf: callvirt System.Void System.IDisposable::Dispose()
IL_00d4: endfinally
IL_00d5: ldc.i4.0
IL_00d6: stloc.0
IL_00d7: call System.AppDomain System.AppDomain::get_CurrentDomain()
IL_00dc: callvirt System.Reflection.Assembly[] System.AppDomain::GetAssemblies()
IL_00e1: stloc.s V_5
IL_00e3: ldc.i4.0
IL_00e4: stloc.s V_6
IL_00e6: br.s IL_0114
IL_00e8: ldloc.s V_5
IL_00ea: ldloc.s V_6
IL_00ec: ldelem.ref
IL_00ed: stloc.s V_7
IL_00ef: ldloc.s V_7
IL_00f1: ldstr "Valheim_Build_Camera.Valheim_Build_CameraPlugin"
IL_00f6: ldc.i4.0
IL_00f7: ldc.i4.0
IL_00f8: callvirt System.Type System.Reflection.Assembly::GetType(System.String,System.Boolean,System.Boolean)
IL_00fd: ldnull
IL_00fe: call System.Boolean System.Type::op_Equality(System.Type,System.Type)
IL_0103: brfalse.s IL_0107
IL_0105: leave.s IL_010e
IL_0107: ldc.i4.1
IL_0108: stloc.0
IL_0109: leave.s IL_011c
IL_010b: pop
IL_010c: leave.s IL_010e
IL_010e: ldloc.s V_6
IL_0110: ldc.i4.1
IL_0111: add
IL_0112: stloc.s V_6
IL_0114: ldloc.s V_6
IL_0116: ldloc.s V_5
IL_0118: ldlen
IL_0119: conv.i4
IL_011a: blt.s IL_00e8
IL_011c: ldloc.0
IL_011d: brfalse.s IL_013c
IL_011f: ldarg.0
IL_0120: ldstr "text_a34f6de98a9a"
IL_0125: call System.String Runic.Localization.RunicText::Get(System.String)
IL_012a: ldstr "text_f57f78aa3dfa"
IL_012f: call System.String Runic.Localization.RunicText::Get(System.String)
IL_0134: call System.String System.String::Concat(System.String,System.String)
IL_0139: stind.ref
IL_013a: ldc.i4.1
IL_013b: ret
IL_013c: ldc.i4.0
IL_013d: ret
IL_013e: ldloc.s V_4
IL_0140: ret
// EH Finally: 14 - 199 => 199 - 213
// EH Catch: 239 - 267 => 267 - 270

// BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_Enabled()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::<Enabled>k__BackingField
IL_0005: ret

// System.Void RunicBuildCamera.BuildCameraConfig::set_Enabled(BepInEx.Configuration.ConfigEntry`1<System.Boolean>)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::<Enabled>k__BackingField
IL_0006: ret

// BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut> RunicBuildCamera.BuildCameraConfig::get_ToggleShortcut()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut> RunicBuildCamera.BuildCameraConfig::<ToggleShortcut>k__BackingField
IL_0005: ret

// System.Void RunicBuildCamera.BuildCameraConfig::set_ToggleShortcut(BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut>)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut> RunicBuildCamera.BuildCameraConfig::<ToggleShortcut>k__BackingField
IL_0006: ret

// BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_CameraRange()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::<CameraRange>k__BackingField
IL_0005: ret

// System.Void RunicBuildCamera.BuildCameraConfig::set_CameraRange(BepInEx.Configuration.ConfigEntry`1<System.Single>)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::<CameraRange>k__BackingField
IL_0006: ret

// BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_MoveSpeed()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::<MoveSpeed>k__BackingField
IL_0005: ret

// System.Void RunicBuildCamera.BuildCameraConfig::set_MoveSpeed(BepInEx.Configuration.ConfigEntry`1<System.Single>)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::<MoveSpeed>k__BackingField
IL_0006: ret

// BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_FastMoveMultiplier()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::<FastMoveMultiplier>k__BackingField
IL_0005: ret

// System.Void RunicBuildCamera.BuildCameraConfig::set_FastMoveMultiplier(BepInEx.Configuration.ConfigEntry`1<System.Single>)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::<FastMoveMultiplier>k__BackingField
IL_0006: ret

// BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_WorldRelativeMovement()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::<WorldRelativeMovement>k__BackingField
IL_0005: ret

// System.Void RunicBuildCamera.BuildCameraConfig::set_WorldRelativeMovement(BepInEx.Configuration.ConfigEntry`1<System.Boolean>)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::<WorldRelativeMovement>k__BackingField
IL_0006: ret

// BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_RemoteActionDistance()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::<RemoteActionDistance>k__BackingField
IL_0005: ret

// System.Void RunicBuildCamera.BuildCameraConfig::set_RemoteActionDistance(BepInEx.Configuration.ConfigEntry`1<System.Single>)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::<RemoteActionDistance>k__BackingField
IL_0006: ret

// BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_PickupEnabled()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::<PickupEnabled>k__BackingField
IL_0005: ret

// System.Void RunicBuildCamera.BuildCameraConfig::set_PickupEnabled(BepInEx.Configuration.ConfigEntry`1<System.Boolean>)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::<PickupEnabled>k__BackingField
IL_0006: ret

// BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_PickupRange()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::<PickupRange>k__BackingField
IL_0005: ret

// System.Void RunicBuildCamera.BuildCameraConfig::set_PickupRange(BepInEx.Configuration.ConfigEntry`1<System.Single>)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::<PickupRange>k__BackingField
IL_0006: ret

// BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_PickupIntervalSeconds()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::<PickupIntervalSeconds>k__BackingField
IL_0005: ret

// System.Void RunicBuildCamera.BuildCameraConfig::set_PickupIntervalSeconds(BepInEx.Configuration.ConfigEntry`1<System.Single>)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::<PickupIntervalSeconds>k__BackingField
IL_0006: ret

// BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_DemisterFollowCamera()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::<DemisterFollowCamera>k__BackingField
IL_0005: ret

// System.Void RunicBuildCamera.BuildCameraConfig::set_DemisterFollowCamera(BepInEx.Configuration.ConfigEntry`1<System.Boolean>)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::<DemisterFollowCamera>k__BackingField
IL_0006: ret

// BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_DemisterRangeMultiplier()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::<DemisterRangeMultiplier>k__BackingField
IL_0005: ret

// System.Void RunicBuildCamera.BuildCameraConfig::set_DemisterRangeMultiplier(BepInEx.Configuration.ConfigEntry`1<System.Single>)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::<DemisterRangeMultiplier>k__BackingField
IL_0006: ret

// BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_InvertMouseHorizontal()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::<InvertMouseHorizontal>k__BackingField
IL_0005: ret

// System.Void RunicBuildCamera.BuildCameraConfig::set_InvertMouseHorizontal(BepInEx.Configuration.ConfigEntry`1<System.Boolean>)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::<InvertMouseHorizontal>k__BackingField
IL_0006: ret

// BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_InvertMouseVertical()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::<InvertMouseVertical>k__BackingField
IL_0005: ret

// System.Void RunicBuildCamera.BuildCameraConfig::set_InvertMouseVertical(BepInEx.Configuration.ConfigEntry`1<System.Boolean>)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::<InvertMouseVertical>k__BackingField
IL_0006: ret

// BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_InvertControllerHorizontal()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::<InvertControllerHorizontal>k__BackingField
IL_0005: ret

// System.Void RunicBuildCamera.BuildCameraConfig::set_InvertControllerHorizontal(BepInEx.Configuration.ConfigEntry`1<System.Boolean>)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::<InvertControllerHorizontal>k__BackingField
IL_0006: ret

// BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_InvertControllerVertical()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::<InvertControllerVertical>k__BackingField
IL_0005: ret

// System.Void RunicBuildCamera.BuildCameraConfig::set_InvertControllerVertical(BepInEx.Configuration.ConfigEntry`1<System.Boolean>)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::<InvertControllerVertical>k__BackingField
IL_0006: ret

// BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_VerboseLogging()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::<VerboseLogging>k__BackingField
IL_0005: ret

// System.Void RunicBuildCamera.BuildCameraConfig::set_VerboseLogging(BepInEx.Configuration.ConfigEntry`1<System.Boolean>)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::<VerboseLogging>k__BackingField
IL_0006: ret

// System.Void RunicBuildCamera.BuildCameraConfig::add_Changed(System.Action)
.locals System.Action, System.Action, System.Action
IL_0000: ldsfld System.Action RunicBuildCamera.BuildCameraConfig::Changed
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: stloc.1
IL_0008: ldloc.1
IL_0009: ldarg.0
IL_000a: call System.Delegate System.Delegate::Combine(System.Delegate,System.Delegate)
IL_000f: castclass System.Action
IL_0014: stloc.2
IL_0015: ldsflda System.Action RunicBuildCamera.BuildCameraConfig::Changed
IL_001a: ldloc.2
IL_001b: ldloc.1
IL_001c: call !!0 System.Threading.Interlocked::CompareExchange<System.Action>(!!0&,!!0,!!0)
IL_0021: stloc.0
IL_0022: ldloc.0
IL_0023: ldloc.1
IL_0024: bne.un.s IL_0006
IL_0026: ret

// System.Void RunicBuildCamera.BuildCameraConfig::remove_Changed(System.Action)
.locals System.Action, System.Action, System.Action
IL_0000: ldsfld System.Action RunicBuildCamera.BuildCameraConfig::Changed
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: stloc.1
IL_0008: ldloc.1
IL_0009: ldarg.0
IL_000a: call System.Delegate System.Delegate::Remove(System.Delegate,System.Delegate)
IL_000f: castclass System.Action
IL_0014: stloc.2
IL_0015: ldsflda System.Action RunicBuildCamera.BuildCameraConfig::Changed
IL_001a: ldloc.2
IL_001b: ldloc.1
IL_001c: call !!0 System.Threading.Interlocked::CompareExchange<System.Action>(!!0&,!!0,!!0)
IL_0021: stloc.0
IL_0022: ldloc.0
IL_0023: ldloc.1
IL_0024: bne.un.s IL_0006
IL_0026: ret

// System.Void RunicBuildCamera.BuildCameraConfig::Bind(BepInEx.Configuration.ConfigFile)
.locals 
IL_0000: ldarg.0
IL_0001: brtrue.s IL_000e
IL_0003: ldstr "config"
IL_0008: newobj System.Void System.ArgumentNullException::.ctor(System.String)
IL_000d: throw
IL_000e: call System.Void RunicBuildCamera.BuildCameraConfig::UnhookChanges()
IL_0013: ldarg.0
IL_0014: ldstr "General"
IL_0019: ldstr "Enabled"
IL_001e: ldc.i4.1
IL_001f: ldstr "text_0a6ae8b067ca"
IL_0024: call System.String Runic.Localization.RunicText::Get(System.String)
IL_0029: call BepInEx.Configuration.ConfigEntry`1<T> RunicBuildCamera.BuildCameraConfig::BindEntry<System.Boolean>(BepInEx.Configuration.ConfigFile,System.String,System.String,T,System.String)
IL_002e: call System.Void RunicBuildCamera.BuildCameraConfig::set_Enabled(BepInEx.Configuration.ConfigEntry`1<System.Boolean>)
IL_0033: ldarg.0
IL_0034: ldstr "Controls"
IL_0039: ldstr "ToggleShortcut"
IL_003e: ldc.i4.s 98
IL_0040: call !!0[] System.Array::Empty<UnityEngine.KeyCode>()
IL_0045: newobj System.Void BepInEx.Configuration.KeyboardShortcut::.ctor(UnityEngine.KeyCode,UnityEngine.KeyCode[])
IL_004a: ldstr "text_79be68bc27a1"
IL_004f: call System.String Runic.Localization.RunicText::Get(System.String)
IL_0054: call BepInEx.Configuration.ConfigEntry`1<T> RunicBuildCamera.BuildCameraConfig::BindEntry<BepInEx.Configuration.KeyboardShortcut>(BepInEx.Configuration.ConfigFile,System.String,System.String,T,System.String)
IL_0059: call System.Void RunicBuildCamera.BuildCameraConfig::set_ToggleShortcut(BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut>)
IL_005e: ldarg.0
IL_005f: ldstr "Camera"
IL_0064: ldstr "CameraRange"
IL_0069: ldc.r4 60
IL_006e: ldc.r4 1
IL_0073: ldc.r4 100
IL_0078: ldstr "text_1c9f371d5f2c"
IL_007d: call System.String Runic.Localization.RunicText::Get(System.String)
IL_0082: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::BindRange(BepInEx.Configuration.ConfigFile,System.String,System.String,System.Single,System.Single,System.Single,System.String)
IL_0087: call System.Void RunicBuildCamera.BuildCameraConfig::set_CameraRange(BepInEx.Configuration.ConfigEntry`1<System.Single>)
IL_008c: ldarg.0
IL_008d: ldstr "Camera"
IL_0092: ldstr "MoveSpeed"
IL_0097: ldc.r4 10
IL_009c: ldc.r4 0.5
IL_00a1: ldc.r4 50
IL_00a6: ldstr "text_09f482d754a0"
IL_00ab: call System.String Runic.Localization.RunicText::Get(System.String)
IL_00b0: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::BindRange(BepInEx.Configuration.ConfigFile,System.String,System.String,System.Single,System.Single,System.Single,System.String)
IL_00b5: call System.Void RunicBuildCamera.BuildCameraConfig::set_MoveSpeed(BepInEx.Configuration.ConfigEntry`1<System.Single>)
IL_00ba: ldarg.0
IL_00bb: ldstr "Camera"
IL_00c0: ldstr "FastMoveMultiplier"
IL_00c5: ldc.r4 3
IL_00ca: ldc.r4 1
IL_00cf: ldc.r4 10
IL_00d4: ldstr "text_9abaa67ab9eb"
IL_00d9: call System.String Runic.Localization.RunicText::Get(System.String)
IL_00de: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::BindRange(BepInEx.Configuration.ConfigFile,System.String,System.String,System.Single,System.Single,System.Single,System.String)
IL_00e3: call System.Void RunicBuildCamera.BuildCameraConfig::set_FastMoveMultiplier(BepInEx.Configuration.ConfigEntry`1<System.Single>)
IL_00e8: ldarg.0
IL_00e9: ldstr "Camera"
IL_00ee: ldstr "WorldRelativeMovement"
IL_00f3: ldc.i4.0
IL_00f4: ldstr "text_fdca2a2cae5e"
IL_00f9: call System.String Runic.Localization.RunicText::Get(System.String)
IL_00fe: call BepInEx.Configuration.ConfigEntry`1<T> RunicBuildCamera.BuildCameraConfig::BindEntry<System.Boolean>(BepInEx.Configuration.ConfigFile,System.String,System.String,T,System.String)
IL_0103: call System.Void RunicBuildCamera.BuildCameraConfig::set_WorldRelativeMovement(BepInEx.Configuration.ConfigEntry`1<System.Boolean>)
IL_0108: ldarg.0
IL_0109: ldstr "Remote Actions"
IL_010e: ldstr "RemoteActionDistance"
IL_0113: ldc.r4 100
IL_0118: ldc.r4 1
IL_011d: ldc.r4 100
IL_0122: ldstr "text_5cdd426faf6d"
IL_0127: call System.String Runic.Localization.RunicText::Get(System.String)
IL_012c: ldstr "text_d77fc99e1978"
IL_0131: call System.String Runic.Localization.RunicText::Get(System.String)
IL_0136: ldstr "text_015eb096e1ec"
IL_013b: call System.String Runic.Localization.RunicText::Get(System.String)
IL_0140: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0145: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::BindRange(BepInEx.Configuration.ConfigFile,System.String,System.String,System.Single,System.Single,System.Single,System.String)
IL_014a: call System.Void RunicBuildCamera.BuildCameraConfig::set_RemoteActionDistance(BepInEx.Configuration.ConfigEntry`1<System.Single>)
IL_014f: ldarg.0
IL_0150: ldstr "Pickup"
IL_0155: ldstr "PickupEnabled"
IL_015a: ldc.i4.1
IL_015b: ldstr "text_7e340344c138"
IL_0160: call System.String Runic.Localization.RunicText::Get(System.String)
IL_0165: call BepInEx.Configuration.ConfigEntry`1<T> RunicBuildCamera.BuildCameraConfig::BindEntry<System.Boolean>(BepInEx.Configuration.ConfigFile,System.String,System.String,T,System.String)
IL_016a: call System.Void RunicBuildCamera.BuildCameraConfig::set_PickupEnabled(BepInEx.Configuration.ConfigEntry`1<System.Boolean>)
IL_016f: ldarg.0
IL_0170: ldstr "Pickup"
IL_0175: ldstr "PickupRange"
IL_017a: ldc.r4 10
IL_017f: ldc.r4 1
IL_0184: ldc.r4 50
IL_0189: ldstr "text_1503c4d0efb2"
IL_018e: call System.String Runic.Localization.RunicText::Get(System.String)
IL_0193: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::BindRange(BepInEx.Configuration.ConfigFile,System.String,System.String,System.Single,System.Single,System.Single,System.String)
IL_0198: call System.Void RunicBuildCamera.BuildCameraConfig::set_PickupRange(BepInEx.Configuration.ConfigEntry`1<System.Single>)
IL_019d: ldarg.0
IL_019e: ldstr "Pickup"
IL_01a3: ldstr "PickupIntervalSeconds"
IL_01a8: ldc.r4 0.25
IL_01ad: ldc.r4 0.05
IL_01b2: ldc.r4 2
IL_01b7: ldstr "text_6ac387048534"
IL_01bc: call System.String Runic.Localization.RunicText::Get(System.String)
IL_01c1: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::BindRange(BepInEx.Configuration.ConfigFile,System.String,System.String,System.Single,System.Single,System.Single,System.String)
IL_01c6: call System.Void RunicBuildCamera.BuildCameraConfig::set_PickupIntervalSeconds(BepInEx.Configuration.ConfigEntry`1<System.Single>)
IL_01cb: ldarg.0
IL_01cc: ldstr "Mist"
IL_01d1: ldstr "DemisterFollowCamera"
IL_01d6: ldc.i4.1
IL_01d7: ldstr "text_2fbfdd579ce5"
IL_01dc: call System.String Runic.Localization.RunicText::Get(System.String)
IL_01e1: call BepInEx.Configuration.ConfigEntry`1<T> RunicBuildCamera.BuildCameraConfig::BindEntry<System.Boolean>(BepInEx.Configuration.ConfigFile,System.String,System.String,T,System.String)
IL_01e6: call System.Void RunicBuildCamera.BuildCameraConfig::set_DemisterFollowCamera(BepInEx.Configuration.ConfigEntry`1<System.Boolean>)
IL_01eb: ldarg.0
IL_01ec: ldstr "Mist"
IL_01f1: ldstr "DemisterRangeMultiplier"
IL_01f6: ldc.r4 2
IL_01fb: ldc.r4 0.25
IL_0200: ldc.r4 5
IL_0205: ldstr "text_32c6dc7938c7"
IL_020a: call System.String Runic.Localization.RunicText::Get(System.String)
IL_020f: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::BindRange(BepInEx.Configuration.ConfigFile,System.String,System.String,System.Single,System.Single,System.Single,System.String)
IL_0214: call System.Void RunicBuildCamera.BuildCameraConfig::set_DemisterRangeMultiplier(BepInEx.Configuration.ConfigEntry`1<System.Single>)
IL_0219: ldarg.0
IL_021a: ldstr "Controls"
IL_021f: ldstr "InvertMouseHorizontal"
IL_0224: ldc.i4.0
IL_0225: ldstr "text_c3b035822ef5"
IL_022a: call System.String Runic.Localization.RunicText::Get(System.String)
IL_022f: call BepInEx.Configuration.ConfigEntry`1<T> RunicBuildCamera.BuildCameraConfig::BindEntry<System.Boolean>(BepInEx.Configuration.ConfigFile,System.String,System.String,T,System.String)
IL_0234: call System.Void RunicBuildCamera.BuildCameraConfig::set_InvertMouseHorizontal(BepInEx.Configuration.ConfigEntry`1<System.Boolean>)
IL_0239: ldarg.0
IL_023a: ldstr "Controls"
IL_023f: ldstr "InvertMouseVertical"
IL_0244: ldc.i4.0
IL_0245: ldstr "text_41f4b367f85b"
IL_024a: call System.String Runic.Localization.RunicText::Get(System.String)
IL_024f: call BepInEx.Configuration.ConfigEntry`1<T> RunicBuildCamera.BuildCameraConfig::BindEntry<System.Boolean>(BepInEx.Configuration.ConfigFile,System.String,System.String,T,System.String)
IL_0254: call System.Void RunicBuildCamera.BuildCameraConfig::set_InvertMouseVertical(BepInEx.Configuration.ConfigEntry`1<System.Boolean>)
IL_0259: ldarg.0
IL_025a: ldstr "Controls"
IL_025f: ldstr "InvertControllerHorizontal"
IL_0264: ldc.i4.0
IL_0265: ldstr "text_f3622ea95b67"
IL_026a: call System.String Runic.Localization.RunicText::Get(System.String)
IL_026f: call BepInEx.Configuration.ConfigEntry`1<T> RunicBuildCamera.BuildCameraConfig::BindEntry<System.Boolean>(BepInEx.Configuration.ConfigFile,System.String,System.String,T,System.String)
IL_0274: call System.Void RunicBuildCamera.BuildCameraConfig::set_InvertControllerHorizontal(BepInEx.Configuration.ConfigEntry`1<System.Boolean>)
IL_0279: ldarg.0
IL_027a: ldstr "Controls"
IL_027f: ldstr "InvertControllerVertical"
IL_0284: ldc.i4.0
IL_0285: ldstr "text_908b56428063"
IL_028a: call System.String Runic.Localization.RunicText::Get(System.String)
IL_028f: call BepInEx.Configuration.ConfigEntry`1<T> RunicBuildCamera.BuildCameraConfig::BindEntry<System.Boolean>(BepInEx.Configuration.ConfigFile,System.String,System.String,T,System.String)
IL_0294: call System.Void RunicBuildCamera.BuildCameraConfig::set_InvertControllerVertical(BepInEx.Configuration.ConfigEntry`1<System.Boolean>)
IL_0299: ldarg.0
IL_029a: ldstr "Diagnostics"
IL_029f: ldstr "VerboseLogging"
IL_02a4: ldc.i4.0
IL_02a5: ldstr "text_2b4b917a0f25"
IL_02aa: call System.String Runic.Localization.RunicText::Get(System.String)
IL_02af: call BepInEx.Configuration.ConfigEntry`1<T> RunicBuildCamera.BuildCameraConfig::BindEntry<System.Boolean>(BepInEx.Configuration.ConfigFile,System.String,System.String,T,System.String)
IL_02b4: call System.Void RunicBuildCamera.BuildCameraConfig::set_VerboseLogging(BepInEx.Configuration.ConfigEntry`1<System.Boolean>)
IL_02b9: ret

// BepInEx.Configuration.ConfigEntry`1<T> RunicBuildCamera.BuildCameraConfig::BindEntry(BepInEx.Configuration.ConfigFile,System.String,System.String,T,System.String)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: ldarg.2
IL_0003: ldarg.3
IL_0004: ldarg.s description
IL_0006: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<T>(System.String,System.String,!!0,System.String)
IL_000b: dup
IL_000c: call System.Void RunicBuildCamera.BuildCameraConfig::HookChange<T>(BepInEx.Configuration.ConfigEntry`1<T>)
IL_0011: ret

// BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::BindRange(BepInEx.Configuration.ConfigFile,System.String,System.String,System.Single,System.Single,System.Single,System.String)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: ldarg.2
IL_0003: ldarg.3
IL_0004: ldarg.s description
IL_0006: ldarg.s minimum
IL_0008: ldarg.s maximum
IL_000a: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Single>::.ctor(!0,!0)
IL_000f: call !!0[] System.Array::Empty<System.Object>()
IL_0014: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0019: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_001e: dup
IL_001f: call System.Void RunicBuildCamera.BuildCameraConfig::HookChange<System.Single>(BepInEx.Configuration.ConfigEntry`1<T>)
IL_0024: ret

// System.Void RunicBuildCamera.BuildCameraConfig::HookChange(BepInEx.Configuration.ConfigEntry`1<T>)
.locals RunicBuildCamera.BuildCameraConfig/<>c__DisplayClass80_0`1<T>
IL_0000: newobj System.Void RunicBuildCamera.BuildCameraConfig/<>c__DisplayClass80_0`1<T>::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldarg.0
IL_0008: stfld BepInEx.Configuration.ConfigEntry`1<T> RunicBuildCamera.BuildCameraConfig/<>c__DisplayClass80_0`1<T>::entry
IL_000d: ldloc.0
IL_000e: ldfld BepInEx.Configuration.ConfigEntry`1<T> RunicBuildCamera.BuildCameraConfig/<>c__DisplayClass80_0`1<T>::entry
IL_0013: ldsfld System.EventHandler RunicBuildCamera.BuildCameraConfig/<>O::<0>__OnSettingChanged
IL_0018: dup
IL_0019: brtrue.s IL_002e
IL_001b: pop
IL_001c: ldnull
IL_001d: ldftn System.Void RunicBuildCamera.BuildCameraConfig::OnSettingChanged(System.Object,System.EventArgs)
IL_0023: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_0028: dup
IL_0029: stsfld System.EventHandler RunicBuildCamera.BuildCameraConfig/<>O::<0>__OnSettingChanged
IL_002e: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<T>::add_SettingChanged(System.EventHandler)
IL_0033: ldsfld System.Collections.Generic.List`1<System.Action> RunicBuildCamera.BuildCameraConfig::UnsubscribeActions
IL_0038: ldloc.0
IL_0039: ldftn System.Void RunicBuildCamera.BuildCameraConfig/<>c__DisplayClass80_0`1<T>::<HookChange>b__0()
IL_003f: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_0044: callvirt System.Void System.Collections.Generic.List`1<System.Action>::Add(!0)
IL_0049: ret

// System.Void RunicBuildCamera.BuildCameraConfig::UnhookChanges()
.locals System.Collections.Generic.List`1/Enumerator<System.Action>
IL_0000: ldsfld System.Collections.Generic.List`1<System.Action> RunicBuildCamera.BuildCameraConfig::UnsubscribeActions
IL_0005: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.Action>::GetEnumerator()
IL_000a: stloc.0
IL_000b: br.s IL_0019
IL_000d: ldloca.s V_0
IL_000f: call !0 System.Collections.Generic.List`1/Enumerator<System.Action>::get_Current()
IL_0014: callvirt System.Void System.Action::Invoke()
IL_0019: ldloca.s V_0
IL_001b: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.Action>::MoveNext()
IL_0020: brtrue.s IL_000d
IL_0022: leave.s IL_0032
IL_0024: ldloca.s V_0
IL_0026: constrained. System.Collections.Generic.List`1/Enumerator<System.Action>
IL_002c: callvirt System.Void System.IDisposable::Dispose()
IL_0031: endfinally
IL_0032: ldsfld System.Collections.Generic.List`1<System.Action> RunicBuildCamera.BuildCameraConfig::UnsubscribeActions
IL_0037: callvirt System.Void System.Collections.Generic.List`1<System.Action>::Clear()
IL_003c: ret
// EH Finally: 11 - 36 => 36 - 50

// System.Void RunicBuildCamera.BuildCameraConfig::OnSettingChanged(System.Object,System.EventArgs)
.locals 
IL_0000: ldsfld System.Action RunicBuildCamera.BuildCameraConfig::Changed
IL_0005: dup
IL_0006: brtrue.s IL_000a
IL_0008: pop
IL_0009: ret
IL_000a: callvirt System.Void System.Action::Invoke()
IL_000f: ret

// System.Void RunicBuildCamera.BuildCameraConfig::.cctor()
.locals 
IL_0000: newobj System.Void System.Collections.Generic.List`1<System.Action>::.ctor()
IL_0005: stsfld System.Collections.Generic.List`1<System.Action> RunicBuildCamera.BuildCameraConfig::UnsubscribeActions
IL_000a: ret

// System.Void RunicBuildCamera.BuildCameraConfig/<>c__DisplayClass80_0`1::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void RunicBuildCamera.BuildCameraConfig/<>c__DisplayClass80_0`1::<HookChange>b__0()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld BepInEx.Configuration.ConfigEntry`1<T> RunicBuildCamera.BuildCameraConfig/<>c__DisplayClass80_0`1<T>::entry
IL_0006: ldsfld System.EventHandler RunicBuildCamera.BuildCameraConfig/<>O::<0>__OnSettingChanged
IL_000b: dup
IL_000c: brtrue.s IL_0021
IL_000e: pop
IL_000f: ldnull
IL_0010: ldftn System.Void RunicBuildCamera.BuildCameraConfig::OnSettingChanged(System.Object,System.EventArgs)
IL_0016: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_001b: dup
IL_001c: stsfld System.EventHandler RunicBuildCamera.BuildCameraConfig/<>O::<0>__OnSettingChanged
IL_0021: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<T>::remove_SettingChanged(System.EventHandler)
IL_0026: ret

// System.Boolean RunicBuildCamera.Diagnostics::get_IsInitialized()
.locals 
IL_0000: ldsfld BepInEx.Logging.ManualLogSource RunicBuildCamera.Diagnostics::_log
IL_0005: ldnull
IL_0006: cgt.un
IL_0008: ret

// System.Void RunicBuildCamera.Diagnostics::Initialize(BepInEx.Logging.ManualLogSource)
.locals 
IL_0000: ldarg.0
IL_0001: dup
IL_0002: brtrue.s IL_0010
IL_0004: pop
IL_0005: ldstr "log"
IL_000a: newobj System.Void System.ArgumentNullException::.ctor(System.String)
IL_000f: throw
IL_0010: stsfld BepInEx.Logging.ManualLogSource RunicBuildCamera.Diagnostics::_log
IL_0015: ret

// System.Void RunicBuildCamera.Diagnostics::Verbose(System.String)
.locals 
IL_0000: call BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_VerboseLogging()
IL_0005: brfalse.s IL_0023
IL_0007: call BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_VerboseLogging()
IL_000c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0011: brfalse.s IL_0023
IL_0013: ldsfld BepInEx.Logging.ManualLogSource RunicBuildCamera.Diagnostics::_log
IL_0018: dup
IL_0019: brtrue.s IL_001d
IL_001b: pop
IL_001c: ret
IL_001d: ldarg.0
IL_001e: call System.Void BepInEx.Logging.ManualLogSource::LogInfo(System.Object)
IL_0023: ret

// System.Void RunicBuildCamera.Diagnostics::Debug(System.String)
.locals 
IL_0000: call BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_VerboseLogging()
IL_0005: brfalse.s IL_0023
IL_0007: call BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_VerboseLogging()
IL_000c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0011: brfalse.s IL_0023
IL_0013: ldsfld BepInEx.Logging.ManualLogSource RunicBuildCamera.Diagnostics::_log
IL_0018: dup
IL_0019: brtrue.s IL_001d
IL_001b: pop
IL_001c: ret
IL_001d: ldarg.0
IL_001e: call System.Void BepInEx.Logging.ManualLogSource::LogDebug(System.Object)
IL_0023: ret

// System.Void RunicBuildCamera.Diagnostics::Info(System.String)
.locals 
IL_0000: ldsfld BepInEx.Logging.ManualLogSource RunicBuildCamera.Diagnostics::_log
IL_0005: dup
IL_0006: brtrue.s IL_000a
IL_0008: pop
IL_0009: ret
IL_000a: ldarg.0
IL_000b: call System.Void BepInEx.Logging.ManualLogSource::LogInfo(System.Object)
IL_0010: ret

// System.Void RunicBuildCamera.Diagnostics::Warn(System.String)
.locals 
IL_0000: ldsfld BepInEx.Logging.ManualLogSource RunicBuildCamera.Diagnostics::_log
IL_0005: dup
IL_0006: brtrue.s IL_000a
IL_0008: pop
IL_0009: ret
IL_000a: ldarg.0
IL_000b: call System.Void BepInEx.Logging.ManualLogSource::LogWarning(System.Object)
IL_0010: ret

// System.Void RunicBuildCamera.Diagnostics::Error(System.String)
.locals 
IL_0000: ldsfld BepInEx.Logging.ManualLogSource RunicBuildCamera.Diagnostics::_log
IL_0005: dup
IL_0006: brtrue.s IL_000a
IL_0008: pop
IL_0009: ret
IL_000a: ldarg.0
IL_000b: call System.Void BepInEx.Logging.ManualLogSource::LogError(System.Object)
IL_0010: ret

// System.Void RunicBuildCamera.Diagnostics::Error(System.Exception,System.String)
.locals 
IL_0000: ldarg.0
IL_0001: brtrue.s IL_000a
IL_0003: ldarg.1
IL_0004: call System.Void RunicBuildCamera.Diagnostics::Error(System.String)
IL_0009: ret
IL_000a: ldsfld BepInEx.Logging.ManualLogSource RunicBuildCamera.Diagnostics::_log
IL_000f: dup
IL_0010: brtrue.s IL_0014
IL_0012: pop
IL_0013: ret
IL_0014: ldarg.1
IL_0015: call System.String System.Environment::get_NewLine()
IL_001a: ldarg.0
IL_001b: dup
IL_001c: brtrue.s IL_0022
IL_001e: pop
IL_001f: ldnull
IL_0020: br.s IL_0027
IL_0022: callvirt System.String System.Object::ToString()
IL_0027: call System.String System.String::Concat(System.String,System.String,System.String)
IL_002c: call System.Void BepInEx.Logging.ManualLogSource::LogError(System.Object)
IL_0031: ret

// System.Void RunicBuildCamera.Plugin::Awake()
.locals System.String, System.String
IL_0000: ldarg.0
IL_0001: call BepInEx.Logging.ManualLogSource BepInEx.BaseUnityPlugin::get_Logger()
IL_0006: call System.Void RunicBuildCamera.Diagnostics::Initialize(BepInEx.Logging.ManualLogSource)
IL_000b: ldarg.0
IL_000c: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0011: call System.Void RunicBuildCamera.BuildCameraConfig::Bind(BepInEx.Configuration.ConfigFile)
IL_0016: ldarg.0
IL_0017: ldftn System.Void RunicBuildCamera.Plugin::OnConfigurationChanged()
IL_001d: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_0022: call System.Void RunicBuildCamera.BuildCameraConfig::add_Changed(System.Action)
IL_0027: ldloca.s V_0
IL_0029: call System.Boolean RunicBuildCamera.CompatibilityGuard::TryFindHardConflict(System.String&)
IL_002e: brfalse.s IL_0042
IL_0030: ldloc.0
IL_0031: call System.Void RunicBuildCamera.Diagnostics::Warn(System.String)
IL_0036: ldstr "Runic Build Camera v1.0.8 loaded with its camera disabled."
IL_003b: call System.Void RunicBuildCamera.Diagnostics::Info(System.String)
IL_0040: leave.s IL_00b6
IL_0042: ldloca.s V_1
IL_0044: call System.Boolean RunicBuildCamera.Integration.ValheimAdapter::Initialize(System.String&)
IL_0049: brtrue.s IL_005d
IL_004b: ldloc.1
IL_004c: call System.Void RunicBuildCamera.Diagnostics::Error(System.String)
IL_0051: ldstr "Runic Build Camera v1.0.8 loaded with its camera disabled."
IL_0056: call System.Void RunicBuildCamera.Diagnostics::Info(System.String)
IL_005b: leave.s IL_00b6
IL_005d: ldarg.0
IL_005e: ldstr "chazman.RunicBuildCamera"
IL_0063: newobj System.Void HarmonyLib.Harmony::.ctor(System.String)
IL_0068: stfld HarmonyLib.Harmony RunicBuildCamera.Plugin::_harmony
IL_006d: ldarg.0
IL_006e: ldfld HarmonyLib.Harmony RunicBuildCamera.Plugin::_harmony
IL_0073: ldtoken RunicBuildCamera.Plugin
IL_0078: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_007d: callvirt System.Reflection.Assembly System.Type::get_Assembly()
IL_0082: callvirt System.Void HarmonyLib.Harmony::PatchAll(System.Reflection.Assembly)
IL_0087: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::Initialize()
IL_008c: ldarg.0
IL_008d: ldc.i4.1
IL_008e: stfld System.Boolean RunicBuildCamera.Plugin::_runtimeReady
IL_0093: ldstr "Runic Build Camera v1.0.8 ready. Precision Build Tool remains an independent plugin and is not required."
IL_0098: call System.Void RunicBuildCamera.Diagnostics::Info(System.String)
IL_009d: leave.s IL_00b6
IL_009f: ldstr "text_8ea2ea6caed3"
IL_00a4: call System.String Runic.Localization.RunicText::Get(System.String)
IL_00a9: call System.Void RunicBuildCamera.Diagnostics::Error(System.Exception,System.String)
IL_00ae: ldarg.0
IL_00af: call System.Void RunicBuildCamera.Plugin::DisableRuntime()
IL_00b4: leave.s IL_00b6
IL_00b6: ret
// EH Catch: 39 - 159 => 159 - 182

// System.Void RunicBuildCamera.Plugin::Update()
.locals System.Exception
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean RunicBuildCamera.Plugin::_runtimeReady
IL_0006: brtrue.s IL_0009
IL_0008: ret
IL_0009: nop
IL_000a: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::Tick()
IL_000f: leave.s IL_0044
IL_0011: stloc.0
IL_0012: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::ForceStop()
IL_0017: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::Reset()
IL_001c: call System.Void RunicBuildCamera.Integration.DemisterRuntime::OnCameraExit()
IL_0021: ldarg.0
IL_0022: ldfld System.Boolean RunicBuildCamera.Plugin::_runtimeFailureReported
IL_0027: brfalse.s IL_002b
IL_0029: leave.s IL_0044
IL_002b: ldarg.0
IL_002c: ldc.i4.1
IL_002d: stfld System.Boolean RunicBuildCamera.Plugin::_runtimeFailureReported
IL_0032: ldloc.0
IL_0033: ldstr "text_2f17ce857460"
IL_0038: call System.String Runic.Localization.RunicText::Get(System.String)
IL_003d: call System.Void RunicBuildCamera.Diagnostics::Error(System.Exception,System.String)
IL_0042: leave.s IL_0044
IL_0044: ret
// EH Catch: 10 - 17 => 17 - 68

// System.Void RunicBuildCamera.Plugin::OnApplicationFocus(System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean RunicBuildCamera.Plugin::_runtimeReady
IL_0006: brtrue.s IL_0009
IL_0008: ret
IL_0009: ldarg.1
IL_000a: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::OnApplicationFocus(System.Boolean)
IL_000f: ldarg.1
IL_0010: brfalse.s IL_0013
IL_0012: ret
IL_0013: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::Reset()
IL_0018: call System.Void RunicBuildCamera.Integration.DemisterRuntime::OnCameraExit()
IL_001d: ret

// System.Void RunicBuildCamera.Plugin::OnConfigurationChanged()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean RunicBuildCamera.Plugin::_runtimeReady
IL_0006: brtrue.s IL_0009
IL_0008: ret
IL_0009: nop
IL_000a: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::OnConfigurationChanged()
IL_000f: leave.s IL_0027
IL_0011: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::ForceStop()
IL_0016: ldstr "text_888408df9d8b"
IL_001b: call System.String Runic.Localization.RunicText::Get(System.String)
IL_0020: call System.Void RunicBuildCamera.Diagnostics::Error(System.Exception,System.String)
IL_0025: leave.s IL_0027
IL_0027: ret
// EH Catch: 10 - 17 => 17 - 39

// System.Void RunicBuildCamera.Plugin::OnDestroy()
.locals 
IL_0000: ldarg.0
IL_0001: ldftn System.Void RunicBuildCamera.Plugin::OnConfigurationChanged()
IL_0007: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_000c: call System.Void RunicBuildCamera.BuildCameraConfig::remove_Changed(System.Action)
IL_0011: ldarg.0
IL_0012: call System.Void RunicBuildCamera.Plugin::DisableRuntime()
IL_0017: ret

// System.Void RunicBuildCamera.Plugin::DisableRuntime()
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.0
IL_0002: stfld System.Boolean RunicBuildCamera.Plugin::_runtimeReady
IL_0007: ldsfld System.Action RunicBuildCamera.Plugin/<>O::<0>__Shutdown
IL_000c: dup
IL_000d: brtrue.s IL_0022
IL_000f: pop
IL_0010: ldnull
IL_0011: ldftn System.Void RunicBuildCamera.Integration.RemotePickupRuntime::Shutdown()
IL_0017: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_001c: dup
IL_001d: stsfld System.Action RunicBuildCamera.Plugin/<>O::<0>__Shutdown
IL_0022: ldstr "text_d53b70e83194"
IL_0027: call System.String Runic.Localization.RunicText::Get(System.String)
IL_002c: call System.Void RunicBuildCamera.Plugin::TryCleanup(System.Action,System.String)
IL_0031: ldsfld System.Action RunicBuildCamera.Plugin/<>O::<1>__Shutdown
IL_0036: dup
IL_0037: brtrue.s IL_004c
IL_0039: pop
IL_003a: ldnull
IL_003b: ldftn System.Void RunicBuildCamera.Integration.DemisterRuntime::Shutdown()
IL_0041: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_0046: dup
IL_0047: stsfld System.Action RunicBuildCamera.Plugin/<>O::<1>__Shutdown
IL_004c: ldstr "text_480ad81fe2bf"
IL_0051: call System.String Runic.Localization.RunicText::Get(System.String)
IL_0056: call System.Void RunicBuildCamera.Plugin::TryCleanup(System.Action,System.String)
IL_005b: ldsfld System.Action RunicBuildCamera.Plugin/<>O::<2>__Shutdown
IL_0060: dup
IL_0061: brtrue.s IL_0076
IL_0063: pop
IL_0064: ldnull
IL_0065: ldftn System.Void RunicBuildCamera.Integration.BuildCameraRuntime::Shutdown()
IL_006b: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_0070: dup
IL_0071: stsfld System.Action RunicBuildCamera.Plugin/<>O::<2>__Shutdown
IL_0076: ldstr "text_e7e1616b5b33"
IL_007b: call System.String Runic.Localization.RunicText::Get(System.String)
IL_0080: call System.Void RunicBuildCamera.Plugin::TryCleanup(System.Action,System.String)
IL_0085: ldsfld System.Action RunicBuildCamera.Plugin/<>O::<3>__Shutdown
IL_008a: dup
IL_008b: brtrue.s IL_00a0
IL_008d: pop
IL_008e: ldnull
IL_008f: ldftn System.Void RunicBuildCamera.Integration.ValheimAdapter::Shutdown()
IL_0095: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_009a: dup
IL_009b: stsfld System.Action RunicBuildCamera.Plugin/<>O::<3>__Shutdown
IL_00a0: ldstr "text_3dad311a77e5"
IL_00a5: call System.String Runic.Localization.RunicText::Get(System.String)
IL_00aa: call System.Void RunicBuildCamera.Plugin::TryCleanup(System.Action,System.String)
IL_00af: ldarg.0
IL_00b0: ldfld HarmonyLib.Harmony RunicBuildCamera.Plugin::_harmony
IL_00b5: brtrue.s IL_00b8
IL_00b7: ret
IL_00b8: nop
IL_00b9: ldarg.0
IL_00ba: ldfld HarmonyLib.Harmony RunicBuildCamera.Plugin::_harmony
IL_00bf: callvirt System.Void HarmonyLib.Harmony::UnpatchSelf()
IL_00c4: leave.s IL_00df
IL_00c6: ldstr "text_a907974ac55d"
IL_00cb: call System.String Runic.Localization.RunicText::Get(System.String)
IL_00d0: call System.Void RunicBuildCamera.Diagnostics::Error(System.Exception,System.String)
IL_00d5: leave.s IL_00df
IL_00d7: ldarg.0
IL_00d8: ldnull
IL_00d9: stfld HarmonyLib.Harmony RunicBuildCamera.Plugin::_harmony
IL_00de: endfinally
IL_00df: ret
// EH Catch: 185 - 198 => 198 - 215
// EH Finally: 185 - 215 => 215 - 223

// System.Void RunicBuildCamera.Plugin::TryCleanup(System.Action,System.String)
.locals 
IL_0000: ldarg.0
IL_0001: callvirt System.Void System.Action::Invoke()
IL_0006: leave.s IL_0023
IL_0008: ldstr "text_35b8f9a59ccc"
IL_000d: ldc.i4.1
IL_000e: newarr System.Object
IL_0013: dup
IL_0014: ldc.i4.0
IL_0015: ldarg.1
IL_0016: stelem.ref
IL_0017: call System.String Runic.Localization.RunicText::Format(System.String,System.Object[])
IL_001c: call System.Void RunicBuildCamera.Diagnostics::Error(System.Exception,System.String)
IL_0021: leave.s IL_0023
IL_0023: ret
// EH Catch: 0 - 8 => 8 - 35

// System.Void RunicBuildCamera.Plugin::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void BepInEx.BaseUnityPlugin::.ctor()
IL_0006: ret

// System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::get_IsActive()
.locals 
IL_0000: ldsfld System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::_initialized
IL_0005: brfalse.s IL_0012
IL_0007: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_000c: callvirt System.Boolean RunicBuildCamera.Core.BuildCameraSession::get_IsActive()
IL_0011: ret
IL_0012: ldc.i4.0
IL_0013: ret

// System.Void RunicBuildCamera.Integration.BuildCameraRuntime::Initialize()
.locals 
IL_0000: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_0005: callvirt System.Void RunicBuildCamera.Core.BuildCameraSession::End()
IL_000a: call System.Boolean UnityEngine.Application::get_isFocused()
IL_000f: stsfld System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::_focused
IL_0014: ldc.i4.1
IL_0015: stsfld System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::_initialized
IL_001a: ret

// System.Void RunicBuildCamera.Integration.BuildCameraRuntime::Shutdown()
.locals 
IL_0000: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::Stop()
IL_0005: ldc.i4.0
IL_0006: stsfld System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::_initialized
IL_000b: ret

// System.Void RunicBuildCamera.Integration.BuildCameraRuntime::Tick()
.locals Player, BepInEx.Configuration.KeyboardShortcut, System.Boolean, BepInEx.Configuration.KeyboardShortcut
IL_0000: ldsfld System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::_initialized
IL_0005: brtrue.s IL_0008
IL_0007: ret
IL_0008: call System.Boolean UnityEngine.Application::get_isFocused()
IL_000d: stsfld System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::_focused
IL_0012: ldsfld Player Player::m_localPlayer
IL_0017: stloc.0
IL_0018: call BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut> RunicBuildCamera.BuildCameraConfig::get_ToggleShortcut()
IL_001d: callvirt !0 BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut>::get_Value()
IL_0022: stloc.1
IL_0023: ldloca.s V_1
IL_0025: call UnityEngine.KeyCode BepInEx.Configuration.KeyboardShortcut::get_MainKey()
IL_002a: brfalse.s IL_003a
IL_002c: ldloca.s V_1
IL_002e: call UnityEngine.KeyCode BepInEx.Configuration.KeyboardShortcut::get_MainKey()
IL_0033: call System.Boolean UnityEngine.Input::GetKeyDown(UnityEngine.KeyCode)
IL_0038: br.s IL_003b
IL_003a: ldc.i4.0
IL_003b: ldloca.s V_1
IL_003d: call UnityEngine.KeyCode BepInEx.Configuration.KeyboardShortcut::get_MainKey()
IL_0042: brfalse.s IL_004d
IL_0044: ldloca.s V_1
IL_0046: call System.Boolean BepInEx.Configuration.KeyboardShortcut::IsDown()
IL_004b: br.s IL_004e
IL_004d: ldc.i4.0
IL_004e: stloc.2
IL_004f: brfalse.s IL_0078
IL_0051: ldloc.2
IL_0052: brtrue.s IL_0078
IL_0054: ldloc.0
IL_0055: ldstr "text_868e36f8c510"
IL_005a: call System.String Runic.Localization.RunicText::Get(System.String)
IL_005f: ldloc.1
IL_0060: stloc.3
IL_0061: ldloca.s V_3
IL_0063: constrained. BepInEx.Configuration.KeyboardShortcut
IL_0069: callvirt System.String System.Object::ToString()
IL_006e: call System.String System.String::Concat(System.String,System.String)
IL_0073: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::ActivationFeedback(Player,System.String)
IL_0078: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::ConfigEnabled()
IL_007d: brfalse.s IL_0086
IL_007f: ldsfld System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::_focused
IL_0084: brtrue.s IL_00b2
IL_0086: ldloc.2
IL_0087: brfalse.s IL_00ac
IL_0089: ldloc.0
IL_008a: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::ConfigEnabled()
IL_008f: brfalse.s IL_009d
IL_0091: ldstr "text_4ea5638c368a"
IL_0096: call System.String Runic.Localization.RunicText::Get(System.String)
IL_009b: br.s IL_00a7
IL_009d: ldstr "text_e1ab24965475"
IL_00a2: call System.String Runic.Localization.RunicText::Get(System.String)
IL_00a7: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::ActivationFeedback(Player,System.String)
IL_00ac: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::Stop()
IL_00b1: ret
IL_00b2: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_00b7: callvirt System.Boolean RunicBuildCamera.Core.BuildCameraSession::get_IsActive()
IL_00bc: brfalse.s IL_00d9
IL_00be: ldloc.0
IL_00bf: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::SessionBelongsToUsablePlayer(Player)
IL_00c4: brfalse.s IL_00d3
IL_00c6: call GameCamera GameCamera::get_instance()
IL_00cb: ldnull
IL_00cc: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_00d1: brfalse.s IL_00d9
IL_00d3: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::Stop()
IL_00d8: ret
IL_00d9: ldloc.2
IL_00da: brfalse.s IL_0119
IL_00dc: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_00e1: callvirt System.Boolean RunicBuildCamera.Core.BuildCameraSession::get_IsActive()
IL_00e6: brfalse.s IL_00f9
IL_00e8: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::Stop()
IL_00ed: ldloc.0
IL_00ee: ldstr "Off."
IL_00f3: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::ActivationFeedback(Player,System.String)
IL_00f8: ret
IL_00f9: ldloc.0
IL_00fa: call System.Boolean RunicBuildCamera.Integration.ValheimAdapter::CanTakeInput(Player)
IL_00ff: brfalse.s IL_0108
IL_0101: ldloc.0
IL_0102: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::TryStart(Player)
IL_0107: ret
IL_0108: ldloc.0
IL_0109: ldstr "text_f46af67108b2"
IL_010e: call System.String Runic.Localization.RunicText::Get(System.String)
IL_0113: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::ActivationFeedback(Player,System.String)
IL_0118: ret
IL_0119: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_011e: callvirt System.Boolean RunicBuildCamera.Core.BuildCameraSession::get_IsActive()
IL_0123: brtrue.s IL_0126
IL_0125: ret
IL_0126: ldloc.0
IL_0127: call System.Boolean RunicBuildCamera.Integration.ValheimAdapter::IsBuildToolEquipped(Player)
IL_012c: brtrue.s IL_0134
IL_012e: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::Stop()
IL_0133: ret
IL_0134: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_0139: ldloc.0
IL_013a: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_013f: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0144: callvirt System.Void RunicBuildCamera.Core.BuildCameraSession::Reanchor(UnityEngine.Vector3)
IL_0149: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_014e: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_CameraRange()
IL_0153: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0158: ldc.r4 1
IL_015d: call System.Single RunicBuildCamera.Integration.BuildCameraRuntime::Positive(System.Single,System.Single)
IL_0162: callvirt System.Void RunicBuildCamera.Core.BuildCameraSession::UpdateRange(System.Single)
IL_0167: ret

// System.Void RunicBuildCamera.Integration.BuildCameraRuntime::OnApplicationFocus(System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::_focused
IL_0006: ldarg.0
IL_0007: brtrue.s IL_000e
IL_0009: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::Stop()
IL_000e: ret

// System.Void RunicBuildCamera.Integration.BuildCameraRuntime::OnConfigurationChanged()
.locals 
IL_0000: ldsfld System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::_initialized
IL_0005: brtrue.s IL_0008
IL_0007: ret
IL_0008: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::ConfigEnabled()
IL_000d: brtrue.s IL_0015
IL_000f: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::Stop()
IL_0014: ret
IL_0015: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_001a: callvirt System.Boolean RunicBuildCamera.Core.BuildCameraSession::get_IsActive()
IL_001f: brfalse.s IL_003f
IL_0021: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_0026: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_CameraRange()
IL_002b: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0030: ldc.r4 1
IL_0035: call System.Single RunicBuildCamera.Integration.BuildCameraRuntime::Positive(System.Single,System.Single)
IL_003a: callvirt System.Void RunicBuildCamera.Core.BuildCameraSession::UpdateRange(System.Single)
IL_003f: ret

// System.Void RunicBuildCamera.Integration.BuildCameraRuntime::OnLocalPlayerAssigned(Player)
.locals 
IL_0000: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_0005: callvirt System.Boolean RunicBuildCamera.Core.BuildCameraSession::get_IsActive()
IL_000a: brfalse.s IL_002c
IL_000c: ldarg.0
IL_000d: ldnull
IL_000e: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0013: brtrue.s IL_0027
IL_0015: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_001a: ldarg.0
IL_001b: callvirt System.Int32 UnityEngine.Object::GetInstanceID()
IL_0020: callvirt System.Boolean RunicBuildCamera.Core.BuildCameraSession::BelongsTo(System.Int32)
IL_0025: brtrue.s IL_002c
IL_0027: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::Stop()
IL_002c: ret

// System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::ShouldFreezePlayer(Player)
.locals 
IL_0000: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::get_IsActive()
IL_0005: brfalse.s IL_0029
IL_0007: ldarg.0
IL_0008: ldnull
IL_0009: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_000e: brfalse.s IL_0029
IL_0010: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_0015: ldarg.0
IL_0016: callvirt System.Int32 UnityEngine.Object::GetInstanceID()
IL_001b: callvirt System.Boolean RunicBuildCamera.Core.BuildCameraSession::BelongsTo(System.Int32)
IL_0020: brfalse.s IL_0029
IL_0022: ldarg.0
IL_0023: call System.Boolean RunicBuildCamera.Integration.ValheimAdapter::IsLocalPlayer(Player)
IL_0028: ret
IL_0029: ldc.i4.0
IL_002a: ret

// RunicBuildCamera.Integration.ValheimAdapter/RangeLease RunicBuildCamera.Integration.BuildCameraRuntime::EnterRemoteActionRange(Player)
.locals System.Single
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::ShouldFreezePlayer(Player)
IL_0006: brtrue.s IL_000a
IL_0008: ldnull
IL_0009: ret
IL_000a: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_RemoteActionDistance()
IL_000f: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0014: ldc.r4 1
IL_0019: call System.Single RunicBuildCamera.Integration.BuildCameraRuntime::Positive(System.Single,System.Single)
IL_001e: stloc.0
IL_001f: ldarg.0
IL_0020: ldloc.0
IL_0021: ldloc.0
IL_0022: call RunicBuildCamera.Integration.ValheimAdapter/RangeLease RunicBuildCamera.Integration.ValheimAdapter::EnterRemoteActionRange(Player,System.Single,System.Single)
IL_0027: ret

// System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::IsWithinRemoteActionLimit(Player,UnityEngine.Vector3)
.locals System.Single, UnityEngine.Vector3
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::ShouldFreezePlayer(Player)
IL_0006: brfalse.s IL_001e
IL_0008: ldarg.0
IL_0009: ldfld UnityEngine.Transform Character::m_eye
IL_000e: ldnull
IL_000f: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0014: brtrue.s IL_001e
IL_0016: ldarg.1
IL_0017: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::IsFinite(UnityEngine.Vector3)
IL_001c: brtrue.s IL_0020
IL_001e: ldc.i4.0
IL_001f: ret
IL_0020: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_RemoteActionDistance()
IL_0025: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_002a: ldc.r4 1
IL_002f: call System.Single RunicBuildCamera.Integration.BuildCameraRuntime::Positive(System.Single,System.Single)
IL_0034: stloc.0
IL_0035: ldarg.1
IL_0036: ldarg.0
IL_0037: ldfld UnityEngine.Transform Character::m_eye
IL_003c: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0041: call UnityEngine.Vector3 UnityEngine.Vector3::op_Subtraction(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0046: stloc.1
IL_0047: ldloc.1
IL_0048: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::IsFinite(UnityEngine.Vector3)
IL_004d: brfalse.s IL_0062
IL_004f: ldloca.s V_1
IL_0051: call System.Single UnityEngine.Vector3::get_sqrMagnitude()
IL_0056: conv.r8
IL_0057: ldloc.0
IL_0058: conv.r8
IL_0059: ldloc.0
IL_005a: conv.r8
IL_005b: mul
IL_005c: cgt.un
IL_005e: ldc.i4.0
IL_005f: ceq
IL_0061: ret
IL_0062: ldc.i4.0
IL_0063: ret

// System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::TryUpdateCamera(GameCamera,System.Single)
.locals Player, RunicBuildCamera.Core.CameraPose
IL_0000: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::get_IsActive()
IL_0005: brfalse.s IL_0010
IL_0007: ldarg.0
IL_0008: ldnull
IL_0009: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_000e: brfalse.s IL_0012
IL_0010: ldc.i4.0
IL_0011: ret
IL_0012: ldsfld Player Player::m_localPlayer
IL_0017: stloc.0
IL_0018: ldloc.0
IL_0019: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::SessionBelongsToUsablePlayer(Player)
IL_001e: brtrue.s IL_0027
IL_0020: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::Stop()
IL_0025: ldc.i4.0
IL_0026: ret
IL_0027: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_002c: ldloc.0
IL_002d: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0032: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0037: callvirt System.Void RunicBuildCamera.Core.BuildCameraSession::Reanchor(UnityEngine.Vector3)
IL_003c: ldsfld System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::_focused
IL_0041: brfalse.s IL_006c
IL_0043: ldloc.0
IL_0044: call System.Boolean RunicBuildCamera.Integration.ValheimAdapter::CanTakeInput(Player)
IL_0049: brfalse.s IL_006c
IL_004b: call System.Boolean Console::IsVisible()
IL_0050: brtrue.s IL_006c
IL_0052: call Hud Hud::get_instance()
IL_0057: ldnull
IL_0058: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_005d: brtrue.s IL_0069
IL_005f: call System.Boolean Hud::IsPieceSelectionVisible()
IL_0064: ldc.i4.0
IL_0065: ceq
IL_0067: br.s IL_006d
IL_0069: ldc.i4.1
IL_006a: br.s IL_006d
IL_006c: ldc.i4.0
IL_006d: brfalse.s IL_0087
IL_006f: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_0074: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_0079: ldarg.1
IL_007a: call RunicBuildCamera.Core.CameraPose RunicBuildCamera.Integration.BuildCameraRuntime::StepCamera(RunicBuildCamera.Core.BuildCameraSession,System.Single)
IL_007f: stloc.1
IL_0080: ldloca.s V_1
IL_0082: callvirt System.Void RunicBuildCamera.Core.BuildCameraSession::SetPose(RunicBuildCamera.Core.CameraPose&)
IL_0087: ldarg.0
IL_0088: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_008d: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_0092: callvirt UnityEngine.Vector3 RunicBuildCamera.Core.BuildCameraSession::get_Position()
IL_0097: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_009c: callvirt UnityEngine.Quaternion RunicBuildCamera.Core.BuildCameraSession::get_Rotation()
IL_00a1: callvirt System.Void UnityEngine.Transform::SetPositionAndRotation(UnityEngine.Vector3,UnityEngine.Quaternion)
IL_00a6: ldc.i4.1
IL_00a7: ret

// System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::TryGetActiveContext(Player&,UnityEngine.Vector3&,UnityEngine.Quaternion&)
.locals 
IL_0000: ldarg.0
IL_0001: ldsfld Player Player::m_localPlayer
IL_0006: stind.ref
IL_0007: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::get_IsActive()
IL_000c: brfalse.s IL_0017
IL_000e: ldarg.0
IL_000f: ldind.ref
IL_0010: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::SessionBelongsToUsablePlayer(Player)
IL_0015: brtrue.s IL_002f
IL_0017: ldarg.1
IL_0018: call UnityEngine.Vector3 UnityEngine.Vector3::get_zero()
IL_001d: stobj UnityEngine.Vector3
IL_0022: ldarg.2
IL_0023: call UnityEngine.Quaternion UnityEngine.Quaternion::get_identity()
IL_0028: stobj UnityEngine.Quaternion
IL_002d: ldc.i4.0
IL_002e: ret
IL_002f: ldarg.1
IL_0030: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_0035: callvirt UnityEngine.Vector3 RunicBuildCamera.Core.BuildCameraSession::get_Position()
IL_003a: stobj UnityEngine.Vector3
IL_003f: ldarg.2
IL_0040: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_0045: callvirt UnityEngine.Quaternion RunicBuildCamera.Core.BuildCameraSession::get_Rotation()
IL_004a: stobj UnityEngine.Quaternion
IL_004f: ldc.i4.1
IL_0050: ret

// System.Void RunicBuildCamera.Integration.BuildCameraRuntime::ForceStop()
.locals 
IL_0000: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::Stop()
IL_0005: ret

// System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::ExitInputRequested()
.locals Player, System.Boolean
IL_0000: ldsfld System.Func`2<System.String,System.Boolean> RunicBuildCamera.Integration.BuildCameraRuntime/<>O::<0>__GetButtonDown
IL_0005: dup
IL_0006: brtrue.s IL_001b
IL_0008: pop
IL_0009: ldnull
IL_000a: ldftn System.Boolean ZInput::GetButtonDown(System.String)
IL_0010: newobj System.Void System.Func`2<System.String,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0015: dup
IL_0016: stsfld System.Func`2<System.String,System.Boolean> RunicBuildCamera.Integration.BuildCameraRuntime/<>O::<0>__GetButtonDown
IL_001b: call System.Boolean RunicBuildCamera.Core.CameraExitInput::HotbarRequested(System.Func`2<System.String,System.Boolean>)
IL_0020: brfalse.s IL_0024
IL_0022: ldc.i4.1
IL_0023: ret
IL_0024: ldsfld Player Player::m_localPlayer
IL_0029: stloc.0
IL_002a: call System.Boolean Hud::InRadial()
IL_002f: brtrue.s IL_0050
IL_0031: ldstr "JoyHide"
IL_0036: call System.Boolean ZInput::GetButtonUp(System.String)
IL_003b: brfalse.s IL_0050
IL_003d: ldstr "JoyHide"
IL_0042: call System.Single ZInput::GetButtonLastPressedTimer(System.String)
IL_0047: ldc.r4 0.33
IL_004c: clt
IL_004e: br.s IL_0051
IL_0050: ldc.i4.0
IL_0051: stloc.1
IL_0052: ldstr "Hide"
IL_0057: call System.Boolean ZInput::GetButtonDown(System.String)
IL_005c: ldsfld InputLayout ZInput::InputLayout
IL_0061: brfalse.s IL_006a
IL_0063: call System.Boolean ZInput::IsGamepadActive()
IL_0068: br.s IL_006b
IL_006a: ldc.i4.0
IL_006b: ldloc.1
IL_006c: ldloc.0
IL_006d: callvirt System.Boolean Character::InPlaceMode()
IL_0072: ldstr "JoyAltKeys"
IL_0077: call System.Boolean ZInput::GetButton(System.String)
IL_007c: call System.Boolean RunicBuildCamera.Core.CameraExitInput::HideRequested(System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean)
IL_0081: ret

// System.Void RunicBuildCamera.Integration.BuildCameraRuntime::TryStart(Player)
.locals GameCamera, System.Single
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Integration.ValheimAdapter::IsBuildToolEquipped(Player)
IL_0006: brtrue.s IL_0019
IL_0008: ldarg.0
IL_0009: ldstr "text_aad211031f8b"
IL_000e: call System.String Runic.Localization.RunicText::Get(System.String)
IL_0013: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::ActivationFeedback(Player,System.String)
IL_0018: ret
IL_0019: call GameCamera GameCamera::get_instance()
IL_001e: stloc.0
IL_001f: ldloc.0
IL_0020: ldnull
IL_0021: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0026: brfalse.s IL_0039
IL_0028: ldarg.0
IL_0029: ldstr "text_2e15e203e13d"
IL_002e: call System.String Runic.Localization.RunicText::Get(System.String)
IL_0033: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::ActivationFeedback(Player,System.String)
IL_0038: ret
IL_0039: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_CameraRange()
IL_003e: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0043: ldc.r4 1
IL_0048: call System.Single RunicBuildCamera.Integration.BuildCameraRuntime::Positive(System.Single,System.Single)
IL_004d: stloc.1
IL_004e: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_0053: ldarg.0
IL_0054: callvirt System.Int32 UnityEngine.Object::GetInstanceID()
IL_0059: ldarg.0
IL_005a: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_005f: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0064: ldloc.0
IL_0065: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_006a: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_006f: ldloc.0
IL_0070: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0075: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_007a: ldloc.1
IL_007b: callvirt System.Boolean RunicBuildCamera.Core.BuildCameraSession::Begin(System.Int32,UnityEngine.Vector3,UnityEngine.Vector3,UnityEngine.Quaternion,System.Single)
IL_0080: pop
IL_0081: ldarg.0
IL_0082: ldstr "text_3691699c3e79"
IL_0087: call System.String Runic.Localization.RunicText::Get(System.String)
IL_008c: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::ActivationFeedback(Player,System.String)
IL_0091: ret

// System.Void RunicBuildCamera.Integration.BuildCameraRuntime::ActivationFeedback(Player,System.String)
.locals 
IL_0000: ldstr "Build camera: "
IL_0005: ldarg.1
IL_0006: call System.String System.String::Concat(System.String,System.String)
IL_000b: call System.Void RunicBuildCamera.Diagnostics::Info(System.String)
IL_0010: ldarg.0
IL_0011: ldnull
IL_0012: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0017: brfalse.s IL_0033
IL_0019: ldarg.0
IL_001a: ldc.i4.1
IL_001b: ldstr "text_5a7920bb73fd"
IL_0020: call System.String Runic.Localization.RunicText::Get(System.String)
IL_0025: ldarg.1
IL_0026: call System.String System.String::Concat(System.String,System.String)
IL_002b: ldc.i4.0
IL_002c: ldnull
IL_002d: ldc.i4.0
IL_002e: callvirt System.Void Character::Message(MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_0033: ret

// RunicBuildCamera.Core.CameraPose RunicBuildCamera.Integration.BuildCameraRuntime::StepCamera(RunicBuildCamera.Core.BuildCameraSession,System.Single)
.locals System.Single, System.Single, System.Single, System.Single, System.Single, System.Single, System.Single, RunicBuildCamera.Core.CameraMotionInput, RunicBuildCamera.Core.CameraPose, System.Single, UnityEngine.Vector3
IL_0000: ldstr "Right"
IL_0005: ldstr "Left"
IL_000a: call System.Single RunicBuildCamera.Integration.BuildCameraRuntime::ButtonAxis(System.String,System.String)
IL_000f: call System.Single ZInput::GetJoyLeftStickX()
IL_0014: add
IL_0015: stloc.0
IL_0016: ldstr "Forward"
IL_001b: ldstr "Backward"
IL_0020: call System.Single RunicBuildCamera.Integration.BuildCameraRuntime::ButtonAxis(System.String,System.String)
IL_0025: call System.Single ZInput::GetJoyLeftStickY()
IL_002a: sub
IL_002b: stloc.1
IL_002c: ldstr "Jump"
IL_0031: call System.Boolean ZInput::GetButton(System.String)
IL_0036: brtrue.s IL_004b
IL_0038: ldstr "JoyJump"
IL_003d: call System.Boolean ZInput::GetButton(System.String)
IL_0042: brtrue.s IL_004b
IL_0044: ldc.r4 0
IL_0049: br.s IL_0050
IL_004b: ldc.r4 1
IL_0050: ldstr "Crouch"
IL_0055: call System.Boolean ZInput::GetButton(System.String)
IL_005a: brtrue.s IL_006f
IL_005c: ldstr "JoyCrouch"
IL_0061: call System.Boolean ZInput::GetButton(System.String)
IL_0066: brtrue.s IL_006f
IL_0068: ldc.r4 0
IL_006d: br.s IL_0074
IL_006f: ldc.r4 1
IL_0074: sub
IL_0075: stloc.2
IL_0076: ldstr "Mouse X"
IL_007b: call System.Single UnityEngine.Input::GetAxis(System.String)
IL_0080: ldsfld System.Single PlayerController::m_mouseSens
IL_0085: mul
IL_0086: stloc.3
IL_0087: ldstr "Mouse Y"
IL_008c: call System.Single UnityEngine.Input::GetAxis(System.String)
IL_0091: ldsfld System.Single PlayerController::m_mouseSens
IL_0096: mul
IL_0097: stloc.s V_4
IL_0099: call System.Single ZInput::GetJoyRightStickX()
IL_009e: ldc.r4 110
IL_00a3: mul
IL_00a4: ldarg.1
IL_00a5: mul
IL_00a6: stloc.s V_5
IL_00a8: call System.Single ZInput::GetJoyRightStickY()
IL_00ad: ldc.r4 110
IL_00b2: mul
IL_00b3: ldarg.1
IL_00b4: mul
IL_00b5: stloc.s V_6
IL_00b7: call BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_InvertMouseHorizontal()
IL_00bc: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_00c1: brfalse.s IL_00c6
IL_00c3: ldloc.3
IL_00c4: neg
IL_00c5: stloc.3
IL_00c6: ldsfld System.Boolean PlayerController::m_invertMouse
IL_00cb: brfalse.s IL_00d2
IL_00cd: ldloc.s V_4
IL_00cf: neg
IL_00d0: stloc.s V_4
IL_00d2: call BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_InvertMouseVertical()
IL_00d7: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_00dc: brfalse.s IL_00e3
IL_00de: ldloc.s V_4
IL_00e0: neg
IL_00e1: stloc.s V_4
IL_00e3: call BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_InvertControllerHorizontal()
IL_00e8: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_00ed: brfalse.s IL_00f4
IL_00ef: ldloc.s V_5
IL_00f1: neg
IL_00f2: stloc.s V_5
IL_00f4: call BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_InvertControllerVertical()
IL_00f9: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_00fe: brfalse.s IL_0105
IL_0100: ldloc.s V_6
IL_0102: neg
IL_0103: stloc.s V_6
IL_0105: ldloca.s V_7
IL_0107: ldloc.0
IL_0108: ldloc.2
IL_0109: ldloc.1
IL_010a: ldloc.3
IL_010b: ldloc.s V_5
IL_010d: add
IL_010e: ldloc.s V_4
IL_0110: neg
IL_0111: ldloc.s V_6
IL_0113: add
IL_0114: ldstr "Run"
IL_0119: call System.Boolean ZInput::GetButton(System.String)
IL_011e: brtrue.s IL_012c
IL_0120: ldstr "JoyRun"
IL_0125: call System.Boolean ZInput::GetButton(System.String)
IL_012a: br.s IL_012d
IL_012c: ldc.i4.1
IL_012d: call System.Void RunicBuildCamera.Core.CameraMotionInput::.ctor(System.Single,System.Single,System.Single,System.Single,System.Single,System.Boolean)
IL_0132: ldarg.0
IL_0133: callvirt UnityEngine.Vector3 RunicBuildCamera.Core.BuildCameraSession::get_Position()
IL_0138: ldarg.0
IL_0139: callvirt System.Single RunicBuildCamera.Core.BuildCameraSession::get_Yaw()
IL_013e: ldarg.0
IL_013f: callvirt System.Single RunicBuildCamera.Core.BuildCameraSession::get_Pitch()
IL_0144: ldarg.0
IL_0145: callvirt UnityEngine.Vector3 RunicBuildCamera.Core.BuildCameraSession::get_Anchor()
IL_014a: ldarg.0
IL_014b: callvirt System.Single RunicBuildCamera.Core.BuildCameraSession::get_Range()
IL_0150: ldloca.s V_7
IL_0152: ldarg.1
IL_0153: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_MoveSpeed()
IL_0158: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_015d: ldc.r4 0
IL_0162: call System.Single RunicBuildCamera.Integration.BuildCameraRuntime::Positive(System.Single,System.Single)
IL_0167: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_FastMoveMultiplier()
IL_016c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0171: ldc.r4 1
IL_0176: call System.Single RunicBuildCamera.Integration.BuildCameraRuntime::Positive(System.Single,System.Single)
IL_017b: call BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_WorldRelativeMovement()
IL_0180: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0185: call RunicBuildCamera.Core.CameraPose RunicBuildCamera.Core.CameraMotion::Step(UnityEngine.Vector3,System.Single,System.Single,UnityEngine.Vector3,System.Single,RunicBuildCamera.Core.CameraMotionInput&,System.Single,System.Single,System.Single,System.Boolean)
IL_018a: stloc.s V_8
IL_018c: call ZoneSystem ZoneSystem::get_instance()
IL_0191: ldnull
IL_0192: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0197: brfalse.s IL_01fc
IL_0199: call ZoneSystem ZoneSystem::get_instance()
IL_019e: ldloca.s V_8
IL_01a0: call UnityEngine.Vector3 RunicBuildCamera.Core.CameraPose::get_Position()
IL_01a5: ldloca.s V_9
IL_01a7: callvirt System.Boolean ZoneSystem::GetGroundHeight(UnityEngine.Vector3,System.Single&)
IL_01ac: brfalse.s IL_01fc
IL_01ae: ldloca.s V_8
IL_01b0: call UnityEngine.Vector3 RunicBuildCamera.Core.CameraPose::get_Position()
IL_01b5: ldfld System.Single UnityEngine.Vector3::y
IL_01ba: ldloc.s V_9
IL_01bc: bge.un.s IL_01fc
IL_01be: ldloca.s V_8
IL_01c0: call UnityEngine.Vector3 RunicBuildCamera.Core.CameraPose::get_Position()
IL_01c5: stloc.s V_10
IL_01c7: ldloca.s V_10
IL_01c9: ldloc.s V_9
IL_01cb: stfld System.Single UnityEngine.Vector3::y
IL_01d0: ldloc.s V_10
IL_01d2: ldarg.0
IL_01d3: callvirt UnityEngine.Vector3 RunicBuildCamera.Core.BuildCameraSession::get_Anchor()
IL_01d8: ldarg.0
IL_01d9: callvirt System.Single RunicBuildCamera.Core.BuildCameraSession::get_Range()
IL_01de: call UnityEngine.Vector3 RunicBuildCamera.Core.CameraMotion::ClampToAnchor(UnityEngine.Vector3,UnityEngine.Vector3,System.Single)
IL_01e3: stloc.s V_10
IL_01e5: ldloca.s V_8
IL_01e7: ldloc.s V_10
IL_01e9: ldloca.s V_8
IL_01eb: call System.Single RunicBuildCamera.Core.CameraPose::get_Yaw()
IL_01f0: ldloca.s V_8
IL_01f2: call System.Single RunicBuildCamera.Core.CameraPose::get_Pitch()
IL_01f7: call System.Void RunicBuildCamera.Core.CameraPose::.ctor(UnityEngine.Vector3,System.Single,System.Single)
IL_01fc: ldloc.s V_8
IL_01fe: ret

// System.Single RunicBuildCamera.Integration.BuildCameraRuntime::ButtonAxis(System.String,System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean ZInput::GetButton(System.String)
IL_0006: brtrue.s IL_000f
IL_0008: ldc.r4 0
IL_000d: br.s IL_0014
IL_000f: ldc.r4 1
IL_0014: ldarg.1
IL_0015: call System.Boolean ZInput::GetButton(System.String)
IL_001a: brtrue.s IL_0023
IL_001c: ldc.r4 0
IL_0021: br.s IL_0028
IL_0023: ldc.r4 1
IL_0028: sub
IL_0029: ret

// System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::SessionBelongsToUsablePlayer(Player)
.locals 
IL_0000: ldarg.0
IL_0001: ldnull
IL_0002: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0007: brfalse.s IL_0022
IL_0009: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_000e: ldarg.0
IL_000f: callvirt System.Int32 UnityEngine.Object::GetInstanceID()
IL_0014: callvirt System.Boolean RunicBuildCamera.Core.BuildCameraSession::BelongsTo(System.Int32)
IL_0019: brfalse.s IL_0022
IL_001b: ldarg.0
IL_001c: call System.Boolean RunicBuildCamera.Integration.ValheimAdapter::IsUsableLocalPlayer(Player)
IL_0021: ret
IL_0022: ldc.i4.0
IL_0023: ret

// System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::ConfigEnabled()
.locals 
IL_0000: call BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_Enabled()
IL_0005: brfalse.s IL_0058
IL_0007: call BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut> RunicBuildCamera.BuildCameraConfig::get_ToggleShortcut()
IL_000c: brfalse.s IL_0058
IL_000e: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_CameraRange()
IL_0013: brfalse.s IL_0058
IL_0015: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_MoveSpeed()
IL_001a: brfalse.s IL_0058
IL_001c: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_FastMoveMultiplier()
IL_0021: brfalse.s IL_0058
IL_0023: call BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_WorldRelativeMovement()
IL_0028: brfalse.s IL_0058
IL_002a: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_RemoteActionDistance()
IL_002f: brfalse.s IL_0058
IL_0031: call BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_InvertMouseHorizontal()
IL_0036: brfalse.s IL_0058
IL_0038: call BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_InvertMouseVertical()
IL_003d: brfalse.s IL_0058
IL_003f: call BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_InvertControllerHorizontal()
IL_0044: brfalse.s IL_0058
IL_0046: call BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_InvertControllerVertical()
IL_004b: brfalse.s IL_0058
IL_004d: call BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_Enabled()
IL_0052: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0057: ret
IL_0058: ldc.i4.0
IL_0059: ret

// System.Single RunicBuildCamera.Integration.BuildCameraRuntime::Positive(System.Single,System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean System.Single::IsNaN(System.Single)
IL_0006: brtrue.s IL_0018
IL_0008: ldarg.0
IL_0009: call System.Boolean System.Single::IsInfinity(System.Single)
IL_000e: brtrue.s IL_0018
IL_0010: ldarg.0
IL_0011: ldc.r4 0
IL_0016: bgt.s IL_001a
IL_0018: ldarg.1
IL_0019: ret
IL_001a: ldarg.0
IL_001b: ret

// System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::IsFinite(UnityEngine.Vector3)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Single UnityEngine.Vector3::x
IL_0006: call System.Boolean System.Single::IsNaN(System.Single)
IL_000b: brtrue.s IL_0050
IL_000d: ldarg.0
IL_000e: ldfld System.Single UnityEngine.Vector3::x
IL_0013: call System.Boolean System.Single::IsInfinity(System.Single)
IL_0018: brtrue.s IL_0050
IL_001a: ldarg.0
IL_001b: ldfld System.Single UnityEngine.Vector3::y
IL_0020: call System.Boolean System.Single::IsNaN(System.Single)
IL_0025: brtrue.s IL_0050
IL_0027: ldarg.0
IL_0028: ldfld System.Single UnityEngine.Vector3::y
IL_002d: call System.Boolean System.Single::IsInfinity(System.Single)
IL_0032: brtrue.s IL_0050
IL_0034: ldarg.0
IL_0035: ldfld System.Single UnityEngine.Vector3::z
IL_003a: call System.Boolean System.Single::IsNaN(System.Single)
IL_003f: brtrue.s IL_0050
IL_0041: ldarg.0
IL_0042: ldfld System.Single UnityEngine.Vector3::z
IL_0047: call System.Boolean System.Single::IsInfinity(System.Single)
IL_004c: ldc.i4.0
IL_004d: ceq
IL_004f: ret
IL_0050: ldc.i4.0
IL_0051: ret

// System.Void RunicBuildCamera.Integration.BuildCameraRuntime::Stop()
.locals 
IL_0000: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_0005: callvirt System.Boolean RunicBuildCamera.Core.BuildCameraSession::get_IsActive()
IL_000a: brfalse.s IL_0016
IL_000c: ldsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_0011: callvirt System.Void RunicBuildCamera.Core.BuildCameraSession::End()
IL_0016: call System.Void RunicBuildCamera.Integration.ValheimAdapter::ForceRestoreRanges()
IL_001b: ret

// System.Void RunicBuildCamera.Integration.BuildCameraRuntime::.cctor()
.locals 
IL_0000: newobj System.Void RunicBuildCamera.Core.BuildCameraSession::.ctor()
IL_0005: stsfld RunicBuildCamera.Core.BuildCameraSession RunicBuildCamera.Integration.BuildCameraRuntime::Session
IL_000a: ldc.i4.1
IL_000b: stsfld System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::_focused
IL_0010: ret

// System.Boolean RunicBuildCamera.Integration.PlayerUpdateInputIsolation::Enter(Player)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::ShouldFreezePlayer(Player)
IL_0006: brtrue.s IL_000a
IL_0008: ldc.i4.0
IL_0009: ret
IL_000a: ldsfld System.Int32 RunicBuildCamera.Integration.PlayerUpdateInputIsolation::_depth
IL_000f: brtrue.s IL_0023
IL_0011: ldarg.0
IL_0012: stsfld Player RunicBuildCamera.Integration.PlayerUpdateInputIsolation::_player
IL_0017: ldc.i4.0
IL_0018: stsfld System.Boolean RunicBuildCamera.Integration.PlayerUpdateInputIsolation::_captured
IL_001d: ldc.i4.0
IL_001e: stsfld System.Boolean RunicBuildCamera.Integration.PlayerUpdateInputIsolation::_originalTakeInput
IL_0023: ldsfld System.Int32 RunicBuildCamera.Integration.PlayerUpdateInputIsolation::_depth
IL_0028: ldc.i4.1
IL_0029: add
IL_002a: stsfld System.Int32 RunicBuildCamera.Integration.PlayerUpdateInputIsolation::_depth
IL_002f: ldc.i4.1
IL_0030: ret

// System.Void RunicBuildCamera.Integration.PlayerUpdateInputIsolation::CaptureTakeInput(Player,System.Boolean)
.locals 
IL_0000: ldsfld System.Int32 RunicBuildCamera.Integration.PlayerUpdateInputIsolation::_depth
IL_0005: ldc.i4.0
IL_0006: ble.s IL_001e
IL_0008: ldarg.0
IL_0009: ldnull
IL_000a: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_000f: brtrue.s IL_001e
IL_0011: ldarg.0
IL_0012: ldsfld Player RunicBuildCamera.Integration.PlayerUpdateInputIsolation::_player
IL_0017: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_001c: brfalse.s IL_001f
IL_001e: ret
IL_001f: ldc.i4.1
IL_0020: stsfld System.Boolean RunicBuildCamera.Integration.PlayerUpdateInputIsolation::_captured
IL_0025: ldarg.1
IL_0026: stsfld System.Boolean RunicBuildCamera.Integration.PlayerUpdateInputIsolation::_originalTakeInput
IL_002b: ret

// System.Boolean RunicBuildCamera.Integration.PlayerUpdateInputIsolation::ShouldSuppress(Player)
.locals 
IL_0000: ldsfld System.Int32 RunicBuildCamera.Integration.PlayerUpdateInputIsolation::_depth
IL_0005: ldc.i4.0
IL_0006: ble.s IL_0025
IL_0008: ldarg.0
IL_0009: ldnull
IL_000a: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_000f: brfalse.s IL_0025
IL_0011: ldarg.0
IL_0012: ldsfld Player RunicBuildCamera.Integration.PlayerUpdateInputIsolation::_player
IL_0017: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_001c: brfalse.s IL_0025
IL_001e: ldarg.0
IL_001f: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::ShouldFreezePlayer(Player)
IL_0024: ret
IL_0025: ldc.i4.0
IL_0026: ret

// System.Boolean RunicBuildCamera.Integration.PlayerUpdateInputIsolation::PlacementInput(Player,System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Integration.PlayerUpdateInputIsolation::ShouldSuppress(Player)
IL_0006: brfalse.s IL_000f
IL_0008: ldsfld System.Boolean RunicBuildCamera.Integration.PlayerUpdateInputIsolation::_captured
IL_000d: brtrue.s IL_0011
IL_000f: ldarg.1
IL_0010: ret
IL_0011: ldsfld System.Boolean RunicBuildCamera.Integration.PlayerUpdateInputIsolation::_originalTakeInput
IL_0016: ret

// System.Void RunicBuildCamera.Integration.PlayerUpdateInputIsolation::Exit()
.locals 
IL_0000: ldsfld System.Int32 RunicBuildCamera.Integration.PlayerUpdateInputIsolation::_depth
IL_0005: ldc.i4.0
IL_0006: bgt.s IL_0009
IL_0008: ret
IL_0009: ldsfld System.Int32 RunicBuildCamera.Integration.PlayerUpdateInputIsolation::_depth
IL_000e: ldc.i4.1
IL_000f: sub
IL_0010: stsfld System.Int32 RunicBuildCamera.Integration.PlayerUpdateInputIsolation::_depth
IL_0015: ldsfld System.Int32 RunicBuildCamera.Integration.PlayerUpdateInputIsolation::_depth
IL_001a: brfalse.s IL_001d
IL_001c: ret
IL_001d: ldnull
IL_001e: stsfld Player RunicBuildCamera.Integration.PlayerUpdateInputIsolation::_player
IL_0023: ldc.i4.0
IL_0024: stsfld System.Boolean RunicBuildCamera.Integration.PlayerUpdateInputIsolation::_captured
IL_0029: ldc.i4.0
IL_002a: stsfld System.Boolean RunicBuildCamera.Integration.PlayerUpdateInputIsolation::_originalTakeInput
IL_002f: ret

// System.Void RunicBuildCamera.Integration.PlayerUpdateInputScopePatch::Prefix(Player,System.Boolean&)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.0
IL_0002: call System.Boolean RunicBuildCamera.Integration.PlayerUpdateInputIsolation::Enter(Player)
IL_0007: stind.i1
IL_0008: leave.s IL_0015
IL_000a: pop
IL_000b: ldarg.1
IL_000c: ldc.i4.0
IL_000d: stind.i1
IL_000e: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::ForceStop()
IL_0013: leave.s IL_0015
IL_0015: ret
// EH Catch: 0 - 10 => 10 - 21

// System.Exception RunicBuildCamera.Integration.PlayerUpdateInputScopePatch::Finalizer(System.Exception,System.Boolean)
.locals 
IL_0000: ldarg.1
IL_0001: brfalse.s IL_0008
IL_0003: call System.Void RunicBuildCamera.Integration.PlayerUpdateInputIsolation::Exit()
IL_0008: ldarg.0
IL_0009: ret

// System.Void RunicBuildCamera.Integration.PlayerTakeInputIsolationPatch::Postfix(Player,System.Boolean&)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Integration.PlayerUpdateInputIsolation::ShouldSuppress(Player)
IL_0006: brtrue.s IL_0009
IL_0008: ret
IL_0009: ldarg.0
IL_000a: ldarg.1
IL_000b: ldind.u1
IL_000c: call System.Void RunicBuildCamera.Integration.PlayerUpdateInputIsolation::CaptureTakeInput(Player,System.Boolean)
IL_0011: ldarg.1
IL_0012: ldind.u1
IL_0013: ldsfld System.Func`1<System.Boolean> RunicBuildCamera.Integration.PlayerTakeInputIsolationPatch/<>O::<0>__ExitInputRequested
IL_0018: dup
IL_0019: brtrue.s IL_002e
IL_001b: pop
IL_001c: ldnull
IL_001d: ldftn System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::ExitInputRequested()
IL_0023: newobj System.Void System.Func`1<System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0028: dup
IL_0029: stsfld System.Func`1<System.Boolean> RunicBuildCamera.Integration.PlayerTakeInputIsolationPatch/<>O::<0>__ExitInputRequested
IL_002e: ldsfld System.Action RunicBuildCamera.Integration.PlayerTakeInputIsolationPatch/<>O::<1>__ForceStop
IL_0033: dup
IL_0034: brtrue.s IL_0049
IL_0036: pop
IL_0037: ldnull
IL_0038: ldftn System.Void RunicBuildCamera.Integration.BuildCameraRuntime::ForceStop()
IL_003e: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_0043: dup
IL_0044: stsfld System.Action RunicBuildCamera.Integration.PlayerTakeInputIsolationPatch/<>O::<1>__ForceStop
IL_0049: call System.Boolean RunicBuildCamera.Core.CameraExitInput::ReleaseIfRequested(System.Boolean,System.Func`1<System.Boolean>,System.Action)
IL_004e: brfalse.s IL_0051
IL_0050: ret
IL_0051: ldarg.1
IL_0052: ldc.i4.0
IL_0053: stind.i1
IL_0054: ret

// System.Void RunicBuildCamera.Integration.PlayerHotbarCameraExitPatch::Prefix(Player)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::ShouldFreezePlayer(Player)
IL_0006: brfalse.s IL_000d
IL_0008: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::ForceStop()
IL_000d: ret

// System.Void RunicBuildCamera.Integration.PlayerSetMouseLookIsolationPatch::Prefix(Player,UnityEngine.Vector2&)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::ShouldFreezePlayer(Player)
IL_0006: brfalse.s IL_0013
IL_0008: ldarg.1
IL_0009: call UnityEngine.Vector2 UnityEngine.Vector2::get_zero()
IL_000e: stobj UnityEngine.Vector2
IL_0013: ret

// System.Void RunicBuildCamera.Integration.CraftingStationScopedBuildRangePatch::Postfix(System.Single&)
.locals System.Single
IL_0000: ldloca.s V_0
IL_0002: call System.Boolean RunicBuildCamera.Integration.ValheimAdapter::TryGetScopedStationRange(System.Single&)
IL_0007: brfalse.s IL_0011
IL_0009: ldarg.0
IL_000a: ldind.r4
IL_000b: ldloc.0
IL_000c: bge.un.s IL_0011
IL_000e: ldarg.0
IL_000f: ldloc.0
IL_0010: stind.r4
IL_0011: ret

// System.Void RunicBuildCamera.Integration.PlayerPieceRayRemoteLimitPatch::Postfix(Player,UnityEngine.Vector3&,System.Boolean&)
.locals 
IL_0000: ldarg.2
IL_0001: ldind.u1
IL_0002: brfalse.s IL_001d
IL_0004: ldarg.0
IL_0005: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::ShouldFreezePlayer(Player)
IL_000a: brfalse.s IL_001d
IL_000c: ldarg.0
IL_000d: ldarg.1
IL_000e: ldobj UnityEngine.Vector3
IL_0013: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::IsWithinRemoteActionLimit(Player,UnityEngine.Vector3)
IL_0018: brtrue.s IL_001d
IL_001a: ldarg.2
IL_001b: ldc.i4.0
IL_001c: stind.i1
IL_001d: ret

// System.Reflection.MethodBase RunicBuildCamera.Integration.GameCameraUpdateCameraPatch::TargetMethod()
.locals 
IL_0000: call System.Reflection.MethodInfo RunicBuildCamera.Integration.ValheimAdapter::get_UpdateCameraMethod()
IL_0005: ret

// System.Boolean RunicBuildCamera.Integration.GameCameraUpdateCameraPatch::Prefix(GameCamera,System.Single)
.locals System.Boolean
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::TryUpdateCamera(GameCamera,System.Single)
IL_0007: ldc.i4.0
IL_0008: ceq
IL_000a: stloc.0
IL_000b: leave.s IL_0025
IL_000d: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::ForceStop()
IL_0012: ldstr "text_1d7135258182"
IL_0017: call System.String Runic.Localization.RunicText::Get(System.String)
IL_001c: call System.Void RunicBuildCamera.Diagnostics::Error(System.Exception,System.String)
IL_0021: ldc.i4.1
IL_0022: stloc.0
IL_0023: leave.s IL_0025
IL_0025: ldloc.0
IL_0026: ret
// EH Catch: 0 - 13 => 13 - 37

// System.Reflection.MethodBase RunicBuildCamera.Integration.PlayerSetControlsPatch::TargetMethod()
.locals 
IL_0000: call System.Reflection.MethodInfo RunicBuildCamera.Integration.ValheimAdapter::get_SetControlsMethod()
IL_0005: ret

// System.Void RunicBuildCamera.Integration.PlayerSetControlsPatch::Prefix(Player,UnityEngine.Vector3&,System.Boolean&,System.Boolean&,System.Boolean&,System.Boolean&,System.Boolean&,System.Boolean&,System.Boolean&,System.Boolean&,System.Boolean&,System.Boolean&,System.Boolean&)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::ShouldFreezePlayer(Player)
IL_0006: brtrue.s IL_0009
IL_0008: ret
IL_0009: ldarg.1
IL_000a: call UnityEngine.Vector3 UnityEngine.Vector3::get_zero()
IL_000f: stobj UnityEngine.Vector3
IL_0014: ldarg.2
IL_0015: ldc.i4.0
IL_0016: stind.i1
IL_0017: ldarg.3
IL_0018: ldc.i4.0
IL_0019: stind.i1
IL_001a: ldarg.s secondaryAttack
IL_001c: ldc.i4.0
IL_001d: stind.i1
IL_001e: ldarg.s secondaryAttackHold
IL_0020: ldc.i4.0
IL_0021: stind.i1
IL_0022: ldarg.s block
IL_0024: ldc.i4.0
IL_0025: stind.i1
IL_0026: ldarg.s blockHold
IL_0028: ldc.i4.0
IL_0029: stind.i1
IL_002a: ldarg.s jump
IL_002c: ldc.i4.0
IL_002d: stind.i1
IL_002e: ldarg.s crouch
IL_0030: ldc.i4.0
IL_0031: stind.i1
IL_0032: ldarg.s run
IL_0034: ldc.i4.0
IL_0035: stind.i1
IL_0036: ldarg.s autoRun
IL_0038: ldc.i4.0
IL_0039: stind.i1
IL_003a: ldarg.s dodge
IL_003c: ldc.i4.0
IL_003d: stind.i1
IL_003e: ret

// System.Reflection.MethodBase RunicBuildCamera.Integration.PlayerUpdatePlacementRangePatch::TargetMethod()
.locals 
IL_0000: call System.Reflection.MethodInfo RunicBuildCamera.Integration.ValheimAdapter::get_UpdatePlacementMethod()
IL_0005: ret

// System.Void RunicBuildCamera.Integration.PlayerUpdatePlacementRangePatch::Prefix(Player,System.Boolean&,RunicBuildCamera.Integration.ValheimAdapter/RangeLease&)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.0
IL_0002: ldarg.1
IL_0003: ldind.u1
IL_0004: call System.Boolean RunicBuildCamera.Integration.PlayerUpdateInputIsolation::PlacementInput(Player,System.Boolean)
IL_0009: stind.i1
IL_000a: ldarg.2
IL_000b: ldarg.0
IL_000c: call RunicBuildCamera.Integration.ValheimAdapter/RangeLease RunicBuildCamera.Integration.BuildCameraRuntime::EnterRemoteActionRange(Player)
IL_0011: stind.ref
IL_0012: leave.s IL_001f
IL_0014: pop
IL_0015: ldarg.2
IL_0016: ldnull
IL_0017: stind.ref
IL_0018: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::ForceStop()
IL_001d: leave.s IL_001f
IL_001f: ret
// EH Catch: 0 - 20 => 20 - 31

// System.Exception RunicBuildCamera.Integration.PlayerUpdatePlacementRangePatch::Finalizer(System.Exception,RunicBuildCamera.Integration.ValheimAdapter/RangeLease)
.locals 
IL_0000: ldarg.1
IL_0001: brfalse.s IL_0009
IL_0003: ldarg.1
IL_0004: call System.Void RunicBuildCamera.Integration.ValheimAdapter/RangeLease::Dispose()
IL_0009: leave.s IL_0013
IL_000b: pop
IL_000c: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::ForceStop()
IL_0011: leave.s IL_0013
IL_0013: ldarg.0
IL_0014: ret
// EH Catch: 0 - 11 => 11 - 19

// System.Reflection.MethodBase RunicBuildCamera.Integration.PlayerUpdatePlacementGhostRangePatch::TargetMethod()
.locals 
IL_0000: call System.Reflection.MethodInfo RunicBuildCamera.Integration.ValheimAdapter::get_UpdatePlacementGhostMethod()
IL_0005: ret

// System.Void RunicBuildCamera.Integration.PlayerUpdatePlacementGhostRangePatch::Prefix(Player,RunicBuildCamera.Integration.ValheimAdapter/RangeLease&)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.0
IL_0002: call RunicBuildCamera.Integration.ValheimAdapter/RangeLease RunicBuildCamera.Integration.BuildCameraRuntime::EnterRemoteActionRange(Player)
IL_0007: stind.ref
IL_0008: leave.s IL_0015
IL_000a: pop
IL_000b: ldarg.1
IL_000c: ldnull
IL_000d: stind.ref
IL_000e: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::ForceStop()
IL_0013: leave.s IL_0015
IL_0015: ret
// EH Catch: 0 - 10 => 10 - 21

// System.Exception RunicBuildCamera.Integration.PlayerUpdatePlacementGhostRangePatch::Finalizer(System.Exception,RunicBuildCamera.Integration.ValheimAdapter/RangeLease)
.locals 
IL_0000: ldarg.1
IL_0001: brfalse.s IL_0009
IL_0003: ldarg.1
IL_0004: call System.Void RunicBuildCamera.Integration.ValheimAdapter/RangeLease::Dispose()
IL_0009: leave.s IL_0013
IL_000b: pop
IL_000c: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::ForceStop()
IL_0011: leave.s IL_0013
IL_0013: ldarg.0
IL_0014: ret
// EH Catch: 0 - 11 => 11 - 19

// System.Void RunicBuildCamera.Integration.PlayerSetLocalPlayerCameraCleanupPatch::Postfix(Player)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::OnLocalPlayerAssigned(Player)
IL_0006: leave.s IL_0010
IL_0008: pop
IL_0009: call System.Void RunicBuildCamera.Integration.BuildCameraRuntime::ForceStop()
IL_000e: leave.s IL_0010
IL_0010: ret
// EH Catch: 0 - 8 => 8 - 16

// System.Void RunicBuildCamera.Integration.DemisterRuntime::AfterStatusEffectUpdate(SE_Demister)
.locals UnityEngine.GameObject, System.Int32, System.Int32, System.Int32, System.Boolean, Player, UnityEngine.Vector3, RunicBuildCamera.Integration.DemisterRuntime/BallState, System.Single, UnityEngine.Quaternion
IL_0000: call System.Void RunicBuildCamera.Integration.DemisterRuntime::EnsureSubscribed()
IL_0005: ldarg.0
IL_0006: ldnull
IL_0007: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_000c: brfalse.s IL_0014
IL_000e: call System.Void RunicBuildCamera.Integration.DemisterRuntime::RefreshActiveState()
IL_0013: ret
IL_0014: ldarg.0
IL_0015: call UnityEngine.GameObject RunicBuildCamera.Integration.DemisterRuntime::GetBall(SE_Demister)
IL_001a: stloc.0
IL_001b: ldloc.0
IL_001c: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0021: brtrue.s IL_002f
IL_0023: ldarg.0
IL_0024: call System.Void RunicBuildCamera.Integration.DemisterRuntime::RestoreEffect(SE_Demister)
IL_0029: call System.Void RunicBuildCamera.Integration.DemisterRuntime::PruneDestroyedBalls()
IL_002e: ret
IL_002f: ldarg.0
IL_0030: callvirt System.Int32 UnityEngine.Object::GetInstanceID()
IL_0035: stloc.1
IL_0036: ldloc.0
IL_0037: callvirt System.Int32 UnityEngine.Object::GetInstanceID()
IL_003c: stloc.2
IL_003d: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,System.Int32> RunicBuildCamera.Integration.DemisterRuntime::EffectBallIds
IL_0042: ldloc.1
IL_0043: ldloca.s V_3
IL_0045: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,System.Int32>::TryGetValue(!0,!1&)
IL_004a: brfalse.s IL_0056
IL_004c: ldloc.3
IL_004d: ldloc.2
IL_004e: beq.s IL_0056
IL_0050: ldloc.3
IL_0051: call System.Void RunicBuildCamera.Integration.DemisterRuntime::RestoreBall(System.Int32)
IL_0056: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,System.Int32> RunicBuildCamera.Integration.DemisterRuntime::EffectBallIds
IL_005b: ldloc.1
IL_005c: ldloc.2
IL_005d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Int32>::set_Item(!0,!1)
IL_0062: call BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_DemisterFollowCamera()
IL_0067: brfalse.s IL_0075
IL_0069: call BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_DemisterFollowCamera()
IL_006e: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0073: br.s IL_0076
IL_0075: ldc.i4.0
IL_0076: ldloca.s V_5
IL_0078: ldloca.s V_6
IL_007a: ldloca.s V_9
IL_007c: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::TryGetActiveContext(Player&,UnityEngine.Vector3&,UnityEngine.Quaternion&)
IL_0081: stloc.s V_4
IL_0083: brfalse.s IL_00b9
IL_0085: ldloc.s V_4
IL_0087: brfalse.s IL_00b9
IL_0089: ldloc.s V_5
IL_008b: ldnull
IL_008c: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0091: brtrue.s IL_00b9
IL_0093: ldloc.s V_5
IL_0095: ldsfld Player Player::m_localPlayer
IL_009a: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_009f: brtrue.s IL_00b9
IL_00a1: ldarg.0
IL_00a2: ldfld Character StatusEffect::m_character
IL_00a7: ldloc.s V_5
IL_00a9: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_00ae: brtrue.s IL_00b9
IL_00b0: ldloc.s V_6
IL_00b2: call System.Boolean RunicBuildCamera.Integration.DemisterRuntime::IsFinite(UnityEngine.Vector3)
IL_00b7: brtrue.s IL_00c0
IL_00b9: ldarg.0
IL_00ba: call System.Void RunicBuildCamera.Integration.DemisterRuntime::RestoreEffect(SE_Demister)
IL_00bf: ret
IL_00c0: ldloc.0
IL_00c1: call RunicBuildCamera.Integration.DemisterRuntime/BallState RunicBuildCamera.Integration.DemisterRuntime::GetOrCaptureBall(UnityEngine.GameObject)
IL_00c6: stloc.s V_7
IL_00c8: ldloc.s V_7
IL_00ca: brtrue.s IL_00cd
IL_00cc: ret
IL_00cd: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_DemisterRangeMultiplier()
IL_00d2: brtrue.s IL_00db
IL_00d4: ldc.r4 1
IL_00d9: br.s IL_00e5
IL_00db: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_DemisterRangeMultiplier()
IL_00e0: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_00e5: stloc.s V_8
IL_00e7: ldloc.s V_7
IL_00e9: ldloc.s V_8
IL_00eb: call System.Void RunicBuildCamera.Integration.DemisterRuntime::ApplyRange(RunicBuildCamera.Integration.DemisterRuntime/BallState,System.Single)
IL_00f0: ldloc.0
IL_00f1: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_00f6: ldloc.s V_6
IL_00f8: callvirt System.Void UnityEngine.Transform::set_position(UnityEngine.Vector3)
IL_00fd: call System.Void RunicBuildCamera.Integration.DemisterRuntime::PruneDestroyedBalls()
IL_0102: ret

// System.Void RunicBuildCamera.Integration.DemisterRuntime::BeforeRemoveEffects(SE_Demister)
.locals 
IL_0000: call System.Void RunicBuildCamera.Integration.DemisterRuntime::EnsureSubscribed()
IL_0005: ldarg.0
IL_0006: call System.Void RunicBuildCamera.Integration.DemisterRuntime::RestoreEffect(SE_Demister)
IL_000b: call System.Void RunicBuildCamera.Integration.DemisterRuntime::PruneDestroyedBalls()
IL_0010: ret

// System.Void RunicBuildCamera.Integration.DemisterRuntime::RefreshActiveState()
.locals Player, UnityEngine.Vector3, UnityEngine.Quaternion
IL_0000: call System.Void RunicBuildCamera.Integration.DemisterRuntime::EnsureSubscribed()
IL_0005: call BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_DemisterFollowCamera()
IL_000a: brfalse.s IL_0018
IL_000c: call BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_DemisterFollowCamera()
IL_0011: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0016: br.s IL_0019
IL_0018: ldc.i4.0
IL_0019: brfalse.s IL_0028
IL_001b: ldloca.s V_0
IL_001d: ldloca.s V_1
IL_001f: ldloca.s V_2
IL_0021: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::TryGetActiveContext(Player&,UnityEngine.Vector3&,UnityEngine.Quaternion&)
IL_0026: brtrue.s IL_002e
IL_0028: call System.Void RunicBuildCamera.Integration.DemisterRuntime::RestoreAll()
IL_002d: ret
IL_002e: call System.Void RunicBuildCamera.Integration.DemisterRuntime::PruneDestroyedBalls()
IL_0033: ret

// System.Void RunicBuildCamera.Integration.DemisterRuntime::OnCameraExit()
.locals 
IL_0000: call System.Void RunicBuildCamera.Integration.DemisterRuntime::RestoreAll()
IL_0005: ret

// System.Void RunicBuildCamera.Integration.DemisterRuntime::Shutdown()
.locals 
IL_0000: ldsfld System.Boolean RunicBuildCamera.Integration.DemisterRuntime::_subscribed
IL_0005: brfalse.s IL_002d
IL_0007: ldsfld System.Action RunicBuildCamera.Integration.DemisterRuntime/<>O::<0>__OnConfigurationChanged
IL_000c: dup
IL_000d: brtrue.s IL_0022
IL_000f: pop
IL_0010: ldnull
IL_0011: ldftn System.Void RunicBuildCamera.Integration.DemisterRuntime::OnConfigurationChanged()
IL_0017: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_001c: dup
IL_001d: stsfld System.Action RunicBuildCamera.Integration.DemisterRuntime/<>O::<0>__OnConfigurationChanged
IL_0022: call System.Void RunicBuildCamera.BuildCameraConfig::remove_Changed(System.Action)
IL_0027: ldc.i4.0
IL_0028: stsfld System.Boolean RunicBuildCamera.Integration.DemisterRuntime::_subscribed
IL_002d: call System.Void RunicBuildCamera.Integration.DemisterRuntime::RestoreAll()
IL_0032: ret

// RunicBuildCamera.Integration.DemisterRuntime/BallState RunicBuildCamera.Integration.DemisterRuntime::GetOrCaptureBall(UnityEngine.GameObject)
.locals System.Int32, RunicBuildCamera.Integration.DemisterRuntime/BallState, UnityEngine.ParticleSystemForceField[], System.Collections.Generic.List`1<RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline>, RunicBuildCamera.Integration.DemisterRuntime/BallState, UnityEngine.ParticleSystemForceField[], System.Int32, UnityEngine.ParticleSystemForceField
IL_0000: ldarg.0
IL_0001: callvirt System.Int32 UnityEngine.Object::GetInstanceID()
IL_0006: stloc.0
IL_0007: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState> RunicBuildCamera.Integration.DemisterRuntime::BallStates
IL_000c: ldloc.0
IL_000d: ldloca.s V_1
IL_000f: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState>::TryGetValue(!0,!1&)
IL_0014: brfalse.s IL_0021
IL_0016: ldloc.1
IL_0017: callvirt UnityEngine.GameObject RunicBuildCamera.Integration.DemisterRuntime/BallState::get_Ball()
IL_001c: ldarg.0
IL_001d: bne.un.s IL_0021
IL_001f: ldloc.1
IL_0020: ret
IL_0021: ldloc.1
IL_0022: brfalse.s IL_002a
IL_0024: ldloc.1
IL_0025: call System.Void RunicBuildCamera.Integration.DemisterRuntime::RestoreState(RunicBuildCamera.Integration.DemisterRuntime/BallState)
IL_002a: nop
IL_002b: ldarg.0
IL_002c: ldc.i4.1
IL_002d: callvirt !!0[] UnityEngine.GameObject::GetComponentsInChildren<UnityEngine.ParticleSystemForceField>(System.Boolean)
IL_0032: stloc.2
IL_0033: leave.s IL_003e
IL_0035: pop
IL_0036: call !!0[] System.Array::Empty<UnityEngine.ParticleSystemForceField>()
IL_003b: stloc.2
IL_003c: leave.s IL_003e
IL_003e: ldloc.2
IL_003f: ldlen
IL_0040: conv.i4
IL_0041: newobj System.Void System.Collections.Generic.List`1<RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline>::.ctor(System.Int32)
IL_0046: stloc.3
IL_0047: ldloc.2
IL_0048: stloc.s V_5
IL_004a: ldc.i4.0
IL_004b: stloc.s V_6
IL_004d: br.s IL_0079
IL_004f: ldloc.s V_5
IL_0051: ldloc.s V_6
IL_0053: ldelem.ref
IL_0054: stloc.s V_7
IL_0056: ldloc.s V_7
IL_0058: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_005d: brfalse.s IL_0073
IL_005f: ldloc.3
IL_0060: ldloc.s V_7
IL_0062: ldloc.s V_7
IL_0064: callvirt System.Single UnityEngine.ParticleSystemForceField::get_endRange()
IL_0069: newobj System.Void RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline::.ctor(UnityEngine.ParticleSystemForceField,System.Single)
IL_006e: callvirt System.Void System.Collections.Generic.List`1<RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline>::Add(!0)
IL_0073: ldloc.s V_6
IL_0075: ldc.i4.1
IL_0076: add
IL_0077: stloc.s V_6
IL_0079: ldloc.s V_6
IL_007b: ldloc.s V_5
IL_007d: ldlen
IL_007e: conv.i4
IL_007f: blt.s IL_004f
IL_0081: ldarg.0
IL_0082: ldloc.3
IL_0083: callvirt !0[] System.Collections.Generic.List`1<RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline>::ToArray()
IL_0088: newobj System.Void RunicBuildCamera.Integration.DemisterRuntime/BallState::.ctor(UnityEngine.GameObject,RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline[])
IL_008d: stloc.s V_4
IL_008f: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState> RunicBuildCamera.Integration.DemisterRuntime::BallStates
IL_0094: ldloc.0
IL_0095: ldloc.s V_4
IL_0097: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState>::set_Item(!0,!1)
IL_009c: ldloc.s V_4
IL_009e: ret
// EH Catch: 43 - 53 => 53 - 62

// System.Void RunicBuildCamera.Integration.DemisterRuntime::ApplyRange(RunicBuildCamera.Integration.DemisterRuntime/BallState,System.Single)
.locals System.Single, RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline[], System.Int32, RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline, UnityEngine.ParticleSystemForceField, System.Double
IL_0000: ldarg.1
IL_0001: call System.Boolean RunicBuildCamera.Integration.DemisterRuntime::IsFinite(System.Single)
IL_0006: brfalse.s IL_0010
IL_0008: ldarg.1
IL_0009: ldc.r4 0
IL_000e: bgt.s IL_0017
IL_0010: ldc.r4 1
IL_0015: br.s IL_0018
IL_0017: ldarg.1
IL_0018: stloc.0
IL_0019: ldarg.0
IL_001a: callvirt RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline[] RunicBuildCamera.Integration.DemisterRuntime/BallState::get_ForceFields()
IL_001f: stloc.1
IL_0020: ldc.i4.0
IL_0021: stloc.2
IL_0022: br.s IL_008e
IL_0024: ldloc.1
IL_0025: ldloc.2
IL_0026: ldelem.any RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline
IL_002b: stloc.3
IL_002c: ldloca.s V_3
IL_002e: call UnityEngine.ParticleSystemForceField RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline::get_Field()
IL_0033: stloc.s V_4
IL_0035: ldloc.s V_4
IL_0037: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_003c: brfalse.s IL_008a
IL_003e: ldloca.s V_3
IL_0040: call System.Single RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline::get_EndRange()
IL_0045: conv.r8
IL_0046: ldloc.0
IL_0047: conv.r8
IL_0048: mul
IL_0049: stloc.s V_5
IL_004b: ldloc.s V_4
IL_004d: ldloc.s V_5
IL_004f: call System.Boolean System.Double::IsNaN(System.Double)
IL_0054: brtrue.s IL_007e
IL_0056: ldloc.s V_5
IL_0058: call System.Boolean System.Double::IsInfinity(System.Double)
IL_005d: brtrue.s IL_007e
IL_005f: ldloc.s V_5
IL_0061: ldc.r8 3.4028234663852886E+38
IL_006a: bgt.s IL_007e
IL_006c: ldloc.s V_5
IL_006e: ldc.r8 -3.4028234663852886E+38
IL_0077: blt.s IL_007e
IL_0079: ldloc.s V_5
IL_007b: conv.r4
IL_007c: br.s IL_0085
IL_007e: ldloca.s V_3
IL_0080: call System.Single RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline::get_EndRange()
IL_0085: callvirt System.Void UnityEngine.ParticleSystemForceField::set_endRange(System.Single)
IL_008a: ldloc.2
IL_008b: ldc.i4.1
IL_008c: add
IL_008d: stloc.2
IL_008e: ldloc.2
IL_008f: ldloc.1
IL_0090: ldlen
IL_0091: conv.i4
IL_0092: blt.s IL_0024
IL_0094: ret

// System.Void RunicBuildCamera.Integration.DemisterRuntime::RestoreEffect(SE_Demister)
.locals System.Int32, System.Int32, UnityEngine.GameObject
IL_0000: ldarg.0
IL_0001: ldnull
IL_0002: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0007: brfalse.s IL_000a
IL_0009: ret
IL_000a: ldarg.0
IL_000b: callvirt System.Int32 UnityEngine.Object::GetInstanceID()
IL_0010: stloc.0
IL_0011: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,System.Int32> RunicBuildCamera.Integration.DemisterRuntime::EffectBallIds
IL_0016: ldloc.0
IL_0017: ldloca.s V_1
IL_0019: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,System.Int32>::TryGetValue(!0,!1&)
IL_001e: brfalse.s IL_0033
IL_0020: ldloc.1
IL_0021: call System.Void RunicBuildCamera.Integration.DemisterRuntime::RestoreBall(System.Int32)
IL_0026: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,System.Int32> RunicBuildCamera.Integration.DemisterRuntime::EffectBallIds
IL_002b: ldloc.0
IL_002c: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,System.Int32>::Remove(!0)
IL_0031: pop
IL_0032: ret
IL_0033: ldarg.0
IL_0034: call UnityEngine.GameObject RunicBuildCamera.Integration.DemisterRuntime::GetBall(SE_Demister)
IL_0039: stloc.2
IL_003a: ldloc.2
IL_003b: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0040: brfalse.s IL_004d
IL_0042: ldloc.2
IL_0043: callvirt System.Int32 UnityEngine.Object::GetInstanceID()
IL_0048: call System.Void RunicBuildCamera.Integration.DemisterRuntime::RestoreBall(System.Int32)
IL_004d: ret

// System.Void RunicBuildCamera.Integration.DemisterRuntime::RestoreBall(System.Int32)
.locals RunicBuildCamera.Integration.DemisterRuntime/BallState, System.Collections.Generic.List`1<System.Int32>, System.Collections.Generic.Dictionary`2/Enumerator<System.Int32,System.Int32>, System.Collections.Generic.KeyValuePair`2<System.Int32,System.Int32>, System.Collections.Generic.List`1/Enumerator<System.Int32>, System.Int32
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState> RunicBuildCamera.Integration.DemisterRuntime::BallStates
IL_0005: ldarg.0
IL_0006: ldloca.s V_0
IL_0008: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState>::TryGetValue(!0,!1&)
IL_000d: brtrue.s IL_0010
IL_000f: ret
IL_0010: ldloc.0
IL_0011: call System.Void RunicBuildCamera.Integration.DemisterRuntime::RestoreState(RunicBuildCamera.Integration.DemisterRuntime/BallState)
IL_0016: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState> RunicBuildCamera.Integration.DemisterRuntime::BallStates
IL_001b: ldarg.0
IL_001c: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState>::Remove(!0)
IL_0021: pop
IL_0022: ldnull
IL_0023: stloc.1
IL_0024: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,System.Int32> RunicBuildCamera.Integration.DemisterRuntime::EffectBallIds
IL_0029: callvirt System.Collections.Generic.Dictionary`2/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2<System.Int32,System.Int32>::GetEnumerator()
IL_002e: stloc.2
IL_002f: br.s IL_0059
IL_0031: ldloca.s V_2
IL_0033: call System.Collections.Generic.KeyValuePair`2<!0,!1> System.Collections.Generic.Dictionary`2/Enumerator<System.Int32,System.Int32>::get_Current()
IL_0038: stloc.3
IL_0039: ldloca.s V_3
IL_003b: call !1 System.Collections.Generic.KeyValuePair`2<System.Int32,System.Int32>::get_Value()
IL_0040: ldarg.0
IL_0041: bne.un.s IL_0059
IL_0043: ldloc.1
IL_0044: brtrue.s IL_004c
IL_0046: newobj System.Void System.Collections.Generic.List`1<System.Int32>::.ctor()
IL_004b: stloc.1
IL_004c: ldloc.1
IL_004d: ldloca.s V_3
IL_004f: call !0 System.Collections.Generic.KeyValuePair`2<System.Int32,System.Int32>::get_Key()
IL_0054: callvirt System.Void System.Collections.Generic.List`1<System.Int32>::Add(!0)
IL_0059: ldloca.s V_2
IL_005b: call System.Boolean System.Collections.Generic.Dictionary`2/Enumerator<System.Int32,System.Int32>::MoveNext()
IL_0060: brtrue.s IL_0031
IL_0062: leave.s IL_0072
IL_0064: ldloca.s V_2
IL_0066: constrained. System.Collections.Generic.Dictionary`2/Enumerator<System.Int32,System.Int32>
IL_006c: callvirt System.Void System.IDisposable::Dispose()
IL_0071: endfinally
IL_0072: ldloc.1
IL_0073: brtrue.s IL_0076
IL_0075: ret
IL_0076: ldloc.1
IL_0077: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.Int32>::GetEnumerator()
IL_007c: stloc.s V_4
IL_007e: br.s IL_0096
IL_0080: ldloca.s V_4
IL_0082: call !0 System.Collections.Generic.List`1/Enumerator<System.Int32>::get_Current()
IL_0087: stloc.s V_5
IL_0089: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,System.Int32> RunicBuildCamera.Integration.DemisterRuntime::EffectBallIds
IL_008e: ldloc.s V_5
IL_0090: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,System.Int32>::Remove(!0)
IL_0095: pop
IL_0096: ldloca.s V_4
IL_0098: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.Int32>::MoveNext()
IL_009d: brtrue.s IL_0080
IL_009f: leave.s IL_00af
IL_00a1: ldloca.s V_4
IL_00a3: constrained. System.Collections.Generic.List`1/Enumerator<System.Int32>
IL_00a9: callvirt System.Void System.IDisposable::Dispose()
IL_00ae: endfinally
IL_00af: ret
// EH Finally: 47 - 100 => 100 - 114
// EH Finally: 126 - 161 => 161 - 175

// System.Void RunicBuildCamera.Integration.DemisterRuntime::RestoreState(RunicBuildCamera.Integration.DemisterRuntime/BallState)
.locals Player, RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline[], System.Int32, RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline, UnityEngine.ParticleSystemForceField
IL_0000: ldarg.0
IL_0001: callvirt RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline[] RunicBuildCamera.Integration.DemisterRuntime/BallState::get_ForceFields()
IL_0006: stloc.1
IL_0007: ldc.i4.0
IL_0008: stloc.2
IL_0009: br.s IL_0037
IL_000b: ldloc.1
IL_000c: ldloc.2
IL_000d: ldelem.any RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline
IL_0012: stloc.3
IL_0013: ldloca.s V_3
IL_0015: call UnityEngine.ParticleSystemForceField RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline::get_Field()
IL_001a: stloc.s V_4
IL_001c: ldloc.s V_4
IL_001e: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0023: brfalse.s IL_0033
IL_0025: ldloc.s V_4
IL_0027: ldloca.s V_3
IL_0029: call System.Single RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline::get_EndRange()
IL_002e: callvirt System.Void UnityEngine.ParticleSystemForceField::set_endRange(System.Single)
IL_0033: ldloc.2
IL_0034: ldc.i4.1
IL_0035: add
IL_0036: stloc.2
IL_0037: ldloc.2
IL_0038: ldloc.1
IL_0039: ldlen
IL_003a: conv.i4
IL_003b: blt.s IL_000b
IL_003d: ldsfld Player Player::m_localPlayer
IL_0042: stloc.0
IL_0043: ldarg.0
IL_0044: callvirt UnityEngine.GameObject RunicBuildCamera.Integration.DemisterRuntime/BallState::get_Ball()
IL_0049: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_004e: brfalse.s IL_006e
IL_0050: ldloc.0
IL_0051: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0056: brfalse.s IL_006e
IL_0058: ldarg.0
IL_0059: callvirt UnityEngine.GameObject RunicBuildCamera.Integration.DemisterRuntime/BallState::get_Ball()
IL_005e: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0063: ldloc.0
IL_0064: callvirt UnityEngine.Vector3 Character::GetCenterPoint()
IL_0069: callvirt System.Void UnityEngine.Transform::set_position(UnityEngine.Vector3)
IL_006e: ret

// System.Void RunicBuildCamera.Integration.DemisterRuntime::RestoreAll()
.locals System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState>
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState> RunicBuildCamera.Integration.DemisterRuntime::BallStates
IL_0005: callvirt System.Collections.Generic.Dictionary`2/ValueCollection<!0,!1> System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState>::get_Values()
IL_000a: callvirt System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2/ValueCollection<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState>::GetEnumerator()
IL_000f: stloc.0
IL_0010: br.s IL_001e
IL_0012: ldloca.s V_0
IL_0014: call !1 System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState>::get_Current()
IL_0019: call System.Void RunicBuildCamera.Integration.DemisterRuntime::RestoreState(RunicBuildCamera.Integration.DemisterRuntime/BallState)
IL_001e: ldloca.s V_0
IL_0020: call System.Boolean System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState>::MoveNext()
IL_0025: brtrue.s IL_0012
IL_0027: leave.s IL_0037
IL_0029: ldloca.s V_0
IL_002b: constrained. System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState>
IL_0031: callvirt System.Void System.IDisposable::Dispose()
IL_0036: endfinally
IL_0037: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState> RunicBuildCamera.Integration.DemisterRuntime::BallStates
IL_003c: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState>::Clear()
IL_0041: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,System.Int32> RunicBuildCamera.Integration.DemisterRuntime::EffectBallIds
IL_0046: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Int32>::Clear()
IL_004b: ret
// EH Finally: 16 - 41 => 41 - 55

// System.Void RunicBuildCamera.Integration.DemisterRuntime::PruneDestroyedBalls()
.locals System.Collections.Generic.List`1<System.Int32>, System.Collections.Generic.Dictionary`2/Enumerator<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState>, System.Collections.Generic.KeyValuePair`2<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState>, System.Collections.Generic.List`1/Enumerator<System.Int32>
IL_0000: ldnull
IL_0001: stloc.0
IL_0002: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState> RunicBuildCamera.Integration.DemisterRuntime::BallStates
IL_0007: callvirt System.Collections.Generic.Dictionary`2/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState>::GetEnumerator()
IL_000c: stloc.1
IL_000d: br.s IL_0040
IL_000f: ldloca.s V_1
IL_0011: call System.Collections.Generic.KeyValuePair`2<!0,!1> System.Collections.Generic.Dictionary`2/Enumerator<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState>::get_Current()
IL_0016: stloc.2
IL_0017: ldloca.s V_2
IL_0019: call !1 System.Collections.Generic.KeyValuePair`2<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState>::get_Value()
IL_001e: callvirt UnityEngine.GameObject RunicBuildCamera.Integration.DemisterRuntime/BallState::get_Ball()
IL_0023: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0028: brtrue.s IL_0040
IL_002a: ldloc.0
IL_002b: brtrue.s IL_0033
IL_002d: newobj System.Void System.Collections.Generic.List`1<System.Int32>::.ctor()
IL_0032: stloc.0
IL_0033: ldloc.0
IL_0034: ldloca.s V_2
IL_0036: call !0 System.Collections.Generic.KeyValuePair`2<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState>::get_Key()
IL_003b: callvirt System.Void System.Collections.Generic.List`1<System.Int32>::Add(!0)
IL_0040: ldloca.s V_1
IL_0042: call System.Boolean System.Collections.Generic.Dictionary`2/Enumerator<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState>::MoveNext()
IL_0047: brtrue.s IL_000f
IL_0049: leave.s IL_0059
IL_004b: ldloca.s V_1
IL_004d: constrained. System.Collections.Generic.Dictionary`2/Enumerator<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState>
IL_0053: callvirt System.Void System.IDisposable::Dispose()
IL_0058: endfinally
IL_0059: ldloc.0
IL_005a: brtrue.s IL_005d
IL_005c: ret
IL_005d: ldloc.0
IL_005e: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.Int32>::GetEnumerator()
IL_0063: stloc.3
IL_0064: br.s IL_0072
IL_0066: ldloca.s V_3
IL_0068: call !0 System.Collections.Generic.List`1/Enumerator<System.Int32>::get_Current()
IL_006d: call System.Void RunicBuildCamera.Integration.DemisterRuntime::RestoreBall(System.Int32)
IL_0072: ldloca.s V_3
IL_0074: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.Int32>::MoveNext()
IL_0079: brtrue.s IL_0066
IL_007b: leave.s IL_008b
IL_007d: ldloca.s V_3
IL_007f: constrained. System.Collections.Generic.List`1/Enumerator<System.Int32>
IL_0085: callvirt System.Void System.IDisposable::Dispose()
IL_008a: endfinally
IL_008b: ret
// EH Finally: 13 - 75 => 75 - 89
// EH Finally: 100 - 125 => 125 - 139

// UnityEngine.GameObject RunicBuildCamera.Integration.DemisterRuntime::GetBall(SE_Demister)
.locals UnityEngine.GameObject
IL_0000: ldarg.0
IL_0001: ldnull
IL_0002: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0007: brtrue.s IL_003d
IL_0009: ldsfld System.Reflection.FieldInfo RunicBuildCamera.Integration.DemisterRuntime::BallInstanceField
IL_000e: ldnull
IL_000f: call System.Boolean System.Reflection.FieldInfo::op_Equality(System.Reflection.FieldInfo,System.Reflection.FieldInfo)
IL_0014: brtrue.s IL_003d
IL_0016: ldsfld System.Reflection.FieldInfo RunicBuildCamera.Integration.DemisterRuntime::BallInstanceField
IL_001b: callvirt System.Type System.Reflection.FieldInfo::get_FieldType()
IL_0020: ldtoken UnityEngine.GameObject
IL_0025: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_002a: call System.Boolean System.Type::op_Inequality(System.Type,System.Type)
IL_002f: brtrue.s IL_003d
IL_0031: ldsfld System.Reflection.FieldInfo RunicBuildCamera.Integration.DemisterRuntime::BallInstanceField
IL_0036: callvirt System.Boolean System.Reflection.FieldInfo::get_IsStatic()
IL_003b: brfalse.s IL_003f
IL_003d: ldnull
IL_003e: ret
IL_003f: nop
IL_0040: ldsfld System.Reflection.FieldInfo RunicBuildCamera.Integration.DemisterRuntime::BallInstanceField
IL_0045: ldarg.0
IL_0046: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_004b: isinst UnityEngine.GameObject
IL_0050: stloc.0
IL_0051: leave.s IL_0058
IL_0053: pop
IL_0054: ldnull
IL_0055: stloc.0
IL_0056: leave.s IL_0058
IL_0058: ldloc.0
IL_0059: ret
// EH Catch: 64 - 83 => 83 - 88

// System.Void RunicBuildCamera.Integration.DemisterRuntime::EnsureSubscribed()
.locals 
IL_0000: ldsfld System.Boolean RunicBuildCamera.Integration.DemisterRuntime::_subscribed
IL_0005: brfalse.s IL_0008
IL_0007: ret
IL_0008: ldsfld System.Action RunicBuildCamera.Integration.DemisterRuntime/<>O::<0>__OnConfigurationChanged
IL_000d: dup
IL_000e: brtrue.s IL_0023
IL_0010: pop
IL_0011: ldnull
IL_0012: ldftn System.Void RunicBuildCamera.Integration.DemisterRuntime::OnConfigurationChanged()
IL_0018: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_001d: dup
IL_001e: stsfld System.Action RunicBuildCamera.Integration.DemisterRuntime/<>O::<0>__OnConfigurationChanged
IL_0023: call System.Void RunicBuildCamera.BuildCameraConfig::add_Changed(System.Action)
IL_0028: ldc.i4.1
IL_0029: stsfld System.Boolean RunicBuildCamera.Integration.DemisterRuntime::_subscribed
IL_002e: ret

// System.Void RunicBuildCamera.Integration.DemisterRuntime::OnConfigurationChanged()
.locals 
IL_0000: call System.Void RunicBuildCamera.Integration.DemisterRuntime::RestoreAll()
IL_0005: ret

// System.Boolean RunicBuildCamera.Integration.DemisterRuntime::IsFinite(UnityEngine.Vector3)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Single UnityEngine.Vector3::x
IL_0006: call System.Boolean RunicBuildCamera.Integration.DemisterRuntime::IsFinite(System.Single)
IL_000b: brfalse.s IL_0026
IL_000d: ldarg.0
IL_000e: ldfld System.Single UnityEngine.Vector3::y
IL_0013: call System.Boolean RunicBuildCamera.Integration.DemisterRuntime::IsFinite(System.Single)
IL_0018: brfalse.s IL_0026
IL_001a: ldarg.0
IL_001b: ldfld System.Single UnityEngine.Vector3::z
IL_0020: call System.Boolean RunicBuildCamera.Integration.DemisterRuntime::IsFinite(System.Single)
IL_0025: ret
IL_0026: ldc.i4.0
IL_0027: ret

// System.Boolean RunicBuildCamera.Integration.DemisterRuntime::IsFinite(System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean System.Single::IsNaN(System.Single)
IL_0006: brtrue.s IL_0012
IL_0008: ldarg.0
IL_0009: call System.Boolean System.Single::IsInfinity(System.Single)
IL_000e: ldc.i4.0
IL_000f: ceq
IL_0011: ret
IL_0012: ldc.i4.0
IL_0013: ret

// System.Void RunicBuildCamera.Integration.DemisterRuntime::.cctor()
.locals 
IL_0000: ldtoken SE_Demister
IL_0005: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_000a: ldstr "m_ballInstance"
IL_000f: call System.Reflection.FieldInfo HarmonyLib.AccessTools::Field(System.Type,System.String)
IL_0014: stsfld System.Reflection.FieldInfo RunicBuildCamera.Integration.DemisterRuntime::BallInstanceField
IL_0019: newobj System.Void System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState>::.ctor()
IL_001e: stsfld System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.DemisterRuntime/BallState> RunicBuildCamera.Integration.DemisterRuntime::BallStates
IL_0023: newobj System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Int32>::.ctor()
IL_0028: stsfld System.Collections.Generic.Dictionary`2<System.Int32,System.Int32> RunicBuildCamera.Integration.DemisterRuntime::EffectBallIds
IL_002d: ret

// System.Void RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline::.ctor(UnityEngine.ParticleSystemForceField,System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld UnityEngine.ParticleSystemForceField RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline::<Field>k__BackingField
IL_0007: ldarg.0
IL_0008: ldarg.2
IL_0009: stfld System.Single RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline::<EndRange>k__BackingField
IL_000e: ret

// UnityEngine.ParticleSystemForceField RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline::get_Field()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld UnityEngine.ParticleSystemForceField RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline::<Field>k__BackingField
IL_0006: ret

// System.Single RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline::get_EndRange()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Single RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline::<EndRange>k__BackingField
IL_0006: ret

// System.Void RunicBuildCamera.Integration.DemisterRuntime/BallState::.ctor(UnityEngine.GameObject,RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline[])
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ldarg.0
IL_0007: ldarg.1
IL_0008: stfld UnityEngine.GameObject RunicBuildCamera.Integration.DemisterRuntime/BallState::<Ball>k__BackingField
IL_000d: ldarg.0
IL_000e: ldarg.2
IL_000f: dup
IL_0010: brtrue.s IL_0018
IL_0012: pop
IL_0013: call !!0[] System.Array::Empty<RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline>()
IL_0018: stfld RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline[] RunicBuildCamera.Integration.DemisterRuntime/BallState::<ForceFields>k__BackingField
IL_001d: ret

// UnityEngine.GameObject RunicBuildCamera.Integration.DemisterRuntime/BallState::get_Ball()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld UnityEngine.GameObject RunicBuildCamera.Integration.DemisterRuntime/BallState::<Ball>k__BackingField
IL_0006: ret

// RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline[] RunicBuildCamera.Integration.DemisterRuntime/BallState::get_ForceFields()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld RunicBuildCamera.Integration.DemisterRuntime/ForceFieldBaseline[] RunicBuildCamera.Integration.DemisterRuntime/BallState::<ForceFields>k__BackingField
IL_0006: ret

// System.Reflection.MethodBase RunicBuildCamera.Integration.GameCameraRemoteEffectsPatch::TargetMethod()
.locals 
IL_0000: call System.Reflection.MethodInfo RunicBuildCamera.Integration.ValheimAdapter::get_UpdateCameraMethod()
IL_0005: ret

// System.Void RunicBuildCamera.Integration.GameCameraRemoteEffectsPatch::Postfix()
.locals 
IL_0000: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::Tick()
IL_0005: call System.Void RunicBuildCamera.Integration.DemisterRuntime::RefreshActiveState()
IL_000a: leave.s IL_001d
IL_000c: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::ReportFailure(System.Exception)
IL_0011: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::Reset()
IL_0016: call System.Void RunicBuildCamera.Integration.DemisterRuntime::OnCameraExit()
IL_001b: leave.s IL_001d
IL_001d: ret
// EH Catch: 0 - 12 => 12 - 29

// System.Void RunicBuildCamera.Integration.DemisterUpdateStatusEffectPatch::Postfix(SE_Demister)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void RunicBuildCamera.Integration.DemisterRuntime::AfterStatusEffectUpdate(SE_Demister)
IL_0006: leave.s IL_0010
IL_0008: pop
IL_0009: call System.Void RunicBuildCamera.Integration.DemisterRuntime::OnCameraExit()
IL_000e: leave.s IL_0010
IL_0010: ret
// EH Catch: 0 - 8 => 8 - 16

// System.Void RunicBuildCamera.Integration.DemisterRemoveEffectsPatch::Prefix(SE_Demister)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void RunicBuildCamera.Integration.DemisterRuntime::BeforeRemoveEffects(SE_Demister)
IL_0006: leave.s IL_0010
IL_0008: pop
IL_0009: call System.Void RunicBuildCamera.Integration.DemisterRuntime::OnCameraExit()
IL_000e: leave.s IL_0010
IL_0010: ret
// EH Catch: 0 - 8 => 8 - 16

// System.Void RunicBuildCamera.Integration.RemoteEffectsLocalPlayerCleanupPatch::Prefix()
.locals 
IL_0000: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::Reset()
IL_0005: call System.Void RunicBuildCamera.Integration.DemisterRuntime::OnCameraExit()
IL_000a: ret

// System.Boolean RunicBuildCamera.Integration.PlayerWardPickupAccess::Allows(UnityEngine.Vector3)
.locals System.Collections.Generic.List`1/Enumerator<PrivateArea>, PrivateArea, Piece, System.Boolean
IL_0000: ldsfld System.Reflection.FieldInfo RunicBuildCamera.Integration.PlayerWardPickupAccess::AreasField
IL_0005: dup
IL_0006: brtrue.s IL_000c
IL_0008: pop
IL_0009: ldnull
IL_000a: br.s IL_0012
IL_000c: ldnull
IL_000d: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_0012: isinst System.Collections.Generic.List`1<PrivateArea>
IL_0017: dup
IL_0018: brtrue.s IL_0025
IL_001a: ldstr "Cannot read the player ward registry."
IL_001f: newobj System.Void System.InvalidOperationException::.ctor(System.String)
IL_0024: throw
IL_0025: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<PrivateArea>::GetEnumerator()
IL_002a: stloc.0
IL_002b: br.s IL_0085
IL_002d: ldloca.s V_0
IL_002f: call !0 System.Collections.Generic.List`1/Enumerator<PrivateArea>::get_Current()
IL_0034: stloc.1
IL_0035: ldloc.1
IL_0036: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_003b: brfalse.s IL_0085
IL_003d: ldloc.1
IL_003e: callvirt !!0 UnityEngine.Component::GetComponent<Piece>()
IL_0043: stloc.2
IL_0044: ldloc.2
IL_0045: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_004a: brfalse.s IL_0085
IL_004c: ldloc.2
IL_004d: callvirt System.Boolean Piece::IsPlacedByPlayer()
IL_0052: brfalse.s IL_0085
IL_0054: ldsfld System.Func`2<PrivateArea,System.Boolean> RunicBuildCamera.Integration.PlayerWardPickupAccess::Enabled
IL_0059: ldloc.1
IL_005a: callvirt !1 System.Func`2<PrivateArea,System.Boolean>::Invoke(!0)
IL_005f: brfalse.s IL_0085
IL_0061: ldsfld System.Func`4<PrivateArea,UnityEngine.Vector3,System.Single,System.Boolean> RunicBuildCamera.Integration.PlayerWardPickupAccess::Inside
IL_0066: ldloc.1
IL_0067: ldarg.0
IL_0068: ldc.r4 0
IL_006d: callvirt !3 System.Func`4<PrivateArea,UnityEngine.Vector3,System.Single,System.Boolean>::Invoke(!0,!1,!2)
IL_0072: brfalse.s IL_0085
IL_0074: ldsfld System.Func`2<PrivateArea,System.Boolean> RunicBuildCamera.Integration.PlayerWardPickupAccess::LocalAccess
IL_0079: ldloc.1
IL_007a: callvirt !1 System.Func`2<PrivateArea,System.Boolean>::Invoke(!0)
IL_007f: brtrue.s IL_0085
IL_0081: ldc.i4.0
IL_0082: stloc.3
IL_0083: leave.s IL_00a0
IL_0085: ldloca.s V_0
IL_0087: call System.Boolean System.Collections.Generic.List`1/Enumerator<PrivateArea>::MoveNext()
IL_008c: brtrue.s IL_002d
IL_008e: leave.s IL_009e
IL_0090: ldloca.s V_0
IL_0092: constrained. System.Collections.Generic.List`1/Enumerator<PrivateArea>
IL_0098: callvirt System.Void System.IDisposable::Dispose()
IL_009d: endfinally
IL_009e: ldc.i4.1
IL_009f: ret
IL_00a0: ldloc.3
IL_00a1: ret
// EH Finally: 43 - 144 => 144 - 158

// System.Void RunicBuildCamera.Integration.PlayerWardPickupAccess::.cctor()
.locals 
IL_0000: ldtoken PrivateArea
IL_0005: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_000a: ldstr "m_allAreas"
IL_000f: call System.Reflection.FieldInfo HarmonyLib.AccessTools::Field(System.Type,System.String)
IL_0014: stsfld System.Reflection.FieldInfo RunicBuildCamera.Integration.PlayerWardPickupAccess::AreasField
IL_0019: ldtoken PrivateArea
IL_001e: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0023: ldstr "IsEnabled"
IL_0028: ldnull
IL_0029: ldnull
IL_002a: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_002f: ldnull
IL_0030: ldc.i4.1
IL_0031: call !!0 HarmonyLib.AccessTools::MethodDelegate<System.Func`2<PrivateArea,System.Boolean>>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_0036: stsfld System.Func`2<PrivateArea,System.Boolean> RunicBuildCamera.Integration.PlayerWardPickupAccess::Enabled
IL_003b: ldtoken PrivateArea
IL_0040: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0045: ldstr "IsInside"
IL_004a: ldnull
IL_004b: ldnull
IL_004c: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_0051: ldnull
IL_0052: ldc.i4.1
IL_0053: call !!0 HarmonyLib.AccessTools::MethodDelegate<System.Func`4<PrivateArea,UnityEngine.Vector3,System.Single,System.Boolean>>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_0058: stsfld System.Func`4<PrivateArea,UnityEngine.Vector3,System.Single,System.Boolean> RunicBuildCamera.Integration.PlayerWardPickupAccess::Inside
IL_005d: ldtoken PrivateArea
IL_0062: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0067: ldstr "HaveLocalAccess"
IL_006c: ldnull
IL_006d: ldnull
IL_006e: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_0073: ldnull
IL_0074: ldc.i4.1
IL_0075: call !!0 HarmonyLib.AccessTools::MethodDelegate<System.Func`2<PrivateArea,System.Boolean>>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_007a: stsfld System.Func`2<PrivateArea,System.Boolean> RunicBuildCamera.Integration.PlayerWardPickupAccess::LocalAccess
IL_007f: ret

// System.Void RunicBuildCamera.Integration.RemotePickupRuntime::ReportFailure(System.Exception)
.locals 
IL_0000: ldstr "Camera pickup update failed: "
IL_0005: ldarg.0
IL_0006: dup
IL_0007: brtrue.s IL_000d
IL_0009: pop
IL_000a: ldnull
IL_000b: br.s IL_0012
IL_000d: callvirt System.String System.Object::ToString()
IL_0012: call System.String System.String::Concat(System.String,System.String)
IL_0017: ldc.i4.1
IL_0018: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::Report(System.String,System.Boolean)
IL_001d: ret

// System.Void RunicBuildCamera.Integration.RemotePickupRuntime::Tick()
.locals System.Boolean, Player, UnityEngine.Vector3, System.Boolean, System.Single, System.Single, System.Single, Inventory, UnityEngine.Quaternion
IL_0000: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::EnsureSubscribed()
IL_0005: ldloca.s V_1
IL_0007: ldloca.s V_2
IL_0009: ldloca.s V_8
IL_000b: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::TryGetActiveContext(Player&,UnityEngine.Vector3&,UnityEngine.Quaternion&)
IL_0010: stloc.0
IL_0011: call System.Boolean RunicBuildCamera.Integration.BuildCameraRuntime::get_IsActive()
IL_0016: brfalse.s IL_002b
IL_0018: call BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_PickupEnabled()
IL_001d: brfalse.s IL_002b
IL_001f: call BepInEx.Configuration.ConfigEntry`1<System.Boolean> RunicBuildCamera.BuildCameraConfig::get_PickupEnabled()
IL_0024: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0029: br.s IL_002c
IL_002b: ldc.i4.0
IL_002c: ldloc.0
IL_002d: and
IL_002e: dup
IL_002f: brtrue.s IL_0037
IL_0031: ldc.i4.0
IL_0032: stsfld System.Boolean RunicBuildCamera.Integration.RemotePickupRuntime::_autoPickupOffShown
IL_0037: brfalse.s IL_0064
IL_0039: ldloc.1
IL_003a: ldnull
IL_003b: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0040: brtrue.s IL_0064
IL_0042: ldloc.1
IL_0043: ldsfld Player Player::m_localPlayer
IL_0048: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_004d: brtrue.s IL_0064
IL_004f: ldloc.1
IL_0050: callvirt System.Boolean Character::IsTeleporting()
IL_0055: brtrue.s IL_0064
IL_0057: ldloc.1
IL_0058: ldloca.s V_3
IL_005a: call System.Boolean RunicBuildCamera.Integration.RemotePickupRuntime::TryReadAutoPickupState(Player,System.Boolean&)
IL_005f: brfalse.s IL_0064
IL_0061: ldloc.3
IL_0062: brtrue.s IL_008a
IL_0064: ldsfld System.Boolean RunicBuildCamera.Integration.RemotePickupRuntime::_wasActive
IL_0069: brtrue.s IL_0084
IL_006b: ldsfld Player RunicBuildCamera.Integration.RemotePickupRuntime::_lastPlayer
IL_0070: ldnull
IL_0071: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0076: brtrue.s IL_0084
IL_0078: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry> RunicBuildCamera.Integration.RemotePickupRuntime::Cooldowns
IL_007d: callvirt System.Int32 System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>::get_Count()
IL_0082: brfalse.s IL_0089
IL_0084: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::ResetTransientState()
IL_0089: ret
IL_008a: ldloc.1
IL_008b: ldsfld Player RunicBuildCamera.Integration.RemotePickupRuntime::_lastPlayer
IL_0090: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0095: brfalse.s IL_00a2
IL_0097: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::ResetTransientState()
IL_009c: ldloc.1
IL_009d: stsfld Player RunicBuildCamera.Integration.RemotePickupRuntime::_lastPlayer
IL_00a2: ldc.i4.1
IL_00a3: stsfld System.Boolean RunicBuildCamera.Integration.RemotePickupRuntime::_wasActive
IL_00a8: call System.Single UnityEngine.Time::get_time()
IL_00ad: stloc.s V_4
IL_00af: ldloc.s V_4
IL_00b1: ldsfld System.Single RunicBuildCamera.Integration.RemotePickupRuntime::_nextScanAt
IL_00b6: call System.Boolean RunicBuildCamera.Core.PickupPolicy::IsScanDue(System.Single,System.Single)
IL_00bb: brtrue.s IL_00be
IL_00bd: ret
IL_00be: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_PickupIntervalSeconds()
IL_00c3: brtrue.s IL_00cc
IL_00c5: ldc.r4 0.2
IL_00ca: br.s IL_00d6
IL_00cc: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_PickupIntervalSeconds()
IL_00d1: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_00d6: stloc.s V_5
IL_00d8: ldloc.s V_4
IL_00da: ldloc.s V_5
IL_00dc: call System.Single RunicBuildCamera.Core.PickupPolicy::NextScanAt(System.Single,System.Single)
IL_00e1: stsfld System.Single RunicBuildCamera.Integration.RemotePickupRuntime::_nextScanAt
IL_00e6: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_PickupRange()
IL_00eb: brtrue.s IL_00f4
IL_00ed: ldc.r4 0
IL_00f2: br.s IL_00fe
IL_00f4: call BepInEx.Configuration.ConfigEntry`1<System.Single> RunicBuildCamera.BuildCameraConfig::get_PickupRange()
IL_00f9: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_00fe: stloc.s V_6
IL_0100: ldloc.s V_6
IL_0102: call System.Boolean System.Single::IsNaN(System.Single)
IL_0107: brtrue.s IL_011b
IL_0109: ldloc.s V_6
IL_010b: call System.Boolean System.Single::IsInfinity(System.Single)
IL_0110: brtrue.s IL_011b
IL_0112: ldloc.s V_6
IL_0114: ldc.r4 0
IL_0119: bgt.un.s IL_011c
IL_011b: ret
IL_011c: ldloc.2
IL_011d: call System.Boolean RunicBuildCamera.Integration.RemotePickupRuntime::IsFinite(UnityEngine.Vector3)
IL_0122: brtrue.s IL_0125
IL_0124: ret
IL_0125: ldloc.1
IL_0126: callvirt Inventory Humanoid::GetInventory()
IL_012b: stloc.s V_7
IL_012d: ldloc.s V_7
IL_012f: brtrue.s IL_0132
IL_0131: ret
IL_0132: ldloc.1
IL_0133: ldloc.s V_7
IL_0135: ldloc.2
IL_0136: ldloc.s V_6
IL_0138: ldloc.s V_5
IL_013a: ldloc.s V_4
IL_013c: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::Scan(Player,Inventory,UnityEngine.Vector3,System.Single,System.Single,System.Single)
IL_0141: ret

// System.Void RunicBuildCamera.Integration.RemotePickupRuntime::Reset()
.locals 
IL_0000: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::ResetTransientState()
IL_0005: ret

// System.Void RunicBuildCamera.Integration.RemotePickupRuntime::Shutdown()
.locals 
IL_0000: ldsfld System.Boolean RunicBuildCamera.Integration.RemotePickupRuntime::_subscribed
IL_0005: brfalse.s IL_002d
IL_0007: ldsfld System.Action RunicBuildCamera.Integration.RemotePickupRuntime/<>O::<0>__OnConfigurationChanged
IL_000c: dup
IL_000d: brtrue.s IL_0022
IL_000f: pop
IL_0010: ldnull
IL_0011: ldftn System.Void RunicBuildCamera.Integration.RemotePickupRuntime::OnConfigurationChanged()
IL_0017: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_001c: dup
IL_001d: stsfld System.Action RunicBuildCamera.Integration.RemotePickupRuntime/<>O::<0>__OnConfigurationChanged
IL_0022: call System.Void RunicBuildCamera.BuildCameraConfig::remove_Changed(System.Action)
IL_0027: ldc.i4.0
IL_0028: stsfld System.Boolean RunicBuildCamera.Integration.RemotePickupRuntime::_subscribed
IL_002d: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::ResetTransientState()
IL_0032: ret

// System.Void RunicBuildCamera.Integration.RemotePickupRuntime::Scan(Player,Inventory,UnityEngine.Vector3,System.Single,System.Single,System.Single)
.locals System.Int32, System.Int32, System.Collections.Generic.List`1<ItemDrop>, System.Exception, System.Int32, ItemDrop, ZNetView, ZDO, System.Boolean, System.Exception
IL_0000: ldsfld System.Reflection.FieldInfo RunicBuildCamera.Integration.RemotePickupRuntime::ItemInstancesField
IL_0005: dup
IL_0006: brtrue.s IL_000c
IL_0008: pop
IL_0009: ldnull
IL_000a: br.s IL_0012
IL_000c: ldnull
IL_000d: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_0012: isinst System.Collections.Generic.List`1<ItemDrop>
IL_0017: stloc.2
IL_0018: ldloc.2
IL_0019: brtrue.s IL_002b
IL_001b: ldstr "Camera pickup could not read Valheim's loaded item registry."
IL_0020: ldc.i4.1
IL_0021: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::Report(System.String,System.Boolean)
IL_0026: leave IL_025f
IL_002b: ldsfld System.Int32 RunicBuildCamera.Integration.RemotePickupRuntime::_pendingIndex
IL_0030: ldsfld System.Int32 RunicBuildCamera.Integration.RemotePickupRuntime::_pendingCount
IL_0035: blt.s IL_0052
IL_0037: ldloc.2
IL_0038: ldsfld ItemDrop[] RunicBuildCamera.Integration.RemotePickupRuntime::ItemBuffer
IL_003d: ldsflda System.Int32 RunicBuildCamera.Integration.RemotePickupRuntime::_scanCursor
IL_0042: call System.Int32 RunicBuildCamera.Core.PickupScanWindow::CopyNext<ItemDrop>(System.Collections.Generic.IReadOnlyList`1<T>,T[],System.Int32&)
IL_0047: stsfld System.Int32 RunicBuildCamera.Integration.RemotePickupRuntime::_pendingCount
IL_004c: ldc.i4.0
IL_004d: stsfld System.Int32 RunicBuildCamera.Integration.RemotePickupRuntime::_pendingIndex
IL_0052: ldsfld System.Int32 RunicBuildCamera.Integration.RemotePickupRuntime::_pendingCount
IL_0057: stloc.0
IL_0058: leave.s IL_007d
IL_005a: stloc.3
IL_005b: ldstr "Camera pickup discovery failed: "
IL_0060: ldloc.3
IL_0061: dup
IL_0062: brtrue.s IL_0068
IL_0064: pop
IL_0065: ldnull
IL_0066: br.s IL_006d
IL_0068: callvirt System.String System.Object::ToString()
IL_006d: call System.String System.String::Concat(System.String,System.String)
IL_0072: ldc.i4.1
IL_0073: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::Report(System.String,System.Boolean)
IL_0078: leave IL_025f
IL_007d: ldsfld System.Collections.Generic.HashSet`1<ZDOID> RunicBuildCamera.Integration.RemotePickupRuntime::SeenThisScan
IL_0082: callvirt System.Void System.Collections.Generic.HashSet`1<ZDOID>::Clear()
IL_0087: ldarg.s now
IL_0089: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::PruneExpiredCooldowns(System.Single)
IL_008e: ldc.i4.0
IL_008f: stloc.1
IL_0090: ldloc.0
IL_0091: ldsfld ItemDrop[] RunicBuildCamera.Integration.RemotePickupRuntime::ItemBuffer
IL_0096: ldlen
IL_0097: conv.i4
IL_0098: call System.Int32 System.Math::Min(System.Int32,System.Int32)
IL_009d: stloc.s V_4
IL_009f: br IL_0241
IL_00a4: ldsfld ItemDrop[] RunicBuildCamera.Integration.RemotePickupRuntime::ItemBuffer
IL_00a9: ldsfld System.Int32 RunicBuildCamera.Integration.RemotePickupRuntime::_pendingIndex
IL_00ae: ldelem.ref
IL_00af: stloc.s V_5
IL_00b1: ldsfld ItemDrop[] RunicBuildCamera.Integration.RemotePickupRuntime::ItemBuffer
IL_00b6: ldsfld System.Int32 RunicBuildCamera.Integration.RemotePickupRuntime::_pendingIndex
IL_00bb: dup
IL_00bc: ldc.i4.1
IL_00bd: add
IL_00be: stsfld System.Int32 RunicBuildCamera.Integration.RemotePickupRuntime::_pendingIndex
IL_00c3: ldnull
IL_00c4: stelem.ref
IL_00c5: ldloc.s V_5
IL_00c7: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_00cc: brfalse IL_0241
IL_00d1: ldloc.s V_5
IL_00d3: callvirt System.Boolean UnityEngine.Behaviour::get_isActiveAndEnabled()
IL_00d8: brfalse IL_0241
IL_00dd: ldloc.s V_5
IL_00df: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_00e4: callvirt System.Boolean UnityEngine.GameObject::get_activeInHierarchy()
IL_00e9: brfalse IL_0241
IL_00ee: ldloc.s V_5
IL_00f0: callvirt !!0 UnityEngine.Component::GetComponent<ZNetView>()
IL_00f5: stloc.s V_6
IL_00f7: ldloc.s V_6
IL_00f9: ldnull
IL_00fa: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_00ff: brfalse.s IL_010a
IL_0101: ldloc.s V_6
IL_0103: callvirt System.Boolean ZNetView::IsValid()
IL_0108: brtrue.s IL_010d
IL_010a: ldnull
IL_010b: br.s IL_0114
IL_010d: ldloc.s V_6
IL_010f: callvirt ZDO ZNetView::GetZDO()
IL_0114: stloc.s V_7
IL_0116: ldloc.s V_7
IL_0118: brfalse IL_0241
IL_011d: ldloc.s V_7
IL_011f: ldflda ZDOID ZDO::m_uid
IL_0124: call System.Boolean ZDOID::IsNone()
IL_0129: brtrue IL_0241
IL_012e: ldsfld System.Collections.Generic.HashSet`1<ZDOID> RunicBuildCamera.Integration.RemotePickupRuntime::SeenThisScan
IL_0133: ldloc.s V_7
IL_0135: ldfld ZDOID ZDO::m_uid
IL_013a: callvirt System.Boolean System.Collections.Generic.HashSet`1<ZDOID>::Add(!0)
IL_013f: brfalse IL_0241
IL_0144: nop
IL_0145: ldloc.s V_5
IL_0147: callvirt System.Void ItemDrop::Load()
IL_014c: ldloc.s V_5
IL_014e: ldloc.s V_7
IL_0150: ldfld ZDOID ZDO::m_uid
IL_0155: ldarg.0
IL_0156: ldarg.1
IL_0157: ldarg.2
IL_0158: ldarg.3
IL_0159: ldarg.s now
IL_015b: ldc.i4.0
IL_015c: call System.Boolean RunicBuildCamera.Integration.RemotePickupRuntime::TryEvaluate(ItemDrop,ZDOID,Player,Inventory,UnityEngine.Vector3,System.Single,System.Single,System.Boolean)
IL_0161: brtrue.s IL_0168
IL_0163: leave IL_0241
IL_0168: ldloc.s V_5
IL_016a: callvirt System.Void ItemDrop::RequestOwn()
IL_016f: ldloc.1
IL_0170: ldc.i4.1
IL_0171: add
IL_0172: stloc.1
IL_0173: ldloc.s V_5
IL_0175: ldc.i4.1
IL_0176: callvirt System.Boolean ItemDrop::CanPickup(System.Boolean)
IL_017b: brtrue.s IL_0197
IL_017d: ldloc.s V_7
IL_017f: ldfld ZDOID ZDO::m_uid
IL_0184: ldarg.s now
IL_0186: ldarg.s interval
IL_0188: call System.Single RunicBuildCamera.Core.PickupPolicy::OwnershipRetryAt(System.Single,System.Single)
IL_018d: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::SetCooldown(ZDOID,System.Single)
IL_0192: leave IL_0241
IL_0197: ldloc.s V_5
IL_0199: callvirt System.Void ItemDrop::Load()
IL_019e: ldloc.s V_5
IL_01a0: ldloc.s V_7
IL_01a2: ldfld ZDOID ZDO::m_uid
IL_01a7: ldarg.0
IL_01a8: ldarg.1
IL_01a9: ldarg.2
IL_01aa: ldarg.3
IL_01ab: ldarg.s now
IL_01ad: ldc.i4.1
IL_01ae: call System.Boolean RunicBuildCamera.Integration.RemotePickupRuntime::TryEvaluate(ItemDrop,ZDOID,Player,Inventory,UnityEngine.Vector3,System.Single,System.Single,System.Boolean)
IL_01b3: brtrue.s IL_01ca
IL_01b5: ldloc.s V_7
IL_01b7: ldfld ZDOID ZDO::m_uid
IL_01bc: ldarg.s now
IL_01be: call System.Single RunicBuildCamera.Core.PickupPolicy::FailedPickupRetryAt(System.Single)
IL_01c3: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::SetCooldown(ZDOID,System.Single)
IL_01c8: leave.s IL_0241
IL_01ca: ldarg.0
IL_01cb: ldloc.s V_5
IL_01cd: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_01d2: ldc.i4.1
IL_01d3: ldc.i4.1
IL_01d4: callvirt System.Boolean Humanoid::Pickup(UnityEngine.GameObject,System.Boolean,System.Boolean)
IL_01d9: stloc.s V_8
IL_01db: ldloc.s V_8
IL_01dd: brtrue.s IL_01ea
IL_01df: ldstr "Camera pickup declined by the normal pickup path or another mod."
IL_01e4: ldc.i4.0
IL_01e5: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::Report(System.String,System.Boolean)
IL_01ea: ldloc.s V_7
IL_01ec: ldfld ZDOID ZDO::m_uid
IL_01f1: ldloc.s V_8
IL_01f3: brtrue.s IL_01fe
IL_01f5: ldarg.s now
IL_01f7: call System.Single RunicBuildCamera.Core.PickupPolicy::FailedPickupRetryAt(System.Single)
IL_01fc: br.s IL_0205
IL_01fe: ldarg.s now
IL_0200: call System.Single RunicBuildCamera.Core.PickupPolicy::CompletedPickupRetryAt(System.Single)
IL_0205: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::SetCooldown(ZDOID,System.Single)
IL_020a: leave.s IL_0241
IL_020c: stloc.s V_9
IL_020e: ldstr "Camera pickup failed: "
IL_0213: ldloc.s V_9
IL_0215: dup
IL_0216: brtrue.s IL_021c
IL_0218: pop
IL_0219: ldnull
IL_021a: br.s IL_0221
IL_021c: callvirt System.String System.Object::ToString()
IL_0221: call System.String System.String::Concat(System.String,System.String)
IL_0226: ldc.i4.1
IL_0227: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::Report(System.String,System.Boolean)
IL_022c: ldloc.s V_7
IL_022e: ldfld ZDOID ZDO::m_uid
IL_0233: ldarg.s now
IL_0235: call System.Single RunicBuildCamera.Core.PickupPolicy::FailedPickupRetryAt(System.Single)
IL_023a: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::SetCooldown(ZDOID,System.Single)
IL_023f: leave.s IL_0241
IL_0241: ldsfld System.Int32 RunicBuildCamera.Integration.RemotePickupRuntime::_pendingIndex
IL_0246: ldloc.s V_4
IL_0248: bge.s IL_0252
IL_024a: ldloc.1
IL_024b: ldc.i4.s 16
IL_024d: blt IL_00a4
IL_0252: leave.s IL_025f
IL_0254: ldsfld System.Collections.Generic.HashSet`1<ZDOID> RunicBuildCamera.Integration.RemotePickupRuntime::SeenThisScan
IL_0259: callvirt System.Void System.Collections.Generic.HashSet`1<ZDOID>::Clear()
IL_025e: endfinally
IL_025f: ret
// EH Catch: 0 - 90 => 90 - 125
// EH Catch: 325 - 524 => 524 - 577
// EH Finally: 144 - 596 => 596 - 607

// System.Boolean RunicBuildCamera.Integration.RemotePickupRuntime::TryEvaluate(ItemDrop,ZDOID,Player,Inventory,UnityEngine.Vector3,System.Single,System.Single,System.Boolean)
.locals ItemDrop/ItemData, ItemDrop/ItemData/SharedData, System.Boolean, RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry, UnityEngine.Vector3, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Single, System.Single, System.Single, System.Boolean, RunicBuildCamera.Core.PickupCandidateFacts, RunicBuildCamera.Core.PickupRejectionReason, UnityEngine.Vector3
IL_0000: ldarg.0
IL_0001: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: brtrue.s IL_000d
IL_000a: ldnull
IL_000b: br.s IL_0013
IL_000d: ldloc.0
IL_000e: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0013: stloc.1
IL_0014: ldloc.0
IL_0015: brfalse.s IL_001a
IL_0017: ldloc.1
IL_0018: brtrue.s IL_001c
IL_001a: ldc.i4.0
IL_001b: ret
IL_001c: ldarg.s ignoreCooldown
IL_001e: brtrue.s IL_003c
IL_0020: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry> RunicBuildCamera.Integration.RemotePickupRuntime::Cooldowns
IL_0025: ldarg.1
IL_0026: ldloca.s V_3
IL_0028: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>::TryGetValue(!0,!1&)
IL_002d: brfalse.s IL_003c
IL_002f: ldarg.s now
IL_0031: ldloca.s V_3
IL_0033: call System.Single RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry::get_RetryAt()
IL_0038: clt
IL_003a: br.s IL_003d
IL_003c: ldc.i4.0
IL_003d: stloc.2
IL_003e: ldarg.0
IL_003f: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0044: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0049: stloc.s V_4
IL_004b: ldloc.s V_4
IL_004d: call System.Boolean RunicBuildCamera.Integration.RemotePickupRuntime::IsFinite(UnityEngine.Vector3)
IL_0052: brfalse.s IL_006f
IL_0054: ldloc.s V_4
IL_0056: ldarg.s cameraPosition
IL_0058: call UnityEngine.Vector3 UnityEngine.Vector3::op_Subtraction(UnityEngine.Vector3,UnityEngine.Vector3)
IL_005d: stloc.s V_15
IL_005f: ldloca.s V_15
IL_0061: call System.Single UnityEngine.Vector3::get_sqrMagnitude()
IL_0066: ldarg.s range
IL_0068: call System.Boolean RunicBuildCamera.Core.PickupPolicy::IsWithinRange(System.Single,System.Single)
IL_006d: br.s IL_0070
IL_006f: ldc.i4.0
IL_0070: stloc.s V_5
IL_0072: ldarg.0
IL_0073: callvirt !!0 UnityEngine.Component::GetComponent<Fish>()
IL_0078: ldnull
IL_0079: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_007e: stloc.s V_6
IL_0080: ldloc.s V_5
IL_0082: brfalse.s IL_00ae
IL_0084: ldloc.s V_6
IL_0086: brtrue.s IL_00ae
IL_0088: ldloc.s V_4
IL_008a: call System.Boolean RunicBuildCamera.Integration.PlayerWardPickupAccess::Allows(UnityEngine.Vector3)
IL_008f: brtrue.s IL_00ae
IL_0091: ldstr "Camera pickup rejected "
IL_0096: ldloc.1
IL_0097: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_009c: ldstr ": PlayerWardDenied"
IL_00a1: call System.String System.String::Concat(System.String,System.String,System.String)
IL_00a6: ldc.i4.0
IL_00a7: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::Report(System.String,System.Boolean)
IL_00ac: ldc.i4.0
IL_00ad: ret
IL_00ae: ldloc.1
IL_00af: ldfld System.Boolean ItemDrop/ItemData/SharedData::m_questItem
IL_00b4: brtrue.s IL_00c4
IL_00b6: ldarg.2
IL_00b7: ldloc.1
IL_00b8: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_00bd: callvirt System.Boolean Humanoid::HaveUniqueKey(System.String)
IL_00c2: br.s IL_00c5
IL_00c4: ldc.i4.1
IL_00c5: stloc.s V_7
IL_00c7: ldarg.3
IL_00c8: ldloc.0
IL_00c9: ldc.i4.m1
IL_00ca: callvirt System.Boolean Inventory::CanAddItem(ItemDrop/ItemData,System.Int32)
IL_00cf: stloc.s V_8
IL_00d1: ldloc.0
IL_00d2: ldc.i4.m1
IL_00d3: callvirt System.Single ItemDrop/ItemData::GetWeight(System.Int32)
IL_00d8: stloc.s V_9
IL_00da: ldarg.3
IL_00db: callvirt System.Single Inventory::GetTotalWeight()
IL_00e0: ldloc.s V_9
IL_00e2: add
IL_00e3: stloc.s V_10
IL_00e5: ldarg.2
IL_00e6: callvirt System.Single Player::GetMaxCarryWeight()
IL_00eb: stloc.s V_11
IL_00ed: ldloc.s V_9
IL_00ef: call System.Boolean System.Single::IsNaN(System.Single)
IL_00f4: brtrue.s IL_0134
IL_00f6: ldloc.s V_9
IL_00f8: call System.Boolean System.Single::IsInfinity(System.Single)
IL_00fd: brtrue.s IL_0134
IL_00ff: ldloc.s V_9
IL_0101: ldc.r4 0
IL_0106: blt.s IL_0134
IL_0108: ldloc.s V_10
IL_010a: call System.Boolean System.Single::IsNaN(System.Single)
IL_010f: brtrue.s IL_0134
IL_0111: ldloc.s V_10
IL_0113: call System.Boolean System.Single::IsInfinity(System.Single)
IL_0118: brtrue.s IL_0134
IL_011a: ldloc.s V_11
IL_011c: call System.Boolean System.Single::IsNaN(System.Single)
IL_0121: brtrue.s IL_0134
IL_0123: ldloc.s V_11
IL_0125: call System.Boolean System.Single::IsInfinity(System.Single)
IL_012a: brtrue.s IL_0134
IL_012c: ldloc.s V_10
IL_012e: ldloc.s V_11
IL_0130: cgt
IL_0132: br.s IL_0135
IL_0134: ldc.i4.1
IL_0135: stloc.s V_12
IL_0137: ldloca.s V_13
IL_0139: ldarga.s id
IL_013b: call System.Boolean ZDOID::IsNone()
IL_0140: ldc.i4.0
IL_0141: ceq
IL_0143: ldloc.s V_5
IL_0145: ldloc.s V_6
IL_0147: ldarg.0
IL_0148: ldfld System.Boolean ItemDrop::m_autoPickup
IL_014d: ldarg.0
IL_014e: callvirt System.Boolean ItemDrop::IsPiece()
IL_0153: ldarg.0
IL_0154: callvirt System.Boolean ItemDrop::InTar()
IL_0159: ldloc.s V_7
IL_015b: ldloc.s V_8
IL_015d: ldloc.s V_12
IL_015f: ldloc.2
IL_0160: call System.Void RunicBuildCamera.Core.PickupCandidateFacts::.ctor(System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean)
IL_0165: ldloca.s V_13
IL_0167: call RunicBuildCamera.Core.PickupRejectionReason RunicBuildCamera.Core.PickupPolicy::Evaluate(RunicBuildCamera.Core.PickupCandidateFacts&)
IL_016c: stloc.s V_14
IL_016e: ldloc.s V_5
IL_0170: brfalse.s IL_01a4
IL_0172: ldloc.s V_14
IL_0174: brfalse.s IL_01a4
IL_0176: ldloc.s V_14
IL_0178: ldc.i4.s 10
IL_017a: beq.s IL_01a4
IL_017c: ldstr "Camera pickup rejected "
IL_0181: ldloc.1
IL_0182: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_0187: ldstr ": "
IL_018c: ldloca.s V_14
IL_018e: constrained. RunicBuildCamera.Core.PickupRejectionReason
IL_0194: callvirt System.String System.Object::ToString()
IL_0199: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_019e: ldc.i4.0
IL_019f: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::Report(System.String,System.Boolean)
IL_01a4: ldloc.s V_14
IL_01a6: ldc.i4.0
IL_01a7: ceq
IL_01a9: ret

// System.Void RunicBuildCamera.Integration.RemotePickupRuntime::SetCooldown(ZDOID,System.Single)
.locals System.Int64
IL_0000: ldarga.s id
IL_0002: call System.Boolean ZDOID::IsNone()
IL_0007: brfalse.s IL_000a
IL_0009: ret
IL_000a: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry> RunicBuildCamera.Integration.RemotePickupRuntime::Cooldowns
IL_000f: ldarg.0
IL_0010: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>::ContainsKey(!0)
IL_0015: brtrue.s IL_002d
IL_0017: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry> RunicBuildCamera.Integration.RemotePickupRuntime::Cooldowns
IL_001c: callvirt System.Int32 System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>::get_Count()
IL_0021: ldc.i4 256
IL_0026: blt.s IL_002d
IL_0028: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::RemoveOldestCooldown()
IL_002d: ldsfld System.Int64 RunicBuildCamera.Integration.RemotePickupRuntime::_cooldownOrdinal
IL_0032: ldc.i8 9223372036854775807
IL_003b: bne.un.s IL_004e
IL_003d: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry> RunicBuildCamera.Integration.RemotePickupRuntime::Cooldowns
IL_0042: callvirt System.Void System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>::Clear()
IL_0047: ldc.i4.0
IL_0048: conv.i8
IL_0049: stsfld System.Int64 RunicBuildCamera.Integration.RemotePickupRuntime::_cooldownOrdinal
IL_004e: ldsfld System.Int64 RunicBuildCamera.Integration.RemotePickupRuntime::_cooldownOrdinal
IL_0053: ldc.i4.1
IL_0054: conv.i8
IL_0055: add
IL_0056: dup
IL_0057: stsfld System.Int64 RunicBuildCamera.Integration.RemotePickupRuntime::_cooldownOrdinal
IL_005c: stloc.0
IL_005d: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry> RunicBuildCamera.Integration.RemotePickupRuntime::Cooldowns
IL_0062: ldarg.0
IL_0063: ldarg.1
IL_0064: ldloc.0
IL_0065: newobj System.Void RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry::.ctor(System.Single,System.Int64)
IL_006a: callvirt System.Void System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>::set_Item(!0,!1)
IL_006f: ret

// System.Void RunicBuildCamera.Integration.RemotePickupRuntime::PruneExpiredCooldowns(System.Single)
.locals System.Collections.Generic.List`1<ZDOID>, System.Collections.Generic.Dictionary`2/Enumerator<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>, System.Collections.Generic.KeyValuePair`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>, RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry, System.Collections.Generic.List`1/Enumerator<ZDOID>, ZDOID
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry> RunicBuildCamera.Integration.RemotePickupRuntime::Cooldowns
IL_0005: callvirt System.Int32 System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>::get_Count()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: ldnull
IL_000e: stloc.0
IL_000f: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry> RunicBuildCamera.Integration.RemotePickupRuntime::Cooldowns
IL_0014: callvirt System.Collections.Generic.Dictionary`2/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>::GetEnumerator()
IL_0019: stloc.1
IL_001a: br.s IL_004c
IL_001c: ldloca.s V_1
IL_001e: call System.Collections.Generic.KeyValuePair`2<!0,!1> System.Collections.Generic.Dictionary`2/Enumerator<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>::get_Current()
IL_0023: stloc.2
IL_0024: ldarg.0
IL_0025: ldloca.s V_2
IL_0027: call !1 System.Collections.Generic.KeyValuePair`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>::get_Value()
IL_002c: stloc.3
IL_002d: ldloca.s V_3
IL_002f: call System.Single RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry::get_RetryAt()
IL_0034: blt.s IL_004c
IL_0036: ldloc.0
IL_0037: brtrue.s IL_003f
IL_0039: newobj System.Void System.Collections.Generic.List`1<ZDOID>::.ctor()
IL_003e: stloc.0
IL_003f: ldloc.0
IL_0040: ldloca.s V_2
IL_0042: call !0 System.Collections.Generic.KeyValuePair`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>::get_Key()
IL_0047: callvirt System.Void System.Collections.Generic.List`1<ZDOID>::Add(!0)
IL_004c: ldloca.s V_1
IL_004e: call System.Boolean System.Collections.Generic.Dictionary`2/Enumerator<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>::MoveNext()
IL_0053: brtrue.s IL_001c
IL_0055: leave.s IL_0065
IL_0057: ldloca.s V_1
IL_0059: constrained. System.Collections.Generic.Dictionary`2/Enumerator<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>
IL_005f: callvirt System.Void System.IDisposable::Dispose()
IL_0064: endfinally
IL_0065: ldloc.0
IL_0066: brtrue.s IL_0069
IL_0068: ret
IL_0069: ldloc.0
IL_006a: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<ZDOID>::GetEnumerator()
IL_006f: stloc.s V_4
IL_0071: br.s IL_0089
IL_0073: ldloca.s V_4
IL_0075: call !0 System.Collections.Generic.List`1/Enumerator<ZDOID>::get_Current()
IL_007a: stloc.s V_5
IL_007c: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry> RunicBuildCamera.Integration.RemotePickupRuntime::Cooldowns
IL_0081: ldloc.s V_5
IL_0083: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>::Remove(!0)
IL_0088: pop
IL_0089: ldloca.s V_4
IL_008b: call System.Boolean System.Collections.Generic.List`1/Enumerator<ZDOID>::MoveNext()
IL_0090: brtrue.s IL_0073
IL_0092: leave.s IL_00a2
IL_0094: ldloca.s V_4
IL_0096: constrained. System.Collections.Generic.List`1/Enumerator<ZDOID>
IL_009c: callvirt System.Void System.IDisposable::Dispose()
IL_00a1: endfinally
IL_00a2: ret
// EH Finally: 26 - 87 => 87 - 101
// EH Finally: 113 - 148 => 148 - 162

// System.Void RunicBuildCamera.Integration.RemotePickupRuntime::RemoveOldestCooldown()
.locals System.Boolean, ZDOID, System.Int64, System.Collections.Generic.Dictionary`2/Enumerator<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>, System.Collections.Generic.KeyValuePair`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>, RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry
IL_0000: ldc.i4.0
IL_0001: stloc.0
IL_0002: ldsfld ZDOID ZDOID::None
IL_0007: stloc.1
IL_0008: ldc.i8 9223372036854775807
IL_0011: stloc.2
IL_0012: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry> RunicBuildCamera.Integration.RemotePickupRuntime::Cooldowns
IL_0017: callvirt System.Collections.Generic.Dictionary`2/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>::GetEnumerator()
IL_001c: stloc.3
IL_001d: br.s IL_0059
IL_001f: ldloca.s V_3
IL_0021: call System.Collections.Generic.KeyValuePair`2<!0,!1> System.Collections.Generic.Dictionary`2/Enumerator<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>::get_Current()
IL_0026: stloc.s V_4
IL_0028: ldloc.0
IL_0029: brfalse.s IL_003e
IL_002b: ldloca.s V_4
IL_002d: call !1 System.Collections.Generic.KeyValuePair`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>::get_Value()
IL_0032: stloc.s V_5
IL_0034: ldloca.s V_5
IL_0036: call System.Int64 RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry::get_Ordinal()
IL_003b: ldloc.2
IL_003c: bge.s IL_0059
IL_003e: ldc.i4.1
IL_003f: stloc.0
IL_0040: ldloca.s V_4
IL_0042: call !0 System.Collections.Generic.KeyValuePair`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>::get_Key()
IL_0047: stloc.1
IL_0048: ldloca.s V_4
IL_004a: call !1 System.Collections.Generic.KeyValuePair`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>::get_Value()
IL_004f: stloc.s V_5
IL_0051: ldloca.s V_5
IL_0053: call System.Int64 RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry::get_Ordinal()
IL_0058: stloc.2
IL_0059: ldloca.s V_3
IL_005b: call System.Boolean System.Collections.Generic.Dictionary`2/Enumerator<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>::MoveNext()
IL_0060: brtrue.s IL_001f
IL_0062: leave.s IL_0072
IL_0064: ldloca.s V_3
IL_0066: constrained. System.Collections.Generic.Dictionary`2/Enumerator<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>
IL_006c: callvirt System.Void System.IDisposable::Dispose()
IL_0071: endfinally
IL_0072: ldloc.0
IL_0073: brfalse.s IL_0081
IL_0075: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry> RunicBuildCamera.Integration.RemotePickupRuntime::Cooldowns
IL_007a: ldloc.1
IL_007b: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>::Remove(!0)
IL_0080: pop
IL_0081: ret
// EH Finally: 29 - 100 => 100 - 114

// System.Void RunicBuildCamera.Integration.RemotePickupRuntime::EnsureSubscribed()
.locals 
IL_0000: ldsfld System.Boolean RunicBuildCamera.Integration.RemotePickupRuntime::_subscribed
IL_0005: brfalse.s IL_0008
IL_0007: ret
IL_0008: ldsfld System.Action RunicBuildCamera.Integration.RemotePickupRuntime/<>O::<0>__OnConfigurationChanged
IL_000d: dup
IL_000e: brtrue.s IL_0023
IL_0010: pop
IL_0011: ldnull
IL_0012: ldftn System.Void RunicBuildCamera.Integration.RemotePickupRuntime::OnConfigurationChanged()
IL_0018: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_001d: dup
IL_001e: stsfld System.Action RunicBuildCamera.Integration.RemotePickupRuntime/<>O::<0>__OnConfigurationChanged
IL_0023: call System.Void RunicBuildCamera.BuildCameraConfig::add_Changed(System.Action)
IL_0028: ldc.i4.1
IL_0029: stsfld System.Boolean RunicBuildCamera.Integration.RemotePickupRuntime::_subscribed
IL_002e: ret

// System.Void RunicBuildCamera.Integration.RemotePickupRuntime::OnConfigurationChanged()
.locals 
IL_0000: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::ResetTransientState()
IL_0005: ret

// System.Void RunicBuildCamera.Integration.RemotePickupRuntime::ResetTransientState()
.locals 
IL_0000: ldc.i4.0
IL_0001: stsfld System.Boolean RunicBuildCamera.Integration.RemotePickupRuntime::_wasActive
IL_0006: ldnull
IL_0007: stsfld Player RunicBuildCamera.Integration.RemotePickupRuntime::_lastPlayer
IL_000c: ldc.r4 0
IL_0011: stsfld System.Single RunicBuildCamera.Integration.RemotePickupRuntime::_nextScanAt
IL_0016: ldc.i4.0
IL_0017: conv.i8
IL_0018: stsfld System.Int64 RunicBuildCamera.Integration.RemotePickupRuntime::_cooldownOrdinal
IL_001d: ldc.i4.0
IL_001e: stsfld System.Int32 RunicBuildCamera.Integration.RemotePickupRuntime::_scanCursor
IL_0023: ldc.i4.0
IL_0024: stsfld System.Int32 RunicBuildCamera.Integration.RemotePickupRuntime::_pendingCount
IL_0029: ldc.i4.0
IL_002a: stsfld System.Int32 RunicBuildCamera.Integration.RemotePickupRuntime::_pendingIndex
IL_002f: ldsfld System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry> RunicBuildCamera.Integration.RemotePickupRuntime::Cooldowns
IL_0034: callvirt System.Void System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>::Clear()
IL_0039: ldsfld System.Collections.Generic.HashSet`1<ZDOID> RunicBuildCamera.Integration.RemotePickupRuntime::SeenThisScan
IL_003e: callvirt System.Void System.Collections.Generic.HashSet`1<ZDOID>::Clear()
IL_0043: ldsfld ItemDrop[] RunicBuildCamera.Integration.RemotePickupRuntime::ItemBuffer
IL_0048: ldc.i4.0
IL_0049: ldsfld ItemDrop[] RunicBuildCamera.Integration.RemotePickupRuntime::ItemBuffer
IL_004e: ldlen
IL_004f: conv.i4
IL_0050: call System.Void System.Array::Clear(System.Array,System.Int32,System.Int32)
IL_0055: ret

// System.Boolean RunicBuildCamera.Integration.RemotePickupRuntime::TryReadAutoPickupState(Player,System.Boolean&)
.locals System.Boolean, System.Exception
IL_0000: ldarg.1
IL_0001: ldc.i4.0
IL_0002: stind.i1
IL_0003: ldarg.0
IL_0004: ldnull
IL_0005: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_000a: brtrue.s IL_0040
IL_000c: ldsfld System.Reflection.FieldInfo RunicBuildCamera.Integration.RemotePickupRuntime::EnableAutoPickupField
IL_0011: ldnull
IL_0012: call System.Boolean System.Reflection.FieldInfo::op_Equality(System.Reflection.FieldInfo,System.Reflection.FieldInfo)
IL_0017: brtrue.s IL_0040
IL_0019: ldsfld System.Reflection.FieldInfo RunicBuildCamera.Integration.RemotePickupRuntime::EnableAutoPickupField
IL_001e: callvirt System.Type System.Reflection.FieldInfo::get_FieldType()
IL_0023: ldtoken System.Boolean
IL_0028: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_002d: call System.Boolean System.Type::op_Inequality(System.Type,System.Type)
IL_0032: brtrue.s IL_0040
IL_0034: ldsfld System.Reflection.FieldInfo RunicBuildCamera.Integration.RemotePickupRuntime::EnableAutoPickupField
IL_0039: callvirt System.Boolean System.Reflection.FieldInfo::get_IsStatic()
IL_003e: brtrue.s IL_004d
IL_0040: ldstr "Camera pickup could not read Valheim's auto-pickup setting."
IL_0045: ldc.i4.1
IL_0046: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::Report(System.String,System.Boolean)
IL_004b: ldc.i4.0
IL_004c: ret
IL_004d: nop
IL_004e: ldarg.1
IL_004f: ldsfld System.Reflection.FieldInfo RunicBuildCamera.Integration.RemotePickupRuntime::EnableAutoPickupField
IL_0054: ldnull
IL_0055: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_005a: unbox.any System.Boolean
IL_005f: stind.i1
IL_0060: ldarg.1
IL_0061: ldind.u1
IL_0062: brtrue.s IL_007a
IL_0064: ldsfld System.Boolean RunicBuildCamera.Integration.RemotePickupRuntime::_autoPickupOffShown
IL_0069: brtrue.s IL_007a
IL_006b: ldarg.0
IL_006c: ldc.i4.1
IL_006d: ldstr "$hud_autopickup: $hud_off"
IL_0072: ldc.i4.0
IL_0073: ldnull
IL_0074: ldc.i4.0
IL_0075: callvirt System.Void Character::Message(MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_007a: ldarg.1
IL_007b: ldind.u1
IL_007c: ldc.i4.0
IL_007d: ceq
IL_007f: stsfld System.Boolean RunicBuildCamera.Integration.RemotePickupRuntime::_autoPickupOffShown
IL_0084: ldarg.1
IL_0085: ldind.u1
IL_0086: brtrue.s IL_0093
IL_0088: ldstr "Camera pickup paused: player auto-pickup is off."
IL_008d: ldc.i4.0
IL_008e: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::Report(System.String,System.Boolean)
IL_0093: ldc.i4.1
IL_0094: stloc.0
IL_0095: leave.s IL_00b9
IL_0097: stloc.1
IL_0098: ldstr "Camera pickup state read failed: "
IL_009d: ldloc.1
IL_009e: dup
IL_009f: brtrue.s IL_00a5
IL_00a1: pop
IL_00a2: ldnull
IL_00a3: br.s IL_00aa
IL_00a5: callvirt System.String System.Object::ToString()
IL_00aa: call System.String System.String::Concat(System.String,System.String)
IL_00af: ldc.i4.1
IL_00b0: call System.Void RunicBuildCamera.Integration.RemotePickupRuntime::Report(System.String,System.Boolean)
IL_00b5: ldc.i4.0
IL_00b6: stloc.0
IL_00b7: leave.s IL_00b9
IL_00b9: ldloc.0
IL_00ba: ret
// EH Catch: 78 - 151 => 151 - 185

// System.Void RunicBuildCamera.Integration.RemotePickupRuntime::Report(System.String,System.Boolean)
.locals 
IL_0000: ldarg.1
IL_0001: brfalse.s IL_0027
IL_0003: call System.Single UnityEngine.Time::get_time()
IL_0008: ldsfld System.Single RunicBuildCamera.Integration.RemotePickupRuntime::_nextWarningAt
IL_000d: bge.un.s IL_0010
IL_000f: ret
IL_0010: call System.Single UnityEngine.Time::get_time()
IL_0015: ldc.r4 5
IL_001a: add
IL_001b: stsfld System.Single RunicBuildCamera.Integration.RemotePickupRuntime::_nextWarningAt
IL_0020: ldarg.0
IL_0021: call System.Void RunicBuildCamera.Diagnostics::Warn(System.String)
IL_0026: ret
IL_0027: call System.Single UnityEngine.Time::get_time()
IL_002c: ldsfld System.Single RunicBuildCamera.Integration.RemotePickupRuntime::_nextDiagnosticAt
IL_0031: bge.un.s IL_0034
IL_0033: ret
IL_0034: call System.Single UnityEngine.Time::get_time()
IL_0039: ldc.r4 5
IL_003e: add
IL_003f: stsfld System.Single RunicBuildCamera.Integration.RemotePickupRuntime::_nextDiagnosticAt
IL_0044: ldarg.0
IL_0045: call System.Void RunicBuildCamera.Diagnostics::Verbose(System.String)
IL_004a: ret

// System.Boolean RunicBuildCamera.Integration.RemotePickupRuntime::IsFinite(UnityEngine.Vector3)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Single UnityEngine.Vector3::x
IL_0006: call System.Boolean System.Single::IsNaN(System.Single)
IL_000b: brtrue.s IL_0050
IL_000d: ldarg.0
IL_000e: ldfld System.Single UnityEngine.Vector3::x
IL_0013: call System.Boolean System.Single::IsInfinity(System.Single)
IL_0018: brtrue.s IL_0050
IL_001a: ldarg.0
IL_001b: ldfld System.Single UnityEngine.Vector3::y
IL_0020: call System.Boolean System.Single::IsNaN(System.Single)
IL_0025: brtrue.s IL_0050
IL_0027: ldarg.0
IL_0028: ldfld System.Single UnityEngine.Vector3::y
IL_002d: call System.Boolean System.Single::IsInfinity(System.Single)
IL_0032: brtrue.s IL_0050
IL_0034: ldarg.0
IL_0035: ldfld System.Single UnityEngine.Vector3::z
IL_003a: call System.Boolean System.Single::IsNaN(System.Single)
IL_003f: brtrue.s IL_0050
IL_0041: ldarg.0
IL_0042: ldfld System.Single UnityEngine.Vector3::z
IL_0047: call System.Boolean System.Single::IsInfinity(System.Single)
IL_004c: ldc.i4.0
IL_004d: ceq
IL_004f: ret
IL_0050: ldc.i4.0
IL_0051: ret

// System.Void RunicBuildCamera.Integration.RemotePickupRuntime::.cctor()
.locals 
IL_0000: ldc.i4 128
IL_0005: newarr ItemDrop
IL_000a: stsfld ItemDrop[] RunicBuildCamera.Integration.RemotePickupRuntime::ItemBuffer
IL_000f: newobj System.Void System.Collections.Generic.HashSet`1<ZDOID>::.ctor()
IL_0014: stsfld System.Collections.Generic.HashSet`1<ZDOID> RunicBuildCamera.Integration.RemotePickupRuntime::SeenThisScan
IL_0019: newobj System.Void System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry>::.ctor()
IL_001e: stsfld System.Collections.Generic.Dictionary`2<ZDOID,RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry> RunicBuildCamera.Integration.RemotePickupRuntime::Cooldowns
IL_0023: ldtoken Player
IL_0028: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_002d: ldstr "m_enableAutoPickup"
IL_0032: call System.Reflection.FieldInfo HarmonyLib.AccessTools::Field(System.Type,System.String)
IL_0037: stsfld System.Reflection.FieldInfo RunicBuildCamera.Integration.RemotePickupRuntime::EnableAutoPickupField
IL_003c: ldtoken ItemDrop
IL_0041: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0046: ldstr "s_instances"
IL_004b: call System.Reflection.FieldInfo HarmonyLib.AccessTools::Field(System.Type,System.String)
IL_0050: stsfld System.Reflection.FieldInfo RunicBuildCamera.Integration.RemotePickupRuntime::ItemInstancesField
IL_0055: ret

// System.Void RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry::.ctor(System.Single,System.Int64)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Single RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry::<RetryAt>k__BackingField
IL_0007: ldarg.0
IL_0008: ldarg.2
IL_0009: stfld System.Int64 RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry::<Ordinal>k__BackingField
IL_000e: ret

// System.Single RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry::get_RetryAt()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Single RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry::<RetryAt>k__BackingField
IL_0006: ret

// System.Int64 RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry::get_Ordinal()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Int64 RunicBuildCamera.Integration.RemotePickupRuntime/CooldownEntry::<Ordinal>k__BackingField
IL_0006: ret

// System.Reflection.MethodInfo RunicBuildCamera.Integration.ValheimAdapter::get_UpdatePlacementMethod()
.locals 
IL_0000: ldsfld System.Reflection.MethodInfo RunicBuildCamera.Integration.ValheimAdapter::<UpdatePlacementMethod>k__BackingField
IL_0005: ret

// System.Void RunicBuildCamera.Integration.ValheimAdapter::set_UpdatePlacementMethod(System.Reflection.MethodInfo)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld System.Reflection.MethodInfo RunicBuildCamera.Integration.ValheimAdapter::<UpdatePlacementMethod>k__BackingField
IL_0006: ret

// System.Reflection.MethodInfo RunicBuildCamera.Integration.ValheimAdapter::get_UpdatePlacementGhostMethod()
.locals 
IL_0000: ldsfld System.Reflection.MethodInfo RunicBuildCamera.Integration.ValheimAdapter::<UpdatePlacementGhostMethod>k__BackingField
IL_0005: ret

// System.Void RunicBuildCamera.Integration.ValheimAdapter::set_UpdatePlacementGhostMethod(System.Reflection.MethodInfo)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld System.Reflection.MethodInfo RunicBuildCamera.Integration.ValheimAdapter::<UpdatePlacementGhostMethod>k__BackingField
IL_0006: ret

// System.Reflection.MethodInfo RunicBuildCamera.Integration.ValheimAdapter::get_UpdateCameraMethod()
.locals 
IL_0000: ldsfld System.Reflection.MethodInfo RunicBuildCamera.Integration.ValheimAdapter::<UpdateCameraMethod>k__BackingField
IL_0005: ret

// System.Void RunicBuildCamera.Integration.ValheimAdapter::set_UpdateCameraMethod(System.Reflection.MethodInfo)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld System.Reflection.MethodInfo RunicBuildCamera.Integration.ValheimAdapter::<UpdateCameraMethod>k__BackingField
IL_0006: ret

// System.Reflection.MethodInfo RunicBuildCamera.Integration.ValheimAdapter::get_SetControlsMethod()
.locals 
IL_0000: ldsfld System.Reflection.MethodInfo RunicBuildCamera.Integration.ValheimAdapter::<SetControlsMethod>k__BackingField
IL_0005: ret

// System.Void RunicBuildCamera.Integration.ValheimAdapter::set_SetControlsMethod(System.Reflection.MethodInfo)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld System.Reflection.MethodInfo RunicBuildCamera.Integration.ValheimAdapter::<SetControlsMethod>k__BackingField
IL_0006: ret

// System.Boolean RunicBuildCamera.Integration.ValheimAdapter::Initialize(System.String&)
.locals System.Reflection.MethodInfo, System.Boolean, System.Exception
IL_0000: ldarg.0
IL_0001: ldnull
IL_0002: stind.ref
IL_0003: ldsfld System.Boolean RunicBuildCamera.Integration.ValheimAdapter::_initialized
IL_0008: brfalse.s IL_000c
IL_000a: ldc.i4.1
IL_000b: ret
IL_000c: nop
IL_000d: ldtoken Player
IL_0012: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0017: ldstr "m_maxPlaceDistance"
IL_001c: ldtoken System.Single
IL_0021: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0026: call System.Reflection.FieldInfo RunicBuildCamera.Integration.ValheimAdapter::RequireField(System.Type,System.String,System.Type)
IL_002b: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<Player,System.Single>(System.Reflection.FieldInfo)
IL_0030: stsfld HarmonyLib.AccessTools/FieldRef`2<Player,System.Single> RunicBuildCamera.Integration.ValheimAdapter::_maxPlaceDistance
IL_0035: ldtoken Humanoid
IL_003a: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_003f: ldstr "m_rightItem"
IL_0044: ldtoken ItemDrop/ItemData
IL_0049: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_004e: call System.Reflection.FieldInfo RunicBuildCamera.Integration.ValheimAdapter::RequireField(System.Type,System.String,System.Type)
IL_0053: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<Humanoid,ItemDrop/ItemData>(System.Reflection.FieldInfo)
IL_0058: stsfld HarmonyLib.AccessTools/FieldRef`2<Humanoid,ItemDrop/ItemData> RunicBuildCamera.Integration.ValheimAdapter::_rightItem
IL_005d: ldtoken Player
IL_0062: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0067: ldstr "UpdatePlacement"
IL_006c: ldtoken System.Void
IL_0071: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0076: ldc.i4.2
IL_0077: newarr System.Type
IL_007c: dup
IL_007d: ldc.i4.0
IL_007e: ldtoken System.Boolean
IL_0083: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0088: stelem.ref
IL_0089: dup
IL_008a: ldc.i4.1
IL_008b: ldtoken System.Single
IL_0090: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0095: stelem.ref
IL_0096: call System.Reflection.MethodInfo RunicBuildCamera.Integration.ValheimAdapter::RequireMethod(System.Type,System.String,System.Type,System.Type[])
IL_009b: call System.Void RunicBuildCamera.Integration.ValheimAdapter::set_UpdatePlacementMethod(System.Reflection.MethodInfo)
IL_00a0: ldtoken Player
IL_00a5: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00aa: ldstr "UpdatePlacementGhost"
IL_00af: ldtoken System.Void
IL_00b4: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00b9: ldc.i4.1
IL_00ba: newarr System.Type
IL_00bf: dup
IL_00c0: ldc.i4.0
IL_00c1: ldtoken System.Boolean
IL_00c6: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00cb: stelem.ref
IL_00cc: call System.Reflection.MethodInfo RunicBuildCamera.Integration.ValheimAdapter::RequireMethod(System.Type,System.String,System.Type,System.Type[])
IL_00d1: call System.Void RunicBuildCamera.Integration.ValheimAdapter::set_UpdatePlacementGhostMethod(System.Reflection.MethodInfo)
IL_00d6: ldtoken GameCamera
IL_00db: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00e0: ldstr "UpdateCamera"
IL_00e5: ldtoken System.Void
IL_00ea: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00ef: ldc.i4.1
IL_00f0: newarr System.Type
IL_00f5: dup
IL_00f6: ldc.i4.0
IL_00f7: ldtoken System.Single
IL_00fc: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0101: stelem.ref
IL_0102: call System.Reflection.MethodInfo RunicBuildCamera.Integration.ValheimAdapter::RequireMethod(System.Type,System.String,System.Type,System.Type[])
IL_0107: call System.Void RunicBuildCamera.Integration.ValheimAdapter::set_UpdateCameraMethod(System.Reflection.MethodInfo)
IL_010c: ldtoken Player
IL_0111: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0116: ldstr "SetControls"
IL_011b: ldtoken System.Void
IL_0120: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0125: ldc.i4.s 12
IL_0127: newarr System.Type
IL_012c: dup
IL_012d: ldc.i4.0
IL_012e: ldtoken UnityEngine.Vector3
IL_0133: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0138: stelem.ref
IL_0139: dup
IL_013a: ldc.i4.1
IL_013b: ldtoken System.Boolean
IL_0140: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0145: stelem.ref
IL_0146: dup
IL_0147: ldc.i4.2
IL_0148: ldtoken System.Boolean
IL_014d: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0152: stelem.ref
IL_0153: dup
IL_0154: ldc.i4.3
IL_0155: ldtoken System.Boolean
IL_015a: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_015f: stelem.ref
IL_0160: dup
IL_0161: ldc.i4.4
IL_0162: ldtoken System.Boolean
IL_0167: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_016c: stelem.ref
IL_016d: dup
IL_016e: ldc.i4.5
IL_016f: ldtoken System.Boolean
IL_0174: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0179: stelem.ref
IL_017a: dup
IL_017b: ldc.i4.6
IL_017c: ldtoken System.Boolean
IL_0181: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0186: stelem.ref
IL_0187: dup
IL_0188: ldc.i4.7
IL_0189: ldtoken System.Boolean
IL_018e: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0193: stelem.ref
IL_0194: dup
IL_0195: ldc.i4.8
IL_0196: ldtoken System.Boolean
IL_019b: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_01a0: stelem.ref
IL_01a1: dup
IL_01a2: ldc.i4.s 9
IL_01a4: ldtoken System.Boolean
IL_01a9: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_01ae: stelem.ref
IL_01af: dup
IL_01b0: ldc.i4.s 10
IL_01b2: ldtoken System.Boolean
IL_01b7: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_01bc: stelem.ref
IL_01bd: dup
IL_01be: ldc.i4.s 11
IL_01c0: ldtoken System.Boolean
IL_01c5: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_01ca: stelem.ref
IL_01cb: call System.Reflection.MethodInfo RunicBuildCamera.Integration.ValheimAdapter::RequireMethod(System.Type,System.String,System.Type,System.Type[])
IL_01d0: call System.Void RunicBuildCamera.Integration.ValheimAdapter::set_SetControlsMethod(System.Reflection.MethodInfo)
IL_01d5: ldtoken Player
IL_01da: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_01df: ldstr "TakeInput"
IL_01e4: ldsfld System.Type[] System.Type::EmptyTypes
IL_01e9: ldnull
IL_01ea: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_01ef: stloc.0
IL_01f0: ldloc.0
IL_01f1: ldnull
IL_01f2: call System.Boolean System.Reflection.MethodInfo::op_Equality(System.Reflection.MethodInfo,System.Reflection.MethodInfo)
IL_01f7: brtrue.s IL_0210
IL_01f9: ldloc.0
IL_01fa: callvirt System.Type System.Reflection.MethodInfo::get_ReturnType()
IL_01ff: ldtoken System.Boolean
IL_0204: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0209: call System.Boolean System.Type::op_Inequality(System.Type,System.Type)
IL_020e: brfalse.s IL_022a
IL_0210: ldtoken Player
IL_0215: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_021a: callvirt System.String System.Type::get_FullName()
IL_021f: ldstr "TakeInput()"
IL_0224: newobj System.Void System.MissingMethodException::.ctor(System.String,System.String)
IL_0229: throw
IL_022a: ldloc.0
IL_022b: ldnull
IL_022c: ldc.i4.1
IL_022d: call !!0 HarmonyLib.AccessTools::MethodDelegate<RunicBuildCamera.Integration.ValheimAdapter/TakeInputDelegate>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_0232: stsfld RunicBuildCamera.Integration.ValheimAdapter/TakeInputDelegate RunicBuildCamera.Integration.ValheimAdapter::_takeInput
IL_0237: ldc.i4.1
IL_0238: stsfld System.Boolean RunicBuildCamera.Integration.ValheimAdapter::_initialized
IL_023d: ldc.i4.1
IL_023e: stloc.1
IL_023f: leave.s IL_0272
IL_0241: stloc.2
IL_0242: call System.Void RunicBuildCamera.Integration.ValheimAdapter::Shutdown()
IL_0247: ldarg.0
IL_0248: ldstr "text_d8ff831563aa"
IL_024d: call System.String Runic.Localization.RunicText::Get(System.String)
IL_0252: ldloc.2
IL_0253: callvirt System.Type System.Exception::GetType()
IL_0258: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_025d: ldstr ": "
IL_0262: ldloc.2
IL_0263: callvirt System.String System.Exception::get_Message()
IL_0268: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_026d: stind.ref
IL_026e: ldc.i4.0
IL_026f: stloc.1
IL_0270: leave.s IL_0272
IL_0272: ldloc.1
IL_0273: ret
// EH Catch: 13 - 577 => 577 - 626

// System.Void RunicBuildCamera.Integration.ValheimAdapter::Shutdown()
.locals 
IL_0000: call System.Void RunicBuildCamera.Integration.ValheimAdapter::ForceRestoreRanges()
IL_0005: ldnull
IL_0006: stsfld HarmonyLib.AccessTools/FieldRef`2<Player,System.Single> RunicBuildCamera.Integration.ValheimAdapter::_maxPlaceDistance
IL_000b: ldnull
IL_000c: stsfld HarmonyLib.AccessTools/FieldRef`2<Humanoid,ItemDrop/ItemData> RunicBuildCamera.Integration.ValheimAdapter::_rightItem
IL_0011: ldnull
IL_0012: stsfld RunicBuildCamera.Integration.ValheimAdapter/TakeInputDelegate RunicBuildCamera.Integration.ValheimAdapter::_takeInput
IL_0017: ldnull
IL_0018: call System.Void RunicBuildCamera.Integration.ValheimAdapter::set_UpdatePlacementMethod(System.Reflection.MethodInfo)
IL_001d: ldnull
IL_001e: call System.Void RunicBuildCamera.Integration.ValheimAdapter::set_UpdatePlacementGhostMethod(System.Reflection.MethodInfo)
IL_0023: ldnull
IL_0024: call System.Void RunicBuildCamera.Integration.ValheimAdapter::set_UpdateCameraMethod(System.Reflection.MethodInfo)
IL_0029: ldnull
IL_002a: call System.Void RunicBuildCamera.Integration.ValheimAdapter::set_SetControlsMethod(System.Reflection.MethodInfo)
IL_002f: ldc.i4.0
IL_0030: stsfld System.Boolean RunicBuildCamera.Integration.ValheimAdapter::_initialized
IL_0035: ret

// System.Boolean RunicBuildCamera.Integration.ValheimAdapter::IsLocalPlayer(Player)
.locals 
IL_0000: ldarg.0
IL_0001: ldnull
IL_0002: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0007: brfalse.s IL_0022
IL_0009: ldsfld Player Player::m_localPlayer
IL_000e: ldnull
IL_000f: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0014: brfalse.s IL_0022
IL_0016: ldarg.0
IL_0017: ldsfld Player Player::m_localPlayer
IL_001c: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0021: ret
IL_0022: ldc.i4.0
IL_0023: ret

// System.Boolean RunicBuildCamera.Integration.ValheimAdapter::IsUsableLocalPlayer(Player)
.locals System.Boolean
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Integration.ValheimAdapter::IsLocalPlayer(Player)
IL_0006: brtrue.s IL_000a
IL_0008: ldc.i4.0
IL_0009: ret
IL_000a: nop
IL_000b: ldarg.0
IL_000c: callvirt System.Boolean Character::IsDead()
IL_0011: brtrue.s IL_001e
IL_0013: ldarg.0
IL_0014: callvirt System.Boolean Character::IsTeleporting()
IL_0019: ldc.i4.0
IL_001a: ceq
IL_001c: br.s IL_001f
IL_001e: ldc.i4.0
IL_001f: stloc.0
IL_0020: leave.s IL_0027
IL_0022: pop
IL_0023: ldc.i4.0
IL_0024: stloc.0
IL_0025: leave.s IL_0027
IL_0027: ldloc.0
IL_0028: ret
// EH Catch: 11 - 34 => 34 - 39

// System.Boolean RunicBuildCamera.Integration.ValheimAdapter::IsBuildToolEquipped(Player)
.locals ItemDrop/ItemData, System.Boolean
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Integration.ValheimAdapter::IsUsableLocalPlayer(Player)
IL_0006: brtrue.s IL_000a
IL_0008: ldc.i4.0
IL_0009: ret
IL_000a: nop
IL_000b: ldsfld HarmonyLib.AccessTools/FieldRef`2<Humanoid,ItemDrop/ItemData> RunicBuildCamera.Integration.ValheimAdapter::_rightItem
IL_0010: brtrue.s IL_0015
IL_0012: ldnull
IL_0013: br.s IL_0021
IL_0015: ldsfld HarmonyLib.AccessTools/FieldRef`2<Humanoid,ItemDrop/ItemData> RunicBuildCamera.Integration.ValheimAdapter::_rightItem
IL_001a: ldarg.0
IL_001b: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Humanoid,ItemDrop/ItemData>::Invoke(!0)
IL_0020: ldind.ref
IL_0021: stloc.0
IL_0022: ldloc.0
IL_0023: brfalse.s IL_0048
IL_0025: ldloc.0
IL_0026: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_002b: brfalse.s IL_0048
IL_002d: ldloc.0
IL_002e: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0033: ldfld PieceTable ItemDrop/ItemData/SharedData::m_buildPieces
IL_0038: ldnull
IL_0039: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_003e: brfalse.s IL_0048
IL_0040: ldarg.0
IL_0041: callvirt System.Boolean Character::InPlaceMode()
IL_0046: br.s IL_0049
IL_0048: ldc.i4.0
IL_0049: stloc.1
IL_004a: leave.s IL_0051
IL_004c: pop
IL_004d: ldc.i4.0
IL_004e: stloc.1
IL_004f: leave.s IL_0051
IL_0051: ldloc.1
IL_0052: ret
// EH Catch: 11 - 76 => 76 - 81

// System.Boolean RunicBuildCamera.Integration.ValheimAdapter::CanTakeInput(Player)
.locals System.Boolean
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Integration.ValheimAdapter::IsUsableLocalPlayer(Player)
IL_0006: brfalse.s IL_000f
IL_0008: ldsfld RunicBuildCamera.Integration.ValheimAdapter/TakeInputDelegate RunicBuildCamera.Integration.ValheimAdapter::_takeInput
IL_000d: brtrue.s IL_0011
IL_000f: ldc.i4.0
IL_0010: ret
IL_0011: nop
IL_0012: ldsfld RunicBuildCamera.Integration.ValheimAdapter/TakeInputDelegate RunicBuildCamera.Integration.ValheimAdapter::_takeInput
IL_0017: ldarg.0
IL_0018: callvirt System.Boolean RunicBuildCamera.Integration.ValheimAdapter/TakeInputDelegate::Invoke(Player)
IL_001d: stloc.0
IL_001e: leave.s IL_0025
IL_0020: pop
IL_0021: ldc.i4.0
IL_0022: stloc.0
IL_0023: leave.s IL_0025
IL_0025: ldloc.0
IL_0026: ret
// EH Catch: 18 - 32 => 32 - 37

// RunicBuildCamera.Integration.ValheimAdapter/RangeLease RunicBuildCamera.Integration.ValheimAdapter::EnterRemoteActionRange(Player,System.Single,System.Single)
.locals System.Int32, RunicBuildCamera.Integration.ValheimAdapter/RangeState
IL_0000: ldsfld System.Boolean RunicBuildCamera.Integration.ValheimAdapter::_initialized
IL_0005: brfalse.s IL_0026
IL_0007: ldarg.0
IL_0008: call System.Boolean RunicBuildCamera.Integration.ValheimAdapter::IsLocalPlayer(Player)
IL_000d: brfalse.s IL_0026
IL_000f: ldsfld HarmonyLib.AccessTools/FieldRef`2<Player,System.Single> RunicBuildCamera.Integration.ValheimAdapter::_maxPlaceDistance
IL_0014: brfalse.s IL_0026
IL_0016: ldarg.1
IL_0017: call System.Boolean RunicBuildCamera.Integration.ValheimAdapter::IsFinite(System.Single)
IL_001c: brfalse.s IL_0026
IL_001e: ldarg.2
IL_001f: call System.Boolean RunicBuildCamera.Integration.ValheimAdapter::IsPositiveFinite(System.Single)
IL_0024: brtrue.s IL_0028
IL_0026: ldnull
IL_0027: ret
IL_0028: ldarg.0
IL_0029: callvirt System.Int32 UnityEngine.Object::GetInstanceID()
IL_002e: stloc.0
IL_002f: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState> RunicBuildCamera.Integration.ValheimAdapter::RangeStates
IL_0034: ldloc.0
IL_0035: ldloca.s V_1
IL_0037: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState>::TryGetValue(!0,!1&)
IL_003c: brtrue.s IL_0077
IL_003e: newobj System.Void RunicBuildCamera.Integration.ValheimAdapter/RangeState::.ctor()
IL_0043: dup
IL_0044: ldarg.0
IL_0045: stfld Player RunicBuildCamera.Integration.ValheimAdapter/RangeState::Player
IL_004a: dup
IL_004b: ldsfld HarmonyLib.AccessTools/FieldRef`2<Player,System.Single> RunicBuildCamera.Integration.ValheimAdapter::_maxPlaceDistance
IL_0050: ldarg.0
IL_0051: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Player,System.Single>::Invoke(!0)
IL_0056: ldind.r4
IL_0057: stfld System.Single RunicBuildCamera.Integration.ValheimAdapter/RangeState::Original
IL_005c: dup
IL_005d: ldarg.2
IL_005e: stfld System.Single RunicBuildCamera.Integration.ValheimAdapter/RangeState::Requested
IL_0063: dup
IL_0064: ldc.i4.0
IL_0065: stfld System.Int32 RunicBuildCamera.Integration.ValheimAdapter/RangeState::Depth
IL_006a: stloc.1
IL_006b: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState> RunicBuildCamera.Integration.ValheimAdapter::RangeStates
IL_0070: ldloc.0
IL_0071: ldloc.1
IL_0072: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState>::Add(!0,!1)
IL_0077: ldloc.1
IL_0078: dup
IL_0079: ldfld System.Int32 RunicBuildCamera.Integration.ValheimAdapter/RangeState::Depth
IL_007e: ldc.i4.1
IL_007f: add
IL_0080: stfld System.Int32 RunicBuildCamera.Integration.ValheimAdapter/RangeState::Depth
IL_0085: ldsfld HarmonyLib.AccessTools/FieldRef`2<Player,System.Single> RunicBuildCamera.Integration.ValheimAdapter::_maxPlaceDistance
IL_008a: ldarg.0
IL_008b: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Player,System.Single>::Invoke(!0)
IL_0090: ldarg.1
IL_0091: stind.r4
IL_0092: ldloc.0
IL_0093: ldloc.1
IL_0094: newobj System.Void RunicBuildCamera.Integration.ValheimAdapter/RangeLease::.ctor(System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState)
IL_0099: ret

// System.Void RunicBuildCamera.Integration.ValheimAdapter::ForceRestoreRanges()
.locals System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState>, RunicBuildCamera.Integration.ValheimAdapter/RangeState
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState> RunicBuildCamera.Integration.ValheimAdapter::RangeStates
IL_0005: callvirt System.Collections.Generic.Dictionary`2/ValueCollection<!0,!1> System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState>::get_Values()
IL_000a: callvirt System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2/ValueCollection<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState>::GetEnumerator()
IL_000f: stloc.0
IL_0010: br.s IL_004b
IL_0012: ldloca.s V_0
IL_0014: call !1 System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState>::get_Current()
IL_0019: stloc.1
IL_001a: ldloc.1
IL_001b: ldfld Player RunicBuildCamera.Integration.ValheimAdapter/RangeState::Player
IL_0020: ldnull
IL_0021: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0026: brfalse.s IL_0046
IL_0028: ldsfld HarmonyLib.AccessTools/FieldRef`2<Player,System.Single> RunicBuildCamera.Integration.ValheimAdapter::_maxPlaceDistance
IL_002d: brfalse.s IL_0046
IL_002f: ldsfld HarmonyLib.AccessTools/FieldRef`2<Player,System.Single> RunicBuildCamera.Integration.ValheimAdapter::_maxPlaceDistance
IL_0034: ldloc.1
IL_0035: ldfld Player RunicBuildCamera.Integration.ValheimAdapter/RangeState::Player
IL_003a: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Player,System.Single>::Invoke(!0)
IL_003f: ldloc.1
IL_0040: ldfld System.Single RunicBuildCamera.Integration.ValheimAdapter/RangeState::Original
IL_0045: stind.r4
IL_0046: leave.s IL_004b
IL_0048: pop
IL_0049: leave.s IL_004b
IL_004b: ldloca.s V_0
IL_004d: call System.Boolean System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState>::MoveNext()
IL_0052: brtrue.s IL_0012
IL_0054: leave.s IL_0064
IL_0056: ldloca.s V_0
IL_0058: constrained. System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState>
IL_005e: callvirt System.Void System.IDisposable::Dispose()
IL_0063: endfinally
IL_0064: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState> RunicBuildCamera.Integration.ValheimAdapter::RangeStates
IL_0069: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState>::Clear()
IL_006e: ret
// EH Catch: 26 - 72 => 72 - 75
// EH Finally: 16 - 86 => 86 - 100

// System.Boolean RunicBuildCamera.Integration.ValheimAdapter::TryGetScopedStationRange(System.Single&)
.locals System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState>, RunicBuildCamera.Integration.ValheimAdapter/RangeState, System.Boolean
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState> RunicBuildCamera.Integration.ValheimAdapter::RangeStates
IL_0005: callvirt System.Collections.Generic.Dictionary`2/ValueCollection<!0,!1> System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState>::get_Values()
IL_000a: callvirt System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2/ValueCollection<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState>::GetEnumerator()
IL_000f: stloc.0
IL_0010: br.s IL_003c
IL_0012: ldloca.s V_0
IL_0014: call !1 System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState>::get_Current()
IL_0019: stloc.1
IL_001a: ldloc.1
IL_001b: ldfld System.Int32 RunicBuildCamera.Integration.ValheimAdapter/RangeState::Depth
IL_0020: ldc.i4.0
IL_0021: ble.s IL_003c
IL_0023: ldloc.1
IL_0024: ldfld System.Single RunicBuildCamera.Integration.ValheimAdapter/RangeState::Requested
IL_0029: call System.Boolean RunicBuildCamera.Integration.ValheimAdapter::IsPositiveFinite(System.Single)
IL_002e: brfalse.s IL_003c
IL_0030: ldarg.0
IL_0031: ldloc.1
IL_0032: ldfld System.Single RunicBuildCamera.Integration.ValheimAdapter/RangeState::Requested
IL_0037: stind.r4
IL_0038: ldc.i4.1
IL_0039: stloc.2
IL_003a: leave.s IL_005e
IL_003c: ldloca.s V_0
IL_003e: call System.Boolean System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState>::MoveNext()
IL_0043: brtrue.s IL_0012
IL_0045: leave.s IL_0055
IL_0047: ldloca.s V_0
IL_0049: constrained. System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState>
IL_004f: callvirt System.Void System.IDisposable::Dispose()
IL_0054: endfinally
IL_0055: ldarg.0
IL_0056: ldc.r4 0
IL_005b: stind.r4
IL_005c: ldc.i4.0
IL_005d: ret
IL_005e: ldloc.2
IL_005f: ret
// EH Finally: 16 - 71 => 71 - 85

// System.Void RunicBuildCamera.Integration.ValheimAdapter::ExitRange(System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState)
.locals RunicBuildCamera.Integration.ValheimAdapter/RangeState
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState> RunicBuildCamera.Integration.ValheimAdapter::RangeStates
IL_0005: ldarg.0
IL_0006: ldloca.s V_0
IL_0008: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState>::TryGetValue(!0,!1&)
IL_000d: brfalse.s IL_0013
IL_000f: ldloc.0
IL_0010: ldarg.1
IL_0011: beq.s IL_0014
IL_0013: ret
IL_0014: ldloc.0
IL_0015: dup
IL_0016: ldfld System.Int32 RunicBuildCamera.Integration.ValheimAdapter/RangeState::Depth
IL_001b: ldc.i4.1
IL_001c: sub
IL_001d: stfld System.Int32 RunicBuildCamera.Integration.ValheimAdapter/RangeState::Depth
IL_0022: ldloc.0
IL_0023: ldfld System.Int32 RunicBuildCamera.Integration.ValheimAdapter/RangeState::Depth
IL_0028: ldc.i4.0
IL_0029: ble.s IL_002c
IL_002b: ret
IL_002c: ldloc.0
IL_002d: ldfld Player RunicBuildCamera.Integration.ValheimAdapter/RangeState::Player
IL_0032: ldnull
IL_0033: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0038: brfalse.s IL_0058
IL_003a: ldsfld HarmonyLib.AccessTools/FieldRef`2<Player,System.Single> RunicBuildCamera.Integration.ValheimAdapter::_maxPlaceDistance
IL_003f: brfalse.s IL_0058
IL_0041: ldsfld HarmonyLib.AccessTools/FieldRef`2<Player,System.Single> RunicBuildCamera.Integration.ValheimAdapter::_maxPlaceDistance
IL_0046: ldloc.0
IL_0047: ldfld Player RunicBuildCamera.Integration.ValheimAdapter/RangeState::Player
IL_004c: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Player,System.Single>::Invoke(!0)
IL_0051: ldloc.0
IL_0052: ldfld System.Single RunicBuildCamera.Integration.ValheimAdapter/RangeState::Original
IL_0057: stind.r4
IL_0058: ldsfld System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState> RunicBuildCamera.Integration.ValheimAdapter::RangeStates
IL_005d: ldarg.0
IL_005e: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState>::Remove(!0)
IL_0063: pop
IL_0064: ret

// System.Reflection.FieldInfo RunicBuildCamera.Integration.ValheimAdapter::RequireField(System.Type,System.String,System.Type)
.locals System.Reflection.FieldInfo
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: call System.Reflection.FieldInfo HarmonyLib.AccessTools::Field(System.Type,System.String)
IL_0007: stloc.0
IL_0008: ldloc.0
IL_0009: ldnull
IL_000a: call System.Boolean System.Reflection.FieldInfo::op_Equality(System.Reflection.FieldInfo,System.Reflection.FieldInfo)
IL_000f: brtrue.s IL_001f
IL_0011: ldloc.0
IL_0012: callvirt System.Type System.Reflection.FieldInfo::get_FieldType()
IL_0017: ldarg.2
IL_0018: call System.Boolean System.Type::op_Inequality(System.Type,System.Type)
IL_001d: brfalse.s IL_002c
IL_001f: ldarg.0
IL_0020: callvirt System.String System.Type::get_FullName()
IL_0025: ldarg.1
IL_0026: newobj System.Void System.MissingFieldException::.ctor(System.String,System.String)
IL_002b: throw
IL_002c: ldloc.0
IL_002d: ret

// System.Reflection.MethodInfo RunicBuildCamera.Integration.ValheimAdapter::RequireMethod(System.Type,System.String,System.Type,System.Type[])
.locals System.Reflection.MethodInfo
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: ldarg.3
IL_0003: ldnull
IL_0004: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_0009: stloc.0
IL_000a: ldloc.0
IL_000b: ldnull
IL_000c: call System.Boolean System.Reflection.MethodInfo::op_Equality(System.Reflection.MethodInfo,System.Reflection.MethodInfo)
IL_0011: brtrue.s IL_0021
IL_0013: ldloc.0
IL_0014: callvirt System.Type System.Reflection.MethodInfo::get_ReturnType()
IL_0019: ldarg.2
IL_001a: call System.Boolean System.Type::op_Inequality(System.Type,System.Type)
IL_001f: brfalse.s IL_002e
IL_0021: ldarg.0
IL_0022: callvirt System.String System.Type::get_FullName()
IL_0027: ldarg.1
IL_0028: newobj System.Void System.MissingMethodException::.ctor(System.String,System.String)
IL_002d: throw
IL_002e: ldloc.0
IL_002f: ret

// System.Boolean RunicBuildCamera.Integration.ValheimAdapter::IsPositiveFinite(System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean System.Single::IsNaN(System.Single)
IL_0006: brtrue.s IL_0019
IL_0008: ldarg.0
IL_0009: call System.Boolean System.Single::IsInfinity(System.Single)
IL_000e: brtrue.s IL_0019
IL_0010: ldarg.0
IL_0011: ldc.r4 0
IL_0016: cgt
IL_0018: ret
IL_0019: ldc.i4.0
IL_001a: ret

// System.Boolean RunicBuildCamera.Integration.ValheimAdapter::IsFinite(System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean System.Single::IsNaN(System.Single)
IL_0006: brtrue.s IL_0012
IL_0008: ldarg.0
IL_0009: call System.Boolean System.Single::IsInfinity(System.Single)
IL_000e: ldc.i4.0
IL_000f: ceq
IL_0011: ret
IL_0012: ldc.i4.0
IL_0013: ret

// System.Void RunicBuildCamera.Integration.ValheimAdapter::.cctor()
.locals 
IL_0000: newobj System.Void System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState>::.ctor()
IL_0005: stsfld System.Collections.Generic.Dictionary`2<System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState> RunicBuildCamera.Integration.ValheimAdapter::RangeStates
IL_000a: ret

// System.Void RunicBuildCamera.Integration.ValheimAdapter/RangeState::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void RunicBuildCamera.Integration.ValheimAdapter/RangeLease::.ctor(System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ldarg.0
IL_0007: ldarg.1
IL_0008: stfld System.Int32 RunicBuildCamera.Integration.ValheimAdapter/RangeLease::_playerId
IL_000d: ldarg.0
IL_000e: ldarg.2
IL_000f: stfld RunicBuildCamera.Integration.ValheimAdapter/RangeState RunicBuildCamera.Integration.ValheimAdapter/RangeLease::_state
IL_0014: ret

// System.Void RunicBuildCamera.Integration.ValheimAdapter/RangeLease::Dispose()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean RunicBuildCamera.Integration.ValheimAdapter/RangeLease::_disposed
IL_0006: brfalse.s IL_0009
IL_0008: ret
IL_0009: ldarg.0
IL_000a: ldc.i4.1
IL_000b: stfld System.Boolean RunicBuildCamera.Integration.ValheimAdapter/RangeLease::_disposed
IL_0010: ldarg.0
IL_0011: ldfld System.Int32 RunicBuildCamera.Integration.ValheimAdapter/RangeLease::_playerId
IL_0016: ldarg.0
IL_0017: ldfld RunicBuildCamera.Integration.ValheimAdapter/RangeState RunicBuildCamera.Integration.ValheimAdapter/RangeLease::_state
IL_001c: call System.Void RunicBuildCamera.Integration.ValheimAdapter::ExitRange(System.Int32,RunicBuildCamera.Integration.ValheimAdapter/RangeState)
IL_0021: ret

// System.Boolean RunicBuildCamera.Core.BuildCameraSession::get_IsActive()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean RunicBuildCamera.Core.BuildCameraSession::<IsActive>k__BackingField
IL_0006: ret

// System.Void RunicBuildCamera.Core.BuildCameraSession::set_IsActive(System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Boolean RunicBuildCamera.Core.BuildCameraSession::<IsActive>k__BackingField
IL_0007: ret

// System.Int32 RunicBuildCamera.Core.BuildCameraSession::get_PlayerInstanceId()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 RunicBuildCamera.Core.BuildCameraSession::<PlayerInstanceId>k__BackingField
IL_0006: ret

// System.Void RunicBuildCamera.Core.BuildCameraSession::set_PlayerInstanceId(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Int32 RunicBuildCamera.Core.BuildCameraSession::<PlayerInstanceId>k__BackingField
IL_0007: ret

// UnityEngine.Vector3 RunicBuildCamera.Core.BuildCameraSession::get_Anchor()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld UnityEngine.Vector3 RunicBuildCamera.Core.BuildCameraSession::<Anchor>k__BackingField
IL_0006: ret

// System.Void RunicBuildCamera.Core.BuildCameraSession::set_Anchor(UnityEngine.Vector3)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld UnityEngine.Vector3 RunicBuildCamera.Core.BuildCameraSession::<Anchor>k__BackingField
IL_0007: ret

// UnityEngine.Vector3 RunicBuildCamera.Core.BuildCameraSession::get_Position()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld UnityEngine.Vector3 RunicBuildCamera.Core.BuildCameraSession::<Position>k__BackingField
IL_0006: ret

// System.Void RunicBuildCamera.Core.BuildCameraSession::set_Position(UnityEngine.Vector3)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld UnityEngine.Vector3 RunicBuildCamera.Core.BuildCameraSession::<Position>k__BackingField
IL_0007: ret

// System.Single RunicBuildCamera.Core.BuildCameraSession::get_Yaw()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Single RunicBuildCamera.Core.BuildCameraSession::<Yaw>k__BackingField
IL_0006: ret

// System.Void RunicBuildCamera.Core.BuildCameraSession::set_Yaw(System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Single RunicBuildCamera.Core.BuildCameraSession::<Yaw>k__BackingField
IL_0007: ret

// System.Single RunicBuildCamera.Core.BuildCameraSession::get_Pitch()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Single RunicBuildCamera.Core.BuildCameraSession::<Pitch>k__BackingField
IL_0006: ret

// System.Void RunicBuildCamera.Core.BuildCameraSession::set_Pitch(System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Single RunicBuildCamera.Core.BuildCameraSession::<Pitch>k__BackingField
IL_0007: ret

// System.Single RunicBuildCamera.Core.BuildCameraSession::get_Range()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Single RunicBuildCamera.Core.BuildCameraSession::<Range>k__BackingField
IL_0006: ret

// System.Void RunicBuildCamera.Core.BuildCameraSession::set_Range(System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Single RunicBuildCamera.Core.BuildCameraSession::<Range>k__BackingField
IL_0007: ret

// UnityEngine.Quaternion RunicBuildCamera.Core.BuildCameraSession::get_Rotation()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Single RunicBuildCamera.Core.BuildCameraSession::get_Pitch()
IL_0006: ldarg.0
IL_0007: call System.Single RunicBuildCamera.Core.BuildCameraSession::get_Yaw()
IL_000c: ldc.r4 0
IL_0011: call UnityEngine.Quaternion UnityEngine.Quaternion::Euler(System.Single,System.Single,System.Single)
IL_0016: ret

// System.Boolean RunicBuildCamera.Core.BuildCameraSession::Begin(System.Int32,UnityEngine.Vector3,UnityEngine.Vector3,UnityEngine.Quaternion,System.Single)
.locals UnityEngine.Vector3
IL_0000: ldarg.1
IL_0001: brfalse.s IL_0025
IL_0003: ldarg.2
IL_0004: call System.Boolean RunicBuildCamera.Core.BuildCameraSession::IsFinite(UnityEngine.Vector3)
IL_0009: brfalse.s IL_0025
IL_000b: ldarg.3
IL_000c: call System.Boolean RunicBuildCamera.Core.BuildCameraSession::IsFinite(UnityEngine.Vector3)
IL_0011: brfalse.s IL_0025
IL_0013: ldarg.s cameraRotation
IL_0015: call System.Boolean RunicBuildCamera.Core.BuildCameraSession::IsFinite(UnityEngine.Quaternion)
IL_001a: brfalse.s IL_0025
IL_001c: ldarg.s range
IL_001e: call System.Boolean RunicBuildCamera.Core.BuildCameraSession::IsPositiveFinite(System.Single)
IL_0023: brtrue.s IL_0027
IL_0025: ldc.i4.0
IL_0026: ret
IL_0027: ldarga.s cameraRotation
IL_0029: call UnityEngine.Vector3 UnityEngine.Quaternion::get_eulerAngles()
IL_002e: stloc.0
IL_002f: ldarg.0
IL_0030: ldc.i4.1
IL_0031: call System.Void RunicBuildCamera.Core.BuildCameraSession::set_IsActive(System.Boolean)
IL_0036: ldarg.0
IL_0037: ldarg.1
IL_0038: call System.Void RunicBuildCamera.Core.BuildCameraSession::set_PlayerInstanceId(System.Int32)
IL_003d: ldarg.0
IL_003e: ldarg.2
IL_003f: call System.Void RunicBuildCamera.Core.BuildCameraSession::set_Anchor(UnityEngine.Vector3)
IL_0044: ldarg.0
IL_0045: ldarg.s range
IL_0047: call System.Void RunicBuildCamera.Core.BuildCameraSession::set_Range(System.Single)
IL_004c: ldarg.0
IL_004d: ldloc.0
IL_004e: ldfld System.Single UnityEngine.Vector3::y
IL_0053: call System.Single RunicBuildCamera.Core.CameraMotion::NormalizeAngle(System.Single)
IL_0058: call System.Void RunicBuildCamera.Core.BuildCameraSession::set_Yaw(System.Single)
IL_005d: ldarg.0
IL_005e: ldloc.0
IL_005f: ldfld System.Single UnityEngine.Vector3::x
IL_0064: call System.Single RunicBuildCamera.Core.CameraMotion::NormalizeAngle(System.Single)
IL_0069: ldc.r4 -89
IL_006e: ldc.r4 89
IL_0073: call System.Single UnityEngine.Mathf::Clamp(System.Single,System.Single,System.Single)
IL_0078: call System.Void RunicBuildCamera.Core.BuildCameraSession::set_Pitch(System.Single)
IL_007d: ldarg.0
IL_007e: ldarg.3
IL_007f: ldarg.2
IL_0080: ldarg.s range
IL_0082: call UnityEngine.Vector3 RunicBuildCamera.Core.CameraMotion::ClampToAnchor(UnityEngine.Vector3,UnityEngine.Vector3,System.Single)
IL_0087: call System.Void RunicBuildCamera.Core.BuildCameraSession::set_Position(UnityEngine.Vector3)
IL_008c: ldc.i4.1
IL_008d: ret

// System.Boolean RunicBuildCamera.Core.BuildCameraSession::BelongsTo(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Core.BuildCameraSession::get_IsActive()
IL_0006: brfalse.s IL_0015
IL_0008: ldarg.1
IL_0009: brfalse.s IL_0015
IL_000b: ldarg.0
IL_000c: call System.Int32 RunicBuildCamera.Core.BuildCameraSession::get_PlayerInstanceId()
IL_0011: ldarg.1
IL_0012: ceq
IL_0014: ret
IL_0015: ldc.i4.0
IL_0016: ret

// System.Void RunicBuildCamera.Core.BuildCameraSession::Reanchor(UnityEngine.Vector3)
.locals UnityEngine.Vector3
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Core.BuildCameraSession::get_IsActive()
IL_0006: brfalse.s IL_0010
IL_0008: ldarg.1
IL_0009: call System.Boolean RunicBuildCamera.Core.BuildCameraSession::IsFinite(UnityEngine.Vector3)
IL_000e: brtrue.s IL_0011
IL_0010: ret
IL_0011: ldarg.1
IL_0012: ldarg.0
IL_0013: call UnityEngine.Vector3 RunicBuildCamera.Core.BuildCameraSession::get_Anchor()
IL_0018: call UnityEngine.Vector3 UnityEngine.Vector3::op_Subtraction(UnityEngine.Vector3,UnityEngine.Vector3)
IL_001d: stloc.0
IL_001e: ldarg.0
IL_001f: ldarg.1
IL_0020: call System.Void RunicBuildCamera.Core.BuildCameraSession::set_Anchor(UnityEngine.Vector3)
IL_0025: ldarg.0
IL_0026: ldarg.0
IL_0027: call UnityEngine.Vector3 RunicBuildCamera.Core.BuildCameraSession::get_Position()
IL_002c: ldloc.0
IL_002d: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0032: ldarg.0
IL_0033: call UnityEngine.Vector3 RunicBuildCamera.Core.BuildCameraSession::get_Anchor()
IL_0038: ldarg.0
IL_0039: call System.Single RunicBuildCamera.Core.BuildCameraSession::get_Range()
IL_003e: call UnityEngine.Vector3 RunicBuildCamera.Core.CameraMotion::ClampToAnchor(UnityEngine.Vector3,UnityEngine.Vector3,System.Single)
IL_0043: call System.Void RunicBuildCamera.Core.BuildCameraSession::set_Position(UnityEngine.Vector3)
IL_0048: ret

// System.Void RunicBuildCamera.Core.BuildCameraSession::SetPose(RunicBuildCamera.Core.CameraPose&)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Core.BuildCameraSession::get_IsActive()
IL_0006: brfalse.s IL_002f
IL_0008: ldarg.1
IL_0009: call UnityEngine.Vector3 RunicBuildCamera.Core.CameraPose::get_Position()
IL_000e: call System.Boolean RunicBuildCamera.Core.BuildCameraSession::IsFinite(UnityEngine.Vector3)
IL_0013: brfalse.s IL_002f
IL_0015: ldarg.1
IL_0016: call System.Single RunicBuildCamera.Core.CameraPose::get_Yaw()
IL_001b: call System.Boolean RunicBuildCamera.Core.BuildCameraSession::IsFinite(System.Single)
IL_0020: brfalse.s IL_002f
IL_0022: ldarg.1
IL_0023: call System.Single RunicBuildCamera.Core.CameraPose::get_Pitch()
IL_0028: call System.Boolean RunicBuildCamera.Core.BuildCameraSession::IsFinite(System.Single)
IL_002d: brtrue.s IL_0030
IL_002f: ret
IL_0030: ldarg.0
IL_0031: ldarg.1
IL_0032: call UnityEngine.Vector3 RunicBuildCamera.Core.CameraPose::get_Position()
IL_0037: ldarg.0
IL_0038: call UnityEngine.Vector3 RunicBuildCamera.Core.BuildCameraSession::get_Anchor()
IL_003d: ldarg.0
IL_003e: call System.Single RunicBuildCamera.Core.BuildCameraSession::get_Range()
IL_0043: call UnityEngine.Vector3 RunicBuildCamera.Core.CameraMotion::ClampToAnchor(UnityEngine.Vector3,UnityEngine.Vector3,System.Single)
IL_0048: call System.Void RunicBuildCamera.Core.BuildCameraSession::set_Position(UnityEngine.Vector3)
IL_004d: ldarg.0
IL_004e: ldarg.1
IL_004f: call System.Single RunicBuildCamera.Core.CameraPose::get_Yaw()
IL_0054: call System.Single RunicBuildCamera.Core.CameraMotion::NormalizeAngle(System.Single)
IL_0059: call System.Void RunicBuildCamera.Core.BuildCameraSession::set_Yaw(System.Single)
IL_005e: ldarg.0
IL_005f: ldarg.1
IL_0060: call System.Single RunicBuildCamera.Core.CameraPose::get_Pitch()
IL_0065: ldc.r4 -89
IL_006a: ldc.r4 89
IL_006f: call System.Single UnityEngine.Mathf::Clamp(System.Single,System.Single,System.Single)
IL_0074: call System.Void RunicBuildCamera.Core.BuildCameraSession::set_Pitch(System.Single)
IL_0079: ret

// System.Void RunicBuildCamera.Core.BuildCameraSession::UpdateRange(System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Core.BuildCameraSession::get_IsActive()
IL_0006: brfalse.s IL_0010
IL_0008: ldarg.1
IL_0009: call System.Boolean RunicBuildCamera.Core.BuildCameraSession::IsPositiveFinite(System.Single)
IL_000e: brtrue.s IL_0011
IL_0010: ret
IL_0011: ldarg.0
IL_0012: ldarg.1
IL_0013: call System.Void RunicBuildCamera.Core.BuildCameraSession::set_Range(System.Single)
IL_0018: ldarg.0
IL_0019: ldarg.0
IL_001a: call UnityEngine.Vector3 RunicBuildCamera.Core.BuildCameraSession::get_Position()
IL_001f: ldarg.0
IL_0020: call UnityEngine.Vector3 RunicBuildCamera.Core.BuildCameraSession::get_Anchor()
IL_0025: ldarg.0
IL_0026: call System.Single RunicBuildCamera.Core.BuildCameraSession::get_Range()
IL_002b: call UnityEngine.Vector3 RunicBuildCamera.Core.CameraMotion::ClampToAnchor(UnityEngine.Vector3,UnityEngine.Vector3,System.Single)
IL_0030: call System.Void RunicBuildCamera.Core.BuildCameraSession::set_Position(UnityEngine.Vector3)
IL_0035: ret

// System.Void RunicBuildCamera.Core.BuildCameraSession::End()
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.0
IL_0002: call System.Void RunicBuildCamera.Core.BuildCameraSession::set_IsActive(System.Boolean)
IL_0007: ldarg.0
IL_0008: ldc.i4.0
IL_0009: call System.Void RunicBuildCamera.Core.BuildCameraSession::set_PlayerInstanceId(System.Int32)
IL_000e: ldarg.0
IL_000f: call UnityEngine.Vector3 UnityEngine.Vector3::get_zero()
IL_0014: call System.Void RunicBuildCamera.Core.BuildCameraSession::set_Anchor(UnityEngine.Vector3)
IL_0019: ldarg.0
IL_001a: call UnityEngine.Vector3 UnityEngine.Vector3::get_zero()
IL_001f: call System.Void RunicBuildCamera.Core.BuildCameraSession::set_Position(UnityEngine.Vector3)
IL_0024: ldarg.0
IL_0025: ldc.r4 0
IL_002a: call System.Void RunicBuildCamera.Core.BuildCameraSession::set_Yaw(System.Single)
IL_002f: ldarg.0
IL_0030: ldc.r4 0
IL_0035: call System.Void RunicBuildCamera.Core.BuildCameraSession::set_Pitch(System.Single)
IL_003a: ldarg.0
IL_003b: ldc.r4 0
IL_0040: call System.Void RunicBuildCamera.Core.BuildCameraSession::set_Range(System.Single)
IL_0045: ret

// System.Boolean RunicBuildCamera.Core.BuildCameraSession::IsFinite(UnityEngine.Vector3)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Single UnityEngine.Vector3::x
IL_0006: call System.Boolean RunicBuildCamera.Core.BuildCameraSession::IsFinite(System.Single)
IL_000b: brfalse.s IL_0026
IL_000d: ldarg.0
IL_000e: ldfld System.Single UnityEngine.Vector3::y
IL_0013: call System.Boolean RunicBuildCamera.Core.BuildCameraSession::IsFinite(System.Single)
IL_0018: brfalse.s IL_0026
IL_001a: ldarg.0
IL_001b: ldfld System.Single UnityEngine.Vector3::z
IL_0020: call System.Boolean RunicBuildCamera.Core.BuildCameraSession::IsFinite(System.Single)
IL_0025: ret
IL_0026: ldc.i4.0
IL_0027: ret

// System.Boolean RunicBuildCamera.Core.BuildCameraSession::IsFinite(UnityEngine.Quaternion)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Single UnityEngine.Quaternion::x
IL_0006: call System.Boolean RunicBuildCamera.Core.BuildCameraSession::IsFinite(System.Single)
IL_000b: brfalse.s IL_0033
IL_000d: ldarg.0
IL_000e: ldfld System.Single UnityEngine.Quaternion::y
IL_0013: call System.Boolean RunicBuildCamera.Core.BuildCameraSession::IsFinite(System.Single)
IL_0018: brfalse.s IL_0033
IL_001a: ldarg.0
IL_001b: ldfld System.Single UnityEngine.Quaternion::z
IL_0020: call System.Boolean RunicBuildCamera.Core.BuildCameraSession::IsFinite(System.Single)
IL_0025: brfalse.s IL_0033
IL_0027: ldarg.0
IL_0028: ldfld System.Single UnityEngine.Quaternion::w
IL_002d: call System.Boolean RunicBuildCamera.Core.BuildCameraSession::IsFinite(System.Single)
IL_0032: ret
IL_0033: ldc.i4.0
IL_0034: ret

// System.Boolean RunicBuildCamera.Core.BuildCameraSession::IsPositiveFinite(System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Core.BuildCameraSession::IsFinite(System.Single)
IL_0006: brfalse.s IL_0011
IL_0008: ldarg.0
IL_0009: ldc.r4 0
IL_000e: cgt
IL_0010: ret
IL_0011: ldc.i4.0
IL_0012: ret

// System.Boolean RunicBuildCamera.Core.BuildCameraSession::IsFinite(System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean System.Single::IsNaN(System.Single)
IL_0006: brtrue.s IL_0012
IL_0008: ldarg.0
IL_0009: call System.Boolean System.Single::IsInfinity(System.Single)
IL_000e: ldc.i4.0
IL_000f: ceq
IL_0011: ret
IL_0012: ldc.i4.0
IL_0013: ret

// System.Void RunicBuildCamera.Core.BuildCameraSession::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean RunicBuildCamera.Core.CameraExitInput::ReleaseIfRequested(System.Boolean,System.Func`1<System.Boolean>,System.Action)
.locals 
IL_0000: ldarg.0
IL_0001: brfalse.s IL_000b
IL_0003: ldarg.1
IL_0004: callvirt !0 System.Func`1<System.Boolean>::Invoke()
IL_0009: brtrue.s IL_000d
IL_000b: ldc.i4.0
IL_000c: ret
IL_000d: ldarg.2
IL_000e: callvirt System.Void System.Action::Invoke()
IL_0013: ldc.i4.1
IL_0014: ret

// System.Boolean RunicBuildCamera.Core.CameraExitInput::HotbarRequested(System.Func`2<System.String,System.Boolean>)
.locals System.String[], System.Int32, System.String
IL_0000: ldsfld System.String[] RunicBuildCamera.Core.CameraExitInput::HotbarButtons
IL_0005: stloc.0
IL_0006: ldc.i4.0
IL_0007: stloc.1
IL_0008: br.s IL_001d
IL_000a: ldloc.0
IL_000b: ldloc.1
IL_000c: ldelem.ref
IL_000d: stloc.2
IL_000e: ldarg.0
IL_000f: ldloc.2
IL_0010: callvirt !1 System.Func`2<System.String,System.Boolean>::Invoke(!0)
IL_0015: brfalse.s IL_0019
IL_0017: ldc.i4.1
IL_0018: ret
IL_0019: ldloc.1
IL_001a: ldc.i4.1
IL_001b: add
IL_001c: stloc.1
IL_001d: ldloc.1
IL_001e: ldloc.0
IL_001f: ldlen
IL_0020: conv.i4
IL_0021: blt.s IL_000a
IL_0023: ldc.i4.0
IL_0024: ret

// System.Boolean RunicBuildCamera.Core.CameraExitInput::HideRequested(System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean)
.locals 
IL_0000: ldarg.1
IL_0001: brfalse.s IL_000d
IL_0003: ldarg.3
IL_0004: ldc.i4.0
IL_0005: ceq
IL_0007: ldarg.2
IL_0008: and
IL_0009: ldarg.s altKeys
IL_000b: and
IL_000c: ret
IL_000d: ldarg.0
IL_000e: brtrue.s IL_001e
IL_0010: ldarg.2
IL_0011: brfalse.s IL_001c
IL_0013: ldarg.s altKeys
IL_0015: brtrue.s IL_001c
IL_0017: ldarg.3
IL_0018: ldc.i4.0
IL_0019: ceq
IL_001b: ret
IL_001c: ldc.i4.0
IL_001d: ret
IL_001e: ldc.i4.1
IL_001f: ret

// System.Void RunicBuildCamera.Core.CameraExitInput::.cctor()
.locals 
IL_0000: ldc.i4.8
IL_0001: newarr System.String
IL_0006: dup
IL_0007: ldc.i4.0
IL_0008: ldstr "Hotbar1"
IL_000d: stelem.ref
IL_000e: dup
IL_000f: ldc.i4.1
IL_0010: ldstr "Hotbar2"
IL_0015: stelem.ref
IL_0016: dup
IL_0017: ldc.i4.2
IL_0018: ldstr "Hotbar3"
IL_001d: stelem.ref
IL_001e: dup
IL_001f: ldc.i4.3
IL_0020: ldstr "Hotbar4"
IL_0025: stelem.ref
IL_0026: dup
IL_0027: ldc.i4.4
IL_0028: ldstr "Hotbar5"
IL_002d: stelem.ref
IL_002e: dup
IL_002f: ldc.i4.5
IL_0030: ldstr "Hotbar6"
IL_0035: stelem.ref
IL_0036: dup
IL_0037: ldc.i4.6
IL_0038: ldstr "Hotbar7"
IL_003d: stelem.ref
IL_003e: dup
IL_003f: ldc.i4.7
IL_0040: ldstr "Hotbar8"
IL_0045: stelem.ref
IL_0046: stsfld System.String[] RunicBuildCamera.Core.CameraExitInput::HotbarButtons
IL_004b: ret

// System.Void RunicBuildCamera.Core.CameraMotionInput::.ctor(System.Single,System.Single,System.Single,System.Single,System.Single,System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: ldc.r4 -1
IL_0007: ldc.r4 1
IL_000c: call System.Single UnityEngine.Mathf::Clamp(System.Single,System.Single,System.Single)
IL_0011: stfld System.Single RunicBuildCamera.Core.CameraMotionInput::<Right>k__BackingField
IL_0016: ldarg.0
IL_0017: ldarg.2
IL_0018: ldc.r4 -1
IL_001d: ldc.r4 1
IL_0022: call System.Single UnityEngine.Mathf::Clamp(System.Single,System.Single,System.Single)
IL_0027: stfld System.Single RunicBuildCamera.Core.CameraMotionInput::<Up>k__BackingField
IL_002c: ldarg.0
IL_002d: ldarg.3
IL_002e: ldc.r4 -1
IL_0033: ldc.r4 1
IL_0038: call System.Single UnityEngine.Mathf::Clamp(System.Single,System.Single,System.Single)
IL_003d: stfld System.Single RunicBuildCamera.Core.CameraMotionInput::<Forward>k__BackingField
IL_0042: ldarg.0
IL_0043: ldarg.s yawDelta
IL_0045: stfld System.Single RunicBuildCamera.Core.CameraMotionInput::<YawDelta>k__BackingField
IL_004a: ldarg.0
IL_004b: ldarg.s pitchDelta
IL_004d: stfld System.Single RunicBuildCamera.Core.CameraMotionInput::<PitchDelta>k__BackingField
IL_0052: ldarg.0
IL_0053: ldarg.s fast
IL_0055: stfld System.Boolean RunicBuildCamera.Core.CameraMotionInput::<Fast>k__BackingField
IL_005a: ret

// System.Single RunicBuildCamera.Core.CameraMotionInput::get_Right()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Single RunicBuildCamera.Core.CameraMotionInput::<Right>k__BackingField
IL_0006: ret

// System.Single RunicBuildCamera.Core.CameraMotionInput::get_Up()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Single RunicBuildCamera.Core.CameraMotionInput::<Up>k__BackingField
IL_0006: ret

// System.Single RunicBuildCamera.Core.CameraMotionInput::get_Forward()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Single RunicBuildCamera.Core.CameraMotionInput::<Forward>k__BackingField
IL_0006: ret

// System.Single RunicBuildCamera.Core.CameraMotionInput::get_YawDelta()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Single RunicBuildCamera.Core.CameraMotionInput::<YawDelta>k__BackingField
IL_0006: ret

// System.Single RunicBuildCamera.Core.CameraMotionInput::get_PitchDelta()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Single RunicBuildCamera.Core.CameraMotionInput::<PitchDelta>k__BackingField
IL_0006: ret

// System.Boolean RunicBuildCamera.Core.CameraMotionInput::get_Fast()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean RunicBuildCamera.Core.CameraMotionInput::<Fast>k__BackingField
IL_0006: ret

// System.Void RunicBuildCamera.Core.CameraPose::.ctor(UnityEngine.Vector3,System.Single,System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld UnityEngine.Vector3 RunicBuildCamera.Core.CameraPose::<Position>k__BackingField
IL_0007: ldarg.0
IL_0008: ldarg.2
IL_0009: stfld System.Single RunicBuildCamera.Core.CameraPose::<Yaw>k__BackingField
IL_000e: ldarg.0
IL_000f: ldarg.3
IL_0010: stfld System.Single RunicBuildCamera.Core.CameraPose::<Pitch>k__BackingField
IL_0015: ret

// UnityEngine.Vector3 RunicBuildCamera.Core.CameraPose::get_Position()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld UnityEngine.Vector3 RunicBuildCamera.Core.CameraPose::<Position>k__BackingField
IL_0006: ret

// System.Single RunicBuildCamera.Core.CameraPose::get_Yaw()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Single RunicBuildCamera.Core.CameraPose::<Yaw>k__BackingField
IL_0006: ret

// System.Single RunicBuildCamera.Core.CameraPose::get_Pitch()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Single RunicBuildCamera.Core.CameraPose::<Pitch>k__BackingField
IL_0006: ret

// UnityEngine.Quaternion RunicBuildCamera.Core.CameraPose::get_Rotation()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Single RunicBuildCamera.Core.CameraPose::get_Pitch()
IL_0006: ldarg.0
IL_0007: call System.Single RunicBuildCamera.Core.CameraPose::get_Yaw()
IL_000c: ldc.r4 0
IL_0011: call UnityEngine.Quaternion UnityEngine.Quaternion::Euler(System.Single,System.Single,System.Single)
IL_0016: ret

// RunicBuildCamera.Core.CameraPose RunicBuildCamera.Core.CameraMotion::Step(UnityEngine.Vector3,System.Single,System.Single,UnityEngine.Vector3,System.Single,RunicBuildCamera.Core.CameraMotionInput&,System.Single,System.Single,System.Single,System.Boolean)
.locals System.Single, System.Single, System.Single, UnityEngine.Vector3, UnityEngine.Vector3, System.Single, System.Single
IL_0000: ldarg.s deltaTime
IL_0002: call System.Single RunicBuildCamera.Core.CameraMotion::SanitizeDeltaTime(System.Single)
IL_0007: stloc.0
IL_0008: ldarg.1
IL_0009: ldarg.s input
IL_000b: call System.Single RunicBuildCamera.Core.CameraMotionInput::get_YawDelta()
IL_0010: call System.Single RunicBuildCamera.Core.CameraMotion::Sanitize(System.Single)
IL_0015: add
IL_0016: call System.Single RunicBuildCamera.Core.CameraMotion::NormalizeAngle(System.Single)
IL_001b: stloc.1
IL_001c: ldarg.2
IL_001d: ldarg.s input
IL_001f: call System.Single RunicBuildCamera.Core.CameraMotionInput::get_PitchDelta()
IL_0024: call System.Single RunicBuildCamera.Core.CameraMotion::Sanitize(System.Single)
IL_0029: add
IL_002a: ldc.r4 -89
IL_002f: ldc.r4 89
IL_0034: call System.Single UnityEngine.Mathf::Clamp(System.Single,System.Single,System.Single)
IL_0039: stloc.2
IL_003a: ldloca.s V_3
IL_003c: ldarg.s input
IL_003e: call System.Single RunicBuildCamera.Core.CameraMotionInput::get_Right()
IL_0043: ldarg.s input
IL_0045: call System.Single RunicBuildCamera.Core.CameraMotionInput::get_Up()
IL_004a: ldarg.s input
IL_004c: call System.Single RunicBuildCamera.Core.CameraMotionInput::get_Forward()
IL_0051: call System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0056: ldloca.s V_3
IL_0058: call System.Single UnityEngine.Vector3::get_sqrMagnitude()
IL_005d: ldc.r4 1
IL_0062: ble.un.s IL_006b
IL_0064: ldloca.s V_3
IL_0066: call System.Void UnityEngine.Vector3::Normalize()
IL_006b: ldarg.s worldRelativeMovement
IL_006d: brfalse.s IL_0074
IL_006f: ldloc.3
IL_0070: stloc.s V_4
IL_0072: br.s IL_00c7
IL_0074: ldloc.2
IL_0075: ldloc.1
IL_0076: ldc.r4 0
IL_007b: call UnityEngine.Quaternion UnityEngine.Quaternion::Euler(System.Single,System.Single,System.Single)
IL_0080: ldloc.3
IL_0081: ldfld System.Single UnityEngine.Vector3::x
IL_0086: ldc.r4 0
IL_008b: ldloc.3
IL_008c: ldfld System.Single UnityEngine.Vector3::z
IL_0091: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0096: call UnityEngine.Vector3 UnityEngine.Quaternion::op_Multiply(UnityEngine.Quaternion,UnityEngine.Vector3)
IL_009b: call UnityEngine.Vector3 UnityEngine.Vector3::get_up()
IL_00a0: ldloc.3
IL_00a1: ldfld System.Single UnityEngine.Vector3::y
IL_00a6: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_00ab: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_00b0: stloc.s V_4
IL_00b2: ldloca.s V_4
IL_00b4: call System.Single UnityEngine.Vector3::get_sqrMagnitude()
IL_00b9: ldc.r4 1
IL_00be: ble.un.s IL_00c7
IL_00c0: ldloca.s V_4
IL_00c2: call System.Void UnityEngine.Vector3::Normalize()
IL_00c7: ldc.r4 0
IL_00cc: ldarg.s moveSpeed
IL_00ce: call System.Single RunicBuildCamera.Core.CameraMotion::Sanitize(System.Single)
IL_00d3: call System.Single UnityEngine.Mathf::Max(System.Single,System.Single)
IL_00d8: stloc.s V_5
IL_00da: ldarg.s input
IL_00dc: call System.Boolean RunicBuildCamera.Core.CameraMotionInput::get_Fast()
IL_00e1: brfalse.s IL_00f9
IL_00e3: ldloc.s V_5
IL_00e5: ldc.r4 1
IL_00ea: ldarg.s fastMoveMultiplier
IL_00ec: call System.Single RunicBuildCamera.Core.CameraMotion::Sanitize(System.Single)
IL_00f1: call System.Single UnityEngine.Mathf::Max(System.Single,System.Single)
IL_00f6: mul
IL_00f7: stloc.s V_5
IL_00f9: ldarg.0
IL_00fa: ldloc.s V_4
IL_00fc: ldloc.s V_5
IL_00fe: ldloc.0
IL_00ff: mul
IL_0100: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_0105: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_010a: ldarg.s range
IL_010c: call System.Boolean RunicBuildCamera.Core.CameraMotion::IsFinite(System.Single)
IL_0111: brfalse.s IL_011c
IL_0113: ldarg.s range
IL_0115: ldc.r4 0
IL_011a: bgt.s IL_0123
IL_011c: ldc.r4 0.01
IL_0121: br.s IL_0125
IL_0123: ldarg.s range
IL_0125: stloc.s V_6
IL_0127: ldarg.3
IL_0128: ldloc.s V_6
IL_012a: call UnityEngine.Vector3 RunicBuildCamera.Core.CameraMotion::ClampToAnchor(UnityEngine.Vector3,UnityEngine.Vector3,System.Single)
IL_012f: ldloc.1
IL_0130: ldloc.2
IL_0131: newobj System.Void RunicBuildCamera.Core.CameraPose::.ctor(UnityEngine.Vector3,System.Single,System.Single)
IL_0136: ret

// UnityEngine.Vector3 RunicBuildCamera.Core.CameraMotion::ClampToAnchor(UnityEngine.Vector3,UnityEngine.Vector3,System.Single)
.locals UnityEngine.Vector3, System.Single
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Core.CameraMotion::IsFinite(UnityEngine.Vector3)
IL_0006: brfalse.s IL_0010
IL_0008: ldarg.1
IL_0009: call System.Boolean RunicBuildCamera.Core.CameraMotion::IsFinite(UnityEngine.Vector3)
IL_000e: brtrue.s IL_0012
IL_0010: ldarg.1
IL_0011: ret
IL_0012: ldarg.2
IL_0013: call System.Boolean RunicBuildCamera.Core.CameraMotion::IsFinite(System.Single)
IL_0018: brfalse.s IL_0022
IL_001a: ldarg.2
IL_001b: ldc.r4 0
IL_0020: bgt.un.s IL_0024
IL_0022: ldarg.1
IL_0023: ret
IL_0024: ldarg.0
IL_0025: ldarg.1
IL_0026: call UnityEngine.Vector3 UnityEngine.Vector3::op_Subtraction(UnityEngine.Vector3,UnityEngine.Vector3)
IL_002b: stloc.0
IL_002c: ldarg.2
IL_002d: ldarg.2
IL_002e: mul
IL_002f: stloc.1
IL_0030: ldloca.s V_0
IL_0032: call System.Single UnityEngine.Vector3::get_sqrMagnitude()
IL_0037: ldloc.1
IL_0038: bgt.un.s IL_003c
IL_003a: ldarg.0
IL_003b: ret
IL_003c: ldarg.1
IL_003d: ldloca.s V_0
IL_003f: call UnityEngine.Vector3 UnityEngine.Vector3::get_normalized()
IL_0044: ldarg.2
IL_0045: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_004a: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_004f: ret

// System.Single RunicBuildCamera.Core.CameraMotion::NormalizeAngle(System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Core.CameraMotion::IsFinite(System.Single)
IL_0006: brtrue.s IL_000e
IL_0008: ldc.r4 0
IL_000d: ret
IL_000e: ldarg.0
IL_000f: ldc.r4 360
IL_0014: rem
IL_0015: starg.s degrees
IL_0017: ldarg.0
IL_0018: ldc.r4 180
IL_001d: ble.un.s IL_0028
IL_001f: ldarg.0
IL_0020: ldc.r4 360
IL_0025: sub
IL_0026: starg.s degrees
IL_0028: ldarg.0
IL_0029: ldc.r4 -180
IL_002e: bgt.un.s IL_0039
IL_0030: ldarg.0
IL_0031: ldc.r4 360
IL_0036: add
IL_0037: starg.s degrees
IL_0039: ldarg.0
IL_003a: ret

// System.Single RunicBuildCamera.Core.CameraMotion::SanitizeDeltaTime(System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Core.CameraMotion::IsFinite(System.Single)
IL_0006: brtrue.s IL_000e
IL_0008: ldc.r4 0
IL_000d: ret
IL_000e: ldarg.0
IL_000f: ldc.r4 0
IL_0014: ldc.r4 0.1
IL_0019: call System.Single UnityEngine.Mathf::Clamp(System.Single,System.Single,System.Single)
IL_001e: ret

// System.Single RunicBuildCamera.Core.CameraMotion::Sanitize(System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Core.CameraMotion::IsFinite(System.Single)
IL_0006: brtrue.s IL_000e
IL_0008: ldc.r4 0
IL_000d: ret
IL_000e: ldarg.0
IL_000f: ret

// System.Boolean RunicBuildCamera.Core.CameraMotion::IsFinite(UnityEngine.Vector3)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Single UnityEngine.Vector3::x
IL_0006: call System.Boolean RunicBuildCamera.Core.CameraMotion::IsFinite(System.Single)
IL_000b: brfalse.s IL_0026
IL_000d: ldarg.0
IL_000e: ldfld System.Single UnityEngine.Vector3::y
IL_0013: call System.Boolean RunicBuildCamera.Core.CameraMotion::IsFinite(System.Single)
IL_0018: brfalse.s IL_0026
IL_001a: ldarg.0
IL_001b: ldfld System.Single UnityEngine.Vector3::z
IL_0020: call System.Boolean RunicBuildCamera.Core.CameraMotion::IsFinite(System.Single)
IL_0025: ret
IL_0026: ldc.i4.0
IL_0027: ret

// System.Boolean RunicBuildCamera.Core.CameraMotion::IsFinite(System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean System.Single::IsNaN(System.Single)
IL_0006: brtrue.s IL_0012
IL_0008: ldarg.0
IL_0009: call System.Boolean System.Single::IsInfinity(System.Single)
IL_000e: ldc.i4.0
IL_000f: ceq
IL_0011: ret
IL_0012: ldc.i4.0
IL_0013: ret

// System.Void RunicBuildCamera.Core.PickupCandidateFacts::.ctor(System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::<HasValidNetworkIdentity>k__BackingField
IL_0007: ldarg.0
IL_0008: ldarg.2
IL_0009: stfld System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::<IsWithinRange>k__BackingField
IL_000e: ldarg.0
IL_000f: ldarg.3
IL_0010: stfld System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::<IsFish>k__BackingField
IL_0015: ldarg.0
IL_0016: ldarg.s autoPickupEnabled
IL_0018: stfld System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::<AutoPickupEnabled>k__BackingField
IL_001d: ldarg.0
IL_001e: ldarg.s isPiece
IL_0020: stfld System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::<IsPiece>k__BackingField
IL_0025: ldarg.0
IL_0026: ldarg.s isInTar
IL_0028: stfld System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::<IsInTar>k__BackingField
IL_002d: ldarg.0
IL_002e: ldarg.s isUniqueOrQuestItem
IL_0030: stfld System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::<IsUniqueOrQuestItem>k__BackingField
IL_0035: ldarg.0
IL_0036: ldarg.s inventoryCanAdd
IL_0038: stfld System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::<InventoryCanAdd>k__BackingField
IL_003d: ldarg.0
IL_003e: ldarg.s wouldExceedCarryWeight
IL_0040: stfld System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::<WouldExceedCarryWeight>k__BackingField
IL_0045: ldarg.0
IL_0046: ldarg.s isCoolingDown
IL_0048: stfld System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::<IsCoolingDown>k__BackingField
IL_004d: ret

// System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::get_HasValidNetworkIdentity()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::<HasValidNetworkIdentity>k__BackingField
IL_0006: ret

// System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::get_IsWithinRange()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::<IsWithinRange>k__BackingField
IL_0006: ret

// System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::get_IsFish()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::<IsFish>k__BackingField
IL_0006: ret

// System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::get_AutoPickupEnabled()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::<AutoPickupEnabled>k__BackingField
IL_0006: ret

// System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::get_IsPiece()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::<IsPiece>k__BackingField
IL_0006: ret

// System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::get_IsInTar()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::<IsInTar>k__BackingField
IL_0006: ret

// System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::get_IsUniqueOrQuestItem()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::<IsUniqueOrQuestItem>k__BackingField
IL_0006: ret

// System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::get_InventoryCanAdd()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::<InventoryCanAdd>k__BackingField
IL_0006: ret

// System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::get_WouldExceedCarryWeight()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::<WouldExceedCarryWeight>k__BackingField
IL_0006: ret

// System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::get_IsCoolingDown()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::<IsCoolingDown>k__BackingField
IL_0006: ret

// System.Boolean RunicBuildCamera.Core.PickupPolicy::IsScanDue(System.Single,System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Core.PickupPolicy::IsFinite(System.Single)
IL_0006: brfalse.s IL_0018
IL_0008: ldarg.1
IL_0009: call System.Boolean RunicBuildCamera.Core.PickupPolicy::IsFinite(System.Single)
IL_000e: brfalse.s IL_0018
IL_0010: ldarg.0
IL_0011: ldarg.1
IL_0012: clt.un
IL_0014: ldc.i4.0
IL_0015: ceq
IL_0017: ret
IL_0018: ldc.i4.0
IL_0019: ret

// System.Single RunicBuildCamera.Core.PickupPolicy::NextScanAt(System.Single,System.Single)
.locals System.Single
IL_0000: ldarg.1
IL_0001: call System.Boolean RunicBuildCamera.Core.PickupPolicy::IsFinite(System.Single)
IL_0006: brtrue.s IL_000f
IL_0008: ldc.r4 0.2
IL_000d: br.s IL_001a
IL_000f: ldc.r4 0.02
IL_0014: ldarg.1
IL_0015: call System.Single System.Math::Max(System.Single,System.Single)
IL_001a: stloc.0
IL_001b: ldarg.0
IL_001c: ldloc.0
IL_001d: call System.Single RunicBuildCamera.Core.PickupPolicy::SaturatingAdd(System.Single,System.Single)
IL_0022: ret

// System.Boolean RunicBuildCamera.Core.PickupPolicy::IsWithinRange(System.Single,System.Single)
.locals System.Double
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Core.PickupPolicy::IsFinite(System.Single)
IL_0006: brfalse.s IL_0020
IL_0008: ldarg.0
IL_0009: ldc.r4 0
IL_000e: blt.s IL_0020
IL_0010: ldarg.1
IL_0011: call System.Boolean RunicBuildCamera.Core.PickupPolicy::IsFinite(System.Single)
IL_0016: brfalse.s IL_0020
IL_0018: ldarg.1
IL_0019: ldc.r4 0
IL_001e: bgt.un.s IL_0022
IL_0020: ldc.i4.0
IL_0021: ret
IL_0022: ldarg.1
IL_0023: conv.r8
IL_0024: stloc.0
IL_0025: ldarg.0
IL_0026: conv.r8
IL_0027: ldloc.0
IL_0028: ldloc.0
IL_0029: mul
IL_002a: cgt.un
IL_002c: ldc.i4.0
IL_002d: ceq
IL_002f: ret

// RunicBuildCamera.Core.PickupRejectionReason RunicBuildCamera.Core.PickupPolicy::Evaluate(RunicBuildCamera.Core.PickupCandidateFacts&)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::get_HasValidNetworkIdentity()
IL_0006: brtrue.s IL_000a
IL_0008: ldc.i4.1
IL_0009: ret
IL_000a: ldarg.0
IL_000b: call System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::get_IsWithinRange()
IL_0010: brtrue.s IL_0014
IL_0012: ldc.i4.2
IL_0013: ret
IL_0014: ldarg.0
IL_0015: call System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::get_IsFish()
IL_001a: brfalse.s IL_001e
IL_001c: ldc.i4.3
IL_001d: ret
IL_001e: ldarg.0
IL_001f: call System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::get_AutoPickupEnabled()
IL_0024: brtrue.s IL_0028
IL_0026: ldc.i4.4
IL_0027: ret
IL_0028: ldarg.0
IL_0029: call System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::get_IsPiece()
IL_002e: brfalse.s IL_0032
IL_0030: ldc.i4.5
IL_0031: ret
IL_0032: ldarg.0
IL_0033: call System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::get_IsInTar()
IL_0038: brfalse.s IL_003c
IL_003a: ldc.i4.6
IL_003b: ret
IL_003c: ldarg.0
IL_003d: call System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::get_IsUniqueOrQuestItem()
IL_0042: brfalse.s IL_0046
IL_0044: ldc.i4.7
IL_0045: ret
IL_0046: ldarg.0
IL_0047: call System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::get_InventoryCanAdd()
IL_004c: brtrue.s IL_0050
IL_004e: ldc.i4.8
IL_004f: ret
IL_0050: ldarg.0
IL_0051: call System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::get_WouldExceedCarryWeight()
IL_0056: brfalse.s IL_005b
IL_0058: ldc.i4.s 9
IL_005a: ret
IL_005b: ldarg.0
IL_005c: call System.Boolean RunicBuildCamera.Core.PickupCandidateFacts::get_IsCoolingDown()
IL_0061: brfalse.s IL_0066
IL_0063: ldc.i4.s 10
IL_0065: ret
IL_0066: ldc.i4.0
IL_0067: ret

// System.Single RunicBuildCamera.Core.PickupPolicy::OwnershipRetryAt(System.Single,System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: ldc.r4 0.2
IL_0006: ldarg.1
IL_0007: call System.Boolean RunicBuildCamera.Core.PickupPolicy::IsFinite(System.Single)
IL_000c: brtrue.s IL_0015
IL_000e: ldc.r4 0
IL_0013: br.s IL_0016
IL_0015: ldarg.1
IL_0016: call System.Single System.Math::Max(System.Single,System.Single)
IL_001b: call System.Single RunicBuildCamera.Core.PickupPolicy::SaturatingAdd(System.Single,System.Single)
IL_0020: ret

// System.Single RunicBuildCamera.Core.PickupPolicy::FailedPickupRetryAt(System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: ldc.r4 0.5
IL_0006: call System.Single RunicBuildCamera.Core.PickupPolicy::SaturatingAdd(System.Single,System.Single)
IL_000b: ret

// System.Single RunicBuildCamera.Core.PickupPolicy::CompletedPickupRetryAt(System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: ldc.r4 5
IL_0006: call System.Single RunicBuildCamera.Core.PickupPolicy::SaturatingAdd(System.Single,System.Single)
IL_000b: ret

// System.Single RunicBuildCamera.Core.PickupPolicy::SaturatingAdd(System.Single,System.Single)
.locals System.Double
IL_0000: ldarg.0
IL_0001: call System.Boolean RunicBuildCamera.Core.PickupPolicy::IsFinite(System.Single)
IL_0006: brfalse.s IL_0010
IL_0008: ldarg.1
IL_0009: call System.Boolean RunicBuildCamera.Core.PickupPolicy::IsFinite(System.Single)
IL_000e: brtrue.s IL_0016
IL_0010: ldc.r4 3.4028235E+38
IL_0015: ret
IL_0016: ldarg.0
IL_0017: conv.r8
IL_0018: ldarg.1
IL_0019: conv.r8
IL_001a: add
IL_001b: stloc.0
IL_001c: ldloc.0
IL_001d: ldc.r8 3.4028234663852886E+38
IL_0026: bge.s IL_002b
IL_0028: ldloc.0
IL_0029: conv.r4
IL_002a: ret
IL_002b: ldc.r4 3.4028235E+38
IL_0030: ret

// System.Boolean RunicBuildCamera.Core.PickupPolicy::IsFinite(System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean System.Single::IsNaN(System.Single)
IL_0006: brtrue.s IL_0012
IL_0008: ldarg.0
IL_0009: call System.Boolean System.Single::IsInfinity(System.Single)
IL_000e: ldc.i4.0
IL_000f: ceq
IL_0011: ret
IL_0012: ldc.i4.0
IL_0013: ret

// System.Int32 RunicBuildCamera.Core.PickupScanWindow::CopyNext(System.Collections.Generic.IReadOnlyList`1<T>,T[],System.Int32&)
.locals System.Int32, System.Int32, System.Int32
IL_0000: ldarg.0
IL_0001: brfalse.s IL_000f
IL_0003: ldarg.0
IL_0004: callvirt System.Int32 System.Collections.Generic.IReadOnlyCollection`1<T>::get_Count()
IL_0009: brfalse.s IL_000f
IL_000b: ldarg.1
IL_000c: ldlen
IL_000d: brtrue.s IL_0014
IL_000f: ldarg.2
IL_0010: ldc.i4.0
IL_0011: stind.i4
IL_0012: ldc.i4.0
IL_0013: ret
IL_0014: ldarg.0
IL_0015: callvirt System.Int32 System.Collections.Generic.IReadOnlyCollection`1<T>::get_Count()
IL_001a: stloc.0
IL_001b: ldarg.2
IL_001c: ldind.i4
IL_001d: ldc.i4.0
IL_001e: blt.s IL_0025
IL_0020: ldarg.2
IL_0021: ldind.i4
IL_0022: ldloc.0
IL_0023: blt.s IL_0028
IL_0025: ldarg.2
IL_0026: ldc.i4.0
IL_0027: stind.i4
IL_0028: ldloc.0
IL_0029: ldarg.1
IL_002a: ldlen
IL_002b: conv.i4
IL_002c: call System.Int32 System.Math::Min(System.Int32,System.Int32)
IL_0031: stloc.1
IL_0032: ldc.i4.0
IL_0033: stloc.2
IL_0034: br.s IL_0051
IL_0036: ldarg.1
IL_0037: ldloc.2
IL_0038: ldarg.0
IL_0039: ldarg.2
IL_003a: ldind.i4
IL_003b: callvirt !0 System.Collections.Generic.IReadOnlyList`1<T>::get_Item(System.Int32)
IL_0040: stelem.any T
IL_0045: ldarg.2
IL_0046: ldarg.2
IL_0047: ldind.i4
IL_0048: ldc.i4.1
IL_0049: add
IL_004a: ldloc.0
IL_004b: rem
IL_004c: stind.i4
IL_004d: ldloc.2
IL_004e: ldc.i4.1
IL_004f: add
IL_0050: stloc.2
IL_0051: ldloc.2
IL_0052: ldloc.1
IL_0053: blt.s IL_0036
IL_0055: ldloc.1
IL_0056: ret
