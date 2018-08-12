package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class RaskvelBroodmotherEmptyBucket extends ItemSlotClass
	{
		public function RaskvelBroodmotherEmptyBucket()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 15;
			this.type = GLOBAL.GADGET;
			this.basePrice = 100;
			
			//Used on inventory buttons
			this.shortName = "Bucket";
			
			//Regular name
			this.longName = "Empty bucket";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an empty steel bucket";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "An empty steel bucket that you bought from Millie on New Texas";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			isUsable = false;
			this.version = _latestVersion;
		}
	}
}
