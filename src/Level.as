package
{
	import flash.display.Sprite;
    import org.flixel.*;
    import flash.ui.Mouse;
    import flash.ui.MouseCursor;
	import org.flixel.system.FlxList;
	import org.flixel.plugin.photonstorm.*;
	
    public class Level extends IndestructableFlxState
    {
		
		public var originalItemsList:Array;
		public var items:Array;
		// public var story:Story;
		public var itemText:FlxText;
		
		public var createdBefore:Boolean;

		public function Level(itemlist:Array)
		{
			var roomBackground:Background = new Background(AssetsRegistry.greenTiles);
			add(roomBackground);
			
			originalItemsList = itemlist;
			
			items = chooseRandomItems(itemlist);
			
			for (var ii:int = 0; ii < items.length; ii ++){
				if (items[ii] != null) {
					items[ii].x = Amnesident.slotSize * ii
					//Amnesident.interfaceSize accounts for the UI space.
					items[ii].y = FlxG.height - Amnesident.interfaceSize - items[ii].height;
					add(items[ii]);
				}
			}
			
			var endGameBtn:FlxButton = new FlxButton(610, 4, "", endGame);
			endGameBtn.loadGraphic(AssetsRegistry.endGameBtnImg, false, false, 181, 50);
			endGameBtn.width = 181;
			endGameBtn.height = 50;
			add(endGameBtn);
		}
		
		private function endGame():void {
			var end:EndGame = new EndGame();
			end.addSummary("It has been ", "2 years");
			end.addSummary("The world", "has been destroyed");
			var toks:Array = new Array();
			var president:Item = new Item(AssetsRegistry.mrPresidentPic, 127, 459, "What a handsome fellow! No wonder the public voted for him....");
			var bedNews:Item = new Item(AssetsRegistry.bedWithnewsPic, 307, 115, "The headline reads: 'Is Craine Insane? President's erratic behavior mystifies family, staff.'");
			var discoverPresidentNews:Token = new Token("Hey...I've seen that face before...I must be the President!", "You are", "the President", new Array(bedNews, president));
			toks.push(discoverPresidentNews);
			end.addSummaries(toks);
			FlxG.switchState(end);
		}

		override public function create():void {
			FlxG.play(AssetsRegistry.sfxStep1);
		}

		public function chooseRandomItems(itemlist:Array):Array
		{
			//minimum number of items is 1
			var numItems:int = Math.floor(Math.random() * 4) + 1;
			
			var resultingItems:Array = new Array(null, null, null, null);
			var randomIndexes:Array = new Array();
			var space:Array = new Array(1, 1, 1, 1);
			var chosen:Array = new Array();

			var maxTries:int = 100;
			var numTries:int = 0;
			var placed:int = 0;

			while (placed < numItems && numTries < maxTries) {
				numTries++;

				var idx:int;
				var itm:Item;
				var gap:int = 0;
				var fittable:Boolean;

				var attempts:int = 0;
				var maxAttempts:int = 100;
				var done:Boolean = false;
				while (!done && attempts < maxAttempts) {
					attempts++;
					idx = Math.floor(Math.random() * itemlist.length);
					itm = itemlist[idx];

					for (var i:int = 0; i < resultingItems.length; i++) {
						if (itm == resultingItems[i]) {
							done = true;
							break;
						}
					}
				}

				if (attempts == maxAttempts) {
				}

				fittable = false;

				for (var j:int = 0; j < space.length; j++) {
					if (space[j]) {
						gap++;
						if (gap >= itm.slots) {
							fittable = true;
						}
					} else {
						gap = 0;
					}
				}

				if (!fittable) {
					continue;
				}

				var fit:int;
				var tarSlot:int;

				fit = 0;
				while (!fit) {
					tarSlot = Math.floor(Math.random() * 4)

					fit = 1;
					for (var indx:int = tarSlot;
						indx < tarSlot + itm.slots;
						indx++) {

						fit &= space[indx];
					}
				}

				for (var n:int = tarSlot;
					n < tarSlot + itm.slots;
					n++) {

					space[n] = 0;
				}

				resultingItems[tarSlot] = itm;
				placed++;
			}

			return resultingItems;
		}
		
		override public function update():void
		{
			Amnesident.checkMouseHover(items);
			
			if (FlxG.keys.G) {
				//var hospitalHallway:Hallway = new Hallway(AssetsRegistry.doorPic, 5, 0);
				FlxG.switchState(Registry.hospitalHallway);
			}
			
			//onClick() is called on each item that is clicked.
			for each (var item:Item in items) {
				if(item != null){
					if (item.justClicked()) {
						remove(itemText);
						//item.onClick() will return a string and you can manage that string in the level state
						itemText = new FlxText(30, FlxG.height - Amnesident.interfaceSize + 5, FlxG.width - 60, item.onClick());
						itemText.setFormat(null, 13, 0xfffffff, "left");
					}
				}
			}
			for each (var t:Token in Story.wantToCompleteTokens){
			    t.checkPrereqsComplete();
			    t.checkComplete();
			}			
			add(itemText);

			super.update();
		}
		
    }
}
