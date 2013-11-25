package  
{
	/**
	 * ...
	 * @author Benjamin Shaibu
	 */
	public class Registry	{
		
		public var visitedRoomCount:Number = 0;
		public static var currentRoom:int = 0;	
		public static var hospitalHallway:Hallway = new Hallway(AssetsRegistry.doorPic, 5, 0);
		public function Registry()	{
			
		}
		
	}

}