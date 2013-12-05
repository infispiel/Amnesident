package 
{
	import flash.display.Bitmap;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	/**
	 *
	 * NOTES:
	 * 
	 * For the UI, the interface bars will take up 40 pixels on top of the screen and 40 pixels on the bottom of the screen.
	 * Thus, this should be accounted for as the actual game screen will only be 800X480.
	 * 
	 * 
	 */
	[SWF(width="800", height="600", backgroundColor="#00000000")] 
	[Frame(factoryClass = "Preloader")] //Tells Flixel to use the default preloader 
	public class Amnesident extends FlxGame
	{
		public static var numSlots:int = 4;
		//slotSize should be width/numSlots.
		public static var slotSize:int = 800 / numSlots;
		//Accounts for the UI space.
		// public static var interfaceSize:int = 60;
		public static var interfaceSize:int = 65;
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
			super(800, 600, IntroScreen, 1);
			//super(800, 600, MainMenuState, 1);
			FlxG.mouse.show();
		}
	}
}
