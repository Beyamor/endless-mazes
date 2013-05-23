package mazes.builders.rw 
{
	import mazes.builders.Builder;
	import mazes.graphs.CellNode;
	import mazes.pieces.Cell;
	import mazes.graphs.CellGraph;
	import mazes.pieces.Chunk;
	import mazes.pieces.ChunkData;
	import mazes.Values;
	import util.Random;
	
	/**
	 * Randomly walks until it has connected all of its nodes.
	 * @author beyamor
	 */
	public class RandomWalker extends Builder 
	{
		
		public function RandomWalker() 
		{
			
		}
		
		override public function buildChunk(chunkData:ChunkData):Chunk {
			
			var	random:Random			= new Random(chunkData.seed),
				graph:CellGraph			= new CellGraph,
				x:int					= random.integer(0, Values.CHUNK_WIDTH - 1),
				y:int					= random.integer(0, Values.CHUNK_WIDTH - 1),
				currentNode:CellNode	= graph.nodes[x][y],
				nextNode:CellNode;
				
			currentNode.isConnected = true;
				
			while (!graph.isFullyConnected) {
				
				nextNode = random.any(graph.getNeighbours(currentNode));
				
				if (!nextNode.isConnected) {
					
					graph.connect(currentNode, nextNode);
				}
				
				currentNode = nextNode;
			}
			
			return new Chunk(chunkData.x, chunkData.y, graph.cells);
		}
	}

}