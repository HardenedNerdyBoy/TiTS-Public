import classes.Characters.GooGuard;
import classes.Creature;
/**
 * ...
 * @author HNB
 */

 public function encounterGooGuard():void 
 {
	var encounter:GooGuard = new GooGuard();
	
	if (variantMet == 0){
		encounter.setVariant_1();
		flags["GOOGUARD_VARIANT_LASTFOUGHT"] = 1;
	}
	else{
		encounter.setVariant_2();
		flags["GOOGUARD_VARIANT_LASTFOUGHT"] = 2;
	}
	
	showBust(encounter.bustDisplay);
	showName("LABORATORY\nGUARD");
	clearOutput();
	author("HNB");
	var variantMet:int = rand(2);
	
	if(flags["MET_GOOGUARD_VARIANT"] == undefined)
	{
		output("As you sneak around, you hear a slithering sound coming from further down the hallway. A voice soon accompanies it.\n\n");
		output("<i>“There's no use hiding intruder”</i> the voice shouts out with certainty. <i>“I know how to take care of you”</i>\n\n");
		
		if (flags["BADGER_QUEST"] == -3){
			if (pc.isBimbo() || pc.intelligence() < 15){
				output("Shoot! Badger must have forgotten to tell the guards!\n\n"); 
				output("<i>“Uhh, no, it's okay. Badger said I could come down here!”</i>\n\n");
			}
			else{
				output("Shoot! Badger forgot to mention that this place is guarded. Damn airhead!\n\n"); 
				
				if (pc.isMischievous()) output("<i>“It's okay, Badger said I could come down here!”</i> you bluff.\n\n");
			}
		}
		else{
			if (pc.isBimbo() || pc.intelligence() < 15){
				output("Shoot! Did Badger trick you?! Nah, she must have just forgotten to tell the guards.\n\n"); 
				output("<i>“Uhh, no, it's okay. I actually bought the key for this place!”</i>\n\n");
			}
			else{
				output("Well, looks like badger tricked you. No surprise there.\n\n"); 
				if (pc.isMischievous()) output("<i>“It's okay, I actually bought the key for this place!”</i> you bluff.\n\n");
			}
		}
		
		output("A hefty, feminine laugh comes from round the corner as the guard slithers into view and continues towards you.\n\n");
		if (flags["MET_GRAY_GOO"] == undefined){
			output("You're not sure what they are, until your Codex beeps an urgent warning: <i>“Gray goo detected. These active micro-machine clusters are known to attack without provocation. U.G.C. Scout Authority suggests extreme caution, as well as hydration, around the native goo.”</i>\n\n");
			output("Alright, you know what they are now but you're still eyeing them up. So, she's ");
		}
		else output("She's ");
		output("a roughly 6 foot tall gray goo, with a very curvaceous body and massive breasts, clad in leather dominatrix gear that drops inwards around the folds of her gravid belly, round inverted nipples and between the plump lips of her nether-regions.\n");
		output("She has gooey tentacle-extensions for hands, ");
		if (variantMet == 0) output("a self-made whip extending from one, ");
		else output("a self-made collar and leash extending from one, ");
		output("with several additional tentacles flailing wildly behind her.\n\n");
		
		output("With her dominatrix style attire, you're pretty certain if she gets you, she's not about to let you go free. You raise your [pc.weapon] and get ready to fight.\n\n");
		output("<i>“Ooh a fighter”</i> she coos. <i>“I'm going to enjoy capturing you.”</i>");
		
		if (variantMet == 0) flags["MET_GOOGUARD_VARIANT"] += 1;
		else flags["MET_GOOGUARD_VARIANT"] += 2;
	}
	else 
	{
		var randSpeech:int = rand(3);
		output("As you sneak around, you hear a slithering sound coming from further down the hallway. A voice soon accompanies it.\n\n");
		if (variantMet == 0)
		{
			if (randSpeech == 0) output("<i>“The longer you hide, the more I'll punish you”</i> the voice cackles.\n\n");
			else if (randSpeech == 1) output("<i>“Naughty naughty intruder”</i> the voice cackles. <i>“You're not supposed to be here”</i>\n\n");
			else output("<i>“There's no use hiding intruder”</i> the voice shouts out with certainty. <i>“I know how to take care of you”</i>\n\n");
		}
		else
		{
			if (randSpeech == 0) output("<i>“You might want to save your strength”</i> the voice moans. <i>“For later..”</i>\n\n");
			else if (randSpeech == 1) output("<i>“Did you really think you could just walk around in here without.. reprecussions?”</i> the voice moans.\n\n");
			else output("<i>“There's no use hiding intruder”</i> the voice shouts out with certainty. <i>“I know how to take care of you”</i>\n\n");
		}
			
		if (variantMet == 0 && flags["MET_GOOGUARD_VARIANT"] == 2){
			output("One of the dungeons guards slithers into view. They look slightly different than the one you saw before, with longer hair, a different mask and they carry a whip instead of a collar but they're definitely still a guard.");
			flags["MET_GOOGUARD_VARIANT"] += 1;
		}
		else if (variantMet == 1 && flags["MET_GOOGUARD_VARIANT"] == 1){
			output("One of the dungeons guards slithers into view. They look slightly different than the one you saw before, with hair pulled back in a ponytail, a different mask and they carry a collar and leash instead of a whip but they're definitely still a guard.");
			flags["MET_GOOGUARD_VARIANT"] += 2;
		}
		else //Repeat of either
		{
			output("Shoot! One of the guards slithers into view. You raise your [pc.weapon] and get ready to fight.\n\n");
		}
	}
	
	clearMenu();
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	
	CombatManager.setHostileActors(encounter);
	CombatManager.victoryScene(GooGuard_Win);
	CombatManager.lossScene(GooGuard_Loss);
	CombatManager.displayLocation("GOO GUARD");
	CombatManager.encounterTextGenerator(function():String {
		
		author("HNB");
		
		var h:Array = CombatManager.getHostileActors();
		var f:Array = CombatManager.getFriendlyActors();
		
		if (h[0].hasStatusEffect("Grappling") && f[h[0].statusEffectv1("Grappling")].hasStatusEffect("Grappled"))
		{
			return "The guard has her tentacles wrapped around you, holding you tight within her grasp as she runs her gooey tendrils over your body.";
		}
		else 
		{
			if (h[0].lust() >= 100) return "The guards' gray cheeks are flushed red, as she tries to keep her mind on your capture and her gooey tendrils out from under her leather armor.";
			else if (h[0].HP() <= 50) return "The guard stands opposite you, battered and breathing heavily.";
			else return "The curvaceous guard stands opposite you, tendrils sprawling forth, intent on capturing you.";
		}
	});
	
	clearMenu();
	addButton(0,"Next", CombatManager.beginCombat);
 }
 
 private function GooGuard_Win():void
 {
	clearOutput();
	clearMenu();
	author("HNB");
	
	output("You stand over the guard. In her mind, you know you were meant to be the one on the ground, as she toys with you. Now, you get to dominate her.\n\n");
	output("As you start to undo your gear, she lets out a hearty laugh and you stop. <i>“Oh, you thought you'd beaten me? What a silly little " + pc.mf("boy", "girl") + " you are.”</i>\n\n");
	output("As she finishes her sentence, she lifts herself up and starts slithering back down the hallway with speed.\n\n");
	if (flags["GOOGUARD_VARIANT_LASTFOUGHT"] == 1){
		output("<i>“There's no way I'd humiliate us by losing to someone who should be on the end of a leash!”</i> she cackles.\n\n");
	}
	else{
		output("<i>“My twin would never allow me to humiliate us like that!”</i> she giggles.\n\n");
	}
	output("<i>“No, if you want to dominate me, then you'll have to have a proper showdown with both of us!”</i> she whispers as she rounds a corner out of sight. <i>“See you in my quarters..”</i>\n\n");
	addButton(0,"Continue",CombatManager.genericVictory);
 }
 
  private function GooGuard_Loss():void
 {
	clearOutput();
	clearMenu();
	author("HNB");
	clearOutput();
	clearMenu();
	showName("LOST VS: GOO.\nGUARD");
	
	if (pc.HP() <= 0) output("You fall to the ground, defeated.\n\n");
	else output("You fall to the ground, stricken by lust.\n\n");
	
	if (flags["GOOGUARD_VARIANT_LASTFOUGHT"] == 1){
		output("<i>“You should've given in sooner”</i> the guard cackles. <i>“Unless of course, you liked that beating!”</i>\n\n");
		if (pc.isSubby()) output("Mmm, well.. you probably shouldn't go admitting that to her..\n\n");
	}
	else output("<i>“Oh, baby, on your knees already?”</i> the guard moans. <i>“How sad, I was having so much fun”</i>.\n\n");
	
	output("Their tendrils unfurl and wrap around you, clenching your waist tightly before lifting you off the ground. You don't have the ");
	if (pc.HP() <= 0) output("energy to resist. All the fight has been knocked out of you.\n\n");
	else output("will to resist. You're quite wanting of her touch and this is a good start.\n\n");
	
	output("She starts slithering ");
	if (kGAMECLASS.currentLocation.indexOf("SEXPERIMENT_DUNGEON_1") != -1)
	{
		output("back down the hallway");
	}
	else
	{
		output("back towards the entrance");
	}
	output(" carrying you behind her. You're carried past rows of cell rooms, containing various experiments, some bound, some loose, some empty. You see some of the occupants of the empty cells roaming the halls but they're sent howling back to their cells with a crack from one of the guards tendrils.\n\n");
	output("Eventually, you're stopped in front of a door. The guard touches the keypad and the electronics embedded in her gooey mass authenticate with it, opening the door.\n\n");
	output("<i>“I'm sure you won't be any trouble ever again but let's make this a secure room just to be sure”</i> she says, grinning, tapping away at the keypad again until it turns red. She then walks in past the glass door and you find yourself in a white cell room, with one window into the hall and a set of futuristic chains and shackles attached to the wall.\n\n");
	if (pc.isGoo())
	{
		output("<i>“Oh don't get any ideas, they work just fine on us goo's!”</i> she cackles, taking note of your gooeyness.\n\n");
	}
	else
	{
		output("<i>“Don't get any ideas about escaping”</i> she cackles. <i>“These are special made, nobody can escape them”</i>\n\n");
	}
	
	output("She grabs hold of your limbs with countless tendrils and shifts you over to the shackles, clamping you in. Your bindings are automatically pulled taut as they get used to your body");
	if (pc.isGoo()) output(" and as the binds touch your [pc.skin], your body solidifies, stopping you from goo-ing your way out of this situation.");
	output(".\n\n<i>“Now, be a good [pc.boyGirl], until the Doctor gets here”</i> the guard shouts behind her, grinning as she slithers out the door, which slides shut behind her.\n\n");
	CombatManager.genericLoss();
	moveTo("SEXPERIMENT_DUNGEON_1_CELL");
	processTime(2);
	flags["SEXPERIMENT_DUNGEON_CAPTURETIME"] = GetGameTimestamp();
	if (pc.HP() > 0)
	{
		output("It takes you several minutes to stop seeing being captured by the guard as a positive and to start looking for a way to escape.\n\n");
		processTime(2);
	}
	addButton(0,"Next",escapeGame);
 }
 
 //Boss fight stuff
 
 public function encounterGooGuards_BossFight():void 
 {
	var var1:GooGuard = new GooGuard();
	var var2:GooGuard = new GooGuard();
	var1.setVariant_1();
	var2.setVariant_2();
	
	showBust(var1.bustDisplay,var2.bustDisplay);
	showName("LABORATORY\nGUARDS");
	author("HNB");
	
	if(flags["MET_GOOGUARD_VARIANT"] == undefined)
	{
		output("<i>“An intruder?”</i> one of the guards coos, sauntering out from the shadows into your view. <i>“In our room?”</i>\n\n");
	}
	else 
	{
		output("<i>“Ooh, so you've shown up intruder?”</i> one of the guards coos, sauntering out from the shadows into your view.\n\n");
	}
	output("<i>“What're you doing here?”</i> the other guard grunts, swinging out from behind her sister.\n\n");
	output("<i>“I'm looking for a key”</i> you respond nervously, ready to grab your weapon. <i>“I assume you lovely ladies have it?”</i>\n\n");
	output("The first guard giggles and raises a tendril. You see a key on a ring, dangling from it. <i>“Right here. Oh, you're not getting it though!”</i>\n\n");
	output("Sigh. There's no democracy to be had here. You raise your [pc.weapon] ready to fight.\n\n");
	if (pc.isCrotchGarbed()) output("<i>“You must have some big balls under there”</i> the second guard cackles. ");
	else if (pc.ballSizeRaw >= 9) output("<i>“Unsurprising response for someone with balls like that”</i> the second guard cackles. ");
	else output("<i>“Threatening us in our own bedroom?”</i> the second guard responds. ");
	output("<i>“I'll enjoy making you beg!”</i>");
	
	if (flags["MET_GOOGUARD_VARIANT"] != 3) flags["MET_GOOGUARD_VARIANT"] = 3;
	
	clearMenu();
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	
	CombatManager.setHostileActors(var1,var2);
	CombatManager.victoryScene(GooGuard_Bossfight_Win);
	CombatManager.lossScene(GooGuard_Bossfight_Loss);
	CombatManager.displayLocation("GOO GUARDS");
	CombatManager.encounterTextGenerator(function():String {
		
		author("HNB");
		
		var h:Array = CombatManager.getHostileActors();
		var f:Array = CombatManager.getFriendlyActors();
		
		if (h[0].hasStatusEffect("Grappling") || h[1].hasStatusEffect("Grappling"))
		{
			return "One of the guards has her tentacles wrapped around " + f[h[0].statusEffectv1("Grappling")].getCombatName() + ", holding " + f[h[0].statusEffectv1("Grappling")].getCombatPronoun("o") + " tight within her grasp as she runs her gooey tendrils over your body. Seeing this, the other guard draws near, swinging her tendrils about, ready to beat " + f[h[0].statusEffectv1("Grappling")].getCombatPronoun("o") + " into submission!";
		}
		else{
			var returnStr:String = "";
			
			if (h[0].lust() >= 100) returnStr += "One of the guards' gray cheeks are flushed red, as she tries to keep her mind on your capture and her gooey tendrils out from under her leather armor.";
			else if (h[0].HP() <= 50) returnStr += "One of the guards stands opposite " + (f.length > 1 ? "your party" : "you") + ", battered and breathing heavily.";
			else returnStr += "One curvaecous guard stands opposite " + (f.length > 1 ? "your party" : "you") + ", tendrils sprawling forth, intent on capturing " + (f.length > 1 ? "all of you" : "you") + ".";
			
			if (h[1].lust() >= 100){
				if (h[0].lust() >= 100) returnStr += "\nThe other is no better. At this point, her gaze is set almost as much on her buxom counterpart as " + (f.length > 1 ? "your group." : "you.");
				else if (h[0].HP() <= 50) returnStr += "\nThe other is also breathing heavily - although, for different reasons.";
				else returnStr += "The others' cheeks are flushed red, as she tries to keep her mind on your capture and her gooey tendrils out from under her leather armor.";
			}
			else if (h[1].HP() <= 50){
				if (h[0].lust() >= 100) returnStr += "\nThe other is also breathing heavily - although, for different reasons.";
				else if (h[0].HP() <= 50) returnStr += "\nThe other is no better, as she wobbles, not far from collapse.";
				else returnStr += "The other stands battered, wobbling on the verge of collapse.";
			}
			else{
				if (h[0].lust() >= 100) returnStr += "\nThe other still remains focused, ready to draw " + (f.length > 1 ? "your party" : "you") + " into submission.";
				else if (h[0].HP() <= 50) returnStr += "\nThe other still stands ready, ready to draw " + (f.length > 1 ? "your party" : "you") + " into submission.";
				else returnStr += "\nThe other stands next to her, tentacles at the ready.";
			}
			
			return returnStr;
		}
	});
	
	clearMenu();
	addButton(0,"Next", CombatManager.beginCombat);
 }
 
 private function GooGuard_Bossfight_Win():void
 {
	clearOutput();
	clearMenu();
	author("HNB");
	
	output("As the dominatrixes fall to the ground you can only smirk to yourself. Looks like you're in charge now.\n\n");
	output("<i>“Now you two. I'm going to be in charge from now on and you're going to be my slaves. Do you both understand?”</i>\n\n");
	output("<i>“Haha, you?”</i> the ever bulshier of the two guards cackles. <i>“You think you can be our " + pc.mf("master","mistress") + "?”</i>\n\n");
	output("You briskly [pc.walk] over to one of the hooks and grab a handful of equipment. You have an idea about how you can make the most of this situation. You trot back over to the loudmouth and clasp a pair of futuristic handcuffs around her wrists. As you expected, when you go to grab her by the chin you're able to grasp her easily as the handcuffs stop the nanomachines from rearranging themselves. Your fingers still sink into her a little but only as much as you'd expect from her figure.\n\n");
	output("<i>“I know what'll shut you up”</i> you say, grinning as you shove a ballgag between her plump lips. <i>“Oh and you too”</i> you say turning to the other guard. <i>“I can't play favourites!”</i>\n\n");
	output("With them both gagged and cuffed, you grab a chain from the bed and loop it round both their waists, squishing the gravid goo girls against each other as you pull it tight. <i>“Now come on. I know where I can take you two.”</i>");

	addButton(0,"Next",GooGuard_Bossfight_Win2);
 }
 
  private function GooGuard_Bossfight_Win2():void
 {
	clearOutput();
	clearMenu();
	author("HNB");
	
	moveTo("SEXPERIMENT_DUNGEON_1_CELL");
	
	output("You unfasten the chain from your pets as the door to the cell slides shut behind you. The lustier of the two has had a lewd expression on her face the entire walk, whilst the other hasn't stopped trying to shout at you through her gag.\n\n");
	output("You pull them forward by their hands and spin them around, before clapping their arms and gooey leg-mass in shackles, causing their tendrils to retract into their bodies as the shackles disable them. You then undo the cuffs you put on them and let them hang there. You'll keep the gags in for now though.\n\n");
	output("<i>“Mmm, two thick and feisty goo girls all tied up and ready for you whenever”</i> you think to yourself. <i>“Perfect!”</i>\n\n");
	output("Oh, you almost forgot. You walk up to the grayer of the two guards and shove a [pc.hand] between her motherly tits. Yep, here it is. You pull the key out from between them and slip it into your pocket. Hmm, whilst you're this close, you may as well get up to a bit more..\n\n");
	
	flags["SEXPERIMENT_DUNGEON_DEFEATED_GOOGIRLS"] = true;
	
	CombatManager.genericVictory(); 
	
	addButton(0, "Sex", undefined);
	addButton(14, "Exit", mainGameMenu);
 }
 
 private function GooGuard_Bossfight_Loss():void
 {
	if (pc.HP() <= 0) output("You fall to the ground, defeated.\n\n");
	else output("You fall to the ground, stricken by lust.\n\n");
	
	//They can have some fun with you seeing as you're in their chamber and there's no surveillance, badger wont know any different
	output("<i>“Silly " + pc.mf("boy", "girl") + "”</i> the guard chuckles as she slithers on her thick legs over to you, her sister sauntering over in tow. <i>“Did you really think you wouldn't be the one to end up on on your knees?”</i>\n\n");
	output("<i>“We should imprison " + pc.mf("him", "her") + ", dear sister”</i> the second adds. <i>“But you know, maybe we could have some fun first..”</i>\n\n");
	output("<i>“Maybe subduing them took, oh I don't know, 5 or 10 minutes longer?”</i> she chuckles in response. <i>“Or however long it takes to make our slave here cry! I'll go grab some toys, you make them your pet!”</i>\n\n");
	//One in front collars you to their arm-collar
	output("<i>“Mmm, gladly”</i> the grayer of the two goos responds as she lowers herself to you and strokes your [pc.hair], as you stare at her mesmerizing cleavage. <i>“You're going to be a good little " + pc.mf("boy", "girl") + ", aren't you?”</i> she coos, as the hand she's stroking you with extends and wraps around your neck. You have no fight in you to shout back or to stop yourself from being collared by her gooey appendage.");
	if (pc.isSubby()) output(" Or any will to.");
	output("\n\n<i>“Is the bitch behaving well?”</i> you hear as a tendril strikes you across the cheek and you look towards your second captor. Her wipe hips and round belly sway side to side as she saunters towards you, with a black, 14 inch, badger cock strapped over her leather panties and a smirk across her face. <i>“Don't worry sis, I brought one for you too”</i> she says as she tosses a second strapon to the second guard who stands up from kneeling in front of you and catches the large object in her tendrils.\n\n");
	output("<i>“Mmm, thank you”</i> she moans as she snaps your lead short and your head is jerked upwards, so you're looking straight into her eyes as she licks her lips and straps on the big badger cock. ");
	//Badger-strapon fuck you from both sides, one whips your butt whilst they do
	//Shifts to one faceriding you whilst the other cheers them on
	//She cums
	//Take to cell	
	
	CombatManager.genericLoss();
	moveTo("SEXPERIMENT_DUNGEON_1_CELL");
	processTime(2);
	flags["SEXPERIMENT_DUNGEON_CAPTURETIME"] = GetGameTimestamp();
	if (pc.HP() > 0)
	{
		output("It takes you several minutes to stop seeing being captured by the guard as a positive and to start looking for a way to escape.\n\n");
		processTime(2);
	}
	addButton(0,"Next",escapeGame);
 }