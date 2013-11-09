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
	
		public var level1:Level;
		public var story:Story;
		public function MainMenuState() 
		{
			
			//Use FlxG.mouse.show(ImgCursor, 16, 16) to show the custom cursor image
			FlxG.mouse.show();
			
			level1 = new Level(Story.itemList);

			// This is dumb, if we're storing these in Story
			//story = new Story(Story.itemList, Story.tokenList);
			
			Story.setLevel(level1);
			title = new FlxText(0, 180, FlxG.width, "Amnesident");
			title.size = 32;
			title.alignment = "center";
			add(title);

			click = new FlxText(0, 230, FlxG.width, "Click to start");
			click.size = 16;
			click.alignment = "center";
			add(click);
		}

		override public function update():void
		{
			if (FlxG.mouse.justPressed()) {
				level1.story = story;
				FlxG.switchState(level1);
			}
		}
	}
}
