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
		
		private var spriteW:Class;
		private var spriteM:Class;
		
		public function Item(spriteMetal: Class, spriteWooden: Class, width: int, height: int, text: String, sound: Class = null):void
		{
			this.spriteM = spriteMetal;
			this.spriteW = spriteWooden;
			//default is metal image
			loadGraphic(spriteMetal, true, true, width, height);
			addAnimation("idle", [0]);
			isSeen = false;
			this.itemText = text;
			this.sound = sound;

			slots = Math.ceil(width / Amnesident.slotSize);
		}
		
		public function setImage(isTileType:Boolean):void {
			if (!isTileType && spriteW != null) {
				loadGraphic(spriteW, true, true, this.width, this.height);
			}
			else {
				loadGraphic(spriteM, true, true, this.width, this.height);
			}
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
			// Play Music
			FlxG.play(this.sound);
		    return this.itemText;	
		}
		
	}
}
