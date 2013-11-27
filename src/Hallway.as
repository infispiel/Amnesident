package 
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class Hallway extends IndestructableFlxState {
		public static var doorImage:Class;
		public static var roomCount:Number;
		public var currentRoom:Number;
		public var doors:Array = new Array();
		public var rooms:Array = new Array();
		public var createdBefore:Boolean = false;
	
		private var endGameBtn:FlxButtonPlus;
		private var hallwayBtn:FlxButtonPlus;
		private var journalBtn:FlxButtonPlus;

		public function Hallway(doorImg:Class, bgImg:Class, count:int, startingRoom:Number) {
			doorImage = doorImg;
			roomCount = count;
			currentRoom = startingRoom;	

			var i:int = 0;
			if (!createdBefore) {
				//Create Tiled Background
				var hallwayBackground:Background = new Background(bgImg);
				add(hallwayBackground);
				for (; i < roomCount; i++) {
					var space:Number = 127 * 1.25;
					var door:Door = new Door(10 + i * space, FlxG.height - 236 - Amnesident.interfaceSize, doorImage, 0);
					var room:Room = new Room();
					doors.push(door);
					rooms.push(room.level1);
					add(door);
				}
				createdBefore = true;
			}
			else {
				for (; i < roomCount; i++) {
					add(doors[i]);
				}
			}

			buildUi();
		}
		
		override public function create():void {
			FlxG.play(AssetsRegistry.sfxStep2);
		}
		
		private function buildUi():void {
			endGameBtn = new FlxButtonPlus(610, 10, endGame, null, null);
			var endGameImg:FlxSprite = new FlxSprite(610, 10, AssetsRegistry.endGameBtnImg);
			var endGameImgHover:FlxSprite = new FlxSprite(610, 10, AssetsRegistry.endGameBtnImgHover);
			endGameBtn.loadGraphic(endGameImg, endGameImgHover);
			endGameBtn.width = 181;
			endGameBtn.height = 50;
			add(endGameBtn);

			hallwayBtn = new FlxButtonPlus(20, 4, returnHallway, null, null);
			var hallwayImg:FlxSprite = new FlxSprite(20, 4, AssetsRegistry.hallwayBtnImg);
			var hallwayImgHover:FlxSprite = new FlxSprite(20, 4, AssetsRegistry.hallwayBtnImgHover);
			hallwayBtn.loadGraphic(hallwayImg, hallwayImgHover);
			hallwayBtn.width = 106;
			hallwayBtn.height = 64;
			add(hallwayBtn);

			journalBtn = new FlxButtonPlus(150, 4, journal, null, null);
			var journalImg:FlxSprite = new FlxSprite(150, 4, AssetsRegistry.journalBtnImg);
			var journalImgHover:FlxSprite = new FlxSprite(150, 4, AssetsRegistry.journalBtnImgHover);
			journalBtn.loadGraphic(journalImg, journalImgHover);
			journalBtn.width = 65;
			journalBtn.height = 63;
			add(journalBtn);
		}

		private function endGame():void {
			var end:EndGame = new EndGame();
			end.addSummaries(Story.completedTokens.concat(Story.wantToCompleteTokens));
			FlxG.switchState(end);
			return;
		}

		private function returnHallway():void {
			trace("hallway");
			// FlxG.switchState(Registry.hospitalHallway);
		}

		private function journal():void {
			trace("journal");
		}

		override public function update():void	{
			super.update();
			
			if (FlxG.keys.H) {
				var nextHall:int = Registry.currentHall ^ 1;
				var nextBg:Class;
				if (nextHall) {
					nextBg = AssetsRegistry.blueTiles;
				} else {
					nextBg = AssetsRegistry.greenTiles;
				}

				Registry.halls[nextHall] = new Hallway(AssetsRegistry.doorPic, nextBg, 5, 0);
				Registry.currentHall = nextHall;
				FlxG.switchState(Registry.halls[Registry.currentHall]);
			}

			Amnesident.checkMouseHover(doors);
			// switch to End Screen when press ESCAPE 
			if (FlxG.keys.ESCAPE) {
				var end:EndGame = new EndGame();
				end.addSummary("It has been ", "2 years");
				end.addSummary("The world", "has been destroyed");				
				FlxG.switchState(end);
			}
			else {
				for (var doorNum:int = 0; doorNum < doors.length; doorNum++) {
					//Check If Door Just Clicked, If So Load a Random Room
					if (doors[doorNum].justClicked()) {
						FlxG.switchState(rooms[doorNum]);
					}
				}
			}
		}
	}
}
