using System;
using System.Runtime.CompilerServices;

namespace ServerSync;

[_003C3d5bc950_002Dcb34_002D4b80_002D9e9d_002Dc981a3db94a1_003ENullableContext(2)]
[_003C47a3b3b0_002Da5f0_002D4cc5_002Dbe9a_002D12b5485d1ac5_003ENullable(0)]
internal abstract class CustomSyncedValueBase
{
	public object LocalBaseValue;

	[_003C47a3b3b0_002Da5f0_002D4cc5_002Dbe9a_002D12b5485d1ac5_003ENullable(1)]
	public readonly string Identifier;

	[_003C47a3b3b0_002Da5f0_002D4cc5_002Dbe9a_002D12b5485d1ac5_003ENullable(1)]
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

	[_003C3d5bc950_002Dcb34_002D4b80_002D9e9d_002Dc981a3db94a1_003ENullableContext(1)]
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
