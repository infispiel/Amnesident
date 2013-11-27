package
{
    import org.flixel.*;
	import flash.utils.setTimeout;
	import org.flixel.plugin.photonstorm.*;
	
    public class Item extends FlxSprite
    {
		public var isSeen:Boolean;
		public var belongsTo:Token;
		public var slots:int;
		public var sound:Class;
		//represents the text to be displayed when the item is clicked.
		public var itemText:String;
		
		public function Item(sprite: Class, width: int, height: int, text: String, sound: Class = null):void
		{
			loadGraphic(sprite, true, true, width, height);
			addAnimation("idle", [0]);
			isSeen = false;
			this.itemText = text;
			this.sound = sound;

			slots = Math.ceil(width / Amnesident.slotSize);
		}
		
		public function setToken(token:Token):void {
			belongsTo = token;
		}
				
		//Returns true if the item was just clicked.
		public function justClicked():Boolean
		{
			if (FlxG.mouse.justReleased()) {
				if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, this)){
					return true;
				}
			}
			return false;
		}
		
		//Edit this to determine what happens when the item is clicked.
		public function onClick(): String
		{
		    this.isSeen = true;	
		    trace(this.isSeen);
			// Play Music
			FlxG.play(this.sound);
		    return this.itemText;	
		}
		
	}
}
