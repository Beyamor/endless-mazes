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
			var player:Player = new Player(Values.BLOCK_WIDTH, Values.BLOCK_WIDTH);
			add(player);
			updateables.add(
				new EntityCamera(player,
					new WorldCamera(this)));
			
			var chunk:Chunk = new Chunk(0, 0);
			chunk.addTo(this);
		}
		
		override public function update():void 
		{
			super.update();
			updateables.update();
		}
	}

}