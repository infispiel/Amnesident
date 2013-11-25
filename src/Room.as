package 
{
	public class Room	{
		public var level1:Level;
		public var story:Story;	
	
		//Randomly Generates A Room
		public function Room() {
			//Associate Story with Level1
			
			level1 = new Level(Tokens.itemList);
		}		
	}
	
}
