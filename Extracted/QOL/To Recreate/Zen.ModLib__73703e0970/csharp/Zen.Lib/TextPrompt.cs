using System;

namespace Zen.Lib;

public static class TextPrompt
{
	private class Handler : TextReceiver
	{
		public string Text = string.Empty;

		public Action<string>? OnSuccess;

		public string GetText()
		{
			return Text;
		}

		public void SetText(string text)
		{
			Text = text;
			OnSuccess?.Invoke(text);
			OnSuccess = null;
			PlayerController.SetTakeInputDelay(0.5f);
		}
	}

	private static readonly Handler Receiver = new Handler();

	public static void Show(string topic, string defaultText, Action<string> onSuccess, int charLimit = 50)
	{
		Receiver.Text = defaultText;
		Receiver.OnSuccess = onSuccess;
		TextInput.instance.RequestText((TextReceiver)(object)Receiver, topic, charLimit);
	}
}
