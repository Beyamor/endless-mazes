package mazes 
{
	/**
	 * A buncha constants we need for the maze.
	 * @author beyamor
	 */
	public class Values 
	{
		public static const	UNIT_WIDTH:uint			= 24,	// in pixels
							CELL_WIDTH:uint			= 4,	// in units
							CHUNK_WIDTH:uint		= 16,	// in cells
							
							CELL_PIXEL_WIDTH:uint	= CELL_WIDTH * UNIT_WIDTH,
							CHUNK_PIXEL_WIDTH:uint	= CHUNK_WIDTH * CELL_PIXEL_WIDTH;
	}

}