/*Submissive haze
Author: HNB

Duration: 6 days

Notes:
Created by Dr. Badger to protect her experiment Dungeon. Comes with a variety of symptoms with the plan of making intruders more suggestible to just simply staying in the dungeon and helping with the experimentation.
It's possible that a few creatures have contracted it but they probably never left the dungeon to tell anyone. 
It's designed to form submissive tendencies, fatigue and increased lust in those that contract it and to heavily effect them for a short period of time, long enough for them to love the dungeons creatures on their own.

Symptoms:
[Contraction] - Feel slightly light headed (No gameplay effects)
[4 hours] - Codex tells you there's something wrong with you, unidentifiable (no gameplay effects)
[8 hours] - Minor increase to lust damage due to tingly feeling skin and sexual thoughts (+10% to all lust damage taken AND take 5 lust damage)
[16 hours] - -3 intelligence due to brainfog.
[1 days] - Raise base lust due to sexual thoughts and gain lust whilst clothed due to skin sensitivity (+2 lust on move AND +10 min lust).
[1.5 days] - Feel a little tired (No gameplay effect)
[1.75 days] - Submissive thoughts (-3 willpower, take 5 lust damage)
[2 days] - -30 max energy for duration of illness done in energyMax - body feels heavy and you just want to lay down
[2.5 days] - Subby, want to lay down and sex (Is subby whilst illness lasts)
[3 days] - Dick shrinkage (Random 1-10%) OR bigger lips (+1 rating)
[4 days] - Thinking feels slightly lighter (+2 int)
[5 days] - Submissive tendencies and tiredness gone (Max energy reverted and subby reverted)
[6 days] - Lusty thoughts return to normal ending the effect (Lust damage % increase reverted, moving lust reverted)

Overall, player should end up with 1 lower int, 3 lower willpower and a smaller dick OR bigger lips. 
For the duration, the player will take a lot of lust damage, increasing risk and will be susceptible to any submission checks (There's a couple in RaskExp dialogue).
*/

public function hazeProc(deltaT:uint, maxEffectLength:uint, doOut:Boolean, target:Creature, effect:StorageClass):void
{
	var msg:String = "";
	var STATUS_LENGTH:int = 6 * 24 * 60;
	//Contraction - Slower thinking and light headed
	if(effect.value1 == 0 && effect.minutesLeft < STATUS_LENGTH)
	{
		effect.value1 = 1;
		
		//Dumber messages for each of the lines below
		if (pc.isBimbo() || pc.isBro())
		{
			msg += "Ughh, your brain feels way too slow right now. ";
		
			if (pc.hasStatusEffect("Buzzed") || pc.hasStatusEffect("Drunk")) msg += "Maybe it's the alcohol.";
			else msg += "Maybe it's just an off day.";
		}
		else if (pc.intelligence() < 15)
		{
			msg += "Walking along, you notice your thinking feels pretty slow. ";
		
			if (pc.hasStatusEffect("Buzzed") || pc.hasStatusEffect("Drunk")) msg += "Oh well, it's probably the alcohol.";
			else msg += "Oh well, maybe it's just an off day.";
		}
		else 
		{
			msg += "Walking along, you notice your thinking feels slightly impeded. ";
		
			if (pc.hasStatusEffect("Buzzed") || pc.hasStatusEffect("Drunk")) msg += "Hmm, it's probably the alcohol.";
			else msg += "Hmm, maybe it's just an off day.";
		}
	}
	//[4 hours] - Codex tells you there's something wrong with you, unidentifiable
	else if(effect.value1 == 1 && effect.minutesLeft < (STATUS_LENGTH - 4*60))
	{
		effect.value1 = 2;
		
		msg += "<i>BEEP!</i> An irritating tone from your Codex stops you in your tracks. <i>“Alert! Unknown infection detected!<\i>";
		
		if (pc.isBimbo() || pc.isBro() || pc.intelligence() < 5){
			msg += "\n\nWhat?! The codex doesn't know something? How?! It's like wicked smart!";
			msg += "\n\nHmm, maybe you should do something about this. But what?";
		}
		else msg += "\n\nBetter get yourself checked out, before something bad happens.";
		
		effect.storageName = "Submissive Haze";
	}
	//[8 hours] - Minor increase to lust damage due to tingly feeling skin and sexual thoughts. Damage multi is in calculateLustDamage. Value of +0.1 mutliplier
	else if(effect.value1 == 2 && effect.minutesLeft < (STATUS_LENGTH - 8*60))
	{
		effect.value1 = 3;
		
		msg += "Whilst you were struggling to think properly for the last couple of hours, you now find yourself thinking of things with ease. ";
		if (pc.isBimbo() || pc.isBro() || pc.taint() >= 66 || pc.libido() > 50) msg += "Although, as usual, it's mostly sex.";
		else msg += "Although abnormally for you, it is mostly lewd stuff.";
		msg += "\nYour clouded mind is filled with a variety of sexual thoughts that make your [pc.skin] tingle. Actually as you walk along, you brush against an object and the way it caresses your tingling skin feels wonderful.";
		msg += "\n\nWith the way your skin feels and with how easy it is for you to get sex into your head, you have a feeling you're going to be more vulnerable to sexual advances.";
		pc.lust(5);
	}
	//[16 hours] - Temporary -3 to int for duration of illness due to brainfog
	else if(effect.value1 == 3 && effect.minutesLeft < (STATUS_LENGTH - 16*60))
	{
		effect.value1 = 4;
		pc.intelligence(-3);
		
		if (pc.intelligence() > 8) msg += "Your brain feels so clouded, you're sure it's having a negative impact on your ability to think properly.";
		else if (pc.intelligence() > 5) msg += "Your head is so full of fog, you feel even less smart than normal.";
		else msg += "Your head is so messed up, you feel like you have even less smarts than normal.";
	}
	//[1 days] - Raise base lust due to sexual thoughts and gain lust whilst clothed due to skin sensitivity.
	//Lust min increased in creature.lustMin and move done in game.as move function.
	else if(effect.value1 == 4 && effect.minutesLeft < (STATUS_LENGTH - 24*60))
	{
		effect.value1 = 5;
		
		msg += "That feeling you had in your skin has made its way down to your nether regions.";
		if (!pc.isNude())
		{
			if (pc.isCrotchGarbed()) msg += "\nAs you walk along, your [pc.crotchCovers] brush against your [pc.crotch]";
			else if (!pc.isAssExposed()) msg += "\nAs you walk along, your [pc.assCover] brushes against your [pc.ass]";
			else if (pc.isChestGarbed() && pc.hasNipples()) msg += "\nAs you walk along, your [pc.chestCovers] brush against your [pc.nipples]";
			else msg += "\nAs you walk along, your [pc.clothes] brush against your [pc.skin]";
			msg += " and it feels so good that you're sure if you keep moving around you're going to cum! Oh stars, if anyone were to touch you, you'd be at their mercy.";
			
			pc.lust(5);
		}
		else 
		{
			msg += "\nYour [pc.skin] feels so sensitive now, you're sure if anything were to brush against them it'd be just as effective as masturbation. Oh stars, if anyone were to touch you, you'd be at their mercy.";
		}
		
		msg += "\n\nOn top of that, your mind is addled with so many sexual thoughts, you're finding yourself in a constant state of lust.";
	}
	//[1.5 days] - Feel a little tired
	else if(effect.value1 == 5 && effect.minutesLeft < (STATUS_LENGTH - 36*60))
	{
		effect.value1 = 6;
		
		msg += "Yaaaaawn. You're starting to feel a little tired. Maybe a lie down would help.";
	}
	//[1.75 days] - Submissive thoughts
	else if(effect.value1 == 6 && effect.minutesLeft < (STATUS_LENGTH - 42*60))
	{
		msg += "The sex-themed daydreaming that you keep doing is starting to take a turn for the submissive. Every other thought has you getting bossed around doing whatever the other participant, or participants want. And you like it!";
		effect.value1 = 7;
		pc.willpower( -3);
		pc.lust(5);
	}
	//[2 days] - -30 max energy for duration of illness - body feels heavy and you just want to lay down
	else if(effect.value1 == 7 && effect.minutesLeft < (STATUS_LENGTH - 48*60))
	{
		effect.value1 = 8;
		
		msg += "Your body is really starting to feel heavy. You just want to lay down. You really don't feel like you have your usual energy.";
		
	}
	//[2.5 days] - Subby, want to lay down and sex (Subby done in isSubby)
	else if(effect.value1 == 8 && effect.minutesLeft < (STATUS_LENGTH - 54*60))
	{
		msg += "You're not even sure if you're in control in your own fantasies anymore. Characters just float along inside your head and command you to get on the floor and be their bitch. And you obey. Every time, no matter the demand.\n\n";
		msg += "You want those fantasies to be real too. You want someone to pounce on you and make demands, which in your lust-filled, fatigued state cannot possibly say no to, even if you wanted to.\n\n";
		
		if (!pc.isSubby()) msg += "Whilst you're feeling like this, you've become <i>submissive<\i>.";
		else msg += "You've been into that kind of thing for a while though, maybe you're just focusing on it more right now.";
		
		effect.value1 = 9;
	}
	//[3 days] - Dick shrinkage OR bigger lips
	else if(effect.value1 == 9 && effect.minutesLeft < (STATUS_LENGTH - 3*24*60))
	{
		effect.value1 = 10;
		
		//Random 1-10% based dicks shrinkage if have dicks
		if (pc.hasCock())
		{
			if (pc.isCrotchGarbed()) msg += "You feel a shift in your [pc.crotchCovers]. You lift them out of the way and look down. ";
			else msg += "You feel a tingling in your crotch and look down. ";
			msg += "You're almost certain your dicks have shrunk! No matter though, what servant needs dicks? They're for using others and you're just there to be used.";
			
			var percShrinkage:int = rand(10);
			for (var i:int = 0; i < pc.cocks.length; ++i)
			{
				var cLength:Number = pc.cocks[i].cLength();
				pc.cocks[i].cLength(cLength * ((100 - percShrinkage) / 100)); 
			}
		}
		//dick-sucking lips
		else
		{
			pc.lipMod++;
			msg += "You feel the tingling that has been flowing over your skin spread over your lips. You touch your fingers to them, only to find your now [pc.lips] have become thicker. All the better for wrapping around whatever body part you're commanded to.";
		}
	}
	//[4 days] - Thinking feels slightly lighter (Only -2 int)
	else if(effect.value1 == 10 && effect.minutesLeft < (STATUS_LENGTH - 4*24*60))
	{
		effect.value1 = 11;
		
		msg += "Your thinking feels slightly clearer. There's still a lot of fantasies floating around but everything feels sharper now.";
		pc.intelligence(1);
	}
	//[5 days] - Submissive tendencies and tiredness gone
	else if(effect.value1 == 11 && effect.minutesLeft < (STATUS_LENGTH - 5*24*60))
	{
		effect.value1 = 12;
		
		msg += "You feel more awake and full of energy again. On top of that, you're starting to appear on top in your fantasies again!";
	}
	//[6 days] - All effects ended
	else if(effect.value1 == 12 && effect.minutesLeft < (STATUS_LENGTH - 6*24*60))
	{
		effect.value1 = 13;
		
		msg += "You feel completely back to normal. Your head is clear, your skin has stopped tingling and your sexual urges are back to how they were before.";
	}
	if (msg.length > 0)
	{
		AddLogEvent(msg, "passive", maxEffectLength);
	}
}

public function hazeFinish(deltaT:uint, maxEffectLength:uint, doOut:Boolean, target:Creature, effect:StorageClass):void
{
	pc.removeStatusEffect("Undetected Submissive Haze", true);
	pc.removeStatusEffect("Submissive Haze", true);
}