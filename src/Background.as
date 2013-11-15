package 
{
    import org.flixel.*;
	
	public class Background extends FlxSprite {
		public function Background(Image:Class) {
			super();
			loadGraphic(Image, false);
			solid = false;
			//Note, for some reason the flash player's 0,0 is not at the top left? There is some offset...
			this.x = 2;
			this.y = 40;
			
			this.scale.x = (FlxG.width/this.width);
			this.scale.y = (FlxG.height/this.height);
		}
	}
}