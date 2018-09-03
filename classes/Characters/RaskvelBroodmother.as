package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.BreastRowClass;
	
	// Purely used for her impregnating you, if she's been given throbb. Other facts are in here but only for consistency.
	public class RaskvelBroodmother extends Creature
	{
		//constructor
		public function RaskvelBroodmother()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Raskvel Broodmother";
			this.originalRace = "raskvel";
			this.a = "";
			this.capitalA = "";
			this.isPlural = false;
			this.femininity = 85;
			this.hairType = GLOBAL.HAIR_TYPE_FEATHERS;
			this.hairColor = "blue";
			this.tallness = 4 * 12;
			this.eyeColor = "red orange";
			this.skinTone = "purple";
			this.skinFlags = [GLOBAL.FLAG_SMOOTH];
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.earType = 0;
			this.eyeType = GLOBAL.TYPE_RASKVEL;
			this.beardLength = 0;
			this.lipColor = "dark blue";
			this.tongueType = GLOBAL.TYPE_RASKVEL;
			this.armType = GLOBAL.TYPE_RASKVEL;
			this.faceType = GLOBAL.TYPE_RASKVEL;
			this.faceFlags = [GLOBAL.FLAG_SMOOTH];
			this.legType = GLOBAL.TYPE_RASKVEL;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			this.nipplesPerBreast = 1;
			this.nippleColor = "purple";
			this.tailType = GLOBAL.TYPE_RASKVEL;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_LONG, GLOBAL.FLAG_PREHENSILE];
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].type = GLOBAL.TYPE_RASKVEL;
			this.vaginas[0].hymen = false;
			this.vaginas[0].vaginaColor = "purple";
			this.vaginalVirgin = false;
			this.analVirgin = false;
			
			this.hairLength = 32;
			this.tone = 5;
			this.thickness = 96;
			this.lipMod = 2;
			this.horns = 0;
			this.hornType = GLOBAL.TYPE_BOVINE;
			this.breastRows[0].breastRatingRaw = 20;
			this.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
			this.hipRatingRaw = 30;
			this.buttRatingRaw = 30;
			this.bellyRatingRaw = 95;
			this.impregnationType = "RaskvelPregnancyHandler"; //I cba write a pregnancy handler on the offchance she's a futa. Siring is the main goal here.
		}
		
		public function configLevel(lvl:int):void
		{
			switch (lvl){
				case 0:
					this.hairLength = 8;
					this.tone = 15;
					this.thickness = 20;
					this.lipMod = 0;
					this.breastRows[0].breastRatingRaw = 4;
					this.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
					this.hipRatingRaw = 5;
					this.buttRatingRaw = 6;
					this.bellyRatingRaw = 5;
					this.vaginas[0].wetnessRaw = 2;
					this.vaginas[0].loosenessRaw = 2;
					this.vaginas[0].bonusCapacity = 220 + (lvl * 120);
					this.vaginas[0].vagooFlags = [GLOBAL.FLAG_LUBRICATED];
					this.ass.wetnessRaw = 0;
					this.ass.bonusCapacity += 20;
					this.ass.loosenessRaw = 0;
				case 1:
					this.hairLength = 14;
					this.tone = 12;
					this.thickness = 25;
					this.lipMod = 1;
					this.breastRows[0].breastRatingRaw = 10;
					this.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
					this.hipRatingRaw = 10;
					this.buttRatingRaw = 10;
					this.bellyRatingRaw = 10;
					this.vaginas[0].wetnessRaw = 2;
					this.vaginas[0].loosenessRaw = 2;
					this.vaginas[0].bonusCapacity = 220 + (lvl * 120);
					this.vaginas[0].vagooFlags = [GLOBAL.FLAG_LUBRICATED];
					this.ass.wetnessRaw = 0;
					this.ass.bonusCapacity += 25;
					this.ass.loosenessRaw = 1;
				case 2:
					this.hairLength = 25;
					this.tone = 8;
					this.thickness = 35;
					this.lipMod = 1;
					this.breastRows[0].breastRatingRaw = 28;
					this.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
					this.hipRatingRaw = 15;
					this.buttRatingRaw = 13;
					this.bellyRatingRaw = 24;
					this.vaginas[0].wetnessRaw = 2;
					this.vaginas[0].loosenessRaw = 2;
					this.vaginas[0].bonusCapacity = 220 + (lvl * 120);
					this.vaginas[0].vagooFlags = [GLOBAL.FLAG_LUBRICATED];
					this.ass.wetnessRaw = 0;
					this.ass.bonusCapacity += 30;
					this.ass.loosenessRaw = 1;
				case 3:
					this.hairLength = 28;
					this.tone = 6;
					this.thickness = 45;
					this.lipMod = 1;
					this.breastRows[0].breastRatingRaw = 40;
					this.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
					this.hipRatingRaw = 15;
					this.buttRatingRaw = 18;
					this.bellyRatingRaw = 50;
					this.vaginas[0].wetnessRaw = 3;
					this.vaginas[0].loosenessRaw = 3;
					this.vaginas[0].bonusCapacity = 220 + (lvl * 120);
					this.vaginas[0].vagooFlags = [GLOBAL.FLAG_LUBRICATED];
					this.ass.wetnessRaw = 1;
					this.ass.bonusCapacity += 40;
					this.ass.loosenessRaw = 1;
				case 4:
					this.hairLength = 32;
					this.tone = 5;
					this.thickness = 96;
					this.lipMod = 2;
					this.horns = 0;
					this.hornType = GLOBAL.TYPE_BOVINE;
					this.breastRows[0].breastRatingRaw = 50;
					this.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
					this.hipRatingRaw = 30;
					this.buttRatingRaw = 20;
					this.bellyRatingRaw = 95;
					this.vaginas[0].wetnessRaw = 3;
					this.vaginas[0].loosenessRaw = 3;
					this.vaginas[0].bonusCapacity = 220 + (lvl * 120);
					this.vaginas[0].vagooFlags = [GLOBAL.FLAG_LUBRICATED];
					this.ass.wetnessRaw = 1;
					this.ass.bonusCapacity += 50;
					this.ass.loosenessRaw = 2;
				case 5:
					this.hairLength = 35;
					this.tone = 3;
					this.thickness = 98;
					this.lipMod = 2;
					this.horns = 0;
					this.hornType = GLOBAL.TYPE_BOVINE;
					this.breastRows[0].breastRatingRaw = 50;
					this.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
					this.hipRatingRaw = 30;
					this.buttRatingRaw = 20;
					this.bellyRatingRaw = 95;
					this.vaginas[0].wetnessRaw = 4;
					this.vaginas[0].loosenessRaw = 4;
					this.vaginas[0].bonusCapacity = 220 + (lvl * 120);
					this.vaginas[0].vagooFlags = [GLOBAL.FLAG_LUBRICATED];
					this.ass.wetnessRaw = 1;
					this.ass.bonusCapacity += 55;
					this.ass.loosenessRaw = 2;
					this.ass.vagooFlags = [GLOBAL.FLAG_PLUGGED];
				case 6:
					this.hairLength = 35;
					this.tone = 3;
					this.thickness = 98;
					this.lipMod = 3;
					this.horns = 0;
					this.hornType = GLOBAL.TYPE_BOVINE;
					this.breastRows[0].breastRatingRaw = 50;
					this.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
					this.hipRatingRaw = 30;
					this.buttRatingRaw = 20;
					this.bellyRatingRaw = 95;
					this.vaginas[0].wetnessRaw = 4;
					this.vaginas[0].loosenessRaw = 4;
					this.vaginas[0].bonusCapacity = 220 + (lvl * 120);
					this.vaginas[0].vagooFlags = [GLOBAL.FLAG_LUBRICATED];
					this.ass.wetnessRaw = 1;
					this.ass.bonusCapacity += 55;
					this.ass.loosenessRaw = 2;
					this.ass.vagooFlags = [GLOBAL.FLAG_PLUGGED];
			}
		}
		
		public function configFuta(lvl:int):void
		{						
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cThicknessRatioRaw = (lvl >= 4 ? 1.5 : 1);
			this.cocks[0].cLengthRaw = (4 + (lvl * 1.5));
			this.cocks[0].addFlag(GLOBAL.FLAG_TAPERED);
			this.cocks[0].cType = GLOBAL.TYPE_RASKVEL;
			this.cocks[0].cockColor = "purple";
			this.balls = 1;
			this.cumMultiplierRaw = 5 + (lvl * 5);
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 5 + (lvl * 5);
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 30;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 200;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.timesCum = 0;
			this.minutesSinceCum = 9999;
		}
		
		public function configTreated(lvl:int):void
		{			
			this.horns = 2;
			
			this.milkMultiplier = 1;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = (lvl * 2);
			
			this.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_FUCKABLE;
			this.breastRows[1] = new BreastRowClass();
			this.breastRows[1].nippleType = GLOBAL.NIPPLE_TYPE_FUCKABLE;
			this.breastRows[1].breastRatingRaw = this.breastRows[0].breastRatingRaw;
			this.breastRows[2] = new BreastRowClass();
			this.breastRows[2].nippleType = GLOBAL.NIPPLE_TYPE_FUCKABLE;
			this.breastRows[2].breastRatingRaw = this.breastRows[0].breastRatingRaw;
			
			this.nippleColor = "pink";
			this.nippleLengthRatio = 4;
			this.nippleWidthRatio = 2.5;
			
			this.vaginas[0].wetnessRaw += 2; 
			this.clitLength += 2;
		}
	}
}
