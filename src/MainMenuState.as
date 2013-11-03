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
			
			var item1:Item = new Item(Amnesident.grayBox, 32, 32, "What an exquisite gray box! :)");
			var item2:Item = new Item(Amnesident.moldyYogurtPic, 32, 32, "ewwwwwww");
			var item3:Item = new Item(Amnesident.YogurtPic, 32, 32, "What an exquisite yogurt! :)");
			var item4:Item = new Item(Amnesident.redBox, 32, 32, "What an exquisite red box! :)");
			
			
			level1 = new Level(item1,item2,item3,item4);
			
			story = new Story();
			story.setLevel(level1);
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
