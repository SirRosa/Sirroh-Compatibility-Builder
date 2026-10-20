using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using BepInEx;
using BepInEx.Configuration;
using HarmonyLib;
using UnityEngine;

namespace neobotics.ModSdk;

public class ServerConfiguration
{
	[HarmonyPatch(typeof(ZNet), "StopAll")]
	private static class ZNet_Shutdown_Patch
	{
		[HarmonyPrefix]
		private static void ZNet_StopAll_Prefix(ZNet __instance)
		{
			if (_instance != null)
			{
				Log.Debug("ZNet_StopAll_Patch_Prefix");
				_instance.ReceivedServerValues = false;
			}
		}
	}

	[HarmonyPatch(typeof(ZNet), "OnNewConnection")]
	private static class ZNet_OnNewConnection_Patch
	{
		private static void Postfix(ZNet __instance, ZNetPeer peer)
		{
			Log.Debug("ZNet OnNewConnection postfix");
			if (!__instance.IsServer())
			{
				try
				{
					peer.m_rpc.Register<ZPackage>("ClientConfigReceiver." + GetPluginGuid(), (Action<ZRpc, ZPackage>)Instance.RPC_ClientConfigReceiver);
					Log.Debug("Player registered RPC_ClientConfigReceiver");
					return;
				}
				catch (Exception)
				{
					Log.Warning("Failed to register RPC");
					return;
				}
			}
			try
			{
				Instance.SendConfigToClient(peer);
			}
			catch (Exception)
			{
				Log.Warning("Error sending server configuration to client");
			}
		}
	}

	public static List<DelegatedConfigEntryBase> ServerDelegatedEntries = new List<DelegatedConfigEntryBase>();

	private static ConfigFile LocalConfig;

	private static BaseUnityPlugin Mod;

	private static string ConfigFileName;

	private static ServerConfiguration _instance;

	private static Logging Log;

	public bool IsSetup;

	public bool ReceivedServerValues;

	public FileSystemWatcher ConfigWatcher;

	private const string NOT_CONFIGURED = "ServerConfiguration not initialized. Setup first.";

	public static ServerConfiguration Instance
	{
		get
		{
			if (_instance == null)
			{
				_instance = new ServerConfiguration();
			}
			return _instance;
		}
	}

	private ServerConfiguration()
	{
	}

	public void Setup(ConfigFile config, BaseUnityPlugin modInstance)
	{
		LocalConfig = config;
		Log = Logging.GetLogger();
		Log.Trace("ServerConfiguration Setup");
		Mod = modInstance;
		ConfigFileName = Path.GetFileName(LocalConfig.ConfigFilePath);
		IsSetup = true;
	}

	public void CreateConfigWatcher()
	{
		ConfigWatcher = Utils.CreateFileWatcher(LocalConfig.ConfigFilePath, LoadConfig);
	}

	private void LoadConfig(object sender, FileSystemEventArgs e)
	{
		if (!File.Exists(LocalConfig.ConfigFilePath))
		{
			return;
		}
		try
		{
			Log.Debug($"Loading configuration {e.ChangeType}");
			LocalConfig.Reload();
		}
		catch
		{
			Log.Error("Error loading configuration file " + ConfigFileName);
		}
	}

	public static string GetPluginGuid()
	{
		return Mod.Info.Metadata.GUID;
	}

	public void RPC_ClientConfigReceiver(ZRpc zrpc, ZPackage package)
	{
		if (!Instance.IsSetup)
		{
			Log.Error("ServerConfiguration not initialized. Setup first.");
			return;
		}
		Log.Debug("ClientConfigReceiver");
		string section;
		string name;
		while (package.GetPos() < package.Size())
		{
			section = package.ReadString();
			name = package.ReadString();
			string text = package.ReadString();
			Log.Trace("Reading " + section + " " + name + " value " + text + " from ZPackage");
			DelegatedConfigEntryBase delegatedConfigEntryBase = ServerDelegatedEntries.Find((DelegatedConfigEntryBase e) => e.Name == name && e.Section == section);
			if (delegatedConfigEntryBase != null)
			{
				Log.Trace("Found DCEB on client and setting to server value " + text);
				delegatedConfigEntryBase.ServerValue = text;
			}
			ConfigEntryBase val = LocalConfig[section, name];
			if (val != null)
			{
				Log.Trace("Found local CEB and setting underlying config value " + text);
				val.SetSerializedValue(text);
			}
		}
		ReceivedServerValues = true;
	}

	internal void WriteConfigEntries(ZPackage zpkg)
	{
		foreach (DelegatedConfigEntryBase serverDelegatedEntry in ServerDelegatedEntries)
		{
			Log.Trace("Writing " + serverDelegatedEntry.Section + " " + serverDelegatedEntry.Name + " value " + serverDelegatedEntry.ServerValue + " to ZPackage");
			zpkg.Write(serverDelegatedEntry.Section);
			zpkg.Write(serverDelegatedEntry.Name);
			zpkg.Write(serverDelegatedEntry.ServerValue);
		}
	}

	internal void SendConfigToClient(ZNetPeer peer)
	{
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0031: Expected Obj, but got Unknown
		if (!Instance.IsSetup)
		{
			Log.Error("ServerConfiguration not initialized. Setup first.");
			return;
		}
		Log.Debug("SendConfigToClient");
		ZPackage val = new ZPackage();
		WriteConfigEntries(val);
		peer.m_rpc.Invoke("ClientConfigReceiver." + GetPluginGuid(), new object[1] { val });
		Log.Trace("Invoked ClientConfigReceiver on peer");
	}

	public void SendConfigToAllClients(object o, SettingChangedEventArgs e)
	{
		//IL_004d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0053: Expected Obj, but got Unknown
		if (!IsSetup)
		{
			Log.Error("ServerConfiguration not initialized. Setup first.");
		}
		else if ((Object)(object)ZNet.instance != (Object)null && ZNet.instance.IsServer() && ZNet.instance.GetPeerConnections() > 0)
		{
			Log.Debug("SendConfigToAllClients");
			ZPackage zpkg = new ZPackage();
			WriteConfigEntries(zpkg);
			((MonoBehaviour)Mod).StartCoroutine(_instance.Co_BroadcastConfig(zpkg));
		}
	}

	private IEnumerator Co_BroadcastConfig(ZPackage zpkg)
	{
		Log.Debug("Co_BroadcastConfig");
		List<ZNetPeer> connectedPeers = ZNet.instance.GetConnectedPeers();
		foreach (ZNetPeer item in connectedPeers)
		{
			if (item != ZNet.instance.GetServerPeer())
			{
				item.m_rpc.Invoke("ClientConfigReceiver." + GetPluginGuid(), new object[1] { zpkg });
				Log.Trace("Invoked ClientConfigReceiver on peer");
			}
			yield return null;
		}
	}
}
