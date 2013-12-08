package  
{
	import org.flixel.*;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	public class MainMenuState extends FlxState 
	{
		//Use this command to set the default cursor png...
		//[Embed(source = "cursor.png")] private var ImgCursor:Class;
		public var title:FlxText, click:FlxText;

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
			click = new FlxText(0, 230, FlxG.width, "Click to play");
			click.size = 16;
			click.alignment = "center";
			add(click);
		}

		override public function update():void
		{
			if (FlxG.mouse.justPressed()) {
				FlxG.fade(0xff000000, 1, startPlay);
			}
		}
		
		public static function startPlay():void {
			var tokens:Tokens = new Tokens();
			Amnesident.story = new Story(tokens.getItemList(), tokens.getTokenList());
			Registry.halls[Registry.currentHall] = new Hallway(AssetsRegistry.doorPic, AssetsRegistry.blueTiles, 4, 0);
			Registry.halls[Registry.currentHall].create();
			
			FlxG.playMusic(AssetsRegistry.darkDaysBgm, 1);

			// this switches state, nothing after it will be run (probably)
			Registry.halls[Registry.currentHall].rooms[0].enter();
		}
	}
}