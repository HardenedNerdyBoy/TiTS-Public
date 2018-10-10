package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Apparel.BaggySwimShorts;
	import classes.kGAMECLASS;
	
	public class Hogan extends Creature
	{
		public function Hogan() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "Hogan";
			this.originalRace = "human";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customDodge = "";
			this.customBlock = "";
			this.isPlural = false;
			         
			this.lowerUndergarment = new BaggySwimShorts();
			
			this.armor.defense = 0;
			this.physiqueRaw = 5;
			this.reflexesRaw = 5;
			this.aimRaw = 1;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 1;
			this.libidoRaw = 50;
			this.HPMod = 20;
			this.shieldsRaw = 0;
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 55;
			
			this.level = 1;
			this.XPRaw = normalXP();
			this.credits = 1000;
			
			this.femininity = 20;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "orange";
			this.tallness = 74;
			this.thickness = 6;
			this.tone = 80;
			this.hairColor = "blonde";
			this.furColor = "";
			this.hairLength = 4;
			this.hairType = GLOBAL.HAIR_TYPE_REGULAR;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "tan";
			this.skinFlags = new Array(GLOBAL.FLAG_SMOOTH);
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_BOVINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 2;
			this.hornType = GLOBAL.TYPE_BOVINE;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_HUMAN;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_BOVINE;
			this.tailCount = 1;
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
			this.hipRatingRaw = 3;
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
			this.buttRatingRaw = 5;
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cType = GLOBAL.TYPE_EQUINE;
			this.cocks[0].cLengthRaw = 12;
			this.cocks[0].cThicknessRatioRaw = 1.4;
			this.cocks[0].virgin = false;
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 35;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 14;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 14;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 30;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 10;
			this.minutesSinceCum = 9999;
			this.timesCum = 899;
			
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = 0;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "brown";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			this.ass.bonusCapacity += 100;
			this.analVirgin = true;
			
			this.version = _latestVersion;
			this._isLoading = false;
		}
	}
}