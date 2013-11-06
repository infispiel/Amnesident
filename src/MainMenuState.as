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
		
			var moldyYogurt:Item = new Item(Amnesident.moldyYogurtPic, 125, 119, "ewwwwwww");
			var yogurt:Item = new Item(Amnesident.YogurtPic, 125, 119, "What an exquisite yogurt! :)");
			var bed:Item = new Item(Amnesident.bedPic, 307, 115, "The holy grail for MIT/Wellesely Students...");
			var door:Item = new Item(Amnesident.doorPic, 127, 236, "The door is locked.");
			var cat:Item = new Item(Amnesident.mrCatPic, 127, 459, "Truly a magnificient cat indeed!");
			var president:Item = new Item(Amnesident.mrPresidentPic, 127, 459, "Man that guy is so beautiful");
			var bedNews:Item = new Item(Amnesident.bedWithnewsPic, 307, 115, "Who even reads newspapers anymore?");
			var mirror:Item = new Item(Amnesident.mirrorPic, 125, 200, "Mirror mirror on the wall, who is the most handsome of them all?");
			
			var itemList:Array = new Array(president, moldyYogurt, yogurt, bed, door, cat, bedNews, mirror);
			level1 = new Level(itemList);
			
			story = new Story();

			story.setLevel(level1);
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
