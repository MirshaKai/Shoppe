package
{
	import org.flixel.*;
	import classes.*;
	
	public class PlayState extends FlxState
	{
		public var shopKeepers:Array = new Array();
		public var currentKeeper:ShopKeep;
		public var keeperText:Object = new Object;
		public var keepInt:int = 0;
		override public function create():void
		{
			shopKeepers.push(new ShopKeep("Fork"));
			shopKeepers.push(new ShopKeep("Off"));
			
			shopKeepers[0].SetCurrentTask(new Craftable("Sword", 100));
			shopKeepers[1].SetCurrentTask(new Craftable("Pike", 100));
			
			for (var i:int = 0; i < shopKeepers.length; i++) {
				var keeperName:FlxButton = new FlxButton(0, 18*i, shopKeepers[i].Name, SetCurrentKeeper);
				add(keeperName);
			}

			keeperText["Name"] = new FlxText(100, 0, 100, "");
			keeperText["SkillName"] = new FlxText(100, 10, 100, "");
			keeperText["Rate"] = new FlxText(150, 10, 100, "");
			keeperText["Quality"] = new FlxText(200, 10, 100, "");
			keeperText["CurrentTask"] = new FlxText(100, 30, 500, "");
			
			add(keeperText["Name"]);
			add(keeperText["SkillName"]);
			add(keeperText["Rate"]);
			add(keeperText["Quality"]);
			add(keeperText["CurrentTask"]);
		}
		
		override public function update():void
		{
			
			if (currentKeeper != null) {
				keeperText["Name"].text = currentKeeper.Name;
				for each(var value:* in currentKeeper.Skills) {
					keeperText["SkillName"].text = value.Name;
					keeperText["Rate"].text = value.Rate;
					keeperText["Quality"].text = value.Quality;
					keeperText["CurrentTask"].text = currentKeeper.CurrentTask.Name + " : " + currentKeeper.CurrentTask.Progress;
				}
				
				if (currentKeeper.CurrentTask != null) {
					currentKeeper.CurrentTask.Update(currentKeeper.Skills[currentKeeper.CurrentTask.Name]);
				}
				
			}
			
			super.update();
		}
		
		private function SetCurrentKeeper():void {
			keepInt = (keepInt + 1) % (shopKeepers.length);
			currentKeeper = shopKeepers[keepInt];
		}
	}
}

