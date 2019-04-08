package classes.Items.Apparel
{
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Engine.Interfaces.*;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.kGAMECLASS;
	import classes.Items.Miscellaneous.Hoverboard;
	import classes.Engine.Utility.rand;
	import classes.Engine.Combat.*;
	import classes.GameData.CombatManager;
	
	public class RubberBallPouch extends ItemSlotClass
	{
		public function RubberBallPouch()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			this.shortName = "R.Pouch";
			this.longName = "rubber ball pouch";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a thick rubber, testicle pouch";
			
			this.tooltip = "A thick rubber pouch, obtained from an experiment in a dungeon on Tarkus. It space-hopper-izes your balls, allowing you to bounce around even with the exceedingly large. Requires balls to wear.\n\n<b>Specials: Ball Bounce</b>\n\n<b>If this was the only thing allowing you to move around with exceedingly large balls, it'd be a bad idea to take it off.</b>";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 5000;
			this.attack = 0;
			this.defense = 2;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 4;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances = new TypeCollection();
			resistances.electric.resistanceValue = 90.0;
			
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_EXPOSE_ASS);
			itemFlags.push(GLOBAL.ITEM_FLAG_SKIN_TIGHT);
			
			this.version = _latestVersion;
		}
		
		override public function onEquip(targetCreature:Creature, outputText:Boolean = false):void
		{
			if (targetCreature.balls > 0)
			{
				if (targetCreature.weightQ("testicles") >= 200 && targetCreature.heightRatio("testicle") >= (8/10))
				{
					if (outputText){
						if (targetCreature is PlayerCharacter) output("You try your hardest to squeeze your " + targetCreature.ballsDescript() + " into the pouch, wiggling the rubber slowly over your flesh but there's just no way it's going on.\n\n");
						else output(targetCreature.short + "tries their hardest to squeeze their " + targetCreature.ballsDescript() + " into the pouch but there's just no way it's going on.\n\n");
					}
					targetCreature.removeClothes("underwear");
				}
				else 
				{
					if (outputText){
						if (targetCreature is PlayerCharacter) output("As you strap the thick, rubber ball pouch on, and grasp the handles, you find yourself able to move effectively despite your " + targetCreature.ballsDescript() + ".\n\n");
						else output("As " + targetCreature.short + " straps the thick, rubber ball pouch on, and grasp the handles, they find themselves able to bounce around effectively, despite their " + targetCreature.ballsDescript() + ".\n\n");
					}
					if (targetCreature.hasStatusEffect("Egregiously Endowed")) targetCreature.setStatusTooltip("Egregiously Endowed", "Still able to move effectively, thanks to the rubber ball pouch!\n\n");
					if (targetCreature.hasStatusEffect("Endowment Immobilized")) targetCreature.removeStatusEffect("Endowment Immobilized");
				}
			}
			else 
			{
				if (outputText){
					if (targetCreature is PlayerCharacter) output("You twist the rubber ball pouch around in your hands but can't find any way to put it on, with your lack of balls.\n\n");
					else output("You watch as " + targetCreature.short + " twists and turns the pouch around but they can't find any way to put it on, with their lack of balls.\n\n");
				}
				targetCreature.removeClothes("underwear");
			}
		}
		
		override public function onRemove(targetCreature:Creature, outputText:Boolean = false):void
		{
			if (targetCreature.weightQ("testicles") >= 100 && targetCreature.heightRatio("testicle") >= (40/60))
			{
				if (outputText){
					if (targetCreature is PlayerCharacter) output("As you unstrap the thick, rubber ball pouch, your " + targetCreature.ballsDescript() + " slump to the floor and you once again find yourself unable to move.\n\n");
					else output("As " + targetCreature.short + " unstraps the thick, rubber ball pouch, their " + targetCreature.ballsDescript() + " slump to the floor and they once again find themselves unable to move.\n\n");
				}
				
				if (!targetCreature.hasItemByClass(Hoverboard))
				{
					targetCreature.createStatusEffect("Endowment Immobilized", 0, 0, 0, 0, false, "Icon_Poison", "Your endowments prevent you from moving.", false, 0);
				}
				else 
				{
					if (outputText)
					{
						if (targetCreature is PlayerCharacter) output("If it wasn't for your hoverboard, you'd be immobilized.\n\n");
						else output("If it wasn't for their hoverboard, they'd be immobilized.\n\n");
					}
				}
			}
			else if (targetCreature.hasStatusEffect("Egregiously Endowed"))
			{
				if (outputText){
					if (targetCreature is PlayerCharacter){
						output("As you unstrap the thick, rubber ball pouch, your " + targetCreature.ballsDescript() + " slump to the floor and you once again find it difficult to move.\n\n");
					}
					else output("As " + targetCreature.short + " unstraps the thick, rubber ball pouch, their " + targetCreature.ballsDescript() + " slump to the floor and they once again find it difficult to move.\n\n");
				}
				targetCreature.setStatusTooltip("Egregiously Endowed","Movement between rooms takes twice as long, and fleeing from combat is more difficult.");
			}
		}

		//Not used by RaskvelExp, to allow me to tweak mechanics for that encounter seperately from general encounters.
		//General encounter wont use knockdown mechanic because it's probably too strong or too weak for average combat. It's already combined lust+phys
		public function ballBounceAttack(attacker:Creature,target:Creature):Boolean
		{
			var damage:TypeCollection;
			var damageResult:DamageResult;
			var ballBracket:int;
			var teaseDmg:int = 0;
			
			//Decide on ball size
			//[10, 25, 50, 100, 200];
			//[(9/60), (15/60), (25/60), (40/60), (8/10)];
			if (attacker.weightQ("testicles") >= 200 && attacker.heightRatio("testicle") >= (60/60)) ballBracket = 6;
			else if (attacker.weightQ("testicles") >= 100 && attacker.heightRatio("testicle") >= (40 / 60)) ballBracket = 5;
			else if (attacker.weightQ("testicles") >= 50 && attacker.heightRatio("testicle") >= (25/60)) ballBracket = 4;
			else if (attacker.weightQ("testicles") >= 25 && attacker.heightRatio("testicle") >= (15/60)) ballBracket = 3;
			else if (attacker.weightQ("testicles") >= 10 && attacker.heightRatio("testicle") >= (9/60)) ballBracket = 2;
			else ballBracket = 1;
			
			if (attacker is PlayerCharacter) output("You lean forward and with your next bounce, go flying at your target at full speed!\n");
			else output(attacker.getCombatName() + " leans forward and with their next bounce, goes flying towards " + target.short + " at full speed!\n");

			if (target.reflexes() > (15 + rand(7 * attacker.statusEffectv1("Ball Bouncing"))))
			{
				if (target is PlayerCharacter) output("You manage to jump out the way just in time and the " + attacker.race() + " goes sailing past you, injuring themselves.\n");
				else if (attacker is PlayerCharacter) output("They manage to jump of the way just in time and you go flying past them, injuring yourself.\n");
				else output("They manage to jump out the way just in time and the " + attacker.race() + " goes sailing past, injuring themselves.\n");
				
				damage = new TypeCollection( { kinetic: (3 * attacker.statusEffectv1("Ball Bouncing")) } ); //Hurt for 3 times charging count
				damageResult = calculateDamage(damage, attacker, attacker);
				outputDamage(damageResult);

				attacker.removeStatusEffect("Ball Bouncing");
				
				return false;
			}
			
			if (blindMiss(attacker, target, false))
			{
				if (attacker is PlayerCharacter) output("In your blindness, you go sailing past them, injuring yourself.");
				else output("In their blindness, they go flying past, injuring themselves.");

				damage = new TypeCollection( { kinetic: (4 * attacker.statusEffectv1("Ball Bouncing")) } ); //Hurt for 4 times charging count
				damageResult = calculateDamage(damage, attacker, attacker);
				outputDamage(damageResult);

				attacker.removeStatusEffect("Ball Bouncing");
				
				return false;
			}

			if (attacker is PlayerCharacter) output("They can't move out the way and your [pc.balls] smash into " + target.getCombatName() + "!\n");
			else if (target is PlayerCharacter) output("You can't move out the way and their " + attacker.ballsDescript + " smash into you!\n");
			else output("They can't move out of the way and " + target.getCombatName() + "'s " + attacker.ballsDescript + " smash into them!\n");
			
			//If they have any reason to find this hot (More restricted than NPC fight)
			if (target.isBimbo() || target.isCumSlut() || target.sexualPreferences.getPref(GLOBAL.SEXPREF_BALLS) >= GLOBAL.KINDA_LIKES_SEXPREF)
			{
				if (target is PlayerCharacter) output("You kinda like it!\n");
				else output("They seem like they kinda like it!\n");
				teaseDmg = ballBracket * (1 + rand(1));
			}
			damage = new TypeCollection( { kinetic: (3 * (attacker.statusEffectv1("Ball Bouncing") + ballBracket)) , tease: teaseDmg } );
			damageResult = calculateDamage(damage, attacker, target);
			outputDamage(damageResult);

			attacker.removeStatusEffect("Ball Bouncing");
			
			return true;
		}
		public function ballBounceCharge(char:Creature):void
		{
			output("\n\nYou bounce on your [pc.balls].");
			if (char.hasStatusEffect("Ball Bouncing"))
			{
				char.addStatusValue("Ball Bouncing", 1, 2);
			}
			else 
			{
				char.createStatusEffect("Ball Bouncing", 2, 0, 0, 0, false, "Icon_Bull", "You're bouncing to attack", true, 0);
			}
			char.energy( -5);
			CombatManager.processCombat();
			return;
		}
	}
}