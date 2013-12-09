package 
{
	import mx.core.FlexSprite;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class CreditsScreen extends FlxState	{
		public var title:FlxText;
		public var backBtn:FlxSprite;
		public var codenames:FlxText;
		public var code:FlxText;
		public var music:FlxText;
		public var musicnames:FlxText;
		public var soundnames:FlxText;
		public var sound:FlxText;
		public var asset:FlxText;
		public var assetnames:FlxText;
		public var project:FlxText;
		public var projectnames:FlxText;
		public function CreditsScreen():void	{
			var textWidth:int = 300;
			title = new FlxText(FlxG.width/2 - textWidth/2, FlxG.height/14, textWidth, "Credits Screen");
			title.size = 32;
			title.alignment = "center";
			backBtn = new FlxSprite(330, 500, AssetsRegistry.backBtnImg);
			add(backBtn);
			add(title);
			
		
			
			music = new FlxText(50, 35 * 7, 250, "Music & Sound");
			music.setFormat(null, 20, 0xffffff, "right");

			musicnames = new FlxText(350, 35 * 7, 250, "Polina Shpilker Chau Vu");
			musicnames.setFormat(null, 20, 0xffffff, "center");
			
			asset = new FlxText(50, 35 * 5, 250, "Artist");
			asset.setFormat(null, 20, 0xffffff, "right");

			assetnames = new FlxText(350, 35 * 5, 250, "Laura Shih       Polina Shpilker");
			assetnames.setFormat(null, 20, 0xffffff, "center");		
			
			code = new FlxText(50, 35 * 9, 250, "Coders");
			code.setFormat(null, 20, 0xffffff, "right");

			codenames = new FlxText(350, 35 * 9, 250, "Elizabeth Attaway Arturo Gonzalez Faruh Paerhati Benjamin Shaibu Alex Willisson   Chau Vu");
			codenames.setFormat(null, 20, 0xffffff, "center");			
			
			project = new FlxText(50, 35 * 3, 250, "Project Manager");
			project.setFormat(null, 20, 0xffffff, "right");

			projectnames = new FlxText(350, 35 * 3, 250, "Alex Willisson");
			projectnames.setFormat(null, 20, 0xffffff, "center");				
			//music = new FlxText(200, 150, 500, "Music: Polina ");
			//music.size = 20;			
			//
			//asset = new FlxText(200, 200, 500, "Artist: Laura Shih ");
			//asset.size = 20;
			  
			add(code);
			add(projectnames);
			add(codenames);
			add(project);
			add(music);
			add(musicnames);
			add(asset);
			add(assetnames);
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