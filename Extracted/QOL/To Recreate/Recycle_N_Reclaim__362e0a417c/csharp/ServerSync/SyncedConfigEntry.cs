using System.Runtime.CompilerServices;
using BepInEx.Configuration;
using JetBrains.Annotations;

namespace ServerSync;

[_003Cd95a9308_002Dc7a9_002D45b5_002Da3c4_002D4f2dd2e4581b_003ENullable(0)]
[_003C0b1bc451_002D3ff1_002D4275_002D8206_002Dee850795ae9e_003ENullableContext(1)]
[PublicAPI]
internal class SyncedConfigEntry<[_003Cd95a9308_002Dc7a9_002D45b5_002Da3c4_002D4f2dd2e4581b_003ENullable(2)] T>(ConfigEntry<T> sourceConfig) : OwnConfigEntryBase
{
	public readonly ConfigEntry<T> SourceConfig = sourceConfig;

	public override ConfigEntryBase BaseConfig => (ConfigEntryBase)(object)SourceConfig;

	public T Value
	{
		get
		{
			return SourceConfig.Value;
		}
		set
		{
			SourceConfig.Value = value;
		}
	}

	public void AssignLocalValue(T value)
	{
		if (LocalBaseValue == null)
		{
			Value = value;
		}
		else
		{
			LocalBaseValue = value;
		}
	}
}
