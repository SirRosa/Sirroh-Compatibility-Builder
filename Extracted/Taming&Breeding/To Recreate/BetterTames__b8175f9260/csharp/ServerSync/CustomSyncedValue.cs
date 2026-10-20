using System.Runtime.CompilerServices;
using JetBrains.Annotations;

namespace ServerSync;

[ServerSync_002ENullableContext(1)]
[ServerSync_002ENullable(0)]
[PublicAPI]
public sealed class CustomSyncedValue<[ServerSync_002ENullable(2)] T> : CustomSyncedValueBase
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
