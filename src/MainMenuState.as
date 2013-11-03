package  
{
	import org.flixel.*;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	public class MainMenuState extends FlxState 
	{
		[Embed(source = 'graybox.png')] public static var grayBox:Class;
		
		public var title:FlxText;
		public var level1:Level;
		public var story:Story;
		public function MainMenuState() 
		{
			level1 = new Level(new Item(grayBox, 32, 32));
			story = new Story();
			story.setLevel(level1);
			title = new FlxText(300, 0, 100, "Amnesident!!");
			add(title);
		}

		override public function update():void
		{
			if (FlxG.keys.ONE) {
				FlxG.switchState(level1);
			}
		}
	}
}
