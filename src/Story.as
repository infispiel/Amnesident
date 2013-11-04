package  
{
	/**
	 * ...
	 * @author Chau
	 */
	import org.flixel.*;
	public class Story 
	{
		public var tokens:Array;
		public var completedTokens:Array;
		public var wantToCompleteTokens:Array;

		public var items:Array;
		
		public var discoverPresident:Token;
		public var howLong:Token;
		public var item1:Item;
		public var item2:Item;
		public var item3:Item;
		public var item4:Item;
		
		public var currentLevel:Level;
		public function Story() 
		{
			item1 = new Item(Amnesident.grayBox, 32, 32, "item1");
			item2 = new Item(Amnesident.grayBox, 32, 32, "item2");
			item3 = new Item(Amnesident.grayBox, 32, 32, "item3");
			item4 = new Item(Amnesident.grayBox, 32, 32, "item4");
			
			discoverPresident = new Token("I am the President", new Array(item1), new Array(item2));
			howLong = new Token("It's been a while", new Array(item3), new Array(item4));
			trace("Story initialized");
			
		}
		public function setLevel(level:Level):void {
			currentLevel = level;
		}

		public function markCompleted(token:Token):void {
			if (wantToCompleteTokens.indexOf(token) != -1){
			    // remove from wantToCompleteTokens
			    wantToCompleteTokens.splice(wantToCompleteTokens.indexOf(token), 1);
			}
			if (completedTokens.indexOf(token) == -1){
			    completedTokens.push(token);
			}
		}
		
	}

}
