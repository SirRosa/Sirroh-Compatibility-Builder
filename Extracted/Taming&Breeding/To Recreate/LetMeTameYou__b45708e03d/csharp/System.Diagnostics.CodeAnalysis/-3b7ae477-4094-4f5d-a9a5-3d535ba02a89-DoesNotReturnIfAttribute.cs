namespace System.Diagnostics.CodeAnalysis;

[ExcludeFromCodeCoverage]
[AttributeUsage(AttributeTargets.Parameter, Inherited = false)]
[DebuggerNonUserCode]
internal sealed class _003C3b7ae477_002D4094_002D4f5d_002Da9a5_002D3d535ba02a89_003EDoesNotReturnIfAttribute : Attribute
{
	public bool ParameterValue { get; }

	public _003C3b7ae477_002D4094_002D4f5d_002Da9a5_002D3d535ba02a89_003EDoesNotReturnIfAttribute(bool parameterValue)
	{
		ParameterValue = parameterValue;
	}
}
