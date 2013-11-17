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
			//Does not destroy the state
		}
		
		//In case a state needs to actually be removed, we can call destroy on it
		public function reallyDestroy():void {
			super.destroy();
		}
	}

}