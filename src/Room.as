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

		public function enter() {
			if (level == null) {
				level = new Level(Amnesident.story.unseenTokens());
			}

			FlxG.switchState(level);
		}
	}
}
