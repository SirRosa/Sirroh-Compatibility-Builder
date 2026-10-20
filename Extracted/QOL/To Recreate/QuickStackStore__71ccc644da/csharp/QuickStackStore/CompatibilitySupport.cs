using System;
using System.Linq;
using System.Reflection;
using AzuExtendedPlayerInventory;
using BepInEx;
using BepInEx.Bootstrap;
using BepInEx.Configuration;

namespace QuickStackStore;

public static class CompatibilitySupport
{
	public enum RandyStatus
	{
		Disabled,
		EnabledWithoutQuickSlots,
		EnabledWithQuickSlots
	}

	private static MethodInfo IsComfyArmorSlot;

	private static MethodInfo IsRestrictedContainer;

	private static FieldInfo IsQuiverEnabled;

	private static FieldInfo QuiverRowIndex;

	private static FieldInfo AedenAddEquipmentRow;

	private static FieldInfo OdinExAddEquipmentRow;

	private static FieldInfo OdinQOLAddEquipmentRow;

	private static FieldInfo AzuEPIAddEquipmentRow;

	private static FieldInfo RandyQuickSlotsEnabled;

	public const string aeden = "aedenthorn.ExtendedPlayerInventory";

	public const string comfy = "com.bruce.valheim.comfyquickslots";

	public const string odinPlus = "com.odinplusqol.mod";

	public const string odinExInv = "odinplusqol.OdinsExtendedInventory";

	public const string randy = "randyknapp.mods.equipmentandquickslots";

	public const string azuEPI = "Azumatt.AzuExtendedPlayerInventory";

	public const string auga = "randyknapp.mods.auga";

	public static bool isUsingAzuEPIWithAPI = false;

	public static bool isUsingAzuEPIWithQuickslotCompatibleAPI = false;

	public const string betterArchery = "ishid4.mods.betterarchery";

	public const string smartContainers = "flueno.SmartContainers";

	public const string backpacks = "org.bepinex.plugins.backpacks";

	public const string multiUserChest = "com.maxsch.valheim.MultiUserChest";

	public const string jewelCrafting = "org.bepinex.plugins.jewelcrafting";

	public const string recyclePlus = "TastyChickenLegs.RecyclePlus";

	public const string dynamicStoragePiles = "com.maxsch.valheim.DynamicStoragePiles";

	public const string currencyPockets = "Azumatt.CurrencyPocket";

	public static Version mucUpdateVersion = new Version(0, 4, 0);

	public static Version azuEPIOnOffUpdate = new Version(1, 2, 0);

	public static Version azuEPIQuickSlotAPIUpdate = new Version(1, 3, 2);

	public static bool HasAedenLikeEquipOrQuickSlotPlugin()
	{
		return HasPlugin("aedenthorn.ExtendedPlayerInventory") || HasPlugin("odinplusqol.OdinsExtendedInventory") || HasPlugin("com.odinplusqol.mod") || (HasPlugin("Azumatt.AzuExtendedPlayerInventory") && !isUsingAzuEPIWithAPI);
	}

	public static bool AllowAreaStackingRestocking()
	{
		return AreaStackRestockHelper.IsTrueSingleplayer() || HasPlugin("com.maxsch.valheim.MultiUserChest") || QSSConfig.QuickStackRestockConfig.AllowAreaStackingInMultiplayerWithoutMUC.Value;
	}

	public static bool DisallowAllTrashCanFeatures()
	{
		return HasPlugin("TastyChickenLegs.RecyclePlus");
	}

	public static bool ShouldBlockChangesToTakeAllButton()
	{
		return QSSConfig.StoreTakeAllConfig.NeverMoveTakeAllButton.Value || ShouldBlockChangesToTakeAllButtonDueToPlugin();
	}

	public static bool ShouldBlockChangesToTakeAllButtonDueToPlugin()
	{
		return HasPlugin("flueno.SmartContainers") || HasPlugin("org.bepinex.plugins.backpacks") || HasPlugin("org.bepinex.plugins.jewelcrafting") || HasRandyPlugin() == RandyStatus.EnabledWithQuickSlots;
	}

	public static bool HasOutdatedMUCPlugin()
	{
		if (Chainloader.PluginInfos.ContainsKey("com.maxsch.valheim.MultiUserChest"))
		{
			PluginInfo val = Chainloader.PluginInfos["com.maxsch.valheim.MultiUserChest"];
			return val.Metadata.Version < mucUpdateVersion;
		}
		return false;
	}

	public static bool HasAzuEPIWithQuickslotCompatibleAPI()
	{
		if (Chainloader.PluginInfos.ContainsKey("Azumatt.AzuExtendedPlayerInventory"))
		{
			PluginInfo val = Chainloader.PluginInfos["Azumatt.AzuExtendedPlayerInventory"];
			return val.Metadata.Version >= azuEPIQuickSlotAPIUpdate;
		}
		return false;
	}

	public static bool HasPlugin(string guid)
	{
		return Chainloader.PluginInfos.ContainsKey(guid);
	}

	public static RandyStatus HasRandyPlugin()
	{
		if (!HasPlugin("randyknapp.mods.equipmentandquickslots"))
		{
			return RandyStatus.Disabled;
		}
		return RandyStatus.EnabledWithQuickSlots;
	}

	public static bool HasPluginThatRequiresMiniButtonVMove()
	{
		return HasAedenLikeEquipOrQuickSlotPlugin() || (HasPlugin("Azumatt.AzuExtendedPlayerInventory") && isUsingAzuEPIWithAPI);
	}

	public static bool IsEquipSlot(int inventoryHeight, int inventoryWidth, Vector2i itemPos)
	{
		//IL_0003: Unknown result type (might be due to invalid IL or missing references)
		return InternalIsEquipOrQuickSlot(inventoryHeight, inventoryWidth, itemPos, includeRestockableSlots: false);
	}

	public static bool IsEquipOrQuickSlot(int inventoryHeight, int inventoryWidth, Vector2i itemPos)
	{
		//IL_0003: Unknown result type (might be due to invalid IL or missing references)
		return InternalIsEquipOrQuickSlot(inventoryHeight, inventoryWidth, itemPos, includeRestockableSlots: true);
	}

	private static bool InternalIsEquipOrQuickSlot(int inventoryHeight, int inventoryWidth, Vector2i itemPos, bool includeRestockableSlots)
	{
		//IL_0022: Unknown result type (might be due to invalid IL or missing references)
		//IL_0059: Unknown result type (might be due to invalid IL or missing references)
		//IL_0090: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ce: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f8: Unknown result type (might be due to invalid IL or missing references)
		//IL_011a: Unknown result type (might be due to invalid IL or missing references)
		//IL_013b: Unknown result type (might be due to invalid IL or missing references)
		if (HasPlugin("aedenthorn.ExtendedPlayerInventory") && IsAedenLikeEquipOrQuickSlot(ref AedenAddEquipmentRow, "ExtendedPlayerInventory", "BepInExPlugin", "addEquipmentRow", inventoryHeight, itemPos, includeRestockableSlots))
		{
			return true;
		}
		if (HasPlugin("odinplusqol.OdinsExtendedInventory") && IsAedenLikeEquipOrQuickSlot(ref OdinExAddEquipmentRow, "OdinsExtendedInventory", "OdinsExtendedInventoryPlugin", "addEquipmentRow", inventoryHeight, itemPos, includeRestockableSlots))
		{
			return true;
		}
		if (HasPlugin("com.odinplusqol.mod") && IsAedenLikeEquipOrQuickSlot(ref OdinQOLAddEquipmentRow, "OdinQOL", "QuickAccessBar", "AddEquipmentRow", inventoryHeight, itemPos, includeRestockableSlots))
		{
			return true;
		}
		if (HasPlugin("Azumatt.AzuExtendedPlayerInventory") && !isUsingAzuEPIWithAPI && IsAedenLikeEquipOrQuickSlot(ref AzuEPIAddEquipmentRow, "AzuExtendedPlayerInventory", "AzuExtendedPlayerInventoryPlugin", "AddEquipmentRow", inventoryHeight, itemPos, includeRestockableSlots))
		{
			return true;
		}
		if (HasPlugin("Azumatt.AzuExtendedPlayerInventory") && isUsingAzuEPIWithAPI && IsNewAzuEPIEquipOrQuickSlot(inventoryHeight, inventoryWidth, itemPos, includeRestockableSlots))
		{
			return true;
		}
		if (HasPlugin("com.bruce.valheim.comfyquickslots") && IsComfyEquipOrQuickSlot(inventoryHeight, itemPos, includeRestockableSlots))
		{
			return true;
		}
		if (HasPlugin("ishid4.mods.betterarchery") && IsBetterArcheryQuiverSlot(itemPos, includeRestockableSlots))
		{
			return true;
		}
		return false;
	}

	private static bool HasAedenLikeEquipmentRow(ref FieldInfo fieldInfo, string assemblyName, string className, string fieldName)
	{
		if (fieldInfo == null)
		{
			Assembly assembly = Assembly.Load(assemblyName);
			if (assembly != null)
			{
				Type type = assembly.GetTypes().First((Type a) => a.IsClass && a.Name == className);
				FieldInfo[] fields = type.GetFields(BindingFlags.Static | BindingFlags.Public);
				fieldInfo = fields.First((FieldInfo t) => t.Name?.ToLower() == fieldName.ToLower());
			}
		}
		if (fieldInfo == AzuEPIAddEquipmentRow && Chainloader.PluginInfos["Azumatt.AzuExtendedPlayerInventory"].Metadata.Version >= azuEPIOnOffUpdate)
		{
			object? obj = fieldInfo?.GetValue(null);
			ConfigEntryBase val = (ConfigEntryBase)((obj is ConfigEntryBase) ? obj : null);
			return val != null && (int)val.BoxedValue != 0;
		}
		return fieldInfo?.GetValue(null) is ConfigEntry<bool> val2 && val2.Value;
	}

	private static bool IsNewAzuEPIEquipOrQuickSlot(int inventoryHeight, int inventoryWidth, Vector2i itemPos, bool includeRestockableSlots)
	{
		//IL_0093: Unknown result type (might be due to invalid IL or missing references)
		//IL_0054: Unknown result type (might be due to invalid IL or missing references)
		//IL_0059: Unknown result type (might be due to invalid IL or missing references)
		if (!HasAedenLikeEquipmentRow(ref AzuEPIAddEquipmentRow, "AzuExtendedPlayerInventory", "AzuExtendedPlayerInventoryPlugin", "AddEquipmentRow"))
		{
			return false;
		}
		if (!includeRestockableSlots && isUsingAzuEPIWithQuickslotCompatibleAPI)
		{
			foreach (ItemData quickSlotsItem in API.GetQuickSlotsItems())
			{
				if (quickSlotsItem.m_gridPos == itemPos)
				{
					return false;
				}
			}
		}
		int addedRows = API.GetAddedRows(inventoryWidth);
		for (int i = 1; i <= addedRows; i++)
		{
			if (itemPos.y == inventoryHeight - i)
			{
				return true;
			}
		}
		return false;
	}

	private static bool IsAedenLikeEquipOrQuickSlot(ref FieldInfo fieldInfo, string assemblyName, string className, string fieldName, int inventoryHeight, Vector2i itemPos, bool checkForRestockableSlots)
	{
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0035: Unknown result type (might be due to invalid IL or missing references)
		if (!HasAedenLikeEquipmentRow(ref fieldInfo, assemblyName, className, fieldName))
		{
			return false;
		}
		return itemPos.y == inventoryHeight - 1 && (checkForRestockableSlots || itemPos.x < 5 || itemPos.x > 7);
	}

	private static bool IsComfyEquipOrQuickSlot(int inventoryHeight, Vector2i itemPos, bool includeRestockableSlots)
	{
		//IL_00a1: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ef: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f7: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fd: Unknown result type (might be due to invalid IL or missing references)
		if (IsComfyArmorSlot == null)
		{
			Assembly assembly = Assembly.Load("ComfyQuickSlots");
			if (assembly != null)
			{
				Type type = assembly.GetTypes().First((Type a) => a.IsClass && a.Name == "QuickSlotsManager");
				MethodInfo[] methods = type.GetMethods(BindingFlags.Static | BindingFlags.Public);
				IsComfyArmorSlot = methods.First((MethodInfo t) => t.Name?.ToLower() == "IsArmorSlot".ToLower() && t.GetParameters().Length == 1);
			}
		}
		object obj = IsComfyArmorSlot?.Invoke(null, new object[1] { itemPos });
		bool flag = default;
		int num;
		if (obj is bool)
		{
			flag = (bool)obj;
			num = 1;
		}
		else
		{
			num = 0;
		}
		if (((uint)num & (flag ? 1u : 0u)) != 0)
		{
			return true;
		}
		if (includeRestockableSlots)
		{
			obj = IsComfyArmorSlot?.Invoke(null, new object[1] { (object)new Vector2i(itemPos.x - 3, itemPos.y) });
			bool flag2 = default;
			int num2;
			if (obj is bool)
			{
				flag2 = (bool)obj;
				num2 = 1;
			}
			else
			{
				num2 = 0;
			}
			if (((uint)num2 & (flag2 ? 1u : 0u)) != 0)
			{
				return true;
			}
		}
		return false;
	}

	public static bool TryGetRestrictedContainer(string containerName, out string allowedItem)
	{
		allowedItem = null;
		if (!HasPlugin("com.maxsch.valheim.DynamicStoragePiles"))
		{
			return false;
		}
		if (IsRestrictedContainer == null)
		{
			Assembly assembly = Assembly.Load("DynamicStoragePiles");
			if (assembly != null)
			{
				Type type = assembly.GetTypes().First((Type a) => a.IsClass && a.Name == "RestrictContainers");
				MethodInfo[] methods = type.GetMethods(BindingFlags.Static | BindingFlags.Public);
				IsRestrictedContainer = methods.First((MethodInfo t) => t.Name?.ToLower() == "IsRestrictedContainer".ToLower());
			}
		}
		object[] array = new object[2] { containerName, null };
		object obj = IsRestrictedContainer?.Invoke(null, array);
		bool flag = default;
		int num;
		if (obj is bool)
		{
			flag = (bool)obj;
			num = 1;
		}
		else
		{
			num = 0;
		}
		if (((uint)num & (flag ? 1u : 0u)) != 0)
		{
			allowedItem = (string)array[1];
			return true;
		}
		return false;
	}

	private static bool IsBetterArcheryQuiverSlot(Vector2i itemPos, bool includeRestockableSlots)
	{
		//IL_0145: Unknown result type (might be due to invalid IL or missing references)
		//IL_0151: Unknown result type (might be due to invalid IL or missing references)
		//IL_0175: Unknown result type (might be due to invalid IL or missing references)
		//IL_015a: Unknown result type (might be due to invalid IL or missing references)
		if (IsQuiverEnabled == null || QuiverRowIndex == null)
		{
			Assembly assembly = Assembly.Load("BetterArchery");
			if (assembly != null)
			{
				Type type = assembly.GetTypes().First((Type a) => a.IsClass && a.Name == "BetterArchery");
				FieldInfo[] fields = type.GetFields(BindingFlags.Static | BindingFlags.Public);
				IsQuiverEnabled = fields.First((FieldInfo t) => t.Name?.ToLower() == "ConfigQuiverEnabled".ToLower());
				QuiverRowIndex = fields.First((FieldInfo t) => t.Name?.ToLower() == "QuiverRowIndex".ToLower());
			}
		}
		if (!(IsQuiverEnabled?.GetValue(null) is ConfigEntry<bool> val) || !val.Value)
		{
			return false;
		}
		if (QuiverRowIndex?.GetValue(null) is int num)
		{
			if (num == 0)
			{
				return false;
			}
			if (itemPos.y == num && (includeRestockableSlots || itemPos.x < 0 || itemPos.x > 2))
			{
				return true;
			}
			if (itemPos.y == num - 1)
			{
				return true;
			}
		}
		return false;
	}
}
