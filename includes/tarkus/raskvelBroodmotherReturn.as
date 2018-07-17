import classes.ItemSlotClass;
// Functions for non-event RaskvelBroodmother, i.e returning to her if you ended on good terms
//
// Libido levels:
// 0: Depressed
// 1: Frustrated, wants to pump out babies
// 2: Frustrated, wants to pump out even more babies	
// Loud and sensitive below here
// 3: A tease, wants babies and cock
// 4: A tease, slightly beggy, has babies, wants her puss pleasured
// 5: A tease, very beggy/broken, constantly pumping out babies, is dripping and wants more
//
// Only does vaginal stuff if 0-2 and only up for lesbian if 3+ (Some toys mb ok), would likely have a sensitive cock at that point though if she had one.
//
// Increasing libido
// Toying/Touching: +3
// Sex wo/cock: +4
// LibidoItems: +5
// Motherhusks: +8
// Sex w/Cock: + 8
// Sex w/Impregnation: +10
	

public function showPregRaskReturn():void
{
	var bustStr:String = "PREGRASK_";
	var nameStr:String = "";
	
	switch (getBroodmotherLibidoLevel())
	{
		case 0:
			bustStr += "LVL0";
			nameStr = "FORMER\nBROODMOTHER";
			break;
		case 1:
			bustStr += "LVL1";
			nameStr = "FORMER\nBROODMOTHER";
			break;
		case 2:
			bustStr += "LVL2";
			nameStr = "RASKVEL\nBROODMOTHER";
			break;
		case 3:
			bustStr += "LVL3";
			nameStr = "RASKVEL\nBROODMOTHER";
			break;
		case 4:
			bustStr += "LVL4";
			nameStr = "RASKVEL\nBROODMOTHER";
			break;
		case 5:
			bustStr += "LVL5";
			nameStr = "RASKVEL\nBROODMOTHER";
			break;
	}
	
	var t:int = getBroodmotherThickness();
	if (t >= 60)
	{
		if (t < 70)
		{
			bustStr += "_T60";
		}
		else if (t < 80)
		{
			bustStr += "_T70";
		}
		else if (t < 90)
		{
			bustStr += "_T80";
		}
		else if (t < 100)
		{
			bustStr += "_T90";
		}
		else
		{
			bustStr += "_T100";
		}
	}
	
	if (isBroodmotherTreated())
	{
		bustStr += "_TREATED";
	}
	if (isBroodmotherFuta())
	{
		bustStr += "_FUTA";
	}
	
	showBust(bustStr);
	showName("FORMER\nBROODMOTHER");
}

public function approachBroodmother():void
{
	showPregRaskReturn();
	author("Other");
	
	clearMenu();
	clearOutput();
	
	var lvl:int = getBroodmotherLibidoLevel();
		
	if (lvl >= 3)
	{
		output("The swollen Raskvel teases herself as you approach");
		if (lvl >= 4)
		{
			if (isBroodmotherTreated())
			{
				output(", milk pouring from her udders as she squeezes them");
			}
			else
			{
				output(", milk dripping from her breasts as she rubs them");
			}
		}
		if (lvl == 5)
		{
			if (isBroodmotherFuta())
			{
				output("and her cock extending further from its slit");
			}
			else
			{
				output("and her juices");
				if (getBroodmotherThickness() > 55)
				{
					if (isBroodmotherTreated())
					{
						output(" pouring down her stomach");
					}
					else
					{
						output(" dripping down her stomach");
					}
				}
				else
				{
					if (isBroodmotherTreated())
					{
						output(" raining into the drains below");
					}
					else
					{
						output(" dripping into the drains below");
					}
				}
			}
		}
		
		if (pc.isBimbo()) output(". Unsuprising really, like, you're super fucking hot.\n");
		else output(".\n");
		
		output("<i>“Oh fuck you're back”</i> she moans. <i>“");	
		if (pc.hasCock())
		{
			if (lvl >= 4)
			{
				output("Empty your [pc.balls] inside me!”</i>");
			}
			else
			{
				output("Give me babies!”</i>");
			}
		}
		else if (lvl >= 4)
		{
			output("Please, fuck me! I can't take this anymore!”</i>");
		}
		else
		{
			if (isBroodmotherTreated())
			{
				output("Some of my udders are feeling sore, I'd appreciate it if you could give them some attention.”</i>");
			}
			else
			{
				output("Don't suppose ya know anyone with a cock do ya?”</i>");
			}
		}
		
		if (pc.libido() >= 70 || pc.lust() >= 50)
		{
			pc.lust(40);
			output("\nYou're having a hard time focusing on anything but the Raskvels glowing form, her body ");
			if (pc.hasCock())
			{
				if (pc.armor.shortName != "")
				{
					output("threatening to push your [pc.cocks] through your [pc.crotchCovers]");
				}
				else
				{
					output(" drawing your throbbing [pc.cocks] towards her");
				}
			}
			if (pc.hasCock() && pc.hasVagina())
			{
				output(" and ");
			}
			if (pc.hasVagina())
			{
				output("drawing your hand to your [pc.vaginas]");
			}
			if (!pc.hasCock() && !pc.hasVagina())
			{
				output("causing you to start sweating at your thoughts");
			}
			if (pc.isBimbo())
			{
				if (isBroodmotherFuta())
				{
					output(". You can't take your eyes away from her fat purple cock");
				}
				else
				{
					output(". For not having a dick, she's deffo doing a good job of getting you horny");
				}
			}
			output(".");
			
			addDisabledButton(1, "Talk", "Talk", "You're way too focused on her body for this.");
			addDisabledButton(14,"Leave","Leave","You're entranced by the broodmother. You can't go just yet.");
		}
		else
		{
			addButton(1, "Talk", talkBroodmother, undefined, "Talk", "Have a conversation with her..");
			addButton(14, "Leave", mainGameMenu);
		}
	}
	else
	{
		if (lvl == 0)
		{
			if (pc.isBimbo())
			{
				output("You approach the poor girl, who's face is super glum from not enough fucking and not enough babies.\n");
			}
			else{
				output("You approach her and as you do she whimpers <i>“I want my babies”</i>.\n");
			}
			addButton(1, "Talk", talkBroodmother, undefined, "Talk", "Have a conversation with her..");
			addButton(14, "Leave", mainGameMenu);
		}
		else if (lvl == 1)
		{
			output("You approach her and as you do she murmurs <i>“I want more babies!”</i> she grunts.\n");
			addButton(1, "Talk", talkBroodmother, undefined, "Talk", "Have a conversation with her..");
			addButton(14, "Leave", mainGameMenu);
		}
		else //2
		{
			if (pc.isBimbo()){
				output("You approach the big round fun-girl. ");
			}
			else{
				output("You approach her. ");
			}
			
			output("<i>“I want more babies!”</i> she grunts. ");
			if (isBroodmotherTreated())
			{
				output("<i>“Some milking would also be good, I'm going to burst soon”</i>\n");
			}
			else if (isBroodmotherFuta())
			{
				output("<i>“My cock could also do with some attention,my balls are about to burst!”</i>\n");
			}
			
			if (pc.libido() >= 70 || pc.lust() >= 50)
			{
				addDisabledButton(1, "Talk", "Talk", "You're way too focused on her body for this.");
				addDisabledButton(14,"Leave","Leave","You're entranced by the broodmother. You can't go just yet.");
			}
			else
			{
				addButton(1, "Talk", talkBroodmother, undefined, "Talk", "Have a conversation with her..");
				addButton(14, "Leave", mainGameMenu);
			}
		}
	}
	addButton(0, "Appearance", broodMotherAppearance);
	addButton(2, "Sex", broodMotherSexOpts, undefined, "Sex", "Fuck her");
	addButton(13, "Give item", giveBroodMotherItem, undefined, "Give item", "Give her something other than you.");	
}

public function broodMotherAppearance():void
{
	clearOutput();
	clearMenu();
	
	var lvl:int = getBroodmotherLibidoLevel();
	
	if (lvl == 0)
	{
		output("The purple raskval ex-broodmother is sat mopily next to her unused supports, her belly no longer big enough to require them.\n")
	}
	else
	{
		output("The purple raskval broodmother lies atop her supports, required to hold her ");
		
		switch(lvl)
		{
			case 1: 
				"bloated ";
				break;
			case 2: 
				"swollen ";
				break;
			case 3: 
				"boulder-sized ";
				break;
			case 4: 
				"giant, sweat coated ";
				break;
			case 5: 
				"room-sized, girlcum coated ";
				break;
		}
		
		if (isBroodmotherTreated())
		{
			output("belly and pink lactating udders.");
		}
		else
		{
			output("belly.");
		}
		output("\n");
	}
	
	output("She has a ");
	switch(lvl)
	{
		case 0: 
			output("glum");
			break;
		case 1: 
			output("unimpressed");
			break;
		case 2: 
			output("excited");
			break;
		case 3: 
			output("teasing");
			break;
		case 4: 
			output("desiring");
			break;
		case 5: 
			output("lust-filled");
			break;
	}
	output(" expression on her " + (isBroodmotherTreated() ? "horn-topped, glasses-wearing face." : "glasses-wearing face."));
	output("\nHer head is topped by blue feathery hair. Below her head are ");
	if (isBroodmotherTreated())
	{
		output("six long, lactating, fuckable, udder-like nipples - two on her motherly breasts and four on her child-bearing stomach.");
	}
	else if (lvl != 0)
	{
		output("two motherly breasts that lie atop her stomach, each with milk-bearing nipples and framed by large dark areolae.");
	}
	else
	{
		output("two small breasts, that sit on her petite frame.");
	}
	
	output("\nBelow her ");
	if (getBroodmotherThickness() < 60)
	{
		output("");
	}
	else if (getBroodmotherThickness() >= 60 && getBroodmotherThickness() < 70)
	{
		output("fat, ");
	}
	else if (getBroodmotherThickness() >= 70 && getBroodmotherThickness() < 80)
	{
		output("plump, ");
	}
	else if (getBroodmotherThickness() >= 80 && getBroodmotherThickness() < 90)
	{
		output("jiggling, ");
	}
	else if (getBroodmotherThickness() >= 90)
	{
		output("extra thick, jiggly, ");
	}
	switch(lvl)
	{
		case 0: 
			output("curvaceous");
			break;
		case 1: 
			output("basketball sized");
			break;
		case 2: 
			output("large");
			break;
		case 3: 
			output("exercise ball sized");
			break;
		case 4: 
			output("gigantic");
			break;
		case 5: 
			output("boulder sized");
			break;
	}
	output(" buttocks, sits ")
	
	if (isBroodmotherFuta())
	{
		output("one 14 inch juicy purple rasvkel cock, extending from it's slit and an oversized cum-pouch. Alongside that there's ");
	}
	
	output("her ")
	
	if (getBroodmotherThickness() >= 60)
	{
		output("plump, ");
	}
	if (isBroodmotherTreated())
	{
		output("soaking wet, ");
	}
	
	
	switch(lvl)
	{
		case 0: 
			output("pussy");
			break;
		case 1: 
			output("ready to be fucked, pussy");
			break;
		case 2: 
			output("birth-ready pussy");
			break;
		case 3: 
			output("cock-hungry babymaker");
			break;
		case 4: 
			output("loose cum-hole");
			break;
		case 5: 
			output("gaping cumdump");
			break;
	}
	
	if (isBroodmotherTreated())
	{
		output(",framed by two cunt-stretching clits, a wet hoop peircing dangling from one.");
	}
	else
	{
		output(",framed by two bulbous clits, a hoop peircing dangling from one.");
	}
	
	addButton(0, "Back", approachBroodmother);
}

// ITEM GIVING-------------------------------------------------------------------------------------------------------

public function giveBroodMotherItem():void
{	
	clearMenu();
	clearOutput();
	
	output("You rummage in your inventory, looking for something to ");
	
	if (getBroodmotherLibidoLevel() > 1)
	{
		output("lift her spirits.");
	}
	else
	{
		output("give to her.");
	}
	
	var currentButtonIndex:int = 0;
	
	if (pc.hasItemByClass(Motherhusk))
	{
		addButton(currentButtonIndex, "Motherhusk", giveMotherhusk);
		currentButtonIndex++;
	}
	else
	{
		addDisabledButton(currentButtonIndex, "Motherhusk", "You don't have any");
		currentButtonIndex++;
	}
	
	// You'd have to be a bimbo to risk breaking the law
	if (pc.hasItemByClass(Treatment) && flags["PREG_RASK_RETURNED_BODYTYPE"].indexOf("TREATED") == -1 && pc.isBimbo() && pc.isTreated())
	{
		addButton(currentButtonIndex, "Treatment", giveTreatment);
		currentButtonIndex++;
	}
	else
	{
		if (!isBroodmotherTreated())
		{
			if (!pc.hasItemByClass(Treatment))
			{
				addDisabledButton(currentButtonIndex, "Treatment", "You don't have any");
			}
			else if (!pc.isBimbo())
			{
				addDisabledButton(currentButtonIndex, "Treatment", "You'd have to be stupid to go around breaking the law like that.");
			}
			else if (!pc.isTreated())
			{
				addDisabledButton(currentButtonIndex, "Treatment", "You're not sure about the treatment.");
			}
			currentButtonIndex++;
		}
	}
	
	if (hasValidFood())
	{
		addButton(currentButtonIndex, "Food", giveBroodmotherFoodMenu);
		currentButtonIndex++;
	}
	else
	{
		addDisabledButton(currentButtonIndex, "Food", "You don't have any");
		currentButtonIndex++;
	}
	
	if (pc.hasItemByClass(Throbb) && !isBroodmotherFuta())
	{
		addButton(currentButtonIndex, "Throbb", giveThrobb);
		currentButtonIndex++;
	}
	else
	{
		if (!isBroodmotherFuta())
		{
			addDisabledButton(currentButtonIndex, "Throbb", "You don't have any");
			currentButtonIndex++;
		}
	}
	
	addButton(14,"Leave",approachBroodmother);
}

public function giveThrobb():void
{
	clearMenu();
	clearOutput();
	
	if (getBroodmotherLibidoLevel() >= 3)
	{
		output("<i>“What's that?”</i>, the broodmother asks, as you take the vial of throbb from your backpack. Seeing an opportunity to trick the cock-mad broodmother ")
		if (pc.hasVaginas() || !pc.analVirgin)
		{
			output(" for your own pleasure")
		}
		else
		{
			output(" for your own amusement")
		}
		output(" you tell the oversized ravskal that it'll help her get cocks. Delighted with the sound of that she ushers you to give her the throbb.\nYou pass the vial to her and she eagerly downs it. Pleased with your handiwork you walk to the back of the broodmother to watch the transformation unfold.\n\n");
		output("Roughly ten seconds later you hear her cry <i>“What's happening?”</i>. As she does this you notice the space between her fat ass and globe-like stomach increasing and soon a mound of flesh has formed, poking it's way out from under her swollen pussy lips. ")
		output("The growth doesn't stop there. The mound continues to grow, this time in two different directions. A smaller mound grows closer to her stomach and eventually falls in on itself, leaving a hole. On top, the mound grows outwards <b>forming a round testicle pouch.</b>\n")
		output("<i>“What is this weight? I demand you tell me what is happening [pc.name]”</i> shrieks the broodmother before bursting into a moan, as a purple clit pokes itself out of her new slit. No, not a clit. It continues to grow becomer thicker and longer and thicker and longer, until the broodmother owns a <b>fat 14 inch long blue raskval cock</b>.");
		output("As it finishes growing it shoots a spurt of cum ");
		if (rand(2) == 1)
		{
			output("across your face");
			if (pc.lust() >= 50 || pc.libido() > 65)
			{
				output(". Some splashes across your [pc.lips] and you are quick to lick it off");
				pc.lust(10);
			}
			else
			{
				pc.lust(5);
			}
			pc.applyCumSoaked();
		}
		else
		{
			output("over your shoulder");
		}
		output(". The broodmother lets out a long ");
		if (isBroodmotherTreated())
		{
			output("moo ");
		}
		else
		{
			output("moan ");
		}
		output("as this happens before asking what's happened. Not wanting to leave her in the dark anymore, you pull up your codex and use it to take a snapshot of her cock, a small amount of cum still dripping out onto her swollen paunch. You walk around to the front of her and show her the picture and as you do she looks you in the eyes and teasingly says <i>“Oh deary me, I wonder who's going to look after my cock then, seeing as I can't reach.”</i>");
		flags["PREG_RASK_RETURNED_BODYTYPE"].push("FUTA");
		showPregRaskReturn();
		increaseBroodmotherLibido(10);
		addButton(0,"Continue",giveBroodMotherItem);
	}
	else
	{
		output("<i>“Hah, no thanks. I'm for breeding with, why would I need a cock?”</i> the broodmother cackles, as you explain what Throbb is to her. You've got to admit you can see her point.");
		addButton(0,"Back",giveBroodMotherItem);
	}
}

public function giveMotherhusk():void
{
	clearMenu();
	clearOutput();
	
	output("How many?");
	
	var currentButtonIndex:int = 0;
	var has:int = pc.numberOfItemByClass(Motherhusk);
	
	for (var i:Number=0; i<=has && i <= 13;i++){ 		
		if (i != 0)
		{
			addButton(currentButtonIndex, "x" + i, giveMotherhuskActual, i);
			currentButtonIndex++;
		}
	}	
	
	addButton(14,"Back",giveBroodMotherItem);
}

public function giveMotherhuskActual(numberGiven:int):void
{
	clearMenu();
	clearOutput();
	if (getBroodmotherLibidoLevel() == 0)
	{
		output("<i>“" + (numberGiven > 1 ? "The motherhusks! You're really returning them”":"A motherhusk!”") + "</i> she squeals in delight");
	}
	else
	{
		output("<i>“Ooh, " + (numberGiven > 1 ? "these":"this") + "'ll help make more babies, yaass these'll do nicely”</i> she moans to herself");
	}
	output(" before " + (numberGiven > 1 ? "gathering them and swallowing them whole.":"taking the motherhusk and swallowing it whole."));
	pc.destroyItemByClass(Motherhusk, numberGiven);
	increaseBroodmotherLibido(8 * numberGiven);
	addButton(0, "Continue", giveBroodMotherItem);
	
	showPregRaskReturn();
}

public function giveTreatment():void
{
	clearMenu();
	clearOutput();
	output("As you take a treatment medipen of your backpack, the raskvel asks you what it is.\n<i>“Oh this thing”</i>, you exclaim. <i>“This thing is the best thing ever! It'll make you a really great mommy and it makes sex so good.”</i>\n\n")
	var lvl: int = getBroodmotherLibidoLevel();
	if (lvl >= 4)
	{
		output("<i>“A better mother? Don't be ridiculous [pc.name]”</i> she cackles. <b>“I can't be any better, now put that away before I take offense.”</b>");
		addButton(0,"Continue",giveBroodMotherItem);
	}
	else
	{
		switch(lvl)
		{
			case 0:
				output("She raises her head to look you in the eyes and a grin spreads across her face. <i>“If it'll make me a good mother again then what are we waiting for!”</i>");
				break;
			case 1:
				output("Her scowl transforms into a grin. <i>“Well then what are we waiting for!”</i>");
				break;
			case 2:
				output("Her scowl transforms into a grin. <i>“I could always use more babies, let's do this!”</i>");
				break;
			case 3:
				output("<i>“" + (pc.hasCock() ? "Well there's other ways you can help me be a mommy, but this sounds good too" : "I suppose you can't help me any other way") +"”</i> she cackles.");
				break;
		}
		if (lvl == 0)
		{
			output("\nYou reach out to the raskvels arm and push down on the medipen, emptying the treatment into her.")
		}
		else
		{
			output("\nYou raise your arm, medipen in hand, to the pregnant broodmothers behind and push down on the medipen, emptying the treatment into her.")
		}
		output("\n<i>“Well what now?”</i> she moans excitedly. <i>“Now, see you in a week!”</i> you say, turning on your heels towards the door, catching a last glimpse of your gals excited face.");
		processTime(60 * 24 * 7);
		
		addButton(0,"Continue",giveTreatment_2);
	}
}

public function giveTreatment_2():void
{
	clearMenu();
	clearOutput();
	clearBust();
	showName("BROOD\nDEN")
	
	output("<b>One week later..</b>\n\n");
	
	output("You one again squeeze between the orange walls to the broodmothers scrap den. You push down on the green intercom button and open your mouth to announce yourself but before you can even finish your first word, noise unexpectedly errupts from the intercom.\n");
	output("<i>“MOOOO”</i>. ");
	
	if (flags["RASKDOOR_RETURNED_DOORLESS"])
	{
		output("Happy to hear the treatment has worked, you skip inside, eager to witness her changes.\n");
	}
	else if (flags["RASKDOOR_BROKE"])
	{
		output("Happy to hear the treatment has worked, you push the broken door aside and skip into the den.\n");
	}
	else
	{
		output("It sounds like the treatments worked. <i>“It's [pc.name]”</i>, you announce. <i>“Let me in, hun, I want to see what wonderful stuff has happened to you!”</i>. <i>“[pc.name], come in quick, witness my new form”</i> she says this the door slides open and you eagerly skip inside.\n");
	}
	
	addButton(0,"Continue",giveTreatment_3);
}

public function giveTreatment_3():void
{
	clearMenu();
	clearOutput();
	
	pc.lust(10);
	increaseBroodmotherLibido(40);
	addBroodmotherThickness(-5);
	pc.destroyItemByClass(Treatment, 1);
	flags["PREG_RASK_RETURNED_BODYTYPE"].push("TREATED");
	
	showPregRaskReturn();
	
	output("<i>“Thanks [pc.name]”</i> you hear as you enter the den. <i>“This is magnificent”</i>.");
	output("As your eyes adapt to the sunlight you lay eyes on the new and improved broodmother. She lies atop a now bulgier, pinker belly adorned with a plethora of long, swollen teats" + (getBroodmotherLibidoLevel() > 3 ? ", which are currently dripping milk and leaving long milky streaks on her belly." : ", each tipped with beads of milk.") +" They become inverted towards their center. <b>She has grown udders, fuckable nipples and has increased milk production.</b>")
	output("You walk around her, eager to see any more hot transformations that have presented themselves. As you approach her backside, the scent of her girl-cum hits you. The treatment has made her <b>wetter</b> and that's not all. " + (getBroodmotherLibidoLevel() > 3 ? "Amidst a coat of now <b>juice-covered</b> <b>pubic hair</b>, her <b>pussy has become even plumper than before</b> and her <b>clit has become swollen</b> to the point that it's stretching her out slightly on it's own. " : "Amidst a mat of <b>new pubic hair</b>, her <b>pussy has become even plumper</b> than before and <b>her clit has swollen up to the size of a small egg.</b> "));
	output("\n\nYou walk back to her front and look at her now <b>horn-topped face</b>. <i>“Well what d'ya think?”</i> she moans, a large smile upon her. <i>“You're so fucking hot now”</i> you say , stroking your " + (pc.hasCock() ? "[pc.cocks]" : "[pc.vaginas]") + " through your [pc.underGarments].");
	
	
	addButton(0,"Continue",giveBroodMotherItem);
}

public function hasValidFood():Boolean
{
	return pc.hasItemType(GLOBAL.FOOD);
}

public function giveBroodmotherFoodMenu():void
{
	clearMenu();
	clearOutput();
	
	output("Choose something to feed her.");
	
	var giveItem:String = "";
	var btnSlot:int = 0;
	var foodList:Array = []; // To avoid dupes of the same food item.
	
	for(var i:int = 0; i < pc.inventory.length; i ++)
	{
		if (btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", giveBroodMotherItem);
			btnSlot++;
		}
		if (pc.inventory[i].type == GLOBAL.FOOD && pc.inventory[i].quantity >= 1 && foodList.indexOf(pc.inventory[i].shortName) == -1)
		{
			if (pc.inventory[i] is BBQToGo) giveItem = "Give bbq";
			else if (pc.inventory[i] is MyrNectar) giveItem = "Give nectar";
			else if (pc.inventory[i] is Kalocrunch) giveItem = "Give kalocrunch";
			else if ((pc.inventory[i] is LargeEgg) || (pc.inventory[i].longName.indexOf("large") != -1 && pc.inventory[i].longName.indexOf("egg"))) giveItem = "Give large egg";
			else if (pc.inventory[i] is MhengaMango) giveItem = "Give mango";
			else if (pc.inventory[i] is PexigaSaliva) giveItem = "Give saliva";
			else if ((pc.inventory[i] is SmallEgg) || (pc.inventory[i].longName.indexOf("small") != -1 && pc.inventory[i].longName.indexOf("egg"))) giveItem = "Give small egg";
			else if (pc.inventory[i] is ZilHoney) giveItem = "Give zil honey";
			else giveItem = "Give other food";
			
			addButton(btnSlot, (pc.inventory[i].shortName + " x" + pc.inventory[i].quantity), broodmotherEatFood, [giveItem, pc.inventory[i]], StringUtil.toDisplayCase(pc.inventory[i].longName), pc.inventory[i].tooltip);
			foodList.push(pc.inventory[i].shortName);
			btnSlot++;
		}
		if (foodList.length > 14 && (i + 1) == pc.inventory.length)
		{
			while((btnSlot + 1) % 15 != 0) { btnSlot++; }
			addButton(btnSlot, "Back", giveBroodMotherItem);
		}
	}
	
	addButton(14, "Back", giveBroodMotherItem);
}

public function broodmotherEatFood(args:Array):void
{
	clearMenu();
	clearOutput();
		
	if (getBroodmotherThickness() >= (50 + (getBroodmotherLibidoLevel() * 10)))
	{
		output("<i>“Naah, my belly's full”</i> the broodmother says, rejecting the food you offer her.");		
		addButton(0,"Continue",giveBroodmotherFoodMenu);
	}
	else
	{
		var food:String = args[0];
		var item:ItemSlotClass = args[1];
		
		output((rand(1) == 1 ? "She" : "The " + ((getBroodmotherLibidoLevel() > 1 ? "" : "former ") + "broodmother ")));
		
		switch(food)
		{
			case "Give bbq":
				output("tears open the to-go box, and before you know it, there’s nothing left but bones, the food swallowed ");
				break;
			case "Give nectart":
				output("grabs the thermos of myr nectar and tilts it back, dripping the nectar onto her long tounge. You watch as it slides down ");
				if (pc.libido() >= 70 || pc.lust() >= 50)
				{
					output("suggestively, ");
					pc.libido(5);
				}
				break;
			case "Give kalocrunch":
				output("eats through the kalocrunch bar, crumbs dropping onto ");
				if (getBroodmotherLibidoLevel() <= 1)
				{
					output("the floor ");
				}
				else
				{
					output("her swollen teats and stomach ");
				}
				output("and the bar ");
				break;
			case "Give large egg":
				output("winds it's long tounge around the egg and quickly retracts it, swallowing it ");
				break;
			case "Give mango":
				output("bites down onto the mango");
				if (pc.libido() >= 70 || pc.lust() >= 50)
				{
					output(", spraying juice across her ");
					if (getBroodmotherLibidoLevel() > 1 || getBroodmotherThickness() > 60)
					{
						output("swollen ");
					}
					output("breasts");
					pc.libido(5);
				}
				output("She swallows the mango ");
				break;
			case "Give saliva":
				output("pours the sweet pexiga saliva onto her long tounge ");
				if (pc.libido() >= 70 || pc.lust() >= 50)
				{
					output("suggestively, ");
					pc.libido(5);
				}
				output("and swallows it, the saliva sliding down ");
				break;
			case "Give small egg":
				output("pulls the egg into her mouth with her tounge and drops it ");
				break;
			case "Give zil honey":
				output("grabs the visal of honey and tilts it back, dripping it onto her long tounge. You watch as it slides down ");
				if (pc.libido() >= 70 || pc.lust() >= 50)
				{
					output("suggestively, ");
					pc.libido(5);
				}
				break;
			default:
				output("swallows the " + item.longName + " you've presented her with ");
				break;
		}
		output("into her ");
		if (getBroodmotherLibidoLevel() > 1)
		{
			switch(getBroodmotherLibidoLevel())
			{
				case 3:
					output("swollen, ");
					break;
				case 4:
					output("gigantic, ");
					break;
				case 5:
					output("collosal, ");
					break;	
			}
			if (getBroodmotherThickness() > 60)
			{
				output("fat, ");
			}
			output("pregnant ");
		}
		output("stomach.");
		pc.destroyItemByReference(item);
		
		addBroodmotherThickness(4);
		
		addButton(0,"Continue",giveBroodmotherFoodMenu);
	}
}

//TALK---------------------------------------------------------------------------

public function talkBroodmother():void
{
	showPregRaskReturn();
	author("Other");
	
	clearMenu();
	clearOutput();
	
	output("Talk options");
	
	addButton(0, "What she does", talkBroodmother_AskWhatDo);
	addButton(1, "Her past", talkBroodmother_AskPast);
	addButton(14, "Return", approachBroodmother);
}

public function talkBroodmother_AskWhatDo():void
{	
	clearMenu();
	clearOutput();
	
	var lvl:int = getBroodmotherLibidoLevel();
	
	switch(lvl){
		case 0:
			output("<i>“Nothing anymore”</i> she murmurs. <i>“I rent some of this space out to lodgers but what I really enjoyed was getting pumped full of babies. It was my life but once you took the shrooms from me, that part of my life was ruined.”</i>\n");
			if (pc.isBimbo())
			{
				output("<i>“Well soz, it was only for some science thing. I can bring them back.”</i>\n");
			}
			else 
			{
				output("<i>“Well sorry but my crewmate needed them for a science experiment. I can probably bring them back now.”</i>\n");
			}
			output("As you say this her eyes glisten. <i>“If you could, that'd be great!”</i> she exlaims.");
			break;
		case 1:
			output("<i>“Well, I rent this place out to lodgers and occasionally I have some of the more attractive ones cum in me”</i> she says longingly. <i>“I wish I could take much more, like I used to”</i>.\n");
			break;
		case 2:
			output("<i>“Well, I rent this place out to lodgers who otherwise would be lost to the wasteland and some of the more attractive ones get invited back regularly to pump their loads into me”</i> she says. <i>“I can't have enough babies”</i>.\n");
			if (isBroodmotherTreated())
			{
				output("<i>“Some of them also need to milk me to feed my young.”</i>\n");
			}
			if (pc.hasCock() && (pc.libido() >= 55 || pc.lust() >= 60))
			{
				output("<i>“Oh really”</i> you reply with a wink.\n");
			}
			break;
		case 3:
			output("<i>“Well, all manner of lodgers turn up here and all I require as payment is that they fuck me and pump me full of their offspring</i> she says. <i>“I can't get enough”</i>.\n");
			if (pc.hasCock() && (pc.libido() >= 55 || pc.lust() >= 60))
			{
				output("<i>“Oh really”</i> you reply with a wink.\n");
			}
			if (isBroodmotherTreated())
			{
				output("<i>“Some of them also need to milk my sore teats.”</i>\n");
			}
			break;
		case 4:
			output("<i>“Well, all manner of lodgers turn up here and all I require from them is to fuck me and pump me full of their cum</i> she says. <i>Of course, I wouldn't attest to women paying that way either.”</i>\n");
			if (pc.libido() >= 55 || pc.lust() >= 60)
			{
				output("<i>“Oh really”</i> you reply with a wink.\n");
			}
			if (isBroodmotherTreated())
			{
				output("<i>“My servants also turn up regularly to empty my udders, to collect milk for the offspring.”</i>\n");
			}
			break;
		case 5:
			output("<i>“Well, my door's gone missing”</i> she lies. <i>“So creatures come in from the wasteland and pump poor, defenceless, ol' me full of their cum and I can't do anything to stop it”</i>.\n");
			output("As images of what she's saying fill her head, her eyes roll back and her juices drip into the drains below.");
			if (isBroodmotherTreated())
			{
				output("<i>“They could even grab my udders and spill my bounty everywhere”</i> she fantasizes outloud.\n");
			}
			break;
	}
	
	addButton(0,"Return",talkBroodmother);
}

public function talkBroodmother_AskPast():void
{	
	clearMenu();
	clearOutput();
	
	var lvl:int = getBroodmotherLibidoLevel();
	
	if (lvl < 3)
	{
		output("<i>“Well before this, I was just another Raskvel, trying to make my way in this wasteland. One day as I was looking for food I found a shipwreck here in the sand. It was busted up and the electrics were a bit faulty but it was nothing I couldn't patch up.”</i>\n");
		output("<i>“I was gonna make this place my home and rent some of the space out to lodgers. Anyway, after I patched up holes in the exterior and restored the defences, I explored the interior. There were some small creatures here so I they had to go bye bye.”</i>\n");
		output("<i>“When I searched the bay, I found food - those lovely motherhusks. I snacked on them and over time they kicked in. At first I was soooo horny, so I flirted with some of the more attractive lodgers in order to relieve that. However as I continued eating them, I got even hornier and I just wanted everyone to empty their loads in me.”</i>");
	}
	else
	{
		switch (lvl)
		{
			case 3:
				output("<i>“Hmm, no idea”</i> she says, a look of confusion on her face. <i>“I think maybe there was a time before this but I don't remember it - all I remember is eating the motherhusks and getting fucked.”</i>\n");
				break;
			case 4:
				output("<i>“Hmmm, no idea”</i> she says, a look of bemusement on her face. <i>“All I remember is being stuck up here and being unable to stop anyone fucking me and pumping their cum into me.”</i>\n");
				break;
			case 5:
				output("<i>“Haha, nothing silly, I've always been up here, getting my pussy fucked and getting filled with cummies”</i> she says, a look of bemusement and lust on her face.\n");
				break;
		}
	}
	
	addButton(0,"Return",talkBroodmother);
}

//SEX----------------------------------------------------------------------------

public function broodMotherSexOpts():void
{
	author("Other");
	
	clearMenu();
	clearOutput();
	
	output("Sex options");
	
	if(pc.biggestCockVolume() > 700) addButton(1,"Hyper Fun",hyperRaskFun_Return);
	else addDisabledButton(1,"Hyper Fun","Hyper Fun","You need a huge penis for this.");

	if(pc.hasCock() && pc.cockThatFits(700) >= 0) addButton(0,"Pussy fuck",fuckDatRaskipoo_Return,undefined,"Fuck Her","Her womb may be full, but her pussy isn’t.");
	else if(pc.hasCock()) addDisabledButton(0,"Pussy fuck","Fuck Her","You’re too big to fit inside.");
	else addDisabledButton(0,"Pussy fuck","Fuck Her","You have no penis to fuck her with.");

	if (pc.hasVagina())
	{
		if (lvl >= 4)
		{
			addButton(2,"Face Ride",faceRideTheRaskPreg_Return);
		}
		else
		{
			addDisabledButton(2,"Face Ride","Face Ride","She only wants cock right now");
		}
	}
	else
	{
		if (lvl >= 4)
		{
			addDisabledButton(2,"Face Ride","Face Ride","You need a vagina to rub on her face for this.");
		}
		else
		{
			addDisabledButton(2,"Face Ride","Face Ride","You need a vagina to rub on her face for this and she must want to bother with anything but cock.");
		}
	}
	
	
	addButton(14,"Leave",approachBroodmother);
}

//[Hyper Fun]
//Crown fellating followed by hugjob, shaftlicking, and a stcky shower.
//Make sure to set x to biggest and add to parser calls. Kthnx, futureFen.
//Copy of hyperRaskFun with any quest related deets removed and any new deets added
public function hyperRaskFun_Return():void
{
	clearOutput();
	showPregRaskReturn();
	var x:int = pc.biggestCockIndex();

	//Crotchcovered:
	if(!pc.isCrotchExposed())
	{
		output("The second you begin to unwrap your concealed cock, the raskvel’s eyes go wide. She leans closer, nostrils flaring and sniffing, her nipples visibly perking. Her lips purse as she struggles for words. Then your [pc.cock " + x + "] flops out in all its immensity, ");
		if(!pc.isErect()) output("half-turgid and growing under her spellbound gaze");
		else output("massively turgid, the veins pumping beneath her spellbound gaze");
		output(". She whimpers, her hands subconsciously squeezing her tits, her tail wagging back and forth through the cummy mess on the floor.");
	}
	//Uncovered
	else
	{
		output("The second you bring your proudly-displayed member toward the pregnant raskvel, her eyes go wide. She leans closer, as much as her bloated frame will allow, nipples visibly perking. Her lips purse as she struggles to find the words. Proud of the effect you’re having on her, you switch your hips forward, bouncing ");
		if(!pc.isErect()) output("the half-turgid dick before her as it slowly inflates, locking her spellbound gaze to the inhumanly thick veins");
		else output("the massively engorged dick before her as the inhumanly thick veins throb and ache for penetration.");
		output(" She whimpers, her hands subconsciously squeezing her tits, her tail wagging back and forth through the cummy mess on the floor.");
	}
	//merge
	output("\n\n<i>“W-wow. It’s so big.”</i> the purple-scaled lizard-girl reaches out experimentally, as if she can’t quite believe that it’s real. When she makes contact, a shiver of pleasure runs through you, and it throbs against her armored skin");
	if(pc.cumQ() >= 40 && pc.cumQ() < 500) output(", leaking a fat drop of pre-cum onto her wrist");
	else if(pc.cumQ() >= 500) output(", drooling a stream of pre-cum all over her wrist");
	output(". Her expression sours. <i>“I wish I wasn’t pregnant.”</i> Tiny hands grab you just behind the [pc.cockHead " + x + "] and gently tug you closer.");
	output("\n\nYou let them.");

	output("\n\n<i>“If I wasn’t pregnant, you could knock me up with this monster. You’d give me the biggest, rounded eggs ever. Sire a whole clan of big-dicked sons to make the next generation of raskvel girls stumble around bow-legged...”</i> Her face is an inch away from your [pc.cockNoun " + x + "], but her eyes have drifted closed. The short, stacked alien is lost in her own fantasy, navigating her lips to greet your eager flesh by smell and feel alone");
	if(pc.isTreated() || pc.cocks[x].cType == GLOBAL.TYPE_EQUINE || pc.hasPheromones()) 
	{
		output(", and from how she whimpers after every breath, she likes it. When she pauses and sniffs deeply, her tiny frame shudders in response to the hyper-concentrated dose of pheromones");
		if(pc.isTreated()) output(". You silently praise whoever invented the Treatment");
	}
	output(".");

	output("\n\nShe presses her soft lips against the meatiest part of your [pc.cockHead " + x + "], already slick with spit and eager to touch every part of your sensitive maleness. Tingling bolts of pleasure shoot through your sensitive mast as the miniature succubus’s fingers work over the skin, teasing and testing it");
	if(pc.cocks[x].cType == GLOBAL.TYPE_EQUINE) output(", dancing across the pronounced medial ring");
	else if(pc.cocks[x].cType == GLOBAL.TYPE_CANINE) output(", admiring the smooth taper of the shaft");
	else if(pc.cocks[x].cType == GLOBAL.TYPE_FELINE || pc.hasCockFlag(GLOBAL.FLAG_NUBBY,x)) output(", lovingly circling around every little nodule");
	else if(pc.cocks[x].cType == GLOBAL.TYPE_SUULA) output(", slipping through the wiggling tendrils, one at a time");
	else if(pc.hasKnot(x)) output(", palming at the uninflated weight of your [pc.knot " + x + "]");
	else if(pc.hasStatusEffect("Genital Slit")) output(", tenderly exploring a genital slit that seems too small for the totem pole sliding out of it");
	else if(pc.hasSheath(x)) output(", tenderly exploring the musky folds of your sheath");
	output(".");
	if(pc.cumQ() >= 500) output(" Your body responds by oozing a steady flow of pre into her maw, feeding her biological proof that she’s a world-class cock-sucker. She savors it with gusto.");
	else if(pc.cumQ() >= 50) output(" Your body responds by dribbling pre into her maw, providing biological evidence that she’s a world-class cock-sucker.");

	output("\n\nThe raskvel’s hungry eyes pop open abruptly, and she breaks her dick-licking kiss to look up at you. Her hands, fortunately, do not stop their worship. <i>“Can I collect your cum?”</i> Her eyes are eager and earnest. <i>“I... there’s a bucket.”</i>");
	if(pc.cumQ() >= 50) output(" She licks stray pre from her lips, though the effect is more to smear it across the bottom one like lip gloss.");
	else output(" She licks her lips");
	output(" <i>“And I want to have your babies. After these.”</i> She lifts your dick with both hands, grunting with the effort, then feathers kisses along the underside of your shaft");
	if(pc.cocks[x].cType == GLOBAL.TYPE_FELINE) output(", sucking on the soft, feline \"barbs” one at a time");
	output(". <i>“You’re the best daddy I’m ever going to meet.”</i>");

	output("\n\nYou doubt you could stop her from gathering some if you wanted to.");
	if(pc.isBro() || pc.libido() >= 75) output(" Besides, a hidden part of you thrills at knowing this waddling baby-factory is going to play host to your children. Maybe she even has a system to preserve your cum, so she can pump out litters of little Steeles for years to come.");
	output(" <i>“");
	if(pc.isBro()) output("Go ahead,”</i> you grunt.");
	else if(pc.isBimbo()) output("Like, O-M-G that would amazalicious!”</i> you cheerily exclaim, happy to feed her all the dick she could ever want.");
	else output("Just stop teasing me, and you can do whatever you want with the cum,”</i> you implore, hips shuddering. Her fingers are too damned good at their job.");

	output("\n\nThe raskvel giggles. <i>“" + pc.mf("You boys are so easy.","A few strokes to the dick, and you get so generous.") + " Don’t worry. If there’s one thing I know, it’s how to make a cock feel good. Well, that and how to remodulate an ionic conductor for usage in a particle cannon, but getting knocked up is wayyy more fun!”</i> She’s back on your [pc.cock] as soon as you finish, pulling it - and you - closer so that she can recline. So positioned, the pregnant raskvel is able to grind you against her belly and thread you through her tits, smearing your ");
	if(pc.cumQ() < 500) output("oozing");
	else if(pc.cumQ() < 1000) output("streaming");
	else output("all but gushing");
	output(" pre across her soft-scaled skin.");

	output("\n\nShe grabs a bucket from under the console while you adjust to the sudden onslaught of friction. <i>“Goddamn, that is some premium dick,”</i> the raskvel coos. She grabs one enormous ear and lays it across the top left side of your member. The inside is velvety soft warm. The other falls onto the other side a second later. <i>“I swear I can feel your dick all the way in my ovaries.”</i> Her legs tremble. <i>“Like they know I’m rubbing your big, fat, alien cumstick right next to them.”</i>");
	output("\n\nThe scaley slut’s hands return to their former place, this time pressing through her sensitive ears. It must feel good, because her eyes roll halfway back, interrupting her attempts to kiss your [pc.cockHead " + x + "], but nothing could stop her from stroking you, pressing her tits together on either side with her forearms and jacking her perfectly textured ears up and down over every inch of cock she can reach. She drools into her cleavage, and her legs twitch with pleasure, trying to thrust her nearly-immobilized form against something, anything to get a little friction on her twat.");
	output("\n\nYou know how she feels. Your [pc.cock " + x + "] is violently throbbing from the treatment. Your heart hammers in your chest with alarming rapidly. All you want is her to stroke a little faster, squeeze a little tighter, and you could cum. Orgasm is so close you can feel it, and the raskvel surely can too with how your large [pc.cockHead " + x + "] swells.");
	if(pc.hasCockTail()) output(" Your [pc.cockTail] slithers down behind and slams into her well-used cunt, but it still isn’t enough. You need more.");
	output("\n\nTwo alien feet press down on your [pc.knot " + x + "] from either side, toes squeezing. They’re slipping from all the girlcum on the floor, making her grip tenuous. Better still, her quaking thighs make them shudder like they’re strapped to a high-powered vibrator. You groan and thrust forward, slamming your dicktip against her cerulean lips, and she moans right along with you, her soprano voice tickling already overloaded nerves with another layer of impregnation-obsessed pleasure.");
	output("\n\nThe dam breaks, and you erupt into the raskvel’s maw.");

	var cummed:Number = pc.cumQ();
	//Cum variants! - no new PG
	//Nojizz! - ANGER leads to the dark side.
	if(cummed < 5) 
	{
		output("\n\nWhen your oversized organ does nothing but spasm climacticly, the purple-scaled mynx’s expression sours, her passion calming in the face of an orgasm with nothing more than a small, tongue-moistening dribble of [pc.cumNoun].");
		output("\n\n<i>“That’s it?”</i> the raskvel says, gesturing wildly. <i>“All that effort and you barely get me half a dozen orgasms, and enough jizz to impregnate an ant? How dafuck am I supposed to get knocked up when ");
		if(pc.balls > 1) output("your balls are");
		else if(pc.balls == 1) output("your ball is");
		else output("your body");
		output(" is more dried out than sydian’s sense of humor? It’s like you bolted a fucking a giant, discount dildo on your crotch.”</i> She windmills her tiny fists in irritation, screaming, <i>“GET YOUR SHIT AND GET OUT! Fucking... fake-ass dick-having off-world losers!”</i>");
		output("\n\nMaybe if you had some time to rest, you would’ve had a better load for her. Too late now.");
		processTime(20);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",hyperFunPostGame_Return,cummed);
	}
	//<50jizz - spit into bucket, a little disappointed but not mad. Recommends you eat some spunkshrooms.
	else if(cummed < 50)
	{
		output("\n\nA few powerful, mouth-filling spurts spray out of your oversized organ, packing themselves deep into the raskvel’s cheeks. She shudders, cunt-leaking in sympathetic orgasm, but somehow, she doesn’t swallow. Instead, her feet pump you harder, milking the last few dregs into her maw.");
		output("\n\nWhen she’s sure she’s harvested every drop, her hands and feet release your ");
		if(!pc.hasStatusEffect("Priapism") || pc.libido() >= 80) output("slowly deflating meat");
		else output("still-hard cock");
		output(". She leans to the side, grabs the bucket, and spits out your wad without a hint of shame. Only then, does she have a moment to reflect on what happened. <i>“Not too bad, star-stuff.”</i> She licks the residue from her lips and noisily swallows. <i>“Bet it must be some virile stuff, to come all the way out of that big, swinging dick of yours.”</i> Kissing the top of your cock like a favorite pet, she smiles. <i>“You did real good.”</i>");
		processTime(20);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",hyperFunPostGame_Return,cummed);
	}
	//< 200 jizz - get mouthful, then aim rest into bucket. Polite thank you.
	else if(cummed < 200)
	{
		output("\n\nA powerful, cheek-bulging squirt sprays out of your oversized organ. Still latched onto your [pc.cockNoun " + x + "], the gravid girl takes it like a champ, swallowing noisily even as her pussy fountains clear girl-cum onto the floor. With shuddering hands, she grabs the bucket, swapping it into place just before your next squirt can take her in the face. You’re forced to watch your orgasm shoot into the rustic vessel, spurt after spurt puddling in the bottom while slippery soles work your [pc.knot " + x + "] to squeeze out even more.");
		output("\n\n<i>“Ah-ahhh yes!”</i> the gravid girl cries, shuddering again and again. You swear you can feel her strained stomach ballooning in response to the loads pumping through your urethra, so close by. <i>“Just like that!”</i> She twists her feet in half-circles, stunning you with hellish pleasure to help you leak out a few last drops. Only then does she let you go and put the bucket back on the floor.");
		output("\n\nA face blushed nearly pink greets you, illuminated with a cum-splattered smile and bright, pleased eyes. <i>“That was really nice. Really nice.");
		output(" Almost as good as popping out your eggs is going to be.");
		output("”</i> She pats your dick affectionately. <i>“I think there’s enough for three or four pregnancies there, if I’m smart about it, but I bet you’d rather I just poured it all with a funnel first chance I get, wouldn’t ya, " + pc.mf("stud","slut") + "?”</i>");

		if(pc.isBro()) output("\n\nYou nod vigorously, wishing you could watch her do it.");
		else if(pc.isBimbo()) output("\n\nYou giggle and shrug. Like, cum is great no matter how it slides into you!");
		else output("\n\nYou shrug nonchalantly, a little tired.");

		output("\n\n<i>“Well I’m a raskvel, and that means I’m smarter than the stingy yellow shark over there, and everybody else on this dustball of a planet.”</i> The raskvel thumps her fist proudly against her chest. Her exposed tits jiggle, glossy with sweat. <i>“I’ll ration it out. Maybe even mix it in with some raskvel nut if I think it needs a little help. I’m going to get so pregnant from you so many times, just you watch.”</i>");
		//[Next] with the same text as previous
		processTime(20);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",hyperFunPostGame_Return,cummed);
	}
	//< 1000 jizz - get mouthful+facial, then collect rest in bucket while blind.
	else if(cummed < 1000)
	{
		output("\n\nA powerful, cheek-bulging squirt sprays out of your oversized organ. The gravid-girl’s mouth can’t even contain it all. She’s forced off your dick by the heated flow and takes the rest square in the face. Ribbons of [pc.cumNoun] cascade down her cheeks. [pc.CumGem] droplets dribble from her chin, but the raskvel still manages to remember her bucket and lift it into place, even while she’s trying to swallow her leftover mouthful. You can’t see her face with the spooge-vessel thrust in front of it, but you can hear her moans imploring you to give her more.");
		output("\n\nStrangely, she seems to be getting off on it. Every time your [pc.cockNoun " + x + "] shoots a flood of [pc.cumNoun] through its urethra, you can feel her strained belly pressing back harder against you, as if the mere presence of sperm nearby is enough to make her reproductive system accelerate. Squirts of girlcum hit your [pc.feet] as she quivers, making her tiny soles pump your [pc.knot " + x + "] harder, squeezing even more of your potent fluids into the bucket.");
		output("\n\n<i>“Holey fucking condoms, that’s a lotta jizz!”</i> the raskvel squeaks, gushing again. <i>“You’re gonna get me pregnant for weeks, " + pc.mf("stud","slut") + "!”</i> The bucket sloshes higher as you spend the last of your liquid passion. She sets it down, giving you a good look at her [pc.cumColor]-painted maw. Streams of [pc.cumVisc] [pc.cumNoun] hang from her chin, and she’s constantly blinking her gunked-up eyes to try and see. <i>“I think my ovaries might have mutated again. Something definitely happened down there. I bet when I get pregnant with your kids, I’ll have even more. My current record is fifteen.”</i> An absurdly proud smile appears beneath the layer of sexual filth.");
		//[Next] -> same text as previous
		processTime(20);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",hyperFunPostGame_Return,cummed);
	}
	//< 3000 jizz - get mouthful+facial+plastered hair, then collect rest in bucket
	else if(cummed < 3000)
	{
		output("\n\nAn immense, mouth-flooding squirt sprays out of your oversized organ - and directly past her lips. She’s forced off your dick by the eruption of [pc.cum] with her cheeks bulging wider than a squirrel’s and a shocked look in her eyes. It doesn’t last long, not when the rest of your spermy shot goes across her nose, cheek, and forehead, all the way up into her ");
		if(pc.cumColor() != "blue") output("once-");
		output("blue hair. Her arms flail around for the bucket, but by the time she gets it in front of your [pc.cockHead " + x + "], she’s entirely drenched.");

		output("\n\nYou’ve only just begun to climax, spilling more virile liquid into the bucket than this raskvel likely sees in a month. She’s loving it too. You can tell by the way she squirms below you, her feet quivering on your [pc.knot " + x + "] whenever another pulse of [pc.cumNoun] passes through your urethra. Cunt-juice splatters the floor. The messy-little kobold is apparently quite the squirter. Stranger still, it seems like her belly gets bigger the more you go off, like having that much jizz that close to her womb is enough to make her reproductive system go into overdrive.");
		output("\n\nHigher and higher, the cummy tide rises in the bucket, sloshing. As it reaches near the lip, your shots cause some to splatter out on the raskvel mother’s tits, a sight erotic enough to help you squirt an extra time or two - just enough to fill it to the top.");
		output("\n\n<i>“Homyfuckinggoddamn that is a lot of cum!”</i> The pregnant lizard-girl tries to set down the bucket, but a few cupfulls slosh out in the process. She giggles and shovels some into her mouth, completing the image of a completely debauched cum-slut. <i>“And it tastes so strong! You’re going to give me babies for months, you know that right?”</i> She smears more cum on her stomach, making the scales there shine. <i>“You’re my primo baby-daddy. Gonna put more raskvel on this planet than a whole generation of rask boys.”</i> She kisses your dick, then hugs it passionately.");
		output("\n\n<i>“You and your cock are welcome here anytime. Just walk in and shove anybody else out of the way, because you are my number one lay from now on, got it?”</i> the smutty broodmother jabs a finger in your direction. <i>“I’m so glad you came back.”</i>");
		//Next -> same as other cummy epilgoues.
		processTime(20);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",hyperFunPostGame_Return,cummed);
	}
	//< 10000 jizz - choke on jizz, + full body drench, and bucket overflows.
	else
	{
		output("\n\nAn immense, overwhelmingly virile stream issues forth. The tide of jism instantly balloons the raskvel’s cheeks to comical proportions, then blows her off the end of your dick entirely. Unbound, semen sprays across her features. First, it drenches her shockingly parted lips, then splatters across her cheek so hard that it coats everything from the bridge of her nose the curve of her jawline. [pc.CumGem] dribbles from her chin as her jaw works to swallow the first [pc.cumFlavor] mouthful, but you’re far from done. Your [pc.cock " + x + "] bucks like a raging bronco, and the hose of seed takes her across the forehead for a moment before soaking her hair.");
		output("\n\nIn desperation, the semen-coated lizard scrabbles for her bucket. She gets it up in time to catch your second shot - most of it anyhow. It fills with alarming rapidity, something that clearly delights the raskvel from how she moans and squirts intermittently. While you fill the bucket, the constant caresses coaxing ever more from your body, you realize that her belly is getting larger. You aren’t sure why or how, maybe her hyper-developed reproductive system can tell that gallons of virile seed are flowing by, just inches away, packed into your highly-pressurized urethra. Maybe she’s so eager to funnel all that [pc.cumVisc] [pc.cumNoun] into her snatch that she’s accelerating her pregnancy through willpower alone.");
		output("\n\nMaybe the motherhusks have turned her into a baby-making machine.");
		output("\n\nYou don’t really care either way, not when she’s still wringing your [pc.cock] with those lovely ears of hers, jacking your [pc.knot " + x + "] with her feet, and begging you to keep cumming. When your [pc.cum] sloshes over the edge of the bucket, you groan in delight. It slips out of her fingers not long after, all but forgotten on the floor. She’ll be glad when she realizes it didn’t tip over, though more than half of her precious baby batter spilled to the floor.");
		output("\n\nNo matter. You dump load after load onto her tits, first left, then right. Once they’re sufficiently soaked (with a small lake in her cleavage), you turn your attention south to her belly. The fecund dome is soon takes on the appearance of a well-glazed pastry, with trickles of [pc.cumColor] icing dripping down the sides.");
		output("\n\nStill, she begs, <i>“My pussy!”</i>");
		output("\n\nYou violently yank your cock out of her hands and shove it low, right up against the lips of her double-clitted pussy. The nubs press down on your [pc.cockHead " + x + "] from either side as the lips yield to the torrents of spooge you push out, cream-filling her passage in one blissful squirt. Her plugged-up cervix won’t let her take any more, so you pull back and jack the last few squirts from your dick onto her puffy mound, letting the excess drip off her thighs.");
		output("\n\n<i>“S-so much fucking cum!”</i> the raskvel screams, violently orgasming one last time as she smears the dregs of your climax across her taut tummy. <i>“It’s everywhere.”</i> She looks dazedly at the bucket. It’s almost as filthy with your jism as she is. <i>“I think I love you.”</i> The declaration is whispered tiredly, but there is no hint of deception in her voice. To her, you’re clearly the perfect mate.");
		output("\n\nHer lingering declaration hangs heavy in your mind. <i>“");
		if(pc.isBimbo()) output("Awww, you’re a super good fuck yourself. I’d fill your pussy any time!");
		else if(pc.isBro()) output("You’re not so bad yourself,”</i> you grunt. <i>“Not bad.");
		else if(pc.isNice()) output("You’re amazing, though I don’t think I’m ready to drop the ‘L’ word myself.");
		else if(pc.isMischievous()) output("You’re not bad yourself, little lady. I’d knock you up any day of the way.");
		else output("You love my dick,”</i> you explain, shaking it at her. <i>“But thanks anyways. I know it can have that effect.");
		output("”</i>");
		output("\n\n<i>“Do you have any idea how many babies you’re going to give me?”</i> She scoops cum out from between her tits, then dumps it in the bucket. <i>“You’re going to father to a whole generation of virile, big-dicked raskvel boys.”</i> After a moment of thought, she adds. <i>“You should come back. Next time, I can be the cum-bucket.”</i>");
		output("\n\nSomehow you doubt she’s capable of making that many children, but it brings a smile to your face all the same.");

		//[Next] -> to usual outro, but with new dialogue:
		processTime(20);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",denInside);
	}
}

//Fuck Her
//"Her womb may be full, but her pussy isn’t."
public function fuckDatRaskipoo_Return():void
{
	clearOutput();
	showPregRask();
	var x:int = pc.cockThatFits(700);
	if(!pc.isCrotchExposed()) 
	{
		output("You hurriedly free your [pc.cocks] from ");
		if(pc.cockTotal() == 1) output("its");
		else output("their");
		output(" irksome confinement. The long-concealed flesh springs free and rapidly engorges before the raskvel’s eyes.");
	}
	else
	{
		output("You casually grasp your [pc.cocks] and shake ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(" at the horny raskvel.");
	}
	output(" She smiles wide with licentious intent, licking her blue-painted lips and tossing her downy hair.");

	output("\n\n<i>“You gonna stick it in?”</i> The purple-scaled lizard rolls to the side, lifting one leg high into the air to reveal an obscenely swollen cunt, flanked by bright pink, marble-sized clitties. The folds themselves are thick and juicy, dribbling eager pussyjuice across the floor. No matter how many birth’s they’ve passed, they’re plush enough to squeeze down on a pinky, let alone your [pc.cock " + x + "]. <i>“Or are you just teasing a poor, immobile rask girl?”</i> She grabs her ankle and pulls her leg higher until her lips part, releasing a small gush of lube. <i>“Maybe aliens are just shy...”</i>");
	//Very tall.
	if(pc.tallness >= 6*12+6) 
	{
		output("\n\nHardly. She’s just so small. Getting a huge creature like yourself to line up with that slobbering slot takes significant effort and a small amount of engineering. Between shoving a few cushions under her ass and awkwardly squatting down, you make it work.");
		if(silly) output(" Life... uh... finds a way.");
	}
	//Else
	else
	{
		output("\n\nHardly. You squat down to line yourself up, nearly slipping in the leaking girlslime in the process.");
	}
	//Merge
	output("\n\n<i>“...Maybe you’re just afraid of a little raskvel pussy. Like you know you’ll be lining up at my door day after day once you taste it,”</i> the sultry tart suggests.");
	output("\n\nGrabbing her belly to brace yourself, you thrust inside. ");
	if(pc.cockVolume(x) < 300) output("Her pussy parts easily around your [pc.cock " + x + "], and her diatribe cuts off with a high-pitched squeak of pleasure.");
	else if(pc.cockVolume(x) < 500) output("Her pussy reluctantly parts for your [pc.cock " + x + "], clutching it tightly as her diatribe cuts off with a high-pitched squeak of pleasure.");
	else output("Her pussy strains to accept your girthy tool, its thick lips stretched wide enough to pass an egg. A high-pitched wail of pleasure interrupts the little slut’s diatribe at the penetration. Evidently she’s a fan of pushing herself to the absolute limit.");
	output(" That saucy slot feels lovely wrapped around you. Her folds are absolutely soaked, and the pudgy pussy-lips press hotly against your crotch, a gentle reminder that you’ve buried yourself completely inside her.");
	pc.cockChange();
	var y:int = pc.cockThatFits2(700);
	//2
	if(y >= 0 && pc.cockTotal() == 2)
	{
		output("\n\nMeanwhile, your second dick rubs against her slippery crease of her thigh, pressing its [pc.cockHead " + x + "] up against the underside of her fertile belly. The mix of sweat and cunt-juice coating her soft-scaled skin allows it to glide effortlessly against her, right up until she wraps her fingers around it to give it a tug. <i>“I see you brought extra for the rest of me. How thoughtful...”</i> Her fingers twist and swirl while her cunt clenches.");
	}
	//More
	else if(y >= 0)
	{
		output("\n\nMeanwhile, your extra dicks rub against the slippery creases of her thighs, pressing their turgid tips up against the underside of her fertile belly. The mix of sweat and cunt-juice coating her soft-scaled skin allows them to glide effortlessly against her, right up until she grabs ");
		if(pc.cockTotal() == 3) output("both of them");
		else output("two of them");
		output(" to give them a tug. <i>“I see you packed enough to share. How thoughtful...”</i> She pumps both hard. <i>“I could use a facial.”</i>");
	}
	//Merge
	output("\n\nWhatever your floor-bound partner may think, you hold all the cards. You’re the one doing the fucking, looming over her. You’re the one who moves her thigh to make the muscles inside her twat clamp down tighter on your rod. She can whimper, her hands caressing your body in ways that make you groan, but there’s nothing she can do to change your tempo, nothing she can do to give her pause when you pound her drooling cunt hard enough to make her chirp out an orgasm.");
	output("\n\nYou’re just getting warmed up. You hammer her well-used cunt with powerful strokes. When you pull back, ropes of girl-jizz spatter the floor, hanging off your [pc.cock " + x + "] in webs. When you thrust in, still more squirts out, splattering your thighs and hers alike. When you bury yourself to the hilt, crushing her clits between your bodies, she squeals and trembles. You can’t tell if she’s cumming over and over, or if she just can’t handle how good it feels to have her pregnant pussy taken by a talented lover. You like it either way.");
	output("\n\nShe’s smiling saucily, her tail lashing back and forth. It ");
	if(pc.balls > 1) output("cradles your balls, then wraps around them with surprising tenderness. The warm cocoon of scaly flesh makes it seem almost too easy to spill your load.");
	else if(pc.hasVagina()) output("teasingly wanders over your slit, then slips inside. The slippery scales inside you make it almost too easy to spill your load.");
	else output("slips back to tease your [pc.asshole]. At first, it’s playfully circling, but after a particularly forceful thrust on your part, she slides it in. The pressure on your prostate makes it seem almost too easy to spill your load.");
	output(" One errant thought and you’ll be giving her an enormous, cunt-bathing creampie.");

	output("\n\n<i>“You know, if you give me enough c-cuuUUUM~! ...I can save some to get pregnant with after this batch.”</i> Her pussy quivers, leaking runnels of slick, reptilian goo. <i>“I bet you’ll make me ever bigger. Think about it. Your own little egg-slut, saving your cum so she can get knocked up again and again.”</i>");

	output("\n\n");
	if(pc.isBro() || pc.libido() >= 75) output("Fuuuck that’s exactly what you want to do. You want to strap her to the wall in your ship and dump endless loads into her, using her as equal parts sex-toy and virility measuring stick. Maybe you might even get her some mods or an exoskeleton to let her get around the ship. In between laying eggs she could dress herself in skimpy slutwear and slowly ruin it as her pregnancy progresses...");
	else 
	{
		output("You feel like you ought to be a little worried or disgusted about such brazen usage of your sexual fluids, but your body isn’t. Your traitorous rod");
		if(pc.cockTotal() > 1) output("s love");
		else output(" loves");
		output(" the idea of siring a whole clan of horny fuck-lizards. She’s tickled your most basic, unthinking instincts in ways that make your [pc.cockNoun " + x + "] throb and your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("crotch");
		output(" clench.");
	}

	output("\n\nYou bury yourself deep and unload. There’s no other option. The climax is entirely beyond your control, more a sudden venting of pressure than anything you have to work for. The pregnant raskvel’s oozy, clutching slit squeezes it out of you in ");
	var cummies:Number = pc.cumQ();
	if(cummies < 5) output("weak trickles");
	else if(cummies < 25) output("fat globs");
	else if(cummies < 175) output("thick streams");
	else if(cummies < 1000) output("enormous gushes");
	else output("titanic waves");
	output(", her well-used form wringing your [pc.cockNoun " + x + "] for all its worth. Her cunt a warm, wet heaven, clutching you tightly, drowning you in ecstasy in pussyjuice alike");
	if(cummies >= 2000) output(" while your pressurized seed vents back out all over the floor");
	output(". You shudder and groan with each successive spurt until your dick finally goes dry. Even then, the scaled cumdumps' tunnel massages you pleasantly, begging you to stay inside and enjoy the post-coital massage. You manage to pull yourself away, despite the broodmother teasingly circling her finger around her pussy-lips.");

	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",denInside);
}

//Face Ride
//Straddle her face as she eats you out, then slip in her cuntjuice for musky fun :3
public function faceRideTheRaskPreg_Return():void
{
	clearOutput();
	showPregRask();
	output("You advance on the immobile raskvel");
	if(!pc.isCrotchExposed()) output(", silently peeling the covers from your [pc.vaginas]");
	else output(", silently wiggling your hips to display your [pc.vaginas]");
	output(". <i>“");
	if(pc.tallness >= 5*12) output("You’re just the right height.");
	else output("I bet all the girls love seeing you stuck on your knees.");
	if(pc.hasStatusEffect("Vaginally-Filled"))
	{
		output(" Now how about you lick all the cum out of me. ");
		if(pc.isNice() || pc.isMischievous()) output("The glaze just makes it better, right?");
		else output("Sluts like you </i>crave<i> it.");
	}
	else if(pc.isNice() || pc.isMischievous()) output(" Now why don’t you put that tongue to work before my feathery friend finds an excuse to keep us apart?");
	else
	{
		output(" Now put that tongue to work, and we’ll see if you’re really keyed up enough to get off from the taste of another");
		if(pc.isPregnant()) output(" pregnant");
		output(pc.mf(" person"," woman") + "’s pussy.");
	}
	output("”</i>");
	output("\n\n<i>“Mmmm... been a while since I sucked pussy,”</i> the pregnant raskvel admits. Her eyes are wide and lustily locked on your slit");
	if(pc.totalVaginas() > 1) output("s");
	output(". It’d take a raskvel boy, dribbling cum and begging to fuck, to distract her for how she stares. She wants the pussy, and she wants it bad. Rocking forward, the lizard-girl strains to plant a kiss on your mound, but her pregnant bulk drags her right back, forcing her to settle down on her fattened haunches with an annoyed wobble. <i>“...Please? I can’t reach.”</i> She looks up imploringly, tugging her nipples as much for show as for her own pleasure.");

	output("\n\nYou ");
	if(pc.tallness < 5*12) output("step to the side and carefully climb up onto her console’s ledge. It’s the only way you’ll get your cunt at the right level with how short you both are.");
	else output("take a step closer.");
	output(" The violet lizard-girl smiles eagerly. Then, too fast to be seen, she worms her tongue into your [pc.vagina]. One moment, you’re inching your hips closer. The next, a thick spear of oral flesh is wriggling inside your most sensitive place. It’s a disproportionately large thing too - nearly six inches long and fat enough around to shame a few of the galaxy’s bigger races.");

	output("\n\nA sigh of delight slips from your mouth as your hips instinctively push back, pressing your lips to hers, [pc.oneClit] booping her on the nose. Your pregnant pussy-licker takes your vocalizations as encouragement and places her hands ");
	if(!pc.isTaur()) output("on your [pc.butt]");
	else output("on either [pc.thigh]");
	output(", squeezing as her luscious, blue-painted lips slip back and forth on your arousal-slickened flesh.");
	if(pc.hasStatusEffect("Vaginally-Filled")) output(" Her mouth works to swallow the cum inside. For how fast she guzzles it down, scooping more into her maw with practiced curls of her tongue, she loves it.");
	if(pc.wettestVaginalWetness() >= 3)
	{
		output(" You’re so wet that excess moisture stains your muff-mounted raskvel’s cheeks");
		if(pc.wettestVaginalWetness() >= 5) output(" and drips from her chin in small waterfalls");
		output(".");
	}

	output("\n\n<i>“Deeper,”</i> you urge, rocking back and forth on your face. Your pussy spasms around the tiny beast-girl’s rather... gifted tongue in pulsing waves that echo your own mounting ecstasy. When that wiggling organ draws back, you whimper in desperation and disappointment only to have your cry transform into a full-throated screech of pleasure once she coils it around [pc.oneClit]");
	if(pc.clitLength >= 4) output(", tugging it like a full-blown cock");
	output(". The best part of it all is just how slick and <i>hot</i> it all feels, like the nerves into your [pc.vagina] are firing so strongly that everything below your waist may as well be tongue-bathed pussyflesh.");

	output("\n\nShe knows what she’s doing, that’s for sure.");

	output("\n\n<i>“Mmmm,”</i> the short, stacked MILF moans into your cunt. Her fingers squeeze harder, claw-like nails ");
	if(pc.hasChitin()) output("scrabbling across your chitin.");
	else output("digging into your [pc.skinFurScalesNoun].");
	output(" Coils of pleasure twist through your nethers as the tongue abandons your clit and burrows deeper once more, feeling around the inside of your passage, stretching it open");
	if(pc.looseness() < 3) output(" and letting it snap back into place");
	else 
	{
		output(" and watching the [pc.girlCum] leak out");
	}
	output(".");
	if(pc.looseness() >= 4) output(" A tongue alone isn’t enough to satisfy you, however, and she knows it. Raising an arm, the purple-scaled nympho balls her small hand into a fist and thrusts it inside, twisting her neck so that her tongue can taste your oozing [pc.girlCum] while she pleases your capacious cunny.");

	output("\n\nBursts of stars explode behind your eyelids as the pleasure crashes into you. Whimpering and oozing, you shake and shudder, paroxysms of ecstasy wracking your frame, grinding your overheated slit into the cunt-smeared hussy’s blissfully unconcerned face. You dimly register the feel of her voice crying out into you, her sounds of pleasure little more than a booster rocket carrying you into orgasm-land by vibration alone.");

	//Squirter + hugecumQ
	if(pc.isSquirter() && pc.girlCumQ() >= 2000)
	{
		output("\n\nAnd there’s so much [pc.girlCumNoun]. It sprays into the raskvel’s mouth and washes down her cheeks. When she draws back to breathe, it splatters across her nose and forehead. Eventually she gives up and tips her head back, stabbing her tongue into you again and again, making your pressurized pussy spurt its fragrant liquid <i>everywhere</i>: on her tits, on her swollen belly. It even creates puddles on the floor that slowly wind their way toward a well-placed drainage grate.");
	}
	//Squirter
	else if(pc.isSquirter()) output("\n\nYou pay the soft-scaled slut back in big, wet squirts of [pc.girlCum] that run down her chin and pool in her tits. Her skill as a slit-licker demands it. Your [pc.vaginas] will accept nothing less, not when climax has you in its grip and wrings you for every drop of feminine goo you can give.");
	//Not squirter, very wet
	else if(pc.wettestVaginalWetness() >= 3) output("\n\nYou pay the soft-scaled slut back in a steady river of [pc.girlCum]. She all but purrs at the taste of it, throat bobbing in an effort to devour it all. When she sees you watching, she slurps louder, tugging on your netherlips, intent on wringing every drop of feminine lust from you before you continue on your journeys, and it’s working.");
	//Regular wet
	else output("\n\nYou pay the soft-scaled slut back in lurid moans and dribbles of [pc.girlCum]. She ravenously devours them, her tongue twirling inside you to gather it up and channel the flow directly into her maw. You hear her gulp once, then return to her work with the passion of an individual who truly loves the act of giving pleasure.");
	//Merge
	output("\n\nAs you come down, shuddering through aftershocks, you run your fingers through her feathers. They’re down-soft, and the sensation combined with the taste of your post-coital cunt sends her over the edge. She whimpers, lower lip shaking against [pc.oneClit]’s hood, and her pregnant quim goes off, splattering pregnant raskvel-honey across the deck");
	if(pc.isSquirter()) output(" to mix with your own");
	output(". She rolls part way back, enough to give your [pc.vaginas] some relief, and you gingerly separate, panting and tired in the aftermath.");
	output("\n\n<i>“Wow,”</i> you mumble, too cummed-out for words.");
	if(pc.isBimbo()) output(" There’s so much pink, cotton-candy fuzz twirling around in your head that you doubt you could complete a sentence, much less manage a witty entendre.");
	output("\n\nThe raskvel broodmother, pats her tummy. Did it get bigger? It definitely looks bigger... <i>“Mmm... that was fun. Not as fun as birth, mind you, but fun.”</i> She burps, and the scent of pussy in the air grows a little stronger.");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",denInside);
}

public function denInside():Boolean
{
	clearMenu();
	clearOutput();
	clearBust();
	author("Other");
	
	output("The den is large, well lit and devoid of the rust you've seen on the rest of the planet. Flickering monitors line one side of the room.\nSeveral supports lie in the centre of the room and " + (getBroodmotherLibidoLevel() > 1 ? "atop them lies ":"slouched next to them, "))
	if (pc.isBimbo() && getBroodmotherLibidoLevel() > 1) output("your big round fun buddy, ");
	
	var lvl:int = getBroodmotherLibidoLevel();
	if (hours < 4 || hours > 22)
	{
		output("the Raskvel Broodmother, snoring away, resting from the days activities.");
	}
	else
	{
		switch (lvl)
		{
			case 0:
				if (hours % 8 == 0)
				{
					output("the Raskvel Broodmother, who whilst not as active as she used to be, is fucking a fellow raskvel, his purple cock pouch-deep in her.");
				}
				else
				{
					output("the Raskvel Broodmother, her expression gloomy and her body lacking its previous glow.");
				}
				break;
			case 1:
				if (hours % 7 == 0)
				{
					output("the Raskvel Broodmother, who whilst not quite as active as she used to be, is fucking a fellow raskvel, his purple cock pouch-deep in her.");
				}
				else
				{
					output("the Raskvel Broodmother. Her expression is one of frustration but her feathery hair has regained its shine.");
				}
				break;
			case 2:
				if (hours % 6 == 0)
				{
					output("the Raskvel Broodmother, who's clearly beginning to regain her libido as she's getting double teamed by 2 young Raskvel males.");
				}
				else
				{
					output("the Raskvel Broodmother, her face filled with exasperation and her bulbous figure glowing.");
				}
				break;
			case 3:
				if (hours % 5 == 0)
				{
					output("the Raskvel Broodmother, who's almost back to how she used to be with a group of " + (rand(1) == 1 ? "Raskvel males" : "Sydian males") + " taking turns fucking her.");
				}
				else
				{
					output("the Raskvel Broodmother, held down by her ever ballooning paunch, tounge dangling from her mouth.");
				}
				break;
			case 4:
				if (hours % 4 == 0)
				{
					output("the Raskvel Broodmother, who's libido is back to normal, as a group of " + (rand(1) == 1 ? "Raskvel men and women" : "Sydian men and women") + " are all trying to fuck the heavily pregnant Raskvel at once.");
				}
				else
				{
					output("the Raskvel Broodmother, pinned by her gargantuan stomach and breasts. As she notices you looking at her, she spreads her legs slightly wider giving you a view of her gaping pussy.");
				}
				break;
			case 5:
				if (hours % 3 == 0)
				{
					output("the Raskvel Broodmother, who's libido is at it's limit, as a large crowd of aliens of various races are all pushing eachother around, competing to fuck the heavily pregnant Raskvel as she touches herself and begs for them.");
				}
				else
				{
					output("the ballooning Raskvel Broodmother, who rubs her lactating nipples as she catches sight of you. Saliva drips from her tounge, as she's lost in sexual thoughts.");
				}
				break;
		}
	}
	if (flags["PREG_RASK_RETURNED_BEFORE"] == undefined)
	{
		output("\nTaking the motherhusks from her has had quite the effect on her. She clearly has not been pregnant for some time and she's much less cocky than before. The den looks significantly less used than before too, with no cum-puddles in sight.");
	}
	flags["PREG_RASK_RETURNED_BEFORE"] = true;
	
	switch (lvl)
	{
		case 2:
			output("\nDrains line the floor beneath her.");
			break;
		case 3:
			output("\nDrains line the floor beneath her, collecting the overflow from her breeding sessions.");
			break;
		case 4:
			output("\nDrains line the floor beneath her. They're beggining to become blocked by the excessive overflow from her breeding sessions.");
			break;
		case 5:
			output("\nThe drains beneath her are completely blocked by the excessive overflow from her non-stop breeding sessions.");
			break;				
	}
	
	if (lvl > 3)
	{
		if (pc.libido() >= 70 || pc.lust() >= 50)
		{
			if (pc.hasVaginas())
			{
				if (pc.isBimbo())
				{
					output("\nYou wish you were stuck up there, being pumped full of cum all day!");
				}
				else
				{
					output("\nIt makes you a little envious.");
				}
			}
			else
			{
				output("\nMaybe you'll block them some more..");
			}
			
		}
		else if (pc.isBimbo())
		{
			output("\nYou're totally jealous.");
		}
	}
	output("\n");
	
	if ((hours % (8 - lvl)) == 0)
	{
		addDisabledButton(0, "Broodmother", "She looks busy");
	}
	else if (hours < 4 || hours > 22)
	{
		addDisabledButton(0, "Broodmother", "She's sleeping");
	}
	else
	{
		addButton(0, "Broodmother", approachBroodmother);
	}
	
	if (getBroodmotherLibidoLevel() == 0){addDisabledButton(13, "Rest", "Probably best not to close your eyes around someone who's only enjoyment you've taken away.");}
	else{addButton(13, "Rest", denRest); }
	
	addButton(14, "Leave", denLeave);
	return true;
	
}

public function denRest():void
{
	clearMenu();
	clearOutput();
	
	if (pc.hasStatusEffect("Bulky Belly"))
	{
		output("Taking inspiration from the broodmother, you clamber atop another of the rooms supportive structures and lie face forward. As you rest your [pc.belly] between two of the beams, a wave of relaxation comes over you and you quickly fall asleep.");
	}
	else
	{
		output("You walk over to some sofa's that sit on one side of the cavernous room and lie down on one. As your body touches the soft material, a wave of relaxation washes over you and you quickly fall asleep.");
	}
	
	addButton(0, "Next", denRestEnd);
}

public function denRestEnd():void
{
	clearMenu();
	
	if (pc.hasStatusEffect("Bulky Belly") && getBroodmotherLibidoLevel() >= 3 && rand(3) == 2)
	{
		processTime(2*60);
		sleepHeal();
		
		output("\n\nYour eyes jerk open as you feel <b>someone rubbing your [pc.belly]!</b>");
		addButton(0, "Next", denRestMistaken);
	}
	else
	{
		processTime(8*60);
		sleepHeal();
		
		output("\n\nYour eyes flutter open and you " + (pc.hasStatusEffect("Bulky Belly") ? "clamber down from the supports." : "get up from the sofa."));
		addButton(0, "Next", denInside);
	}
}

public function denRestMistaken():void
{
	clearMenu();
	clearOutput();
	showBust("RASKVEL_GANG_NUDE");
	showName("RASKVEL\nGANG");
	
	var consent:Boolean = false;
	var stretched:Boolean = false;
	var cummed:Number = pc.cumQ(); //for futa
	
	output("You twist your head to see 3 Raskval standing to the side, two with their retractable cocks unsheathed in their hands and their hung leader massaging your [pc.belly]. <i>“Hi”</i> he says in a deep voice. <i>“Because you're up there, we can treat you the same way we normally treat her right?”</i> ");
	var isSlut:Boolean = ((pc.isTreated() && pc.isBimbo()) || pc.isBimbo() || pc.isDependant(Creature.DEPENDANT_CUM) || (pc.libido() >= 50 && pc.lust() >= 33) || pc.lust() > 66);
	if (isSlut) //If there's any reason to do this
	{
		output(pc.isBimbo() ? "\n<i>“Of course”</i> you giggle, wiggling your [pc.hips] in anticipation." : "<i>“That'd be great”</i> you reply seductively.");
		consent = true;
	}
	else
	{
		output("<i>“Huh? No, I'm just resting here!”</i> you protest as you try to get off the supports but the two smaller Raskvel pull out some rope and quickly bind you to the frame. <i>“Thought you might say that”</i> the leader says with a smirk, <i>“But we're not taking no for an answer.”</i>");
	}
	
	output("\nOne of the raskvel runs his hands along your " + (consent ? "" : "rope bound") + "[pc.hips] whilst another grabs " + (consent ? "your" : "you by your") + " [pc.ass]. The larger one strokes your cheek" + (consent ? " as he looks into your eyes and runs his fingers around your [pc.nipples]." : " in an effort to calm you before moving his hands down to play with your [pc.nipples]."));
	
	if (consent)
	{
		output("<i>“Ooh, that feels good guys”</i> you moan <i>“but why don't we move things forward.”</i>");
	}
	else
	{
		output("You fight again your bindings but to no avail. <i>“Please, I'm not like her!”</i> you shout but you're beggining to lose your will to fight from the energy lost battling your restraints.");
	}
	
	output("\nAt this they begin to step it up a notch. ");
	
	if (!pc.isNude())
	{
		if (consent){output("They hurridly tear off your [pc.gear] with your help and soon your naked body is ready for them. ");}
		else{output("They forcefully tear off your [pc.gear], tossing each garment to the floor. ")}
		pc.removeAll();
	}
	
	output("The one at the back slips his hand down ");
	if (pc.hasVagina())
	{
		output("from your [pc.ass] to your groin and thrusts ");
		if (pc.biggestVaginalCapacity() > 400)
		{
			if (pc.biggestVaginalCapacity() > 600)
			{
				output("his forearm into your " + pc.vaginaDescript(pc.biggestVaginaIndex()) + ", filling up your insides.");
			}
			else
			{
				output("his fist into your " + pc.vaginaDescript(pc.biggestVaginaIndex()) + ", filling up your insides.");
			}
		}
		else
		{
			output("two fingers into your " + pc.vaginaDescript(pc.biggestVaginaIndex()) + ", teasing your insides.");
			
		}
	}
	else
	{
		output("between your [pc.buttcheeks] and thrusts ");
		if(pc.ass.looseness() <= 1)
		{
			output("a finger into your [pc.asshole], it spasming as he does.");
		}
		if(pc.ass.looseness() <= 5)
		{
			output("his fingers into your [pc.asshole], it spasming as he does.");
		}
		else
		{
			output("his fist into your [pc.asshole], it wrapping around it as he does.");
		}
	}
	output("\n");
	
	output("The second smaller raskvel moves from his position at your hips ");
	if (pc.hasTits())
	{
		if (pc.isLactating())
		{
			output(" and begins sucking from your " + pc.biggestBreastDescript());
		}
		else
		{
			output(" and begins licking your " + pc.nippleDescript(pc.biggestTitRow()));
		}
	}
	else if (pc.hasNipples())
	{
		output(" and begins licking your " + pc.nippleDescript(pc.biggestTitRow()));
	}
	else  
	{
		output(" and begins running his tounge along your [pc.chest]");
	}
	output(".\n");
	
	output("Their leader follows suit");
	if (consent)
	{
		output(" by grabbing " + (pc.hasHair() ? "hold of your [pc.hair]" : "hold of your head") + " and raising his cock to your [pc.lips]. You roll your lips down over his big purple cock");
		if (pc.canDeepthroat())
		{
			output(", maintaining eye contact, until your lips reach the base of his lengthening shaft, where you're held, mouth full, until you can barely breath and then yanked back off, a wave of saliva travelling with you. You giggle as your head lies red in his hands, saliva dribbling down your chin until he shoves his huge cock back in.");
		}
		else
		{
			output(", maintaining eye contact, until the tip of his cock reaches the back of your throat, where you're held, mouth full, until you can barely breath and then yanked back off, a wave of saliva travelling with you. You giggle as your head lies red in his hands, saliva dribbling down your chin until he shoves his huge cock back in.");
		}
	}
	else
	{
		output(" by grabbing " + (pc.hasHair() ? "hold of your [pc.hair]" : "hold of your head") + " and jaw , forcing your [pc.lips] open and shoving his enraged purple cock in and out of your wet mouth, slapping your reddening cheeks between repetitions, saliva and tears running down your [pc.face].");
	}
	output("\n");
	
	if (consent){
		output("It seems like two of them are ready to go, but the one "); 
		if (pc.hasTits())
		{
			if (pc.isLactating())
			{
				output(" sucking from your " + pc.biggestBreastDescript());
			}
			else
			{
				output(" licking your " + pc.nippleDescript(pc.biggestTitRow()));
			}
		}
		else if (pc.hasNipples())
		{
			output("licking your " + pc.nippleDescript(pc.biggestTitRow()));
		}
		else  
		{
			output(" tounging your [pc.chest]");
		}
		output(" could do with being bigger. You tap his shoulder and he stands up from his good work, his semi-flaccid penis bouncing against your hand as he does. You tug him closer and wipe your chin-saliva all over his cock before working your hand up and down his shaft, it growing in your hand as you do. Happy with your work, you giggle <i>“Alright guys, give me those cocks!”</i>");
		
	}

	output("\nReady to go, the Raskvel reposition themselves. The larger one pulls his now spit-coated cock out of your mouth ")
	if (!consent)
	{
		output(",at which point you murmur abuse at him with what little energy you've got left ");
	}
	output("and moves to your ");
	if (pc.hasVagina())
	{
		output(pc.vaginaDescript(pc.biggestVaginaIndex()) + ".");
		if (pc.biggestVaginalCapacity() > 400)
		{
			output(" With your pussy more than well equipped to accomodate him, his his forearm sized raskvel cock thrusts deep into your cavernous fuck-hole, his tip slamming against your cervix.");
		}
		else
		{
			output(" With two fingers he stretches your pussy open and then thrusts his cock deeper and deeper into it,");
			if (!consent){output(" the walls of your insides fighting a battle against his girth but to no avail"); }
			else{output(" the walls of your pussy widening to accomodate him until he's at his depth"); }
			output(", when he begins thrusting in and out of it with his forearm sized raskvel cock.");
			
			if (pc.vaginas[pc.biggestVaginaIndex()].looseness() < 3)
			{
				pc.vaginas[pc.biggestVaginaIndex()].looseness(3);
				pc.vaginas[pc.biggestVaginaIndex()].minLooseness(2);
			}
			pc.vaginas[pc.biggestVaginaIndex()].capacity = 400;
			stretched = true;
		}
	}
	else
	{
		output("behind.");
		if (pc.ass.looseness() > 3)
		{
			output("Already wide, he buries his cock in your [pc.asshole] and begins thrusting deep into it with his forearm sized raskvel cock.");
		}
		else
		{
			output("With two fingers he stretches your [pc.asshole] open and then thrusts his cock deep into it,");
			if (!consent){output(" the walls of your ass fighting a battle against his girth but to no avail"); }
			else{output(" the walls of your ass widening to accomodate him until he's at his depth"); }
			output(", when he begins thrusting in and out of it with his forearm sized raskvel cock.");
			
			if (pc.ass.looseness() < 3)
			{
				pc.ass.looseness(3);
			}
		}
	}
	
	output("\nThe second raskvel swaps to where the first was and ");
	if (consent)
	{
		output("grabs " + (pc.hasHair() ? "hold of your [pc.hair]" : "hold of your head") + ", lifting your head so your lips meet his meat. You wrap your mouth around the tip of it and he pushes your mouth down over his girthy, lavender, dick.");
	}
	else
	{
		output("grabs " + (pc.hasHair() ? "hold of your [pc.hair]" : "hold of your head") + " and forces his fat, purple cock into your agape mouth.");
	}
	output("\n");
	
	//Butthole's free, vag in use
	if (pc.hasVagina())
	{
		if (consent)
		{
			output("The third, now ready to go, grabs hold of a side of your [pc.belly] and hoists himself up ontop of you. You feel his feet shuffling about ontop of you before he kneels on your lower back. You angle your posterior slightly and the raskvel pulls apart your [pc.buttcheeks] and thrusts his dick into your ");
			if (pc.ass.looseness() > 2){output("inviting ");}
			output("backdoor, it tightening around his member as he hits depth.");
		}
		else
		{
			output("The third, grabs hold of a side of your rope-wrapped [pc.belly] and hoists himself up ontop of you. You feel his feet press into you before his knees dig into your lower back like knives. He spreads apart your [pc.buttcheeks] and you feel his cock thrust through your ");
			if (pc.ass.looseness() > 2){output("widened ");}
			output("backdoor. You try to kick him off but your legs have been hogtied and all you can manage to do is help him thrust deeper.");
		}
	}
	else //No hole
	{
		if (consent)
		{
			output("The thirds hard, pulsating cock stays stuck in your grasp as you ramp up your pace, jerking him faster, eager to relieve him of his cum.");
		}
		else
		{
			output("The third stops slathering his saliva across your [pc.chest] but stays enfixed on your body and starts jerking himself off as you struggle against his bretheren.");
		}
	}
	
	output("\nYou breath feircly through your nose, " + (consent ? "as things get more intense - the bulging cocks pound you with increasing speed and the big earthy one slides along your tounge, pushing it against the the bottom of your mouth." : "struggling to breath between the intensity with which their sand-covered cocks assault you and as the cock in your mouth blocks your airway with no respite between assaults."));
	if (pc.hasVagina())
	{
		if (consent){
			output(" The biggest one, " + (stretched ? "having stretched out your insides like an expanding balloon" : "having slid into your accomodating fuck-hole") + ", has been pounding away, his bulging Raskvel cum-pouch slapping against your thighs. <i>“Mmmm, fuck yeah”</i> you moan, feeling the warmth of his rock-hard fuck-rod " + (stretched ? ("pushing against the walls of your " + pc.vaginaDescript(pc.biggestVaginaIndex()))  : (" pushing fast and hard into your " + pc.vaginaDescript(pc.biggestVaginaIndex()))) + ".");
		}
		else{
			output(" The biggest one, " + (stretched ? ("having stretched you to his size like a fresh condom, has been slamming his boiling, rock-hard dick into you with force, it burning against the walls of your insides,"): "has been slamming his boiling, rock hard cock into you with force, it pounding deep into you with each thrust,") + output(" his heavy seed-pouch slamming into the back of you with each thrust."));
		}
	}
	else
	{
		if (consent){
			output(" The biggest one, " + (stretched ? "having stretched out the inside of your ass like an expanding balloon" : "having penetrated your accomodating butt-hole") + ", has been pounding away, his bulging Raskvel cum-pouch slapping against your buttocks. <i>“Mmmm, fuck yeah”</i> you moan, feeling the warmth of his rock-hard fuck-rod " + (stretched ? ("pushing against the walls of your ass")  : (" pushing against your asshole on each movement") + "."));
		}
		else{
			output(" The biggest one, " + (stretched ? ("having stretched you to his size like a fresh condom, has been slamming his boiling, rock-hard dick into you with force, it burning against the walls of your insides,"): "has been slamming his boiling, rock hard cock into you with force, it pounding deep into you with each thrust,") + output(" his heavy seed-pouch slamming into the back of you with each thrust."));
		}
	}
	if (pc.hasVagina())
	{
		if (consent){
			output(" The third one kneels atop you , pounding away, his pouch slapping your behind lightly as he moans <i>“Mmmm, so tight”</i>, his curvy fuck-rod travelling in and out of your anal canal, building and releasing pressure on each thrust as his cock brushing against your butthole.");
		}
		else{
			output(" The third ones knees have been digging into your back as he kneels ontop of you. <i>“Mmmm, so tight”</i> he laughs whilst his rock hard cock shoves in and out of your asshole, pressure building inside you as he refuses to give your ass any time to breath.");
		}
	}
	else
	{
		if (consent){
			output(" The third one's thick veiny cock is now burning in your hand, throbbing as you slide your hand along it. <i>“Ooah, you're so good”</i> he gasps , his cock just about ready to burst.");
		}
		else{
			output(" <i>“Mmmm, keep fucking this fucking slut”</i> the third one moans, watching you get knocked back and forth by his bretheren whilst he beats his reddening, veiny cock to what's unfolding.");
		}
	}
	
	output("\nTheir movements get faster and their cocks bigger. The ");
	
	if (consent){output("pleasure you feel from their cocks being buried in your "); }
	else{output("pressure you feel from their cocks being buried in your "); }
	
	if (pc.hasVagina()){output(" holes and mouth"); }
	else{output(" butthole and mouth"); }
	
	output(" is overwhelming");
	if (pc.hasCock())
	{
		if (!consent)
		{
			output(". Even though you're hating every minute of it"); 
			
		}
		output(", your [pc.cock] is about to burst from all the fucking they're giving you.");	
	}
	
	if (consent){output(" But seemingly you're pretty overwhelming too."); }
	else{output(" But you soon get your release from this torture."); }
	
	if (consent)
	{
		if (pc.hasVagina())
		{
			output("You feel the boiling dicks in your fuck-holes stiffen and throb against eachother through the thin wall between your backdoor and asshole. <i>“Mmm come on boys, fill me up!”</i> you cackle as with each pulsation cum flys from their cocks, shooting against your insides, flooding deeper and deeper into you.");
			output("As they do this, the Raskvel at your front lets out a long moan and his milky cum fires against the back of your throat, flooding your airways, your nose filled with the scent of his cum inside you.");
		}
		else
		{
			output("You feel the boiling dick in your fuck-hole stiffen and throb against the walls, with each pulsation firing hot cum into the walls of your rectum, filling you with raskvel cum.");
			output("As this happens, the Raskvel at your front lets out a long moan and his milky cum fires against the back of your throat, flooding your airways, your nose filled with the scent of his cum inside you.");
			output("The reddened, pre-cum tipped, veiny dick in your hand, finally erupts and fires its hot bounty all over your saliva-drenched face and [pc.chest].");
		}
		if (pc.hasCock())
		{
			if (pc.hasCocks() > 1)
			{
				output(" As they release their cum, your [pc.cocks] throb uncontrollably and with a moan, ");
				if (cummed < 5)
				{
					output("your cocks twitch and wobble, beads of cum dripping out the ends onto the floor below.");
				}
				else if (cummed < 50)
				{
					output("your cocks twitch and fire several shorts spurts of cum onto the floor below.");
				}
				else if (cummed < 200)
				{
					output("your cocks twitch and several intense bursts of cum fire from each one onto the floor below.");
				}
				else if (cummed < 1000)
				{
					output("your cocks twitch and several intense bursts of cum spurt from each one, firing onto the floor one after the other until they stop, with a puddle of your [pc.cum] left on the floor below.");
				}
				else if (cummed < 3000)
				{
					output("your cocks erupt, [pc.cum] pouring out in waves of [pc.cumcolor], splashing against the floor below, the drains filling with it until the intensity lowers and with one last twitch, your flow stops.");
				}
				else
				{
					output("your cocks erupt, [pc.cum] pouring out like a [pc.cumcolor] tsunami, splashing against the floor below until there's no floor left and your cum is just splashing against more of your cum, the drains unable to contain the contents of your [pc.balls].");
				}
			}
			else
			{
				output(" As they release their cum, your [pc.cock] throbs uncontrollably and with a moan,");
				if (cummed < 5)
				{
					output("your cock twitches and wobbles, beads of cum dripping out the end onto the floor below.");
				}
				else if (cummed < 50)
				{
					output("your cock twitches and fires several shorts spurts of cum onto the floor below.");
				}
				else if (cummed < 200)
				{
					output("your cock twitches and several intense bursts of cum fire from it's tip onto the floor below.");
				}
				else if (cummed < 1000)
				{
					output("your cock twitches and several intense bursts of cum spurt from the end, firing onto the floor in bursts, until a puddle of your [pc.cum] is left on the floor below.");
				}
				else if (cummed < 3000)
				{
					output("your cock erupts, [pc.cum] pouring out in waves of [pc.cumcolor], splashing against the floor below, the drains filling with it until the intensity lowers and with one last twitch, your flow stops.");
				}
				else
				{
					output("your cock erupts, [pc.cum] pouring out like a [pc.cumcolor] tsunami, splashing against the floor below until there's no floor left and your cum is just splashing against more of your cum, the drains unable to contain the contents of your [pc.balls].");
				}
			}
		}
		output("\nContent, you roll onto your back and smile. You swallow the last of the load in your mouth, licking your lips as you do so. <i>“Mmm that was great boys. I hope you come back soon”</i>. <i>“Mmm, we will”</i> the Raskval respond, cocks wiggling and dripping cum as they scurry out the door.");	
		flags["PREG_RASK_RETURNED_RASKGANG_CONSENT"] = true;
	}
	else
	{
		if (pc.hasVagina())
		{
			output("You feel the boiling dicks in your passages stiffen and thump against eachother through the thin wall between your backdoor and asshole and with each pulsation cum shoots against your insides, flooding you with their unwanted cum.");
			output("As they do this, the Raskvel at your front lets out a long moan and says <i>“Ooh, I hope you're ready for my cum”</i>. As you squeal in protest, his salty load fires against the back of your throat, blocking your airways, your nose filled with his scent");
		}
		else
		{
			output("You feel the boiling dick in your ass stiffen and thump against the walls, with each pulsation firing against your insides, filling you with unwanted raskvel cum.");
			output("As this happens, the Raskvel at your front lets out a long moan and says <i>“Ooh, I hope you're ready for my cum”</i>. As you squeal in protest, his salty load fires against the back of your throat, blocking your airways, your nose filled with his scent");
			output("As you protest and squeal, the third Raskvel fires his hot load, covering your red spit-covered face and chest.");
		}
		
		if (pc.hasCock())
		{
			if (pc.hasCocks() > 1)
			{
				output(" As they release their cum, ");
				if (cummed < 5)
				{
					output("your cocks jerk back uncontrollably, pushed to the edge despite your retaliations and you feel beads of cum dripping from the ends.");
				}
				else if (cummed < 50)
				{
					output("your cocks jerk back, pushed to the edge despite your retaliations and several small bursts of cum splash onto the floor below.");
				}
				else if (cummed < 200)
				{
					output("your cocks jerk back, pushed to the edge despite your retaliations and several intense bursts of cum fire from each one onto the floor below.");
				}
				else if (cummed < 1000)
				{
					output("your cocks jerk back, pushed to the edge despite your retaliations and several intense bursts of cum spurt from each one, firing onto the floor one after the other until they stop, with a puddle of your [pc.cum] left on the floor below.");
				}
				else if (cummed < 3000)
				{
					output("your cocks jerk back, pushed to the edge despite your retaliations, [pc.cum] pouring out in waves of [pc.cumcolor], splashing against the floor below, the drains filling with it until the intensity lowers and with one last twitch, your flow stops.");
				}
				else
				{
					output("your cocks jerk back, pushed to the edge despite your retaliations, [pc.cum] pouring out like a [pc.cumcolor] tsunami, splashing against the floor below until there's no floor left and your cum is just splashing against more of your cum, the drains unable to contain the contents of your [pc.balls].");
				}
			}
			else
			{
				output(" As they release their cum, ");
				if (cummed < 5)
				{
					output("your cock jerks back, pushed to the edge despite your retaliations beads of cum dripping out the end onto the floor below.");
				}
				else if (cummed < 50)
				{
					output("your cock jerks back, pushed to the edge despite your retaliations and fires several shorts spurts of cum onto the floor below.");
				}
				else if (cummed < 200)
				{
					output("your cock jerks back, pushed to the edge despite your retaliations and several intense bursts of cum fire from it's tip onto the floor below.");
				}
				else if (cummed < 1000)
				{
					output("your cock jerks back, pushed to the edge despite your retaliations and several intense bursts of cum spurt from the end, firing onto the floor in bursts, until a puddle of your [pc.cum] is left on the floor below.");
				}
				else if (cummed < 3000)
				{
					output("your cock jerks back, pushed to the edge despite your retaliations, [pc.cum] pouring out in waves of [pc.cumcolor], splashing against the floor below, the drains filling with it until the intensity lowers and with one last twitch, your flow stops.");
				}
				else
				{
					output("your cock jerks back, pushed to the edge despite your retaliations, [pc.cum] pouring out like a [pc.cumcolor] tsunami, splashing against the floor below until there's no floor left and your cum is just splashing against more of your cum, the drains unable to contain the contents of your [pc.balls].");
				}
			}
		}
		output("\nHaving forced themselves upon you to completion, the raskvel gangbangers scamper off out the door, laughing, leaving you tied, demeaned and full of their cum.");
		flags["PREG_RASK_RETURNED_RASKGANG_CONSENT"] = false;
		soreDebuff(3);
	}
	
	if (pc.hasVagina())
	{
		pc.loadInCunt(chars["RASKVEL_MALE"],pc.vaginas[pc.biggestVaginaIndex()]);
	}
	else
	{
		pc.applyCumSoaked();
	}
	pc.loadInAss(chars["RASKVEL_MALE"]);
	pc.loadInMouth(chars["RASKVEL_MALE"]);
	pc.orgasm();
	processTime(20);
	pc.energy(-10);
	pc.lust(-60);
	
	if (consent){addButton(0, "Next", mainGameMenu);}
	else{addButton(0, "Next", denRestMistaken_Untie);}
}

public function denRestMistaken_Untie():void
{
	processTime(40);
	clearMenu();
	clearOutput();
	showPregRaskReturn();
	
	output("After 40 minutes of waiting the Broodmother shoots awake from her slumber and notices you tied up. She waddles over and cackles <i>“Ahaha, looks like you got my wakeup call instead. It's a shame but seeing you like this makes it worth it”</i> before freeing you from your binds.");
	addButton(0, "Next", mainGameMenu);
}

//--Entering, exiting and helper methods--------------------------------

public function denEntryAvailable():Boolean
{
	if (flags["AZRA_TARKUSED"] == undefined) return false;
	if (flags["AZRA_TARKUSED"] == 1) return true;
	return false;
}

public function getLastSatisfied():int
{
	return flags["PREG_RASK_RETURNED_LASTSATISFIED"];
}

public function increaseBroodmotherLibido(increaseBy:int):void
{
	var oldL:int = getBroodmotherLibido();
	if ((getBroodmotherLibido() + increaseBy) > 100)
	{
		flags["PREG_RASK_RETURNED_LIBIDO"] = 100;
	}
	else if ((getBroodmotherLibido() + increaseBy) <= 0)
	{
		flags["PREG_RASK_RETURNED_LIBIDO"] = 0;
	}
	else
	{
		flags["PREG_RASK_RETURNED_LIBIDO"] = getBroodmotherLibido() + increaseBy;
	}
	var newL:int = getBroodmotherLibido();
	
	// Libido effect on thickness
	var lvlC:int;
	if (oldL < newL)
	{
		lvlC = Math.floor(newL / 20) - Math.floor(oldL / 20);
		addBroodmotherThickness(lvlC * 10);
	}
	else
	{
		lvlC = Math.floor(oldL / 20) - Math.floor(newL / 20);
		addBroodmotherThickness(-(lvlC * 10));
	}
	
	flags["PREG_RASK_RETURNED_LASTSATISFIED"] = (GetGameTimestamp() / 1440);
}

public function updateBroodmotherLibidoLevel():void
{
	if (getLastSatisfied() < (GetGameTimestamp()/1440) - 7)
	{
		var rem:int = getBroodmotherLibido() % 20;
		if (!rem == 0)
		{
			if (rem <= 10)
			{
				flags["PREG_RASK_RETURNED_LIBIDO"] -= rem;
			}
			else{
				flags["PREG_RASK_RETURNED_LASTSATISFIED"] -= (5 + ((GetGameTimestamp()/1440) - getLastSatisfied()));
			}
		}
	}
}

public function getBroodmotherThickness():int
{
	return flags["PREG_RASK_RETURNED_THICKNESS"];
}

public function addBroodmotherThickness(increaseBy:int):void
{
	if ((getBroodmotherThickness() + increaseBy) > (50 + (getBroodmotherLibidoLevel() * 10)))
	{
		flags["PREG_RASK_RETURNED_THICKNESS"] = (50 + (getBroodmotherLibidoLevel() * 10));
	}
	else if ((getBroodmotherThickness() + increaseBy) > 100)
	{
		flags["PREG_RASK_RETURNED_THICKNESS"] = 100;
	}
	else if ((getBroodmotherThickness() + increaseBy) < 0)
	{
		flags["PREG_RASK_RETURNED_THICKNESS"] = 0;
	}
	else
	{
		flags["PREG_RASK_RETURNED_THICKNESS"] += increaseBy;
	}	
}

public function setupBroodmother():void
{
	if (flags["PREG_RASK_RETURNED_LIBIDO"] == undefined)
	{
		flags["PREG_RASK_RETURNED_LIBIDO"] = 15;
	}
	if (flags["PREG_RASK_RETURNED_BODYTYPE"] == undefined)
	{
		flags["PREG_RASK_RETURNED_BODYTYPE"] = []; // Can add FUTA, TREATED
	}
	if (flags["PREG_RASK_RETURNED_LASTSATISFIED"] == undefined)
	{
		flags["PREG_RASK_RETURNED_LASTSATISFIED"] = 0;
	}
	if (flags["PREG_RASK_RETURNED_THICKNESS"] == undefined)
	{
		flags["PREG_RASK_RETURNED_THICKNESS"] = 0;
	}
}

public function getBroodmotherLibido():int
{
	return flags["PREG_RASK_RETURNED_LIBIDO"];
}

//0-5, 0/20/40/60/80/100 libido, cannot deterorate below last met
public function getBroodmotherLibidoLevel():int
{
	return Math.floor(getBroodmotherLibido() / 20);
}

public function isBroodmotherFuta():Boolean
{
	return flags["PREG_RASK_RETURNED_BODYTYPE"].indexOf("FUTA") != -1;
}

public function isBroodmotherTreated():Boolean
{
	return flags["PREG_RASK_RETURNED_BODYTYPE"].indexOf("TREATED") != -1;
}


public function denEntry():void
{	
	if (denEntryAvailable())
	{
		setupBroodmother();
		
		addButton(0, "Use intercom", denEntryIntercom);
	}
	else
	{
		addDisabledButton(0, "Use intercom", "You think to yourself that the owner probably doesn't want unwarranted guests, given the security door.");
	}
}

public function denEntryIntercom():void
{
	clearOutput();
	clearMenu();
	author("Other");

	output("You approach the glowing breen button and hold it down.\n");
	
	if (hours < 4 || hours > 22)
	{
		output("You announce yourself, but there's no response.");
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		if (flags["PREG_RASK_RETURNED_BEFORE"] == undefined)
		{
			if (flags["PREG_RASK_GUARD_RESULT"] == 3 && pc.isBimbo())
			{
				output("<i>“Heyyy, it's Miss Superpuss”</i> you shout excitedly into the intercom, recalling when you and your bestie Azra met the Broodmother when looking for those sweet sweet Motherhusks.");
			}
			else
			{
				output("<i>“Hi, it's " + pc.mf("Mr.","Ms.") + " Steele”</i>, you announce to the intercom, recalling when you last left here with Azra.\n");
			}
			
			output("<i>“Oh, it's you”</i>, a voice spiritlessly says from the intercom. <i>“Come in if you must but I wont forgive you for what you've taken from me." + (flags["RASKDOOR_BROKE"] == 1 ? " Just move past the door and put it back afterwards - I could do without the sunlight.”</i>\nAs the intercom cuts out you shift the broken security door out of the way, step into the den and slide the door back across the entrance." : "”</i> As the intercom cuts out the door opens inviting you in. You step in and the door slides shut behind you, sealing all natural light out of the room."));
		}
		else
		{
			var lvl:int = getBroodmotherLibidoLevel();
			switch (lvl)
			{
				case 0:
					output((rand(1) == 1 ? "<i>“Guess who's back?”</i> you say into the intercom." : "<i>“I'm back”</i> you state to the intercom.") + " <i>“Steele... Whatdyya want?”</i> the Broodmother dejectedly responds in a low murmur " + (flags["RASKDOOR_BROKE"] == 1 ? "as you slide the door out the way of the doorway and enter the den." : " as the doorway beeps open and you step inside."));
					break;
				case 1:
					output((rand(1) == 1 ? "<i>“Guess who's back?”</i> you say into the intercom." : "<i>“I'm back”</i> you state to the intercom.") + " <i>“You again! You better have brought those 'shrooms!”</i> the Broodmother frustratedly responds " + (flags["RASKDOOR_BROKE"] == 1 ? "as you slide the door out the way of the doorway and enter the den." : " as the doorway beeps open and you step inside."));
					break;
				case 2:
					output((rand(1) == 1 ? "<i>“Guess who's back?”</i> you say into the intercom." : "<i>“I'm back”</i> you state to the intercom.") + " <i>“Ah Steele, get in here”</i> the Broodmother shouts in response, excited to be feeling more like her old self. " + (flags["RASKDOOR_BROKE"] == 1 ? "as you slide the door out the way of the doorway and enter the den." : " as the doorway beeps open and you step inside."));
					break;
				case 3:
					output((rand(1) == 1 ? "<i>“Guess who's back?”</i> you say into the intercom." : "<i>“I'm back”</i> you state to the intercom.") + (pc.hasCock() ? " <i>“Ahh Steele, come on in”</i> the Broodmothers lurid voice responds" : " <i>“Ahh Steele, I hope you've brought some cock”</i> the Broodmothers lurid voice responds") + (flags["RASKDOOR_BROKE"] == 1 ? " as you slide the door out the way of the doorway and enter the den." : " as the doorway beeps open and you step inside."));
					break;
				case 4:
					if (pc.hasCock())
					{
						output((rand(1) == 1 ? "<i>“Hope you left some room?”</i> you announce to the intercom." : "<i>“Room for one more?”</i> you announce to the intercom.\n"));
					}
					else
					{
						output((rand(1) == 1 ? "<i>“Up for some fun?” you whisper into the intercom</i>" : "<i>“Ready for more?”</i> you announce through the intercom.\n"));
					}
					
					if (pc.hasCock() && pc.cockTotal() > 1)
					{
						output("<i>“Room for your cocks”</i> she moans in response.");
					}
					else if (pc.hasCock())
					{
						output("<i>“Room for your cock”</i> she moans in response.");
					}
					else 
					{
						output("<i>“Ah Steele, I was just thinking about you.”</i> she moans in response. <i>“My pussys feeling rather in need of some attention”</i>");
					}
					if (pc.libido() >= 70 || pc.lust() >= 50 || pc.isBimbo())
					{
						output(" She doesn't have to tell you twice.\n")
					}
					output((flags["RASKDOOR_BROKE"] == 1 ? "You slide the door out the way of the doorway and enter the den." : "The doorway beeps open and you step inside."));
					break;
				case 5:
					if (pc.hasCock())
					{
						output((rand(1) == 1 ? "<i>“Hope you left some room?”</i> you announce to the intercom." : "<i>“Room for one more?”</i> you announce to the intercom.\n"));
					}
					else
					{
						output((rand(1) == 1 ? "<i>“Up for some fun?” you whisper into the intercom</i>" : "<i>“Ready for more?”</i> you announce through the intercom.\n"));
					}
					
					if (pc.hasCock())
					{
						output("Hurried begging comes from the intercom,<i>“Fuck me over and over Steele, give me your [pc.cocks]”</i>.\n");
					}
					else 
					{
						output("Exasperated begging comes from the intercom,<i>“Ah Steele, please, pleasure my gaping birth hole”</i>.\n");
					}
					if (pc.libido() >= 70 || pc.lust() >= 50 || pc.isBimbo())
					{
						output("She doesn't have to tell you twice.\n")
					}
					output("You walk through the door, which has now been left ajar for more people to discover her.")
					if (flags["PREG_RASK_RETURNED_DOORLESS"] == undefined)
					{
						flags["PREG_RASK_RETURNED_DOORLESS"] = true;
					}
					break;
			}
		}
		clearMenu();
		addButton(0, "Next", move, "BROOD_DEN");
	}
}

public function denLeave():void
{
	clearOutput();
	author("Other");

	var lvl:int = getBroodmotherLibidoLevel();
		
	output("Your shoes clunk along the metal floor as you walk towards the exit. \n");
	
	var libidoInc:Boolean = false;
	if (getLastSatisfied() == (GetGameTimestamp() / 1440))
	{
		libidoInc = true;
	}
	switch (lvl)
	{
		case 1:
			output((libidoInc ? "<i>“Suit ya'self ”</i> the oversized Raskvel murmurs from behind." : "<i>“Where ya' going?”</i> the oversized Raskvel murmurs from behind."));
			break;
		case 2:
			output((libidoInc ? "<i>“Are you sure ya don't want more?”</i> the oversized Raskvel murmurs from behind." : "<i>“Leaving again so soon?”</i> the Broodmother murmurs from behind."));
			break;
		case 3:
			output((libidoInc ? "<i>“Are you sure ya don't want more?”</i> the oversized Raskvel slurs from behind, as she rolls to watch you leave." : "<i>“Don't ya want to stay?”</i> the Broodmother murmurs from behind, rubbing her pregnancy-swollen teats."));
			break;
		case 4:
			output((libidoInc ? "<i>“Are you sure? I have room still”</i> you hear from behind." : "<i>“Are you sure you want to leave?”</i> the Broodmother slurs from behind, spreading her legs."));
			break;
		case 5:
			output((libidoInc ? "<i>“Don't go, there's room in mah belly”</i> the oversized Raskvel moans from behind, juices dripping from her pussy." : (pc.hasCock() ? "<i>“Please, give me babies!”</i> the Broodmother shouts from atop her paunch." : "<i>“Please, don't go! I can't reach my pussy by myself”</i> the Broodmother shouts from atop her paunch.")));
			break;
	}
	
	if (lvl >= 3 && (pc.libido() >= 70 || pc.lust() >= 50) && libidoInc)
	{
		output("\n\nYou turn as you hear her. <b>You can't turn her down.</b>")
		clearMenu();
		addButton(0, "Next", denInside);		
	}
	else if (lvl >= 3 && pc.isBimbo() && libidoInc)
	{
		output("\n\nYou turn as you hear her. <b>You can't turn down a fellow gal in need.</b>")
		clearMenu();
		addButton(0, "Next", denInside);	
	}
	else
	{
		output("\nYou press the exit button and the door hums open. A second later you step out into the sunlight.");

		clearMenu();
		addButton(0, "Next", move, "249");
	}
}

public function denEntryLeave():void
{
	clearOutput();
	clearMenu();
	author("Other");

	output("You turn your back to the door and step between the orange walls once more.");

	processTime(2);

	clearMenu();
	addButton(0, "Next", move, "249");
}