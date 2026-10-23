namespace System.Diagnostics.CodeAnalysis;

[DebuggerNonUserCode]
[AttributeUsage(AttributeTargets.Property | AttributeTargets.Field | AttributeTargets.Parameter, Inherited = false)]
[ExcludeFromCodeCoverage]
internal sealed class DisallowNullAttribute : Attribute
{
}
