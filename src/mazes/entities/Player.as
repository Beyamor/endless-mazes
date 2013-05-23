package mazes.entities 
{
	import mazes.graphics.Circle;
	import mazes.Values;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	
	/**
	 * Our beloved player.
	 * @author beyamor
	 */
	public class Player extends Entity 
	{
		
		public function Player(x:Number, y:Number) 
		{
			super(x, y, new Circle(Values.UNIT_WIDTH, 0x4444ee));
		}
		
		override public function update():void 
		{
			super.update();
			
			var	dx:Number = 0, dy:Number = 0;
			
			if (Input.check("up"))		dy -= 1;
			if (Input.check("down"))	dy += 1;
			if (Input.check("left"))	dx -= 1;
			if (Input.check("right"))	dx += 1;
			
			if (dx != 0 && dy != 0) {
				
				dx *= Math.SQRT1_2;
				dy *= Math.SQRT1_2;
			}
			
			x += dx * 200 * FP.elapsed;
			y += dy * 200 * FP.elapsed;
		}
	}

}