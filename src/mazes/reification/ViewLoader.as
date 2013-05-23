package mazes.reification 
{
	import mazes.MazeWorld;
	import mazes.pieces.Maze;
	import mazes.Values;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import util.camera.Camera;
	import util.Updateable;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class ViewLoader implements Updateable 
	{
		private var camera:Camera,
					maze:Maze,
					world:MazeWorld,
					reifier:ChunkReifier	= new ChunkReifier,
					reifications:Object		= new Object;
		
		public function ViewLoader(maze:Maze, world:MazeWorld, camera:Camera) 
		{
			this.camera		= camera;
			this.maze		= maze;
			this.world		= world;
		}
		
		/* INTERFACE util.Updateable */
		
		public function update():void 
		{
			// Okay, so
			// We need to make sure that the chunks in view have been not just loaded, but reified
			// Let's start by figuring out what chunks should be in view
			var	minChunkX:int	= Math.floor(camera.left / Values.CHUNK_PIXEL_WIDTH),
				maxChunkX:int	= Math.ceil(camera.right / Values.CHUNK_PIXEL_WIDTH),
				minChunkY:int	= Math.floor(camera.top / Values.CHUNK_PIXEL_WIDTH),
				maxChunkY:int	= Math.ceil(camera.bottom / Values.CHUNK_PIXEL_WIDTH),
				chunkX:int, chunkY:int;
				
			// Now, we actually wanna load a little beyond that to make sure the connections are created
			for (chunkX = minChunkX - 1; chunkX <= maxChunkX + 1; ++chunkX) {
				for (chunkY = minChunkY - 1; chunkY <= maxChunkY + 1; ++chunkY) {
					
					maze.loadChunk(chunkX, chunkY);
				}
			}
				
			for (chunkX = minChunkX; chunkX <= maxChunkX; ++chunkX) {
				for (chunkY = minChunkY; chunkY <= maxChunkY; ++chunkY) {
					
					if (!isReified(chunkX, chunkY)) reify(chunkX, chunkY);
				}
			}
		}
		
		private function isReified(chunkX:int, chunkY:int):Boolean {
			
			if (!reifications[chunkX]) return false;
			if (!reifications[chunkX][chunkY]) return false;
			return true;
		}
		
		private function reify(chunkX:int, chunkY:int):void {
			
			var entities:Vector.<Entity> = reifier.reify(maze.getChunk(chunkX, chunkY));
			
			if (!reifications[chunkX]) reifications[chunkX] = new Object;
			reifications[chunkX][chunkY] = entities;
			
			for each (var entity:Entity in entities) {
				
				world.add(entity);
			}
		}
	}

}