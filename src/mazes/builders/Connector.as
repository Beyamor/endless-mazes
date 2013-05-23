package mazes.builders 
{
	import flash.geom.Point;
	import mazes.pieces.Cell;
	import mazes.pieces.Chunk;
	import mazes.Values;
	import util.Random;
	/**
	 * Connects two chunks.
	 * @author beyamor
	 */
	public class Connector 
	{
		
		public function Connector() 
		{
			
		}
		
		public function connect(fromChunk:Chunk, toChunk:Chunk):void {
			
			var x:int, y:int,
				connection:CellPair,
				candidateConnections:Vector.<CellPair> = new Vector.<CellPair>;
			
			// Join along right/left wall
			if (fromChunk.chunkX < toChunk.chunkX) {
				
				for (y = 1; y < Values.CHUNK_WIDTH - 1; ++y) {
					
					candidateConnections.push(
						new CellPair(
							fromChunk.cells[Values.CHUNK_WIDTH - 1][y],
							toChunk.cells[0][y]));
				}
				
				connection = Random.any(candidateConnections);
				connection.from.openToEast();
				connection.to.openToWest();
			}
			
			// Join along right/left wall
			else if (fromChunk.chunkX > toChunk.chunkX) {
				
				for (y = 1; y < Values.CHUNK_WIDTH - 1; ++y) {
					
					candidateConnections.push(
						new CellPair(
							fromChunk.cells[0][y],
							toChunk.cells[Values.CHUNK_WIDTH - 1][y]));
				}
				
				connection = Random.any(candidateConnections);
				connection.from.openToWest();
				connection.to.openToEast();
			}
			
			// Join along bottom/top wall
			else if (fromChunk.chunkY < toChunk.chunkY) {
				
				for (x = 1; x < Values.CHUNK_WIDTH - 1; ++x) {
					
					candidateConnections.push(
						new CellPair(
							fromChunk.cells[x][Values.CHUNK_WIDTH - 1],
							toChunk.cells[x][0]));
				}
				
				connection = Random.any(candidateConnections);
				connection.from.openToSouth();
				connection.to.openToNorth();
			}
			
			// Join along top/bottom wall
			else {
				
				for (x = 1; x < Values.CHUNK_WIDTH - 1; ++x) {
					
					candidateConnections.push(
						new CellPair(
							fromChunk.cells[x][0],
							toChunk.cells[x][Values.CHUNK_WIDTH - 1]));
				}
				
				connection = Random.any(candidateConnections);
				connection.from.openToNorth();
				connection.to.openToSouth();
			}
		}
	}
}

import mazes.pieces.Cell;

class CellPair {
		
	public var	from:Cell,
				to:Cell;
			
	public function CellPair(from:Cell, to:Cell) {
		
		this.from	= from;
		this.to		= to;
	}
}