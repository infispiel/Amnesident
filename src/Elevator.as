package
{
        import org.flixel.*;
        import org.flixel.plugin.photonstorm.*;

        public class Elevator extends IndestructableFlxState {
	    public function Elevator(){
		var elevBG:Background = new Background(AssetsRegistry.elevatorInner);
		add(elevBG);
	    }
	
	    override public function update():void {
		FlxG.fade(0xff000000, 1, hallway);
	    }
		private function hallway():void {
			var hallType:int = Math.floor(Math.random() * 4);
			var nextHall:int = Registry.currentHall ^ 1;
			var nextBg:Class;
			var nextDoor:Class;
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
			}
			else {
				nextDoor = AssetsRegistry.door2Pic;
			}
			
			Registry.halls[nextHall] = new Hallway(nextDoor, nextBg, 5, 0);
			Registry.halls[nextHall].isTileType = isTile;
			Registry.currentHall = nextHall;
			FlxG.switchState(Registry.halls[Registry.currentHall]);
		}
	}
}
