package 
{
	import mx.core.FlexSprite;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class LegalScreen extends FlxState	{
		public var title:FlxText;
		public var backBtn:FlxSprite;
		public var engine:FlxText;
		public var engineurl:FlxText;
		public var plugin:FlxText;
		public var pluginurl:FlxText;
		public var music:FlxText;
		public var musicurl:FlxText;
		public var sound:FlxText;
		public var soundurl:FlxText;
		public var font:FlxText;
		public var fonturl:FlxText;

		public function LegalScreen():void	{
			var textWidth:int = 300;
			title = new FlxText(FlxG.width/2 - textWidth/2, FlxG.height/14, textWidth, "Legal Screen");
			title.size = 32;
			title.alignment = "center";
			backBtn = new FlxSprite(330, 500, AssetsRegistry.backBtnImg);
			add(backBtn);
			add(title);
			
		
			
			engine = new FlxText(50, 35 * 3, 250, "Flixel");
			engine.setFormat(null, 20, 0xffffff, "right");

			engineurl = new FlxText(350, 35 * 3, 400, "http://flixel.org/");
			engineurl.setFormat(null, 20, 0xffffff, "center");
			
			plugin = new FlxText(50, 35 * 5, 250, "Flixel Power Tools");
			plugin.setFormat(null, 20, 0xffffff, "right");

			pluginurl = new FlxText(350, 35 * 5, 400, "http://www.photonstorm.com/   flixel-power-tools");
			pluginurl.setFormat(null, 20, 0xffffff, "center");		
			
			music = new FlxText(50, 35 * 7, 250, "Music");
			music.setFormat(null, 20, 0xffffff, "right");

			musicurl = new FlxText(350, 35 * 7, 400, "http://freestockmusic.com/");
			musicurl.setFormat(null, 20, 0xffffff, "center");			

			sound = new FlxText(50, 35 * 9, 250, "Sound Effects");
			sound.setFormat(null, 20, 0xffffff, "right");

			soundurl = new FlxText(350, 35 * 9, 400, "http://freesound.org/");
			soundurl.setFormat(null, 20, 0xffffff, "center");			

			font = new FlxText(50, 35 * 11, 250, "Journal Font");
			font.setFormat(null, 20, 0xffffff, "right");

			fonturl = new FlxText(350, 35 * 11, 400, "Architects Daughter from Google Fonts")
			fonturl.setFormat(null, 20, 0xffffff, "center");

			add(engine);
			add(engineurl);
			add(plugin);
			add(pluginurl);
			add(music);
			add(musicurl);
			add(sound);
			add(soundurl);
			add(font);
			add(fonturl);
		}
		
		override public function update():void {
			if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, backBtn)) {
				backBtn.loadGraphic(AssetsRegistry.backBtnImgHover);
			} else {
				backBtn.loadGraphic(AssetsRegistry.backBtnImg);
			}
			if (FlxG.mouse.justPressed()) {
				if (FlxCollision.pixelPerfectPointCheck(FlxG.mouse.x, FlxG.mouse.y, backBtn)) {
					FlxG.switchState(new MainMenuState());
				}
			}			
		}
	}
	
}