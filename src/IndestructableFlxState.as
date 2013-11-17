package  
{
	import org.flixel.FlxState;
	
	/**
	 * ...
	 * @author Benjamin Shaibu
	 */
	public class IndestructableFlxState extends FlxState 
	{
		
		public function IndestructableFlxState() 
		{
			super();
		}
		
		public override function destroy():void	{
			trace("nope!");
		}
	}

}