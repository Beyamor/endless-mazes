package mazes.entities 
{
	import mazes.graphics.Square;
	import mazes.Values;
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Wall extends Entity 
	{
		private static const pool:Vector.<Wall> = new Vector.<Wall>;
		
		private static var poolCount:int;
		{
			for (poolCount; poolCount < 7000; ++poolCount) {
				
				pool.push(new Wall);
			}
		}
		
		public static function create(x:Number, y:Number):Wall {
			
			var wall:Wall;
			
			if (pool.length > 0) {
				
				wall = pool.pop();
			}
			
			else {
				
				wall = new Wall;
			}
			
			wall.x = x;
			wall.y = y;
			
			return wall;
		}
		
		public function Wall() 
		{
			super(0, 0, new Square(Values.UNIT_WIDTH, 0x000000));
			visible = false; // Rendered in ChunkRender
		}
		
		override public function removed():void 
		{
			super.removed();
			pool.push(this);
		}
	}

}