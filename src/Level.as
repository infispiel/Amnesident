package  
{
	import org.flixel.*;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	public class Level extends FlxState 
	{
		
		public var title:FlxText;
		
		public function Level() 
		{
			title = new FlxText(300, 0, 100, "Level");
			add(title);
		}
	}
}
