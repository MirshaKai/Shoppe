package
{
	import org.flixel.*;
	import classes.*;
	
	public class PlayState extends FlxState
	{
		public var shopKeepers:Array = new Array();
		public var currentKeeper:ShopKeep;
		
		override public function create():void
		{
			shopKeepers.push(new ShopKeep("Fork"));
			shopKeepers.push(new ShopKeep("Off"));
			
			shopKeepers[0].SetCurrentTask(new Craftable("Sword", 100));
			shopKeepers[1].SetCurrentTask(new Craftable("Pike", 100));
		}
		
		override public function update():void
		{
			for (var i:int = 0; i < shopKeepers.length; i++) {
				var keeperName:FlxButton = new FlxButton(0, 18*i, shopKeepers[i].Name, SetCurrentKeeper);
				add(keeperName);
			}
			
			if (currentKeeper != null) {
				add(new FlxText(100, 0, 100, currentKeeper.Name));
				var y:int = 10;
				for each(var value:* in currentKeeper.Skills) {
					add(new FlxText(100, y, 100, value.Name));
					add(new FlxText(200, y, 100, value.Rate));
					add(new FlxText(250, y, 100, value.Quality));
					i += 10;
				}
				
				if (currentKeeper.CurrentTask != null) {
					currentKeeper.CurrentTask.Update(currentKeeper.Skills[currentKeeper.CurrentTask.Name]);
				}
				
			}
			
			super.update();
		}
		
		private function SetCurrentKeeper():void {
			currentKeeper = shopKeepers[1];
		}
	}
}

