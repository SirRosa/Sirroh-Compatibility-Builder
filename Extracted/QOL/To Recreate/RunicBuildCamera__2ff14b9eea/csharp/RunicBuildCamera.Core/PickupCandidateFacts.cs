namespace RunicBuildCamera.Core;

internal readonly struct PickupCandidateFacts
{
	internal bool HasValidNetworkIdentity { get; }

	internal bool IsWithinRange { get; }

	internal bool IsFish { get; }

	internal bool AutoPickupEnabled { get; }

	internal bool IsPiece { get; }

	internal bool IsInTar { get; }

	internal bool IsUniqueOrQuestItem { get; }

	internal bool InventoryCanAdd { get; }

	internal bool WouldExceedCarryWeight { get; }

	internal bool IsCoolingDown { get; }

	internal PickupCandidateFacts(bool hasValidNetworkIdentity, bool isWithinRange, bool isFish, bool autoPickupEnabled, bool isPiece, bool isInTar, bool isUniqueOrQuestItem, bool inventoryCanAdd, bool wouldExceedCarryWeight, bool isCoolingDown)
	{
		HasValidNetworkIdentity = hasValidNetworkIdentity;
		IsWithinRange = isWithinRange;
		IsFish = isFish;
		AutoPickupEnabled = autoPickupEnabled;
		IsPiece = isPiece;
		IsInTar = isInTar;
		IsUniqueOrQuestItem = isUniqueOrQuestItem;
		InventoryCanAdd = inventoryCanAdd;
		WouldExceedCarryWeight = wouldExceedCarryWeight;
		IsCoolingDown = isCoolingDown;
	}
}
