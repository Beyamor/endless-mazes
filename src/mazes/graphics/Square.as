package mazes.graphics 
{
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import net.flashpunk.Graphic;
	
	/**
	 * Draws a square programmatically.
	 * @author beyamor
	 */
	public class Square extends Graphic 
	{
		private var buffer:BitmapData,
					color:uint,
					width:uint;
					
		private function get diameter():uint { return 2 * width; }
		
		public function Square(width:uint, color:uint)
		{
			this.width	= width;
			this.color	= color;
			
			buffer = new BitmapData(width, width, true, 0);
			draw();
		}
		
		private function draw():void {
			
			var	circle:Shape		= new Shape,
				graphics:Graphics	= circle.graphics;
				
			graphics.beginFill(color);
			graphics.drawRect(0, 0, width, width);
			graphics.endFill();
			
			buffer.draw(circle);
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