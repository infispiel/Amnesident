package  
{
	import org.flixel.*;
	
	public class IntroScreen extends FlxState	{
		public var gibberish:FlxText = new FlxText(0, 30, FlxG.width, "What?");
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
		
		private function clearText():void {
			if (gibberish != null) {
				if (gibberish.exists && gibberish.onScreen()) {
					gibberish.kill();
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
				if (introTimer >= 0 && introTimer <= 1) {
					backgroundNeedsToLoad = true;
					loadBackground(AssetsRegistry.introCeilingFishEyeBlur);				
				}
				else if (introTimer > 1 && introTimer <= 2)	{
					clearBackground();
				}
				else if (introTimer >= 2 && introTimer <= 3) {
					backgroundNeedsToLoad = true;
					loadBackground(AssetsRegistry.introCeilingFishEyeBlur);				
				}
				else if (introTimer > 3 && introTimer <= 4)	{
					clearBackground();
				}
				else if (introTimer > 4 && introTimer <= 5.5)	{
					backgroundNeedsToLoad = true;
					loadBackground(AssetsRegistry.introCeilingFishEye);					
				}
				else if (introTimer > 5.5 && introTimer <= 8)	{
					backgroundNeedsToLoad = true;
					loadBackground(AssetsRegistry.introCeiling);
				}
				else if (introTimer > 8 && introTimer <= 11) {
					gibberish.size = 32;
					gibberish.alignment = "center";
					add(gibberish);
				}
				else if (introTimer > 11 && introTimer <= 14) {
					clearText();
					gibberish = new FlxText(0, 30, FlxG.width, "Where am I?");
					gibberish.size = 32;
					gibberish.alignment = "center";
					add(gibberish);
				}
				else if (introTimer > 14 && introTimer <= 20) {
					clearText();
					gibberish = new FlxText(0, 30, FlxG.width, "Click to continue...");
					gibberish.size = 32;
					gibberish.alignment = "center";
					add(gibberish);
					if (FlxG.mouse.justPressed()) {
						clearText();
						state = "viewRoom";
						backgroundNeedsToLoad = true;
						introTimer = 0;	
					}
				}
				else {
					clearText();
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
				loadBackground(AssetsRegistry.introSurroundingScreen);		
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