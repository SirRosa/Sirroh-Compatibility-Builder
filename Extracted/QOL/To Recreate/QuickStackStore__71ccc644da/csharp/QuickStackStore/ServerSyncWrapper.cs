using System;
using BepInEx.Configuration;
using ServerSync;

namespace QuickStackStore;

internal static class ServerSyncWrapper
{
	internal static ConfigEntry<T> BindSyncLocker<T>(this ConfigFile configFile, ConfigSync serverSyncInstance, string group, string name, T value, ConfigDescription description) where T : IConvertible
	{
		ConfigEntry<T> val = configFile.Bind<T>(group, name, value, description);
		serverSyncInstance.AddLockingConfigEntry<T>(val);
		return val;
	}

	internal static ConfigEntry<T> BindSyncLocker<T>(this ConfigFile configFile, ConfigSync serverSyncInstance, string group, string name, T value, string description) where T : IConvertible
	{
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0019: Expected Obj, but got Unknown
		return configFile.BindSyncLocker(serverSyncInstance, group, name, value, new ConfigDescription(description, (AcceptableValueBase)null, Array.Empty<object>()));
	}

	internal static ConfigEntry<T> BindSynced<T>(this ConfigFile configFile, ConfigSync serverSyncInstance, string group, string name, T value, ConfigDescription description, bool synchronizedSetting = true)
	{
		ConfigEntry<T> val = configFile.Bind<T>(group, name, value, description);
		SyncedConfigEntry<T> syncedConfigEntry = serverSyncInstance.AddConfigEntry<T>(val);
		syncedConfigEntry.SynchronizedConfig = synchronizedSetting;
		return val;
	}

	internal static ConfigEntry<T> BindSynced<T>(this ConfigFile configFile, ConfigSync serverSyncInstance, string group, string name, T value, string description, bool synchronizedSetting = true)
	{
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		//IL_001b: Expected Obj, but got Unknown
		return configFile.BindSynced(serverSyncInstance, group, name, value, new ConfigDescription(description, (AcceptableValueBase)null, Array.Empty<object>()), synchronizedSetting);
	}
}
