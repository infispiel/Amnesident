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
			
			var moldyYogurt:Item = new Item(Amnesident.table_m_moldPic, 125, 200, "It's covered in mold! I'm going to have a word with room service....");
			var yogurt:Item = new Item(Amnesident.table_m_yogurtPic, 125, 200, "Whoever put this here must have known how much I love cucumber yogurt. How kind!");
			var bed:Item = new Item(Amnesident.bedPic, 307, 115, "I only woke up a few minutes ago, I'm not going back to sleep already!");
			var door:Item = new Item(Amnesident.doorPic, 127, 236, "The door is locked.");
			var cat:Item = new Item(Amnesident.mrCatPic, 127, 459, "Truly a magnificent work of art. It captures the beauty and feline grace of the animal perfectly.");
			var president:Item = new Item(Amnesident.mrPresidentPic, 127, 459, "What a handsome fellow! No wonder the public voted for him....");
			var bedNews:Item = new Item(Amnesident.bedWithnewsPic, 307, 115, "The headline reads: 'Is Craine Insane? President's erratic behavior mystifies family, staff.'");
			var mirror:Item = new Item(Amnesident.table_m_mirrorPic, 125, 200, "Now at least I know one thing about myself: I am ridiculously good-looking!");
			
			var itemList:Array = new Array(president, moldyYogurt, yogurt, bed, door, cat, bedNews, mirror);
			level1 = new Level(itemList);

                        var discoverPresident:Token = new Token("Hey...I've seen that face before...I must be the President!", new Array(bedNews, president), new Array(mirror, president), new Array());
			// for now I'm just making both paths the same but I should make it so the second path can be null
                        var longTime:Token = new Token("I must have been unconscious for a while....", new Array(moldyYogurt), new Array(moldyYogurt), new Array());

			var tokenList:Array = new Array(discoverPresident, longTime);

			story = new Story(itemList, tokenList);
			
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
