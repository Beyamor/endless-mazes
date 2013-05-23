package mazes.graphs 
{
	import mazes.pieces.Cell;
	/**
	 * ...
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