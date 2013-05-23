package mazes.pieces 
{
	import mazes.entities.Wall;
	import mazes.Values;
	/**
	 * A chunk is a discrete section of the maze.
	 * It has its own configuration of walls.
	 * @author beyamor
	 */
	public class Chunk 
	{
		public	var chunkX:int,
					chunkY:int,
					cells:Vector.<Vector.<Cell>>;
		
		public function Chunk(chunkX:int, chunkY:uint, cells:Vector.<Vector.<Cell>>) 
		{
			this.chunkX	= chunkX;
			this.chunkY	= chunkY;
			this.cells	= cells;
		}
		
		private function get top():int { return 0; }
		private function get bottom():int { return Values.CHUNK_WIDTH - 1; }
		private function get left():int { return 0; }
		private function get right():int { return Values.CHUNK_WIDTH - 1; }
	}

}