package mazes.pieces 
{
	import mazes.entities.Wall;
	import mazes.Values;
	
	/**
	 * A chunk is a discrete section of the maze.
	 * It is made up of a collection of cells.
	 * 
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
	}

}