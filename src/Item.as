package
{
    import org.flixel.*;

    public class Item extends FlxSprite
    {
		public function Item(sprite: Class, width: int, height: int):void
		{
			loadGraphic (sprite, true, true, width, height);
			addAnimation("idle", [0]);
		}
    }
}
