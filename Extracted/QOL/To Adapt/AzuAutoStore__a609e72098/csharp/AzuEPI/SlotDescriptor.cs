using System.Runtime.CompilerServices;
using JetBrains.Annotations;
using UnityEngine;

namespace AzuEPI;

[_003C830637c6_002Dabe4_002D47bb_002D978f_002D1cefcab86d66_003ENullableContext(1)]
[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(0)]
[PublicAPI]
internal struct SlotDescriptor
{
	public int Index { get; }

	public string Name { get; }

	public string OriginalName { get; }

	public bool IsQuickSlot { get; }

	public bool IsEquipmentSlot { get; }

	public bool IsCustom { get; }

	public readonly Vector2 UiPosition
	{
		[CompilerGenerated]
		get
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			return field;
		}
	}

	public SlotDescriptor(int index, string name, string originalName, bool isQuickSlot, bool isEquipmentSlot, bool isCustom, Vector2 uiPosition)
	{
		//IL_0040: Unknown result type (might be due to invalid IL or missing references)
		//IL_0042: Unknown result type (might be due to invalid IL or missing references)
		Index = index;
		Name = name ?? string.Empty;
		OriginalName = originalName ?? string.Empty;
		IsQuickSlot = isQuickSlot;
		IsEquipmentSlot = isEquipmentSlot;
		IsCustom = isCustom;
		UiPosition = uiPosition;
	}
}
