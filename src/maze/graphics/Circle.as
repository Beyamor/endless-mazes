package maze.graphics 
{
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import net.flashpunk.Graphic;
	
	/**
	 * Draws a circle programmatically.
	 * @author beyamor
	 */
	public class Circle extends Graphic 
	{
		private var buffer:BitmapData,
					color:uint,
					radius:uint;
					
		private function get diameter():uint { return 2 * radius; }
		
		public function Circle(radius:uint, color:uint)
		{
			this.radius	= radius;
			this.color	= color;
			
			buffer = new BitmapData(diameter, diameter, true, 0);
			draw();
		}
		
		private function draw():void {
			
			var	circle:Shape		= new Shape,
				graphics:Graphics	= circle.graphics;
				
			graphics.beginFill(color);
			graphics.drawCircle(radius, radius, radius);
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