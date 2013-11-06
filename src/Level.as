package
{
    import org.flixel.*;
    import flash.ui.Mouse;
    import flash.ui.MouseCursor;
	
    public class Level extends FlxState
    {
		
		public var title:FlxText;
		public var items:Array;
		public var story:Story;
		public var itemText:FlxText;
		
		public function chooseRandomItems(itemlist:Array):Array
		{
			//minimum number of items is 1
			var numItems:int = int(Math.random() * 4 + 1);
			
			var resultingItems:Array = new Array();
			var randomIndexes:Array = new Array();
			
			for (var i:Number = 0; i < numItems; i ++) {
				randomIndexes.push(int(Math.random() * itemlist.length) + 1);
			}
			
			
			for each (var index:int in randomIndexes) {
				resultingItems.push(itemlist[index]);
			}
			
			trace("number of items supposed to be on the screen :" + resultingItems.length);
			return resultingItems;
		}

		public function Level(itemlist:Array)
		{
			items = itemlist;
			items = chooseRandomItems(itemlist);

			if (items[0] != null) {
				items[0].x = 50;
				items[0].y = 480 - items[0].height;
				add(items[0]);
			}

			if (items[1] != null) {
				items[1].x = 210;
				items[1].y = 480 - items[1].height;
				add(items[1]);
			}

			if (items[2] != null) {
				items[2].x = 370;
				items[2].y = 480 - items[2].height;
				add(items[2]);
			}

			if (items[3] != null) {
				items[3].x = 530;
				items[3].y = 480 - items[3].height;
				add(items[3]);
			}

			title = new FlxText(300, 0, 100, "Level");
			itemText = new FlxText(300, 30, 500, "Try clicking on an item!");
			add(title);
			add(itemText);
		}
		
		override public function update():void
		{
			//runs onClick on each item that is clicked.
			for each (var item:Item in items) {
				if(item != null){
					if (item.justClicked()) {
						remove(itemText);
						//item.onClick() will return a string and you can manage that string in the level state
						itemText = new FlxText(300, 30, 300, item.onClick());
					}
				}
			}

			add(itemText);
			// switch to End Screen when press ESCAPE 
			if (FlxG.keys.ESCAPE) {
				var end:EndGame = new EndGame();
				end.addSummary("It has been ", "2 years");
				end.addSummary("The world", "has been destroyed");
				FlxG.switchState(end);
			}
		}
    }
}
