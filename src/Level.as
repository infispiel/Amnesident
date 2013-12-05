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
		public var itemText:FlxText;
		public var tokenText:FlxText;
		
		public var createdBefore:Boolean;

		private var endGameBtn:FlxSprite;
		private var hallBtn:FlxSprite;
		private var journalBtn:FlxSprite;
		private var completionTextBg:FlxSprite;
		private var textOverlay:Boolean;
		public function Level(itemlist:Array)
		{
			var roomBackground:Background;

			var roomBgType:int = Math.floor(Math.random() * 2);
			if (Registry.halls[Registry.currentHall].isTileType) {
				if(roomBgType == 0){
					roomBackground = new Background(AssetsRegistry.greenTiles);
				}
				else {
					roomBackground = new Background(AssetsRegistry.blueTiles);
				}
			} else {
				if(roomBgType == 0){
					roomBackground = new Background(AssetsRegistry.woodTiles);
				}
				else if (roomBgType == 1) {
					roomBackground = new Background(AssetsRegistry.brickTiles);
				}
			}
			add(roomBackground);

			originalItemsList = itemlist;
			items = chooseRandomItems(itemlist);
			textOverlay = false;

			for (var ii:int = 0; ii < items.length; ii ++){
				if (items[ii] != null) {
					items[ii].x = Amnesident.slotSize * ii
					//Amnesident.interfaceSize accounts for the UI space.
					if (Registry.halls[Registry.currentHall].isTileType) {
						items[ii].setImage(true);
					}else {
						items[ii].setImage(false);
					}
					items[ii].y = FlxG.height - Amnesident.interfaceSize + 5 - items[ii].height;
					add(items[ii]);
				}
			}

			buildUi();
		}

		private function buildUi():void {
			hallBtn = new FlxSprite(20, 4, AssetsRegistry.hallwayBtnImg);
			add(hallBtn);

			journalBtn = new FlxSprite(150, 4, AssetsRegistry.journalBtnImg);
			add(journalBtn);

			endGameBtn = new FlxSprite(610, 10, AssetsRegistry.endGameBtnImg);
			add(endGameBtn);

			completionTextBg = new FlxSprite(0, Amnesident.interfaceSize+1, AssetsRegistry.tokenCompletionBox);
		}

		private function endGame():void {
			var end:EndGame = new EndGame();
			end.addSummaries(Story.wantToCompleteTokens, Story.completedTokens);
			FlxG.switchState(end);
		}

		private function hallway():void {
			FlxG.switchState(Registry.halls[Registry.currentHall]);
		}

		private function journal():void {
			Amnesident.story.pingJournal = false;
			textOverlay = false;

			var journalScrn:Journal = new Journal(this);
			journalScrn.addSummaries(Story.wantToCompleteTokens, Story.completedTokens);
			FlxG.switchState(journalScrn);
		}

		override public function create():void {
			FlxG.play(AssetsRegistry.sfxStep1);
		}

		public function chooseRandomItems(itemlist:Array):Array
		{
			//minimum number of items is 1
			var numItems:int = Math.floor(Math.random() * 4) + 1;
			trace(numItems);
			
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
				// while (!done && attempts < maxAttempts) {
				// 	attempts++;

				//TODO make this not pick repeats
				idx = Math.floor(Math.random() * itemlist.length);
				itm = itemlist[idx];

				// 	for (var i:int = 0; i < resultingItems.length; i++) {
				// 		if (itm == resultingItems[i]) {
				// 			done = true;
				// 			break;
				// 		}
				// 	}
				// }

				fittable = false;

				gap = 0;
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

				trace("tarslot: " + tarSlot);
				trace("itm: " + itm.itemText);
				resultingItems[tarSlot] = itm;
				placed++;
			}

			return resultingItems;
		}
		
		override public function update():void
		{
			if (FlxG.mouse.justReleased()) {
				remove(itemText);
				itemText = new FlxText(30, FlxG.height - Amnesident.interfaceSize + 5, FlxG.width - 60, "");
				itemText.setFormat(null, 13, 0xfffffff, "left");
				add(itemText);

				if (textOverlay) {
					remove(completionTextBg);
					remove(tokenText);
				}
				if (Amnesident.story.gameCompleted) {
					var end:EndGame = new EndGame()
					end.addSummaries(Story.wantToCompleteTokens, Story.completedTokens);
					FlxG.switchState(end);

				}
			}

			super.update();

			Amnesident.checkMouseHover(items);
			
			if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, hallBtn)) {
				hallBtn.loadGraphic(AssetsRegistry.hallwayBtnImgHover);
			} else {
				hallBtn.loadGraphic(AssetsRegistry.hallwayBtnImg);
			}

			if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, journalBtn)) {
				if (Amnesident.story.pingJournal) {
					journalBtn.loadGraphic(AssetsRegistry.highlightJournalBtnHover);
				} else {
					journalBtn.loadGraphic(AssetsRegistry.journalBtnImgHover);
				}
			} else {
				if (Amnesident.story.pingJournal) {
					journalBtn.loadGraphic(AssetsRegistry.highlightJournalBtn);
				} else {
					journalBtn.loadGraphic(AssetsRegistry.journalBtnImg);
				}
			}

			if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, endGameBtn)) {
				endGameBtn.loadGraphic(AssetsRegistry.endGameBtnImgHover);
			} else {
				endGameBtn.loadGraphic(AssetsRegistry.endGameBtnImg);
			}

			if (FlxG.mouse.justReleased()) {
				if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, hallBtn)) {
					hallway();
				} else if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, journalBtn)) {
					journal();
				} else if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, endGameBtn)) {
					endGame();
				}
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
			    if (t.checkComplete()) {
					textOverlay = true;
					add(completionTextBg);
					remove(tokenText);
					tokenText = new FlxText(30, Amnesident.interfaceSize + 45, FlxG.width - 60, t.completedText);
					tokenText.setFormat(null, 13, 0x0000000, "left");
					add(tokenText);
				}
			}			
			add(itemText);
		}
    }
}
