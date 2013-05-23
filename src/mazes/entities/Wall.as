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
		
		public function Wall(x:Number, y:Number) 
		{
			super(x, y, new Square(Values.UNIT_WIDTH, 0x000000));
			layer = 50;
		}
		
	}

}