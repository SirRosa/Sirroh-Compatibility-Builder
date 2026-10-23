namespace System.Diagnostics.CodeAnalysis;

[DebuggerNonUserCode]
[ExcludeFromCodeCoverage]
[AttributeUsage(AttributeTargets.Parameter, Inherited = false)]
internal sealed class NotNullWhenAttribute : Attribute
{
	public bool ReturnValue { get; }

	public NotNullWhenAttribute(bool returnValue)
	{
		ReturnValue = returnValue;
	}
}
