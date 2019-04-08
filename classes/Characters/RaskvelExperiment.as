package classes.Characters
{
	import classes.Creature;
	import classes.GameData.SingleCombatAttack;
	import classes.GLOBAL;
	import classes.ItemSlotClass;
	import classes.Items.Apparel.RubberBallPouch;
	import classes.Items.Melee.Fists;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Miscellaneous.KnotAProblem;
	import classes.Items.Miscellaneous.Throbb;
	import classes.Items.Transformatives.BreedersBliss;
	import classes.Items.Transformatives.Ruskvel;
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
	import classes.Items.Miscellaneous.NukiCookies;
	
	/**
	 * ...
	 * @author HNB
	 */
	
	public class RaskvelExperiment extends Creature
	{
		//constructor
		public function RaskvelExperiment()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "raskvel experiment";
			this.originalRace = "raskvel";
			this.a = "a ";
			this.capitalA = "A ";
			this.long = "giant balled Raskvel Experiment";
			this.customDodge = "The Raskvel bounces out of the way.";
			this.customBlock = "Your attack is absorbed by the Raskvels' thick rubber ball pouch.";
			this.isPlural = false;
			
			//Melee and ranged weapon not used, just in here for reference
			this.meleeWeapon.baseDamage.kinetic.damageValue = 0;
			this.meleeWeapon.attack = 0;
			this.meleeWeapon.longName = "balls";
			this.meleeWeapon.attackVerb = "bounce";
			this.meleeWeapon.attackNoun = "bounce";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.rangedWeapon.baseDamage.kinetic.damageValue = 0;
			this.rangedWeapon.attack = 0;
			this.rangedWeapon.longName = "cum spurt";
			this.rangedWeapon.attackVerb = "spurt";
			this.rangedWeapon.attackNoun = "cum";
			this.rangedWeapon.hasRandomProperties = true;
						
			this.lowerUndergarment = new RubberBallPouch;

			isLustImmune = true; //He's already so lusty, you think teasing him will give you a win?
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.electric.resistanceValue = 100.0; //Rubber, fuck your electric
			baseHPResistances.kinetic.resistanceValue = 50.0; //He's bouncing around on those balls, attacks should bounce off to a degree
			baseHPResistances.burning.resistanceValue = 0.0; //Melting rubber
			baseHPResistances.freezing.resistanceValue = 0.0; //Freezing him, as he is momentum based
			baseHPResistances.corrosive.resistanceValue = 0.0; //Destroying his rubber pouch, rendering him useless
			
			this.physiqueRaw = 30;
			this.reflexesRaw = 25;
			this.aimRaw = 20;
			this.intelligenceRaw = 4;
			this.willpowerRaw = 12;
			this.libidoRaw = 150;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 85;
			
			this.level = 7;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 135;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 15;
			this.eyeType = GLOBAL.TYPE_RASKVEL;
			this.eyeColor = "orange";
			this.tallness = 50;
			this.thickness = 16;
			this.tone = 74;
			this.hairColor = "blue";
			this.hairType = GLOBAL.TYPE_RASKVEL;
			this.hairLength = 6;			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "light brown";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_RASKVEL;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_RASKVEL;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_RASKVEL;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_RASKVEL;
			this.tailCount = 1;
			this.tailFlags = new Array();
			this.addTailFlag(GLOBAL.FLAG_LONG);
			this.addTailFlag(GLOBAL.FLAG_PREHENSILE);
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
			this.hipRatingRaw = 4;
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
			this.buttRatingRaw = 6;
			
			this.cocks = new Array();
			this.createCock();
			this.cockVirgin = false;
			this.cocks[0].cLengthRaw = 22;
			this.cocks[0].cType = GLOBAL.TYPE_RASKVEL;
			this.cocks[0].cockColor = "purple";
			this.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
			//balls
			this.balls = 1;
			this.cumMultiplierRaw = 60;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 3;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 50;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 500;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9999;
			this.minutesSinceCum = 120;
			this.timesCum = 9001;

			this.impregnationType = "RaskvelPregnancy";

			this.elasticity = 2;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 20.0;
			//this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "purple";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			
			isUniqueInFight = true;
			btnTargetText = "Raskvel Exp.";
			
			sexualPreferences.setPref(GLOBAL.SEXPREF_CUMMY, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_PUSSIES, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_GAPE, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_VAGINAL_WETNESS, GLOBAL.REALLY_LIKES_SEXPREF);
			
			this.createPerk("Juggernaut",0,0,0,0);
			this.createPerk("Single Minded",0,0,0,0);
			
			aThe();
			lootSetup();
			
			kGAMECLASS.tarkusSexperimentSSTDChance(this);
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
				this.a = "a "
				this.capitalA = "A ";
			}
		}
		
		private function lootSetup():void 
		{
			if (rand(32) == 1) this.inventory.push(new RubberBallPouch); //ballpouch
			
			//Cocktail of drugs that they've possibly been given
			if (rand(8) == 1) this.inventory.push(new Throbb); 
			else if (rand(8) == 1) this.inventory.push(new NukiCookies); 
			else if (rand(8) == 1) this.inventory.push(new KnotAProblem); 
			else if (rand(8) == 1) this.inventory.push(new BreedersBliss);
			else if (rand(5) == 1) this.inventory.push(new Ruskvel);
		}
		
		override public function get bustDisplay():String
		{
			return "RASKVEL_EXPERIMENT";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature;
			
			//Grappling cleanup in the case of target death
			if (target != null && target.HP() == 0)
			{
				this.removeStatusEffect("Grappling");
				target = null;
			}
			
			if (target != null && target.hasStatusEffect("Grappled") && target.HP() > 0 && this.hasStatusEffect("Grappling")) //If they grappled a target and the targets alive, keep going.
			{
				target = target;
			}
			else if (target != null && this.hasStatusEffect("Charging") && target.HP() > 0) //If they're charging for someone, stay focused
			{
				target = target;
			}
			else if (target != null && target.shields() <= 0 && (rand(100) >= 70)) //Chance to focus target if non - shielded
			{
				target = target;
			}
			else 
			{
				target = selectTarget(hostileCreatures);
			}
			if (target == null) return;
			
			if (this.hasStatusEffect("SkipTurn")) skipTurn();
			else if (this.hasStatusEffect("Charging")) chargeAttack(target,alliedCreatures,hostileCreatures);
			else if (target.hasStatusEffect("Grappled") && this.hasStatusEffect("Grappling")) grappleAttack(target);
			else if (target.shields() > 0 || !(target.shield is EmptySlot)) scratchAttack(target);
			else
			{
				var attackChoices:Array = new Array();
				
				attackChoices.push(chargeAttack);
				attackChoices.push(chargeAttack);
				attackChoices.push(chargeAttack);
				attackChoices.push(chargeAttack);
				attackChoices.push(scratchAttack);
				attackChoices.push(scratchAttack);
				if (target.shields() <= 0)
				{
					attackChoices.push(cumSpurt);
				}
				if (target.hasStatusEffect("Grappled")){
					attackChoices.push(pileOnGrappled);
					attackChoices.push(pileOnGrappled);
				}
				
				var selected:* = attackChoices[rand(attackChoices.length)];
				
				if (selected == chargeAttack || selected == pileOnGrappled) selected(target,alliedCreatures,hostileCreatures);
				else if (selected is Function) selected(target);
				else (selected as SingleCombatAttack).execute(alliedCreatures, hostileCreatures, this, target);
			}
		}
		
		private function stealItem(target:Creature, slotName:String):void 
		{			
			//Get item and make note of it
			var item:ItemSlotClass;
			if (slotName == "shield")
			{
				item = target.shield.makeCopy();
				target.shield.onRemove(target);
				target.shield = new EmptySlot();
			}
			else if (slotName == "armor")
			{
				item = target.armor.makeCopy();
				target.armor.onRemove(target);
				target.armor = new EmptySlot();
			}
			else if (slotName == "lowerUndergarment")
			{
				item = target.lowerUndergarment.makeCopy();
				target.lowerUndergarment.onRemove(target);
				target.lowerUndergarment = new EmptySlot();
			}
			
			
			if (item != null)
			{
				var pcParty:Array = CombatManager.getFriendlyActors();
				var i:int = 0;
				//Setup the flag if not already set up
				if (flags["COMBAT_STOLEN_ITEMS_PCPARTY"] == undefined)
				{
					flags["COMBAT_STOLEN_ITEMS_PCPARTY"] = new Array();
					for (i = 0; i < pcParty.length; i++ )
					{
						flags["COMBAT_STOLEN_ITEMS_PCPARTY"].push(new Array());
					}
				}
				//Find char in party and add item in array into their index of the flag
				
				for (i = 0; i < pcParty.length; i++ )
				{
					var partyMember:Creature = pcParty[i];
					if (partyMember.neverSerialize == false && partyMember.short == target.short)
					{
						flags["COMBAT_STOLEN_ITEMS_PCPARTY"][i].push(item);
						return;
					}
				}
			}
		}
		
		private function chargeAttack(target:Creature,friendlies:Array, hostiles:Array):void 
		{
			var damage:TypeCollection;
			var damageResult:DamageResult;
			
			var needMoreBounces:Boolean = (target.fullBodyWeight() >= 1000 && statusEffectv1("Charging") < 4);
			
			if (this.hasStatusEffect("Charging") && rand(10) < 7 && !needMoreBounces) //Have them bounce more than once if heavy target
			{
				if (target is PlayerCharacter) output(this.capitalA + "Raskvel leans forward and with his next bounce, comes flying at you at full speed!\n");
				else output(this.capitalA + "Raskvel leans forward and with his next bounce, goes flying towards " + target.short + " at full speed!\n");
				
				if (target.reflexes() > (15 + rand(7 * statusEffectv1("Charging"))))
				{
					if (target is PlayerCharacter) output("You manage to jump out the way just in time and the Raskvel goes sailing past you, crashing into a wall!");
					else output("They manage to jump out the way just in time and the Raskvel goes sailing past, crashing into a wall!");
					
					damage = new TypeCollection( { kinetic: (3 * statusEffectv1("Charging")) } ); //Hurt for 3 times charging count
					damageResult = calculateDamage(damage, this, this);
					outputDamage(damageResult);
				}
				else if (blindMiss(this, target))
				{
					output("Unable to see, he goes sailing past in completely the wrong direction and crashes into a wall!");
					damage = new TypeCollection( { kinetic: (4 * statusEffectv1("Charging")) } ); //Hurt for 4 times charging count
					damageResult = calculateDamage(damage, this, this);
					outputDamage(damageResult);
				}
				else 
				{
					var teaseDmg:int;
					
					//Don't stand fast
					//Char weights for ref
					/*-Anno 637
					-Badger 687
					-Frostwyrm 10907
					-Rival 615
					-Azra 905
					-Del 584*/
					var knockOver:Boolean;
					if (target.fullBodyWeight() < 650){
						if (3 - statusEffectv1("Charging") <= 0) knockOver = true;
						else knockOver = (rand(3 - statusEffectv1("Charging")) == 1);
					}
					else if (target.fullBodyWeight() < 900){
						if (4 - statusEffectv1("Charging") <= 0) knockOver = true;
						else knockOver = (rand(4 - statusEffectv1("Charging")) == 1);
					}
					else if (target.fullBodyWeight() < 1500){
						if (5 - statusEffectv1("Charging") <= 0) knockOver = true;
						else knockOver = (rand(5 - statusEffectv1("Charging")) == 1);
					}
					else{
						if (6 - statusEffectv1("Charging") <= 0) knockOver = true;
						else knockOver = (rand(8 - statusEffectv1("Charging")) == 1);
					}
					
					if (knockOver)
					{
						if (target is PlayerCharacter) output("You can't get out the way in time. His hefty sack pushes slams against you and you collapse to the floor under it! You find yourself pinned to the floor as the Raskvel lies on top of you, laughing. <i>“You're mine now!”</i>\n");
						else output("He slams into them, smothering them balls first, and they collapse to the floor! The Raskvel is slumbered on top of them, laughing. <i>“Mmm, don't you look good!”</i>\n");
					
						if (target.lust() > 70 || target.isCumSlut() || target.isBimbo() || target.sexualPreferences.getPref(GLOBAL.SEXPREF_BALLS) >= GLOBAL.KINDA_LIKES_SEXPREF)
						{
							if (target is PlayerCharacter) output("He's right. It's a real struggle to escape with such hot, heavy balls holding you down.");
							else output("They look pretty red and you're not sure if it's just from the heat of being trapped under the Raskvel.");
						
							teaseDmg = 5 + rand(10);
							damage = new TypeCollection( { kinetic: (5 + rand(2)) * statusEffectv1("Charging") , tease: teaseDmg } ); 
							damageResult = calculateDamage(damage, this, target);
							outputDamage(damageResult);
						}
						else 
						{
							damage = new TypeCollection( { kinetic: (5 + rand(2)) * statusEffectv1("Charging") } ); 
							damageResult = calculateDamage(damage, this, target);
							outputDamage(damageResult);
						}
						
						if (target.fullBodyWeight() < 650) CombatAttacks.applyGrapple(target,80);
						else if (target.fullBodyWeight() < 900) CombatAttacks.applyGrapple(target,70);
						else if (target.fullBodyWeight() < 1500) CombatAttacks.applyGrapple(target,60);
						else CombatAttacks.applyGrapple(target, 65);
						this.createStatusEffect("Grappling", hostiles.indexOf(target));
					}
					else 
					{
						if (target is PlayerCharacter)
						{
							output("You brace for impact, as his hefty balls slam into you! You manage to stand your ground");
							if (target.fullBodyWeight() < 650) output(" despite your petite-ness ");
							else if (target.fullBodyWeight() < 900) output(" ");
							else if (target.fullBodyWeight() < 1500) output(" thanks to your size ");
							else output(" thanks to the sheer weight of you ");
							output("but you're still battered by the force of the impact.");
						}
						else
						{
							output("They brace for impact, and manage to stand their ground against his hefty balls,");
							if (target.fullBodyWeight() < 650) output(" despite their petite-ness ");
							else if (target.fullBodyWeight() < 900) output(" ");
							else if (target.fullBodyWeight() < 1500) output(" thanks to their size ");
							else output(" thanks to their weight ");
							output("but they still look like they took a beating from the force of the impact.");
						}
						
						teaseDmg = ((target.lust() > 70 || target.isCumSlut() || target.isBimbo() || target.sexualPreferences.getPref(GLOBAL.SEXPREF_BALLS) >= GLOBAL.KINDA_LIKES_SEXPREF) ? (6 + rand(5)) : 0)
						damage = new TypeCollection( { kinetic: ((5 * (statusEffectv1("Charging") + 1))) , tease: teaseDmg } );
						damageResult = calculateDamage(damage, this, target);
						outputDamage(damageResult);
					}
				}
				this.removeStatusEffect("Charging");
			}
			else if (this.hasStatusEffect("Charging"))
			{
				if (target.isCumSlut() || target.isBimbo() || target.sexualPreferences.getPref(GLOBAL.SEXPREF_BALLS) > 1.3){
					output(this.capitalA + "raskvel continues to bounce on those big, full balls of his, picking up speed.");
					damage = new TypeCollection( { tease: 1 } );
					damageResult = calculateDamage(damage, this, target);
					outputDamage(damageResult);
				}
				else 
				{
					output(this.capitalA + "raskvel continues to bounce, picking up speed.");
				}
				this.addStatusValue("Charging", 1, 2);
			}
			else 
			{
				if (target is PlayerCharacter){
					output(this.capitalA + "raskvel turns towards you.\n");
					output("You ready to defend against an attack, but instead the Raskvel just bounces on the spot, facing you, increasing his height and speed with each bounce. What is he up to..");
				}
				else{
					output(this.capitalA + "raskvel turns towards " + target.short + ".\n");
					output("They ready to defend against an attack, but instead the Raskvel just bounces on the spot, facing them, increasing his height and speed with each bounce. What is he up to..");
				}
				
				if (target.isCumSlut() || target.isBimbo() || target.sexualPreferences.getPref(GLOBAL.SEXPREF_BALLS) > 1.3){
					if (target is PlayerCharacter) output(" apart from distracting you with those big balls of his of course. Just look at them bounce..");
					else output(" Either way, it seems to at least be distracting your " + target.raceShort + " ally..");
					
					damage = new TypeCollection( { tease: 2 + rand(1) } );
					damageResult = calculateDamage(damage, this, target);
					outputDamage(damageResult);
				}
				this.createStatusEffect("Charging", 2);				
			}
		}
		
		public function struggleBreak(target:Creature,friendlies:Array, hostiles:Array):void 
		{
			var moreRaskvel:Boolean = false;
			
			//Grapple cleanup on target
			for (var experimentPointer:int = 0; experimentPointer < friendlies.length; experimentPointer++)
			{
				//If there's still one grappling target, don't remove the target struggle
				if (friendlies[experimentPointer] is RaskvelExperiment && friendlies[experimentPointer].hasStatusEffect("Grappling") && hostiles[friendlies[experimentPointer].statusEffectv1("Grappling")] == target)
				{
					moreRaskvel = true;
				}
			}
			
			this.removeStatusEffect("Grappling");
			this.createStatusEffect("SkipTurn");
			
			if (moreRaskvel)
			{
				if (target is PlayerCharacter) output("You manage to push against a Raskvel hard enough for him to roll back.");
				else output(target.short + " manages to push against a Raskvel hard enough for him to roll back thinning their assault on " + getCombatPronoun("himher") + ".");
			}
			else 
			{
				if (target is PlayerCharacter) output("You manage to push against the Raskvel hard enough for him to roll back and you slip out from under him and quickly jump back to your [target.feet].");
				else output(target.short + " manages to push against the Raskvel hard enough for him to roll back and for " + getCombatPronoun("himher") + " to slip out from under him and quickly jump back to their [target.feet].");
				target.removeStatusEffect("Grappled");
			}
		}
		
		private function scratchAttack(target:Creature):void 
		{
			var damage:TypeCollection;
			var damageResult:DamageResult;
			
			if (target.shields() > 0)
			{
				if (rand(2) == 1){
					if (target is PlayerCharacter) output("<i>“Get this off!”</i> " + this.capitalA + "Raskvel snarls before bouncing forward and slashing wildly at your shield, causing it to crackle madly.");
					else output("<i>“Get this off!”</i> " + this.capitalA + "Raskvel snarls before bouncing forward and slashing wildly at " + target.short + "'s shield, causing it to crackle madly.");
				}
				else{
					if (target is PlayerCharacter) output("<i>“Let me in!”</i> " + this.capitalA + "Raskvel snarls before bouncing forward and slashing wildly at your shield, causing it to crackle madly.");
					else output("<i>“Let me in!”</i> " + this.capitalA + "Raskvel snarls before bouncing forward and slashing wildly at " + target.short + "'s shield, causing it to crackle madly.");
				}
				
				damage = new TypeCollection({kinetic: 55});
				damage.addFlag(DamageFlag.ONLY_SHIELD);
			}
			else 
			{
				if (target is PlayerCharacter) output(this.capitalA + "Raskvel bounces forward at speed and claws at your side as he passes you.");
				else output(this.capitalA + "Raskvel bounces forward at speed and claws at " + target.short + "'s side as he passes " + target.getCombatPronoun("himher") + ".");
				
				damage = new TypeCollection({kinetic: 5 + rand(10)});
			}
			damageResult = calculateDamage(damage, this, target);
			outputDamage(damageResult);
			
			if (!(target.shield is EmptySlot) && target.shields() <= 0)
			{
				if (rand(2) == 1)
				{
					output("\n\nAs " + (target is PlayerCharacter ? "your" : target.short + "'s") + " " + target.shield.longName + " fizzles out, the Raskvel swoops forward and tears it off!\n\n");
					output("<i>“That's better!”</i> he cackles.\n\n");
					this.stealItem(target, "shield");
				}
				else 
				{
					output("\n\nAs " + (target is PlayerCharacter ? "your" : target.short + "'s") + " " + target.shield.longName + " fizzles out, the Raskvel swoops forward and reaches out for it! But he fumbles it and " + (target is PlayerCharacter ? "you're":"[target.heShe]'s") + " able to move out of his reach.\n\n");
				}
			}
		}
		
		private function cumSpurt(target:Creature):void 
		{
			var damage:TypeCollection;
			var damageResult:DamageResult;
			
			if (target is PlayerCharacter) output(this.capitalA + "Raskvel bounces on the spot. You notice his eyes rolling over your body, examining every inch of your " + (target.isNude() ? "bare flesh." : "body.") + " He rolls back and forth on his balls moaning and suddenly, a full orgasms worth of pre' comes flying from the end of his cock!\n");
			else output(this.capitalA + "Raskvel bounces on the spot, his eyes fixed on " + target.short + ". You notice his eyes rolling over " + target.getCombatPronoun("hisher") + " body, examining every inch of " + target.getCombatPronoun("hisher") + (target.isNude() ? " bare flesh." : " body.") + " He rolls back and forth on his balls moaning and suddenly, a full orgasms worth of pre' comes flying from the end of his cock!\n");
			
			if (target.isCumSlut() && (rand(7) > 4))
			{
				if (target is PlayerCharacter) output("You can't find it in your heart to dodge such a hefty load and the experiment takes notice of this, smiling lecherously at you.\n");
				else output("They just sort of, stand there, as the hefty load splashes against them.\n");
				
				target.applyCumSoaked();
				damage = new TypeCollection( { tease: 8 + rand(7) } );
				damageResult = calculateDamage(damage, this, target);
				outputDamage(damageResult);
			}
			else if(rangedCombatMiss(this, target))
			{
				if (target is PlayerCharacter) output("You fling yourself to one side and the thick spurt splashes against " + (rand(1) == 1 ? "a wall." : "the floor.") + "\n");
				else output("They fling themselves to one side and the thick spurt splashes against " + (rand(1) == 1 ? "a wall." : "the floor.") + "\n");
			}
			else
			{
				output("The experiment cackles loudly as his attack lands, ");
				if (target.hasArmor())
				{
					if (target.lust() > 70 || target.isCumSlut() || target.isBimbo())
					{
						output("soaking " + target.getCombatPronoun("hisher") + " " + target.armor.longName + " in a blast of his hot cum!");
						damage = new TypeCollection( { tease: 5 + rand(7) } );
						damageResult = calculateDamage(damage, this, target);
						outputDamage(damageResult);
					}
					else 
					{
						output("soaking " + target.getCombatPronoun("hisher") + " " + target.armor.longName + " in his seed.");
						damage = new TypeCollection( { tease: 3 + rand(7) } );
						damageResult = calculateDamage(damage, this, target);
						outputDamage(damageResult);
					}
				}
				else if (target.hasUpperGarment())
				{
					if (target.lust() > 70 || target.isCumSlut() || target.isBimbo())
					{
						output("soaking " + target.getCombatPronoun("hisher") + " " + target.upperUndergarment.longName + " in a blast of his hot cum!");
						damage = new TypeCollection( { tease: 6 + rand(7) } );
						damageResult = calculateDamage(damage, this, target);
						outputDamage(damageResult);
					}
					else 
					{
						output("soaking " + target.getCombatPronoun("hisher") + " " + target.upperUndergarment.longName + " in his seed.");
						damage = new TypeCollection( { tease: 4 + rand(7) } );
						damageResult = calculateDamage(damage, this, target);
						outputDamage(damageResult);
					}
				}
				else 
				{
					if (target.lust() > 70 || target.isCumSlut() || target.isBimbo())
					{
						output("soaking " + target.getCombatPronoun("hisher") + " " + target.skinFurScales() + " in a blast of his hot cum!");
						damage = new TypeCollection( { tease: 7 + rand(7) } );
						damageResult = calculateDamage(damage, this, target);
						outputDamage(damageResult);
					}
					else 
					{
						output("soaking " + target.getCombatPronoun("hisher") + " " + target.skinFurScales() + " in his seed.");
						damage = new TypeCollection( { tease: 5 + rand(7) } );
						damageResult = calculateDamage(damage, this, target);
						outputDamage(damageResult);
					}
				}
				target.applyCumSoaked();
				output("\n");
			}
		}
		
		private function grappleAttack(target:Creature):void
		{
			var damage:TypeCollection;
			var damageResult:DamageResult;
			
			if (target.hasArmor())
			{
				if (rand(3) == 1)
				{
					output("Running his hands over " + (target is PlayerCharacter ? "your" : target.short + "'s") + " body, " + this.a + "experiment hurriedly tears off " + target.getCombatPronoun("hisher") + " " + target.armor.longName + ".\n");
					this.stealItem(target, "armor");
					damage = new TypeCollection( { tease: 2 + rand(3) } );
					damageResult = calculateDamage(damage, this, target);
					outputDamage(damageResult);
				}
				else 
				{
					output("Running his hands over " + (target is PlayerCharacter ? "your" : target.short + "'s") + " body, " + this.a + "experiment fumbles with " + target.getCombatPronoun("hisher") + " " + target.armor.longName + ".\n");
					damage = new TypeCollection( { tease: 2 + rand(3) } );
					damageResult = calculateDamage(damage, this, target);
					outputDamage(damageResult);
				}
			}
			else if (target.hasLowerGarment())
			{
				if (rand(2) == 1)
				{
					output("Running his hands over " + (target is PlayerCharacter ? "your" : target.short + "'s") + " body, " + this.a + "experiment hurriedly tears off " + target.getCombatPronoun("hisher") + " " + target.lowerUndergarment.longName + ".\n");
					this.stealItem(target, "lowerUndergarment");
					damage = new TypeCollection( { tease: 2 + rand(5) } );
					damageResult = calculateDamage(damage, this, target);
					outputDamage(damageResult);
				}
				else 
				{
					output("Running his hands over " + (target is PlayerCharacter ? "your" : target.short + "'s") + " body, " + this.a + "experiment fumbles with " + target.getCombatPronoun("hisher") + " " + target.lowerUndergarment.longName + ".\n");
					damage = new TypeCollection( { tease: 2 + rand(5) } );
					damageResult = calculateDamage(damage, this, target);
					outputDamage(damageResult);
				}
			}
			else 
			{
				output(this.capitalA + "raskvel strokes " + (target is PlayerCharacter ? "your" : target.short + "'s") + " body with his scaly hands as his giant balls pin " + (target is PlayerCharacter ? "you" : "them") + " to the ground. His hands run over " + target.getCombatPronoun("hisher") + " exposed [target.skinFurScales], grasping at " + target.getCombatPronoun("hisher") + " [target.chest], " + target.getCombatPronoun("hisher") + " [target.butt], fondling at " + target.getCombatPronoun("hisher") + " groin. He rocks his balls back and forth, grinding his giant, knotted cock against " + target.getCombatPronoun("hisher") + " [target.belly].\n");
				applyDamage(new TypeCollection( { tease: 10 + rand(8) } ), this, target, "minimal");
				target.energy(-5);
				//Lust 0-80:
				if(target.lust() < 75) output((target is PlayerCharacter ? " You feel hot and drained underneath him." : " " + StringUtil.capitalize(target.getCombatPronoun("heshe")) + " looks hot and drained underneath him.") );
				else{
					if (target is PlayerCharacter) output(" It’s impossible not to feel warm and aroused underneath this exhausting, persistent attention. You find yourself wondering if you are thrusting against the Raskvel to push him off, or simply to touch him back.\n");
					else output(" " + StringUtil.capitalize(target.getCombatPronoun("heshe")) + " looks hot underneath all that attention and you notice them, perhaps subconsciously, thrusting themselves against the Raskvel.\n");
				}
			}
		}
		
		public function pileOnGrappled(target:Creature,friendlies:Array, hostiles:Array):void 
		{
			output("Another experiment piles on top of " + (target is PlayerCharacter ? "you" : target.short) + "!\n");
			this.createStatusEffect("Grappling",hostiles.indexOf(target));
		}
		
		public function skipTurn():void 
		{
			output(this.capitalA + "experiment rolls around, recovering from being shoved off.\n");
			this.removeStatusEffect("SkipTurn");
		}
	}
}
