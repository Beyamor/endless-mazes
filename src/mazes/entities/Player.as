package mazes.entities 
{
	import mazes.graphics.Circle;
	import mazes.Values;
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	
	/**
	 * Our beloved player.
	 * @author beyamor
	 */
	public class Player extends Entity 
	{
		
		public function Player() 
		{
			super(0, 0, new Circle(Values.BLOCK_WIDTH / 2, 0x4444ee));
		}
		
		override public function update():void 
		{
			super.update();
			
			var	dx:int = 0, dy:int = 0;
			
			if (Input.check("up"))		dy -= 1;
			if (Input.check("down"))	dy += 1;
			if (Input.check("left"))	dx -= 1;
			if (Input.check("right"))	dx += 1;
			
			if (dx != 0) {
				
				x += dx * Values.BLOCK_WIDTH;
			}
			
			else if (dy != 0) {
				
				y += dy * Values.BLOCK_WIDTH;
			}
		}
	}

}