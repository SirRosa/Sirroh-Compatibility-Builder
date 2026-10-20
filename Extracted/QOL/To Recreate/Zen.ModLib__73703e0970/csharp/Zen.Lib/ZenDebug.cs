using System;
using System.Diagnostics;
using System.Reflection;
using System.Text;

namespace Zen.Lib;

public static class ZenDebug
{
	private static readonly StringBuilder Sb = new StringBuilder();

	public static string GetCallStack()
	{
		Sb.Clear();
		Sb.Append("Call Stack:\n");
		StackTrace stackTrace = new StackTrace();
		for (int i = 1; i < stackTrace.FrameCount; i++)
		{
			MethodBase method = stackTrace.GetFrame(i).GetMethod();
			Type declaringType = method.DeclaringType;
			string value = ((declaringType != null) ? (declaringType.Name + "." + method.Name) : method.Name);
			Sb.Append(value);
			if (i != stackTrace.FrameCount - 1)
			{
				Sb.Append("\n");
			}
		}
		return Sb.ToString();
	}
}
