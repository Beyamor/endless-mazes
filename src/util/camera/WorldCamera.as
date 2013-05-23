package util.camera 
{
	import net.flashpunk.FP;
	import net.flashpunk.World;
	/**
	 * The world camera wraps a world's camera.
	 * @author beyamor
	 */
	public class WorldCamera implements Camera
	{
		private var world:World;
		
		public function WorldCamera(world:World) 
		{
			this.world = world;
		}
		
		public function get x():Number 
		{
			return world.camera.x;
		}
		
		public function get y():Number 
		{
			return world.camera.y;
		}
		
		public function set x(value:Number):void 
		{
			world.camera.x = value;
		}
		
		public function set y(value:Number):void 
		{
			world.camera.y = value;
		}
		
		public function get width():Number 
		{
			return FP.width;
		}
		
		public function get height():Number 
		{
			return FP.height;
		}
		
		public function update():void 
		{
			// Do nothing
		}
		
		public function get left():Number
		{
			return x;
		}
		
		public function get right():Number
		{
			return x + width;
		}
		
		public function get top():Number
		{
			return y;
		}
		
		public function get bottom():Number
		{
			return y + height;
		}
	}

}