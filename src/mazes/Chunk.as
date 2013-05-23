package mazes 
{
	import mazes.entities.Floor;
	import mazes.entities.Wall;
	/**
	 * A chunk is a discrete section of the maze.
	 * It has its own configuration of walls.
	 * @author beyamor
	 */
	public class Chunk 
	{
		private var gridX:int,
					gridY:int,
					floor:Floor,
					walls:Vector.<Wall>;
		
		public function Chunk(gridX:int, gridY:uint) 
		{
			this.gridX = gridX;
			this.gridY = gridY;
		}
		
		public function addTo(maze:Maze):void {
			
			addFloor(maze);
			addWalls(maze);
		}
		
		private function addFloor(maze:Maze):void {
			
			floor = new Floor(gridX * Values.CHUNK_WIDTH, gridY * Values.CHUNK_WIDTH);
			maze.add(floor);
		}
		
		private function addWalls(maze:Maze):void {
			
			walls = new Vector.<Wall>;
			
			var wallX:int, wallY:int;
			var addWall:Function = function(localX:Number, localY:Number):void {
				
				var	worldX:Number = gridX * Values.CHUNK_WIDTH + localX * Values.BLOCK_WIDTH,
					worldY:Number = gridY * Values.CHUNK_WIDTH + localY * Values.BLOCK_WIDTH,
					wall:Wall = new Wall(worldX, worldY);
					
				walls.push(wall);
				maze.add(wall);
			}
			
			// Outer walls
			for (wallX = 0; wallX < Values.CHUNK_WIDTH; ++wallX) {
				
				wallY = 0;
				addWall(wallX, wallY);
				
				wallY = Values.CHUNK_WIDTH - 1;
				addWall(wallX, wallY);
			}
			
			for (wallY = 0; wallY < Values.CHUNK_WIDTH; ++wallY) {
				
				wallX = 0;
				addWall(wallX, wallY);
				
				wallX = Values.CHUNK_WIDTH - 1;
				addWall(wallX, wallY);
			}
		}
	}

}