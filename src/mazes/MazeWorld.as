package mazes 
{
	import mazes.entities.Player;
	import mazes.pieces.Chunk;
	import mazes.pieces.Maze;
	import mazes.reification.ChunkReifier;
	import mazes.reification.ViewLoader;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import util.camera.Camera;
	import util.camera.EntityCamera;
	import util.camera.WorldCamera;
	import util.Timer;
	import util.UpdateList;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MazeWorld extends World 
	{
		private var updateTimer:Timer,
					updateables:UpdateList = new UpdateList,
					maze:Maze;
		
		public function MazeWorld() 
		{			
			var player:Player = new Player(100, 100);
			add(player);
			
			var camera:Camera = new EntityCamera(player,
									new WorldCamera(this));
			updateables.add(camera);
			
			maze = new Maze;
			
			updateables.add(new ViewLoader(maze, this, camera));
		}
		
		override public function update():void 
		{
			super.update();
			updateables.update();
		}
	}

}