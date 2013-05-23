package mazes.pieces 
{
	/**
	 * Chunk data is the essence of a chunk.
	 * Given this data, a builder can perfectly rebuild a chunk.
	 * @author beyamor
	 */
	public class ChunkData 
	{
		public var	x:int, y:int,
					eastConnection:int	= -1,
					westConnection:int	= -1,
					northConnection:int	= -1,
					southConnection:int	= -1,
					seed:uint;
		
		public function ChunkData(chunkX:int, chunkY:int, seed:uint) 
		{
			this.x		= chunkX;
			this.y		= chunkY;
			this.seed	= seed;
		}
		
	}

}