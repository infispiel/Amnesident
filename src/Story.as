package  
{
	/**
	 * ...
	 * @author Chau
	 */
	import org.flixel.*;
	public class Story 
	{
		[Embed(source = 'graybox.png')] public static var grayBox:Class;
		public var discoverPresident:Token;
		public var howLong:Token;
		public var tokens:Array;
		public var items:Array;
		public var item1:Item;
		public var item2:Item;
		public var item3:Item;
		public var item4:Item;
		
		public var currentLevel:Level;
		public function Story() 
		{
			item1 = new Item(grayBox, 32, 32);
			item2 = new Item(grayBox, 32, 32);
			item3 = new Item(grayBox, 32, 32);
			item4 = new Item(grayBox, 32, 32);
			
			discoverPresident = new Token("I am the President", new Array(item1), new Array(item2));
			howLong = new Token("It's been a while", new Array(item3), new Array(item4));
			trace("Story initialized");
			
		}
		public function setLevel(level:Level):void {
			currentLevel = level;
		}
		
	}

}