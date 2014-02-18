package classes {
	public class Craftable 	{
		public var Name:String;
		public var BuildTime:Number = 0.0;
		
		public function Craftable(name:String, buildTime:Number) {
			Name = name;
			BuildTime = buildTime;
		}
		
		public function Update(skill:CraftSkill) : void {
			BuildTime += skill.Rate;
			skill.Rate += 1;
		}
	}

}