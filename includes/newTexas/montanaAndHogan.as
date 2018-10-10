import classes.Characters.Hogan;
import classes.Characters.Montana;

//Available Flags
//MONTANA_AND_HOGAN_APPROACHED: If the player has approached them before
//MONTANA_AND_HOGAN_ACCEPTED: If the player has been accepted by them
//MONTANA_AND_HOGAN_ACCEPTED_BEFORE: If the player has been accepted by them before
//MONTANA_AND_HOGAN_TALKED_ROUTINE: If the player has talked to them about their routine. Lets them join in.

public function showMontanaHogan(nude:Boolean = false):void
{
	showName("MONTANA AND\nHOGAN");
	
	if (nude) showBust("MONTANA_AND_HOGAN_NUDE");
	else showBust("MONTANA_AND_HOGAN");
	
	author("HNB");
}

public function montanaHoganBroOrBabe():String
{
	if (pc.isFemale() || pc.isFemHerm() || pc.isShemale() || kGAMECLASS.pc.mf("", "f") == "f")
	{
		return "babe";
	}
	return "bro";
}

public function montanaHoganFindYouCool():Boolean
{
	if (montanaHoganBroOrBabe() == "babe")
	{
		if (pc.isBimbo() || pc.biggestTitSize() >= 4)
		{
			return true;
		}
		else 
		{
			return false;
		}
	}
	else if (pc.tone >= 50 || pc.isBro())
	{
		return true;
	}
	return false;
}

public function montanaHoganFindYouHot():Boolean
{
	if (montanaHoganBroOrBabe() == "babe")
	{
		return true;
	}
	else if (pc.femininity > 50)
	{
		return true;
	}
	return false;
}

public function approachMontanaHogan():void
{
	clearOutput();
	clearMenu();
	showMontanaHogan();
	
	if (chars["MONTANA"] == undefined)
	{
		chars["MONTANA"] = new Montana();
		chars["HOGAN"] = new Hogan();
	}
	
	if (flags["MONTANA_AND_HOGAN_APPROACHED"] == undefined)
	{
		flags["MONTANA_AND_HOGAN_APPROACHED"] = true;
		
		if (pc.isBro())
		{
			output("<i>“Hey, haven't seen you dudes around here before. Wassup?”</i> you ask, taking a seat next to the two young bulls.\n\n");
		}
		else if (pc.isBimbo())
		{
			output("<i>“Heyyy, haven't seen you studs around here before. You guys looking for some fun?”</i> you ask, taking a seat next to the two young bulls.\n\n");
		}
		else 
		{
			output("<i>“Hey, haven't seen you guys around here before”</i> you say, taking a seat next to the two bulls.\n\n");
		}
		
		// PC is female enough.
		if (montanaHoganBroOrBabe() == "babe")
		{
			if (montanaHoganFindYouCool())
			{
				output("<i>“Oh, hey hot stuff”</i> the brown haired one says, raising his sunglasses to look at you properly. <i>Yeah, you can chill with us.”</i>\n\n");
				output("<i>“Yeah, a cutie like you should hang with some cool dudes”</i> the other one chimes in. <i>“What's your name babycakes?”</i>\n\n");
				output("<i>“[pc.name]”</i> you reply");
				
				if (pc.isBimbo()) output(", giggling.\n\n");
				else output(".\n\n");
				
				output("<i>“I'm Hogan and he's Montana”</i> the " + (pc.isBimbo() ? "cute, " : "") + "blonde one responds" + (pc.biggestTitSize() >= 4 ? ", staring at your [pc.tits]" : "") + ".");
				flags["MONTANA_AND_HOGAN_ACCEPTED"] = true;
				flags["MONTANA_AND_HOGAN_ACCEPTED_BEFORE"] = true;
				addButton(0, "Next", mainMontanaHogan);
			}
			else 
			{
				output("<i>“Hey, back off. Hot girls only!”</i> the brown haired bull says, pushing you away.\n\n");
				output("<i>“Yeah”</i> the other one laughs. <i>“No nerds like you.”</i>\n\n");
				addButton(0, "Back", mainGameMenu);
			}
		}
		else
		{
			if (montanaHoganFindYouCool())
			{
				output("<i>“Oh, hey bruh”</i> the brown haired one says, raising his sunglasses to look at you properly. <i>“Yeah, you can chill with us, you seem cool.”</i>\n\n");
				output("<i>“Yeah, you does”</i> the other one chimes in. <i>“What's your name bro?”</i>\n\n");
				output("<i>“[pc.name]”</i> you reply, bumping fists with each one in turn.\n\n");
				output("<i>“I'm Hogan and he's Montana”</i> the blonde one responds, nodding at you.\n\n");
				flags["MONTANA_AND_HOGAN_ACCEPTED"] = true;
				flags["MONTANA_AND_HOGAN_ACCEPTED_BEFORE"] = true;
				addButton(0, "Next", mainMontanaHogan);
			}
			else  
			{
				output("<i>“Hey, back off dweeb”</i> the brown haired bull says, pushing you away.\n\n");
				output("<i>“Yeah, sorry bruh, cool dudes only”</i> the other one laughs.\n\n");
				addButton(0, "Back", mainGameMenu);
			}
		}
	}
	else if (flags["MONTANA_AND_HOGAN_APPROACHED"] == true && (flags["MONTANA_AND_HOGAN_ACCEPTED"] == undefined || flags["MONTANA_AND_HOGAN_ACCEPTED"] == false))
	{
		if (pc.isBro())
		{
			output("<i>“Hey bruhs, we cool now?”</i> you ask, taking a seat next to the two bulls.\n\n");
		}
		else if (pc.isBimbo())
		{
			output("<i>“Heyyy, you sure I can't hang out with you studs?”</i> you ask, taking a seat next to two young bulls.\n\n");
		}
		else 
		{
			output("<i>“Hey, we cool now guys?”</i> you ask, taking a seat next to the two bulls.\n\n");
		}
		
		if (montanaHoganBroOrBabe() == "babe")
		{
			if (montanaHoganFindYouCool())
			{
				output("<i>“Oh, hey hot stuff”</i> the brown haired one says, raising his sunglasses to look at you properly. <i>Yeah, you can chill with us.”</i>\n\n");
				if (flags["MONTANA_AND_HOGAN_ACCEPTED_BEFORE"] == undefined)
				{
					output("<i>“Yeah, a cutie like you should hang with some cool dudes”</i> the other one chimes in. <i>“What's your name babycakes?”</i>\n\n");
					output("<i>“[pc.name]”</i> you reply");
					
					if (pc.isBimbo()) output(", giggling.\n\n");
					else output(".\n\n");
					
					output("<i>“I'm Hogan and he's Montana”</i> the " + (pc.isBimbo() ? "cute, " : "") + "blonde one responds" + (pc.biggestTitSize() >= 4 ? ", staring at your [pc.tits]" : "") + ".");
				}
				flags["MONTANA_AND_HOGAN_ACCEPTED"] = true;
				flags["MONTANA_AND_HOGAN_ACCEPTED_BEFORE"] = true;
				addButton(0, "Next", mainMontanaHogan);
			}
			else 
			{
				output("<i>“Hey, back off. Hot girls only!”</i> the brown haired bull says, without turning to give you the time of day.\n\n");
				output("<i>“Yeah”</i> the other one laughs. <i>“No nerds like you.”</i>\n\n");
				addButton(0, "Back", mainGameMenu);
			}
		}
		else
		{
			if (montanaHoganFindYouCool())
			{
				output("<i>“Oh, hey bruh”</i> the brown haired one says, raising his sunglasses to look at you properly. <i>“Yeah, you can chill with us, you seem cool.”</i>\n\n");
				if (flags["MONTANA_AND_HOGAN_ACCEPTED_BEFORE"] == undefined)
				{
					output("<i>“Yeah, you does”</i> the other one chimes in. <i>“What's your name bro?”</i>\n\n");
					output("<i>“[pc.name]”</i> you reply, bumping fists with each one in turn.\n\n");
					output("<i>“I'm Hogan and he's Montana”</i> the blonde one responds, nodding at you.\n\n");
				}
				flags["MONTANA_AND_HOGAN_ACCEPTED"] = true;
				flags["MONTANA_AND_HOGAN_ACCEPTED_BEFORE"] = true;
				addButton(0, "Next", mainMontanaHogan);
			}
			else  
			{
				output("<i>“Hey, back off dweeb”</i> the brown haired bull says, without turning to give you the time of day.\n\n");
				output("<i>“Yeah, sorry bruh, cool dudes only”</i> the other one laughs.\n\n");
				addButton(0, "Back", mainGameMenu);
			}
		}
	}
	else 
	{
		if (pc.isBro())
		{
			output("<i>“Hey, bros. Mind if I join you?”</i> you ask, taking a seat next to the two young bulls.\n\n");
		}
		else if (pc.isBimbo())
		{
			output("<i>“Heyyy, mind if I join you two?”</i> you ask,  taking a seat next to the two young bulls.\n\n");
		}
		else 
		{
			output("<i>“Hey, mind if I hang out with you two?”</i> you ask,  taking a seat next to the two bulls.\n\n");
		}
		
		if (montanaHoganBroOrBabe() == "babe")
		{
			if (montanaHoganFindYouCool())
			{
				output("<i>“Sure thing, hot stuff”</i> Hogan replies. <i>“You can hang with us, day or night.”</i>\n\n");
				addButton(0, "Next", mainMontanaHogan);
			}
			else 
			{
				output("<i>“Eww, no”</i> Montana replies, pushing you away. <i>“I swear you used to be hot babe but you're kinda not anymore.”</i>\n\n");
				flags["MONTANA_AND_HOGAN_ACCEPTED"] = false;
				addButton(0, "Back", mainGameMenu);
			}
		}
		else
		{
			if (montanaHoganFindYouCool())
			{
				output("<i>“Sure you can, bruh”</i> Hogan replies. <i>“Any time”</i>\n\n");
				addButton(0, "Next", mainMontanaHogan);
			}
			else 
			{
				output("<i>“No way bro”</i> Montana replies, pushing you away. <i>“You look like a total nerd now.”</i>\n\n");
				flags["MONTANA_AND_HOGAN_ACCEPTED"] = false;
				addButton(0, "Back", mainGameMenu);
			}
		}
	}
}

public function mainMontanaHogan():void 
{
	clearMenu();
	showMontanaHogan();
	
	addButton(0, "Appearances", appearancesMontanaHogan, undefined, "Appearances", "Eye up the two young bull-bros.");
	addButton(1, "Talk", talkMontanaHogan, undefined, "Talk", "Have a few words with the bros.");
	addButton(2, "Sex", sexMontanaHogan, undefined, "Sex", "Show them another kind of workout that they're all too familiar with.");
	addButton(14, "Back", mainGameMenu);
}

public function appearancesMontanaHogan():void 
{
	clearMenu();
	clearOutput();
	showMontanaHogan();
	
	output("You take a moment to eye up the two bros. Both are roughly 6 foot tall and have muscular, tanned, humanoid bodies, gained through frequent, treated workout sessions together. Their humanoid bodies are accompanied by an array of traditional New Texan bull-like features including bovine horns, tails and ears.\n");
	output("Hogan has a strong, angular jawline, decorated with a line of short, dark stubble and framed by two large bovine ears and topped with a flurry of mid-length, golden hair, with two horns sticking out from it. The same golden hair finishes off the end of his tail, that sticks out from the back of his tight, blue, gym shorts which do a poor job of concealing his sizeable bulge, an outline of his cock clearly visible.\n");
	output("Montana has a fairly similar body. He has messy brown hair and a squarer face, with horns sticking out from the side of his head and a pair of sunglasses covering his eyes. His shorts are red and, much like Hogan's, do not leave much to the imagination.");
	
	addButton(0, "Next", mainMontanaHogan);
}

public function talkMontanaHogan():void 
{
	clearMenu();
	clearOutput();
	showMontanaHogan();
	
	output("<i>“What's on your mind " + montanaHoganBroOrBabe() + "?”</i>");
	
	addButton(0, "Treatment", talkMontanaHogan_Treatment);
	addButton(1, "How meet?", talkMontanaHogan_Meet);
	addButton(2, "Routine", talkMontanaHogan_Routine);
	
	addButton(14, "Back", mainMontanaHogan);
}

public function talkMontanaHogan_Treatment():void 
{
	clearOutput();
	
	if (montanaHoganBroOrBabe() == "babe")
	{
		if (pc.isTreated())
		{
			if (pc.isBimbo())
			{
				output("<i>“So what do you guys think of this treatment stuff?”</i> you ask. <i>“Pretty fucking amazing right?”</i> you say, remembering all the great things it did to you.\n\n");
			}
			else 
			{
				output("<i>“So what do you guys think of the treatment?”</i> you ask, recalling your experiences with it.\n\n");
			}
			output("<i>“Haha, yeah, I can see you're pretty familiar with it babe”</i> Hogan says his gaze fixed on your body.\n\n");
			output("<i>“Damn right she is, bro”</i> Montana chimes in. <i>“It's done you wonders babe. That's one thing it's good for. Treated girls are so hot, even those really muscular ones.”</i>\n\n");
		}
		else 
		{
			if (pc.isBimbo())
			{
				output("<i>“So what do you guys think of this treatment stuff?”</i> you ask. <i>“I've like, heard a lot about it.”</i>\n\n");
			}
			else 
			{
				output("<i>“So what do you guys think of the treatment?”</i> you ask. <i>“I've heard a lot about it around here.”</i>\n\n");
			}
			output("<i>“Oh yeah, you'll hear a lot about it around here, babe”</i> Hogan says. <i>“Everyone around here's treated. It's pretty great.”</i>\n\n");
			output("<i>“Damn right bro”</i> Montana chimes in. <i>“Wouldn't have it any other way, Treated girls are so hot, even those really muscular ones.”</i>\n\n");
		}
	}
	else
	{
		if (pc.isTreated())
		{
			if (pc.isBro())
			{
				output("<i>“What do you guys think of that treatment stuff?”</i> you ask. <i>“Good shit, right?”</i> you say, recalling your experiences with it.\n\n");
			}
			else 
			{
				output("<i>“So what do you guys think of the treatment?”</i> you ask, recalling your experiences with it.\n\n");
			}
			output("<i>“Haha, yeah, can see you're on it too bro”</i> Hogan says, reaching a hand out for a high five, that you quickly accept.\n\n");
			output("<i>“It's pretty fucking great bro”</i> Montana chimes in. <i>“Treated girls get me so hard, y'know? Even the really muscular ones, so fucking hot.”</i>\n\n");
		}
		else 
		{
			if (pc.isBro())
			{
				output("<i>“So, what do you guys think of that treatment stuff?”</i> you ask. <i>“I've heard about it and stuff but like, what do you dudes think?”</i>\n\n");
			}
			else 
			{
				output("<i>“So what do you guys think of the treatment?”</i> you ask. <i>“I've heard a lot about it around here.”</i>\n\n");
			}
			output("<i>“Oh yeah, you'll hear a lot about it around here, bro”</i> Hogan says. <i>“Everyone around here's treated. It's pretty great.”</i>\n\n");
			output("<i>“Damn right bro”</i> Montana chimes in. <i>“Wouldn't have it any other way, Treated girls are so hot, even those really muscular ones.”</i>\n\n");
		}
	}
	
	output("Hogan laughs <i>“That's true bro. And the stuff's great for dude's too. Helps you look amazing, you know? Like obviously we're both treated and look at how sick we look.”</i>.\n\nWith this he stands up from the bench and poses with his arms together, pushing his chest out and showing off his triceps.");
	
	if (pc.isBimbo())
	{
		output("It's true. The muscular bull-bros look really hot and it's making it pretty difficult to concentrate on what you're meant to be talking about.");
		pc.lust(5);
	}
	else if (pc.isBro())
	{
		if ((pc.tone > chars["MONTANA"].tone) && (pc.tone > chars["HOGAN"].tone))
		{
			output("You have to admit, they do look pretty sick. Almost as good as you.");
		}
		else 
		{
			output("You have to admit, they do look pretty sick. The treatment has clearly helped them in their quest to get absolutely shredded.");
		}
	}
	else 
	{
		output("You have to admit, both of the bros are rather muscular. The treatment has clearly helped them a great deal.");
	}
	
	addDisabledButton(0, "Treatment");
}

public function talkMontanaHogan_Meet():void
{
	clearOutput();
	
	output("<i>“So, how did you two meet?”</i> you ask.\n\n");
	output("Both bulls burst out laughing and wobble about, barely hanging on to the warm tiled benches. Tens of seconds later, one of them finally calms down enough to speak.\n<i>“Oh, " + montanaHoganBroOrBabe() + " it was hilarious”</i> Montana replies, still laughing between words. <i>“One day this girl I'd been plowing drags me round to a stall in the barn. And this dude right here is there and the girl says we gotta share her. Which we were cool with, not like our dicks were touching or anything.”</i>\n\n");
	output("<i>“So we start going at her, one of us on either side”</i> Hogan continues. <i>“And this guy starts pulling poses!”</i> he just about manages to say, before bursting into uncontrollable laughter.\n\n");
	output("Montana continues the story, as he's still just about able to speak. <i>“And I start doing it back, so we're just posing at each other while fucking this chick. She noticed pretty quick and walked off pissed that we weren't giving her our undivided attention but it was worth!”</i>\n\n");
	output("<i>“We've been bros ever since”</i> Hogan exhales, leaning back as he does, finally having calmed down just enough to form sentences again.\n\n");
	
	addDisabledButton(1, "How'd you meet?");
}

public function talkMontanaHogan_Routine():void 
{
	clearOutput();
	
	if (pc.isBimbo())
	{
		output("<i>“You guys have such nice muscles”</i> you giggle.");
	}
	else if (pc.isBro())
	{
		output("<i>“You have some pretty decent muscles bros”</i> you say.");
	}
	else if (pc.tone > 50)
	{
		output("<i>“I see you guys work out too”</i> you say.");		
	}
	else 
	{
		output("<i>“I see you guys work out”</i> you say.");
	}
	output(" <i>“What's your routine?”</i>\n\n");
	
	output("<i>“Oh well we just pump it out with loads of hypertrophy exercises”</i> Hogan responds flexing an arm in your direction. <i>“High reps and lots of protein, y'know " + montanaHoganBroOrBabe() + "?”</i>\n\n");
	output("<i>“Making sure to get the protein inside the anabolic window, of course”</i> Montana chips in. <i>“And we do it every day bro!”</i>\n\n");
	output("Hogan nods in agreement. <i>“Oh of course bruh. Thanks, I almost forgot that.”</i>\n\n");
	
	if (pc.isBimbo())
	{
		output("<i>“Sounds fun, maybe we could work out together some time”</i> you say, feeling up Hogan's bicep.\n\n");
	}
	else if ((pc.tone > chars["MONTANA"].tone) && (pc.tone > chars["HOGAN"].tone))
	{
		output("<i>“Hmm, maybe I could show you guys a thing or two some time”</i> you say, smirking, flexing your [pc.arm].\n\n");
	}
	else 
	{
		output("<i>“Maybe I'll join you guys sometime”</i> you say.\n\n");
	}
	
	output("<i>“Sounds good " + montanaHoganBroOrBabe() + "”</i> the bulls reply in unison.");
	
	flags["MONTANA_AND_HOGAN_TALKED_ROUTINE"] = true;
	addDisabledButton(2, "Routine");
}

public function sexMontanaHogan():void
{
	clearMenu();
	clearOutput();
	showMontanaHogan();
	
	output("You lean over into Hogan, putting an arm around his back and placing your hand on the fabric of his shorts.\n");
	if (pc.isBimbo())
	{
		output("<i>“You boys up for some fun?”</i> you giggle, licking your lips.\n\n");
	}
	else if (pc.isBro())
	{
		output("<i>“You up for another kind of workout bros?”</i> you laugh, licking your lips.\n\n");
	}
	else
	{
		output("<i>“You two up for some hot, steamy fun?”</i> you ask, biting your lip.\n\n");
	}
	
	if (montanaHoganFindYouHot())
	{
		if (montanaHoganBroOrBabe() == "bro")
		{
			output("Hogan turns to the other bull, a look of confusion on his face. <i>“Shit bro, is it gay if I want to fuck him? He looks like a girl!”</i>\n\n");
			output("<i>“Shit, I don't know bro! Go with what your dick says!”</i>\n\n");
			output("<i>“Shit alright bro, thanks”</i> he says, and fixes his sight back on you. <i>“Alright hot stuff, let's go to pound town!”</i> Hogan grunts, unfastening his shorts.");
		}
		else if (pc.hasCocks())
		{
			if (pc.isCrotchExposed())
			{
				output("The bulls hesitate, their eyes fixed on your exposed [pc.cocks].\n");
				output("<i>“Shit bro, she's hot but she's got " + (pc.hasCocks() ? "dicks" : "a dick") + ". Is it gay if I fuck her?”</i> Hogan murmurs.\n\n");
				output("<i>“Uhh, what does your dick say bro?”</i> Montana replies, his eyes wide but one hand grasping his growing bulge.");
				output("<i>“Good point. Alright babe, what do you wanna do?”</i> Hogan grunts, unfastening his shorts.");
			}
			else if (pc.biggestCockLength() < 3)
			{
				output("Hogan wraps an arm around you, pulling you closer and slips a hand down past your [pc.crotchcovers] but as his hand brushes against your [pc.cocks], he freezes.\n");
				output("<i>“Shit bro, she has " + (pc.hasCocks() ? "dicks but they're pretty small" : "a dick but it's pretty small") + ". Is it gay if I fuck her?”</i> Hogan says, confusedly.\n\n");
				output("<i>“Oh, well if " + (pc.hasCocks() ? "they're" : "it's") + " small then that's feminine, so she's still a girl bro.”</i> Montana nods, certain of the logic he's come up with. At least judging by how he's grasping as his own bulging shorts.\n\n");
				output("<i>“Oh, great thinking bro”</i> Hogan nods, turning his attention back to you, a smile across his face. <i>“Alright babe, where were we?”</i> he grunts, unfastening his shorts.");
			}
			else 
			{
				output("The bulls stare at your noticeable bulge.\n");
				output("<i>“Shit bro, she's hot but she's got a dick. Is it gay if I fuck her?”</i> Hogan murmurs.\n\n");
				output("<i>“Uhh, what does your dick say bro?”</i> Montana replies, his eyes wide but one hand grasping his growing bulge.\n\n");
				output("<i>“Good point. Alright babe, what do you wanna do?”</i> Hogan grunts, unfastening his shorts.\n\n");
			}
		}
		else 
		{
			output("Hogan grasps you by the [pc.chest] with one hand and unfastens his shorts with the other.\n");
			output("<i>“Sure thing babe”</i> Montana chimes in, standing up from his perch and unfastening his own. <i>“What do you have in mind?”</i>\n\n");
		}
		addButton(0, "Service them", sexMontanaHogan_Service, undefined, "Service them", "Help the two bros relax, more than the steam ever could.");
		addButton(1, "Take them", sexMontanaHogan_DoubleTeam, undefined, "Take them", "Get between the two bros.");
		addButton(14, "Back", mainMontanaHogan);
	}
	else 
	{
		output("The two bulls burst out in laughter. <i>“AHaha! Bro, you're so funny. That'd be so gay though”</i>\n\n");
		output("You back off, sitting back in your throne of rejection. <i>“Haha, yeah right”</i> you murmur. <i>“Totally joking”</i>\n\n");
		addButton(14, "Back", mainMontanaHogan);
	}
}

public function sexMontanaHogan_Service():void
{
	clearMenu();
	clearOutput();
	showMontanaHogan(true);
	
	output("WIP");
	
	addButton(0, "Next", mainMontanaHogan);
}

public function sexMontanaHogan_DoubleTeam():void
{
	clearMenu();
	clearOutput();
	showMontanaHogan(true);
	
	output("WIP");
	
	addButton(0, "Next", mainMontanaHogan);
}