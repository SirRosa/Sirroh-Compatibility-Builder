using System.Runtime.CompilerServices;
using BepInEx.Configuration;
using JetBrains.Annotations;

namespace ServerSync;

[PublicAPI]
[_003C0b1bc451_002D3ff1_002D4275_002D8206_002Dee850795ae9e_003ENullableContext(1)]
[_003Cd95a9308_002Dc7a9_002D45b5_002Da3c4_002D4f2dd2e4581b_003ENullable(0)]
internal abstract class OwnConfigEntryBase
{
	[_003Cd95a9308_002Dc7a9_002D45b5_002Da3c4_002D4f2dd2e4581b_003ENullable(2)]
	public object LocalBaseValue;

	public bool SynchronizedConfig = true;

	public abstract ConfigEntryBase BaseConfig { get; }
}
