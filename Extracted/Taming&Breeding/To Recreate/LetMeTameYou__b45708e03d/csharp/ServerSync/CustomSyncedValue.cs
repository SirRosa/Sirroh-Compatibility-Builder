using System.Runtime.CompilerServices;
using JetBrains.Annotations;

namespace ServerSync;

[_003Ce7dc445c_002D6af3_002D41b0_002D8813_002D340f48322e04_003ENullable(0)]
[_003C9fde0fed_002D2b78_002D450c_002D809c_002D7ccb1ff1e7ca_003ENullableContext(1)]
[PublicAPI]
internal sealed class CustomSyncedValue<[_003Ce7dc445c_002D6af3_002D41b0_002D8813_002D340f48322e04_003ENullable(2)] T> : CustomSyncedValueBase
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
