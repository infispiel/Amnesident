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
	public class EndGame extends FlxState
	{
		public var title:FlxText;
		public var lineNumber:int = 0;
		public var newStoryBtn:FlxSprite;
		public var journalBG:FlxSprite;
		
		public function EndGame() 
		{

			title = new FlxText(250, 20, 300, "End of Game");
			title.size = 32;
			title.alignment = "center";
			add(title);	
			
			
			
			journalBG = new FlxSprite(0, 80, AssetsRegistry.journalBGImg);
			add(journalBG);

			newStoryBtn = new FlxSprite(350, 500, AssetsRegistry.newStoryBtnImg);
			add(newStoryBtn);
		}
		
		/**
		 * add Summary receives static text and dynamic text
		 */
		public function addSummary(stat:String, dyn:String):void {
			
			var staticText:FlxText = new FlxText(20, 110+23 + 38 * lineNumber, 350, stat);
			staticText.setFormat(null, 18, 0x000000, "right")

			var dynamicText:FlxText = new FlxText(400, 110+18 + 38 * lineNumber, 400, dyn);
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
			}
			for each (tok in progress) {
				addSummary(tok.endStaticText, "");
			}
		}

		override public function update():void {
			FlxG.mouse.show(AssetsRegistry.normalCursor);

			if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, newStoryBtn)) {
				newStoryBtn.loadGraphic(AssetsRegistry.newStoryBtnImgHover);
			} else {
				newStoryBtn.loadGraphic(AssetsRegistry.newStoryBtnImg);
			}
			if (FlxG.mouse.justReleased()) {
				if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, newStoryBtn)) {
					trace("New story");
					FlxG.music.fadeOut(1);
					FlxG.switchState(new MainMenuState());
					// MainMenuState.startPlay();
				}
			}			
			
		}
	}
}
