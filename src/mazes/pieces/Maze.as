package mazes.pieces 
{
	import mazes.builders.Builder;
	import mazes.builders.Connector;
	import mazes.builders.rw.RandomWalker;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Maze 
	{
		private var	chunks:Object		= new Object,
					builder:Builder		= new RandomWalker,
					connector:Connector	= new Connector;
		
		public function Maze() 
		{
			
		}
		
		public function getChunk(chunkX:int, chunkY:int):Chunk {
			
			if (!chunkExists(chunkX, chunkY)) loadChunk(chunkX, chunkY);
			return chunks[chunkX][chunkY];
		}
		
		public function loadChunk(chunkX:int, chunkY:int):void {
			
			if (!chunks[chunkX]) chunks[chunkX] = new Object;
			chunks[chunkX][chunkY] = new Chunk(chunkX, chunkY, builder.build());
			
			if (chunkExists(chunkX - 1, chunkY))	connector.connect(chunks[chunkX - 1][chunkY], chunks[chunkX][chunkY]);
			if (chunkExists(chunkX + 1, chunkY))	connector.connect(chunks[chunkX + 1][chunkY], chunks[chunkX][chunkY]);
			if (chunkExists(chunkX, chunkY - 1))	connector.connect(chunks[chunkX][chunkY - 1], chunks[chunkX][chunkY]);
			if (chunkExists(chunkX, chunkY + 1))	connector.connect(chunks[chunkX][chunkY + 1], chunks[chunkX][chunkY]);
		}
		
		public function chunkExists(chunkX:int, chunkY:int):Boolean {
			
			if (!chunks[chunkX]) return false;
			if (!chunks[chunkX][chunkY]) return false;
			return true;
		}
	}

}