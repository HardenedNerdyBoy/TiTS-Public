package classes.Items.Miscellaneous 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * Opens a dungeon on Tarkus, full of experimentations. Currently buyable from Dr.Badger because it seemed appropriate for her to "own" the dungeon. 
	 * @author HNB
	 */
	
	public class TarkusDungeonKey extends ItemSlotClass
	{
		
		public function TarkusDungeonKey() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "T.Key";
			
			//Regular name
			this.longName = "Tarkus Key";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a mysterious metal key";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This rusty, metal key is probably for a door somewhere on Tarkus.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 5000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.isUsable = false;
			
			this.version = _latestVersion;
		}
	}
}