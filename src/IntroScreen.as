package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class IntroScreen extends FlxState	{
		public var gibberish:FlxText = new FlxText(0, 30, FlxG.width, "What?");
		public var textWidth:int = 300;
		private var skipIntro:FlxSprite;

		private var state:String = "blank";
		private var background:Background;
		private var backgroundNeedsToLoad:Boolean = true;		
		
		public var introTimer:Number = 0;
			
		public function IntroScreen() {		
			skipIntro = new FlxSprite(645, 5, AssetsRegistry.skipIntroBtnImg);
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

			add(skipIntro);

			if (state == "blank") {
				if (introTimer >= 1.5) {
					introTimer = 0;
					state = "blinking";
				}
			}
			
			else if (state == "blinking") {
				if (introTimer >= 0 && introTimer <= 1) {
					backgroundNeedsToLoad = true;
					remove(skipIntro);
					loadBackground(AssetsRegistry.introCeilingFishEyeBlur);				
					add(skipIntro);

				}
				else if (introTimer > 1 && introTimer <= 2)	{
					remove(skipIntro);
					clearBackground();
					add(skipIntro);

				}
				else if (introTimer >= 2 && introTimer <= 3) {
					backgroundNeedsToLoad = true;
					
					remove(skipIntro);
					loadBackground(AssetsRegistry.introCeilingFishEyeBlur);		
					add(skipIntro);

				}
				else if (introTimer > 3 && introTimer <= 4)	{
					remove(skipIntro);
					clearBackground();
					add(skipIntro);

				}
				else if (introTimer > 4 && introTimer <= 5.5)	{
					remove(skipIntro);
					backgroundNeedsToLoad = true;
					loadBackground(AssetsRegistry.introCeilingFishEye);		
					add(skipIntro);

				}
				else if (introTimer > 5.5 && introTimer <= 8)	{
					remove(skipIntro);
					backgroundNeedsToLoad = true;
					loadBackground(AssetsRegistry.introCeiling);
					add(skipIntro);

				}
				else if (introTimer > 8 && introTimer <= 12) {
					gibberish.size = 32;
					gibberish.alignment = "center";
					add(gibberish);
				}
				else if (introTimer > 12 && introTimer <= 16) {
					clearText();
					gibberish = new FlxText(0, 30, FlxG.width, "Where am I?");
					gibberish.size = 32;
					gibberish.alignment = "center";
					add(gibberish);
				}
				else {
					clearText();
					state = "viewRoom";
					backgroundNeedsToLoad = true;
					introTimer = 0;
				}
			}
			
			else if (state == "viewRoom") {
				remove(skipIntro);
				loadBackground(AssetsRegistry.introSurroundingRoom);
				add(skipIntro);
				if (FlxG.mouse.justPressed() )	{
					backgroundNeedsToLoad = true;
					state = "mouseScreen";
				}
			}
			
			else if (state == "mouseScreen") {
				remove(skipIntro);
				loadBackground(AssetsRegistry.introMouseScreen);
				add(skipIntro);
				if (FlxG.mouse.justPressed() )	{
					backgroundNeedsToLoad = true;
					state = "surroundingScreen";
				}
			}
			
			else if (state == "surroundingScreen") {			
				remove(skipIntro);
				loadBackground(AssetsRegistry.introSurroundingScreen);		
				add(skipIntro);
				if (FlxG.mouse.justPressed() )	{
					backgroundNeedsToLoad = true;
					state = "journalScreen";
				}
			}
			
			else if (state == "journalScreen") {
				remove(skipIntro);
				loadBackground(AssetsRegistry.introJournalScreen);				
				add(skipIntro);
				if (FlxG.mouse.justPressed() )	{
					state = null;
					FlxG.switchState(new MainMenuState());
				}
			}

			if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, skipIntro)) {
				skipIntro.loadGraphic(AssetsRegistry.skipIntroBtnHoverImg);
			} else {
				skipIntro.loadGraphic(AssetsRegistry.skipIntroBtnImg);
			}

			if (FlxG.mouse.justPressed()) {
				if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, skipIntro)) {
					state = null;
					FlxG.switchState(new MainMenuState());
				}
			}
		}
	}
}
