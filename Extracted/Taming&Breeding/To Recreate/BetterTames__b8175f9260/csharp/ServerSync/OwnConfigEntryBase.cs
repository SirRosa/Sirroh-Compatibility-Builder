using System.Runtime.CompilerServices;
using BepInEx.Configuration;
using JetBrains.Annotations;

namespace ServerSync;

[ServerSync_002ENullableContext(1)]
[ServerSync_002ENullable(0)]
[PublicAPI]
public abstract class OwnConfigEntryBase
{
	[ServerSync_002ENullable(2)]
	public object LocalBaseValue;

	public bool SynchronizedConfig = true;

	public abstract ConfigEntryBase BaseConfig { get; }
}
