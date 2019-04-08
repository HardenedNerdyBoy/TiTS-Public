package classes.Characters
{
	import classes.Creature;
	import classes.GameData.SingleCombatAttack;
	import classes.GLOBAL;
	import classes.ItemSlotClass;
	import classes.Items.Accessories.LeatherMask;
	import classes.Items.Apparel.LeatherBra;
	import classes.Items.Apparel.LeatherPanties;
	import classes.StorageClass;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.StringUtil;
	
	/**
	 * Dominatrix guards made of goo. Two variants referred to as twins. 1 is agressive and physical and the other is teasy. 
	 * They are reprogrammed by Badger to guard the dungeon. If they defeat you they will capture you and you will have to escape or it's badend.
	 * Intended to be slightly strong for their level as rarer enemies and then a bossfight where you fight both and it's harder.
	 * @author HNB
	 */

 
	public class GooGuard extends Creature
	{
		//constructor
		public function GooGuard()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "goo guard";
			this.originalRace = "gray goo";
			this.a = "the ";
			this.capitalA = "the ";
			this.long = "A reprogrammed and enhanced gray goo, spouting tentacle-like goo-arms, excessive curves and cartoonishly large breasts, clad in a leather corset and mask and with goo-formed weapons of capture extending from one arm.";
			this.customDodge = "The gaurds goo body shifts and twists, causing your attack to fly through a hole where her body used to be.";
			this.customBlock = "The guards body absorbs your blow, leaving her unharmed.";
			this.isPlural = false;
						
			this.lowerUndergarment = new LeatherPanties();
			this.upperUndergarment = new LeatherBra();
			this.accessory = new LeatherMask();
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.resistanceValue = 55.0;
			baseHPResistances.tease.damageValue = 40.0;
			
			this.physiqueRaw = 37;
			this.reflexesRaw = 56;
			this.aimRaw = 10;
			this.intelligenceRaw = 28;
			this.willpowerRaw = 45;
			this.libidoRaw = 55;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 15;
			
			this.level = 9;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 50;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 100;
			this.eyeType = GLOBAL.TYPE_GOOEY;
			this.eyeColor = "silver";
			this.tallness = 74;
			this.thickness = 90;
			this.tone = 0;
			this.hairColor = "silver";
			this.hairType = GLOBAL.TYPE_GOOEY;
			this.hairLength = 11;
			this.skinType = GLOBAL.SKIN_TYPE_GOO;
			this.skinTone = "gray";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = [GLOBAL.FLAG_SMOOTH];
			this.tongueType = GLOBAL.TYPE_GOOEY;
			this.lipMod = 3;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_TENTACLE;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_HUMAN;
			this.legCount = 1;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_HUMAN;
			this.tailCount = 0;
			this.tailFlags = new Array();
			//Used to set cunt or dick type for cunt/dick tails!
			this.tailGenitalArg = 0;
			//tailGenital:
			//0 - none.
			//1 - cock
			//2 - vagina
			this.tailGenital = 0;
			//Tail venom is a 0-100 slider used for tail attacks. Recharges per hour.
			this.tailVenom = 0;
			//Tail recharge determines how fast venom/webs comes back per hour.
			this.tailRecharge = 0;
			//hipRating
			//0 - boyish
			//2 - slender
			//4 - average
			//6 - noticable/ample
			//10 - curvy//flaring
			//15 - child-bearing/fertile
			//20 - inhumanly wide
			this.hipRatingRaw = 13;
			//buttRating
			//0 - buttless
			//2 - tight
			//4 - average
			//6 - noticable
			//8 - large
			//10 - jiggly
			//13 - expansive
			//16 - huge
			//20 - inconceivably large/big/huge etc
			this.buttRatingRaw = 12;
			
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 0;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 0;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 10;
			this.minutesSinceCum = 360;
			this.timesCum = 69;
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 5;

			this.elasticity = 100;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 5;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 35;
			this.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_INVERTED; //also fuckable but nippletype isnt an array
			this.nippleColor = "dark gray";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			this.ass.bonusCapacity += 35;
			
			isUniqueInFight = true;
			btnTargetText = "Goo Guard";
			
			this.createPerk("Riposte", 0, 0, 0, 0);
			this.createPerk("Multiple Attacks", 1, 0, 0, 0, "");
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			this.createPerk("Appearance Enabled");
			this.createPerk("Inhuman Desire", 25, 0, 0, 0);
			this.createStatusEffect("Disarm Immune");
			
			aThe();
			lootSetup();
			randomise();
			
			this._isLoading = false;
		}
		
		public function aThe():void //call this to update a and capitalA. Reads unique in fight. Only needs calling in multiraskexp scenarios
		{
			if (isUniqueInFight)
			{
				this.a = "the ";
				this.capitalA = "The ";
			}
			else 
			{
				this.a = "one of the "
				this.capitalA = "One of the ";
			}
		}
		
		//This need to be consistent if in the boss battle, so we'll expose functions for the 2 variants that can be called in the fight setup, that'll override this anyway.
		private function randomise():void 
		{
			if (rand(2) == 0) setVariant_1();
			else setVariant_2();
		}
		
		private function getVariant():int
		{
			if (this.hairLength == 14) return 1;
			return 2;
		}
		
		public function setVariant_1():void
		{
			this.hairLength = 14;
			this.eyeColor = "dark gray";
			this.hairColor = "dark gray";
			this.skinTone = "dark gray";
			this.nippleColor = "steel blue";
			
			this.upperUndergarment = new LeatherBra();
			this.upperUndergarment.defense += 5;
			this.HPMod = 75;
			this.HPRaw = this.HPMax();
		}
		
		public function setVariant_2():void
		{
			this.hairLength = 12;
			this.eyeColor = "silver";
			this.hairColor = "silver";
			this.skinTone = "silver";
			this.nippleColor = "steel blue";
			
			this.upperUndergarment = new LeatherBra();
			this.upperUndergarment.defense += 8;
			this.HPMod = 50;
			this.HPRaw = this.HPMax();
		}
		
		private function lootSetup():void 
		{
			if (rand(10) == 1) this.inventory.push(new LeatherMask);
			if (rand(8) == 1) this.inventory.push(new LeatherBra);
			if (rand(4) == 1) this.inventory.push(new LeatherPanties);
			
			//They would potentially carry stuff for capture i.e. drugs and more permanent restraints
		}
		
		override public function get bustDisplay():String
		{
			return "LABORATORY_GUARD_" + getVariant().toString();
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature;
			
			//Grappling cleanup
			if (target != null && target.HP() == 0)
			{
				this.removeStatusEffect("Grappling");
				target = null;
			}
			if (target != null && !target.hasStatusEffect("Grappled") && this.hasStatusEffect("Grappling"))
			{
				this.removeStatusEffect("Grappling");
				target = null;
			}
			
			//Target aquisition
			if (target != null && target.hasStatusEffect("Grappled") && target.HP() > 0 && this.hasStatusEffect("Grappling")) //If they grappled a target and the targets alive, keep going.
			{
				target = target;
			}
			else 
			{
				var foundGrappled:Boolean = false;
				for (var i:int; i < hostileCreatures.length; i++)
				{
					if (hostileCreatures[i].hasStatusEffect("Grappled") && hostileCreatures[i].HP() > 0)
					{
						target = hostileCreatures[i];
						foundGrappled = true;
					}
				}
				if (!foundGrappled) target = selectTarget(hostileCreatures);
			}
			if (target == null) return;
			
			//Additional taunt attacks
			if (getVariant() == 1 && rand(4) == 0) tauntAttack(target);
			else if (getVariant() == 2 && rand(3) == 0) tauntAttack(target);
			
			//Fixed move logic
			if (target.hasStatusEffect("Grappled") && this.hasStatusEffect("Grappling")) restrain(target, alliedCreatures, hostileCreatures);
			else if (target.hasStatusEffect("Grappled") && getVariant() == 1) tentacleAssault(target);
			else
			{
				//Move choices
				var attackChoices:Array = new Array();
				if (getVariant() == 1)
				{
					attackChoices.push(whipAttack);
					attackChoices.push(doubleSlap);
				}
				else 
				{
					attackChoices.push(tentacleAttack);
					if (!target.hasStatusEffect("Grappled")){
						attackChoices.push(restrain);
						if (alliedCreatures.length > 1){
							attackChoices.push(restrain);
							attackChoices.push(restrain);
						}
					}
					attackChoices.push(gooGlobs);
					attackChoices.push(gooGlobs);
					attackChoices.push(tentacleCaress);
					attackChoices.push(tentacleCaress);
					attackChoices.push(tentacleCaress);
					attackChoices.push(tauntAttack);
				}
				
				if (!this.hasStatusEffect("Harden")){
					attackChoices.push(harden);
					attackChoices.push(harden);
				}
				
				var selected:* = attackChoices[rand(attackChoices.length)];
				
				if (selected == restrain) selected(target,alliedCreatures,hostileCreatures);
				else if (selected is Function) selected(target);
				else (selected as SingleCombatAttack).execute(alliedCreatures, hostileCreatures, this, target);
			}
		}
		
		private function whipAttack(target:Creature):void 
		{
			var damage:TypeCollection;
			var damageResult:DamageResult;
			if (!combatMiss(this, target) || target.hasStatusEffect("Grappled"))
			{
				if (target.shields() > 0)
				{
					output(this.capitalA + " guard swings her whip-arm around in the air before flicking it forward at " + target.getCombatName() + ", causing a flurry of sparks to fly from " + target.getCombatPronoun("pa") + " shield.");
					damage = new TypeCollection({kinetic: 36 + rand(5)});
				}
				else 
				{
					output(this.capitalA + " guard swings her whip-arm around in the air before flicking it forward at " + target.getCombatName() + "[target.skin, striking hard against " + target.getCombatPronoun("pa") + " " + target.skinFurScales() + ".");
					damage = new TypeCollection({kinetic: 36 + rand(5)});
					
					if (rand(5) == 0){
						output("\n\nLooking at where she hit, you notice she hit so hard she's caused a laceration. " + (target is PlayerCharacter ? "<i>You're bleeding!</i>" : "<i>" + target.getCombatName() + " is bleeding!</i>"));
						CombatAttacks.applyBleed(target, 1, 3, 5);
					}
				}
				damageResult = calculateDamage(damage, this, target);
				outputDamage(damageResult);
			}
			else
			{
				output(this.capitalA + " guard swings her whip-arm around in the air before flicking it forward but " + target.getCombatName() + (target is PlayerCharacter ? " manage to dodge it" : "manages to dodge it") + ".");
			}
		}
		
		private function tentacleAssault(target:Creature):void 
		{
			var damage:TypeCollection;
			var damageResult:DamageResult;
			
			output("With " + target.getCombatName() + " restrained, the other guard raises an array of tentacles on her back.\n<i>“Should've just knelt”</i> she laughs as she slaps them wildly at " + target.getCombatPronoun("o") + ".\n\n");
			
			var numberOfAttacks:int = 3 + rand(2);
			for (var i:int = 0; i < numberOfAttacks; i++)
			{
				damage = new TypeCollection({kinetic: 26 + rand(3)});
				damageResult = calculateDamage(damage, this, target);
				output(i + " hits!");
				outputDamage(damageResult);
				output("\n");
			}
		}
		
		private function doubleSlap(target:Creature):void 
		{
			var damage:TypeCollection;
			var damageResult:DamageResult;
			
			output(this.capitalA + " guard raises both tendril-like hands and strikes " + target.getCombatName() + " with them!\n\n");
			var numberOfAttacks:int = 2 + rand(1);
			for (var i:int = 0; i < numberOfAttacks; i++)
			{
				if (!combatMiss(this, target) || target.hasStatusEffect("Grappled"))
				{
					damage = new TypeCollection({kinetic: 26 + rand(3)});
					damageResult = calculateDamage(damage, this, target);
					output(i + " hits!");
					outputDamage(damageResult);
					output("\n");
				}
				else 
				{
					output(i + " misses!\n");
				}
			}
		}
		
		private function tentacleAttack(target:Creature):void 
		{
			var damage:TypeCollection;
			var damageResult:DamageResult;
			if (!combatMiss(this, target) || target.hasStatusEffect("Grappled"))
			{
				output(this.capitalA + " guard raises a tentacle and strikes " + target.getCombatName() + " with it.");
				damage = new TypeCollection({kinetic: 16 + rand(3)});
				damageResult = calculateDamage(damage, this, target);
				outputDamage(damageResult);
			}
			else
			{
				output(this.capitalA + " guard raises a tentacle and strikes out at " + target.getCombatName() + " with it but misses.");
			}
		}
		
		private function tentacleCaress(target:Creature):void
		{
			var damage:TypeCollection;
			var damageResult:DamageResult;
			
			output(this.capitalA + " guard reaches out towards " + target.getCombatName() + " with a tentacle. ");
			if (!combatMiss(this, target) || target.hasStatusEffect("Grappled"))
			{
				if (target.hasAirtightSuit()){
					output("Unable to reach under " + target.getCombatPronoun("pa") + " airtight armor, she rubs it across the armor, sensually.")
					damage = new TypeCollection({tease: 2 + rand(2)});
				}
				else if (!target.isNude()){
					output("It wiggles it's way under " + target.getCombatPronoun("pa") + " " + target.upperGarmentDescript() + ", caressing " + target.getCombatPronoun("pa") + " " + target.skin() + " and rubbing " + target.getCombatPronoun("pa") + " " + target.chestDesc() +  ".")
					damage = new TypeCollection({tease: 4 + rand(4)});
				}
				else{
					output("She rubs it over every region of " + target.getCombatPronoun("pa") + " naked body, splitting it into smaller tentacles to reach more areas.")
					damage = new TypeCollection({tease: 7 + rand(7)});
				}
				damageResult = calculateDamage(damage, this, target);
				outputDamage(damageResult);
				output("\n<i>“Just give in”</i> the guard moans.");
			}
			else 
			{
				if (target is PlayerCharacter) output("You jump out of the way, avoiding it.");
				else output("They jump out of the way, avoiding it.");
			}
		}
		
		private function restrain(target:Creature,friendlies:Array, hostiles:Array):void 
		{
			if (target.hasStatusEffect("Grappled") && this.hasStatusEffect("Grappling")) //Continue grappling
			{
				if (target.statusEffectv3("Grappled") == 0) //Gentle caress
				{
					output("With " + target.getCombatName() + " tight in her grasp, the guard runs her tentacles along " + target.getCombatPronoun("pa") + " body, grasping " + (target is PlayerCharacter ? "your " : "their ") + (target.isCrotchExposed() ? "exposed " : " ") + target.crotchDescript() + ".\n");
					output("<i>“I'll get you to your knees one way or another”</i> she moans.");	
					applyDamage(new TypeCollection( { tease: 2 + rand(4) } ), this, target, "minimal");
				}
				else 
				{
					output("With " + target.getCombatName() + " tight in her grasp, the guard reaches around " + target.getCombatPronoun("pa") + " " + target.hipDescript());
					if (target.hasAirtightSuit()){
						output(" and rubs her tendrils across " + (target is PlayerCharacter ? "your " : "their ") + (target.isCrotchExposed() ? "exposed " : " ") + target.crotchDescript() + ".")
						applyDamage(new TypeCollection( { tease: 2 + rand(4) } ), this, target, "minimal");
					}
					else if (target.hasCock() && (rand(2) == 0)){
						if (target.isCrotchGarbed()) output(", running a tentacle under " + (target is PlayerCharacter ? "your " : "their ") + target.crotchCovers());
						output(" and grabs a hold of " + (target is PlayerCharacter ? "your " : "their ") + target.cocksDescript() + ", rubbing her gooey tendrils along " + (target.cocks.length > 1 ? "their lengths." : "its length."));
						applyDamage(new TypeCollection( { tease: 4 + rand(4) } ), this, target, "minimal");
					}
					else if(target.biggestTitSize() >= 2 && (rand(2) == 0))
					{
						if (target.isChestGarbed()) output(", running a tentacle under " + (target is PlayerCharacter ? "your " : "their ") + target.chestCovers());
						
						if (rand(2) == 0) output(" and threads a gooey tendril between " + (target is PlayerCharacter ? "your " : "their ") + target.breastDescript(0) + ", suggestively.");
						else output(" and splits a gooey tendril in " + target.breastRows[0].breasts + " before coiling them around " + (target is PlayerCharacter ? "your " : "their ") + target.breastDescript(0) + ", squeezing them" + (target.canLactate() ? ", causing " + target.milkDescript() + " to spurt from " + (target is PlayerCharacter ? "your " : "their ") + "nipples." : "."));
					
						applyDamage(new TypeCollection( { tease: 4 + rand(4) } ), this, target, "minimal");
					}
					else
					{
						if (!target.isAssExposed()) output(", running a tentacle under " + (target is PlayerCharacter ? "your " : "their ") + target.assCovers());
						output(" and threads a gooey tendril between " + (target is PlayerCharacter ? "your " : "their ") + target.buttDescript() + ".");
						
						applyDamage(new TypeCollection( { tease: 4 + rand(4) } ), this, target, "minimal");
					}
				}
				
				target.addStatusValue("Grappled",3,1);
			}
			else
			{
				if (!combatMiss(this, target))
				{
					output("You didn't notice " + this.a + " guards tentacles creeping along the floor! It lashes out and quickly wraps around " + target.getCombatName() + ", holding " + target.getCombatPronoun("o") + " in place. The guard quickly shifts to behind " + target.getCombatPronoun("o") + (target is PlayerCharacter ? " and you hear her chuckle next to your [pc.ear]." : "."));
					CombatAttacks.applyGrapple(target, 50);
					this.createStatusEffect("Grappling", hostiles.indexOf(target));
					applyDamage(new TypeCollection( { tease: 2 + rand(4) } ), this, target, "minimal");
					output("\n<i>“Mmm, it'd be best if you stopped struggling”</i> the guard suggests sultrily.");
				}
				else
				{
					output("You notice a tentacle creeping along the floor! ");
					if (target is PlayerCharacter) output("As it lashes out, you manage to dodge out of the way.");
					else output("As it lashes out, you call to " + target.getCombatName()  + " and they manage to dodge out of the way.");
				}
			}
		}
		
		private function gooGlobs(target:Creature):void
		{
			output(this.capitalA + " guard flicks her tentacle forward letting a thick glob of goo fly through the air at " + target.getCombatName() + "!");
			if (!rangedCombatMiss(this, target) || target.hasStatusEffect("Grappled"))
			{
				output(" It hits, sticking to " + target.getCombatPronoun("o") + " and slowing " + (target is PlayerCharacter ? "you" : "them") + " down.");
				if (!target.hasStatusEffect("Evasion Reduction"))
				{
					target.createStatusEffect("Evasion Reduction", 10, 0, 0, 0, false, "Icon_Splatter", "Goo is stuck to you, reducing your evasion.", true, 0);
				}
				else
				{
					target.addStatusValue("Evasion Reduction",1,10);
				}
				output("\n<i>“Stop moving”</i> the guard cackles. <i>“It'll be over soon”</i>.");
			}
			else  
			{
				if (target is PlayerCharacter) output(" You manage to dodge out of the way.");
				else output(target.getCombatName()  + " manages to dodge out of the way.");
			}
		}
		
		private function harden(target:Creature):void
		{
			output(this.capitalA + " guard shudders for a moment as her shimmering skin flashes brighter, solidifying slightly against attacks.");
			if (!hasStatusEffect("Harden"))
			{
				createStatusEffect("Harden", 0, 30, 0, 0, false, "DefenseUp", "Defense against all forms of attack has been increased!", true, 0);
				baseHPResistances.kinetic.resistanceValue += 20.0;
			}
		}
		
		private function tauntAttack(target:Creature):void
		{
			var damage:TypeCollection;
			var damageResult:DamageResult;
			var dialogChoice:int = rand(4);
			
			if (getVariant() == 1)
			{
				if (dialogChoice == 0) output("<i>“Mmm, bet you like getting hit by my whip!”</i> " + this.a + " guard moans at " + target.getCombatName()  + ".");
				else if (dialogChoice == 1) output("<i>“I bet you love being slapped around by me!”</i> " + this.a + " guard moans at " + target.getCombatName()  + ".");
				else if (dialogChoice == 2) output("<i>“Ahaha, did you forget the safe word?”</i> " + this.a + " guard cackles at " + target.getCombatName()  + ".");
				else output("<i>“Did you think you could fight a big girl like me?”</i> " + this.a + " guard cackles at " + target.getCombatName()  + ".");
			}
			else 
			{
				if (dialogChoice == 0) output("<i>“Mmm, what's wrong? Things getting too hot for you?”</i> " + this.a + " guard moans at " + target.getCombatName()  + ".");
				else if (dialogChoice == 1) output("<i>“Give in, then I can keep you..”</i> " + this.a + " guard moans at " + target.getCombatName()  + ".");
				else if (dialogChoice == 2) output("<i>“Do you love my touch?”</i> " + this.a + " guard sultrily asks " + target.getCombatName()  + ".");
				else output("<i>“Won't you come with me?”</i> " + this.a + " guard moans at " + target.getCombatName()  + ".");
			}
			
			if (target.lust() <= 35)
			{
				damage = new TypeCollection({tease: 1});
			}
			else if (target.lust() <= 70)
			{
				damage = new TypeCollection({tease: 2 + rand(1)});
			}
			else 
			{
				damage = new TypeCollection({tease: 2 + rand(2)});
			}
			
			damageResult = calculateDamage(damage, this, target);
			outputDamage(damageResult);
			output("\n\n");
		}
	}
}
