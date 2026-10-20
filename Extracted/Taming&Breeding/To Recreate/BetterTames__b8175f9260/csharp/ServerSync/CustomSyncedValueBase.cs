using System;
using System.Runtime.CompilerServices;

namespace ServerSync;

[ServerSync_002ENullableContext(2)]
[ServerSync_002ENullable(0)]
public abstract class CustomSyncedValueBase
{
	public object LocalBaseValue;

	[ServerSync_002ENullable(1)]
	public readonly string Identifier;

	[ServerSync_002ENullable(1)]
	public readonly Type Type;

	private object boxedValue;

	protected bool localIsOwner;

	public readonly int Priority;

	public object BoxedValue
	{
		get
		{
			return boxedValue;
		}
		set
		{
			boxedValue = value;
			ValueChanged?.Invoke();
		}
	}

	public event Action ValueChanged;

	[ServerSync_002ENullableContext(1)]
	protected CustomSyncedValueBase(ConfigSync configSync, string identifier, Type type, int priority)
	{
		Priority = priority;
		Identifier = identifier;
		Type = type;
		configSync.AddCustomValue(this);
		localIsOwner = configSync.IsSourceOfTruth;
		configSync.SourceOfTruthChanged += (bool truth) =>
		{
			localIsOwner = truth;
		};
	}
}
