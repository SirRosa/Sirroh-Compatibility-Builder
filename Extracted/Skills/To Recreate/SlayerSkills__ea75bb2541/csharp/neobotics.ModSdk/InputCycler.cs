using BepInEx.Configuration;

namespace neobotics.ModSdk;

internal class InputCycler
{
	private static InputCycler _instance;

	private bool useMouseWheel;

	private DelegatedConfigEntry<KeyboardShortcut> keyAdvance;

	private DelegatedConfigEntry<KeyboardShortcut> keyReferse;

	public static InputCycler Instance
	{
		get
		{
			if (_instance == null)
			{
				_instance = new InputCycler();
			}
			return _instance;
		}
	}

	private InputCycler()
	{
	}

	public void Init(bool useMouseWheel, DelegatedConfigEntry<KeyboardShortcut> keyAdvance, DelegatedConfigEntry<KeyboardShortcut> keyReverse = null)
	{
		this.useMouseWheel = useMouseWheel;
		this.keyAdvance = keyAdvance;
		keyReferse = keyReverse;
	}
}
