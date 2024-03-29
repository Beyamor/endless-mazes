package mazes.pieces 
{
	import mazes.Values;
	
	/**
	 * A cell is the unit of space in a maze.
	 * It can be entered from any (or all) of the four directions north, south, east, and west.
	 * With regards to the graph, a cell is (effectively) a node with paths drawn through its edges.
	 * By connecting cells (i.e., opening them towards each other), paths can be formed.
	 * @author beyamor
	 */
	public class Cell 
	{
		public var	isWall:Vector.<Vector.<Boolean>>;
		private var	isOpenToEast:Boolean	= false,
					isOpenToWest:Boolean	= false,
					isOpenToNorth:Boolean	= false,
					isOpenToSouth:Boolean	= false;
		
		public function Cell() 
		{
			isWall = new Vector.<Vector.<Boolean>>;
			for (var x:int = left; x <= right; ++x) {
				
				isWall[x] = new Vector.<Boolean>;
				for (var y:int = top; y <= bottom; ++y) {
					
					isWall[x][y] = true;
				}
			}
		}
		
		public function openToEast():void {
			
			isOpenToEast = true;
			
			for (var x:int = left + 1; x <= right; ++x) {
				for (var y:int = top + 1; y <= bottom - 1; ++y) {
					isWall[x][y] = false;
				}
			}
		}
		
		public function openToWest():void {
			
			isOpenToWest = true;
			
			for (var x:int = left; x <= right - 1; ++x) {
				for (var y:int = top + 1; y <= bottom - 1; ++y) {
					isWall[x][y] = false;
				}
			}
		}
		
		public function openToNorth():void {
			
			isOpenToNorth = true;
			
			for (var x:int = left + 1; x <= right - 1; ++x) {
				for (var y:int = top; y <= bottom - 1; ++y) {
					isWall[x][y] = false;
				}
			}
		}
		
		public function openToSouth():void {
			
			isOpenToSouth = true;
			
			for (var x:int = left + 1; x <= right - 1; ++x) {
				for (var y:int = top + 1; y <= bottom; ++y) {
					isWall[x][y] = false;
				}
			}
		}
		
		private function get top():int { return 0; }
		private function get bottom():int { return Values.CELL_WIDTH - 1; }
		private function get left():int { return 0; }
		private function get right():int { return Values.CELL_WIDTH - 1;}
	}

}