package mazes 
{
	import mazes.entities.Player;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import util.Timer;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Maze extends World 
	{
		private var updateTimer:Timer;
		
		public function Maze() 
		{
			add(new Player);
			
			updateTimer = new Timer(0.25);
			updateTimer.loops = true;
			
			var chunk:Chunk = new Chunk(0, 0);
			chunk.addTo(this);
		}
		
		override public function update():void 
		{
			// For discrete, grid-based movement, we're only going to update the entities every couple of update pulses
			updateTimer.update();
			if (updateTimer.hasFired) super.update();
		}
	}

}