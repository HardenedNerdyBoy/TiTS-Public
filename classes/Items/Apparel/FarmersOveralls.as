package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	
	/**
	 * @author HNB
	 */
	public class FarmersOveralls extends ItemSlotClass
	{
		public function FarmersOveralls() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "F.Overalls";
			
			this.longName = "Farmers Overalls";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a new-texas style pair of farming overalls";
			
			this.tooltip = "Blue Overalls from New Texas. The straps can go quite loose to accommodate bustier women or chestier men and end in a pair of shorts!";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 500;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 2;
			this.critBonus = 0;
			this.evasion = 1;
			this.fortification = 1;
			
			this.version = this._latestVersion;
		}
	}
}
