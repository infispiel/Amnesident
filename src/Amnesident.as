package 
{
	import org.flixel.*;
	[SWF(width="800", height="480", backgroundColor="#00000000")] 
	[Frame(factoryClass = "Preloader")] //Tells Flixel to use the default preloader 
	public class Amnesident extends FlxGame
	{
		public static var numSlots:int = 4;
		public static var slotSize:int = 800 / 4;
		public var visitedRoomCount:Number = 0;
		public static var hospitalHallway:Hallway = new Hallway(AssetsRegistry.doorPic, 5, 0);
		
		
		public function Amnesident() 
		{
			super(800, 480, MainMenuState, 1);
			FlxG.mouse.show();
			trace(FlxG.width);
		}
		
	}
	
}