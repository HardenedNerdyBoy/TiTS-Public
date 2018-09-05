package classes.Items.Apparel 
{
	import classes.Characters.PlayerCharacter;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	import classes.Creature;
	import classes.kGAMECLASS;
	
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
			
			this.description = "a teacher outfit";
			
			this.tooltip = "This is a teacher outfit, complete with dark stockings and a tight blouse. Also comes with glasses (cosmetic only)!";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 1000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = this._latestVersion;
		}
		
		override public function onEquip(targetCreature:Creature, outputText:Boolean = false):void
		{
			targetCreature.intelligence(targetCreature.intelligence() + 1);
			if (targetCreature is PlayerCharacter) kGAMECLASS.output("\nAs you don the teachers uniform, you feel slightly smarter.\n")
		}
		
		override public function onRemove(targetCreature:Creature, outputText:Boolean = false):void
		{
			targetCreature.intelligence(targetCreature.intelligence() - 1);
			if (targetCreature is PlayerCharacter) kGAMECLASS.output("\nAs you take off the teachers outfit, you feel slightly less smart.\n")
		}
	}
}
