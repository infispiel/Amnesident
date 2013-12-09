package 
{
	import org.flixel.FlxG;

	public class Room	{
		private var level:Level;
		public var story:Story;	
	
		//Randomly Generates A Room
		public function Room() {
			level = null;
		}		

		public function enter(fadeIn:Boolean):void {
			if (level == null) {
				level = new Level(Amnesident.story.unseenTokens(), Tokens.ordinaryItems, fadeIn);
			}
			FlxG.play(AssetsRegistry.sfxopendoor);
			FlxG.switchState(level);
		}
	}
}
