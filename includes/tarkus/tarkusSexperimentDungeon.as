import classes.ItemSlotClass;
import classes.Items.Apparel.BunnyOutfit;
import classes.Items.Miscellaneous.TarkusDungeonKey;
import classes.Items.Apparel.RubberBallPouch;

/**
 * ...
 * @author HNB
 */

 // Buying the key from normal badger
 public function buyKeyFromBadger(item:ItemSlotClass):void
 {
	author("HNB");
	clearOutput();
	clearMenu();
	showDrBadger();
	
	if (pc.isBimbo()){
		output("<i>“Ohmygosh can I have that shiny key?!”</i> you ask, shoving credits into Dr.Badgers outstretched paws.");
		output("\n\nA second later, having caught up to your erratic outburst, she reaches a paw into the display and pulls the key out, handing it to you.");
		output("\n\n<i>“Thanks!!”</i> you grin, pushing the key into your inventory, completely content with having absolutely no idea what it's for.");
		output("\n\n<i>“No, thank you, my pet!”</i> she smirks. <i>“I hope you.. have fun with it.”</i>");
		output("\n\nGosh, she's so nice.");
	}
	else{
		output("<i>“So, that key's for sale, huh?”</i> you ask.");
		output("\n\n<i>“Oh yes!”</i> she grins. <i>“Do you want it?”</i>");
		output("\n\nYou lower your eyebrows in suspicion. <i>“What's it for?”</i>");
		output("\n\nShe grins. <i>“Oh, that's for me to know.. and for you to find out”</i>");
		output("\n\n<i>“Well, I suppose I wouldn't be much of a rusher if I wasn't prepared to go to mysterious places that I know nothing about. Fine! Hand it over.”</i> you respond, forking over a handful of credits.");
		output("\n\nSmiling, the doctor reaches into the cabinet, grabs the key and hands it over to you.");
		output("\n\n<i>“Thank you for your business!”</i> she smirks. <i>“I hope you.. have fun with it.”</i>");
	}
	
	var price:Number = getBuyPrice(chars["DRBADGER"],item.basePrice);
	output("\n\nYou purchase " + item.description + " for " + num2Text(price) + " credits.");
	output("\n\n");
	
	processTime(2);
	obtainKey(true);
 }
 
 // Obtaining the key if badger is a bimbo
 public function takeKeyFromBadger():void
 {
	author("HNB");
	clearOutput();
	clearMenu();
	showDrBadger();
	
	var item:ItemSlotClass = new TarkusDungeonKey();
	
	if (pc.isBimbo()){
		output("<i>“Ohmygosh can I have that shiny key?!”</i> you ask, pointing to a key you see on the floor.");
	}
	else{
		output("<i>“Uhh, don't suppose I can have that key?”</i> you ask, pointing to a key you see on the floor.");
	}
	output("\n\n<i>“Ooh, the fun key??”</i> she squeals back. <i>“Sure, take it, take it!”</i>");
	output("\n\n");
	
	processTime(2);
	obtainKey(false);
 }
 
 public function obtainKey(bought:Boolean):void 
 {
	var itemList:Array = [];
	var item:ItemSlotClass = new TarkusDungeonKey()
	itemList.push(item);
	
	if (bought) pc.credits -= (item.basePrice * chars["DRBADGER"].sellMarkup);
	
	itemCollect(itemList);
	flags["TARKUS_DUNGEON_KEY_BOUGHT"] = true;
	
	if (flags["BADGER_QUEST"] == -3) addButton(0, "Next", doctorBimboBadgerMenu);
	else addButton(0, "Next", drBadgerBuyMenu);
 }
 
 //Entry
 public function sexperimentHatchFunction():void 
{
	author("HNB");
	
	if (rustPlainsEncounters() == false)
	{
		if (pc.hasItemByClass(TarkusDungeonKey) && flags["TARKUS_DUNGEON_KEY_USED"] == undefined)
		{
			output("\n\nNow you look closer at the machinery to the east, you notice a keyhole present on what you'd assumed to be a piece of machinery embedded into the floor. Now you look at it closer, it looks more like a hatch!");
			addButton(0,"Use key",useSexperimentKey)
		}
		else if (flags["TARKUS_DUNGEON_KEY_USED"] == true)
		{
			output("\n\nThe hatch you previously found is unsurprisingly still present, alongside the machinery.");
			addButton(0,"Enter hatch",enterSexperimentDungeon)
		}
	}
}

 public function useSexperimentKey():void 
 {
	clearOutput();
	clearMenu();
	 
	author("HNB");
	
	output("You pull the key out and push it into the hole.\n\nIt fits! As you twist it, the hatch springs open and you hop down, into the dimly lit depths, pulling the hatch shut as you descend.");
	 
	flags["TARKUS_DUNGEON_KEY_USED"] = true;
	pc.destroyItemByClass(TarkusDungeonKey);
	addButton(0, "Next", showSexperimentDungeonEntrance);
 }
 
 public function enterSexperimentDungeon():void 
 {
	clearOutput();
	clearMenu();
	
	author("HNB");
	 
	output("You grab the edges of the hatch and prise it open. You pull at it, lifting the heavy metal until it creaks to a halt and quickly, you hop down, into a shallow but dimly lit hole, slamming it shut with you.");
	 
	addButton(0, "Next", showSexperimentDungeonEntrance);
 }
 
 public function showSexperimentDungeonEntrance():void 
 {
	moveTo("SEXPERIMENT_DUNGEON_1_ENTRANCE");
	mainGameMenu();
 }
 
 public function showSexperimentExitButton():void 
 {
	author("HNB");
	addButton(0, "Exit", exitSexperimentDungeon);
 }
 
 public function exitSexperimentDungeon():void 
 {
	clearOutput();
	clearMenu();
	
	author("HNB");
		
	output("You push the hatch open and hoist yourself up, back to the surface."); 
	addButton(0, "Next", exitSexperimentDungeon_2);
 }
 
 public function exitSexperimentDungeon_2():void 
 {
	moveTo("262");
	mainGameMenu();
 }
 
 public function sexperimentDungeonEncounter_Level1():Boolean 
 {
	author("HNB");
	 
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["SEXPERIMENT_STEP"] == undefined) flags["SEXPERIMENT_STEP"] = 1;
	else flags["SEXPERIMENT_STEP"]++;

	//If walked far enough w/o an encounter
	if(flags["SEXPERIMENT_STEP"] >= 4 && rand(4) == 0) {
		//Reset step counter
		flags["SEXPERIMENT_STEP"] = 0;
		
		var e:Array = [];
		
		e.push( { v: encounterRaskExperiment, w: 2});
		if (flags["SEXPERIMENT_DUNGEON_DEFEATED_GOOGIRLS"] == undefined) e.push( { v: encounterGooGuard, w: 1});
		
		//Run the event
		weightedRand(e)();
		return true;
	}
	return false;
 }
 
 public function escapeGame():void
 {
	author("HNB");
	clearOutput();
	clearMenu();
	clearBust();
	showLocationName();
	
	if ((GetGameTimestamp() - flags["SEXPERIMENT_DUNGEON_CAPTURETIME"]) >= 15)
	{
		output("You see a black and white figure pass the window. Shoot, she's here!\n\n");
		addButton(0,"Continue",escapeGame_BadEnd);
	}
	else
	{
		output("You're shackled to a wall, in one of the dungeons cells. You have to find a way to escape!\n\n");
		if ((GetGameTimestamp() - flags["SEXPERIMENT_DUNGEON_CAPTURETIME"]) >= 10)
		{
			output("It's been at least 10 minutes now! Badger will be here soon and then there's no telling what will happen!\n\n");
		}
		else if ((GetGameTimestamp() - flags["SEXPERIMENT_DUNGEON_CAPTURETIME"]) >= 5)
		{
			output("It's been about 5 minutes now! You need to hurry!\n\n");
		}
		
		var buttonIndex:int = 3;
		
		addButton(0, "Struggle", escapeGame_Struggle);
		addButton(1, "Break chains", escapeGame_StrengthEscape);
		addButton(2, "Wriggle free", escapeGame_Wiggle);
		if (pc.characterClass == GLOBAL.CLASS_SMUGGLER){
			addButton(buttonIndex, "Pick shackles", escapeGame_LockPick);
			buttonIndex++;
		}
		if (pc.hasPerk("Static Burst") && pc.energy() > 0){
			addButton(buttonIndex, "Static burst", escapeGame_StaticBurst);
			buttonIndex++;
		}
		if (pc.hasStatusEffect("Cum Soaked") || pc.hasStatusEffect("Pussy Drenched") || pc.hasStatusEffect("Milk Bathed"))
		{
			addButton(buttonIndex, "Slip out", escapeGame_SlipOut);
			buttonIndex++;
		}
		if (flags["SEXPERIMENT_DUNGEON_READ_SHACKLEPASSWORD"] == true)
		{
			addButton(13, "Safe word", escapeGame_SafeWord);
		}
		addButton(14, "Give up", escapeGame_GiveUp);
	}
 }
 
 private function escapeGame_GiveUp():void 
 {
	clearOutput();
	clearMenu();
	author("HNB");
	
	output("You let the fight out of your body. There's no point fighting this, you may as well wait for badger to arrive.\n\n");
	output("You wait there, doing nothing, until the black and white figure you were expecting passes the window.");
	processTime(15 - (GetGameTimestamp() - flags["SEXPERIMENT_DUNGEON_CAPTURETIME"]));
	addButton(0, "Next", escapeGame_BadEnd);
 }
 
 private function escapeGame_BadEnd():void
 {
	clearOutput();
	clearMenu();
	author("HNB");
	
	showBust(drBadgerBustDisplay());
	
	if(flags["BADGER_QUEST"] == -3)
	{
		output("She giggles as she catches sight of you. <i>“Oh heyy, it's you again! Are you having fun down here?”</i>\n\n");
	}
	else 
	{
		output("She cackles as she catches sight of you. <i>“Ahh, Steele, I was hoping this would happen.”</i>\n\n");
	}
	
	if (pc.isBimbo()){
		output("<i>“Heyya badger! Don't suppose you could let me down?”</i> you ask nicely.\n\n");
	}
	else if (pc.isBro() || pc.isAss()){
		output("<i>“Let me the fuck down, you " + (flags["BADGER_QUEST"] == -3 ? "dumb" : "") + " bitch!”</i> you shout.\n\n");
	}
	else{
		output("<i>“If you let me down now, I won't report you to the UGC”</i> you snap back.\n\n");
	}
	
	if(flags["BADGER_QUEST"] == -3)
	{
		output("<i>“Oh, I, like, can't let you go”</i> she giggles. <i>“You're my toy now! Isn't that totally amazing?!”</i>\n\n");
		output("<i>“What're you going to do?!”</i> you shout.\n\n");
		output("<i>“Experiments!”</i> the bimbo shouts happily.\n\n");
		
		if (pc.isBimbo())
		{
			output("Woah, badger performing experiments on you? She's pretty smart, it'd be like, totally amazing to see what she could do to you.\n\n");
			addButton(0, "Next", escapeGame_BadEnd_Bimbadger_Willing);
		}
		else{
			output("Oh no. This dumb slut performing experiments on you?! You're in serious danger.\n\n");
			addButton(0, "Next", escapeGame_BadEnd_Bimbadger_Unwilling);
		}
	}
	else 
	{
		output("She cackles hysterically. <i>“Oh, Steele, Steele, Steele. Why would I let you go? You're going to be my test subject.. well, another test subject anyway.”</i>\n\n");
		
		if (pc.isBimbo())
		{
			output("Woah, badger performing experiments on you? She's like, super smart, it'd be totally amazing to see what she could do to you.\n\n");
			addButton(0, "Next", escapeGame_BadEnd_Badger_Willing);
		}
		else{
			output("Oh no. This mad slut performing experiments on you?! You're in serious danger.\n\n");
			addButton(0, "Next", escapeGame_BadEnd_Badger_Unwilling);
		}
	}
	
	processTime(2);
 }
 
 //Bimbadger is interested in sex gadgets and dick.
 private function escapeGame_BadEnd_Bimbadger_Willing():void
 {
	clearOutput();
	clearMenu();
	author("HNB");
	
	showBust(drBadgerBustDisplay());
	
	output("<i>“Okay!”</i> you shout, grinning. <i>“What've you got Doc?”</i>\n\n");
	if (!pc.isNude()) output("<i>“Well, you should probably be naked for this. Why are you even wearing clothes”</i> Badger says with a confused look on her face, before sauntering over and tearing your [pc.clothes] off with her claws.\n\n");
	output("<i>“Alrighty! Well first we need to see how good these are!”</i> she says, pulling a remote from between her hefty breasts and pressing a big red button on it.\n\n");
	
	//Experiment 1: Badger dildos
	output("As she does this, you hear a creaking noise and you look down to see that a tile below you has opened up and two large black dildos based on badgers cock are slowly being raised out from beneath it on mechanical arms.\n\n");
	output("<i>“Wow, those look awesome badger!”</i> you exclaim in awe? <i>“Are you going to sell them and make lots of money for like, sexy clothes and stuff?!”</i>\n\n");
	if (pc.hasVagina())
	{
		output("<i>“Yep!”</i> she nods. <i>“If they feel good of course! They need more testing, so let me know!”</i>\n\n");
	}
	else 
	{
		output("<i>“Yep!”</i> she nods. <i>“If they feel good of course! They need more testing though, so you'll need to test it. Oh, you'll need a lovely, yummy pussy first though!”</i>\n\n");
		output("As she says this, she opens the medicine trolley to your side and picks up a oversized pink medipen. She twists a black paw around the cap popping it off before jamming the medipen into your arm.\n\n");
		output("You feel a burning in your face and your nose feels tingly. <i>“ACHOOO!”</i>. As you sneeze, your nose feels like it explodes and when you open your eyes you see a small 4 inch penis dangling from where your nose used to be.\n\n");
		output("<i>“WHOOPSIE!”</i> the now giggling doc exclaims. <i>“Wrong one!”</i>\n\n");
		output("She picks up a different medipen and jams that one in. This time you feel a sudden shift inside you and a distinct pleasure sinking into your crotch. With a shudder a fresh slit opens");
		if(pc.legCount == 2) output(" between your [pc.legs]");
		else output(" at your crotch");
		output(", and you can’t help but smile dopily as you feel it become wonderfully slick and deep.\n\n");
		pc.createVagina();
		pc.vaginas[0].wetnessRaw = 3;
		pc.vaginas[0].loosenessRaw = 2;
		pc.vaginas[0].bonusCapacity = 20;
		pc.vaginas[0].vaginaColor = "black";
		output("<i>“That's the one doc!”</i> you giggle. <i>“And it feels amaaaaazing!”</i>\n\n");
		output("<i>“Awesome!”</i> she giggles. <i>“Now for the first test!”</i>\n\n");
	}
	output("As she says this, the doctor taps the big red button again and the big badger cocks shoot up, lube dripping from them as they thrust into your [pc.vagina 0] and [pc.asshole]. Once in, both of them start spinning left and right, brushing against your insides as they revolve and bounce up and down, their thick, rounded shapes making a mockery of your slutty holes as they plow them agape.\n\n");
	output("<i>“Oh fuck, yeah they're really good”</i> you moan, dropping your head back from the double dose of cock you're getting.\n\n");
	output("<i>“Great! I'll try them out again later and then they'll be good to go! You want them to stay in?”</i>\n\n");
	output("<i>“Oh yeah, keep them in”</i> you moan, ");
	if (pc.vaginas[0].wetnessRaw >= 3) output("[pc.girlcum] dripping from your pussy.\n\n");
	else output("as they continue to fuck your insides.\n\n");
	//Experiment 2: Removing all intelligence because it'd make you an object and then you can have sex all the time.
	output("<i>“Okay, so next, I've come up with something else that's totally awesome!”</i> badger squeals, picking up another medipen from the trolley. <i>“This will remove all of somebody's intelligence!”</i>\n\n");
	output("<i>“Huh, why?”</i> you respond, confused as usual.\n\n");
	output("<i>“Well, sex toys don't have any intelligence, right? And they get to have sex all the time, so if we remove your intelligence, you'll get to have sex all the time, which is like, the best!”</i>\n\n");
	output("<i>“OMG, you're brilliant doc!”</i> you respond in awe, convinced by badgers flawless reasoning. <i>“Jab me!”</i>\n\n");
	output("Badger nods and pushed the medipen into your arm.\n\n");
	if (pc.intelligence() >= 4) output("You feel your brain dull, to the point that your head feels almost completely empty. All your remaining smarts seem to have gone. Whatever who needs them!\n\n");
	else output("You feel your brain dull, to the point that your head feels almost completely empty, which isn't much different to before. Maybe you didn't have many smarts in the first place.\n\n");
	output("<i>“Is it working?”</i> Badger asks excitedly, jumping up and down on the spot.\n\n");
	output("You let out a “hmm” sound. You, like, dunno.\n\n");
	output("Badger lets out a similar “hmm” sound. <i>“Okay”</i> she says, having come up with an idea. <i>“This is going to be hard, but let's try some maths! What is - and careful this is a tricky one - one plus one?”</i>\n\n");
	output("What's she on about? What's a one? You let out another confused noise and shake your head.\n\n");
	output("<i>“Hooray, it's worked!”</i> Badger exclaims. <i>“Alright so here's another one..”</i>\n\n");
	
	output("You remain happily, locked up in that cell. You're no longer shackled up but they do lock the door, to stop you wandering off. Not that you'd want to. Down there you get to help the Doctor out with her super smart experiments which are already proven to be beneficial. The lack of intelligence seems to be working, you're getting a lot more sex now, even if it means you can't form words any more - but who ever needed words. ");
	output("The other experiments and even the guards often wander into your cell and fuck you for a bit, which is great for you! ");
	if (!pc.hasCock()) output("Badger gave you a cock just like hers! So you've got something for everyone down there. ");
	output("Yep, like as Badgers test subject is just perfect!");
	
	//Effects
	pc.intelligence( -pc.intelligence());
	pc.willpower( -pc.willpower());
	
	badEnd();
 }
 
 private function escapeGame_BadEnd_Bimbadger_Unwilling():void
 {
	clearOutput();
	clearMenu();
	author("HNB");
	
	showBust(drBadgerBustDisplay());
	
	output("<i>“I'm not taking part in your stupid experiments!”</i> you shout at Badger, thrashing about in your shackles. <i>“Now let me go!”</i>\n\n");
	output("<i>“Oh dear”</i> Badger says, tutting. <i>“But they're so much fun!”</i>\n\n");
	output("You go to object but she looks spaced out. <i>“Badger, can you not space out when you're confronting me please!”</i> you shout at her.\n\n");
	output("She looks around before snapping back to you. <i>“Oh, right sorry, I was daydreaming. What was your problem?”</i>\n\n");
	output("<i>“My problem is, you've got me locked up in your creepy dungeon and I don't want to be here!”</i> you shout. Her ditziness is usually something you can deal with but now is not the time for it.\n\n");
	output("She puts a hand on her hip and scratches her head. <i>“And you want me to fix that?”</i>\n\n");
	output("<i>“Yes!!!”</i> you bellow.\n\n");
	output("<i>“Ooooooh... alright!”</i> she says grinning. She reaches around behind her wide waistline, whips out the bimbo ray and fires it at you! <i>“There, now you'll want to be here!”</i> she exclaims.\n\n");
	
	//Bimbofy them, swap to other ending and then go "How about now"?
	output("You want to shout at her but your body feels so warm and your brain so tingly and fogged over that you don't have the will to. You can feel your body changing and with the warmth and the shifting you feel so exhausted you have to close your eyes until it stops.\n\n");
	output("When it finally stops, you look down to see you look just like her.\n\nThat's amazing!\n\n");
	//Need to change vagina and ass to badgery for next scene, as well as any bimbo perks and visible stats. Don't bother actually bimbo-ing other physical attributes because we're badending anyway.
	if(pc.ass.wetnessRaw < 2)
	{
		pc.ass.wetnessRaw = 2;
	}
	if(!pc.hasVagina())
	{
		pc.createVagina();
		pc.vaginas[0].wetnessRaw = 3;
		pc.vaginas[0].loosenessRaw = 2;
		pc.vaginas[0].bonusCapacity = 20;
		pc.vaginas[0].vaginaColor = "black";
	}
	else if(pc.hasVagina())
	{
		if (pc.vaginas[0].bonusCapacity < 20) pc.vaginas[0].bonusCapacity = 20;
		if (pc.vaginas[0].wetnessRaw < 3) pc.vaginas[0].wetnessRaw = 3;
	}
	//[Reduce PC intelligence to minimum of 20]
	pc.libido(10);
	pc.intelligence( -15);
	if (pc.intelligence() < 20) pc.intelligence(20 - pc.intelligence());
	
	output("<i>“You look great!”</i> Badger giggles. <i>“Just like me! Anyways, do you want to do the experiments now?”</i>");
	addButton(0,"Next",escapeGame_BadEnd_Bimbadger_Willing)
 }
 
 //Badger is interested in transformatives and bimbo-ing.
 private function escapeGame_BadEnd_Badger_Willing():void
 {
	clearOutput();
	clearMenu();
	author("HNB");
	
	showBust(drBadgerBustDisplay());
	
	output("<i>“Okay!”</i> you shout, grinning. <i>“What've you got Doc?”</i>\n\n");
	
	//Removes all but 1 of your intelligence
	output("She laughs loudly at your response. <i>“Good girl. First off, I want to test the limits of just how bimbo-ey I can make a bimbo like you. You don't mind do you? Oh, who cares if you do, I'm doing it anyway!”</i>\n\n");
	output("She saunters over to the medical trolley, wiggling her tail and hips along the way. She unlocks it and procures a medipen from the top. Shifting her focus to you, she lifts the medipen in one paw and strokes your [pc.hair] with the other.\n\n");
	output("<i>“The first trial is coming now”</i> she whispers in your ear. <i>“Let me know how you feel”</i>\n\n");
	output("At this she jams the medipen into your [pc.arm]. ");
	
	if (pc.intelligence() >= 4) output("You feel your brain dull, to the point that your head feels almost completely empty. All your remaining smarts seem to have gone. Whatever who needs them!\n\n");
	else output("You feel your brain dull, to the point that your head feels almost completely empty, which isn't much different to before. Maybe you didn't have many smarts in the first place.\n\n");
	pc.intelligence(-pc.intelligence() + 1);
	
	escapeGame_BadEnd_Badger_Inner();
 }
 
 private function escapeGame_BadEnd_Badger_Unwilling():void
 {
	clearOutput();
	clearMenu();
	author("HNB");
	
	showBust(drBadgerBustDisplay());
	
	output("<i>“I'm not taking part in your twisted experiments!”</i> you shout at Badger, thrashing about in your shackles. <i>“Now let me go!”</i>\n\n");
	
	//Removes all but 1 of your intelligence
	output("She laughs loudly at your response. <i>“Ooh, I'm afraid you don't actually have a choice. I want to test the limits of just how bimbo-ey I can make someone and you're the perfect test subject. You don't mind do you? Oh, who cares if you do, I'm doing it anyway!”</i>\n\n");
	output("You begin to object but a ball gag is hastily shoved in your mouth. Badger grins at you and then saunters over to the medical trolley, wiggling her tail and hips along the way. She unlocks it and procures a medipen from the top. Shifting her focus to you, she lifts the medipen in one paw and strokes your [pc.hair] with the other.\n\n");
	output("<i>“The first trial is coming now”</i> she whispers in your ear. <i>“Let me know how you feel”</i>\n\n");
	output("At this she jams the medipen into your [pc.arm]. ");
	
	output("You feel your brain dull, to the point that your head feels almost completely empty. You can't focus on anything and any thoughts of resistance slip from your mind.\n\n");
	pc.intelligence( -pc.intelligence() + 1);
	output("You smile at badger and she grins before pulling the gag from your mouth.\n\n");
	
	escapeGame_BadEnd_Badger_Inner();
 }
 
 private function escapeGame_BadEnd_Badger_Inner():void
 {
	output("<i>“How was that?”</i> she inquires, producing a notepad and pen from between her breasts, ready to make notes.\n\n");
	output("<i>“Umm, what?”</i> you ask.\n\n");
	output("Badger starts scribbling away. <i>“Potential shrinkage of the hippocampus as expected. And what do you wish you were doing right now?”</i>\n\n");
	output("You giggle, looking at badgers lower half. <i>“Sucking dat dick!”</i>\n\n");
	output("The doctor grins. <i>“Ah good, intelligence seems to be impacted as hoped for and subject has retained the ability to speak! Good girl! If you keep cooperating, I might be able to get you some dick later”</i>\n\n");
	output("That makes you so happy. Dick, dick, dick. <i>“Okay!”</i> you grin. <i>“What's next?”</i>\n\n");
	//Ultra-bimbos and re-badgers you (Normal bimbo-ing but more)
	if (!pc.isNude()) output("<i>“Next is a more physical experiment. I'm just going to get rid of these”</i> she says tearing your [pc.clothes] off with her claws. <i>“I'll get you a nice little helper outfit later”</i>.\n\nWow, new clothes as well? Badger's the best!\n\n");
	output("<i>“Next is this one”</i> she says, picking up a larger medipen and tapping a claw against it. ");
	if (pc.furColorUnlocked("black") && pc.skinType == GLOBAL.SKIN_TYPE_FUR && pc.furColor == "black" && pc.faceTypeUnlocked(GLOBAL.TYPE_BADGER) && pc.faceType == GLOBAL.TYPE_BADGER){
		output("<i>“I had mixed a badger transformative in here but you seem to have made the correct decision of looking like me all by yourself”</i> she coos. ");
	}
	else{
		output("<i>“I've mixed a badger transformative in here because you seem to have made the poor decision of not looking like me”</i> she grunts. ");
	}
	output("<i>“Combined with that, is my new Bimbo+ solution”</i> she says. <i>“Combined, they'll turn you into my little bimbo pet, with every asset you need to be deserving of my dick. Do you want want it?”</i> she asks softly.\n\n");
	output("<i>“Gimme, gimme, gimme I <b>need</b> it!”</i> you beg, literally drooling at the thought.\n\n");
	output("<i>“Good girl”</i> she purrs, pressing the medipen into your [pc.skin].\n\n");
	output("As the solution works its way into your body, your body temperature spikes and you start panting like a laquine in heat. The hottest part of your body is between your legs and you look down to ");
	//Gapey badgergina formed, squirts, remove all previous ones
	if (pc.hasVaginas()) output("see your pussies closing up, shrinking in size until they disappear. Then on your crotch a slit begins to appear. It starts ");
	else if (pc.hasVagina()) output("see your pussy close over and then ");
	else output("see a slit forming and then ");
	output("opening up, enticing dark folds becoming visible on the inside. It keeps growing with a tingling sensation, giant thick lips lining the outside, that keep moving outwards, picking up more thickness as they do. They're pushing against your legs, your new pussy is so capable that you don't think you could walk properly with it. Stars, growing it feels so good, you're gonna, you're gonna..\n\n");
	pc.removeVaginas();
	pc.createVagina();
	pc.vaginas[0].wetnessRaw = 6;
	pc.vaginas[0].loosenessRaw = 6;
	pc.vaginas[0].bonusCapacity = 30;
	pc.vaginas[0].vaginaColor = "black";
	pc.orgasm();
	output("Badger stands there as you quiver and spray your girl juices several meters away, all over her lab coat and goggles. Your [pc.vagina 0] is so good, it'd be perfect for her! It's so capable and wet and slutty!\n\n");
	//Big (face) lips
	output("As you close your jaw from your powerful orgasm, you realize you were so distracted by how good that orgasm felt you didn't even notice the rest of the changes you've been blessed with.\n\n");
	if (pc.skinType != GLOBAL.SKIN_TYPE_FUR || pc.furColor != "black") output("Your body is now covered in black fur. ");
	if (pc.faceType != GLOBAL.TYPE_BADGER) output("Your face has reshaped itself into a black and white muzzle and your lips ");
	else output("Your lips ");
	output("have ballooned to stupid proportions. You bet any cock would love being shoved between them!\n\n");	
	//Bimbo tits
	output("On top of all this, you hear a spark from the chains as they struggle to hold you. Oh, how didn't you notice these. On your chest sits two weighty round breasts that look like they were bolted on! You probably couldn't walk around with them, which is fine, ideally you'll spend most of your time on your knees anyway!\n\n");
	//Tells you you're going to test whatever she comes up with, being her experiment toy and the dungeons fuck-toy
	output("<i>“Another success”</i> Badger says grinning. <i>“Now Steele. From now on, you are going to be my test subject - my toy. And you're going to be this dungeon's toy too. You will stay here and when I turn up with something that needs testing it will be tested on you. Do you understand?”</i>\n\n");
	output("You nod enthusiastically. You can't think of anything you'd rather do than have badger perform sexy experiments on you.");
	badEnd();
 }
 
 private function escapeGame_SlipOut():void
 {
	var fluidList:Array = [];
	if (pc.hasStatusEffect("Cum Soaked")) fluidList.push("cum");
	if (pc.hasStatusEffect("Pussy Drenched")) fluidList.push("girlcum");
	if (pc.hasStatusEffect("Milk Bathed")) fluidList.push("milk") ;
	
	var passMark:int = 5;
	
	clearMenu();
	clearOutput();
	author("HNB");
	
	output("With all the ");
	for (var i:int = 0; i < fluidList.length; i++)
	{
		output(fluidList[i]);
		if (i + 2 == fluidList.length) output(" and");
		else if (i + 1 == fluidList.length) output(" ");
		else output(", ");
	}
	output("covering you, you reckon you could probably just slip out of your bindings.\n\nYou narrow your [pc.hands] and try to pull them through the shackles. ");
	
	if (((pc.statusEffectv1("Cum Soaked") + pc.statusEffectv1("Pussy Drenched") + pc.statusEffectv1("Milk Bathed")) >= passMark) && rand(10) < 3)
	{
		output("With a squelching sound, your hands pop through! ");
		if (pc.legCount != 0) output("You grab hold of the hanging shackles for balance and pull your [pc.legs] from their binds too! ");
		output("You're free!");
		addButton(0, "Next", mainGameMenu);
	}
	else if ((pc.statusEffectv1("Cum Soaked") + pc.statusEffectv1("Pussy Drenched") + pc.statusEffectv1("Milk Bathed")) >= passMark)
	{
		output("You almost get them through but not quite! Shoot, maybe they'll go through if you give them another go?");
		addButton(0, "Next", escapeGame);
	}		
	else
	{
		output("Shoot, you can't get them to slip through with this amount of lube. Maybe you need more for this to work.");
		addButton(0, "Next", escapeGame);
	}
	processTime(1);
 }
 
 private function escapeGame_SafeWord():void
 {
	clearOutput();
	clearMenu();
	
	output("Remembering the message you saw on the workstation, you let out a sigh before unenthusiastically reading the safeword to your shackles.\n\n");
	if(flags["BADGER_QUEST"] == -3)
	{
		output("<i>“Badger is the bestest..”</i>\n\n");
		output("It's not much of a safeword, firstly because it's an entire phrase and secondly because it's, appropriately, really fucking stupid.\n\n");
		output("You hear a beep from your shackles as they click open and you drop to the floor.");
	}
	else
	{
		output("<i>“I love Big Badger Cock..”</i>\n\n");
		output("It's not much of a safeword, mostly because it's an entire phrase. Badger was probably willing to let that little detail slide to hear that phrase though.\n\n");
		output("You hear a beep from your shackles as they click open and you drop to the floor.");
	}
	addButton(0, "Next", mainGameMenu);
	processTime(1);
 }
 
 private function escapeGame_StrengthEscape():void
 {
	clearMenu();
	clearOutput();
	author("HNB");
	
	//Physique, not wornOut (Cancels immediately), low hp reduces chances, high weight buffs, 
	var strengthPoints:int = 0;
	var passMark:int = 35;
	if (!pc.isWornOut())
	{
		strengthPoints += pc.physique();
		if (pc.HP() <= 30) strengthPoints *= 0.9;
		
		if (pc.fullBodyWeight() < 650) strengthPoints *= 1;
		else if (pc.fullBodyWeight() < 900) strengthPoints *= 1.1;
		else if (pc.fullBodyWeight() < 1500) strengthPoints *= 1.2;
		else strengthPoints *= 1.3;
	}
	
	output("Alright, maybe you can use your brawn to get out of here. You wrap your [pc.hands] around the orange beams attached to your shackles and pull hard on them, tensing every muscle in your body, shaking as you put all your strength into trying to breaking yourself free!\n\n");
	if ((strengthPoints >= passMark) && rand(5) == 0)
	{
		output("Sparks fly from the chains as you groan and pull. Suddenly you hear a snap noise and fly forward, having successfully broken the chains! ");
		if (pc.legCount != 0) output("You lie down and yank on your leg chains, driving against them with your [pc.legs] too, causing them to quickly snap as well! ");
		output("You're free!");
		addButton(0, "Next", mainGameMenu);
	}
	else if (strengthPoints >= passMark)
	{
		output("The chains let out a few sparks as you pull with all your might! Suddenly your grip falters and you slack back into your bound position, breathing heavily. Shoot, you almost had that!");
		addButton(0, "Next", escapeGame);
	}
	else 
	{
		output("You groan and pull but the chains barely react. Maybe you just don't have the brawn for this..");
		addButton(0, "Next", escapeGame);
	}	
	//Giving sweaty because this was hard physical labor, regardless of success.
	if(!pc.hasStatusEffect("Sweaty"))
	{
		pc.createStatusEffect("Sweaty", 0, 0, 0, 0, false, "Icon_Smelly", "You are covered with sweat from a workout, reducing your potential sexiness to many foes. Some, however, may like it.", false, 0);
	}
	if (pc.statusEffectv1("Sweaty") < 5) pc.addStatusValue("Sweaty", 1, 1);
	
	processTime(1);
 }
 
 private function escapeGame_LockPick():void
 {
	clearMenu();
	clearOutput();
	author("HNB");
	
	output("You notice an override keyhole on one of the arm shackles. Good thing they didn't search you. ");
	if (pc.hasArmor()) output("You bend your [pc.hand] reaching inside your sleeve and pulling a lockpick out. Perfect!\n\n");
	else if (pc.hasHair() && pc.hairLength >= 8) output("You tilt your head and reach a [pc.hand] into your [pc.hair], pulling a lockpick from it. Perfect!\n\n");
	else output("You unclench your [pc.hand] and grab hold of the lockpick you hid there earlier. Perfect!\n\n");
	
	if (pc.level < 6) //Always fail less than 6
	{
		output("You bend your hand, pushing the lockpick into the hole. You try for about a minute to pick it but you can't figure it out. Shoot, you don't like to admit it but maybe this is too advanced for you.");
		addButton(0, "Next", escapeGame);
	}
	else if (pc.level >= 7) //Pass if random with higher level providing a benefit
	{
		var passMark:int;
		if ((15 - pc.level) < 5) passMark = 5;
		else passMark = 15 - pc.level;
		
		if (rand(passMark) == 0)
		{
			output("You bend your hand, pushing the lockpick into the hole and slowly rotating it. You hear several clicking noises as you rotate the lockpick before suddenly the noise changes to loud beeping and all the shackles click open, setting you free!");
			addButton(0, "Next", mainGameMenu);				
		}
		else
		{
			output("You bend your hand, pushing the lockpick into the hole and trying to pick it. You hear the odd clicking noise but you're not making much progress. You'll have to try again.");
			addButton(0, "Next", escapeGame);
		}
	}
	
	processTime(1);
 }
 
 private function escapeGame_Struggle():void
 {
	clearMenu();
	clearOutput();
	author("HNB");
	
	output("You writhe and pull on the shackles, hoping to somehow slip your way out through sheer luck.\n\n");
	if (rand(18) == 0)
	{
		output("You somehow manage to pop out of the shackles, to freedom!");
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		output("You fail to escape.");
		addButton(0, "Next", escapeGame);
	}
	
	processTime(1);
 }
 
 private function escapeGame_Wiggle():void
 {
	clearMenu();
	clearOutput();
	author("HNB");
	
	output("You try to slip your way carefully out of the shackles by twisting and contorting your limbs.\n\n");
	
	var struggleDiff:int = 35;
	
	if ((pc.reflexes() >= struggleDiff) && rand(5) == 0)
	{
		output("You display a remarkable amount of flexibility as you twist and writhe to freedom.");
		addButton(0, "Next", mainGameMenu);
	}
	else if(pc.hasPerk("Limber") && rand(10) <= 1)
	{
		output("You contort your body wildly to escape! All that time spent practicing yoga with Paige has paid off!");
		addButton(0, "Next", mainGameMenu);
	}
	else 
	{
		if (pc.reflexes() >= struggleDiff)
		{
			output("You twist and writhe and you almost find your way out but not quite. Maybe you should try again.");
		}
		else
		{
			output("You twist and writhe but fail to make any progress. Maybe you're not flexible enough to escape this way.");
		}
		addButton(0, "Next", escapeGame);
	}
	
	processTime(1);
 }
 
 private function escapeGame_StaticBurst():void
 {
	clearMenu();
	clearOutput();
	author("HNB");
	
	output("You put all your energy into sending a burst of electricity into the shackles, in hopes of disabling them.\n\n");
	
	var passChance:int;
	
	if (pc.energy() < 35){
		output("Sparks fly forth into the shackles. ");
		passChance = 16;
	}
	else if (pc.energy() < 70){
		output("Bursts of sparks fly forth into the shackles. ");
		passChance = 12;
	}
	else{
		output("Large streams of sparks fly forth into the shackles. ");
		passChance = 8;
	}
	pc.energy(-pc.energy());
	
	if (rand(passChance) == 0){
		output("The shackles beep wildly and jerk open, setting you free!");
		addButton(0, "Next", mainGameMenu);
	}
	else{
		output("Shoot, it hasn't worked! You've run out of energy and you're still trapped!");
		addButton(0, "Next", escapeGame);
	}
	
	processTime(1);
 }
 
 private function read_workstation():void
 {
	clearOutput();
	clearMenu();
	
	output("Placeholder location and text. Should have browse options. Currently just unlocking everything.");
	
	flags["SEXPERIMENT_DUNGEON_READ_SHACKLEPASSWORD"] = true;
	
	addButton(14, "Back", mainGameMenu);
 }
 
 private function cumBoxCrossing():void
 {
	if (currentLocation == "SEXPERIMENT_DUNGEON_1_3") addButton(6,"North",cumBoxCrossing_Inner,"N")
	else if (currentLocation == "SEXPERIMENT_DUNGEON_1_4") addButton(11,"South",cumBoxCrossing_Inner,"S")
 }
 
 private function cumBoxCrossing_Inner(dir:String):void
 {
	author("HNB");
	clearOutput();
	clearMenu();
	//If low reflexes or wearing high heels (Should really be a clothing flag for that)
	if ((pc.reflexes() < 20 || pc.hasLegFlag(GLOBAL.FLAG_HEELS) || (pc.armor is BunnyOutfit)) && rand(3) == 0){
		if (pc.hasLegFlag(GLOBAL.FLAG_HEELS) || (pc.armor is BunnyOutfit))
		{
			output("As you waddle across the box on your high heels, you stumble and fall into the cum-puddle on the floor.\n\n");
		}
		else
		{
			output("As you walk across the box, you trip and fall into the cum-puddle on the floor.\n\n");
		}
		output("You pick yourself up, ");
		if (pc.isNude()) output("your side splattered with cum ");
		else output("one side of your [pc.clothes] splattered with cum ");
		output("and walk out to the other side. Well, at least you're across.");
		pc.applyCumSoaked();
		pc.applyCumSoaked();
	}
	output("You manage to successfully walk across the box.");
	if (dir == "N") addButton(0, "Next", move, "SEXPERIMENT_DUNGEON_1_4");
	else addButton(0, "Next", move, "SEXPERIMENT_DUNGEON_1_3");
 }
 
 private function medicineCabinet():void
 {
	output("On the east wall is a small cabinet, with a clipboard mounted to the side. ");
	if(flags["BADGER_QUEST"] == -3)
	{
		output("You examine the clipboard expecting to find more information about this place but instead find penises and breasts drawn across the paper, in crayon. Gosh, that one looks pretty disfigured. Oof, you can't imagine having those.\n\n");
	}
	else
	{
		output("You examine the clipboard hoping to find out more about this place.\n\n");
		if (pc.intelligence() >= 15 || (pc.characterClass == GLOBAL.CLASS_ENGINEER && pc.intelligence() >= 10)) output("There's a table on here, for what appears to be drug testing! The first row reads, Raskvel Male 12, Throbb+ Alpha 7, Failure nutsack exploded?!?!");
		else if (pc.isBimbo()) output("Ughh, it's full of nonsense, you've got no idea what it means. Something about test subjects? You're not interested in tests or subjects, so putting them together sounds ultra boring.");
		else output("There's some kind of table here but you can't make head nor nail of it. Something about test subjects?");
	}
	output("\n\nYou put the clipboard back down. You open the cabinet and find a bunch of unlabelled medipens. Better leave them alone.");
 }
 
 private function securityDoorText():void
 {
	output("Rounding the corner you twist and turn through several stacks of shipping crates. As you emerge from them you find yourself standing in front of a large steel door marked <i>“Security”</i>.\n\n");
	
	if (flags["SEXPERIMENT_DUNGEON_HALLWAY_DOOR_STATE"] == undefined)
	{
		output("You don't have any reason to charge in there just yet!");
	}
	else
	{
		if (flags["MET_GOOGUARD_VARIANT"] != undefined) output("This must be where you'll find those guards! You should prepare yourself before stepping in.\n\n");
		else output("You don't know who to expect there but you should prepare yourself.");
		addButton(0, "Enter Door", move, "SEXPERIMENT_DUNGEON_1_SECURITYROOM");
	}
 }
 
 private function securityRoomRae():void
 {
	clearOutput();
	clearMenu();
	output("You enter the security room.\n\nThis room looks vastly different to any other room you've encountered so far in the dungeon ");
	if (flags["SEXPERIMENT_DUNGEON_DEFEATED_GOOGIRLS"] != undefined) output("This is the room where you defeated the goo guards. ");
	output("The room is dimly lit, a single light dangling from the ceiling. Black velvet curtains hang over the walls, occasionally draped over coathooks containing chains, collars, cuffs, whips and all other kinds of implements of domination. In the middle sits a round bowl-like bed, with several large steel poles around its circumference.\n\n");
	if (flags["SEXPERIMENT_DUNGEON_DEFEATED_GOOGIRLS"] != undefined) output("This room is a dominatrixes wet dream.");
	else encounterGooGuards_BossFight();
 }
 
 private function hallwayDoorText():void
 {
	if (flags["SEXPERIMENT_DUNGEON_DEFEATED_GOOGIRLS"] == undefined){
		addButton(0, "Examine", hallwayDoorText_Examine);
	}
	else if (flags["SEXPERIMENT_DUNGEON_DEFEATED_GOOGIRLS"] == true && flags["SEXPERIMENT_DUNGEON_HALLWAY_DOOR_STATE"] == 1){
		addButton(0, "Enter", undefined); //Key check
	}
	else
	{
		addButton(0, "Enter", undefined);
	}
 }
 
 private function hallwayDoorText_Examine():void
 {
	clearOutput();
	clearMenu();
	
	output("You pull on the old door but it wont budge. Examining it closely, it looks like it requires a traditional key.");
	flags["SEXPERIMENT_DUNGEON_HALLWAY_DOOR_STATE"] = 1;
	rooms["SEXPERIMENT_DUNGEON_1_SECURITYROOM"].addFlag(GLOBAL.OBJECTIVE);
	rooms["SEXPERIMENT_DUNGEON_1_8"].removeFlag(GLOBAL.OBJECTIVE);
	rooms["SEXPERIMENT_DUNGEON_1_8"].addFlag(GLOBAL.LIFTDOWN);
	addButton(0,"Next",mainGameMenu);
 }
 
 private function hallwayDoorText_Open():void
 {
	clearOutput();
	clearMenu();
	
	output("You push the key you got from the guards into the keyhole and twist it. It clicks and the door swings open!");
	flags["SEXPERIMENT_DUNGEON_HALLWAY_DOOR_STATE"] = true;
	
	addButton(0,"Next",mainGameMenu); //Swap for moving room
 }
 
 private function cellRoe():void
 {
	clearOutput();
	clearMenu();
	
	if (flags["SEXPERIMENT_DUNGEON_DEFEATED_GOOGIRLS"] == undefined)
	{
		output("You're in what appears to be a holding cell. White tiles line the floors and walls. On the wall containing the door you entered through, is a large glass window, presumably for looking in at anyone who's being kept prisoner here. Opposite to that are large sets of futuristic steel shackles, orange chains of energy attaching them to sockets on the walls. A locked medical trolley full of medipens sits next to the shackles.");
	}
	else
	{
		output("You're in the holding cell. White tiles line the floors and walls. On the wall containing the door you entered through, is a large glass window, presumably for looking in at anyone who's being kept prisoner here. Opposite to that are the two guards, shackled to the walls by orange chains of energy and futuristic steel cuffs.");
		addButton(0,"Guards",guardOpts);
	}
 }
 
 private function guardOpts():void
 {
	clearOutput();
	clearMenu();
	
	addButton(14, "Back", mainGameMenu);
 }