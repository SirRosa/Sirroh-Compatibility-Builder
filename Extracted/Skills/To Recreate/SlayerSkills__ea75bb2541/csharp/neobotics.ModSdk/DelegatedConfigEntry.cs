using System;
using BepInEx.Configuration;

namespace neobotics.ModSdk;

public class DelegatedConfigEntry<T> : DelegatedConfigEntryBase
{
	private ConfigEntry<T> _entry;

	private EventHandler rootHandler;

	private Action<object, EventArgs> clientDelegate;

	private Logging Log;

	public ConfigEntry<T> ConfigEntry
	{
		get
		{
			return _entry;
		}
		set
		{
			_entry = value;
			if (_entry != null && rootHandler != null)
			{
				_entry.SettingChanged += rootHandler;
			}
			Name = ((ConfigEntryBase)_entry).Definition.Key;
			Section = ((ConfigEntryBase)_entry).Definition.Section;
			ServerValue = ((ConfigEntryBase)_entry).GetSerializedValue();
			Log.Trace("Set " + Section + " " + Name + " to serialized value " + ServerValue);
		}
	}

	public T Value
	{
		get
		{
			return _entry.Value;
		}
		set
		{
			_entry.Value = value;
		}
	}

	public DelegatedConfigEntry(bool useServerDelegate = false)
		: this((Action<object, EventArgs>)null, useServerDelegate)
	{
	}

	public DelegatedConfigEntry(Action<object, EventArgs> delegateHandler, bool useServerDelegate = false)
	{
		Log = Logging.GetLogger();
		Log.Trace("DelegatedConfigEntry");
		if (delegateHandler != null)
		{
			clientDelegate = delegateHandler;
		}
		if (useServerDelegate)
		{
			Log.Trace("Configuring server delegate");
			rootHandler = (object s, EventArgs e) =>
			{
				ServerDelegate(s, e);
			};
			ServerConfiguration.ServerDelegatedEntries.Add(this);
		}
		else if (clientDelegate != null)
		{
			rootHandler = (object s, EventArgs e) =>
			{
				clientDelegate(s, e);
			};
		}
	}

	private void ServerDelegate(object sender, EventArgs args)
	{
		//IL_00d1: Unknown result type (might be due to invalid IL or missing references)
		//IL_00db: Expected Obj, but got Unknown
		Logging.GetLogger().Trace("ServerDelegate");
		_entry.SettingChanged -= rootHandler;
		ZNet instance = ZNet.instance;
		bool? flag = ((instance != null) ? new bool?(instance.IsServer()) : ((bool?)null));
		if (flag.HasValue)
		{
			if (flag == false && ServerConfiguration.Instance.ReceivedServerValues)
			{
				if (ServerValue != null)
				{
					((ConfigEntryBase)_entry).SetSerializedValue(ServerValue);
					Log.Debug("Setting " + Name + " to server value " + ServerValue);
				}
			}
			else if (flag == true)
			{
				ServerValue = ((ConfigEntryBase)_entry).GetSerializedValue();
				ServerConfiguration.Instance.SendConfigToAllClients(sender, (SettingChangedEventArgs)args);
			}
		}
		if (clientDelegate != null)
		{
			clientDelegate(sender, args);
		}
		_entry.SettingChanged += rootHandler;
	}

	public void EnableHandler(bool setActive)
	{
		if (setActive)
		{
			_entry.SettingChanged += rootHandler;
		}
		else
		{
			_entry.SettingChanged -= rootHandler;
		}
	}

	public bool IsKeyPressed()
	{
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		if (ConfigEntry is ConfigEntry<KeyboardShortcut> val)
		{
			return InputEvaluator.IsPressed(val.Value);
		}
		Log.Error("Keyboard read attempted on non-KeyboardShortcut config.");
		return false;
	}

	public bool IsKeyDown()
	{
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		if (ConfigEntry is ConfigEntry<KeyboardShortcut> val)
		{
			return InputEvaluator.IsDown(val.Value);
		}
		Log.Error("Keyboard read attempted on non-KeyboardShortcut config.");
		return false;
	}

	public bool IsKeyReleased()
	{
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		if (ConfigEntry is ConfigEntry<KeyboardShortcut> val)
		{
			return InputEvaluator.IsReleased(val.Value);
		}
		Log.Error("Keyboard read attempted on non-KeyboardShortcut config.");
		return false;
	}
}
