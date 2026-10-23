using System.Runtime.CompilerServices;
using BepInEx.Configuration;
using JetBrains.Annotations;

namespace ServerSync;

[_003C3d5bc950_002Dcb34_002D4b80_002D9e9d_002Dc981a3db94a1_003ENullableContext(1)]
[_003C47a3b3b0_002Da5f0_002D4cc5_002Dbe9a_002D12b5485d1ac5_003ENullable(0)]
[PublicAPI]
internal class SyncedConfigEntry<[_003C47a3b3b0_002Da5f0_002D4cc5_002Dbe9a_002D12b5485d1ac5_003ENullable(2)] T>(ConfigEntry<T> sourceConfig) : OwnConfigEntryBase
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
