package mazes.builders 
{
	import mazes.pieces.Cell;
	
	/**
	 * A digger digs out the space in a chunk.
	 * Digging should yield a chunk's worth of cells.
	 * @author beyamor
	 */
	public interface Builder 
	{
		function build():Vector.<Vector.<Cell>>;
	}
	
}