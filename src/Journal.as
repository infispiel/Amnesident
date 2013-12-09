package  
{
	/**
	 * ...
	 * @author Chau
	 */
	import flash.display.Sprite;
	import mx.core.FlexSprite;
	import mx.core.FlexTextField;
	import org.flixel.*;
	import flash.display.BitmapData;
	import org.flixel.plugin.photonstorm.*;
	public class Journal extends FlxState
	{
		public var title:FlxText;
		public var instruct:FlxText;
		public var lineNumber:int = 4;
		public var prevScreen:FlxState;
		public var hallBtn:FlxSprite;
		public var endGameBtn:FlxSprite;
		public var journalBG:FlxSprite;
		public function Journal(prevScrn:FlxState)
		{
			prevScreen = prevScrn;

			title = new FlxText(250, 20, 300, "Journal");
			title.size = 32;
			title.alignment = "center";
			add(title);			

		//	instruct = new FlxText(250, 500, 350, "Press Esc to return to game");
		//	instruct.size = 16;
		//	add(instruct);	
			buildUi();		
		}
		
		private function buildUi():void {
			hallBtn = new FlxSprite(20, 4, AssetsRegistry.hallwayBtnImg);
			add(hallBtn);

			endGameBtn = new FlxSprite(610, 10, AssetsRegistry.endGameBtnImg);
			add(endGameBtn);
			
			journalBG = new FlxSprite(0, 80, AssetsRegistry.journalBGImg);
			add(journalBG);

		}

		/**
		 * add Summary receives static text and dynamic text
		 */
		public function addSummary(stat:String, dyn:String):void {
			
			var staticText:FlxText = new FlxText(20, 23 + 38 * lineNumber, 350, stat);
			staticText.setFormat(null, 18, 0x000000, "right")

			var dynamicText:FlxText = new FlxText(400, 18 + 38 * lineNumber, 250, dyn);
			dynamicText.setFormat("Architects Daughter", 25, 0x000000, "left")
			
			//var sprite:FlxSprite = new FlxSprite(400, 30*lineNumber);
			//sprite.loadGraphic(AssetsRegistry.textbox, true, true, 250, 20);
			//sprite.addAnimation("idle", [0]);
			
			//add(sprite);
			add(staticText);
			add(dynamicText);
			lineNumber += 1;
			trace(lineNumber);
			
		}
		// get list of tokens and addSummary for each of them
		public function addSummaries(progress:Array, complete:Array):void {
			var tok:Token;
			for each (tok in complete) {
				addSummary(tok.endStaticText, tok.endDynamicText);
				//addSummary(tok.completedText, "No dynamic text yet");
			}
			for each (tok in progress) {
				addSummary(tok.endStaticText, "");
				//addSummary(tok.completedText, "No dynamic text yet");
			}
		}

		override public function update():void
		{
			if (FlxG.mouse.justReleased() && (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, hallBtn))) {
				FlxG.switchState(prevScreen);
				// FlxG.switchState(Registry.halls[Registry.currentHall]);
			}
			if (FlxG.mouse.justReleased() && (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, endGameBtn))) {
			var end:EndGame = new EndGame();
			end.addSummaries(Amnesident.story.wantToCompleteTokens, Amnesident.story.completedTokens);
			FlxG.switchState(end);
			}
			if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, hallBtn)) {
				hallBtn.loadGraphic(AssetsRegistry.hallwayBtnImgHover);
			} else {
				hallBtn.loadGraphic(AssetsRegistry.hallwayBtnImg);
			}
			if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, endGameBtn)) {
				endGameBtn.loadGraphic(AssetsRegistry.endGameBtnImgHover);
			} else {
				endGameBtn.loadGraphic(AssetsRegistry.endGameBtnImg);
			}


		}
	}
}
