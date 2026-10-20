using System.Runtime.CompilerServices;
using JetBrains.Annotations;

namespace AzuEPI;

[PublicAPI]
internal struct SlotSnapshot
{
	public SlotDescriptor Descriptor { get; }

	public bool Occupied { get; }

	public readonly Vector2i GridPos
	{
		[CompilerGenerated]
		get
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			return field;
		}
	}

	public int LinearGridIndex { get; }

	public SlotSnapshot(SlotDescriptor descriptor, bool occupied, Vector2i gridPos, int linearGridIndex)
	{
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		Descriptor = descriptor;
		Occupied = occupied;
		GridPos = gridPos;
		LinearGridIndex = linearGridIndex;
	}

	[MethodImpl(MethodImplOptions.AggressiveInlining)]
	public bool Validates(ItemData item)
	{
		return API.SlotValidates(Descriptor.Index, item);
	}
}
