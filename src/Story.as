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
			possibleTokens = tokenList;
			for each (var t:Token in possibleTokens){
			    // tokens with prereqs aren't immediately possible
			    if (t.requires.length > 0){
				possibleTokens.splice(possibleTokens.indexOf(t), 1);
			    }
			}
			wantToCompleteTokens = new Array();
			completedTokens = new Array();
			chooseNewToken();
			trace(wantToCompleteTokens);
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
		public static function chooseNewToken():void {
		    if (possibleTokens.length != 0){
			var tokenNumber:int = Math.floor(Math.random()*possibleTokens.length);
			trace(tokenNumber);
			var selected:Array = possibleTokens.splice(tokenNumber, 1);
			trace('selected'+selected[0].endDynamicText);
			wantToCompleteTokens = wantToCompleteTokens.concat(selected);
			trace(wantToCompleteTokens);
		        // all tokens incompatible with the chosen one are no longer possible
			trace('choose new');
			trace(selected[0].incompatibleWith.length);
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
