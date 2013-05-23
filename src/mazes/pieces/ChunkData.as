package mazes.pieces 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class ChunkData 
	{
		public var	x:int, y:int,
					eastConnection:int	= -1,
					westConnection:int	= -1,
					northConnection:int	= -1,
					southConnection:int	= -1;
		
		public function ChunkData(chunkX:int, chunkY:int) 
		{
			this.x = chunkX;
			this.y = chunkY;
		}
		
	}

}