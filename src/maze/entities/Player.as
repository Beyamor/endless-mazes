package maze.entities 
{
	import maze.graphics.Circle;
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Player extends Entity 
	{
		
		public function Player() 
		{
			super(0, 0, new Circle(24, 0x4444ee));
		}
		
	}

}