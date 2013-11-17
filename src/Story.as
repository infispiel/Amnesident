package  
{
	/**
	 * ...
	 * @author Chau
	 */
	import org.flixel.*;
	public class Story 
	{
		public static var tokens:Array;
		public static var completedTokens:Array;
		public static var wantToCompleteTokens:Array;
		public static var possibleTokens:Array;

		public var items:Array;
		
		public var discoverPresident:Token;
		public var howLong:Token;
		public var item1:Item;
		public var item2:Item;
		public var item3:Item;
		public var item4:Item;
		
		public var currentLevel:Level;
		public function Story(itemList:Array, tokenList:Array) 
		{
		
			items = itemList;
			tokens = tokenList;	
			trace("Story initialized");
			
		}
		public function setLevel(level:Level):void {
			currentLevel = level;
		}

		public static function markCompleted(token:Token):void {
			if (wantToCompleteTokens.indexOf(token) != -1){
			    // remove from wantToCompleteTokens
			    wantToCompleteTokens.splice(wantToCompleteTokens.indexOf(token), 1);
			}
			if (possibleTokens.indexOf(token) != -1){
			    // remove from wantToCompleteTokens
			    possibleTokens.splice(possibleTokens.indexOf(token), 1);
			}
	
			if (completedTokens.indexOf(token) == -1){
			    completedTokens.push(token);
			}
		}

		// Chooses a token from the list of possible tokens and moves 
		// it to wantToCompleteTokens.
		public function chooseNewToken():void {
		    if (possibleTokens.length != 0){
			var tokenNumber:int = Math.round(Math.random()*possibleTokens.length);
			var selected:Array = possibleTokens.splice(tokenNumber, 1);
			wantToCompleteTokens = wantToCompleteTokens.concat(selected);
		        // all tokens incompatible with the chosen one are no longer possible
			for each (var t:Token in selected[0].incompatibleWith){
			    possibleTokens.splice(possibleTokens.indexOf(t), 1);
			}	
		    }
		}
		
		
		// loop through a list of tokens, return list of items player has not already seen
		public function unseenTokens(tokens:Array):Array {
			var incompleteTokens:Array = new Array();
			for each (var tok:Token in tokens) {
				if (!tok.checkComplete()) {
					incompleteTokens.push(tok);
				}
			}
			
			for each (var toke:Token in incompleteTokens) {
				incompleteTokens.push(toke.unseenItems);
			}
			return incompleteTokens;
		}		
	}

}