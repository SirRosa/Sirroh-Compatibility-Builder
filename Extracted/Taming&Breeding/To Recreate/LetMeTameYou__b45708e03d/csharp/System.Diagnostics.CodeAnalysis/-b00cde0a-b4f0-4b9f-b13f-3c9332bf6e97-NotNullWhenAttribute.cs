namespace System.Diagnostics.CodeAnalysis;

[AttributeUsage(AttributeTargets.Parameter, Inherited = false)]
[ExcludeFromCodeCoverage]
[DebuggerNonUserCode]
internal sealed class _003Cb00cde0a_002Db4f0_002D4b9f_002Db13f_002D3c9332bf6e97_003ENotNullWhenAttribute : Attribute
{
	public bool ReturnValue { get; }

	public _003Cb00cde0a_002Db4f0_002D4b9f_002Db13f_002D3c9332bf6e97_003ENotNullWhenAttribute(bool returnValue)
	{
		ReturnValue = returnValue;
	}
}
