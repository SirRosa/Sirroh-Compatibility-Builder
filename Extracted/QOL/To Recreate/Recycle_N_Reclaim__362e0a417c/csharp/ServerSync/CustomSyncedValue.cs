using System.Runtime.CompilerServices;
using JetBrains.Annotations;

namespace ServerSync;

[_003C0b1bc451_002D3ff1_002D4275_002D8206_002Dee850795ae9e_003ENullableContext(1)]
[_003Cd95a9308_002Dc7a9_002D45b5_002Da3c4_002D4f2dd2e4581b_003ENullable(0)]
[PublicAPI]
internal sealed class CustomSyncedValue<[_003Cd95a9308_002Dc7a9_002D45b5_002Da3c4_002D4f2dd2e4581b_003ENullable(2)] T> : CustomSyncedValueBase
{
	public T Value
	{
		get
		{
			return (T)BoxedValue;
		}
		set
		{
			BoxedValue = value;
		}
	}

	public CustomSyncedValue(ConfigSync configSync, string identifier, T value = default(T), int priority = 0)
		: base(configSync, identifier, typeof(T), priority)
	{
		Value = value;
	}

	public void AssignLocalValue(T value)
	{
		if (localIsOwner)
		{
			Value = value;
		}
		else
		{
			LocalBaseValue = value;
		}
	}
}
