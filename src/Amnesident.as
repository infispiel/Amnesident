package 
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	[SWF(width="800", height="480", backgroundColor="#00000000")] 
	[Frame(factoryClass = "Preloader")] //Tells Flixel to use the default preloader 
	public class Amnesident extends FlxGame
	{
		public static var numSlots:int = 4;
		public static var slotSize:int = 800 / 4;
		public static var story:Story;

		//changes mouse cursor whenever mouse hovers over an item in the array. TO BE CALLED IN UPDATE() IN EACH STATE!
		public static function checkMouseHover(items:Array):void {
			var overLappingAnItem:Boolean = false;
			for each (var item:FlxSprite in items) {
				if (item != null) {
					if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, item)) {
						overLappingAnItem = true;
					}
				}
			}	
			if (overLappingAnItem) {
				FlxG.mouse.show(AssetsRegistry.hoverCursor);
			} else {
				FlxG.mouse.show(AssetsRegistry.normalCursor);
			}
		}
		
		public function Amnesident() 
		{
			super(800, 480, MainMenuState, 1);
			FlxG.mouse.show();
			trace(FlxG.width);
		}
		
	}
	
}