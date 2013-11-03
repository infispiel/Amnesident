package
{
    import org.flixel.*;

    public class Item extends FlxSprite
    {
		public var isSeen:Boolean;
		public var belongsTo:Token;

		public function Item(sprite: Class, width: int, height: int):void
		{
			loadGraphic (sprite, true, true, width, height);
			addAnimation("idle", [0]);
			isSeen = false;
			trace("item initialized");
		}
		public function setToken(token:Token):void {
			belongsTo = token;
			trace("item sets token");
		}
		
    }
}
