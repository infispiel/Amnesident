package 
{
	import org.flixel.*;
	public class Hallway extends IndestructableFlxState {
		public static var doorImage:Class;
		public static var roomCount:Number;
		public var currentRoom:Number;
		public var doors:Array = new Array();
		public var rooms:Array = new Array();
		public var createdBefore:Boolean = false;
	
		public function Hallway(door:Class, count:int, startingRoom:Number) {
			doorImage = door;
			roomCount = count;
			currentRoom = startingRoom;
		}
		
		override public function create():void {
			var i:int = 0;
			if (!createdBefore) {
				//Create Tiled Background
				var hallwayBackground:Background = new Background(AssetsRegistry.blueTiles);
				add(hallwayBackground);
				for (; i < roomCount; i++) {
					var space:Number = 127 * 1.25;
					var door:Door = new Door(10 + i * space, FlxG.height - 236, doorImage, 0);
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
		}
		
		override public function update():void	{
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
