package 
{
	import org.flixel.*;
	[SWF(width="640", height="480", backgroundColor="#00000000")] 
	[Frame(factoryClass = "Preloader")] //Tells Flixel to use the default preloader 
	public class Amnesident extends FlxGame
	{
		[Embed(source = "assets/art/moldyYogurt.png")] public static var moldyYogurtPic:Class; //125x119
		[Embed(source = "assets/art/Yogurt.png")] public static var YogurtPic:Class; //125x119
		[Embed(source = 'assets/art/graybox.png')] public static var grayBox:Class; //32x32
		
		public function Amnesident() 
		{
			super(640, 480, MainMenuState, 1);
			FlxG.mouse.show();
	}
		
	}
	
}