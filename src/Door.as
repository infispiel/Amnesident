package 
{
	import org.flixel.*;	
	public class Door extends FlxSprite {
		public var doorType:String;

		public function Door(X:Number, Y:Number, image:Class, dt:String) {
			super(X, Y, image);
			solid = false;
			doorType = dt;
		}
		
		//Returns true if the item was just clicked.
		public function justClicked():Boolean
		{
			if (FlxG.mouse.justReleased()) {
				var mousePoint:FlxPoint = new FlxPoint(FlxG.mouse.x, FlxG.mouse.y);
				if (this.overlapsPoint(mousePoint)) {
					return true;
				}
			}
			return false;
		}
	}
}