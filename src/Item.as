package
{
    import org.flixel.*;

    public class Item extends FlxSprite
    {
		public var isSeen:Boolean;
		public var belongsTo:Token;
		
		//represents the text to be displayed when the item is clicked.
		private var itemText:String;
		public function Item(sprite: Class, width: int, height: int, text: String):void
		{
			loadGraphic (sprite, true, true, width, height);
			addAnimation("idle", [0]);
			isSeen = false;
			this.itemText = text;
			trace("item initialized");
		}
		public function setToken(token:Token):void {
			belongsTo = token;
			trace("item sets token");
		}

				
		//Returns true if the item was just clicked.
		public function justClicked():Boolean
		{
			if (FlxG.mouse.justReleased()) {
				var mousePoint:FlxPoint = new FlxPoint(FlxG.mouse.x, FlxG.mouse.y);
				if (this.overlapsPoint(mousePoint)) {
					return true;
				}
			}
			
			return false;
		}
		
		//Edit this to determine what happens when the item is clicked.
		public function onClick(): String
		{
			return this.itemText;
		}
	}
}
