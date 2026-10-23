namespace System.Diagnostics.CodeAnalysis;

[DebuggerNonUserCode]
[AttributeUsage(AttributeTargets.Parameter, Inherited = false)]
[ExcludeFromCodeCoverage]
internal sealed class DoesNotReturnIfAttribute : Attribute
{
	public bool ParameterValue { get; }

	public DoesNotReturnIfAttribute(bool parameterValue)
	{
		ParameterValue = parameterValue;
	}
}
