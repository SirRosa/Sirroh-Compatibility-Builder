
// System.Void ConfigurationManagerAttributes::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void neobotics.ModSdk.AudioHelper::Awake()
.locals 
IL_0000: ldarg.0
IL_0001: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::GetLogger()
IL_0006: stfld neobotics.ModSdk.Logging neobotics.ModSdk.AudioHelper::logger
IL_000b: ldarg.0
IL_000c: ldfld neobotics.ModSdk.Logging neobotics.ModSdk.AudioHelper::logger
IL_0011: ldstr "AudidHelper.Awake"
IL_0016: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_001b: ret

// System.Void neobotics.ModSdk.AudioHelper::Start()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld neobotics.ModSdk.Logging neobotics.ModSdk.AudioHelper::logger
IL_0006: ldstr "AudioHelper.Start"
IL_000b: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0010: call ZRoutedRpc ZRoutedRpc::get_instance()
IL_0015: ldstr "NeoPlayClip"
IL_001a: ldarg.0
IL_001b: ldftn System.Void neobotics.ModSdk.AudioHelper::RPC_NeoPlayClip(System.Int64,UnityEngine.Vector3,System.String)
IL_0021: newobj System.Void System.Action`3<System.Int64,UnityEngine.Vector3,System.String>::.ctor(System.Object,System.IntPtr)
IL_0026: callvirt System.Void ZRoutedRpc::Register<UnityEngine.Vector3,System.String>(System.String,System.Action`3<System.Int64,!!0,!!1>)
IL_002b: ret

// System.Void neobotics.ModSdk.AudioHelper::RPC_NeoPlayClip(System.Int64,UnityEngine.Vector3,System.String)
.locals System.Exception
IL_0000: call ZNet ZNet::get_instance()
IL_0005: callvirt System.Boolean ZNet::IsDedicated()
IL_000a: brfalse.s IL_000d
IL_000c: ret
IL_000d: nop
IL_000e: ldarg.0
IL_000f: ldarg.2
IL_0010: ldarg.3
IL_0011: call System.Void neobotics.ModSdk.AudioHelper::NeoPlayClip(UnityEngine.Vector3,System.String)
IL_0016: leave.s IL_0028
IL_0018: stloc.0
IL_0019: ldarg.0
IL_001a: ldfld neobotics.ModSdk.Logging neobotics.ModSdk.AudioHelper::logger
IL_001f: ldloc.0
IL_0020: ldc.i4.0
IL_0021: callvirt System.Void neobotics.ModSdk.Logging::Error(System.Exception,System.Boolean)
IL_0026: leave.s IL_0028
IL_0028: ret
// EH Catch: 14 - 24 => 24 - 40

// System.Void neobotics.ModSdk.AudioHelper::Play(UnityEngine.Vector3,System.String)
.locals 
IL_0000: call ZRoutedRpc ZRoutedRpc::get_instance()
IL_0005: ldc.i4.0
IL_0006: conv.i8
IL_0007: ldstr "NeoPlayClip"
IL_000c: ldc.i4.2
IL_000d: newarr System.Object
IL_0012: dup
IL_0013: ldc.i4.0
IL_0014: ldarg.1
IL_0015: box UnityEngine.Vector3
IL_001a: stelem.ref
IL_001b: dup
IL_001c: ldc.i4.1
IL_001d: ldarg.2
IL_001e: stelem.ref
IL_001f: callvirt System.Void ZRoutedRpc::InvokeRoutedRPC(System.Int64,System.String,System.Object[])
IL_0024: ret

// System.Void neobotics.ModSdk.AudioHelper::NeoPlayClip(UnityEngine.Vector3,System.String)
.locals UnityEngine.Vector3
IL_0000: ldsfld Player Player::m_localPlayer
IL_0005: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_000a: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_000f: stloc.0
IL_0010: ldarg.0
IL_0011: ldarg.1
IL_0012: ldloc.0
IL_0013: ldarg.2
IL_0014: call System.Void neobotics.ModSdk.AudioHelper::NeoPlayClip(UnityEngine.Vector3,UnityEngine.Vector3,System.String)
IL_0019: ret

// System.Void neobotics.ModSdk.AudioHelper::NeoPlayClip(UnityEngine.Vector3,UnityEngine.Vector3,System.String)
.locals UnityEngine.AudioClip, UnityEngine.Vector3, System.Single, UnityEngine.Vector3
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.Dictionary`2<System.String,UnityEngine.AudioClip> neobotics.ModSdk.AudioHelper::audioClips
IL_0006: ldarg.3
IL_0007: callvirt System.String System.String::ToLower()
IL_000c: ldloca.s V_0
IL_000e: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,UnityEngine.AudioClip>::TryGetValue(!0,!1&)
IL_0013: brtrue.s IL_002c
IL_0015: ldarg.0
IL_0016: ldfld neobotics.ModSdk.Logging neobotics.ModSdk.AudioHelper::logger
IL_001b: ldstr "Couldn't find audio clip for "
IL_0020: ldarg.3
IL_0021: call System.String System.String::Concat(System.String,System.String)
IL_0026: callvirt System.Void neobotics.ModSdk.Logging::Warning(System.String)
IL_002b: ret
IL_002c: ldarg.1
IL_002d: ldarg.2
IL_002e: call UnityEngine.Vector3 UnityEngine.Vector3::op_Subtraction(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0033: stloc.3
IL_0034: ldloca.s V_3
IL_0036: call UnityEngine.Vector3 UnityEngine.Vector3::get_normalized()
IL_003b: stloc.1
IL_003c: ldarg.1
IL_003d: ldarg.2
IL_003e: call System.Single UnityEngine.Vector3::Distance(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0043: ldc.r4 1
IL_0048: add
IL_0049: ldc.r4 10
IL_004e: div
IL_004f: stloc.2
IL_0050: ldloc.0
IL_0051: ldarg.2
IL_0052: ldloc.1
IL_0053: ldloc.2
IL_0054: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_0059: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_005e: ldc.r4 1
IL_0063: call System.Void UnityEngine.AudioSource::PlayClipAtPoint(UnityEngine.AudioClip,UnityEngine.Vector3,System.Single)
IL_0068: ret

// System.Single neobotics.ModSdk.AudioHelper::GetClipDuration(System.String)
.locals UnityEngine.AudioClip
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.Dictionary`2<System.String,UnityEngine.AudioClip> neobotics.ModSdk.AudioHelper::audioClips
IL_0006: ldarg.1
IL_0007: callvirt System.String System.String::ToLower()
IL_000c: ldloca.s V_0
IL_000e: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,UnityEngine.AudioClip>::TryGetValue(!0,!1&)
IL_0013: brtrue.s IL_001b
IL_0015: ldc.r4 -1
IL_001a: ret
IL_001b: ldloc.0
IL_001c: callvirt System.Single UnityEngine.AudioClip::get_length()
IL_0021: ret

// System.Void neobotics.ModSdk.AudioHelper::LoadAudioResources(System.String)
.locals System.String[], System.Int32, System.String, System.String, UnityEngine.AudioType
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.Dictionary`2<System.String,UnityEngine.AudioClip> neobotics.ModSdk.AudioHelper::audioClips
IL_0006: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,UnityEngine.AudioClip>::Clear()
IL_000b: ldarg.0
IL_000c: ldfld neobotics.ModSdk.Logging neobotics.ModSdk.AudioHelper::logger
IL_0011: ldstr "LoadAudioResources"
IL_0016: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_001b: ldarg.1
IL_001c: ldstr "*.*"
IL_0021: ldc.i4.0
IL_0022: call System.String[] System.IO.Directory::GetFiles(System.String,System.String,System.IO.SearchOption)
IL_0027: stloc.0
IL_0028: ldc.i4.0
IL_0029: stloc.1
IL_002a: br.s IL_007d
IL_002c: ldloc.0
IL_002d: ldloc.1
IL_002e: ldelem.ref
IL_002f: stloc.2
IL_0030: ldloc.2
IL_0031: call System.String System.IO.Path::GetExtension(System.String)
IL_0036: callvirt System.String System.String::ToLowerInvariant()
IL_003b: stloc.3
IL_003c: ldc.i4.0
IL_003d: stloc.s V_4
IL_003f: ldloc.3
IL_0040: ldstr ".wav"
IL_0045: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_004a: brtrue.s IL_005b
IL_004c: ldloc.3
IL_004d: ldstr ".mp3"
IL_0052: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0057: brtrue.s IL_0061
IL_0059: br.s IL_0065
IL_005b: ldc.i4.s 20
IL_005d: stloc.s V_4
IL_005f: br.s IL_0065
IL_0061: ldc.i4.s 13
IL_0063: stloc.s V_4
IL_0065: ldloc.s V_4
IL_0067: brfalse.s IL_0079
IL_0069: ldarg.0
IL_006a: ldarg.0
IL_006b: ldloc.2
IL_006c: ldloc.s V_4
IL_006e: call System.Collections.IEnumerator neobotics.ModSdk.AudioHelper::LoadExternalClip(System.String,UnityEngine.AudioType)
IL_0073: call UnityEngine.Coroutine UnityEngine.MonoBehaviour::StartCoroutine(System.Collections.IEnumerator)
IL_0078: pop
IL_0079: ldloc.1
IL_007a: ldc.i4.1
IL_007b: add
IL_007c: stloc.1
IL_007d: ldloc.1
IL_007e: ldloc.0
IL_007f: ldlen
IL_0080: conv.i4
IL_0081: blt.s IL_002c
IL_0083: ret

// System.Collections.IEnumerator neobotics.ModSdk.AudioHelper::LoadExternalClip(System.String,UnityEngine.AudioType)
.locals 
IL_0000: ldc.i4.0
IL_0001: newobj System.Void neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::.ctor(System.Int32)
IL_0006: dup
IL_0007: ldarg.0
IL_0008: stfld neobotics.ModSdk.AudioHelper neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<>4__this
IL_000d: dup
IL_000e: ldarg.1
IL_000f: stfld System.String neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::filePath
IL_0014: dup
IL_0015: ldarg.2
IL_0016: stfld UnityEngine.AudioType neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::type
IL_001b: ret

// System.Void neobotics.ModSdk.AudioHelper::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,UnityEngine.AudioClip>::.ctor()
IL_0006: stfld System.Collections.Generic.Dictionary`2<System.String,UnityEngine.AudioClip> neobotics.ModSdk.AudioHelper::audioClips
IL_000b: ldarg.0
IL_000c: call System.Void UnityEngine.MonoBehaviour::.ctor()
IL_0011: ret

// System.Void neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::.ctor(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ldarg.0
IL_0007: ldarg.1
IL_0008: stfld System.Int32 neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<>1__state
IL_000d: ret

// System.Void neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::System.IDisposable.Dispose()
.locals 
IL_0000: ldarg.0
IL_0001: ldnull
IL_0002: stfld System.String neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<uri>5__2
IL_0007: ldarg.0
IL_0008: ldnull
IL_0009: stfld System.String neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<clipName>5__3
IL_000e: ldarg.0
IL_000f: ldnull
IL_0010: stfld UnityEngine.Networking.UnityWebRequest neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<req>5__4
IL_0015: ldarg.0
IL_0016: ldc.i4.s -2
IL_0018: stfld System.Int32 neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<>1__state
IL_001d: ret

// System.Boolean neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::MoveNext()
.locals System.Int32, neobotics.ModSdk.AudioHelper, UnityEngine.AudioClip
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<>1__state
IL_0006: stloc.0
IL_0007: ldarg.0
IL_0008: ldfld neobotics.ModSdk.AudioHelper neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<>4__this
IL_000d: stloc.1
IL_000e: ldloc.0
IL_000f: brfalse.s IL_0017
IL_0011: ldloc.0
IL_0012: ldc.i4.1
IL_0013: beq.s IL_007b
IL_0015: ldc.i4.0
IL_0016: ret
IL_0017: ldarg.0
IL_0018: ldc.i4.m1
IL_0019: stfld System.Int32 neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<>1__state
IL_001e: ldarg.0
IL_001f: ldarg.0
IL_0020: ldfld System.String neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::filePath
IL_0025: newobj System.Void System.Uri::.ctor(System.String)
IL_002a: call System.String System.Uri::get_AbsoluteUri()
IL_002f: stfld System.String neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<uri>5__2
IL_0034: ldarg.0
IL_0035: ldarg.0
IL_0036: ldfld System.String neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::filePath
IL_003b: call System.String System.IO.Path::GetFileName(System.String)
IL_0040: callvirt System.String System.String::ToLowerInvariant()
IL_0045: stfld System.String neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<clipName>5__3
IL_004a: ldarg.0
IL_004b: ldarg.0
IL_004c: ldfld System.String neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<uri>5__2
IL_0051: ldarg.0
IL_0052: ldfld UnityEngine.AudioType neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::type
IL_0057: call UnityEngine.Networking.UnityWebRequest UnityEngine.Networking.UnityWebRequestMultimedia::GetAudioClip(System.String,UnityEngine.AudioType)
IL_005c: stfld UnityEngine.Networking.UnityWebRequest neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<req>5__4
IL_0061: ldarg.0
IL_0062: ldarg.0
IL_0063: ldfld UnityEngine.Networking.UnityWebRequest neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<req>5__4
IL_0068: callvirt UnityEngine.Networking.UnityWebRequestAsyncOperation UnityEngine.Networking.UnityWebRequest::SendWebRequest()
IL_006d: stfld System.Object neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<>2__current
IL_0072: ldarg.0
IL_0073: ldc.i4.1
IL_0074: stfld System.Int32 neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<>1__state
IL_0079: ldc.i4.1
IL_007a: ret
IL_007b: ldarg.0
IL_007c: ldc.i4.m1
IL_007d: stfld System.Int32 neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<>1__state
IL_0082: ldarg.0
IL_0083: ldfld UnityEngine.Networking.UnityWebRequest neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<req>5__4
IL_0088: callvirt UnityEngine.Networking.UnityWebRequest/Result UnityEngine.Networking.UnityWebRequest::get_result()
IL_008d: ldc.i4.1
IL_008e: bne.un.s IL_00cb
IL_0090: ldarg.0
IL_0091: ldfld UnityEngine.Networking.UnityWebRequest neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<req>5__4
IL_0096: call UnityEngine.AudioClip UnityEngine.Networking.DownloadHandlerAudioClip::GetContent(UnityEngine.Networking.UnityWebRequest)
IL_009b: stloc.2
IL_009c: ldloc.1
IL_009d: ldfld System.Collections.Generic.Dictionary`2<System.String,UnityEngine.AudioClip> neobotics.ModSdk.AudioHelper::audioClips
IL_00a2: ldarg.0
IL_00a3: ldfld System.String neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<clipName>5__3
IL_00a8: ldloc.2
IL_00a9: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,UnityEngine.AudioClip>::set_Item(!0,!1)
IL_00ae: ldloc.1
IL_00af: ldfld neobotics.ModSdk.Logging neobotics.ModSdk.AudioHelper::logger
IL_00b4: ldstr "Loaded external audio: "
IL_00b9: ldarg.0
IL_00ba: ldfld System.String neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<clipName>5__3
IL_00bf: call System.String System.String::Concat(System.String,System.String)
IL_00c4: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_00c9: br.s IL_00e6
IL_00cb: ldloc.1
IL_00cc: ldfld neobotics.ModSdk.Logging neobotics.ModSdk.AudioHelper::logger
IL_00d1: ldstr "Failed to load external audio: "
IL_00d6: ldarg.0
IL_00d7: ldfld System.String neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<uri>5__2
IL_00dc: call System.String System.String::Concat(System.String,System.String)
IL_00e1: callvirt System.Void neobotics.ModSdk.Logging::Warning(System.String)
IL_00e6: ldc.i4.0
IL_00e7: ret

// System.Object neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::System.Collections.Generic.IEnumerator<System.Object>.get_Current()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Object neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<>2__current
IL_0006: ret

// System.Void neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::System.Collections.IEnumerator.Reset()
.locals 
IL_0000: newobj System.Void System.NotSupportedException::.ctor()
IL_0005: throw

// System.Object neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::System.Collections.IEnumerator.get_Current()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Object neobotics.ModSdk.AudioHelper/<LoadExternalClip>d__10::<>2__current
IL_0006: ret

// System.Int32 neobotics.ModSdk.CircularList`1::get_Index()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 neobotics.ModSdk.CircularList`1<T>::index
IL_0006: ret

// System.Void neobotics.ModSdk.CircularList`1::.ctor(System.Collections.Generic.List`1<T>,T)
.locals neobotics.ModSdk.CircularList`1/<>c__DisplayClass4_0<T>
IL_0000: newobj System.Void neobotics.ModSdk.CircularList`1/<>c__DisplayClass4_0<T>::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldarg.2
IL_0008: stfld T neobotics.ModSdk.CircularList`1/<>c__DisplayClass4_0<T>::startingElement
IL_000d: ldarg.0
IL_000e: call System.Void System.Object::.ctor()
IL_0013: ldarg.0
IL_0014: ldarg.1
IL_0015: newobj System.Void System.Collections.Generic.List`1<T>::.ctor(System.Collections.Generic.IEnumerable`1<!0>)
IL_001a: stfld System.Collections.Generic.List`1<T> neobotics.ModSdk.CircularList`1<T>::circle
IL_001f: ldarg.0
IL_0020: ldarg.0
IL_0021: ldfld System.Collections.Generic.List`1<T> neobotics.ModSdk.CircularList`1<T>::circle
IL_0026: ldloc.0
IL_0027: ldftn System.Boolean neobotics.ModSdk.CircularList`1/<>c__DisplayClass4_0<T>::<.ctor>b__0(T)
IL_002d: newobj System.Void System.Predicate`1<T>::.ctor(System.Object,System.IntPtr)
IL_0032: callvirt System.Int32 System.Collections.Generic.List`1<T>::FindIndex(System.Predicate`1<!0>)
IL_0037: stfld System.Int32 neobotics.ModSdk.CircularList`1<T>::index
IL_003c: ret

// T neobotics.ModSdk.CircularList`1::Next()
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.0
IL_0002: ldfld System.Int32 neobotics.ModSdk.CircularList`1<T>::index
IL_0007: ldarg.0
IL_0008: ldfld System.Collections.Generic.List`1<T> neobotics.ModSdk.CircularList`1<T>::circle
IL_000d: callvirt System.Int32 System.Collections.Generic.List`1<T>::get_Count()
IL_0012: ldc.i4.1
IL_0013: sub
IL_0014: blt.s IL_0019
IL_0016: ldc.i4.0
IL_0017: br.s IL_0021
IL_0019: ldarg.0
IL_001a: ldfld System.Int32 neobotics.ModSdk.CircularList`1<T>::index
IL_001f: ldc.i4.1
IL_0020: add
IL_0021: stfld System.Int32 neobotics.ModSdk.CircularList`1<T>::index
IL_0026: ldarg.0
IL_0027: ldfld System.Collections.Generic.List`1<T> neobotics.ModSdk.CircularList`1<T>::circle
IL_002c: ldarg.0
IL_002d: ldfld System.Int32 neobotics.ModSdk.CircularList`1<T>::index
IL_0032: callvirt !0 System.Collections.Generic.List`1<T>::get_Item(System.Int32)
IL_0037: ret

// T neobotics.ModSdk.CircularList`1::Previous()
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.0
IL_0002: ldfld System.Int32 neobotics.ModSdk.CircularList`1<T>::index
IL_0007: ldc.i4.0
IL_0008: bgt.s IL_0019
IL_000a: ldarg.0
IL_000b: ldfld System.Collections.Generic.List`1<T> neobotics.ModSdk.CircularList`1<T>::circle
IL_0010: callvirt System.Int32 System.Collections.Generic.List`1<T>::get_Count()
IL_0015: ldc.i4.1
IL_0016: sub
IL_0017: br.s IL_0021
IL_0019: ldarg.0
IL_001a: ldfld System.Int32 neobotics.ModSdk.CircularList`1<T>::index
IL_001f: ldc.i4.1
IL_0020: sub
IL_0021: stfld System.Int32 neobotics.ModSdk.CircularList`1<T>::index
IL_0026: ldarg.0
IL_0027: ldfld System.Collections.Generic.List`1<T> neobotics.ModSdk.CircularList`1<T>::circle
IL_002c: ldarg.0
IL_002d: ldfld System.Int32 neobotics.ModSdk.CircularList`1<T>::index
IL_0032: callvirt !0 System.Collections.Generic.List`1<T>::get_Item(System.Int32)
IL_0037: ret

// System.Void neobotics.ModSdk.CircularList`1/<>c__DisplayClass4_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean neobotics.ModSdk.CircularList`1/<>c__DisplayClass4_0::<.ctor>b__0(T)
.locals 
IL_0000: ldarga.s x
IL_0002: ldarg.0
IL_0003: ldfld T neobotics.ModSdk.CircularList`1/<>c__DisplayClass4_0<T>::startingElement
IL_0008: box T
IL_000d: constrained. T
IL_0013: callvirt System.Boolean System.Object::Equals(System.Object)
IL_0018: ret

// System.String neobotics.ModSdk.ConfigFolderHelper::GetOrCreateModConfigFolder(System.String)
.locals 
IL_0000: call System.String BepInEx.Paths::get_ConfigPath()
IL_0005: ldstr "Neobotics"
IL_000a: ldarg.0
IL_000b: call System.String System.IO.Path::Combine(System.String,System.String,System.String)
IL_0010: dup
IL_0011: call System.IO.DirectoryInfo System.IO.Directory::CreateDirectory(System.String)
IL_0016: pop
IL_0017: ret

// System.Boolean neobotics.ModSdk.ConfigMock::get_Value()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean neobotics.ModSdk.ConfigMock::<Value>k__BackingField
IL_0006: ret

// System.Void neobotics.ModSdk.ConfigMock::set_Value(System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Boolean neobotics.ModSdk.ConfigMock::<Value>k__BackingField
IL_0007: ret

// System.Void neobotics.ModSdk.ConfigMock::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Single neobotics.ModSdk.CrossPlatformRandom::get_value()
.locals 
IL_0000: ldarg.0
IL_0001: callvirt System.Double System.Random::NextDouble()
IL_0006: conv.r4
IL_0007: ret

// System.Void neobotics.ModSdk.CrossPlatformRandom::.ctor()
.locals System.Random
IL_0000: ldarg.0
IL_0001: call System.Void System.Random::.ctor()
IL_0006: newobj System.Void System.Random::.ctor()
IL_000b: stloc.0
IL_000c: ldarg.0
IL_000d: ldloc.0
IL_000e: callvirt System.Int32 System.Random::Next()
IL_0013: stfld System.Int32 neobotics.ModSdk.CrossPlatformRandom::_seed
IL_0018: ret

// System.Void neobotics.ModSdk.CrossPlatformRandom::.ctor(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Random::.ctor()
IL_0006: ldarg.0
IL_0007: ldarg.1
IL_0008: stfld System.Int32 neobotics.ModSdk.CrossPlatformRandom::_seed
IL_000d: ret

// System.Single neobotics.ModSdk.CrossPlatformRandom::Range(System.Int32,System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: ldarg.2
IL_0003: callvirt System.Int32 System.Random::Next(System.Int32,System.Int32)
IL_0008: conv.r4
IL_0009: ret

// System.Single neobotics.ModSdk.CrossPlatformRandom::Range(System.Single,System.Single)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.2
IL_0002: ldarg.0
IL_0003: callvirt System.Double System.Random::NextDouble()
IL_0008: conv.r4
IL_0009: call System.Single UnityEngine.Mathf::Lerp(System.Single,System.Single,System.Single)
IL_000e: ret

// System.Int32 neobotics.ModSdk.CrossPlatformRandom::GetNext()
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.0
IL_0002: ldfld System.Int32 neobotics.ModSdk.CrossPlatformRandom::_seed
IL_0007: ldc.i4 134775813
IL_000c: mul
IL_000d: ldc.i4.1
IL_000e: add
IL_000f: stfld System.Int32 neobotics.ModSdk.CrossPlatformRandom::_seed
IL_0014: ldarg.0
IL_0015: ldfld System.Int32 neobotics.ModSdk.CrossPlatformRandom::_seed
IL_001a: ret

// System.Int32 neobotics.ModSdk.CrossPlatformRandom::Next()
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4 2147483647
IL_0006: callvirt System.Int32 System.Random::Next(System.Int32)
IL_000b: ret

// System.Int32 neobotics.ModSdk.CrossPlatformRandom::Next(System.Int32)
.locals 
IL_0000: ldarg.1
IL_0001: ldc.i4.0
IL_0002: bge.s IL_000f
IL_0004: ldstr "maxValue is less than zero."
IL_0009: newobj System.Void System.ArgumentOutOfRangeException::.ctor(System.String)
IL_000e: throw
IL_000f: ldarg.0
IL_0010: call System.Int32 neobotics.ModSdk.CrossPlatformRandom::GetNext()
IL_0015: conv.u8
IL_0016: ldarg.1
IL_0017: conv.u8
IL_0018: mul
IL_0019: ldc.i4.s 32
IL_001b: shr.un
IL_001c: conv.i4
IL_001d: ret

// System.Int32 neobotics.ModSdk.CrossPlatformRandom::Next(System.Int32,System.Int32)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.2
IL_0002: ble.s IL_000f
IL_0004: ldstr "minValue is greater than maxValue."
IL_0009: newobj System.Void System.ArgumentOutOfRangeException::.ctor(System.String)
IL_000e: throw
IL_000f: ldarg.1
IL_0010: ldarg.0
IL_0011: ldarg.2
IL_0012: ldarg.1
IL_0013: sub
IL_0014: callvirt System.Int32 System.Random::Next(System.Int32)
IL_0019: add
IL_001a: ret

// System.Double neobotics.ModSdk.CrossPlatformRandom::NextDouble()
.locals 
IL_0000: ldarg.0
IL_0001: callvirt System.Double System.Random::Sample()
IL_0006: ret

// System.Double neobotics.ModSdk.CrossPlatformRandom::Sample()
.locals 
IL_0000: ldarg.0
IL_0001: callvirt System.Int32 System.Random::Next()
IL_0006: conv.r8
IL_0007: ldc.r8 2147483647
IL_0010: div
IL_0011: ret

// System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper::get_Data()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper::<Data>k__BackingField
IL_0006: ret

// System.Void neobotics.ModSdk.CustomDataWrapper::set_Data(System.Collections.Generic.Dictionary`2<System.String,System.String>)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper::<Data>k__BackingField
IL_0007: ret

// System.Void neobotics.ModSdk.CustomDataWrapper::.ctor(System.Collections.Generic.Dictionary`2<System.String,System.String>,System.String)
.locals neobotics.ModSdk.CustomDataWrapper/<>c__DisplayClass5_0
IL_0000: newobj System.Void neobotics.ModSdk.CustomDataWrapper/<>c__DisplayClass5_0::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldarg.2
IL_0008: stfld System.String neobotics.ModSdk.CustomDataWrapper/<>c__DisplayClass5_0::keyPrefix
IL_000d: ldloc.0
IL_000e: ldarg.1
IL_000f: stfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper/<>c__DisplayClass5_0::sourceData
IL_0014: ldarg.0
IL_0015: call System.Void System.Object::.ctor()
IL_001a: ldloc.0
IL_001b: ldarg.0
IL_001c: stfld neobotics.ModSdk.CustomDataWrapper neobotics.ModSdk.CustomDataWrapper/<>c__DisplayClass5_0::<>4__this
IL_0021: ldarg.0
IL_0022: ldloc.0
IL_0023: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper/<>c__DisplayClass5_0::sourceData
IL_0028: stfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper::playerData
IL_002d: ldarg.0
IL_002e: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::.ctor()
IL_0033: call System.Void neobotics.ModSdk.CustomDataWrapper::set_Data(System.Collections.Generic.Dictionary`2<System.String,System.String>)
IL_0038: ldloc.0
IL_0039: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper/<>c__DisplayClass5_0::sourceData
IL_003e: callvirt System.Collections.Generic.Dictionary`2/KeyCollection<!0,!1> System.Collections.Generic.Dictionary`2<System.String,System.String>::get_Keys()
IL_0043: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.String>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0048: ldloc.0
IL_0049: ldftn System.Void neobotics.ModSdk.CustomDataWrapper/<>c__DisplayClass5_0::<.ctor>b__0(System.String)
IL_004f: newobj System.Void System.Action`1<System.String>::.ctor(System.Object,System.IntPtr)
IL_0054: callvirt System.Void System.Collections.Generic.List`1<System.String>::ForEach(System.Action`1<!0>)
IL_0059: ret

// System.Void neobotics.ModSdk.CustomDataWrapper::Add(System.String,System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper::get_Data()
IL_0006: ldarg.1
IL_0007: ldarg.2
IL_0008: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_000d: ldarg.0
IL_000e: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper::playerData
IL_0013: ldarg.1
IL_0014: ldarg.2
IL_0015: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_001a: ret

// System.Boolean neobotics.ModSdk.CustomDataWrapper::Remove(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper::get_Data()
IL_0006: ldarg.1
IL_0007: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::Remove(!0)
IL_000c: ldarg.0
IL_000d: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper::playerData
IL_0012: ldarg.1
IL_0013: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::Remove(!0)
IL_0018: and
IL_0019: ret

// System.Void neobotics.ModSdk.CustomDataWrapper::Set(System.String,System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper::get_Data()
IL_0006: ldarg.1
IL_0007: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::ContainsKey(!0)
IL_000c: brfalse.s IL_001d
IL_000e: ldarg.0
IL_000f: call System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper::get_Data()
IL_0014: ldarg.1
IL_0015: ldarg.2
IL_0016: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::set_Item(!0,!1)
IL_001b: br.s IL_002a
IL_001d: ldarg.0
IL_001e: call System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper::get_Data()
IL_0023: ldarg.1
IL_0024: ldarg.2
IL_0025: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_002a: ldarg.0
IL_002b: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper::playerData
IL_0030: ldarg.1
IL_0031: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::ContainsKey(!0)
IL_0036: brfalse.s IL_0046
IL_0038: ldarg.0
IL_0039: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper::playerData
IL_003e: ldarg.1
IL_003f: ldarg.2
IL_0040: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::set_Item(!0,!1)
IL_0045: ret
IL_0046: ldarg.0
IL_0047: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper::playerData
IL_004c: ldarg.1
IL_004d: ldarg.2
IL_004e: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_0053: ret

// System.String neobotics.ModSdk.CustomDataWrapper::Get(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper::get_Data()
IL_0006: ldarg.1
IL_0007: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::ContainsKey(!0)
IL_000c: brfalse.s IL_001b
IL_000e: ldarg.0
IL_000f: call System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper::get_Data()
IL_0014: ldarg.1
IL_0015: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,System.String>::get_Item(!0)
IL_001a: ret
IL_001b: ldnull
IL_001c: ret

// System.Boolean neobotics.ModSdk.CustomDataWrapper::ContainsKey(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper::get_Data()
IL_0006: ldarg.1
IL_0007: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::ContainsKey(!0)
IL_000c: ret

// System.Void neobotics.ModSdk.CustomDataWrapper::PreSaveSync()
.locals System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>, System.Collections.Generic.KeyValuePair`2<System.String,System.String>
IL_0000: ldarg.0
IL_0001: call System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper::get_Data()
IL_0006: callvirt System.Collections.Generic.Dictionary`2/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2<System.String,System.String>::GetEnumerator()
IL_000b: stloc.0
IL_000c: br.s IL_0043
IL_000e: ldloca.s V_0
IL_0010: call System.Collections.Generic.KeyValuePair`2<!0,!1> System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>::get_Current()
IL_0015: stloc.1
IL_0016: ldarg.0
IL_0017: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper::playerData
IL_001c: ldloca.s V_1
IL_001e: call !0 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Key()
IL_0023: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::ContainsKey(!0)
IL_0028: brtrue.s IL_0043
IL_002a: ldarg.0
IL_002b: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper::playerData
IL_0030: ldloca.s V_1
IL_0032: call !0 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Key()
IL_0037: ldloca.s V_1
IL_0039: call !1 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Value()
IL_003e: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_0043: ldloca.s V_0
IL_0045: call System.Boolean System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>::MoveNext()
IL_004a: brtrue.s IL_000e
IL_004c: leave.s IL_005c
IL_004e: ldloca.s V_0
IL_0050: constrained. System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>
IL_0056: callvirt System.Void System.IDisposable::Dispose()
IL_005b: endfinally
IL_005c: ret
// EH Finally: 12 - 78 => 78 - 92

// System.Void neobotics.ModSdk.CustomDataWrapper/<>c__DisplayClass5_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void neobotics.ModSdk.CustomDataWrapper/<>c__DisplayClass5_0::<.ctor>b__0(System.String)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.0
IL_0002: ldfld System.String neobotics.ModSdk.CustomDataWrapper/<>c__DisplayClass5_0::keyPrefix
IL_0007: callvirt System.Boolean System.String::StartsWith(System.String)
IL_000c: brfalse.s IL_002b
IL_000e: ldarg.0
IL_000f: ldfld neobotics.ModSdk.CustomDataWrapper neobotics.ModSdk.CustomDataWrapper/<>c__DisplayClass5_0::<>4__this
IL_0014: call System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper::get_Data()
IL_0019: ldarg.1
IL_001a: ldarg.0
IL_001b: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.CustomDataWrapper/<>c__DisplayClass5_0::sourceData
IL_0020: ldarg.1
IL_0021: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,System.String>::get_Item(!0)
IL_0026: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_002b: ret

// System.Void neobotics.ModSdk.DebugUtils::ObjectInspector(System.Object)
.locals System.Reflection.BindingFlags, System.Type, System.Reflection.PropertyInfo[], System.Int32, System.Reflection.PropertyInfo, System.Reflection.FieldInfo[], System.Reflection.FieldInfo
IL_0000: ldarg.0
IL_0001: brtrue.s IL_000e
IL_0003: ldstr "Object is null"
IL_0008: call System.Void UnityEngine.Debug::Log(System.Object)
IL_000d: ret
IL_000e: ldc.i4.s 60
IL_0010: stloc.0
IL_0011: ldarg.0
IL_0012: callvirt System.Type System.Object::GetType()
IL_0017: stloc.1
IL_0018: ldstr "Object: "
IL_001d: ldarg.0
IL_001e: callvirt System.String System.Object::ToString()
IL_0023: ldstr " Type "
IL_0028: ldloc.1
IL_0029: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_002e: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_0033: call System.Void UnityEngine.Debug::Log(System.Object)
IL_0038: ldloc.1
IL_0039: ldloc.0
IL_003a: callvirt System.Reflection.PropertyInfo[] System.Type::GetProperties(System.Reflection.BindingFlags)
IL_003f: stloc.2
IL_0040: ldc.i4.0
IL_0041: stloc.3
IL_0042: br.s IL_00b7
IL_0044: ldloc.2
IL_0045: ldloc.3
IL_0046: ldelem.ref
IL_0047: stloc.s V_4
IL_0049: ldloc.s V_4
IL_004b: callvirt System.Boolean System.Reflection.PropertyInfo::get_CanRead()
IL_0050: brfalse.s IL_0078
IL_0052: ldstr "Property: {0}.{1} = {2}"
IL_0057: ldloc.1
IL_0058: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_005d: ldloc.s V_4
IL_005f: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_0064: ldloc.s V_4
IL_0066: ldarg.0
IL_0067: callvirt System.Object System.Reflection.PropertyInfo::GetValue(System.Object)
IL_006c: call System.String System.String::Format(System.String,System.Object,System.Object,System.Object)
IL_0071: call System.Void UnityEngine.Debug::Log(System.Object)
IL_0076: br.s IL_00b3
IL_0078: ldc.i4.5
IL_0079: newarr System.String
IL_007e: dup
IL_007f: ldc.i4.0
IL_0080: ldstr "Property: "
IL_0085: stelem.ref
IL_0086: dup
IL_0087: ldc.i4.1
IL_0088: ldloc.1
IL_0089: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_008e: stelem.ref
IL_008f: dup
IL_0090: ldc.i4.2
IL_0091: ldstr "."
IL_0096: stelem.ref
IL_0097: dup
IL_0098: ldc.i4.3
IL_0099: ldloc.s V_4
IL_009b: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_00a0: stelem.ref
IL_00a1: dup
IL_00a2: ldc.i4.4
IL_00a3: ldstr " is write-only"
IL_00a8: stelem.ref
IL_00a9: call System.String System.String::Concat(System.String[])
IL_00ae: call System.Void UnityEngine.Debug::Log(System.Object)
IL_00b3: ldloc.3
IL_00b4: ldc.i4.1
IL_00b5: add
IL_00b6: stloc.3
IL_00b7: ldloc.3
IL_00b8: ldloc.2
IL_00b9: ldlen
IL_00ba: conv.i4
IL_00bb: blt.s IL_0044
IL_00bd: ldloc.1
IL_00be: ldloc.0
IL_00bf: callvirt System.Reflection.FieldInfo[] System.Type::GetFields(System.Reflection.BindingFlags)
IL_00c4: stloc.s V_5
IL_00c6: ldc.i4.0
IL_00c7: stloc.3
IL_00c8: br.s IL_00dd
IL_00ca: ldloc.s V_5
IL_00cc: ldloc.3
IL_00cd: ldelem.ref
IL_00ce: stloc.s V_6
IL_00d0: ldarg.0
IL_00d1: ldloc.1
IL_00d2: ldloc.s V_6
IL_00d4: call System.Void neobotics.ModSdk.DebugUtils::FieldPrinter(System.Object,System.Type,System.Reflection.FieldInfo)
IL_00d9: ldloc.3
IL_00da: ldc.i4.1
IL_00db: add
IL_00dc: stloc.3
IL_00dd: ldloc.3
IL_00de: ldloc.s V_5
IL_00e0: ldlen
IL_00e1: conv.i4
IL_00e2: blt.s IL_00ca
IL_00e4: ret

// System.Void neobotics.ModSdk.DebugUtils::MethodInspector(System.Object)
.locals System.Reflection.BindingFlags, System.Type, System.Reflection.MethodInfo[], System.Int32, System.Reflection.MethodInfo, System.String
IL_0000: ldarg.0
IL_0001: brtrue.s IL_000e
IL_0003: ldstr "Object is null"
IL_0008: call System.Void UnityEngine.Debug::Log(System.Object)
IL_000d: ret
IL_000e: ldc.i4.s 60
IL_0010: stloc.0
IL_0011: ldarg.0
IL_0012: callvirt System.Type System.Object::GetType()
IL_0017: stloc.1
IL_0018: ldstr "Method: "
IL_001d: ldarg.0
IL_001e: callvirt System.String System.Object::ToString()
IL_0023: ldstr " Type "
IL_0028: ldloc.1
IL_0029: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_002e: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_0033: call System.Void UnityEngine.Debug::Log(System.Object)
IL_0038: ldloc.1
IL_0039: ldloc.0
IL_003a: callvirt System.Reflection.MethodInfo[] System.Type::GetMethods(System.Reflection.BindingFlags)
IL_003f: stloc.2
IL_0040: ldc.i4.0
IL_0041: stloc.3
IL_0042: br.s IL_00b0
IL_0044: ldloc.2
IL_0045: ldloc.3
IL_0046: ldelem.ref
IL_0047: stloc.s V_4
IL_0049: ldloc.s V_4
IL_004b: callvirt System.Reflection.ParameterInfo[] System.Reflection.MethodBase::GetParameters()
IL_0050: pop
IL_0051: ldstr ", "
IL_0056: ldloc.s V_4
IL_0058: callvirt System.Reflection.ParameterInfo[] System.Reflection.MethodBase::GetParameters()
IL_005d: ldsfld System.Func`2<System.Reflection.ParameterInfo,System.String> neobotics.ModSdk.DebugUtils/<>c::<>9__1_0
IL_0062: dup
IL_0063: brtrue.s IL_007c
IL_0065: pop
IL_0066: ldsfld neobotics.ModSdk.DebugUtils/<>c neobotics.ModSdk.DebugUtils/<>c::<>9
IL_006b: ldftn System.String neobotics.ModSdk.DebugUtils/<>c::<MethodInspector>b__1_0(System.Reflection.ParameterInfo)
IL_0071: newobj System.Void System.Func`2<System.Reflection.ParameterInfo,System.String>::.ctor(System.Object,System.IntPtr)
IL_0076: dup
IL_0077: stsfld System.Func`2<System.Reflection.ParameterInfo,System.String> neobotics.ModSdk.DebugUtils/<>c::<>9__1_0
IL_007c: call System.Collections.Generic.IEnumerable`1<!!1> System.Linq.Enumerable::Select<System.Reflection.ParameterInfo,System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_0081: call !!0[] System.Linq.Enumerable::ToArray<System.String>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0086: call System.String System.String::Join(System.String,System.String[])
IL_008b: stloc.s V_5
IL_008d: ldstr "{0} {1} ({2})"
IL_0092: ldloc.s V_4
IL_0094: callvirt System.Type System.Reflection.MethodInfo::get_ReturnType()
IL_0099: ldloc.s V_4
IL_009b: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_00a0: ldloc.s V_5
IL_00a2: call System.String System.String::Format(System.String,System.Object,System.Object,System.Object)
IL_00a7: call System.Void UnityEngine.Debug::Log(System.Object)
IL_00ac: ldloc.3
IL_00ad: ldc.i4.1
IL_00ae: add
IL_00af: stloc.3
IL_00b0: ldloc.3
IL_00b1: ldloc.2
IL_00b2: ldlen
IL_00b3: conv.i4
IL_00b4: blt.s IL_0044
IL_00b6: ret

// System.Void neobotics.ModSdk.DebugUtils::ItemDataInspector(ItemDrop/ItemData)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void neobotics.ModSdk.DebugUtils::ObjectInspector(System.Object)
IL_0006: ldarg.0
IL_0007: brtrue.s IL_000c
IL_0009: ldnull
IL_000a: br.s IL_0012
IL_000c: ldarg.0
IL_000d: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0012: call System.Void neobotics.ModSdk.DebugUtils::ObjectInspector(System.Object)
IL_0017: ret

// System.Void neobotics.ModSdk.DebugUtils::FieldPrinter(System.Object,System.Type,System.Reflection.FieldInfo)
.locals ItemDrop/ItemData, UnityEngine.Transform, EffectList, EffectList/EffectData[], System.Int32, EffectList/EffectData
IL_0000: ldarg.2
IL_0001: callvirt System.Type System.Reflection.FieldInfo::get_FieldType()
IL_0006: ldtoken ItemDrop/ItemData
IL_000b: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0010: call System.Boolean System.Type::op_Equality(System.Type,System.Type)
IL_0015: brfalse.s IL_0059
IL_0017: ldarg.2
IL_0018: ldarg.0
IL_0019: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_001e: castclass ItemDrop/ItemData
IL_0023: stloc.0
IL_0024: ldloc.0
IL_0025: brfalse.s IL_0032
IL_0027: ldloc.0
IL_0028: call System.Void neobotics.ModSdk.DebugUtils::ItemDataInspector(ItemDrop/ItemData)
IL_002d: br IL_019a
IL_0032: ldstr "{0}.{1} = {2} [null]"
IL_0037: ldarg.1
IL_0038: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_003d: ldarg.2
IL_003e: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_0043: ldarg.2
IL_0044: ldarg.0
IL_0045: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_004a: call System.String System.String::Format(System.String,System.Object,System.Object,System.Object)
IL_004f: call System.Void UnityEngine.Debug::Log(System.Object)
IL_0054: br IL_019a
IL_0059: ldarg.2
IL_005a: callvirt System.Type System.Reflection.FieldInfo::get_FieldType()
IL_005f: ldtoken UnityEngine.Transform
IL_0064: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0069: call System.Boolean System.Type::op_Equality(System.Type,System.Type)
IL_006e: brfalse.s IL_00cc
IL_0070: ldarg.2
IL_0071: ldarg.0
IL_0072: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_0077: castclass UnityEngine.Transform
IL_007c: stloc.1
IL_007d: ldloc.1
IL_007e: ldnull
IL_007f: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0084: brfalse.s IL_00a5
IL_0086: ldstr "	Transform.parent = "
IL_008b: ldloc.1
IL_008c: callvirt UnityEngine.Transform UnityEngine.Transform::get_parent()
IL_0091: callvirt System.String UnityEngine.Object::get_name()
IL_0096: call System.String System.String::Concat(System.String,System.String)
IL_009b: call System.Void UnityEngine.Debug::Log(System.Object)
IL_00a0: br IL_019a
IL_00a5: ldstr "{0}.{1} = {2} [null]"
IL_00aa: ldarg.1
IL_00ab: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_00b0: ldarg.2
IL_00b1: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_00b6: ldarg.2
IL_00b7: ldarg.0
IL_00b8: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_00bd: call System.String System.String::Format(System.String,System.Object,System.Object,System.Object)
IL_00c2: call System.Void UnityEngine.Debug::Log(System.Object)
IL_00c7: br IL_019a
IL_00cc: ldarg.2
IL_00cd: callvirt System.Type System.Reflection.FieldInfo::get_FieldType()
IL_00d2: ldtoken EffectList
IL_00d7: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00dc: call System.Boolean System.Type::op_Equality(System.Type,System.Type)
IL_00e1: brfalse IL_0178
IL_00e6: ldarg.2
IL_00e7: ldarg.0
IL_00e8: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_00ed: castclass EffectList
IL_00f2: stloc.2
IL_00f3: ldloc.2
IL_00f4: brfalse.s IL_0154
IL_00f6: ldstr "{0}.{1} = {2}:"
IL_00fb: ldarg.1
IL_00fc: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_0101: ldarg.2
IL_0102: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_0107: ldarg.2
IL_0108: ldarg.0
IL_0109: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_010e: call System.String System.String::Format(System.String,System.Object,System.Object,System.Object)
IL_0113: call System.Void UnityEngine.Debug::Log(System.Object)
IL_0118: ldloc.2
IL_0119: ldfld EffectList/EffectData[] EffectList::m_effectPrefabs
IL_011e: stloc.3
IL_011f: ldc.i4.0
IL_0120: stloc.s V_4
IL_0122: br.s IL_014b
IL_0124: ldloc.3
IL_0125: ldloc.s V_4
IL_0127: ldelem.ref
IL_0128: stloc.s V_5
IL_012a: ldstr "	EffectData.m_prefab = "
IL_012f: ldloc.s V_5
IL_0131: ldfld UnityEngine.GameObject EffectList/EffectData::m_prefab
IL_0136: callvirt System.String UnityEngine.Object::get_name()
IL_013b: call System.String System.String::Concat(System.String,System.String)
IL_0140: call System.Void UnityEngine.Debug::Log(System.Object)
IL_0145: ldloc.s V_4
IL_0147: ldc.i4.1
IL_0148: add
IL_0149: stloc.s V_4
IL_014b: ldloc.s V_4
IL_014d: ldloc.3
IL_014e: ldlen
IL_014f: conv.i4
IL_0150: blt.s IL_0124
IL_0152: br.s IL_019a
IL_0154: ldstr "{0}.{1} = {2} [null]"
IL_0159: ldarg.1
IL_015a: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_015f: ldarg.2
IL_0160: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_0165: ldarg.2
IL_0166: ldarg.0
IL_0167: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_016c: call System.String System.String::Format(System.String,System.Object,System.Object,System.Object)
IL_0171: call System.Void UnityEngine.Debug::Log(System.Object)
IL_0176: br.s IL_019a
IL_0178: ldstr "{0}.{1} = {2}"
IL_017d: ldarg.1
IL_017e: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_0183: ldarg.2
IL_0184: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_0189: ldarg.2
IL_018a: ldarg.0
IL_018b: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_0190: call System.String System.String::Format(System.String,System.Object,System.Object,System.Object)
IL_0195: call System.Void UnityEngine.Debug::Log(System.Object)
IL_019a: leave.s IL_01cb
IL_019c: pop
IL_019d: ldstr "Exception accessing "
IL_01a2: ldarg.1
IL_01a3: brtrue.s IL_01a8
IL_01a5: ldnull
IL_01a6: br.s IL_01ae
IL_01a8: ldarg.1
IL_01a9: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_01ae: ldstr "."
IL_01b3: ldarg.2
IL_01b4: brtrue.s IL_01b9
IL_01b6: ldnull
IL_01b7: br.s IL_01bf
IL_01b9: ldarg.2
IL_01ba: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_01bf: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_01c4: call System.Void UnityEngine.Debug::Log(System.Object)
IL_01c9: leave.s IL_01cb
IL_01cb: ret
// EH Catch: 0 - 412 => 412 - 459

// System.Void neobotics.ModSdk.DebugUtils::GameObjectInspector(UnityEngine.GameObject)
.locals UnityEngine.Component[], UnityEngine.Component[], System.Int32, UnityEngine.Component
IL_0000: ldarg.0
IL_0001: ldnull
IL_0002: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0007: brfalse.s IL_0014
IL_0009: ldstr "

Game Object is null"
IL_000e: call System.Void UnityEngine.Debug::Log(System.Object)
IL_0013: ret
IL_0014: ldstr "

Inspecting GameObject "
IL_0019: ldarg.0
IL_001a: callvirt System.String UnityEngine.Object::get_name()
IL_001f: call System.String System.String::Concat(System.String,System.String)
IL_0024: call System.Void UnityEngine.Debug::Log(System.Object)
IL_0029: ldarg.0
IL_002a: call System.Void neobotics.ModSdk.DebugUtils::ObjectInspector(System.Object)
IL_002f: ldarg.0
IL_0030: callvirt !!0[] UnityEngine.GameObject::GetComponentsInChildren<UnityEngine.Component>()
IL_0035: stloc.0
IL_0036: ldloc.0
IL_0037: ldlen
IL_0038: brfalse.s IL_0059
IL_003a: ldloc.0
IL_003b: stloc.1
IL_003c: ldc.i4.0
IL_003d: stloc.2
IL_003e: br.s IL_0053
IL_0040: ldloc.1
IL_0041: ldloc.2
IL_0042: ldelem.ref
IL_0043: stloc.3
IL_0044: ldloc.3
IL_0045: call System.Void neobotics.ModSdk.DebugUtils::ComponentInspector(UnityEngine.Component)
IL_004a: leave.s IL_004f
IL_004c: pop
IL_004d: leave.s IL_004f
IL_004f: ldloc.2
IL_0050: ldc.i4.1
IL_0051: add
IL_0052: stloc.2
IL_0053: ldloc.2
IL_0054: ldloc.1
IL_0055: ldlen
IL_0056: conv.i4
IL_0057: blt.s IL_0040
IL_0059: ret
// EH Catch: 68 - 76 => 76 - 79

// System.Void neobotics.ModSdk.DebugUtils::PrintList(System.Collections.Generic.List`1<T>)
.locals System.Collections.Generic.List`1/Enumerator<T>, T
IL_0000: ldarg.0
IL_0001: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<T>::GetEnumerator()
IL_0006: stloc.0
IL_0007: br.s IL_0023
IL_0009: ldloca.s V_0
IL_000b: call !0 System.Collections.Generic.List`1/Enumerator<T>::get_Current()
IL_0010: stloc.1
IL_0011: ldloca.s V_1
IL_0013: constrained. T
IL_0019: callvirt System.String System.Object::ToString()
IL_001e: call System.Void UnityEngine.Debug::Log(System.Object)
IL_0023: ldloca.s V_0
IL_0025: call System.Boolean System.Collections.Generic.List`1/Enumerator<T>::MoveNext()
IL_002a: brtrue.s IL_0009
IL_002c: leave.s IL_003c
IL_002e: ldloca.s V_0
IL_0030: constrained. System.Collections.Generic.List`1/Enumerator<T>
IL_0036: callvirt System.Void System.IDisposable::Dispose()
IL_003b: endfinally
IL_003c: ret
// EH Finally: 7 - 46 => 46 - 60

// System.Void neobotics.ModSdk.DebugUtils::ComponentInspector(UnityEngine.Component)
.locals 
IL_0000: ldstr "

Inspecting Component "
IL_0005: ldarg.0
IL_0006: brtrue.s IL_000b
IL_0008: ldnull
IL_0009: br.s IL_0011
IL_000b: ldarg.0
IL_000c: call System.String UnityEngine.Object::get_name()
IL_0011: ldstr " with parent "
IL_0016: ldarg.0
IL_0017: brtrue.s IL_001c
IL_0019: ldnull
IL_001a: br.s IL_003a
IL_001c: ldarg.0
IL_001d: call UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0022: dup
IL_0023: brtrue.s IL_0029
IL_0025: pop
IL_0026: ldnull
IL_0027: br.s IL_003a
IL_0029: call UnityEngine.Transform UnityEngine.Transform::get_parent()
IL_002e: dup
IL_002f: brtrue.s IL_0035
IL_0031: pop
IL_0032: ldnull
IL_0033: br.s IL_003a
IL_0035: call System.String UnityEngine.Object::get_name()
IL_003a: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_003f: call System.Void UnityEngine.Debug::Log(System.Object)
IL_0044: ldarg.0
IL_0045: call System.Void neobotics.ModSdk.DebugUtils::ObjectInspector(System.Object)
IL_004a: ret

// System.Void neobotics.ModSdk.DebugUtils::EffectsInspector(EffectList)
.locals EffectList/EffectData[], EffectList/EffectData[], System.Int32, EffectList/EffectData
IL_0000: ldarg.0
IL_0001: ldfld EffectList/EffectData[] EffectList::m_effectPrefabs
IL_0006: stloc.0
IL_0007: ldstr "Effect list has effects {0} count {1}"
IL_000c: ldarg.0
IL_000d: callvirt System.Boolean EffectList::HasEffects()
IL_0012: box System.Boolean
IL_0017: ldloc.0
IL_0018: ldlen
IL_0019: conv.i4
IL_001a: box System.Int32
IL_001f: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_0024: call System.Void UnityEngine.Debug::Log(System.Object)
IL_0029: ldloc.0
IL_002a: stloc.1
IL_002b: ldc.i4.0
IL_002c: stloc.2
IL_002d: br.s IL_0062
IL_002f: ldloc.1
IL_0030: ldloc.2
IL_0031: ldelem.ref
IL_0032: stloc.3
IL_0033: ldstr "Effect Data {0} prefab name {1} prefab GameObject name {2}"
IL_0038: ldloc.3
IL_0039: ldloc.3
IL_003a: ldfld UnityEngine.GameObject EffectList/EffectData::m_prefab
IL_003f: callvirt System.String UnityEngine.Object::get_name()
IL_0044: ldloc.3
IL_0045: ldfld UnityEngine.GameObject EffectList/EffectData::m_prefab
IL_004a: callvirt UnityEngine.GameObject UnityEngine.GameObject::get_gameObject()
IL_004f: callvirt System.String UnityEngine.Object::get_name()
IL_0054: call System.String System.String::Format(System.String,System.Object,System.Object,System.Object)
IL_0059: call System.Void UnityEngine.Debug::Log(System.Object)
IL_005e: ldloc.2
IL_005f: ldc.i4.1
IL_0060: add
IL_0061: stloc.2
IL_0062: ldloc.2
IL_0063: ldloc.1
IL_0064: ldlen
IL_0065: conv.i4
IL_0066: blt.s IL_002f
IL_0068: ret

// System.Void neobotics.ModSdk.DebugUtils::PrintInventory()
.locals System.Collections.Generic.List`1/Enumerator<ItemDrop/ItemData>
IL_0000: ldsfld Player Player::m_localPlayer
IL_0005: callvirt Inventory Humanoid::GetInventory()
IL_000a: callvirt System.Collections.Generic.List`1<ItemDrop/ItemData> Inventory::GetAllItems()
IL_000f: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<ItemDrop/ItemData>::GetEnumerator()
IL_0014: stloc.0
IL_0015: br.s IL_002d
IL_0017: ldloca.s V_0
IL_0019: call !0 System.Collections.Generic.List`1/Enumerator<ItemDrop/ItemData>::get_Current()
IL_001e: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0023: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_0028: call System.Void UnityEngine.Debug::Log(System.Object)
IL_002d: ldloca.s V_0
IL_002f: call System.Boolean System.Collections.Generic.List`1/Enumerator<ItemDrop/ItemData>::MoveNext()
IL_0034: brtrue.s IL_0017
IL_0036: leave.s IL_0046
IL_0038: ldloca.s V_0
IL_003a: constrained. System.Collections.Generic.List`1/Enumerator<ItemDrop/ItemData>
IL_0040: callvirt System.Void System.IDisposable::Dispose()
IL_0045: endfinally
IL_0046: ret
// EH Finally: 21 - 56 => 56 - 70

// System.Void neobotics.ModSdk.DebugUtils::PrintAllObjects()
.locals 
IL_0000: call ZNetScene ZNetScene::get_instance()
IL_0005: ldfld System.Collections.Generic.List`1<UnityEngine.GameObject> ZNetScene::m_prefabs
IL_000a: ldsfld System.Action`1<UnityEngine.GameObject> neobotics.ModSdk.DebugUtils/<>c::<>9__9_0
IL_000f: dup
IL_0010: brtrue.s IL_0029
IL_0012: pop
IL_0013: ldsfld neobotics.ModSdk.DebugUtils/<>c neobotics.ModSdk.DebugUtils/<>c::<>9
IL_0018: ldftn System.Void neobotics.ModSdk.DebugUtils/<>c::<PrintAllObjects>b__9_0(UnityEngine.GameObject)
IL_001e: newobj System.Void System.Action`1<UnityEngine.GameObject>::.ctor(System.Object,System.IntPtr)
IL_0023: dup
IL_0024: stsfld System.Action`1<UnityEngine.GameObject> neobotics.ModSdk.DebugUtils/<>c::<>9__9_0
IL_0029: callvirt System.Void System.Collections.Generic.List`1<UnityEngine.GameObject>::ForEach(System.Action`1<!0>)
IL_002e: ret

// System.Void neobotics.ModSdk.DebugUtils::PrintAllCharacters()
.locals 
IL_0000: call System.Collections.Generic.List`1<Character> Character::GetAllCharacters()
IL_0005: ldsfld System.Action`1<Character> neobotics.ModSdk.DebugUtils/<>c::<>9__10_0
IL_000a: dup
IL_000b: brtrue.s IL_0024
IL_000d: pop
IL_000e: ldsfld neobotics.ModSdk.DebugUtils/<>c neobotics.ModSdk.DebugUtils/<>c::<>9
IL_0013: ldftn System.Void neobotics.ModSdk.DebugUtils/<>c::<PrintAllCharacters>b__10_0(Character)
IL_0019: newobj System.Void System.Action`1<Character>::.ctor(System.Object,System.IntPtr)
IL_001e: dup
IL_001f: stsfld System.Action`1<Character> neobotics.ModSdk.DebugUtils/<>c::<>9__10_0
IL_0024: callvirt System.Void System.Collections.Generic.List`1<Character>::ForEach(System.Action`1<!0>)
IL_0029: ret

// System.Void neobotics.ModSdk.DebugUtils::PrintAllLayers()
.locals System.String[], System.Int32, System.String
IL_0000: ldc.i4.0
IL_0001: ldc.i4.s 31
IL_0003: call System.Collections.Generic.IEnumerable`1<System.Int32> System.Linq.Enumerable::Range(System.Int32,System.Int32)
IL_0008: ldsfld System.Func`2<System.Int32,System.String> neobotics.ModSdk.DebugUtils/<>c::<>9__11_0
IL_000d: dup
IL_000e: brtrue.s IL_0027
IL_0010: pop
IL_0011: ldsfld neobotics.ModSdk.DebugUtils/<>c neobotics.ModSdk.DebugUtils/<>c::<>9
IL_0016: ldftn System.String neobotics.ModSdk.DebugUtils/<>c::<PrintAllLayers>b__11_0(System.Int32)
IL_001c: newobj System.Void System.Func`2<System.Int32,System.String>::.ctor(System.Object,System.IntPtr)
IL_0021: dup
IL_0022: stsfld System.Func`2<System.Int32,System.String> neobotics.ModSdk.DebugUtils/<>c::<>9__11_0
IL_0027: call System.Collections.Generic.IEnumerable`1<!!1> System.Linq.Enumerable::Select<System.Int32,System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_002c: ldsfld System.Func`2<System.String,System.Boolean> neobotics.ModSdk.DebugUtils/<>c::<>9__11_1
IL_0031: dup
IL_0032: brtrue.s IL_004b
IL_0034: pop
IL_0035: ldsfld neobotics.ModSdk.DebugUtils/<>c neobotics.ModSdk.DebugUtils/<>c::<>9
IL_003a: ldftn System.Boolean neobotics.ModSdk.DebugUtils/<>c::<PrintAllLayers>b__11_1(System.String)
IL_0040: newobj System.Void System.Func`2<System.String,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0045: dup
IL_0046: stsfld System.Func`2<System.String,System.Boolean> neobotics.ModSdk.DebugUtils/<>c::<>9__11_1
IL_004b: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0050: call !!0[] System.Linq.Enumerable::ToArray<System.String>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0055: stloc.0
IL_0056: ldc.i4.0
IL_0057: stloc.1
IL_0058: br.s IL_008c
IL_005a: ldloc.0
IL_005b: ldloc.1
IL_005c: ldelem.ref
IL_005d: stloc.2
IL_005e: ldstr "Layer "
IL_0063: ldloc.2
IL_0064: ldstr " "
IL_0069: ldloc.2
IL_006a: call System.Int32 UnityEngine.LayerMask::NameToLayer(System.String)
IL_006f: ldc.i4.2
IL_0070: call System.String System.Convert::ToString(System.Int32,System.Int32)
IL_0075: ldc.i4.s 32
IL_0077: ldc.i4.s 48
IL_0079: callvirt System.String System.String::PadLeft(System.Int32,System.Char)
IL_007e: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_0083: call System.Void UnityEngine.Debug::Log(System.Object)
IL_0088: ldloc.1
IL_0089: ldc.i4.1
IL_008a: add
IL_008b: stloc.1
IL_008c: ldloc.1
IL_008d: ldloc.0
IL_008e: ldlen
IL_008f: conv.i4
IL_0090: blt.s IL_005a
IL_0092: ret

// System.Void neobotics.ModSdk.DebugUtils::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void neobotics.ModSdk.DebugUtils/<>c::.cctor()
.locals 
IL_0000: newobj System.Void neobotics.ModSdk.DebugUtils/<>c::.ctor()
IL_0005: stsfld neobotics.ModSdk.DebugUtils/<>c neobotics.ModSdk.DebugUtils/<>c::<>9
IL_000a: ret

// System.Void neobotics.ModSdk.DebugUtils/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.String neobotics.ModSdk.DebugUtils/<>c::<MethodInspector>b__1_0(System.Reflection.ParameterInfo)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt System.Type System.Reflection.ParameterInfo::get_ParameterType()
IL_0006: dup
IL_0007: brtrue.s IL_000d
IL_0009: pop
IL_000a: ldnull
IL_000b: br.s IL_0012
IL_000d: callvirt System.String System.Object::ToString()
IL_0012: ldstr " "
IL_0017: ldarg.1
IL_0018: callvirt System.String System.Reflection.ParameterInfo::get_Name()
IL_001d: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0022: ret

// System.Void neobotics.ModSdk.DebugUtils/<>c::<PrintAllObjects>b__9_0(UnityEngine.GameObject)
.locals 
IL_0000: ldstr "GameObject "
IL_0005: ldarg.1
IL_0006: callvirt System.String UnityEngine.Object::get_name()
IL_000b: call System.String System.String::Concat(System.String,System.String)
IL_0010: call System.Void UnityEngine.Debug::Log(System.Object)
IL_0015: ret

// System.Void neobotics.ModSdk.DebugUtils/<>c::<PrintAllCharacters>b__10_0(Character)
.locals 
IL_0000: ldstr "Character "
IL_0005: ldarg.1
IL_0006: callvirt System.String UnityEngine.Object::get_name()
IL_000b: call System.String System.String::Concat(System.String,System.String)
IL_0010: call System.Void UnityEngine.Debug::Log(System.Object)
IL_0015: ret

// System.String neobotics.ModSdk.DebugUtils/<>c::<PrintAllLayers>b__11_0(System.Int32)
.locals 
IL_0000: ldarg.1
IL_0001: call System.String UnityEngine.LayerMask::LayerToName(System.Int32)
IL_0006: ret

// System.Boolean neobotics.ModSdk.DebugUtils/<>c::<PrintAllLayers>b__11_1(System.String)
.locals 
IL_0000: ldarg.1
IL_0001: call System.Boolean System.String::IsNullOrEmpty(System.String)
IL_0006: ldc.i4.0
IL_0007: ceq
IL_0009: ret

// BepInEx.Configuration.ConfigEntry`1<T> neobotics.ModSdk.DelegatedConfigEntry`1::get_ConfigEntry()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld BepInEx.Configuration.ConfigEntry`1<T> neobotics.ModSdk.DelegatedConfigEntry`1<T>::_entry
IL_0006: ret

// System.Void neobotics.ModSdk.DelegatedConfigEntry`1::set_ConfigEntry(BepInEx.Configuration.ConfigEntry`1<T>)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld BepInEx.Configuration.ConfigEntry`1<T> neobotics.ModSdk.DelegatedConfigEntry`1<T>::_entry
IL_0007: ldarg.0
IL_0008: ldfld BepInEx.Configuration.ConfigEntry`1<T> neobotics.ModSdk.DelegatedConfigEntry`1<T>::_entry
IL_000d: brfalse.s IL_0028
IL_000f: ldarg.0
IL_0010: ldfld System.EventHandler neobotics.ModSdk.DelegatedConfigEntry`1<T>::rootHandler
IL_0015: brfalse.s IL_0028
IL_0017: ldarg.0
IL_0018: ldfld BepInEx.Configuration.ConfigEntry`1<T> neobotics.ModSdk.DelegatedConfigEntry`1<T>::_entry
IL_001d: ldarg.0
IL_001e: ldfld System.EventHandler neobotics.ModSdk.DelegatedConfigEntry`1<T>::rootHandler
IL_0023: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<T>::add_SettingChanged(System.EventHandler)
IL_0028: ldarg.0
IL_0029: ldarg.0
IL_002a: ldfld BepInEx.Configuration.ConfigEntry`1<T> neobotics.ModSdk.DelegatedConfigEntry`1<T>::_entry
IL_002f: callvirt BepInEx.Configuration.ConfigDefinition BepInEx.Configuration.ConfigEntryBase::get_Definition()
IL_0034: callvirt System.String BepInEx.Configuration.ConfigDefinition::get_Key()
IL_0039: stfld System.String neobotics.ModSdk.DelegatedConfigEntryBase::Name
IL_003e: ldarg.0
IL_003f: ldarg.0
IL_0040: ldfld BepInEx.Configuration.ConfigEntry`1<T> neobotics.ModSdk.DelegatedConfigEntry`1<T>::_entry
IL_0045: callvirt BepInEx.Configuration.ConfigDefinition BepInEx.Configuration.ConfigEntryBase::get_Definition()
IL_004a: callvirt System.String BepInEx.Configuration.ConfigDefinition::get_Section()
IL_004f: stfld System.String neobotics.ModSdk.DelegatedConfigEntryBase::Section
IL_0054: ldarg.0
IL_0055: ldarg.0
IL_0056: ldfld BepInEx.Configuration.ConfigEntry`1<T> neobotics.ModSdk.DelegatedConfigEntry`1<T>::_entry
IL_005b: callvirt System.String BepInEx.Configuration.ConfigEntryBase::GetSerializedValue()
IL_0060: stfld System.String neobotics.ModSdk.DelegatedConfigEntryBase::ServerValue
IL_0065: ldarg.0
IL_0066: ldfld neobotics.ModSdk.Logging neobotics.ModSdk.DelegatedConfigEntry`1<T>::Log
IL_006b: ldc.i4.6
IL_006c: newarr System.String
IL_0071: dup
IL_0072: ldc.i4.0
IL_0073: ldstr "Set "
IL_0078: stelem.ref
IL_0079: dup
IL_007a: ldc.i4.1
IL_007b: ldarg.0
IL_007c: ldfld System.String neobotics.ModSdk.DelegatedConfigEntryBase::Section
IL_0081: stelem.ref
IL_0082: dup
IL_0083: ldc.i4.2
IL_0084: ldstr " "
IL_0089: stelem.ref
IL_008a: dup
IL_008b: ldc.i4.3
IL_008c: ldarg.0
IL_008d: ldfld System.String neobotics.ModSdk.DelegatedConfigEntryBase::Name
IL_0092: stelem.ref
IL_0093: dup
IL_0094: ldc.i4.4
IL_0095: ldstr " to serialized value "
IL_009a: stelem.ref
IL_009b: dup
IL_009c: ldc.i4.5
IL_009d: ldarg.0
IL_009e: ldfld System.String neobotics.ModSdk.DelegatedConfigEntryBase::ServerValue
IL_00a3: stelem.ref
IL_00a4: call System.String System.String::Concat(System.String[])
IL_00a9: callvirt System.Void neobotics.ModSdk.Logging::Trace(System.String)
IL_00ae: ret

// T neobotics.ModSdk.DelegatedConfigEntry`1::get_Value()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld BepInEx.Configuration.ConfigEntry`1<T> neobotics.ModSdk.DelegatedConfigEntry`1<T>::_entry
IL_0006: callvirt !0 BepInEx.Configuration.ConfigEntry`1<T>::get_Value()
IL_000b: ret

// System.Void neobotics.ModSdk.DelegatedConfigEntry`1::set_Value(T)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld BepInEx.Configuration.ConfigEntry`1<T> neobotics.ModSdk.DelegatedConfigEntry`1<T>::_entry
IL_0006: ldarg.1
IL_0007: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<T>::set_Value(!0)
IL_000c: ret

// System.Void neobotics.ModSdk.DelegatedConfigEntry`1::.ctor(System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: ldnull
IL_0002: ldarg.1
IL_0003: call System.Void neobotics.ModSdk.DelegatedConfigEntry`1<T>::.ctor(System.Action`2<System.Object,System.EventArgs>,System.Boolean)
IL_0008: ret

// System.Void neobotics.ModSdk.DelegatedConfigEntry`1::.ctor(System.Action`2<System.Object,System.EventArgs>,System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void neobotics.ModSdk.DelegatedConfigEntryBase::.ctor()
IL_0006: ldarg.0
IL_0007: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::GetLogger()
IL_000c: stfld neobotics.ModSdk.Logging neobotics.ModSdk.DelegatedConfigEntry`1<T>::Log
IL_0011: ldarg.0
IL_0012: ldfld neobotics.ModSdk.Logging neobotics.ModSdk.DelegatedConfigEntry`1<T>::Log
IL_0017: ldstr "DelegatedConfigEntry"
IL_001c: callvirt System.Void neobotics.ModSdk.Logging::Trace(System.String)
IL_0021: ldarg.1
IL_0022: brfalse.s IL_002b
IL_0024: ldarg.0
IL_0025: ldarg.1
IL_0026: stfld System.Action`2<System.Object,System.EventArgs> neobotics.ModSdk.DelegatedConfigEntry`1<T>::clientDelegate
IL_002b: ldarg.2
IL_002c: brfalse.s IL_005c
IL_002e: ldarg.0
IL_002f: ldfld neobotics.ModSdk.Logging neobotics.ModSdk.DelegatedConfigEntry`1<T>::Log
IL_0034: ldstr "Configuring server delegate"
IL_0039: callvirt System.Void neobotics.ModSdk.Logging::Trace(System.String)
IL_003e: ldarg.0
IL_003f: ldarg.0
IL_0040: ldftn System.Void neobotics.ModSdk.DelegatedConfigEntry`1<T>::<.ctor>b__11_0(System.Object,System.EventArgs)
IL_0046: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_004b: stfld System.EventHandler neobotics.ModSdk.DelegatedConfigEntry`1<T>::rootHandler
IL_0050: ldsfld System.Collections.Generic.List`1<neobotics.ModSdk.DelegatedConfigEntryBase> neobotics.ModSdk.ServerConfiguration::ServerDelegatedEntries
IL_0055: ldarg.0
IL_0056: callvirt System.Void System.Collections.Generic.List`1<neobotics.ModSdk.DelegatedConfigEntryBase>::Add(!0)
IL_005b: ret
IL_005c: ldarg.0
IL_005d: ldfld System.Action`2<System.Object,System.EventArgs> neobotics.ModSdk.DelegatedConfigEntry`1<T>::clientDelegate
IL_0062: brfalse.s IL_0076
IL_0064: ldarg.0
IL_0065: ldarg.0
IL_0066: ldftn System.Void neobotics.ModSdk.DelegatedConfigEntry`1<T>::<.ctor>b__11_1(System.Object,System.EventArgs)
IL_006c: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_0071: stfld System.EventHandler neobotics.ModSdk.DelegatedConfigEntry`1<T>::rootHandler
IL_0076: ret

// System.Void neobotics.ModSdk.DelegatedConfigEntry`1::ServerDelegate(System.Object,System.EventArgs)
.locals System.Nullable`1<System.Boolean>, System.Nullable`1<System.Boolean>, System.Boolean
IL_0000: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::GetLogger()
IL_0005: ldstr "ServerDelegate"
IL_000a: callvirt System.Void neobotics.ModSdk.Logging::Trace(System.String)
IL_000f: ldarg.0
IL_0010: ldfld BepInEx.Configuration.ConfigEntry`1<T> neobotics.ModSdk.DelegatedConfigEntry`1<T>::_entry
IL_0015: ldarg.0
IL_0016: ldfld System.EventHandler neobotics.ModSdk.DelegatedConfigEntry`1<T>::rootHandler
IL_001b: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<T>::remove_SettingChanged(System.EventHandler)
IL_0020: call ZNet ZNet::get_instance()
IL_0025: dup
IL_0026: brtrue.s IL_0034
IL_0028: pop
IL_0029: ldloca.s V_1
IL_002b: initobj System.Nullable`1<System.Boolean>
IL_0031: ldloc.1
IL_0032: br.s IL_003e
IL_0034: call System.Boolean ZNet::IsServer()
IL_0039: newobj System.Void System.Nullable`1<System.Boolean>::.ctor(!0)
IL_003e: stloc.0
IL_003f: ldloca.s V_0
IL_0041: call System.Boolean System.Nullable`1<System.Boolean>::get_HasValue()
IL_0046: brfalse IL_00db
IL_004b: ldloc.0
IL_004c: stloc.1
IL_004d: ldc.i4.0
IL_004e: stloc.2
IL_004f: ldloca.s V_1
IL_0051: call !0 System.Nullable`1<System.Boolean>::GetValueOrDefault()
IL_0056: ldloc.2
IL_0057: ceq
IL_0059: ldloca.s V_1
IL_005b: call System.Boolean System.Nullable`1<System.Boolean>::get_HasValue()
IL_0060: and
IL_0061: brfalse.s IL_00b0
IL_0063: call neobotics.ModSdk.ServerConfiguration neobotics.ModSdk.ServerConfiguration::get_Instance()
IL_0068: ldfld System.Boolean neobotics.ModSdk.ServerConfiguration::ReceivedServerValues
IL_006d: brfalse.s IL_00b0
IL_006f: ldarg.0
IL_0070: ldfld System.String neobotics.ModSdk.DelegatedConfigEntryBase::ServerValue
IL_0075: brfalse.s IL_00db
IL_0077: ldarg.0
IL_0078: ldfld BepInEx.Configuration.ConfigEntry`1<T> neobotics.ModSdk.DelegatedConfigEntry`1<T>::_entry
IL_007d: ldarg.0
IL_007e: ldfld System.String neobotics.ModSdk.DelegatedConfigEntryBase::ServerValue
IL_0083: callvirt System.Void BepInEx.Configuration.ConfigEntryBase::SetSerializedValue(System.String)
IL_0088: ldarg.0
IL_0089: ldfld neobotics.ModSdk.Logging neobotics.ModSdk.DelegatedConfigEntry`1<T>::Log
IL_008e: ldstr "Setting "
IL_0093: ldarg.0
IL_0094: ldfld System.String neobotics.ModSdk.DelegatedConfigEntryBase::Name
IL_0099: ldstr " to server value "
IL_009e: ldarg.0
IL_009f: ldfld System.String neobotics.ModSdk.DelegatedConfigEntryBase::ServerValue
IL_00a4: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_00a9: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_00ae: br.s IL_00db
IL_00b0: ldloca.s V_0
IL_00b2: call !0 System.Nullable`1<System.Boolean>::GetValueOrDefault()
IL_00b7: brfalse.s IL_00db
IL_00b9: ldarg.0
IL_00ba: ldarg.0
IL_00bb: ldfld BepInEx.Configuration.ConfigEntry`1<T> neobotics.ModSdk.DelegatedConfigEntry`1<T>::_entry
IL_00c0: callvirt System.String BepInEx.Configuration.ConfigEntryBase::GetSerializedValue()
IL_00c5: stfld System.String neobotics.ModSdk.DelegatedConfigEntryBase::ServerValue
IL_00ca: call neobotics.ModSdk.ServerConfiguration neobotics.ModSdk.ServerConfiguration::get_Instance()
IL_00cf: ldarg.1
IL_00d0: ldarg.2
IL_00d1: castclass BepInEx.Configuration.SettingChangedEventArgs
IL_00d6: callvirt System.Void neobotics.ModSdk.ServerConfiguration::SendConfigToAllClients(System.Object,BepInEx.Configuration.SettingChangedEventArgs)
IL_00db: ldarg.0
IL_00dc: ldfld System.Action`2<System.Object,System.EventArgs> neobotics.ModSdk.DelegatedConfigEntry`1<T>::clientDelegate
IL_00e1: brfalse.s IL_00f0
IL_00e3: ldarg.0
IL_00e4: ldfld System.Action`2<System.Object,System.EventArgs> neobotics.ModSdk.DelegatedConfigEntry`1<T>::clientDelegate
IL_00e9: ldarg.1
IL_00ea: ldarg.2
IL_00eb: callvirt System.Void System.Action`2<System.Object,System.EventArgs>::Invoke(!0,!1)
IL_00f0: ldarg.0
IL_00f1: ldfld BepInEx.Configuration.ConfigEntry`1<T> neobotics.ModSdk.DelegatedConfigEntry`1<T>::_entry
IL_00f6: ldarg.0
IL_00f7: ldfld System.EventHandler neobotics.ModSdk.DelegatedConfigEntry`1<T>::rootHandler
IL_00fc: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<T>::add_SettingChanged(System.EventHandler)
IL_0101: ret

// System.Void neobotics.ModSdk.DelegatedConfigEntry`1::EnableHandler(System.Boolean)
.locals 
IL_0000: ldarg.1
IL_0001: brfalse.s IL_0015
IL_0003: ldarg.0
IL_0004: ldfld BepInEx.Configuration.ConfigEntry`1<T> neobotics.ModSdk.DelegatedConfigEntry`1<T>::_entry
IL_0009: ldarg.0
IL_000a: ldfld System.EventHandler neobotics.ModSdk.DelegatedConfigEntry`1<T>::rootHandler
IL_000f: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<T>::add_SettingChanged(System.EventHandler)
IL_0014: ret
IL_0015: ldarg.0
IL_0016: ldfld BepInEx.Configuration.ConfigEntry`1<T> neobotics.ModSdk.DelegatedConfigEntry`1<T>::_entry
IL_001b: ldarg.0
IL_001c: ldfld System.EventHandler neobotics.ModSdk.DelegatedConfigEntry`1<T>::rootHandler
IL_0021: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<T>::remove_SettingChanged(System.EventHandler)
IL_0026: ret

// System.Boolean neobotics.ModSdk.DelegatedConfigEntry`1::IsKeyPressed()
.locals BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut>
IL_0000: ldarg.0
IL_0001: call BepInEx.Configuration.ConfigEntry`1<T> neobotics.ModSdk.DelegatedConfigEntry`1<T>::get_ConfigEntry()
IL_0006: isinst BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut>
IL_000b: stloc.0
IL_000c: ldloc.0
IL_000d: brfalse.s IL_001b
IL_000f: ldloc.0
IL_0010: callvirt !0 BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut>::get_Value()
IL_0015: call System.Boolean neobotics.ModSdk.InputEvaluator::IsPressed(BepInEx.Configuration.KeyboardShortcut)
IL_001a: ret
IL_001b: ldarg.0
IL_001c: ldfld neobotics.ModSdk.Logging neobotics.ModSdk.DelegatedConfigEntry`1<T>::Log
IL_0021: ldstr "Keyboard read attempted on non-KeyboardShortcut config."
IL_0026: callvirt System.Void neobotics.ModSdk.Logging::Error(System.String)
IL_002b: ldc.i4.0
IL_002c: ret

// System.Boolean neobotics.ModSdk.DelegatedConfigEntry`1::IsKeyDown()
.locals BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut>
IL_0000: ldarg.0
IL_0001: call BepInEx.Configuration.ConfigEntry`1<T> neobotics.ModSdk.DelegatedConfigEntry`1<T>::get_ConfigEntry()
IL_0006: isinst BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut>
IL_000b: stloc.0
IL_000c: ldloc.0
IL_000d: brfalse.s IL_001b
IL_000f: ldloc.0
IL_0010: callvirt !0 BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut>::get_Value()
IL_0015: call System.Boolean neobotics.ModSdk.InputEvaluator::IsDown(BepInEx.Configuration.KeyboardShortcut)
IL_001a: ret
IL_001b: ldarg.0
IL_001c: ldfld neobotics.ModSdk.Logging neobotics.ModSdk.DelegatedConfigEntry`1<T>::Log
IL_0021: ldstr "Keyboard read attempted on non-KeyboardShortcut config."
IL_0026: callvirt System.Void neobotics.ModSdk.Logging::Error(System.String)
IL_002b: ldc.i4.0
IL_002c: ret

// System.Boolean neobotics.ModSdk.DelegatedConfigEntry`1::IsKeyReleased()
.locals BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut>
IL_0000: ldarg.0
IL_0001: call BepInEx.Configuration.ConfigEntry`1<T> neobotics.ModSdk.DelegatedConfigEntry`1<T>::get_ConfigEntry()
IL_0006: isinst BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut>
IL_000b: stloc.0
IL_000c: ldloc.0
IL_000d: brfalse.s IL_001b
IL_000f: ldloc.0
IL_0010: callvirt !0 BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut>::get_Value()
IL_0015: call System.Boolean neobotics.ModSdk.InputEvaluator::IsReleased(BepInEx.Configuration.KeyboardShortcut)
IL_001a: ret
IL_001b: ldarg.0
IL_001c: ldfld neobotics.ModSdk.Logging neobotics.ModSdk.DelegatedConfigEntry`1<T>::Log
IL_0021: ldstr "Keyboard read attempted on non-KeyboardShortcut config."
IL_0026: callvirt System.Void neobotics.ModSdk.Logging::Error(System.String)
IL_002b: ldc.i4.0
IL_002c: ret

// System.Void neobotics.ModSdk.DelegatedConfigEntry`1::<.ctor>b__11_0(System.Object,System.EventArgs)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: ldarg.2
IL_0003: call System.Void neobotics.ModSdk.DelegatedConfigEntry`1<T>::ServerDelegate(System.Object,System.EventArgs)
IL_0008: ret

// System.Void neobotics.ModSdk.DelegatedConfigEntry`1::<.ctor>b__11_1(System.Object,System.EventArgs)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Action`2<System.Object,System.EventArgs> neobotics.ModSdk.DelegatedConfigEntry`1<T>::clientDelegate
IL_0006: ldarg.1
IL_0007: ldarg.2
IL_0008: callvirt System.Void System.Action`2<System.Object,System.EventArgs>::Invoke(!0,!1)
IL_000d: ret

// System.Void neobotics.ModSdk.DelegatedConfigEntryBase::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Collections.Generic.IReadOnlyDictionary`2<System.String,System.String> neobotics.ModSdk.HarmonyHelper::get_DetectionSet()
.locals 
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.HarmonyHelper::detectionSet
IL_0005: ret

// System.Void neobotics.ModSdk.HarmonyHelper::GetDetectionSet(System.Collections.Generic.Dictionary`2<System.String,System.String>)
.locals neobotics.ModSdk.Logging, System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>, System.Collections.Generic.KeyValuePair`2<System.String,System.String>
IL_0000: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::GetLogger()
IL_0005: stloc.0
IL_0006: ldarg.0
IL_0007: callvirt System.Collections.Generic.Dictionary`2/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2<System.String,System.String>::GetEnumerator()
IL_000c: stloc.1
IL_000d: br IL_00cb
IL_0012: ldloca.s V_1
IL_0014: call System.Collections.Generic.KeyValuePair`2<!0,!1> System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>::get_Current()
IL_0019: stloc.2
IL_001a: ldloca.s V_2
IL_001c: call !0 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Key()
IL_0021: call System.Boolean HarmonyLib.Harmony::HasAnyPatches(System.String)
IL_0026: brfalse.s IL_0071
IL_0028: ldloc.0
IL_0029: ldstr "Detected "
IL_002e: ldloca.s V_2
IL_0030: call !1 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Value()
IL_0035: ldstr " from Harmony"
IL_003a: call System.String System.String::Concat(System.String,System.String,System.String)
IL_003f: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0044: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.HarmonyHelper::detectionSet
IL_0049: ldloca.s V_2
IL_004b: call !0 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Key()
IL_0050: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::ContainsKey(!0)
IL_0055: brtrue.s IL_00cb
IL_0057: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.HarmonyHelper::detectionSet
IL_005c: ldloca.s V_2
IL_005e: call !0 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Key()
IL_0063: ldloca.s V_2
IL_0065: call !1 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Value()
IL_006a: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_006f: br.s IL_00cb
IL_0071: call System.Collections.Generic.Dictionary`2<System.String,BepInEx.PluginInfo> BepInEx.Bootstrap.Chainloader::get_PluginInfos()
IL_0076: ldloca.s V_2
IL_0078: call !0 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Key()
IL_007d: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,BepInEx.PluginInfo>::ContainsKey(!0)
IL_0082: brfalse.s IL_00cb
IL_0084: ldloc.0
IL_0085: ldstr "Detected "
IL_008a: ldloca.s V_2
IL_008c: call !1 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Value()
IL_0091: ldstr " from BepInEx"
IL_0096: call System.String System.String::Concat(System.String,System.String,System.String)
IL_009b: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_00a0: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.HarmonyHelper::detectionSet
IL_00a5: ldloca.s V_2
IL_00a7: call !0 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Key()
IL_00ac: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::ContainsKey(!0)
IL_00b1: brtrue.s IL_00cb
IL_00b3: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.HarmonyHelper::detectionSet
IL_00b8: ldloca.s V_2
IL_00ba: call !0 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Key()
IL_00bf: ldloca.s V_2
IL_00c1: call !1 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Value()
IL_00c6: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_00cb: ldloca.s V_1
IL_00cd: call System.Boolean System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>::MoveNext()
IL_00d2: brtrue IL_0012
IL_00d7: leave.s IL_00e7
IL_00d9: ldloca.s V_1
IL_00db: constrained. System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>
IL_00e1: callvirt System.Void System.IDisposable::Dispose()
IL_00e6: endfinally
IL_00e7: ret
// EH Finally: 13 - 217 => 217 - 231

// System.Void neobotics.ModSdk.HarmonyHelper::AddToUnpatch(System.String)
.locals 
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.HarmonyHelper::detectionSet
IL_0005: ldarg.0
IL_0006: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::ContainsKey(!0)
IL_000b: brfalse.s IL_0023
IL_000d: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.HarmonyHelper::unpatchMods
IL_0012: ldarg.0
IL_0013: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.HarmonyHelper::detectionSet
IL_0018: ldarg.0
IL_0019: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,System.String>::get_Item(!0)
IL_001e: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_0023: ret

// System.Void neobotics.ModSdk.HarmonyHelper::UnpatchMods(HarmonyLib.Harmony)
.locals neobotics.ModSdk.Logging, System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>, System.Collections.Generic.KeyValuePair`2<System.String,System.String>
IL_0000: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::GetLogger()
IL_0005: stloc.0
IL_0006: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.HarmonyHelper::unpatchMods
IL_000b: callvirt System.Collections.Generic.Dictionary`2/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2<System.String,System.String>::GetEnumerator()
IL_0010: stloc.1
IL_0011: br.s IL_0067
IL_0013: ldloca.s V_1
IL_0015: call System.Collections.Generic.KeyValuePair`2<!0,!1> System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>::get_Current()
IL_001a: stloc.2
IL_001b: ldloc.0
IL_001c: ldstr "Not compatible with "
IL_0021: ldloca.s V_2
IL_0023: call !1 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Value()
IL_0028: call System.String System.String::Concat(System.String,System.String)
IL_002d: callvirt System.Void neobotics.ModSdk.Logging::Warning(System.String)
IL_0032: ldloca.s V_2
IL_0034: call !0 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Key()
IL_0039: call System.Void HarmonyLib.Harmony::UnpatchID(System.String)
IL_003e: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.HarmonyHelper::detectionSet
IL_0043: ldloca.s V_2
IL_0045: call !0 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Key()
IL_004a: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::Remove(!0)
IL_004f: pop
IL_0050: ldloc.0
IL_0051: ldstr "Disabled "
IL_0056: ldloca.s V_2
IL_0058: call !1 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Value()
IL_005d: call System.String System.String::Concat(System.String,System.String)
IL_0062: callvirt System.Void neobotics.ModSdk.Logging::Warning(System.String)
IL_0067: ldloca.s V_1
IL_0069: call System.Boolean System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>::MoveNext()
IL_006e: brtrue.s IL_0013
IL_0070: leave.s IL_0080
IL_0072: ldloca.s V_1
IL_0074: constrained. System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>
IL_007a: callvirt System.Void System.IDisposable::Dispose()
IL_007f: endfinally
IL_0080: ret
// EH Finally: 17 - 114 => 114 - 128

// System.Boolean neobotics.ModSdk.HarmonyHelper::IsModDetected(System.String)
.locals 
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.HarmonyHelper::detectionSet
IL_0005: ldarg.0
IL_0006: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::ContainsKey(!0)
IL_000b: ret

// System.Boolean neobotics.ModSdk.HarmonyHelper::IsModNameDetected(System.String)
.locals 
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.HarmonyHelper::detectionSet
IL_0005: ldarg.0
IL_0006: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::ContainsValue(!1)
IL_000b: ret

// System.Boolean neobotics.ModSdk.HarmonyHelper::TryGetDetectedModName(System.String,System.String&)
.locals 
IL_0000: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.HarmonyHelper::detectionSet
IL_0005: ldarg.0
IL_0006: ldarg.1
IL_0007: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::TryGetValue(!0,!1&)
IL_000c: ret

// System.Boolean neobotics.ModSdk.HarmonyHelper::TryGetDetectedModKey(System.String,System.String&)
.locals System.Collections.Generic.Dictionary`2/KeyCollection/Enumerator<System.String,System.String>, System.String, System.Boolean
IL_0000: ldarg.1
IL_0001: ldnull
IL_0002: stind.ref
IL_0003: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.HarmonyHelper::detectionSet
IL_0008: callvirt System.Collections.Generic.Dictionary`2/KeyCollection<!0,!1> System.Collections.Generic.Dictionary`2<System.String,System.String>::get_Keys()
IL_000d: callvirt System.Collections.Generic.Dictionary`2/KeyCollection/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2/KeyCollection<System.String,System.String>::GetEnumerator()
IL_0012: stloc.0
IL_0013: br.s IL_0037
IL_0015: ldloca.s V_0
IL_0017: call !0 System.Collections.Generic.Dictionary`2/KeyCollection/Enumerator<System.String,System.String>::get_Current()
IL_001c: stloc.1
IL_001d: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.HarmonyHelper::detectionSet
IL_0022: ldloc.1
IL_0023: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,System.String>::get_Item(!0)
IL_0028: ldarg.0
IL_0029: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_002e: brfalse.s IL_0037
IL_0030: ldarg.1
IL_0031: ldloc.1
IL_0032: stind.ref
IL_0033: ldc.i4.1
IL_0034: stloc.2
IL_0035: leave.s IL_0052
IL_0037: ldloca.s V_0
IL_0039: call System.Boolean System.Collections.Generic.Dictionary`2/KeyCollection/Enumerator<System.String,System.String>::MoveNext()
IL_003e: brtrue.s IL_0015
IL_0040: leave.s IL_0050
IL_0042: ldloca.s V_0
IL_0044: constrained. System.Collections.Generic.Dictionary`2/KeyCollection/Enumerator<System.String,System.String>
IL_004a: callvirt System.Void System.IDisposable::Dispose()
IL_004f: endfinally
IL_0050: ldc.i4.0
IL_0051: ret
IL_0052: ldloc.2
IL_0053: ret
// EH Finally: 19 - 66 => 66 - 80

// System.String neobotics.ModSdk.HarmonyHelper::AddAnonymousPatch(System.String,neobotics.ModSdk.HarmonyHelper/PatchType,System.String,System.String)
.locals System.String, System.Int32, neobotics.ModSdk.Logging, System.Collections.Generic.List`1/Enumerator<System.Reflection.MethodBase>, System.Reflection.MethodBase, HarmonyLib.Patches, System.Collections.ObjectModel.ReadOnlyCollection`1<HarmonyLib.Patch>, System.Collections.Generic.IEnumerator`1<HarmonyLib.Patch>, HarmonyLib.Patch
IL_0000: ldnull
IL_0001: stloc.0
IL_0002: ldc.i4.0
IL_0003: stloc.1
IL_0004: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::GetLogger()
IL_0009: stloc.2
IL_000a: call System.Collections.Generic.IEnumerable`1<System.Reflection.MethodBase> HarmonyLib.Harmony::GetAllPatchedMethods()
IL_000f: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.Reflection.MethodBase>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0014: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.Reflection.MethodBase>::GetEnumerator()
IL_0019: stloc.3
IL_001a: br IL_015c
IL_001f: ldloca.s V_3
IL_0021: call !0 System.Collections.Generic.List`1/Enumerator<System.Reflection.MethodBase>::get_Current()
IL_0026: stloc.s V_4
IL_0028: ldloc.s V_4
IL_002a: call System.Boolean HarmonyLib.MethodBaseExtensions::HasMethodBody(System.Reflection.MethodBase)
IL_002f: pop
IL_0030: ldloc.s V_4
IL_0032: call HarmonyLib.Patches HarmonyLib.Harmony::GetPatchInfo(System.Reflection.MethodBase)
IL_0037: stloc.s V_5
IL_0039: ldloc.s V_5
IL_003b: ldfld System.Collections.ObjectModel.ReadOnlyCollection`1<HarmonyLib.Patch> HarmonyLib.Patches::Prefixes
IL_0040: stloc.s V_6
IL_0042: ldarg.1
IL_0043: switch IL_0065,IL_005a,IL_0070,IL_007b
IL_0058: br.s IL_0084
IL_005a: ldloc.s V_5
IL_005c: ldfld System.Collections.ObjectModel.ReadOnlyCollection`1<HarmonyLib.Patch> HarmonyLib.Patches::Postfixes
IL_0061: stloc.s V_6
IL_0063: br.s IL_0084
IL_0065: ldloc.s V_5
IL_0067: ldfld System.Collections.ObjectModel.ReadOnlyCollection`1<HarmonyLib.Patch> HarmonyLib.Patches::Prefixes
IL_006c: stloc.s V_6
IL_006e: br.s IL_0084
IL_0070: ldloc.s V_5
IL_0072: ldfld System.Collections.ObjectModel.ReadOnlyCollection`1<HarmonyLib.Patch> HarmonyLib.Patches::Transpilers
IL_0077: stloc.s V_6
IL_0079: br.s IL_0084
IL_007b: ldloc.s V_5
IL_007d: ldfld System.Collections.ObjectModel.ReadOnlyCollection`1<HarmonyLib.Patch> HarmonyLib.Patches::Finalizers
IL_0082: stloc.s V_6
IL_0084: ldloc.s V_6
IL_0086: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.ObjectModel.ReadOnlyCollection`1<HarmonyLib.Patch>::GetEnumerator()
IL_008b: stloc.s V_7
IL_008d: br.s IL_00eb
IL_008f: ldloc.s V_7
IL_0091: callvirt !0 System.Collections.Generic.IEnumerator`1<HarmonyLib.Patch>::get_Current()
IL_0096: stloc.s V_8
IL_0098: ldloc.s V_8
IL_009a: ldfld System.String HarmonyLib.Patch::owner
IL_009f: ldstr "harmony-auto"
IL_00a4: callvirt System.Boolean System.String::StartsWith(System.String)
IL_00a9: brfalse.s IL_00eb
IL_00ab: ldloc.s V_4
IL_00ad: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_00b2: ldarg.0
IL_00b3: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00b8: brfalse.s IL_00eb
IL_00ba: ldarg.3
IL_00bb: brfalse.s IL_00df
IL_00bd: ldloc.s V_8
IL_00bf: callvirt System.Reflection.MethodInfo HarmonyLib.Patch::get_PatchMethod()
IL_00c4: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_00c9: ldarg.3
IL_00ca: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00cf: brfalse.s IL_00eb
IL_00d1: ldloc.1
IL_00d2: ldc.i4.1
IL_00d3: add
IL_00d4: stloc.1
IL_00d5: ldloc.s V_8
IL_00d7: ldfld System.String HarmonyLib.Patch::owner
IL_00dc: stloc.0
IL_00dd: br.s IL_00eb
IL_00df: ldloc.1
IL_00e0: ldc.i4.1
IL_00e1: add
IL_00e2: stloc.1
IL_00e3: ldloc.s V_8
IL_00e5: ldfld System.String HarmonyLib.Patch::owner
IL_00ea: stloc.0
IL_00eb: ldloc.s V_7
IL_00ed: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_00f2: brtrue.s IL_008f
IL_00f4: leave.s IL_0102
IL_00f6: ldloc.s V_7
IL_00f8: brfalse.s IL_0101
IL_00fa: ldloc.s V_7
IL_00fc: callvirt System.Void System.IDisposable::Dispose()
IL_0101: endfinally
IL_0102: ldloc.1
IL_0103: ldc.i4.1
IL_0104: bne.un.s IL_013f
IL_0106: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.HarmonyHelper::detectionSet
IL_010b: ldloc.0
IL_010c: ldarg.2
IL_010d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_0112: ldloc.2
IL_0113: ldstr "Added unique anonymous {0} {1}: {2} as {3}"
IL_0118: ldc.i4.4
IL_0119: newarr System.Object
IL_011e: dup
IL_011f: ldc.i4.0
IL_0120: ldarg.0
IL_0121: stelem.ref
IL_0122: dup
IL_0123: ldc.i4.1
IL_0124: ldarg.1
IL_0125: box neobotics.ModSdk.HarmonyHelper/PatchType
IL_012a: stelem.ref
IL_012b: dup
IL_012c: ldc.i4.2
IL_012d: ldloc.0
IL_012e: stelem.ref
IL_012f: dup
IL_0130: ldc.i4.3
IL_0131: ldarg.2
IL_0132: stelem.ref
IL_0133: call System.String System.String::Format(System.String,System.Object[])
IL_0138: callvirt System.Void neobotics.ModSdk.Logging::Info(System.String)
IL_013d: br.s IL_015c
IL_013f: ldloc.1
IL_0140: ldc.i4.1
IL_0141: ble.s IL_015c
IL_0143: ldnull
IL_0144: stloc.0
IL_0145: ldloc.2
IL_0146: ldstr "Found multiple anonymous {0} {1} entries. Can't identify correct patch to remove or modify."
IL_014b: ldarg.0
IL_014c: ldarg.1
IL_014d: box neobotics.ModSdk.HarmonyHelper/PatchType
IL_0152: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_0157: callvirt System.Void neobotics.ModSdk.Logging::Warning(System.String)
IL_015c: ldloca.s V_3
IL_015e: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.Reflection.MethodBase>::MoveNext()
IL_0163: brtrue IL_001f
IL_0168: leave.s IL_0178
IL_016a: ldloca.s V_3
IL_016c: constrained. System.Collections.Generic.List`1/Enumerator<System.Reflection.MethodBase>
IL_0172: callvirt System.Void System.IDisposable::Dispose()
IL_0177: endfinally
IL_0178: ldloc.1
IL_0179: brtrue.s IL_018c
IL_017b: ldloc.2
IL_017c: ldstr "No patch found for "
IL_0181: ldarg.2
IL_0182: call System.String System.String::Concat(System.String,System.String)
IL_0187: callvirt System.Void neobotics.ModSdk.Logging::Info(System.String)
IL_018c: ldloc.0
IL_018d: ret
// EH Finally: 141 - 246 => 246 - 258
// EH Finally: 26 - 362 => 362 - 376

// System.Void neobotics.ModSdk.HarmonyHelper::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void neobotics.ModSdk.HarmonyHelper::.cctor()
.locals 
IL_0000: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::.ctor()
IL_0005: stsfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.HarmonyHelper::detectionSet
IL_000a: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::.ctor()
IL_000f: stsfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ModSdk.HarmonyHelper::unpatchMods
IL_0014: ret

// System.Void neobotics.ModSdk.ImageHelper::.ctor(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: ldc.i4.0
IL_0003: call System.Void neobotics.ModSdk.ImageHelper::.ctor(System.String,System.Boolean)
IL_0008: ret

// System.Void neobotics.ModSdk.ImageHelper::.ctor(System.String,System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ldarg.0
IL_0007: ldarg.1
IL_0008: stfld System.String neobotics.ModSdk.ImageHelper::externalFolder
IL_000d: ldarg.0
IL_000e: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::GetLogger()
IL_0013: stfld neobotics.ModSdk.Logging neobotics.ModSdk.ImageHelper::logger
IL_0018: ldarg.0
IL_0019: ldarg.2
IL_001a: stfld System.Boolean neobotics.ModSdk.ImageHelper::isEmbedded
IL_001f: ret

// UnityEngine.Sprite neobotics.ModSdk.ImageHelper::LoadSprite(System.String,System.Int32,System.Int32,System.Boolean,System.Single)
.locals UnityEngine.Texture2D
IL_0000: ldarg.0
IL_0001: ldfld neobotics.ModSdk.Logging neobotics.ModSdk.ImageHelper::logger
IL_0006: ldstr "Reading image and creating sprite "
IL_000b: ldarg.1
IL_000c: call System.String System.String::Concat(System.String,System.String)
IL_0011: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0016: ldarg.0
IL_0017: ldarg.1
IL_0018: ldarg.2
IL_0019: ldarg.3
IL_001a: ldarg.s linear
IL_001c: ldloca.s V_0
IL_001e: call System.Boolean neobotics.ModSdk.ImageHelper::TryLoadImage(System.String,System.Int32,System.Int32,System.Boolean,UnityEngine.Texture2D&)
IL_0023: brfalse.s IL_002f
IL_0025: ldarg.0
IL_0026: ldloc.0
IL_0027: ldarg.s pixelsPerUnit
IL_0029: call UnityEngine.Sprite neobotics.ModSdk.ImageHelper::LoadSprite(UnityEngine.Texture2D,System.Single)
IL_002e: ret
IL_002f: ldnull
IL_0030: ret

// UnityEngine.Sprite neobotics.ModSdk.ImageHelper::LoadSprite(UnityEngine.Texture2D,System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: ldarg.1
IL_0003: callvirt System.String UnityEngine.Object::get_name()
IL_0008: ldarg.1
IL_0009: callvirt System.Int32 UnityEngine.Texture::get_width()
IL_000e: conv.r4
IL_000f: ldarg.1
IL_0010: callvirt System.Int32 UnityEngine.Texture::get_height()
IL_0015: conv.r4
IL_0016: ldarg.2
IL_0017: call UnityEngine.Sprite neobotics.ModSdk.ImageHelper::LoadSprite(UnityEngine.Texture2D,System.String,System.Single,System.Single,System.Single)
IL_001c: ret

// UnityEngine.Sprite neobotics.ModSdk.ImageHelper::LoadSprite(UnityEngine.Texture2D,System.String,System.Single,System.Single,System.Single)
.locals 
IL_0000: ldarg.1
IL_0001: ldnull
IL_0002: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0007: brfalse.s IL_000b
IL_0009: ldnull
IL_000a: ret
IL_000b: ldarg.2
IL_000c: call System.Boolean System.String::IsNullOrWhiteSpace(System.String)
IL_0011: brfalse.s IL_001b
IL_0013: ldarg.1
IL_0014: callvirt System.String UnityEngine.Object::get_name()
IL_0019: starg.s name
IL_001b: ldarg.0
IL_001c: ldfld neobotics.ModSdk.Logging neobotics.ModSdk.ImageHelper::logger
IL_0021: ldstr "Creating sprite "
IL_0026: ldarg.2
IL_0027: ldstr " from existing texture"
IL_002c: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0031: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0036: ldarg.1
IL_0037: ldc.r4 0
IL_003c: ldc.r4 0
IL_0041: ldarg.3
IL_0042: ldarg.s height
IL_0044: newobj System.Void UnityEngine.Rect::.ctor(System.Single,System.Single,System.Single,System.Single)
IL_0049: call UnityEngine.Vector2 UnityEngine.Vector2::get_zero()
IL_004e: ldarg.s pixelsPerUnit
IL_0050: call UnityEngine.Sprite UnityEngine.Sprite::Create(UnityEngine.Texture2D,UnityEngine.Rect,UnityEngine.Vector2,System.Single)
IL_0055: dup
IL_0056: ldnull
IL_0057: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_005c: brfalse.s IL_006f
IL_005e: ldstr "Can't create sprite "
IL_0063: ldarg.2
IL_0064: call System.String System.String::Concat(System.String,System.String)
IL_0069: newobj System.Void System.ApplicationException::.ctor(System.String)
IL_006e: throw
IL_006f: dup
IL_0070: ldarg.2
IL_0071: callvirt System.Void UnityEngine.Object::set_name(System.String)
IL_0076: ret

// System.Boolean neobotics.ModSdk.ImageHelper::TryLoadImage(System.String,System.Int32,System.Int32,System.Boolean,UnityEngine.Texture2D&)
.locals System.Byte[], UnityEngine.Texture2D, System.IO.Stream, System.String
IL_0000: ldarg.s image
IL_0002: ldnull
IL_0003: stind.ref
IL_0004: ldnull
IL_0005: stloc.0
IL_0006: ldarg.0
IL_0007: ldfld System.Boolean neobotics.ModSdk.ImageHelper::isEmbedded
IL_000c: brfalse.s IL_0068
IL_000e: call System.Reflection.Assembly System.Reflection.Assembly::GetExecutingAssembly()
IL_0013: ldarg.0
IL_0014: ldfld System.String neobotics.ModSdk.ImageHelper::externalFolder
IL_0019: ldstr "."
IL_001e: ldarg.1
IL_001f: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0024: callvirt System.IO.Stream System.Reflection.Assembly::GetManifestResourceStream(System.String)
IL_0029: stloc.2
IL_002a: ldloc.2
IL_002b: brtrue.s IL_0049
IL_002d: ldstr "Can't find "
IL_0032: ldarg.1
IL_0033: ldstr " in "
IL_0038: ldarg.0
IL_0039: ldfld System.String neobotics.ModSdk.ImageHelper::externalFolder
IL_003e: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_0043: newobj System.Void System.IO.FileNotFoundException::.ctor(System.String)
IL_0048: throw
IL_0049: ldloc.2
IL_004a: callvirt System.Int64 System.IO.Stream::get_Length()
IL_004f: conv.ovf.i
IL_0050: newarr System.Byte
IL_0055: stloc.0
IL_0056: ldloc.2
IL_0057: ldloc.0
IL_0058: ldc.i4.0
IL_0059: ldloc.2
IL_005a: callvirt System.Int64 System.IO.Stream::get_Length()
IL_005f: conv.i4
IL_0060: callvirt System.Int32 System.IO.Stream::Read(System.Byte[],System.Int32,System.Int32)
IL_0065: pop
IL_0066: br.s IL_00ab
IL_0068: ldarg.0
IL_0069: ldfld System.String neobotics.ModSdk.ImageHelper::externalFolder
IL_006e: ldarg.1
IL_006f: call System.String System.IO.Path::Combine(System.String,System.String)
IL_0074: stloc.3
IL_0075: ldarg.0
IL_0076: ldfld neobotics.ModSdk.Logging neobotics.ModSdk.ImageHelper::logger
IL_007b: ldstr "Reading external file "
IL_0080: ldloc.3
IL_0081: call System.String System.String::Concat(System.String,System.String)
IL_0086: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_008b: ldloc.3
IL_008c: call System.Boolean System.IO.File::Exists(System.String)
IL_0091: brtrue.s IL_00a4
IL_0093: ldstr "Cannot find image "
IL_0098: ldarg.1
IL_0099: call System.String System.String::Concat(System.String,System.String)
IL_009e: newobj System.Void System.IO.FileNotFoundException::.ctor(System.String)
IL_00a3: throw
IL_00a4: ldloc.3
IL_00a5: call System.Byte[] System.IO.File::ReadAllBytes(System.String)
IL_00aa: stloc.0
IL_00ab: ldarg.2
IL_00ac: ldarg.3
IL_00ad: ldc.i4.4
IL_00ae: ldc.i4.1
IL_00af: ldarg.s linear
IL_00b1: newobj System.Void UnityEngine.Texture2D::.ctor(System.Int32,System.Int32,UnityEngine.TextureFormat,System.Boolean,System.Boolean)
IL_00b6: stloc.1
IL_00b7: ldloc.1
IL_00b8: ldloc.0
IL_00b9: ldc.i4.0
IL_00ba: call System.Boolean UnityEngine.ImageConversion::LoadImage(UnityEngine.Texture2D,System.Byte[],System.Boolean)
IL_00bf: brtrue.s IL_00d2
IL_00c1: ldstr "Can't load image "
IL_00c6: ldarg.1
IL_00c7: call System.String System.String::Concat(System.String,System.String)
IL_00cc: newobj System.Void System.IO.FileLoadException::.ctor(System.String)
IL_00d1: throw
IL_00d2: ldarg.s image
IL_00d4: ldloc.1
IL_00d5: stind.ref
IL_00d6: ldc.i4.1
IL_00d7: ret

// System.Void neobotics.ModSdk.InputCycler::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// neobotics.ModSdk.InputCycler neobotics.ModSdk.InputCycler::get_Instance()
.locals 
IL_0000: ldsfld neobotics.ModSdk.InputCycler neobotics.ModSdk.InputCycler::_instance
IL_0005: brtrue.s IL_0011
IL_0007: newobj System.Void neobotics.ModSdk.InputCycler::.ctor()
IL_000c: stsfld neobotics.ModSdk.InputCycler neobotics.ModSdk.InputCycler::_instance
IL_0011: ldsfld neobotics.ModSdk.InputCycler neobotics.ModSdk.InputCycler::_instance
IL_0016: ret

// System.Void neobotics.ModSdk.InputCycler::Init(System.Boolean,neobotics.ModSdk.DelegatedConfigEntry`1<BepInEx.Configuration.KeyboardShortcut>,neobotics.ModSdk.DelegatedConfigEntry`1<BepInEx.Configuration.KeyboardShortcut>)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Boolean neobotics.ModSdk.InputCycler::useMouseWheel
IL_0007: ldarg.0
IL_0008: ldarg.2
IL_0009: stfld neobotics.ModSdk.DelegatedConfigEntry`1<BepInEx.Configuration.KeyboardShortcut> neobotics.ModSdk.InputCycler::keyAdvance
IL_000e: ldarg.0
IL_000f: ldarg.3
IL_0010: stfld neobotics.ModSdk.DelegatedConfigEntry`1<BepInEx.Configuration.KeyboardShortcut> neobotics.ModSdk.InputCycler::keyReferse
IL_0015: ret

// System.Boolean neobotics.ModSdk.InputEvaluator::IsPressed(BepInEx.Configuration.KeyboardShortcut)
.locals System.Collections.Generic.IEnumerator`1<UnityEngine.KeyCode>, UnityEngine.KeyCode, System.Boolean
IL_0000: ldarga.s shortcut
IL_0002: ldsfld BepInEx.Configuration.KeyboardShortcut BepInEx.Configuration.KeyboardShortcut::Empty
IL_0007: box BepInEx.Configuration.KeyboardShortcut
IL_000c: constrained. BepInEx.Configuration.KeyboardShortcut
IL_0012: callvirt System.Boolean System.Object::Equals(System.Object)
IL_0017: brfalse.s IL_001b
IL_0019: ldc.i4.0
IL_001a: ret
IL_001b: ldarga.s shortcut
IL_001d: call System.Collections.Generic.IEnumerable`1<UnityEngine.KeyCode> BepInEx.Configuration.KeyboardShortcut::get_Modifiers()
IL_0022: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<UnityEngine.KeyCode>::GetEnumerator()
IL_0027: stloc.0
IL_0028: br.s IL_0040
IL_002a: ldloc.0
IL_002b: callvirt !0 System.Collections.Generic.IEnumerator`1<UnityEngine.KeyCode>::get_Current()
IL_0030: stloc.1
IL_0031: ldloc.1
IL_0032: brfalse.s IL_0040
IL_0034: ldloc.1
IL_0035: call System.Boolean UnityEngine.Input::GetKey(UnityEngine.KeyCode)
IL_003a: brtrue.s IL_0040
IL_003c: ldc.i4.0
IL_003d: stloc.2
IL_003e: leave.s IL_0061
IL_0040: ldloc.0
IL_0041: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0046: brtrue.s IL_002a
IL_0048: leave.s IL_0054
IL_004a: ldloc.0
IL_004b: brfalse.s IL_0053
IL_004d: ldloc.0
IL_004e: callvirt System.Void System.IDisposable::Dispose()
IL_0053: endfinally
IL_0054: ldarga.s shortcut
IL_0056: call UnityEngine.KeyCode BepInEx.Configuration.KeyboardShortcut::get_MainKey()
IL_005b: call System.Boolean UnityEngine.Input::GetKeyDown(UnityEngine.KeyCode)
IL_0060: ret
IL_0061: ldloc.2
IL_0062: ret
// EH Finally: 40 - 74 => 74 - 84

// System.Boolean neobotics.ModSdk.InputEvaluator::IsDown(BepInEx.Configuration.KeyboardShortcut)
.locals System.Collections.Generic.IEnumerator`1<UnityEngine.KeyCode>, UnityEngine.KeyCode, System.Boolean
IL_0000: ldarga.s shortcut
IL_0002: ldsfld BepInEx.Configuration.KeyboardShortcut BepInEx.Configuration.KeyboardShortcut::Empty
IL_0007: box BepInEx.Configuration.KeyboardShortcut
IL_000c: constrained. BepInEx.Configuration.KeyboardShortcut
IL_0012: callvirt System.Boolean System.Object::Equals(System.Object)
IL_0017: brfalse.s IL_001b
IL_0019: ldc.i4.0
IL_001a: ret
IL_001b: ldarga.s shortcut
IL_001d: call System.Collections.Generic.IEnumerable`1<UnityEngine.KeyCode> BepInEx.Configuration.KeyboardShortcut::get_Modifiers()
IL_0022: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<UnityEngine.KeyCode>::GetEnumerator()
IL_0027: stloc.0
IL_0028: br.s IL_0040
IL_002a: ldloc.0
IL_002b: callvirt !0 System.Collections.Generic.IEnumerator`1<UnityEngine.KeyCode>::get_Current()
IL_0030: stloc.1
IL_0031: ldloc.1
IL_0032: brfalse.s IL_0040
IL_0034: ldloc.1
IL_0035: call System.Boolean UnityEngine.Input::GetKey(UnityEngine.KeyCode)
IL_003a: brtrue.s IL_0040
IL_003c: ldc.i4.0
IL_003d: stloc.2
IL_003e: leave.s IL_0061
IL_0040: ldloc.0
IL_0041: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0046: brtrue.s IL_002a
IL_0048: leave.s IL_0054
IL_004a: ldloc.0
IL_004b: brfalse.s IL_0053
IL_004d: ldloc.0
IL_004e: callvirt System.Void System.IDisposable::Dispose()
IL_0053: endfinally
IL_0054: ldarga.s shortcut
IL_0056: call UnityEngine.KeyCode BepInEx.Configuration.KeyboardShortcut::get_MainKey()
IL_005b: call System.Boolean UnityEngine.Input::GetKey(UnityEngine.KeyCode)
IL_0060: ret
IL_0061: ldloc.2
IL_0062: ret
// EH Finally: 40 - 74 => 74 - 84

// System.Boolean neobotics.ModSdk.InputEvaluator::IsReleased(BepInEx.Configuration.KeyboardShortcut)
.locals System.Collections.Generic.IEnumerator`1<UnityEngine.KeyCode>, UnityEngine.KeyCode, System.Boolean
IL_0000: ldarga.s shortcut
IL_0002: ldsfld BepInEx.Configuration.KeyboardShortcut BepInEx.Configuration.KeyboardShortcut::Empty
IL_0007: box BepInEx.Configuration.KeyboardShortcut
IL_000c: constrained. BepInEx.Configuration.KeyboardShortcut
IL_0012: callvirt System.Boolean System.Object::Equals(System.Object)
IL_0017: brfalse.s IL_001b
IL_0019: ldc.i4.0
IL_001a: ret
IL_001b: ldarga.s shortcut
IL_001d: call System.Collections.Generic.IEnumerable`1<UnityEngine.KeyCode> BepInEx.Configuration.KeyboardShortcut::get_Modifiers()
IL_0022: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<UnityEngine.KeyCode>::GetEnumerator()
IL_0027: stloc.0
IL_0028: br.s IL_0040
IL_002a: ldloc.0
IL_002b: callvirt !0 System.Collections.Generic.IEnumerator`1<UnityEngine.KeyCode>::get_Current()
IL_0030: stloc.1
IL_0031: ldloc.1
IL_0032: brfalse.s IL_0040
IL_0034: ldloc.1
IL_0035: call System.Boolean UnityEngine.Input::GetKeyUp(UnityEngine.KeyCode)
IL_003a: brtrue.s IL_0040
IL_003c: ldc.i4.0
IL_003d: stloc.2
IL_003e: leave.s IL_0061
IL_0040: ldloc.0
IL_0041: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0046: brtrue.s IL_002a
IL_0048: leave.s IL_0054
IL_004a: ldloc.0
IL_004b: brfalse.s IL_0053
IL_004d: ldloc.0
IL_004e: callvirt System.Void System.IDisposable::Dispose()
IL_0053: endfinally
IL_0054: ldarga.s shortcut
IL_0056: call UnityEngine.KeyCode BepInEx.Configuration.KeyboardShortcut::get_MainKey()
IL_005b: call System.Boolean UnityEngine.Input::GetKeyUp(UnityEngine.KeyCode)
IL_0060: ret
IL_0061: ldloc.2
IL_0062: ret
// EH Finally: 40 - 74 => 74 - 84

// System.Int64 neobotics.ModSdk.IterativeStopwatch::get_Iterations()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Int64 neobotics.ModSdk.IterativeStopwatch::<Iterations>k__BackingField
IL_0006: ret

// System.Void neobotics.ModSdk.IterativeStopwatch::set_Iterations(System.Int64)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Int64 neobotics.ModSdk.IterativeStopwatch::<Iterations>k__BackingField
IL_0007: ret

// System.Double neobotics.ModSdk.IterativeStopwatch::get_IterationMicroseconds()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Double neobotics.ModSdk.IterativeStopwatch::<IterationMicroseconds>k__BackingField
IL_0006: ret

// System.Void neobotics.ModSdk.IterativeStopwatch::set_IterationMicroseconds(System.Double)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Double neobotics.ModSdk.IterativeStopwatch::<IterationMicroseconds>k__BackingField
IL_0007: ret

// System.Double neobotics.ModSdk.IterativeStopwatch::get_TotalElapsedMicroseconds()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Double neobotics.ModSdk.IterativeStopwatch::<TotalElapsedMicroseconds>k__BackingField
IL_0006: ret

// System.Void neobotics.ModSdk.IterativeStopwatch::set_TotalElapsedMicroseconds(System.Double)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Double neobotics.ModSdk.IterativeStopwatch::<TotalElapsedMicroseconds>k__BackingField
IL_0007: ret

// System.Double neobotics.ModSdk.IterativeStopwatch::get_IterationMilliseconds()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Double neobotics.ModSdk.IterativeStopwatch::<IterationMilliseconds>k__BackingField
IL_0006: ret

// System.Void neobotics.ModSdk.IterativeStopwatch::set_IterationMilliseconds(System.Double)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Double neobotics.ModSdk.IterativeStopwatch::<IterationMilliseconds>k__BackingField
IL_0007: ret

// System.Double neobotics.ModSdk.IterativeStopwatch::get_TotalElapsedMilliseconds()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Double neobotics.ModSdk.IterativeStopwatch::<TotalElapsedMilliseconds>k__BackingField
IL_0006: ret

// System.Void neobotics.ModSdk.IterativeStopwatch::set_TotalElapsedMilliseconds(System.Double)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Double neobotics.ModSdk.IterativeStopwatch::<TotalElapsedMilliseconds>k__BackingField
IL_0007: ret

// System.Double neobotics.ModSdk.IterativeStopwatch::get_AverageMicroseconds()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Double neobotics.ModSdk.IterativeStopwatch::<AverageMicroseconds>k__BackingField
IL_0006: ret

// System.Void neobotics.ModSdk.IterativeStopwatch::set_AverageMicroseconds(System.Double)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Double neobotics.ModSdk.IterativeStopwatch::<AverageMicroseconds>k__BackingField
IL_0007: ret

// System.Double neobotics.ModSdk.IterativeStopwatch::get_AverageMilliseconds()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Double neobotics.ModSdk.IterativeStopwatch::<AverageMilliseconds>k__BackingField
IL_0006: ret

// System.Void neobotics.ModSdk.IterativeStopwatch::set_AverageMilliseconds(System.Double)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Double neobotics.ModSdk.IterativeStopwatch::<AverageMilliseconds>k__BackingField
IL_0007: ret

// System.Void neobotics.ModSdk.IterativeStopwatch::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::GetLogger()
IL_0006: stfld neobotics.ModSdk.Logging neobotics.ModSdk.IterativeStopwatch::Log
IL_000b: ldarg.0
IL_000c: call System.Void System.Diagnostics.Stopwatch::.ctor()
IL_0011: ldarg.0
IL_0012: ldc.i4.0
IL_0013: conv.i8
IL_0014: call System.Void neobotics.ModSdk.IterativeStopwatch::set_Iterations(System.Int64)
IL_0019: ret

// System.Void neobotics.ModSdk.IterativeStopwatch::Start()
.locals System.TimeSpan
IL_0000: ldarg.0
IL_0001: ldarg.0
IL_0002: call System.TimeSpan System.Diagnostics.Stopwatch::get_Elapsed()
IL_0007: stloc.0
IL_0008: ldloca.s V_0
IL_000a: call System.Double System.TimeSpan::get_TotalMilliseconds()
IL_000f: stfld System.Double neobotics.ModSdk.IterativeStopwatch::startMillis
IL_0014: ldarg.0
IL_0015: call System.Void System.Diagnostics.Stopwatch::Start()
IL_001a: ret

// System.Void neobotics.ModSdk.IterativeStopwatch::Stop()
.locals System.Int64, System.TimeSpan
IL_0000: ldarg.0
IL_0001: call System.Boolean System.Diagnostics.Stopwatch::get_IsRunning()
IL_0006: brtrue.s IL_0009
IL_0008: ret
IL_0009: ldarg.0
IL_000a: call System.Void System.Diagnostics.Stopwatch::Stop()
IL_000f: ldarg.0
IL_0010: call System.Int64 neobotics.ModSdk.IterativeStopwatch::get_Iterations()
IL_0015: stloc.0
IL_0016: ldarg.0
IL_0017: ldloc.0
IL_0018: ldc.i4.1
IL_0019: conv.i8
IL_001a: add
IL_001b: call System.Void neobotics.ModSdk.IterativeStopwatch::set_Iterations(System.Int64)
IL_0020: ldarg.0
IL_0021: ldarg.0
IL_0022: call System.TimeSpan System.Diagnostics.Stopwatch::get_Elapsed()
IL_0027: stloc.1
IL_0028: ldloca.s V_1
IL_002a: call System.Double System.TimeSpan::get_TotalMilliseconds()
IL_002f: ldarg.0
IL_0030: ldfld System.Double neobotics.ModSdk.IterativeStopwatch::startMillis
IL_0035: sub
IL_0036: call System.Void neobotics.ModSdk.IterativeStopwatch::set_IterationMilliseconds(System.Double)
IL_003b: ldarg.0
IL_003c: ldarg.0
IL_003d: call System.Double neobotics.ModSdk.IterativeStopwatch::get_IterationMilliseconds()
IL_0042: ldc.r8 1000
IL_004b: mul
IL_004c: call System.Void neobotics.ModSdk.IterativeStopwatch::set_IterationMicroseconds(System.Double)
IL_0051: ldarg.0
IL_0052: ldarg.0
IL_0053: call System.TimeSpan System.Diagnostics.Stopwatch::get_Elapsed()
IL_0058: stloc.1
IL_0059: ldloca.s V_1
IL_005b: call System.Double System.TimeSpan::get_TotalMilliseconds()
IL_0060: call System.Void neobotics.ModSdk.IterativeStopwatch::set_TotalElapsedMilliseconds(System.Double)
IL_0065: ldarg.0
IL_0066: ldarg.0
IL_0067: call System.TimeSpan System.Diagnostics.Stopwatch::get_Elapsed()
IL_006c: stloc.1
IL_006d: ldloca.s V_1
IL_006f: call System.Double System.TimeSpan::get_TotalMilliseconds()
IL_0074: ldc.r8 1000
IL_007d: mul
IL_007e: call System.Void neobotics.ModSdk.IterativeStopwatch::set_TotalElapsedMicroseconds(System.Double)
IL_0083: ldarg.0
IL_0084: ldarg.0
IL_0085: call System.Double neobotics.ModSdk.IterativeStopwatch::get_TotalElapsedMilliseconds()
IL_008a: ldarg.0
IL_008b: call System.Int64 neobotics.ModSdk.IterativeStopwatch::get_Iterations()
IL_0090: conv.r8
IL_0091: div
IL_0092: call System.Void neobotics.ModSdk.IterativeStopwatch::set_AverageMilliseconds(System.Double)
IL_0097: ldarg.0
IL_0098: ldarg.0
IL_0099: call System.Double neobotics.ModSdk.IterativeStopwatch::get_TotalElapsedMicroseconds()
IL_009e: ldarg.0
IL_009f: call System.Int64 neobotics.ModSdk.IterativeStopwatch::get_Iterations()
IL_00a4: conv.r8
IL_00a5: div
IL_00a6: call System.Void neobotics.ModSdk.IterativeStopwatch::set_AverageMicroseconds(System.Double)
IL_00ab: ret

// System.Void neobotics.ModSdk.IterativeStopwatch::Reset()
.locals 
IL_0000: ldarg.0
IL_0001: ldc.r8 0
IL_000a: stfld System.Double neobotics.ModSdk.IterativeStopwatch::startMillis
IL_000f: ldarg.0
IL_0010: ldc.i4.0
IL_0011: conv.i8
IL_0012: call System.Void neobotics.ModSdk.IterativeStopwatch::set_Iterations(System.Int64)
IL_0017: ldarg.0
IL_0018: call System.Void System.Diagnostics.Stopwatch::Reset()
IL_001d: ret

// System.Void neobotics.ModSdk.IterativeStopwatch::Restart()
.locals 
IL_0000: ldarg.0
IL_0001: ldc.r8 0
IL_000a: stfld System.Double neobotics.ModSdk.IterativeStopwatch::startMillis
IL_000f: ldarg.0
IL_0010: ldc.i4.0
IL_0011: conv.i8
IL_0012: call System.Void neobotics.ModSdk.IterativeStopwatch::set_Iterations(System.Int64)
IL_0017: ldarg.0
IL_0018: call System.Void System.Diagnostics.Stopwatch::Restart()
IL_001d: ret

// T[] neobotics.ModSdk.JsonHelper::FromJson(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call !!0 UnityEngine.JsonUtility::FromJson<neobotics.ModSdk.JsonHelper/JsonWrapper`1<T>>(System.String)
IL_0006: ldfld T[] neobotics.ModSdk.JsonHelper/JsonWrapper`1<T>::Items
IL_000b: ret

// System.String neobotics.ModSdk.JsonHelper::ToJson(T[])
.locals 
IL_0000: newobj System.Void neobotics.ModSdk.JsonHelper/JsonWrapper`1<T>::.ctor()
IL_0005: dup
IL_0006: ldarg.0
IL_0007: stfld T[] neobotics.ModSdk.JsonHelper/JsonWrapper`1<T>::Items
IL_000c: call System.String UnityEngine.JsonUtility::ToJson(System.Object)
IL_0011: ret

// System.String neobotics.ModSdk.JsonHelper::ToJson(T[],System.Boolean)
.locals 
IL_0000: newobj System.Void neobotics.ModSdk.JsonHelper/JsonWrapper`1<T>::.ctor()
IL_0005: dup
IL_0006: ldarg.0
IL_0007: stfld T[] neobotics.ModSdk.JsonHelper/JsonWrapper`1<T>::Items
IL_000c: ldarg.1
IL_000d: call System.String UnityEngine.JsonUtility::ToJson(System.Object,System.Boolean)
IL_0012: ret

// System.Void neobotics.ModSdk.JsonHelper/JsonWrapper`1::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// neobotics.ModSdk.Logging neobotics.ModSdk.Logging::get_Instance()
.locals 
IL_0000: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.Logging::_instance
IL_0005: brtrue.s IL_0012
IL_0007: ldstr "Logging.Instance was accessed before initialization. Call Logging.Initialize() in your mod's startup code first."
IL_000c: newobj System.Void System.InvalidOperationException::.ctor(System.String)
IL_0011: throw
IL_0012: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.Logging::_instance
IL_0017: ret

// System.Void neobotics.ModSdk.Logging::set_Instance(neobotics.ModSdk.Logging)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld neobotics.ModSdk.Logging neobotics.ModSdk.Logging::_instance
IL_0006: ret

// neobotics.ModSdk.Logging/LogLevels neobotics.ModSdk.Logging::get_LogLevel()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld neobotics.ModSdk.Logging/LogLevels neobotics.ModSdk.Logging::<LogLevel>k__BackingField
IL_0006: ret

// System.Void neobotics.ModSdk.Logging::set_LogLevel(neobotics.ModSdk.Logging/LogLevels)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld neobotics.ModSdk.Logging/LogLevels neobotics.ModSdk.Logging::<LogLevel>k__BackingField
IL_0007: ret

// System.String neobotics.ModSdk.Logging::get_ModName()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.String neobotics.ModSdk.Logging::<ModName>k__BackingField
IL_0006: ret

// System.Void neobotics.ModSdk.Logging::set_ModName(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.String neobotics.ModSdk.Logging::<ModName>k__BackingField
IL_0007: ret

// System.Void neobotics.ModSdk.Logging::.ctor(neobotics.ModSdk.Logging/LogLevels,System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ldarg.0
IL_0007: ldarg.1
IL_0008: call System.Void neobotics.ModSdk.Logging::set_LogLevel(neobotics.ModSdk.Logging/LogLevels)
IL_000d: ldarg.0
IL_000e: ldarg.2
IL_000f: call System.Void neobotics.ModSdk.Logging::set_ModName(System.String)
IL_0014: ret

// neobotics.ModSdk.Logging neobotics.ModSdk.Logging::Initialize(neobotics.ModSdk.Logging/LogLevels,System.String)
.locals 
IL_0000: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.Logging::_instance
IL_0005: brfalse.s IL_001c
IL_0007: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::get_Instance()
IL_000c: ldstr "Logger is already initialized. Using existing logger"
IL_0011: callvirt System.Void neobotics.ModSdk.Logging::Warning(System.String)
IL_0016: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.Logging::_instance
IL_001b: ret
IL_001c: ldarg.0
IL_001d: ldarg.1
IL_001e: newobj System.Void neobotics.ModSdk.Logging::.ctor(neobotics.ModSdk.Logging/LogLevels,System.String)
IL_0023: call System.Void neobotics.ModSdk.Logging::set_Instance(neobotics.ModSdk.Logging)
IL_0028: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.Logging::_instance
IL_002d: ret

// neobotics.ModSdk.Logging neobotics.ModSdk.Logging::GetLogger(neobotics.ModSdk.Logging/LogLevels,System.String)
.locals 
IL_0000: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.Logging::_instance
IL_0005: brtrue.s IL_000f
IL_0007: ldarg.0
IL_0008: ldarg.1
IL_0009: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::Initialize(neobotics.ModSdk.Logging/LogLevels,System.String)
IL_000e: pop
IL_000f: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::get_Instance()
IL_0014: ret

// neobotics.ModSdk.Logging neobotics.ModSdk.Logging::GetLogger()
.locals 
IL_0000: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::get_Instance()
IL_0005: ret

// System.Void neobotics.ModSdk.Logging::Trace(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call neobotics.ModSdk.Logging/LogLevels neobotics.ModSdk.Logging::get_LogLevel()
IL_0006: ldc.i4.5
IL_0007: blt.s IL_0015
IL_0009: ldarg.0
IL_000a: ldarg.1
IL_000b: call System.String neobotics.ModSdk.Logging::Message(System.String)
IL_0010: call System.Void UnityEngine.Debug::Log(System.Object)
IL_0015: ret

// System.Void neobotics.ModSdk.Logging::Debug(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call neobotics.ModSdk.Logging/LogLevels neobotics.ModSdk.Logging::get_LogLevel()
IL_0006: ldc.i4.4
IL_0007: blt.s IL_0015
IL_0009: ldarg.0
IL_000a: ldarg.1
IL_000b: call System.String neobotics.ModSdk.Logging::Message(System.String)
IL_0010: call System.Void UnityEngine.Debug::Log(System.Object)
IL_0015: ret

// System.Void neobotics.ModSdk.Logging::Info(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call neobotics.ModSdk.Logging/LogLevels neobotics.ModSdk.Logging::get_LogLevel()
IL_0006: ldc.i4.3
IL_0007: blt.s IL_0015
IL_0009: ldarg.0
IL_000a: ldarg.1
IL_000b: call System.String neobotics.ModSdk.Logging::Message(System.String)
IL_0010: call System.Void UnityEngine.Debug::Log(System.Object)
IL_0015: ret

// System.Void neobotics.ModSdk.Logging::Warning(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call neobotics.ModSdk.Logging/LogLevels neobotics.ModSdk.Logging::get_LogLevel()
IL_0006: ldc.i4.2
IL_0007: blt.s IL_0015
IL_0009: ldarg.0
IL_000a: ldarg.1
IL_000b: call System.String neobotics.ModSdk.Logging::Message(System.String)
IL_0010: call System.Void UnityEngine.Debug::LogWarning(System.Object)
IL_0015: ret

// System.Void neobotics.ModSdk.Logging::Error(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call neobotics.ModSdk.Logging/LogLevels neobotics.ModSdk.Logging::get_LogLevel()
IL_0006: ldc.i4.1
IL_0007: blt.s IL_0015
IL_0009: ldarg.0
IL_000a: ldarg.1
IL_000b: call System.String neobotics.ModSdk.Logging::Message(System.String)
IL_0010: call System.Void UnityEngine.Debug::LogWarning(System.Object)
IL_0015: ret

// System.Void neobotics.ModSdk.Logging::Error(System.Exception)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: ldc.i4.0
IL_0003: call System.Void neobotics.ModSdk.Logging::Error(System.Exception,System.Boolean)
IL_0008: ret

// System.Void neobotics.ModSdk.Logging::Error(System.Exception,System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: call neobotics.ModSdk.Logging/LogLevels neobotics.ModSdk.Logging::get_LogLevel()
IL_0006: ldc.i4.1
IL_0007: blt.s IL_002a
IL_0009: ldarg.0
IL_000a: ldarg.0
IL_000b: ldarg.1
IL_000c: callvirt System.String System.Exception::get_Message()
IL_0011: call System.String neobotics.ModSdk.Logging::Message(System.String)
IL_0016: call System.Void neobotics.ModSdk.Logging::Warning(System.String)
IL_001b: ldarg.2
IL_001c: brfalse.s IL_002a
IL_001e: ldarg.0
IL_001f: ldarg.1
IL_0020: callvirt System.String System.Exception::get_StackTrace()
IL_0025: call System.Void neobotics.ModSdk.Logging::Warning(System.String)
IL_002a: ret

// System.Void neobotics.ModSdk.Logging::Critical(System.Exception)
.locals 
IL_0000: ldarg.0
IL_0001: call neobotics.ModSdk.Logging/LogLevels neobotics.ModSdk.Logging::get_LogLevel()
IL_0006: ldc.i4.0
IL_0007: blt.s IL_0027
IL_0009: ldarg.0
IL_000a: ldarg.0
IL_000b: ldarg.1
IL_000c: callvirt System.String System.Exception::get_Message()
IL_0011: call System.String neobotics.ModSdk.Logging::Message(System.String)
IL_0016: call System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_001b: ldarg.0
IL_001c: ldarg.1
IL_001d: callvirt System.String System.Exception::get_StackTrace()
IL_0022: call System.Void neobotics.ModSdk.Logging::Error(System.String)
IL_0027: ret

// System.String neobotics.ModSdk.Logging::Message(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call System.String neobotics.ModSdk.Logging::get_ModName()
IL_0006: ldstr ": "
IL_000b: ldarg.1
IL_000c: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0011: ret

// System.Boolean neobotics.ModSdk.Logging::Testing()
.locals 
IL_0000: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::get_Instance()
IL_0005: callvirt neobotics.ModSdk.Logging/LogLevels neobotics.ModSdk.Logging::get_LogLevel()
IL_000a: ldc.i4.4
IL_000b: clt
IL_000d: ldc.i4.0
IL_000e: ceq
IL_0010: ret

// System.Void neobotics.ModSdk.Logging::ChangeLogging(System.Object,System.EventArgs)
.locals BepInEx.Configuration.ConfigEntry`1<neobotics.ModSdk.Logging/LogLevels>
IL_0000: ldarg.0
IL_0001: isinst BepInEx.Configuration.ConfigEntry`1<neobotics.ModSdk.Logging/LogLevels>
IL_0006: stloc.0
IL_0007: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.Logging::_instance
IL_000c: brfalse.s IL_0048
IL_000e: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::get_Instance()
IL_0013: ldloc.0
IL_0014: callvirt !0 BepInEx.Configuration.ConfigEntry`1<neobotics.ModSdk.Logging/LogLevels>::get_Value()
IL_0019: callvirt System.Void neobotics.ModSdk.Logging::set_LogLevel(neobotics.ModSdk.Logging/LogLevels)
IL_001e: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::get_Instance()
IL_0023: ldstr "Change {0} to {1}"
IL_0028: ldloc.0
IL_0029: callvirt BepInEx.Configuration.ConfigDefinition BepInEx.Configuration.ConfigEntryBase::get_Definition()
IL_002e: callvirt System.String BepInEx.Configuration.ConfigDefinition::get_Key()
IL_0033: ldloc.0
IL_0034: callvirt !0 BepInEx.Configuration.ConfigEntry`1<neobotics.ModSdk.Logging/LogLevels>::get_Value()
IL_0039: box neobotics.ModSdk.Logging/LogLevels
IL_003e: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_0043: callvirt System.Void neobotics.ModSdk.Logging::Info(System.String)
IL_0048: ret

// System.String neobotics.ModSdk.ModResourceBootstrap::InitializeModResources(System.Type,System.String)
.locals System.String, System.String
IL_0000: ldarg.1
IL_0001: call System.String neobotics.ModSdk.ConfigFolderHelper::GetOrCreateModConfigFolder(System.String)
IL_0006: stloc.0
IL_0007: ldarg.0
IL_0008: callvirt System.Reflection.Assembly System.Type::get_Assembly()
IL_000d: callvirt System.Reflection.AssemblyName System.Reflection.Assembly::GetName()
IL_0012: callvirt System.String System.Reflection.AssemblyName::get_Name()
IL_0017: ldloc.0
IL_0018: call System.Boolean System.IO.Directory::Exists(System.String)
IL_001d: brtrue.s IL_003b
IL_001f: ldloc.0
IL_0020: call System.IO.DirectoryInfo System.IO.Directory::CreateDirectory(System.String)
IL_0025: pop
IL_0026: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::get_Instance()
IL_002b: ldstr "Created subfolder layout: "
IL_0030: ldloc.0
IL_0031: call System.String System.String::Concat(System.String,System.String)
IL_0036: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_003b: ldstr ".Resources."
IL_0040: call System.String System.String::Concat(System.String,System.String)
IL_0045: stloc.1
IL_0046: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::get_Instance()
IL_004b: ldstr "Scanning assembly for standard prefix: "
IL_0050: ldloc.1
IL_0051: call System.String System.String::Concat(System.String,System.String)
IL_0056: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_005b: ldarg.0
IL_005c: callvirt System.Reflection.Assembly System.Type::get_Assembly()
IL_0061: ldloc.1
IL_0062: ldloc.0
IL_0063: call System.Void neobotics.ModSdk.ModResourceBootstrap::ExtractResources(System.Reflection.Assembly,System.String,System.String)
IL_0068: ldloc.0
IL_0069: ret

// System.Void neobotics.ModSdk.ModResourceBootstrap::ExtractResources(System.Reflection.Assembly,System.String,System.String)
.locals System.String[], System.Int32, System.String, System.String, System.String, System.IO.Stream, System.IO.FileStream, System.Exception
IL_0000: ldarg.0
IL_0001: callvirt System.String[] System.Reflection.Assembly::GetManifestResourceNames()
IL_0006: stloc.0
IL_0007: ldc.i4.0
IL_0008: stloc.1
IL_0009: br IL_00db
IL_000e: ldloc.0
IL_000f: ldloc.1
IL_0010: ldelem.ref
IL_0011: stloc.2
IL_0012: ldloc.2
IL_0013: ldarg.1
IL_0014: ldc.i4.5
IL_0015: callvirt System.Boolean System.String::StartsWith(System.String,System.StringComparison)
IL_001a: brfalse IL_00d7
IL_001f: ldloc.2
IL_0020: ldarg.1
IL_0021: callvirt System.Int32 System.String::get_Length()
IL_0026: callvirt System.String System.String::Substring(System.Int32)
IL_002b: stloc.3
IL_002c: ldarg.2
IL_002d: ldloc.3
IL_002e: call System.String System.IO.Path::Combine(System.String,System.String)
IL_0033: stloc.s V_4
IL_0035: ldloc.s V_4
IL_0037: call System.Boolean System.IO.File::Exists(System.String)
IL_003c: brtrue IL_00d7
IL_0041: nop
IL_0042: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::get_Instance()
IL_0047: ldstr "Extracting asset: "
IL_004c: ldloc.3
IL_004d: ldstr " -> "
IL_0052: ldloc.s V_4
IL_0054: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_0059: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_005e: ldarg.0
IL_005f: ldloc.2
IL_0060: callvirt System.IO.Stream System.Reflection.Assembly::GetManifestResourceStream(System.String)
IL_0065: stloc.s V_5
IL_0067: ldloc.s V_5
IL_0069: brtrue.s IL_0082
IL_006b: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::get_Instance()
IL_0070: ldstr "Could not access resource stream for: "
IL_0075: ldloc.2
IL_0076: call System.String System.String::Concat(System.String,System.String)
IL_007b: callvirt System.Void neobotics.ModSdk.Logging::Error(System.String)
IL_0080: leave.s IL_00d7
IL_0082: ldloc.s V_4
IL_0084: call System.IO.FileStream System.IO.File::Create(System.String)
IL_0089: stloc.s V_6
IL_008b: ldloc.s V_5
IL_008d: ldloc.s V_6
IL_008f: callvirt System.Void System.IO.Stream::CopyTo(System.IO.Stream)
IL_0094: leave.s IL_00a2
IL_0096: ldloc.s V_6
IL_0098: brfalse.s IL_00a1
IL_009a: ldloc.s V_6
IL_009c: callvirt System.Void System.IDisposable::Dispose()
IL_00a1: endfinally
IL_00a2: leave.s IL_00b0
IL_00a4: ldloc.s V_5
IL_00a6: brfalse.s IL_00af
IL_00a8: ldloc.s V_5
IL_00aa: callvirt System.Void System.IDisposable::Dispose()
IL_00af: endfinally
IL_00b0: leave.s IL_00d7
IL_00b2: stloc.s V_7
IL_00b4: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::get_Instance()
IL_00b9: ldstr "Failed to unpack embedded asset "
IL_00be: ldloc.3
IL_00bf: ldstr ": "
IL_00c4: ldloc.s V_7
IL_00c6: callvirt System.String System.Exception::get_Message()
IL_00cb: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_00d0: callvirt System.Void neobotics.ModSdk.Logging::Error(System.String)
IL_00d5: leave.s IL_00d7
IL_00d7: ldloc.1
IL_00d8: ldc.i4.1
IL_00d9: add
IL_00da: stloc.1
IL_00db: ldloc.1
IL_00dc: ldloc.0
IL_00dd: ldlen
IL_00de: conv.i4
IL_00df: blt IL_000e
IL_00e4: ret
// EH Finally: 139 - 150 => 150 - 162
// EH Finally: 103 - 164 => 164 - 176
// EH Catch: 66 - 178 => 178 - 215

// System.Void neobotics.ModSdk.ServerConfiguration::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// neobotics.ModSdk.ServerConfiguration neobotics.ModSdk.ServerConfiguration::get_Instance()
.locals 
IL_0000: ldsfld neobotics.ModSdk.ServerConfiguration neobotics.ModSdk.ServerConfiguration::_instance
IL_0005: brtrue.s IL_0011
IL_0007: newobj System.Void neobotics.ModSdk.ServerConfiguration::.ctor()
IL_000c: stsfld neobotics.ModSdk.ServerConfiguration neobotics.ModSdk.ServerConfiguration::_instance
IL_0011: ldsfld neobotics.ModSdk.ServerConfiguration neobotics.ModSdk.ServerConfiguration::_instance
IL_0016: ret

// System.Void neobotics.ModSdk.ServerConfiguration::Setup(BepInEx.Configuration.ConfigFile,BepInEx.BaseUnityPlugin)
.locals 
IL_0000: ldarg.1
IL_0001: stsfld BepInEx.Configuration.ConfigFile neobotics.ModSdk.ServerConfiguration::LocalConfig
IL_0006: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::GetLogger()
IL_000b: stsfld neobotics.ModSdk.Logging neobotics.ModSdk.ServerConfiguration::Log
IL_0010: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.ServerConfiguration::Log
IL_0015: ldstr "ServerConfiguration Setup"
IL_001a: callvirt System.Void neobotics.ModSdk.Logging::Trace(System.String)
IL_001f: ldarg.2
IL_0020: stsfld BepInEx.BaseUnityPlugin neobotics.ModSdk.ServerConfiguration::Mod
IL_0025: ldsfld BepInEx.Configuration.ConfigFile neobotics.ModSdk.ServerConfiguration::LocalConfig
IL_002a: callvirt System.String BepInEx.Configuration.ConfigFile::get_ConfigFilePath()
IL_002f: call System.String System.IO.Path::GetFileName(System.String)
IL_0034: stsfld System.String neobotics.ModSdk.ServerConfiguration::ConfigFileName
IL_0039: ldarg.0
IL_003a: ldc.i4.1
IL_003b: stfld System.Boolean neobotics.ModSdk.ServerConfiguration::IsSetup
IL_0040: ret

// System.Void neobotics.ModSdk.ServerConfiguration::CreateConfigWatcher()
.locals 
IL_0000: ldarg.0
IL_0001: ldsfld BepInEx.Configuration.ConfigFile neobotics.ModSdk.ServerConfiguration::LocalConfig
IL_0006: callvirt System.String BepInEx.Configuration.ConfigFile::get_ConfigFilePath()
IL_000b: ldarg.0
IL_000c: ldftn System.Void neobotics.ModSdk.ServerConfiguration::LoadConfig(System.Object,System.IO.FileSystemEventArgs)
IL_0012: newobj System.Void System.IO.FileSystemEventHandler::.ctor(System.Object,System.IntPtr)
IL_0017: call System.IO.FileSystemWatcher neobotics.ModSdk.Utils::CreateFileWatcher(System.String,System.IO.FileSystemEventHandler)
IL_001c: stfld System.IO.FileSystemWatcher neobotics.ModSdk.ServerConfiguration::ConfigWatcher
IL_0021: ret

// System.Void neobotics.ModSdk.ServerConfiguration::LoadConfig(System.Object,System.IO.FileSystemEventArgs)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigFile neobotics.ModSdk.ServerConfiguration::LocalConfig
IL_0005: callvirt System.String BepInEx.Configuration.ConfigFile::get_ConfigFilePath()
IL_000a: call System.Boolean System.IO.File::Exists(System.String)
IL_000f: brtrue.s IL_0012
IL_0011: ret
IL_0012: nop
IL_0013: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.ServerConfiguration::Log
IL_0018: ldstr "Loading configuration {0}"
IL_001d: ldarg.2
IL_001e: callvirt System.IO.WatcherChangeTypes System.IO.FileSystemEventArgs::get_ChangeType()
IL_0023: box System.IO.WatcherChangeTypes
IL_0028: call System.String System.String::Format(System.String,System.Object)
IL_002d: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0032: ldsfld BepInEx.Configuration.ConfigFile neobotics.ModSdk.ServerConfiguration::LocalConfig
IL_0037: callvirt System.Void BepInEx.Configuration.ConfigFile::Reload()
IL_003c: leave.s IL_005a
IL_003e: pop
IL_003f: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.ServerConfiguration::Log
IL_0044: ldstr "Error loading configuration file "
IL_0049: ldsfld System.String neobotics.ModSdk.ServerConfiguration::ConfigFileName
IL_004e: call System.String System.String::Concat(System.String,System.String)
IL_0053: callvirt System.Void neobotics.ModSdk.Logging::Error(System.String)
IL_0058: leave.s IL_005a
IL_005a: ret
// EH Catch: 19 - 62 => 62 - 90

// System.String neobotics.ModSdk.ServerConfiguration::GetPluginGuid()
.locals 
IL_0000: ldsfld BepInEx.BaseUnityPlugin neobotics.ModSdk.ServerConfiguration::Mod
IL_0005: callvirt BepInEx.PluginInfo BepInEx.BaseUnityPlugin::get_Info()
IL_000a: callvirt BepInEx.BepInPlugin BepInEx.PluginInfo::get_Metadata()
IL_000f: callvirt System.String BepInEx.BepInPlugin::get_GUID()
IL_0014: ret

// System.Void neobotics.ModSdk.ServerConfiguration::RPC_ClientConfigReceiver(ZRpc,ZPackage)
.locals neobotics.ModSdk.ServerConfiguration/<>c__DisplayClass17_0, System.String, neobotics.ModSdk.DelegatedConfigEntryBase, BepInEx.Configuration.ConfigEntryBase, System.Predicate`1<neobotics.ModSdk.DelegatedConfigEntryBase>
IL_0000: newobj System.Void neobotics.ModSdk.ServerConfiguration/<>c__DisplayClass17_0::.ctor()
IL_0005: stloc.0
IL_0006: call neobotics.ModSdk.ServerConfiguration neobotics.ModSdk.ServerConfiguration::get_Instance()
IL_000b: ldfld System.Boolean neobotics.ModSdk.ServerConfiguration::IsSetup
IL_0010: brtrue.s IL_0022
IL_0012: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.ServerConfiguration::Log
IL_0017: ldstr "ServerConfiguration not initialized. Setup first."
IL_001c: callvirt System.Void neobotics.ModSdk.Logging::Error(System.String)
IL_0021: ret
IL_0022: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.ServerConfiguration::Log
IL_0027: ldstr "ClientConfigReceiver"
IL_002c: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0031: br IL_0121
IL_0036: ldloc.0
IL_0037: ldarg.2
IL_0038: callvirt System.String ZPackage::ReadString()
IL_003d: stfld System.String neobotics.ModSdk.ServerConfiguration/<>c__DisplayClass17_0::section
IL_0042: ldloc.0
IL_0043: ldarg.2
IL_0044: callvirt System.String ZPackage::ReadString()
IL_0049: stfld System.String neobotics.ModSdk.ServerConfiguration/<>c__DisplayClass17_0::name
IL_004e: ldarg.2
IL_004f: callvirt System.String ZPackage::ReadString()
IL_0054: stloc.1
IL_0055: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.ServerConfiguration::Log
IL_005a: ldc.i4.7
IL_005b: newarr System.String
IL_0060: dup
IL_0061: ldc.i4.0
IL_0062: ldstr "Reading "
IL_0067: stelem.ref
IL_0068: dup
IL_0069: ldc.i4.1
IL_006a: ldloc.0
IL_006b: ldfld System.String neobotics.ModSdk.ServerConfiguration/<>c__DisplayClass17_0::section
IL_0070: stelem.ref
IL_0071: dup
IL_0072: ldc.i4.2
IL_0073: ldstr " "
IL_0078: stelem.ref
IL_0079: dup
IL_007a: ldc.i4.3
IL_007b: ldloc.0
IL_007c: ldfld System.String neobotics.ModSdk.ServerConfiguration/<>c__DisplayClass17_0::name
IL_0081: stelem.ref
IL_0082: dup
IL_0083: ldc.i4.4
IL_0084: ldstr " value "
IL_0089: stelem.ref
IL_008a: dup
IL_008b: ldc.i4.5
IL_008c: ldloc.1
IL_008d: stelem.ref
IL_008e: dup
IL_008f: ldc.i4.6
IL_0090: ldstr " from ZPackage"
IL_0095: stelem.ref
IL_0096: call System.String System.String::Concat(System.String[])
IL_009b: callvirt System.Void neobotics.ModSdk.Logging::Trace(System.String)
IL_00a0: ldsfld System.Collections.Generic.List`1<neobotics.ModSdk.DelegatedConfigEntryBase> neobotics.ModSdk.ServerConfiguration::ServerDelegatedEntries
IL_00a5: ldloc.0
IL_00a6: ldfld System.Predicate`1<neobotics.ModSdk.DelegatedConfigEntryBase> neobotics.ModSdk.ServerConfiguration/<>c__DisplayClass17_0::<>9__0
IL_00ab: dup
IL_00ac: brtrue.s IL_00c6
IL_00ae: pop
IL_00af: ldloc.0
IL_00b0: ldloc.0
IL_00b1: ldftn System.Boolean neobotics.ModSdk.ServerConfiguration/<>c__DisplayClass17_0::<RPC_ClientConfigReceiver>b__0(neobotics.ModSdk.DelegatedConfigEntryBase)
IL_00b7: newobj System.Void System.Predicate`1<neobotics.ModSdk.DelegatedConfigEntryBase>::.ctor(System.Object,System.IntPtr)
IL_00bc: dup
IL_00bd: stloc.s V_4
IL_00bf: stfld System.Predicate`1<neobotics.ModSdk.DelegatedConfigEntryBase> neobotics.ModSdk.ServerConfiguration/<>c__DisplayClass17_0::<>9__0
IL_00c4: ldloc.s V_4
IL_00c6: callvirt !0 System.Collections.Generic.List`1<neobotics.ModSdk.DelegatedConfigEntryBase>::Find(System.Predicate`1<!0>)
IL_00cb: stloc.2
IL_00cc: ldloc.2
IL_00cd: brfalse.s IL_00eb
IL_00cf: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.ServerConfiguration::Log
IL_00d4: ldstr "Found DCEB on client and setting to server value "
IL_00d9: ldloc.1
IL_00da: call System.String System.String::Concat(System.String,System.String)
IL_00df: callvirt System.Void neobotics.ModSdk.Logging::Trace(System.String)
IL_00e4: ldloc.2
IL_00e5: ldloc.1
IL_00e6: stfld System.String neobotics.ModSdk.DelegatedConfigEntryBase::ServerValue
IL_00eb: ldsfld BepInEx.Configuration.ConfigFile neobotics.ModSdk.ServerConfiguration::LocalConfig
IL_00f0: ldloc.0
IL_00f1: ldfld System.String neobotics.ModSdk.ServerConfiguration/<>c__DisplayClass17_0::section
IL_00f6: ldloc.0
IL_00f7: ldfld System.String neobotics.ModSdk.ServerConfiguration/<>c__DisplayClass17_0::name
IL_00fc: callvirt BepInEx.Configuration.ConfigEntryBase BepInEx.Configuration.ConfigFile::get_Item(System.String,System.String)
IL_0101: stloc.3
IL_0102: ldloc.3
IL_0103: brfalse.s IL_0121
IL_0105: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.ServerConfiguration::Log
IL_010a: ldstr "Found local CEB and setting underlying config value "
IL_010f: ldloc.1
IL_0110: call System.String System.String::Concat(System.String,System.String)
IL_0115: callvirt System.Void neobotics.ModSdk.Logging::Trace(System.String)
IL_011a: ldloc.3
IL_011b: ldloc.1
IL_011c: callvirt System.Void BepInEx.Configuration.ConfigEntryBase::SetSerializedValue(System.String)
IL_0121: ldarg.2
IL_0122: callvirt System.Int32 ZPackage::GetPos()
IL_0127: ldarg.2
IL_0128: callvirt System.Int32 ZPackage::Size()
IL_012d: blt IL_0036
IL_0132: ldarg.0
IL_0133: ldc.i4.1
IL_0134: stfld System.Boolean neobotics.ModSdk.ServerConfiguration::ReceivedServerValues
IL_0139: ret

// System.Void neobotics.ModSdk.ServerConfiguration::WriteConfigEntries(ZPackage)
.locals System.Collections.Generic.List`1/Enumerator<neobotics.ModSdk.DelegatedConfigEntryBase>, neobotics.ModSdk.DelegatedConfigEntryBase
IL_0000: ldsfld System.Collections.Generic.List`1<neobotics.ModSdk.DelegatedConfigEntryBase> neobotics.ModSdk.ServerConfiguration::ServerDelegatedEntries
IL_0005: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<neobotics.ModSdk.DelegatedConfigEntryBase>::GetEnumerator()
IL_000a: stloc.0
IL_000b: br.s IL_0089
IL_000d: ldloca.s V_0
IL_000f: call !0 System.Collections.Generic.List`1/Enumerator<neobotics.ModSdk.DelegatedConfigEntryBase>::get_Current()
IL_0014: stloc.1
IL_0015: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.ServerConfiguration::Log
IL_001a: ldc.i4.7
IL_001b: newarr System.String
IL_0020: dup
IL_0021: ldc.i4.0
IL_0022: ldstr "Writing "
IL_0027: stelem.ref
IL_0028: dup
IL_0029: ldc.i4.1
IL_002a: ldloc.1
IL_002b: ldfld System.String neobotics.ModSdk.DelegatedConfigEntryBase::Section
IL_0030: stelem.ref
IL_0031: dup
IL_0032: ldc.i4.2
IL_0033: ldstr " "
IL_0038: stelem.ref
IL_0039: dup
IL_003a: ldc.i4.3
IL_003b: ldloc.1
IL_003c: ldfld System.String neobotics.ModSdk.DelegatedConfigEntryBase::Name
IL_0041: stelem.ref
IL_0042: dup
IL_0043: ldc.i4.4
IL_0044: ldstr " value "
IL_0049: stelem.ref
IL_004a: dup
IL_004b: ldc.i4.5
IL_004c: ldloc.1
IL_004d: ldfld System.String neobotics.ModSdk.DelegatedConfigEntryBase::ServerValue
IL_0052: stelem.ref
IL_0053: dup
IL_0054: ldc.i4.6
IL_0055: ldstr " to ZPackage"
IL_005a: stelem.ref
IL_005b: call System.String System.String::Concat(System.String[])
IL_0060: callvirt System.Void neobotics.ModSdk.Logging::Trace(System.String)
IL_0065: ldarg.1
IL_0066: ldloc.1
IL_0067: ldfld System.String neobotics.ModSdk.DelegatedConfigEntryBase::Section
IL_006c: callvirt System.Void ZPackage::Write(System.String)
IL_0071: ldarg.1
IL_0072: ldloc.1
IL_0073: ldfld System.String neobotics.ModSdk.DelegatedConfigEntryBase::Name
IL_0078: callvirt System.Void ZPackage::Write(System.String)
IL_007d: ldarg.1
IL_007e: ldloc.1
IL_007f: ldfld System.String neobotics.ModSdk.DelegatedConfigEntryBase::ServerValue
IL_0084: callvirt System.Void ZPackage::Write(System.String)
IL_0089: ldloca.s V_0
IL_008b: call System.Boolean System.Collections.Generic.List`1/Enumerator<neobotics.ModSdk.DelegatedConfigEntryBase>::MoveNext()
IL_0090: brtrue IL_000d
IL_0095: leave.s IL_00a5
IL_0097: ldloca.s V_0
IL_0099: constrained. System.Collections.Generic.List`1/Enumerator<neobotics.ModSdk.DelegatedConfigEntryBase>
IL_009f: callvirt System.Void System.IDisposable::Dispose()
IL_00a4: endfinally
IL_00a5: ret
// EH Finally: 11 - 151 => 151 - 165

// System.Void neobotics.ModSdk.ServerConfiguration::SendConfigToClient(ZNetPeer)
.locals ZPackage
IL_0000: call neobotics.ModSdk.ServerConfiguration neobotics.ModSdk.ServerConfiguration::get_Instance()
IL_0005: ldfld System.Boolean neobotics.ModSdk.ServerConfiguration::IsSetup
IL_000a: brtrue.s IL_001c
IL_000c: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.ServerConfiguration::Log
IL_0011: ldstr "ServerConfiguration not initialized. Setup first."
IL_0016: callvirt System.Void neobotics.ModSdk.Logging::Error(System.String)
IL_001b: ret
IL_001c: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.ServerConfiguration::Log
IL_0021: ldstr "SendConfigToClient"
IL_0026: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_002b: newobj System.Void ZPackage::.ctor()
IL_0030: stloc.0
IL_0031: ldarg.0
IL_0032: ldloc.0
IL_0033: call System.Void neobotics.ModSdk.ServerConfiguration::WriteConfigEntries(ZPackage)
IL_0038: ldarg.1
IL_0039: ldfld ZRpc ZNetPeer::m_rpc
IL_003e: ldstr "ClientConfigReceiver."
IL_0043: call System.String neobotics.ModSdk.ServerConfiguration::GetPluginGuid()
IL_0048: call System.String System.String::Concat(System.String,System.String)
IL_004d: ldc.i4.1
IL_004e: newarr System.Object
IL_0053: dup
IL_0054: ldc.i4.0
IL_0055: ldloc.0
IL_0056: stelem.ref
IL_0057: callvirt System.Void ZRpc::Invoke(System.String,System.Object[])
IL_005c: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.ServerConfiguration::Log
IL_0061: ldstr "Invoked ClientConfigReceiver on peer"
IL_0066: callvirt System.Void neobotics.ModSdk.Logging::Trace(System.String)
IL_006b: ret

// System.Void neobotics.ModSdk.ServerConfiguration::SendConfigToAllClients(System.Object,BepInEx.Configuration.SettingChangedEventArgs)
.locals ZPackage
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean neobotics.ModSdk.ServerConfiguration::IsSetup
IL_0006: brtrue.s IL_0018
IL_0008: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.ServerConfiguration::Log
IL_000d: ldstr "ServerConfiguration not initialized. Setup first."
IL_0012: callvirt System.Void neobotics.ModSdk.Logging::Error(System.String)
IL_0017: ret
IL_0018: call ZNet ZNet::get_instance()
IL_001d: ldnull
IL_001e: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0023: brfalse.s IL_0070
IL_0025: call ZNet ZNet::get_instance()
IL_002a: callvirt System.Boolean ZNet::IsServer()
IL_002f: brfalse.s IL_0070
IL_0031: call ZNet ZNet::get_instance()
IL_0036: callvirt System.Int32 ZNet::GetPeerConnections()
IL_003b: ldc.i4.0
IL_003c: ble.s IL_0070
IL_003e: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.ServerConfiguration::Log
IL_0043: ldstr "SendConfigToAllClients"
IL_0048: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_004d: newobj System.Void ZPackage::.ctor()
IL_0052: stloc.0
IL_0053: ldarg.0
IL_0054: ldloc.0
IL_0055: call System.Void neobotics.ModSdk.ServerConfiguration::WriteConfigEntries(ZPackage)
IL_005a: ldsfld BepInEx.BaseUnityPlugin neobotics.ModSdk.ServerConfiguration::Mod
IL_005f: ldsfld neobotics.ModSdk.ServerConfiguration neobotics.ModSdk.ServerConfiguration::_instance
IL_0064: ldloc.0
IL_0065: callvirt System.Collections.IEnumerator neobotics.ModSdk.ServerConfiguration::Co_BroadcastConfig(ZPackage)
IL_006a: callvirt UnityEngine.Coroutine UnityEngine.MonoBehaviour::StartCoroutine(System.Collections.IEnumerator)
IL_006f: pop
IL_0070: ret

// System.Collections.IEnumerator neobotics.ModSdk.ServerConfiguration::Co_BroadcastConfig(ZPackage)
.locals 
IL_0000: ldc.i4.0
IL_0001: newobj System.Void neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::.ctor(System.Int32)
IL_0006: dup
IL_0007: ldarg.1
IL_0008: stfld ZPackage neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::zpkg
IL_000d: ret

// System.Void neobotics.ModSdk.ServerConfiguration::.cctor()
.locals 
IL_0000: newobj System.Void System.Collections.Generic.List`1<neobotics.ModSdk.DelegatedConfigEntryBase>::.ctor()
IL_0005: stsfld System.Collections.Generic.List`1<neobotics.ModSdk.DelegatedConfigEntryBase> neobotics.ModSdk.ServerConfiguration::ServerDelegatedEntries
IL_000a: ret

// System.Void neobotics.ModSdk.ServerConfiguration/ZNet_Shutdown_Patch::ZNet_StopAll_Prefix(ZNet)
.locals 
IL_0000: ldsfld neobotics.ModSdk.ServerConfiguration neobotics.ModSdk.ServerConfiguration::_instance
IL_0005: brfalse.s IL_0021
IL_0007: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.ServerConfiguration::Log
IL_000c: ldstr "ZNet_StopAll_Patch_Prefix"
IL_0011: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0016: ldsfld neobotics.ModSdk.ServerConfiguration neobotics.ModSdk.ServerConfiguration::_instance
IL_001b: ldc.i4.0
IL_001c: stfld System.Boolean neobotics.ModSdk.ServerConfiguration::ReceivedServerValues
IL_0021: ret

// System.Void neobotics.ModSdk.ServerConfiguration/ZNet_OnNewConnection_Patch::Postfix(ZNet,ZNetPeer)
.locals 
IL_0000: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.ServerConfiguration::Log
IL_0005: ldstr "ZNet OnNewConnection postfix"
IL_000a: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_000f: ldarg.0
IL_0010: callvirt System.Boolean ZNet::IsServer()
IL_0015: brtrue.s IL_0064
IL_0017: ldarg.1
IL_0018: ldfld ZRpc ZNetPeer::m_rpc
IL_001d: ldstr "ClientConfigReceiver."
IL_0022: call System.String neobotics.ModSdk.ServerConfiguration::GetPluginGuid()
IL_0027: call System.String System.String::Concat(System.String,System.String)
IL_002c: call neobotics.ModSdk.ServerConfiguration neobotics.ModSdk.ServerConfiguration::get_Instance()
IL_0031: ldftn System.Void neobotics.ModSdk.ServerConfiguration::RPC_ClientConfigReceiver(ZRpc,ZPackage)
IL_0037: newobj System.Void System.Action`2<ZRpc,ZPackage>::.ctor(System.Object,System.IntPtr)
IL_003c: callvirt System.Void ZRpc::Register<ZPackage>(System.String,System.Action`2<ZRpc,!!0>)
IL_0041: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.ServerConfiguration::Log
IL_0046: ldstr "Player registered RPC_ClientConfigReceiver"
IL_004b: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0050: leave.s IL_0084
IL_0052: pop
IL_0053: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.ServerConfiguration::Log
IL_0058: ldstr "Failed to register RPC"
IL_005d: callvirt System.Void neobotics.ModSdk.Logging::Warning(System.String)
IL_0062: leave.s IL_0084
IL_0064: nop
IL_0065: call neobotics.ModSdk.ServerConfiguration neobotics.ModSdk.ServerConfiguration::get_Instance()
IL_006a: ldarg.1
IL_006b: callvirt System.Void neobotics.ModSdk.ServerConfiguration::SendConfigToClient(ZNetPeer)
IL_0070: leave.s IL_0084
IL_0072: pop
IL_0073: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.ServerConfiguration::Log
IL_0078: ldstr "Error sending server configuration to client"
IL_007d: callvirt System.Void neobotics.ModSdk.Logging::Warning(System.String)
IL_0082: leave.s IL_0084
IL_0084: ret
// EH Catch: 23 - 82 => 82 - 100
// EH Catch: 101 - 114 => 114 - 132

// System.Void neobotics.ModSdk.ServerConfiguration/<>c__DisplayClass17_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean neobotics.ModSdk.ServerConfiguration/<>c__DisplayClass17_0::<RPC_ClientConfigReceiver>b__0(neobotics.ModSdk.DelegatedConfigEntryBase)
.locals 
IL_0000: ldarg.1
IL_0001: ldfld System.String neobotics.ModSdk.DelegatedConfigEntryBase::Name
IL_0006: ldarg.0
IL_0007: ldfld System.String neobotics.ModSdk.ServerConfiguration/<>c__DisplayClass17_0::name
IL_000c: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0011: brfalse.s IL_0025
IL_0013: ldarg.1
IL_0014: ldfld System.String neobotics.ModSdk.DelegatedConfigEntryBase::Section
IL_0019: ldarg.0
IL_001a: ldfld System.String neobotics.ModSdk.ServerConfiguration/<>c__DisplayClass17_0::section
IL_001f: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0024: ret
IL_0025: ldc.i4.0
IL_0026: ret

// System.Void neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::.ctor(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ldarg.0
IL_0007: ldarg.1
IL_0008: stfld System.Int32 neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::<>1__state
IL_000d: ret

// System.Void neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::System.IDisposable.Dispose()
.locals System.Int32
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::<>1__state
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: ldc.i4.s -3
IL_000a: beq.s IL_0010
IL_000c: ldloc.0
IL_000d: ldc.i4.1
IL_000e: bne.un.s IL_001a
IL_0010: nop
IL_0011: leave.s IL_001a
IL_0013: ldarg.0
IL_0014: call System.Void neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::<>m__Finally1()
IL_0019: endfinally
IL_001a: ldarg.0
IL_001b: ldflda System.Collections.Generic.List`1/Enumerator<ZNetPeer> neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::<>7__wrap1
IL_0020: initobj System.Collections.Generic.List`1/Enumerator<ZNetPeer>
IL_0026: ldarg.0
IL_0027: ldc.i4.s -2
IL_0029: stfld System.Int32 neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::<>1__state
IL_002e: ret
// EH Finally: 17 - 19 => 19 - 26

// System.Boolean neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::MoveNext()
.locals System.Boolean, System.Int32, System.Collections.Generic.List`1<ZNetPeer>, ZNetPeer
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::<>1__state
IL_0006: stloc.1
IL_0007: ldloc.1
IL_0008: brfalse.s IL_0018
IL_000a: ldloc.1
IL_000b: ldc.i4.1
IL_000c: beq IL_00b2
IL_0011: ldc.i4.0
IL_0012: stloc.0
IL_0013: leave IL_00e4
IL_0018: ldarg.0
IL_0019: ldc.i4.m1
IL_001a: stfld System.Int32 neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::<>1__state
IL_001f: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.ServerConfiguration::Log
IL_0024: ldstr "Co_BroadcastConfig"
IL_0029: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_002e: call ZNet ZNet::get_instance()
IL_0033: callvirt System.Collections.Generic.List`1<ZNetPeer> ZNet::GetConnectedPeers()
IL_0038: stloc.2
IL_0039: ldarg.0
IL_003a: ldloc.2
IL_003b: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<ZNetPeer>::GetEnumerator()
IL_0040: stfld System.Collections.Generic.List`1/Enumerator<ZNetPeer> neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::<>7__wrap1
IL_0045: ldarg.0
IL_0046: ldc.i4.s -3
IL_0048: stfld System.Int32 neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::<>1__state
IL_004d: br.s IL_00ba
IL_004f: ldarg.0
IL_0050: ldflda System.Collections.Generic.List`1/Enumerator<ZNetPeer> neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::<>7__wrap1
IL_0055: call !0 System.Collections.Generic.List`1/Enumerator<ZNetPeer>::get_Current()
IL_005a: stloc.3
IL_005b: ldloc.3
IL_005c: call ZNet ZNet::get_instance()
IL_0061: callvirt ZNetPeer ZNet::GetServerPeer()
IL_0066: beq.s IL_00a0
IL_0068: ldloc.3
IL_0069: ldfld ZRpc ZNetPeer::m_rpc
IL_006e: ldstr "ClientConfigReceiver."
IL_0073: call System.String neobotics.ModSdk.ServerConfiguration::GetPluginGuid()
IL_0078: call System.String System.String::Concat(System.String,System.String)
IL_007d: ldc.i4.1
IL_007e: newarr System.Object
IL_0083: dup
IL_0084: ldc.i4.0
IL_0085: ldarg.0
IL_0086: ldfld ZPackage neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::zpkg
IL_008b: stelem.ref
IL_008c: callvirt System.Void ZRpc::Invoke(System.String,System.Object[])
IL_0091: ldsfld neobotics.ModSdk.Logging neobotics.ModSdk.ServerConfiguration::Log
IL_0096: ldstr "Invoked ClientConfigReceiver on peer"
IL_009b: callvirt System.Void neobotics.ModSdk.Logging::Trace(System.String)
IL_00a0: ldarg.0
IL_00a1: ldnull
IL_00a2: stfld System.Object neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::<>2__current
IL_00a7: ldarg.0
IL_00a8: ldc.i4.1
IL_00a9: stfld System.Int32 neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::<>1__state
IL_00ae: ldc.i4.1
IL_00af: stloc.0
IL_00b0: leave.s IL_00e4
IL_00b2: ldarg.0
IL_00b3: ldc.i4.s -3
IL_00b5: stfld System.Int32 neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::<>1__state
IL_00ba: ldarg.0
IL_00bb: ldflda System.Collections.Generic.List`1/Enumerator<ZNetPeer> neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::<>7__wrap1
IL_00c0: call System.Boolean System.Collections.Generic.List`1/Enumerator<ZNetPeer>::MoveNext()
IL_00c5: brtrue.s IL_004f
IL_00c7: ldarg.0
IL_00c8: call System.Void neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::<>m__Finally1()
IL_00cd: ldarg.0
IL_00ce: ldflda System.Collections.Generic.List`1/Enumerator<ZNetPeer> neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::<>7__wrap1
IL_00d3: initobj System.Collections.Generic.List`1/Enumerator<ZNetPeer>
IL_00d9: ldc.i4.0
IL_00da: stloc.0
IL_00db: leave.s IL_00e4
IL_00dd: ldarg.0
IL_00de: call System.Void neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::System.IDisposable.Dispose()
IL_00e3: endfinally
IL_00e4: ldloc.0
IL_00e5: ret
// EH Fault: 0 - 221 => 221 - 228

// System.Void neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::<>m__Finally1()
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.m1
IL_0002: stfld System.Int32 neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::<>1__state
IL_0007: ldarg.0
IL_0008: ldflda System.Collections.Generic.List`1/Enumerator<ZNetPeer> neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::<>7__wrap1
IL_000d: constrained. System.Collections.Generic.List`1/Enumerator<ZNetPeer>
IL_0013: callvirt System.Void System.IDisposable::Dispose()
IL_0018: ret

// System.Object neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::System.Collections.Generic.IEnumerator<System.Object>.get_Current()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Object neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::<>2__current
IL_0006: ret

// System.Void neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::System.Collections.IEnumerator.Reset()
.locals 
IL_0000: newobj System.Void System.NotSupportedException::.ctor()
IL_0005: throw

// System.Object neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::System.Collections.IEnumerator.get_Current()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Object neobotics.ModSdk.ServerConfiguration/<Co_BroadcastConfig>d__21::<>2__current
IL_0006: ret

// TEnum neobotics.ModSdk.Utils::Guardrails(System.String,TEnum)
.locals TEnum
IL_0000: ldarg.0
IL_0001: ldc.i4.1
IL_0002: ldloca.s V_0
IL_0004: call System.Boolean System.Enum::TryParse<TEnum>(System.String,System.Boolean,!!0&)
IL_0009: brfalse.s IL_000d
IL_000b: ldloc.0
IL_000c: ret
IL_000d: ldarg.1
IL_000e: ret

// System.Int32 neobotics.ModSdk.Utils::Guardrails(System.Int32,System.Int32,System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: bge.s IL_0006
IL_0004: ldarg.1
IL_0005: ret
IL_0006: ldarg.0
IL_0007: ldarg.2
IL_0008: ble.s IL_000c
IL_000a: ldarg.2
IL_000b: ret
IL_000c: ldarg.0
IL_000d: ret

// System.String neobotics.ModSdk.Utils::Truncate(System.String,System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: brtrue.s IL_0005
IL_0003: ldnull
IL_0004: ret
IL_0005: ldarg.0
IL_0006: callvirt System.Int32 System.String::get_Length()
IL_000b: ldarg.1
IL_000c: bgt.s IL_0010
IL_000e: ldarg.0
IL_000f: ret
IL_0010: ldarg.0
IL_0011: ldc.i4.0
IL_0012: ldarg.1
IL_0013: callvirt System.String System.String::Substring(System.Int32,System.Int32)
IL_0018: ret

// System.Void neobotics.ModSdk.Utils::GetCharactersInRangeXZ(UnityEngine.Vector3,System.Single,System.Collections.Generic.List`1<Character>)
.locals System.Single, System.Collections.Generic.List`1/Enumerator<Character>, Character
IL_0000: ldarg.1
IL_0001: ldarg.1
IL_0002: mul
IL_0003: stloc.0
IL_0004: ldsfld System.Collections.Generic.List`1<Character> Character::s_characters
IL_0009: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Character>::GetEnumerator()
IL_000e: stloc.1
IL_000f: br.s IL_0034
IL_0011: ldloca.s V_1
IL_0013: call !0 System.Collections.Generic.List`1/Enumerator<Character>::get_Current()
IL_0018: stloc.2
IL_0019: ldloc.2
IL_001a: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_001f: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0024: ldarg.0
IL_0025: call System.Single neobotics.ModSdk.Utils::DistanceSqrXZ(UnityEngine.Vector3,UnityEngine.Vector3)
IL_002a: ldloc.0
IL_002b: bge.un.s IL_0034
IL_002d: ldarg.2
IL_002e: ldloc.2
IL_002f: callvirt System.Void System.Collections.Generic.List`1<Character>::Add(!0)
IL_0034: ldloca.s V_1
IL_0036: call System.Boolean System.Collections.Generic.List`1/Enumerator<Character>::MoveNext()
IL_003b: brtrue.s IL_0011
IL_003d: leave.s IL_004d
IL_003f: ldloca.s V_1
IL_0041: constrained. System.Collections.Generic.List`1/Enumerator<Character>
IL_0047: callvirt System.Void System.IDisposable::Dispose()
IL_004c: endfinally
IL_004d: ret
// EH Finally: 15 - 63 => 63 - 77

// Minimap/PinData neobotics.ModSdk.Utils::GetClosestPin(UnityEngine.Vector3,System.Single,Minimap/PinType)
.locals Minimap/PinData, System.Single, System.Single, System.Collections.Generic.List`1/Enumerator<Minimap/PinData>, Minimap/PinData, System.Single
IL_0000: ldnull
IL_0001: stloc.0
IL_0002: ldc.r4 3.4028235E+38
IL_0007: stloc.1
IL_0008: ldarg.1
IL_0009: ldarg.1
IL_000a: mul
IL_000b: stloc.2
IL_000c: call Minimap Minimap::get_instance()
IL_0011: ldnull
IL_0012: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0017: brfalse IL_00d6
IL_001c: call Minimap Minimap::get_instance()
IL_0021: ldfld System.Collections.Generic.List`1<Minimap/PinData> Minimap::m_pins
IL_0026: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Minimap/PinData>::GetEnumerator()
IL_002b: stloc.3
IL_002c: br IL_00ba
IL_0031: ldloca.s V_3
IL_0033: call !0 System.Collections.Generic.List`1/Enumerator<Minimap/PinData>::get_Current()
IL_0038: stloc.s V_4
IL_003a: ldloc.s V_4
IL_003c: ldfld UnityEngine.RectTransform Minimap/PinData::m_uiElement
IL_0041: ldnull
IL_0042: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0047: brfalse.s IL_00ba
IL_0049: ldloc.s V_4
IL_004b: ldfld Minimap/PinType Minimap/PinData::m_type
IL_0050: ldarg.2
IL_0051: bne.un.s IL_00ba
IL_0053: ldarg.0
IL_0054: ldloc.s V_4
IL_0056: ldfld UnityEngine.Vector3 Minimap/PinData::m_pos
IL_005b: call System.Single neobotics.ModSdk.Utils::DistanceSqrXZ(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0060: stloc.s V_5
IL_0062: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::get_Instance()
IL_0067: callvirt neobotics.ModSdk.Logging/LogLevels neobotics.ModSdk.Logging::get_LogLevel()
IL_006c: ldc.i4.4
IL_006d: blt.s IL_009b
IL_006f: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::get_Instance()
IL_0074: ldstr "Testing for pin at {0} within radius {1} from {2}"
IL_0079: ldloc.s V_4
IL_007b: ldfld UnityEngine.Vector3 Minimap/PinData::m_pos
IL_0080: box UnityEngine.Vector3
IL_0085: ldarg.1
IL_0086: box System.Single
IL_008b: ldarg.0
IL_008c: box UnityEngine.Vector3
IL_0091: call System.String System.String::Format(System.String,System.Object,System.Object,System.Object)
IL_0096: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_009b: ldloc.s V_5
IL_009d: ldloc.2
IL_009e: bge.un.s IL_00ba
IL_00a0: ldloc.s V_5
IL_00a2: ldloc.1
IL_00a3: bge.un.s IL_00ba
IL_00a5: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::get_Instance()
IL_00aa: ldstr "Pin is within radius"
IL_00af: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_00b4: ldloc.s V_5
IL_00b6: stloc.1
IL_00b7: ldloc.s V_4
IL_00b9: stloc.0
IL_00ba: ldloca.s V_3
IL_00bc: call System.Boolean System.Collections.Generic.List`1/Enumerator<Minimap/PinData>::MoveNext()
IL_00c1: brtrue IL_0031
IL_00c6: leave.s IL_00d6
IL_00c8: ldloca.s V_3
IL_00ca: constrained. System.Collections.Generic.List`1/Enumerator<Minimap/PinData>
IL_00d0: callvirt System.Void System.IDisposable::Dispose()
IL_00d5: endfinally
IL_00d6: ldloc.0
IL_00d7: ret
// EH Finally: 44 - 200 => 200 - 214

// System.Single neobotics.ModSdk.Utils::DistanceSqr(UnityEngine.Vector3,UnityEngine.Vector3)
.locals UnityEngine.Vector3
IL_0000: ldarg.1
IL_0001: ldarg.0
IL_0002: call UnityEngine.Vector3 UnityEngine.Vector3::op_Subtraction(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0007: stloc.0
IL_0008: ldloca.s V_0
IL_000a: call System.Single UnityEngine.Vector3::get_sqrMagnitude()
IL_000f: ret

// System.Single neobotics.ModSdk.Utils::DistanceSqrXZ(UnityEngine.Vector3,UnityEngine.Vector3)
.locals System.Single
IL_0000: ldarg.1
IL_0001: ldfld System.Single UnityEngine.Vector3::x
IL_0006: ldarg.0
IL_0007: ldfld System.Single UnityEngine.Vector3::x
IL_000c: sub
IL_000d: ldarg.1
IL_000e: ldfld System.Single UnityEngine.Vector3::z
IL_0013: ldarg.0
IL_0014: ldfld System.Single UnityEngine.Vector3::z
IL_0019: sub
IL_001a: stloc.0
IL_001b: dup
IL_001c: mul
IL_001d: ldloc.0
IL_001e: ldloc.0
IL_001f: mul
IL_0020: add
IL_0021: ret

// UnityEngine.Vector3 neobotics.ModSdk.Utils::ClosestPoint(UnityEngine.Vector3,System.Collections.Generic.IEnumerable`1<T>,System.Func`2<T,UnityEngine.Vector3>)
.locals UnityEngine.Vector3, System.Single, System.Collections.Generic.IEnumerator`1<T>, T, UnityEngine.Vector3, System.Single, UnityEngine.Vector3
IL_0000: ldloca.s V_0
IL_0002: initobj UnityEngine.Vector3
IL_0008: ldc.r4 3.4028235E+38
IL_000d: stloc.1
IL_000e: ldarg.1
IL_000f: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<T>::GetEnumerator()
IL_0014: stloc.2
IL_0015: br.s IL_0045
IL_0017: ldloc.2
IL_0018: callvirt !0 System.Collections.Generic.IEnumerator`1<T>::get_Current()
IL_001d: stloc.3
IL_001e: ldarg.2
IL_001f: ldloc.3
IL_0020: callvirt !1 System.Func`2<T,UnityEngine.Vector3>::Invoke(!0)
IL_0025: stloc.s V_4
IL_0027: ldloc.s V_4
IL_0029: ldarg.0
IL_002a: call UnityEngine.Vector3 UnityEngine.Vector3::op_Subtraction(UnityEngine.Vector3,UnityEngine.Vector3)
IL_002f: stloc.s V_6
IL_0031: ldloca.s V_6
IL_0033: call System.Single UnityEngine.Vector3::get_sqrMagnitude()
IL_0038: stloc.s V_5
IL_003a: ldloc.s V_5
IL_003c: ldloc.1
IL_003d: bge.un.s IL_0045
IL_003f: ldloc.s V_5
IL_0041: stloc.1
IL_0042: ldloc.s V_4
IL_0044: stloc.0
IL_0045: ldloc.2
IL_0046: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_004b: brtrue.s IL_0017
IL_004d: leave.s IL_0059
IL_004f: ldloc.2
IL_0050: brfalse.s IL_0058
IL_0052: ldloc.2
IL_0053: callvirt System.Void System.IDisposable::Dispose()
IL_0058: endfinally
IL_0059: ldloc.0
IL_005a: ret
// EH Finally: 21 - 79 => 79 - 89

// T neobotics.ModSdk.Utils::ClosestObject(UnityEngine.Vector3,System.Collections.Generic.IEnumerable`1<T>,System.Func`2<T,UnityEngine.Vector3>)
.locals T, System.Single, System.Collections.Generic.IEnumerator`1<T>, T, System.Single, UnityEngine.Vector3
IL_0000: ldloca.s V_0
IL_0002: initobj T
IL_0008: ldc.r4 3.4028235E+38
IL_000d: stloc.1
IL_000e: ldarg.1
IL_000f: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<T>::GetEnumerator()
IL_0014: stloc.2
IL_0015: br.s IL_0040
IL_0017: ldloc.2
IL_0018: callvirt !0 System.Collections.Generic.IEnumerator`1<T>::get_Current()
IL_001d: stloc.3
IL_001e: ldarg.2
IL_001f: ldloc.3
IL_0020: callvirt !1 System.Func`2<T,UnityEngine.Vector3>::Invoke(!0)
IL_0025: ldarg.0
IL_0026: call UnityEngine.Vector3 UnityEngine.Vector3::op_Subtraction(UnityEngine.Vector3,UnityEngine.Vector3)
IL_002b: stloc.s V_5
IL_002d: ldloca.s V_5
IL_002f: call System.Single UnityEngine.Vector3::get_sqrMagnitude()
IL_0034: stloc.s V_4
IL_0036: ldloc.s V_4
IL_0038: ldloc.1
IL_0039: bge.un.s IL_0040
IL_003b: ldloc.s V_4
IL_003d: stloc.1
IL_003e: ldloc.3
IL_003f: stloc.0
IL_0040: ldloc.2
IL_0041: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0046: brtrue.s IL_0017
IL_0048: leave.s IL_0054
IL_004a: ldloc.2
IL_004b: brfalse.s IL_0053
IL_004d: ldloc.2
IL_004e: callvirt System.Void System.IDisposable::Dispose()
IL_0053: endfinally
IL_0054: ldloc.0
IL_0055: ret
// EH Finally: 21 - 74 => 74 - 84

// UnityEngine.Vector3 neobotics.ModSdk.Utils::ClosestPointXZ(UnityEngine.Vector3,System.Collections.Generic.IEnumerable`1<T>,System.Func`2<T,UnityEngine.Vector3>)
.locals UnityEngine.Vector3, System.Single, System.Collections.Generic.IEnumerator`1<T>, T, UnityEngine.Vector3, System.Single
IL_0000: ldloca.s V_0
IL_0002: initobj UnityEngine.Vector3
IL_0008: ldc.r4 3.4028235E+38
IL_000d: stloc.1
IL_000e: ldarg.1
IL_000f: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<T>::GetEnumerator()
IL_0014: stloc.2
IL_0015: br.s IL_003c
IL_0017: ldloc.2
IL_0018: callvirt !0 System.Collections.Generic.IEnumerator`1<T>::get_Current()
IL_001d: stloc.3
IL_001e: ldarg.2
IL_001f: ldloc.3
IL_0020: callvirt !1 System.Func`2<T,UnityEngine.Vector3>::Invoke(!0)
IL_0025: stloc.s V_4
IL_0027: ldloc.s V_4
IL_0029: ldarg.0
IL_002a: call System.Single neobotics.ModSdk.Utils::DistanceSqrXZ(UnityEngine.Vector3,UnityEngine.Vector3)
IL_002f: stloc.s V_5
IL_0031: ldloc.s V_5
IL_0033: ldloc.1
IL_0034: bge.un.s IL_003c
IL_0036: ldloc.s V_5
IL_0038: stloc.1
IL_0039: ldloc.s V_4
IL_003b: stloc.0
IL_003c: ldloc.2
IL_003d: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0042: brtrue.s IL_0017
IL_0044: leave.s IL_0050
IL_0046: ldloc.2
IL_0047: brfalse.s IL_004f
IL_0049: ldloc.2
IL_004a: callvirt System.Void System.IDisposable::Dispose()
IL_004f: endfinally
IL_0050: ldloc.0
IL_0051: ret
// EH Finally: 21 - 70 => 70 - 80

// T neobotics.ModSdk.Utils::ClosestObjectXZ(UnityEngine.Vector3,System.Collections.Generic.IEnumerable`1<T>,System.Func`2<T,UnityEngine.Vector3>)
.locals T, System.Single, System.Collections.Generic.IEnumerator`1<T>, T, System.Single
IL_0000: ldloca.s V_0
IL_0002: initobj T
IL_0008: ldc.r4 3.4028235E+38
IL_000d: stloc.1
IL_000e: ldarg.1
IL_000f: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<T>::GetEnumerator()
IL_0014: stloc.2
IL_0015: br.s IL_0037
IL_0017: ldloc.2
IL_0018: callvirt !0 System.Collections.Generic.IEnumerator`1<T>::get_Current()
IL_001d: stloc.3
IL_001e: ldarg.2
IL_001f: ldloc.3
IL_0020: callvirt !1 System.Func`2<T,UnityEngine.Vector3>::Invoke(!0)
IL_0025: ldarg.0
IL_0026: call System.Single neobotics.ModSdk.Utils::DistanceSqrXZ(UnityEngine.Vector3,UnityEngine.Vector3)
IL_002b: stloc.s V_4
IL_002d: ldloc.s V_4
IL_002f: ldloc.1
IL_0030: bge.un.s IL_0037
IL_0032: ldloc.s V_4
IL_0034: stloc.1
IL_0035: ldloc.3
IL_0036: stloc.0
IL_0037: ldloc.2
IL_0038: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_003d: brtrue.s IL_0017
IL_003f: leave.s IL_004b
IL_0041: ldloc.2
IL_0042: brfalse.s IL_004a
IL_0044: ldloc.2
IL_0045: callvirt System.Void System.IDisposable::Dispose()
IL_004a: endfinally
IL_004b: ldloc.0
IL_004c: ret
// EH Finally: 21 - 65 => 65 - 75

// System.Single neobotics.ModSdk.Utils::Guardrails(System.Single,System.Single,System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: bge.un.s IL_0006
IL_0004: ldarg.1
IL_0005: ret
IL_0006: ldarg.0
IL_0007: ldarg.2
IL_0008: ble.un.s IL_000c
IL_000a: ldarg.2
IL_000b: ret
IL_000c: ldarg.0
IL_000d: ret

// System.String neobotics.ModSdk.Utils::UnClonifiedName(System.String)
.locals System.Int32
IL_0000: ldarg.0
IL_0001: brtrue.s IL_0005
IL_0003: ldnull
IL_0004: ret
IL_0005: ldarg.0
IL_0006: ldstr "(Clone)"
IL_000b: callvirt System.Int32 System.String::IndexOf(System.String)
IL_0010: stloc.0
IL_0011: ldloc.0
IL_0012: ldc.i4.1
IL_0013: bge.s IL_0017
IL_0015: ldarg.0
IL_0016: ret
IL_0017: ldarg.0
IL_0018: ldc.i4.0
IL_0019: ldloc.0
IL_001a: callvirt System.String System.String::Substring(System.Int32,System.Int32)
IL_001f: ret

// System.Void neobotics.ModSdk.Utils::SetTranslator(System.Int32,System.String)
.locals 
IL_0000: call Localization Localization::get_instance()
IL_0005: ldstr "skill_"
IL_000a: ldarga.s id
IL_000c: call System.String System.Int32::ToString()
IL_0011: call System.String System.String::Concat(System.String,System.String)
IL_0016: ldarg.1
IL_0017: callvirt System.Void Localization::AddWord(System.String,System.String)
IL_001c: ret

// System.String neobotics.ModSdk.Utils::GetTranslated(System.Int32)
.locals 
IL_0000: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::GetLogger()
IL_0005: ldstr "Got translation for id {0} to {1}"
IL_000a: ldarg.0
IL_000b: box System.Int32
IL_0010: call Localization Localization::get_instance()
IL_0015: ldstr "skill_"
IL_001a: ldarga.s id
IL_001c: call System.String System.Int32::ToString()
IL_0021: call System.String System.String::Concat(System.String,System.String)
IL_0026: callvirt System.String Localization::Localize(System.String)
IL_002b: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_0030: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0035: call Localization Localization::get_instance()
IL_003a: ldstr "$skill_"
IL_003f: ldarga.s id
IL_0041: call System.String System.Int32::ToString()
IL_0046: call System.String System.String::Concat(System.String,System.String)
IL_004b: callvirt System.String Localization::Localize(System.String)
IL_0050: ret

// System.String neobotics.ModSdk.Utils::GetAssemblyPathedFile(System.String)
.locals 
IL_0000: call System.Reflection.Assembly System.Reflection.Assembly::GetExecutingAssembly()
IL_0005: callvirt System.String System.Reflection.Assembly::get_Location()
IL_000a: newobj System.Void System.IO.FileInfo::.ctor(System.String)
IL_000f: callvirt System.String System.IO.FileInfo::get_DirectoryName()
IL_0014: ldc.i4.s 92
IL_0016: ldc.i4.s 47
IL_0018: callvirt System.String System.String::Replace(System.Char,System.Char)
IL_001d: ldstr "/"
IL_0022: ldarg.0
IL_0023: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0028: ret

// UnityEngine.Sprite neobotics.ModSdk.Utils::GetPrefabIcon(System.String)
.locals UnityEngine.Sprite, UnityEngine.GameObject, ItemDrop
IL_0000: ldnull
IL_0001: stloc.0
IL_0002: ldarg.0
IL_0003: call UnityEngine.GameObject neobotics.ModSdk.Utils::GetPrefab(System.String)
IL_0008: stloc.1
IL_0009: ldloc.1
IL_000a: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_000f: brfalse.s IL_0027
IL_0011: ldloc.1
IL_0012: ldloca.s V_2
IL_0014: callvirt System.Boolean UnityEngine.GameObject::TryGetComponent<ItemDrop>(!!0&)
IL_0019: brfalse.s IL_0027
IL_001b: ldloc.2
IL_001c: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0021: callvirt UnityEngine.Sprite ItemDrop/ItemData::GetIcon()
IL_0026: stloc.0
IL_0027: ldloc.0
IL_0028: ret

// Player neobotics.ModSdk.Utils::GetPlayerByZDOID(ZDOID)
.locals System.Collections.Generic.List`1/Enumerator<Player>, Player, ZDOID, Player
IL_0000: call System.Collections.Generic.List`1<Player> Player::GetAllPlayers()
IL_0005: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Player>::GetEnumerator()
IL_000a: stloc.0
IL_000b: br.s IL_002a
IL_000d: ldloca.s V_0
IL_000f: call !0 System.Collections.Generic.List`1/Enumerator<Player>::get_Current()
IL_0014: stloc.1
IL_0015: ldloc.1
IL_0016: callvirt ZDOID Character::GetZDOID()
IL_001b: stloc.2
IL_001c: ldloca.s V_2
IL_001e: ldarg.0
IL_001f: call System.Boolean ZDOID::Equals(ZDOID)
IL_0024: brfalse.s IL_002a
IL_0026: ldloc.1
IL_0027: stloc.3
IL_0028: leave.s IL_0045
IL_002a: ldloca.s V_0
IL_002c: call System.Boolean System.Collections.Generic.List`1/Enumerator<Player>::MoveNext()
IL_0031: brtrue.s IL_000d
IL_0033: leave.s IL_0043
IL_0035: ldloca.s V_0
IL_0037: constrained. System.Collections.Generic.List`1/Enumerator<Player>
IL_003d: callvirt System.Void System.IDisposable::Dispose()
IL_0042: endfinally
IL_0043: ldnull
IL_0044: ret
IL_0045: ldloc.3
IL_0046: ret
// EH Finally: 11 - 53 => 53 - 67

// Character neobotics.ModSdk.Utils::GetCharacterByZDOID(System.String)
.locals System.Collections.Generic.List`1/Enumerator<Character>, Character, ZDOID, Character
IL_0000: call System.Collections.Generic.List`1<Character> Character::GetAllCharacters()
IL_0005: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Character>::GetEnumerator()
IL_000a: stloc.0
IL_000b: br.s IL_0035
IL_000d: ldloca.s V_0
IL_000f: call !0 System.Collections.Generic.List`1/Enumerator<Character>::get_Current()
IL_0014: stloc.1
IL_0015: ldloc.1
IL_0016: callvirt ZDOID Character::GetZDOID()
IL_001b: stloc.2
IL_001c: ldloca.s V_2
IL_001e: constrained. ZDOID
IL_0024: callvirt System.String System.Object::ToString()
IL_0029: ldarg.0
IL_002a: callvirt System.Boolean System.String::Equals(System.String)
IL_002f: brfalse.s IL_0035
IL_0031: ldloc.1
IL_0032: stloc.3
IL_0033: leave.s IL_0050
IL_0035: ldloca.s V_0
IL_0037: call System.Boolean System.Collections.Generic.List`1/Enumerator<Character>::MoveNext()
IL_003c: brtrue.s IL_000d
IL_003e: leave.s IL_004e
IL_0040: ldloca.s V_0
IL_0042: constrained. System.Collections.Generic.List`1/Enumerator<Character>
IL_0048: callvirt System.Void System.IDisposable::Dispose()
IL_004d: endfinally
IL_004e: ldnull
IL_004f: ret
IL_0050: ldloc.3
IL_0051: ret
// EH Finally: 11 - 64 => 64 - 78

// Character neobotics.ModSdk.Utils::GetCharacterByZDOID(ZDOID)
.locals System.Collections.Generic.List`1/Enumerator<Character>, Character, ZDOID, Character
IL_0000: call System.Collections.Generic.List`1<Character> Character::GetAllCharacters()
IL_0005: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Character>::GetEnumerator()
IL_000a: stloc.0
IL_000b: br.s IL_002a
IL_000d: ldloca.s V_0
IL_000f: call !0 System.Collections.Generic.List`1/Enumerator<Character>::get_Current()
IL_0014: stloc.1
IL_0015: ldloc.1
IL_0016: callvirt ZDOID Character::GetZDOID()
IL_001b: stloc.2
IL_001c: ldloca.s V_2
IL_001e: ldarg.0
IL_001f: call System.Boolean ZDOID::Equals(ZDOID)
IL_0024: brfalse.s IL_002a
IL_0026: ldloc.1
IL_0027: stloc.3
IL_0028: leave.s IL_0045
IL_002a: ldloca.s V_0
IL_002c: call System.Boolean System.Collections.Generic.List`1/Enumerator<Character>::MoveNext()
IL_0031: brtrue.s IL_000d
IL_0033: leave.s IL_0043
IL_0035: ldloca.s V_0
IL_0037: constrained. System.Collections.Generic.List`1/Enumerator<Character>
IL_003d: callvirt System.Void System.IDisposable::Dispose()
IL_0042: endfinally
IL_0043: ldnull
IL_0044: ret
IL_0045: ldloc.3
IL_0046: ret
// EH Finally: 11 - 53 => 53 - 67

// ZNetPeer neobotics.ModSdk.Utils::GetPeerByRPC(ZRpc)
.locals System.Collections.Generic.List`1/Enumerator<ZNetPeer>, ZNetPeer, ZNetPeer
IL_0000: call ZNet ZNet::get_instance()
IL_0005: callvirt System.Collections.Generic.List`1<ZNetPeer> ZNet::GetPeers()
IL_000a: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<ZNetPeer>::GetEnumerator()
IL_000f: stloc.0
IL_0010: br.s IL_0027
IL_0012: ldloca.s V_0
IL_0014: call !0 System.Collections.Generic.List`1/Enumerator<ZNetPeer>::get_Current()
IL_0019: stloc.1
IL_001a: ldloc.1
IL_001b: ldfld ZRpc ZNetPeer::m_rpc
IL_0020: ldarg.0
IL_0021: bne.un.s IL_0027
IL_0023: ldloc.1
IL_0024: stloc.2
IL_0025: leave.s IL_0042
IL_0027: ldloca.s V_0
IL_0029: call System.Boolean System.Collections.Generic.List`1/Enumerator<ZNetPeer>::MoveNext()
IL_002e: brtrue.s IL_0012
IL_0030: leave.s IL_0040
IL_0032: ldloca.s V_0
IL_0034: constrained. System.Collections.Generic.List`1/Enumerator<ZNetPeer>
IL_003a: callvirt System.Void System.IDisposable::Dispose()
IL_003f: endfinally
IL_0040: ldnull
IL_0041: ret
IL_0042: ldloc.2
IL_0043: ret
// EH Finally: 16 - 50 => 50 - 64

// System.Collections.Generic.List`1<UnityEngine.GameObject> neobotics.ModSdk.Utils::GetGameObjectsOfType(System.Type)
.locals System.Collections.Generic.List`1<UnityEngine.GameObject>, UnityEngine.Object[], System.Int32, UnityEngine.Object
IL_0000: newobj System.Void System.Collections.Generic.List`1<UnityEngine.GameObject>::.ctor()
IL_0005: stloc.0
IL_0006: ldarg.0
IL_0007: ldc.i4.0
IL_0008: call UnityEngine.Object[] UnityEngine.Object::FindObjectsByType(System.Type,UnityEngine.FindObjectsSortMode)
IL_000d: stloc.1
IL_000e: ldc.i4.0
IL_000f: stloc.2
IL_0010: br.s IL_002b
IL_0012: ldloc.1
IL_0013: ldloc.2
IL_0014: ldelem.ref
IL_0015: stloc.3
IL_0016: ldloc.0
IL_0017: ldloc.3
IL_0018: castclass UnityEngine.Component
IL_001d: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0022: callvirt System.Void System.Collections.Generic.List`1<UnityEngine.GameObject>::Add(!0)
IL_0027: ldloc.2
IL_0028: ldc.i4.1
IL_0029: add
IL_002a: stloc.2
IL_002b: ldloc.2
IL_002c: ldloc.1
IL_002d: ldlen
IL_002e: conv.i4
IL_002f: blt.s IL_0012
IL_0031: ldloc.0
IL_0032: ret

// UnityEngine.GameObject neobotics.ModSdk.Utils::GetClosestGameObjectOfType(System.Type,UnityEngine.Vector3,System.Single)
.locals System.Collections.Generic.List`1<UnityEngine.GameObject>
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: ldarg.2
IL_0003: call System.Collections.Generic.List`1<UnityEngine.GameObject> neobotics.ModSdk.Utils::GetGameObjectsOfTypeInRangeByDistance(System.Type,UnityEngine.Vector3,System.Single)
IL_0008: stloc.0
IL_0009: ldloc.0
IL_000a: brtrue.s IL_000e
IL_000c: ldnull
IL_000d: ret
IL_000e: ldloc.0
IL_000f: ldc.i4.0
IL_0010: callvirt !0 System.Collections.Generic.List`1<UnityEngine.GameObject>::get_Item(System.Int32)
IL_0015: ret

// System.Collections.Generic.List`1<UnityEngine.GameObject> neobotics.ModSdk.Utils::GetGameObjectsOfTypeInRangeByDistance(System.Type,UnityEngine.Vector3,System.Single)
.locals System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Single>>, System.Collections.Generic.List`1<UnityEngine.GameObject>, System.Collections.Generic.List`1/Enumerator<UnityEngine.GameObject>, UnityEngine.GameObject
IL_0000: newobj System.Void System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Single>>::.ctor()
IL_0005: stloc.0
IL_0006: ldarg.0
IL_0007: ldarg.1
IL_0008: ldarg.2
IL_0009: call System.Collections.Generic.List`1<UnityEngine.GameObject> neobotics.ModSdk.Utils::GetGameObjectsOfTypeInRange(System.Type,UnityEngine.Vector3,System.Single)
IL_000e: stloc.1
IL_000f: ldloc.1
IL_0010: callvirt System.Int32 System.Collections.Generic.List`1<UnityEngine.GameObject>::get_Count()
IL_0015: ldc.i4.0
IL_0016: ble IL_00ad
IL_001b: ldloc.1
IL_001c: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<UnityEngine.GameObject>::GetEnumerator()
IL_0021: stloc.2
IL_0022: br.s IL_0049
IL_0024: ldloca.s V_2
IL_0026: call !0 System.Collections.Generic.List`1/Enumerator<UnityEngine.GameObject>::get_Current()
IL_002b: stloc.3
IL_002c: ldloc.0
IL_002d: ldloc.3
IL_002e: ldloc.3
IL_002f: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0034: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0039: ldarg.1
IL_003a: call System.Single UnityEngine.Vector3::Distance(UnityEngine.Vector3,UnityEngine.Vector3)
IL_003f: newobj System.Void System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Single>::.ctor(!0,!1)
IL_0044: callvirt System.Void System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Single>>::Add(!0)
IL_0049: ldloca.s V_2
IL_004b: call System.Boolean System.Collections.Generic.List`1/Enumerator<UnityEngine.GameObject>::MoveNext()
IL_0050: brtrue.s IL_0024
IL_0052: leave.s IL_0062
IL_0054: ldloca.s V_2
IL_0056: constrained. System.Collections.Generic.List`1/Enumerator<UnityEngine.GameObject>
IL_005c: callvirt System.Void System.IDisposable::Dispose()
IL_0061: endfinally
IL_0062: ldloc.0
IL_0063: ldsfld System.Comparison`1<System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Single>> neobotics.ModSdk.Utils/<>c::<>9__23_0
IL_0068: dup
IL_0069: brtrue.s IL_0082
IL_006b: pop
IL_006c: ldsfld neobotics.ModSdk.Utils/<>c neobotics.ModSdk.Utils/<>c::<>9
IL_0071: ldftn System.Int32 neobotics.ModSdk.Utils/<>c::<GetGameObjectsOfTypeInRangeByDistance>b__23_0(System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Single>,System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Single>)
IL_0077: newobj System.Void System.Comparison`1<System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Single>>::.ctor(System.Object,System.IntPtr)
IL_007c: dup
IL_007d: stsfld System.Comparison`1<System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Single>> neobotics.ModSdk.Utils/<>c::<>9__23_0
IL_0082: callvirt System.Void System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Single>>::Sort(System.Comparison`1<!0>)
IL_0087: ldloc.0
IL_0088: ldsfld System.Converter`2<System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Single>,UnityEngine.GameObject> neobotics.ModSdk.Utils/<>c::<>9__23_1
IL_008d: dup
IL_008e: brtrue.s IL_00a7
IL_0090: pop
IL_0091: ldsfld neobotics.ModSdk.Utils/<>c neobotics.ModSdk.Utils/<>c::<>9
IL_0096: ldftn UnityEngine.GameObject neobotics.ModSdk.Utils/<>c::<GetGameObjectsOfTypeInRangeByDistance>b__23_1(System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Single>)
IL_009c: newobj System.Void System.Converter`2<System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Single>,UnityEngine.GameObject>::.ctor(System.Object,System.IntPtr)
IL_00a1: dup
IL_00a2: stsfld System.Converter`2<System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Single>,UnityEngine.GameObject> neobotics.ModSdk.Utils/<>c::<>9__23_1
IL_00a7: callvirt System.Collections.Generic.List`1<!!0> System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Single>>::ConvertAll<UnityEngine.GameObject>(System.Converter`2<!0,!!0>)
IL_00ac: ret
IL_00ad: ldnull
IL_00ae: ret
// EH Finally: 34 - 84 => 84 - 98

// System.Collections.Generic.List`1<UnityEngine.GameObject> neobotics.ModSdk.Utils::GetGameObjectsOfTypeInRange(System.Type,UnityEngine.Vector3,System.Single)
.locals neobotics.ModSdk.Utils/<>c__DisplayClass24_0
IL_0000: newobj System.Void neobotics.ModSdk.Utils/<>c__DisplayClass24_0::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldarg.1
IL_0008: stfld UnityEngine.Vector3 neobotics.ModSdk.Utils/<>c__DisplayClass24_0::point
IL_000d: ldloc.0
IL_000e: ldarg.2
IL_000f: ldarg.2
IL_0010: mul
IL_0011: stfld System.Single neobotics.ModSdk.Utils/<>c__DisplayClass24_0::radiusSq
IL_0016: ldarg.0
IL_0017: call System.Collections.Generic.List`1<UnityEngine.GameObject> neobotics.ModSdk.Utils::GetGameObjectsOfType(System.Type)
IL_001c: ldloc.0
IL_001d: ldftn System.Boolean neobotics.ModSdk.Utils/<>c__DisplayClass24_0::<GetGameObjectsOfTypeInRange>b__0(UnityEngine.GameObject)
IL_0023: newobj System.Void System.Func`2<UnityEngine.GameObject,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0028: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<UnityEngine.GameObject>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_002d: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<UnityEngine.GameObject>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0032: ret

// System.Single neobotics.ModSdk.Utils::GetPointDepth(UnityEngine.Vector3)
.locals 
IL_0000: call ZoneSystem ZoneSystem::get_instance()
IL_0005: ldfld System.Single ZoneSystem::m_waterLevel
IL_000a: ldarg.0
IL_000b: call System.Single neobotics.ModSdk.Utils::GetSolidHeight(UnityEngine.Vector3)
IL_0010: sub
IL_0011: ret

// System.Collections.Generic.List`1<System.String> neobotics.ModSdk.Utils::GetDelimitedStringAsList(System.String,System.Char)
.locals System.Collections.Generic.List`1<System.String>, System.String[], System.Int32, System.String
IL_0000: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor()
IL_0005: stloc.0
IL_0006: ldarg.0
IL_0007: ldc.i4.1
IL_0008: newarr System.Char
IL_000d: dup
IL_000e: ldc.i4.0
IL_000f: ldarg.1
IL_0010: stelem.i2
IL_0011: ldc.i4.1
IL_0012: callvirt System.String[] System.String::Split(System.Char[],System.StringSplitOptions)
IL_0017: stloc.1
IL_0018: ldc.i4.0
IL_0019: stloc.2
IL_001a: br.s IL_0030
IL_001c: ldloc.1
IL_001d: ldloc.2
IL_001e: ldelem.ref
IL_001f: stloc.3
IL_0020: ldloc.0
IL_0021: ldloc.3
IL_0022: callvirt System.String System.String::Trim()
IL_0027: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_002c: ldloc.2
IL_002d: ldc.i4.1
IL_002e: add
IL_002f: stloc.2
IL_0030: ldloc.2
IL_0031: ldloc.1
IL_0032: ldlen
IL_0033: conv.i4
IL_0034: blt.s IL_001c
IL_0036: ldloc.0
IL_0037: ret

// System.Single neobotics.ModSdk.Utils::GetSolidHeight(UnityEngine.Vector3)
.locals System.Int32, System.Single, UnityEngine.RaycastHit
IL_0000: call ZoneSystem ZoneSystem::get_instance()
IL_0005: ldfld System.Int32 ZoneSystem::m_solidRayMask
IL_000a: stloc.0
IL_000b: ldc.r4 0
IL_0010: stloc.1
IL_0011: ldarga.s p
IL_0013: ldflda System.Single UnityEngine.Vector3::y
IL_0018: dup
IL_0019: ldind.r4
IL_001a: ldc.r4 1000
IL_001f: add
IL_0020: stind.r4
IL_0021: ldarg.0
IL_0022: call UnityEngine.Vector3 UnityEngine.Vector3::get_down()
IL_0027: ldloca.s V_2
IL_0029: ldc.r4 2000
IL_002e: ldloc.0
IL_002f: call System.Boolean UnityEngine.Physics::Raycast(UnityEngine.Vector3,UnityEngine.Vector3,UnityEngine.RaycastHit&,System.Single,System.Int32)
IL_0034: brfalse.s IL_0056
IL_0036: ldloca.s V_2
IL_0038: call UnityEngine.Collider UnityEngine.RaycastHit::get_collider()
IL_003d: callvirt UnityEngine.Rigidbody UnityEngine.Collider::get_attachedRigidbody()
IL_0042: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0047: brtrue.s IL_0056
IL_0049: ldloca.s V_2
IL_004b: call UnityEngine.Vector3 UnityEngine.RaycastHit::get_point()
IL_0050: ldfld System.Single UnityEngine.Vector3::y
IL_0055: stloc.1
IL_0056: ldloc.1
IL_0057: ret

// UnityEngine.Transform neobotics.ModSdk.Utils::FindChild(UnityEngine.Transform,System.String)
.locals System.Collections.IEnumerator, UnityEngine.Transform, UnityEngine.Transform, UnityEngine.Transform, System.IDisposable
IL_0000: ldarg.0
IL_0001: callvirt System.Collections.IEnumerator UnityEngine.Transform::GetEnumerator()
IL_0006: stloc.0
IL_0007: br.s IL_003c
IL_0009: ldloc.0
IL_000a: callvirt System.Object System.Collections.IEnumerator::get_Current()
IL_000f: castclass UnityEngine.Transform
IL_0014: stloc.1
IL_0015: ldloc.1
IL_0016: callvirt System.String UnityEngine.Object::get_name()
IL_001b: ldarg.1
IL_001c: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0021: brfalse.s IL_0027
IL_0023: ldloc.1
IL_0024: stloc.3
IL_0025: leave.s IL_005c
IL_0027: ldloc.1
IL_0028: ldarg.1
IL_0029: call UnityEngine.Transform neobotics.ModSdk.Utils::FindChild(UnityEngine.Transform,System.String)
IL_002e: stloc.2
IL_002f: ldloc.2
IL_0030: ldnull
IL_0031: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0036: brfalse.s IL_003c
IL_0038: ldloc.2
IL_0039: stloc.3
IL_003a: leave.s IL_005c
IL_003c: ldloc.0
IL_003d: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0042: brtrue.s IL_0009
IL_0044: leave.s IL_005a
IL_0046: ldloc.0
IL_0047: isinst System.IDisposable
IL_004c: stloc.s V_4
IL_004e: ldloc.s V_4
IL_0050: brfalse.s IL_0059
IL_0052: ldloc.s V_4
IL_0054: callvirt System.Void System.IDisposable::Dispose()
IL_0059: endfinally
IL_005a: ldnull
IL_005b: ret
IL_005c: ldloc.3
IL_005d: ret
// EH Finally: 7 - 70 => 70 - 90

// UnityEngine.Transform neobotics.ModSdk.Utils::FindParent(UnityEngine.Transform)
.locals 
IL_0000: br.s IL_000a
IL_0002: ldarg.0
IL_0003: callvirt UnityEngine.Transform UnityEngine.Transform::get_parent()
IL_0008: starg.s go
IL_000a: ldarg.0
IL_000b: callvirt UnityEngine.Transform UnityEngine.Transform::get_parent()
IL_0010: ldnull
IL_0011: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0016: brtrue.s IL_0002
IL_0018: ldarg.0
IL_0019: ret

// System.Boolean neobotics.ModSdk.Utils::IsPrefabInScene(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0006: call System.Boolean neobotics.ModSdk.Utils::IsPrefabInScene(System.Int32)
IL_000b: ret

// System.Boolean neobotics.ModSdk.Utils::IsPrefabInScene(System.Int32)
.locals 
IL_0000: call ZNetScene ZNetScene::get_instance()
IL_0005: dup
IL_0006: brtrue.s IL_000c
IL_0008: pop
IL_0009: ldnull
IL_000a: br.s IL_0012
IL_000c: ldarg.0
IL_000d: call UnityEngine.GameObject ZNetScene::GetPrefab(System.Int32)
IL_0012: ldnull
IL_0013: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0018: ret

// System.Boolean neobotics.ModSdk.Utils::TryGetPrefab(System.String,UnityEngine.GameObject&)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0006: ldarg.1
IL_0007: call System.Boolean neobotics.ModSdk.Utils::TryGetPrefab(System.Int32,UnityEngine.GameObject&)
IL_000c: ret

// System.Boolean neobotics.ModSdk.Utils::TryGetPrefab(System.Int32,UnityEngine.GameObject&)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.0
IL_0002: call UnityEngine.GameObject neobotics.ModSdk.Utils::GetPrefabByHash(System.Int32)
IL_0007: stind.ref
IL_0008: ldarg.1
IL_0009: ldind.ref
IL_000a: ldnull
IL_000b: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0010: ret

// UnityEngine.GameObject neobotics.ModSdk.Utils::GetPrefabByHash(System.Int32)
.locals UnityEngine.GameObject, neobotics.ModSdk.Logging
IL_0000: ldnull
IL_0001: stloc.0
IL_0002: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::GetLogger()
IL_0007: stloc.1
IL_0008: call ZNetScene ZNetScene::get_instance()
IL_000d: dup
IL_000e: brtrue.s IL_0014
IL_0010: pop
IL_0011: ldnull
IL_0012: br.s IL_001a
IL_0014: ldarg.0
IL_0015: call UnityEngine.GameObject ZNetScene::GetPrefab(System.Int32)
IL_001a: stloc.0
IL_001b: ldloc.0
IL_001c: ldnull
IL_001d: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0022: brfalse.s IL_0031
IL_0024: ldloc.1
IL_0025: ldstr "Found prefab in Scene"
IL_002a: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_002f: ldloc.0
IL_0030: ret
IL_0031: call ObjectDB ObjectDB::get_instance()
IL_0036: ldarg.0
IL_0037: callvirt UnityEngine.GameObject ObjectDB::GetItemPrefab(System.Int32)
IL_003c: stloc.0
IL_003d: ldloc.0
IL_003e: ldnull
IL_003f: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0044: brfalse.s IL_0053
IL_0046: ldloc.1
IL_0047: ldstr "Found prefab in ObjectDB"
IL_004c: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0051: ldloc.0
IL_0052: ret
IL_0053: ldloc.1
IL_0054: ldstr "No prefab found"
IL_0059: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_005e: ldloc.0
IL_005f: ret

// UnityEngine.GameObject neobotics.ModSdk.Utils::GetPrefab(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: call UnityEngine.GameObject neobotics.ModSdk.Utils::GetPrefabByHash(System.Int32)
IL_0006: ret

// UnityEngine.GameObject neobotics.ModSdk.Utils::GetPrefab(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0006: call UnityEngine.GameObject neobotics.ModSdk.Utils::GetPrefabByHash(System.Int32)
IL_000b: ret

// System.Void neobotics.ModSdk.Utils::LoadPrefabInScene(UnityEngine.GameObject)
.locals System.Int32
IL_0000: ldarg.0
IL_0001: callvirt System.String UnityEngine.Object::get_name()
IL_0006: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_000b: stloc.0
IL_000c: call ZNetScene ZNetScene::get_instance()
IL_0011: ldnull
IL_0012: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0017: brfalse.s IL_004c
IL_0019: call ZNetScene ZNetScene::get_instance()
IL_001e: ldfld System.Collections.Generic.Dictionary`2<System.Int32,UnityEngine.GameObject> ZNetScene::m_namedPrefabs
IL_0023: ldloc.0
IL_0024: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,UnityEngine.GameObject>::ContainsKey(!0)
IL_0029: brtrue.s IL_004c
IL_002b: call ZNetScene ZNetScene::get_instance()
IL_0030: ldfld System.Collections.Generic.List`1<UnityEngine.GameObject> ZNetScene::m_prefabs
IL_0035: ldarg.0
IL_0036: callvirt System.Void System.Collections.Generic.List`1<UnityEngine.GameObject>::Add(!0)
IL_003b: call ZNetScene ZNetScene::get_instance()
IL_0040: ldfld System.Collections.Generic.Dictionary`2<System.Int32,UnityEngine.GameObject> ZNetScene::m_namedPrefabs
IL_0045: ldloc.0
IL_0046: ldarg.0
IL_0047: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Int32,UnityEngine.GameObject>::set_Item(!0,!1)
IL_004c: ret

// UnityEngine.GameObject neobotics.ModSdk.Utils::SpawnObject(System.String,UnityEngine.Vector3,UnityEngine.Quaternion,System.Boolean)
.locals UnityEngine.GameObject
IL_0000: ldarg.0
IL_0001: ldloca.s V_0
IL_0003: call System.Boolean neobotics.ModSdk.Utils::TryGetPrefab(System.String,UnityEngine.GameObject&)
IL_0008: brfalse.s IL_0014
IL_000a: ldloc.0
IL_000b: ldarg.1
IL_000c: ldarg.2
IL_000d: ldarg.3
IL_000e: call UnityEngine.GameObject neobotics.ModSdk.Utils::SpawnObject(UnityEngine.GameObject,UnityEngine.Vector3,UnityEngine.Quaternion,System.Boolean)
IL_0013: ret
IL_0014: ldnull
IL_0015: ret

// UnityEngine.GameObject neobotics.ModSdk.Utils::SpawnObject(UnityEngine.GameObject,UnityEngine.Vector3,UnityEngine.Quaternion,System.Boolean)
.locals UnityEngine.GameObject, ZNetView
IL_0000: ldarg.0
IL_0001: call System.Void neobotics.ModSdk.Utils::LoadPrefabInScene(UnityEngine.GameObject)
IL_0006: ldarg.0
IL_0007: ldarg.1
IL_0008: ldarg.2
IL_0009: call !!0 UnityEngine.Object::Instantiate<UnityEngine.GameObject>(!!0,UnityEngine.Vector3,UnityEngine.Quaternion)
IL_000e: stloc.0
IL_000f: ldarg.3
IL_0010: brfalse.s IL_0028
IL_0012: ldloc.0
IL_0013: ldloca.s V_1
IL_0015: callvirt System.Boolean UnityEngine.GameObject::TryGetComponent<ZNetView>(!!0&)
IL_001a: brfalse.s IL_0028
IL_001c: ldloc.1
IL_001d: callvirt ZDO ZNetView::GetZDO()
IL_0022: ldc.i4.1
IL_0023: callvirt System.Void ZDO::set_Persistent(System.Boolean)
IL_0028: ldloc.0
IL_0029: ret

// System.String neobotics.ModSdk.Utils::SerializeFromDictionary(System.String,System.String,System.Collections.Generic.IDictionary`2<K,V>)
.locals neobotics.ModSdk.Utils/<>c__DisplayClass40_0`2<K,V>, System.Collections.Generic.IEnumerable`1<System.String>
IL_0000: newobj System.Void neobotics.ModSdk.Utils/<>c__DisplayClass40_0`2<K,V>::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldarg.1
IL_0008: stfld System.String neobotics.ModSdk.Utils/<>c__DisplayClass40_0`2<K,V>::delimc
IL_000d: ldarg.2
IL_000e: brtrue.s IL_0012
IL_0010: ldnull
IL_0011: ret
IL_0012: ldarg.2
IL_0013: ldloc.0
IL_0014: ldftn System.String neobotics.ModSdk.Utils/<>c__DisplayClass40_0`2<K,V>::<SerializeFromDictionary>b__0(System.Collections.Generic.KeyValuePair`2<K,V>)
IL_001a: newobj System.Void System.Func`2<System.Collections.Generic.KeyValuePair`2<K,V>,System.String>::.ctor(System.Object,System.IntPtr)
IL_001f: call System.Collections.Generic.IEnumerable`1<!!1> System.Linq.Enumerable::Select<System.Collections.Generic.KeyValuePair`2<K,V>,System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_0024: stloc.1
IL_0025: ldarg.0
IL_0026: ldloc.1
IL_0027: call System.String System.String::Join(System.String,System.Collections.Generic.IEnumerable`1<System.String>)
IL_002c: ret

// System.Void neobotics.ModSdk.Utils::DeserializeToDictionary(System.String,System.String,System.String,System.Collections.Generic.IDictionary`2<K,V>&)
.locals System.String[], System.String[], System.String[], System.Int32, System.String[]
IL_0000: ldarg.3
IL_0001: ldind.ref
IL_0002: brtrue.s IL_0005
IL_0004: ret
IL_0005: ldarg.3
IL_0006: ldind.ref
IL_0007: callvirt System.Void System.Collections.Generic.ICollection`1<System.Collections.Generic.KeyValuePair`2<K,V>>::Clear()
IL_000c: ldc.i4.1
IL_000d: newarr System.String
IL_0012: dup
IL_0013: ldc.i4.0
IL_0014: ldarg.1
IL_0015: stelem.ref
IL_0016: stloc.0
IL_0017: ldc.i4.1
IL_0018: newarr System.String
IL_001d: dup
IL_001e: ldc.i4.0
IL_001f: ldarg.2
IL_0020: stelem.ref
IL_0021: stloc.1
IL_0022: ldarg.0
IL_0023: ldloc.0
IL_0024: ldc.i4.1
IL_0025: callvirt System.String[] System.String::Split(System.String[],System.StringSplitOptions)
IL_002a: stloc.2
IL_002b: ldc.i4.0
IL_002c: stloc.3
IL_002d: br.s IL_005f
IL_002f: ldloc.2
IL_0030: ldloc.3
IL_0031: ldelem.ref
IL_0032: ldloc.1
IL_0033: ldc.i4.1
IL_0034: callvirt System.String[] System.String::Split(System.String[],System.StringSplitOptions)
IL_0039: stloc.s V_4
IL_003b: ldloc.s V_4
IL_003d: ldlen
IL_003e: conv.i4
IL_003f: ldc.i4.2
IL_0040: bne.un.s IL_005b
IL_0042: ldarg.3
IL_0043: ldind.ref
IL_0044: ldloc.s V_4
IL_0046: ldc.i4.0
IL_0047: ldelem.ref
IL_0048: call T neobotics.ModSdk.Utils::TypedValue<K>(System.Object)
IL_004d: ldloc.s V_4
IL_004f: ldc.i4.1
IL_0050: ldelem.ref
IL_0051: call T neobotics.ModSdk.Utils::TypedValue<V>(System.Object)
IL_0056: callvirt System.Void System.Collections.Generic.IDictionary`2<K,V>::Add(!0,!1)
IL_005b: ldloc.3
IL_005c: ldc.i4.1
IL_005d: add
IL_005e: stloc.3
IL_005f: ldloc.3
IL_0060: ldloc.2
IL_0061: ldlen
IL_0062: conv.i4
IL_0063: blt.s IL_002f
IL_0065: ret

// System.IO.FileSystemWatcher neobotics.ModSdk.Utils::CreateFileWatcher(System.String,System.IO.FileSystemEventHandler)
.locals System.String
IL_0000: ldarg.0
IL_0001: call System.String System.IO.Path::GetFileName(System.String)
IL_0006: stloc.0
IL_0007: ldarg.0
IL_0008: ldc.i4.0
IL_0009: ldarg.0
IL_000a: callvirt System.Int32 System.String::get_Length()
IL_000f: ldloc.0
IL_0010: callvirt System.Int32 System.String::get_Length()
IL_0015: sub
IL_0016: callvirt System.String System.String::Substring(System.Int32,System.Int32)
IL_001b: ldloc.0
IL_001c: newobj System.Void System.IO.FileSystemWatcher::.ctor(System.String,System.String)
IL_0021: dup
IL_0022: ldc.i4.s 92
IL_0024: callvirt System.Void System.IO.FileSystemWatcher::set_NotifyFilter(System.IO.NotifyFilters)
IL_0029: dup
IL_002a: ldarg.1
IL_002b: callvirt System.Void System.IO.FileSystemWatcher::add_Changed(System.IO.FileSystemEventHandler)
IL_0030: dup
IL_0031: ldarg.1
IL_0032: callvirt System.Void System.IO.FileSystemWatcher::add_Created(System.IO.FileSystemEventHandler)
IL_0037: dup
IL_0038: ldc.i4.0
IL_0039: callvirt System.Void System.IO.FileSystemWatcher::set_IncludeSubdirectories(System.Boolean)
IL_003e: dup
IL_003f: call System.ComponentModel.ISynchronizeInvoke BepInEx.ThreadingHelper::get_SynchronizingObject()
IL_0044: callvirt System.Void System.IO.FileSystemWatcher::set_SynchronizingObject(System.ComponentModel.ISynchronizeInvoke)
IL_0049: dup
IL_004a: ldc.i4.1
IL_004b: callvirt System.Void System.IO.FileSystemWatcher::set_EnableRaisingEvents(System.Boolean)
IL_0050: ret

// T neobotics.ModSdk.Utils::TypedValue(System.Object)
.locals 
IL_0000: ldarg.0
IL_0001: ldtoken T
IL_0006: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_000b: call System.Object System.Convert::ChangeType(System.Object,System.Type)
IL_0010: unbox.any T
IL_0015: ret

// System.Single neobotics.ModSdk.Utils::TimeAdjustedRamp(System.Single,System.Single,System.Single,System.Single,System.Single)
.locals System.Single
IL_0000: ldarg.2
IL_0001: ldarg.1
IL_0002: div
IL_0003: stloc.0
IL_0004: ldloc.0
IL_0005: ldarg.3
IL_0006: bgt.un.s IL_000e
IL_0008: ldarg.0
IL_0009: ldloc.0
IL_000a: ldarg.3
IL_000b: div
IL_000c: mul
IL_000d: ret
IL_000e: ldloc.0
IL_000f: ldc.r4 1
IL_0014: ldarg.s pctFromEndFall
IL_0016: sub
IL_0017: blt.un.s IL_0026
IL_0019: ldarg.0
IL_001a: ldc.r4 1
IL_001f: ldloc.0
IL_0020: sub
IL_0021: ldarg.s pctFromEndFall
IL_0023: div
IL_0024: mul
IL_0025: ret
IL_0026: ldarg.0
IL_0027: ret

// UnityEngine.Color neobotics.ModSdk.Utils::IntToColor(System.Int32)
.locals System.Single, System.Single, System.Single
IL_0000: ldarg.0
IL_0001: ldc.i4.s 16
IL_0003: shr
IL_0004: ldc.i4 255
IL_0009: and
IL_000a: conv.r4
IL_000b: ldc.r4 255
IL_0010: div
IL_0011: ldarg.0
IL_0012: ldc.i4.8
IL_0013: shr
IL_0014: ldc.i4 255
IL_0019: and
IL_001a: conv.r4
IL_001b: ldc.r4 255
IL_0020: div
IL_0021: stloc.0
IL_0022: ldarg.0
IL_0023: ldc.i4 255
IL_0028: and
IL_0029: conv.r4
IL_002a: ldc.r4 255
IL_002f: div
IL_0030: stloc.1
IL_0031: ldarg.0
IL_0032: ldc.i4.s 24
IL_0034: shr
IL_0035: ldc.i4 255
IL_003a: and
IL_003b: conv.r4
IL_003c: ldc.r4 255
IL_0041: div
IL_0042: stloc.2
IL_0043: ldloc.0
IL_0044: ldloc.1
IL_0045: ldloc.2
IL_0046: newobj System.Void UnityEngine.Color::.ctor(System.Single,System.Single,System.Single,System.Single)
IL_004b: ret

// System.Boolean neobotics.ModSdk.Utils::CopyComponentToGameObject(UnityEngine.Component,UnityEngine.GameObject&)
.locals neobotics.ModSdk.Logging, System.Type, UnityEngine.Component, UnityEngine.Component, System.Reflection.FieldInfo[], System.Int32, System.Reflection.FieldInfo
IL_0000: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::GetLogger()
IL_0005: stloc.0
IL_0006: ldarg.0
IL_0007: callvirt System.Type System.Object::GetType()
IL_000c: stloc.1
IL_000d: ldloc.0
IL_000e: ldstr "Original Type is {0}"
IL_0013: ldloc.1
IL_0014: call System.String System.String::Format(System.String,System.Object)
IL_0019: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_001e: ldloc.0
IL_001f: ldstr "Destination GameObject "
IL_0024: ldarg.1
IL_0025: ldind.ref
IL_0026: dup
IL_0027: brtrue.s IL_002d
IL_0029: pop
IL_002a: ldnull
IL_002b: br.s IL_0032
IL_002d: call System.String UnityEngine.Object::get_name()
IL_0032: call System.String System.String::Concat(System.String,System.String)
IL_0037: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_003c: ldarg.1
IL_003d: ldind.ref
IL_003e: ldloc.1
IL_003f: callvirt UnityEngine.Component UnityEngine.GameObject::GetComponent(System.Type)
IL_0044: stloc.2
IL_0045: ldloc.2
IL_0046: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_004b: brtrue.s IL_0056
IL_004d: ldarg.1
IL_004e: ldind.ref
IL_004f: ldloc.1
IL_0050: callvirt UnityEngine.Component UnityEngine.GameObject::AddComponent(System.Type)
IL_0055: stloc.2
IL_0056: ldloc.2
IL_0057: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_005c: brtrue.s IL_006b
IL_005e: ldloc.0
IL_005f: ldstr "Destination component is null"
IL_0064: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0069: ldc.i4.0
IL_006a: ret
IL_006b: ldloc.1
IL_006c: call System.Object System.Activator::CreateInstance(System.Type)
IL_0071: castclass UnityEngine.Component
IL_0076: stloc.3
IL_0077: ldloc.3
IL_0078: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_007d: brtrue.s IL_008c
IL_007f: ldloc.0
IL_0080: ldstr "Destination component is null"
IL_0085: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_008a: ldc.i4.0
IL_008b: ret
IL_008c: ldloc.3
IL_008d: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0092: brtrue.s IL_00a1
IL_0094: ldloc.0
IL_0095: ldstr "Boxed component is null"
IL_009a: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_009f: ldc.i4.0
IL_00a0: ret
IL_00a1: ldloc.1
IL_00a2: ldc.i4.s 60
IL_00a4: callvirt System.Reflection.FieldInfo[] System.Type::GetFields(System.Reflection.BindingFlags)
IL_00a9: stloc.s V_4
IL_00ab: ldc.i4.0
IL_00ac: stloc.s V_5
IL_00ae: br.s IL_00cd
IL_00b0: ldloc.s V_4
IL_00b2: ldloc.s V_5
IL_00b4: ldelem.ref
IL_00b5: stloc.s V_6
IL_00b7: ldloc.s V_6
IL_00b9: ldloc.3
IL_00ba: ldloc.s V_6
IL_00bc: ldarg.0
IL_00bd: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_00c2: callvirt System.Void System.Reflection.FieldInfo::SetValue(System.Object,System.Object)
IL_00c7: ldloc.s V_5
IL_00c9: ldc.i4.1
IL_00ca: add
IL_00cb: stloc.s V_5
IL_00cd: ldloc.s V_5
IL_00cf: ldloc.s V_4
IL_00d1: ldlen
IL_00d2: conv.i4
IL_00d3: blt.s IL_00b0
IL_00d5: ldloc.3
IL_00d6: stloc.2
IL_00d7: ldc.i4.1
IL_00d8: ret

// System.Boolean neobotics.ModSdk.Utils::CopyObject(System.Object,System.Object)
.locals neobotics.ModSdk.Logging, System.Type, System.Type, System.Reflection.FieldInfo[], System.Int32, System.Reflection.FieldInfo
IL_0000: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::GetLogger()
IL_0005: stloc.0
IL_0006: ldarg.0
IL_0007: callvirt System.Type System.Object::GetType()
IL_000c: stloc.1
IL_000d: ldarg.1
IL_000e: callvirt System.Type System.Object::GetType()
IL_0013: stloc.2
IL_0014: ldloc.1
IL_0015: ldnull
IL_0016: call System.Boolean System.Type::op_Equality(System.Type,System.Type)
IL_001b: brfalse.s IL_002a
IL_001d: ldloc.0
IL_001e: ldstr "Copy Object: Source object is null"
IL_0023: callvirt System.Void neobotics.ModSdk.Logging::Warning(System.String)
IL_0028: ldc.i4.0
IL_0029: ret
IL_002a: ldloc.2
IL_002b: ldnull
IL_002c: call System.Boolean System.Type::op_Equality(System.Type,System.Type)
IL_0031: brfalse.s IL_0040
IL_0033: ldloc.0
IL_0034: ldstr "Copy Object: Destination object is null"
IL_0039: callvirt System.Void neobotics.ModSdk.Logging::Warning(System.String)
IL_003e: ldc.i4.0
IL_003f: ret
IL_0040: ldloc.2
IL_0041: ldloc.1
IL_0042: call System.Boolean System.Type::op_Inequality(System.Type,System.Type)
IL_0047: brfalse.s IL_0056
IL_0049: ldloc.0
IL_004a: ldstr "Copy Object: Source and destination components are different types"
IL_004f: callvirt System.Void neobotics.ModSdk.Logging::Warning(System.String)
IL_0054: ldc.i4.0
IL_0055: ret
IL_0056: ldloc.1
IL_0057: ldc.i4.s 60
IL_0059: callvirt System.Reflection.FieldInfo[] System.Type::GetFields(System.Reflection.BindingFlags)
IL_005e: stloc.3
IL_005f: ldc.i4.0
IL_0060: stloc.s V_4
IL_0062: br.s IL_0080
IL_0064: ldloc.3
IL_0065: ldloc.s V_4
IL_0067: ldelem.ref
IL_0068: stloc.s V_5
IL_006a: ldloc.s V_5
IL_006c: ldarg.1
IL_006d: ldloc.s V_5
IL_006f: ldarg.0
IL_0070: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_0075: callvirt System.Void System.Reflection.FieldInfo::SetValue(System.Object,System.Object)
IL_007a: ldloc.s V_4
IL_007c: ldc.i4.1
IL_007d: add
IL_007e: stloc.s V_4
IL_0080: ldloc.s V_4
IL_0082: ldloc.3
IL_0083: ldlen
IL_0084: conv.i4
IL_0085: blt.s IL_0064
IL_0087: ldc.i4.1
IL_0088: ret

// System.Void neobotics.ModSdk.Utils::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void neobotics.ModSdk.Utils/<>c::.cctor()
.locals 
IL_0000: newobj System.Void neobotics.ModSdk.Utils/<>c::.ctor()
IL_0005: stsfld neobotics.ModSdk.Utils/<>c neobotics.ModSdk.Utils/<>c::<>9
IL_000a: ret

// System.Void neobotics.ModSdk.Utils/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Int32 neobotics.ModSdk.Utils/<>c::<GetGameObjectsOfTypeInRangeByDistance>b__23_0(System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Single>,System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Single>)
.locals System.Single
IL_0000: ldarga.s pair1
IL_0002: call !1 System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Single>::get_Value()
IL_0007: stloc.0
IL_0008: ldloca.s V_0
IL_000a: ldarga.s pair2
IL_000c: call !1 System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Single>::get_Value()
IL_0011: call System.Int32 System.Single::CompareTo(System.Single)
IL_0016: ret

// UnityEngine.GameObject neobotics.ModSdk.Utils/<>c::<GetGameObjectsOfTypeInRangeByDistance>b__23_1(System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Single>)
.locals 
IL_0000: ldarga.s x
IL_0002: call !0 System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Single>::get_Key()
IL_0007: ret

// System.Void neobotics.ModSdk.Utils/<>c__DisplayClass24_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean neobotics.ModSdk.Utils/<>c__DisplayClass24_0::<GetGameObjectsOfTypeInRange>b__0(UnityEngine.GameObject)
.locals UnityEngine.Vector3
IL_0000: ldarg.1
IL_0001: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0006: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_000b: ldarg.0
IL_000c: ldfld UnityEngine.Vector3 neobotics.ModSdk.Utils/<>c__DisplayClass24_0::point
IL_0011: call UnityEngine.Vector3 UnityEngine.Vector3::op_Subtraction(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0016: stloc.0
IL_0017: ldloca.s V_0
IL_0019: call System.Single UnityEngine.Vector3::get_sqrMagnitude()
IL_001e: ldarg.0
IL_001f: ldfld System.Single neobotics.ModSdk.Utils/<>c__DisplayClass24_0::radiusSq
IL_0024: clt
IL_0026: ret

// System.Void neobotics.ModSdk.Utils/<>c__DisplayClass40_0`2::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.String neobotics.ModSdk.Utils/<>c__DisplayClass40_0`2::<SerializeFromDictionary>b__0(System.Collections.Generic.KeyValuePair`2<K,V>)
.locals K, System.Collections.Generic.KeyValuePair`2<K,V>, V
IL_0000: ldarg.1
IL_0001: stloc.1
IL_0002: ldloca.s V_1
IL_0004: call !0 System.Collections.Generic.KeyValuePair`2<K,V>::get_Key()
IL_0009: stloc.0
IL_000a: ldloc.0
IL_000b: box K
IL_0010: brtrue.s IL_0015
IL_0012: ldnull
IL_0013: br.s IL_0022
IL_0015: ldloca.s V_0
IL_0017: constrained. K
IL_001d: callvirt System.String System.Object::ToString()
IL_0022: ldarg.0
IL_0023: ldfld System.String neobotics.ModSdk.Utils/<>c__DisplayClass40_0`2<K,V>::delimc
IL_0028: ldarg.1
IL_0029: stloc.1
IL_002a: ldloca.s V_1
IL_002c: call !1 System.Collections.Generic.KeyValuePair`2<K,V>::get_Value()
IL_0031: stloc.2
IL_0032: ldloc.2
IL_0033: box V
IL_0038: brtrue.s IL_003d
IL_003a: ldnull
IL_003b: br.s IL_004a
IL_003d: ldloca.s V_2
IL_003f: constrained. V
IL_0045: callvirt System.String System.Object::ToString()
IL_004a: call System.String System.String::Concat(System.String,System.String,System.String)
IL_004f: ret

// System.Void neobotics.ValheimMods.Cfg::BepInExConfig(BepInEx.BaseUnityPlugin)
.locals 
IL_0000: ldnull
IL_0001: ldftn System.Void neobotics.ValheimMods.Cfg::ChangeLogging(System.Object,System.EventArgs)
IL_0007: newobj System.Void System.Action`2<System.Object,System.EventArgs>::.ctor(System.Object,System.IntPtr)
IL_000c: ldc.i4.0
IL_000d: newobj System.Void neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ModSdk.Logging/LogLevels>::.ctor(System.Action`2<System.Object,System.EventArgs>,System.Boolean)
IL_0012: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ModSdk.Logging/LogLevels> neobotics.ValheimMods.Cfg::debugLevel
IL_0017: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ModSdk.Logging/LogLevels> neobotics.ValheimMods.Cfg::debugLevel
IL_001c: ldarg.0
IL_001d: callvirt BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0022: ldstr "Utility"
IL_0027: ldstr "LogLevel"
IL_002c: ldc.i4.3
IL_002d: ldstr "Controls the level of information contained in the log"
IL_0032: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<neobotics.ModSdk.Logging/LogLevels>(System.String,System.String,!!0,System.String)
IL_0037: callvirt System.Void neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ModSdk.Logging/LogLevels>::set_ConfigEntry(BepInEx.Configuration.ConfigEntry`1<T>)
IL_003c: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0041: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ModSdk.Logging/LogLevels> neobotics.ValheimMods.Cfg::debugLevel
IL_0046: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ModSdk.Logging/LogLevels>::get_Value()
IL_004b: callvirt System.Void neobotics.ModSdk.Logging::set_LogLevel(neobotics.ModSdk.Logging/LogLevels)
IL_0050: ldnull
IL_0051: ldftn System.Void neobotics.ValheimMods.SlayerSkills::ChangeColor(System.Object,System.EventArgs)
IL_0057: newobj System.Void System.Action`2<System.Object,System.EventArgs>::.ctor(System.Object,System.IntPtr)
IL_005c: ldc.i4.0
IL_005d: newobj System.Void neobotics.ModSdk.DelegatedConfigEntry`1<UnityEngine.Color>::.ctor(System.Action`2<System.Object,System.EventArgs>,System.Boolean)
IL_0062: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<UnityEngine.Color> neobotics.ValheimMods.Cfg::skillColor
IL_0067: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<UnityEngine.Color> neobotics.ValheimMods.Cfg::skillColor
IL_006c: ldarg.0
IL_006d: callvirt BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0072: ldstr "Utility"
IL_0077: ldstr "SkillTextColor"
IL_007c: call UnityEngine.Color UnityEngine.Color::get_cyan()
IL_0081: ldstr "Sets the color for the Slayer Skill text in the Trophy panel."
IL_0086: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<UnityEngine.Color>(System.String,System.String,!!0,System.String)
IL_008b: callvirt System.Void neobotics.ModSdk.DelegatedConfigEntry`1<UnityEngine.Color>::set_ConfigEntry(BepInEx.Configuration.ConfigEntry`1<T>)
IL_0090: ldc.i4.1
IL_0091: newobj System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::.ctor(System.Boolean)
IL_0096: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::trophyCap
IL_009b: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::trophyCap
IL_00a0: ldarg.0
IL_00a1: callvirt BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_00a6: ldstr "Slayer Skills"
IL_00ab: ldstr "SkillCap"
IL_00b0: ldc.i4.s 100
IL_00b2: ldstr "Sets the maximum Slayer level attainable. Every slayer point earned increases the percentage of the damage buff against a specific creature type. @"
IL_00b7: ldc.i4.1
IL_00b8: ldc.i4 200
IL_00bd: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Int32>::.ctor(!0,!0)
IL_00c2: call !!0[] System.Array::Empty<System.Object>()
IL_00c7: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_00cc: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Int32>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_00d1: callvirt System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::set_ConfigEntry(BepInEx.Configuration.ConfigEntry`1<T>)
IL_00d6: ldc.i4.1
IL_00d7: newobj System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::.ctor(System.Boolean)
IL_00dc: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::trophyDistance
IL_00e1: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::trophyDistance
IL_00e6: ldarg.0
IL_00e7: callvirt BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_00ec: ldstr "Slayer Skills"
IL_00f1: ldstr "TrophyDistance"
IL_00f6: ldc.i4.s 30
IL_00f8: ldstr "Sets the maximum distance, in meters, that a player (in multiplayer) can be from the trophy drop to qualify for the trophy point. @"
IL_00fd: ldc.i4.5
IL_00fe: ldc.i4.s 50
IL_0100: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Int32>::.ctor(!0,!0)
IL_0105: call !!0[] System.Array::Empty<System.Object>()
IL_010a: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_010f: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Int32>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0114: callvirt System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::set_ConfigEntry(BepInEx.Configuration.ConfigEntry`1<T>)
IL_0119: ldc.i4.1
IL_011a: newobj System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::.ctor(System.Boolean)
IL_011f: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::lowerSkillsOnDeath
IL_0124: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::lowerSkillsOnDeath
IL_0129: ldarg.0
IL_012a: callvirt BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_012f: ldstr "Slayer Skills"
IL_0134: ldstr "LowerSkillsOnDeath"
IL_0139: ldc.i4.1
IL_013a: ldstr "If enabled, will lower slayer skills upon death (same % as standard skills) @"
IL_013f: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_0144: callvirt System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::set_ConfigEntry(BepInEx.Configuration.ConfigEntry`1<T>)
IL_0149: ldc.i4.1
IL_014a: newobj System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::.ctor(System.Boolean)
IL_014f: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::allowCheats
IL_0154: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::allowCheats
IL_0159: ldarg.0
IL_015a: callvirt BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_015f: ldstr "Slayer Skills"
IL_0164: ldstr "AllowCheats"
IL_0169: ldc.i4.0
IL_016a: ldstr "If enabled, allows raising and resetting Slayer skills using 'raiseskill' and 'resetskill' commands from the console by using the trophy name for the creature. Use an underscore (_) instead of a space on the command line, e.g. 'raiseskill Deer_Trophy 3'. Note the trophy name is case sensitive! @"
IL_016f: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_0174: callvirt System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::set_ConfigEntry(BepInEx.Configuration.ConfigEntry`1<T>)
IL_0179: ldc.i4.1
IL_017a: newobj System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::.ctor(System.Boolean)
IL_017f: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::damageCap
IL_0184: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::damageCap
IL_0189: ldarg.0
IL_018a: callvirt BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_018f: ldstr "Slayer Damage"
IL_0194: ldstr "DamagePercent"
IL_0199: ldc.i4.s 100
IL_019b: ldstr "Sets the maximum damage buff percent of your normal damage. The applied buff percentage is determined by your current Slayer level. @"
IL_01a0: ldc.i4.0
IL_01a1: ldc.i4.s 100
IL_01a3: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Int32>::.ctor(!0,!0)
IL_01a8: call !!0[] System.Array::Empty<System.Object>()
IL_01ad: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_01b2: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Int32>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_01b7: callvirt System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::set_ConfigEntry(BepInEx.Configuration.ConfigEntry`1<T>)
IL_01bc: ldc.i4.1
IL_01bd: newobj System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::.ctor(System.Boolean)
IL_01c2: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::damagePhysical
IL_01c7: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::damagePhysical
IL_01cc: ldarg.0
IL_01cd: callvirt BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_01d2: ldstr "Slayer Damage"
IL_01d7: ldstr "BuffPhysical"
IL_01dc: ldc.i4.1
IL_01dd: ldstr "If enabled, applies slayer bonus to physical damage (slash, blunt, pierce). @"
IL_01e2: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_01e7: callvirt System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::set_ConfigEntry(BepInEx.Configuration.ConfigEntry`1<T>)
IL_01ec: ldc.i4.1
IL_01ed: newobj System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::.ctor(System.Boolean)
IL_01f2: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::damageElemental
IL_01f7: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::damageElemental
IL_01fc: ldarg.0
IL_01fd: callvirt BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0202: ldstr "Slayer Damage"
IL_0207: ldstr "BuffElemental"
IL_020c: ldc.i4.0
IL_020d: ldstr "If enabled, applies slayer bonus to elemental damage (lightning, fire, frost). @"
IL_0212: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_0217: callvirt System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::set_ConfigEntry(BepInEx.Configuration.ConfigEntry`1<T>)
IL_021c: ldc.i4.1
IL_021d: newobj System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::.ctor(System.Boolean)
IL_0222: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::damageOther
IL_0227: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::damageOther
IL_022c: ldarg.0
IL_022d: callvirt BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0232: ldstr "Slayer Damage"
IL_0237: ldstr "BuffOther"
IL_023c: ldc.i4.0
IL_023d: ldstr "If enabled, applies slayer bonus to other damage (poison, spirit). @"
IL_0242: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_0247: callvirt System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::set_ConfigEntry(BepInEx.Configuration.ConfigEntry`1<T>)
IL_024c: ldc.i4.1
IL_024d: newobj System.Void neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ValheimMods.SlayerSkills/Points>::.ctor(System.Boolean)
IL_0252: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ValheimMods.SlayerSkills/Points> neobotics.ValheimMods.Cfg::assignPoints
IL_0257: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ValheimMods.SlayerSkills/Points> neobotics.ValheimMods.Cfg::assignPoints
IL_025c: ldarg.0
IL_025d: callvirt BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0262: ldstr "Slayer Points"
IL_0267: ldstr "MultiplayerPoints"
IL_026c: ldc.i4.0
IL_026d: ldstr "Controls how slayer skills are awarded in multiplayer. Random grants skill points to one player in group. All grants a skill point to every player in group. Distribute grants a fraction of a skill point evenly to every player in group. @"
IL_0272: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<neobotics.ValheimMods.SlayerSkills/Points>(System.String,System.String,!!0,System.String)
IL_0277: callvirt System.Void neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ValheimMods.SlayerSkills/Points>::set_ConfigEntry(BepInEx.Configuration.ConfigEntry`1<T>)
IL_027c: ldc.i4.1
IL_027d: newobj System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::.ctor(System.Boolean)
IL_0282: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::useCreatureLevel
IL_0287: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::useCreatureLevel
IL_028c: ldarg.0
IL_028d: callvirt BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0292: ldstr "Slayer Points"
IL_0297: ldstr "UseCreatureLevel"
IL_029c: ldc.i4.0
IL_029d: ldstr "If enabled, adjusts the Slayer points awarded on trophy drop based on the level (number of 'Stars') of the creature slain. @"
IL_02a2: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_02a7: callvirt System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::set_ConfigEntry(BepInEx.Configuration.ConfigEntry`1<T>)
IL_02ac: ldc.i4.1
IL_02ad: newobj System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::.ctor(System.Boolean)
IL_02b2: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::bossPoints
IL_02b7: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::bossPoints
IL_02bc: ldarg.0
IL_02bd: callvirt BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_02c2: ldstr "Slayer Points"
IL_02c7: ldstr "BossAdjustment"
IL_02cc: ldc.i4.3
IL_02cd: ldstr "Adjusts Slayer points awarded to account for bosses. Equivalent to treating a boss as an 'X-Star' creature. Applies even if UseCreatureLevel is false (and adds if true). @"
IL_02d2: ldc.i4.0
IL_02d3: ldc.i4.s 10
IL_02d5: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Int32>::.ctor(!0,!0)
IL_02da: call !!0[] System.Array::Empty<System.Object>()
IL_02df: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_02e4: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Int32>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_02e9: callvirt System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::set_ConfigEntry(BepInEx.Configuration.ConfigEntry`1<T>)
IL_02ee: ldc.i4.1
IL_02ef: newobj System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::.ctor(System.Boolean)
IL_02f4: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::tamesSlay
IL_02f9: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::tamesSlay
IL_02fe: ldarg.0
IL_02ff: callvirt BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0304: ldstr "Tamed Creatures"
IL_0309: ldstr "TamesCanSlay"
IL_030e: ldc.i4.1
IL_030f: ldstr "If enabled, trophy drops from creatures slain by your tamed creatires count toward your Slayer skill. @"
IL_0314: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_0319: callvirt System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::set_ConfigEntry(BepInEx.Configuration.ConfigEntry`1<T>)
IL_031e: ldc.i4.1
IL_031f: newobj System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::.ctor(System.Boolean)
IL_0324: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::tamesBuff
IL_0329: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::tamesBuff
IL_032e: ldarg.0
IL_032f: callvirt BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0334: ldstr "Tamed Creatures"
IL_0339: ldstr "TamesGetBuff"
IL_033e: ldc.i4.0
IL_033f: ldstr "If enabled, your tamed creatures also recieve your Slayer buff. @"
IL_0344: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_0349: callvirt System.Void neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::set_ConfigEntry(BepInEx.Configuration.ConfigEntry`1<T>)
IL_034e: ret

// System.Void neobotics.ValheimMods.Cfg::ChangeLogging(System.Object,System.EventArgs)
.locals BepInEx.Configuration.SettingChangedEventArgs
IL_0000: ldarg.1
IL_0001: isinst BepInEx.Configuration.SettingChangedEventArgs
IL_0006: stloc.0
IL_0007: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_000c: ldstr "ChangeLog {0} to {1}"
IL_0011: ldloc.0
IL_0012: callvirt BepInEx.Configuration.ConfigEntryBase BepInEx.Configuration.SettingChangedEventArgs::get_ChangedSetting()
IL_0017: callvirt BepInEx.Configuration.ConfigDefinition BepInEx.Configuration.ConfigEntryBase::get_Definition()
IL_001c: callvirt System.String BepInEx.Configuration.ConfigDefinition::get_Key()
IL_0021: ldloc.0
IL_0022: callvirt BepInEx.Configuration.ConfigEntryBase BepInEx.Configuration.SettingChangedEventArgs::get_ChangedSetting()
IL_0027: callvirt System.Object BepInEx.Configuration.ConfigEntryBase::get_BoxedValue()
IL_002c: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_0031: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0036: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_003b: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ModSdk.Logging/LogLevels> neobotics.ValheimMods.Cfg::debugLevel
IL_0040: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ModSdk.Logging/LogLevels>::get_Value()
IL_0045: callvirt System.Void neobotics.ModSdk.Logging::set_LogLevel(neobotics.ModSdk.Logging/LogLevels)
IL_004a: ret

// System.Void neobotics.ValheimMods.Cfg::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void neobotics.ValheimMods.Cfg::.cctor()
.locals 
IL_0000: ldnull
IL_0001: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ModSdk.Logging/LogLevels> neobotics.ValheimMods.Cfg::debugLevel
IL_0006: ldnull
IL_0007: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::trophyCap
IL_000c: ldnull
IL_000d: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::damageCap
IL_0012: ldnull
IL_0013: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::trophyDistance
IL_0018: ldnull
IL_0019: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::damagePhysical
IL_001e: ldnull
IL_001f: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::damageElemental
IL_0024: ldnull
IL_0025: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::damageOther
IL_002a: ldnull
IL_002b: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ValheimMods.SlayerSkills/Points> neobotics.ValheimMods.Cfg::assignPoints
IL_0030: ldnull
IL_0031: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::lowerSkillsOnDeath
IL_0036: ldnull
IL_0037: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::allowCheats
IL_003c: ldnull
IL_003d: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::useCreatureLevel
IL_0042: ldnull
IL_0043: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::bossPoints
IL_0048: ldnull
IL_0049: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::tamesSlay
IL_004e: ldnull
IL_004f: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::tamesBuff
IL_0054: ldnull
IL_0055: stsfld neobotics.ModSdk.DelegatedConfigEntry`1<UnityEngine.Color> neobotics.ValheimMods.Cfg::skillColor
IL_005a: ldc.i4.2
IL_005b: newarr UnityEngine.KeyCode
IL_0060: dup
IL_0061: ldc.i4.0
IL_0062: ldc.i4 308
IL_0067: stelem.i4
IL_0068: dup
IL_0069: ldc.i4.1
IL_006a: ldc.i4 304
IL_006f: stelem.i4
IL_0070: stsfld UnityEngine.KeyCode[] neobotics.ValheimMods.Cfg::keyModifiers
IL_0075: ldc.i4.s 115
IL_0077: ldsfld UnityEngine.KeyCode[] neobotics.ValheimMods.Cfg::keyModifiers
IL_007c: newobj System.Void BepInEx.Configuration.KeyboardShortcut::.ctor(UnityEngine.KeyCode,UnityEngine.KeyCode[])
IL_0081: stsfld BepInEx.Configuration.KeyboardShortcut neobotics.ValheimMods.Cfg::keyConfigItemDefault
IL_0086: ret

// System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper::get_Data()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper::<Data>k__BackingField
IL_0006: ret

// System.Void neobotics.ValheimMods.CustomDataWrapper::set_Data(System.Collections.Generic.Dictionary`2<System.String,System.String>)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper::<Data>k__BackingField
IL_0007: ret

// System.Void neobotics.ValheimMods.CustomDataWrapper::.ctor(System.Collections.Generic.Dictionary`2<System.String,System.String>,System.String)
.locals neobotics.ValheimMods.CustomDataWrapper/<>c__DisplayClass5_0
IL_0000: newobj System.Void neobotics.ValheimMods.CustomDataWrapper/<>c__DisplayClass5_0::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldarg.2
IL_0008: stfld System.String neobotics.ValheimMods.CustomDataWrapper/<>c__DisplayClass5_0::keyPrefix
IL_000d: ldloc.0
IL_000e: ldarg.1
IL_000f: stfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper/<>c__DisplayClass5_0::sourceData
IL_0014: ldarg.0
IL_0015: call System.Void System.Object::.ctor()
IL_001a: ldloc.0
IL_001b: ldarg.0
IL_001c: stfld neobotics.ValheimMods.CustomDataWrapper neobotics.ValheimMods.CustomDataWrapper/<>c__DisplayClass5_0::<>4__this
IL_0021: ldarg.0
IL_0022: ldloc.0
IL_0023: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper/<>c__DisplayClass5_0::sourceData
IL_0028: stfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper::playerData
IL_002d: ldarg.0
IL_002e: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::.ctor()
IL_0033: call System.Void neobotics.ValheimMods.CustomDataWrapper::set_Data(System.Collections.Generic.Dictionary`2<System.String,System.String>)
IL_0038: ldloc.0
IL_0039: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper/<>c__DisplayClass5_0::sourceData
IL_003e: callvirt System.Collections.Generic.Dictionary`2/KeyCollection<!0,!1> System.Collections.Generic.Dictionary`2<System.String,System.String>::get_Keys()
IL_0043: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.String>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0048: ldloc.0
IL_0049: ldftn System.Void neobotics.ValheimMods.CustomDataWrapper/<>c__DisplayClass5_0::<.ctor>b__0(System.String)
IL_004f: newobj System.Void System.Action`1<System.String>::.ctor(System.Object,System.IntPtr)
IL_0054: callvirt System.Void System.Collections.Generic.List`1<System.String>::ForEach(System.Action`1<!0>)
IL_0059: ret

// System.Void neobotics.ValheimMods.CustomDataWrapper::Add(System.String,System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper::get_Data()
IL_0006: ldarg.1
IL_0007: ldarg.2
IL_0008: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_000d: ldarg.0
IL_000e: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper::playerData
IL_0013: ldarg.1
IL_0014: ldarg.2
IL_0015: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_001a: ret

// System.Boolean neobotics.ValheimMods.CustomDataWrapper::Remove(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper::get_Data()
IL_0006: ldarg.1
IL_0007: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::Remove(!0)
IL_000c: ldarg.0
IL_000d: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper::playerData
IL_0012: ldarg.1
IL_0013: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::Remove(!0)
IL_0018: and
IL_0019: ret

// System.Void neobotics.ValheimMods.CustomDataWrapper::Set(System.String,System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper::get_Data()
IL_0006: ldarg.1
IL_0007: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::ContainsKey(!0)
IL_000c: brfalse.s IL_001d
IL_000e: ldarg.0
IL_000f: call System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper::get_Data()
IL_0014: ldarg.1
IL_0015: ldarg.2
IL_0016: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::set_Item(!0,!1)
IL_001b: br.s IL_002a
IL_001d: ldarg.0
IL_001e: call System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper::get_Data()
IL_0023: ldarg.1
IL_0024: ldarg.2
IL_0025: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_002a: ldarg.0
IL_002b: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper::playerData
IL_0030: ldarg.1
IL_0031: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::ContainsKey(!0)
IL_0036: brfalse.s IL_0046
IL_0038: ldarg.0
IL_0039: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper::playerData
IL_003e: ldarg.1
IL_003f: ldarg.2
IL_0040: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::set_Item(!0,!1)
IL_0045: ret
IL_0046: ldarg.0
IL_0047: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper::playerData
IL_004c: ldarg.1
IL_004d: ldarg.2
IL_004e: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_0053: ret

// System.String neobotics.ValheimMods.CustomDataWrapper::Get(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper::get_Data()
IL_0006: ldarg.1
IL_0007: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::ContainsKey(!0)
IL_000c: brfalse.s IL_001b
IL_000e: ldarg.0
IL_000f: call System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper::get_Data()
IL_0014: ldarg.1
IL_0015: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,System.String>::get_Item(!0)
IL_001a: ret
IL_001b: ldnull
IL_001c: ret

// System.Boolean neobotics.ValheimMods.CustomDataWrapper::ContainsKey(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper::get_Data()
IL_0006: ldarg.1
IL_0007: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::ContainsKey(!0)
IL_000c: ret

// System.Void neobotics.ValheimMods.CustomDataWrapper::PreSaveSync()
.locals System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>, System.Collections.Generic.KeyValuePair`2<System.String,System.String>
IL_0000: ldarg.0
IL_0001: call System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper::get_Data()
IL_0006: callvirt System.Collections.Generic.Dictionary`2/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2<System.String,System.String>::GetEnumerator()
IL_000b: stloc.0
IL_000c: br.s IL_0043
IL_000e: ldloca.s V_0
IL_0010: call System.Collections.Generic.KeyValuePair`2<!0,!1> System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>::get_Current()
IL_0015: stloc.1
IL_0016: ldarg.0
IL_0017: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper::playerData
IL_001c: ldloca.s V_1
IL_001e: call !0 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Key()
IL_0023: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.String>::ContainsKey(!0)
IL_0028: brtrue.s IL_0043
IL_002a: ldarg.0
IL_002b: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper::playerData
IL_0030: ldloca.s V_1
IL_0032: call !0 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Key()
IL_0037: ldloca.s V_1
IL_0039: call !1 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Value()
IL_003e: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_0043: ldloca.s V_0
IL_0045: call System.Boolean System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>::MoveNext()
IL_004a: brtrue.s IL_000e
IL_004c: leave.s IL_005c
IL_004e: ldloca.s V_0
IL_0050: constrained. System.Collections.Generic.Dictionary`2/Enumerator<System.String,System.String>
IL_0056: callvirt System.Void System.IDisposable::Dispose()
IL_005b: endfinally
IL_005c: ret
// EH Finally: 12 - 78 => 78 - 92

// System.Void neobotics.ValheimMods.CustomDataWrapper/<>c__DisplayClass5_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void neobotics.ValheimMods.CustomDataWrapper/<>c__DisplayClass5_0::<.ctor>b__0(System.String)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.0
IL_0002: ldfld System.String neobotics.ValheimMods.CustomDataWrapper/<>c__DisplayClass5_0::keyPrefix
IL_0007: callvirt System.Boolean System.String::StartsWith(System.String)
IL_000c: brfalse.s IL_002b
IL_000e: ldarg.0
IL_000f: ldfld neobotics.ValheimMods.CustomDataWrapper neobotics.ValheimMods.CustomDataWrapper/<>c__DisplayClass5_0::<>4__this
IL_0014: call System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper::get_Data()
IL_0019: ldarg.1
IL_001a: ldarg.0
IL_001b: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> neobotics.ValheimMods.CustomDataWrapper/<>c__DisplayClass5_0::sourceData
IL_0020: ldarg.1
IL_0021: callvirt !1 System.Collections.Generic.Dictionary`2<System.String,System.String>::get_Item(!0)
IL_0026: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_002b: ret

// neobotics.ValheimMods.SlayerSkills neobotics.ValheimMods.SlayerSkills::GetInstance()
.locals 
IL_0000: ldsfld neobotics.ValheimMods.SlayerSkills neobotics.ValheimMods.SlayerSkills::_modInstance
IL_0005: ret

// System.Void neobotics.ValheimMods.SlayerSkills::Awake()
.locals 
IL_0000: ldarg.0
IL_0001: stsfld neobotics.ValheimMods.SlayerSkills neobotics.ValheimMods.SlayerSkills::_modInstance
IL_0006: ldarg.0
IL_0007: call BepInEx.PluginInfo BepInEx.BaseUnityPlugin::get_Info()
IL_000c: callvirt BepInEx.BepInPlugin BepInEx.PluginInfo::get_Metadata()
IL_0011: callvirt System.String BepInEx.BepInPlugin::get_GUID()
IL_0016: newobj System.Void HarmonyLib.Harmony::.ctor(System.String)
IL_001b: stsfld HarmonyLib.Harmony neobotics.ValheimMods.SlayerSkills::harmony
IL_0020: ldsfld HarmonyLib.Harmony neobotics.ValheimMods.SlayerSkills::harmony
IL_0025: call System.Reflection.Assembly System.Reflection.Assembly::GetExecutingAssembly()
IL_002a: callvirt System.Void HarmonyLib.Harmony::PatchAll(System.Reflection.Assembly)
IL_002f: ldarg.0
IL_0030: call System.Void neobotics.ValheimMods.SlayerSkills::ConfigureMod()
IL_0035: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_003a: ldstr "Awake"
IL_003f: callvirt System.Void neobotics.ModSdk.Logging::Info(System.String)
IL_0044: ret

// System.Void neobotics.ValheimMods.SlayerSkills::ConfigureMod()
.locals 
IL_0000: ldc.i4.3
IL_0001: ldstr "SlayerSkills"
IL_0006: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::GetLogger(neobotics.ModSdk.Logging/LogLevels,System.String)
IL_000b: stsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0010: call neobotics.ModSdk.ServerConfiguration neobotics.ModSdk.ServerConfiguration::get_Instance()
IL_0015: ldarg.0
IL_0016: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_001b: ldsfld neobotics.ValheimMods.SlayerSkills neobotics.ValheimMods.SlayerSkills::_modInstance
IL_0020: callvirt System.Void neobotics.ModSdk.ServerConfiguration::Setup(BepInEx.Configuration.ConfigFile,BepInEx.BaseUnityPlugin)
IL_0025: ldsfld neobotics.ValheimMods.SlayerSkills neobotics.ValheimMods.SlayerSkills::_modInstance
IL_002a: call System.Void neobotics.ValheimMods.Cfg::BepInExConfig(BepInEx.BaseUnityPlugin)
IL_002f: call neobotics.ModSdk.ServerConfiguration neobotics.ModSdk.ServerConfiguration::get_Instance()
IL_0034: callvirt System.Void neobotics.ModSdk.ServerConfiguration::CreateConfigWatcher()
IL_0039: ret

// System.Void neobotics.ValheimMods.SlayerSkills::ChangeLogging(System.Object,System.EventArgs)
.locals BepInEx.Configuration.SettingChangedEventArgs
IL_0000: ldarg.1
IL_0001: isinst BepInEx.Configuration.SettingChangedEventArgs
IL_0006: stloc.0
IL_0007: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_000c: ldstr "ChangeLog {0} to {1}"
IL_0011: ldloc.0
IL_0012: callvirt BepInEx.Configuration.ConfigEntryBase BepInEx.Configuration.SettingChangedEventArgs::get_ChangedSetting()
IL_0017: callvirt BepInEx.Configuration.ConfigDefinition BepInEx.Configuration.ConfigEntryBase::get_Definition()
IL_001c: callvirt System.String BepInEx.Configuration.ConfigDefinition::get_Key()
IL_0021: ldloc.0
IL_0022: callvirt BepInEx.Configuration.ConfigEntryBase BepInEx.Configuration.SettingChangedEventArgs::get_ChangedSetting()
IL_0027: callvirt System.Object BepInEx.Configuration.ConfigEntryBase::get_BoxedValue()
IL_002c: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_0031: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0036: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_003b: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ModSdk.Logging/LogLevels> neobotics.ValheimMods.Cfg::debugLevel
IL_0040: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ModSdk.Logging/LogLevels>::get_Value()
IL_0045: callvirt System.Void neobotics.ModSdk.Logging::set_LogLevel(neobotics.ModSdk.Logging/LogLevels)
IL_004a: ret

// System.Void neobotics.ValheimMods.SlayerSkills::ChangeColor(System.Object,System.EventArgs)
.locals BepInEx.Configuration.SettingChangedEventArgs
IL_0000: ldarg.1
IL_0001: isinst BepInEx.Configuration.SettingChangedEventArgs
IL_0006: stloc.0
IL_0007: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_000c: ldstr "ChangeColor {0} to {1}"
IL_0011: ldloc.0
IL_0012: callvirt BepInEx.Configuration.ConfigEntryBase BepInEx.Configuration.SettingChangedEventArgs::get_ChangedSetting()
IL_0017: callvirt BepInEx.Configuration.ConfigDefinition BepInEx.Configuration.ConfigEntryBase::get_Definition()
IL_001c: callvirt System.String BepInEx.Configuration.ConfigDefinition::get_Key()
IL_0021: ldloc.0
IL_0022: callvirt BepInEx.Configuration.ConfigEntryBase BepInEx.Configuration.SettingChangedEventArgs::get_ChangedSetting()
IL_0027: callvirt System.Object BepInEx.Configuration.ConfigEntryBase::get_BoxedValue()
IL_002c: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_0031: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0036: ldstr "#"
IL_003b: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<UnityEngine.Color> neobotics.ValheimMods.Cfg::skillColor
IL_0040: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<UnityEngine.Color>::get_Value()
IL_0045: call System.String UnityEngine.ColorUtility::ToHtmlStringRGB(UnityEngine.Color)
IL_004a: call System.String System.String::Concat(System.String,System.String)
IL_004f: stsfld System.String neobotics.ValheimMods.SlayerSkills::colorString
IL_0054: ret

// System.Void neobotics.ValheimMods.SlayerSkills::OnDestroy()
.locals 
IL_0000: ldsfld HarmonyLib.Harmony neobotics.ValheimMods.SlayerSkills::harmony
IL_0005: callvirt System.Void HarmonyLib.Harmony::UnpatchSelf()
IL_000a: ret

// System.Int32 neobotics.ValheimMods.SlayerSkills::GetVersionID(System.String)
.locals System.String[]
IL_0000: ldarg.0
IL_0001: ldc.i4.s 46
IL_0003: ldc.i4.0
IL_0004: callvirt System.String[] System.String::Split(System.Char,System.StringSplitOptions)
IL_0009: stloc.0
IL_000a: ldloc.0
IL_000b: ldc.i4.0
IL_000c: ldelem.ref
IL_000d: call System.Int32 System.Int32::Parse(System.String)
IL_0012: ldc.i4 10000
IL_0017: mul
IL_0018: ldloc.0
IL_0019: ldc.i4.1
IL_001a: ldelem.ref
IL_001b: call System.Int32 System.Int32::Parse(System.String)
IL_0020: ldc.i4 1000
IL_0025: mul
IL_0026: add
IL_0027: ldloc.0
IL_0028: ldc.i4.2
IL_0029: ldelem.ref
IL_002a: call System.Int32 System.Int32::Parse(System.String)
IL_002f: add
IL_0030: ret

// System.Boolean neobotics.ValheimMods.SlayerSkills::OkToKey(Player)
.locals 
IL_0000: call Chat Chat::get_instance()
IL_0005: callvirt System.Boolean Chat::HasFocus()
IL_000a: brtrue.s IL_0072
IL_000c: call System.Boolean Console::IsVisible()
IL_0011: brtrue.s IL_0072
IL_0013: call TextViewer TextViewer::get_instance()
IL_0018: ldnull
IL_0019: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_001e: brfalse.s IL_0072
IL_0020: call TextViewer TextViewer::get_instance()
IL_0025: callvirt System.Boolean TextViewer::IsVisible()
IL_002a: brtrue.s IL_0072
IL_002c: call System.Boolean GameCamera::InFreeFly()
IL_0031: brtrue.s IL_0072
IL_0033: call System.Boolean Minimap::IsOpen()
IL_0038: brtrue.s IL_0072
IL_003a: call System.Boolean TextInput::IsVisible()
IL_003f: brtrue.s IL_0072
IL_0041: call System.Boolean StoreGui::IsVisible()
IL_0046: brtrue.s IL_0072
IL_0048: ldarg.0
IL_0049: callvirt System.Boolean Character::InCutscene()
IL_004e: brtrue.s IL_0072
IL_0050: ldarg.0
IL_0051: callvirt System.Boolean Character::InBed()
IL_0056: brtrue.s IL_0072
IL_0058: ldarg.0
IL_0059: callvirt System.Boolean Character::IsTeleporting()
IL_005e: brtrue.s IL_0072
IL_0060: ldarg.0
IL_0061: callvirt System.Boolean Character::IsDead()
IL_0066: brtrue.s IL_0072
IL_0068: ldarg.0
IL_0069: callvirt System.Boolean Character::InPlaceMode()
IL_006e: ldc.i4.0
IL_006f: ceq
IL_0071: ret
IL_0072: ldc.i4.0
IL_0073: ret

// System.Void neobotics.ValheimMods.SlayerSkills::KeypressEntryPoint()
.locals 
IL_0000: ldsfld Player Player::m_localPlayer
IL_0005: pop
IL_0006: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_000b: ldstr "KeypressEntryPoint"
IL_0010: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0015: ret

// System.String neobotics.ValheimMods.SlayerSkills::GetTrophyDisplayName(System.String)
.locals System.String, System.String
IL_0000: call Localization Localization::get_instance()
IL_0005: ldarg.0
IL_0006: callvirt System.String Localization::Localize(System.String)
IL_000b: stloc.0
IL_000c: ldloc.0
IL_000d: ldstr " trophy"
IL_0012: callvirt System.Boolean System.String::EndsWith(System.String)
IL_0017: brtrue.s IL_001c
IL_0019: ldloc.0
IL_001a: br.s IL_002b
IL_001c: ldloc.0
IL_001d: ldc.i4.0
IL_001e: ldloc.0
IL_001f: callvirt System.Int32 System.String::get_Length()
IL_0024: ldc.i4.7
IL_0025: sub
IL_0026: callvirt System.String System.String::Substring(System.Int32,System.Int32)
IL_002b: stloc.1
IL_002c: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0031: ldc.i4.6
IL_0032: newarr System.String
IL_0037: dup
IL_0038: ldc.i4.0
IL_0039: ldstr "Trophy name "
IL_003e: stelem.ref
IL_003f: dup
IL_0040: ldc.i4.1
IL_0041: ldarg.0
IL_0042: stelem.ref
IL_0043: dup
IL_0044: ldc.i4.2
IL_0045: ldstr " Localized name "
IL_004a: stelem.ref
IL_004b: dup
IL_004c: ldc.i4.3
IL_004d: ldloc.0
IL_004e: stelem.ref
IL_004f: dup
IL_0050: ldc.i4.4
IL_0051: ldstr " Display name "
IL_0056: stelem.ref
IL_0057: dup
IL_0058: ldc.i4.5
IL_0059: ldloc.1
IL_005a: stelem.ref
IL_005b: call System.String System.String::Concat(System.String[])
IL_0060: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0065: ldloc.1
IL_0066: ret

// System.String neobotics.ValheimMods.SlayerSkills::GetTrophyDisplayNameCaseInsensitive(System.String)
.locals System.String
IL_0000: call Localization Localization::get_instance()
IL_0005: ldarg.0
IL_0006: callvirt System.String Localization::Localize(System.String)
IL_000b: stloc.0
IL_000c: ldloc.0
IL_000d: ldstr " trophy"
IL_0012: callvirt System.Boolean System.String::EndsWith(System.String)
IL_0017: brtrue.s IL_001b
IL_0019: ldloc.0
IL_001a: ret
IL_001b: ldloc.0
IL_001c: ldc.i4.0
IL_001d: ldloc.0
IL_001e: callvirt System.Int32 System.String::get_Length()
IL_0023: ldc.i4.7
IL_0024: sub
IL_0025: callvirt System.String System.String::Substring(System.Int32,System.Int32)
IL_002a: ret

// System.Void neobotics.ValheimMods.SlayerSkills::ApplySlayerBonus(HitData,System.Single)
.locals System.Single, System.Single
IL_0000: ldarg.1
IL_0001: ldc.r4 0
IL_0006: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::trophyCap
IL_000b: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::get_Value()
IL_0010: conv.r4
IL_0011: call System.Single UnityEngine.Mathf::Clamp(System.Single,System.Single,System.Single)
IL_0016: starg.s skillLevel
IL_0018: ldarg.1
IL_0019: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::trophyCap
IL_001e: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::get_Value()
IL_0023: conv.r4
IL_0024: div
IL_0025: stloc.0
IL_0026: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::damageCap
IL_002b: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::get_Value()
IL_0030: conv.r4
IL_0031: ldc.r4 100
IL_0036: div
IL_0037: ldloc.0
IL_0038: mul
IL_0039: stloc.1
IL_003a: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_003f: ldstr "Before slayer Level {0} multiplier {1} blunt {2} slash {3} pierce {4} fire {5} frost {6} lightning {7} poison {8} spirit {9}"
IL_0044: ldc.i4.s 10
IL_0046: newarr System.Object
IL_004b: dup
IL_004c: ldc.i4.0
IL_004d: ldarg.1
IL_004e: box System.Single
IL_0053: stelem.ref
IL_0054: dup
IL_0055: ldc.i4.1
IL_0056: ldloc.1
IL_0057: box System.Single
IL_005c: stelem.ref
IL_005d: dup
IL_005e: ldc.i4.2
IL_005f: ldarg.0
IL_0060: ldflda HitData/DamageTypes HitData::m_damage
IL_0065: ldfld System.Single HitData/DamageTypes::m_blunt
IL_006a: box System.Single
IL_006f: stelem.ref
IL_0070: dup
IL_0071: ldc.i4.3
IL_0072: ldarg.0
IL_0073: ldflda HitData/DamageTypes HitData::m_damage
IL_0078: ldfld System.Single HitData/DamageTypes::m_slash
IL_007d: box System.Single
IL_0082: stelem.ref
IL_0083: dup
IL_0084: ldc.i4.4
IL_0085: ldarg.0
IL_0086: ldflda HitData/DamageTypes HitData::m_damage
IL_008b: ldfld System.Single HitData/DamageTypes::m_pierce
IL_0090: box System.Single
IL_0095: stelem.ref
IL_0096: dup
IL_0097: ldc.i4.5
IL_0098: ldarg.0
IL_0099: ldflda HitData/DamageTypes HitData::m_damage
IL_009e: ldfld System.Single HitData/DamageTypes::m_fire
IL_00a3: box System.Single
IL_00a8: stelem.ref
IL_00a9: dup
IL_00aa: ldc.i4.6
IL_00ab: ldarg.0
IL_00ac: ldflda HitData/DamageTypes HitData::m_damage
IL_00b1: ldfld System.Single HitData/DamageTypes::m_frost
IL_00b6: box System.Single
IL_00bb: stelem.ref
IL_00bc: dup
IL_00bd: ldc.i4.7
IL_00be: ldarg.0
IL_00bf: ldflda HitData/DamageTypes HitData::m_damage
IL_00c4: ldfld System.Single HitData/DamageTypes::m_lightning
IL_00c9: box System.Single
IL_00ce: stelem.ref
IL_00cf: dup
IL_00d0: ldc.i4.8
IL_00d1: ldarg.0
IL_00d2: ldflda HitData/DamageTypes HitData::m_damage
IL_00d7: ldfld System.Single HitData/DamageTypes::m_poison
IL_00dc: box System.Single
IL_00e1: stelem.ref
IL_00e2: dup
IL_00e3: ldc.i4.s 9
IL_00e5: ldarg.0
IL_00e6: ldflda HitData/DamageTypes HitData::m_damage
IL_00eb: ldfld System.Single HitData/DamageTypes::m_spirit
IL_00f0: box System.Single
IL_00f5: stelem.ref
IL_00f6: call System.String System.String::Format(System.String,System.Object[])
IL_00fb: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0100: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::damagePhysical
IL_0105: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::get_Value()
IL_010a: brfalse.s IL_0160
IL_010c: ldarg.0
IL_010d: ldflda HitData/DamageTypes HitData::m_damage
IL_0112: ldflda System.Single HitData/DamageTypes::m_blunt
IL_0117: dup
IL_0118: ldind.r4
IL_0119: ldarg.0
IL_011a: ldflda HitData/DamageTypes HitData::m_damage
IL_011f: ldfld System.Single HitData/DamageTypes::m_blunt
IL_0124: ldloc.1
IL_0125: mul
IL_0126: add
IL_0127: stind.r4
IL_0128: ldarg.0
IL_0129: ldflda HitData/DamageTypes HitData::m_damage
IL_012e: ldflda System.Single HitData/DamageTypes::m_slash
IL_0133: dup
IL_0134: ldind.r4
IL_0135: ldarg.0
IL_0136: ldflda HitData/DamageTypes HitData::m_damage
IL_013b: ldfld System.Single HitData/DamageTypes::m_slash
IL_0140: ldloc.1
IL_0141: mul
IL_0142: add
IL_0143: stind.r4
IL_0144: ldarg.0
IL_0145: ldflda HitData/DamageTypes HitData::m_damage
IL_014a: ldflda System.Single HitData/DamageTypes::m_pierce
IL_014f: dup
IL_0150: ldind.r4
IL_0151: ldarg.0
IL_0152: ldflda HitData/DamageTypes HitData::m_damage
IL_0157: ldfld System.Single HitData/DamageTypes::m_pierce
IL_015c: ldloc.1
IL_015d: mul
IL_015e: add
IL_015f: stind.r4
IL_0160: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::damageElemental
IL_0165: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::get_Value()
IL_016a: brfalse.s IL_01c0
IL_016c: ldarg.0
IL_016d: ldflda HitData/DamageTypes HitData::m_damage
IL_0172: ldflda System.Single HitData/DamageTypes::m_fire
IL_0177: dup
IL_0178: ldind.r4
IL_0179: ldarg.0
IL_017a: ldflda HitData/DamageTypes HitData::m_damage
IL_017f: ldfld System.Single HitData/DamageTypes::m_fire
IL_0184: ldloc.1
IL_0185: mul
IL_0186: add
IL_0187: stind.r4
IL_0188: ldarg.0
IL_0189: ldflda HitData/DamageTypes HitData::m_damage
IL_018e: ldflda System.Single HitData/DamageTypes::m_frost
IL_0193: dup
IL_0194: ldind.r4
IL_0195: ldarg.0
IL_0196: ldflda HitData/DamageTypes HitData::m_damage
IL_019b: ldfld System.Single HitData/DamageTypes::m_frost
IL_01a0: ldloc.1
IL_01a1: mul
IL_01a2: add
IL_01a3: stind.r4
IL_01a4: ldarg.0
IL_01a5: ldflda HitData/DamageTypes HitData::m_damage
IL_01aa: ldflda System.Single HitData/DamageTypes::m_lightning
IL_01af: dup
IL_01b0: ldind.r4
IL_01b1: ldarg.0
IL_01b2: ldflda HitData/DamageTypes HitData::m_damage
IL_01b7: ldfld System.Single HitData/DamageTypes::m_lightning
IL_01bc: ldloc.1
IL_01bd: mul
IL_01be: add
IL_01bf: stind.r4
IL_01c0: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::damageOther
IL_01c5: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::get_Value()
IL_01ca: brfalse.s IL_0204
IL_01cc: ldarg.0
IL_01cd: ldflda HitData/DamageTypes HitData::m_damage
IL_01d2: ldflda System.Single HitData/DamageTypes::m_spirit
IL_01d7: dup
IL_01d8: ldind.r4
IL_01d9: ldarg.0
IL_01da: ldflda HitData/DamageTypes HitData::m_damage
IL_01df: ldfld System.Single HitData/DamageTypes::m_spirit
IL_01e4: ldloc.1
IL_01e5: mul
IL_01e6: add
IL_01e7: stind.r4
IL_01e8: ldarg.0
IL_01e9: ldflda HitData/DamageTypes HitData::m_damage
IL_01ee: ldflda System.Single HitData/DamageTypes::m_poison
IL_01f3: dup
IL_01f4: ldind.r4
IL_01f5: ldarg.0
IL_01f6: ldflda HitData/DamageTypes HitData::m_damage
IL_01fb: ldfld System.Single HitData/DamageTypes::m_poison
IL_0200: ldloc.1
IL_0201: mul
IL_0202: add
IL_0203: stind.r4
IL_0204: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0209: ldstr "After slayer Level {0} multiplier {1} blunt {2} slash {3} pierce {4} fire {5} frost {6} lightning {7} poison {8} spirit {9}"
IL_020e: ldc.i4.s 10
IL_0210: newarr System.Object
IL_0215: dup
IL_0216: ldc.i4.0
IL_0217: ldarg.1
IL_0218: box System.Single
IL_021d: stelem.ref
IL_021e: dup
IL_021f: ldc.i4.1
IL_0220: ldloc.1
IL_0221: box System.Single
IL_0226: stelem.ref
IL_0227: dup
IL_0228: ldc.i4.2
IL_0229: ldarg.0
IL_022a: ldflda HitData/DamageTypes HitData::m_damage
IL_022f: ldfld System.Single HitData/DamageTypes::m_blunt
IL_0234: box System.Single
IL_0239: stelem.ref
IL_023a: dup
IL_023b: ldc.i4.3
IL_023c: ldarg.0
IL_023d: ldflda HitData/DamageTypes HitData::m_damage
IL_0242: ldfld System.Single HitData/DamageTypes::m_slash
IL_0247: box System.Single
IL_024c: stelem.ref
IL_024d: dup
IL_024e: ldc.i4.4
IL_024f: ldarg.0
IL_0250: ldflda HitData/DamageTypes HitData::m_damage
IL_0255: ldfld System.Single HitData/DamageTypes::m_pierce
IL_025a: box System.Single
IL_025f: stelem.ref
IL_0260: dup
IL_0261: ldc.i4.5
IL_0262: ldarg.0
IL_0263: ldflda HitData/DamageTypes HitData::m_damage
IL_0268: ldfld System.Single HitData/DamageTypes::m_fire
IL_026d: box System.Single
IL_0272: stelem.ref
IL_0273: dup
IL_0274: ldc.i4.6
IL_0275: ldarg.0
IL_0276: ldflda HitData/DamageTypes HitData::m_damage
IL_027b: ldfld System.Single HitData/DamageTypes::m_frost
IL_0280: box System.Single
IL_0285: stelem.ref
IL_0286: dup
IL_0287: ldc.i4.7
IL_0288: ldarg.0
IL_0289: ldflda HitData/DamageTypes HitData::m_damage
IL_028e: ldfld System.Single HitData/DamageTypes::m_lightning
IL_0293: box System.Single
IL_0298: stelem.ref
IL_0299: dup
IL_029a: ldc.i4.8
IL_029b: ldarg.0
IL_029c: ldflda HitData/DamageTypes HitData::m_damage
IL_02a1: ldfld System.Single HitData/DamageTypes::m_poison
IL_02a6: box System.Single
IL_02ab: stelem.ref
IL_02ac: dup
IL_02ad: ldc.i4.s 9
IL_02af: ldarg.0
IL_02b0: ldflda HitData/DamageTypes HitData::m_damage
IL_02b5: ldfld System.Single HitData/DamageTypes::m_spirit
IL_02ba: box System.Single
IL_02bf: stelem.ref
IL_02c0: call System.String System.String::Format(System.String,System.Object[])
IL_02c5: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_02ca: ret

// System.Void neobotics.ValheimMods.SlayerSkills::BuildCreatureTrophyMap()
.locals System.Collections.Generic.List`1/Enumerator<UnityEngine.GameObject>, UnityEngine.GameObject, Character, CharacterDrop, System.Collections.Generic.List`1/Enumerator<CharacterDrop/Drop>, CharacterDrop/Drop, ItemDrop, System.String, System.String
IL_0000: call ZNetScene ZNetScene::get_instance()
IL_0005: dup
IL_0006: brtrue.s IL_000c
IL_0008: pop
IL_0009: ldnull
IL_000a: br.s IL_0011
IL_000c: ldfld System.Collections.Generic.List`1<UnityEngine.GameObject> ZNetScene::m_prefabs
IL_0011: brtrue.s IL_0023
IL_0013: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0018: ldstr "ZNetScene instance is null"
IL_001d: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0022: ret
IL_0023: call ZNetScene ZNetScene::get_instance()
IL_0028: ldfld System.Collections.Generic.List`1<UnityEngine.GameObject> ZNetScene::m_prefabs
IL_002d: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<UnityEngine.GameObject>::GetEnumerator()
IL_0032: stloc.0
IL_0033: br IL_01b2
IL_0038: ldloca.s V_0
IL_003a: call !0 System.Collections.Generic.List`1/Enumerator<UnityEngine.GameObject>::get_Current()
IL_003f: stloc.1
IL_0040: ldloc.1
IL_0041: callvirt !!0 UnityEngine.GameObject::GetComponent<Humanoid>()
IL_0046: stloc.2
IL_0047: ldloc.2
IL_0048: ldnull
IL_0049: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_004e: brfalse.s IL_0057
IL_0050: ldloc.1
IL_0051: callvirt !!0 UnityEngine.GameObject::GetComponent<Character>()
IL_0056: stloc.2
IL_0057: ldloc.2
IL_0058: ldnull
IL_0059: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_005e: brfalse IL_01b2
IL_0063: ldloc.1
IL_0064: ldloca.s V_3
IL_0066: callvirt System.Boolean UnityEngine.GameObject::TryGetComponent<CharacterDrop>(!!0&)
IL_006b: brfalse IL_01b2
IL_0070: ldloc.3
IL_0071: ldfld System.Collections.Generic.List`1<CharacterDrop/Drop> CharacterDrop::m_drops
IL_0076: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<CharacterDrop/Drop>::GetEnumerator()
IL_007b: stloc.s V_4
IL_007d: br IL_0196
IL_0082: ldloca.s V_4
IL_0084: call !0 System.Collections.Generic.List`1/Enumerator<CharacterDrop/Drop>::get_Current()
IL_0089: stloc.s V_5
IL_008b: ldloc.s V_5
IL_008d: ldfld UnityEngine.GameObject CharacterDrop/Drop::m_prefab
IL_0092: ldnull
IL_0093: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0098: brfalse IL_0196
IL_009d: ldloc.s V_5
IL_009f: ldfld UnityEngine.GameObject CharacterDrop/Drop::m_prefab
IL_00a4: ldloca.s V_6
IL_00a6: callvirt System.Boolean UnityEngine.GameObject::TryGetComponent<ItemDrop>(!!0&)
IL_00ab: brfalse IL_0196
IL_00b0: ldloc.s V_6
IL_00b2: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_00b7: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_00bc: ldfld ItemDrop/ItemData/ItemType ItemDrop/ItemData/SharedData::m_itemType
IL_00c1: ldc.i4.s 13
IL_00c3: bne.un IL_0196
IL_00c8: ldloc.s V_6
IL_00ca: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_00cf: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_00d4: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_00d9: stloc.s V_7
IL_00db: ldloc.s V_7
IL_00dd: call System.String neobotics.ValheimMods.SlayerSkills::GetTrophyDisplayName(System.String)
IL_00e2: stloc.s V_8
IL_00e4: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.String> neobotics.ValheimMods.SlayerSkills::creatureTrophyMap
IL_00e9: ldloc.2
IL_00ea: callvirt System.String UnityEngine.Object::get_name()
IL_00ef: callvirt System.Boolean System.Collections.Generic.IDictionary`2<System.String,System.String>::ContainsKey(!0)
IL_00f4: brtrue.s IL_0143
IL_00f6: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_00fb: ldc.i4.5
IL_00fc: newarr System.String
IL_0101: dup
IL_0102: ldc.i4.0
IL_0103: ldstr "Adding "
IL_0108: stelem.ref
IL_0109: dup
IL_010a: ldc.i4.1
IL_010b: ldloc.2
IL_010c: callvirt System.String UnityEngine.Object::get_name()
IL_0111: stelem.ref
IL_0112: dup
IL_0113: ldc.i4.2
IL_0114: ldstr " "
IL_0119: stelem.ref
IL_011a: dup
IL_011b: ldc.i4.3
IL_011c: ldloc.s V_7
IL_011e: stelem.ref
IL_011f: dup
IL_0120: ldc.i4.4
IL_0121: ldstr " to original trophy map"
IL_0126: stelem.ref
IL_0127: call System.String System.String::Concat(System.String[])
IL_012c: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0131: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.String> neobotics.ValheimMods.SlayerSkills::creatureTrophyMap
IL_0136: ldloc.2
IL_0137: callvirt System.String UnityEngine.Object::get_name()
IL_013c: ldloc.s V_7
IL_013e: callvirt System.Void System.Collections.Generic.IDictionary`2<System.String,System.String>::Add(!0,!1)
IL_0143: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.String> neobotics.ValheimMods.SlayerSkills::nameToTokenMap
IL_0148: ldloc.s V_8
IL_014a: callvirt System.Boolean System.Collections.Generic.IDictionary`2<System.String,System.String>::ContainsKey(!0)
IL_014f: brtrue.s IL_0196
IL_0151: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0156: ldc.i4.5
IL_0157: newarr System.String
IL_015c: dup
IL_015d: ldc.i4.0
IL_015e: ldstr "Adding "
IL_0163: stelem.ref
IL_0164: dup
IL_0165: ldc.i4.1
IL_0166: ldloc.s V_8
IL_0168: stelem.ref
IL_0169: dup
IL_016a: ldc.i4.2
IL_016b: ldstr " "
IL_0170: stelem.ref
IL_0171: dup
IL_0172: ldc.i4.3
IL_0173: ldloc.s V_7
IL_0175: stelem.ref
IL_0176: dup
IL_0177: ldc.i4.4
IL_0178: ldstr " to name-to-token map"
IL_017d: stelem.ref
IL_017e: call System.String System.String::Concat(System.String[])
IL_0183: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0188: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.String> neobotics.ValheimMods.SlayerSkills::nameToTokenMap
IL_018d: ldloc.s V_8
IL_018f: ldloc.s V_7
IL_0191: callvirt System.Void System.Collections.Generic.IDictionary`2<System.String,System.String>::Add(!0,!1)
IL_0196: ldloca.s V_4
IL_0198: call System.Boolean System.Collections.Generic.List`1/Enumerator<CharacterDrop/Drop>::MoveNext()
IL_019d: brtrue IL_0082
IL_01a2: leave.s IL_01b2
IL_01a4: ldloca.s V_4
IL_01a6: constrained. System.Collections.Generic.List`1/Enumerator<CharacterDrop/Drop>
IL_01ac: callvirt System.Void System.IDisposable::Dispose()
IL_01b1: endfinally
IL_01b2: ldloca.s V_0
IL_01b4: call System.Boolean System.Collections.Generic.List`1/Enumerator<UnityEngine.GameObject>::MoveNext()
IL_01b9: brtrue IL_0038
IL_01be: leave.s IL_01ce
IL_01c0: ldloca.s V_0
IL_01c2: constrained. System.Collections.Generic.List`1/Enumerator<UnityEngine.GameObject>
IL_01c8: callvirt System.Void System.IDisposable::Dispose()
IL_01cd: endfinally
IL_01ce: ret
// EH Finally: 125 - 420 => 420 - 434
// EH Finally: 51 - 448 => 448 - 462

// System.Int32 neobotics.ValheimMods.SlayerSkills::FlooredLevel(System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Int32 UnityEngine.Mathf::FloorToInt(System.Single)
IL_0006: ret

// System.Void neobotics.ValheimMods.SlayerSkills::RaiseStat(System.String,System.Single)
.locals System.Boolean, System.String, System.Int32, System.Int32, System.Int32, System.Collections.Generic.IDictionary`2<System.String,System.Single>, System.String, UnityEngine.Transform, ZDOID
IL_0000: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0005: ldstr "RaiseStat"
IL_000a: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_000f: ldc.i4.0
IL_0010: stloc.0
IL_0011: ldarg.0
IL_0012: call System.String neobotics.ValheimMods.SlayerSkills::GetTrophyDisplayName(System.String)
IL_0017: stloc.1
IL_0018: ldloc.1
IL_0019: callvirt System.String System.String::ToLower()
IL_001e: ldstr " trophy"
IL_0023: callvirt System.Boolean System.String::EndsWith(System.String)
IL_0028: brfalse.s IL_003a
IL_002a: ldloc.1
IL_002b: ldc.i4.0
IL_002c: ldloc.1
IL_002d: callvirt System.Int32 System.String::get_Length()
IL_0032: ldc.i4.7
IL_0033: sub
IL_0034: callvirt System.String System.String::Substring(System.Int32,System.Int32)
IL_0039: stloc.1
IL_003a: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_003f: ldarg.0
IL_0040: ldstr " translates to trophy name "
IL_0045: ldloc.1
IL_0046: call System.String System.String::Concat(System.String,System.String,System.String)
IL_004b: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0050: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_0055: ldarg.0
IL_0056: callvirt System.Boolean System.Collections.Generic.IDictionary`2<System.String,System.Single>::ContainsKey(!0)
IL_005b: brtrue.s IL_00b4
IL_005d: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_0062: ldarg.0
IL_0063: ldarg.1
IL_0064: callvirt System.Void System.Collections.Generic.IDictionary`2<System.String,System.Single>::Add(!0,!1)
IL_0069: ldarg.1
IL_006a: call System.Int32 neobotics.ValheimMods.SlayerSkills::FlooredLevel(System.Single)
IL_006f: stloc.2
IL_0070: ldloc.2
IL_0071: ldc.i4.1
IL_0072: blt.s IL_0095
IL_0074: ldsfld Player Player::m_localPlayer
IL_0079: ldc.i4.2
IL_007a: ldstr "{0} Slayer Level {1}"
IL_007f: ldloc.1
IL_0080: ldloc.2
IL_0081: box System.Int32
IL_0086: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_008b: ldc.i4.0
IL_008c: ldnull
IL_008d: ldc.i4.0
IL_008e: callvirt System.Void Character::Message(MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_0093: ldc.i4.1
IL_0094: stloc.0
IL_0095: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_009a: ldstr "Adding "
IL_009f: ldloc.1
IL_00a0: ldstr " to slayer collection"
IL_00a5: call System.String System.String::Concat(System.String,System.String,System.String)
IL_00aa: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_00af: br IL_016b
IL_00b4: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_00b9: ldarg.0
IL_00ba: callvirt !1 System.Collections.Generic.IDictionary`2<System.String,System.Single>::get_Item(!0)
IL_00bf: call System.Int32 neobotics.ValheimMods.SlayerSkills::FlooredLevel(System.Single)
IL_00c4: stloc.3
IL_00c5: ldloc.3
IL_00c6: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::trophyCap
IL_00cb: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::get_Value()
IL_00d0: bge IL_015c
IL_00d5: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_00da: stloc.s V_5
IL_00dc: ldarg.0
IL_00dd: stloc.s V_6
IL_00df: ldloc.s V_5
IL_00e1: ldloc.s V_6
IL_00e3: ldloc.s V_5
IL_00e5: ldloc.s V_6
IL_00e7: callvirt !1 System.Collections.Generic.IDictionary`2<System.String,System.Single>::get_Item(!0)
IL_00ec: ldarg.1
IL_00ed: add
IL_00ee: callvirt System.Void System.Collections.Generic.IDictionary`2<System.String,System.Single>::set_Item(!0,!1)
IL_00f3: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_00f8: ldarg.0
IL_00f9: callvirt !1 System.Collections.Generic.IDictionary`2<System.String,System.Single>::get_Item(!0)
IL_00fe: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::trophyCap
IL_0103: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::get_Value()
IL_0108: conv.r4
IL_0109: ble.un.s IL_0121
IL_010b: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_0110: ldarg.0
IL_0111: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::trophyCap
IL_0116: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::get_Value()
IL_011b: conv.r4
IL_011c: callvirt System.Void System.Collections.Generic.IDictionary`2<System.String,System.Single>::set_Item(!0,!1)
IL_0121: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_0126: ldarg.0
IL_0127: callvirt !1 System.Collections.Generic.IDictionary`2<System.String,System.Single>::get_Item(!0)
IL_012c: call System.Int32 neobotics.ValheimMods.SlayerSkills::FlooredLevel(System.Single)
IL_0131: stloc.s V_4
IL_0133: ldloc.s V_4
IL_0135: ldloc.3
IL_0136: ble.s IL_016b
IL_0138: ldsfld Player Player::m_localPlayer
IL_013d: ldc.i4.1
IL_013e: ldstr "{0} Slayer Level {1}"
IL_0143: ldloc.1
IL_0144: ldloc.s V_4
IL_0146: box System.Int32
IL_014b: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_0150: ldc.i4.0
IL_0151: ldnull
IL_0152: ldc.i4.0
IL_0153: callvirt System.Void Character::Message(MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_0158: ldc.i4.1
IL_0159: stloc.0
IL_015a: br.s IL_016b
IL_015c: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0161: ldstr "Trophy cap reached"
IL_0166: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_016b: ldloc.0
IL_016c: brfalse.s IL_01a6
IL_016e: ldsfld Player Player::m_localPlayer
IL_0173: dup
IL_0174: ldfld UnityEngine.Transform Character::m_head
IL_0179: stloc.s V_7
IL_017b: ldfld EffectList Player::m_skillLevelupEffects
IL_0180: ldloc.s V_7
IL_0182: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0187: ldloc.s V_7
IL_0189: callvirt UnityEngine.Quaternion UnityEngine.Transform::get_rotation()
IL_018e: ldloc.s V_7
IL_0190: ldc.r4 1
IL_0195: ldc.i4.m1
IL_0196: ldloca.s V_8
IL_0198: initobj ZDOID
IL_019e: ldloc.s V_8
IL_01a0: callvirt UnityEngine.GameObject[] EffectList::Create(UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Transform,System.Single,System.Int32,ZDOID)
IL_01a5: pop
IL_01a6: ret

// System.Void neobotics.ValheimMods.SlayerSkills::RPC_RaiseSlayerStat(System.Int64,System.String,System.Single)
.locals 
IL_0000: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0005: ldstr "RPC_RaiseSlayerStat"
IL_000a: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_000f: ldarg.1
IL_0010: ldarg.2
IL_0011: call System.Void neobotics.ValheimMods.SlayerSkills::RaiseStat(System.String,System.Single)
IL_0016: ret

// System.Collections.Generic.List`1<Player> neobotics.ValheimMods.SlayerSkills::GetPlayersInRange(UnityEngine.Vector3,System.Single,System.Collections.Generic.List`1<Player>)
.locals System.Collections.Generic.List`1<Player>, System.Collections.Generic.List`1/Enumerator<Player>, Player
IL_0000: newobj System.Void System.Collections.Generic.List`1<Player>::.ctor()
IL_0005: stloc.0
IL_0006: ldarg.2
IL_0007: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Player>::GetEnumerator()
IL_000c: stloc.1
IL_000d: br.s IL_0032
IL_000f: ldloca.s V_1
IL_0011: call !0 System.Collections.Generic.List`1/Enumerator<Player>::get_Current()
IL_0016: stloc.2
IL_0017: ldloc.2
IL_0018: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_001d: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0022: ldarg.0
IL_0023: call System.Single UnityEngine.Vector3::Distance(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0028: ldarg.1
IL_0029: bge.un.s IL_0032
IL_002b: ldloc.0
IL_002c: ldloc.2
IL_002d: callvirt System.Void System.Collections.Generic.List`1<Player>::Add(!0)
IL_0032: ldloca.s V_1
IL_0034: call System.Boolean System.Collections.Generic.List`1/Enumerator<Player>::MoveNext()
IL_0039: brtrue.s IL_000f
IL_003b: leave.s IL_004b
IL_003d: ldloca.s V_1
IL_003f: constrained. System.Collections.Generic.List`1/Enumerator<Player>
IL_0045: callvirt System.Void System.IDisposable::Dispose()
IL_004a: endfinally
IL_004b: ldloc.0
IL_004c: ret
// EH Finally: 13 - 61 => 61 - 75

// System.Void neobotics.ValheimMods.SlayerSkills::InitiateRaiseStat(System.String,System.Single,UnityEngine.Vector3,System.Int64)
.locals System.Collections.Generic.List`1<Player>, System.Int32, System.Collections.Generic.List`1<Player>, System.Int32, ZNetView, System.Collections.Generic.List`1/Enumerator<Player>, Player, ZNetView
IL_0000: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0005: ldstr "IntitiateRaiseStat"
IL_000a: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_000f: call System.Collections.Generic.List`1<Player> Player::GetAllPlayers()
IL_0014: stloc.0
IL_0015: ldloc.0
IL_0016: call System.Int32 System.Linq.Enumerable::Count<Player>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_001b: stloc.1
IL_001c: ldloc.1
IL_001d: ldc.i4.1
IL_001e: ble IL_027f
IL_0023: ldarg.2
IL_0024: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::trophyDistance
IL_0029: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::get_Value()
IL_002e: conv.r4
IL_002f: ldloc.0
IL_0030: call System.Collections.Generic.List`1<Player> neobotics.ValheimMods.SlayerSkills::GetPlayersInRange(UnityEngine.Vector3,System.Single,System.Collections.Generic.List`1<Player>)
IL_0035: stloc.2
IL_0036: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_003b: ldstr "Players in range {0}"
IL_0040: ldloc.2
IL_0041: callvirt System.Int32 System.Collections.Generic.List`1<Player>::get_Count()
IL_0046: box System.Int32
IL_004b: call System.String System.String::Format(System.String,System.Object)
IL_0050: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0055: ldloc.2
IL_0056: callvirt System.Int32 System.Collections.Generic.List`1<Player>::get_Count()
IL_005b: ldloc.1
IL_005c: bge.s IL_007f
IL_005e: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0063: ldstr "{0} player(s) not in range of the dropped trophy."
IL_0068: ldloc.1
IL_0069: ldloc.2
IL_006a: callvirt System.Int32 System.Collections.Generic.List`1<Player>::get_Count()
IL_006f: sub
IL_0070: box System.Int32
IL_0075: call System.String System.String::Format(System.String,System.Object)
IL_007a: callvirt System.Void neobotics.ModSdk.Logging::Info(System.String)
IL_007f: ldloc.2
IL_0080: callvirt System.Int32 System.Collections.Generic.List`1<Player>::get_Count()
IL_0085: ldc.i4.0
IL_0086: ble IL_0286
IL_008b: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0090: ldstr "Assigning Slayer points using {0}"
IL_0095: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ValheimMods.SlayerSkills/Points> neobotics.ValheimMods.Cfg::assignPoints
IL_009a: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ValheimMods.SlayerSkills/Points>::get_Value()
IL_009f: box neobotics.ValheimMods.SlayerSkills/Points
IL_00a4: call System.String System.String::Format(System.String,System.Object)
IL_00a9: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_00ae: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ValheimMods.SlayerSkills/Points> neobotics.ValheimMods.Cfg::assignPoints
IL_00b3: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ValheimMods.SlayerSkills/Points>::get_Value()
IL_00b8: ldc.i4.3
IL_00b9: bne.un.s IL_00f9
IL_00bb: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_00c0: ldstr "Invoking RPC on Single player {0}"
IL_00c5: ldarg.3
IL_00c6: box System.Int64
IL_00cb: call System.String System.String::Format(System.String,System.Object)
IL_00d0: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_00d5: call ZRoutedRpc ZRoutedRpc::get_instance()
IL_00da: ldarg.3
IL_00db: ldstr "RaiseSlayerStat"
IL_00e0: ldc.i4.2
IL_00e1: newarr System.Object
IL_00e6: dup
IL_00e7: ldc.i4.0
IL_00e8: ldarg.0
IL_00e9: stelem.ref
IL_00ea: dup
IL_00eb: ldc.i4.1
IL_00ec: ldarg.1
IL_00ed: box System.Single
IL_00f2: stelem.ref
IL_00f3: callvirt System.Void ZRoutedRpc::InvokeRoutedRPC(System.Int64,System.String,System.Object[])
IL_00f8: ret
IL_00f9: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ValheimMods.SlayerSkills/Points> neobotics.ValheimMods.Cfg::assignPoints
IL_00fe: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ValheimMods.SlayerSkills/Points>::get_Value()
IL_0103: brtrue IL_01af
IL_0108: ldc.i4.0
IL_0109: ldloc.2
IL_010a: callvirt System.Int32 System.Collections.Generic.List`1<Player>::get_Count()
IL_010f: call System.Int32 UnityEngine.Random::Range(System.Int32,System.Int32)
IL_0114: stloc.3
IL_0115: ldloc.2
IL_0116: ldloc.3
IL_0117: callvirt !0 System.Collections.Generic.List`1<Player>::get_Item(System.Int32)
IL_011c: ldloca.s V_4
IL_011e: callvirt System.Boolean UnityEngine.Component::TryGetComponent<ZNetView>(!!0&)
IL_0123: brfalse IL_0286
IL_0128: ldloc.s V_4
IL_012a: callvirt System.Boolean ZNetView::IsValid()
IL_012f: brfalse IL_0286
IL_0134: ldloc.s V_4
IL_0136: callvirt ZDO ZNetView::GetZDO()
IL_013b: ldfld ZDOID ZDO::m_uid
IL_0140: ldsfld ZDOID ZDOID::None
IL_0145: call System.Boolean ZDOID::op_Inequality(ZDOID,ZDOID)
IL_014a: brfalse IL_0286
IL_014f: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0154: ldstr "Invoking RPC on {0} Random player {1}"
IL_0159: ldloc.s V_4
IL_015b: callvirt ZDO ZNetView::GetZDO()
IL_0160: callvirt System.Int64 ZDO::GetOwner()
IL_0165: box System.Int64
IL_016a: ldloc.2
IL_016b: ldloc.3
IL_016c: callvirt !0 System.Collections.Generic.List`1<Player>::get_Item(System.Int32)
IL_0171: callvirt System.String Player::GetPlayerName()
IL_0176: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_017b: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0180: call ZRoutedRpc ZRoutedRpc::get_instance()
IL_0185: ldloc.s V_4
IL_0187: callvirt ZDO ZNetView::GetZDO()
IL_018c: callvirt System.Int64 ZDO::GetOwner()
IL_0191: ldstr "RaiseSlayerStat"
IL_0196: ldc.i4.2
IL_0197: newarr System.Object
IL_019c: dup
IL_019d: ldc.i4.0
IL_019e: ldarg.0
IL_019f: stelem.ref
IL_01a0: dup
IL_01a1: ldc.i4.1
IL_01a2: ldarg.1
IL_01a3: box System.Single
IL_01a8: stelem.ref
IL_01a9: callvirt System.Void ZRoutedRpc::InvokeRoutedRPC(System.Int64,System.String,System.Object[])
IL_01ae: ret
IL_01af: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ValheimMods.SlayerSkills/Points> neobotics.ValheimMods.Cfg::assignPoints
IL_01b4: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<neobotics.ValheimMods.SlayerSkills/Points>::get_Value()
IL_01b9: ldc.i4.2
IL_01ba: bne.un.s IL_01c7
IL_01bc: ldarg.1
IL_01bd: ldloc.2
IL_01be: callvirt System.Int32 System.Collections.Generic.List`1<Player>::get_Count()
IL_01c3: conv.r4
IL_01c4: div
IL_01c5: starg.s amount
IL_01c7: ldloc.2
IL_01c8: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Player>::GetEnumerator()
IL_01cd: stloc.s V_5
IL_01cf: br IL_0263
IL_01d4: ldloca.s V_5
IL_01d6: call !0 System.Collections.Generic.List`1/Enumerator<Player>::get_Current()
IL_01db: stloc.s V_6
IL_01dd: ldloc.s V_6
IL_01df: ldloca.s V_7
IL_01e1: callvirt System.Boolean UnityEngine.Component::TryGetComponent<ZNetView>(!!0&)
IL_01e6: brfalse.s IL_0263
IL_01e8: ldloc.s V_7
IL_01ea: callvirt System.Boolean ZNetView::IsValid()
IL_01ef: brfalse.s IL_0263
IL_01f1: ldloc.s V_7
IL_01f3: callvirt ZDO ZNetView::GetZDO()
IL_01f8: ldfld ZDOID ZDO::m_uid
IL_01fd: ldsfld ZDOID ZDOID::None
IL_0202: call System.Boolean ZDOID::op_Inequality(ZDOID,ZDOID)
IL_0207: brfalse.s IL_0263
IL_0209: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_020e: ldstr "Invoking RPC on {0} All players {1}"
IL_0213: ldloc.s V_7
IL_0215: callvirt ZDO ZNetView::GetZDO()
IL_021a: callvirt System.Int64 ZDO::GetOwner()
IL_021f: box System.Int64
IL_0224: ldloc.s V_6
IL_0226: callvirt System.String Player::GetPlayerName()
IL_022b: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_0230: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0235: call ZRoutedRpc ZRoutedRpc::get_instance()
IL_023a: ldloc.s V_7
IL_023c: callvirt ZDO ZNetView::GetZDO()
IL_0241: callvirt System.Int64 ZDO::GetOwner()
IL_0246: ldstr "RaiseSlayerStat"
IL_024b: ldc.i4.2
IL_024c: newarr System.Object
IL_0251: dup
IL_0252: ldc.i4.0
IL_0253: ldarg.0
IL_0254: stelem.ref
IL_0255: dup
IL_0256: ldc.i4.1
IL_0257: ldarg.1
IL_0258: box System.Single
IL_025d: stelem.ref
IL_025e: callvirt System.Void ZRoutedRpc::InvokeRoutedRPC(System.Int64,System.String,System.Object[])
IL_0263: ldloca.s V_5
IL_0265: call System.Boolean System.Collections.Generic.List`1/Enumerator<Player>::MoveNext()
IL_026a: brtrue IL_01d4
IL_026f: leave.s IL_0286
IL_0271: ldloca.s V_5
IL_0273: constrained. System.Collections.Generic.List`1/Enumerator<Player>
IL_0279: callvirt System.Void System.IDisposable::Dispose()
IL_027e: endfinally
IL_027f: ldarg.0
IL_0280: ldarg.1
IL_0281: call System.Void neobotics.ValheimMods.SlayerSkills::RaiseStat(System.String,System.Single)
IL_0286: ret
// EH Finally: 463 - 625 => 625 - 639

// System.Boolean neobotics.ValheimMods.SlayerSkills::HaveDotDamage(HitData)
.locals 
IL_0000: ldarg.0
IL_0001: ldflda HitData/DamageTypes HitData::m_damage
IL_0006: ldfld System.Single HitData/DamageTypes::m_fire
IL_000b: ldarg.0
IL_000c: ldflda HitData/DamageTypes HitData::m_damage
IL_0011: ldfld System.Single HitData/DamageTypes::m_spirit
IL_0016: add
IL_0017: ldarg.0
IL_0018: ldflda HitData/DamageTypes HitData::m_damage
IL_001d: ldfld System.Single HitData/DamageTypes::m_poison
IL_0022: add
IL_0023: ldc.r4 0
IL_0028: cgt
IL_002a: ret

// System.Int64 neobotics.ValheimMods.SlayerSkills::GetSenderPlayer(Character)
.locals System.Int64, MonsterAI, UnityEngine.GameObject, Character
IL_0000: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0005: ldstr "GetSenderPlayer"
IL_000a: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_000f: ldc.i4.0
IL_0010: conv.i8
IL_0011: stloc.0
IL_0012: ldarg.0
IL_0013: ldnull
IL_0014: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0019: brfalse.s IL_001e
IL_001b: ldc.i4.0
IL_001c: conv.i8
IL_001d: ret
IL_001e: ldarg.0
IL_001f: callvirt System.Boolean Character::IsPlayer()
IL_0024: brfalse.s IL_002d
IL_0026: ldarg.0
IL_0027: callvirt System.Int64 Character::GetOwner()
IL_002c: ret
IL_002d: ldarg.0
IL_002e: ldfld System.Boolean Character::m_tamed
IL_0033: brfalse.s IL_0082
IL_0035: ldarg.0
IL_0036: ldloca.s V_1
IL_0038: callvirt System.Boolean UnityEngine.Component::TryGetComponent<MonsterAI>(!!0&)
IL_003d: brfalse.s IL_0082
IL_003f: ldloc.1
IL_0040: callvirt UnityEngine.GameObject MonsterAI::GetFollowTarget()
IL_0045: stloc.2
IL_0046: ldloc.2
IL_0047: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_004c: brfalse.s IL_0082
IL_004e: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::tamesSlay
IL_0053: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::get_Value()
IL_0058: brfalse.s IL_0082
IL_005a: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_005f: ldstr "Tame following player"
IL_0064: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0069: ldloc.2
IL_006a: ldloca.s V_3
IL_006c: callvirt System.Boolean UnityEngine.GameObject::TryGetComponent<Character>(!!0&)
IL_0071: brfalse.s IL_0082
IL_0073: ldloc.3
IL_0074: callvirt System.Boolean Character::IsPlayer()
IL_0079: brfalse.s IL_0082
IL_007b: ldloc.3
IL_007c: callvirt System.Int64 Character::GetOwner()
IL_0081: stloc.0
IL_0082: ldloc.0
IL_0083: ret

// System.Void neobotics.ValheimMods.SlayerSkills::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void BepInEx.BaseUnityPlugin::.ctor()
IL_0006: ret

// System.Void neobotics.ValheimMods.SlayerSkills::.cctor()
.locals 
IL_0000: ldstr "SlayerSkills_1847_"
IL_0005: stsfld System.String neobotics.ValheimMods.SlayerSkills::SLAYER_ID
IL_000a: ldsfld System.String neobotics.ValheimMods.SlayerSkills::SLAYER_ID
IL_000f: ldstr "_L"
IL_0014: call System.String System.String::Concat(System.String,System.String)
IL_0019: stsfld System.String neobotics.ValheimMods.SlayerSkills::LEVEL_ID
IL_001e: ldsfld System.String neobotics.ValheimMods.SlayerSkills::SLAYER_ID
IL_0023: ldstr "_C"
IL_0028: call System.String System.String::Concat(System.String,System.String)
IL_002d: stsfld System.String neobotics.ValheimMods.SlayerSkills::COLLECTION_ID
IL_0032: ldnull
IL_0033: stsfld neobotics.ValheimMods.CustomDataWrapper neobotics.ValheimMods.SlayerSkills::customData
IL_0038: ldsfld ZDOID ZDOID::None
IL_003d: stsfld ZDOID neobotics.ValheimMods.SlayerSkills::currentPlayerZdoid
IL_0042: ldc.i4.0
IL_0043: conv.i8
IL_0044: ldc.i4.0
IL_0045: newobj System.Void System.ValueTuple`2<System.Int64,System.Int32>::.ctor(!0,!1)
IL_004a: stsfld System.ValueTuple`2<System.Int64,System.Int32> neobotics.ValheimMods.SlayerSkills::s_dod
IL_004f: ldc.i4.0
IL_0050: conv.i8
IL_0051: ldc.i4.0
IL_0052: newobj System.Void System.ValueTuple`2<System.Int64,System.Int32>::.ctor(!0,!1)
IL_0057: stsfld System.ValueTuple`2<System.Int64,System.Int32> neobotics.ValheimMods.SlayerSkills::s_rag
IL_005c: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.Single>::.ctor()
IL_0061: stsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_0066: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::.ctor()
IL_006b: stsfld System.Collections.Generic.IDictionary`2<System.String,System.String> neobotics.ValheimMods.SlayerSkills::creatureTrophyMap
IL_0070: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::.ctor()
IL_0075: stsfld System.Collections.Generic.IDictionary`2<System.String,System.String> neobotics.ValheimMods.SlayerSkills::nameToTokenMap
IL_007a: ldstr "#00FFFF"
IL_007f: stsfld System.String neobotics.ValheimMods.SlayerSkills::colorString
IL_0084: ldnull
IL_0085: stsfld HarmonyLib.Harmony neobotics.ValheimMods.SlayerSkills::harmony
IL_008a: ret

// System.Void neobotics.ValheimMods.SlayerSkills/Localization_SetLanguage_Patch::Localization_SetLanguage_Postfix(Localization)
.locals 
IL_0000: call System.Void neobotics.ValheimMods.SlayerSkills::BuildCreatureTrophyMap()
IL_0005: ret

// System.Void neobotics.ValheimMods.SlayerSkills/Game_Start_Patch::Game_Start_Patch_Postfix(Game)
.locals 
IL_0000: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0005: ldstr " Game_Start_Patch_Postfix"
IL_000a: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_000f: call ZRoutedRpc ZRoutedRpc::get_instance()
IL_0014: ldstr "RaiseSlayerStat"
IL_0019: ldnull
IL_001a: ldftn System.Void neobotics.ValheimMods.SlayerSkills::RPC_RaiseSlayerStat(System.Int64,System.String,System.Single)
IL_0020: newobj System.Void System.Action`3<System.Int64,System.String,System.Single>::.ctor(System.Object,System.IntPtr)
IL_0025: callvirt System.Void ZRoutedRpc::Register<System.String,System.Single>(System.String,System.Action`3<System.Int64,!!0,!!1>)
IL_002a: ret

// System.Void neobotics.ValheimMods.SlayerSkills/ZNetScene_Awake_Patch::ZNetScene_Awake_Postfix(ZNetScene)
.locals 
IL_0000: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0005: ldstr "ZNetScene_Awake_Patch_Postfix"
IL_000a: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_000f: call System.Void neobotics.ValheimMods.SlayerSkills::BuildCreatureTrophyMap()
IL_0014: ret

// System.Void neobotics.ValheimMods.SlayerSkills/InventoryGui_UpdateTrophyList_Patch::InventoryGui_UpdateTrophyList_Postfix(InventoryGui,System.Collections.Generic.List`1<UnityEngine.GameObject>)
.locals System.Collections.Generic.List`1/Enumerator<UnityEngine.GameObject>, TMPro.TMP_Text, TMPro.TMP_Text, System.String, System.Single, System.String
IL_0000: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0005: ldstr "InventoryGui_UpdateTrophyList_Patch_Postfix"
IL_000a: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_000f: ldarg.1
IL_0010: brfalse IL_0158
IL_0015: ldarg.1
IL_0016: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<UnityEngine.GameObject>::GetEnumerator()
IL_001b: stloc.0
IL_001c: br IL_013c
IL_0021: ldloca.s V_0
IL_0023: call !0 System.Collections.Generic.List`1/Enumerator<UnityEngine.GameObject>::get_Current()
IL_0028: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_002d: isinst UnityEngine.RectTransform
IL_0032: dup
IL_0033: ldstr "description"
IL_0038: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_003d: callvirt !!0 UnityEngine.Component::GetComponent<TMPro.TMP_Text>()
IL_0042: stloc.1
IL_0043: ldstr "name"
IL_0048: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_004d: callvirt !!0 UnityEngine.Component::GetComponent<TMPro.TMP_Text>()
IL_0052: stloc.2
IL_0053: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.String> neobotics.ValheimMods.SlayerSkills::nameToTokenMap
IL_0058: ldloc.2
IL_0059: callvirt System.String TMPro.TMP_Text::get_text()
IL_005e: ldloca.s V_3
IL_0060: callvirt System.Boolean System.Collections.Generic.IDictionary`2<System.String,System.String>::TryGetValue(!0,!1&)
IL_0065: brfalse IL_011d
IL_006a: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_006f: ldloc.3
IL_0070: ldloca.s V_4
IL_0072: callvirt System.Boolean System.Collections.Generic.IDictionary`2<System.String,System.Single>::TryGetValue(!0,!1&)
IL_0077: brfalse IL_0101
IL_007c: ldloc.s V_4
IL_007e: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::trophyCap
IL_0083: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::get_Value()
IL_0088: conv.r4
IL_0089: blt.s IL_0092
IL_008b: ldstr "Slayer"
IL_0090: br.s IL_00b7
IL_0092: ldstr "{0}/{1}"
IL_0097: ldloc.s V_4
IL_0099: call System.Int32 neobotics.ValheimMods.SlayerSkills::FlooredLevel(System.Single)
IL_009e: box System.Int32
IL_00a3: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::trophyCap
IL_00a8: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::get_Value()
IL_00ad: box System.Int32
IL_00b2: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_00b7: stloc.s V_5
IL_00b9: ldloc.1
IL_00ba: ldc.i4.1
IL_00bb: callvirt System.Void TMPro.TMP_Text::set_richText(System.Boolean)
IL_00c0: ldloc.1
IL_00c1: ldc.i4.6
IL_00c2: newarr System.String
IL_00c7: dup
IL_00c8: ldc.i4.0
IL_00c9: ldstr "<color="
IL_00ce: stelem.ref
IL_00cf: dup
IL_00d0: ldc.i4.1
IL_00d1: ldsfld System.String neobotics.ValheimMods.SlayerSkills::colorString
IL_00d6: stelem.ref
IL_00d7: dup
IL_00d8: ldc.i4.2
IL_00d9: ldstr ">"
IL_00de: stelem.ref
IL_00df: dup
IL_00e0: ldc.i4.3
IL_00e1: ldloc.s V_5
IL_00e3: stelem.ref
IL_00e4: dup
IL_00e5: ldc.i4.4
IL_00e6: ldstr "</color>
"
IL_00eb: stelem.ref
IL_00ec: dup
IL_00ed: ldc.i4.5
IL_00ee: ldloc.1
IL_00ef: callvirt System.String TMPro.TMP_Text::get_text()
IL_00f4: stelem.ref
IL_00f5: call System.String System.String::Concat(System.String[])
IL_00fa: callvirt System.Void TMPro.TMP_Text::set_text(System.String)
IL_00ff: br.s IL_013c
IL_0101: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0106: ldstr "Can't find mapped token "
IL_010b: ldloc.3
IL_010c: ldstr " in trophy collection"
IL_0111: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0116: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_011b: br.s IL_013c
IL_011d: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0122: ldstr "Can't find localized name "
IL_0127: ldloc.2
IL_0128: callvirt System.String TMPro.TMP_Text::get_text()
IL_012d: ldstr " slayerSkill"
IL_0132: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0137: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_013c: ldloca.s V_0
IL_013e: call System.Boolean System.Collections.Generic.List`1/Enumerator<UnityEngine.GameObject>::MoveNext()
IL_0143: brtrue IL_0021
IL_0148: leave.s IL_0158
IL_014a: ldloca.s V_0
IL_014c: constrained. System.Collections.Generic.List`1/Enumerator<UnityEngine.GameObject>
IL_0152: callvirt System.Void System.IDisposable::Dispose()
IL_0157: endfinally
IL_0158: ret
// EH Finally: 28 - 330 => 330 - 344

// System.Void neobotics.ValheimMods.SlayerSkills/CharacterDrop_OnDeath_Patch::CharacterDrop_OnDeath_Prefix(CharacterDrop)
.locals Character, System.Int32, HitData, System.Int64
IL_0000: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0005: ldstr "CharacterDrop_OnDeath_Patch_Prefix"
IL_000a: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_000f: ldc.i4.0
IL_0010: conv.i8
IL_0011: ldc.i4.0
IL_0012: newobj System.Void System.ValueTuple`2<System.Int64,System.Int32>::.ctor(!0,!1)
IL_0017: stsfld System.ValueTuple`2<System.Int64,System.Int32> neobotics.ValheimMods.SlayerSkills::s_dod
IL_001c: ldarg.0
IL_001d: ldfld Character CharacterDrop::m_character
IL_0022: stloc.0
IL_0023: ldloc.0
IL_0024: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0029: brfalse.s IL_0033
IL_002b: ldloc.0
IL_002c: callvirt System.Boolean Character::IsPlayer()
IL_0031: brfalse.s IL_0034
IL_0033: ret
IL_0034: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::useCreatureLevel
IL_0039: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::get_Value()
IL_003e: brtrue.s IL_0043
IL_0040: ldc.i4.1
IL_0041: br.s IL_0049
IL_0043: ldloc.0
IL_0044: ldfld System.Int32 Character::m_level
IL_0049: stloc.1
IL_004a: ldloc.0
IL_004b: callvirt System.Boolean Character::IsBoss()
IL_0050: brfalse.s IL_005f
IL_0052: ldloc.1
IL_0053: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::bossPoints
IL_0058: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::get_Value()
IL_005d: add
IL_005e: stloc.1
IL_005f: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0064: ldstr "Creature level {0} Slayer points {1}"
IL_0069: ldloc.0
IL_006a: ldfld System.Int32 Character::m_level
IL_006f: box System.Int32
IL_0074: ldloc.1
IL_0075: box System.Int32
IL_007a: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_007f: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0084: ldsflda System.ValueTuple`2<System.Int64,System.Int32> neobotics.ValheimMods.SlayerSkills::s_dod
IL_0089: ldloc.1
IL_008a: stfld !1 System.ValueTuple`2<System.Int64,System.Int32>::Item2
IL_008f: ldloc.0
IL_0090: ldfld HitData Character::m_lastHit
IL_0095: stloc.2
IL_0096: ldloc.2
IL_0097: brfalse.s IL_00b7
IL_0099: ldloc.2
IL_009a: callvirt System.Boolean HitData::HaveAttacker()
IL_009f: brfalse.s IL_00b7
IL_00a1: ldsflda System.ValueTuple`2<System.Int64,System.Int32> neobotics.ValheimMods.SlayerSkills::s_dod
IL_00a6: ldloc.2
IL_00a7: callvirt Character HitData::GetAttacker()
IL_00ac: call System.Int64 neobotics.ValheimMods.SlayerSkills::GetSenderPlayer(Character)
IL_00b1: stfld !0 System.ValueTuple`2<System.Int64,System.Int32>::Item1
IL_00b6: ret
IL_00b7: ldloc.0
IL_00b8: ldfld ZNetView Character::m_nview
IL_00bd: callvirt ZDO ZNetView::GetZDO()
IL_00c2: ldsfld System.String neobotics.ValheimMods.SlayerSkills::SLAYER_ID
IL_00c7: ldc.i4.0
IL_00c8: conv.i8
IL_00c9: callvirt System.Int64 ZDO::GetLong(System.String,System.Int64)
IL_00ce: stloc.3
IL_00cf: ldloc.3
IL_00d0: brfalse.s IL_00dd
IL_00d2: ldsflda System.ValueTuple`2<System.Int64,System.Int32> neobotics.ValheimMods.SlayerSkills::s_dod
IL_00d7: ldloc.3
IL_00d8: stfld !0 System.ValueTuple`2<System.Int64,System.Int32>::Item1
IL_00dd: ret

// System.Void neobotics.ValheimMods.SlayerSkills/CharacterDrop_OnDeath_Patch::CharacterDrop_OnDeath_Finalizer(CharacterDrop)
.locals 
IL_0000: ldc.i4.0
IL_0001: conv.i8
IL_0002: ldc.i4.0
IL_0003: newobj System.Void System.ValueTuple`2<System.Int64,System.Int32>::.ctor(!0,!1)
IL_0008: stsfld System.ValueTuple`2<System.Int64,System.Int32> neobotics.ValheimMods.SlayerSkills::s_dod
IL_000d: ret

// System.Void neobotics.ValheimMods.SlayerSkills/CharacterDrop_DropItems_Patch::CharacterDrop_DropItems_Postfix(System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Int32>>,UnityEngine.Vector3,System.Single)
.locals System.Int64, System.Int32, System.ValueTuple`2<System.Int64,System.Int32>, System.Collections.Generic.List`1/Enumerator<System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Int32>>, System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Int32>, ItemDrop
IL_0000: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0005: ldstr "CharacterDrop_DropItems_Postfix"
IL_000a: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_000f: ldsflda System.ValueTuple`2<System.Int64,System.Int32> neobotics.ValheimMods.SlayerSkills::s_dod
IL_0014: ldfld !0 System.ValueTuple`2<System.Int64,System.Int32>::Item1
IL_0019: brtrue.s IL_002a
IL_001b: ldsflda System.ValueTuple`2<System.Int64,System.Int32> neobotics.ValheimMods.SlayerSkills::s_rag
IL_0020: ldfld !0 System.ValueTuple`2<System.Int64,System.Int32>::Item1
IL_0025: brfalse IL_00f5
IL_002a: ldsflda System.ValueTuple`2<System.Int64,System.Int32> neobotics.ValheimMods.SlayerSkills::s_dod
IL_002f: ldfld !0 System.ValueTuple`2<System.Int64,System.Int32>::Item1
IL_0034: brtrue.s IL_004c
IL_0036: ldsfld System.ValueTuple`2<System.Int64,System.Int32> neobotics.ValheimMods.SlayerSkills::s_rag
IL_003b: stloc.2
IL_003c: ldloc.2
IL_003d: ldfld !0 System.ValueTuple`2<System.Int64,System.Int32>::Item1
IL_0042: stloc.0
IL_0043: ldloc.2
IL_0044: ldfld !1 System.ValueTuple`2<System.Int64,System.Int32>::Item2
IL_0049: stloc.1
IL_004a: br.s IL_0060
IL_004c: ldsfld System.ValueTuple`2<System.Int64,System.Int32> neobotics.ValheimMods.SlayerSkills::s_dod
IL_0051: stloc.2
IL_0052: ldloc.2
IL_0053: ldfld !0 System.ValueTuple`2<System.Int64,System.Int32>::Item1
IL_0058: stloc.0
IL_0059: ldloc.2
IL_005a: ldfld !1 System.ValueTuple`2<System.Int64,System.Int32>::Item2
IL_005f: stloc.1
IL_0060: ldarg.0
IL_0061: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Int32>>::GetEnumerator()
IL_0066: stloc.3
IL_0067: br.s IL_00dc
IL_0069: ldloca.s V_3
IL_006b: call !0 System.Collections.Generic.List`1/Enumerator<System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Int32>>::get_Current()
IL_0070: stloc.s V_4
IL_0072: ldloca.s V_4
IL_0074: call !0 System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Int32>::get_Key()
IL_0079: ldnull
IL_007a: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_007f: brfalse.s IL_00dc
IL_0081: ldloca.s V_4
IL_0083: call !0 System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Int32>::get_Key()
IL_0088: ldloca.s V_5
IL_008a: callvirt System.Boolean UnityEngine.GameObject::TryGetComponent<ItemDrop>(!!0&)
IL_008f: brfalse.s IL_00dc
IL_0091: ldloc.s V_5
IL_0093: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_0098: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_009d: ldfld ItemDrop/ItemData/ItemType ItemDrop/ItemData/SharedData::m_itemType
IL_00a2: ldc.i4.s 13
IL_00a4: bne.un.s IL_00dc
IL_00a6: ldloc.s V_5
IL_00a8: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_00ad: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_00b2: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_00b7: ldloc.1
IL_00b8: conv.r4
IL_00b9: ldarg.1
IL_00ba: ldloc.0
IL_00bb: call System.Void neobotics.ValheimMods.SlayerSkills::InitiateRaiseStat(System.String,System.Single,UnityEngine.Vector3,System.Int64)
IL_00c0: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_00c5: ldstr "Found trophy in drops. Adding Slayer points {0}"
IL_00ca: ldloc.1
IL_00cb: box System.Int32
IL_00d0: call System.String System.String::Format(System.String,System.Object)
IL_00d5: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_00da: leave.s IL_00f5
IL_00dc: ldloca.s V_3
IL_00de: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Int32>>::MoveNext()
IL_00e3: brtrue.s IL_0069
IL_00e5: leave.s IL_00f5
IL_00e7: ldloca.s V_3
IL_00e9: constrained. System.Collections.Generic.List`1/Enumerator<System.Collections.Generic.KeyValuePair`2<UnityEngine.GameObject,System.Int32>>
IL_00ef: callvirt System.Void System.IDisposable::Dispose()
IL_00f4: endfinally
IL_00f5: ret
// EH Finally: 103 - 231 => 231 - 245

// System.Void neobotics.ValheimMods.SlayerSkills/Ragdoll_SaveLootList_Patch::Ragdoll_SaveLootList_Prefix(Ragdoll,CharacterDrop)
.locals Character, HitData, System.Int64, ZNetView, ZDO, System.Int32
IL_0000: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0005: ldstr "Ragdoll_SaveLootList_Patch_Prefix"
IL_000a: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_000f: ldarg.1
IL_0010: ldfld Character CharacterDrop::m_character
IL_0015: stloc.0
IL_0016: ldloc.0
IL_0017: ldfld HitData Character::m_lastHit
IL_001c: stloc.1
IL_001d: ldc.i4.0
IL_001e: conv.i8
IL_001f: stloc.2
IL_0020: ldloc.1
IL_0021: brfalse.s IL_0037
IL_0023: ldloc.1
IL_0024: callvirt System.Boolean HitData::HaveAttacker()
IL_0029: brfalse.s IL_0037
IL_002b: ldloc.1
IL_002c: callvirt Character HitData::GetAttacker()
IL_0031: call System.Int64 neobotics.ValheimMods.SlayerSkills::GetSenderPlayer(Character)
IL_0036: stloc.2
IL_0037: ldloc.2
IL_0038: brtrue.s IL_0064
IL_003a: ldloc.0
IL_003b: ldfld ZNetView Character::m_nview
IL_0040: callvirt ZDO ZNetView::GetZDO()
IL_0045: ldsfld System.String neobotics.ValheimMods.SlayerSkills::SLAYER_ID
IL_004a: ldc.i4.0
IL_004b: conv.i8
IL_004c: callvirt System.Int64 ZDO::GetLong(System.String,System.Int64)
IL_0051: stloc.2
IL_0052: ldloc.2
IL_0053: brfalse.s IL_0064
IL_0055: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_005a: ldstr "Existing DOT from slayer found on target. Transferring to Ragdoll."
IL_005f: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0064: ldloc.2
IL_0065: brtrue.s IL_0077
IL_0067: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_006c: ldstr "Character was not hit by player"
IL_0071: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0076: ret
IL_0077: ldloc.0
IL_0078: ldnull
IL_0079: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_007e: brfalse IL_011b
IL_0083: ldloc.0
IL_0084: callvirt System.Boolean Character::IsTamed()
IL_0089: brtrue IL_011b
IL_008e: ldloc.0
IL_008f: ldloca.s V_3
IL_0091: callvirt System.Boolean UnityEngine.Component::TryGetComponent<ZNetView>(!!0&)
IL_0096: brfalse IL_011b
IL_009b: ldarg.0
IL_009c: ldfld ZNetView Ragdoll::m_nview
IL_00a1: callvirt ZDO ZNetView::GetZDO()
IL_00a6: stloc.s V_4
IL_00a8: ldloc.s V_4
IL_00aa: callvirt System.Boolean ZDO::IsValid()
IL_00af: brfalse.s IL_011b
IL_00b1: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::useCreatureLevel
IL_00b6: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::get_Value()
IL_00bb: brtrue.s IL_00c0
IL_00bd: ldc.i4.1
IL_00be: br.s IL_00c6
IL_00c0: ldloc.0
IL_00c1: ldfld System.Int32 Character::m_level
IL_00c6: stloc.s V_5
IL_00c8: ldloc.0
IL_00c9: callvirt System.Boolean Character::IsBoss()
IL_00ce: brfalse.s IL_00df
IL_00d0: ldloc.s V_5
IL_00d2: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::bossPoints
IL_00d7: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::get_Value()
IL_00dc: add
IL_00dd: stloc.s V_5
IL_00df: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_00e4: ldstr "Setting ragdoll tapper to {0} for Slayer points {1}"
IL_00e9: ldloc.2
IL_00ea: box System.Int64
IL_00ef: ldloc.s V_5
IL_00f1: box System.Int32
IL_00f6: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_00fb: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0100: ldloc.s V_4
IL_0102: ldsfld System.String neobotics.ValheimMods.SlayerSkills::SLAYER_ID
IL_0107: ldloc.2
IL_0108: callvirt System.Void ZDO::Set(System.String,System.Int64)
IL_010d: ldloc.s V_4
IL_010f: ldsfld System.String neobotics.ValheimMods.SlayerSkills::LEVEL_ID
IL_0114: ldloc.s V_5
IL_0116: callvirt System.Void ZDO::Set(System.String,System.Int32)
IL_011b: ret

// System.Void neobotics.ValheimMods.SlayerSkills/Ragdoll_SpawnLoot_Patch::Ragdoll_SpawnLoot_Prefix(Ragdoll,UnityEngine.Vector3)
.locals ZDO
IL_0000: ldarg.0
IL_0001: ldfld ZNetView Ragdoll::m_nview
IL_0006: callvirt ZDO ZNetView::GetZDO()
IL_000b: stloc.0
IL_000c: ldloc.0
IL_000d: callvirt System.Boolean ZDO::IsValid()
IL_0012: brtrue.s IL_0015
IL_0014: ret
IL_0015: ldsflda System.ValueTuple`2<System.Int64,System.Int32> neobotics.ValheimMods.SlayerSkills::s_rag
IL_001a: ldloc.0
IL_001b: ldsfld System.String neobotics.ValheimMods.SlayerSkills::SLAYER_ID
IL_0020: ldc.i4.0
IL_0021: conv.i8
IL_0022: callvirt System.Int64 ZDO::GetLong(System.String,System.Int64)
IL_0027: stfld !0 System.ValueTuple`2<System.Int64,System.Int32>::Item1
IL_002c: ldsflda System.ValueTuple`2<System.Int64,System.Int32> neobotics.ValheimMods.SlayerSkills::s_rag
IL_0031: ldloc.0
IL_0032: ldsfld System.String neobotics.ValheimMods.SlayerSkills::LEVEL_ID
IL_0037: ldc.i4.0
IL_0038: callvirt System.Int32 ZDO::GetInt(System.String,System.Int32)
IL_003d: stfld !1 System.ValueTuple`2<System.Int64,System.Int32>::Item2
IL_0042: ret

// System.Void neobotics.ValheimMods.SlayerSkills/Ragdoll_SpawnLoot_Patch::Ragdoll_SpawnLoot_Finalizer(Ragdoll,UnityEngine.Vector3)
.locals 
IL_0000: ldc.i4.0
IL_0001: conv.i8
IL_0002: ldc.i4.0
IL_0003: newobj System.Void System.ValueTuple`2<System.Int64,System.Int32>::.ctor(!0,!1)
IL_0008: stsfld System.ValueTuple`2<System.Int64,System.Int32> neobotics.ValheimMods.SlayerSkills::s_rag
IL_000d: ret

// System.Void neobotics.ValheimMods.SlayerSkills/Character_RPC_Damage_Patch::Character_RPC_Damage_Prefix(Character,HitData)
.locals Character
IL_0000: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0005: ldstr "Character_RPC_Damage_Patch_Prefix"
IL_000a: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_000f: ldarg.0
IL_0010: ldfld ZNetView Character::m_nview
IL_0015: callvirt System.Boolean ZNetView::IsOwner()
IL_001a: brtrue.s IL_001d
IL_001c: ret
IL_001d: ldarg.1
IL_001e: callvirt Character HitData::GetAttacker()
IL_0023: stloc.0
IL_0024: ldarg.1
IL_0025: callvirt System.Boolean HitData::HaveAttacker()
IL_002a: brfalse.s IL_008b
IL_002c: ldloc.0
IL_002d: callvirt System.Boolean Character::IsPlayer()
IL_0032: brfalse.s IL_008b
IL_0034: ldarg.0
IL_0035: callvirt System.Boolean Character::IsPlayer()
IL_003a: brtrue.s IL_008b
IL_003c: ldarg.1
IL_003d: call System.Boolean neobotics.ValheimMods.SlayerSkills::HaveDotDamage(HitData)
IL_0042: brfalse.s IL_008b
IL_0044: ldarg.0
IL_0045: ldfld ZNetView Character::m_nview
IL_004a: callvirt ZDO ZNetView::GetZDO()
IL_004f: ldsfld System.String neobotics.ValheimMods.SlayerSkills::SLAYER_ID
IL_0054: ldloc.0
IL_0055: callvirt System.Int64 Character::GetOwner()
IL_005a: callvirt System.Void ZDO::Set(System.String,System.Int64)
IL_005f: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0064: callvirt System.Boolean neobotics.ModSdk.Logging::Testing()
IL_0069: brfalse.s IL_008b
IL_006b: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0070: ldarg.0
IL_0071: callvirt System.String UnityEngine.Object::get_name()
IL_0076: ldstr " has DOT from slayer "
IL_007b: ldloc.0
IL_007c: callvirt System.String UnityEngine.Object::get_name()
IL_0081: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0086: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_008b: ret

// System.Void neobotics.ValheimMods.SlayerSkills/Character_Damage_Patch::Character_Damage_Prefix(Character,HitData,ZNetView)
.locals Character, Player, System.Boolean, MonsterAI, System.String, System.String, System.Single
IL_0000: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0005: ldstr "Character_Damage_Patch_Prefix"
IL_000a: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_000f: ldarg.0
IL_0010: callvirt System.Boolean Character::IsPlayer()
IL_0015: brfalse.s IL_0018
IL_0017: ret
IL_0018: ldarg.1
IL_0019: callvirt Character HitData::GetAttacker()
IL_001e: stloc.0
IL_001f: ldsfld Player Player::m_localPlayer
IL_0024: stloc.1
IL_0025: ldloc.0
IL_0026: ldnull
IL_0027: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_002c: brfalse.s IL_002f
IL_002e: ret
IL_002f: ldc.i4.0
IL_0030: stloc.2
IL_0031: ldloc.0
IL_0032: ldfld System.Boolean Character::m_tamed
IL_0037: brfalse.s IL_0053
IL_0039: ldloc.0
IL_003a: ldloca.s V_3
IL_003c: callvirt System.Boolean UnityEngine.Component::TryGetComponent<MonsterAI>(!!0&)
IL_0041: brfalse.s IL_0053
IL_0043: ldloc.3
IL_0044: callvirt UnityEngine.GameObject MonsterAI::GetFollowTarget()
IL_0049: ldloc.1
IL_004a: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_004f: brfalse.s IL_0053
IL_0051: ldc.i4.1
IL_0052: stloc.2
IL_0053: ldloc.0
IL_0054: ldloc.1
IL_0055: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_005a: brtrue.s IL_0071
IL_005c: ldloc.2
IL_005d: brfalse IL_010a
IL_0062: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::tamesBuff
IL_0067: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::get_Value()
IL_006c: brfalse IL_010a
IL_0071: ldarg.0
IL_0072: callvirt System.String UnityEngine.Object::get_name()
IL_0077: call System.String neobotics.ModSdk.Utils::UnClonifiedName(System.String)
IL_007c: stloc.s V_4
IL_007e: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0083: ldloc.0
IL_0084: callvirt System.String Character::GetHoverName()
IL_0089: ldstr " hit "
IL_008e: ldloc.s V_4
IL_0090: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0095: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_009a: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.String> neobotics.ValheimMods.SlayerSkills::creatureTrophyMap
IL_009f: ldloc.s V_4
IL_00a1: ldloca.s V_5
IL_00a3: callvirt System.Boolean System.Collections.Generic.IDictionary`2<System.String,System.String>::TryGetValue(!0,!1&)
IL_00a8: brfalse.s IL_00ef
IL_00aa: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_00af: ldloc.s V_5
IL_00b1: ldloca.s V_6
IL_00b3: callvirt System.Boolean System.Collections.Generic.IDictionary`2<System.String,System.Single>::TryGetValue(!0,!1&)
IL_00b8: brfalse.s IL_00d3
IL_00ba: ldarg.1
IL_00bb: ldloc.s V_6
IL_00bd: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::trophyCap
IL_00c2: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::get_Value()
IL_00c7: conv.r4
IL_00c8: call System.Single UnityEngine.Mathf::Min(System.Single,System.Single)
IL_00cd: call System.Void neobotics.ValheimMods.SlayerSkills::ApplySlayerBonus(HitData,System.Single)
IL_00d2: ret
IL_00d3: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_00d8: ldstr "Can't find "
IL_00dd: ldloc.s V_5
IL_00df: ldstr " in slayer collection"
IL_00e4: call System.String System.String::Concat(System.String,System.String,System.String)
IL_00e9: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_00ee: ret
IL_00ef: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_00f4: ldstr "Can't find "
IL_00f9: ldloc.s V_4
IL_00fb: ldstr " slayerSkill"
IL_0100: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0105: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_010a: ret

// System.Void neobotics.ValheimMods.SlayerSkills/Player_Save_Patch::Player_Save_Patch_Prefix(Player,ZPackage)
.locals ZDOID, System.String
IL_0000: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0005: ldstr "Player_Save_Patch_Prefix"
IL_000a: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_000f: ldsfld Player Player::m_localPlayer
IL_0014: ldnull
IL_0015: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_001a: brtrue.s IL_0029
IL_001c: ldarg.0
IL_001d: ldsfld Player Player::m_localPlayer
IL_0022: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0027: brfalse.s IL_0039
IL_0029: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_002e: ldstr "Player_Save_Patch_Prefix: not the local player, skipping sync"
IL_0033: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0038: ret
IL_0039: ldarg.0
IL_003a: callvirt ZDOID Character::GetZDOID()
IL_003f: stloc.0
IL_0040: ldsfld neobotics.ValheimMods.CustomDataWrapper neobotics.ValheimMods.SlayerSkills::customData
IL_0045: brfalse.s IL_0061
IL_0047: ldloc.0
IL_0048: ldsfld ZDOID ZDOID::None
IL_004d: call System.Boolean ZDOID::op_Equality(ZDOID,ZDOID)
IL_0052: brtrue.s IL_0061
IL_0054: ldloc.0
IL_0055: ldsfld ZDOID neobotics.ValheimMods.SlayerSkills::currentPlayerZdoid
IL_005a: call System.Boolean ZDOID::op_Inequality(ZDOID,ZDOID)
IL_005f: brfalse.s IL_0086
IL_0061: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0066: ldstr "Player_Save_Patch_Prefix: no trustworthy data loaded (save zdoid={0}, tracked={1}), skipping sync"
IL_006b: ldloc.0
IL_006c: box ZDOID
IL_0071: ldsfld ZDOID neobotics.ValheimMods.SlayerSkills::currentPlayerZdoid
IL_0076: box ZDOID
IL_007b: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_0080: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0085: ret
IL_0086: ldstr ","
IL_008b: ldstr ":"
IL_0090: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_0095: call System.String neobotics.ModSdk.Utils::SerializeFromDictionary<System.String,System.Single>(System.String,System.String,System.Collections.Generic.IDictionary`2<K,V>)
IL_009a: stloc.1
IL_009b: ldsfld neobotics.ValheimMods.CustomDataWrapper neobotics.ValheimMods.SlayerSkills::customData
IL_00a0: ldsfld System.String neobotics.ValheimMods.SlayerSkills::COLLECTION_ID
IL_00a5: ldloc.1
IL_00a6: callvirt System.Void neobotics.ValheimMods.CustomDataWrapper::Set(System.String,System.String)
IL_00ab: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_00b0: ldstr "Serializing and adding trophy collection "
IL_00b5: ldloc.1
IL_00b6: call System.String System.String::Concat(System.String,System.String)
IL_00bb: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_00c0: ldsfld neobotics.ValheimMods.CustomDataWrapper neobotics.ValheimMods.SlayerSkills::customData
IL_00c5: callvirt System.Void neobotics.ValheimMods.CustomDataWrapper::PreSaveSync()
IL_00ca: ret

// System.Void neobotics.ValheimMods.SlayerSkills/Player_OnSpawned_Patch::Player_Start_Patch_Postfix(Player)
.locals ZDOID, System.String
IL_0000: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0005: ldstr "Player_Start_Patch_Postfix"
IL_000a: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_000f: ldsfld Player Player::m_localPlayer
IL_0014: ldnull
IL_0015: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_001a: brtrue.s IL_0029
IL_001c: ldarg.0
IL_001d: ldsfld Player Player::m_localPlayer
IL_0022: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0027: brfalse.s IL_0039
IL_0029: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_002e: ldstr "Player_Start_Patch_Postfix: not the local player, skipping load"
IL_0033: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0038: ret
IL_0039: ldarg.0
IL_003a: callvirt ZDOID Character::GetZDOID()
IL_003f: stloc.0
IL_0040: ldloc.0
IL_0041: ldsfld ZDOID ZDOID::None
IL_0046: call System.Boolean ZDOID::op_Equality(ZDOID,ZDOID)
IL_004b: brfalse.s IL_005d
IL_004d: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0052: ldstr "Player_Start_Patch_Postfix: no ZDOID yet (not networked), skipping load"
IL_0057: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_005c: ret
IL_005d: ldsfld World ZNet::m_world
IL_0062: brtrue.s IL_0084
IL_0064: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0069: ldstr "Player_Start_Patch_Postfix: ZNet.m_world is null, invalidating tracked data"
IL_006e: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_0073: ldnull
IL_0074: stsfld neobotics.ValheimMods.CustomDataWrapper neobotics.ValheimMods.SlayerSkills::customData
IL_0079: ldsfld ZDOID ZDOID::None
IL_007e: stsfld ZDOID neobotics.ValheimMods.SlayerSkills::currentPlayerZdoid
IL_0083: ret
IL_0084: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_0089: callvirt System.Void System.Collections.Generic.ICollection`1<System.Collections.Generic.KeyValuePair`2<System.String,System.Single>>::Clear()
IL_008e: ldarg.0
IL_008f: ldfld System.Collections.Generic.Dictionary`2<System.String,System.String> Player::m_customData
IL_0094: ldsfld System.String neobotics.ValheimMods.SlayerSkills::SLAYER_ID
IL_0099: newobj System.Void neobotics.ValheimMods.CustomDataWrapper::.ctor(System.Collections.Generic.Dictionary`2<System.String,System.String>,System.String)
IL_009e: stsfld neobotics.ValheimMods.CustomDataWrapper neobotics.ValheimMods.SlayerSkills::customData
IL_00a3: ldloc.0
IL_00a4: stsfld ZDOID neobotics.ValheimMods.SlayerSkills::currentPlayerZdoid
IL_00a9: ldsfld neobotics.ValheimMods.CustomDataWrapper neobotics.ValheimMods.SlayerSkills::customData
IL_00ae: ldsfld System.String neobotics.ValheimMods.SlayerSkills::COLLECTION_ID
IL_00b3: callvirt System.String neobotics.ValheimMods.CustomDataWrapper::Get(System.String)
IL_00b8: stloc.1
IL_00b9: ldloc.1
IL_00ba: brfalse.s IL_00e7
IL_00bc: ldloc.1
IL_00bd: ldstr ","
IL_00c2: ldstr ":"
IL_00c7: ldsflda System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_00cc: call System.Void neobotics.ModSdk.Utils::DeserializeToDictionary<System.String,System.Single>(System.String,System.String,System.String,System.Collections.Generic.IDictionary`2<K,V>&)
IL_00d1: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_00d6: ldstr "Deserialized trophy string "
IL_00db: ldloc.1
IL_00dc: call System.String System.String::Concat(System.String,System.String)
IL_00e1: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_00e6: ret
IL_00e7: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_00ec: ldstr "Player_Start_Patch_Postfix: no existing trophy collection, starting fresh"
IL_00f1: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_00f6: ret

// System.Void neobotics.ValheimMods.SlayerSkills/Player_OnDestroy_Patch::Player_OnDestroy_Patch_Postfix(Player)
.locals ZDOID
IL_0000: ldarg.0
IL_0001: callvirt ZDOID Character::GetZDOID()
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: ldsfld ZDOID ZDOID::None
IL_000d: call System.Boolean ZDOID::op_Inequality(ZDOID,ZDOID)
IL_0012: brfalse.s IL_0055
IL_0014: ldloc.0
IL_0015: ldsfld ZDOID neobotics.ValheimMods.SlayerSkills::currentPlayerZdoid
IL_001a: call System.Boolean ZDOID::op_Equality(ZDOID,ZDOID)
IL_001f: brfalse.s IL_0055
IL_0021: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0026: ldstr "Player_OnDestroy_Patch_Postfix: clearing tracked data for zdoid={0}"
IL_002b: ldloc.0
IL_002c: box ZDOID
IL_0031: call System.String System.String::Format(System.String,System.Object)
IL_0036: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_003b: ldnull
IL_003c: stsfld neobotics.ValheimMods.CustomDataWrapper neobotics.ValheimMods.SlayerSkills::customData
IL_0041: ldsfld ZDOID ZDOID::None
IL_0046: stsfld ZDOID neobotics.ValheimMods.SlayerSkills::currentPlayerZdoid
IL_004b: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_0050: callvirt System.Void System.Collections.Generic.ICollection`1<System.Collections.Generic.KeyValuePair`2<System.String,System.Single>>::Clear()
IL_0055: ret

// System.Void neobotics.ValheimMods.SlayerSkills/Skills_LowerAllSkills_Patch::Skills_LowerAllSkills_Postfix(Skills,System.Single)
.locals System.Collections.Generic.List`1/Enumerator<System.String>, System.String, System.Single, System.Collections.Generic.IDictionary`2<System.String,System.Single>, System.String
IL_0000: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0005: ldstr "Skills_LowerAllSkills_Patch_Postfix"
IL_000a: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_000f: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::lowerSkillsOnDeath
IL_0014: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::get_Value()
IL_0019: brfalse.s IL_0094
IL_001b: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_0020: callvirt System.Collections.Generic.ICollection`1<!0> System.Collections.Generic.IDictionary`2<System.String,System.Single>::get_Keys()
IL_0025: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor(System.Collections.Generic.IEnumerable`1<!0>)
IL_002a: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_002f: stloc.0
IL_0030: br.s IL_007b
IL_0032: ldloca.s V_0
IL_0034: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_0039: stloc.1
IL_003a: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_003f: ldloc.1
IL_0040: callvirt !1 System.Collections.Generic.IDictionary`2<System.String,System.Single>::get_Item(!0)
IL_0045: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::trophyCap
IL_004a: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::get_Value()
IL_004f: conv.r4
IL_0050: bge.un.s IL_007b
IL_0052: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_0057: ldloc.1
IL_0058: callvirt !1 System.Collections.Generic.IDictionary`2<System.String,System.Single>::get_Item(!0)
IL_005d: ldarg.1
IL_005e: mul
IL_005f: stloc.2
IL_0060: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_0065: stloc.3
IL_0066: ldloc.1
IL_0067: stloc.s V_4
IL_0069: ldloc.3
IL_006a: ldloc.s V_4
IL_006c: ldloc.3
IL_006d: ldloc.s V_4
IL_006f: callvirt !1 System.Collections.Generic.IDictionary`2<System.String,System.Single>::get_Item(!0)
IL_0074: ldloc.2
IL_0075: sub
IL_0076: callvirt System.Void System.Collections.Generic.IDictionary`2<System.String,System.Single>::set_Item(!0,!1)
IL_007b: ldloca.s V_0
IL_007d: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_0082: brtrue.s IL_0032
IL_0084: leave.s IL_0094
IL_0086: ldloca.s V_0
IL_0088: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_008e: callvirt System.Void System.IDisposable::Dispose()
IL_0093: endfinally
IL_0094: ret
// EH Finally: 48 - 134 => 134 - 148

// System.Boolean neobotics.ValheimMods.SlayerSkills/Skills_CheatRaiseSkill_Patch::Prefix(System.String,System.Single)
.locals System.String, System.Collections.Generic.List`1/Enumerator<System.String>, System.String, System.Single, System.Single
IL_0000: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::GetLogger()
IL_0005: ldstr "Skills CheatRaiseSkill Prefix"
IL_000a: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_000f: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::allowCheats
IL_0014: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::get_Value()
IL_0019: brfalse IL_012c
IL_001e: ldarg.0
IL_001f: callvirt System.String System.String::ToLower()
IL_0024: ldstr "all"
IL_0029: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_002e: brfalse IL_00b8
IL_0033: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_0038: callvirt System.Collections.Generic.ICollection`1<!0> System.Collections.Generic.IDictionary`2<System.String,System.Single>::get_Keys()
IL_003d: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor(System.Collections.Generic.IEnumerable`1<!0>)
IL_0042: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_0047: stloc.1
IL_0048: br.s IL_0083
IL_004a: ldloca.s V_1
IL_004c: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_0051: stloc.2
IL_0052: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_0057: ldloc.2
IL_0058: callvirt !1 System.Collections.Generic.IDictionary`2<System.String,System.Single>::get_Item(!0)
IL_005d: ldarg.1
IL_005e: add
IL_005f: stloc.3
IL_0060: ldloc.3
IL_0061: ldc.r4 0
IL_0066: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::trophyCap
IL_006b: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::get_Value()
IL_0070: conv.r4
IL_0071: call System.Single UnityEngine.Mathf::Clamp(System.Single,System.Single,System.Single)
IL_0076: stloc.3
IL_0077: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_007c: ldloc.2
IL_007d: ldloc.3
IL_007e: callvirt System.Void System.Collections.Generic.IDictionary`2<System.String,System.Single>::set_Item(!0,!1)
IL_0083: ldloca.s V_1
IL_0085: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_008a: brtrue.s IL_004a
IL_008c: leave.s IL_009c
IL_008e: ldloca.s V_1
IL_0090: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_0096: callvirt System.Void System.IDisposable::Dispose()
IL_009b: endfinally
IL_009c: call Console Console::get_instance()
IL_00a1: ldstr "All Slayer skills increased by {0} unless capped."
IL_00a6: ldarg.1
IL_00a7: box System.Single
IL_00ac: call System.String System.String::Format(System.String,System.Object)
IL_00b1: callvirt System.Void Console::Print(System.String)
IL_00b6: ldc.i4.1
IL_00b7: ret
IL_00b8: ldarg.0
IL_00b9: ldc.i4.s 95
IL_00bb: ldc.i4.s 32
IL_00bd: callvirt System.String System.String::Replace(System.Char,System.Char)
IL_00c2: starg.s name
IL_00c4: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.String> neobotics.ValheimMods.SlayerSkills::nameToTokenMap
IL_00c9: ldarg.0
IL_00ca: ldloca.s V_0
IL_00cc: callvirt System.Boolean System.Collections.Generic.IDictionary`2<System.String,System.String>::TryGetValue(!0,!1&)
IL_00d1: brfalse.s IL_013b
IL_00d3: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_00d8: ldloc.0
IL_00d9: ldloca.s V_4
IL_00db: callvirt System.Boolean System.Collections.Generic.IDictionary`2<System.String,System.Single>::TryGetValue(!0,!1&)
IL_00e0: brfalse.s IL_013b
IL_00e2: ldloc.s V_4
IL_00e4: ldarg.1
IL_00e5: add
IL_00e6: stloc.s V_4
IL_00e8: ldloc.s V_4
IL_00ea: ldc.r4 0
IL_00ef: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32> neobotics.ValheimMods.Cfg::trophyCap
IL_00f4: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Int32>::get_Value()
IL_00f9: conv.r4
IL_00fa: call System.Single UnityEngine.Mathf::Clamp(System.Single,System.Single,System.Single)
IL_00ff: stloc.s V_4
IL_0101: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_0106: ldloc.0
IL_0107: ldloc.s V_4
IL_0109: callvirt System.Void System.Collections.Generic.IDictionary`2<System.String,System.Single>::set_Item(!0,!1)
IL_010e: call Console Console::get_instance()
IL_0113: ldstr "Slayer skill {0} = {1}"
IL_0118: ldarg.0
IL_0119: ldloc.s V_4
IL_011b: box System.Single
IL_0120: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_0125: callvirt System.Void Console::Print(System.String)
IL_012a: ldc.i4.0
IL_012b: ret
IL_012c: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_0131: ldstr "SlayerSkills cheats are not enabled"
IL_0136: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_013b: ldc.i4.1
IL_013c: ret
// EH Finally: 72 - 142 => 142 - 156

// System.Boolean neobotics.ValheimMods.SlayerSkills/Skills_CheatResetSkill_Patch::Prefix(System.String)
.locals System.String, System.Collections.Generic.List`1/Enumerator<System.String>, System.String
IL_0000: call neobotics.ModSdk.Logging neobotics.ModSdk.Logging::GetLogger()
IL_0005: ldstr "Skills CheatResetSkill Prefix"
IL_000a: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_000f: ldsfld neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean> neobotics.ValheimMods.Cfg::allowCheats
IL_0014: callvirt T neobotics.ModSdk.DelegatedConfigEntry`1<System.Boolean>::get_Value()
IL_0019: brfalse IL_00dd
IL_001e: ldarg.0
IL_001f: callvirt System.String System.String::ToLower()
IL_0024: ldstr "all"
IL_0029: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_002e: brfalse.s IL_0089
IL_0030: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_0035: callvirt System.Collections.Generic.ICollection`1<!0> System.Collections.Generic.IDictionary`2<System.String,System.Single>::get_Keys()
IL_003a: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor(System.Collections.Generic.IEnumerable`1<!0>)
IL_003f: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_0044: stloc.1
IL_0045: br.s IL_005f
IL_0047: ldloca.s V_1
IL_0049: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_004e: stloc.2
IL_004f: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_0054: ldloc.2
IL_0055: ldc.r4 0
IL_005a: callvirt System.Void System.Collections.Generic.IDictionary`2<System.String,System.Single>::set_Item(!0,!1)
IL_005f: ldloca.s V_1
IL_0061: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_0066: brtrue.s IL_0047
IL_0068: leave.s IL_0078
IL_006a: ldloca.s V_1
IL_006c: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_0072: callvirt System.Void System.IDisposable::Dispose()
IL_0077: endfinally
IL_0078: call Console Console::get_instance()
IL_007d: ldstr "All Slayer skills reset"
IL_0082: callvirt System.Void Console::Print(System.String)
IL_0087: ldc.i4.1
IL_0088: ret
IL_0089: ldarg.0
IL_008a: ldc.i4.s 95
IL_008c: ldc.i4.s 32
IL_008e: callvirt System.String System.String::Replace(System.Char,System.Char)
IL_0093: starg.s name
IL_0095: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.String> neobotics.ValheimMods.SlayerSkills::nameToTokenMap
IL_009a: ldarg.0
IL_009b: ldloca.s V_0
IL_009d: callvirt System.Boolean System.Collections.Generic.IDictionary`2<System.String,System.String>::TryGetValue(!0,!1&)
IL_00a2: brfalse.s IL_00ec
IL_00a4: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_00a9: ldloc.0
IL_00aa: callvirt System.Boolean System.Collections.Generic.IDictionary`2<System.String,System.Single>::ContainsKey(!0)
IL_00af: brfalse.s IL_00ec
IL_00b1: ldsfld System.Collections.Generic.IDictionary`2<System.String,System.Single> neobotics.ValheimMods.SlayerSkills::trophyCollection
IL_00b6: ldloc.0
IL_00b7: ldc.r4 0
IL_00bc: callvirt System.Void System.Collections.Generic.IDictionary`2<System.String,System.Single>::set_Item(!0,!1)
IL_00c1: call Console Console::get_instance()
IL_00c6: ldstr "Slayer skill "
IL_00cb: ldarg.0
IL_00cc: ldstr " reset"
IL_00d1: call System.String System.String::Concat(System.String,System.String,System.String)
IL_00d6: callvirt System.Void Console::Print(System.String)
IL_00db: ldc.i4.0
IL_00dc: ret
IL_00dd: ldsfld neobotics.ModSdk.Logging neobotics.ValheimMods.SlayerSkills::Log
IL_00e2: ldstr "SlayerSkills cheats are not enabled"
IL_00e7: callvirt System.Void neobotics.ModSdk.Logging::Debug(System.String)
IL_00ec: ldc.i4.1
IL_00ed: ret
// EH Finally: 69 - 106 => 106 - 120
