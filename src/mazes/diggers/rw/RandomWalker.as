package mazes.diggers.rw 
{
	import mazes.diggers.Digger;
	import mazes.graphs.CellNode;
	import mazes.pieces.Cell;
	import mazes.graphs.CellGraph;
	import mazes.Values;
	import util.Random;
	
	/**
	 * Randomly walks until it has connected all of its nodes.
	 * @author beyamor
	 */
	public class RandomWalker implements Digger 
	{
		
		public function RandomWalker() 
		{
			
		}
		
		public function dig():Vector.<Vector.<Cell>> {
			
			var graph:CellGraph			= new CellGraph,
				x:int					= Random.intInRange(0, Values.CHUNK_WIDTH),
				y:int					= Random.intInRange(0, Values.CHUNK_WIDTH),
				currentNode:CellNode	= graph.nodes[x][y],
				nextNode:CellNode;
				
			currentNode.isConnected = true;
				
			while (!graph.isFullyConnected) {
				
				nextNode = Random.any(graph.getNeighbours(currentNode));
				
				if (!nextNode.isConnected) {
					
					graph.connect(currentNode, nextNode);
				}
				
				currentNode = nextNode;
			}
			
			return graph.cells;
		}
	}

}