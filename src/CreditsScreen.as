package 
{
	import org.flixel.*;

	public class CreditsScreen extends FlxState	{
		public var title:FlxText;
		
		public function CreditsScreen():void	{
			var textWidth:int = 300;
			title = new FlxText(FlxG.width/2 - textWidth/2, FlxG.height/12, textWidth, "Credits Screen");
			title.size = 32;
			title.alignment = "center";
			add(title);		
		} 
	}
	
}