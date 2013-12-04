package  
{
	/**
	 * ...
	 * @author Chau
	 */
	import mx.collections.*;
	import org.flixel.*;
	public class Token 
	{
		public var path:Array;
		public var completedText:String;
		public var endStaticText:String;
		public var endDynamicText:String;
		public var isCompleted:Boolean;
		public var requires:Array;
		public var incompatibleWith:Array;

		public function Token(_completedText: String, _endStaticText:String, _endDynamicText:String, _path: Array) 
		{
			path = _path;
			endStaticText = _endStaticText;
			endDynamicText = _endDynamicText;
			completedText = _completedText;
			isCompleted = false;
			incompatibleWith = new Array();
			requires = new Array();
			// set Token for each item
			for each (var i:Item in path) {
			    i.setToken(this);
			}

		}
	
		// This makes both tokens incompatible with each other,
		// So you only need to call it once per incompatible pair
		public function addIncompatible(t:Token):void{
		    incompatibleWith.push(t);
		    t.incompatibleWith.push(this);
		}
	
		public function addPrereq(t:Token):void{
		    requires.push(t);
		}	
		public function checkComplete():Boolean {
			var completed:Boolean = true;
			for each (var i:Item in path) {
				if (!i.isSeen) {
				    completed = false;
				}
			}
			if (completed) {
				tokenCompleted();
				Amnesident.story.markCompleted(this);
				if (Amnesident.story.getPossibleTokens().length != 0 || Amnesident.story.getWantToCompleteTokens().length != 0){
				    Amnesident.story.chooseNewToken();
			 	} else {
				    var end:EndGame = new EndGame();
			            end.addSummaries(Amnesident.story.getWantToCompleteTokens(), Amnesident.story.getCompletedTokens());
			            FlxG.switchState(end);
				}
			}
			return completed;
		}
		
		// return unseen items in current token
		public function unseenItems():Array {
			var unseenItems:Array = new Array();
			for each (var item:Item in path) {
				if (!item.isSeen) {
					unseenItems.push(item);
				}
			}
			return unseenItems;
		}
		public function checkPrereqsComplete():Boolean {
			var completed:Boolean = true;
			for each (var t:Token in requires) {
				if (!t.isCompleted) {
				    completed = false;
				}
			} 
			for each (var incompat:Token in incompatibleWith){
			    if (Amnesident.story.getWantToCompleteTokens().indexOf(incompat) != -1 && Amnesident.story.getCompletedTokens().indexOf(incompat) != -1){
				completed = false;
			    }
			}
			if (completed && Amnesident.story.getPossibleTokens().indexOf(this) == -1 && Amnesident.story.getWantToCompleteTokens().indexOf(this) == -1 && Amnesident.story.getCompletedTokens().indexOf(this) == -1) {
				Amnesident.story.getPossibleTokens().push(this);
			}
			return completed;
		}
		
		public function tokenCompleted():void {
			var message:FlxText = new FlxText(300, 0, 100, completedText);
			trace('completed token');
			trace(completedText);
			//add(message);
		}

	}

}
