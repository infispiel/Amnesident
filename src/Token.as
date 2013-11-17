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
			trace(endDynamicText);
			completedText = _completedText;
			isCompleted = false;
			incompatibleWith = new Array();
			requires = new Array();
			// set Token for each item
			for each (var i:Item in path) {
			    i.setToken(this);
			}
			trace("Token initialized");

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
				    //trace(i.isSeen);
				    //trace(i.itemText);
				    completed = false;
				}
			}
			if (completed) {
				tokenCompleted();
				Story.markCompleted(this);
				Story.chooseNewToken();
			}
			return completed;
		}
		
		public function checkPrereqsComplete():Boolean {
			var completed:Boolean = true;
			for each (var t:Token in requires) {
				if (!t.isCompleted) {
				    //trace(i.isSeen);
				    //trace(i.itemText);
				    completed = false;
				}
			} 
			for each (var incompat:Token in incompatibleWith){
			    if (Story.wantToCompleteTokens.indexOf(incompat) != -1 && Story.completedTokens.indexOf(incompat) != -1){
				completed = false;
			    }
			}
			if (completed && Story.possibleTokens.indexOf(this) == -1 && Story.wantToCompleteTokens.indexOf(this) == -1 && Story.completedTokens.indexOf(this) == -1) {
				Story.possibleTokens.push(this);
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
