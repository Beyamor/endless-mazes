package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import mazes.MazeWorld;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Main extends Engine 
	{
		
		public function Main():void 
		{
			super(800, 600);
		}
		
		override public function init():void 
		{
			super.init();
			FP.world = new MazeWorld;
			
			Input.define("up",		Key.UP,		Key.W);
			Input.define("down",	Key.DOWN,	Key.S);
			Input.define("left",	Key.LEFT,	Key.A);
			Input.define("right",	Key.RIGHT,	Key.D);
			
			FP.console.enable();
		}
		
	}
	
}