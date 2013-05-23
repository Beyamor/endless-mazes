package mazes.reification 
{
	import mazes.entities.Floor;
	import mazes.entities.Wall;
	import mazes.Maze;
	import mazes.pieces.Chunk;
	import mazes.Values;
	
	/**
	 * Uh. Constructs a chunk in the world.
	 * @author beyamor
	 */
	public class ChunkReifier 
	{
		private var maze:Maze;
		
		public function ChunkReifier(maze:Maze) 
		{
			this.maze = maze;
		}
		
		public function reify(chunk:Chunk):void {
			
			for (var cellX:int = 0; cellX < Values.CHUNK_WIDTH; ++cellX) {
				for (var cellY:int = 0; cellY < Values.CHUNK_WIDTH; ++cellY) {
					
					for (var unitX:int = 0; unitX < Values.CELL_WIDTH; ++unitX) {
						for (var unitY:int = 0; unitY < Values.CELL_WIDTH; ++unitY) {
							
							var	worldX:Number	= chunk.gridX * Values.CHUNK_PIXEL_WIDTH
													+ cellX * Values.CELL_PIXEL_WIDTH
													+ unitX * Values.UNIT_WIDTH,
								worldY:Number	= chunk.gridY * Values.CHUNK_PIXEL_WIDTH
													+ cellY * Values.CELL_PIXEL_WIDTH
													+ unitY * Values.UNIT_WIDTH,
								isWall:Boolean	= chunk.cells[cellX][cellY].isWall[unitX][unitY];
								
							if (isWall)	maze.add(new Wall(worldX, worldY));
							else		maze.add(new Floor(worldX, worldY));
						}
					}
				}
			}
		}
	}

}