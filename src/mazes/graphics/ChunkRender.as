package mazes.graphics 
{
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import mazes.pieces.Chunk;
	import mazes.Values;
	import net.flashpunk.Graphic;
	
	/**
	 * A graphic of a chunk and its walls.
	 * @author beyamor
	 */
	public class ChunkRender extends Graphic 
	{
		private var buffer:BitmapData;
		
		public function ChunkRender(chunk:Chunk) 
		{
			buffer = new BitmapData(Values.CHUNK_PIXEL_WIDTH, Values.CHUNK_PIXEL_WIDTH, false);
			
			draw(chunk);
		}
		
		private function draw(chunk:Chunk):void {
			
			var	shape:Shape			= new Shape,
				graphics:Graphics	= shape.graphics;
			
			for (var cellX:int = 0; cellX < Values.CHUNK_WIDTH; ++cellX) {
				for (var cellY:int = 0; cellY < Values.CHUNK_WIDTH; ++cellY) {
					for (var unitX:int = 0; unitX < Values.CELL_WIDTH; ++unitX) {
						for (var unitY:int = 0; unitY < Values.CELL_WIDTH; ++unitY) {
							
							var	offsetX:int		= cellX * Values.CELL_PIXEL_WIDTH + unitX * Values.UNIT_WIDTH,
								offsetY:int		= cellY * Values.CELL_PIXEL_WIDTH + unitY * Values.UNIT_WIDTH,
								isWall:Boolean	= chunk.cells[cellX][cellY].isWall[unitX][unitY],
								color:uint		= isWall? 0x000000 : 0xFFFFFF;
								
							graphics.beginFill(color);
							graphics.drawRect(offsetX, offsetY, Values.UNIT_WIDTH, Values.UNIT_WIDTH);
							graphics.endFill();
						}
					}
				}
			}
			
			buffer.draw(shape);
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			var	drawMatrix:Matrix = new Matrix;
			drawMatrix.translate(
				point.x - camera.x,
				point.y - camera.y);
				
			target.draw(buffer, drawMatrix);
		}
	}

}