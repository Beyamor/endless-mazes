package mazes.pieces 
{
	import mazes.diggers.rw.RandomWalker;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Maze 
	{
		private var	chunks:Object = new Object;
		
		public function Maze() 
		{
			
		}
		
		public function getChunk(chunkX:int, chunkY:int):Chunk {
			
			if (!chunkExists(chunkX, chunkY)) loadChunk(chunkX, chunkY);
			return chunks[chunkX][chunkY];
		}
		
		private function loadChunk(chunkX:int, chunkY:int):void {
			
			if (!chunks[chunkX]) chunks[chunkX] = new Object;
			chunks[chunkX][chunkY] = new Chunk(chunkX, chunkY, new RandomWalker().dig());
		}
		
		public function chunkExists(chunkX:int, chunkY:int):Boolean {
			
			if (!chunks[chunkX]) return false;
			if (!chunks[chunkX][chunkY]) return false;
			return true;
		}
	}

}