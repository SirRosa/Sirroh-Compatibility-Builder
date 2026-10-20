using System.Collections.Generic;

namespace neobotics.ModSdk;

internal class CircularList<T>
{
	private List<T> circle;

	private int index;

	public int Index => index;

	public CircularList(List<T> source, T startingElement)
	{
		circle = new List<T>(source);
		index = circle.FindIndex((T x) => x.Equals(startingElement));
	}

	public T Next()
	{
		index = ((index < circle.Count - 1) ? (index + 1) : 0);
		return circle[index];
	}

	public T Previous()
	{
		index = ((index > 0) ? (index - 1) : (circle.Count - 1));
		return circle[index];
	}
}
