package  
{
	/**
	 * ...
	 * @author Benjamin Shaibu
	 */
	public class AssetsRegistry 
	{
		//Custom Cursor (For hovering over objects)
		[Embed(source = "assets/art/hoverCursorImg.png")] public static var hoverCursor:Class;
		[Embed(source = "assets/art/cursor.png")] public static var normalCursor:Class;
		
		//TextBox
		[Embed(source = "/assets/art/textbox.png")] public static var textbox:Class;
		[Embed(source = "/assets/art/textboxLevel.png")] public static var textboxLevel:Class;
		
		//UI Buttons
		[Embed(source="/assets/art/UI/endgame.png")] public static var endGameBtnImg:Class; //181x50
		[Embed(source="/assets/art/UI/newStoryBtnImg.png")] public static var newStoryBtnImg:Class; //181x50
		[Embed(source="/assets/art/UI/endgame_hover.png")] public static var endGameBtnImgHover:Class; //181x50
		[Embed(source="/assets/art/UI/newStoryBtnImgHover.png")] public static var newStoryBtnImgHover:Class; //181x50
		[Embed(source="/assets/art/UI/hallway.png")] public static var hallwayBtnImg:Class; //106x64
		[Embed(source="/assets/art/UI/hallway_hover.png")] public static var hallwayBtnImgHover:Class; //106x64
		[Embed(source="/assets/art/UI/journal.png")] public static var journalBtnImg:Class; //65x63
		[Embed(source="/assets/art/UI/journal_hover.png")] public static var journalBtnImgHover:Class; //65x63
		[Embed(source="/assets/art/UI/highlightJournal.png")] public static var highlightJournalBtn:Class; //65x63
		[Embed(source="/assets/art/UI/highlightJournalHover.png")] public static var highlightJournalBtnHover:Class; //65x63

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
		[Embed(source = "assets/art/window1wood.png")] public static var woodWindowPic:Class; //200x459
		
		//Desks
		[Embed(source = "assets/art/desk1basic.png")] public static var desk1BasicPic:Class; //306x150
		[Embed(source = "assets/art/desk1lamp.png")] public static var desk1LampPic:Class; //306x272
		[Embed(source="assets/art/desk2basic.png")] public static var desk2BasicPic:Class;  //306x150
		
		//Tables
		[Embed(source = "assets/art/table1metal.png")] public static var table_mPic:Class; //125x75
		[Embed(source="assets/art/table1wood.png")] public static var table_wPic:Class;  //125x75
		
		
		//Bookshelf
		[Embed(source = "assets/art/Bookshelf1.png")] public static var bookshelf1Pic:Class; //200x382

		// Graybox Products
		[Embed(source = "assets/art/grayboxhousing.png")] public static var grayboxHousingPic:Class; // 226x225
		[Embed(source = "assets/art/grayboxbeard.png")] public static var grayboxBeardPic:Class; // 181x180
		[Embed(source = "assets/art/grayboxcat.png")] public static var grayboxCatPic:Class; // 113x113		
		// Sound
		[Embed(source = "assets/sound/eat.mp3")] public static var sfxEat:Class;
		[Embed(source = "assets/sound/footstep1.mp3")] public static var sfxStep1:Class;
		[Embed(source = "assets/sound/footstep2.mp3")] public static var sfxStep2:Class;
		[Embed(source = "assets/sound/openjournal.mp3")] public static var sfxopenjournal:Class;
		[Embed(source = "assets/sound/opendoor.mp3")] public static var sfxopendoor:Class;
		[Embed(source = "assets/sound/meowcute.mp3")] public static var sfxmeowcute:Class;
		public function AssetsRegistry() 
		{
			
		}
		
	}

}
