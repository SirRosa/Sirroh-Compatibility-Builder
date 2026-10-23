using System.Runtime.CompilerServices;
using BepInEx.Configuration;
using JetBrains.Annotations;

namespace ServerSync;

[_003C47a3b3b0_002Da5f0_002D4cc5_002Dbe9a_002D12b5485d1ac5_003ENullable(0)]
[PublicAPI]
[_003C3d5bc950_002Dcb34_002D4b80_002D9e9d_002Dc981a3db94a1_003ENullableContext(1)]
internal abstract class OwnConfigEntryBase
{
	[_003C47a3b3b0_002Da5f0_002D4cc5_002Dbe9a_002D12b5485d1ac5_003ENullable(2)]
	public object LocalBaseValue;

	public bool SynchronizedConfig = true;

	public abstract ConfigEntryBase BaseConfig { get; }
}
