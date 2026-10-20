namespace Zen.Interop;

public interface IMessageListener
{
	void ReceiveMessage(string message, object? arg);
}
