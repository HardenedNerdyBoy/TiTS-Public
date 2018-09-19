//Available Flags
//LILLY_MET: If the player has met her before
//LILLY_TALKED_HERSELF: If the player has talked to her about herself
//LILLY_TALKED_NEWTEXAS: If the player has talked to her about new texas
//LILLY_SEX_AVAILABLE: If the player has unlocked sex-opts


public function showLilly(nude:Boolean = false):void
{
	if (flags["LILLY_MET"]) showName("\nLILLY");
	else if (CodexManager.entryUnlocked("Kerokoras")) showName("KEROKORAS\nSWIMMER");
	else showName("FROG-LIKE\nSWIMMER");
	
	if (nude) showBust("LILLY_NUDE");
	else showBust("LILLY");
	
	author("HNB");
}

public function checkTimeToLeave():void 
{
	if (hours % 2 == 0)
	{
		approachLilly();
	}
}

public function approachLilly():void
{
	clearOutput();
	clearMenu();
	showLilly();
	
	if (hours % 2 == 1)
	{
		if (flags["LILLY_MET"] == undefined)
		{
			output("You face the " + (CodexManager.entryUnlocked("Kerokoras") ? "Kerokoras girl" : "frog girl") + " opposite you. Her shiny, smooth skin is a mixture of white and green, with dark green markings and freckles. She's wearing a swimsuit, which makes sense, she has an athletic build, with powerful legs and slender features which does make her look like a swimmer.\n");
			output("She notices you looking in her direction and looks back at you.\n");
			output("<i>“Uhhh, hi?”</i> she says. <i>“You okay there?”\n\n");
			
			if (pc.isBro())	{
				output("<i>“Haha, yeah, I'm doing great. You come here often?”</i> you reply, continuing to eye her up.\n\n");
				output("She giggles. <i>“Aha, yeah. I come here quite a lot.”</i> She puts a hand out. <i>“The name's Lilly”</i>\n\n");
				output("<i>“[pc.name] Steele.”</i> you respond shaking her hand.");
			}
			else if (pc.isBimbo())
			{
				output("<i>“Oh, hey! Yeah, I'm fabulous!”</i> you reply continuing to eye her up.");
				output("She giggles. <i>“Aha, yeah, me too!”</i> She puts a hand out. <i>“The name's Lilly”</i>");
				output("<i>“[pc.name] Steele.”</i> you respond, smiling widely, completely oblivious to her attempt to shake your hand.");
			}
			else{
				output("<i>“Oh, yeah, sorry. Just haven't seen you before”</i> you reply, adjusting your eyes to meet hers.\n\n");
				output("She giggles. <i>“Ah, alright then. I come here quite a lot, so I guess if you come here often you'll probably see me more.”</i> She puts a hand out. <i>“The name's Lilly”</i>\n\n");
				output("<i>“[pc.name] Steele.”</i> you respond shaking her hand.");
			}
			flags["LILLY_MET"] = true;
		}
		else 
		{
			output("<i>“Hey Lilly”</i> you call over. Lilly turns to face you as you do. <i>“How's the swimming today?”</i>\n\n");
			output("<i>“Pretty good”</i> she responds. <i>“Just got to rest for a bit before getting back to it.");
			if (flags["LILLY_SEX_AVAILABLE"])
			{
				var randInt:int = rand(1);
				switch (randInt)
				{
					case 0: output(" Maybe you could help me relax?”</i>");
					case 1: output(" It's a bit too hot in here to rest though, don't ya think?”</i>");
				}
			}
			else 
			{
				output("”</i>");
			}
		}
		
		addButton(14, "Back", steamRoomInside);
		addButton(0, "Appearance", appearanceLilly, undefined, "Appearance", "Eye up the atheltic frog girl.");
		addButton(1, "Talk", talkLilly, undefined, "Talk", "Learn more about Lilly");
		if (flags["LILLY_SEX_AVAILABLE"]) addButton(2, "Sex", sexLilly, undefined, "Sex", "When in new texas..");
	}
	else 
	{
		output("<i>“Well, see ya later [pc.name]”</i> Lilly says, bolting upright and dashing towards the door. <i>“Swimming time!”</i>\n\n");
		addButton(0, "Next", steamRoomInside);
	}
}

public function appearanceLilly():void 
{
	clearOutput();
	
	output("You decide to eye up the slender ");
	
	if (CodexManager.entryUnlocked("Kerokoras")) output("Kerokoras");
	else output("frog girl");
	
	output(" sitting across from you. She's wearing a swimsuit that perfectly compliments her athletic figure. Her shiny, smooth skin is a mixture of green and white, with dark green markings across her muscular back and arms, gained through years of swimming.");
	output("\nLilly's hairless human-like head is just as smooth, decorated with sky blue, reptilian eyes and slits for nostrils. The same dark green marks are also on her cheeks, but they're small and freckle-like. Her long arms end in webbed hands, great for scooping water behind her. Looking down you notice her powerful legs and the noticeable behind that she's perched on, only just small enough to not slow down her swimming. Above that, a stubby, frog-like tail pokes out.");
	
	addDisabledButton(0, "Appearance");
}

public function talkLilly():void 
{
	clearOutput();
	clearMenu();
	showLilly();
	
	output("<i>“Oh sure we can talk!”</i> Lilly says, smiling. <i>“What d'ya wanna talk about?”</i>");
	
	addButton(0, "Herself", talkLilly_Herself, undefined, "Herself", "Talk with her about herself");	
	addButton(1, "New Texas", talkLilly_NT, undefined, "New Texas", "Ask Lilly about her time on New Texas");	
	if (flags["LILLY_TALKED_NEWTEXAS"] && flags["LILLY_TALKED_HERSELF"]) addButton(2, "Kerokoras", talkLilly_LikeOtherKerokoras, undefined, "Other Kerokoras", "Ask her about how different she is to other Kerokoras.");	
	addButton(14, "Back", approachLilly);
	//addButton(0,"Disability",brandyDisabilityTalk,undefined,"Disability","Ask Brandy why she can’t speak.");
}

public function talkLilly_Herself():void 
{
	clearOutput();
	
	if (flags["LILLY_TALKED_HERSELF"] == undefined || flags["LILLY_TALKED_HERSELF"] == false)
	{
		output("<i>“So, judging by your body and that Swimsuit, I guess you like swimming, huh?”</i> you ask.\n\n");
		output("<i>“Oh yes!”</i> she replies excitedly. <i>“I've loved it since I was a kid. Most of my kind only stay in the water whilst we're kids and then move to the trees, but not me! I stayed in the water until I was a grownup, I loved swimming about in it so much. ");
		output("It kinda made me a bit of an outsider though, so I guess my views on things didn't quite line up with the rest of my kind. So when I grew up and it was time to make decisions for myself, I decided to leave the jungle. I gathered some credit chits from the forest floor and ventured my way to a nearby colony - Esbeth, where I found a bar that was able to cook me up some grub. ");
		output("I got a few stares, I'm not sure if it was for being a Kerokoras or for not wearing anything but it was worth it for the food, much better than the mangoes of the jungle! Whilst I was eating, I looked up at the television and saw some swimmers on TV. That's when I decided I wanted to be a swimmer, for the sport, the fame and of course, the money. ");
		output("So I went to the station there and asked around asking if anyone was going anywhere that had a pool for me to swim in. That's how I ended up here.”</i>\n\n");
	}
	else 
	{
		output("<i>“Ahah, you've asked this before. Don't you remember?”</i> she asks, giggling.\n\n");
		if (pc.intelligence() >= 15)
		{
			output("<i>“Sure I do. I just want to hear it again!”</i> you retort.\n\n");
		}
		else 
		{
			output("<i>“Uhhh...”</i> you reply.");
		}
		
		output("<i>“Haha, fine. I'm a Kerokoras from the forest on Mhen'ga. I liked swimming and I didn't get on with the others, so when I grew up I decided to leave. I saw some professional swimmers on a TV in a bar and came here to train to be one. ");
		output("Since then I've been living here, training as much as possible and competing against other athletes for a living.”</i>");
	}
	
	
	if (!CodexManager.entryUnlocked("Kerokoras"))
	{
		CodexManager.unlockEntry("Kerokoras");
	}
	if (flags["LILLY_TALKED_HERSELF"] == undefined) flags["LILLY_TALKED_HERSELF"] = true;
	if (flags["LILLY_TALKED_NEWTEXAS"] && flags["LILLY_TALKED_HERSELF"]) addButton(2, "Kerokoras", talkLilly_LikeOtherKerokoras, undefined, "Other Kerokoras", "Ask her about how different she is to other Kerokoras.");	
	
	addDisabledButton(0, "Herself");
	
	processTime(1);
	checkTimeToLeave();
}

public function talkLilly_NT():void 
{
	clearOutput();
	
	output("<i>“You live here, right?”</i> you ask.\n\n");
	output("<i>“On New Texas? Yeah, I have a room above the bar. It's quite cheap, so I can afford it with a decent amount to spare with my competition winnings.”</i>\n\n");
	output("<i>“Oh, nice. Sounds like things are going okay financially”</i> you say, smiling. <i>“Do you like it here?”</i>\n\n");
	output("<i>“Well, I'm mainly here for the pool. I'm sure there's other planets with uhhh, cleaner one's but the rent here is cheap enough and it's not toooo busy. The temperature's quite nice here too, not too far below what I grew up in.”</i>\n\n");
	if (pc.isBimbo() || pc.isTreated())
	{
		output("<i>“And the locals are a big bonus too, right?”</i> you ask.\n\n");
	}
	else 
	{
		output("<i>“And the locals?”</i> you ask.\n\n");
	}	
	output("<i>“Well - uh, they're a bit rowdy”</i> she stammers, her cheeks reddening. <i>“But I guess so are my kind, aha”</i>\n\n");
	output("You try your best to suppress a smirk at her reaction.\n\n");
	
	if (flags["LILLY_TALKED_NEWTEXAS"] == undefined) flags["LILLY_TALKED_NEWTEXAS"] = true;
	if (flags["LILLY_TALKED_NEWTEXAS"] && flags["LILLY_TALKED_HERSELF"]) addButton(2, "Kerokoras", talkLilly_LikeOtherKerokoras, undefined, "Other Kerokoras", "Ask her about how different she is to other Kerokoras.");	
	
	addDisabledButton(1, "New Texas");
	
	processTime(1);
	checkTimeToLeave();
}

public function talkLilly_LikeOtherKerokoras():void 
{
	clearOutput();
	
	if (flags["LILLY_SEX_AVAILABLE"] == undefined)
	{
		clearMenu();
		showLilly();
		
		output("<i>“So, even though you left the forest, you're still similar to the other Kerokoras' right?”</i> you ask.\n\n");
		output("<i>“Uhh, yeah I guess so!”</i> she responds.\n\n");
		output("<i>“I thought as much. I mean, unless this steam's much hotter than I thought it was, your sweat's the same right?”</i>\n\n")
		output("<i>“OH, shoot! I hadn't thought of that! Sorry!”</i> she gasps. However she doesn't sound all that surprised.\n\n");
		if (pc.isAss() || pc.isBro())
		{
			output("<i>“Yeah you had”</i> you grunt, walking towards her as you pick up on the complete lack of surprise in her voice. <i>“You're not a very good liar, Lilly.”</i>\n\n");
			output("<i>“Huh!”</i> she squeaks before breaking into a fit of giggles. <i>“Alright you caught me! It worked though didn't it?”</i>\n\n");
			output("<i>“Yeah, it worked”</i> you moan as you stop in front of her. ");
		}
		else if (pc.isBimbo())
		{
			output("<i>“Don't be shy!”</i> you giggle, walking towards her as you pick up on the complete lack of surprise in her voice. <i>“I'm sure the locals around these parts don't mind anyway!”</i>\n\n");
			output("<i>“Huh!”</i> she squeaks before breaking into a fit of giggles. <i>“Yeah you're right, they usually like it. You do too, right?”</i>\n\n");
			output("<i>“Totally!”</i> you moan as you stop in front of her ");
		}
		else 
		{
			output("<i>“Don't be”</i> you laugh, secretly pondering on the lack of surprise in her voice. <i>“It's okay. As long as that wasn't your intention of course.”</i>\n\n");
			output("<i>“Huh?!”</i> she gasps, her cheeks turning red. <i>“Why?!”</i>\n\n");
			output("<i>“Well, there's two reasons. One, it says in my codex that your species are quite the opportunists when it comes to sex”</i> you reply, smugly. <i>“And secondly, you're living on New Texas. There's no way you're an angel, living here.”</i>\n\n");
			output("<i>“Well, um, maybe.”</i> she responds sheepishly, her face turning bright red before breaking into a fit of giggles. <i>“Alright you caught me! It worked though didn't it?”</i>\n\n");
			output("You walk towards her and stop in front of the timid frog girl. <i>“Yeah, it worked”</i> you moan ");
		}
		
		if (!pc.isCrotchExposed())
		{
			output("before pulling down your [pc.CrotchCovers] and leaning over her.\n\n");
		}
		else if (pc.hasCock())
		{
			output("before leaning over her and wave your [pc.cocks " + pc.biggestCockIndex() + "] at her.\n\n");
		}
		else 
		{
			output("before leaning over her and licking your [pc.lips].\n\n");
		}
		
		if (pc.hasCock())
		{
			output("<i>“Wait!”</i> she shouts. <i>“There's one rule! I can't afford to get pregnant, it'd ruin my career. So, if you're going to use that, you're going to have to use this!”</i> she says, turning around and shifting her swimsuit to reveal, nested between her noticeable buttocks, a sizeable, doughnut-shaped butthole.\n\n");
			output("<i>“Sure thing”</i> you reply, fixated on her back entrance.\n\n");
		}
		
		if (flags["LILLY_SEX_AVAILABLE"] == undefined) flags["LILLY_SEX_AVAILABLE"] = true;
		processTime(1);
		addButton(0, "Next", sexLilly);
		checkTimeToLeave();
	}
	else 
	{
		output("<i>“So you're not that different to other Kerokoras right?”</i> you remark.\n\n");
		output("She blushes, remembering when you asked her this before. <i>“Umm, no not really!”</i> she responds before breaking into a giggle. <i>“As you well know! I just wasn't a big fan of the secluded, living-in-a-tree life!”</i>\n\n");
		
		processTime(1);
		addDisabledButton(2, "Other Kerokoras");
		checkTimeToLeave();
	}
}

public function sexLilly():void 
{
	clearOutput();
	clearMenu();
	showLilly();
	
	addDisabledButton(0, "Eat her out", "Eat her out", "Not implemented");
	
	if (pc.hasCock() || pc.hasHardLightEquipped())
	{
		addDisabledButton(1,"Get ridden","Get ridden","Not implemented");
	}
	else 
	{
		addDisabledButton(1,"Get ridden","Get ridden","You don't have anything for her to ride.");
	}
	
	addButton(14, "Back", approachLilly);
}