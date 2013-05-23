package mazes.pieces 
{
	import mazes.builders.Builder;
	import mazes.builders.rw.RandomWalker;
	import mazes.Values;
	import util.Random;
	/**
	 * Some teriminology here:
	 *	- A cell is the smallest piece of a maze. It can be opened towards each and every cardinal direction.
	 *    Here, "to be opened" means that there is empty space in that direction (i.e., it is not blocked by walls.)
	 *  - A chunk is larger section of the maze. Each chunk is itself a complete and perfect maze. A chunk is made out of cells.
	 *  - Chunk data is the essence of a chunk. Given the chunk data, a builder can reconstruct a chunk.
	 *  - The maze itself is a collection of chunks. It stitches them together.
	 * @author beyamor
	 */
	public class Maze 
	{
		private var	chunks:Object		= new Object,
					builder:Builder		= new RandomWalker;
		
		public function Maze() 
		{
		}
		
		/**
		 * Gets a chunk of the maze, loading the chunk data if necessary.
		 * Note that this incurs the builder rebuilding the chunk from the maze's chunk data.
		 */
		public function getChunk(chunkX:int, chunkY:int):Chunk {
			
			loadChunk(chunkX, chunkY);
			
			return builder.build(chunks[chunkX][chunkY]);
		}
		
		/**
		 * 	Ensures some chunk data is loaded (read: created).
		 */
		public function loadChunk(chunkX:int, chunkY:int):void {
			
			if (!chunkExists(chunkX, chunkY)) createChunk(chunkX, chunkY);
		}
		
		/**
		 * Whether some chunk data has been created.
		 */
		private function chunkExists(chunkX:int, chunkY:int):Boolean {
			
			if (!chunks[chunkX]) return false;
			if (!chunks[chunkX][chunkY]) return false;
			return true;
		}
		
		/**
		 * Creates some new chunk data and establishes its connections.
		 */
		private function createChunk(chunkX:int, chunkY:int):void {
			
			if (!chunks[chunkX]) chunks[chunkX] = new Object;
			
			chunks[chunkX][chunkY] = new ChunkData(chunkX, chunkY, Math.random() * 0xFFFFFF);
			
			createConnections(chunkX, chunkY);
		}
		
		/**
		 * Creates the connections between some chunk and any of its existing neighbours.
		 */
		private function createConnections(chunkX:int, chunkY:int):void {
			
			var x:int, y:int, candidates:Vector.<int>;
			
			// right/left connection
			if (chunkExists(chunkX + 1, chunkY)) {
				
				y = Random.integer(1, Values.CHUNK_WIDTH - 2);
				chunks[chunkX][chunkY].eastConnection		= y;
				chunks[chunkX + 1][chunkY].westConnection	= y;
			}
			
			// left/right connection
			if (chunkExists(chunkX - 1, chunkY)) {
				
				y = Random.integer(1, Values.CHUNK_WIDTH - 2);
				chunks[chunkX][chunkY].westConnection		= y;
				chunks[chunkX - 1][chunkY].eastConnection	= y;
			}
			
			// bottom/top connection
			if (chunkExists(chunkX, chunkY + 1)) {
				
				x = Random.integer(1, Values.CHUNK_WIDTH - 2);
				chunks[chunkX][chunkY].southConnection		= x;
				chunks[chunkX][chunkY + 1].northConnection	= x;
			}
			
			// top/bottom connection
			if (chunkExists(chunkX, chunkY - 1)) {
				
				x = Random.integer(1, Values.CHUNK_WIDTH - 2);
				chunks[chunkX][chunkY].northConnection		= x;
				chunks[chunkX][chunkY - 1].southConnection	= x;
			}
		}
	}

}