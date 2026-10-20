using System;
using System.Runtime.CompilerServices;

namespace ServerSync;

[_003C0b1bc451_002D3ff1_002D4275_002D8206_002Dee850795ae9e_003ENullableContext(2)]
[_003Cd95a9308_002Dc7a9_002D45b5_002Da3c4_002D4f2dd2e4581b_003ENullable(0)]
internal abstract class CustomSyncedValueBase
{
	public object LocalBaseValue;

	[_003Cd95a9308_002Dc7a9_002D45b5_002Da3c4_002D4f2dd2e4581b_003ENullable(1)]
	public readonly string Identifier;

	[_003Cd95a9308_002Dc7a9_002D45b5_002Da3c4_002D4f2dd2e4581b_003ENullable(1)]
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

	[_003C0b1bc451_002D3ff1_002D4275_002D8206_002Dee850795ae9e_003ENullableContext(1)]
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
