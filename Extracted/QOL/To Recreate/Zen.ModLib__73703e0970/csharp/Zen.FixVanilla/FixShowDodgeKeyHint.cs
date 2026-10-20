using BepInEx;
using HarmonyLib;
using TMPro;
using UnityEngine;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal static class FixShowDodgeKeyHint
{
	[HarmonyPostfix]
	[HarmonyPatch(typeof(KeyHints), "ApplySettings")]
	private static void KeyHints_ApplySettings(KeyHints __instance)
	{
		Transform val = __instance.m_combatHints.transform.Find("Keyboard/Dodge");
		if (!Object.op_Implicit((Object)(object)val))
		{
			Logging<ModLib>.Warning("Keyboard/Dodge node is missing, aborting KeyHint rewrite for AltDodge");
			return;
		}
		Transform val2 = val.Find("key_bkg/Key");
		TextMeshProUGUI val3 = ((val2 != null) ? ((Component)val2).GetComponent<TextMeshProUGUI>() : null);
		if (!Object.op_Implicit((Object)(object)val3))
		{
			Logging<ModLib>.Warning("key_bkg/Key is missing, aborting KeyHint rewrite for AltDodge");
			return;
		}
		bool flag = !Utility.IsNullOrWhiteSpace(ZInput.instance.GetButtonDef("AltDodge").GetActionPath(true));
		((TMP_Text)val3).text = (flag ? "$KEY_AltDodge" : "$KEY_MouseRight");
		((Component)val.GetChild(2)).gameObject.SetActive(!flag);
		((Component)val.GetChild(3)).gameObject.SetActive(!flag);
		Localization.instance.Localize(((Component)val).transform);
	}
}
