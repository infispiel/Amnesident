package  
{
	import org.flixel.*;
	
	public class IntroScreen extends FlxState	{
		public var title:FlxText;
		public var gibberish:FlxText;
		public var escapeVideo:FlxText;
		public var textWidth:int = 300;
		private var state:String = "blank";
		private var background:Background;
		private var backgroundNeedsToLoad:Boolean = true;		
		public var introTimer:Number = 0;
			
		public function IntroScreen() {		
		}
		
		private function clearBackground():void {
			if (background != null) {
				if (background.exists && background.onScreen()) {
					background.kill();
				}
			}
		}
		
		private function loadBackground(image:Class):void {
			if (backgroundNeedsToLoad) {
				clearBackground();
				background = new Background(image, false);
				add(background);
				backgroundNeedsToLoad = false;
			}
		}
		
		override public function update():void {
			///Update Timer
			introTimer += FlxG.elapsed;
			if (state == "blank") {
				if (introTimer >= 1.5) {
					introTimer = 0;
					state = "blinking";
				}
			}
			
			else if (state == "blinking") {
				if (introTimer >= 0 && introTimer <= 2) {
					backgroundNeedsToLoad = true;
					loadBackground(AssetsRegistry.introCeilingFishEyeBlur);				
				}
				else if (introTimer > 2 && introTimer < 3)	{
					backgroundNeedsToLoad = true;
					loadBackground(AssetsRegistry.introCeilingFishEye);					
				}
				else if (introTimer > 3 && introTimer < 3.5)	{
					clearBackground();
				}
				else if (introTimer > 3.5 && introTimer < 4.5)	{
					backgroundNeedsToLoad = true;
					loadBackground(AssetsRegistry.introCeiling);
				}
				else {
					state = "viewRoom";
					backgroundNeedsToLoad = true;
					introTimer = 0;
				}
			}
			
			else if (state == "viewRoom") {
				loadBackground(AssetsRegistry.introSurroundingRoom);
				if (FlxG.mouse.justPressed() )	{
					backgroundNeedsToLoad = true;
					state = "mouseScreen";
				}
			}
			
			else if (state == "mouseScreen") {
				loadBackground(AssetsRegistry.introMouseScreen);
				if (FlxG.mouse.justPressed() )	{
					backgroundNeedsToLoad = true;
					state = "surroundingScreen";
				}
			}
			
			else if (state == "surroundingScreen") {			
				//loadBackground(AssetsRegistry.introSurroundingScreen);		
				trace("Surrounding Screen Touches Down!");
				if (FlxG.mouse.justPressed() )	{
					backgroundNeedsToLoad = true;
					state = "journalScreen";
				}
			}
			
			else if (state == "journalScreen") {
				loadBackground(AssetsRegistry.introJournalScreen);				
				if (FlxG.mouse.justPressed() )	{
					state = null;
					FlxG.switchState(new MainMenuState());
				}
			}

			if (FlxG.keys.ESCAPE) {
				state = null;
				FlxG.switchState(new MainMenuState());
			}
		}
	}

}