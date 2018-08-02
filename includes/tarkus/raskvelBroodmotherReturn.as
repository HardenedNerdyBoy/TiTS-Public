import classes.ItemSlotClass;
import classes.Items.Drinks.RaskvelBroodmotherMilkBottle;
import classes.Items.Drinks.RaskvelBroodmotherMilkBucket;
// Functions for non-event RaskvelBroodmother, i.e returning to her if you ended on good terms
//
// TODO: Explain levels 
	

public function showPregRaskReturn():void
{
	var bustStr:String = "PREGRASK_";
	var nameStr:String = "";
	
	switch (getBroodmotherImpregnationLevel())
	{
		case 0:
			bustStr += "LVL0";
			nameStr = "FORMER\nBROODMOTHER";
			break;
		case 1:
			bustStr += "LVL1";
			nameStr = "RASKVEL\nBROODMOTHER";
			break;
		case 2:
			bustStr += "LVL2";
			nameStr = "PREGNANT\nBROODMOTHER";
			break;
		case 3:
			bustStr += "LVL3";
			nameStr = "PREGNANT\nBROODMOTHER";
			break;
		case 4:
			bustStr += "LVL4";
			nameStr = "PREGNANT\nBROODMOTHER";
			break;
		case 5:
			bustStr += "LVL5";
			nameStr = "PREGNANT\nBROODMOTHER";
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
	showName(nameStr);
}

public function approachBroodmother():void
{
	showPregRaskReturn();
	author("Other");
	
	clearMenu();
	clearOutput();
	
	var lvl:int = getBroodmotherImpregnationLevel();
	
	if (lvl == 0)
	{
		if (pc.isBimbo())
		{
			output("You approach the poor girl, who's face is super glum from not enough fucking and not enough babies.\n");
		}
		else
		{
			output("You approach her and as you do she whimpers <i>“You took it all from me! I can't get any cock anymore”</i>.\n");
		}
		addButton(1, "Talk", talkBroodmother, undefined, "Talk", "Have a conversation with her..");
		addButton(14, "Leave", mainGameMenu);
	}
	else if (lvl == 1)
	{
		output("You approach her and as you do she moans ");
		if (pc.hasCock())
		{
			output("<i>“Those balls of yours look pretty full. Wouldn't it be good if someone were to drain them?”</i>");
		}
		else
		{
			output("<i>“Don't suppose you know anyone with a cock who wants to come and fill me up?”</i>");
		}
		addButton(1, "Talk", talkBroodmother, undefined, "Talk", "Have a conversation with her..");
		addButton(14, "Leave", mainGameMenu);
	}
	else if (lvl >= 2)
	{
		output("The swollen Raskvel teases herself as you approach");
		if (isBroodmotherTreated())
		{
			output(", milk pouring from her udders as she squeezes them");
		}
		else
		{
			output(", milk dripping from her breasts as she rubs them");
		}
		
		if (isBroodmotherFuta())
		{
			output(", her semi-hard cock dangling from its slit");
		}
		else
		{
			output(" and her girl-cum");
			if (isBroodmotherTreated())
			{
				output(" sloshing into the drains below");
			}
			else
			{
				output(" dripping into the drains below");
			}
		}
	}
		
	if (pc.isBimbo()) output(". Unsuprising really, like, you're super fucking hot.\n");
	else output(".\n");
	
	output("<i>“Oh fuck you're back”</i> she moans, rubbing her ");	
	var randomBodyPartArray:Array = new Array();
	if (isBroodmotherTreated())
	{
		randomBodyPartArray.push("bursting udders");
	}
	else
	{
		randomBodyPartArray.push("motherly breasts");
	}
	if (isBroodmotherFuta())
	{
		randomBodyPartArray.push("hardening blue cock");
	}
	randomBodyPartArray.push("experienced baby-making cunt");
	
	output(randomBodyPartArray[rand(randomBodyPartArray.length)] + ".");
	
	if ((pc.libido() >= 70 || pc.lust() >= 50) && lvl >= 2)
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
	
	addButton(0, "Appearance", broodMotherAppearance);
	if (pc.lust() >= 33)
	{
		addButton(2, "Sex", broodMotherSexOpts, undefined, "Sex", "Fuck her");
	}
	else
	{
		addDisabledButton(2, "Sex", "Have fun with her", "You're not turned on enough for this");
	}
	
	if ((pc.isBimbo() || (StatTracking.getStat("pregnancy/total births") >= 10)) && (getLastImpregnated() != 0)) //If a bimbo or really like getting knocked up
	{
		addButton(3, "Join", joinBroodmother, undefined, "Join", "Ask to live with her and live her lifestyle.");
	}
	else if (getLastImpregnated() == 0)
	{
		addDisabledButton(3, "Join", "Join", "You don't even know what she does here anymore.");
	}
	else
	{
		addDisabledButton(3, "Join", "Join", "You don't think her lifestyle would suit you. That and it'd really get in the way of your mission.");
	}
	
	addButton(13, "Give item", giveBroodMotherItem, undefined, "Give item", "Give her something other than you.");	
}

public function broodMotherAppearance():void
{
	clearOutput();
	clearMenu();
	
	var lvl:int = getBroodmotherImpregnationLevel();
	
	if (lvl == 0)
	{
		output("The purple raskval ex-broodmother is sat mopily next to her unused supports, her belly no longer big enough to require them.\n");
	}
	else if (lvl == 1)
	{
		output("The raskval broodmother is sat at her desk on a juice-stained chair, her computer displaying a mixture of emails and porn.\n");
	}
	else if (lvl == 2)
	{
		output("The pregnant raskval broodmother is sat at her desk chair, stroking her belly and swivelled around looking at you.\n");
	}
	else
	{
		output("The purple raskval broodmother lies atop her supports, required to hold her ");
		
		switch(lvl)
		{
			case 1: 
				"ready ";
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
		
		output("belly");
		if (isBroodmotherTreated())
		{
			output(" complete with pink lactating udders");
		}
		output(".\n");
	}
	
	output("She has a ");
	switch(lvl)
	{
		case 0: 
			output("glum");
			break;
		case 1: 
			output("cock-hungry");
			break;
		case 2: 
			output("lustful");
			break;
		case 3: 
			output("sex-obsessed");
			break;
		case 4: 
			output("euphoric");
			break;
		case 5: 
			output("broken");
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
		output("one " + getBroodmotherFutaCockDesc() + ", extending from it's slit and an oversized cum-pouch. ");
		output("Alongside that there's ");
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
	
	var isSlut:Boolean = ((pc.isTreated() && pc.isBimbo()) || pc.isBimbo() || pc.isBro() || pc.isDependant(Creature.DEPENDANT_CUM) || (pc.libido() >= 50 && pc.lust() >= 33) || pc.lust() > 66);
	
	output("You rummage in your inventory, looking for something to ");
	
	if (getBroodmotherImpregnationLevel() == 0)
	{
		output("lift her spirits.");
	}
	else
	{
		output("please her.");
	}
	
	var currentButtonIndex:int = 0;
	
	// Motherhusk
	if (pc.hasItemByClass(Motherhusk) && isBroodmotherBroken())
	{
		addButton(currentButtonIndex, "Motherhusk", giveMotherhusk);
		currentButtonIndex++;
	}
	else
	{
		if (isBroodmotherBroken())
		{
			addDisabledButton(currentButtonIndex, "Motherhusk", "You don't have any");
			currentButtonIndex++;
		}
	}
	
	// You'd have to be a slut and like the treatment to risk breaking the law by giving her treatment
	if (pc.hasItemByClass(Treatment) && !isBroodmotherTreated() && isSlut && pc.isTreated() && !isBroodmotherBroken())
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
			else if (isBroodmotherBroken())
			{
				addDisabledButton(currentButtonIndex, "Treatment", "She's not happy enough to accept this");
			}
			else if (isSlut)
			{
				addDisabledButton(currentButtonIndex, "Treatment", "You'd have to be sex obsessed to break the law for this.");
			}
			else if (!pc.isTreated())
			{
				addDisabledButton(currentButtonIndex, "Treatment", "You're not sure about the treatment.");
			}
			currentButtonIndex++;
		}
	}
	
	// Food
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
	
	if (pc.hasItemByClass(Throbb) && !isBroodmotherFuta() && !isBroodmotherBroken())
	{
		addButton(currentButtonIndex, "Throbb", giveThrobb);
		currentButtonIndex++;
	}
	else
	{
		if (isBroodmotherBroken())
		{
			addDisabledButton(currentButtonIndex, "Throbb", "She's not happy enough to accept this");
		}
		else if (!isBroodmotherFuta())
		{
			addDisabledButton(currentButtonIndex, "Throbb", "You don't have any");
		}
		currentButtonIndex++;
	}
	
	addButton(14,"Leave",approachBroodmother);
}

public function giveThrobb():void
{
	clearMenu();
	clearOutput();
	
	if (getBroodmotherImpregnationLevel() == 1)
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
		output(" you tell the ravskal mama that it'll help her get cock. Delighted with the sound of that she ushers you to give her the throbb.\nYou pass the vial to her and she eagerly downs it. Pleased with your handywork you step back to watch the transformation unfold.\n\n");
		output("Roughly ten seconds later she cries out <i>“What's happening?! It feels so tingly!”</i> drawing her hand to just under her bulging belly. Her belly wobbles and you notice it shift up slightly as a mound of flesh has grown above her swollen pussy. ")
		output("It keeps growing, getting more bulgy until it falls in on itself, leaving the broodmother with a <b>genital slit</b>. The bottom of the pouch bulges, growing larger and larger, blocking her pussy from view until a <b>testicle pouch</b> hangs between her legs.\n")
		output("<i>“I demand you tell me what is happening [pc.name]!”</i> shrieks the broodmother, seemingly unable to see past her paunch. She suddenly gasps and lets out a moan, as her new slit is pushed open and a blue clit pokes itself out. No, not a clit. It continues to grow becomer thicker and longer, curving back on itself. As it passes into the broodmothers view her eyes glaze over. It keeps growing before stopping just under her breasts. She has grown a <b>14 inch long, blue raskvel cock</b>.");
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
		output("as this happens before giggling <i>“I see what you mena now by helping me get cock”</i>. <i>“You better take responsibility for this though”</i> she smirks.");
		flags["PREG_RASK_RETURNED_BODYTYPE"].push("FUTA");
		showPregRaskReturn();
		addButton(0,"Continue",giveBroodMotherItem);
	}
	else
	{
		output("<i>“That sounds amazing but sadly I can't take anything when I'm this pregnant”</i> the broodmother sighs.");
		addButton(0,"Back",giveBroodMotherItem);
	}
}

public function giveMotherhusk():void
{
	clearMenu();
	clearOutput();
	
	if (getBroodmotherImpregnationLevel() == 0)
	{
		output("<i>“A motherhusk! You're really going to help me”</i> she squeals in delight");
	}
	output(" before gathering the motherhusks from your hand and swallowing them whole. As you do the broodmother transforms in front of your very eyes, regaining some of her previous mass and a smile returning to her face.");
	pc.destroyItemByClass(Motherhusk, 1);
	addButton(0, "Continue", giveBroodMotherItem);
	fixBroodmother();
	showPregRaskReturn();
}

public function giveTreatment():void
{
	clearMenu();
	clearOutput();
	output("As you take a treatment medipen of your backpack, the raskvel asks you what it is.\n<i>“Oh this thing”</i>, you exclaim. <i>“This thing is the best thing ever! It'll make you a really great mommy and it makes sex so good.”</i>\n\n")
	var lvl: int = getBroodmotherImpregnationLevel();
	if (lvl >= 2)
	{
		output("<i>“That sounds amazing but sadly I can't take anything when I'm this pregnant”</i> the broodmother sighs.");
		addButton(0,"Back",giveBroodMotherItem);
	}
	else
	{
		output("Her scowl transforms into a grin. <i>“Well then what are we waiting for!”</i>");
		output("\nYou grab the raskvel by the arm and push the medipen into her, releasing the treatment into her.");
		output("\n<i>“Well what now?”</i> she says excitedly. <i>“Well it'll take a while to kick in, so see you in a week!”</i> you laugh, turning towards the door.");
		output(" As you step outside, you look over your shoulder, ");
		if (pc.isBimbo())
		{
			output("catching a last glimpse of the lucky gals excited face.");
		}
		else if (pc.isBro())
		{
			output("catching a last glimpse of the raskvel cumdumps excited face.");
		}
		else if (pc.isMischievous())
		{
			output("catching a last glimpse of her excited face. She doesn't know what's coming.");
		}
		else
		{
			output("catching a last glimpse of the broodmothers excited face.");
		}
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
		if (pc.isBimbo())
		{
			output("Happy to hear the treatment has worked, you skip inside, eager to see how happy she is!\n");
		}
		else if (pc.isBro())
		{
			output("Happy to hear the treatment has worked, you strut inside, eager to see how much hotter she is now.\n");
		}
		else if (pc.isMischievous())
		{
			output("Happy to hear the treatment has worked, you laugh to yourself and go inside, eager to see the shocked look on her face.\n");
		}
		else
		{
			output("Happy to hear the treatment has worked, you go inside, eager to witness her changes.\n");
		}
	}
	else if (flags["RASKDOOR_BROKE"])
	{
		if (pc.isBimbo())
		{
			output("Happy to hear the treatment has worked, you push the door out the way and skip inside, eager to see how happy she is!\n");
		}
		else if (pc.isBro())
		{
			output("Happy to hear the treatment has worked, you push the door out the way and strut inside, eager to see how much hotter she is now.\n");
		}
		else if (pc.isMischievous())
		{
			output("Happy to hear the treatment has worked, you push the door out the way. You laugh to yourself and go inside, eager to see the shocked look on her face.\n");
		}
		else
		{
			output("Happy to hear the treatment has worked, you push the door out the way and go inside, eager to witness her changes.\n");
		}
	}
	else
	{
		if (pc.isBimbo())
		{
			output("It sounds like the treatments worked. <i>“It's [pc.name]”</i>, you announce. <i>“Let me in, hun, I want to see what wonderful stuff has happened to you!”</i>. <i>“[pc.name], come in quick, you're going to love what's happened to me”</i> she moans, as the door slides open and you eagerly skip inside.\n");
		}
		else if (pc.isBro())
		{
			output("It sounds like the treatments worked. You lean into the intercom, saying <i>“Hey slut, how're you doing?”</i>. <i>“[pc.name], I think there's something new here that you'd like to see”</i> she moans, as the door slides open and you strut inside.\n");
		}
		else if (pc.isMischievous())
		{
			output("It sounds like the treatments worked. Stifling a laugh you lean into the microphone <i>“It's [pc.name], are you alright in there?”</i>. <i>“[pc.name], come in quick, something's happened!”</i> she moans, as the door slides open and you walk inside.\n");
		}
		else
		{
			output("It sounds like the treatments worked. <i>“It's [pc.name]”</i>, you announce. <i>“How're you doing? Anything happened?”</i>. <i>“[pc.name], come in quick, you've got to see me now”</i> she says, as the door slides open and you walk inside.\n");
		}
	}
	
	addButton(0,"Continue",giveTreatment_3);
}

public function giveTreatment_3():void
{
	clearMenu();
	clearOutput();
	
	pc.lust(10);
	addBroodmotherThickness(-5);
	pc.destroyItemByClass(Treatment, 1);
	flags["PREG_RASK_RETURNED_BODYTYPE"].push("TREATED");
	
	showPregRaskReturn();
	
	output("<i>“Thanks [pc.name]”</i> you hear as you enter the den. <i>“This is magnificent”</i>.");
	output("As your eyes adapt to the sunlight you lay eyes on the new and improved broodmother. Her belly is now bulgier and adorned with a plethora of long, swollen teats which are currently dribbling milk, leaving long milky streaks down her belly. They're inverted towards the center. <b>She has grown udders, fuckable nipples and has increased milk production.</b>")
	output("As you breath in, the scent of her girl-cum hits you. You look down and notice her even <b>wetter</b> pussy is now <b>even plumper</b> and coated in <b>juice-covered blue pubic hair</b>. <b>Her clits have also become swollen</b> to the point that they're stretching her out slightly.");
	output("\n\nRaising your head to look at her now <b>horn-topped face</b> you smile at her. <i>“Well what d'ya think?”</i> she moans, smiling back.\n");
	
	if (pc.isBimbo())
	{
		output("<i>“You're like, so totally fucking hot now”</i>");
	}
	else if (pc.isBro())
	{
		output("<i>“Damn, your tits got even better”</i>");
	}
	else if (pc.isMischievous())
	{
		output("<i>“You're hotter, but still not as hot as me”</i>");
	}
	else
	{
		output("<i>“You're even hotter now”</i>");
	}
	
	if (!pc.isMischievous())
	{
		if(pc.hasCocks())
		{
			output(" you say, stroking your [pc.cocks]" + (pc.isCrotchExposed() ? "" : "through your [pc.underGarments]") + ".");
		}
		else if(pc.hasCock())
		{
			output(" you say, stroking your [pc.cock]" + (pc.isCrotchExposed() ? "" : "through your [pc.underGarments]") + ".");
		}
		else if (pc.hasVaginas())
		{
			output(" you say, rubbing your [pc.vaginas]" + (pc.isCrotchExposed() ? "" : "through your [pc.underGarments]") + ".");
		}
		else if (pc.hasVagina())
		{
			output(" you say, rubbing your [pc.vagina]" + (pc.isCrotchExposed() ? "" : "through your [pc.underGarments]") + ".");
		}
		else
		{
			output(" you say, rubbing your [pc.crotch]" + (pc.isCrotchExposed() ? "" : "through your [pc.underGarments]") + ".");
		}
	}
	else
	{
		output(" you say, trying your best not to rub your [pc.crotch]" + (pc.isCrotchExposed() ? "" : "through your [pc.underGarments]") + ".");
	}
	
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
		
	if (getBroodmotherThickness() >= (50 + (getBroodmotherImpregnationLevel() * 10)))
	{
		output("<i>“Naah, my belly's full”</i> the broodmother says, rejecting the food you offer her.");		
		addButton(0,"Continue",giveBroodmotherFoodMenu);
	}
	else
	{
		var food:String = args[0];
		var item:ItemSlotClass = args[1];
		
		output((rand(1) == 1 ? "She" : "The " + ((getBroodmotherImpregnationLevel() > 1 ? "" : "former ") + "broodmother ")));
		
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
				if (getBroodmotherImpregnationLevel() <= 1)
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
					if (getBroodmotherImpregnationLevel() > 1 || getBroodmotherThickness() > 60)
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
		if (getBroodmotherImpregnationLevel() > 1)
		{
			switch(getBroodmotherImpregnationLevel())
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
	
	var lvl:int = getBroodmotherImpregnationLevel();
	
	if (lvl < 2 && !pc.hasCock())
	{
		output("<i>“Sure, we can talk talk. It's not like you can knock me up or anything.”</i>.");
	}
	else 
	{
		output("<i>“Oh, I suppose we can just talk, I had my mind on something funner”</i>.");
	}
	
	addButton(0, "What she does", talkBroodmother_AskWhatDo);
	addButton(1, "Her past", talkBroodmother_AskPast);
	addButton(14, "Return", approachBroodmother);
}

public function talkBroodmother_AskWhatDo():void
{	
	clearMenu();
	clearOutput();
	
	var lvl:int = getBroodmotherImpregnationLevel();
	
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
			output("<i>“Well, I rent this place out to lodgers and I have some of the more attractive ones pump their babies into me as often as they can”</i> she says longingly.\n");
			break;
		case 2:
			output("<i>“Well, I rent this place out to lodgers who otherwise would be lost to the wasteland and some of the more attractive ones get invited back regularly to pump their babies into me - if I'm not already pregnant”</i> she says. <i>“Although if they do, I like to empty their cum into a bucket to save for later”</i>.\n");
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
			output("<i>“Well, all manner of lodgers turn up here and all I require as payment is that they fuck me and pump me full of their offspring</i> she says. <i>“Although if I'm already preggers, I like to empty their sticky loads into a bucket to save for later”</i>.\n");
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
			output("<i>“Well, all manner of lodgers turn up here and all I require from them is to fuck me and pump me full of their cum</i> she says. <i>“Although if I'm already preggers, I like to empty their cum into a bucket to put inside me later”</i>\n");
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
			output("<i>“Well, my door's gone missing”</i> she lies. <i>“So creatures come in from the wasteland and pump poor, defenceless, ol' me full of their cum and I can't do anything to stop it”</i>. <i>“Although if I'm already preggers, I like to empty their cum into a bucket to put inside me later”</i>\n");
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
	
	var lvl:int = getBroodmotherImpregnationLevel();
	
	if (getLastImpregnated() == 0)
	{
		output("<i>“Well before this, I was just another Raskvel, trying to make my way in this wasteland. One day as I was looking for food I found a shipwreck here in the sand. It was busted up and the electrics were a bit faulty but it was nothing I couldn't patch up.”</i>\n");
		output("<i>“I was gonna make this place my home and rent some of the space out to lodgers. Anyway, after I patched up holes in the exterior and restored the defences, I explored the interior. There were some small creatures here so I they had to go bye bye.”</i>\n");
		output("<i>“When I searched the bay, I found food - those lovely motherhusks. I snacked on them and over time they kicked in. At first I was soooo horny, so I flirted with some of the more attractive lodgers in order to relieve that. However as I continued eating them, I got even hornier and I just wanted everyone to empty their loads in me.”</i>");
	}
	else
	{
		
		output("<i>“Haha, nothing silly, I've always been up here, getting my pussy fucked and filled with babies”</i> she says, a look of bemusement on her face.\n");
	}
	
	addButton(0,"Return",talkBroodmother);
}

public function joinBroodmother():void{
	clearMenu();
	clearOutput();
	showPregRaskReturn();
	
	const JOINED_BABIES:int = 0;
	const JOINED_COCK:int = 1;
	var reason:int;
	if (pc.isBimbo()){
		reason = JOINED_COCK;
	}
	else
	{
		reason = JOINED_BABIES;
	}
	
	// Asking and explaining why you want to join her
	output("<i>“Heyy, can I join you?”</i> you ask hopefully. <i>“Haha, of course you can”</i> she cackles in response <i>“But why?”</i>. ");
	if (reason == JOINED_COCK){output("<i>“Well, watching you lying in here, getting fucked day in day out by random peeps. It looks real hot!”</i> you giggle. <i>“I want a piece of the pie!”</i>"); }
	else {output("<i>“Well, watching you lying in here, getting knocked up day in day out by random peeps and then having loads of babies. I want that!”</i> you shout."); }
	// Her agreeing
	output(" <i>“I know what you mean, it's a pretty good life”</i> she giggles. <i>“Alright [pc.name]. Sit down over there and I'll let whoever comes around know they're to bring some friends.”</i>");
	// Timeskip, getting fucked loving it
	output("\n\n<b>6 MONTHS LATER</b>\n\n");
	// Pick random known npc that sees you that's mischevous, rival/verusha/drbadger/petr+goldi/kiro
	
	kGAMECLASS.badEnd("GAME OVER");
}

//SEX----------------------------------------------------------------------------

public function broodMotherSexOpts():void
{
	author("Other");
	
	clearMenu();
	clearOutput();
	
	if (lvl < 2 && !pc.hasCock())
	{
		output("<i>“Oh? What like? It's not like you can knock me up or anything.”</i>.");
	}
	else 
	{
		output("<i>“Mmm, sounds great to me, what were you thinking of?”</i>.");
	}
	
	var lvl:int = getBroodmotherImpregnationLevel();
	var buttonNum:int = 0;
	
	if (pc.biggestCockVolume() > 700)
	{
		addButton(buttonNum, "Hyper Fun", hyperRaskFun_Return);
		buttonNum++;
	}
	else
	{
		addDisabledButton(buttonNum, "Hyper Fun", "Hyper Fun", "You need a huge penis for this.");
		buttonNum++;
	}

	if (pc.hasCock() && pc.cockThatFits(700) >= 0)
	{
		addButton(buttonNum, "Pussy fuck", fuckDatRaskipoo_Return, undefined, "Fuck Her", "Fill her with cum, regardless of whether it'll get her pregnant.");
		buttonNum++;
	}
	else if (pc.hasCock())
	{
		addDisabledButton(buttonNum, "Pussy fuck", "Fuck Her", "You’re too big to fit inside.");
		buttonNum++;
	}
	else
	{
		addDisabledButton(buttonNum, "Pussy fuck", "Fuck Her", "You have no penis to fuck her with.");
		buttonNum++;
	}

	if (pc.hasVagina())
	{
		if (lvl >= 2)
		{
			addButton(buttonNum,"Face Ride",faceRideTheRaskPreg_Return);
		}
		else
		{
			addDisabledButton(buttonNum,"Face Ride","Face Ride","She only wants cock right now");
		}
		buttonNum++;
	}
	else
	{
		addDisabledButton(buttonNum,"Face Ride","Face Ride","You need a vagina to rub on her face for this.");
		buttonNum++;
	}
	
	if (isBroodmotherTreated() && flags["PREG_RASK_RETURNED_LASTMILKED"] != int(GetGameTimestamp() / 1440))
	{
		addButton(buttonNum, "Milk her", milkBroodmotherReturn);
		buttonNum++;
	}
	else
	{
		if (isBroodmotherTreated() && flags["PREG_RASK_RETURNED_LASTMILKED"] == int(GetGameTimestamp() / 1440))
		{
			addDisabledButton(buttonNum, "Milk her", "Milk her", "You've done that too recently! She'll be dry as a bone, give her some time to recharge.");
			buttonNum++;
		}
	}
	
	if (isBroodmotherFuta())
	{
		if (pc.biggestVaginalCapacity() >= getBroodmotherFutaCockSize())
		{
			addButton(buttonNum, "Ride her cock", rideBroodmotherReturnFuta, "vagina");
		}
		else if (pc.analCapacity() >= getBroodmotherFutaCockSize())
		{
			addButton(buttonNum, "Ride her cock", rideBroodmotherReturnFuta, "anus");
		}
		else
		{
			addDisabledButton(buttonNum, "Ride her cock", "Ride her cock", "You don't have anything she can fit in.");
		}
		
		buttonNum++;
	}
	
	addButton(14,"Leave",approachBroodmother);
}

//inWhat is vagina or anus
public function rideBroodmotherReturnFuta(inWhat:String):void
{
	clearOutput();
	clearMenu();
	showPregRaskReturn();
	var lvl:int = getBroodmotherImpregnationLevel();
	
	// Remember, ALL of her gets bigger with levels.
	// 600@3 , 450@2, 300@1, 250@0
	if (pc.isSubby())
	{
		output("<i>“I was thinking mistress, couldn't that " + (getBroodmotherFutaCockSize() >= 450 ? "big cock" : "cock") + " of yours do with some service?”</i> you ask, " + (inWhat == "vagina" ? ((pc.isCrotchExposed() ? "dropping your [pc.crotchcovers], " : "") + "presenting her with your " + pc.vaginaDescript(pc.biggestVaginaIndex())) : (" bending over" + (pc.isCrotchExposed() ? " pulling down your [pc.assCovers]" : "") + " and presenting her with your [pc.asshole]")));
		
	}
	else if (pc.isBimbo())
	{
		output("<i>“I was thinking, wouldn't it be totally awesome if that " + (getBroodmotherFutaCockSize() >= 450 ? "big cock" : "cock") + " of yours saw some sexy sex too!?”</i> you ask, " + (inWhat == "vagina" ? ((pc.isCrotchExposed() ? "pulling down your [pc.crotchcovers], " : "") + "presenting her with your " + pc.vaginaDescript(pc.biggestVaginaIndex())) : (" bending over" + (pc.isCrotchExposed() ? " tugging down your [pc.assCovers]" : "") + " and presenting her with your [pc.asshole]")));
	}
	else if (pc.isBro())
	{
		output("<i>“Uhh I was just thinking, whilst your pussy is totally cool and all, shouldn't your " + (getBroodmotherFutaCockSize() >= 450 ? "big dick" : "dick") + " see some action too?”</i> you ask, " + (inWhat == "vagina" ? ((pc.isCrotchExposed() ? "pulling down your [pc.crotchcovers] and" : "") + "grabbing your " + pc.vaginaDescript(pc.biggestVaginaIndex())) : (" bending over" + (pc.isCrotchExposed() ? " tugging down your [pc.assCovers]" : "") + " and presenting her with your [pc.asshole], one hand on your butt")));
	}
	else if (pc.isMischievous())
	{
		output("<i>“Well, obviously your " + (getBroodmotherFutaCockSize() >= 450 ? "big juicy cock" : "juicy cock") + " needs some action too”</i> you state, " + (inWhat == "vagina" ? ((pc.isCrotchExposed() ? "pulling down your [pc.crotchcovers]," : "") + " drawing her attention to your " + pc.vaginaDescript(pc.biggestVaginaIndex())) : (" bending over" + (pc.isCrotchExposed() ? " tugging down your [pc.assCovers]" : "") + " and slapping your ass, showing off your [pc.asshole]")));
	}
	else
	{
		output("<i>“Well, I was just thinking, it's about time that " + (getBroodmotherFutaCockSize() >= 450 ? "big juicy cock" : "juicy cock") + " of yours got some attention”</i> you state, " + (inWhat == "vagina" ? ((pc.isCrotchExposed() ? "pulling down your [pc.crotchcovers]," : "") + " drawing her attention to your " + pc.vaginaDescript(pc.biggestVaginaIndex())) : (" bending over" + (pc.isCrotchExposed() ? " tugging down your [pc.assCovers]" : "") + " and presenting your [pc.asshole]")));
	}	
	output(".\nIn reaction the broodmothers eyes widen and she licks her lips, her cock extending further from its slit and hardening with a jolt. ");
	
	if (lvl >= 3)
	{
		output("She rolls off of her supportive structure and onto the cum-coated floor, tail wagging and turns to face you. With great effort she rolls herself backwards, swinging her ");
		if (getBroodmotherThickness() > 60)
		{
			if (getBroodmotherThickness() < 70)
			{
				output("fat, ");
			}
			else if (getBroodmotherThickness() < 80)
			{
				output("jiggling, ");
			}
			else if (getBroodmotherThickness() < 90)
			{
				output("gelatine-like, ");
			}
			else 
			{
				output("ssbbw-tier, ");
			}
		}
		output("baby-laiden belly up before it bounces back to the ground. She wraps her arms around it as best she can and holds it slightly off the floor, her cock springing out from underneath as it's given room to breath, so she is lying at a slight incline with her cock free to see and use. ");
	}
	else
	{
		output("She sits down on the ground, ");
		if (lvl != 0)
		{
			output("her ");
			if (getBroodmotherThickness() > 60)
			{
				if (getBroodmotherThickness() < 70)
				{
					output("round, ");
				}
				else if (getBroodmotherThickness() < 80)
				{
					output("fat, ");
				}
				else if (getBroodmotherThickness() < 90)
				{
					output("gelatine-like, ");
				}
				else 
				{
					output("ssbbw-tier, ");
				}
			}
			if (lvl == 2)
			{
				output("baby-laiden ");
			}
			output("belly jiggling as she does ");
		}
		output("and grabs her cock, wiggling it infront of you. ");
	}
	output("<i>“Come here then, I want you to hop on my big meaty cock so I can pound your ");
	if (inWhat == "vagina")
	{
		output("pussy until you're full of my cum");
	}
	else //anus
	{
		output("[pc.asshole] until you're full of my cum");
	}
	output("”</i>.");
	
	//Back into her, maybe your back bounces off her belly, logistics different if taur
	
	output("\nYou turn around and back up towards the ");
	if (lvl >= 2)
	{
		output("big ");
	}
	output("mama whilst looking over your shoulder. You step back towards her whilst wiggling your [pc.hips] as she ");
	if (lvl >= 3)
	{
		output("sits and ");
	}
	output("stares, mesmerized, with her dick in her hands. <i>“Mmmm come to mama”</i>. You saunter backwords towards her, ");
	if (pc.hasTail()){output("swishing your tail from side to side. You begin");}
	if (inWhat == "vagina")
	{
		output("slapping your pussy as you approach");
		var wetnessVag:int = pc.vaginas[pc.biggestVaginaIndex()].wetness();
		switch (wetnessVag)
		{
			case 0, 1, 2:
				output(", the sound of it reverberating around the tin-can room.");
				break;
			case 3:
				output(", the moist slapping sound reverberating around the room.");
				break;
			case 4:
				output(", the sounds of the wet impacts reverberating around the room.");
				break;
			default:
				output(", the sounds of the sodden impacts reverberating around the room, like someone jumping in a puddle.");
				break;
		}
	}
	else //anus
	{
		output("spreading your buttcheeks and slapping your");
		var wetnessButt:int = pc.ass.wetness();
		switch (wetnessButt)
		{
			case 0, 1, 2:
				output(" butthole as you approach.");
				break;
			case 3:
				output(" moist butthole as you approach, the sound reverberating around the room.");
				break;
			case 4:
				output(" slimy butthole as you approach, the sound of your hand hitting your moist backdoor reverberating around the room.");
				break;
			default:
				output(" soaking butthole as you approach, the sound of your hand slapping against your wet backdoor reverberating around the room, like someone jumping in a puddle.");
				break;
		}
	}
	
	if (lvl >= 2)
	{
		output("\nYou back up a little further and bounce against her big round belly. ");
	}
	else
	{
		output("\nYou back up a little further and bounce against her stomach. ");
	}
	
	output("You feel her rock hard cock pressing against your crotch as you've found yourself straddling it. You hold the end of her shaft and rub yourself along her length, causing her to moan and sweat, as you grind against her. ");
	if (pc.isSubby())
	{
		output("<i>“Are you enjoying that mistress? Do you like it when I do this?”</i> you ask. <i>“Mmm fuck yeah”</i> she moans ");
	}
	else if (pc.isBimbo())
	{
		output("<i>“Mmm, do you like it when I do this? When I grind against your cock like a little slut?”</i> you moan. <i>“Mmm fuck yeah, work my cock”</i> she gasps ");
	}
	else if (pc.isBro())
	{
		output("<i>“Mmm yeah, bet you like this bitch. Bet you can't wait to fuck me senseless”</i> you grunt. <i>“Mmm fuck yeah”</i> she gasps <i>“I wanna fuck you so fucking hard”</i> she moans ");
	}
	else if (pc.isMischievous())
	{
		output("<i>“Bet you're enjoying this?”</i> you chortle. <i>“Mmm you know I do, you're getting me so fucking hard”</i> she moans ");
	}
	else
	{
		output("<i>“Mmm bet you love it when I do this”</i> you moan. <i>“Mmm fuck yeah, grind against my cock”</i> she gasps ");
	}	
	if (isBroodmotherTreated())
	{
		output("sliding her fingers in and out of her soaking fuckhole. ");
	}
	else
	{
		output("fingering her moist fuckhole. ");
	}
	
	output("The slicking sounds of her self-titiliation stop and scaly hands slap against your [pc.hips]. ");
	if (inWhat == "vagina")
	{
		output("<i>“I'm gonna fuck that pussy of yours and fill you with " + (pc.isPregnant() ? "cum" : "babies") + "”</i> she groans into your ear. ");
	}
	// Raskvel can't impregnate butt, so just cummies
	else
	{
		output("<i>“I'm gonna fuck that butthole of yours and fill you with cum”</i> she groans into your ear. ");
	}
	output("\nYou're pulled backwards until " + (lvl >= 3 ? "you bounce against her big soft belly" : "you're flat against her"));
	output(", the " + (getBroodmotherFutaCockSize() >= 450 ? "thick scimitar-like cock" : "curved raskvel cock") + " level with your entrance. You put your arms behind you and her long fingers clamp around your wrists. You rock backwards");
	if (inWhat == "vagina")
	{
		if ((pc.looseness(pc.biggestVaginaIndex()) >= 3))
		{
			output(", moaning as her tip slides into your [pc.vagina " + pc.biggestVaginaIndex() + "]. ");
		}
		else
		{
			output(", moaning as her tip pushes against your [pc.vagina " + pc.biggestVaginaIndex() + "]. ");
		}
	}
	else
	{
		if (pc.ass.looseness() >= 3)
		{
			output(", moaning as your [pc.asshole] accepts her tip. ");
		}
		else
		{
			output(", moaning as her tip pushes against your [pc.asshole]. ");
		}
	}
	
	if (pc.isSubby())
	{
		output("<i>“Mmm, I want you inside me mistress, make me your cocksleeve”</i> you exclaim as you rock backwards, pushing the full length of her cock into you. ");
	}
	else if (pc.isBimbo())
	{
		output("<i>“Mmm, give me your " + (getBroodmotherFutaCockSize() >= 450 ? "big, juicy, curvy dick" : "hard, curvy dick") + "”</i> you exclaim as you rock backwards, digging her nice, hard, cock deeper in. ");
	}
	else if (pc.isBro())
	{
		output("<i>“More”</i> you grunt as you rock backwards, pushing her length deep inside you. ");
	}
	else if (pc.isMischievous())
	{
		output("<i>“Why don't we put it in more”</i> you say as you rock backwards, pushing her length deep inside you. ");
	}
	else
	{
		output("<i>“More”</i> you moan as you rock backwards, pushing her length deep inside you. ");
	}	

	if(pc.isTreated() || pc.bovineScore() >= 3)
	{
		if (inWhat == "vagina")
		{
			output("<i>“MOO”</i> you exclaim loudly as her curved cock twists through your insides. <i>“Yeah that's it my little cum-cow, take my cock”</i> she cackles.");
		}
		else
		{
			output("<i>“MOO”</i> you exclaim loudly as her curved cock twists and squeezes through your insides. <i>“Yeah that's it my little cum-cow, take my cock”</i> she cackles.");
		}
	}
	else
	{
		if (inWhat == "vagina")
		{
			output("<i>“Oh stars”</i> you exclaim loudly as the length of her curved cock twists through your insides. <i>“Yeah that's it, take my cock”</i> she cackles.");
		}
		else
		{
			output("<i>“Oh stars”</i> you exclaim loudly as her curved cock twists and squeezes through your insides. <i>“Yeah that's it, take my cock”</i> she cackles.");
		}
	}
	output(" The curviness of it feel great and you soon find yourself ");
	if (lvl >= 2)
	{
		output("bouncing against the broodmothers belly, ");
	}
	else
	{
		output("bouncing your [pc.hips] back and forth, ");
	}
	output("riding her cock as she holds onto you and thrusts into your " + (inWhat == "vagina" ? "[pc.vagina " + pc.biggestVaginaIndex() + "]" : "[pc.butthole]") + ", only slowing to slap your [pc.ass] " + (pc.buttRating() >= 12 ? "which jiggles with each lust-filled hit." : "lustily."));
	
	if (pc.isSubby())
	{
		output("<i>“Ah! Yes mistress, that feels so good. Spank me like the naughty slave I am! Go harder, I can take it.”</i>");
	}
	else if (pc.isBimbo())
	{
		output("<i>“Ah! That's so-o goood! Spank me and fill me with your cum! Go harder, make me your bitch!”</i>");
	}
	else if (pc.isBro())
	{
		output("<i>“Nngh! Hey watch it! If your dick didn't feel so good, you'd be in trouble! Come on, fuck me faster!”</i>");
	}
	else
	{
		output("<i>“Ah! Mmm yeah, that feels so good. Go harder!”</i>");
	}	

	output("\n<i>“Ha-aah! If you insist”</i> she chortles. Her grip around your arms tightens, her scaled fingers digging into your skin. She thrusts into you faster and deeper with all her energy, each thrust causing her hefty cum-pouch to smack into your" + (pc.balls > 0 ? "s. " : " thighs. ") );

	//Something about your dick and your tits shaking back and forth followed by how it feels (tightness, sounds, speed)
	if (inWhat == "vagina")
	{
		output("Each quick, deep" + ((pc.isSquirter() || pc.wetness(pc.biggestVaginaIndex()) >= 3) ? ", squelching " : " ") + "thrust makes you squeal in delight as her warm cock tunnels through you, ");
		if (pc.vaginas[pc.biggestVaginaIndex()].looseness < 2)
		{
			output("pushing against your walls");
		}
		else{
			output("brushing against your walls");
		}
		
		if (pc.biggestVaginalCapacity() - getBroodmotherFutaCockSize() < 75) //If pc isnt much bigger than her
		{
			output(" before pounding against your cervix");
		}
		output(" and caressing your insides on the way back to do it all again.");
	}
	else
	{
		output("Each quick, deep" + ((pc.ass.wetness() >= 3) ? ", squelching " : " ") + "thrust makes you squeal in delight as her warm cock tunnels through you, ");
		if (pc.ass.looseness() < 2)
		{
			output("holding your butthole wide,");
		}
		else{
			output("brushing against your butthole,");
		}
		output(" before pushing into the side of your rectum, then caressing your insides as it's pulled back out to do it all again.");
	}

	output("You");
	if (pc.hasTits() && pc.biggestTitSize() >= 4)
	{
		output("r [pc.tits] shake below you as the 'mamas assault on your " + (inWhat == 'vagina' ? 'pussy' : 'ass') + " continues");
		if (pc.isLactating() && pc.milkFullness > 50 && pc.milkMultiplier >= 65)
		{
			output(",[pc.milk] flying from them as you're shaken back and forth");
		}
		output(".");
	}
	else if (pc.hasCock())
	{
		if (pc.cocks[pc.biggestCockIndex()].cLength() < 4){
			output("r [pc.cock " + pc.biggestCockIndex() + "] wiggling as the 'mamas assault on your " + (inWhat == 'vagina' ? 'pussy' : 'ass') + "continues.");
		}
		else if (pc.cocks[pc.biggestCockIndex()].cLength() < 8){
			output("r [pc.cock " + pc.biggestCockIndex() + "] shaking below you as the 'mamas assault on your " + (inWhat == 'vagina' ? 'pussy' : 'ass') + "continues.");
		}
		else if (pc.cocks[pc.biggestCockIndex()].cLength() < 12){
			output("r [pc.cock " + pc.biggestCockIndex() + "] waving in the air below you as the 'mamas assault on your " + (inWhat == 'vagina' ? 'pussy' : 'ass') + "continues.");
		}
		else{
			output("r [pc.cock " + pc.biggestCockIndex() + "] swinging in the air below you as the 'mamas assault on your " + (inWhat == 'vagina' ? 'pussy' : 'ass') + "continues.");
		}
	} 
	else
	{
		output("'re shaken back and forth as the 'mamas assault on your " + (inWhat == 'vagina' ? 'pussy' : 'ass') + "continues.");
	}

	if (inWhat == "vagina")
	{
		output("<i>“Oh-uhh, f-u-u-uck. [pc.name] your " + ((pc.vaginas[pc.biggestVaginaIndex()].looseness < 2) ? "tight" : "loose") + " cum-hole feels so fucking good”</i> she pants from behind you. At this rate I'm going to b-burst!");
	}
	else
	{
		output("<i>“Oh-uhh, f-u-u-uck. [pc.name] your " + ((pc.ass.looseness() < 2) ? "tight" : "loose") + " butthole feels so fucking good”</i> she pants from behind you. At this rate I'm going to b-burst!");
	}

	if (pc.isSubby())
	{
		output("<i>“Let me be your cumdump mistress”</i> you moan as her cock quivers inside you. " + (inWhat == 'vagina' ? "<i>“Fill my pussy with your babies”</i>." : "<i>“Please, cum in my ass as much as you can”</i>."));
	}
	else if (pc.isBimbo())
	{
		output("<i>“Then let it out silly!”</i> you giggle as her cock quivers inside you. <i>“Getting filled with your cum would be totally amazing!”</i>");
	}
	else if (pc.isBro())
	{
		output("<i>“Ugghh, then burst!”</i> you grunt as her cock quivers inside you.");
	}
	else if (pc.isMischievous())
	{
		output("<i>“Oh well I know how we can take care of that”</i> you cackle as you lunge backwards against her quivering cock.");
	}
	else
	{
		output("<i>“Then b-burst!”</i> you moan. <i>“Fill me with your cum.”</i>");
	}	

	if (isBroodmotherTreated())
	{
		output("\n<i>“MOOOOoo!”</i> she cries. You feel her cock pulse and flare  and not a second later hot creaminess is firing deep inside you. Spurt after spurt fires into you, splashing against your " + (inWhat == 'vagina' ? "cervix" : "prostate") + ". After several long, pleasureable seconds, you slide yourself off of her limpening cock with a squelch, cum drooling from your " + (inWhat == 'vagina' ? "slit" : "ass") + " as you do. ");
	}
	else
	{
		output("\n<i>“A-aah, I'm cumming!”</i> she cries. You feel her cock pulse and flare and not a second later hot creaminess is firing deep inside you. Spurt after spurt fires into you, splashing against your " + (inWhat == 'vagina' ? "cervix" : "prostate") + ". After several long, pleasureable seconds, you slide yourself off of her limpening cock with a squelch, cum dripping from your " + (inWhat == 'vagina' ? "slit" : "ass") + " as you do. ");
	}

	if (pc.inHeat() && inWhat == 'vagina')
	{
		output("<i>“Mmm, thanks for the cum”</i> you moan, slickness running down your thighs.")
	}
	if (pc.isSubby())
	{
		output("<i>“That was great mistress. Let me know if you need servicing again.”</i> you moan, [pc.tongue] hanging from your mouth.");
	}
	else if (pc.isBimbo())
	{
		output("<i>“That was like, so fucking good. Let me know if that dick of yours needs a good riding again!”</i>");
	}
	else if (pc.isBro())
	{
		output("<i>“Heh, not bad”</i> you huff. <i>“Let me know if you need something like that doing again, some other time.”</i>");
	}
	else
	{
		output("<i>“That was great”</i> you moan. <i>“Let me know if you need something like that doing again.”</i>");
	}	
	
	if (inWhat == "vagina")
	{
		pc.loadInCunt(chars["RASKVEL_MALE"],pc.biggestVaginaIndex());
	}
	else
	{
		pc.loadInAss(chars["RASKVEL_MALE"]);
	}
	pc.orgasm(); //Well you didn't, but doesn't matter had sex.
	processTime(30);
	addButton(0,"Next",denInside);	
}

public function getBroodmotherFutaCockSize():int 
{
	var lvl:int = getBroodmotherImpregnationLevel();
	
	switch (lvl)
	{
		case 0:
			return 250;
			break;
		case 1:
			return 300;
			break;
		case 2:
			return 450;
			break;
		case 3,4,5:
			return 600;
			break;
		default:
			return 600;
			break;
	}
}

public function getBroodmotherFutaCockDesc():String 
{
	var lvl:int = getBroodmotherImpregnationLevel();
	
	switch (lvl)
	{
		case 0:
			return "6-inch, pointy, blue cock";
			break;
		case 1:
			return "8-inch,  blue, curved cock";
			break;
		case 2:
			return "12-inch thick, blue, curved cock";
			break;
		case 3,4,5:
			return "forearm sized, thick, blue, curved cock";
			break;
		default:
			return "big curved cock"
	}
}

public function milkBroodmotherReturn():void
{
	clearOutput();
	showPregRaskReturn();
	var lvl:int = getBroodmotherImpregnationLevel();
	var loot:Array = new Array();
	var buckets:RaskvelBroodmotherMilkBucket = new RaskvelBroodmotherMilkBucket();
	var bottles:RaskvelBroodmotherMilkBucket = new RaskvelBroodmotherMilkBucket();
	buckets.quantity = 0;
	bottles.quantity = 0;
	
	output("<i>“You still got those buckets for filling with cum?”</i> you ask the broodmother. ");
	if (isBroodmotherBroken())
	{
		output("<i>“There's loads left. I think they're in the storage closet over there, why?”</i>\n");
	}
	else
	{
		output("<i>“Of course, I always make sure to have some spare for any guests”</i> she cackles. <i>“They're over in that storage closet, why do you ask?”</i>\n");
	}
	
	output("You walk over to the storage closet, pick out a stack of buckets and carry them back over to ");
	if (lvl <= 1)
	{
		output(" where she's standing. ");
	}
	else
	{
		output(" where she's lying. ");
	}
	
	if (isBroodmotherFuta())
	{
		if (lvl <= 1)
		{
			output("<i>“Ooh is it for this”</i> she says as she waves her curvy blue cock at you.");
		}
		else
		{
			output("<i>“Ooh is it for this”</i> she says, wiggling her hips to shake her big blue cock.");
		}
		
		if (pc.isSubby())
		{
			output("<i>“Not today mistress”</i> you smirk.");
		}
		else if (pc.isBimbo())
		{
			output("<i>“Haha, not that”</i> you giggle.");
		}
		else if (pc.isBro())
		{
			output("<i>“Nope”</i> you grunt");
		}
		else if (pc.isMischievous())
		{
			output("<i>“Higher”</i>.");
		}
		else
		{
			output("<i>“Not that”</i>.");
		}
	}
	
	if (pc.isSubby())
	{
		output("You get on your knees. <i>“They're for your milk-filled tits, if you'll let me, madam”</i> you beg. <i>“Ahhh they do need relieving, they're 'bout to burst. Very well " + pc.mf("slave","slut") + ", you may milk me”</i> she responds, as small beads of milk trickle down her breasts.");
	}
	else if (pc.isBimbo())
	{
		output("<i>“They're for these, silly”</i> you say, grabbing her udder-topped tits in your hands. <i>“Ahhh, well these do need relieving, they're 'bout to burst”</i> she responds, as you feel small beads of milk run over your hand.");
	}
	else if (pc.isBro())
	{
		output("<i>“They're for these bad boys”</i> you say, slapping the side of one of her udder-topped tits. <i>“Ahh, that'd feel almost as good as your cock, go on then”</i> she responds, rolling her teats between her fingers as she does.");
	}
	else if (pc.isMischievous())
	{
		output("<i>“They're for those, though I'm not sure if they're full enough”</i> you say, pointing to her udder-topped tits. <i>“Shut up, they're so full they're about to burst!”</i> she screeches. <i>“Well, go on then, get to it!”</i>");
	}
	else
	{
		output("<i>“They're for your swollen udders”</i> you reply. <i>“Ooh that'd be so good”</i> she moans, wiggling her torso as she does. <i>“Get to it”</i>.");
	}
	
	//Grabbing and massaging breasts, small beads
	output("\nYou take one bucket from the top of the stack and clank it down on the floor infront of her. Standing, you reach forward and sink your fingers into her ");
	switch (lvl)
	{
		case 0:
			output("baseball sized breasts.");
			break;
		case 1:
			output("large round breasts.");
			break;
		case 2:
			output("basketball sized torpedo-tits.");
			break;
		case 3:
			output("giant, motherly breasts.");
			break;
		case 4:
			output("giant, milk-tipped breasts.");
			break;
		case 5:
			output("massive, bursting breasts.");
			break;
	}
	output(" <i>“Mooo”</i> she moans uncontrollably, as you massage her breasts, rolling her thick pink areolae under your fingertips like putty. Milk trickles from the ends of her cannon-like nipples in reaction and you bend in, lapping up her tasty cow milk. With her warmed up, it's time to really relieve her.\n");
	
	if (pc.hasItemByClass(MagicMilker))
	{
		output("You kneel down and swing your backpack onto the ground. <b>You pull out your JoyCo Magic-Milker 7</b> the cups dangling limply. You hold the glittering orb out so that it'll recoginize its user and push the button.\n");
		output("The milkers hatch whirrs open and four additional cups emerge to target the udders along the broodmothers ");
		if (getBroodmotherThickness() > 60)
		{
			if (getBroodmotherThickness() < 70)
			{
				output("fat, ");
			}
			else if (getBroodmotherThickness() < 80)
			{
				output("jiggling, ");
			}
			else if (getBroodmotherThickness() < 90)
			{
				output("gelatine-like, ");
			}
			else 
			{
				output("ssbbw-tier, ");
			}
		}
		if (getBroodmotherImpregnationLevel() > 1)
		{
			switch(getBroodmotherImpregnationLevel())
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
			output("pregnant ");
		}
		output("belly. ");		
		
		//After belly-descript
		output("You bring the cups towards each of her udders in turn. They automatically expand to fit the mama's gun-barrel like nipples as they get near before latching themselves onto her pink milk mounds with a pop, the broodmother moaning and mooing as they do. ");
		output("Sitting back, you watch as the milker does its thing. A look of surprise washes over the milky raskvels face as out of the centre of each cup, grows long, slim brown phalli with pinpoint holes at the ends and press against the openings of her nipples. Her look quickly changes and she moos loudly as the protrustions thrust forward, spearing her fuckable nipples. ");
		output("With the cups now forming vacuums, they hiss warmly and inside the transparent plastic her teats moisten and bulge. You hear whirring from the machine as the base of the protrusions begin to judder, vibrating deep inside the broodmothers pink mounds, causing her to moan " + (getBroodmotherThickness() >= 60 ? "and jiggle " : "") + "uncontrollably, milk filling the gaps around the brown rods like lube. ");
		output("On the outside, the cups begin tugging at her flesh as the machine, having sufficiently teased her starts vacuuming inside and out. Her pink udders redden and bulge as they're pulled towards the cups, milk bursting from her teats. She moos, sweating as the pressure amps up and the cups expand, pulling her udders to new sizes as they darken and bulge further, the protrusions vibrating and sucking inside her widened nipples. The broodmothers eyes have rolled back in her head as she " + (lvl >= 3 ? "lies above you" : "stands vacantly infront of you") + ", tounge dangling, having given in completely to the milking.\n");
		output("At this you grab the bucket and open a hatch on the milker, accessing the output hose and place it into the bucket, as you expect her boobgasm real soon. You were right.\n");
		switch (lvl)
		{
			case 0:
				output("She shudders and moans infront of you and her swollen teats burst with a loud <i>“MOOOO!”</i>. The nozzles whirr and small squirts of milk fly through the tube, like cum from a used dick. Milk dribbles into the bucket below, foaming, forming a small puddle in the bottom of the bucket.");
				bottles.quantity = 1;
				output("\nYou thank her bottling her small donation and putting it into your backpack.");
				break;
			case 1: 
				output("She shudders and moans infront of you and her swollen teats burst with a loud <i>“MOOOO!”</i>. The nozzles whirr and squirts of milk fly through the tube, like cum from a dick. Milk squirts into the bucket below, foaming, filling the bottom of the bucket with her milk.");
				bottles.quantity = 2;
				output("\nYou thank her bottling her donation and putting two bottles into your backpack.");
				break;
			case 2:
				output("She shudders and moans infront of you, rubbing her sore breasts when with a loud <i>“MOOOO!”</i> her swollen teats burst. The nozzles whirr and bursts of milk fly through the tube, like water from a tap. She continues to moan as her pointed nipples continue to release their load, foaming milk pouring into the bucket below. The bursts shorten and the flow stops, leaving the bottom half of the bucket full of her yummy milk.");
				bottles.quantity = 3;
				output("\nYou thank her bottling her bounty and pushing three bottles into your backpack.");
				break;
			case 3: 
				output("She shudders and moans infront of you, grabbing her bountiful breasts when with a loud <i>“MOOOO!”</i> her giant red udders burst! The nozzles whirr and cut out as they're unable to catch her flow before it leaves her nipples. The transparent cups turn half white as milk floods the cups and is sucked down into the tube as fast as the machine can. Her foaming mother-milk pours into the tube, sloshing into the bucket below. She continues to moan as her pointed nipples continue to release their bounty. The flow decreases to small splurge-like bursts and soon stops. You look to the bucket and it's just as well it stopped as a small amount of overflow dribbles down the sides.");
				buckets.quantity = 1;
				output("\nYou thank her, putting a lid over the bucket and lifting it into your backpack.");
				break;
			case 4:
				output("She shudders and moans infront of you, squeezing her bountiful breasts when with a loud <i>“MOOOO!”</i> her collosal red udders explode! The nozzles cut out immediately as they're drowned by her flow and the transparent cups turn completely white as milk floods them, pouring down the tube, the device sucking it as fast as it can. Her foaming mother-milk fills the tube, hastily pouring into the bucket below. She continues to moan as her swollen udders press against the cups, milk seeping through any space it can find, her fuckable nipples squased flat against the sides. continue to release their bounty. Milk wont stop flowing and you hastily pull the bucket out of the way, milk sloshing over the sides onto the floor and manage to drop another one into place before the tube pours too much of her bounty onto the floor. The height of the milk in the cups decrease and her nipples palpitate, squirting their last out. She finally stops, having filled one and a half buckets.");
				buckets.quantity = 1;
				bottles.quantity = 1;
				output("\nYou thank her, pouring her plentiful bounty into containers and placing them in your backpack.");
				break;
			case 5: 
				output("She shudders and moans infront of you, massaging her massive motherly breasts when with a loud <i>“MOOOO!”</i> her bursting red udders explode! The nozzles cut out immediately as they're drowned by her flow and the transparent cups turn completely white as milk floods them, pouring down the tube, the device sucking it as fast as it can. But it can't keep up and with a beep, the cups pop off her udders and the milker clatters to the ground. As she laughs between moaning and mooing, you grab another 5 buckets and position them hastily beneath each leaking udder. Her bounty pours into each bucket from each convulsing nipple, clanging against the bottom before splashing against more of her milk. <i>“Oh fuc-MOOO”</i> she moans as her flow increases, milk now pouring in waves from her collosal teats, splashing rapidly into the bucket like a quick running tap. Milk wont stop flowing and you're worried 1 bucket for each nipple won't be enough. The flow continues and you see the foaming milk rising to the sides close to overflowing. Thankfully, her milkflow cuts out and with a last spurt she stops, as six buckets lie beneath her, drips of overflow running down the sides");
				buckets.quantity = 6;
				output("\nYou thank her, putting lids on each bucket of her overwhelming output and heaving them into your backpack.");
				break;
		}
	}
	else
	{
		output("You wipe your [pc.hands] over some of her leaking bounty and rub it along the lengths of her long fuckable nipples. \n");
		output("She moos and moans " + (lvl >= 3 ? "above you" : "infront of you") + ", tounge dangling from her mouth as you tug on her gun barrel length nipples, occasionally stopping at the top to jam your thumbs into them. With each tug milk dribbles from the ends. ");
		output("You speed up. The broodmothers eyes roll back in her head as she sweats " + (getBroodmotherThickness() >= 60 ? "and jiggles " : "") + "uncontrollably, from the intensity, her breast-teats reddening and milk bubbling and frothing at the tips. You get more agressive, tugging her nipples, causing her to gasp in pain and pleasure. You continue, tugging her long hollow nipples, her pliable flesh being squeezed and stretched in your hands, small spurts flying from the tips as you do.");
		output("Her moaning becomes more frequent as she shakes in your hands, her soft fleshy udders tight in your hands. <i>“It's comOO”</i> she gasps and with that you push fingers into her nipples. Her");
		switch (lvl)
		{
			case 0:
				output("baseball sized breasts");
				break;
			case 1:
				output("large round breasts");
				break;
			case 2:
				output("basketball sized torpedo-tits");
				break;
			case 3:
				output("giant, motherly breasts");
				break;
			case 4:
				output("giant, milk-tipped breasts");
				break;
			case 5:
				output("massive, bursting breasts");
				break;
		}
		output(" swell and you feel her nipples bulge around your fingers. Milk pours around your fingers and down your wrists and with a pop you yank your fingers out and hastily grab a bucket.");
		switch (lvl)
		{
			case 0:
				output("She shudders and moans infront of you as her swollen teats burst with a loud <i>“MOOOO!”</i>. Her milk flys into the air, like cum from a used dick and you catch it in the bucket, foaming, forming a small puddle in the bottom of the bucket.");
				output("\nThere's not enough to collect and you leave the bucket on the floor for her to use.");
				break;
			case 1: 
				output("She shudders and moans infront of you as her swollen teats burst with a loud <i>“MOOOO!”</i>. Squirts of milk fly through the air, like cum from a dick. Milk squirts into the bucket in your hands, foaming, filling the base of the bucket with her milk.");
				bottles.quantity = 1;
				output("\nYou thank her, bottling her donation and putting it into your backpack.");
				break;
			case 2:
				output("She shudders and moans infront of you, rubbing her sore milk firing breasts. Milk pours from her breasts, like water from a tap. She continues to moan as her pointed nipples continue to release their load, foaming milk pouring into the bucket below. The bursts shorten and the flow stops, leaving the bottom quarter of the bucket full of her yummy milk.");
				bottles.quantity = 2;
				output("\nYou thank her, bottling her two-bottle bounty and putting it into your backpack.");
				break;
			case 3: 
				output("She shudders and moans infront of you, grabbing her bountiful breasts as her giant udders burst! Mother-milk floods out from her, sloshing into the bucket below. She continues to moan as her pointed nipples continue to release their bounty. The flow decreases to small splurge-like bursts and soon stops. You look to the bucket and it's just as well it stopped as it's nearly full.");
				bottles.quantity = 3;
				output("\nYou thank her, bottling her three-bottle bounty and putting it into your backpack.");
				break;
			case 4:
				output("She shudders and moans infront of you, squeezing her bountiful breasts when with a loud <i>“MOOOO!”</i> her collosal udders explode! Milk pours in tides from her breast mounted udders, hastily pouring into the bucket below. She continues to moan as she presses her swollen udders against the bucket, milk seeping in, her fuckable nipples swimming in her own release, continuing to release their bounty. Milk wont stop flowing and you hastily pull the bucket out of the way, as her flow stops. Her nipples pulsate and you look down at a full bucket, milk dripping down the sides.");
				buckets.quantity = 1;
				output("\nYou thank her, putting a lid on the bucket and placing it into in your backpack.");
				break;
			case 5: 
				output("She shudders and moans infront of you, massaging her massive motherly breasts when with a loud <i>“MOOOO!”</i> her bursting red udders explode! Milk pours out like a waterfall from her breasts, sloshing into the bucket in your hand. The weight of the bucket is quickly increasing as her bounty pours into the bucket in your hand and you quickly have to swap it for an empty one. Milk floods from each convulsing nipple, clanging against the bottom before splashing against more of her milk. <i>“Oh fuc-MOOO”</i> she moans as her flow increases, milk now pouring in waves from her collosal teats, splashing rapidly into the bucket like a quick running tap. Milk wont stop flowing and you're worried 2 buckets wont even be enough. The flow continues and you see the foaming milk rising to the sides close to overflowing. Thankfully, her milkflow cuts out and with a last spurt she stops, drips of overflow running down the sides");
				buckets.quantity = 2;
				output("\nYou thank her, putting lids on each bucket of her overwhelming output and heaving them into your backpack.");
				break;
		}
	}
	
	output("\n\n");
	if (buckets.quantity > 0)
	{
		loot.push(buckets);
	}
	if (bottles.quantity > 0)
	{
		loot.push(bottles);
	}
	itemCollect(loot);
	
	// Milked flag
	flags["PREG_RASK_RETURNED_LASTMILKED"] = int(GetGameTimestamp() / 1440);
	
	clearMenu();
	addButton(0,"Next",denInside);
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
	var lvl:int = getBroodmotherImpregnationLevel();

	//Crotchcovered:
	if(!pc.isCrotchExposed())
	{
		output("The second you begin to unwrap your concealed cock, the raskvel’s eyes go wide. She leans closer, as much as her");
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
		
		switch (lvl)
		{
			case 0:				
				output("stomach");
				break;
			case 1:
				output("baby-ready paunch");
				break;
			case 2:
				output("pregnant belly");
				break;
			case 3:
				output("bloated baby-cradle");
				break;
			case 4:
				output("bulging baby-cradle");
				break;
			case 5:
				output("heavily pregnant belly");
				break;
		}
		
		output("will allow her, to inhale your musk, her ");
		
		switch (lvl)
		{
			case 0:				
				if (isBroodmotherTreated())
				{
					output("long, fuckable nipples visibly perking");
				}
				else
				{
					output("nipples visibly perking");
				}
				break;
			case 1:
				if (isBroodmotherTreated())
				{
					output("long, cow-nipples visibly perking");
				}
				else
				{
					output("motherly nipples visibly perking");
				}
				break;
			case 2:
				if (isBroodmotherTreated())
				{
					output("long, swollen cow-nipples visibly perking");
				}
				else
				{
					output("swollen nipples visibly perking");
				}
				break;
			case 3:
				if (isBroodmotherTreated())
				{
					output("long, swollen cow-nipples stiffening, beads of milk forming at their tips as she does");
				}
				else
				{
					output("engorged nipples visibly perking");
				}
				break;
			case 4:
				if (isBroodmotherTreated())
				{
					output("long, swollen cow-nipples stiffening, milk dribbling from them as she does");
				}
				else
				{
					output("large areolae-moated mommy-nipples becoming erect at your scent");
				}
				break;
			case 5:
				if (isBroodmotherTreated())
				{
					output("dick-length, milky cow-nipples becoming erect at your scent");
				}
				else
				{
					output("giant, puffy nipples becoming erect at your scent");
				}
				break;
		}
		
		if (isBroodmotherFuta())
		{
			output(". Her cock stiffens in reaction to yours and her ");
		}
		else
		{
			output(". The broodmothers ");
		}
		
		output("lips purse as she struggles to find the words. Then your [pc.cock " + x + "] flops out in all its immensity, ");
		if(!pc.isErect()) output("half-turgid and growing under her spellbound gaze");
		else output("massively turgid, the veins pumping beneath her spellbound gaze");
		output(". She whimpers, her hands subconsciously squeezing her " + (isBroodmotherFuta() ? "stiffening cock" : (isBroodmotherTreated() ? "breast-mounted teats" : "tits")) + ", her tail wagging back and forth" + (isBroodmotherBroken() ? " across the dry floor." : " across her cum soaked floor."));
	}
	//Uncovered
	else
	{
		output("The second you bring your proudly-displayed member toward the pregnant raskvel, her eyes go wide. She leans closer, as much as her"); 
		
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
		
		switch (lvl)
		{
			case 0:				
				output("stomach");
				break;
			case 1:
				output("baby-ready paunch");
				break;
			case 2:
				output("pregnant belly");
				break;
			case 3:
				output("bloated baby-cradle");
				break;
			case 4:
				output("bulging baby-cradle");
				break;
			case 5:
				output("heavily pregnant belly");
				break;
		}
		
		output("will allow her, to inhale your scent, her ");
		
		switch (lvl)
		{
			case 0:				
				if (isBroodmotherTreated())
				{
					output("long, fuckable nipples visibly perking");
				}
				else
				{
					output("nipples visibly perking");
				}
				break;
			case 1:
				if (isBroodmotherTreated())
				{
					output("long, cow-nipples visibly perking");
				}
				else
				{
					output("motherly nipples visibly perking");
				}
				break;
			case 2:
				if (isBroodmotherTreated())
				{
					output("long, swollen cow-nipples visibly perking");
				}
				else
				{
					output("swollen nipples visibly perking");
				}
				break;
			case 3:
				if (isBroodmotherTreated())
				{
					output("long, swollen cow-nipples stiffening, beads of milk forming at their tips as she does");
				}
				else
				{
					output("engorged nipples visibly perking");
				}
				break;
			case 4:
				if (isBroodmotherTreated())
				{
					output("long, swollen cow-nipples stiffening, milk dribbling from them as she does");
				}
				else
				{
					output("large areolae-moated mommy-nipples becoming erect at your scent");
				}
				break;
			case 5:
				if (isBroodmotherTreated())
				{
					output("dick-length, milky cow-nipples becoming erect at your scent");
				}
				else
				{
					output("giant, puffy nipples becoming erect at your scent");
				}
				break;
		}
		
		if (isBroodmotherFuta())
		{
			output(". Her cock stiffens in reaction to yours and her ");
		}
		else
		{
			output(". The broodmothers ");
		}
		
		output("lips purse as she struggles to find the words. Proud of the effect you’re having on her, you switch your hips forward, bouncing ");
		if(!pc.isErect()) output("the half-turgid dick before her as it slowly inflates, locking her spellbound gaze to the inhumanly thick veins");
		else output("the massively engorged dick before her as the inhumanly thick veins throb and ache for penetration.");
		output(". She whimpers, her hands subconsciously squeezing her " + (isBroodmotherFuta() ? "stiffening cock" : (isBroodmotherTreated() ? "breast-mounted teats" : "tits")) + ", her tail wagging back and forth" + (isBroodmotherBroken() ? " across the dry floor." : " across her cum soaked floor."));
	}
	
	output("\n\n<i>“W-wow. It’s so big.”</i> the purple-scaled lizard-girl reaches out experimentally, as if she can’t quite believe that it’s real. When she makes contact, a shiver of pleasure runs through you, and it throbs against her armored skin");
	if(pc.cumQ() >= 40 && pc.cumQ() < 500) output(", leaking a fat drop of pre-cum onto her wrist");
	else if (pc.cumQ() >= 500) output(", drooling a stream of pre-cum all over her wrist");
	switch (lvl)
	{
		case 0:				
			output(". <i>“This is just what I need to get back on the cock.”</i> she says, licking her lips. Tiny hands grab you just behind the [pc.cockHead " + x + "] and yank you closer.");
			output("\n\nYou let them.");
			output("\n\n<i>“I want you to fill me with this monster - fill me with big round eggs. Sire a whole clan of big-dicked sons to make the next generation of raskvel girls stumble around bow-legged...”</i> Her face is an inch away from your [pc.cockNoun " + x + "], but her eyes have drifted closed. The short, stacked alien is lost in her own fantasy, navigating her lips to greet your eager flesh by smell and feel alone");
			break;
		case 1:
			output(". <i>“I'm glad I'm not pregnant just yet.”</i> she says, licking her lips. Tiny hands grab you just behind the [pc.cockHead " + x + "] and yank you closer.");
			output("\n\nYou let them.");
			output("\n\n<i>“I want you to fill me with this monster - fill me with big round eggs. Sire a whole clan of big-dicked sons to make the next generation of raskvel girls stumble around bow-legged...”</i> Her face is an inch away from your [pc.cockNoun " + x + "], but her eyes have drifted closed. The short, stacked alien is lost in her own fantasy, navigating her lips to greet your eager flesh by smell and feel alone");
			break;
		case 2,3,4,5:
			output(". Her expression sours. <i>“I wish I wasn’t pregnant.”</i> Tiny hands grab you just behind the [pc.cockHead " + x + "] and gently tug you closer.");
			output("\n\nYou let them.");
			output("\n\n<i>“If I wasn’t pregnant, you could knock me up with this monster. You’d give me the biggest, rounded eggs ever. Sire a whole clan of big-dicked sons to make the next generation of raskvel girls stumble around bow-legged...”</i> Her face is an inch away from your [pc.cockNoun " + x + "], but her eyes have drifted closed. The short, stacked alien is lost in her own fantasy, navigating her lips to greet your eager flesh by smell and feel alone");
			break;
	}	
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
	output(" <i>“And I want to have your babies." + (lvl <=1 ? " I'm gonna empty your cum-bucket inside of me, filling me with your seed." : " After these.") + "”</i> She lifts your dick with both hands, grunting with the effort, then feathers kisses along the underside of your shaft");
	if(pc.cocks[x].cType == GLOBAL.TYPE_FELINE) output(", sucking on the soft, feline \"barbs” one at a time");
	output(". <i>“You’re the best daddy I’m ever going to meet.”</i>");

	output("\n\nYou doubt you could stop her from gathering some if you wanted to.");
	if(pc.isBro() || pc.libido() >= 75) output(" Besides, a hidden part of you thrills at knowing this waddling baby-factory is going to play host to your children. Maybe she even has a system to preserve your cum, so she can pump out litters of little Steeles for years to come.");
	output(" <i>“");
	if(pc.isBro()) output("Go ahead,”</i> you grunt.");
	else if(pc.isBimbo()) output("Like, O-M-G that would amazalicious!”</i> you cheerily exclaim, happy to feed her all the dick she could ever want.");
	else output("Just stop teasing me, and you can do whatever you want with the cum,”</i> you implore, hips shuddering. Her fingers are too damned good at their job.");

	output("\n\nThe raskvel giggles. <i>“" + pc.mf("You boys are so easy.","A few strokes to the dick, and you get so generous.") + " Don’t worry. If there’s one thing I know, it’s how to make a cock feel good. Well, that and how to remodulate an ionic conductor for usage in a particle cannon, but getting knocked up is wayyy more fun!”</i> She’s back on your [pc.cock] as soon as you finish, pulling it - and you - closer so that she can recline. So positioned, the pregnant raskvel is able to grind you against her " + (getBroodmotherThickness() >=70 ? "plump" : "") +  (lvl <=1 ? " stomach" : " belly") + " and " + (lvl <=1 ? " rub your collosal fuck-rod against her " : "thread you through her ") + (isBroodmotherTreated() ? "breast-udders" :"tits") + ", smearing your ");
	if(pc.cumQ() < 500) output("oozing");
	else if(pc.cumQ() < 1000) output("streaming");
	else output("all but gushing");
	output(" pre across her soft-scaled skin.");

	output("\n\nShe grabs a bucket from under her while you adjust to the sudden onslaught of friction. <i>“Goddamn, that is some premium dick,”</i> the raskvel coos. She grabs one enormous ear and lays it across the top left side of your member. The inside is velvety soft warm. The other falls onto the other side a second later. <i>“I swear I can feel your dick all the way in my ovaries.”</i> Her legs tremble. <i>“Like they know I’m rubbing your big, fat, alien cumstick right next to them.”</i>");
	
	// If non-pregnant, she'll try and put it in
	var cummed:Number = pc.cumQ();
	if (lvl <= 1)
	{
		output("\n\nThe scaley slut’s hands return to their former place, this time pressing through her sensitive ears. It must feel good, because her eyes roll halfway back, interrupting her attempts to kiss your [pc.cockHead " + x + "], but nothing could stop her from stroking you, pressing her tits together on either side with her forearms and jacking her perfectly textured ears up and down over every inch of cock she can reach. She drools into her cleavage, and her" + (isBroodmotherFuta() ? " three" : "") + " legs twitch with pleasure as she tries to thrust herself against something.");
		output("<i>“Ughh, I can't take this anymore, I don't want your cum in a bucket, I want it inside of me!”</i> she cries out. You know how she feels. She grabs a hold of your violently throbbing [pc.cock " + x + "] and " + (isBroodmotherFuta() ? "after lifting her throbbing balls out of the way, " : "") + "grinds against it's base before raising her arms and pulling herself up to the tip, leaving a trail of juices along your shaft as she ascends.");
		output("\n\n Your heart hammers in your chest with alarming rapidly. All you want is to push your cock into her raskvel-pussy and unload all your hot cum into her. You press your large [pc.cockHead " + x + "] against her " + (isBroodmotherTreated() ? "torrenting" : "soaking") + " fuck-hole and pull her down. You feel her slowly roll around your tip, like a condom, letting out cries of pain and enjoyment as her pussy stretches to accomodate what she truly desires, until your girths invasion is stopped by the limits of her frame.");
		output("\n\nTwo alien feet press down on your [pc.knot " + x + "] from either side with force, precum coating her hands as she thrusts herself back up your tingling tip. Better still, her thighs straddle you as she trembles atop you like a high-powered vibrator. You groan and thrust forward, slamming your dicktip again as far as it'll go into her gaping hole, and she moans right along with you, her soprano voice tickling already overloaded nerves with another layer of impregnation-obsessed pleasure.");
		output("\n\nAs her insides grind against your trembling prick, you erupt.");

		if(cummed < 5) 
		{
			output("\n\nWhen your oversized organ does nothing but spasm climacticly, the purple-scaled mynx’s expression sours, her passion calming in the face of an orgasm with nothing more than a small, dribble of [pc.cumNoun].");
			output("\n\n<i>“That’s it?”</i> the raskvel says, gesturing wildly. <i>“All that effort and you barely get me half a dozen orgasms, and enough jizz to impregnate an ant? How dafuck am I supposed to get knocked up when ");
			if(pc.balls > 1) output("your balls are");
			else if(pc.balls == 1) output("your ball is");
			else output("your body");
			output(" is more dried out than sydian’s sense of humor? It’s like you bolted a fucking a giant, discount dildo on your crotch.”</i> She windmills her tiny fists in irritation, screaming, <i>“GET YOUR SHIT AND GET OUT! Fucking... fake-ass dick-having off-world losers!”</i>");
			output("\n\nMaybe if you had some time to rest, you would’ve had a better load for her. Too late now.");
		}
		else if(cummed < 50)
		{
			output("\n\nA few powerful, spurts spray out of your oversized organ, packing themselves deep into the raskvel’s insides. She shudders, cunt-leaking onto your tip in sympathetic orgasm. She jumps up and down pumping you harder, milking the last few dregs into her.");
			output("\n\nWhen she’s sure she’s harvested every drop, she pulls herself off of your ");
			if(!pc.hasStatusEffect("Priapism") || pc.libido() >= 80) output("slowly deflating meat");
			else output("still-hard cock");
			output(". Only then, does she have a moment to reflect on what happened. <i>“Not too bad, star-stuff.”</i> She licks the residue from her large outer lips and noisily swallows. <i>“Bet it must be some virile stuff, to come all the way out of that big, swinging dick of yours.”</i> Kissing the top of your cock like a favorite pet, she smiles. <i>“You did real good.”</i>");
		}
		else if(cummed < 200)
		{
			output("\n\nA powerful, balloon-filling squirt sprays out of your oversized organ. Still latched onto your [pc.cockNoun " + x + "], she cries out but holds on even as her pussy fountains clear girl-cum all over your cock, making holding on close to impossible. She bounces in place, working your [pc.cock " + x + "] to squeeze out even more.");
			output("\n\n<i>“Ah-ahhh yes!”</i> the gravid girl cries, shuddering again and again as her stomach gargles in response to the loads pumping through your urethra into her. <i>“Just like that!”</i> She twists her hands in half-circles trying to hold on as cum leaks from her, covering your tip in your collective efforts. Only then does she pull herself off, hopping back onto the floor.");
			output("\n\nA face blushed nearly pink greets you, illuminated with a smile and bright, pleased eyes. <i>“That was really nice. Really nice.");
			output(" Almost as good as popping out your eggs is going to be.");
			output("”</i> She pats your dick affectionately. <i>“I think there’s enough for triplets, if I’m right about how good my loins are, but I bet you’re just happy that I'm full of your cum, aren’t ya, " + pc.mf("stud","slut") + "?”</i>");

			if(pc.isBro()) output("\n\nYou nod vigorously, wishing you could do it all again.");
			else if(pc.isBimbo()) output("\n\nYou giggle. Like, of course, the cum is the good part!");
			else output("\n\nYou shrug nonchalantly, a little tired.");
		}
		else if(cummed < 1000)
		{
			output("\n\nA powerful, condom-breaking squirt sprays out of your oversized organ. The gravid-girl cries out, struggling to hold onto your pulsating cock as her pussy struggles to contain your heated flow, ribbons of [pc.cumNoun] dripping from your tip, coating her hands, stomach and thighs. Droplets of her girlcum dribble through your load, her eyes rolling back in her head but still she moans, imploring you to give her more.");
			output("\n\nEvery time your [pc.cockNoun " + x + "] shoots a flood of [pc.cumNoun] through its urethra, you can feel her weight increasing, her belly filling with your load, pushing her down harder against your tip. Squirts of girlcum hit your [pc.feet] as she bounces in place, making her tight snatch pump your [pc.cock " + x + "] harder, squeezing even more of your potent fluids into her, as her belly bloats further.");
			output("\n\n<i>“Holey fucking condoms, that’s a lotta jizz!”</i> the raskvel squeaks, gushing again. <i>“I'm definitely preggers now, " + pc.mf("stud","slut") + "!”</i> She lifts herself off and slides down your soaked shaft, giving you a good look at her [pc.cumColor]-painted groin and sloshing belly. Streams of [pc.cumVisc] [pc.cumNoun] hang from her outer lips, and she’s constantly stroking her cum-covered belly in arousal. <i>“I bet that much will give me loads of your kids. My current record is fifteen.”</i> She tries to smile but she's still so lost in what just happened.");
		}
		else if(cummed < 3000)
		{
			output("\n\nAn immense, virile squirt sprays out of your oversized organ - and directly past her cervix. She’s shot upwards by the eruption of [pc.cum] holding on by her fingertips and a shocked look in her eyes. There's nothing but cum past your tip, her stretched pussy completely filled with your [pc.cumVisc] [pc.cumNoun].");
			output("Her arms flail around, having to hold on in different places occasionally as your [pc.cockHead " + x + "], gets entirely drenched in a compilation of both your cum.");

			output("\n\nYou’ve only just begun to climax, grabbing on to her hands so she can't fall off as more virile liquid splatters out of the raskvels overflowing cunt. She’s loving it too. You can tell by the way she squirms atop you, her feet quivering on your [pc.knot " + x + "] whenever another pulse of [pc.cumNoun] passes through your urethra. Cunt-juice splatters down your shaft. The messy-little kobold is apparently quite the squirter. Her belly gets bigger the more you go off, still managing to take in some of your cum-squirts but now way out of room in her pussy.");
			output("\n\nHigher and higher, the cummy tide rises inside her, her bloated form sloshing about on your tip. As your cock quivers, she slips off your end occasionally causing some to splatter out up the raskvel mother’s stomach and spraying against her underboob, a sight erotic enough to help you squirt an extra time or two - just enough to fill her stomach.");
			output("\n\n<i>“Homyfuckinggoddamn that is a lot of cum!”</i> she gasps as she slides off your cock, the pregnant lizard-girl pinned to you by her belly as she falls. Cum leaks from her pussy onto the floor. She giggles and shovels some into her mouth, completing the image of a completely debauched cum-slut. <i>“And it tastes so strong! You’re going to give me soo many babies, you know that right?”</i> She smears more cum on her stomach, making the scales there shine. <i>“You’re my primo baby-daddy. Gonna put more raskvel on this planet than a whole generation of rask boys.”</i> She kisses your dick, then hugs it passionately.");
			output("\n\n<i>“You and your cock are welcome here anytime. Just walk in and shove anybody else out of the way, because you are my number one lay from now on, got it?”</i> the smutty broodmother jabs a finger in your direction. <i>“I’m so glad you came back.”</i>");
		}
		else
		{
			output("\n\nAn immense, overwhelmingly virile stream issues forth. The tide of jism instantly balloons the raskvel’s pelvis beyond what your cock did, to comical proportions, overflowing as her canal fails to hold the sheer volume. Semen pours from her opening, dripping down her legs and your tip. You hold her in place, afraid she'll slip off before you've finished. Your [pc.cock " + x + "] bucks like a raging bronco, and the hose of seed shoots into her belly, expanding it like a balloon.");
			output("\n\nShe fills with alarming rapidity, something that clearly delights the raskvel from how she moans and squirts intermittently. Her belly is getting larger and larger as more of your [pc.cumVisc] [pc.cumNoun] floods her, making her looks heavily pregnant.");
			output("\n\nYou think for a second about how much more she can take but you don’t really care, not when she’s still wringing your [pc.cock] with those lovely ears of hers and begging you to keep cumming inside her. The begging quickly stops though, a look of shock across her face. At this point, it looks like her entire torso has been ballooned by your seed, her rounder than ever as her now heavily-pregnant looking belly has reached capacity. And there's only one way to go but up.");
			output("\n\nShe coughs for a second and [pc.cumVisc] [pc.cumColor] liquid spews from her mouth, like a fountain. She pants violently trying to breath through her nose until she lets out a snort and your [pc.cumNoun] pours from her nostrils like a tap onto her smooth purple tits, waterfalling down across her taut boulder-sized tummy to meet the stream of cum overflowing from her snatch.");
			output("\n\n<i>“S-so much fucking cum”</i> the raskvel splutters, violently gasping as her airways finally clear as your cum stops flooding into her. Orgasming one last time she gasps <i>“It’s everywhere.”</i> as she slathers cum all over her swollen belly, like a bear in a honey jar. She looks dazedly at your [pc.cock " + x + "]. It’s almost as filthy with your jism as she is. <i>“I think I love you.”</i> The declaration is whispered tiredly, but there is no hint of deception in her voice. To her, you’re clearly the perfect mate.");
			output("\n\nHer lingering declaration hangs heavy in your mind. <i>“");
			if(pc.isBimbo()) output("Awww, you’re a super good fuck yourself. I’d fill you any time!");
			else if(pc.isBro()) output("You’re not so bad yourself,”</i> you grunt. <i>“Not bad.");
			else if(pc.isNice()) output("You’re amazing, though I don’t think I’m ready to drop the ‘L’ word myself.");
			else if(pc.isMischievous()) output("You’re not bad yourself, little lady. I’d knock you up any day of the way.");
			else output("You love my dick,”</i> you explain, prodding her insides with it one last time. <i>“But thanks anyways. I know it can have that effect.");
			output("”</i>");
			output("\n\n<i>“Do you have any idea how many babies you’re going to give me?”</i> She scoops cum out from between her tits, then dumps it into her mouth. <i>“You’re going to father to a whole generation of virile, big-dicked raskvel boys. I hope they're as big as you”</i> she moans, any boundaries she had broken by the sheer amount of cum that just flooded her.");
			output("\n\nYou pull her off your cum-covered cock. She lies, full and content and it brings a smile to your face.");
		}
		
		if (cummed > 3000)
		{
			pc.applyCumSoaked();
		}
		processTime(20);
		pc.orgasm();
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",cumInsideBroodmother,cummed);
	}
	else
	{
		output("\n\nThe scaley slut’s hands return to their former place, this time pressing through her sensitive ears. It must feel good, because her eyes roll halfway back, interrupting her attempts to kiss your [pc.cockHead " + x + "], but nothing could stop her from stroking you, pressing her tits together on either side with her forearms and jacking her perfectly textured ears up and down over every inch of cock she can reach. She drools into her cleavage, and her" + (isBroodmotherFuta() ? " three" : "") + " legs twitch with pleasure, as she tries to thrust her nearly-immobilized form against anything.");
		output("\n\nYou know how she feels. Your [pc.cock " + x + "] is violently throbbing from the treatment. Your heart hammers in your chest with alarming rapidly. All you want is her to stroke a little faster, squeeze a little tighter, and you could cum. Orgasm is so close you can feel it, and the raskvel surely can too with how your large [pc.cockHead " + x + "] swells.");
		if(pc.hasCockTail()) output(" Your [pc.cockTail] slithers down behind and slams into her well-used cunt, but it still isn’t enough. You need more.");
		output("\n\nTwo alien feet press down on your [pc.knot " + x + "] from either side, toes squeezing. They’re slipping from all the girlcum on the floor, making her grip tenuous. Better still, her quaking thighs make them shudder like they’re strapped to a high-powered vibrator. You groan and thrust forward, slamming your dicktip against her cerulean lips, and she moans right along with you, her soprano voice tickling already overloaded nerves with another layer of impregnation-obsessed pleasure.");
		output("\n\nThe dam breaks, and you erupt into the raskvel’s maw.");

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
		}
		//<50jizz - spit into bucket, a little disappointed but not mad. Recommends you eat some spunkshrooms.
		else if(cummed < 50)
		{
			output("\n\nA few powerful, mouth-filling spurts spray out of your oversized organ, packing themselves deep into the raskvel’s cheeks. She shudders, cunt-leaking in sympathetic orgasm, but somehow, she doesn’t swallow. Instead, her feet pump you harder, milking the last few dregs into her maw.");
			output("\n\nWhen she’s sure she’s harvested every drop, her hands and feet release your ");
			if(!pc.hasStatusEffect("Priapism") || pc.libido() >= 80) output("slowly deflating meat");
			else output("still-hard cock");
			output(". She leans to the side, grabs the bucket, and spits out your wad without a hint of shame. Only then, does she have a moment to reflect on what happened. <i>“Not too bad, star-stuff.”</i> She licks the residue from her lips and noisily swallows. <i>“Bet it must be some virile stuff, to come all the way out of that big, swinging dick of yours.”</i> Kissing the top of your cock like a favorite pet, she smiles. <i>“You did real good.”</i>");
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
		}
		//< 1000 jizz - get mouthful+facial, then collect rest in bucket while blind.
		else if(cummed < 1000)
		{
			output("\n\nA powerful, cheek-bulging squirt sprays out of your oversized organ. The gravid-girl’s mouth can’t even contain it all. She’s forced off your dick by the heated flow and takes the rest square in the face. Ribbons of [pc.cumNoun] cascade down her cheeks. [pc.CumGem] droplets dribble from her chin, but the raskvel still manages to remember her bucket and lift it into place, even while she’s trying to swallow her leftover mouthful. You can’t see her face with the spooge-vessel thrust in front of it, but you can hear her moans imploring you to give her more.");
			output("\n\nStrangely, she seems to be getting off on it. Every time your [pc.cockNoun " + x + "] shoots a flood of [pc.cumNoun] through its urethra, you can feel her strained belly pressing back harder against you, as if the mere presence of sperm nearby is enough to make her reproductive system accelerate. Squirts of girlcum hit your [pc.feet] as she quivers, making her tiny soles pump your [pc.knot " + x + "] harder, squeezing even more of your potent fluids into the bucket.");
			output("\n\n<i>“Holey fucking condoms, that’s a lotta jizz!”</i> the raskvel squeaks, gushing again. <i>“You’re gonna get me pregnant for weeks, " + pc.mf("stud","slut") + "!”</i> The bucket sloshes higher as you spend the last of your liquid passion. She sets it down, giving you a good look at her [pc.cumColor]-painted maw. Streams of [pc.cumVisc] [pc.cumNoun] hang from her chin, and she’s constantly blinking her gunked-up eyes to try and see. <i>“I think my ovaries might have mutated again. Something definitely happened down there. I bet when I get pregnant with your kids, I’ll have even more. My current record is fifteen.”</i> An absurdly proud smile appears beneath the layer of sexual filth.");
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
		}
		
		processTime(20);
		pc.orgasm();
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
	var x:int = pc.cockThatFits(700);
	var lvl:int = getBroodmotherImpregnationLevel();
	var isSlut:Boolean = ((pc.isTreated() && pc.isBimbo()) || pc.isBimbo() || pc.isBro() || pc.isDependant(Creature.DEPENDANT_CUM) || (pc.libido() >= 50 && pc.lust() >= 33) || pc.lust() > 66);
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
	output(" She smiles wide with licentious intent, licking her blue-painted lips and tossing her downy hair. She rolls on to the floor before turning to look at you.");
	
	output("\n\n<i>“You gonna stick it in?”</i> The purple-scaled lizard rolls to the side, lifting one leg high into the air");
	output(" to reveal her " + (isBroodmotherTreated() ? "hairy swollen cunt, flanked by bright pink, golf ball sized clitties. The folds themselves are thick and juicy, pouring eager girlcum across the floor.":"smooth swollen cunt, flanked by bright pink, marble-sized clitties. The folds themselves are thick and juicy, dribbling eager pussyjuice across the floor.") + " No matter how many birth’s they’ve passed, they’re plush enough to squeeze down on a pinky, let alone your [pc.cock " + x + "]. <i> “Or are you just teasing poor, ol' me?” </i> " + (isBroodmotherFuta() ? "She cradles her thigh and meat in her arm and pulls them " : "She grabs her ankle and pulls her leg ") + "higher until her lips part, " + (isBroodmotherTreated() ? "spraying a gush of lube into the air." : "releasing a small gush of lube.") + " <i>“Maybe aliens are just shy...”</i > ");
	
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
	
	output("\n\n<i>“...Maybe you’re just afraid of a little raskvel pussy. Like you know you’ll be lining up at my door day after day once you taste it,”</i> the sultry tart suggests.");
	output("\n\nGrabbing her ");
	
	//thickness
	if (getBroodmotherThickness() < 60)
	{
		output("");
	}
	else if (getBroodmotherThickness() >= 60 && getBroodmotherThickness() < 70)
	{
		output("fat");
	}
	else if (getBroodmotherThickness() >= 70 && getBroodmotherThickness() < 80)
	{
		output("plump");
	}
	else if (getBroodmotherThickness() >= 80 && getBroodmotherThickness() < 90)
	{
		output("jiggling");
	}
	else if (getBroodmotherThickness() >= 90)
	{
		output("bbw-tier");
	}
	
	if (lvl >= 2)
	{
		output(",pregnant");
	}
	
	output(" belly to brace yourself, you thrust inside. ");
	if(pc.cockVolume(x) < 300) output("Her pussy parts easily around your [pc.cock " + x + "], and her diatribe cuts off with a high-pitched squeak of pleasure.");
	else if(pc.cockVolume(x) < 500) output("Her pussy reluctantly parts for your [pc.cock " + x + "], clutching it tightly as her diatribe cuts off with a high-pitched squeak of pleasure.");
	else output("Her pussy strains to accept your girthy tool, its thick lips stretched wide enough to pass an egg. A high-pitched wail of pleasure interrupts the little slut’s diatribe at the penetration. Evidently she’s a fan of pushing herself to the absolute limit.");
	output(" That saucy slot feels lovely wrapped around you. Her folds are absolutely soaked, and the pudgy pussy-lips press hotly against your crotch, a gentle reminder that you’ve buried yourself completely inside her.");
	pc.cockChange();
	var y:int = pc.cockThatFits2(700);
	//2
	if(y >= 0 && pc.cockTotal() == 2)
	{
		output("\n\nMeanwhile, your second dick rubs against her slippery crease of her thigh, pressing its [pc.cockHead " + x + "] up against " + (lvl >= 2 ? "the underside of her fertile belly." : "the underside of her baby-ready stomach.") + " The mix of sweat and cunt-juice coating her soft-scaled skin allows it to glide effortlessly against her, right up until she wraps her fingers around it to give it a tug. <i>“I see you brought extra for the rest of me. How thoughtful...”</i> Her fingers twist and swirl while her cunt clenches.");
	}
	//More
	else if(y >= 0)
	{
		output("\n\nMeanwhile, your extra dicks rub against the slippery creases of her thighs, pressing their turgid tips up against " + (lvl >= 2 ? "the underside of her fertile belly." : "the underside of her baby-ready stomach.") + " The mix of sweat and cunt-juice coating her soft-scaled skin allows them to glide effortlessly against her, right up until she grabs ");
		if(pc.cockTotal() == 3) output("both of them");
		else output("two of them");
		output(" to give them a tug. <i>“I see you packed enough to share. How thoughtful...”</i> She pumps both hard. <i>“I could use a facial.”</i>");
	}
	//Merge
	output("\n\nWhatever your floor-bound partner may think, you hold all the cards. You’re the one doing the fucking, looming over her. You’re the one who moves her thigh to make the muscles inside her twat clamp down tighter on your rod. She can whimper, her hands caressing your body in ways that make you groan, but there’s nothing she can do to change your tempo, nothing she can do to give her pause when you pound her drooling cunt hard enough to make her chirp out an orgasm.");
	output("\n\nYou’re just getting warmed up. You hammer her well-used cunt with powerful strokes. When you pull back, ropes of girl-jizz spatter the floor, hanging off your [pc.cock " + x + "] in webs. When you thrust in, still more squirts out, splattering your thighs and hers alike. When you bury yourself to the hilt, crushing her clits between your bodies, she squeals and trembles. You can’t tell if she’s cumming over and over, or if she just can’t handle how good it feels to have her " + (lvl >=2 ? "pregnant" : "cock hungry") + " pussy taken by a talented lover. You like it either way.");
	output("\n\nShe’s smiling saucily, " + (isBroodmotherFuta() ? "her ball-pouch bouncing against her stomach with each thrust, " : "") + " her tail lashing back and forth. It ");
	if(pc.balls > 1) output("cradles your balls, then wraps around them with surprising tenderness. The warm cocoon of scaly flesh makes it seem almost too easy to spill your load.");
	else if(pc.hasVagina()) output("teasingly wanders over your slit, then slips inside. The slippery scales inside you make it almost too easy to spill your load.");
	else output("slips back to tease your [pc.asshole]. At first, it’s playfully circling, but after a particularly forceful thrust on your part, she slides it in. The pressure on your prostate makes it seem almost too easy to spill your load.");
	output(" One errant thought and you’ll be giving her an enormous, cunt-bathing creampie.");

	if (lvl >= 2)
	{
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
	}	
	else
	{
		output("\n\n<i>“Ahh, I want your c-cuuUUUM~! ...I want you to splatter my pussy full of it.”</i> Her pussy quivers, leaking runnels of slick, reptilian goo. <i>“I bet you’ll make me so fucking big, filled up with your big hot load, I'd carry sooo many eggs!”</i>");
	
		output("\n\n");
		if(isSlut) output("Fuuuck you want that too. You want to strap her to the wall in your ship and dump endless loads into her, using her as equal parts sex-toy and virility measuring stick. Maybe you might even get her some mods or an exoskeleton to let her get around the ship. In between laying eggs she could dress herself in skimpy slutwear and slowly ruin it as her pregnancy progresses...");
		else 
		{
			output("You feel like you ought to be a little concerned about breeding giving this alient creature your babies or perhaps even disgusted, but your body isn’t. Your traitorous rod");
			if(pc.cockTotal() > 1) output("s love");
			else output(" loves");
			output(" the idea of siring a whole clan of horny fuck-lizards. She’s tickled your most basic, unthinking instincts in ways that make your [pc.cockNoun " + x + "] throb and your ");
			if(pc.balls > 0) output("[pc.balls]");
			else output("crotch");
			output(" clench.");
		}
	}

	output("\n\nYou bury yourself deep and unload. There’s no other option. The climax is entirely beyond your control, more a sudden venting of pressure than anything you have to work for. The " + (lvl >=2 ? "pregnant " : "") + "raskvel’s oozy, clutching slit squeezes it out of you in ");
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
	addButton(0,"Next",cumInsideBroodmother,cummies);
}

public function cumInsideBroodmother(cummies:int):void
{
	clearOutput();
	clearMenu();
	var result:Boolean = impregnateBroodmother(true, cummies);
	
	if (result)
	{
		showPregRaskReturn();
		output("As your seed ");
		
		if(cummies < 5) output("trickles");
		else if (cummies < 25) output("spurts");
		else if( cummies < 175) output("streams");		
		else output("gushes");
		
		output(" into her, her breeding-made body reacts! Her hair glistens and lengthens atop her head. Her pussy pulses and her skin thickens and flushes. She moans as her stomach rounds and her breasts engorge, filling with motherly milk. <b>You have impregnated the broodmother!</b>");
		output("\n\nClutching her baby ready stomach she slurs <i>“Looks like you're going to be a daddy.”</i>");
		
		clearMenu();
		addButton(0, "Next", denInside);
	}
	else
	{
		denInside();
	}
}

//Face Ride
//Straddle her face as she eats you out, then slip in her cuntjuice for musky fun :3
public function faceRideTheRaskPreg_Return():void
{
	clearOutput();
	showPregRask();
	var lvl:int = getBroodmotherImpregnationLevel();
	var isSlut:Boolean = ((pc.isTreated() && pc.isBimbo()) || pc.isBimbo() || pc.isBro() || pc.isDependant(Creature.DEPENDANT_CUM) || (pc.libido() >= 50 && pc.lust() >= 33) || pc.lust() > 66);
	
	
	output("You advance on the immobile raskvel");
	
	if(!pc.isCrotchExposed()) output(", silently peeling the covers from your [pc.vaginas]");
	else output(", silently wiggling your hips to draw her attention to your [pc.vaginas]");
	
	output(". <i>“");
	if(pc.tallness >= 5*12) output("You’re just the right height.");
	else output("I bet all the girls love seeing you stuck on your knees.");
	if(pc.hasStatusEffect("Vaginally-Filled"))
	{
		output(" Now how about you lick all the cum out of me. ");
		if(pc.isNice() || pc.isMischievous()) output("The glaze just makes it better, right?");
		else output("Sluts like you </i>crave<i> it.");
	}
	else if(pc.isNice() || pc.isMischievous()) output(" Now why don’t you put that tongue to work before I find someone else to do it?");
	else
	{
		output(" Now put that tongue to work, and we’ll see if you’re really keyed up enough to get off from the taste of another");
		if(pc.isPregnant()) output(" pregnant");
		output(pc.mf(" person"," woman") + "’s pussy.");
	}
	output("”</i>");
	output("\n\n<i>“Mmmm... been a while since I had some pussy,”</i> the pregnant raskvel admits. Her eyes are wide and lustily locked on your slit");
	if(pc.totalVaginas() > 1) output("s");
	output(". It’d take a boy, dribbling cum and begging to fuck, to distract her for how she stares. She wants the pussy, and she wants it bad. " + (isBroodmotherFuta() ? "It's taking all her willpower not to rest her belly on your back and start plowing into you with her big blue cock. " : "") + "Rocking forward, the lizard-girl strains to plant a kiss on your mound, but her pregnant bulk drags her right back, forcing her to settle down on her fattened haunches with an annoyed wobble. <i>“...Please? I can’t reach.”</i> She looks up imploringly, tugging her " + (isBroodmotherTreated() ? "milky teats" : "nipples") + " as much for show as for her own pleasure.");

	output("\n\nYou ");
	if(pc.tallness < 5*12) output("step to the side and carefully climb up onto her sleeping struts. It’s the only way you’ll get your cunt at the right level with how short you both are.");
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
	showName("BROOD\nDEN");
	
	output("The den is large, well lit and devoid of the rust you've seen on the rest of the planet. Flickering monitors line one side of the room.\nSeveral supports lie in the centre of the room and " + (getBroodmotherImpregnationLevel() > 1 ? "atop them lies ":"slouched next to them, "))
	if (pc.isBimbo() && getBroodmotherImpregnationLevel() > 1) output("your big round fun buddy, ");
	
	var lvl:int = getBroodmotherImpregnationLevel();
	if (hours < 4 || hours > 22)
	{
		output("the Raskvel Broodmother, snoring away, resting from the days activities.");
	}
	else
	{
		switch (lvl)
		{
			case 0:
				output("the Raskvel Broodmother, her expression gloomy and her body lacking its previous glow.");
				break;
			case 1:
				if (hours % 7 == 0)
				{
					output("the Raskvel Broodmother, who whilst not quite as active as she used to be, is fucking a fellow raskvel, his purple cock pouch-deep in her.");
					if (rand(3) == 0){impregnateBroodmother(false,200); }
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
		case 1:
			output("\nDrains line the floor beneath her, collecting any overflow from her breeding sessions.");
			break;
		case 2:
			output("\nDrains line the floor beneath her, collecting any overflow from her breeding sessions.");
			break;
		case 3:
			output("\nDrains line the floor beneath her, collecting the substantial overflow from her breeding sessions.");
			break;
		case 4:
			output("\nDrains line the floor beneath her. They're beggining to become blocked by the excessive overflow from her breeding sessions.");
			break;
		case 5:
			output("\nThe drains beneath her are completely blocked by the excessive overflow from her non-stop breeding sessions.");
			break;				
	}
	
	if (lvl >= 2)
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
	
	if ((hours % (8 - lvl)) == 0 && lvl != 0)
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
	
	if (getBroodmotherImpregnationLevel() == 0){addDisabledButton(13, "Rest", "Probably best not to close your eyes around someone who's only enjoyment you've taken away.");}
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
	
	if (pc.hasStatusEffect("Bulky Belly") && getBroodmotherImpregnationLevel() >= 3 && rand(3) == 2)
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
		if (pc.isBro())
		{
			output("You fight again your bindings but they wont budge. <i>“Fuck you guys! When I get out of here, you're all dead!”</i> you shout, breathing heavily as you begin to lose your energy from battling the restraints.");
		}
		else if (pc.isMischievous())
		{
			output("You fight again your bindings but they wont budge. <i>“Hey come on now, let me go and maybe I can help you guys”</i> you plead, breathing heavily as you begin to lose your energy from battling the restraints.");
		}
		else
		{
			output("You fight again your bindings but to no avail. <i>“Please, I'm not like her!”</i> you plead, breathing heavily as you begin to lose your energy from battling the restraints.");
		}
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
		output(" could do with being bigger. You tap his shoulder and he stands up from his good work, his semi-flaccid penis bouncing against your hand as he does. You tug him closer " + (pc.isBimbo() || pc.isMischievous() ? "and wipe your chin-saliva all over his cock before working" : "before working") + "your hand up and down his shaft, it growing in your hand as you do. ");
		if (pc.isSubby())
		{
			output("Happy with your work, you beg <i>“Now please, use me masters”</i>");
		}
		else if (pc.isBimbo())
		{
			output("Happy with your work, you giggle <i>“Alright guys, give me those cocks!”</i>");
		}
		else if (pc.isBro())
		{
			output("Happy with your work, you shout <i>“Alright lads, let's go!”</i>");
		}
		else if (pc.isMischievous())
		{
			output("Happy with your work, you cackle <i>“Alright now you can really start”</i>");
		}
		else
		{
			output("Happy with your work, you say <i>“Alright guys, now really give it to me”</i>");
		}
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
			output(" <i>“Mmmm, keep fucking this cumdump”</i> the third one moans, watching you get knocked back and forth by his bretheren whilst he beats his reddening, veiny cock to what's unfolding.");
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

public function getLastImpregnated():int
{
	return flags["PREG_RASK_RETURNED_LASTIMPREGNATED"];
}

public function getBroodmotherThickness():int
{
	return flags["PREG_RASK_RETURNED_THICKNESS"];
}

public function addBroodmotherThickness(increaseBy:int):void
{
	if ((getBroodmotherThickness() + increaseBy) > (50 + (getBroodmotherImpregnationLevel() * 10)))
	{
		flags["PREG_RASK_RETURNED_THICKNESS"] = (50 + (getBroodmotherImpregnationLevel() * 10));
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
	if (flags["PREG_RASK_RETURNED_BODYTYPE"] == undefined)
	{
		flags["PREG_RASK_RETURNED_BODYTYPE"] = []; // Can add FUTA, TREATED
	}
	if (flags["PREG_RASK_RETURNED_LASTIMPREGNATED"] == undefined)
	{
		flags["PREG_RASK_RETURNED_LASTIMPREGNATED"] = 0;
	}
	if (flags["PREG_RASK_RETURNED_LASTIMPREGNATED_YOURS"] == undefined)
	{
		flags["PREG_RASK_RETURNED_LASTIMPREGNATED_YOURS"] = false;
	}
	if (flags["PREG_RASK_RETURNED_LASTIMPREGNATED_CHILDREN"] == undefined)
	{
		flags["PREG_RASK_RETURNED_LASTIMPREGNATED_CHILDREN"] = 0;
	}
	if (flags["PREG_RASK_RETURNED_THICKNESS"] == undefined)
	{
		flags["PREG_RASK_RETURNED_THICKNESS"] = 0;
	}
	if (flags["PREG_RASK_RETURNED_BROKEN"] == undefined)
	{
		flags["PREG_RASK_RETURNED_BROKEN"] = true;
	}
	if (flags["PREG_RASK_RETURNED_LASTMILKED"] == undefined)
	{
		flags["PREG_RASK_RETURNED_LASTMILKED"] = 0;
	}
}

public function getBroodmotherImpregnationLevel():int
{
	var daysSince:int = int(GetGameTimestamp() / 1440) - int(getLastImpregnated());
	if (flags["PREG_RASK_RETURNED_BROKEN"] == true)
	{
		return 0;
	}
	else if (daysSince > 4)
	{
		flags["PREG_RASK_RETURNED_LASTIMPREGNATED_YOURS"] = false;
		return 1;
	}
	else
	{
		return 2 + daysSince;
	}
}

public function impregnateBroodmother(players:Boolean, cumQ:int):Boolean
{
	if ((getLastImpregnated() < (int(GetGameTimestamp() / 1440) - 4)))
	{
		var chance:int;
		var maxBabies:int;
		var minBabies:int;
		
		if (cumQ < 5)
		{
			chance = 100; //1 in 100
			maxBabies = 1;
			minBabies = 1;
		}
		else if (cumQ < 50)
		{
			chance = 20; //1 in 100
			maxBabies = 1;
			minBabies = 1;
		}
		else if (cumQ < 200)
		{
			chance = 8; //1 in 100
			maxBabies = 2;
			minBabies = 1;
		}
		else if (cumQ < 1000)
		{
			chance = 3; //1 in 100
			maxBabies = 6;
			minBabies = 3;
		}
		else if (cumQ < 3000)
		{
			chance = 1; //1 in 100
			maxBabies = 12;
			minBabies = 5;
		}
		else
		{
			chance = 1; //1 in 100
			maxBabies = 25;
			minBabies = 10;
		}
		
		if (rand(chance) == 0)
		{
			flags["PREG_RASK_RETURNED_LASTIMPREGNATED"] = int(GetGameTimestamp() / 1440);
			if (flags["PREG_RASK_RETURNED_BROKEN"] == true) 
			{
				flags["PREG_RASK_RETURNED_BROKEN"] = false;
			}
			flags["PREG_RASK_RETURNED_LASTIMPREGNATED_YOURS"] = players;
			flags["PREG_RASK_RETURNED_LASTIMPREGNATED_CHILDREN"] = (Math.floor(Math.random() * (maxBabies - minBabies + 1)) + minBabies);
			return true;
		}
		else
		{
			return false;
		}
	}
	else 
	{
		return false;
	}
}

public function isBroodmotherBroken():Boolean
{
	return flags["PREG_RASK_RETURNED_BROKEN"];
}

public function fixBroodmother():void
{
	flags["PREG_RASK_RETURNED_BROKEN"] = false;
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
			var lvl:int = getBroodmotherImpregnationLevel();
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

	var lvl:int = getBroodmotherImpregnationLevel();

	switch (lvl)
	{
		case 1:
			output("<i>“Where ya' going?”</i> the oversized Raskvel murmurs from behind.");
			break;
		case 2:
			output("<i>“Leaving again so soon?”</i> the Broodmother murmurs from behind.");
			break;
		case 3:
			output("<i>“Don't ya want to stay?”</i> the Broodmother murmurs from behind, rubbing her pregnancy-swollen teats.");
			break;
		case 4:
			output("<i>“Are you sure you want to leave?”</i> the Broodmother slurs from behind, spreading her legs.");
			break;
		case 5:
			output("<i>“Don't go, there's room in mah belly”</i> the oversized Raskvel moans from behind, juices dripping from her pussy.");
			break;
	}
	
	if (lvl >= 3 && (pc.libido() >= 70 || pc.lust() >= 50))
	{
		output("\n\nYou turn as you hear her. <b>You can't turn her down.</b>")
		clearMenu();
		addButton(0, "Next", denInside);		
	}
	else if (lvl >= 3 && pc.isBimbo())
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
}