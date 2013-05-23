package mazes.diggers 
{
	import mazes.pieces.Cell;
	
	/**
	 * A digger digs out the space in a chunk.
	 * Digging should yield a chunk's worth of cells.
	 * @author beyamor
	 */
	public interface Digger 
	{
		function dig():Vector.<Vector.<Cell>>;
	}
	
}