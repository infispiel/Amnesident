package 
{
	import org.flixel.*;
	[SWF(width="640", height="480", backgroundColor="#00000000")] 
	[Frame(factoryClass = "Preloader")] //Tells Flixel to use the default preloader 
	public class Amnesident extends FlxGame
	{
		//Yogurt
		[Embed(source = "assets/art/moldyYogurt.png")] public static var moldyYogurtPic:Class; //125x119
		[Embed(source = "assets/art/Yogurt.png")] public static var YogurtPic:Class; //125x119
		
		//Boxes
		[Embed(source = 'assets/art/graybox.png')] public static var grayBox:Class; //32x32
		[Embed(source = 'assets/art/redbox.png')] public static var redBox:Class; //32x32
		
		//Beds
		[Embed(source = "assets/art/Bed.png")] public static var bedPic:Class; //307x115
		[Embed(source = "assets/art/BedWithnews.png")] public static var bedWithnewsPic:Class; //307x115
		
		//Doors
		[Embed(source = "assets/art/Door.png")] public static var doorPic:Class; //127x236
		[Embed(source = "assets/art/Door2.png")] public static var door2Pic:Class; //148x247
		
		//Endtable Top Items
		[Embed(source = "assets/art/Mirror.png")] public static var mirrorPic:Class; //125x200
		
		//Portraits
		[Embed(source = "assets/art/MrCat.png")] public static var mrCatPic:Class; //127x459
		[Embed(source = "assets/art/MrPresident.png")] public static var mrPresidentPic:Class; //127x459
		
		//Windows
		[Embed(source = "assets/art/window1.png")] public static var windowPic:Class; //200x459
		[Embed(source = "assets/art/window1wood.png")] public static var woodWinodowPic:Class; //200x459
		
		//Presidential Desks
		[Embed(source = "assets/art/desk1basic.png")] public static var desk1BasicPic:Class; //306x150
		[Embed(source = "assets/art/desk1lamp.png")] public static var desk1LampPic:Class; //306x272
		
		//Bookshelf
		[Embed(source = "assets/art/Bookshelf1.png")] public static var bookshelf1Pic:Class; //200x382
		
		
		
		public function Amnesident() 
		{
			super(640, 480, MainMenuState, 1);
			FlxG.mouse.show();
		}
		
	}
	
}