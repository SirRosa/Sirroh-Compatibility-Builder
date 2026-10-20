namespace QuickStackStore;

public static class ItemDataExtension
{
	public static int GridVectorToGridIndex(this ItemData item, int width)
	{
		return item.m_gridPos.y * width + item.m_gridPos.x;
	}
}
