package  
{
	import org.flixel.FlxState;
	
	/**
	 * ...
	 * @author Benjamin Shaibu
	 */
	//Extends a FlxState, but prevents it from being destroyed during FlxG.switchState()	
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