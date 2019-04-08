package classes.Items.Accessories 
{
	import classes.ItemSlotClass;
	import classes.GameData.TooltipManager;
	import classes.GLOBAL;
	import classes.StringUtil;
	/**
	 * ...
	 * @author HNB
	 */
	public class LeatherMask extends ItemSlotClass 
	{
		
		public function LeatherMask() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			//Used on inventory buttons
			this.shortName = "mask";
			
			//Regular name
			this.longName = "leather mask";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a leather mask";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A leather mask, the kind you'd expect to see at an orgy, or on the owner of a whip.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 250;
			this.attack = 0;
			this.defense = 1;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 4;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
				
			this.version = _latestVersion;
		}
	}
}