package
{
    import org.flixel.*;
    import org.flixel.plugin.photonstorm.*;

    public class Elevator extends IndestructableFlxState {
		private var timer:Number;

	    public function Elevator(){
			var elevBG:Background = new Background(AssetsRegistry.elevatorInner);
			add(elevBG);
			timer = 0;
	    }
		
	    override public function update():void {
			super.update();

			if (timer == 0) {
				FlxG.flash(0xff000000, 1);
			} else if (timer > 1.5) {
				FlxG.fade(0xff000000, 1, hallway);
			}

			timer += FlxG.elapsed;
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
			}
			else {
				nextDoor = AssetsRegistry.door2Pic;
				nextElevator = AssetsRegistry.woodElevatorImg;
			}
			
			Registry.halls[nextHall] = new Hallway(nextDoor, nextElevator, nextBg, 5, 0);
			Registry.halls[nextHall].isTileType = isTile;
			Registry.currentHall = nextHall;
			FlxG.switchState(Registry.halls[Registry.currentHall]);
		}
	}
}
