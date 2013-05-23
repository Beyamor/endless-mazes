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
		
		public function Chunk(gridX:int, gridY:uint, cells:Vector.<Vector.<Cell>>) 
		{
			this.gridX	= gridX;
			this.gridY	= gridY;
			this.cells	= cells;
		}
		
		private function get top():int { return 0; }
		private function get bottom():int { return Values.CHUNK_WIDTH - 1; }
		private function get left():int { return 0; }
		private function get right():int { return Values.CHUNK_WIDTH - 1; }
	}

}