package 
{
    import org.flixel.*;
	/**
	 * ...
	 * @author Benjamin Shaibu
	 */
	public class Background extends FlxSprite {
		public function Background(Image:Class) {
			super();
			loadGraphic(Image, false);
			solid = false;
		}
	}
}