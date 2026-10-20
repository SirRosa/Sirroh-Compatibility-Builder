namespace System.Diagnostics.CodeAnalysis;

[DebuggerNonUserCode]
[AttributeUsage(AttributeTargets.Parameter, Inherited = false)]
[ExcludeFromCodeCoverage]
internal sealed class _003C3e7b65c3_002D9a34_002D466b_002D9a0e_002Dc991173a4ba0_003EMaybeNullWhenAttribute : Attribute
{
	public bool ReturnValue { get; }

	public _003C3e7b65c3_002D9a34_002D466b_002D9a0e_002Dc991173a4ba0_003EMaybeNullWhenAttribute(bool returnValue)
	{
		ReturnValue = returnValue;
	}
}
