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
		public static var moldyYogurt:Item = new Item(Amnesident.moldyYogurtPic, 125, 119, "It's covered in mold! I'm going to have a word with room service....");
		public static var yogurt:Item = new Item(Amnesident.YogurtPic, 125, 119, "Whoever put this here must have known how much I love cucumber yogurt. How kind!");
		public static var bed:Item = new Item(Amnesident.bedPic, 307, 115, "I only woke up a few minutes ago, I'm not going back to sleep already!");
		public static var door:Item = new Item(Amnesident.doorPic, 127, 236, "The door is locked.");
		public static var cat:Item = new Item(Amnesident.mrCatPic, 127, 459, "Truly a magnificent work of art. It captures the beauty and feline grace of the animal perfectly.");
		public static var president:Item = new Item(Amnesident.mrPresidentPic, 127, 459, "What a handsome fellow! No wonder the public voted for him....");
		public static var bedNews:Item = new Item(Amnesident.bedWithnewsPic, 307, 115, "The headline reads: 'Is Craine Insane? President's erratic behavior mystifies family, staff.'");
		public static var mirror:Item = new Item(Amnesident.mirrorPic, 125, 200, "Now at least I know one thing about myself: I am ridiculously good-looking!");
			
		public static var itemList:Array = new Array(president, moldyYogurt, yogurt, bed, door, cat, bedNews, mirror);
		public static var discoverPresident:Token = new Token("Hey...I've seen that face before...I must be the President!", new Array(bedNews, president), new Array(mirror, president), new Array());
		// for now I'm just making both paths the same but I should make it so the second path can be null
                public static var longTime:Token = new Token("I must have been unconscious for a while....", new Array(moldyYogurt), new Array(moldyYogurt), new Array());

		public static var tokenList:Array = new Array(discoverPresident, longTime);
		public static var currentLevel:Level;
		public static var nextLevel:Level;
		public function Story(itemList:Array, tokenList:Array) 
		{
		
			items = itemList;
			tokens = tokenList;	
			trace("Story initialized");
			nextLevel = new Level(itemList);
			
		}
		public static function setLevel(level:Level):void {
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
	}

}
