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
			
			width = height = Values.UNIT_WIDTH;
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
			
			dx *= 200 * FP.elapsed;
			dy *= 200 * FP.elapsed;
			
			if (!collide("wall", x + dx, y)) x += dx;
			if (!collide("wall", x, y + dy)) y += dy;
		}
	}

}