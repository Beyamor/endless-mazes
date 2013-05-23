package mazes.pieces 
{
	import mazes.entities.Floor;
	import mazes.entities.Wall;
	import mazes.Values;
	/**
	 * A chunk is a discrete section of the maze.
	 * It has its own configuration of walls.
	 * @author beyamor
	 */
	public class Chunk 
	{
		public	var gridX:int,
					gridY:int,
					cells:Vector.<Vector.<Cell>>;
		
		public function Chunk(gridX:int, gridY:uint) 
		{
			this.gridX = gridX;
			this.gridY = gridY;
			
			cells = new Vector.<Vector.<Cell>>;
			for (var x:int = 0; x < Values.CHUNK_WIDTH; ++x) {
				
				cells[x] = new Vector.<Cell>;
				for (var y:int = 0; y < Values.CHUNK_WIDTH; ++y) {
					
					cells[x][y] = new Cell;
				}
			}
			
			addOuterWalls();
		}
		
		private function addOuterWalls():void {
			
			cells[left][top].openToEast();
			cells[left][top].openToSouth();
			
			cells[left][bottom].openToEast();
			cells[left][bottom].openToNorth();
			
			cells[right][top].openToWest();
			cells[right][top].openToSouth();
			
			cells[right][bottom].openToWest();
			cells[right][bottom].openToNorth();
			
			var x:int, y:int;
			for (x = left + 1; x <= right - 1; ++x) {
				
				y = top;
				cells[x][y].openToSouth();
				cells[x][y].openToEast();
				cells[x][y].openToWest();
				
				y = bottom;
				cells[x][y].openToNorth();
				cells[x][y].openToEast();
				cells[x][y].openToWest();
			}
			
			for (y = top + 1; y <= bottom - 1; ++y) {
				
				x = left;
				cells[x][y].openToEast();
				cells[x][y].openToNorth();
				cells[x][y].openToSouth();
				
				x = right;
				cells[x][y].openToWest();
				cells[x][y].openToNorth();
				cells[x][y].openToSouth();
			}
		}
		
		private function get top():int { return 0; }
		private function get bottom():int { return Values.CHUNK_WIDTH - 1; }
		private function get left():int { return 0; }
		private function get right():int { return Values.CHUNK_WIDTH - 1; }
	}

}