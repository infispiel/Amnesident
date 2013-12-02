package  
{
	import org.flixel.*;
	
	public class IntroScreen extends FlxState	{
		public var title:FlxText;
		public var gibberish:FlxText;
		public var escapeVideo:FlxText;
		public var textWidth:int = 300;
		private var state:String = "blank";
		//states
			//black screen
			//blinking awake
			//look at ceiling
			//see room
			//add "Ugh...where am I? What room is this?"
			//add "What's going on?"
			//mouse screen - "Point at Objects"
			//"When the cursor is read, click to interact with them"
			//"Get clues from the surroundings"
			//journal screen - "Fill in the blanks in your journal"
			//Load Start Scteen
			
		public var introTimer:Number = 0;
			
		public function IntroScreen() {			
			
			if (state == "blank") {
				title = new FlxText(FlxG.width/2 - textWidth/2, FlxG.height/12, textWidth, "Black Screen");
				title.size = 32;
				title.alignment = "center";
				add(title);		
			}
			else if (state == "blinking") {
				title = new FlxText(FlxG.width/2 - textWidth/2, FlxG.height/12, textWidth, "This is the Intro Video!!!!!!");
				title.size = 32;
				title.alignment = "center";
				add(title);		
			}
			else if (state == "ceiling") {
				title = new FlxText(FlxG.width/2 - textWidth/2, FlxG.height/12, textWidth, "This is the Intro Video!!!!!!");
				title.size = 32;
				title.alignment = "center";
				add(title);		
			}
			else if (state == "room") {
				title = new FlxText(FlxG.width/2 - textWidth/2, FlxG.height/12, textWidth, "This is the Intro Video!!!!!!");
				title.size = 32;
				title.alignment = "center";
				add(title);		
			}
			else if (state == "blinking") {
				title = new FlxText(FlxG.width/2 - textWidth/2, FlxG.height/12, textWidth, "This is the Intro Video!!!!!!");
				title.size = 32;
				title.alignment = "center";
				add(title);		
			}
			else if (state == "blinking") {
				title = new FlxText(FlxG.width/2 - textWidth/2, FlxG.height/12, textWidth, "This is the Intro Video!!!!!!");
				title.size = 32;
				title.alignment = "center";
				add(title);		
			}
			else if (state == "blinking") {
				title = new FlxText(FlxG.width/2 - textWidth/2, FlxG.height/12, textWidth, "This is the Intro Video!!!!!!");
				title.size = 32;
				title.alignment = "center";
				add(title);		
			}
		}
		
		override public function update():void {
			///Update Timer
			introTimer += FlxG.elapsed;
			if (introTimer >= 2)	{
				// After 2 seconds has passed, the timer will reset.
				introTimer = 0;
			}
			if (FlxG.mouse.justPressed()) {
				FlxG.switchState(MainMenuState);
			}
		}
	}

}