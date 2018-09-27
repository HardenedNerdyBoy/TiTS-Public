//Available Flags
//LILLY_MET: If the player has met her before
//LILLY_TALKED_HERSELF: If the player has talked to her about herself
//LILLY_TALKED_NEWTEXAS: If the player has talked to her about new texas
//LILLY_SEX_AVAILABLE: If the player has unlocked sex-opts
//LILLY_SEEN_BUTTHOLE: If the player has seen her butthole before


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
				output("<i>“Oh, hey! Yeah, I'm fabulous!”</i> you reply continuing to eye her up.\n\n");
				output("She giggles. <i>“Aha, yeah, me too!”</i> She puts a hand out. <i>“The name's Lilly”</i>\n\n");
				output("<i>“[pc.name] Steele.”</i> you respond, smiling widely, completely oblivious to her attempt to shake your hand.");
			}
			else{
				output("<i>“Oh, yeah, sorry. Just haven't seen you before”</i> you reply, adjusting your eyes to meet hers.\n\n");
				output("She giggles. <i>“Ah, alright then. I come here quite a lot, so I guess if you come here often you'll probably see me more.”</i> She puts a hand out. <i>“The name's Lilly”</i>\n\n");
				output("<i>“[pc.name] Steele.”</i> you respond shaking her hand.");
			}
			flags["LILLY_MET"] = true;
			chars["LILLY"] = new Lilly();
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
		else 
		{
			output("<i>“Wait!”</i> she shouts. <i>“I know you don't have a cock right now but with all the sex-drugs going around this planet, I'm going to tell you anyway. I can't afford to get pregnant, it'd set me back as an athlete. So, if you end up with a cock, you're going to have to use my butt”</i> she says.");
			output("<i>“Sure thing”</i> you reply. <i>“I'll bare that in mind”</i>");
		}
		
		if (flags["LILLY_SEX_AVAILABLE"] == undefined) flags["LILLY_SEX_AVAILABLE"] = true;
		processTime(1);
		sexLilly(false);
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

public function sexLilly(dialogue:Boolean = true):void 
{
	clearMenu();
	showLilly();
	
	if (dialogue)
	{
		clearOutput();
	
		output("You walk towards Lilly and lean over her, one hand on the wall. <i>“How about we have some fun?”</i>\n\n");
		output("<i>“Ah yeah! That'd be great”</i> she says, biting her lip. <i>“How shall we do it?”</i>");
	}
	
	addButton(0, "Eat her out", sexLilly_EatHerOut, undefined, "Eat her out", "She never said you couldn't put her tongue in there!");	
	
	if (pc.hasCock())
	{
		addButton(1,"Ass fuck",sexLilly_AssFuck, undefined,"Fuck her butt","Well, if she insists on her butt being used, who are you to refuse?");
	}
	else 
	{
		addDisabledButton(1,"Ass fuck","Fuck her butt","You don't have anything to put in there.");
	}
	
	addButton(14, "Back", approachLilly);
}

public function sexLilly_EatHerOut():void 
{
	clearOutput();
	clearMenu();
	showLilly(true);
	
	output("<i>“You said no dicks in your pussy right?”</i> you ask, as you look down at her.\n\n");
	output("<i>“Uh-huh! Why?”</i> she replies as you begin " + (pc.hasKnees() ? "kneeling down" : "lowering yourself") + " in front of her.\n\n");
	if ((pc.isAss() || pc.isBro()) && pc.hasCock())
	{
		output("<i>“Shame. I'll have to use my tongue then”</i> you say, as you touch the ground and you look up at her, imploringly.\n\n");
		output("She giggles. <i>“Go on then! Not many of the bulls around here pay attention to it after they're told the backdoor's an option though, so it might be a bit.. sensitive”</i>\n\n");
	}
	else 
	{
		output("<i>“So tongues are fine then?”</i> you say, as you touch the ground and you look up at her, imploringly.");
		output("She giggles. <i>“Absolutely! Not many of the bulls around here pay attention to it after they're told the backdoor's an option though, so it might be a bit.. sensitive”</i>\n\n");
	}
	output("You lean forward slightly. As you do, the scent of her sweat draws you forward like an invitation, the stronger her scent, the greater your wish to bury your mouth in her pussy grows. You grab hold of the sides of her swimsuit and pull them towards each other, the elasticated fabric sliding over her chiselled midsection with ease until you're able to grab it in one hand, like a rope. As it reaches this stage, the swimsuit rides up between her labia causing her to gasp loudly.\n\n");
	output("<i>“Feels good right?”</i> you say rhetorically, gazing up into her glistening blue eyes.\n\n");
	output("<i>“Ah, y-yeah”</i> she stammers.\n\n");
	if (pc.isBro())
	{
		output("<i>“Yeah, thought it would. Let's see if I can warm you up a little.”</i>\n\n");
	}
	else 
	{
		output("<i>“Good. Let's see if I can warm you up a little.”</i>\n\n");
	}
	output("As you say this, you grab the swimsuit at her underside, so you're holding a rope of half rough, half rubbery material between her lips. Unfurling it so it's flat in the center, you begin threading the swimsuit between them.\n\n");
	output("<i>“Ah-h-haa”</i> she moans, her legs shaking, as the fabric rubs against her insides. As it reaches the bottom, she exhales as she gets a brief moment of reprieve before you loosen your grip at the bottom and begin pulling it upwards, making sure to angle your pulling in such a way that it rubs along her clit. She quivers and sucks air in, murmuring as the material slides along its length, bending her elasticated nub upwards and letting it bounce back with each inch.\n\n");
	output("<i>“Mmm”</i> you moan, several gasp-filled repetitions later as you notice the swimsuit has darkened. As you pull it out from between her insides, you see strings of girlcum attached to it. <i>“Looks like you're all warmed up”</i>\n\n");
	output("<i>“Ahhh, fuck”</i> she moans, slumping backwards in sweet release. <i>“If that's how good that felt, I can't wait for your tongue.”</i>\n\n");
	output("<i>“Oh yeah?”</i> you reply, pulling the damp swimsuit to to the side, wedging it between her labia and her muscular thighs, exposing her tight snatch before leaning forward and pressing your [pc.lips] to her flesh.\n\n");
	output("You plant kisses along her labia, purposely pressing your lips into the strings of girlcum that've been pulled across by her swimsuit before looking up at her and licking them off your lips. This close to her, the sweet smell of her sweat overwhelms you with feelings of lust.\n\n");
	output("<i>“Aha, do I taste good?”</i> Lilly moans.\n\n");
	output("<i>“I need more!”</i> you reply, grabbing her by the hips and diving tongue-first into her.\n\n");
	output("Driven wild by her venomous sweat, you lash your tongue wildly around her insides, lapping up every droplet of moisture you find inside her. She moans wildly and loudly as you titillate her sensitive insides with your [pc.tongue], unable to even attempt holding back her appreciation. Her pliable insides ripple around your tongue with each movement, dripping her juices all over your tastebuds and shortly over your lips, as her flow increases from your efforts with a gasp. You keep going, unable and unwilling to stop, flicking your tongue along the length of her clit as you reach the top before swirling around her walls again and again, drawing her ever increasing juices into your mouth as she gasps and moans and places her hand on the back of your head and pulls you into her crotch, needlessly encouraging you to continue, to push her over the edge, when the mixture of her sweat and your own lust has already encouraged you enough.\n\n");
	
	output("You touch your tongue to the roof of her dripping ceiling and run your tongue along it, starting at her clit, running it all the way along");
	if (pc.hasLongTongue())
	{
		output(" to her depths using your lengthy tongue, ");
	}
	else 
	{
		output(" and as deep into her as your tongue will go, ");
	}
	output("and flick it back up, making her gasp and dribble. She's so close to the edge, you can taste it. You place your tongue on the end of her nib and flick your tongue back and forth across the end of her pliable clit, it rocking back and forth with your movements. Lilly pants harder and harder at this, in time with your motions, louder and louder as you hasten, her insides dampening to the point that her juices flick off in the direction of your motions like raindrops.\n\n");
	
	output("<i>“Oh fuck, [pc.name], oh fuck, I'm gonna cum, I'm gonna cum”</i> she screeches, effectively vibrating against your dampened face at this point as you continue licking hastily between her legs.\n\n");
	output("She clamps her legs around your neck and cries out loudly. Her insides throbb and contract, clamping down on your mouth before suddenly firing her juices out, filling your mouth like water from a hose until you're forced to jerk yourself back and let her love cover your face, relentlessly soaking you until her fountain dies down to a dribble before stopping, leaving her cross-legged and trembling on the bench, the juices that aren't dribbling down your face dribbling down the side of the bench she's sat on, some pooling on top.\n\n");
	output("<i>“Ughhh, thanks, that was great”</i> she drawls, barely staying conscious as she slouches back on the bench, exhausted.\n\n");
	output("<i>“No problem”</i> you reply, standing up and licking all the outcome of the session that you can, from around your lips.\n\n");
	
	pc.lust(10);
	processTime(10);
	pc.girlCumInMouth(chars["LILLY"]);
	chars["LILLY"].orgasm();
	pc.applyPussyDrenched();
	pc.exhibitionism(2);
	addButton(0, "Next", approachLilly);
}

public function sexLilly_AssFuck():void 
{
	clearOutput();
	clearMenu();
	showLilly(true);
	
	if (pc.isAss())
	{
		output("<i>“Alright, slut, let's see that butthole of yours”</i> you demand, leaning over her.\n\n")
	}
	else if (pc.isBro())
	{
		output("<i>“Alright then, let me tap that ass”</i> you grunt, leaning over her.\n\n")
	}
	else if (pc.isBimbo())
	{
		output("<i>“Alright, show me that Lilly-butt!”</i> you giggle, leaning over her.\n\n")
	}
	else
	{
		output("<i>“Alright, let's see that ass”</i> you demand, leaning over her.\n\n")
	}
	
	output("Lilly stands up, bumping into your [pc.chest], pushing you backwards, before turning around. Looking over her shoulder at you, she brings one claw to the top portion of her swimsuit and pulls it over her shoulder, pulling her arms out of it, revealing one side of her bare, muscular back. She proceeds to the other shoulder, pulling the swimsuit over it, dropping it off her upper body before leaning forward and shaking her hips, erotically, from side to side, steam flowing around her half naked body. You watch as her noticeable buttocks sway like pendulums before your eyes.\n\n");
	output("<i>“Should I take the rest off?”</i> Lilly teases.\n\n");
	if (pc.isAss() || pc.isBro())
	{
		output("<i>“Fuck yeah”</i> you respond.\n\n")
	}
	else if (pc.isBimbo())
	{
		output("<i>“Totally. Right now.”</i> you respond.\n\n")
	}
	else if (pc.isMischievous())
	{
		output("<i>“Well, if you want me to see your ass you should”</i> you respond.\n\n")
	}
	else
	{
		output("<i>“Mmm, definitely”</i> you respond.\n\n")
	}
	
	output("She twists her head back around, facing the wall and leans forward, placing her hands on the back of the bench before reaching back and pulling the swimsuit down and slowly over her buttocks, presenting her flesh to you inch by inch. As it slips over the bottom of her buttocks with a slight jiggle, she stands up and pushes the swimsuit down her hamstrings and pulls the swimsuit off, leaving it on the floor.\n\n");
	
	if (flags["LILLY_SEEN_BUTTHOLE"] == undefined)
	{
		output("Lilly then leans back forward, placing her arms yet again on the bench and spreads her buttocks. You're taken by surprise. Clearly, her insistence on her backdoor being used on a planet like New Texas has had quite the effect. Her butthole is surrounded by plush black flesh, dribbling with streams of ass-lube, as it's adapted to being the main hole. It's also fairly gapey and if what you know about her race is correct, it can get gapier.\n\n");
		flags["LILLY_SEEN_BUTTHOLE"] = true;
	}
	else 
	{
		output("Lilly then leans back forward, placing her arms yet again on the bench and spreads her buttocks, presenting her wet, puffy, black butthole. You watch as her eager flesh pulsates, ready for whatever you have to offer.\n\n");
	}
	
	output("<i>“You done staring?”</i> Lilly asks, patting her ass and smirking in your direction, over her shoulder. <i>“Go on, I'm ready”</i>\n\n");

	if (pc.isTaur())
	{
		output("You don't need to be told twice. You trot forward and stand up on your hindquarters, mounting her. You then lean forward, ");
	}
	else if (pc.isNaga())
	{
		output("You don't need to be told twice. You slither forward and grab hold of her hips. You then lean forward, ");
	}
	else 
	{
		output("You don't need to be told twice. You walk a step forward and grab hold of Lilly's firm hips. You then lean forward ");
	}
	output("and with one [pc.hand] ");
	if (pc.isCrotchGarbed()) output("you undo your [pc.crotchcovers], then ");
	output("you grab hold of ");
	
	if (pc.hasCocks())
	{
		output("the base of your [pc.cocks], presenting them to her.\n\n");	
		output("<i>“Could you put them all in?”</i> Lilly suddenly asks. <i>“I'm pretty flexible inside”</i>.\n\n");
		output("<i>“Uhh, if you think so”</i> you respond.\n\n");
	}
	else 
	{
		output("your [pc.cock], presenting it to her.\n\n");	
		if (pc.biggestCockLength() >= 15) 
		{
			output("<i>“Don't worry, you can definitely fit that big boy in”</i> Lilly begs, noticing the size of your member. <i>“I'm pretty flexible inside”</i>.\n\n");
			output("<i>“Uhh, if you think so”</i> you respond.\n\n");
		}
		else 
		{
			output("<i>“Go on, put it in”</i> Lilly begs, wiggling her behind.");
		}
	}
	
	output("As you line up your " + (pc.hasCocks() ? "tips" : "tip") + " with Lilly's sloppy behind, it pulses and her warm, plush butt-flesh wraps itself around the " + (pc.hasCocks() ? "ends" : "end") + " of your " + (pc.hasCocks() ? "members" : "member") + ", inviting you in.\n\n");
	output("Her plush insides keep pulling you in, not that you're not helping.\n\n");
	
	if (pc.hasCocks())
	{
		output("Your dicks sit side by side inside her, pushing into her. Her elasticated insides part around their widths, accepting them.\n\n");
	}
	else if (pc.biggestCockLength() >= 15) 
	{
		output("You've pushed your sizeable dick partly into her, parting her elasticated walls with its width.\n\n");
	}
	else if (pc.biggestCockLength() >= 4)
	{
		output("Her pliable insides fit snugly around your width, accepting you.\n\n");
	}
	else 
	{
		output("Her elasticated insides clamp down snugly on your meager shaft, as to make the most of it.\n\n");
	}
	
	output("You keep going.");
	if (pc.hasKnot())
	{
		output(" Lilly gasps, as her insides curve around your [pc.knot].");
	}
	output("\n\n");
	if (pc.biggestCockLength() >= 15)
	{
		output("You're not nearly at your depth yet. Far from it, your lengthy " + (pc.hasCocks() ? "tools" : "tool") + " crawls further through her comfortable insides and you feel flesh push against yours as you hit her depth.\n\n");
		output("<i>“Keep going”</i> Lilly begs. <i>“I don't just stretch widthways”</i>.\n\n");
		output("You thrust carefully against her limit and find that it stretches gently as you do. With a gasp from Lilly, you continue to gently push into her, her depth expanding gently until you finally reach your depth.\n\n");
		if (pc.biggestCockLength() >= 20)
		{
			output("She's had to stretch out quite a lot for you, to the point that you can see the other end of your dick/dicks bulging against her stomach.\n\n");
		
			
		}
	}
	else 
	{
		output("Finally, you reach your depth, Lilly's puffy butthole pressing comfortably against your groin.\n\n");
	}
	
	output("With your " + (pc.hasCocks() ? "dicks" : "dick") + " finally in her, you're all set up. You pull your hips back, her insides pushing against your " + (pc.hasCocks() ? "cocks" : "cock") + " as you do before thrusting forward. Her legs bump into the bench as you do but she soon steadies herself and smiles at you.\n\n");
	output("<i>“Go on. No need to be careful with me!”</i>\n\n");
	output("You take her word for it and unleash on the swimmer girl. Her damp anus makes it easy to slam your rock-hard " + (pc.hasCocks() ? "rods" : "rod") + " deep into her, accompanied by squelching and moaning as she rocks back and forth in turn along your " + (pc.hasCocks() ? "lengths" : "length") + ". At this pace you find yourself struggling to hold on to the girls sweat-stained skin and the thick steam in the air combined with the effort you're putting into her is making it hard to breath. Sweat runs down your body but for all the exhaustion this is causing you, there's no way you'd ever want to stop. The feeling of her soft, damp insides pressing down on your pulsating " + (pc.hasCocks() ? "members" : "member") + " is incredible and the heat coming off of her growing stronger as you press deep into her exceeds that of the steam room.\n\n");
	output("You keep thrusting, back and forth, her squelching anus spraying it's warm juices against your crotch with each thrust and she moans every time as you pack her ass full of your cockmeat. Not that Lilly isn't doing just as much work. Her hands are pressed against the bench, thrusting herself along your length, groaning and moaning as her insides try to milk you for all you're worth. Her hamstrings ripple as her strong legs hold her behind upright against your assault. The sound of your " + (pc.hasCocks() ? "cocks" : "cock") + " squishing against her damp insides, echo around the room.\n\n");
	output("<i>“Fuck! Keep going! Fuck my sloppy asshole!”</i> Lilly cries out, arching her back. She's completely given in to her lusty side, her long tongue dangling idly from her mouth and her eyes rolled back in ecstasy.\n\n");	
	output("You're not sure how long you can keep going for. Her butt is just too perfect, rippling along your " + (pc.hasCocks() ? "shafts" : "shaft") + " constantly, massaging " + (pc.hasCocks() ? "them" : "it") + " to " + (pc.hasCocks() ? "their limits" : "its limit") + ".\n\n");
	output("<i>“Hnghh! There's no way I'm lasting much longer in this”</i> you cry out. <i>“I'm gonna cum!”</i>\n\n");
	output("<i>“Aha, that's just as good”</i> Lilly slurs.\n\n");
	
	output("Will you cum <b>inside</b> or <b>outside</b>?");
	
	pc.lust(30);
	addButton(0, "Inside", sexLilly_AssFuck_CumInside);
	addButton(1, "Outside", sexLilly_AssFuck_CumOutside);
}

public function sexLilly_AssFuck_CumInside():void 
{
	clearOutput();
	clearMenu();
	showLilly(true);
	
	if (pc.cumQ() == 0)
	{
		output("You gasp as [pc.eachCock] throbs against her walls, which clamp down tight on you in reaction, as her body prepares to squeeze every last drop out of you. As this happens, you gasp but all your " + (pc.hasCocks() ? "cocks do" : "cock does") + " is throb anti-climatically. You lose focus on what's happening in pure ecstasy for several seconds before Lilly draws you back to reality.\n\n");
		output("<i>“Uhh, thanks”</i> she says disgruntledly. <i>“At least it felt good before that.”</i>\n\n");
		output("You pull out slowly, thanking Lilly for the fun.\n\n");
	}
	else if (pc.cumQ() <= 25)
	{
		output("You gasp as [pc.eachCock] throbs against her walls, which clamp down tight on you in reaction, as her body prepares to squeeze every last drop out of you. As this happens, you gasp and several short, sharp bursts of [pc.cum] fire from your " + (pc.hasCocks() ? "cocks" : "cock") + ". You lose focus on what's happening in pure ecstasy for several seconds before Lilly draws you back to reality.\n\n");
		output("<i>“Mmm, thanks”</i> she says, as you feel the last few blobs oozing out.\n\n");
		output("You pull out slowly, thanking Lilly for the fun.\n\n");
	}
	else if (pc.cumQ() <= 75)
	{
		output("You gasp as [pc.eachCock] throbs against her walls, which clamp down tight on you in reaction, as her body prepares to squeeze every last drop out of you. As this happens, you gasp and several large, explosive bursts of [pc.cum] fire from your " + (pc.hasCocks() ? "cocks" : "cock") + ". You're lost in pure ecstasy for several seconds as you enjoy this feeling, her plush rectum wrapping around your climaxing " + (pc.hasCocks() ? "tools, egging them on" : "tool, egging it on") + " as you fill her tightened rectum with your warmth. Lilly loves it too, moaning with each burst you fill her with, her body subconsciously milking you until you're completely dry.\n\n");
		output("<i>“Ahh, thanks. That was great”</i> she slurs, as you pull out slowly.\n\n");
	}
	else if (pc.cumQ() <= 150)
	{
		output("You gasp as [pc.eachCock] throbs against her walls, which clamp down tight on you in reaction, as her body prepares to squeeze every last drop out of you. But her body doesn't know quite what's coming. At her bodies embrace, you gasp and several huge, streams of [pc.cum] fire from your " + (pc.hasCocks() ? "cocks" : "cock") + ". You're lost in pure ecstasy as you enjoy this feeling, her plush rectum wrapping around your climaxing " + (pc.hasCocks() ? "tools, egging them on" : "tool, egging it on") + " as you fill her tightened rectum with your warmth. Lilly loves it too, moaning with each burst you fill her with, her body subconsciously milking you, eager to receive the full might of your load. Your climax continues and her insides expand further to make room for your prestigious load, ballooning in size to the point that her normally chiselled stomach has bulged to make room for the sheer amount of [pc.cum] you're pumping into her. Lilly's loving it, gasping and giggling as she feels herself ballooning further and further, until the last spurt of splooge you can provide her with has been emptied into her.\n\n");
		output("<i>“A-ah-a wow”</i> she slurs, as you pull out slowly. <i>“I'm glad walking to the showers full of cum is normal here, there's no way I could swim like this!”</i>\n\n");
	}
	else 
	{
		output("You gasp as [pc.eachCock] throbs against her walls, which clamp down tight on you in reaction, as her body prepares to squeeze every last drop out of you. But her body doesn't know quite what's coming. At her bodies embrace, you gasp and a ginormous virile, stream of [pc.cum] erupts from your " + (pc.hasCocks() ? "cocks" : "cock") + ". You're lost in pure ecstasy as you enjoy this feeling, her plush rectum wrapping around your climaxing " + (pc.hasCocks() ? "tools, egging them on" : "tool, egging it on") + " as you quickly flood her tightened rectum with your warmth. Lilly gasps in surprise at the sheer size of the bursts you're filling her with and her body quickly reacts, her backdoors grip quickly loosening to make room for the tide of cum pouring into her. Her insides are forced to expand further quickly, as your prestigious load continues to fire into her. She constantly moans and gasps as her normally chiselled stomach balloons in size to the point that she looks pregnant with the sheer amount of [pc.cum] you've pumped into her already. It keeps expanding, now the size of a large exercise ball and you soon find the girl at her limit. Your cum starts firing back, pouring down her puffy, black anus in waves and spilling down her muscular legs and splashing onto the steam room floor.\n\n");
		output("A short while later you're finally drained of cum and you pull your cum-covered " + (pc.hasCocks() ? "cocks" : "cock") + " out slowly.\n\n");
		output("<i>“Wow!”</i> Lilly exclaims, clutching her stomach. <i>“I'm going to empty myself in the showers when I can.. There's no way I could swim like this!”</i>\n\n");
	}
	
	processTime(10);
	pc.exhibitionism(2);
	pc.orgasm();
	addButton(0, "End", approachLilly);
}

public function sexLilly_AssFuck_CumOutside():void 
{
	clearOutput();
	clearMenu();
	showLilly(true);
	
	if (pc.cumQ() == 0)
	{
		output("You gasp and pull out, quickly grabbing hold of [pc.eachCock] and aiming " + (pc.hasCocks() ? "them" : "it") + " down her chiselled back. As this happens, you gasp again but all your " + (pc.hasCocks() ? "cocks do" : "cock does") + " is throb anti-climatically. You lose focus on what's happening in pure ecstasy for several seconds before Lilly draws you back to reality.\n\n");
		output("<i>“Uhh, what are you doing”</i> she laughs. <i>“Guess you're finished. Thanks for the sex before that though!”</i>\n\n");
	}
	else if (pc.cumQ() <= 25)
	{
		output("You gasp as [pc.eachCock] throbs against her walls, which clamp down tight on you in reaction, as her body prepares to squeeze every last drop out of you. As this happens, you gasp and quickly pull out of her pulsating anus, grasping your " + (pc.hasCocks() ? "cocks" : "cock") + " in your [pc.hands] and aiming " + (pc.hasCocks() ? "them" : "it") + " down her chiselled back. Just in time, several short, sharp streams of [pc.cum] fire from your cock/cocks and you lose focus, focusing on the feeling of your climax. Lilly quickly snaps you back to reality and you look down at her, several long lines of [pc.cumcolor] down her back.");
		output("<i>“Mmm, thanks”</i> she says, as you feel the last few blobs ooze out onto her butt.\n\n");
		output("You pat Lilly on the butt, thanking her for the fun.\n\n");
	}
	else if (pc.cumQ() <= 75)
	{
		output("You gasp as [pc.eachCock] throbs against her walls, which clamp down tight on you in reaction, as her body prepares to squeeze every last drop out of you. As this happens, you gasp and quickly pull out of her pulsating anus, grasping your " + (pc.hasCocks() ? "cocks" : "cock") + " in your [pc.hands] and aiming " + (pc.hasCocks() ? "them" : "it") + " down her chiselled back. Just in time, several large, explosive bursts of [pc.cum] fire from your " + (pc.hasCocks() ? "cocks" : "cock") + ", spraying Lilly's back [pc.cumcolor] with each spasm. Lilly loves it too, moaning as [pc.cum] splashes her, enjoying the reward her incredible butt has earned her. Several shorter, sharp streams fire from your " + (pc.hasCocks() ? "tips" : "tip") + " splashing her more, before dying down to a trickle, dribbling onto her ass.\n\n");
		output("<i>“Mmm, thanks”</i> she says, as you feel the last few blobs ooze out onto her butt.\n\n");
		output("You pat Lilly on the butt, thanking her for the fun.\n\n");
	}
	else 
	{
		output("You gasp as [pc.eachCock] throbs against her walls, which clamp down tight on you in reaction, as her body prepares to squeeze every last drop out of you. As this happens, you gasp and quickly pull out of her pulsating anus, grasping your " + (pc.hasCocks() ? "cocks" : "cock") + " in your [pc.hands] and aiming " + (pc.hasCocks() ? "them" : "it") + " down her chiselled back. Just in time, several huge, streams of [pc.cum] fire from your " + (pc.hasCocks() ? "cocks" : "cock") + ", coating Lilly's back [pc.cumcolor], each spasm splashing sloppily against the previous. Lilly loves it too, moaning as [pc.cum] splashes her, enjoying the prestigious reward her incredible butt has earned her. More streams come, dripping down her sides as they slip right off her already coated back. You aim lower, blasting her buttocks with strong enough loads to make her recoil against the bench. Your streams eventually die down and you finish off by patting your " + (pc.hasCocks() ? "cocks" : "cock") + " between her buttocks, shaking the last few globs of cum onto her.");
		output("<i>“A-ah wow”</i> she slurs, as she stands up, cum dripping from her behind. <i>“I'm glad it's normal to wash off cum in the shower here, or I'd be getting some odd looks.”</i>\n\n");
	}
	
	processTime(10);
	pc.exhibitionism(2);
	pc.orgasm();
	addButton(0, "End", approachLilly);
}