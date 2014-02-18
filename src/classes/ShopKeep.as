package classes 
{
	public class ShopKeep 
	{
		public var Name:String = "";
		public var Skills:Object = new Object();
		public var CurrentTask:Craftable;
		
		public function ShopKeep(name:String) 
		{
			Name = name;
		}

		public function AddSkill(name:String) : void {
			if (!Skills[name]) {
				Skills[name] = new CraftSkill(name);
			}
		}
		
		public function SetCurrentTask(task:Craftable) : void {
			AddSkill(task.Name);
			CurrentTask = task;
		}
	}

}