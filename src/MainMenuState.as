package  
{
	import org.flixel.*;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	public class MainMenuState extends FlxState 
	{
		[Embed(source = 'graybox.png')] public static var grayBox:Class;
		
		public var title:FlxText, click:FlxText;
		public var level1:Level;
		
		public function MainMenuState()
		{
			level1 = new Level(new Item(grayBox, 32, 32));

			title = new FlxText(200, 180, 300, "Amnesident");
			title.size = 32;
			add(title);

			click = new FlxText(250, 220, 200, "Click to start");
			click.size = 16;
			add(click);
		}

		override public function update():void
		{
			if (FlxG.mouse.justPressed()) {
				FlxG.switchState(level1);
			}
		}
	}
}
