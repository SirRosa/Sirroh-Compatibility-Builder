using System;
using System.Runtime.CompilerServices;
using BepInEx.Configuration;

namespace CreatureLevelControl;

[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(2)]
public class ConfigurationManagerAttributes
{
	public bool? ShowRangeAsPercent;

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1 })]
	public Action<ConfigEntryBase> CustomDrawer;

	public bool? Browsable;

	public string Category;

	public object DefaultValue;

	public bool? HideDefaultButton;

	public bool? HideSettingName;

	public string Description;

	public string DispName;

	public int? Order;

	public bool? ReadOnly;

	public bool? IsAdvanced;

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 1 })]
	public Func<object, string> ObjToStr;

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 1 })]
	public Func<string, object> StrToObj;
}
