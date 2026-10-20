using System.Runtime.CompilerServices;
using BepInEx.Configuration;
using JetBrains.Annotations;

namespace ServerSync;

[_003C9fde0fed_002D2b78_002D450c_002D809c_002D7ccb1ff1e7ca_003ENullableContext(1)]
[_003Ce7dc445c_002D6af3_002D41b0_002D8813_002D340f48322e04_003ENullable(0)]
[PublicAPI]
internal abstract class OwnConfigEntryBase
{
	[_003Ce7dc445c_002D6af3_002D41b0_002D8813_002D340f48322e04_003ENullable(2)]
	public object LocalBaseValue;

	public bool SynchronizedConfig = true;

	public abstract ConfigEntryBase BaseConfig { get; }
}
