namespace System.Runtime.CompilerServices;

[AttributeUsage(AttributeTargets.Parameter, AllowMultiple = false, Inherited = false)]
public sealed class InterpolatedStringHandlerArgumentAttribute(params string[] arguments) : Attribute
{
	public string[] Arguments { get; } = arguments;

	public InterpolatedStringHandlerArgumentAttribute(string argument)
		: this(new string[1] { argument })
	{
	}
}
