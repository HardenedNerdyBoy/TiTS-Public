import classes.Characters.PlayerCharacter;
import classes.Characters.RaskvelExperiment;
import classes.Creature;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.ItemSlotClass;
import classes.Items.Apparel.RubberBallPouch;
import classes.Items.Miscellaneous.EmptySlot;

/**
* ...
* @author HNB
*/

public function encounterRaskExperiment():void 
 {
	var tEnemy:RaskvelExperiment = new RaskvelExperiment();
	showBust(tEnemy.bustDisplay);
	showName("RASKVEL\nEXPERIMENT");
	clearOutput();
	author("HNB");
	
	if(flags["MET_RASK_EXP"] == undefined)
	{
		flags["MET_RASK_EXP"] = 0;
		
		output("You hear a crashing from down the hall of a cart being knocked over. Quickly you draw your [pc.weapon] and stand, ready to fight. You hear the thudding of something heavy hitting the floor, over and over, increasing in volume as it draws nearer. Cackling and muttering joins the thudding sounds and you're able to sort of understand, between the maniacal laughter it as it draws nearer, the words echoing throughout the halls.\n\n");
		output("<i>“Heheheh, yes, hahahaa! A guest. Let's use them, yes that sounds nice.. AHAHA!”</i>\n\n");
		
		if (pc.isBimbo() || pc.lust() >= 70)
		{
			output("Ordinarily, you'd love the sound of that but they sound just a little too crazy for your liking! ");
		}
		else 
		{
			output("<i>“Uhhh, no way is that happening”</i> you think to yourself, grasping your [pc.weapon] tightly. ");
		}
		output("The noises are super loud now and all of a sudden, their source bursts into view!\n\n");
		
		if (flags["MET_MALE_RASKVEL_GANG"] != undefined) output("It's a Raskvel! But not a normal one. ");
		else if (flags["MET_FEMALE_RASKVEL"] != undefined) output("You've never seen a male Raskvel before but you're pretty sure they don't normally look like this. ");
		else output("Your codex beeps and informs you that the creature is a Male Raskvel. But there's some key differences from what your codex is describing and the state of this creature. ");
		
		output("His rubber-clad balls are the size of a small asteroid and he bounces atop them, grasping on to two rubber handles in order to bounce himself along. Just above that, the Raskvels slit has been thrust open to make room for a huge, knotted purple cock, pre-cum dripping from it, as he cackles and murmurs to himself.\n\n");
	}
	//Repeat
	else
	{
		output("You hear a crashing from down the hall of a cart being knocked over. Quickly you draw your [pc.weapon] and stand, ready to fight. You hear the thudding of something heavy hitting the floor, over and over and soon a rubber-clad Raskvel experimentation bursts from around a corner and into sight!\n\n");
	}
	
	var randSpeech:int = rand(2);
	if (randSpeech == 0)
	{
		if (pc.hasLegs()) output("<i>“Hehehe, you better open those legs now. Open them wide so I can unload these big balls of mine!”</i>\n\n");
		else if (!pc.isTaur() && !pc.isNaga()) output("<i>“Hehehe, you need to bend over now. Bend over so I can unload these big balls of mine!”</i>\n\n");
		else output("<i>“Hehehe, how about you just give yourself to me now! It'll save us both the trouble.”</i>\n\n");
		
		if (pc.isBimbo()) output("<i>“Uhh, like, make me!”</i> you shout, raising your weapon."); 
		else if (pc.isBro()) output("<i>“Uhh, no thanks, bro!”</i> you shout, raising your weapon.");
		else if(pc.isNice()) output("<i>“Not today, thanks!”</i> you reply, raising your weapon.");
		else if(pc.isMischievous()) output("<i>“Make me!”</i> you shout, raising your weapon.");
		else output("<i>“No thanks!”</i> you reply, raising your weapon.");
	}
	else if (randSpeech == 1)
	{
		output("<i>“Hehehe, are you going to play nice" + ((flags["BADGER_QUEST"] == -3) ? ", like the other visitor?" : "?") + " Or do we have to do this the hard way?”</i>\n\n");
		
		if (pc.isBimbo()) output("<i>“Umm, the hard way!”</i> you shout, raising your weapon."); 
		else if(pc.isNice() || pc.isMischievous()) output("<i>“Sorry, it's going to have to be the hard way!”</i> you reply, raising your weapon.");
		else output("<i>“The hard way!”</i> you shout, raising your weapon.");
	}
	else
	{
		output("<i>“Hehehe, if you don't play nice, these things will crush you little one. Although. I do intend for them to anyway HAHAHAHA!\n\n");
		output("<i>“We'll see about that!”</i> you reply, raising your weapon.");
	}
	
	flags["MET_RASK_EXP"]++;
	clearMenu();
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new RaskvelExperiment());
	CombatManager.victoryScene(RaskvelExperiment_Win);
	CombatManager.lossScene(RaskvelExperiment_Loss);
	CombatManager.displayLocation("R.EXPERIMENT");
	CombatManager.encounterTextGenerator(function():String {
		author("HNB");
		
		var h:Array = CombatManager.getHostileActors();
		var f:Array = CombatManager.getFriendlyActors();
		var numRe:int = 0;
		
		for (var p:int = 0; p < h.length; p++)
		{
			if (h[p] is RaskvelExperiment)
			{
				numRe++;
			}
		}
		
		if (numRe == 1)
		{
			if (h[0].hasStatusEffect("Charging"))
			{
				if (h[0].statusEffectv1("Charging") <= 2){
					if (f.length == 1) return "The abomination of a Raskvel bounces incessantly on his giant, rubber-sheathed balls, grunting, his eyes fixated on you."
					else return "The abomination of a Raskvel bounces incessantly on his giant, rubber-sheathed balls, grunting, his eyes fixated on your party."
				}
				else return "The Raskvel bounces vigorously on his balls, building great momentum."
			}
			else if (h[0].hasStatusEffect("Grappling"))
			{
				return "The Raskvel lies on top of " + f[h[0].statusEffectv1("Grappling")].getCombatName() + ", pinning " + f[h[0].statusEffectv1("Grappling")].getCombatPronoun("o") + " to the ground, grunting and drooling as he runs his hands over " + f[h[0].statusEffectv1("Grappling")].getCombatPronoun("pa") + " body.";
			}
			else if (h[0].hasStatusEffect("SkipTurn"))
			{
				return "The Raskvel wobbles about, trying to gather himself.";
			}
			else
			{
				return "The abomination of a Raskvel bounces on his giant, rubber-sheathed balls, laughing and grunting maniacally as his large, knotted cock twitches, eager to empty his load into his prey. His tongue hangs sloppily from his jagged maw, dripping saliva down past his collared neck as his bright orange eyes stare menacingly towards " + (f.length == 1 ? "you." : "your party.");
			}
		}
		else return ""; //Different func for multicombat tyvm
	});
	addButton(0,"Next", CombatManager.beginCombat);
 }
 
private function RaskvelExperiment_Win():void 
{
	clearOutput();
	clearMenu();
	author("HNB");
	
	output("At your final attack, the lecherous Raskvel rolls back, slamming against the ground in defeat. He still pants and stares at you lustily but he's in no position to chase after you.");
	if (pc.lust() >= 66) output(" Or deny you.");
	flags["RASKVEL_EXPERIMENT_CONSECUTIVE_LOSSES"] = 0;
	
	if (pc.hasCock())
	{
		addButton(0,"Fuck his ass",RaskvelExperiment_Win_AssFuck,undefined,"Fuck his butt","He probably isn't used to it but you're going to make sure he gets used to it.");
	}
	else 
	{
		addDisabledButton(0,"Fuck his ass","Fuck his ass","You'll need a dick for this!");
	}
	
	if (pc.hasVagina())
	{
		addButton(1,"Ride him",RaskvelExperiment_Win_RideHim,undefined,"Ride him","If his dicks going in your pussy, it's going to be your way!");
	}
	else
	{
		addDisabledButton(1,"Ride him","Ride him","You'll need a vagina for this!");
	}
	
	addButton(14,"Leave",CombatManager.genericVictory);
	
	//Sexopts
	giffLostItems();
}

private function RaskvelExperiment_Loss():void 
{
	clearOutput();
	
	if (flags["RASKVEL_EXPERIMENT_CONSECUTIVE_LOSSES"] == undefined) flags["RASKVEL_EXPERIMENT_CONSECUTIVE_LOSSES"] = 1;
	else flags["RASKVEL_EXPERIMENT_CONSECUTIVE_LOSSES"] += 1;
	
	if (flags["RASKVEL_EXPERIMENT_LOST_BEFORE"] == undefined)
	{
		flags["RASKVEL_EXPERIMENT_LOST_BEFORE"] = true;
		RaskvelExperiment_Loss_OralFirstTime();
	}
	else if (flags["RASKVEL_EXPERIMENT_CONSECUTIVE_LOSSES"] < 3)
	{
		if (pc.isCrotchExposed())
		{
			if (pc.hasVagina()){
				RaskvelExperiment_Loss_VagAss(pc.smallestVaginaIndex()); //vagina-loss
			}
			else 
			{
				RaskvelExperiment_Loss_VagAss(-1); //ass-loss
			}
		}
		else 
		{
			RaskvelExperiment_Loss_OralRough();
		}
	}
	else 
	{
		if (pc.lust() >= 75 && flags["RASKVEL_EXPERIMENT_CONSECUTIVE_LOSSES"] == 4)
		{
			RaskvelExperiment_Loss_BadEnd_1(); //bad end
		}
		else if (pc.hasVagina())
		{
			RaskvelExperiment_Loss_VagAss(pc.smallestVaginaIndex());
		}
		else 
		{
			RaskvelExperiment_Loss_VagAss(-1);
		}
	}
	
	giffLostItems();
}

private function giffLostItems(equip:Boolean = true):void 
{
	//Give player their stolen items back. Goes through Rask inventory and gives all shields, undergarments and armor to player that are in the Rasks inventory (Stolen in battle) and aren't already a drop from the rask (Add exc for any rask slot drops)
	if (flags["COMBAT_STOLEN_ITEMS_PCPARTY"] != undefined)
	{
		var h:Array = CombatManager.getFriendlyActors();
		var stolenItems:Array = flags["COMBAT_STOLEN_ITEMS_PCPARTY"];
		var stolenFromPlayer:Boolean = false;
		var stolenFromAllied:Boolean = false;
		var playerItemOutput:String = "";
		
		for (var i:int = 0; i < stolenItems.length; i++ )
		{
			if (stolenItems[i] != undefined)
			{
				var loot:Array;
				
				for (var ii:int = 0; ii < stolenItems[i].length; ii++)
				{
					if (stolenItems[i][ii] is ItemSlotClass)
					{
						var item:ItemSlotClass = stolenItems[i][ii];
						
						if (h[i] is PlayerCharacter) stolenFromPlayer = true;
						else stolenFromAllied = true;
						
						if (equip)
						{
							if (item.type == GLOBAL.ARMOR)
							{
								if (h[i].armor is EmptySlot)
								{
									h[i].armor = item;
									h[i].armor.onEquip(h[i]);
									if (h[i] is PlayerCharacter){
										playerItemOutput += "You equip " + item.description + " (x" + item.quantity + ")\n\n";
									}
								}
							}
							else if (item.type == GLOBAL.SHIELD)
							{
								if (h[i].shield is EmptySlot)
								{
									h[i].shield = item;
									h[i].shield.onEquip(h[i]);
									if (h[i] is PlayerCharacter){
										playerItemOutput += "You equip " + item.description + " (x" + item.quantity + ")\n\n";
									}
								}
							}
							else if (item.type == GLOBAL.LOWER_UNDERGARMENT)
							{
								if (h[i].lowerUndergarment is EmptySlot)
								{
									h[i].lowerUndergarment = item;
									h[i].lowerUndergarment.onEquip(h[i]);
									if (h[i] is PlayerCharacter){
										playerItemOutput += "You equip " + item.description + " (x" + item.quantity + ")\n\n";
									}
								}
							}
							else 
							{
								loot = new Array();
								loot.push(item);
								if (h[i] is PlayerCharacter){
									itemCollect(loot);
								}
								else h[i].inventory.push(item);
							}
						}
						else 
						{
							loot = new Array();
							loot.push(item);
							if (h[i] is PlayerCharacter){
								itemCollect(loot);
							}
							else h[i].inventory.push(item);
						}
					}
				}
			}
		}
		
		if (stolenFromPlayer){
			output("\n\nYou find the gear that the Raskvel tore off you, strewn about on the floor");
			if (stolenFromAllied){
				output(" and so do your allies");
			}
			output(".\n\n" + playerItemOutput);
		}
		else if (stolenFromAllied){
			output("\n\nYour allies find their stolen gear, strewn about on the floor");
		}
		
		flags["COMBAT_STOLEN_ITEMS_PCPARTY"] = undefined;
	}
}

private function RaskvelExperiment_Loss_OralFirstTime():void 
{
	clearOutput();
	clearMenu();
	
	var classInst:RaskvelExperiment = new RaskvelExperiment();
	showBust(classInst.bustDisplay);
	showName("LOST VS: R.\nEXPERIMENT");
	author("HNB");
	
	//Says if you suck his dick he won't beat you up any more
	if (pc.HP() <= 0)
	{
		output("You fall to your [pc.knees] defeated, too beaten up to go on. As you do the experiment bounces towards you, stopping inches from you, laughing maniacally.\n\n");
		output("<i>“You should've taken the easy way! I told you!”</i> he cackles. <i>“Now you're on your knees, maybe you'll play nice”</i>.\n\n");
		output("As he says this, he grasps his " + classInst.cockDescript() + " in his hands and beckons you closer.\n\n");
		
		if (pc.isBimbo())
		{
			output("You feel like you should probably suck his dick. Actually you feel like that most of the time.\n\n");
		}
		else if (pc.isCumSlut())
		{
			output("Well, if he's going to put it like that, cock-sucking it is!\n\n");
		}
		else 
		{
			output("You get the message.\n\n");
		}
	}
	else 
	{
		output("You fall to your [pc.knees], too damn horny to keep fighting. As you do the experiment bounces towards you, laughing maniacally, his dick springing up and down.\n\n");
		output("<i>“You should've taken the easy way! I told you!”</i> he cackles. <i>“Now you're on your knees, maybe you'll play nice”</i>.\n\n");
		output("As he says this, he grasps his " + classInst.cockDescript() + " in his hands and beckons you closer.\n\n");
		output("<i>“Mmm, I think I just might”</i> you moan.\n\n");
	}
	
	output("You ");
	if (pc.isNaga())
	{
		output("slither forward");
	}
	else if (pc.isTaur())
	{
		output("dragon your hindquarters forward");
	}
	else 
	{
		output("shuffle forward");
	}
	output(" until your [pc.nose] is pressed against the tip of the experiments thick, pre-coated cock as he lounges on top of his balls, as if they're a throne. With it pressed against your nose, it's impossible not to smell its stench. Clearly they don't have showers down here because his dick smells like about half a years worth of cum has just been left to dry on it. ");
	if (pc.isCumSlut() || pc.lust() >= 75)
	{
		output("Oh stars, you know this smell should be nasty but it has your head buzzing.");
	}
	else 
	{
		output("Stars, that's a strong stench. It does help you warm up to the Raskvels suggestion though.");
	}
	
	//Licky
	output("\n\nYou grasp his dangling manhood, grasping his thick flesh in your hands before opening your mouth and pressing your [pc.tongue] to it. You begin lapping at the underside of it, trailing your taste buds along a mix of old and more recent jizz. ");
	if (pc.isCumSlut())
	{
		output("It's so filthy you could cum! You lap vigorously at his cock, trying to taste every inch of it.");
	}
	else if (pc.isBimbo())
	{
		output("It's not the yummiest cock - actually it's pretty nasty, but somehow that's really hot! You find yourself licking his cock more and more, as the filthiness stirs you on.");
	}
	else
	{
		output("It's so filthy you could vomit but somehow that same filthiness is a massive turn on and you find yourself getting more vigorous with your licking.");
	}
	
	output("\n\n<i>“Mmmmm, good [pc.boyGirl]”</i> the Raskvel moans, smirking as you look up at him. <i>“Maybe I won't crush you, as long as you keep being a good slave of course, ahahaha!”</i>\n\n");
	if (pc.isBimbo())
	{
		output("<i>“Oooh, I'll be such a good girl then!”</i> you giggle, lapping enthusiastically at his yummy cock.");
	}
	else if (pc.isSubby())
	{
		output("<i>“Mmm, sure thing master”</i> you moan. <i>“I'm all yours!”</i>");
	}
	else if (pc.isNice())
	{
		output("<i>“I'll do my best!”</i> you shout, continuing to lap away.");
	}
	else if (pc.isBro())
	{
		output("<i>“Sure thing bro”</i> you grunt. <i>“We cool!”</i>");
	}
	else 
	{
		output("<i>“Oh, there'll be no problems there”</i> you say sultrily, lapping enthusiastically at his veiny cock. You're completely his at this point.");
	}
	
	//Loosens pouch and makes you lick his sweaty balls
	if (pc.sexualPreferences.getPref(GLOBAL.SEXPREF_SWEAT) >= GLOBAL.KINDA_LIKES_SEXPREF)
	{
		output("\n\n<i>“Hahaha, gooood. Then be a good slave and give these a good licking!”</i> the Raskvel cackles, tongue dangling, staring wildly at you. He reaches behind his head-sized knot and stretches the rubber straps of his undergarments up and, as you move out of the way, over the length of his cock. He then leans down, reaching his arms out for the hem of the rubber pouch and begins rolling it down, revealing inch after inch of reddened, sweaty, ball sack until he stops, a quarter of the way down them, unable to reach any further from his perch.\n\n");
		output("You lean in, grasping his balls and press your [pc.face] into them. <i>“Oh stars, these are incredible”</i> you think to yourself as you run your tongue over every inch of dank flesh you can lay it upon, lapping up the months worth of salty sweat that's accumulated on the creatures encapsulated bollocks. You love the feel of his damp, sperm-filled balls on your tongue, the dank smell of sweat that fills your nose and flows all the way back into your head. They deserve this worship you think as you kiss them enthusiastically between licks.\n\n");
		output("After what feels like no time at all, the Raskvel lets out a grunt and speaks up.\n\n");
		output("<i>“Good! Now suck my cock until I explode!”</i> he shrieks.\n\n");
		output("<i>“Aww”</i> you think to yourself. <i>“But I was so happy doing this”</i>.\n\n");
		output("You lean out, shifting your attention to his tasty cock");
	}
	else 
	{
		output("\n\nYou reach out");
	}
	
	//Suck tip
	output(" and grasp your [pc.hands] around the Raskvels' bulbous knot. Then leaning forward you take the pre-dripping tip of his engorged cock between your [pc.lips]. You can tell that this cock has been ready to blow for some time and the little warmup you were put through has only brought it closer to the edge. You can feel its tip twitch in your mouth as you lick and nibble at it and your lips smack against it. You can feel it throb in reaction, ready to unload all that cum into you as you flick your tongue against its opening and taste his salty flesh.\n\n");
	output("He kicks his legs back and forth, squirming in reaction. <i>“Ah-ahhh, good slave, go-oood! More!”</i>\n\n");
	
	//Suck it
	output("Grasping tighter on his firm knot you eagerly push your mouth deeper over his cock, swabbing your tongue along half of its slimy, cum-masked length, breathing hot breaths over his cock as it twitches and oozes bubbles of pre into your mouth, before you slide your lips back over his length, gliding your tongue along it until your lips slide over his pointed tip with a smacking sound and look up at him.");

	if (pc.sexualPreferences.getPref(GLOBAL.SEXPREF_SWEAT) >= GLOBAL.KINDA_LIKES_SEXPREF) output(" If you do a good enough job, maybe he'll give you another go with those sweaty balls of his!");
	output("\n\n");
	
	if (pc.isBimbo())
	{
		output("<i>“Totally good, right?”</i> you giggle, winking at the Raskvel, licking a glob of stray pre from your [pc.lips].\n\n");
	}
	else if (pc.isCumSlut())
	{
		output("<i>“I'm going to make you cum so much”</i> you moan, licking a bubble of stray pre from your [pc.lips].\n\n");
	}
	else if (pc.isSubby())
	{
		output("<i>“How's that master?”</i> you ask, licking a glob of stray pre from your [pc.lips].\n\n");
	}
	else 
	{
		output("<i>“How's that?”</i> you ask, licking a stray blob of pre from your [pc.lips].\n\n");
	}
	
	output("<i>“Don't stop slave!”</i> the Raskvel shouts as he leans forward and the tip of his heavy cock pushes into your face.\n\n");
	output("Eagerly, you shove your [pc.lips] hurriedly back over his tip and get to work, sloppily circling your tongue around his opening.\n\n");
	output("You take your hands off his knot and shift their attention to the exposed upper quarter of his swollen balls. As you start running your mouth over his stained cock, you start massaging his overly-full testicles with your hands, squeezing them with your palms and rubbing them in small circles as the Raskvel hums happily.\n\n");
	
	output("You weaponize your mouth, sloppily ");
	if (pc.canDeepthroat())
	{
		output("shoving his cock halfway into your throat, funneling it down your tongue ");
	}
	else 
	{
		output("bouncing his tip off the back of your tongue ");
	}
	output(" and bringing it back up with a wet, squelching sound but never letting it escape from your attack. His pre is leaking out everywhere, pouring salty lube out onto your tongue as it slides back and forth. There's so much, you find yourself swallowing it down as his curvy, leaking thickness shunts globules of it to the back of your throat. It's a pretty good sign that a climax is coming though, if you can just tease it out of him. You pull your hands off his cumpouch and reach out, clapping them to the purple flesh behind his knot. Whilst you continue to shove his cock in and out of his mouth you firmly tug his cock with your hands, shoving your grasp up against his boulder-like knot before tugging the opposite way, causing the Raskvel to moan loudly as the sides of your hands brush against his socketed cock-slit.\n\n");
	
	//He cums and bounces off
	output("<i>“Fuck”</i> the experiment exasperatedly grunts as you feel his oozing cock trembling in your palms and in your mouth. <i>“I want to use you so much more slave, pound the shit out of you until you're lying on the floor dripping! But fresh meat always gets me so riled up. Fu-uck, I'm going to cum!”</i>\n\n");
	output("The cock in your mouth twitches and throbs and then, despite your firm grasp, explodes and you find yourself knocked off of him to the floor in shock as an arm-thick stream of cum flies above you from the tip of his raging, purple mass. The Raskvel pounces on top of you and you meet him with no resistance as his cock and the stream begin angling downwards. You smile and quickly shut your eyes as the barrage of white begins battering your face. He grunts and moans as wave after wave of cum blasts you. The sound quickly changes from a pattering to a splattering as it starts to pile up and you feel it sliding in big goopy masses down your cheeks.\n\n");
	output("A long 10 seconds later you feel the weight lift off you. You begin pawing the thick layers of  cum off of your eyelids and by the time you manage to wipe enough off to see, you're alone again, in the hallway of the dungeon.\n\n");
	
	pc.loadInMouth(classInst);
	pc.applyCumSoaked();
	pc.applyCumSoaked();
	
	processTime(10);
	CombatManager.genericLoss();
}

private function RaskvelExperiment_Loss_OralRough():void 
{
	clearOutput();
	clearMenu();
	
	var classInst:RaskvelExperiment = new RaskvelExperiment();
	showBust(classInst.bustDisplay);
	showName("LOST VS: R.\nEXPERIMENT");
	author("HNB");
	
	//You fall to ground
	if (pc.HP() <= 0)
	{
		output("You fall backwards onto your back, defeated.\n\n");
		output("<i>“I told you the first time!”</i> the experiment chortles as he bounces towards you. <i>“You should've taken the easy way - you should've just rolled over in the first place”</i>.\n\n");
		output("<i>“Yeah, sure feels that way”</i> you sigh. <i>“Well, I'm rolling over now aren't I?”</i>\n\n");
	}
	else
	{
		output("You fall backwards onto your [pc.ass], defeated.\n\n");
		output("<i>“I told you the first time!”</i> the experiment chortles as he bounces towards you. <i>“You should've taken the easy way - you should've just rolled over in the first place”</i>.\n\n");
		output("<i>“Oh, shut up and fuck me! I'm here now aren't I?!”</i> you shout.\n\n");
		
	}
	
	output("He laughs and bounces over you, positioning himself just above your head, filling your nostrils with his stench and then turns to face you. <i>“And I'm really going to use you this time, my pet”</i>.\n\n");
	//Shoves his cock knot-deep down your throat
	output("Before you're even given the opportunity to spout some witty retort, the Raskvel's cum-stained purple manhood is dropped into your vision and thrusted against your lips. He cackles loudly as ");
	if (pc.isBimbo())
	{
		output("you open wide and accept his yummy, cummy cock into your mouth.");
	}
	else 
	{
		output("you open wide and accept his filthy, pre-leaking cock into your mouth.");
	}
	
	output("\n\nHe rocks back and forth on his testicle-throne, bouncing the tip of his dank manhood off of the back of your mouth as it oozes pre onto your salivating tongue.\n\n");
	output("With every thrust, your head gets tilted further back and ");
	if (!pc.isTaur() && !pc.isNaga() && pc.hasFeet())
	{
		output("you have to press your feet into the ground to stop yourself from being knocked around.\n\n")
	}
	else 
	{
		output("you find yourself arching your back and pressing your butt into the ground to stop yourself from being knocked around.\n\n");
	}
	if (pc.isCumSlut() || pc.lust() >= 75)
	{
		output("You clap your hands to his rubber-bound testicles, as much as to touch them as for something to hold on to.\n\n");
	}
	
	output("Suddenly the angle of your body hits just the right angle and you squirm ");
	if (pc.isCumSlut() || pc.lust() >= 75)
	{
		output("happily ");
	}
	output("as 16 inches of Raskvel cock thrusts its way along your tongue and down your throat, widening with every inch until you feel cock pushing against the edges of your throat, your mouth is stretched wide open and your [pc.lips] are squashed against his bulbous knot.\n\n");

	if (pc.canDeepthroat())
	{
		output("Thank the stars you can handle this type of thing, or you'd be choking right now.\n\n");
		output("<i>“What a capable " + pc.mf("slave","bitch") + " you are”</i> the Raskvel laughs. <i>“And your throat feel so good! I can definitely relieve myself with you!”</i>\n\n");
		output("Fuck, you definitely want that. Imagine how much spunk those balls of his can hold! Eager to find out you clamp your lips as tight as you can around his lavender cock-meat and sloppily bounce your lips off his knot, as saliva foams up inside your mouth around his dick.\n\n");
	}
	else 
	{
		output("Your eyes go as wide as your mouth and you cough and choke as his engorged cock that's pushes against your gag reflex, causing you to sputter saliva all over his knot.\n\n");
		output("<i>“Ahaha, I'm not stopping slave”</i> the Raskvel laughs. <i>“You're only making this better!”</i>\n\n");
		output("You don't want him to stop! Imagine how much spunk those balls of his can hold! Eager to find out you clamp your lips as tight as you can around his lavender cock-meat and try to calmly breath through your nose. You then sloppily bounce your lips off his knot, as saliva foams up inside your mouth around his dick.\n\n");

	}
	//Sloppy throat-fucking, struggling to breath, saliva everywhere, spitting glops of pre 
	output("He starts pulling further back, pulling 8-inches of spit-covered cock out in front of you before pushing it back in as far as it will go. His cock widens further down its length and so you find your mouth swapping quickly between being stretched painfully wide and being given a slight moment of relief allowing you to breath a little before he shoves it all back in. A hot mixture of your own drool and his leaking pre runs down your reddening face as he rapidly pounds away at your throat in increasing intensity.\n\n");
	
	output("He must be enjoying the feel of your mouth because the amount of pre-spooge you can feel pouring out into your mouth is increasing and you soon find yourself spitting it out as often as you, much to his amusement and arousal, just so you don't end up choking on it.\n\n");
	output("He continues using your mouth as a glorified cocksleeve for several minutes. You feel nothing anymore, your mouth is almost completely numb apart from the feeling of his cock brushing against your lips and tickling the back of your throat. Your face is burning but you've gotten used to it and you're able to steadily breath through your nose. Throughout all this, the Raskvel moans and grunts louder and louder, until suddenly, his leaking cock explodes!\n\n");
	output("A river of cum blasts the back of your throat as the Raskvel holds his climaxing cock in your mouth. You're forced to breath rapidly through your nose as his splooge fills your airways. It keeps coming, pouring out in great viscosity and you soon find it filling your cheeks and pouring out over your lips. You have to gulp loads of it down, just to deal with the sheer output but that's not enough, as you shortly find out. You feel loads of it go the wrong way and you start coughing loudly as cum pours from your nose, all over your already cum-soaked face.\n\n");
	output("Half a minute later, his coated cock is pulled out of your mouth and you lie there, your head buried in layers and layers of his spooge as he slowly, hops away on his emptied balls.\n\n");
	pc.loadInMouth(classInst);
	pc.loadInMouth(classInst);
	pc.applyCumSoaked();
	pc.applyCumSoaked();
	pc.applyCumSoaked();
	pc.applyCumSoaked();
	processTime(10);
	CombatManager.genericLoss();
}

private function RaskvelExperiment_Loss_VagAss(X:int):void 
{
	clearOutput();
	clearMenu();
	
	var classInst:RaskvelExperiment = new RaskvelExperiment();
	showBust(classInst.bustDisplay);
	showName("LOST VS: R.\nEXPERIMENT");
	author("HNB");
	
	if (pc.isCrotchExposed())
	{
		output("You fall onto your back defeated. As you lie there, the experiment hops towards you, cock throbbing and oozing, his eyes fixed on your [pc.vagOrAss " + X + "].\n\n");
	
		if (pc.hasLegs())
		{
			if (pc.isBimbo()) output("You giggle and spread your legs wide, eagerly inviting him to use it.\n\n");
			else output("You spread your legs, eagerly inviting him to use it.\n\n");
		}
		else 
		{
			if (pc.isBimbo()) output("You giggle and " + (X != -1 ? "push your [pc.crotch] outwards" : "raise your hips, pushing your [pc.ass] outwards") + ", eagerly inviting him to use it.\n\n");
			else output("You " + (X != -1 ? "push your [pc.crotch] outwards" : "raise your hips, pushing your [pc.ass] outwards") + ", eagerly inviting him to use it.\n\n");
		}
	}
	else 
	{
		output("You fall onto your back defeated. As you lie there, the experiment hops towards you, cock throbbing and oozing, his eyes fixed on ");
		if (!pc.isCrotchExposedByArmor())
		{
			output("the lower portion of your [pc.armor].\n\n");
			if (pc.isBimbo()) output("You giggle and bounce slightly off the ground, throwing your armor and undergarments aside," + (X == -1 ? " raising your hips and" : "") + " exposing your [pc.vagOrAss " + X + "] to him.\n\n");
			else output("You quickly lift yourself off the ground and throw your armor and undergarments aside," + (X == -1 ? " raising your hips and" : "") + " exposing your [pc.vagOrAss " + X + "] to him.\n\n");
		}
		else 
		{
			output("your [pc.lowerUndergarment].\n\n");
			if (pc.hasLegs())
			{
				if (pc.isBimbo()) output("You giggle, raise your legs and peel them off," + (X == -1 ? " raising your legs and" : "") + " exposing your [pc.vagOrAss " + X + "] to him.\n\n");
				else output("You raise your legs and peel them off," + (X == -1 ? " raising your legs and" : "") + " exposing your [pc.vagOrAss " + X + "] to him.\n\n");
			}
			else 
			{
				if (pc.isBimbo()) output("You giggle before raising your hips off the ground and peeling them off, exposing your [pc.vagOrAss " + X + "] to him.\n\n");
				else output("You raise your hips off the ground and peel them off, exposing your [pc.vagOrAss " + X + "] to him.\n\n");
			}
		}
	}
	
	output("Stirred on by your invitation, the Raskvel quickly bounces right up to you and rolls over onto you, his stench hitting you as he does. He grabs your wrists holding you to the floor as you wrap your legs around his giant rubber-coated balls.\n\n");
	
	output("<i>“Mmmm, I think I'll use this today”</i> he moans, ");
	if (pc.isPlugged(X))
	{
		output("popping the plug out of your [pc.vagOrAss " + X + "].n\n");
	}
	else
	{
		output("running his fingers around your [pc.vagOrAss " + X + "].\n\n");
	}
	
	if (pc.isBimbo())
	{
		output("<i>“That's what it's there for!”</i> you giggle. ");
	}
	else if (pc.isSubby())
	{
		output("<i>“Of course, you've earned it”</i> you say. <i>“After all, I lost, so now I'm yours!”</i> ");
	}
	else
	{
		output("<i>“Go right ahead”</i> you moan. ");
	}
	
	if (((classInst.cockVolume(0, true) > pc.vaginalCapacity(X)) && X != -1) || ((classInst.cockVolume(0, true) > pc.analCapacity()) && X == -1))
	{
		output("<i>“Just be careful, it might be a bit tight for you!”</i>\n\n");
		output("<i>“Well, it'll have to stretch then”</i> he cackles loudly.\n\n");
		
		output("At this, he swings his hips backwards, grunts and then slams the tip of his filthy cock into you.\n\n");
		pc.holeChange(X, classInst.cockVolume(0, true));
		
		output("At first, you can feel his hard tip parting your " + (X != -1 ? "lips" : "anus") + " and it feels like your standard cock. But then it widens slightly and begins to curve and you can feel the underside of it brush tenderly against your bottom wall and shortly following that you gasp as it widens enough to touch every wall of your " + (X != -1 ? "pussy" : "ass") + ".\n\n");
		output("But there's way more to go. That's really just the first couple of inches. He keeps pushing it in as it increases in width more dramatically and you pant and grunt as feel your " + (X != -1 ? "pussy" : "ass") + " stretching to accommodate it.\n\n");
		output("He's moaning and you feel his grasp on you tighten as he tries his hardest to force it in, as it juts inch by inch into place and the walls of your " + (X != -1 ? "pussy" : "anal canal") + " stretch painfully further but by the stars, is it worth it. It feels so thick and hard and you know full well just how much he can cum!\n\n");
		output("You feel the bump of a large, blood-filled vein as another couple of inches plough their way in and finally, you sigh in relief as the cock entering you narrows and you feel his knot bump against your " + (X != -1 ? "crotch" : "[pc.ass]") + ".\n\n");
		output("The Raskvel smirks. <i>“What're you sighing for?”</i> he laughs. <i>“I'm not done yet!”</i>\n\n")
		output("He thrusts forward and you cry out as your entrance stretches even wider as he shoves his half-turgid knot inside. Then once in, you feel it engorge again and you're sure you're about to be torn apart. This is so sore, there's no way you're meant to take this much!\n\n");
		
		if (pc.isBimbo())
		{
			output("<i>“Oh fuck, you're so biiiiig”</i> you gasp, drooling from your mouth.\n\n");
		}
		else if (pc.isCumSlut())
		{
			output("<i>“Forthecumforthecumforthecum”</i> you mumble over and over to yourself, drooling from your mouth.\n\n");
		}
		else if (pc.isSubby())
		{
			output("<i>“Oh fuck! Master, you're so big!”</i> you cry out.\n\n");
		}
		else 
		{
			output("<i>“Oh fuck!”</i> you cry out.\n\n");
		}
		output("<i>“Tight tight tight”</i> the Raskvel cackles at you. <i>“Gonna loosen you up.”</i>\n\n");
		
		output("You feel his knot tug at your entrance as he pulls back, his cock-flesh rippling against your walls. He then thrusts forward vigorously, tugging your insides in the direction of his cock. You feel it curve outwards as he pushes further in");
		if (pc.bellyRating() <= 5)
		{
			output(" , deeper and deeper until as he hits depth you can see the end of his tip pushing against the top end of your stomach.\n\n");
		}
		else 
		{
			output(", deeper and deeper until it hits depth, pushing against the other side of your stomach.\n\n");
		}
		
		output("You're pushed back and forth on the ground as he begins pounding your[pc.vagOrAss " + X + "] with his pre-dripping cock, ");
		if (pc.wetness(X) >= 2)
		{
			output("each squelch-inducing thrust ");
		}
		else 
		{
			output("each thrust ");
		}
		if (pc.biggestTitSize() >= 4)
		{
			if (pc.biggestTitSize() >= 8)
			{
				output("causing your [pc.tits] to smack against your face.\n\n");
			}
			else 
			{
				output("bouncing your [pc.tits] around at breakneck speed.\n\n");
			}
		}
		else if (pc.hasCock())
		{
			output("causing your [pc.cocks] to flop around at breakneck speed.\n\n");
		}
		else
		{
			output("bouncing you around to the point that the only reason you're still under him is because he's pinned you to the floor.\n\n");
		}
		
		output("You start panting half in pleasure and half in discomfort as you feel the pressure of his cock more than plugging up your " + (X != -1 ? "pussy" : "butt") + ", even as he pulls back, his knot still gives your " + (X != -1 ? "quim" : "ass") + " no opportunity to breath. Every time his cock rumbles or quivers, you can feel it run through your insides, as it pushes against your walls.\n\n");
		output("<i>“Oh fuck, oh fuck, fuckmefuckmefuckme”</i> you gasp as the panting experiment pounds away at your quivering " + (X != -1 ? "slit" : "anus") + ".\n\n");
	}
	else 
	{
		output("<i>“It should be big enough for you!”</i>\n\n");
		output("<i>“Yeah, you little slut”</i> he cackles loudly.\n\n");
		
		output("At this, he swings his hips backwards, grunts and then slams the tip of his filthy cock into you.\n\n");
		pc.holeChange(X, classInst.cockVolume(0, true));
		
		output("You have to watch to feel his lavender tip passing your " + (X != -1 ? "lips" : "anus") + ". You only begin to feel it as it begins to widen and curve, when you can feel the underside of it brush tenderly against the bottom of your insides. You know that it keeps widening but it has yet to be big enough to feel too much. Heck, this is basically foreplay.\n\n");
		output("But there's way more to go. That's really just the first couple of inches. He keeps pushing it in as it increases in width more dramatically and you soon feel the heat of it as it begins to approach the walls of your capable fuck-hole.\n\n");
		output("You let out a gasp as you finally feel his throbbing cock finally widens enough to touch your walls. It feels so thick and hard and you know full well just how much he can cum!\n\n");
		output("You feel the bump of a large, blood-filled vein as another couple of inches plough their way in and finally, you let out a moan as his cock really pushing against your walls.\n\n");
		output("The Raskvel smirks. <i>“What're you moaning for?”</i> he laughs. <i>“I'm not done yet!”</i>\n\n");
		output("<i>“Neither am I”</i> you reply.\n\n");
		output("He thrusts forward angrily and you cry out as he shoves his half-turgid knot inside. Then once in, you feel it engorge again and fuck, that hits the spot!\n\n");
		if (pc.isBimbo())
		{
			output("<i>“Well that's more like it!”</i> you giggle.\n\n");
		}
		else 
		{
			output("<i>“Mmm, that's better”</i> you moan.\n\n");
		}
		output("<i>“Loose little slut”</i> the Raskvel cackles at you. <i>“Gonna have to get rough to feel anything.”</i>\n\n");
		if (pc.isBimbo())
		{
			output("<i>“Go for it!”</i> you squeal.\n\n");
		}
		else 
		{
			output("<i>“Be my guest”</i> you respond.\n\n");
		}
		output("You feel his knot tug at your entrance as he pulls back, his cock-flesh sliding against your walls. He then thrusts forward vigorously pushing his curved cock into your depths");
		if (pc.bellyRating() <= 5)
		{
			output(" , deeper and deeper until as he hits depth you can see the end of his tip pushing against the top end of your stomach.\n\n");
		}
		else 
		{
			output(", deeper and deeper until it hits depth, pushing against the other side of your stomach.\n\n");
		}
		
		output("You're pushed back and forth on the ground as he begins pounding your [pc.vagOrAss " + X + "] with his pre-dripping cock, ");
		if (pc.wetness(X) >= 2)
		{
			output("each squelch-inducing thrust ");
		}
		else 
		{
			output("each thrust ");
		}	
		if (pc.biggestTitSize() >= 4)
		{
			if (pc.biggestTitSize() >= 8)
			{
				output("causing your [pc.tits] to smack against your face.\n\n");
			}
			else 
			{
				output("bouncing your [pc.tits] around at breakneck speed.\n\n");
			}
		}
		else if (pc.hasCock())
		{
			output("causing your [pc.cocks] to flop around at breakneck speed.\n\n");
		}
		else
		{
			output("bouncing you around to the point that the only reason you're still under him is because he's pinned you to the floor.\n\n");
		}
		output("You start panting in pleasure as he bounces off the depths of your " + (X != -1 ? "pussy" : "anal canal") + " roughly giving your gaping fuck-hole what it deserves, plugging your entrance with his knot, giving your " + (X != -1 ? "quim" : "ass") + " no opportunity to breath as it's assaulted by pressure and pleasure. Every time his cock rumbles or quivers, you can feel it run through his knot and through your insides.\n\n");
		output("<i>“Oh fuck, oh fuck, fuckmefuckmefuckme”</i> you pant as the experiment pounds away at your quivering " + (X != -1 ? "slit" : "anus") + ".\n\n");
	}
	output("You see the Raskvels face falter and you feel his grip tighten. His panting hastens as he begins pounding you faster and shallower and you feel his cock burning inside you as it hardens and twitches and suddenly you feel a tidal wave of cum shoot out into you!\n\n");
	output("You can feel his throbbing reverberating through your walls as shot after shot of steamy cum blasts into you");
	if (pc.isSquirter())
	{
		output(" and with all that throbbing, you begin blasting back in reaction, spraying  [pc.girlcum] all over his climaxing cock.\n\n");
	}
	else 
	{
		output(".\n\n");
	}
	output("With no way out the raskvels gargantuan balls keep pouring their contents into you, flooding your body with cum. You moan loudly in time with him as his hot sperm floods your insides and you feel drops and bubbles of the stuff forming around your entrance as his knot begins to deflate, before suddenly cum starts pouring out from inside of you.\n\n");
	output("Several minutes later, the Raskvel finds the energy to roll off of you and bounce away, leaving you lying there in a pool of his cum.\n\n");
	
	if (X == -1)
	{
		pc.loadInAss(classInst);
		pc.loadInAss(classInst);
		pc.loadInAss(classInst);
		pc.loadInAss(classInst);
	}
	else
	{
		pc.loadInCunt(classInst, X);
		pc.loadInCunt(classInst, X);
		pc.loadInCunt(classInst, X);
		pc.loadInCunt(classInst, X);
	}
	pc.orgasm();
	pc.orgasm();
	processTime(10);
	CombatManager.genericLoss();
}

private function RaskvelExperiment_Loss_BadEnd_1():void 
{
	clearOutput();
	clearMenu();
	
	var classInst:RaskvelExperiment = new RaskvelExperiment();
	showBust(classInst.bustDisplay);
	showName("LOST VS: R.\nEXPERIMENT");
	author("HNB");
	
	output("You fall to your knees as per usual, ready to receive whatever method of relieving himself the Raskvel chooses.\n\n");
	output("<i>“What'll it be? Use my mouth until I'm gagging? Maybe strip me naked and fuck me full of cum?”</i> you beg.\n\n");
	output("The Raskvel cackles <i>“Stay! I do both, again and again. They not mind”</i>.\n\n");
	if (pc.isBimbo())
	{
		output("<i>“Ooh, that sounds super fucking good”</i> you moan as visions of getting pumped full of cum, every, single, day, fill your mind. <i>“Where should I chill?”</i>\n\n");
	}
	else if (pc.isCumSlut())
	{
		output("<i>“That sounds fucking amazing”</i> you moan as visions of getting pumped full of cum day in, day out, fill your mind. <i>“Where should I wait?”</i>\n\n");
	}
	else
	{
		output("<i>“I like the sound of that”</i> you respond as visions of getting pumped full of cum day in, day out, fill your mind. <i>“Where should I wait?”</i>\n\n");
	}
	output("<i>“Come, come!”</i> the Raskvel cackles wildly as he bounces down the hall and hops into one of the glass cells lining the walls.\n\n");
	output("You walk down the hall in pursuit. As you approach the cell you can see through the glass wall the Raskvel on the other side of the white tiled room, gesturing to a large set of shackles, designed to contain any manner of creature, dangling from the ends of chains on the wall. The door slides open as you reach it and you walk inside.\n\n");
	if (pc.isBimbo())
	{
		output("<i>“Ooh, nice chains, very kinky!”</i> you giggle. <i>“So do you want me to chill here then?”</i>\n\n");
	}
	else if (pc.isSubby())
	{
		output("<i>“Oh, do you want me to get in them?”</i> you say teasingly, knowing full well what the implication the Raskvel is putting forward is.\n\n");
	}
	else
	{
		output("<i>“Umm, you want me to just, slip into them willingly?”</i> you say in an objecting tone.\n\n");
	}
	output("<i>“Get in”</i> the Raskvel cackles. <i>“Then I fuck you whenever!”</i>\n\n");
	output("Your heart skips a beat as you hear that.\n\n")
	if (pc.isBimbo())
	{
		output("O. M. G. That sounds amazeballs. If you chain yourself up, you can't forget what you were doing and wander off. And that means you'll never miss out on fucking this big-balled freak! Yep, this is an ingenious plan with absolutely no downsides!\n\n<i>“Alrighty!”</i> you shout, [pc.walking] eagerly towards the shackles.\n\n");
	}
	else if (pc.isCumSlut())
	{
		output("Stars. Your only food being cum. Your only exercise being fucked. All you have in life being getting pumped full of seed like the cumdump you are! It's all you've ever wanted!\n\n<i>“O-Okay”</i> you mumble, [pc.walking] eagerly towards the chains and shackles.\n\n");
	}
	else if (pc.isSubby())
	{
		output("Stars, that's the ultimate form of submission. Being locked up and used as a fuck-hole to serve whoever and whatever requires it? That's what you live for!\n\n<i>“Alright”</i> you respond happily, [pc.walking] eagerly over to the shackles.\n\n");
	}
	else
	{
		output("Obviously, it's a terrible idea to just chain yourself up in some strange dungeon with a bunch of sex-mad creatures roaming about. But stars, you want to do it. After all, would you really hang about here getting pinned to the ground by the Raskvel, if sex wasn't what you were after? Of course not. So this is the obvious next step towards happiness.\n\n<i>“Alright”</i> you respond happily, [pc.walking] eagerly over to the shackles.\n\n");
	}
	
	if (pc.isNude())
	{
		output("Then");
	}
	else 
	{
		output("Before doing anything, you hurriedly tear off your [pc.clothes]. Then");
	}
	
	if (pc.legCount == 1)
	{
		output(" you step into a lower shackle and bend over to clasp it around your [pc.feet] before standing ");
	}
	else if (pc.legCount >= 2)
	{
		output(" you step into the lower shackles and bend over to clasp them around your [pc.feet] before standing ");

	}
	else 
	{
		output(", with no legs to worry about, you stand ");
	}
	output("up straight, reaching your arms out. You clasp the shackle around one [pc.arm] and the Raskvel helps with binding the other one. He moans examining your dangling, naked, ready body and hops over to a control panel on the wall, where he aimlessly jabs at a few buttons until");
	if (pc.legCount >= 2)
	{
		output(" you find your legs yanked up and apart, so you're dangling by your wrists with your legs spread wide.\n\n");
	}
	else 
	{
		output(" the chains around your wrists shorten, pulling you up the wall so you're dangling slightly off the ground.\n\n");
	}
	output("<i>“Hehehe, yes, you look good here”</i> the Raskvel moans, drooling from his mouth.\n\n");
	
	if (pc.isBimbo())
	{
		output("<i>“I like, always look good”</i> you giggle. <i>“Especially with a big cock in me!”</i>\n\n");
	}
	else if (pc.isCumSlut())
	{
		output("<i>“I'd look even better gagging on your cum”</i> you respond.\n\n");
	}
	else if (pc.isSubby())
	{
		output("<i>“I always do look good chained up”</i> you respond. <i>“I'd look even better servicing your dick!”</i>\n\n");
	}
	else 
	{
		output("<i>“Thanks”</i> you respond. <i>“Now are you gonna fuck me, or what?”</i>\n\n");
	}
	
	addButton(0,"Next",RaskvelExperiment_Loss_BadEnd_2);
}

private function RaskvelExperiment_Loss_BadEnd_2():void
{
	clearOutput();
	clearMenu();
	
	var classInst:RaskvelExperiment = new RaskvelExperiment();
	showBust(classInst.bustDisplay);
	showName("LOST VS: R.\nEXPERIMENT");
	author("HNB");
	
	for (var i:int = 0; i < 20; i++)
	{
		pc.applyCumSoaked();
		pc.loadInAss(classInst);
		pc.loadInMouth(classInst);
		pc.loadInCunt(classInst,pc.vaginas[rand(pc.vaginas.length) - 1]);
	}
	processTime(40 * 24 * 60);
	output("<b>40 days later</b>\n\n");
	output("<i>“Good cumdump”</i> the Raskvel moans as he pulls out of your cum-plastered face and bounces away into the distance.\n\n");
	output("That'll be all you'll eat today, a gallon of his yummy load. You lay back against the slimy wall behind you and relax, your loosened chains jangling as you do. The guards have come almost daily to check up on you but as long as you don't cause a ruckus, they're fine leaving you to your captor. And so are you. Some time ago, you asked to be lowered, so you could just let the cum pile up all over you, so they loosened the chains and let you lie there. And lie there you do, that is, until the Raskvel bounces back from whatever he's doing to come fuck you full of his seed again. And that's all you want to do. There's been no attempts of escape, it hasn't even crossed your mind. All you want to do is be his cumdump. And that's all you ever will be.\n\n");
	badEnd();
}

public function RaskvelExperiment_Win_AssFuck():void 
{
	clearOutput();
	clearMenu();
	
	var classInst:RaskvelExperiment = new RaskvelExperiment();
	showBust(classInst.bustDisplay);
	showName("WON VS: R.\nEXPERIMENT");
	author("HNB");
	
	var X:int = pc.cocks[rand(pc.cocks.length)];
	
	if (pc.isAss() || pc.isBro()) output("<i>“Nobody uses me!”</i> you say to the Raskvel");
	else output("<i>“Not so tough now you're on your knees”</i> you say to the Raskvel");
	
	if (!pc.isNude())
	{
		output(" as you ");
		if (pc.isGoo()) output("ooze");
		else if (pc.isNaga()) output("slither");
		else output("step");
		output(" out of your gear, groaning as [pc.eachCock] flops out of their confinement");
	}
	else
	{
		output("grabbing [pc.eachCock] in your hands lecherously");
	}
	output(". <i>“Now bend over! ");
	if (pc.isAss() || pc.isBro()) output("Or else!”</i>.");
	else output("I'm in charge now”</i>.");
	
	output("\n\nThe Raskvel stammers hesitantly but in no position to argue, clambers forward over his own gonads onto his knees before resting his abdomen on his testes so that his tight, chiselled butt ");
	if (pc.tallness > 4 * 12) output("is angled upwards towards you.");
	else output("is elevated off the ground, angled down towards your crotch, perfect for plowing into.");
	
	output("\n\n<i>“Good boy”</i> you say teasingly. <i>“Bet you're not so big back here, are you? ");
	if (pc.isAss() || pc.isBro()) output("Well, don't expect me to go gentle!”</i>");
	else output("Shame. If you were nicer to me, I would've been more gentle.”</i>");
	
	output("\n\nThe Raskvel whimpers shakily in response. Whatever, he's going to be whimpering more in a minute.");
	output("\n\nYou grasp his muscular hips and drop your [pc.cock " + X + "] between his scalebound buttocks. His breathing grows faster as he feels the weight of it drop on to him. The anticipation coming from him is more than enough to get you hard.");
	output("\n\nYou grasp your cock in one hand and shift your other hand to his left buttock, pulling his sweaty, scaled buttocks apart, revealing one tight pink butthole.");
	output("\n\n<i>“Mmm what do we have here?”</i> you cackle. <i>“Looks like I was right.");
	if (pc.cockVolume(X) > classInst.analCapacity()) output(" You might want to try and relax!”</i>");
	else output("”</i>");
	
	output("\n\nYou thrust your [pc.hips] forward and push your [pc.cockHead " + X + "] against his taut bum-slit. With the sweaty-ness of it acting as lube his soft, warm flesh slowly parts around your tip");
	if (pc.cockVolume(X) > classInst.analCapacity()){
		output(", or rather, the tip of your tip. It's going to have to try a lot harder to take all of it. You keep pushing in and his ring quickly sits taut against your head.");
		output("\n\n<i>“Ooh, not good enough I'm afraid”</i> you chastise. <i>“We'll have to stretch you out.”</i>");
		output("\n\nA gasp followed by ramblings of objection are thrown your way. Ugh, how annoying. You know just how to shut him up. You thrust forward, causing the ring of his butt to push into your flesh in resistance as the Raskvel gasps and huffs in pain. However it then parts beautifully and your [pc.cock " + X + "] slides neatly into the experiments stretched anus, his warm insides enveloping your manhood all the way down to your [pc.knot " + X + "].");
		output("\n\n<i>“Don't complain, you would've done the same to me”</i> you laugh as the Raskvel pants on all fours, pre dripping from his cock.");
		if (pc.ass.looseness() <= 3) output(" <i>“If I had a tight little virgin ass like yours, of course!”</i>");
	}
	else{
		output(", his tight sphincter inevitably parting, allowing his warm insides to envelope your manhood, all the way down to your [pc.knot X]. Despite how easy that was, he's still huffing and puffing. You guess he's just not used to taking it up the butt.");
		output("\n\n<i>“Lucky for you, you're an alright fit”</i> you cackle as the Raskvel pants on all fours, pre dripping from his cock.");
	}
	output("\n\n<i>“Looks like you like it though”</i> you say grinning.");
	if (pc.isAss()) output(" <i>“I'll soon see to that.”</i>");
	
	if (pc.hasKnot(X)) output("\n\nYou shove your additional girth in and as you do, you can feel the muscles inside the Raskvel clench down on your knot, so much that you're sure he just milked a little bit of pre out of you. Well, at least he can't complain about the lack of lube now.");
	output("\n\nYou should probably go slowly seeing as he's clearly not used to this sort of fun.");
	if (flags["RASKVEL_EXPERIMENT_LOST_BEFORE"] == true) output(" Although, he's never given you the same courtesy, so why bother?");
	else output(" Although, he probably wouldn't show you the same courtesy, so why bother?");
	
	output("\n\nYou start off fast and intending to go faster, shunting your cock in and out of his plush depths, every thrust bouncing the Raskvel against his own balls causing pre to bubble from his cock like toothpaste from a tube.");
	output("\n\n<i>“Good boy”</i> you tease as the experiment begins to grunt and moan submissively. <i>“Do you like my cock in your ass?”</i>");
	output("\n\n<i>“Fuck off!”</i> the Raskvel cackles defiantly. Wrong answer. You raise your [pc.hand] and smack your hand across his plump buttock, leaving his scaled skin slightly redder and make sure to thrust noticeably rougher into him as you do.");
	output("\n\nYou ask again. <i>“I said, do you like my cock in your ass?!”</i>");
	output("\n\n<i>“F-Fine! Yes, I love your fat cock in my tight arse!”</i> the Raskvel squeals, although there's maybe some insincerity in his words.");
	output("\n\n<i>“That's what I thought”</i> you say smugly, clapping your [pc.hands] back to his hips and bouncing your cock off his depths, his tightness squeezing against your blood-filled manhood.");
	output("\n\nYou thrust harder and faster into your little servant, his tightness spurring you on. The heat from how tight a fit this is is bringing your cock to its boiling point and the grunts and dribbles of cum coming from the raskvel aren't helping that.");
	output("\n\nWith your cock feeling like it's about to explode you plow as hard and as deep as you possibly can into him bouncing him off his ball thrown. You fall with him, plowing your cock deeper into him than you thought you could and erupt into his clenched ass.");
	
	if (pc.cumQ() < 5)
	{
		output("\n\nYou anticlimactically spunk a few meager drizzles of [pc.cum] down his insides.");
		output("\n\n<i>“Ahahaha is that all you've got”</i> the Raskvel cackles as he pulls himself off of your deflating shaft. <i>“And to think I lost to you. I'll show you what a real alpha cums like, next time!”</i>");
		output("\n\nAs he bounces away to recover, you grab your gear and press on.");
	}
	else if (pc.cumQ() < 100)
	{
		output("\n\nLong bursts of [pc.cum] explode from your cock in energetic flurries, flooding his ass in a wave of [pc.cumColor]. Whatever space in his tight little ass wasn't taken up by your cock is taken up by your cum.");
		output("\n\n<i>“I-is that all you've got”</i> the Raskvel says, in a way that sounds like he's trying to be antagonistic but he's so un-used to having a load in his ass that he can't quite say it confidently.");
		output("\n\nAfter he pulls himself off of your wet, deflating shaft, he bounces away to recover. You grab your gear and press on.");
	}
	else if (pc.cumQ() < 500)
	{
		output("\n\nLong bursts of [pc.cum] spray from your cock in second-long bursts of sperminess, filling his ass with [pc.cumColor]. He groans as his insides are absolutely filled with cum causing his chiselled stomach to bulge slightly before you pull out, letting it pour out of his ass all over his leather coated balls.");
		output("\n\n<i>“Ughhh”</i> the Raskvel moans as he lies on the ground cum dripping from his ass.");
		output("\n\nLeaving him lying there, you throw your gear back on and continue your journey.");
	}
	else
	{
		output("\n\nSperm explodes from your cock in 5 second long sprays, sprays so intense that your vision begins to blur. You can hear muffled gasping and groaning as your cum is forced to flow deeper into him as the tightness of his ring leaves no room for escape. You raise your head, looking up at the ceiling and just enjoy the feeling of cum erupting from your cock as his tight ass clenches down on your cock. Eventually, your flow cuts off and you regain focus.");
		output("\n\nThe Raskvel is slumped over on the floor, wobbling and groaning, his belly blown up to the size of his balls. You pull out and cum begins gushing from his butt as he moans and cries, his belly slowly deflating.");
		output("\n\nWell, he's not going anywhere. With that sorted, you throw your gear back on and continue on your journey.");
	}
	output("\n\n");
	pc.orgasm();
	pc.orgasm();
	processTime(20);
	CombatManager.genericVictory();
}

public function RaskvelExperiment_Win_RideHim():void 
{
	clearOutput();
	clearMenu();
	
	var classInst:RaskvelExperiment = new RaskvelExperiment();
	showBust(classInst.bustDisplay);
	showName("WON VS: R.\nEXPERIMENT");
	author("HNB");
	
	var X:int = pc.vaginas[rand(pc.vaginas.length)];
	if (pc.isAss() || pc.isBro()) output("<i>“Nobody uses me!”</i> you say to the Raskvel");
	else output("<i>“Aww, you're kinda cute now you're on your knees”</i> you say to the Raskvel");
	if (!pc.isNude())
	{
		output(" as you ");
		if (pc.isGoo()) output("ooze");
		else if (pc.isNaga()) output("slither");
		else output("step");
		output(" out of your gear,");
	}
	output(" drawing your [pc.hands] to your [pc.crotch].\n\n");
	output("<i>“If you ask nicely.. I might just be kind enough to let you use this”</i>. As you say this, you circle a finger around your [pc.vagina " + X + "], teasingly.\n\n");
	output("The Raskvel rocks back and forth eagerly. <i>“Mmmm, please, please. Let me fuck it!”</i>\n\n");
	if (pc.isBimbo() || pc.isCumSlut())
	{
		output("Hmm he probably didn't have to beg that much. You kinda want to see what that dick's like anyway.\n\n");
	}
	else if (pc.isAss() || pc.isMischievous() || pc.isBro())
	{
		output("<i>“Really beg!”</i> you demand.\n\n");
		output("<i>“Oh, please please please. Bless my dick with your pussy!”</i>\n\n");
		output("<i>“Mmm, that's better”</i> you cackle.");
	}
	else
	{
		output("<i>“Good boy”</i> you say, smirking.");
	}
	output("<i>“Now lie down and if you feel good enough, I'll let you cum.”</i>\n\n");
	output("The Raskvel eagerly falls onto his back, pre dribbling from his tip. You clamber over his balls, dropping to the other side with your tips pressed against his knot, your [pc.hands] grasping his chest. His cock sits inches from your face and you can smell the strong musk of both fresh and dry, sweat and cum. You watch as a glob of pre rolls down his thick, curvaceous cock. Oh stars, you need to get on that, right now!\n\n");
	output("You lift your [pc.hips] up, lifting yourself up and pressing your [pc.vagina " + X + "] to the curved taint of his cock. You rock your hips forwards and backwards, slowly, rubbing your eager pussy against it as it slides between your lips.\n\n");
	output("<i>“Should I put it in?”</i> you ask the Raskvel teasingly.\n\n");
	output("<i>“Yes, yes, yes”</i> the Raskvel cries, panting in reaction to your grinding.\n\n");
	output("You rock forward, pressing your hands into the experiments chest as you lift your hips up before driving them down, spearing the tip of his cock into your awaiting cunt.\n\n");
	
	pc.holeChange(X, classInst.cockVolume(0, true));
	if (classInst.cockVolume(0, true) > pc.vaginalCapacity(X))
	{
		output("The initial portion of his cock feels hot and way within your capacity to take. But with each inch it gradually widens and curves. You carefully lower yourself further and you feel his throbbing cockflesh brush tenderly against your insides. You take more and let out a gasp as he widens more, his cock touching every wall of your pussy. You keep lowering yourself, panting as your pussy stretches to accomodate his beasthood.\n\n");
		output("He's moaning and you feel his grasp on you tighten as he tries his hardest to help with getting it in, as it juts inch by inch into place, stretching painfully but by the stars, is it worth it. It feels so thick and hard and you know full well just how much he can cum!\n\n");
		output("You feel the bump of a large, blood-filled vein as another couple of inches plough their way in and finally, you sigh in relief as the cock entering you narrows and you feel his knot bump against your crotch.\n\n");
		
		if (pc.isBimbo()) output("<i>“Oo-oh fuck that was big”</i> you squeal, regaining your breath. You turn your attention to his bulbous knot, resting between your legs. <i>“Ooh, let's leave that out, I can be bouncier that way!”</i>\n\n");
		else if (pc.isCumSlut()) output("<i>“Mm-mmm, now I'm going to make you cum”</i> you pant.\n\n");
		else output("<i>“E-easy”</i> you say, trying to give the impression you're very much in charge despite how much you had to stretch for that.\n\n");
	}
	else 
	{
		output("You can only feel its warmth as it passed your entrance. Whilst his pointed tip looks like it'd feel great bouncing against your depths, it's doing nothing for your capable entrance right now. You only begin to feel it as it begins to widen and curve, when you can feel the underside of it brush tenderly against the bottom of your insides. You know that it keeps widening and you're eager to get to the part, lowering yourself as quickly as you can.\n\n");
		output("You bounce yourself downwards and you gasp as throbbing cockmeat slams against your walls as his curved cock dramatically increases in width. It feels so thick and hard and you know full well just how much he can cum!\n\n");
		
		if (pc.isBimbo()) output("<i>“Mmm, not bad”</i> you giggle, wiggling your hips so that his cock twists around inside you. You turn your attention to his bulbous knot, resting between your legs. <i>“Ooh, let's leave that out, I can be bouncier that way!”</i>\n\n");
		else if (pc.isCumSlut()) output("<i>“Mmm, now I'm going to make you cum”</i> you moan.  You turn your attention to his bulbous knot, resting between your legs. <i>“How about I leave that out, so I can ride you more? Bet that'd feel good.”</i>\n\n");
		else output("<i>“Not bad”</i> you moan. <i>“But as you can see, I can handle a beast like you.”</i>");
	}
	output("Grasping his chest for balance, you bounce your [pc.hips] up so that his quivering member massages your plush insides, until you can feel it tapering off and you slam your hips back down until your [pc.ass] bounces off his balls, causing a gush of pre to spurt into you.\n\n");
	output("Each descent pushes his cock deep inside of your pre-splattered insides, until it's pressing against the inside of your stomach. It feels so good. You keep bouncing on it eagerly, each squelching thrust causing you to moan as his cock stirs up your insides and bounces off your depths.\n\n");
	output("You start panting. Stars, his cock feels so good. And he must feel similarly, as he pants and grunts in time with your assault. You can feel his cock rumbling and quivering inside you, as each movement travels through your insides.\n\n");

	output("<i>“Oh fuck, oh fuck, fuckmefuckmefuckme”</i> you moan loudly as you bounce away at your reward");
	if (pc.biggestTitSize() >= 4) output(", your tits jiggling in time.\n\n");
	else if (pc.hasCock()) output("your [pc.cocks] flopping around in time.\n\n")
	else output(".\n\n");
	
	output("<i>“Mm-ughh”</i> is all you hear in response. There's no more witty retorts from the Raskvel, only sounds of lust as he's lost to you. <i>“I-I-cu-um”</i> he groans.\n\n");
	output("You can tell. His burning cock is quivering inside you, throbbing and pulsing wildy against your walls as you bounce off it and with your hands you can feel that his heart is about to explode.\n\n");
	output("<i>“Let's have it then”</i> you pant as you raise yourself up last one time and shove your pre-soaked pussy, deep down over his shaft and you feel a tidal wave of cum shoot out into you!\n\n");
	
	output("You can feel his throbbing reverberating through your walls as shot after shot of steamy cum blasts into you");
	if (pc.isSquirter()) output(" and with how close to the edge you were, all that throbbing sets you off, as you begin blasting back in reaction, spraying  [pc.girlcum] all over his climaxing cock.\n\n");
	else output(".\n\n");
	
	output("You can feel cum filling your very depths and as you look down you can see ");
	if (pc.bellyRating() <= 5) output("your normally petite belly bulging ");
	else output("your bulgy belly bulging even further ");
	output("as your depths are filled with hot steamy cum.\n\n");
	
	output("With your lips pressed right against his knot, there's no way out for his cum as the raskvels gargantuan balls keep pouring their contents into you, flooding your body with cum. You moan loudly in time with him as his hot sperm floods your insides and you feel drops and bubbles of the stuff forming around your entrance as his knot begins to deflate, before suddenly cum starts pouring out from inside of you, coating the Raskvels crotch and stomach in large splotches of white.\n\n");
	output("Several minutes later, you find the energy to get off the Raskvel and you carefully step off into the puddle that surrounds you two. You find your gear and leave him lying there, in a pool of his own cum.\n\n");
	
	pc.loadInCunt(classInst, X);
	pc.loadInCunt(classInst, X);
	pc.loadInCunt(classInst, X);
	pc.loadInCunt(classInst, X);
	pc.orgasm();
	pc.orgasm();
	processTime(10);
	CombatManager.genericVictory();
}