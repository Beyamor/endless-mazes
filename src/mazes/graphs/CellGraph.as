package mazes.graphs 
{
	import mazes.pieces.Cell;
	import mazes.Values;
	/**
	 * A graph of cells with helper methods like getting the neighbours of a cell.
	 * @author beyamor
	 */
	public class CellGraph 
	{
		public var nodes:Vector.<Vector.<CellNode>>;
		
		public function CellGraph() 
		{
			nodes = new Vector.<Vector.<CellNode>>;
			for (var x:int = 0; x < Values.CHUNK_WIDTH; ++x) {
				
				nodes[x] = new Vector.<CellNode>;
				for (var y:int = 0; y < Values.CHUNK_WIDTH; ++y) {
					
					nodes[x][y] = new CellNode(x, y);
				}
			}
		}
		
		public function get cells():Vector.<Vector.<Cell>> {
			
			var cells:Vector.<Vector.<Cell>> = new Vector.<Vector.<Cell>>;
			for (var x:int = 0; x < Values.CHUNK_WIDTH; ++x) {
				
				cells[x] = new Vector.<Cell>;
				for (var y:int = 0; y < Values.CHUNK_WIDTH; ++y) {
					
					cells[x][y] = nodes[x][y].cell;
				}
			}
			
			return cells;
		}
		
		public function get isFullyConnected():Boolean {
			
			for (var x:int = 0; x < Values.CHUNK_WIDTH; ++x) {
				for (var y:int = 0; y < Values.CHUNK_WIDTH; ++y) {
					
					if (!nodes[x][y].isConnected) return false;
				}
			}
			
			return true;
		}
		
		public function getNeighbours(node:CellNode):Vector.<CellNode> {
			
			var neighbours:Vector.<CellNode> = new Vector.<CellNode>;
			
			if (node.x > left)		neighbours.push(nodes[node.x - 1][node.y]);
			if (node.x < right)		neighbours.push(nodes[node.x + 1][node.y]);
			if (node.y > top)		neighbours.push(nodes[node.x][node.y - 1]);
			if (node.y < bottom)	neighbours.push(nodes[node.x][node.y + 1]);
			
			return neighbours;
		}
		
		public function connect(fromNode:CellNode, toNode:CellNode):void {
			
			fromNode.isConnected = true;
			toNode.isConnected = true;
			
			if (fromNode.x < toNode.x) {
				
				fromNode.cell.openToEast();
				toNode.cell.openToWest();
			}
			
			else if (fromNode.x > toNode.x) {
				
				fromNode.cell.openToWest();
				toNode.cell.openToEast();
			}
			
			else if (fromNode.y < toNode.y) {
				
				fromNode.cell.openToSouth();
				toNode.cell.openToNorth();
			}
			
			else {
				
				fromNode.cell.openToNorth();
				toNode.cell.openToSouth();
			}
		}
		
		private function get top():int { return 0; }
		private function get bottom():int { return Values.CHUNK_WIDTH - 1; }
		private function get left():int { return 0; }
		private function get right():int { return Values.CHUNK_WIDTH - 1; }
	}

}