using System;
using System.Runtime.CompilerServices;

namespace ServerSync;

[_003Ce7dc445c_002D6af3_002D41b0_002D8813_002D340f48322e04_003ENullable(0)]
[_003C9fde0fed_002D2b78_002D450c_002D809c_002D7ccb1ff1e7ca_003ENullableContext(2)]
internal abstract class CustomSyncedValueBase
{
	public object LocalBaseValue;

	[_003Ce7dc445c_002D6af3_002D41b0_002D8813_002D340f48322e04_003ENullable(1)]
	public readonly string Identifier;

	[_003Ce7dc445c_002D6af3_002D41b0_002D8813_002D340f48322e04_003ENullable(1)]
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

	[_003C9fde0fed_002D2b78_002D450c_002D809c_002D7ccb1ff1e7ca_003ENullableContext(1)]
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
