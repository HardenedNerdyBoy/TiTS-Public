package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * @author HNB
	 */
	public class TeacherOutfit extends ItemSlotClass
	{
		public function TeacherOutfit() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "Teacher.O";
			
			this.longName = "Teacher outfit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a slutty teacher outfit";
			
			this.tooltip = "This is a slutty teacher outfit, complete with dark suspended stockings, a tight blouse and a dark jacket. Also comes with glasses (cosmetic only)!";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 1000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 5;
			this.critBonus = 0;
			this.evasion = 3;
			this.fortification = 0;
			
			this.version = this._latestVersion;
		}
	}
}
