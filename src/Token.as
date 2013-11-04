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
		public var path1:Array;
		public var path2:Array;
		public var completedText:String;
		public var isCompleted:Boolean;
		public function Token(_completedText: String, _path1: Array, _path2: Array) 
		{
			path1 = _path1;
			path2 = _path2;
			completedText = _completedText;
			isCompleted = false;
			// set Token for each item
			for each (var i:Item in path1) {
				i.setToken(this);
			}
			for each (var j:Item in path2) {
				j.setToken(this);
			}
			trace("Token initialized");

		}
		
		public function checkComplete():Boolean {
			// path1
			var completed1:Boolean = true;
			var completed2:Boolean = true;
			for each (var i:Item in path1) {
				if (!i.isSeen) {
					completed1 = false;
				}
			}
			// path2
			for each (var j:Item in path2) {
				if (!j.isSeen) {
					completed2 = false;
				}
			}
			if (completed1 || completed2) {
				tokenCompleted();
				Story.markCompleted(this);
//				trace(FlxG.state.story);
			}
			return completed1 || completed2;
		}
		
		
		public function tokenCompleted():void {
			var message:FlxText = new FlxText(300, 0, 100, completedText);
			//add(message);
		}
	}

}
