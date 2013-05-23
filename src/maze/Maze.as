package maze 
{
	import maze.entities.Player;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Maze extends World 
	{
		
		public function Maze() 
		{
			add(new Player);
		}
		
	}

}