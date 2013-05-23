package mazes.graphs 
{
	import mazes.pieces.Cell;
	
	/**
	 * A wrapper around a cell which supplies additional information
	 * such as whether the cell has been connected in the cell graph.
	 * @author beyamor
	 */
	public class CellNode 
	{
		public var	cell:Cell			= new Cell,
					x:int,
					y:int,
					isConnected:Boolean	= false;
		
		public function CellNode(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
		}
		
	}

}