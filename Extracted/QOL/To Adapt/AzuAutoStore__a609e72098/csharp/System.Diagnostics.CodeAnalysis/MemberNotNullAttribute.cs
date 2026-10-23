namespace System.Diagnostics.CodeAnalysis;

[DebuggerNonUserCode]
[ExcludeFromCodeCoverage]
[AttributeUsage(AttributeTargets.Method | AttributeTargets.Property, Inherited = false, AllowMultiple = true)]
internal sealed class MemberNotNullAttribute : Attribute
{
	public string[] Members { get; }

	public MemberNotNullAttribute(string member)
	{
		Members = new string[1] { member };
	}

	public MemberNotNullAttribute(params string[] members)
	{
		Members = members;
	}
}
