namespace System.Diagnostics.CodeAnalysis;

[ExcludeFromCodeCoverage]
[AttributeUsage(AttributeTargets.Parameter, Inherited = false)]
[DebuggerNonUserCode]
internal sealed class DoesNotReturnIfAttribute : Attribute
{
	public bool ParameterValue { get; }

	public DoesNotReturnIfAttribute(bool parameterValue)
	{
		ParameterValue = parameterValue;
	}
}
