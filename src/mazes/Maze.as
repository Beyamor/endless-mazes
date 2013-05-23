package mazes 
{
	import mazes.entities.Player;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import util.camera.EntityCamera;
	import util.camera.WorldCamera;
	import util.Timer;
	import util.UpdateList;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Maze extends World 
	{
		private var updateTimer:Timer,
					updateables:UpdateList = new UpdateList;
		
		public function Maze() 
		{			
			// For discrete, grid-based movement, we're only going to update the entities every couple of update pulses
			updateTimer = new Timer(0.25);
			updateTimer.addCallback(function():void {
				updateEntities();
			});
			updateTimer.loops = true;
			updateables.add(updateTimer);
			
			var player:Player = new Player;
			add(player);
			updateables.add(
				new EntityCamera(player,
					new WorldCamera(this)));
			
			var chunk:Chunk = new Chunk(0, 0);
			chunk.addTo(this);
		}
		
		private function updateEntities():void {
			
			super.update();
		}
		
		override public function update():void 
		{
			updateables.update();
		}
	}

}