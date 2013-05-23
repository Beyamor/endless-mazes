package mazes.reification 
{
	import mazes.pieces.Maze;
	import mazes.Values;
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
					reifier:ChunkReifier,
					chunkIsReified:Object = new Object;
		
		public function ViewLoader(maze:Maze, camera:Camera, reifier:ChunkReifier) 
		{
			this.camera		= camera;
			this.maze		= maze;
			this.reifier	= reifier;
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
			
			if (!chunkIsReified[chunkX]) return false;
			return chunkIsReified[chunkX][chunkY];
		}
		
		private function reify(chunkX:int, chunkY:int):void {
			
			reifier.reify(maze.getChunk(chunkX, chunkY));
			
			if (!chunkIsReified[chunkX]) chunkIsReified[chunkX] = new Object;
			chunkIsReified[chunkX][chunkY] = true;
		}
	}

}