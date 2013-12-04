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
		public var completedTokens:Array = new Array();
		public var wantToCompleteTokens:Array = new Array();
		public var possibleTokens:Array = new Array();

		public var items:Array;
		public var item1:Item;
		public var item2:Item;
		public var item3:Item;
		public var item4:Item;
		public var currentLevel:Level;
		public var pingJournal:Boolean = false;

		public function Story(itemList:Array, tokenList:Array)
		{
			pingJournal = false;

			items = itemList;
			tokens = tokenList;	
			possibleTokens = tokenList.concat();
			for each (var t:Token in possibleTokens){
			    // tokens with prereqs aren't immediately possible
			    if (t.requires.length > 0){
				possibleTokens.splice(possibleTokens.indexOf(t), 1);
			    }
			}
			wantToCompleteTokens = new Array();
			completedTokens = new Array();
			chooseNewToken();
			chooseNewToken();
			trace("Story initialized");
		}

		public function setLevel(level:Level):void {
			currentLevel = level;
		}

		public function markCompleted(token:Token):void {
			pingJournal = true;
			trace("completing token: "+token.completedText);
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
				trace(token.completedText);
			}

		}

		// Chooses a token from the list of possible tokens and moves 
		// it to wantToCompleteTokens.
		public function chooseNewToken():void {
		    if (possibleTokens.length != 0){
				var tokenNumber:int = Math.floor(Math.random()*possibleTokens.length);
				var selected:Array = possibleTokens.splice(tokenNumber, 1);
				trace('selected '+selected[0].endDynamicText);
				wantToCompleteTokens = wantToCompleteTokens.concat(selected);
		        // all tokens incompatible with the chosen one are no longer possible
				for each (var t:Token in selected[0].incompatibleWith){
					possibleTokens.splice(possibleTokens.indexOf(t), 1);
				}
		    }
		}
		
		
		// loop through a list of tokens, return list of items player has not already seen
		public function unseenTokens():Array {
			var desiredItems:Array = new Array();

			for each (var tok:Token in wantToCompleteTokens) {
				desiredItems = desiredItems.concat(tok.unseenItems());
			}

			return desiredItems;
		}

		public function getCompletedTokens():Array {
			return this.completedTokens;
		}
		public function getWantToCompleteTokens():Array{
			return this.wantToCompleteTokens;
		}
		public function getPossibleTokens():Array {
			return this.possibleTokens;
		}
	}
		

}
