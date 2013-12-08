package 
{
	import mx.core.FlexSprite;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class CreditsScreen extends FlxState	{
		public var title:FlxText;
		public var backBtn:FlxSprite;
		public var coder:FlxText;
		public var music:FlxText;
		public var sound:FlxText;
		public var asset:FlxText;
		public function CreditsScreen():void	{
			var textWidth:int = 300;
			title = new FlxText(FlxG.width/2 - textWidth/2, FlxG.height/12, textWidth, "Credits Screen");
			title.size = 32;
			title.alignment = "center";
			backBtn = new FlxSprite(610, 10, AssetsRegistry.backBtnImg);
			add(backBtn);
			add(title);
			coder = new FlxText(200, 100, 500, "Coders: Alex Willisson, Elizabeth Attaway, ");
			coder.size = 20;			
			music = new FlxText(200, 150, 500, "Music: Polina ");
			music.size = 20;			
			
			asset = new FlxText(200, 200, 500, "Artist: Laura Shih ");
			asset.size = 20;
			  
			add(coder);
			add(music);
			add(asset);
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