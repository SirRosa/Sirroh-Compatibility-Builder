namespace RunicBuildCamera.Core;

internal enum PickupRejectionReason
{
	None,
	InvalidNetworkIdentity,
	OutsideRange,
	Fish,
	AutoPickupDisabled,
	Piece,
	InTar,
	UniqueOrQuestItem,
	InventoryFull,
	TooHeavy,
	CoolingDown
}
