package mazes.reification 
{
	import mazes.entities.Wall;
	import mazes.graphics.ChunkRender;
	import mazes.MazeWorld;
	import mazes.pieces.Chunk;
	import mazes.Values;
	import net.flashpunk.Entity;
	
	/**
	 * Uh. Constructs a chunk in the world.
	 * @author beyamor
	 */
	public class ChunkReifier 
	{		
		public function ChunkReifier() 
		{
		}
		
		public function reify(chunk:Chunk):Vector.<Entity> {
			
			var entities:Vector.<Entity> = new Vector.<Entity>;
				
			var renderEntity:Entity = new Entity(
				chunk.chunkX * Values.CHUNK_PIXEL_WIDTH,
				chunk.chunkY * Values.CHUNK_PIXEL_WIDTH,
				new ChunkRender(chunk));
			renderEntity.layer = 100;
			entities.push(renderEntity);
			
			for (var cellX:int = 0; cellX < Values.CHUNK_WIDTH; ++cellX) {
				for (var cellY:int = 0; cellY < Values.CHUNK_WIDTH; ++cellY) {
					
					for (var unitX:int = 0; unitX < Values.CELL_WIDTH; ++unitX) {
						for (var unitY:int = 0; unitY < Values.CELL_WIDTH; ++unitY) {
							
							var	worldX:Number	= chunk.chunkX * Values.CHUNK_PIXEL_WIDTH
													+ cellX * Values.CELL_PIXEL_WIDTH
													+ unitX * Values.UNIT_WIDTH,
								worldY:Number	= chunk.chunkY * Values.CHUNK_PIXEL_WIDTH
													+ cellY * Values.CELL_PIXEL_WIDTH
													+ unitY * Values.UNIT_WIDTH,
								isWall:Boolean	= chunk.cells[cellX][cellY].isWall[unitX][unitY];
								
							if (isWall)	entities.push(Wall.create(worldX, worldY));
						}
					}
				}
			}
			
			return entities;
		}
	}

}