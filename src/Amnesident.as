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
		
		//Arrows
		[Embed(source="assets/art/leftArrow.png")] public static var leftArrow:Class;	//115x99
		[Embed(source="assets/art/rightArrow.png")] public static var rightArrow:Class;	//115x99
		
		//Backgrounds
		[Embed(source = "assets/art/GenericBackgroundTilesBlue.png")] public static var blueTiles:Class; //1307x573
		[Embed(source="assets/art/GenericBackgroundTilesGreen-01.png")] public static var greenTiles:Class; //1307x573
		
		//Boxes
		[Embed(source = 'assets/art/graybox.png')] public static var grayBox:Class; //32x32
		[Embed(source = 'assets/art/redbox.png')] public static var redBox:Class; //32x32
		
		//Beds
		[Embed(source = "assets/art/Bed.png")] public static var bedPic:Class; //307x115
		[Embed(source = "assets/art/BedWithnews.png")] public static var bedWithnewsPic:Class; //307x115
		[Embed(source = "assets/art/Bed2.png")] public static var bedWoodPic:Class; //307x115
		[Embed(source="assets/art/Bed2withnews.png")] public static var bedWoodWithnewsPic:Class; //307x115
		
		//Doors
		[Embed(source = "assets/art/Door.png")] public static var doorPic:Class; //127x236
		[Embed(source = "assets/art/Door2.png")] public static var door2Pic:Class; //148x247
		[Embed(source = "assets/art/roomExit.png")] public static var roomExit:Class; //148x247
		
		//Endtable Top Items -- THEY ARE ALL 125x200
			//Metal:
				//Books: (black, blue, brown, green, red, yellow)
		[Embed(source = "assets/art/tables with items/Metal/wblackbook.png")] public static var table_m_blackbookPic:Class;
		[Embed(source = "assets/art/tables with items/Metal/wbluebook.png")] public static var table_m_bluebookPic:Class;
		[Embed(source = "assets/art/tables with items/Metal/wbrownbook.png")] public static var table_m_brownbookPic:Class;
		[Embed(source = "assets/art/tables with items/Metal/wgreenbook.png")] public static var table_m_greenbookPic:Class;
		[Embed(source = "assets/art/tables with items/Metal/wredbook.png")] public static var table_m_redbookPic:Class;
		[Embed(source = "assets/art/tables with items/Metal/wyellowbook.png")] public static var table_m_yellowbookPic:Class;
				//Other
		[Embed(source = "assets/art/tables with items/Metal/wcharger.png")] public static var table_m_chargerPic:Class;
		[Embed(source = "assets/art/tables with items/Metal/wkeycard.png")] public static var table_m_keycardPic:Class;
		[Embed(source = "assets/art/tables with items/Metal/wmirror.png")] public static var table_m_mirrorPic:Class;
		[Embed(source = "assets/art/tables with items/Metal/wmold.png")] public static var table_m_moldPic:Class;
		[Embed(source = "assets/art/tables with items/Metal/wphone.png")] public static var table_m_phonePic:Class;
		[Embed(source = "assets/art/tables with items/Metal/wrazor.png")] public static var table_m_razorPic:Class;
		[Embed(source = "assets/art/tables with items/Metal/wyogurt.png")] public static var table_m_yogurtPic:Class;
		
			//Wood:
				//Books: (black, blue, brown, green, red, yellow)
		[Embed(source = "assets/art/tables with items/Wood/wblackbook.png")] public static var table_w_blackbookPic:Class;
		[Embed(source = "assets/art/tables with items/Wood/wbluebook.png")] public static var table_w_bluebookPic:Class;
		[Embed(source = "assets/art/tables with items/Wood/wbrownbook.png")] public static var table_w_brownbookPic:Class;
		[Embed(source = "assets/art/tables with items/Wood/wgreenbook.png")] public static var table_w_greenbookPic:Class;
		[Embed(source = "assets/art/tables with items/Wood/wredbook.png")] public static var table_w_redbookPic:Class;
		[Embed(source = "assets/art/tables with items/Wood/wyellowbook.png")] public static var table_w_yellowbookPic:Class;
				//Other
		[Embed(source = "assets/art/tables with items/Wood/wcharger.png")] public static var table_w_chargerPic:Class;
		[Embed(source = "assets/art/tables with items/Wood/wkeycard.png")] public static var table_w_keycardPic:Class;
		[Embed(source = "assets/art/tables with items/Wood/wmirror.png")] public static var table_w_mirrorPic:Class;
		[Embed(source = "assets/art/tables with items/Wood/wmold.png")] public static var table_w_moldPic:Class;
		[Embed(source = "assets/art/tables with items/Wood/wphone.png")] public static var table_w_phonePic:Class;
		[Embed(source = "assets/art/tables with items/Wood/wrazor.png")] public static var table_w_razorPic:Class;
		[Embed(source = "assets/art/tables with items/Wood/wyogurt.png")] public static var table_w_yogurtPic:Class;
		
		//Portraits
		[Embed(source = "assets/art/MrCat.png")] public static var mrCatPic:Class; //127x459
		[Embed(source = "assets/art/MrPresident.png")] public static var mrPresidentPic:Class; //127x459
		
		//Windows
		[Embed(source = "assets/art/window1.png")] public static var windowPic:Class; //200x459
		[Embed(source = "assets/art/window1wood.png")] public static var woodWinodowPic:Class; //200x459
		
		//Desks
		[Embed(source = "assets/art/desk1basic.png")] public static var desk1BasicPic:Class; //306x150
		[Embed(source = "assets/art/desk1lamp.png")] public static var desk1LampPic:Class; //306x272
		[Embed(source="assets/art/desk2basic.png")] public static var desk2BasicPic:Class;  //306x150
		
		//Tables
		[Embed(source = "assets/art/table1metal.png")] public static var table_mPic:Class; //125x75
		[Embed(source="assets/art/table1wood.png")] public static var table_wPic:Class;  //125x75
		
		
		//Bookshelf
		[Embed(source = "assets/art/Bookshelf1.png")] public static var bookshelf1Pic:Class; //200x382
		
		public static var hospitalHallway:Hallway = new Hallway(doorPic, 5, 0);
		
		
		public function Amnesident() 
		{
			super(800, 480, MainMenuState, 1);
			FlxG.mouse.show();
			trace(FlxG.width);
		}
		
	}
	
}