package 
{
	public class Room	{
		public var level1:Level;
		public var story:Story;	
	
		//Randomly Generates A Room
		public function Room() {
			//Create Items for Level 1
			var moldyYogurt:Item = new Item(AssetsRegistry.table_m_moldPic, 125, 200, "It's covered in mold! I'm going to have a word with room service....", AssetsRegistry.sfxEat);
			var yogurt:Item = new Item(AssetsRegistry.table_m_yogurtPic, 125, 200, "Whoever put this here must have known how much I love cucumber yogurt. How kind!", AssetsRegistry.sfxEat);
			var bed:Item = new Item(AssetsRegistry.bedPic, 307, 115, "I only woke up a few minutes ago, I'm not going back to sleep already!");
			var door:Item = new Item(AssetsRegistry.doorPic, 127, 236, "The door is locked.", AssetsRegistry.sfxopendoor);
			var cat:Item = new Item(AssetsRegistry.mrCatPic, 127, 459, "Truly a magnificent work of art. It captures the beauty and feline grace of the animal perfectly.", AssetsRegistry.sfxmeowcute);
			var president:Item = new Item(AssetsRegistry.mrPresidentPic, 127, 459, "What a handsome fellow! No wonder the public voted for him....");
			var bedNews:Item = new Item(AssetsRegistry.bedWithnewsPic, 307, 115, "The headline reads: 'Is Craine Insane? President's erratic behavior mystifies family, staff.'");
			var mirror:Item = new Item(AssetsRegistry.table_m_mirrorPic, 125, 200, "Now at least I know one thing about myself: I am ridiculously good-looking!");
			
			var itemList:Array = new Array(president, moldyYogurt, yogurt, bed, door, cat, bedNews, mirror);

			//Create Token List for Story
			var discoverPresidentNews:Token = new Token("Hey...I've seen that face before...I must be the President!", "You are", "the President", new Array(bedNews, president));
			var discoverPresidentMirror:Token = new Token("Hey...I've seen that face before...I look just like the President! Maybe I'm his twin brother?", "You are", "the President's identical twin", new Array(mirror, president));
			var longTime:Token = new Token("I must have been unconscious for a while....", "You were asleep for", "several years", new Array(moldyYogurt));
			discoverPresidentNews.addIncompatible(discoverPresidentMirror);

			var tokenList:Array = new Array(discoverPresidentNews, discoverPresidentMirror, longTime);
			
			//Create Level 1 from Item List and Create Story from Item and Token Lists
			//Associate Story with Level1
			
			level1 = new Level(itemList);
			story = new Story(itemList, tokenList);
			story.setLevel(level1);
			level1.story = story;
		}		
	}
	
}
