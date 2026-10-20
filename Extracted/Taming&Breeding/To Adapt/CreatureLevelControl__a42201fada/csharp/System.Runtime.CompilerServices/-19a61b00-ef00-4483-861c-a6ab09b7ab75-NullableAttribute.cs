using Microsoft.CodeAnalysis;

namespace System.Runtime.CompilerServices;

[AttributeUsage(AttributeTargets.Class | AttributeTargets.Property | AttributeTargets.Field | AttributeTargets.Event | AttributeTargets.Parameter | AttributeTargets.ReturnValue | AttributeTargets.GenericParameter, AllowMultiple = false, Inherited = false)]
[CompilerGenerated]
[_003C306df0a9_002Db649_002D46cb_002Db521_002D2893484bd959_003EEmbedded]
internal sealed class _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullableAttribute : Attribute
{
	public readonly byte[] NullableFlags;

	public _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullableAttribute(byte P_0)
	{
		NullableFlags = new byte[1] { P_0 };
	}

	public _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullableAttribute(byte[] P_0)
	{
		NullableFlags = P_0;
	}
}
