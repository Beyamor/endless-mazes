package mazes 
{
	import mazes.diggers.Digger;
	import mazes.diggers.rw.RandomWalker;
	import mazes.entities.Player;
	import mazes.pieces.Chunk;
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
	public class Maze extends World 
	{
		private var updateTimer:Timer,
					updateables:UpdateList = new UpdateList;
		
		public function Maze() 
		{			
			var player:Player = new Player(100, 100);
			add(player);
			updateables.add(
				new EntityCamera(player,
					new WorldCamera(this)));
			
			var digger:Digger			= new RandomWalker,
				chunk:Chunk				= new Chunk(0, 0, digger.dig()),
				reifier:ChunkReifier	= new ChunkReifier(this);
			reifier.reify(chunk);
		}
		
		override public function update():void 
		{
			super.update();
			updateables.update();
		}
	}

}