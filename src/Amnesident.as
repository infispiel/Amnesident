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
		[Embed(source = 'assets/art/redbox.png')] public static var redBox:Class; //32x32
		[Embed(source = "assets/art/Bed.png")] public static var bedPic:Class; //307x115
		[Embed(source = "assets/art/BedWithnews.png")] public static var bedWithnewsPic:Class; //307x115
		[Embed(source = "assets/art/Door.png")] public static var doorPic:Class; //127x236
		[Embed(source = "assets/art/Mirror.png")] public static var mirrorPic:Class; //125x200
		[Embed(source = "assets/art/MrCat.png")] public static var mrCatPic:Class; //127x459
		[Embed(source="assets/art/MrPresident.png")] public static var mrPresidentPic:Class; //127x459
		
		public function Amnesident() 
		{
			super(640, 480, MainMenuState, 1);
			FlxG.mouse.show();
		}
		
	}
	
}