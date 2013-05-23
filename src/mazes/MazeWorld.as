package mazes 
{
	import mazes.entities.Player;
	import mazes.pieces.Chunk;
	import mazes.pieces.Maze;
	import mazes.reification.ChunkReifier;
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
	public class MazeWorld extends World 
	{
		private var updateTimer:Timer,
					updateables:UpdateList = new UpdateList,
					maze:Maze;
		
		public function MazeWorld() 
		{			
			var player:Player = new Player(100, 100);
			add(player);
			updateables.add(
				new EntityCamera(player,
					new WorldCamera(this)));
			
			maze = new Maze;
			
			var reifier:ChunkReifier = new ChunkReifier(this),
				chunkX:int, chunkY:int;
			
			for (chunkX = 0; chunkX < 2; ++chunkX) {
				for (chunkY = 0; chunkY < 2; ++chunkY) {
					maze.loadChunk(chunkX, chunkY);
				}
			}
			
			for (chunkX = 0; chunkX < 2; ++chunkX) {
				for (chunkY = 0; chunkY < 2; ++chunkY) {
					reifier.reify(maze.getChunk(chunkX, chunkY));
				}
			}
		}
		
		override public function update():void 
		{
			super.update();
			updateables.update();
		}
	}

}