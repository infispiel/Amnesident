package
{
    import org.flixel.*;
    import flash.ui.Mouse;
    import flash.ui.MouseCursor;
	
    public class Level extends FlxState
    {
		
		public var title:FlxText;
		public var items:Array;
		
		public function Level(item0:Item = null, item1:Item = null,
                              item2:Item = null, item3:Item = null)
		{
			items = new Array(item0, item1, item2, item3);

			if (items[0] != null) {
				items[0].x = 50;
				items[0].y = 480 - items[0].height;
				add(items[0]);
			}

			if (items[1] != null) {
				items[1].x = 210;
				items[1].y = 480 - items[1].height;
				add(items[1]);
			}

			if (items[2] != null) {
				items[2].x = 370;
				items[2].y = 480 - items[2].height;
				add(items[2]);
			}

			if (items[3] != null) {
				items[3].x = 530;
				items[3].y = 480 - items[3].height;
				add(items[3]);
			}

			title = new FlxText(300, 0, 100, "Level");
			add(title);
		}
    }
}
