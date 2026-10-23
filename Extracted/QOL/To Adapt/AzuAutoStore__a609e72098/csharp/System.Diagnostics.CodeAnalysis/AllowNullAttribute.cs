namespace System.Diagnostics.CodeAnalysis;

[AttributeUsage(AttributeTargets.Property | AttributeTargets.Field | AttributeTargets.Parameter, Inherited = false)]
[DebuggerNonUserCode]
[ExcludeFromCodeCoverage]
internal sealed class AllowNullAttribute : Attribute
{
}
