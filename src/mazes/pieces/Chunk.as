package mazes.pieces 
{
	import mazes.entities.Floor;
	import mazes.entities.Wall;
	import mazes.Values;
	/**
	 * A chunk is a discrete section of the maze.
	 * It has its own configuration of walls.
	 * @author beyamor
	 */
	public class Chunk 
	{
		public	var gridX:int,
					gridY:int,
					cells:Vector.<Vector.<Cell>>;
		
		public function Chunk(gridX:int, gridY:uint) 
		{
			this.gridX = gridX;
			this.gridY = gridY;
			
			cells = new Vector.<Vector.<Cell>>;
			for (var x:int = 0; x < Values.CHUNK_WIDTH; ++x) {
				
				cells[x] = new Vector.<Cell>;
				for (var y:int = 0; y < Values.CHUNK_WIDTH; ++y) {
					
					cells[x][y] = new Cell;
				}
			}
			
			cells[0][0].openToSouth();
			cells[0][0].openToEast();
		}
	}

}