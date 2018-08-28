﻿package classes.Items.Drinks
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Combat.inCombat;
	import classes.Items.Miscellaneous.EmptyBucket;
	
	public class RaskvelBroodmotherMilkBucket extends ItemSlotClass
	{
		
		//constructor
		public function RaskvelBroodmotherMilkBucket()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 6;
			this.type = GLOBAL.POTION;
			//Used on inventory buttons
			this.shortName = "B.Milk Bucket";
			//Regular name
			this.longName = "Broodmother milk bucket";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a full bucket of raskvel broodmother udder milk";
			//Displayed on tooltips during mouseovers
			this.tooltip = "A big, bucket full of the Raskvel Broodmothers udder milk. While not as fresh as it'd be from her big pink nipples, her motherly milk still tastes pretty good.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 200;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.combatUsable = true;
			this.targetsSelf = true;
			
			this.version = this._latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var healing:int = 40;
			var lust:int = 30;
			
			if(target.energy() + healing > target.energyMax())
			{
				healing = target.energyMax() - target.energy();
			}
			if(target.lust() + lust > target.lustMax())
			{
				lust = target.lustMax() - target.lust();
			}
			if (target is PlayerCharacter) 
			{
				clearOutput();
				if (inCombat()) output("You pick up the big bucket of milk it sloshing as you do, and pull the cap off of it. You tip it towards you and pour the milk down your mouth, fantasizing about the broodmothers big, fuckable nipples as you do, wishing you were drinking the milk right from the source.\nYou feel more energized but the fantasizing that came with it has left you slightly hornier.");
				else output("You heft the big bucket of broodmama milk it sloshing as you do so, and peel the cap off of it. Her plentiful bounty is heavy and the milk foams and sloshes about. You tip it towards you and pour the milk in and around your mouth. As you do, your mind drifts off. Your mind is filled with a vision of you getting the milk straight from the source, sucking the broodmothers big, fuckable nipples. You're not sure if this is your own minds doing, or something in the milk to keep you coming back to her.\nEither way, you feel more energized for drinking it but the fantasizing that came with it has left you hornier.");
				if (healing > 0) kGAMECLASS.output(" (<b>+" + healing + " Energy</b>)");
				if(lust > 0) kGAMECLASS.output(" (<b>+" + lust + " Lust</b>)");
			}
			//Not player!
			else
			{
				if(inCombat()) output("\n\n");
				else clearOutput();
				output((inCombat() ? StringUtil.capitalize(target.getCombatName(), false) : (target.capitalA + target.short)) + " peels the lid from the bucket and downs the broodmothers bounty. Their eyes glaze over slightly as they do but they look peppier too!");
				if (healing > 0) kGAMECLASS.output(" (<b>+" + healing + " Energy</b>)");
				if(lust > 0) kGAMECLASS.output(" (<b>+" + lust + " Lust</b>)");
			}
			
			//Give us the empty buckets back			
			var bucketsReturned:EmptyBucket = new EmptyBucket();
			var itemsToGet:Array = new Array();
			bucketsReturned.quantity = 1;
			itemsToGet.push(bucketsReturned);
			kGAMECLASS.itemCollect(itemsToGet);
			
			target.lust(lust);
			target.energy(healing);
			return false;
		}
	}
}

