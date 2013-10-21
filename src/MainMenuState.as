package  
{
	import org.flixel.*;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	public class MainMenuState extends FlxState 
	{
		
		public var title:FlxText;
		
		public function MainMenuState() 
		{
			title = new FlxText(300, 0, 100, "Amnesident!!");
			add(title);
		}
		
	}

}