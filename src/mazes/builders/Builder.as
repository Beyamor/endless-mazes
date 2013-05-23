package mazes.builders 
{
	import mazes.pieces.Cell;
	import mazes.pieces.Chunk;
	import mazes.pieces.ChunkData;
	import mazes.Values;
	
	/**
	 * The builder, given a chunk's data, builds a chunk.
	 * @author beyamor
	 */
	public class Builder 
	{
		public function build(chunkData:ChunkData):Chunk {
			
			var chunk:Chunk = buildChunk(chunkData);
			addConnections(chunkData, chunk);
			return chunk;
		}
		
		public function buildChunk(chunkData:ChunkData):Chunk {
			
			throw new Error("Override in subclass");
		}
		
		private function addConnections(chunkData:ChunkData, chunk:Chunk):void {
			
			if (chunkData.eastConnection != -1) {
				
				chunk.cells[Values.CHUNK_WIDTH - 1][chunkData.eastConnection].openToEast();
			}
			
			if (chunkData.westConnection != -1) {
				
				chunk.cells[0][chunkData.westConnection].openToWest();
			}
			
			if (chunkData.northConnection != -1) {
				
				chunk.cells[chunkData.northConnection][0].openToNorth();
			}
			
			if (chunkData.southConnection != -1) {
				
				chunk.cells[chunkData.southConnection][Values.CHUNK_WIDTH - 1].openToSouth();
			}
		}
	}
	
}