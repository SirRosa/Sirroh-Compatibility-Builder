using JetBrains.Annotations;

namespace EpicLootAPI;

[PublicAPI]
internal enum SecretStashType
{
	Materials,
	RandomItems,
	OtherItems,
	Gamble,
	Sale
}
