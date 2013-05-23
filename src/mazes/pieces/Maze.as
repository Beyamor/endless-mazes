package mazes.pieces 
{
	import mazes.builders.Builder;
	import mazes.builders.rw.RandomWalker;
	import mazes.Values;
	import util.Random;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Maze 
	{
		private var	chunks:Object		= new Object,
					builder:Builder		= new RandomWalker;
		
		public function Maze() 
		{
			
		}
		
		public function getChunk(chunkX:int, chunkY:int):Chunk {
			
			loadChunk(chunkX, chunkY);
			
			return builder.build(chunks[chunkX][chunkY]);
		}
		
		public function loadChunk(chunkX:int, chunkY:int):void {
			
			if (!chunkExists(chunkX, chunkY)) createChunk(chunkX, chunkY);
		}
		
		private function chunkExists(chunkX:int, chunkY:int):Boolean {
			
			if (!chunks[chunkX]) return false;
			if (!chunks[chunkX][chunkY]) return false;
			return true;
		}
		
		private function createChunk(chunkX:int, chunkY:int):void {
			
			if (!chunks[chunkX]) chunks[chunkX] = new Object;
			
			chunks[chunkX][chunkY] = new ChunkData(chunkX, chunkY);
			
			createConnections(chunkX, chunkY);
		}
		
		private function createConnections(chunkX:int, chunkY:int):void {
			
			var x:int, y:int, candidates:Vector.<int>;
			
			// right/left connection
			if (chunkExists(chunkX + 1, chunkY)) {
				
				y = Random.intInRange(1, Values.CHUNK_WIDTH - 1);
				chunks[chunkX][chunkY].eastConnection		= y;
				chunks[chunkX + 1][chunkY].westConnection	= y;
			}
			
			// left/right connection
			if (chunkExists(chunkX - 1, chunkY)) {
				
				y = Random.intInRange(1, Values.CHUNK_WIDTH - 1);
				chunks[chunkX][chunkY].westConnection		= y;
				chunks[chunkX - 1][chunkY].eastConnection	= y;
			}
			
			// bottom/top connection
			if (chunkExists(chunkX, chunkY + 1)) {
				
				x = Random.intInRange(1, Values.CHUNK_WIDTH - 1);
				chunks[chunkX][chunkY].southConnection		= x;
				chunks[chunkX][chunkY + 1].northConnection	= x;
			}
			
			// top/bottom connection
			if (chunkExists(chunkX, chunkY - 1)) {
				
				x = Random.intInRange(1, Values.CHUNK_WIDTH - 1);
				chunks[chunkX][chunkY].northConnection		= x;
				chunks[chunkX][chunkY - 1].southConnection	= x;
			}
		}
	}

}