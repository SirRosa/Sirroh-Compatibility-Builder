using System;
using BepInEx.Configuration;
using UnityEngine;

namespace QuickStackStore;

internal sealed class ConfigurationManagerAttributes
{
	public bool? ShowRangeAsPercent;

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

	public Func<object, string> ObjToStr;

	public Func<string, object> StrToObj;

	internal static ConfigDescription CustomDisplay(string category, string displayName, string description, AcceptableValueBase acceptableValues = null)
	{
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Expected Obj, but got Unknown
		return new ConfigDescription(description, acceptableValues, new object[1]
		{
			new ConfigurationManagerAttributes
			{
				Category = category,
				DispName = displayName
			}
		});
	}

	internal static ConfigDescription CustomCategory(string category, AcceptableValueBase acceptableValues = null)
	{
		return CustomCategoryWithDescription(category, string.Empty, acceptableValues);
	}

	internal static ConfigDescription CustomCategoryWithDescription(string category, string description, AcceptableValueBase acceptableValues = null)
	{
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Expected Obj, but got Unknown
		return new ConfigDescription(description, acceptableValues, new object[1]
		{
			new ConfigurationManagerAttributes
			{
				Category = category
			}
		});
	}

	internal static ConfigDescription MUCSettingDisplay(string overwriteName, string category, string description, AcceptableValueBase acceptableValues = null)
	{
		//IL_0063: Unknown result type (might be due to invalid IL or missing references)
		//IL_0069: Expected Obj, but got Unknown
		if (CompatibilitySupport.HasPlugin("com.maxsch.valheim.MultiUserChest"))
		{
			return new ConfigDescription("Area quick stacking and area restocking is always allowed while using 'Multi User Chest'.", acceptableValues, new object[1]
			{
				new ConfigurationManagerAttributes
				{
					DispName = overwriteName,
					Category = category,
					ReadOnly = true,
					CustomDrawer = (ConfigEntryBase a) =>
					{
						CustomLabelDrawer("Enabled ('Multi User Chest' is installed)");
					}
				}
			});
		}
		return CustomCategoryWithDescription(category, description, acceptableValues);
	}

	internal static ConfigDescription HiddenDisplay(Func<bool> condition, string description, AcceptableValueBase acceptableValues = null)
	{
		//IL_0044: Unknown result type (might be due to invalid IL or missing references)
		//IL_004a: Expected Obj, but got Unknown
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		//IL_003a: Expected Obj, but got Unknown
		if (condition())
		{
			return new ConfigDescription(description, acceptableValues, new object[1]
			{
				new ConfigurationManagerAttributes
				{
					Browsable = false,
					ReadOnly = true
				}
			});
		}
		return new ConfigDescription(description, acceptableValues, Array.Empty<object>());
	}

	internal static ConfigDescription HiddenTrashingDisplay(string description, AcceptableValueBase acceptableValues = null)
	{
		return HiddenDisplay(CompatibilitySupport.DisallowAllTrashCanFeatures, description, acceptableValues);
	}

	internal static ConfigDescription TrashingCategoryHideNotificationDisplay(string description, AcceptableValueBase acceptableValues = null)
	{
		//IL_006b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0071: Expected Obj, but got Unknown
		//IL_005b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0061: Expected Obj, but got Unknown
		if (CompatibilitySupport.DisallowAllTrashCanFeatures())
		{
			return new ConfigDescription("Force disabled due to using other mod that adds trashing/ recycling", acceptableValues, new object[1]
			{
				new ConfigurationManagerAttributes
				{
					DispName = "Trashing",
					ReadOnly = true,
					CustomDrawer = (ConfigEntryBase a) =>
					{
						CustomLabelDrawer("Force disabled for compatibility reasons");
					}
				}
			});
		}
		return new ConfigDescription(description, acceptableValues, Array.Empty<object>());
	}

	internal static ConfigDescription ForceEnabledDisplay(Func<bool> condition, string description, AcceptableValueBase acceptableValues = null)
	{
		return SeeOnlyDisplay(condition, description, "Force enabled for better compatibility with one of your installed mods. " + description, "Force enabled for compatibility reasons", acceptableValues);
	}

	internal static ConfigDescription ForceDisabledDisplay(Func<bool> condition, string description, AcceptableValueBase acceptableValues = null)
	{
		return SeeOnlyDisplay(condition, description, "Force disabled for better compatibility with one of your installed mods. " + description, "Force disabled for compatibility reasons", acceptableValues);
	}

	internal static ConfigDescription SeeOnlyDisplay(Func<bool> condition, string description, string overwriteDescription, string overwriteLabel, AcceptableValueBase acceptableValues = null)
	{
		//IL_0059: Unknown result type (might be due to invalid IL or missing references)
		//IL_005f: Expected Obj, but got Unknown
		//IL_0048: Unknown result type (might be due to invalid IL or missing references)
		//IL_004e: Expected Obj, but got Unknown
		if (condition())
		{
			return new ConfigDescription(overwriteDescription, acceptableValues, new object[1]
			{
				new ConfigurationManagerAttributes
				{
					ReadOnly = true,
					CustomDrawer = (ConfigEntryBase a) =>
					{
						CustomLabelDrawer(overwriteLabel);
					}
				}
			});
		}
		return new ConfigDescription(description, acceptableValues, Array.Empty<object>());
	}

	private static void CustomLabelDrawer(string labelText)
	{
		GUILayout.Label(labelText, new GUILayoutOption[1] { GUILayout.ExpandWidth(true) });
	}
}
