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
	public class Journal extends FlxState
	{
		public var title:FlxText;
		public var lineNumber:int = 0;
		public var prevScreen:FlxState;
		
		public function Journal(prevScrn:FlxState)
		{
			prevScreen = prevScrn;

			title = new FlxText(200, 180, 300, "Journal");
			title.size = 32;
			add(title);			
		}
		
		/**
		 * add Summary receives static text and dynamic text
		 */
		public function addSummary(stat:String, dyn:String):void {
			
			var staticText:FlxText = new FlxText(25, 30 * lineNumber, 200, stat);
			staticText.setFormat(null, 13, 0xffffff, "right")

			var dynamicText:FlxText = new FlxText(250, 30 * lineNumber, 250, dyn);
			dynamicText.setFormat(null, 13, 0x000000, "center")
			
			var sprite:FlxSprite = new FlxSprite(250, 30*lineNumber);
			sprite.loadGraphic(AssetsRegistry.textbox, true, true, 250, 20);
			sprite.addAnimation("idle", [0]);
			
			add(sprite);
			add(staticText);
			add(dynamicText);
			lineNumber += 1;
			trace(lineNumber);
			
		}
		// get list of tokens and addSummary for each of them
		public function addSummaries(progress:Array, complete:Array):void {
			var tok:Token;
			for each (tok in progress) {
				addSummary(tok.endStaticText, "");
				//addSummary(tok.completedText, "No dynamic text yet");
			}
			for each (tok in complete) {
				addSummary(tok.endStaticText, tok.endDynamicText);
				//addSummary(tok.completedText, "No dynamic text yet");
			}
		}

		override public function update():void
		{
			if (FlxG.keys.ESCAPE) {
				FlxG.switchState(prevScreen);
				// FlxG.switchState(Registry.halls[Registry.currentHall]);
			}
		}
	}
}
