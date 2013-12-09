package 
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class Hallway extends IndestructableFlxState {
		public static var doorImage:Class;
		public static var roomCount:Number;
		//boolean which dictates what kind of hallway this is. (true for tiles, false for wood/brick).
		public var isTileType:Boolean = true;
		public var currentRoom:Number;
		public var doors:Array = new Array();
		public var rooms:Array = new Array();
		public var createdBefore:Boolean = false;
	
		private var endGameBtn:FlxSprite;
		// private var hallBtn:FlxSprite;
		private var journalBtn:FlxSprite;
		private var elevator:Door;
		private var enteringElevator:Boolean;
		private var startedFade:Boolean;

		public function Hallway(doorImg:Class, elevatorImg:Class, bgImg:Class, count:int, startingRoom:Number) {
			doorImage = doorImg;
			roomCount = count;
			currentRoom = startingRoom;	

			var i:int = 0;
			if (!createdBefore) {
				var hallwayBackground:Background = new Background(bgImg);
				add(hallwayBackground);
				for (i = 0; i < roomCount; i++) {
					var space:Number = 127 * 1.15;
					var door:Door = new Door(10 + i * space, FlxG.height - 236 - Amnesident.interfaceSize + 5, doorImage, "door");
					var room:Room = new Room();
					doors.push(door);
					rooms.push(room);
					add(door);
				}

				elevator = new Door(590, FlxG.height - 321 - Amnesident.interfaceSize + 5, elevatorImg, "elevator");
				add(elevator);

				doors.push(elevator);

				createdBefore = true;
			}
			else {
				for (i = 0; i < roomCount; i++) {
					add(doors[i]);
				}
			}

			enteringElevator = false;
			startedFade = false;

			buildUi();
		}
		
		override public function create():void {
		}
		
		private function buildUi():void {
			// hallBtn = new FlxSprite(20, 4, AssetsRegistry.hallwayBtnImg);
			// add(hallBtn);

			journalBtn = new FlxSprite(20, 4, AssetsRegistry.journalBtnImg);
			add(journalBtn);

			endGameBtn = new FlxSprite(610, 10, AssetsRegistry.endGameBtnImg);
			add(endGameBtn);
		}

		private function endGame():void {
			var end:EndGame = new EndGame();
			end.addSummaries(Amnesident.story.getWantToCompleteTokens(), Amnesident.story.getCompletedTokens());
			FlxG.switchState(end);
			return;
		}

		private function enterElevator():void {
			var elevatorEnter:Elevator = new Elevator();
			FlxG.switchState(elevatorEnter);
		}

		private function hallway():void {
			var hallType:int = Math.floor(Math.random() * 4);
			var nextHall:int = Registry.currentHall ^ 1;
			var nextBg:Class;
			var nextDoor:Class;
			var nextElevator:Class;
			var isTile:Boolean = true;
			if (hallType == 0) {
				nextBg = AssetsRegistry.greenTiles;
			} else if (hallType == 1){
				nextBg = AssetsRegistry.blueTiles;
			} else if (hallType == 2) {
				isTile = false;
				nextBg = AssetsRegistry.woodTiles;
			} else {
				isTile = false;
				nextBg = AssetsRegistry.brickTiles;
			}
			
			if (isTile) {
				nextDoor = AssetsRegistry.doorPic;
				nextElevator = AssetsRegistry.elevatorImg;
			} else {
				nextDoor = AssetsRegistry.door2Pic;
				nextElevator = AssetsRegistry.woodElevatorImg;
			}
			
			Registry.halls[nextHall] = new Hallway(nextDoor, nextElevator, nextBg, 4, 0);
			Registry.halls[nextHall].isTileType = isTile;
			Registry.currentHall = nextHall;
			FlxG.switchState(Registry.halls[Registry.currentHall]);
		}

		private function journal():void {
			Amnesident.story.pingJournal = false;

			var journalScrn:Journal = new Journal(this);
			journalScrn.addSummaries(Amnesident.story.getWantToCompleteTokens(), Amnesident.story.getCompletedTokens());
			FlxG.switchState(journalScrn);
			return;
		}

		override public function update():void	{
			super.update();

			if (enteringElevator) {
				if (!startedFade) {
					FlxG.fade(0xff000000, 1, enterElevator);
					startedFade = false;
				}

				return;
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
				// if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, hallBtn)) {
				// 	hallway();
				// } else 
				if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, journalBtn)) {
					journal();
				} else if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, endGameBtn)) {
					endGame();
				}
			}

			Amnesident.checkMouseHover(doors);
			// switch to End Screen when press ESCAPE 
			for (var doorNum:int = 0; doorNum < doors.length; doorNum++) {
				//Check If Door Just Clicked, If So Load a Random Room
				if (doors[doorNum].justClicked()) {
					if (doors[doorNum].doorType == "door") {
						rooms[doorNum].enter(false);
					} else {
						enteringElevator = true;
						//hallway();
					}
					// FlxG.switchState(rooms[doorNum].level1);
				}
			}
		}
	}
}
