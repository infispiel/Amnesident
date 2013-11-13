package
{
	import flash.display.Sprite;
    import org.flixel.*;
    import flash.ui.Mouse;
    import flash.ui.MouseCursor;
	
    public class Level extends FlxState
    {
		
		public var title:FlxText;
		public var items:Array;
		public var story:Story;
		public var itemText:FlxText;
		public var itemBox:FlxSprite;
		public var itemBox2:FlxSprite;
		public var itemBox3:FlxSprite;
		public var itemBox4:FlxSprite;
		public var itemBoxes:Array;
		public var numBoxes:int;

		[Embed(source = "/assets/art/textboxLevel.png")] public var textboxLevel:Class;
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
			
			itemBox = new FlxSprite(295, 25);	
			itemBox2 = new FlxSprite(295, 47);			
			itemBox3 = new FlxSprite(295, 69);	
			itemBox4 = new FlxSprite(295, 81);
			
			itemBoxes = [itemBox, itemBox2, itemBox3, itemBox4];
			for each (var itembox:FlxSprite in itemBoxes) {
				itembox.loadGraphic(textboxLevel, true, true, 300, 22);
				itembox.addAnimation("idle", [0]);
			}
			add(itemBox);
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
						for each (var sp:FlxSprite in itemBoxes) {
							remove(sp);
						}
						
						//item.onClick() will return a string and you can manage that string in the level state
						itemText = new FlxText(300, 30, 300, item.onClick());
						itemText.setFormat(null, 10, 0x0000000, "left");
												
						var textheight:int = itemText.height;
						trace("Height of text: " + textheight.toString());
						numBoxes = (int) ((textheight / 22) + 1);
						trace("Number of boxes used: " + numBoxes.toString());					
					}
				}
			}
			var num:int = 0;
			for each (var s:FlxSprite in itemBoxes) {
				if (num < numBoxes) { add(s);}
				num++;
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
		
		public function insertTextBox(text:FlxText):Array {
			// textboxLevel is 300x22
			var textheight:int = text.height;
			var numBoxes:int = 3; // (int) (textheight / 22);
			trace("Number of boxes used: " + numBoxes.toString());
			var sprites:Array = new Array();;
			var i:int;
			
			for (i = 0; i++; i < numBoxes + 3) {
				var sprite:FlxSprite = new FlxSprite(300, 22 * i);
				sprite.loadGraphic(textboxLevel, true, true, 300, 22);
				sprite.addAnimation("idle", [0]);				
				sprites.push(sprite);
			}
			
			trace("Size of sprites" + sprites.length.toString());
			return sprites;
		}
    }
}
