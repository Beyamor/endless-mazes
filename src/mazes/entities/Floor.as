package mazes.entities 
{
	import mazes.graphics.Square;
	import mazes.Values;
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Floor extends Entity 
	{
		
		public function Floor(x:Number, y:Number) 
		{
			super(x, y, new Square(Values.BLOCK_WIDTH * Values.CHUNK_WIDTH, 0xFFFFFF));
			layer = 100;
		}
		
	}

}