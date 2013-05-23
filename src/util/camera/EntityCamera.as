package util.camera 
{
	import net.flashpunk.Entity;
	/**
	 * The entity camera tries to stay centered on some entity.
	 * @author beyamor
	 */
	public class EntityCamera extends CameraDecorator
	{
		private var entity:Entity;
		
		/**
		 * Creates a new camera to follow the given entity.
		 */
		public function EntityCamera(entity:Entity, cam:Camera) 
		{
			super(cam);
			
			this.entity = entity;
		}
		
		override public function update():void 
		{
			super.update();
			
			baseCamera.x = entity.x - baseCamera.width / 2;
			baseCamera.y = entity.y - baseCamera.height / 2;
		}
	}

}