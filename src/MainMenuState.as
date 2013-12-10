package  
{
	import org.flixel.*;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import org.flixel.plugin.photonstorm.*;
	
	public class MainMenuState extends FlxState 
	{
		//Use this command to set the default cursor png...
		//[Embed(source = "cursor.png")] private var ImgCursor:Class;
		public var title:FlxText, click:FlxText;
		public var creditBtn:FlxSprite;
		public var legalBtn:FlxSprite;
		public var newStoryBtn:FlxSprite;
		public function MainMenuState() 
		{
			//Use FlxG.mouse.show(ImgCursor, 16, 16) to show the custom cursor image
			FlxG.mouse.show();
				
			//Create MainMenu Title
			title = new FlxText(0, 180, FlxG.width, "Amnesident");
			title.size = 32;
			title.alignment = "center";
			add(title);
			
			//Add Click to Start Text
			//click = new FlxText(0, 230, FlxG.width, "Click to play");
			//click.size = 16;
			//click.alignment = "center";
			//add(click);
			
			newStoryBtn = new FlxSprite(340, 500, AssetsRegistry.newStoryBtnImg);
			creditBtn = new FlxSprite(280, 560, AssetsRegistry.creditBtnImg);
			legalBtn = new FlxSprite(410, 560, AssetsRegistry.legalBtnImg);

			add(creditBtn);
			add(legalBtn);
			add(newStoryBtn);			
		}

		override public function update():void
		{
			if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, creditBtn)) {
				creditBtn.loadGraphic(AssetsRegistry.creditBtnImgHover);
			} else {
				creditBtn.loadGraphic(AssetsRegistry.creditBtnImg);
			}

			if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, legalBtn)) {
				legalBtn.loadGraphic(AssetsRegistry.legalBtnImgHover);
			} else {
				legalBtn.loadGraphic(AssetsRegistry.legalBtnImg);
			}

			if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, newStoryBtn)) {
				newStoryBtn.loadGraphic(AssetsRegistry.newStoryBtnImgHover);
			} else {
				newStoryBtn.loadGraphic(AssetsRegistry.newStoryBtnImg);
			}
			if (FlxG.mouse.justPressed()) {
				if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, creditBtn)) {
					var credit:CreditsScreen = new CreditsScreen();
					FlxG.switchState(credit);
				} else if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, newStoryBtn)) {
					FlxG.fade(0xff000000, 1, startPlay);
				} else if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, legalBtn)) {
					var legal:LegalScreen = new LegalScreen();
					FlxG.switchState(legal);
				}
			}			
		}
		
		public static function startPlay():void {
			var tokens:Tokens = new Tokens();
			Amnesident.story = new Story(tokens.getItemList(), tokens.getTokenList());
			Registry.halls[Registry.currentHall] = new Hallway(AssetsRegistry.doorPic, AssetsRegistry.elevatorImg, AssetsRegistry.blueTiles, 4, 0);
			Registry.halls[Registry.currentHall].create();
			
			FlxG.playMusic(AssetsRegistry.darkDaysBgm, 1);

			// this switches state, nothing after it will be run (probably)
			Registry.halls[Registry.currentHall].rooms[0].enter(true);
		}
	}
}