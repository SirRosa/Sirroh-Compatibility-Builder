using System.Runtime.CompilerServices;
using BepInEx.Configuration;
using JetBrains.Annotations;

namespace ServerSync;

[_003Ce7dc445c_002D6af3_002D41b0_002D8813_002D340f48322e04_003ENullable(0)]
[_003C9fde0fed_002D2b78_002D450c_002D809c_002D7ccb1ff1e7ca_003ENullableContext(1)]
[PublicAPI]
internal class SyncedConfigEntry<[_003Ce7dc445c_002D6af3_002D41b0_002D8813_002D340f48322e04_003ENullable(2)] T>(ConfigEntry<T> sourceConfig) : OwnConfigEntryBase
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
