package 
{
	import org.flixel.*;
	public class Hallway extends FlxState {
		public static var doorImage:Class;
		public static var roomCount:Number;
		public var currentRoom:Number;
		public var doors:Array = new Array();
	
		public function Hallway(door:Class, count:int, startingRoom:Number) {
			doorImage = door;
			roomCount = count;
			currentRoom = startingRoom;
		}
		
		override public function create():void {
			//Set the background color to light gray (0xAARRGGBB)
			//FlxG.bgColor = 0xffaaaaaa;
			//Create Tiled Background
			var hallwayBackground:Background = new Background(Amnesident.blueTiles);
			add(hallwayBackground);
			for (var i:int = 0; i < 5; i++) {
				var space:Number = 127 * 1.25;
				var door:Door = new Door(10 + i * space, FlxG.height - 236, doorImage, 0);
				doors.push(door);
				add(door);
			}
		}
		
		override public function update():void	{
			for (var doorNum:int = 0; doorNum < doors.length; doorNum++) {
				//Check If Door Just Clicked, If So Load a Random Room
				if (doors[doorNum].justClicked()) {
					var room:Room = new Room();
					FlxG.switchState(room.level1);
				}
			}
		}
	}
}
