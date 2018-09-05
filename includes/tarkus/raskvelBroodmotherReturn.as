import adobe.utils.CustomActions;
import classes.Characters.RaskvelBroodmother;
import classes.ItemSlotClass;
import classes.Items.Apparel.FarmersOveralls;
import classes.Items.Apparel.LeatherStrapHarness;
import classes.Items.Apparel.MaidOutfit;
import classes.Items.Apparel.NurseOutfit;
import classes.Items.Apparel.SchoolgirlOutfit;
import classes.Items.Apparel.TeacherOutfit;
import classes.Items.Drinks.RaskvelBroodmotherMilkBottle;
import classes.Items.Drinks.RaskvelBroodmotherMilkBucket;
import classes.kGAMECLASS;
import classes.Engine.Utility.rand;
// Functions for non-event RaskvelBroodmother, i.e returning to her if you ended on good terms
//
// TODO: Explain levels 

public function getPregRaskReturn_BustName():String 
{
	var bustStr:String = "PREGRASK_";
	
	// _LVL
	bustStr += ("LVL" + getBroodmotherLevel().toString());
	
	// _Clothes
	if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"] != undefined)
	{
		bustStr += ("_" + flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]);
	}
	
	if (isBroodmotherTreated())
	{
		bustStr += "_TREATED";
	}
	if (isBroodmotherFuta())
	{
		bustStr += "_FUTA";
	}
	return bustStr.toUpperCase();
}

public function getPregRaskReturn_Name():String 
{
	if (isBroodmotherPregnant())
	{
		return "PREGNANT\nBROODMOTHER";
	}
	else 
	{
		return "RASKVEL\nBROODMOTHER";
	}
}

public function getWhatWearing():String
{
	if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
		return "nurse outfit";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
		return "maid outfit";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
		return "schoolgirl outfit";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
		return "leather harness";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
		return "teacher outfit";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
		return "farmers overall";
	}
	else{
		return null;
	}
}

public function getWhatWearing_DressedAs():String
{
	if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
		return " nurse ";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
		return " maid ";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
		return " schoolgirl ";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
		return " bound ";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
		return " teacher ";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
		return " farmer ";
	}
	else{
		return " ";
	}
}

// The following state what the broodmother is wearing over a particular region of her body. Used for descriptions.
public function getWhatWearing_Chest():String
{
	if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
		return "red and white nurses shirt";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
		return "frilly black blouse";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
		return "red tie";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
		return "tight leather strap";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
		return "white blouse";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
		return "dark blue overall";
	}
	else{
		return null;
	}
}

public function getWhatWearing_Behind():String
{
	if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
		return null;
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
		return "short frilly skirt";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
		return "short tartan skirt";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
		return null;
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
		return "short black skirt";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
		return "tattered overalls";
	}
	else{
		return null;
	}
}

public function getWhatWearing_CrotchPosition():String
{
	if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
		return null;
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
		return "under her frilly skirt";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
		return "under her tartan skirt";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
		return "between her bound thighs";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
		return "under her black skirt";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
		return "through her tattered overalls";
	}
	else{
		return null;
	}
}

public function getWhatWearing_Thighs():String
{
	if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
		return "red stocking";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
		return "frilly white stocking";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
		return null;
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
		return "leather strap";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
		return "black stocking";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
		return null;
	}
	else{
		return null;
	}
}

public function getWhatWearing_Neck():String
{
	if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
		return "large white collar";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
		return "tight black fabric";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
		return "open white collar";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
		return "leather straps";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
		return "open white collar";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
		return null;
	}
	else{
		return null;
	}
}

public function getWhatWearing_Head():String
{
	if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
		return "white nurses hat";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
		return "frilly white hat";
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
		return null;
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
		return null;
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
		return null;
	}
	else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
		return null;
	}
	else{
		return null;
	}
}

public function getWhatWearing_IsArmCovered():Boolean
{
	if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
		return true;
	}
	return false;
}

public function showPregRaskReturn():void
{	
	showBust(getPregRaskReturn_BustName());
	showName(getPregRaskReturn_Name());
}

public function approachBroodmother():void
{
	showPregRaskReturn();
	clearMenu();
	clearOutput();
	author("HNB");
	
	var lvl:int = getBroodmotherLevel();
	var randInt:int;
		
	if (lvl == 0)
	{
		output("You approach the frustrated looking purple raskvel. As you near she cries in your direction.\n<i>“You did this! When are you going to take responsibility!”</i>");
	}
	else if (lvl == 1)
	{
		output("You approach the plumpening, purple broodmother. As you near she smiles at you, licking her lips.\n<i>“Mmm, I'm feeling a bit better now. How can I repay you..”</i>");
	}
	else if (lvl == 2)
	{
		output("You approach the ballooning, purple broodmother" + (getWhatWearing() != null ? (", who's clad in a " + getWhatWearing()) : "") + ". She clutches her stomach she turns towards you and with a rowdy look on her face, she opens her mouth.\n");
		
		// If clothed she roleplays
		if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
			output("<i>“Ooh, are you sure you're feeling well?”</i> she asks, licking her lips. <i>“Maybe you should strip off so I can check your heartbeat..”</i>");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
			output("<i>“Ooh, is there anything your maid can clean for you?”</i> she asks, licking her lips. <i>“How about down there..”</i>");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
			output("<i>“Sorry, I've forgotten my homework”</i> she giggles, licking her lips. <i>“Is there some way I can make it up to you?”</i>");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
			output("<i>“Hmm, these straps don't leave much to the imagination..”</i> she says, licking her lips. <i>“What do you think?”</i>");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
			output("<i>“Mmm, I haven't got a plan for todays lesson..”</i> she giggles, licking her lips. <i>“What do you think we should do?”</i>");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
			output("<i>“Hmm, I've ran out of seeds..”</i> she giggles. <i>“I don't suppose you could help me find some?”</i>");
		}
		else{
			output("<i>“Mmm, I'm doing much better now. How will I ever repay you..”</i> she says, licking her lips.");
		}
	}
	else if (lvl == 3)
	{
		output("You approach the ballooning, purple broodmother" + (getWhatWearing() != null ? (", who's clad in a " + getWhatWearing()) : "") + ". As she turns towards you, her large" + (getWhatWearing_Chest() != null ? " outfit-clad tits jiggle" : " tits bounce in the air") + ".\n");
		// If clothed she roleplays
		if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
			output("<i>“Ooh, are you sure you're feeling well?”</i> she asks, licking her lips. <i>“Maybe you should strip off so I can check your heartbeat..”</i>");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
			output("<i>“Ooh, is there anything your maid can clean for you?”</i> she asks, licking her lips. <i>“How about down there..”</i>");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
			output("<i>“Sorry, I've forgotten my homework”</i> she giggles, licking her lips. <i>“Is there some way I can make it up to you?”</i>");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
			output("<i>“Hmm, these straps don't leave much to the imagination..”</i> she says, licking her lips. <i>“What do you think?”</i>");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
			output("<i>“Mmm, I haven't got a plan for todays lesson..”</i> she giggles, licking her lips. <i>“What do you think we should do?”</i>");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
			output("<i>“Hmm, I've ran out of seeds..”</i> she giggles. <i>“I don't suppose you could help me find some?”</i>");
		}
		else{
			output("<i>“Mmm, I'm doing great, I'm so full. I feel like I'm leaking a bit but I can't see past this big belly of mine. You should have a look.”</i>");
		}
	}
	else if (lvl == 4)
	{
		output("You approach the big, purple broodmother" + (getWhatWearing() != null ? (", who's clad in a " + getWhatWearing()) : "") + ". Held to the ground by her ballooning paunch she rotates slightly on the slick ground below her and twists around to face you.\n");
		
		randInt = rand(1);
		if (randInt == 0 && isBroodmotherFuta()){
			if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
				output("<i>“Ooh, are you sure you're feeling well?”</i> she asks, presenting her cock. <i>“Maybe we should check your temperature with my... thermometer.”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
				output("<i>“Ooh, is there anything your maid can clean for you?”</i> she asks, presenting her cock. <i>“What about inside? Would this reach?”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
				output("<i>“Oh no”</i> she giggles, her skirt lifting. <i>“Looks like my cocks too big for this skirt. But I don't want the other girls to know, so if someone were to do anything with it, I'd never tell anyone!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
				output("<i>“I'm so constrained by these straps, I don't think I could stop anybody from trotting in and playing with my cock!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
				output("<i>“Oh no”</i> she giggles, her skirt lifting. <i>“Looks like my cocks too big for this skirt. But if the other teachers find out, I'll be fired! If someone were to do anything with it, I'd never tell anyone!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
				output("<i>“I think something fell out back there”</i> she giggles as you notice her cock flopping out the underside of her overalls. <i>“I don't suppose you could put it back in?”</i>");
			}
			else{
				output("<i>“I can't reach around, I'm so big. I don't know what I'd do if someone just trotted in and started playing with my cock!”</i>");
			}
		}
		else if (randInt == 1 && isBroodmotherTreated()){
			if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
				output("<i>“Ooh, are you sure you're feeling well?”</i> she asks, rubbing her teats. <i>“Maybe some milk would help?”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
				output("<i>“Ooh, is there anything your maid can get for you?”</i> she asks, rubbing her teats. <i>“Perhaps some milk?”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
				output("<i>“Hey, could you help a farmgirl out with the milking?”</i> she giggles, rubbing her teats.");
			}
			else{
				output("<i>“I can't reach around, I'm so big. I don't know what I'd do if someone just trotted in and started milking my teats for all they're worth!”</i>");
			}
		}
		else {
			if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit" || flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit" || flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
				output("<i>“Oh no, looks like my skirts too short! Now everyone can see my pussy..”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
				output("<i>“Ooh, are you sure you're feeling well?”</i> she asks, licking her lips. <i>“Maybe you should strip off so I can check your heartbeat..”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
				output("<i>“Hmm, these straps don't leave much to the imagination..”</i> she says, licking her lips. <i>“What do you think?”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
				output("<i>“Hmm, I've ran out of seeds..”</i> she giggles. <i>“I don't suppose you could help me find some?”</i>");
			}
			else{
				output("<i>“I can't reach around, I'm so big. I don't know what I'd do if some brave adventurer just trotted in and started fucking my pussy!”</i>");
			}
		}
	}
	else if (lvl == 5)
	{
		output("You approach the big, purple broodmother" + (getWhatWearing() != null ? (", who's clad in a " + getWhatWearing()) : "") + ". Held to the ground by her gargantuan paunch she rotates slightly on the cum-soaked ground below her and twists around to face you. She flicks her tail around and stretches open her gaping, cum-soaked vagina before moaning at you, tongue hanging from her mouth.\n");
		
		randInt = rand(2);
		if (pc.hasCock() && randInt == 0)
		{
			if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
				output("<i>“Ooh, are you sure you're feeling well? Maybe I should drain your fluids.”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
				output("<i>“Ooh, is there anything your maid can do for you?”</i> she asks, licking her lips. <i>“Maybe some service? I could suck all your cum out if you'd like!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
				output("<i>“Oh no, I've forgotten my homework again! That's the fourth time this week. I believe the punishment for that is getting fucked over and over, is that right?”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
				output("<i>“Mmm, alright time for todays lesson, I'm going to teach the class how to ride a cock. I'll need a volunteer!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
				output("<i>“Ahh, that's all the seed spread for today. Apart from, of course, yours.”</i>");
			}
			else{
				output("<i>“I've got room for more. ");
				if (pc.isCrotchExposed())
				{
					output("How about you bring " + (pc.hasCocks() ? "those cocks" : "that cock") + " over here and fill me with your cum!”</i>");
				}
				else
				{
					output("How about you let " + (pc.hasCocks() ? "those cocks" : "that cock") + " out and fill me with your cum!”</i>");
				}
			}
		}
		else if (isBroodmotherFuta()  && randInt == 1){
			if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
				output("<i>“Ooh, are you sure you're feeling well?”</i> she asks, presenting her cock. <i>“Should we use my thermometer?”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
				output("<i>“Ooh, is there anything your maid can clean for you?”</i> she asks, presenting her cock. <i>“Maybe with this?”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
				output("<i>“I've been a naughty girl”</i> she giggles, her dick dangling between her legs. <i>“You should punish me by playing with my dick until my balls are empty!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
				output("<i>“You've been a bad pupil”</i> she says, grabbing her cock in her hand. <i>“I call this, the cane.”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
				output("<i>“You know, on the farm..”</i> she says, presenting her cock. <i>“It's important to harvest the meat.”</i>");
			}
			else{
				output("<i>“I'm feeling pretty full. How about you come over here and play with my cock!”</i>");
			}
		}
		else if (isBroodmotherTreated()  && randInt == 2){
			if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
				output("<i>“Hmm it's bad news”</i> she says, rubbing her teats. <i>“The only treatment is milk!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
				output("<i>“Alright " + pc.mf("master","mistress") + "”</i> she says, rubbing her teats. <i>“Time for your milk!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
				output("<i>“I think it's about time you got on with the milking”</i> she moans, squeezing her teats.");
			}
			else{
				output("<i>“I'm feeling pretty full. How about you come over here and milk my tits dry!”</i>");
			}
		}
		else{
			if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
				output("<i>“Ooh, are you sure you're feeling well?”</i> she asks, licking her lips. <i>“Maybe fucking me would help you feel better?”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
				output("<i>“Ooh, is there anything your maid can do for you?”</i> she asks, licking her lips. <i>“How about something fun?”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
				output("<i>“Sorry, I've forgotten my homework You'll have to punish me!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
				output("<i>“Hmm, all tied up by these tight straps..”</i> she says, licking her lips. <i>“Like a present. For you.”</i>");
				if (kGAMECLASS.silly) output("\n<i>“Was getting tied up part of your plan?”</i>"); //Silly baneposting
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
				output("<i>Alright class, time for today's lesson. Today, you'll be learning how to fuck. I'll need a volunteer!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
				output("<i>“Ahh, that's all the farming done for the day. Now, time for some fun!”</i>");
			}
			else{
				output("<i>“Mmm, how 'bout you get over here and we have some fun?”</i>")
			}
		}
	}
	else if (lvl == 6)
	{
		randInt = rand(3);
		
		output("You approach the writing covered, used broodmother" + (getWhatWearing() != null ? (", who's clad in a " + getWhatWearing()) : "") + ". Held to the ground by her gargantuan paunch she rotates slightly on the cum-covered ground below her and twists around to face you. ");
		if (pc.hasCock() && randInt == 0){
			output("She flicks her tail and stretches open her gaping cum-soaked vagina before moaning at you through her plump lips.\n");
			if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
				output("<i>“MMm it's time for your treatment! And the treatment is to shove " + (pc.hasCocks() ? "those cocks" : "that cock") + " in my pussy and unload over and over until the symptoms go away!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
				output("<i>“Oh " + pc.mf("master","mistress") + ", your cock looks so full! I wouldn't be doing my job if you didn't stuff " + (pc.hasCocks() ? "those cocks" : "that cock") + " in my pussy and unload!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
				output("<i>“Oh fuck, I've been such a naughty girl! Please, get back there and punish me! Stuff " + (pc.hasCocks() ? "those cocks" : "that cock") + " in my slutty, schoolgirl pussy! Fuck me every lunchtime until all the other girls know I'm a pregnant whore!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
				output("<i>“Mmm, I'm just like your little wrapped up present in this leather! How about you open me up with " + (pc.hasCocks() ? "those cocks" : "that cock") + "!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
				output("<i>“Time for todays lesson! Todays lesson is that your teacher's a filthy slut who needs you to stuff " + (pc.hasCocks() ? "those cocks" : "that cock") + " in her slutty pussy! You'll get an A* if you cum a lot!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
				output("<i>“There's just one more seed that needs planting. It's yours, you need to plant your " + (pc.hasCocks() ? "dibbers" : "dibber") + " in my dirty farmgirl pussy until the seeds are all over my insides!”</i>");
			}
			else{
				output("<i>“Oh fuck, you're back! Please, get back there and stuff " + (pc.hasCocks() ? "those cocks" : "that cock") + " in my slutty pussy! Fill me with your cum!”</i>");
			}
		}
		else if (pc.hasCock() && randInt == 1){
			output("She flicks her tail and stretches open her gaping cum-soaked vagina before moaning at you through her plump lips.\n");
			if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
				output("<i>“Oh fuck. I need to drain your fluids, come over 'ere!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
				output("<i>“Oh fuck, how about you get closer " + pc.mf("master","mistress") + " and I'll service ya dick!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
				output("<i>“If I suck your dick will ya' give me a good grade?! I'll do it anyway!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
				output("<i>“If you come over 'ere and let me suck your dick, I'll give you an A!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
				output("<i>“Oh fuck. We need to plant some seeds - in my mouth! Come over 'ere and I'll suck ya dick!”</i>");
			}
			else 
			{
				output("<i>“Oh fuck. You're back! How about you get closer and I'll suck ya dick!”</i>");
			}
		}
		else if (isBroodmotherFuta() && randInt == 2){
			if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
				output("<i>“Oh fuck, I think it's time for your medicine”</i> she moans, presenting her cock. <i>“Open wide!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
				output("<i>“You know what a good fucking maid would do?”</i> she moans, cock in hand. <i>“They'd make sure you're getting enough dick!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
				output("<i>“You know what you didn't teach this naughty little girl?”</i> she moans, cock in hand. <i>“How to use her cock!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
				output("<i>“Have I got something to teach you about!”</i> she moans, cock in hand. <i>“My big slutty cock!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
				output("<i>“You forgot one job. You milked the cows..”</i> she moans, cock in hand. <i>“But not the horses!”</i>");
			}
			else{
				output("Licking her plump lips, she moans.\n<i>“Oh fuck. You're back! It feels so tingley, I need you to get back there and fuck my slutty dick!”</i>");
			}
		}
		else if (isBroodmotherTreated() && randInt == 3){
			if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
				output("<i>“Hmm it's bad news”</i> she says, rubbing her fat teats. <i>“The only treatment is milk!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
				output("<i>“Alright " + pc.mf("master","mistress") + "”</i> she says, rubbing her fat teats. <i>“Time for your milk!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
				output("Twisting her fat teats in her hand she gasps.\n<i>“Oh fuck. You're back! There's a big slutty cow that needs milking! Now, come over and milk my titties before I burst!”</i>");
			}
			else{
				output("Twisting her fat teats in her hand she gasps.\n<i>“Oh fuck. You're back! They're so full! Please, come over and milk my titties before I burst!”</i>");
			}
		}
		else{
			if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
				output("<i>“Ooh, are you sure you're feeling well?”</i> she asks, stroking her gaping pussy with her tail. <i>“A good treatment would be eating my slutty pussy!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
				output("<i>“You know, as your whore-servant..”</i> she moans, stroking her gaping pussy with her tail. <i>“I have to do whatever you want..”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
				output("<i>“I've been such a naughty schoolgirl”</i> she moans, stroking her gaping pussy with her tail. <i>“You'll have to punish my slutty pussy until I've learned my lesson!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
				output("<i>“With this tight leather restraining me like this..”</i> she moans, flicking her soaking clit with her tail. <i>“You can use me properly like I deserve!”</i>");
			}
			else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
				output("She flicks her tail and stretches open her gaping cum-soaked vagina before moaning at you through her plump lips.\n<i>“Your next lesson, is on how to use a whore like me to the fullest!”</i>");
			}
			else{
				output("She flicks her tail and stretches open her gaping cum-soaked vagina before moaning at you through her plump lips.\n<i>“Oh fuck, you're back! I need you to play with my pussy, I need it! Use me like the slut I am!”</i>");
			}
		}
	}	
	
	// LUSTY THOUGHTS
	if ((pc.libido() >= 70 || pc.lust() >= 50) && lvl >= 2)
	{
		pc.lust(40);
		output("\nYou're having a hard time keeping your mind on anything but the broodmothers' " + (pc.isBimbo()||pc.isBro() ? "hot bod'" : "body") +". ");
		
		//Rand body descript for brood based on lvl and bodytypes
		var descriptors:Vector.<String> = new <String>[];
		
		if (lvl == 2)
		{
			if (isBroodmotherTreated())
			{
				descriptors.push("Her plump body and large, udder-like teats ");
			}
			else 
			{
				descriptors.push("Her plump body and large, motherly breasts ");
			}
			if (isBroodmotherFuta())
			{
				descriptors.push("Her plump body and curvy, blue cock ");
			}
		}
		else if (lvl == 3)
		{
			if (isBroodmotherTreated())
			{
				descriptors.push("Her buxom body and teat-tipped, balloon-like breasts ");
			}
			else
			{
				descriptors.push("Her buxom body and balloon-like, motherly breasts ");
			}
			if (isBroodmotherFuta())
			{
				descriptors.push("Her buxom body and big, blue, hard cock ");
			}
		}
		else if (lvl == 4)
		{
			if (isBroodmotherTreated())
			{
				descriptors.push("Her big, round, baby-making belly and motherly, milky teats ");
				descriptors.push("Her hairy, baby-making pussy ");
			}
			else
			{
				descriptors.push("Her big, round, baby-making belly and large, motherly breasts ");
				descriptors.push("Her baby-making pussy ");
			}
			
			if (isBroodmotherFuta())
			{
				descriptors.push("Her curvy blue cock, that's currently resting on her baby-making belly, ");
			}
		}
		else if (lvl == 5)
		{
			descriptors.push("Drawing your eyes over the light-topped, steel buttplug, trembling between her large jiggling buttocks ");
			
			if (isBroodmotherTreated())
			{
				descriptors.push("She's pulling a buttock to one side, presenting you with her hairy, gaping, cum-dripping fuck-hole, ");
				descriptors.push("Her ginormous, stretched belly clashes against the flesh of her giant, milky teats, ");
			}
			else
			{
				descriptors.push("Pulling a buttock to one side, she presents you with her agape, cum-dripping fuck-hole, ");
				descriptors.push("Her ginormous, stretched belly clashes against the flesh of her giant motherly breasts, ");
			}
			
			if (isBroodmotherFuta())
			{
				descriptors.push("Her long, cum-splattered cock, that's currently resting atop her giant baby-making paunch, ");
			}
		}
		else if (lvl == 6)
		{
			descriptors.push("Drawing your eyes over the light-topped, steel buttplug, trembling between her large jiggling buttocks ");
			descriptors.push("Drawing your eyes over her fat, saliva covered lips as she runs her long tongue around them,  ");
			
			if (isBroodmotherTreated())
			{
				descriptors.push("Pulling a spank-marked buttock to one side, she presents you with her hairy, gaping, cum-dripping fuck-hole, ");
				descriptors.push("Following the arrows drawn on the bottom of her stomach, you're drawn to her hairy, agape, cum-dripping fuck-hole, ");
				descriptors.push("Her gargantuan, writing-covered belly clashes against the flesh of her giant, pierced, milky teats, ");
			}
			else
			{
				descriptors.push("Pulling a spank-marked buttock to one side, she presents you with her agape, cum-dripping fuck-hole, ");
				descriptors.push("Following the arrows drawn on the bottom of her stomach, you're drawn to her agape, cum-dripping fuck-hole, ");
				descriptors.push("Her gargantuan, writing-covered belly clashes against the flesh of her giant, pierced motherly breasts, ");
			}
			
			if (isBroodmotherFuta())
			{
				descriptors.push("Her long, cum-splattered cock, that's currently resting atop her giant baby-making paunch, ");
			}
		}
		output(descriptors[rand(descriptors.length - 1)]);
		//REACTION TO BOD
		output("making it impossible to avoid ");
		if (pc.hasCock())
		{
			output("squeezing your [pc.cocks " + (1 + rand(pc.cocks.length)) + "]");
			if (!pc.isCrotchExposed())
			{
				output(" through your [pc.crotchCovers]");
			}
		}
		else if (pc.hasVagina())
		{
			output("stroking your [pc.vaginas " + (1 + rand(pc.vaginas.length)) + "]");
			if (!pc.isCrotchExposed())
			{
				output(" through your [pc.crotchCovers]");
			}
		}
		else
		{
			output("rubbing your [pc.crotch]");
			if (!pc.isCrotchExposed())
			{
				output(" through your [pc.crotchCovers]");
			}
		}
		
		output(".");
	}
	
	addButton(0, "Appearance", broodMotherAppearance);
	addButton(1, "Talk", talkBroodmother, undefined, "Talk", "Have a conversation with her..");
	addButton(14, "Leave", mainGameMenu);
	
	// SEX OPT IF TURNED ON
	if (pc.lust() >= 33 && lvl > 0)
	{
		addButton(2, "Sex", broodMotherSexOpts, undefined, "Sex", "Fuck her");
	}
	else if (lvl == 0)
	{
		addDisabledButton(2, "Sex", "Fuck her", "She's so pissed off at you right now, she probably wouldn't have sex with you if you were to get on your knees and beg.");
	}
	else 
	{
		addDisabledButton(2, "Sex", "Fuck her", "You're not turned on enough for this");
	}
	
	// JOIN BROODMOTHER: LEADS TO BAD END
	if ((pc.isBimbo() || (StatTracking.getStat("pregnancy/total births") > 10)) && lvl >= 4) //If a bimbo or really like getting knocked up and the broodmothers lifestyle is returned
	{
		addButton(3, "Join", joinBroodmother, undefined, "Join", "Ask to live with her and live her lifestyle.");
	}
	else if (!pc.isBimbo() || StatTracking.getStat("pregnancy/total births") <= 10)
	{
		addDisabledButton(3, "Join", "Join", "You don't think her lifestyle would suit you. That and it'd really get in the way of your mission.");
	}
	else if (lvl < 4) 
	{
		addDisabledButton(3, "Join", "Join", "Her current state isn't exactly inspiring. Maybe if she was back to how she was when you met her with Azra..");
	}
	
	if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY"] == 2)
	{
		if ((lvl >= 2 && !isBroodmotherPregnant()) || (lvl >= 3 && isBroodmotherPregnant()))
		{
			addButton(4, "Dress up", broodmotherDressup)
		}
		else 
		{
			addDisabledButton(3, "Dress up", "Dress up", "She's genuinely too small to fit your normal-sized clothes.");
		}
	}
	
	// GIVE ITEMS
	addButton(13, "Give item", giveBroodMotherItem, undefined, "Give item", "Give her something other than you.");	
}

public function broodmotherDressup():void 
{
	clearOutput();
	clearMenu();
	author("HNB");
	
	if (getWhatWearing() != null)
	{
		if (pc.isBimbo())
		{
			output("<i>“Okay honey!”</i> you call to her, rummaging in your backpack. <i>“How about a new outfit?”</i>\n\n");
		}
		else if (pc.isBro() || pc.isAss())
		{
			output("<i>“Alright slut”</i> you grunt, rummaging in your backpack. <i>“I've got a new little outfit for you”</i>\n\n");
		}
		else if (pc.isSubby())
		{
			output("<i>“Okay mistress!”</i> you call to her, rummaging in your backpack. <i>“I've brought you a new outfit”</i>\n\n");
		}
		else
		{
			output("<i>“I've got something for you..”</i>\n\n");
		}
	}
	else
	{
		if (pc.isBimbo())
		{
			output("<i>“Okay honey!”</i> you call to her, rummaging in your backpack. <i>“'Member when we talked about dress-up? Well, I've got something for youuu!”</i>\n\n");
		}
		else if (pc.isBro() || pc.isAss())
		{
			output("<i>“Alright slut”</i> you grunt, rummaging in your backpack. <i>“Remember when we talked about dressing you up? Well, I've got a nice little outfit for you”</i>\n\n");
		}
		else if (pc.isSubby())
		{
			output("<i>“Okay mistress!”</i> you call to her, rummaging in your backpack. <i>“Remember our conversation about getting you all dressed up? Well, I've got something for you”</i>\n\n");
		}
		else
		{
			output("<i>“Remember when we were talking about dressing you up?”</i> you ask, rummaging in your backpack. <i>“Well, I've got something for you..”</i>\n\n");
		}
	}
	
	
	// Gen item menu
	var buttonIndex:int = 0;
	
	var clothesList:Array = new Array();
	if (pc.hasItemByClass(NurseOutfit)) 
	{
		if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"] == undefined) addButton(buttonIndex, "Nurse Outfit", broodmotherDressup_Item_2, new NurseOutfit());
		else addButton(buttonIndex, "Nurse Outfit", broodmotherDressup_Item, new NurseOutfit());
		buttonIndex++;
	}
	if (pc.hasItemByClass(MaidOutfit)) 
	{
		if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"] == undefined) addButton(buttonIndex, "Maid Outfit", broodmotherDressup_Item_2, new MaidOutfit());
		else addButton(buttonIndex, "Maid Outfit", broodmotherDressup_Item, new MaidOutfit());
		buttonIndex++;
	}
	if (pc.hasItemByClass(SchoolgirlOutfit)) 
	{
		if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"] == undefined) addButton(buttonIndex, "Schoolgirl Outfit", broodmotherDressup_Item_2, new SchoolgirlOutfit());
		else addButton(buttonIndex, "Schoolgirl Outfit", broodmotherDressup_Item, new SchoolgirlOutfit());
		buttonIndex++;
	}	
	if (pc.hasItemByClass(LeatherStrapHarness))
	{
		if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"] == undefined) addButton(buttonIndex, "Strap Harness", broodmotherDressup_Item_2, new LeatherStrapHarness());
		else addButton(buttonIndex, "Strap Harness", broodmotherDressup_Item, new LeatherStrapHarness());
		buttonIndex++;
	}
	if (pc.hasItemByClass(TeacherOutfit))
	{
		if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"] == undefined) addButton(buttonIndex, "Teacher Uniform", broodmotherDressup_Item_2, new TeacherOutfit());
		else addButton(buttonIndex, "Teacher Uniform", broodmotherDressup_Item, new TeacherOutfit());
		buttonIndex++;
	}
	if (pc.hasItemByClass(FarmersOveralls))
	{
		if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"] == undefined) addButton(buttonIndex, "Farmer Overalls", broodmotherDressup_Item_2, new FarmersOveralls());
		else addButton(buttonIndex, "Farmer Overalls", broodmotherDressup_Item, new FarmersOveralls());
		buttonIndex++;
	}
	
	if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"] != undefined)
	{
		addButton(13, "Undress", broodmotherDressup_Item, null);
	}
	
	addButton(14, "Back", talkBroodmother);
}

// This one gone to first if she's wearing stuff
public function broodmotherDressup_Item(clothing:ItemSlotClass):void
{
	clearOutput();
	clearMenu();
	author("HNB");
	
	var oldItem:String = flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"];
	var lvl:int = getBroodmotherLevel();
	var item:ItemSlotClass;
	
	//Descriptor of taking old item off
	if (oldItem == "NurseOutfit") 
	{
		if (lvl == 2) output("You first unzip the front of her red and white nurses uniform and then take her stethoscope and hat from her. Dropping them to the floor as you kneel down, taking the uniform with you, you roll her bright red stockings down her thighs.");
		else if (lvl == 3) output("You first unzip the remaining portion of her red and white nurses uniform before taking her stethoscope and hat from her. Dropping them to the floor as you kneel down, taking the uniform with you, you roll her bright red stockings down her thick thighs.");
		else output("With the zip already completely pushed away, unable to hold her buxom figure, you pull the shirt off over her arms. Taking the stethoscope and hat from her, you then grasp her jiggling thighs and roll her bright red stockings down, removing the outfit from her.");
		item = new NurseOutfit();		
	}
	if (oldItem == "MaidOutfit")
	{
		if (lvl == 2) output("You first untie the broodmothers maid-apron and pull the straps of it over her head, dropping it to the floor. You then undo the buttons of the uniform underneath and pull it back over her shoulders before letting go, the uniform slumping to the floor. You then kneel down and roll her frilly stockings down her thighs.");
		else if (lvl == 3) output("You first untie the broodmothers maid-apron and pull the straps of it over her head, dropping it to the floor. You then undo the buttons of the uniform underneath and pull it back over her shoulders before letting go, the uniform slumping to the floor. You then kneel down and roll her frilly stockings down her thighs.");
		else output("The ribbon on the apron has been torn, along with the front portion of the garment as it's been unable to hold the sheer size of the broodmother. You have to slide the chest portion off the remainder of the breasts they're struggling to handle, before pulling the garment off over her head. With this done you then grasp her jiggling thighs and roll her frilly stockings down along with her skirt, and remove them from her. Finally you take the frilly maid hat from her head, removing the outfit from her.");
		item = new MaidOutfit();
	}
	if (oldItem == "SchoolgirlOutfit")
	{
		if (lvl == 2) output("You throw aside her low-hanging tie before undoing the buttons on her blouse, freeing her bouncing breasts before pulling it off her. You then pull down her tartan skirt, removing the outfit from her.");
		else if (lvl == 3) output("You throw aside her low-hanging tie before undoing the remaining buttons on her blouse, several already having been pushed loose by her bulging belly. Freeing her bouncing breasts you pull the blouse over her arms and off of her. You then pull down her tartan skirt, removing the outfit from her.");
		else output("With the shirt already burst open, unable to hold her buxom figure, you pull the shirt off over her arms. You then move to her rear and grab hold of her tartan skirt before pulling it down, removing the outfit from her.");
		item = new SchoolgirlOutfit();
	}
	if (oldItem == "LeatherStrapHarness")
	{
		if (lvl == 2) output("Putting your hands close to her warm body, you tug on the steel rings that clasp the harness tight to her body until the straps loosen enough for you to slide the black leather off her body.");
		else if (lvl == 3) output("Putting your hands close to her warm body, you tug on the steel rings that clasp the harness tight to her body until the straps loosen enough for you to slide the black leather off her buxom body.");
		else output("Putting your hands close to her warm body, you wedge your hands under rolls of her flesh, grabbing hold of the steel rings that clasp the harness tight to her body. You yank at them until the straps loosen enough for you to unwrap the black leather ribbon from your Raskvel present.");
		item = new LeatherStrapHarness();
	}
	if (oldItem == "TeacherOutfit")
	{
		if (lvl == 2) output("You unbutton the white blouse freeing her bouncing breasts before pulling it off her. You then grab her professional-looking skirt by the hem, yanking it off her, dragging her stockings with you as you go.");
		else if (lvl == 3) output("You unbutton the white blouse, which was struggling to hold on against her buxom figure. Her breasts burst forth as you undo the third from the top button and you quickly finish the job, pulling it over her arms and off. You then grab her professional-looking skirt by the hem, wiggling it over her wide hips, before, as it reaches her thighs dragging the stockings with you.");
		else output("With no buttons left on the blouse, prior to an earlier battle against her body, you are able to pull it over her arms and off. You then grab her scrunched-up skirt by the waist, wiggling it over wide hips and buttocks, before it reaches her thighs where you drag the stockings off with it.");
		item = new TeacherOutfit();
	}
	if (oldItem == "FarmersOveralls")
	{
		if (lvl == 2) output("You grab the straps of the overalls and pull them off her shoulders before grabbing the outfit by the sides of the Broodmothers breasts and pulling them down to her hips. You then roll the rest of them down around her motherly curves, until the overalls lie, crumpled on the floor.");
		else if (lvl == 3) output("You grab the taut straps of the overalls and pull them off her shoulders before grabbing the outfit by the sides of the Broodmothers breasts and pulling them down to her curvaceous hips. You then roll the rest of them down around her motherly curves, until the overalls lie, crumpled on the floor.");
		else output("You grab the taut straps of the overalls and pull them off her shoulders before yanking away the front of the garment - that's been burst open unable to keep hold of her gigantic paunch. With this done, you are able to roll the remaining part of the overalls down around her motherly curves, until the overalls lie, crumpled on the floor.");
		item = new FarmersOveralls();
	}
	flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"] = undefined;
	
	//Push the oldItem here, because destroying it pernamently is SAD
	if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_SEEN_REPAIR_RASKVEL"] == false || flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_SEEN_REPAIR_RASKVEL"] == undefined) {
		output("\n\nJust as you draw your attention to her naked body, a shadowy figure darts out from the corner of your eye and grabs the outfit, before scurrying away with it.\n<i>“Hey!”</i> you shout after them ");
		if (pc.hasRangedWeapon())
		{
			output(", grabbing your [pc.rangedWeapon] and aiming it in their direction.");
		}
		else if (pc.hasMeleeWeapon())
		{
			output(", grabbing your [pc.meleeWeapon] and getting ready to charge off in their direction.");
		}
		else 
		{
			output(", getting ready to charge off in their direction.");
		}
		output("\n<i>“Wait [pc.name]”</i> the Broodmother says, smirking as you draw your attention back to her. <i>“He's one of mine”</i>.\n");
		output((pc.hasWeapon() ? "Lowering your weapon, y" : "Y") + "ou look back and see the Raskvel returning with the outfit neatly folded. He hands it to you and you realize that it's been repaired.");
	
		flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_SEEN_REPAIR_RASKVEL"] == true;
	}
	else {
		output("\n\nAs you draw your attention to her naked body, a figure darts out from the corner of your eye, grabbing the outfit and runs off to repair it. Not a minute later you feel a tab on your shoulder. Drawing your eyes away from the Broodmother, the male Raskvel hands you a folded and fixed outfit.\n<i>“Thanks!”</i> you shout after him as he runs off into the shadows.");
	}
	output("\n");
	var loot:Array = new Array();
	item.quantity = 1;
	loot.push(item);
	itemCollect(loot);
	output("\n");
	
	//Whether we're giving her a new outfit.
	if (clothing == null)
	{
		addButton(0, "Next", approachBroodmother);
	}
	else 
	{
		output("Turning your attention back to the Broodmother - who's aroused at being exposed again, you rummage in your backpack.\n<i>“Now, time for your new outfit..”</i>");
		addButton(0, "Next", broodmotherDressup_Item_2, clothing);
	}
}

public function broodmotherDressup_Item_2(clothing:ItemSlotClass):void
{
	clearOutput();
	clearMenu();
	author("HNB");
	
	var lvl:int = getBroodmotherLevel();
	
	//New on
	if (clothing is NurseOutfit) 
	{
		if (lvl == 2) output("First you grab the bright red stockings and roll them up her thighs. Then you place the nurse hat atop her feathery hair and pull the red and white uniform over her arms, zipping it up before dangling the stethoscope around her neck.");
		else if (lvl == 3) output("First you grab the bright red stockings and roll them up her jiggling thighs. Then you place the nurse hat atop her feathery hair and pull the red and white uniform over her arms, zipping it up taut over her belly before dangling the stethoscope around her neck.");
		else output("First you grab the bright red stockings and roll them up her jiggling thighs, yanking them at the top to pull them over their full width. Then you place the nurse hat atop her feathery hair and throw the red and white uniform over her back, which she puts her arms through. You try to zip it up but there's just no way the zip is getting past her collosal paunch.");	
	}
	if (clothing is MaidOutfit)
	{
		if (lvl == 2) output("First you grab the frilly stocking and roll them up her thighs. You then grab the black dress, pulling it over her rounded belly before throwing the apron over and fastening it.");
		else if (lvl == 3) output("First you grab the frilly stocking and roll them up her jiggling thighs. You then grab the black dress, pulling it over her arms and forcing it around her bulging belly before pulling the apron over and fastening it.");
		else output("First you grab the frilly stocking and roll them up her thighs as far as they will go, before yanking them up to the widest part of her thighs. You then squeeze the black dress and white apron over her breasts but they get stuck at her belly. You yank them further down but they tear with a loud ripping sound, leaving tattered pieces around the base of her ginormous paunch, but allowing you to pull the dress over her bulging buttocks.");
	}
	if (clothing is SchoolgirlOutfit)
	{
		if (lvl == 2) output("First you unzip the skimpy tartan skirt before pulling it up around her waist. Then you throw the blouse over her arms and button it up over her torso, before hanging the tie around her neck.");
		else if (lvl == 3) output("First you unzip the skimpy tartan skirt before pulling it up around her wide hips, just about zipping it up. Then you throw the blouse over her arms and button up the top half - just, over her sizeable rack but give up on fastening the lower buttons, her bulging belly too sizeable. Finally you hang the tie around her neck.");
		else output("First you unzip the skimpy tartan skirt and force it up around her wide hips, but unable to zip it up. You then throw the blouse over her arms and attempt to button it up but to no avail, her buxom figure too sizeable. Finally you hang the tie around her neck.");
	}
	if (clothing is LeatherStrapHarness)
	{
		if (lvl == 2) output("You carefully lift the straps of the leather harness over her, making sure to position them in the most visually appealing way as well as ensuring the rings sit nicely, before tightening it.");
		else if (lvl == 3) output("You carefully lift the straps of the leather harness over her, making sure to position them in the most visually appealing way as well as ensuring the rings sit nicely, before tightening it.");
		else output("You carefully lift wrap the straps of the leather harness around her, making sure to position them in the most visually appealing way as well as ensuring the rings sit nicely, before tightening it.");
	}
	if (clothing is TeacherOutfit)
	{
		if (lvl == 2) output("You first grab the dark stockings and roll them up her legs and over her thighs. Following this you grab the dark colored skirt and pull it over her legs and up to her hips, fastening it at the top. Finally you pull the blouse over her arms, and button it up.");
		else if (lvl == 3) output("You first grab the dark stockings and roll them up her legs and over her jiggling thighs. Following this you grab the waist of the dark colored skirt and pull it over her legs and up to her hips, barely fastening it at the top against her stomach. Finally you pull the blouse over her arms and button it up as much as you can, her rounded figure causing you to have to miss out a few buttons around her chest and shoulders.");
		else output("You first grab the dark stockings and roll them up her legs, yanking them over the width of her jiggling thighs. Following this you grab the waist of the dark colored skirt and pull it over her legs and up to her hips, unable to fasten it at the top against her stomach. Finally you pull the blouse over her arms and begin to button it up around her chest but the buttons soon ping off in various directions. She cackles and you decide it's probably best to leave the buttons undone.");
	}
	if (clothing is FarmersOveralls)
	{
		if (lvl == 2) output("You first pull the overalls over her legs, and up to her hips, putting the leg portion of the outfit on. You then pull the rest of the outfit up and over her chest before pulling the straps over her arms and resting them taut on her shoulders.");
		else if (lvl == 3) output("You first pull the overalls over her legs, and up to her hips, putting the leg portion of the outfit on. You then pull the rest of the outfit up and over her chest with a few ripping sounds along the way as the outfit battles against her sizeable belly. Happy that the outfit is on you pull the straps over her arms and rest them taut on her shoulders.");
		else output("You first pull the overalls over her legs, and up to her wide hips, squeezing the leg portion of the outfit on. You then attempt to pull the rest of the outfit up and over her stomach but you're soon met with a large ripping sound as her gravid belly is just too large for the outfit. With the ripped portion of the outfit framing her belly you continue to pull as to test the rest of the outfit, managing to cup a few scraps of the outfit over the sides of her bosom. Happy with your work, you pull the straps over her shoulders.");
	}
	
	var className:String = getQualifiedClassName(clothing);
	pc.destroyItemByClass(Class(getDefinitionByName(className)));
	
	// Saving classname, but get just the last part from e.g classes.Items.Apparel::LeatherStrapHarness -> LeatherStrapHarness
	flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"] = className.substring((className.lastIndexOf(":")) + 1,className.length);
	
	addButton(0, "Next", approachBroodmother);
}

public function broodMotherAppearance():void
{
	clearOutput();
	clearMenu();
	author("HNB");
	
	var lvl:int = getBroodmotherLevel();
	
	// Where is
	if (lvl == 0)
	{
		output("The purple raskval ex-broodmother is standing in front of you, her motherhusk-withdrawn form no longer requiring any support.\n");
	}
	else 
	{
		if (lvl >= 1 && lvl < 4)
		{
			output("The purple broodmother is stood in front of you, clutching her ");
		}
		else 
		{
			output("The purple raskval broodmother lies in front of you, atop her ");
		}
		
		switch(lvl)
		{
			case 1: 
				output("swollen");
				break;
			case 2: 
				output("plump");
				break;
			case 3: 
				output("big, round");
				break;
			case 4: 
				output("giant, baby-making");
				break;
			case 5: 
				output("ginormous, pregnancy-stretched");
				break;
			case 6: 
				output("gargantuan, writing-covered");
				break;
		}
		
		if (isBroodmotherTreated())
		{
			output(", udder-spangled");
		}
		
		if (lvl >= 1 && lvl < 4)
		{
			output(" stomach.\n");
		}
		else 
		{
			output(" paunch.\n");
		}
	}
	
	// Hair	
	output("She has ");
	if (lvl == 0){
		output("short");
	}
	else if (lvl == 1){
		output("medium-length");
	}
	else 
	{
		output("lengthy");
	}
	output(" blue feathers for hair" + (lvl >= 2 ? ", which flows down her back" : "") + ", with huge, pierced, rabbit-like ears extending from beneath it and drooping down all the way to the floor.\n");
	
	// Expression + headwear	
	if (getWhatWearing() == "teacher outfit") output("She's wearing rounded, transparent glasses, that whilst they partially add a look of intelligence to her, they mostly just look hot! ");
	else output("She's wearing rounded, green glasses, perhaps from a less sex-focused time in her life - not that they don't look sexy on her, slid halfway down her nose, alluringly. ");
	
	if (isBroodmotherTreated()){
		output("Her head is topped off with two small white, cow-like horns");
		if (getWhatWearing_Head() != null) output("  and in front of them sits a " + getWhatWearing_Head() + ".");
		else output(".");
	}
	else{
		if (getWhatWearing_Head() != null) output("Atop her head sits a " + getWhatWearing_Head() + ".");
	}
	
	switch(lvl)
	{
		case 0:
			output("The expression on her face is one of sadness and frustration at a lifestyle she enjoyed - lost.\n");
			break;
		case 1: 
			output("The expression on her face is one of eagerness, her tongue hanging from her mouth in excitement.\n");
			break;
		case 2: 
			output("The expression on her rounding face is one of eagerness, her tongue hanging from her mouth in excitement.\n");
			break;
		case 3: 
			output("The expression on her rounding face is one of action, her eyebrows lowered slightly in determination and a eager smile across her plumpening lips.\n");
			break;
		case 4: 
			output("A seductive expression shines across reddened, rounding face, her long eyelashes fluttering as her red eyes stare at you, her tongue hanging from her plump lips.\n");
			break;
		case 5: 
			output("A seductive expression shines across reddened, rounding face, her long eyelashes fluttering as her red eyes stare at you, her tongue hanging from her plump lips.\n");
			break;
		case 6: 
			output("The expression on her chubby, reddened visage is one of either seductiveness or pleasure. She looks at you with soft red eyes, framed by blue eye-shadow and pants and moans excitedly through her portly lips.\n");
			break;
	}
	
	//Tits
	if (getWhatWearing_Neck() != null) output("Looking past the " + getWhatWearing_Neck() + " on her neck, you fixate your eyes on her ");
	else output("Looking past the golden choker on her neck, you fixate your eyes on her ");
	
	switch(lvl)
	{
		case 0:
			output("teenie B-Cup mounds, ");
			break;
		case 1: 
			output("round D-Cup titties, ");
			break;
		case 2: 
			output("round chest-cannons, ");
			break;
		case 3: 
			output("basketball sized jugs, that rest atop her belly, ");
			break;
		case 4: 
			output("huge motherly breasts, that rest atop her belly, ");
			break;
		case 5: 
			output("giant chest-pillows, that battle for space against her belly, ");
			break;
		case 6: 
			output("back-breaking milkers, that battle for space against her belly, ");
			break;
	}
	if (getWhatWearing_Chest() != null) output("framed by a " + getWhatWearing_Chest() + " and ");
	//Nips
	switch(lvl)
	{
		case 0:
			if (isBroodmotherTreated())
			{
				output("tipped with large, pink teats, that take up most of the space on them.\n");
			}
			else 
			{
				output("tipped with dark, pointy nipples.\n");
			}
			break;
		case 1: 
			if (isBroodmotherTreated())
			{
				output("tipped with large, pink teats, that take up most of the space on them.\n");
			}
			else 
			{
				output("tipped with dark, round mounds.\n");
			}
			break;
		case 2: 
			if (isBroodmotherTreated())
			{
				output("finished off with large, round teats, atop large pink mounds.\n");
			}
			else 
			{
				output("finished off with mound-like, purple areolae, tipped by soft, round nipples.\n");
			}
			break;
		case 3: 
			if (isBroodmotherTreated())
			{
				output("finished off with long, shaft-like teats, atop large pink mounds.\n");
			}
			else 
			{
				output("finished off with large, mound-like, purple areolae, tipped by soft, round nipples.\n");
			}
			break;
		case 4: 
			if (isBroodmotherTreated())
			{
				output("finished off with long, shaft-like teats, beads of milk glistening at their tips.\n");
			}
			else 
			{
				output("finished off with large, mound-like, purple areolae, tipped by soft, round nipples.\n");
			}
			break;
		case 5: 
			if (isBroodmotherTreated())
			{
				output("finished off with large, udder-like mounds, tipped by bloated, dick-like teats, their loads dribbling down her breasts.\n");
			}
			else 
			{
				output("finished off with large, breast-like purple mounds, tipped by large, bloated nipples.\n");
			}
			break;
		case 6: 
			if (isBroodmotherTreated())
			{
				output("finished off with large, udder-like mounds, tipped by pierced, bloated, dick-like, teats, their loads dribbling down her breasts.\n");
			}
			else 
			{
				output("finished off with large, breast-like purple mounds, tipped by pierced, large, bloated nipples.\n");
			}
			break;
	}
	
	//hips + butt
	output("Following her body down, ");
	if (lvl == 0)
	{
		output("you rotate around her broad hips, getting a great view of her small, tight butt.\n");
	}
	else if (lvl < 4)
	{
		output("you draw your attention to her ");
		switch(lvl)
		{
			case 1: 
				output("curvaceous hips");
				break;
			case 2: 
				output("wide hips");
				break;
			case 3: 
				output("lofty hips");
				break;
		}
		output(", though as broad as they may be, her ");
		switch(lvl)
		{
			case 1: 
				output("big, round butt");
				break;
			case 2: 
				output("fat ass");
				break;
			case 3: 
				output("phat ass");
				break;
		}
		output(" is in plain view, even from the front" + (getWhatWearing_Behind() != null ? (" despite her " + getWhatWearing_Behind() + "s attempts to conceal it") : "") + ".\n");
	}
	else 
	{
		switch(lvl)
		{
			case 4: 
				output("you draw your attention to her huge ass, which bulges out from " + (getWhatWearing_CrotchPosition() != null ? getWhatWearing_CrotchPosition() : "between her motherly hips") + ". Her buttocks are so round, you have no chance of taking a peek at her butthole.\n");
				break;
			case 5: 
				output("you draw your attention to her huge ass, which bulges out from " + (getWhatWearing_CrotchPosition() != null ? getWhatWearing_CrotchPosition() : "between her motherly hips") + ". Her buttocks are so round, if it wasn't for the large, space-age buttplug parting them you'd never see in between!\n");
				break;
			case 6: 
				output("you draw your attention to her huge, spank-marked ass" + (getWhatWearing_CrotchPosition() != null ? (", which bulges out from " + getWhatWearing_CrotchPosition()) : "") + ", 'cumdump' proudly written across her right buttock. Her buttocks are so round, if it wasn't for the large, space-age buttplug parting them you'd never see in between!\n");
				break;
		}
	}
	if (lvl < 4){output("You walk back round to the front of her to examine the rest of the goods.\n"); }
	
	//Cock if futa
	if (isBroodmotherFuta())
	{
		output("Because of your help previously, ");
		switch(lvl)
		{
			case 0:
				output("a mound has formed on the broodmothers " + (isBroodmotherTreated() ? "hairy " : "") + "crotch, a dagger-like, blue cock jutting out from it and a small round cum-pouch dangling below.\n");
				break;
			case 1: 
				output("a mound has formed on the broodmothers " + (isBroodmotherTreated() ? "hairy " : "") + "crotch, causing a dagger-like, blue cock to follow the curve of her belly, a small round cum-pouch dangling below.\n");
				break;
			case 2: 
				output("a curvy, blue cock juts out from the dark" + (isBroodmotherTreated() ? ", hairy" : "") + " space below her stomach, a small round cum-pouch dangling below.\n");
				break;
			case 3: 
				output("a hard, curvy, blue cock is lifting up her belly like a tentpole, a small round cum-pouch dangling below.\n");
				break;
			case 4: 
				output("a large, curved blue cock is resting on her belly, having jutted out from a mound on her " + (isBroodmotherTreated() ? "hairy crotch, a hairy cumpouch sitting beneath it, like a throne.\n" : "crotch, a throne-like cumpouch sitting beneath it.\n"));
				break;
			case 5: 
				output("a blue, forearm-length cock is resting, cum-stained on her belly, having jutted out from a mound on her " + (isBroodmotherTreated() ? "hairy crotch, a hairy cumpouch sitting beneath it, like a throne.\n" : "crotch, a throne-like cumpouch sitting beneath it.\n"));
				break;
			case 6: 
				output("a thick, veiny, forearm-length cock is resting, cum-stained on her belly, having jutted out from a mound on her " + (isBroodmotherTreated() ? "hairy crotch, a hairy cumpouch sitting beneath it, like a throne.\n" : "crotch, a throne-like cumpouch sitting beneath it.\n"));
				break;
		}
		output("She's also in posession of her favorite asset. ");
	}
	
	//Puss
	output("Between her thick " + (getWhatWearing_Thighs() != null ? (getWhatWearing_Thighs() + " clad ") : "") + "thighs, her ")
	switch(lvl)
	{
		case 0: 
			output("tight" + (isBroodmotherTreated() ? ", hairy " : " ") + "pussy, two purple clits poking out from both ends, golden hoops dangling from them.\n");
			break;
		case 1: 
			output((isBroodmotherTreated() ? "hairy, " : "") + "eager pussy, two purple clits poking out from both ends, golden hoops dangling from them.\n");
			break;
		case 2: 
			output((isBroodmotherTreated() ? "hairy, wet, " : "") + "widening pussy, two round, purple clits poking out from both ends, golden hoops dangling from them.\n");
			break;
		case 3: 
			output((isBroodmotherTreated() ? "hairy, damp, " : "wet, ") + "cock-hungry babymaker, two bulbous, purple clits poking out from both ends, golden hoops dangling from them.\n");
			break;
		case 4: 
			output((isBroodmotherTreated() ? "hairy, shiny, " : "damp, ") + "plump cum-hole, two bulbous, purple clits poking out from both ends, golden hoops dangling from them.\n");
			break;
		case 5: 
			output((isBroodmotherTreated() ? "hairy, soaking, " : "shiny, ") + "agape cum-hole, two bulbous, hoop-pierced, purple clits poking out from both ends, from between waves of white.\n");
			break;
		case 6: 
			output((isBroodmotherTreated() ? "hairy, dripping, " : "shiny, ") + "cavernous fuck-hole, two bulbous, hoop-pierced, purple clits poking out from both ends, from between waves of white.\n");
			break;
	}
	
	addButton(0, "Okay", approachBroodmother);
}

// ITEM GIVING-------------------------------------------------------------------------------------------------------

public function giveBroodMotherItem():void
{	
	clearMenu();
	clearOutput();
	author("HNB");
	var lvl:int = getBroodmotherLevel();
	var isSlut:Boolean = ((pc.isTreated() && pc.isBimbo()) || pc.isBimbo() || pc.isBro() || pc.isDependant(Creature.DEPENDANT_CUM) || (pc.libido() >= 50 && pc.lust() >= 33) || pc.lust() > 66);
	
	output("You rummage in your inventory, looking for something to ");
	
	if (getBroodmotherLevel() == 0)
	{
		output("lift her spirits.");
	}
	else
	{
		output("please her.");
	}
	
	var currentButtonIndex:int = 0;
	
	// Motherhusk
	if (pc.hasItemByClass(Motherhusk,8) && lvl == 0)
	{
		addButton(currentButtonIndex, "Motherhusks", giveMotherhusk);
		currentButtonIndex++;
	}
	else
	{
		if (lvl == 0)
		{
			if (!pc.hasItemByClass(Motherhusk))
			{
				addDisabledButton(currentButtonIndex, "Motherhusks", "Give motherhusks" , "You don't have any.");
			}
			else (!pc.hasItemByClass(Motherhusk, 8))
			{
				addDisabledButton(currentButtonIndex, "Motherhusks", "Give motherhusks" , "You'd need at least 8 to help her recover.");
			}
			currentButtonIndex++;
		}
	}
	
	// You'd have to be a slut and like the treatment to risk breaking the law by giving her treatment
	if (pc.hasItemByClass(Treatment) && !isBroodmotherTreated() && isSlut && pc.isTreated() && getBroodmotherFriendliness() >= 15)
	{
		addButton(currentButtonIndex, "Treatment", giveTreatment);
		currentButtonIndex++;
	}
	else
	{
		if (!isBroodmotherTreated())
		{
			if (getBroodmotherFriendliness() < 15){
				addDisabledButton(currentButtonIndex, "Treatment", "You have to be closer to her, for her to trust anything you offer her.");
			}
			else if (!isSlut)
			{
				addDisabledButton(currentButtonIndex, "Treatment", "You'd have to be sex obsessed to break the law for this.");
			}
			else if (!pc.isTreated())
			{
				addDisabledButton(currentButtonIndex, "Treatment", "You're not sure about the treatment.");
			}
			else if (!pc.hasItemByClass(Treatment))
			{
				addDisabledButton(currentButtonIndex, "Treatment", "You don't have any.");
			}
			currentButtonIndex++;
		}
	}
	
	if (pc.hasItemByClass(Throbb) && !isBroodmotherFuta() && getBroodmotherFriendliness() >= 15)
	{
		addButton(currentButtonIndex, "Throbb", giveThrobb);
		currentButtonIndex++;
	}
	else
	{
		if (getBroodmotherFriendliness() < 15){
			addDisabledButton(currentButtonIndex, "Throbb", "You have to be closer to her, for her to trust anything you offer her.");
		}
		else if (!pc.hasItemByClass(Throbb))
		{
			addDisabledButton(currentButtonIndex, "Throbb", "You don't have any");
		}
		currentButtonIndex++;
	}
	
	addButton(14,"Back",approachBroodmother);
}

public function giveThrobb():void
{
	clearMenu();
	clearOutput();
	author("HNB");
	
	var lvl:int = getBroodmotherLevel();
	
	// If she's not completely fixated on getting the motherhusks back
	if (lvl != 0)
	{
		output("<i>“What's dat?”</i>, the broodmother asks, as you take the vial of throbb from your backpack. Seeing an opportunity to trick the cock-hungry broodmother ");
		if (pc.hasVaginas() || !pc.analVirgin)
		{
			output(" for your own pleasure");
		}
		else
		{
			output(" for your own amusement");
		}
		
		if (pc.isMischievous())
		{
			output(" you respond. <i>“Oh this? This'll get you cock in no time!”</i>\n");
		}
		else if (pc.isBimbo() || pc.isBro())
		{
			output(" you respond. <i>“Oh this? This'll get you dick!”</i>\n");
		}
		else
		{
			output(" you respond. <i>“Oh this'll get you cock!”</i>\n");
		}		
		
		if (lvl < 3)
		{
			output("<i>“Ooh really?! Give it here, give it here!”</i> she shouts excitedly, bouncing on the balls of her feet.\n");
		}
		else 
		{
			output("<i>“Ooh, more? Gimme, gimme!”</i> she shouts excitedly, saliva dripping from her tongue like a hungry dog.\n");
		}
		
		output("You pass the vial to her and she eagerly downs it. Pleased that she's fallen for your mischief you step back to watch the transformation unfold.\n\n");
		if (lvl < 4 && getWhatWearing() != null)
		{
			output("Roughly ten seconds later she cries out <i>“What's happening?! It feels so tingly!”</i> drawing her hand to just under her bulging belly, trying to figure out what's happening. Her belly wobbles and you notice it shift up slightly.");
			
			if (getWhatWearing() == "FarmersOveralls") output("Unable to contain yourself any longer you dash forward, stand next to her and grab the side of her overalls, peaking at what's happening in her nether-regions. You smirk ");
			else if (getWhatWearing() == "LeatherStrapHarness") output("Unable to contain yourself any longer you dash forward, stand in front of her and look close between the leather straps either side of her crotch. You smirk ");
			else  output("Unable to contain yourself any longer you dash forward, stand in front of her and lift the hem of her skirt, peeking at what's happening in her nether-regions. You smirk ");
			
			output(" as a mound of flesh has grown above her swollen pussy. ");
		}
		else 
		{
			output("Roughly ten seconds later she cries out <i>“What's happening?! It feels so tingly!”</i> ");
			if (lvl < 4) output("drawing her hand to just under her bulging belly, trying to figure out what's happening. Her belly wobbles and you notice it shift up slightly as a mound of flesh has grown above her swollen pussy. ");
			else output("as she writhes in place and reaches back with her tail, trying to get a feel for what's happening to her. She seems to tilt forward slightly, and you notice that below her awaiting fuck-hole a gap has been created between her and her ginormous paunch, as a mound of flesh has grown above her swollen pussy. ");
		}
		output("The bulge expands and opens up, blooming like a flower, leaving the broodmother with a <b>genital slit</b>. The bottom of the pouch twitches and throbbs, bulging, causing the broodmother to moan and soon, with a gasp, a <b>testicle pouch</b> drops suddenly, " + (lvl < 4 ? "dangling between her legs.\n" : "resting on her undercarriage.\n"));
		
		if (lvl < 3)
		{
			output("<i>“I demand you tell me what is happening [pc.name]!”</i> shrieks the broodmother, seemingly unable to get a grasp on the 'situation'. ");
		}
		else 
		{
			output("<i>“Hnghh, what's 'appening”</i> gasps the the broodmother, sweat dripping from her forehead, as she flicks her tail wildy, seemingly unable to get a grasp on the 'situation'. ");
		}
		
		output("She suddenly gasps and lets out a involuntary" + (isBroodmotherTreated() ? " moo" :  "moan") + ", as her new slit is pushed open and a blue clit emerges from its center. No, not a clit. It continues to grow becomer thicker and longer, curving back on itself. As it passes into the broodmothers view her eyes glaze over. It keeps growing before stopping part way up her belly. She has grown a <b>" + getBroodmotherFutaCockSize() + " blue raskvel cock</b>.");
		
		output("As it finishes growing, it throbs and a spurt of cum flies ");
		if (rand(2) == 0)
		{
			output("across your face. ");
			if (pc.lust() >= 50 || pc.libido() > 65)
			{
				output(" Some splashes across your [pc.lips] and you are quick to lick it off. ");
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
			output("over your shoulder. ");
		}
		
		output("The broodmother lets out a long " + (isBroodmotherTreated() ? "moo " : "moan ") + "as this happens before giggling.\n <i>“I see what you mean now by helping me get cock. You better take responsibility for this though”</i>.");
		flags["PREG_RASK_RETURNED_BODYTYPE"].push("FUTA");
		showPregRaskReturn();
		addButton(0,"Continue",giveBroodMotherItem);
	}
	else
	{
		output("<i>“That doesn't look like a motherhusk!”</i> the broodmother screeches with a very angry look on her face. <i>“Bring 'em back!”</i>");
		addButton(0,"Back",giveBroodMotherItem);
	}
}

public function giveMotherhusk():void
{
	clearMenu();
	clearOutput();
	author("HNB");
	showPregRaskReturn();
	
	output("You take your hands out of your backpack, cupping a small pile of motherhusks in your hands. " + (pc.tallness < (6 * 12) ? "She looks down at them." : "She stands on tiptoes to look into your hands.") + "She goes silent. You feel a tear splash against the outside of your palm and the silence is broken by a sniff, as her shining eyes lock with yours, tears running down her cheeks.\n");
	output("<i>“Thank you. I've been here alone for so long, the life I enjoyed taken away from me and now you're returning it. I can't believe it. Thanks”</i> she murmurs shakily before gathering the motherhusks from your hand and cramming them down. She swallows with a gulp and you watch as she wipes her face, a familiar smile returning to it. Her hips widen and her skin plumpens. The stubby feathers atop her head grow out and regain their old shine.\n\n");
	output("A spring in her voice again she squeaks <i>“Thanks, uhh..”</i>.\n");
	output("<i>“[pc.name]”</i>.\n");
	output("<i>“Thanks, [pc.name]”</i>.");
	
	pc.destroyItemByClass(Motherhusk, 8);
	flags["PREG_RASK_RETURNED_FRIENDLINESS"] += 10;
	addLevelPoints(20);
	
	addButton(0, "Continue", giveBroodMotherItem);
}

public function giveTreatment():void
{
	clearMenu();
	clearOutput();
	author("HNB");
	
	var lvl:int = getBroodmotherLevel();
	
	if (lvl != 0)
	{
		output("<i>“What's dat?”</i> the broodmother asks, as you take the treatment medipen from your backpack.\n");
		output("<i>“Oh this thing”</i> you exclaim. <i>“This thing is the best thing ever! It'll make you a really great mommy and it makes sex so good.”</i>\n")
		
		if (isBroodmotherFuta())
		{
			output("<i>“No tricks?”</i> the broodmother asks, raising an eyebrow, remembering what happened last time.\n");
			output("<i>“No tricks”</i>.\n");
		}
		
		if (lvl < 3)
		{
			output("<i>“Ooh really?! Gimme then!”</i> she shouts excitedly, grabbing the medipen from your hands" + (getWhatWearing_IsArmCovered() ? ", rolling up her sleeves " : " ") + "and pushing it into her arm.\n");
		}
		else 
		{
			output("<i>“I'm not sure either of those things can get better”</i>, she says, skeptically.\n");
			output("<i>“Oh, they can!”</i> you respond, very satisfied with your own experience with the treatment.\n");
			output("<i>“Ooooh, Gimme then!</i> she shouts excitedly, grabbing the medipen with her tail" + (getWhatWearing_Behind() != null ? (" shifting her " + getWhatWearing_Behind() + " before ") : " and ") + "pushing it into her right buttock.\n");
		}		
		
		output("\n<i>“Well what now?”</i> she says excitedly.\n");
		output("<i>“Well it'll take a while to kick in, so see you in a week!”</i> you laugh, turning towards the door. As you step outside, you look over your shoulder, ")
		if (pc.isBimbo() || pc.isBro())
		{
			output("catching a last glimpse of the lucky gals excited face.");
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
	else 
	{
		output("<i>“That doesn't look like a motherhusk!”</i> the broodmother screeches with a very angry look on her face. <i>“Bring 'em back!”</i>");
		addButton(0,"Back",giveBroodMotherItem);
	}
}

public function giveTreatment_2():void
{
	clearMenu();
	clearOutput();
	clearBust();
	author("HNB");
	showName("BROOD\nDEN")
	
	output("<b>One week later..</b>\n\n");
	
	output("You one again squeeze between the orange walls to the broodmothers scrap den. You push down on the green intercom button and open your mouth to announce yourself but before you can even finish your first word, noise unexpectedly erupts from the intercom.\n");
	output("<i>“MOOOO!”</i>");
	
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
			output("It sounds like the treatments worked. <i>“It's [pc.name]”</i>, you announce. <i>“Let me in, hon', I want to see what wonderful stuff has happened to you!”</i>. You hear another noise from inside and the door slides open. You eagerly skip inside.\n");
		}
		else if (pc.isBro())
		{
			output("It sounds like the treatments worked. You lean into the intercom, saying <i>“Hey slut, how're you doing?”</i>. You hear another noise from inside and the door slides open. You strut inside.\n");
		}
		else if (pc.isMischievous())
		{
			output("It sounds like the treatments worked. Stifling a laugh you lean into the microphone <i>“It's [pc.name], are you alright in there?”</i>. You hear another noise from inside and the door slides open. You walk inside.\n");
		}
		else
		{
			output("It sounds like the treatments worked. <i>“It's [pc.name]”</i>, you announce. <i>“How're you doing? Anything happened?”</i>. You hear another noise from inside and the door slides open. You walk inside.\n");
		}
	}
	
	addButton(0,"Continue",giveTreatment_3);
}

public function giveTreatment_3():void
{
	clearMenu();
	clearOutput();
	author("HNB");
	
	var isSlut:Boolean = ((pc.isTreated() && pc.isBimbo()) || pc.isBimbo() || pc.isBro() || pc.isDependant(Creature.DEPENDANT_CUM) || (pc.libido() >= 50 && pc.lust() >= 33) || pc.lust() > 66);
	
	pc.lust(10);
	pc.destroyItemByClass(Treatment, 1);
	flags["PREG_RASK_RETURNED_BODYTYPE"].push("TREATED");
	showPregRaskReturn();
	
	var lvl:int = getBroodmotherLevel();
	
	if (lvl < 3)
	{
		output("<i>“Just look at me! Men'll come from all over now!”</i> you hear as you enter the den.\n");
	}
	else if (lvl < 5)
	{
		output("<i>“Look at deez!”</i> you hear as you enter the den.\n");
	}
	else 
	{
		if (pc.hasCock())
		{
			output("<i>“Bet you're so fuckin' hard, looking at me now!”</i> you hear as you enter the den.\n");
		}
		else if (pc.hasVagina())
		{
			output("<i>“Bet you're soakin', looking at me now!”</i> you hear as you enter the den.\n");
		}
		else 
		{
			output("<i>“Bet lookin' at me now's got you all riled up!”</i> you hear as you enter the den.\n");
		}
	}
	output("As your eyes adapt to the sunlight you lay eyes on the new and improved broodmother. Her belly is now bulgier and adorned with a plethora of long, swollen teats which are currently dribbling milk, leaving long milky streaks down her belly. They're inverted towards the center. <b>She has grown udders and fuckable nipples and has increased milk production.</b>\n")
	output("As you breath in, the scent of her girl-cum hits you. You notice her now <b>wetter</b> pussy has become <b>even plumper</b> and coated in <b>juice-covered blue pubic hair</b>. <b>Her clits have also become swollen</b> to the point that they're stretching her out slightly.\n\n");
	
	output("Raising your head to look at her now <b>horn-topped face</b> you smile at her. <i>“Well what d'ya think?”</i> she moans, licking her lips.\n");
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
	
	if (isSlut)
	{
		if(pc.hasCocks())
		{
			output(" you say, stroking your [pc.cocks]" + (pc.isCrotchGarbed() ? "through your [pc.underGarments]" : "") + ".");
		}
		else if(pc.hasCock())
		{
			output(" you say, stroking your [pc.cock]" + (pc.isCrotchGarbed() ? "through your [pc.underGarments]" : "") + ".");
		}
		else if (pc.hasVaginas())
		{
			output(" you say, rubbing your [pc.vaginas]" + (pc.isCrotchGarbed() ? "through your [pc.underGarments]" : "") + ".");
		}
		else if (pc.hasVagina())
		{
			output(" you say, rubbing your [pc.vagina]" + (pc.isCrotchGarbed() ? "through your [pc.underGarments]" : "") + ".");
		}
		else
		{
			output(" you say, rubbing your [pc.crotch]" + (pc.isCrotchGarbed() ? "through your [pc.underGarments]" : "") + ".");
		}
	}
	else
	{
		output(" you say, trying your best not to rub your [pc.crotch]" + (pc.isCrotchGarbed() ? "through your [pc.underGarments]" : "") + ".");
	}
	flags["PREG_RASK_RETURNED_FRIENDLINESS"] += 4;
	addButton(0,"Continue",giveBroodMotherItem);
}

//TALK---------------------------------------------------------------------------

public function talkBroodmother():void
{
	showPregRaskReturn();
	clearMenu();
	clearOutput();
	author("HNB");
	
	var lvl:int = getBroodmotherLevel();
	
	if (lvl == 0)
	{
		output("<i>“What do you want?”</i> she shouts, angrily.");
	}
	else 
	{
		output("<i>“Oh, I suppose we can just talk, I was thinkin' of something funner..”</i>");
	}
	
	addButton(0, "What she does", talkBroodmother_AskWhatDo);
	addButton(1, "Her past", talkBroodmother_AskPast);
	
	if (flags["PREG_RASK_RETURNED_HAVEIMPREGNATED"] == true)
	{
		addButton(2, "Nurse babies", talkBroodmother_NurseBabies);
	}
	if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY"] != undefined && flags["PREG_RASK_RETURNED_DRESSUP_FANTASY"] == 1)
	{
		if (lvl >= 2 && getBroodmotherFriendliness() >= 40)
		{
			addButton(3, "Talk dress-up", talkBroodmother_DressupFantasy);
		}
		else if (getBroodmotherFriendliness() < 40)
		{
			addDisabledButton(3, "Talk dress-up", "Dress-up fantasy", "You're not close enough to her yet to reveal this.");
		}
		else if (lvl < 2)
		{
			addDisabledButton(3, "Talk dress-up", "Dress-up fantasy", "She's not quite big enough for this to be perfect. Yet.");
		}
	}
	addButton(14, "Return", approachBroodmother);
}

// Needs character types put in for pc dialogue
public function talkBroodmother_DressupFantasy():void
{
	clearMenu();
	clearOutput();
	author("HNB");
	
	if (pc.isSubby())
	{
		output("<i>“I was thinking mistress”</i> you say to the broodmother. <i>“When I was seeing to your needs one time, I couldn't help but think about how good you'd look dressed you up in different outfits. With how big you can get, you'd spill out of the clothes in the sexiest way.”</i>\n\n");
	}
	else if (pc.isBimbo())
	{
		output("<i>“Sooo, one time when we were fucking, I was thinking..”</i> you say to the broodmother. <i>“I was thinking about how hot you'd look in some sexy outfits! You're such a big girl, they'd look so skimpy on you! It'd be so HAWT!”</i>\n\n");
	}
	else if (pc.isBro() || pc.isAss())
	{
		output("<i>“Well”</i> you say to the broodmother. <i>“One time when we were bangin', I was thinking how you'd look in some nice skimpy outfits. You're so big, I'd love to see my little eggslut just spilling out of some clothes.”</i>\n\n");
	}
	else
	{
		output("<i>“There's something that I'd like you to do”</i> you say to the broodmother. <i>“When we were.. you know.. one time, I was thinking how hot It'd be if I dressed you up in different outfits. You can get so big that your flesh would just spill out of them in the sexiest way..”</i>\n\n");
	}
	
	output("<i>“Ahaha, really?”</i> she cackles. <i>“I know what you mean though.. that would look pretty hot. And I'm sure loads of folks would love to see me all dressed up, not just you.”</i> She thinks for a moment. <i>“Alright. If you can help me put it on, I'll wear it. Only if it's sexy though!”</i>");
	
	flags["PREG_RASK_RETURNED_DRESSUP_FANTASY"] = 2;
	addButton(0, "Next", talkBroodmother);
}

public function talkBroodmother_NurseBabies():void 
{
	clearMenu();
	clearOutput();
	author("HNB");
	
	//Bringing up you keeping the babies, how they might be better in the nursery than the wasteland 
	output("<i>“You know, I've been thinking. These babies of ours. Letting them out into the wasteland to fend for themselves isn't the best start in life we could give them. I have a nursery on Tavros, I think they might be better off there.”</i>\n\n");
	//Her advantages of the wasteland
	output("<i>“I dunno [pc.name]”</i> she responds, taken aback. <i>“I've been here as long as I can remember and I turned out great. The wasteland will be great for our babies, Raskvel are natural scavengers and around deez parts there's a lot to scavenge. Besides, if they're anything like us, it's not like they'll have any problems starting families to support them.”</i>\n\n");
	//You say they could be much more
	output("<i>“It doesn't matter that they'd be alright scavenging. Their lives could be better than that. At my nursery, they'll be guaranteed a good life. They'll be brought up and educated, so that they can be whatever they want. And when they're older, they can still be great mothers and fathers - that won't change! If we let them out into the wasteland, they might be alright but it's not the best start for them”.</i> <i>“Please”</i> you plead <i>“Let's give them the best chance in life”.</i>\n\n");
	//She thinks, agrees if friendly, otherwise disagrees
	if (getBroodmotherFriendliness() >= 60)
	{
		output("<i>“Alright [pc.name], I suppose that might be better for them”</i> she admits. <i>“I can't do anything about any existing children we might have, I have no idea where they are. But any future children. We'll send to your nursery.”</i>\n\n");
		output("<i>“Thank you. I'm sure they'll thank you, for making that decision. One day.”</i>");
		flags["PREG_RASK_RETURNED_NURSEBABIES"] = true;
	}
	else 
	{
		output("<i>“Sorry [pc.name]”</i> she sighs. <i>“I just don't know if that's the right decision. I was brought up in the wasteland and I'm as happy as can be. I'm sure they will be too.”</i>\n\n");
		output("<i>“Alright”</i> you respond, disappointed. There's no point in pushing the issue.");
	}
	
	addButton(0,"Return",talkBroodmother);
}

public function talkBroodmother_AskWhatDo():void
{	
	clearMenu();
	clearOutput();
	author("HNB");
	
	var lvl:int = getBroodmotherLevel();
	
	output("<i>“So what do you do around here?”</i> you ask.\n");
	
	switch(lvl){
		case 0:
			output("<i>“Nothing anymore”</i> she sighs, her anger subsiding as negative thoughts fill her mind. <i>“You saw me before. That's how I liked my life. I loved - no, had a passion for getting pumped full of babies! It was my life but once you took the shrooms from me, that was gone!”</i>\n");
			if (pc.isBimbo()||pc.isBro())
			{
				output("<i>“Well soz, it was only for some science thing. I can bring them back.”</i>\n");
			}
			else 
			{
				output("<i>“Well sorry but my crewmate needed them for a science experiment. I can probably bring them back now.”</i>\n");
			}
			output("As you say this her eyes glisten. <i>“If you could, that'd be great!”</i> she exclaims.");
			break;
		case 1:
			output("<i>“Well, I sit at the console over there and relax. Sometimes if someone walks by, I make sure to be.. hospitable.”</i>\n");
			break;
		case 2:
			output("<i>“Well, I invite in lodgers who otherwise would be lost to the wasteland and give them some hospitality. I haven't got an option really. Of course, if they want me to have their babies, how can I object”</i> she says.\n");
			output("<i>“And what's with that?”</i> you ask, pointing to a ");
			if (flags["PREG_RASK_RETURNED_CUMSTORAGE_VOLUMECAP"] > 1000)
			{
				output("assortment of buckets by the console.\n");
			}
			else 
			{
				output("bucket by the console.\n");
			}
			output("<i>“Well, if they want to get me pregnant I have to try my hardest to fulfill that. So naturally I make sure to store any excess!”</i>");
			if (pc.isBimbo()||pc.isCumSlut()||pc.isDependant(Creature.DEPENDANT_CUM))
			{
				output("<i>“Ah, of course!”</i> you burst out. <i>“I'll have to try that!”</i>");
			}
			else 
			{
				output("<i>“Ah, of course..”</i> you think to yourself, confused by the science behind that.");
			}
			break;
		case 3,4:
			output("<i>“I find outsiders and 'ave em pump me full of their babies!</i> she says proudly. <i>“Although if I'm already preggers, I save their sticky loads for later”</i>.\n");
			if (pc.hasCock() && (pc.libido() >= 55 || pc.lust() >= 60))
			{
				output("<i>“Oh really”</i> you reply with a wink.\n");
			}
			break;
		case 5,6:
			output("<i>“Mmm, I leave my door open so groups of outsiders can come in 'ere and fuck me full of cum and babies!”</i> she says proudly. <i>“And if I'm already up the duff, I'll store their cummies for later to pour into my pussy”</i>\n");
			output("As images of what she's saying fill her head, " + (isBroodmotherFuta() ? "her cock twitches and a spurt of cum shoots across her undercarriage." : "she flicks her tail around the rim of her pussy, beads of girl-cum dripping onto her undercarriage as she does."));
			break;
	}
	
	addButton(0,"Return",talkBroodmother);
}

public function talkBroodmother_AskPast():void
{	
	clearMenu();
	clearOutput();
	author("HNB");
	
	var lvl:int = getBroodmotherLevel();
	
	output("<i>“So what did you do before this?”</i> you ask.\n");
	
	if (lvl == 0)
	{
		output("<i>“Like I'd give any details about my life to the person that ruined it!”</i> she shouts frustratedly, a look of nostalgia in her tear-filled eyes.\n");
	}
	else if (lvl == 1)
	{
		output("<i>“Well before this, I was just another Raskvel, trying to make my way in this wasteland. One day as I was looking for food I found a shipwreck here in the sand. It was busted up and the electrics were a bit faulty but it was nothing I couldn't patch up.”</i>\n");
		output("<i>“I was gonna make this place my home and rent some of the space out to lodgers. Anyway, after I patched up holes in the exterior and restored the defences, I explored the interior.”</i>\n");
		output("<i>“When I searched the bay, I found food - those lovely motherhusks. I snacked on them and over time they kicked in. At first I was soooo horny, so I flirted with some of the more attractive lodgers in order to relieve that. However as I continued eating them, I got even hornier and I just wanted everyone to empty their loads in me. Soon I forgot about the lodging and just spent all my time fucking and getting knocked up and I loved it!”</i>\n");
		output("<i>“I'm glad I'm on my way to returning to that life now.”</i> she finishes.\n");
	}
	else if (lvl < 3)
	{
		output("<i>“Hmm, I'm not so sure”</i> she says, a look of confusion on her face. <i>“I remember being like this, having fun all day. And then I remember there was a sad time for a little while, when you took the lovely 'shrooms from me. But then you fixed it and everything's great again!”</i>\n");
	}
	else
	{
		output("<i>“Haha, nothin' silly!”</i> she cackles, a look of bemusement on her face. <i>“I've always been up 'ere, getting fucked and filled with babies!”</i>\n");
	}
	
	addButton(0,"Return",talkBroodmother);
}

public function joinBroodmother():void{
	clearMenu();
	clearOutput();
	author("HNB");
	
	showBust(getPregRaskReturn_BustName(),"JOIN_BROODMOTHER_GANG");
	
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
	
	// Setup for descriptions
	pc.removeAll();
	var vaginas:int = pc.totalVaginas();
	var rows:int = pc.bRows();
	for (var i:Number=0; i<vaginas-1;i++){ 
		pc.vaginas[i].loosenessRaw += 5;
		pc.loadInCunt(chars["RASKVEL_MALE"], i);
	}
	pc.lust(pc.lustMax());
	pc.bellyRatingRaw += 50;
	for (var j:Number=0; j<rows-1;j++)//breastrows
	{
		pc.breastRows[i].breastratingraw += 25;
		pc.breastRows[i].nippleWidthRatio += 3;
	}
	pc.buttRatingRaw += 20;
	pc.hipRatingRaw += 20;
	pc.ass.loosenessRaw = 6;
	if (pc.isLactating())
	{
		pc.milkMultiplier = 100;
		pc.milkFullness = 100;
	}
	pc.willpower(-50);
	processTime(60*24*30*6);
		
	// Asking and explaining why you want to join her
	output("<i>“Heyy, can I join you?”</i> you ask hopefully.\n<i>“Haha, of course ya can”</i> she cackles in response <i>“Why all of a sudden though?”</i>.\n");
	if (reason == JOINED_COCK) output("<i>“Well, watching you lying in here, getting fucked day in day out by random peeps. It looks real hot!”</i> you giggle. <i>“I want a piece of the pie!”</i>\n"); 
	else output("<i>“Well, watching you lying in here, getting knocked up day in day out by random peeps and then having loads of babies. I want that!”</i> you shout.\n"); 
	
	// Her agreeing
	output("<i>“I know what ya mean, it's pretty good</i> she giggles. <i>“Alright [pc.name]. Sit down over 'der and I'll let whoever comes round know they're to bring some friends.”</i>\n");
	// Timeskip, getting fucked loving it
	output("\n\n<b>6 MONTHS LATER</b>\n\n");
	output("Your body clock jolts you awake. Your guests will be here any minute. You roll to the side, atop your cum-stained bed frame to check that your fuck-buddy's awake - she can't miss this.\n<i>“Hey hon', ready to go again? They'll be here soon”</i>.\nShe giggles in response. <i>“Of course [pc.name]. Like, even before we were this famous, I'd never miss a good fuckin'!”</i>.\n");
	output("You snort. <i>“As if I'd ever let you anyways”</i>.\n\nSuddenly you hear the clanging of feet on metal and a beeping from the computer. Silhouettes of different shapes and sizes fill the door and bustle into the hull. Your guests have arrived. Groups of Raskvel, gabilani, lapinaras, various colored goo-people, all saunter in to have some fun with you and your pal. You're in heaven. There's definitely some of your favorites amongst them.\n");
	output("<i>“Don't be shy guys”</i> you giggle, separating your [pc.thighs], giving them all a view of your [pc.vaginas]. <i>“I'll make sure you each get to cum in me”.</i>\n\n");
	
	addButton(0,"Continue",joinBroodmother_2,reason);
}

public function joinBroodmother_2(reason:int):void
{
	clearMenu();
	
	showBust("RASKVEL_GANG_NUDE","JOIN_BROODMOTHER_GANG");
	showName("RASKVEL\nGANG");
	author("HNB");
	
	const JOINED_BABIES:int = 0;
	const JOINED_COCK:int = 1;
	
	output("The usual gang of Raskval approach you first. <i>“Hey slut”</i> the biggest one grunts with a smirk. <i>“I know we were here a couple of hours ago but the boys and I are feeling rather pent up again”</i>.\n<i>Lucky me”</i> you giggle. <i>“Why don't you guys go first then. Everyone else, keep yourselves nice and ready and I'll be ready for your cummies real soon!”</i> ");
	
	// Work gangbang bit in here
	// Warm them up
	output("The various aliens form an organised queue in front of the assignment screen, patient because they know what they'll get next will be good. <i>“I hope I get her”</i> you hear a burly looking male say. <i>“That bitch will let you do anything" + (reason == JOINED_BABIES ? " as long as you cum in her":"") + "”</i>. He's not wrong. A small group walk in the direction of the other broodmother whilst the gang of Raskvel make their way towards you.\n");
	output("<i>“Why don't you boys come over here and I'll.. warm you up”</i> you say, licking your [pc.lips]. <i>“Sounds good”</i> they cackle in unison as they line up in front of you. Starting from the left, you warm them up. First you run your hand along their smooth mounds, stroking them sensually until their cocks emerge from their slits. You then unfurl your [pc.tongue] from your mouth and rock yourself forward into range of their burgeoning cocks. You grasp at each of their violet, expanding cocks in turn and slather your tongue along them, taking in each of their individual tastes and differences in shape, as they expand in reaction to your wet strokes. You can't wait to feel them all inside you.\n");
	
	output("As you finish warming up the third one , the largest of the three moves to your ");
	if (pc.hasVagina())
	{
		output(pc.vaginaDescript(pc.biggestVaginaIndex()) + "." + " With it more than well equipped to accommodate him, his forearm sized raskvel cock thrusts deep into your cavernous fuck-hole, his tip slamming against your cervix.");
	}
	else
	{
		output("behind. He jerks your [pc.buttcheeks] apart and thrusts his forearm sized raskvel cock deep into your [pc.asshole].");
	}
	
	output("\nThe second raskvel stays at your front, grabbing ");
	output((pc.hasHair() ? "hold of your [pc.hair]" : "hold of your head") + ", shifting your head so your lips push against his meat. <i>“Ooh aren't you feisty today”</i> you giggle into his tip, kissing it as you do. You slides your lips over his tip, running your tongue around its opening before sliding his hard, thick, lavender cock deep into your throat, salivating all over it, as you're well known for. ");
	
	//Butthole's free, vag in use
	if (pc.hasVagina())
	{
		output("The third, now ready to go, grabs hold of a side of your [pc.belly] and hoists himself up on top of you. His feet shuffle about on top of you before he kneels on your lower back. Getting the idea, you angle your [pc.ass] slightly and the raskvel jerks apart your [pc.buttcheeks] before thrusting his dick deep into your [pc.asshole], slamming against your cervix as he hits depth.");		
	}
	else //No hole
	{
		output("With nowhere to go, you guess the third has no way to cum inside you. But being covered in cum like the slut you are is almost as good! You rub your hands along your motherly " + (pc.isTreated() ? "teats" : "tits") + "slathering your hands in your [pc.milk] before grabbing hold of his hard, pulsating cock. You run your hand along his manhood, coating it [pc.milkColor].");
	}
	
	output("\n\nYou breath fiercely through your nose as things get more intense - the bulging cocks pound you with increasing speed, slamming quickly against the bottoms of each orifice" + (pc.hasVagina() ? "." : " and you jerk the ballooning cock in your hand more vigorously.\n"));
	if (pc.hasVagina())
	{
		output("<i>“Mmmm, fuck yeah, your pussy's so juicy”</i> the big raskvel moans, his bulging Raskvel cum-pouch slapping against your belly as his rock-hard fuckrod pummels your dripping fuckhole. <i>“Oh-o-ohh stars, harder, fill me up with your cum”</i> you mumble through your cock filled mouth.");
	}
	else
	{
		output("<i>“Mmmm, fuck yeah, your fat ass feels so good”</i> the big raskvel moans, his bulging Raskvel cum-pouch slapping against your [pc.buttcheeks] as his rock-hard fuckrod pummels your slickened fuckhole. <i>“Oh-o-ohh stars, harder, fill me up with your cum”</i> you mumble through your cock filled mouth.");
	}
	
	output("\nTheir movements get faster and their cocks bigger. The pleasure you feel from their cocks being buried in your holes is overwhelming.\n");
	
	if (pc.hasCock())
	{
		output("You're loving every minute of it - your [pc.cock] twitching with each thrust.");	
	}
	else
	{
		output("You're loving every minute of it - girlcum pouring from your [pc.vaginas] down your [pc.belly] from all they're giving you.");	
	}
	
	output("\nBut seemingly you're pretty overwhelming too. ");
	
	if (pc.hasVagina())
	{
		output("You feel the boiling dicks in your fuck-holes stiffen and throb against each other through the thin wall between your backdoor and asshole. <i>“Mmm come on boys, fill me up!”</i> you cackle as with each pulsation cum flys from their cocks, shooting against your insides, flooding deeper and deeper into you.");
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
		var cummed:Number = pc.cumQ();
		
		if (pc.hasCocks() > 1)
		{
			output(" As they release their cum, your [pc.cocks] throb uncontrollably and with a moan, ");
			if (cummed < 5)
			{
				output("your cocks twitch and shake, beads of cum dripping out the ends onto the floor below.");
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
				output("your cocks erupt, [pc.cum] pouring out in waves of [pc.cumColor], splashing against the floor below, the drains filling with it until the intensity lowers and with one last twitch, your flow stops.");
			}
			else
			{
				output("your cocks erupt, [pc.cum] pouring out like a [pc.cumColor] tsunami, splashing against the floor below until there's no floor left and your cum is just splashing against more of your cum, the drains unable to contain the contents of your [pc.balls].");
			}
		}
		else
		{
			output(" As they release their cum, your [pc.cock] throbs uncontrollably and with a moan,");
			if (cummed < 5)
			{
				output("your cock twitches and shakes, beads of cum dripping out the end onto the floor below.");
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
				output("your cock erupts, [pc.cum] pouring out in waves of [pc.cumColor], splashing against the floor below, the drains filling with it until the intensity lowers and with one last twitch, your flow stops.");
			}
			else
			{
				output("your cock erupts, [pc.cum] pouring out like a [pc.cumColor] tsunami, splashing against the floor below until there's no floor left and your cum is just splashing against more of your cum, the drains unable to contain the contents of your [pc.balls].");
			}
		}
	}
	output("\n\n You swallow the last of the load in your mouth, licking your lips as you do so. <i>“Mmm that was great boys. I hope you come back soon”</i>. <i>“Mmm, we will”</i> the Raskval respond, cocks wiggling and dripping cum as they scurry back between the crowd. ");	
	output("<i>“Alright, which of you lucky fellas wants a go on me next?”</i> you slur into the crowd, cum still dripping from you.\n\n");
	output("A voice shouts from the crowd. <i>“Well, [pc.name], I’d like to say I’m surprised to see you here like this but I'm really not”</i>. Dane, the Ausur bodyguard shoves his way through the protesting crowd, your rival in tow, a smirk across [rival.hisHer] face.");	

	pc.orgasm();
	pc.orgasm();	
	addButton(0,"Continue",joinBroodmother_3,reason);
}

public function joinBroodmother_3(reason:int):void
{
	kGAMECLASS.showRival();
	clearMenu();
	author("HNB");
	const JOINED_BABIES:int = 0;
	const JOINED_COCK:int = 1;
	
	output(kGAMECLASS.chars["RIVAL"].mf("<i>“Omigod heyyy! Didn't know you felt that way. I'm totes up for it if you are!”</i>", "<i>“Oh hey babe! Didn't know ya had a dick!”</i>") + "\n");
	output(kGAMECLASS.chars["RIVAL"].mf("He","She") + " cackles. <i>“Oh no, don't get the wrong idea. I'd never bang a hussy like you. I just came here because I heard someone, that sounded like you, was out here being an absolute cumdump and I wanted to see if it was you.”</i>\n");
	if (reason == JOINED_BABIES)
	{
		output("<i>“Oh. So you're not here to knock me up?”</i> you cry, pouting.\n");
	}
	else
	{
		output("<i>“Oh. So you're not here to fuuuuck?”</i> you cry, pouting.\n");
	}
	output(kGAMECLASS.chars["RIVAL"].mf("<i>“Ahaha! Is that all you think about? No of course I'm not. ", "<i>“What?! Ahahaa, no, I don't even have a dick. ") + "Besides, I've got the next probe to go after before you do!”</i>\n");
	output("<i>“Huh? Who cares about those things”</i> you murmur, put off that your cousin's come here to waste your time that could be spent fucking more members of the growing crowd. <i>“Next!”</i> you shout into the crowd.\n");
	output("<i>“Ahahah, well then, looks like I've got no competition now. Alright, cya later slut”</i> " + kGAMECLASS.chars["RIVAL"].mf("Jack","Jill") + " cackles, walking back amongst the crowd, guard-dog in tow.\n\n");
	
	addButton(0,"Continue",joinBroodmother_4,reason);
}

public function joinBroodmother_4(reason:int):void
{
	const JOINED_BABIES:int = 0;
	const JOINED_COCK:int = 1;
	clearMenu();
	author("HNB");
	kGAMECLASS.currentLocation = "GAME OVER";
	kGAMECLASS.generateMap();
	kGAMECLASS.showLocationName();
	
	output("<i>“Stars, what was " + kGAMECLASS.chars["RIVAL"].mf("'is", "'er") +" problem”</i> your fellow broodmother shouts from across the room.\n");
	output("<i>“Oh, who cares. Have you seen the " + (reason == JOINED_BABIES ? "balls on that guy? I bet he could give me sextuplets." : "cock on that guy? Fuck, I want some of that!") + "”</i>\n");
	kGAMECLASS.badEnd("GAME OVER");	
}

//SEX----------------------------------------------------------------------------

public function broodMotherSexOpts():void
{	
	clearMenu();
	clearOutput();
	author("HNB");
	
	output("<i>“I was thinking, how about some fun?”</i> you say to her seductively.\n");
	
	if (lvl < 2)
	{
		output("<i>“Oh, okay!”</i> she shouts excitedly. <i>“What like?”</i>");
	}
	else if (lvl < 5)
	{
		output("<i>“Mmm, sounds great to me, what were you thinking of?”</i>");
	}
	else 
	{
		output("<i>“Mmmm yeah! I want ya' to fuck me too! What were you thinking of?”</i>");
	}
	
	var lvl:int = getBroodmotherLevel();
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

	if (pc.hasCock() && pc.cockThatFits(220 + (lvl * 120)) >= 0)
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
		addButton(buttonNum,"Face Ride",faceRideTheRaskPreg_Return);
		buttonNum++;
	}
	else
	{
		addDisabledButton(buttonNum,"Face Ride","Face Ride","You need a vagina to rub on her face for this.");
		buttonNum++;
	}
	
	if (isBroodmotherTreated() && flags["PREG_RASK_RETURNED_LASTMILKED"] <= (int(GetGameTimestamp() / 1440) - 20) && flags["PREG_RASK_RETURNED_CUMSTORAGE_VOLUMECAP"] != 0)
	{
		addButton(buttonNum, "Milk her", milkBroodmotherReturn);
		buttonNum++;
	}
	else
	{
		if (flags["PREG_RASK_RETURNED_CUMSTORAGE_VOLUMECAP"] == 0)
		{
			addDisabledButton(buttonNum, "Milk her", "Milk her", "There aren't any buckets left!");
			buttonNum++;
		}
		else if (isBroodmotherTreated() && (flags["PREG_RASK_RETURNED_LASTMILKED"] > (int(GetGameTimestamp() / 1440) - 20)))
		{
			addDisabledButton(buttonNum, "Milk her", "Milk her", "You've done that too recently! She'll be dry as a bone, give her some time to recharge.");
			buttonNum++;
		}
	}
	
	if (isBroodmotherFuta())
	{
		if (pc.hasVagina())
		{
			if (pc.biggestVaginalCapacity() >= getBroodmotherFutaCockSize())
			{
				addButton(buttonNum, "Pussy-ride her", rideBroodmotherReturnFuta, "vagina");
				buttonNum++;
			}
			else
			{
				addDisabledButton(buttonNum, "Pussy-ride her", "Ride her cock", "You don't have a vagina she can fit in.");
				buttonNum++;
			}
		}

		if (pc.analCapacity() >= getBroodmotherFutaCockSize())
		{
			addButton(buttonNum, "Ass-ride her", rideBroodmotherReturnFuta, "anus");
			buttonNum++;
		}
		else
		{
			addDisabledButton(buttonNum, "Ass-ride her", "Ride her cock", "You don't have a butt she can fit in.");
			buttonNum++;
		}
	}
	
	addButton(14,"Leave",approachBroodmother);
}

//inWhat is vagina or anus
public function rideBroodmotherReturnFuta(inWhat:String):void
{
	clearOutput();
	clearMenu();
	author("HNB");
	showPregRaskReturn();
	var lvl:int = getBroodmotherLevel();
	
	// Popping the question
	if (pc.isSubby())
	{
		output("<i>“I was thinking mistress, couldn't that " + (getBroodmotherFutaCockSize() >= 450 ? "big cock" : "cock") + " of yours do with some service?”</i> you ask, " + (inWhat == "vagina" ? ((pc.isCrotchExposed() ? "dropping your [pc.crotchCovers], " : "") + "presenting her with your " + pc.vaginaDescript(pc.biggestVaginaIndex())) : (" bending over" + (pc.isCrotchExposed() ? " pulling down your [pc.assCovers]" : "") + " and presenting her with your [pc.asshole]")));	
	}
	else if (pc.isBimbo())
	{
		output("<i>“I was thinking, wouldn't it be totally awesome if that " + (getBroodmotherFutaCockSize() >= 450 ? "big cock" : "cock") + " of yours saw some sexy sex too!?”</i> you ask, " + (inWhat == "vagina" ? ((pc.isCrotchExposed() ? "pulling down your [pc.crotchCovers], " : "") + "presenting her with your " + pc.vaginaDescript(pc.biggestVaginaIndex())) : (" bending over" + (pc.isCrotchExposed() ? " tugging down your [pc.assCovers]" : "") + " and presenting her with your [pc.asshole]")));
	}
	else if (pc.isBro())
	{
		output("<i>“Uhh I was just thinking, whilst your pussy is totally cool and all, shouldn't your " + (getBroodmotherFutaCockSize() >= 450 ? "big dick" : "dick") + " see some action too?”</i> you ask, " + (inWhat == "vagina" ? ((pc.isCrotchExposed() ? "pulling down your [pc.crotchCovers] and" : "") + "grabbing your " + pc.vaginaDescript(pc.biggestVaginaIndex())) : (" bending over" + (pc.isCrotchExposed() ? " tugging down your [pc.assCovers]" : "") + " and presenting her with your [pc.asshole], one hand on your butt")));
	}
	else if (pc.isMischievous())
	{
		output("<i>“Well, obviously your " + (getBroodmotherFutaCockSize() >= 450 ? "big juicy cock" : "juicy cock") + " needs some action too”</i> you state, " + (inWhat == "vagina" ? ((pc.isCrotchExposed() ? "pulling down your [pc.crotchCovers]," : "") + " drawing her attention to your " + pc.vaginaDescript(pc.biggestVaginaIndex())) : (" bending over" + (pc.isCrotchExposed() ? " tugging down your [pc.assCovers]" : "") + " and slapping your ass, showing off your [pc.asshole]")));
	}
	else
	{
		output("<i>“Well, I was just thinking, it's about time that " + (getBroodmotherFutaCockSize() >= 450 ? "big juicy cock" : "juicy cock") + " of yours got some attention”</i> you state, " + (inWhat == "vagina" ? ((pc.isCrotchExposed() ? "pulling down your [pc.crotchCovers]," : "") + " drawing her attention to your " + pc.vaginaDescript(pc.biggestVaginaIndex())) : (" bending over" + (pc.isCrotchExposed() ? " tugging down your [pc.assCovers]" : "") + " and presenting your [pc.asshole]")));
	}	
	output(".\nIn reaction the broodmothers eyes widen and she licks her lips, her cock extending further from its slit and hardening with a jolt. ");
	
	
	// Her agreeing
	if (lvl >= 3)
	{
		output("She rolls off of her supportive structure and onto the cum-coated floor, tail wagging and turns to face you. With great effort she rolls herself backwards, swinging her ");
		output("baby-laiden belly up before it bounces back to the ground. She wraps her arms around it as best she can and holds it slightly off the floor, her cock springing out from underneath as it's given room to breath, so she is lying at a slight incline with her cock free to see and use. ");
	}
	else
	{
		output("She slowly sits down on the ground, ");
		if (lvl > 1)
		{
			output("her belly jiggling as she does ");
		}
		output("and grabs her cock, wiggling it infront of you. ");
	}
	
	output("<i>“Come here then, ");
	
	if (lvl < 3)
	{
		if (inWhat == "vagina")
		{
			output("hop on my" + getWhatWearing_DressedAs() + "dick so I can fuck your puss!");
		}
		else //anus
		{
			output("hop on my" + getWhatWearing_DressedAs() + "dick so I can fuck your butt!");
		}
	}
	else if (lvl < 5)
	{
		if (inWhat == "vagina")
		{
			output("hop on ma big meaty" + getWhatWearing_DressedAs() + "cock so I can pound your [pc.vagina " + pc.biggestVaginaIndex() + "] until you're full of my cum");
		}
		else //anus
		{
			output("hop on ma big meaty" + getWhatWearing_DressedAs() + "cock so I can pound your [pc.asshole] full of my cum");
		}
	}
	else 
	{
		if (inWhat == "vagina")
		{
			output("fuck my slutty" + getWhatWearing_DressedAs() + "cock. I wanna shove it into your [pc.vagina " + pc.biggestVaginaIndex() + "] and pound it until cum's pourin' from it");
		}
		else //anus
		{
			output("fuck my slutty" + getWhatWearing_DressedAs() + "cock. I wanna shove it into your [pc.asshole] and pound it until cum's pourin' out of it");
		}
	}
	output("”</i>.");
	
	// Backing up
	output("\nYou turn around and back up towards the ");
	if (lvl >= 2)
	{
		output("big ");
	}
	output("mama whilst looking over your shoulder. You step back towards her whilst wiggling your [pc.hips] as she sits and stares, mesmerized, with her dick in her hands. <i>“Mmmm come to mama”</i>.\nYou saunter backwords towards her,");
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
	
	
	if (lvl < 3)
	{
		output("fingering her cock-hungry" + (isBroodmotherTreated() ? ", sopping " : " ") + "fuckhole" + (getWhatWearing_CrotchPosition() != null ? (" " + getWhatWearing_CrotchPosition()) : "") + ". ");
	}
	else if (lvl < 5)
	{
		output("fingering her loose" + (isBroodmotherTreated() ? ", dripping " : " ") + "fuckhole" + (getWhatWearing_CrotchPosition() != null ? (" " + getWhatWearing_CrotchPosition()) : "") + ". ");
	}
	else 
	{
		output("fingering her gaping" + (isBroodmotherTreated() ? ", gushing " : " ") + "fuckhole" + (getWhatWearing_CrotchPosition() != null ? (" " + getWhatWearing_CrotchPosition()) : "") + ". ");
	}
	
	output("The slicking sounds of her self-titiliation stop and scaly hands slap against your [pc.hips]. ");
	if (inWhat == "vagina")
	{
		output("<i>“I'm gonna fuck that pussy of yours and fill you with " + (pc.isPregnant() ? "cum" : "babies") + "”</i> she groans into your ear. ");
	}
	else
	{
		output("<i>“I'm gonna fuck that butthole of yours and fill you with cum”</i> she groans into your ear. ");
	}
	output("\nYou're pulled backwards until " + (lvl >= 3 ? "you bounce against her big soft belly" : "you're flat against her"));
	output(", the " + (getBroodmotherFutaCockSize() >= 450 ? "thick banana-like cock" : "curved raskvel cock") + " level with your entrance. You put your arms behind you and her long fingers clamp around your wrists. You rock backwards");
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
		output("\n<i>“MOOOOoo!”</i> she cries. You feel her cock pulse and flare  and not a second later hot creaminess is firing deep inside you. Spurt after spurt fires into you, splashing against your " + (inWhat == 'vagina' ? "cervix" : "glands") + ". After several long, pleasureable seconds, you slide yourself off of her limpening cock with a squelch, cum drooling from your " + (inWhat == 'vagina' ? "slit" : "ass") + " as you do. ");
	}
	else
	{
		output("\n<i>“A-aah, I'm cumming!”</i> she cries. You feel her cock pulse and flare and not a second later hot creaminess is firing deep inside you. Spurt after spurt fires into you, splashing against your " + (inWhat == 'vagina' ? "cervix" : "glands") + ". After several long, pleasureable seconds, you slide yourself off of her limpening cock with a squelch, cum dripping from your " + (inWhat == 'vagina' ? "slit" : "ass") + " as you do. ");
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
		pc.loadInCunt(chars["RASKVEL_BROODMOTHER"],pc.biggestVaginaIndex());
	}
	else
	{
		pc.loadInAss(chars["RASKVEL_BROODMOTHER"]);
	}
	addLevelPoints(2);
	pc.orgasm(); 
	flags["PREG_RASK_RETURNED_FRIENDLINESS"] += 1;
	processTime(30);
	addButton(0,"Next",denInside);	
}

public function getBroodmotherFutaCockSize():int 
{
	var lvl:int = getBroodmotherLevel();
	
	switch (lvl)
	{
		case 0:
			return 250;
			break;
		case 1:
			return 300;
			break;
		case 2:
			return 400;
			break;
		case 3:
			return 500;
			break;
		case 4:
			return 600;
			break;
		case 5:
			return 800;
			break;
		case 6:
			return 800;
			break;
		default: 
			return 600;
			break;
	}
}

public function milkBroodmotherReturn():void
{
	clearOutput();
	showPregRaskReturn();
	clearMenu();
	author("HNB");
	var lvl:int = getBroodmotherLevel();
	var loot:Array = new Array();
	var buckets:RaskvelBroodmotherMilkBucket = new RaskvelBroodmotherMilkBucket();
	var bottles:RaskvelBroodmotherMilkBottle = new RaskvelBroodmotherMilkBottle();
	buckets.quantity = 0;
	bottles.quantity = 0;
	
	output("<i>“You still got those buckets for filling with cum?”</i> you ask the broodmother. ");
	var cap:int = getBroodmotherCumCap()/1000;
	var bucketsUsed:int = Math.ceil(getBroodmotherCumStoredVolume() / 1000);
	
	if (lvl < 3)
	{
		if (cap == 1)
		{
			if (bucketsUsed == cap)
			{
				output("<i>“Just the one, over 'der by the console. It's a bit full though. Why?”</i>\n");
			}
			else
			{
				output("<i>“Just the one, over 'der by the console. Why?”</i>\n");
			}
		}
		else
		{
			if (bucketsUsed == cap)
			{
				output("<i>“Yeah, they're over 'der by the console. They're a bit full though. Why?”</i>\n");
			}
			else
			{
				output("<i>“Yeah, they're over 'der by the console. Why?”</i>\n");
			}
		}
	}
	else 
	{
		if (cap == 1)
		{
			if (bucketsUsed == cap)
			{
				output("<i>“Yeah. One over 'der by the console, it's nice and full! Why, what're you thinking?”</i>\n");
			}
			else
			{
				output("<i>“Yeah. One over 'der by the console, waiting to be filled up! Why, what're you thinking?”</i>\n");
			}
		}
		else
		{
			if (bucketsUsed == cap)
			{
				output("<i>“Yeah. They're over 'der by the console, it's nice and full! Why, what're you thinking?”</i>\n");
			}
			else
			{
				output("<i>“Yeah. They're over 'der by the console, waiting to be filled up! Why, what're you thinking?”</i>\n");
			}
		}
	}
	
	if (cap == 1)
	{
		if (bucketsUsed == cap)
		{
			output("You walk over to the console, pick up the sloshing bucket and carry it over to her before, to her surprise and anguish, pour the goopy contents into the drains below. <i>“What're you doing!”</i> she shouts before you press a finger over her lips, shushing her until she's calm.\n");
		}
		else 
		{
			output("You walk over the console and pick up an empty bucket, bringing it back over to her.\n");
		}
	}
	else
	{
		if (bucketsUsed == cap)
		{
			output("You walk over to the console, pick up several sloshing buckets in your hands and under your arms and carry them back over to her. Then to her surprise and anguish, you pour the goopy contents of each one into the drains below. <i>“What're you doing!”</i> she shouts before you press a finger over her lips, shushing her until she's calm.\n");
		}
		else 
		{
			output("You walk over the console and pick up a stack of empty buckets, bringing them back over to her.\n");
		}
	}
	
	if (isBroodmotherFuta())
	{
		if (lvl <= 2)
		{
			output("<i>“Ooh is it for this?”</i> she says, grabbing her cock and shaking it side to side.\n");
		}
		else if (lvl <= 3)
		{
			output("<i>“Ooh is it for this?”</i> she says, raising her hands above her head and wiggling her hips, shaking her large, blue cock in an erotic dance.\n");
		}
		else if (lvl == 4)
		{
			output("<i>“Ooh, for this?”</i> she says, slapping her thick blue rod with her tail.\n");
		}
		else 
		{
			output("<i>“Mmm, are you going to milk my fat blue" + getWhatWearing_DressedAs() + "cock?”</i> she moans, her cock visibly hardening in anticipation.\n");
		}
		
		if (pc.isSubby())
		{
			output("<i>“Not today mistress”</i> you smirk.\n");
		}
		else if (pc.isBimbo())
		{
			output("<i>“Haha, not that”</i> you giggle.\n");
		}
		else if (pc.isBro())
		{
			output("<i>“Nope”</i> you grunt.\n");
		}
		else if (pc.isMischievous())
		{
			output("<i>“Higher”</i>.\n");
		}
		else
		{
			output("<i>“Not that”</i>.\n");
		}
	}
	
	output("<i>“Well, what" + (cap == 1 ? "'s that" : "'re they") + " for 'den?”</i>\n");
	
	if (lvl <= 2)
	{
		if (getWhatWearing() == "farmers overall"){
			output("<i>“Well Mrs.Farmgirl. What would you use a bucket for?”</i> you ask.\nHer eyes widen as she cottons on. <i>“Ah that'd be great!”</i> she responds excitedly. <i>“Go on then!”</i>\n");
		}
		else if (pc.isSubby())
		{
			output("<i>“They're for your teats, if you'll let me, madam”</i> you beg.\n<i>“Ah that'd be great!”</i> she responds excitedly. <i>“Go ahead!”</i>\n");
		}
		else if (pc.isBimbo())
		{
			output("<i>“They're for these, silly”</i> you say, tweaking her long pink teats between your fingers.\n<i>“Ah! That'd be lovely, go on 'den!”</i> she responds excitedly.\n");
		}
		else if (pc.isBro())
		{
			output("<i>“They're for these bad boys”</i> you say, slapping her udder-tipped tits.\n<i>“Ah, that'd feel great! Go on 'den!”</i> she responds excitedly.\n");
		}
		else if (pc.isMischievous())
		{
			output("<i>“They're for those, though I'm not sure if they're full enough”</i> you say, pointing to her udder-topped tits.\n<i>“Shut up! That'd be great, they feel pretty full!”</i> she chortles in protest.\n");
		}
		else
		{
			output("<i>“They're for these”</i> you reply, grabbing her breasts in your hands.\n<i>“Ooh that'd be great!”</i> she responds excitedly. <i>“Go on 'den!”</i>\n");
		}
	}
	else if (lvl <= 4)
	{
		if (getWhatWearing() == "farmers overall"){
			output("<i>“Well Mrs.Farmgirl. What would you use a bucket for?”</i> you ask.\nHer eyes widen as she cottons on. <i>“Ahh, yes please!”</i> she responds excitedly. <i>“Milk me like a cow!”</i>\n");
		}
		else if (pc.isSubby())
		{
			output("<i>“They're for your milk-filled tits, if you'll let me, madam”</i> you beg.\n<i>“Ahhh they do need relieving, they're 'bout to burst. Very well " + pc.mf("slave","slut") + ", go ahead!”</i> she responds, small beads of milk trickling down her breasts in anticipation.\n");
		}
		else if (pc.isBimbo())
		{
			output("<i>“They're for these, silly”</i> you say, grabbing her udder-topped tits in your hands.\n<i>“Ahhh, well these do need relieving, they're 'bout to burst”</i> she responds, small beads of milk running over your hand in anticipation.\n");
		}
		else if (pc.isBro())
		{
			output("<i>“They're for these bad boys”</i> you say, slapping the side of one of her udder-topped tits.\n<i>“Ahh, that'd feel almost as good as your cock, go on then”</i> she responds, rolling her teats between her fingers as she does.\n");
		}
		else if (pc.isMischievous())
		{
			output("<i>“They're for those, though I'm not sure if they're full enough”</i> you say, pointing to her udder-topped tits.\n<i>“Shut up, they're so full they're about to burst!”</i> she screeches. <i>“Well, go on then, get to it!”</i>\n");
		}
		else
		{
			output("<i>“They're for your swollen udders”</i> you reply.\n<i>“Ooh that'd be so good”</i> she moans, wiggling her torso as she does. <i>“Get to it”</i>.\n");
		}
	}
	else if (lvl <= 6)
	{
		if (getWhatWearing() == "farmers overall"){
			output("<i>“Well Mrs.Farmgirl. What would you use a bucket for?”</i> you ask.\n<i>“Ah, that'd be so good, they're about to burst!”</i> she moans, streams of milk preemptively trickling from her" + (lvl >= 6 ? " pierced " : " ") + "teats. <i>“Go on 'den milk my slutty cow tits!”</i>\n");
		}
		else if (pc.isSubby())
		{
			output("<i>“They're for your milkers ma'm. If you'll allow me, I'd love to relieve you”</i> you beg.\n<i>“Ah, that'd be so good, they're about to burst!”</i> she moans, streams of milk preemptively trickling from her" + (lvl >= 6 ? " pierced " : " ") + "teats. <i>“Go on 'den " + pc.mf("slave","slut") + ", milk me dry!”</i>\n");
		}
		else if (pc.isBimbo())
		{
			output("<i>“They're for these, silly”</i> you say, grabbing her motherly chest-pillows in your hands.\n<i>“Ahhh, that'd be so fucking good, they're 'bout to explode!”</i> she gasps, streams of milk already running over your hands in anticipation from each" + (lvl >= 6 ? " pierced, " : " ") + "barrel-length nipple.\n");
		}
		else if (pc.isBro())
		{
			output("<i>“They're for these bad boys”</i> you say, clapping your hands around her motherly-chest pillows, which wobble and shoot a stream of milk over your shoulder on impact.\n<i>“Ahhh, that'd be so fucking good, they're 'bout to explode!”</i> she responds as you watch the streams from your preemptive strike run down her plate-sized areolae.\n");
		}
		else if (pc.isMischievous())
		{
			output("<i>“They're for those, though I'm not sure if they're full enough”</i> you say, pointing to her udder-topped tits.\n<i>“They're so fucking full, how about you give them a tug and find out”</i> she says teasingly.\n");
		}
		else
		{
			output("<i>“They're for those giant udders of yours”</i> you reply.\n<i>“Ooh that'd be so fucking good”</i> she moans. <i>“Come on then, milk me dry!”</i>.\n");
		}
	}
	
	//Grabbing and massaging breasts, small beads
	if (cap == 1)
	{
		output("\nYou grab the bucket and clank it down on the floor infront of her. Standing up, you reach forward and sink your fingers into her ");
	}
	else 
	{
		output("\nYou take one bucket from the top of the stack and clank it down on the floor infront of her. Standing up, you reach forward and sink your fingers into her ");
	}
	switch (lvl)
	{			
		case 0:
			output("perky breasts.");
			break;
		case 1:
			output("round D-Cup titties.");
			break;
		case 2:
			output("torpedo-tits.");
			break;
		case 3:
			output("basketball sized jugs.");
			break;
		case 4:
			output("giant, motherly breasts.");
			break;
		case 5:
			output("giant chest-pillows.");
			break;
		case 6:
			output("back-breaking milkers.");
			break;
	}
	output(" <i>“Mooo”</i> she moans uncontrollably, as you massage her breasts, rolling her thick pink areolae under your fingertips like putty. Milk trickles from the ends of her" + (lvl >= 6 ? " pierced, " : " ") + "cannon-like nipples in reaction and you bend in, lapping up her tasty cow milk. <i>“How's this?”</i> you say teasingly. ");
	if (lvl <= 2)
	{
		output("<i>“Ah! It feels so tingly”</i> she cries. <i>“But so good!”</i>");
	}
	else if (lvl <= 4)
	{
		output("<i>“Ah! So good, keep going!”</i> she gasps, tongue dangling from her mouth and sweat forming on her forehead.");
	}
	else if (lvl <= 6)
	{
		output("<i>“Ah, that's it! Milk me like a big cow!”</i> she gasps, tongue dangling from her mouth and sweat dripping from her brow.");
	}
	
	output("\nWith her warmed up to the milking, you think it's time to turn it up a notch.\n");
	
	if (pc.hasItemByClass(MagicMilker))
	{
		output("You kneel down and swing your backpack onto the ground. <b>You pull out your JoyCo Magic-Milker 7</b> the cups dangling limply. You hold the glittering orb out so that it'll recoginize its user and push the button.\n");
		output("The milkers hatch whirrs open and four additional cups emerge to target the udders along the broodmothers ");
		if (getBroodmotherLevel() > 1)
		{
			switch(lvl)
			{
				case 1: 
					output("swollen");
					break;
				case 2: 
					output("plump");
					break;
				case 3: 
					output("buxom");
					break;
				case 4: 
					output("giant, baby-making");
					break;
				case 5: 
					output("ginormous, pregnancy-stretched");
					break;
				case 6: 
					output("gargantuan, writing-covered");
					break;	
			}
		}
		output("belly. ");		
		
		//After belly-descript
		output("You bring the cups towards each of her udders in turn. They automatically expand to fit the mama's gun-barrel like nipples as they get near before latching themselves onto her pink milk mounds with a pop, the broodmother moaning and mooing as they do.\n");
		
		output("<i>“Ready?”</i> you ask.\n");
		if (lvl <= 2)
		{
			output("<i>“Oh yeah!”</i>\n");
		}
		else if (lvl <= 4)
		{
			output("<i>“Always”</i> she chortles.\n");
		}
		else if (lvl <= 6)
		{
			output("<i>“Fuck yeah”</i>\n");
		}
		
		output("Sitting back, you watch as the milker does its thing.");
		if (flags["PREGRASK_RETURNED_LASTMILKED"] == 0)
		{
			output("A look of surprise washes over the milky raskvels face as out of the centre of each cup, grows long, slim brown phalli with pinpoint holes at the ends and press against the openings of her nipples. Her look quickly changes and she moos loudly as the protrustions thrust forward, spearing her fuckable nipples. ");
		}
		else 
		{
			output("She gasps loudly as the long, dick-like protrusions grow from the machine once more and press against her pliable nipples. There's a clunk and a loud mooing as they thrust forward, penetrating her pink nipple-holes. ");
		}
		
		output("With the cups now forming vacuums, they hiss warmly and inside the transparent plastic her teats moisten and bulge. You hear whirring from the machine as the base of the protrusions begin to judder, vibrating deep inside the broodmothers pink mounds, causing her to moan uncontrollably, milk filling the gaps around the brown rods like lube. ");
		output("On the outside, the cups begin tugging at her flesh as the machine, having sufficiently teased her starts vacuuming inside and out. Her pink udders redden and bulge as they're pulled towards the cups, milk bursting from her teats. She moos, sweating as the pressure amps up and the cups expand, pulling her udders to new sizes as they darken and bulge further, the protrusions vibrating and sucking inside her widened nipples. The broodmothers eyes have rolled back in her head as she stands vacantly infront of you, tongue dangling, having given in completely to the milking.\n");
		output("At this you grab " + ((cap == 1) ? "the" : "a") + " bucket and open a hatch on the milker, accessing the output hose and place it into the bucket, as you expect her boobgasm real soon. You were right.\n");
		switch (lvl)
		{
			case 1: 
				output("She gasps infront of you and with a moo, squirts of milk fly through the tube, like cum from a dick. Milk squirts into the bucket below, foaming, filling the bottom of the bucket with her milk.");
				bottles.quantity = 2;
				output("\nYou thank her bottling her donation and putting two bottles into your backpack.");
				break;
			case 2:
				output("She shudders and gasps infront of you and with a moo, her swollen teats burst. The nozzles whirr and bursts of milk fly through the tube, like water from a tap. She continues to moan as her pointed nipples continue to release their load, foaming milk pouring into the bucket below. The bursts shorten and the flow stops, leaving the bottom half of the bucket full of her yummy milk.");
				bottles.quantity = 3;
				output("\nYou thank her bottling her bounty and pushing three bottles into your backpack.");
				break;
			case 3: 
				output("She shudders and moans infront of you, grabbing her bountiful breasts when with a loud <i>“MOOOO!”</i> her large reddened teats burst! The nozzles whirr and cut out as they're unable to catch her flow before it leaves her nipples. The transparent cups turn half white as milk floods the cups and is sucked down into the tube as fast as the machine can. Her foaming mother-milk pours into the tube, sloshing into the bucket below. She continues to moan as her pointed nipples continue to release their bounty. The flow decreases to small splurge-like bursts and soon stops. You look to the bucket and it's just as well it stopped as a small amount of overflow dribbles down the sides.");
				buckets.quantity = 1;
				output("\nYou thank her, putting a lid over the bucket and lifting it into your backpack.");
				break;
			case 4:
				output("She shudders and moans infront of you, squeezing her bountiful breasts when with a loud <i>“MOOOO!”</i> her collosal reddened udders explode! The nozzles cut out immediately as they're drowned by her flow and the transparent cups turn completely white as milk floods them, pouring down the tube, the device sucking it as fast as it can. Her foaming mother-milk fills the tube, hastily pouring into the bucket below. She continues to moan as her swollen udders press against the cups, milk seeping through any space it can find, her fuckable nipples squased flat against the sides. continue to release their bounty. Milk wont stop flowing and you hastily pull the bucket out of the way, milk sloshing over the sides onto the floor");
				if (cap == 1)
				{
					output("and with nothing to contain it all in, her bounty pours onto the floor. The height of the milk in the cups decrease and her nipples palpitate, as the last of it unloads onto the floor. She finally stops, having filled one bucket.");
					buckets.quantity = 1;
				}
				else
				{
					output("and manage to drop another one into place before the tube pours too much of her bounty onto the floor. The height of the milk in the cups decrease and her nipples palpitate, squirting their last out. She finally stops, having filled one and a half buckets.");
					buckets.quantity = 1;
					bottles.quantity = 1;					
				}
				output("\nYou thank her, pouring her plentiful bounty into containers and placing them in your backpack.");
				break;
			case 5: 
				output("She shudders and moans infront of you, massaging her massive motherly breasts when with a loud <i>“MOOOO!”</i> her bursting red udders explode! The nozzles cut out immediately as they're drowned by her flow and the transparent cups turn completely white as milk floods them, pouring down the tube, the device sucking it as fast as it can. But it can't keep up and with a beep, the cups pop off her udders and the milker clatters to the ground. As she laughs between moaning and mooing, you grab ");
				output("as many buckets as you have and position them hastily beneath as many udders as possible. Her bounty pours into each bucket from each convulsing nipple, clanging against the bottom before splashing against more of her milk. <i>“Oh fuc-MOOO”</i> she moans as her flow increases, milk now pouring in waves from her collosal teats, splashing rapidly into the bucket like a quick running tap. Milk wont stop flowing and you're worried you wont be able to catch it all. The flow continues and you see the foaming milk rising to the sides close to overflowing. Thankfully, her milkflow cuts out and with a last spurt she stops, as the buckets lie beneath her, drips of overflow running down the sides.");
				if ((cap - bucketsUsed) >= 6)
				{
					buckets.quantity = 6;
				}
				else
				{
					buckets.quantity = (cap - bucketsUsed);
				}
				output("\nYou thank her, putting lids on each bucket of her overwhelming output and heaving them into your backpack.");
				break;
			case 6: 
				output("She shudders and moans infront of you, massaging her massive motherly breasts when with a loud <i>“MOOOO!”</i> her bursting red udders explode! The nozzles cut out immediately as they're drowned by her flow and the transparent cups turn completely white as milk floods them, pouring down the tube, the device sucking it as fast as it can. <i>“Oh fuck, it feels so good. Take my milk, keep going!”</i> But it can't keep up and with a beep, the cups pop off her udders and the milker clatters to the ground. As she laughs between moaning and mooing, you grab ");
				output("as many buckets as you have and position them hastily beneath as many udders as possible. Her bounty pours into each bucket from each convulsing nipple, clanging against the bottom before splashing against more of her milk. <i>“Oh fuc-MOOO”</i> she moans as her flow increases, milk now pouring in waves from her collosal teats, splashing rapidly into the bucket like a quick running tap. Milk wont stop flowing and you're worried you wont be able to catch it all. The flow continues and you see the foaming milk rising to the sides close to overflowing. Thankfully, her milkflow cuts out and with a last spurt she stops, as the buckets lie beneath her, drips of overflow running down the sides.");
				if ((cap - bucketsUsed) >= 6)
				{
					buckets.quantity = 6;
				}
				else
				{
					buckets.quantity = (cap - bucketsUsed);
				}
				output("\nYou thank her, putting lids on each bucket of her overwhelming output and heaving them into your backpack.");
				break;
		}
	}
	else
	{
		output("You wipe your [pc.hands] over some of her leaking bounty and rub it along the lengths of her long fuckable nipples. \n");
		output("She moos and moans, tongue dangling from her mouth as you tug on her gun barrel length nipples, occasionally stopping at the top to jam your thumbs into them. With each tug milk dribbles from the ends. ");
		output("You speed up. The broodmothers eyes roll back in her head as she sweats uncontrollably, from the intensity, her breast-teats reddening and milk bubbling and frothing at the tips. You get more agressive, tugging her nipples, causing her to gasp in pain and pleasure. You continue, tugging her long hollow nipples, her pliable flesh being squeezed and stretched in your hands, small spurts flying from the tips as you do.");
		output("Her moaning becomes more frequent as she shakes in your hands, her soft fleshy udders tight in your hands. <i>“It's comOO”</i> she gasps and just as she looks like she's going to burst, you jam your fingers into her teats. They swell and bulge around your fingers, milk pouring around them and down your wrists and with a pop you yank them out and hastily grab a bucket.");
		switch (lvl)
		{
			case 1: 
				output("She gasps infront of you and with a moo, squirts of milk fly through the air, like cum from a dick. Milk squirts into the bucket in your hands, foaming, filling the base of the bucket with her milk.");
				bottles.quantity = 1;
				output("\nYou thank her, bottling her donation and putting it into your backpack.");
				break;
			case 2:
				output("She shudders and gasps infront of you and with a moo, her swollen teats burst. Milk pours from her breasts, like water from a tap. She continues to moan as her pointed nipples continue to release their load, foaming milk pouring into the bucket below. The bursts shorten and the flow stops, leaving the bottom quarter of the bucket full of her yummy milk.");
				bottles.quantity = 2;
				output("\nYou thank her, bottling her two-bottle bounty and putting it into your backpack.");
				break;
			case 3: 
				output("She shudders and moans infront of you, grabbing her bountiful breasts when with a loud <i>“MOOOO!”</i> they burst! Mother-milk floods out from her, sloshing into the bucket below. She continues to moan as her pointed nipples continue to release their bounty. The flow decreases to small splurge-like bursts and soon stops. You look to the bucket and it's just as well it stopped as it's nearly full.");
				bottles.quantity = 3;
				output("\nYou thank her, bottling her three-bottle bounty and putting it into your backpack.");
				break;
			case 4:
				output("She shudders and moans infront of you, squeezing her bountiful breasts when with a loud <i>“MOOOO!”</i> her collosal udders explode! Milk pours in tides from her breast mounted udders, hastily pouring into the bucket below. She continues to moan as she presses her swollen udders against the bucket, milk seeping in, her fuckable nipples swimming in her own release, continuing to release their bounty. Milk wont stop flowing and you hastily pull the bucket out of the way, as her flow stops. Her nipples pulsate and you look down at a full bucket, milk dripping down the sides.");
				buckets.quantity = 1;
				output("\nYou thank her, putting a lid on the bucket and placing it into in your backpack.");
				break;
			case 5: 
				output("She shudders and moans infront of you, massaging her massive motherly breasts when with a loud <i>“MOOOO!”</i> her bursting red udders explode! Milk pours out like a waterfall from her breasts, sloshing into the bucket in your hand. The weight of the bucket is quickly increasing as her bounty pours into the bucket in your hand and you quickly have to ");
				if (cap == 1)
				{
					output("drop it to the floor. Milk continues floods from each convulsing nipple, splashing against the floor. <i>“Oh fuc-MOOO”</i> she moans as her flow increases, milk now pouring in waves from her collosal teats, pouring against the already existing puddle of milk on the floor, like water from a tap into a sink. The flow slows and with a last spurt she stops, with a drip.");
					buckets.quantity = 1;
				}
				else
				{
					output("swap it for an empty one. Milk floods from each convulsing nipple, clanging against the bottom before splashing against more of her milk. <i>“Oh fuc-MOOO”</i> she moans as her flow increases, milk now pouring in waves from her collosal teats, splashing rapidly into the bucket like a quick running tap. Milk wont stop flowing and you're worried 2 buckets wont even be enough. The flow continues and you see the foaming milk rising to the sides close to overflowing. Thankfully, her milkflow cuts out and with a last spurt she stops, drips of overflow running down the sides.");
					buckets.quantity = 2;				
				}
				output("\nYou thank her, putting lids on each bucket of her overwhelming output and heaving them into your backpack.");
				break;
			case 6: 
				output("She shudders and moans infront of you, massaging her massive motherly breasts when with a loud <i>“MOOOO!”</i> her bursting red udders explode! <i>“O-oh fuck”</i> she gasps, milk pouring out like a waterfall from her breasts, sloshing into the bucket in your hand. The weight of the bucket is quickly increasing as her bounty pours into the bucket in your hand and you quickly have to ");
				if (cap == 1)
				{
					output("drop it to the floor. Milk continues floods from each convulsing nipple, splashing against the floor. <i>“Oh fuck yeah, more”</i> she moans as her flow increases, milk now pouring in waves from her collosal teats, pouring against the already existing puddle of milk on the floor, like water from a tap into a sink. The flow slows and with a last spurt she stops, with a drip.");
					buckets.quantity = 1;
				}
				else
				{
					output("swap it for an empty one. Milk floods from each convulsing nipple, clanging against the bottom before splashing against more of her milk. <i>“Oh fuck yeah, more”</i> she moans as her flow increases, milk now pouring in waves from her collosal teats, splashing rapidly into the bucket like a quick running tap. Milk wont stop flowing and you're worried 2 buckets wont even be enough. The flow continues and you see the foaming milk rising to the sides close to overflowing. Thankfully, her milkflow cuts out and with a last spurt she stops, drips of overflow running down the sides.");
					buckets.quantity = 2;				
				}
				output("\nYou thank her, putting lids on each bucket of her overwhelming output and heaving them into your backpack.");
				break;
		}
	}
	
	output("\n\n");
	if (buckets.quantity > 0)
	{
		loot.push(buckets);
		flags["PREG_RASK_RETURNED_CUMSTORAGE_VOLUMECAP"] -= (buckets.quantity * 1000);
		if (bucketsUsed > (cap - buckets.quantity))
		{
			dumpStoredCum(flags["PREG_RASK_RETURNED_CUMSTORAGE"] - flags["PREG_RASK_RETURNED_CUMSTORAGE_VOLUMECAP"]);
		}
	}
	if (bottles.quantity > 0)
	{
		loot.push(bottles);
	}
	itemCollect(loot);
	addLevelPoints(2);
	// Milked flag
	flags["PREG_RASK_RETURNED_LASTMILKED"] = int(GetGameTimestamp() / 1440);
	flags["PREG_RASK_RETURNED_FRIENDLINESS"] += 1;
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
	clearMenu();
	//Mostly from azraExpeditions.as , author unknown
	var x:int = pc.biggestCockIndex();
	var lvl:int = getBroodmotherLevel();
	
	output((pc.isCrotchExposed() ? "The second you bring your proudly-displayed member toward the pregnant raskvel" : "The second you begin to unwrap your concealed cock") + ", her eyes go wide. She leans closer, as much as her ");
	
	switch(lvl)
	{
		case 1: 
			output("swollen");
			break;
		case 2: 
			output("plump");
			break;
		case 3: 
			output("buxom");
			break;
		case 4: 
			output("giant, baby-making");
			break;
		case 5: 
			output("ginormous, pregnancy-stretched");
			break;
		case 6: 
			output("gargantuan, writing-covered");
			break;	
	}
	
	output(" belly will allow her, to inhale your musk, her ");
	
	switch (lvl)
	{
		case 1: 
			if (isBroodmotherTreated())
			{
				output("finger-length teats visibly perking at your scent.");
			}
			else
			{
				output("perky nipples visibly perking at your scent.");
			}
			break;
		case 2: 
			if (isBroodmotherTreated())
			{
				output("pencil-length teats visibly moistening at your scent.");
			}
			else
			{
				output("round purple nipples visibly perking at your scent.");
			}
			break;
		case 3: 
			if (isBroodmotherTreated())
			{
				output("dick-length teats visibly moistening at your scent.");
			}
			else
			{
				output("plump purple nipples visibly stiffening at your scent.");
			}
			break;
		case 4: 
			if (isBroodmotherTreated())
			{
				output("dick-length teats visibly dripping at your scent.");
			}
			else
			{
				output("round purple nipples visibly perking at your scent.");
			}
			break;
		case 5: 
			if (isBroodmotherTreated())
			{
				output("large throbbing teats dribbling at your scent.");
			}
			else
			{
				output("snowball-sized nipples visibly growing at your scent.");
			}
			break;
		case 6: 
			if (isBroodmotherTreated())
			{
				output("large throbbing teats spurting milk at your scent.");
			}
			else
			{
				output("fat pierced nipples visibly growing at your scent.");
			}
			break;	
	}
	
	if (isBroodmotherFuta())
	{
		output(" Her cock stiffens in reaction to yours and her ");
	}
	else
	{
		output(" Her ");
	}
	
	output((lvl >= 6 ? "bimbo-like " : "")+ "lips purse as she struggles to find the words. Then your [pc.cock " + x + "] flops out in all its immensity, ");
	if(!pc.isErect()) output("half-turgid and growing under her spellbound gaze");
	else output("massively turgid, the veins pumping beneath her spellbound gaze");
	output(". She " + (lvl >= 3 ? "gasps" : "whimpers") + ", her hands subconsciously squeezing her " + (isBroodmotherFuta() ? "stiffening cock" : (isBroodmotherTreated() ? "breast-mounted teats" : "tits")) + ", her tail wagging back and forth across the cum-soaked floor. ");
	
	if (lvl >= 4){
		if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
			output("\n\n<i>“Woah! Looks like you'll be the one giving the big injections”</i> the purple-scaled broodmother gasps, licking her lips, reaching towards it. When she makes contact, a shiver of pleasure runs through you, and it throbs against her armored skin");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
			output("\n\n<i>“Wow! I'll try my best to clean it " + pc.mf("master","mistress") + ", I might have to get quite hands on though”</i> the purple-scaled broodmother gasps, licking her lips, reaching towards it. When she makes contact, a shiver of pleasure runs through you, and it throbs against her armored skin");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
			output("\n\n<i>“Woah! Forget about boosting my grade, I should have to help you to play with this giant cock!”</i> the purple-scaled broodmother gasps, licking her lips, reaching towards it. When she makes contact, a shiver of pleasure runs through you, and it throbs against her armored skin");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
			output("\n\n<i>“Woah! If you were tying me up for this, you really didn't have to!”</i> the purple-scaled broodmother gasps, licking her lips, reaching towards it. When she makes contact, a shiver of pleasure runs through you, and it throbs against her armored skin");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
			output("\n\n<i>“Woah! Looks like you'll be giving me a lesson! It's so big!”</i> the purple-scaled broodmother gasps, licking her lips, reaching towards it. When she makes contact, a shiver of pleasure runs through you, and it throbs against her armored skin");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
			output("\n\n<i>“Woah! That's quite the crop there!”</i> the purple-scaled broodmother gasps, licking her lips, reaching towards it. When she makes contact, a shiver of pleasure runs through you, and it throbs against her armored skin");
		}
		else{
			output("\n\n<i>“Oh yeahh, that's what 'mama wants!”</i> the purple-scaled broodmother gasps, licking her lips, reaching towards it. When she makes contact, a shiver of pleasure runs through you, and it throbs against her armored skin");
		}
	}
	else{
		if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
			output("\n\n<i>“W-wow. I've never seen a symptom like this..”</i> the purple-scaled lizard-girl reaches out experimentally, as if she can’t quite believe that it’s real. When she makes contact, a shiver of pleasure runs through you, and it throbs against her armored skin");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
			output("\n\n<i>“W-wow. There's a lot to clean there, I'm not sure if I'll..”</i> the purple-scaled lizard-girl reaches out experimentally, as if she can’t quite believe that it’s real. When she makes contact, a shiver of pleasure runs through you, and it throbs against her armored skin");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
			output("\n\n<i>“W-woah. Are you sure this isn't too big for a little girl like me..”</i> the purple-scaled lizard-girl reaches out experimentally, as if she can’t quite believe that it’s real. When she makes contact, a shiver of pleasure runs through you, and it throbs against her armored skin");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
			output("\n\n<i>“W-woah. I see why you tied me up for this..”</i> the purple-scaled lizard-girl reaches out experimentally, as if she can’t quite believe that it’s real. When she makes contact, a shiver of pleasure runs through you, and it throbs against her armored skin");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
			output("\n\n<i>“W-woah. Looks like I learnt something today..”</i> the purple-scaled lizard-girl reaches out experimentally, as if she can’t quite believe that it’s real. When she makes contact, a shiver of pleasure runs through you, and it throbs against her armored skin");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
			output("\n\n<i>“W-woah. That's quite the crop..”</i> the purple-scaled lizard-girl reaches out experimentally, as if she can’t quite believe that it’s real. When she makes contact, a shiver of pleasure runs through you, and it throbs against her armored skin");
		}
		else{
			output("\n\n<i>“W-wow. It’s so big.”</i> the purple-scaled lizard-girl reaches out experimentally, as if she can’t quite believe that it’s real. When she makes contact, a shiver of pleasure runs through you, and it throbs against her armored skin");
		}
	}
	
	if(pc.cumQ() >= 40 && pc.cumQ() < 500) output(", leaking a fat drop of pre-cum onto her wrist.");
	else if (pc.cumQ() >= 500) output(", drooling a stream of pre-cum all over her wrist.");
	
	if (isBroodmotherPregnant())
	{
		output("Her expression sours. <i>“I wish I wasn’t pregnant.”</i> Tiny hands grab you just behind the [pc.cockHead " + x + "] and gently tug you closer.");
		output("\n\nYou let them.");
		if (lvl <= 2)
		{
			output("\n\n<i>“If I wasn’t pregnant, you could knock me up with this monster. You’d give me the best eggs ever! Sire a whole clan of daughters and sons, loads of babies..”</i> Her face is an inch away from your [pc.cockNoun " + x + "], but her eyes have drifted closed. The short, eager alien is lost in her own fantasy, navigating her lips to greet your eager flesh by smell and feel alone");
		}
		else if (lvl <= 4)
		{
			output("\n\n<i>“If I wasn’t pregnant, you could knock me up with this monster. You’d give me the biggest, rounded eggs ever. Sire a whole clan of big-dicked sons to make the next generation of raskvel girls stumble around bow-legged...”</i> Her face is an inch away from your [pc.cockNoun " + x + "], but her eyes have drifted closed. The short, stacked alien is lost in her own fantasy, navigating her lips to greet your eager flesh by smell and feel alone");
		}
		else if (lvl <= 6)
		{
			output("\n\n<i>“If I wasn’t pregnant, you could fill me with this monster. You’d give me the biggest, rounded eggs ever. Sire a whole clan of giant-dicked sons to incapactitate every girl on the planet..”</i> Her face is an inch away from your [pc.cockNoun " + x + "], but her eyes have drifted closed. The buxom alien is lost in her own fantasy, navigating her" + (lvl >= 6 ? " plump " : " ") + "lips to greet your eager flesh by smell and feel alone");
		}
	}	
	else 
	{
		output("<i>“I'm glad I'm not pregnant just yet.”</i> she says, licking her lips. Tiny hands grab you just behind the [pc.cockHead " + x + "] and yank you closer.");
		output("\n\nYou let them.");
		if (lvl <= 2)
		{
			output("\n\n<i>“Can you fill me with this - fill me with big round eggs? Sire a whole clan of daughters and sons, loads of babies..”</i> Her face is an inch away from your [pc.cockNoun " + x + "], but her eyes have drifted closed. The short, eager alien is lost in her own fantasy, navigating her lips to greet your eager flesh by smell and feel alone");
		}
		else if (lvl <= 4)
		{
			output("\n\n<i>“I want you to fill me with this monster - fill me with big round eggs. Sire a whole clan of big-dicked sons to make the next generation of raskvel girls stumble around bow-legged...”</i> Her face is an inch away from your [pc.cockNoun " + x + "], but her eyes have drifted closed. The short, stacked alien is lost in her own fantasy, navigating her lips to greet your eager flesh by smell and feel alone");
		}
		else if (lvl <= 6)
		{
			output("\n\n<i>“Fill me with this monster - fill me with cum and eggs! Give me giant-dicked sons to incapactitate every girl on the planet!”</i> Her face is an inch away from your [pc.cockNoun " + x + "], and her eyes remain, fixated on it. The buxom alien draws her" + (lvl >= 6 ? " plump " : " ") + "lips towards your eager flesh, trembling in anticipation");
		}
	}
	
	if(pc.isTreated() || pc.cocks[x].cType == GLOBAL.TYPE_EQUINE || pc.hasPheromones()) 
	{
		output(", and from how she whimpers after every breath, she likes it. When she pauses and sniffs deeply, her tiny frame shudders in response to the hyper-concentrated dose of pheromones");
		if(pc.isTreated()) output(". You silently praise whoever invented the Treatment");
	}
	output(".");

	output("\n\nShe presses her" + (lvl >= 6 ? " bimbo-like " : " soft ") + "lips against the meatiest part of your [pc.cockHead " + x + "], already slick with spit and eager to touch every part of your sensitive maleness. Tingling bolts of pleasure shoot through your sensitive mast as the miniature succubus’s fingers work over the skin, teasing and testing it");
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

	output("\n\nThe raskvel’s hungry eyes pop open abruptly, and she breaks her dick-licking kiss to look up at you. Her hands, fortunately, do not stop their worship.<i>“Can I collect your cum?”</i> Her eyes are eager and earnest. <i>“I... there’s a bucket.”</i>");
	if(pc.cumQ() >= 50) output(" She licks stray pre from her lips, though the effect is more to smear it across the bottom one like lip gloss.");
	else output(" She licks her lips");
	output((isBroodmotherPregnant() ? "<i>“And I want to have your babies. After these." : "<i>“Y'know, I don't think this'll be able to fit, so I'm gonna empty your cum-bucket inside of me later.") + "”</i> She lifts your dick with both hands, grunting with the effort, then feathers kisses along the underside of your shaft");
	if(pc.cocks[x].cType == GLOBAL.TYPE_FELINE) output(", sucking on the soft, feline \"barbs” one at a time");
	output(". <i>“You’re the best daddy I’m ever going to meet.”</i>");

	output("\n\nYou doubt you could stop her from gathering some if you wanted to.");
	if(pc.isBro() || pc.libido() >= 75) output(" Besides, a hidden part of you thrills at knowing this waddling baby-factory is going to play host to your children. Maybe she even has a system to preserve your cum, so she can pump out litters of little Steeles for years to come.");
	output(" <i>“");
	if(pc.isBro()) output("Go ahead,”</i> you grunt.");
	else if(pc.isBimbo()) output("Like, O-M-G that would amazalicious!”</i> you cheerily exclaim, happy to feed her all the dick she could ever want.");
	else output("Just stop teasing me, and you can do whatever you want with the cum,”</i> you implore, hips shuddering. Her fingers are too damned good at their job.");

	output("\n\nThe raskvel giggles. <i>“" + pc.mf("You boys are so easy.","A few strokes to the dick, and you get so generous.") + " Don’t worry. If there’s one thing I know, it’s how to make a cock feel good. Well, that and how to remodulate an ionic conductor for usage in a particle cannon, but getting knocked up is wayyy more fun!”</i> She’s back on your [pc.cock] as soon as you finish, pulling it - and you - closer so that she can recline. So positioned, the pregnant raskvel is able to grind you against her " +  (lvl <=1 ? " stomach" : " belly") + " and " + (lvl <=1 ? " rub your collosal fuck-rod against her " : "thread you through her ") + (isBroodmotherTreated() ? "breast-udders" :"tits") + ", smearing your ");
	if(pc.cumQ() < 500) output("oozing");
	else if(pc.cumQ() < 1000) output("streaming");
	else output("all but gushing");
	output(" pre across her soft-scaled skin.");

	output("\n\nShe grabs a bucket from under her while you adjust to the sudden onslaught of friction. <i>“Goddamn, that is some premium dick,”</i> the raskvel coos. She grabs one enormous ear and lays it across the top left side of your member. The inside is velvety soft warm. The other falls onto the other side a second later. <i>“I swear I can feel your dick all the way in my ovaries.”</i> Her legs tremble. <i>“Like they know I’m rubbing your big, fat, alien cumstick right next to them.”</i>");
	
	// If non-pregnant, she'll try and put it in
	var cummed:Number = pc.cumQ();
	if (!isBroodmotherPregnant())
	{
		output("\n\nThe scaley slut’s hands return to their former place, this time pressing through her sensitive ears. It must feel good, because her eyes roll halfway back, interrupting her attempts to kiss your [pc.cockHead " + x + "], but nothing could stop her from stroking you, pressing her tits together on either side with her forearms and jacking her perfectly textured ears up and down over every inch of cock she can reach. She drools into her cleavage, and her" + (isBroodmotherFuta() ? " three" : "") + " legs twitch with pleasure as she tries to thrust herself against something.");
		output("<i>“Ughh, I can't take this anymore, I don't want your cum in a bucket, I want it inside of me!”</i> she cries out. You know how she feels. She grabs a hold of your violently throbbing [pc.cock " + x + "] and " + (isBroodmotherFuta() ? "after lifting her throbbing balls out of the way, " : "") + "grinds against it's base before raising her arms and pulling herself up to the tip, leaving a trail of juices along your shaft as she ascends.");
		output("\n\n Your heart hammers in your chest with alarming rapidly. All you want is to push your cock into her" + (getWhatWearing_DressedAs() != null ? (getWhatWearing_DressedAs() + "pussy") : " raskvel-pussy") + " and unload all your hot cum into her. You press your large [pc.cockHead " + x + "] against her " + (isBroodmotherTreated() ? "torrenting" : "soaking") + " fuck-hole and pull her down by her" + (getWhatWearing_Thighs() != null ? (" " + getWhatWearing_Thighs() + "s") : " thighs") + ". You feel her slowly roll around your tip, like a condom, letting out cries of pain and enjoyment as her pussy stretches to accomodate what she truly desires, until your girths invasion is stopped by the limits of her frame.");
		output("\n\nTwo alien feet press down on your [pc.knot " + x + "] from either side with force, precum coating her hands as she thrusts herself back up your tingling tip. Better still, her" + (lvl == 6 ? " writing-covered " : " ") + "thighs straddle you as she trembles atop you like a high-powered vibrator. You groan and thrust forward, slamming your dicktip again as far as it'll go into her gaping hole, and she moans right along with you, her soprano voice tickling already overloaded nerves with another layer of impregnation-obsessed pleasure.");
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
			output("\n\n<i>“Holy fucking condoms, that’s a lotta jizz!”</i> the raskvel squeaks, gushing again. <i>“I'm definitely preggers now, " + pc.mf("stud","slut") + "!”</i> She lifts herself off and slides down your soaked shaft, giving you a good look at her [pc.cumColor]-painted groin and sloshing belly. Streams of [pc.cumVisc] [pc.cumNoun] hang from her outer lips, and she’s constantly stroking her cum-covered belly in arousal. <i>“I bet that much will give me loads of your kids. My current record is fifteen.”</i> She tries to smile but she's still so lost in what just happened.");
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
		flags["PREG_RASK_RETURNED_FRIENDLINESS"] += 5;
		addButton(0,"Next",denInside);
	}
	addLevelPoints(2);
}

//Fuck Her
//"Her womb may be full, but her pussy isn’t." Except sometimes her womb isn't full now! Nice.
public function fuckDatRaskipoo_Return():void
{
	clearOutput();
	clearMenu();
	//Unknown author, taken mostly from azraexpeditions.as but there was no author there.
	
	var x:int = pc.cockThatFits(220 + (lvl * 120));
	var lvl:int = getBroodmotherLevel();
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
	
	if (lvl <= 2)
	{
		output(" She smiles wide eager to take your cock, licking her blue-painted lips. She gets on her knees and crawls around in a circle" + (lvl >= 2 ? ", her swollen belly dragging against the cum-stained floor." : "."));
		output("\n\n<i>“Well? Lets go!”</i> she shouts eagerly, lifting one" + (getWhatWearing_Thighs() != null ? (getWhatWearing_Thighs() + " covered ") : " ") + "leg high into the air");
		output(" to reveal her " + (isBroodmotherTreated() ? "feather-framed cunt, flanked by bright pink, golf ball sized clitties. The folds themselves are juicy, eagerly awaiting your gift.":"smooth cunt, flanked by bright pink, golf ball sized clitties. The folds themselves are juicy, eagerly awaiting your gift.") + " They're still fairly tight, having shrunk from her withdrawal from the motherhusks, good for squeezing down on your [pc.cock " + x + "]. <i> “Or are you just teasing me?” </i> She grabs her ankle and pulls her leg higher, spreading her " + (isBroodmotherTreated() ? "moist" : "") + "pussy, to your arousal.");
	
		//Very tall.
		if(pc.tallness >= 6*12+6) 
		{
			output("\n\nHardly. She’s just so small. Getting a huge creature like yourself to line up with her takes significant effort and a small amount of engineering. Between shoving a few cushions under her ass and awkwardly squatting down, you make it work.");
			if(silly) output(" Life... uh... finds a way.");
		}
		//Else
		else
		{
			output("\n\nHardly. You squat down to line yourself up.");
		}
	}
	else if (lvl <= 5)
	{
		output(" She smiles wide with licentious intent, licking her blue-painted lips and tossing her downy hair. She rolls on to the floor before turning to look at you.");
		output("\n\n<i>“You gonna stick it in?”</i> The purple-scaled lizard rolls to the side, lifting one" + (getWhatWearing_Thighs() != null ? (getWhatWearing_Thighs() + " covered ") : " ") + "leg high into the air");
		output(" to reveal her " + (isBroodmotherTreated() ? "hairy swollen cunt, flanked by bright pink, golf ball sized clitties. The folds themselves are thick and juicy, pouring eager girlcum across the floor.":"smooth swollen cunt, flanked by bright pink, marble-sized clitties. The folds themselves are thick and juicy, dribbling eager pussyjuice across the floor.") + " No matter how many birth’s they’ve passed, they’re plush enough to squeeze down on a pinky, let alone your [pc.cock " + x + "]. <i> “Or are you just teasing poor, ol' me?” </i> She grabs her ankle and pulls her leg higher until her lips part, " + (isBroodmotherTreated() ? "spraying a gush of lube into the air." : "releasing a small gush of lube."));
	
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
		
		output("\n\n<i>“...Maybe you’re just afraid of a little raskvel pussy. Like you know you’ll get coming here day after day if you taste too much”</i> the sultry tart suggests.");
	}
	else if (lvl <= 6)
	{
		output(" She smiles wide with licentious intent, licking her plump blue lips and tossing her downy hair. She rolls on to the floor before turning to look at you and shakes her phat writing-covered buttocks in your face.");
		output("\n\n<i>“Come on, I want you to stick it in my pussy”</i> she moans. The purple-scaled lizard rolls to the side, lifting one thick" + (getWhatWearing_Thighs() != null ? (getWhatWearing_Thighs() + " covered ") : " ") + "thigh high into the air");
		output(" to reveal her " + (isBroodmotherTreated() ? "hairy gaping cunt, flanked by bright pink, golf ball sized clitties. The folds themselves are plump and juicy, dripping eager girlcum across the floor.":"bare gaping cunt, flanked by bright pink, golf ball sized clitties. The folds themselves are plump and juicy, dripping eager girlcum across the floor.") + " Whilst the sheer volume and size of cocks she's been taking and the number of births she's passed have undoubtadly left her used, her masterful pussy could still squeeze down on a pinky, let alone your [pc.cock " + x + "]. <i>“Give me it, now!”</i> She grabs her buttock with one hand and yanks it to one side, presenting her gaping fuck-hole, " + (isBroodmotherTreated() ? "spurting lube into the air as she does." : "releasing a spurt of lube as she does."));
	
		if(pc.tallness >= 6*12+6) 
		{
			output("\n\nIf it wasn't for her ginormous paunch, you'd have trouble lining yourself up. You squat down slightly being careful not to slip on the cum-covered floor.");
		}
	}
	
	output("\n\nGrabbing her belly to brace yourself, you thrust inside. ");
	
	if(pc.cockVolume(x) < ((220 + (lvl * 120)) - 100)) output("Her pussy parts easily around your [pc.cock " + x + "]" + (lvl <= 5 ? ", and her diatribe cuts off with a high-pitched squeak of pleasure." : ", and she lets out a moan of pleasure."));
	else if(pc.cockVolume(x) < ((220 + (lvl * 120)) - 50)) output("Her pussy reluctantly parts for your [pc.cock " + x + "], clutching it tightly" + (lvl <= 5 ? " as her diatribe cuts off with a high-pitched squeak of pleasure." : " and she lets out a surprised gasp before exhaling slowly in ecstasy."));
	else output("Her pussy strains to accept your girthy tool, its thick lips stretched wide enough to pass a" + (lvl <= 4 ? "n egg" : " watermelon") + "." + (lvl <= 5 ? " A high-pitched wail of pleasure interrupts the little slut’s diatribe at the penetration. Evidently she’s a fan of pushing herself to the absolute limit." : " A wail of pleasure echoes around the room at the penetration. Evidently she’s a fan of pushing herself to the absolute limit."));
	
	if (lvl >= 3)
	{
		output(" That saucy slot feels lovely wrapped around you. Her folds are absolutely soaked, and the pudgy pussy-lips press hotly against your crotch, a gentle reminder that you’ve buried yourself completely inside her.");
	}
	else 
	{
		output(" Her tight slot feels lovely wrapped around you. Her folds moisten your shaft, and the pudgy pussy-lips press hotly against your crotch, a gentle reminder that you’ve buried yourself completely inside her.");
	}
	
	pc.cockChange();
	var y:int = pc.cockThatFits2(220 + (lvl * 120));
	//2
	if(y >= 0 && pc.cockTotal() == 2)
	{
		output("\n\nMeanwhile, your second dick rubs against the " + (lvl >= 3 ? "slippery" : "") + "crease of her thigh, pressing its [pc.cockHead " + x + "] ");
		if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
			output("between her underside and the rubbery hem of her nurse outfit." + (lvl >= 3 ? "The mix of sweat and cunt - juice " : "The sweat ") + "surrounding it ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
			output("between her underside and the inside of her rough black maid skirt." + (lvl >= 3 ? "The mix of sweat and cunt - juice " : "The sweat ") + "surrounding it ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
			output("between her underside and the inside of her rough tartan skirt." + (lvl >= 3 ? "The mix of sweat and cunt - juice " : "The sweat ") + "surrounding it ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
			output("against a thick leather strap." + (lvl >= 3 ? "The mix of sweat and cunt - juice " : "The sweat ") + "coating the strap ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
			output("between her underside and the inside of her rough black skirt." + (lvl >= 3 ? "The mix of sweat and cunt - juice " : "The sweat ") + "surrounding it ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
			output("between her underside and the inside of her rough overalls." + (lvl >= 3 ? "The mix of sweat and cunt - juice " : "The sweat ") + "surrounding it ");
		}
		else{
			output("up against the underside of her fertile belly." + (lvl >= 3 ? "The mix of sweat and cunt - juice " : "The sweat ") + "coating her soft - scaled skin ");
		}
		output("allows it to glide effortlessly against her, right up until she wraps her fingers around it to give it a tug. < i > “I see you brought extra for the rest of me. How thoughtful...” </ i > Her fingers twist and swirl while her cunt clenches.");
	}
	//More
	else if(y >= 0)
	{
		output("\n\nMeanwhile, your extra dicks rub against the " + (lvl >= 3 ? "slippery" : "") + "creases of her thighs, pressing their turgid tips ");
		if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
			output("between the underside of her fertile belly and the rubbery hem of her nurse outfit." + (lvl >= 3 ? "The mix of sweat and cunt - juice " : "The sweat ") + "surrounding it ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
			output("between the underside of her fertile belly and the inside of her rough black maid skirt." + (lvl >= 3 ? "The mix of sweat and cunt - juice " : "The sweat ") + "surrounding it ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
			output("between the underside of her fertile belly and the inside of her rough tartan skirt." + (lvl >= 3 ? "The mix of sweat and cunt - juice " : "The sweat ") + "surrounding it ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
			output("against a thick leather strap." + (lvl >= 3 ? "The mix of sweat and cunt - juice " : "The sweat ") + "coating the strap ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
			output("between the underside of her fertile belly and the inside of her rough black skirt." + (lvl >= 3 ? "The mix of sweat and cunt - juice " : "The sweat ") + "surrounding it ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
			output("between the underside of her fertile belly and the inside of her rough overalls." + (lvl >= 3 ? "The mix of sweat and cunt - juice " : "The sweat ") + "surrounding it ");
		}
		else{
			output("up against the underside of her fertile belly." + (lvl >= 3 ? "The mix of sweat and cunt - juice " : "The sweat ") + "coating her soft - scaled skin ");
		}
		output("allows them to glide effortlessly against her, right up until she grabs ");
		if(pc.cockTotal() == 3) output("both of them");
		else output("two of them");
		output(" to give them a tug. <i>“I see you packed more for the rest of me. How thoughtful...”</i> She pumps both hard. <i>“I could use a facial.”</i>");
	}
	
	//Merge
	if (lvl >= 3)
	{
		output("\n\nWhatever your floor-bound partner may think, you hold all the cards. You’re the one doing the fucking, looming over her. You’re the one who moves her thigh to make the muscles inside her twat clamp down tighter on your rod. She can whimper, her hands caressing your body in ways that make you groan, but there’s nothing she can do to change your tempo, nothing she can do to give her pause when you pound her drooling cunt hard enough to make her chirp out an orgasm.");
	}
	else 
	{
		output("\n\nShe's given in completely to your cock, despite her earlier teasing. She's missed the feeling of a good cock. She's missed the feeling of the fucking. Someone looming over her. Someone moving her thigh to make the muscles inside her twat clamp down on their rod. Someone making her whimper and moan and groan. Fucking with ever-increasing tempo, never giving her a pause as they pound her cunt hard enough until they fill her with cum.");
	}
	
	output("\n\nYou’re just getting warmed up. You hammer her well-used cunt with powerful strokes. When you pull back, ");
	if (lvl <= 2)
	{
		if (isBroodmotherTreated())
		{
			output("ropes of girl-jizz spatter the floor, hanging off your [pc.cock " + x + "] in webs. When you thrust in, still more squirts out, splattering your thighs and hers alike. When you bury yourself to the hilt, crushing her clits between your bodies, she squeals and trembles.");
		}
		else 
		{
			output("a mist of girl-jizz squirts against your crotch, coating your [pc.cock " + x + "] up to the base. When you thrust in, still more squirts out, spraying the floor. When you bury yourself to the hilt, crushing her clits between your bodies, she squeals and trembles.");
		}
	}
	else if (lvl <= 4)
	{
		if (isBroodmotherTreated())
		{
			output("girl-jizz splashes the floor, hanging off your [pc.cock " + x + "] like drool. When you thrust in, still more squirts out, splattering your thighs and hers alike. When you bury yourself to the hilt, crushing her clits between your bodies, she squeals and trembles. ");
		}
		else 
		{
			output("ropes of girl-jizz spatter the floor, hanging off your [pc.cock " + x + "] in webs. When you thrust in, still more squirts out, splattering your thighs and hers alike. When you bury yourself to the hilt, crushing her clits between your bodies, she squeals and trembles. ");
		}
	}
	else if (lvl <= 6)
	{
		if (isBroodmotherTreated())
		{
			output("thick waves of girl-jizz crash against the floor, dripping from your [pc.cock " + x + "] like wet paint. When you thrust in, still more squirts out, coating both your thighs and " + (pc.bellyRating() >= 10 ? "bellies" : "stomachs") + ". When you bury yourself to the hilt, crushing her clits between your bodies, she moans and shudders. ");
		}
		else 
		{
			output("girl-jizz splashes the floor, hanging off your [pc.cock " + x + "] like drool. When you thrust in, still more squirts out, splattering your thighs and hers alike. When you bury yourself to the hilt, crushing her clits between your bodies, she moans and shudders. ");
		}
	}
	output("You can’t tell if she’s cumming over and over, or if she just can’t handle how good it feels to have her cock hungry pussy taken by a talented lover. You like it either way.");
	output("\n\nShe’s smiling saucily, " + (isBroodmotherFuta() ? "her ball-pouch bouncing against her stomach with each thrust, " : "") + " her tail lashing back and forth. It ");
	if(pc.balls > 1) output("cradles your balls, then wraps around them with surprising tenderness. The warm cocoon of scaly flesh makes it seem almost too easy to spill your load.");
	else if(pc.hasVagina()) output("teasingly wanders over your slit, then slips inside. The slippery scales inside you make it almost too easy to spill your load.");
	else output("slips back to tease your [pc.asshole]. At first, it’s playfully circling, but after a particularly forceful thrust on your part, she slides it in. The pressure on your gland makes it seem almost too easy to spill your load.");
	output(" One errant thought and you’ll be giving her an enormous, cunt-bathing creampie.");

	if (isBroodmotherPregnant())
	{
		if (lvl <= 2)
		{
			output("\n\n<i>“You know, if you give me enough c-AHhH~! ..cum, I can save some to get pregnant with after this batch.”</i> Her pussy quivers, spraying more reptilian mist across your nether regions. <i>“You could make me so big. Think about it. Your own little broodmother, saving your seed to get knocked up again and again.”</i>");
		}
		else if (lvl <= 4)
		{
			output("\n\n<i>“You know, if you give me enough c-cuuUUUM~! ...I can save some to get pregnant with after this batch.”</i> Her pussy quivers, leaking runnels of slick, reptilian goo. <i>“I bet you’ll make me ever bigger. Think about it. Your little egg-slut, saving your cum so she can get knocked up again and again.”</i>");
		}
		else if (lvl <= 6)
		{
			output("\n\n<i>“You know, if you give me enough c-cuuUUUM~! ...I could get pregnant again after these ones.”</i> Her pussy quivers, more reptilian goo splashing against the wet floor. <i>“You could make me so fucking big. Think about it, your little egg-slut, saving your cum so I can have your babies over and over.”</i>");
		}
	
		output("\n\n");
		if (isSlut){
			output("Fuuuck that’s exactly what you want to do. You want to strap her to the wall in your ship and dump endless loads into her, using her as equal parts sex-toy and virility measuring stick. Maybe you might even get her some mods or an exoskeleton to let her get around the ship." + (getWhatWearing() == null ? "In between laying eggs she could dress herself in skimpy slutwear and slowly ruin it as her pregnancy progresses..." : "She could stretch the outfit you've given her out and completely ruin it as her pregnancy progresses..."));
			if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY"] == 0) flags["PREG_RASK_RETURNED_DRESSUP_FANTASY"] = 1;
		}
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
		if (lvl <= 2)
		{
			output("\n\n<i>“Ahh, I want your c-cuuUUUM~! ...I want you to fill me with it.”</i> Her pussy quivers, spraying your nether regions yet again with a mist of reptilian goo. <i>“I bet you’d make me so big, filled with sooo many eggs!”</i>");
		}
		else if (lvl <= 4)
		{
			output("\n\n<i>“Ahh, I want your c-cuuUUUM~! ...I want you to fill me.”</i> Her pussy quivers, leaking runnels of slick, reptilian goo. <i>“I bet you’ll make me even bigger, filled up with your big hot load. I'd carry sooo many eggs!”</i>");
		}
		else if (lvl <= 6)
		{
			output("\n\n<i>“Ahh, I want your c-cuuUUUM~! ...I want you to fill me up with your cum until it's running out my nose.”</i> Her gaping pussy quivers, and your nether-regions get sprayed by a wave of her girl-cum. <i>“Come on, fill me with your babies!”</i>");
		}		
	
		output("\n\n");
		if (isSlut){
			output("Fuuuck you want that too. You want to dump endless loads into her, using her as equal parts sex-toy and virility measuring stick until she's lying, completely incapacitated in a lake of your cum. Maybe you might even get her some mods or an exoskeleton to get her onto your ship." + (getWhatWearing() == null ? "In between laying eggs she could dress herself in skimpy slutwear and slowly ruin it as her pregnancy progresses..." : "She could stretch the outfit you've given her out and completely ruin it as her pregnancy progresses..."));
			if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY"] == 0) flags["PREG_RASK_RETURNED_DRESSUP_FANTASY"] = 1;
		}
		else 
		{
			output("You feel like you ought to be a little concerned about giving this alien creature your babies or perhaps even disgusted, but your body isn’t. Your traitorous rod");
			if(pc.cockTotal() > 1) output("s love");
			else output(" loves");
			output(" the idea of siring a whole clan of horny fuck-lizards. She’s tickled your most basic, unthinking instincts in ways that make your [pc.cockNoun " + x + "] throb and your ");
			if(pc.balls > 0) output("[pc.balls]");
			else output("crotch");
			output(" clench.");
		}
	}

	output("\n\nYou bury yourself deep and unload. There’s no other option. The climax is entirely beyond your control, more a sudden venting of pressure than anything you have to work for. The raskvel’s " + (lvl >= 2 || isBroodmotherTreated() ? "oozy," : ",") + " clutching slit squeezes it out of you in ");
	var cummies:Number = pc.cumQ();
	if(cummies < 5) output("weak trickles");
	else if(cummies < 25) output("fat globs");
	else if(cummies < 175) output("thick streams");
	else if(cummies < 1000) output("enormous gushes");
	else output("titanic waves");
	output(", her " + (lvl >= 3 ? "well-used form" : "tightness") + " wringing your [pc.cockNoun " + x + "] for all its worth. Her cunt a warm, wet heaven, clutching you tightly, drowning you in ecstasy in pussyjuice alike");
	if(cummies >= 2000) output(" while your pressurized seed vents back out all over the floor");
	output(". You shudder and groan with each successive spurt until your dick finally goes dry. Even then, the scaled cumdumps' tunnel massages you pleasantly, begging you to stay inside and enjoy the post-coital massage. You manage to pull yourself away, despite the broodmother teasingly circling her finger around her pussy-lips.");

	processTime(30);
	pc.orgasm();
	addLevelPoints(2);
	flags["PREG_RASK_RETURNED_FRIENDLINESS"] += 5;
	addButton(0,"Next",cumInsideBroodmother,cummies);
}

//Face Ride
//Straddle her face as she eats you out, then slip in her cuntjuice for musky fun :3
public function faceRideTheRaskPreg_Return():void
{
	clearOutput();
	showPregRaskReturn();
	clearMenu();
	
	//Mostly taken from azraExpeditions.as , author unknown
	var lvl:int = getBroodmotherLevel();
	var isSlut:Boolean = ((pc.isTreated() && pc.isBimbo()) || pc.isBimbo() || pc.isBro() || pc.isDependant(Creature.DEPENDANT_CUM) || (pc.libido() >= 50 && pc.lust() >= 33) || pc.lust() > 66);
	
	output("You advance on the" + (lvl >= 4 ? " immobile " : (lvl >= 3 ? " swollen " : " flirty ")) + "raskvel");
	if(!pc.isCrotchExposed()) output(", silently peeling the covers from your [pc.vaginas].");
	else output(", silently wiggling your hips to draw her attention to your [pc.vaginas].");
	
	if(pc.tallness >= 5*12) output("\n<i>“You’re just the right height.");
	else output("\n<i>“I bet all the girls love seeing you stuck on your knees.");
	
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
	
	if (lvl <= 2)
	{
		if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
			output("\n\n<i>“Hmmm... usually I don't like pussy that much but I suppose a nurse has to look after her patients”</i> the " + (isBroodmotherPregnant() ? "pregnant" : "timid") + " raskvel admits. ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
			output("\n\n<i>“Hmmm... usually I don't like pussy that much but I suppose anything for my " + pc.mf("master","mistress") + "”</i> the " + (isBroodmotherPregnant() ? "pregnant" : "timid") + " raskvel admits. ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
			output("\n\n<i>“Hmmm... usually I don't like pussy that much but I suppose I have been a naughty little schoolgirl”</i> the " + (isBroodmotherPregnant() ? "pregnant" : "timid") + " raskvel admits. ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
			output("\n\n<i>“Hmmm... usually I don't like pussy that much but I suppose with how tight this harness is I can hardly say no. Not that I would want to...”</i> the " + (isBroodmotherPregnant() ? "pregnant" : "timid") + " raskvel admits. ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
			output("\n\n<i>“Hmmm... usually I don't like pussy that much but I suppose It'd be a good lesson for you...”</i> the " + (isBroodmotherPregnant() ? "pregnant" : "timid") + " raskvel admits. ");
		}
		else{
			output("\n\n<i>“Hmmm... usually I don't like pussy that much but you are quite intriguing...”</i> the " + (isBroodmotherPregnant() ? "pregnant" : "timid") + " raskvel admits. ");
		}
	}
	else if (lvl <= 4)
	{
		if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
			output("\n\n<i>“Mmmm... usually I don't like pussy that much but I suppose a nurse has to look after her patients”</i> the " + (isBroodmotherPregnant() ? "pregnant" : "timid") + " raskvel admits. ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
			output("\n\n<i>“Mmmm... usually I don't like pussy that much but I suppose anything for my " + pc.mf("master","mistress") + "”</i> the " + (isBroodmotherPregnant() ? "pregnant" : "timid") + " raskvel admits. ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
			output("\n\n<i>“Mmmm... usually I don't like pussy that much but I suppose I have been a naughty little schoolgirl”</i> the " + (isBroodmotherPregnant() ? "pregnant" : "timid") + " raskvel admits. ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
			output("\n\n<i>“Mmmm... usually I don't like pussy that much but I suppose with how tight this harness is I can hardly say no. Not that I would want to...”</i> the " + (isBroodmotherPregnant() ? "pregnant" : "timid") + " raskvel admits. ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
			output("\n\n<i>“Mmmm... usually I don't like pussy that much but I suppose It'd be a good lesson for you...”</i> the " + (isBroodmotherPregnant() ? "pregnant" : "timid") + " raskvel admits. ");
		}
		else{
			output("\n\n<i>“Mmmm... usually I don't like pussy that much but you are quite intriguing...”</i> the " + (isBroodmotherPregnant() ? "pregnant" : "timid") + " raskvel admits. ");
		}
	}
	else if (lvl <= 6)
	{
		if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
			output("\n\n<i>“Mmmm... come here then! I'll eat my patients cunt out until your juices are dripping off my chin!”</i> ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
			output("\n\n<i>“Mmmm... come here then" + pc.mf("master","mistress") + "! I'll serve your cunt until your juices are dripping off my chin!”</i> ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
			output("\n\n<i>“Mmmm... come here then! This slutty schoolgirl will eat you out until your juices turn her shirt see-through!”</i> ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
			output("\n\n<i>“Mmmm... come here then, grind on this bound sluts face until my face is soaked!”</i> ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
			output("\n\n<i>“Mmmm... come here then, I'll give you a crash course in eating cunt!”</i> ");
		}
		else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
			output("\n\n<i>“Mmmm... come here then, ride this country girls face until it's soaked!”</i> ");
		}
		else{
			output("\n\n<i>“Mmmm... come here then, I'll eat you out until your juices are dripping off my chin!”</i> ");
		}
	}
	
	output("Her eyes are wide and lustily locked on your slit");
	if(pc.totalVaginas() > 1) output("s");
	output(". It’d take a boy, dribbling cum and begging to fuck, to distract her for how she stares. She wants the pussy, and she wants it bad. " + (isBroodmotherFuta() ? "It's taking all her willpower not to " + (lvl >= 2 ? "rest her belly on your back and start plowing into you with her big blue cock." : "bend you over and start plowing you with her big blue cock.") + " " : ""));
	
	if (lvl >= 2)
	{
		output("Rocking forward, the lizard-girl strains to plant a kiss on your mound, but her bulk drags her right back, forcing her to settle down on her fattened haunches with an annoyed wobble. <i>“...Please? I can’t reach.”</i> She looks up imploringly, tugging her " + (isBroodmotherTreated() ? "milky teats" : "nipples") + " as much for show as for her own pleasure.");
	
		output("\n\nYou ");
		if(pc.tallness < 5*12) output("step to the side and carefully climb up onto her sleeping struts. It’s the only way you’ll get your cunt at the right level with how short you both are.");
		else output("take a step closer.");
	}
	else 
	{
		if(pc.tallness < 7*12) output("She rocks forward, ");
		else output("She stands on the balls of her feet to bring her lips level with yours and rocks her head forward, ");
		
		output("planting several kisses across your mound. You feel her soft lips caress against your [pc.crotch] and her sun-colored eyes stare into yours between each kiss, imploringly, tugging her " + (isBroodmotherTreated() ? "teats" : "nipples") + " as much for teasing as for her own pleasure.");
	}
	
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
		output("\n\nAnd there’s so much [pc.girlCumNoun]. It sprays into the raskvel’s mouth and washes down her cheeks. When she draws back to breathe, it splatters across her face, to the point that she has to throw off her glasses to see. Eventually she gives up and tips her head back, stabbing her tongue into you again and again, making your pressurized pussy spurt its fragrant liquid <i>everywhere</i>: on her tits, on her swollen belly. It even creates puddles on the floor that slowly wind their way toward a well-placed drainage grate.");
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
	addLevelPoints(2);

	addButton(0,"Next",denInside);
}

public function denInside():void
{
	clearMenu();
	clearOutput();
	clearBust();
	author("HNB");
	showName("BROOD\nDEN");
	
	const EVENT_USINGSTORAGE:Number = 1;
	const EVENT_JACKING_OFF:Number = 2;
	const EVENT_FUCKING_RASKVEL:Number = 3;
	const EVENT_FUCKING_LAPINARA:Number = 4;
	
	var whatDoing:Number = flags["PREG_RASK_RETURNED_EVENT_TYPE"];
	var when:Number = flags["PREG_RASK_RETURNED_EVENT_LASTTIME"];
	
	var lvl:int = getBroodmotherLevel();
	
	if (lvl >=  5)
	{
		output("The den is large and well lit, with " + (hours > 5 && hours < 21 ? "sunlight" : "moonlight") + " streaming in from the outside. The interior is devoid of the rust you've seen on the rest of the planet. Flickering monitors line of the walls and beneath them a shiny console, ");
	
		if (flags["PREG_RASK_RETURNED_DOORLESS"] == undefined){
			flags["PREG_RASK_RETURNED_DOORLESS"] = true;
		}
	}
	else 
	{
		output("The den is large, well lit and devoid of the rust you've seen on the rest of the planet. Flickering monitors line of the walls and beneath them a shiny console, ");
	}
		
	var cap:int = getBroodmotherCumCap();
	if (cap == 1000)
	{
		output("below which lies a single bucket.\n");
	}
	else if (cap <= 5000)
	{
		output("below which several buckets are dotted about.\n");
	}
	else 
	{
		output("below which, a large array of buckets are scattered, leaving little room to sit down.\n");
	}
	
	output("Several make-shift supportive structures lie in the centre of the room, welded together from pipes from when the ship was more functional. ");
	
	if (lvl <= 3)
	{
		output("Next to them is ");
	}
	else 
	{
		output("Lying atop them is ");
	}
	
	if (pc.isBimbo() && lvl > 1) output("your short round fun buddy, ");
	if (hours < 4 || hours > 22)
	{
		output("the Raskvel Broodmother, snoring away" + (lvl <= 1 ? "." : ", resting from the days' activities."));
	}
	else if (GetGameTimestamp() < flags["PREG_RASK_RETURNED_LASTIMPREGNATED_RESTING_UNTIL"])
	{
		output("the Raskvel Broodmother, lying on her back tongue dangling idly, resting from the hellish pleasure of her childbirth.");
	}
	else
	{
		switch (lvl)
		{
			case 0:
				output("the Raskvel Broodmother, her expression a mixture of sadness and frustration. Her belly has completely flattened out and all her features that you enjoyed before completely wethered away.");
				if (flags["PREG_RASK_RETURNED_BEFORE"] == undefined)
				{
					output("\nTaking the motherhusks from her has clearly had quite the effect on her. She clearly has not been pregnant for some time and the den looks significantly less used than before too, with no cum-puddles in sight.");
					flags["PREG_RASK_RETURNED_BEFORE"] = true;
				}
				break;
			case 1:
				if (hours % (8 - lvl) == 0)
				{
					if (whatDoing == EVENT_FUCKING_RASKVEL)
					{
						output("the Raskvel Broodmother, who's getting back on the horse. Or Raskvel. She's bent over holding onto one of the pipes for support, a fellow Raskvel pouch-deep in her.");
					}
					else if (whatDoing == EVENT_FUCKING_LAPINARA)
					{
						output("the Raskvel Broodmother, who's getting back on the horse. Or Lapinara. She's bent over holding onto one of the pipes for support, as a hung bunny-girl bounces in and out of her.");
					}
					else if (whatDoing == EVENT_USINGSTORAGE)
					{
						output("the Raskvel Broodmother, legs in the air, holding a bucket over her snatch, cum drooling from the rim.");
					}
					else if (whatDoing == EVENT_JACKING_OFF)
					{
						output("the Raskvel Broodmother sitting on the ground, her curvy blue cock grasped in her hands as she teases it, pre-cum dripping from the end and a bucket grasped between her legs.");
					}
				}
				else
				{
					output("the Raskvel Broodmother, who's looking cheery compared to before. Her belly is looking slightly more rounded and her hair has regained some of its shininess. ");
				}
				break;
			case 2:
				if (hours % (8 - lvl) == 0)
				{
					if (whatDoing == EVENT_FUCKING_RASKVEL)
					{
						output("the Raskvel Broodmother. You hear her before you see her, as muffled moaning and grunting echoes throughout the room. " + ((pc.isTreated() && pc.isBimbo()) || pc.isBimbo() || pc.isBro() || pc.isDependant(Creature.DEPENDANT_CUM) || (pc.libido() >= 50 && pc.lust() >= 33) || pc.lust() > 66 ? "<i>“That's more like it!”</i>" : "<i>“She's clearly beginning to regain her libido”</i>") + " you think to yourself, as you see that she's sandwiched between two Raskvels, getting pushed to and fro between them.");
					}
					else if (whatDoing == EVENT_FUCKING_LAPINARA)
					{
						output("the Raskvel Broodmother. You hear her before you see her, as muffled moaning and grunting echoes throughout the room. " + ((pc.isTreated() && pc.isBimbo()) || pc.isBimbo() || pc.isBro() || pc.isDependant(Creature.DEPENDANT_CUM) || (pc.libido() >= 50 && pc.lust() >= 33) || pc.lust() > 66 ? "<i>“That's more like it!”</i>" : "<i>“She's clearly beginning to regain her libido”</i>") + " you think to yourself, as you see that she's sandwiched between two Lapinara, getting bounced between them.");
					}
					else if (whatDoing == EVENT_USINGSTORAGE)
					{
						output("the Raskvel Broodmother, legs in the air, holding a bucket over her snatch, cum drooling from the rim.");
					}
					else if (whatDoing == EVENT_JACKING_OFF)
					{
						output("the Raskvel Broodmother sitting on the ground, her curvy blue cock grasped in her hands as she teases it, pre-cum dripping from the end and a bucket grasped between her legs.");
					}
				}
				else
				{
					output("the Raskvel Broodmother, a lascivious expression on her face as she stares in your direction, her bulbous figure glowing.");
				}
				break;
			case 3:
				if (hours % (8 - lvl) == 0)
				{
					if (whatDoing == EVENT_FUCKING_RASKVEL)
					{
						output("the Raskvel Broodmother. You hear her before you see her, as muffled moaning and grunting echoes throughout the room, along with a variety of squelching sounds. " + ((pc.isTreated() && pc.isBimbo()) || pc.isBimbo() || pc.isBro() || pc.isDependant(Creature.DEPENDANT_CUM) || (pc.libido() >= 50 && pc.lust() >= 33) || pc.lust() > 66 ? "<i>“That's more like it!”</i>" : "<i>“She's clearly beginning to regain her libido”</i>") + " you think to yourself, as you see that she's having fun with a small gang of Raskvel underneath the supports.");
					}
					else if (whatDoing == EVENT_FUCKING_RASKVEL)
					{
						output("the Raskvel Broodmother. You hear her before you see her, as muffled moaning and grunting echoes throughout the room, along with a variety of squelching sounds. " + ((pc.isTreated() && pc.isBimbo()) || pc.isBimbo() || pc.isBro() || pc.isDependant(Creature.DEPENDANT_CUM) || (pc.libido() >= 50 && pc.lust() >= 33) || pc.lust() > 66 ? "<i>“That's more like it!”</i>" : "<i>“She's clearly beginning to regain her libido”</i>") + " you think to yourself, as you see that she's having fun with a small colony of Lapinara girls.");
					}
					else if (whatDoing == EVENT_USINGSTORAGE)
					{
						output("the Raskvel Broodmother, legs in the air, holding a bucket over her snatch, cum drooling from the rim.");
					}
					else if (whatDoing == EVENT_JACKING_OFF)
					{
						output("the Raskvel Broodmother lying on the ground, her curvy blue cock being rubbed between her hands, slapping against her belly as she teases it, pre-cum dripping from the end and a bucket grasped between her thighs.");
					}
				}
				else
				{
					output("the Raskvel Broodmother, a lascivious expression on her face as she stares in your direction, her bulbous figure glowing.");
				}
				break;
			case 4:
				if (hours % (8 - lvl) == 0)
				{
					if (whatDoing == EVENT_FUCKING_RASKVEL)
					{
						output("the Raskvel Broodmother, who's having fun with a group of Raskvel men and women, who are all barging each other, trying to get in on the action.");
					}
					if (whatDoing == EVENT_FUCKING_LAPINARA)
					{
						output("the Raskvel Broodmother, who's having fun with a colony of Lapinara, who are all fighting over her entrances.");
					}
					else if (whatDoing == EVENT_USINGSTORAGE)
					{
						output("the Raskvel Broodmother, lying upside down on her supports with her legs in the air, holding a bucket over her snatch, cum drooling from the rim.");
					}
					else if (whatDoing == EVENT_JACKING_OFF)
					{
						output("the Raskvel Broodmother lying on her back, her large blue cock being jerked by her tail, slapping against her belly as she teases it, pre-cum dripping from the end and a bucket grasped between her thighs.");
					}
				}
				else
				{
					output("the Raskvel Broodmother, pinned to her supports by her disproportionate  paunch. As she notices you looking at her, she runs the tip of her long tongue around her lips.");
				}
				break;
			case 5:
				if (hours % (8 - lvl) == 0)
				{
					if (whatDoing == EVENT_FUCKING_RASKVEL)
					{
						output("the Raskvel Broodmother, a gang of Raskvel crowded around her, competing to fuck the incapacitated Raskvel as she touches herself and begs for them.");
					}
					else if (whatDoing == EVENT_FUCKING_LAPINARA)
					{
						output("the Raskvel Broodmother, a den of Lapinara girls crowded around her, competing to fuck the incapacitated Raskvel as she touches herself and begs for their cocks.");
					}
					else if (whatDoing == EVENT_USINGSTORAGE)
					{
						output("the Raskvel Broodmother, lying upside down on her supports with her legs in the air, holding a bucket over her snatch, cum drooling from the rim.");
					}
					else if (whatDoing == EVENT_JACKING_OFF)
					{
						output("the Raskvel Broodmother lying on her back, her large blue cock being jerked by her tail, slapping against her belly as she teases it, pre-cum dripping from the end and a bucket grasped between her thighs.");
					}
				}
				else
				{
					output("the incapacitated Raskvel Broodmother, whom, as she sees you, flicks her tail around to further present you with her gaping pussy, cum oozing from it as she does.");
				}
				break;
			case 6:
				if (hours % (8 - lvl) == 0)
				{
					if (whatDoing == EVENT_FUCKING_RASKVEL)
					{
						output("the Raskvel Broodmother, a large group of various races all crowded around her, competing to fuck the incapacitated Raskvel as she touches herself and begs for them.");
					}
					else if (whatDoing == EVENT_FUCKING_LAPINARA)
					{
						output("the Raskvel Broodmother, a den of Lapinara girls crowded around her, competing to fuck the incapacitated Raskvel as she touches herself and begs for their cocks.");
					}
					else if (whatDoing == EVENT_USINGSTORAGE)
					{
						output("the Raskvel Broodmother, lying upside down on her supports with her legs in the air, holding a bucket over her snatch, cum drooling from the rim.");
					}
					else if (whatDoing == EVENT_JACKING_OFF)
					{
						output("the Raskvel Broodmother lying on her back, her large blue cock being jerked by her tail, slapping against her belly as she teases it, pre-cum dripping from the end and a bucket grasped between her thighs.");
					}
				}
				else
				{
					output("the incapacitated Raskvel Broodmother, whom, as she sees you, flicks her tail around to further present you with her gaping pussy, cum oozing from it as she does.");
				}
				break;
		}
	}
	
	//If she getting fucked and you're horny, you're jelly
	if ((hours % (8 - lvl)) == 0 && lvl != 0)
	{
		if (pc.libido() >= 70 || pc.lust() >= 50 || pc.isBimbo())
		{
			if (whatDoing == EVENT_FUCKING_LAPINARA || whatDoing == EVENT_FUCKING_RASKVEL)
			{
				if (pc.hasVaginas())
				{
					if (pc.isBimbo())
					{
						output("\nYou're totally jealous.\n");
					}
					else
					{
						output("\nIt makes you a little envious.\n");
					}
				}
				else
				{
					output("\nYou wish you were up there too!\n");
				}
			}
			else{				
				output("\nIt's quite the enticing sight to behold.\n");
			}
		}
	}
	
	if (lvl != 0)
	{
		if (lvl <= 2)
		{
			output("\nDrains line the floor beneath her, collecting any overflow from her breeding sessions.");
		}
		else if (lvl <= 4)
		{
			output("\nDrains line the floor beneath her, collecting the substantial overflow from her breeding sessions.");
		}
		else 
		{
			output("\nDrains line the floor beneath her. They're struggling to battle the excessive overflow from her frequent breeding sessions, cum from male and female genitals alike struggling to be sucked away.");
		}
	}
	
	if ((hours % (8 - lvl)) == 0 && lvl != 0)
	{
		addDisabledButton(0, "Broodmother", "She looks busy");
	}
	else if (hours < 4 || hours > 22 || GetGameTimestamp() < flags["PREG_RASK_RETURNED_LASTIMPREGNATED_RESTING_UNTIL"])
	{
		addDisabledButton(0, "Broodmother", "She's sleeping");
	}
	else
	{
		addButton(0, "Broodmother", approachBroodmother);
	}
	
	addButton(1,"Buckets",cumStorageMenu);
	
	if (getBroodmotherLevel() == 0) addDisabledButton(13, "Rest", "Probably best not to close your eyes around someone who's life you've ruined."); 
	else if (getBroodmotherFriendliness() < 20) addDisabledButton(13, "Rest", "You're not friendly enough with her yet.");
	else addButton(13, "Rest", denRest);
	
	addButton(14, "Leave", denLeave);
}

public function cumStorageMenu():void
{
	clearMenu();
	clearOutput();
	author("HNB");
	
	output("You walk over to the console and sneak a peak underneath.\n\nIgnoring the ");
	if (isBroodmotherFuta())
	{
		output("semen and ");
	}
	var count:int = getBroodmotherCumStoredVolume();
	var cap:int = getBroodmotherCumCap();
	output("juices splattered across the underside of the desk, you spot " + (cap/1000) + (cap <= 1000 ? " bucket" : " buckets") + " sitting on the floor. ");
	
	if (cap == 1000)
	{
		if (count == 0)
		{
			output("It's completely empty.");
		}
		else if (count <= 50)
		{
			output("A small pool of mixed man-goop sits in the bottom of it, contrasting against the metallic surface.");
		}
		else if (count <= 250)
		{
			output("A pool of mixed man-goop lines the bottom quarter of it.");
		}
		else if (count <= 500)
		{
			output("It's half full of dick-juice.");
		}
		else if (count <= 750)
		{
			output("Before you even near it, you can see it's almost three-quarters full of cum.");
		}
		else if (count < 1000)
		{
			output("Before you even near it, you can see it's nearly full of goopy cum from many different creatures.");
		}
		else
		{
			output("Thick cum trickles down the side of it as it's been completely filled.");
		}
	}
	else
	{
		if (count == 0)
		{
			output("They're all completely empty.");
		}
		else if (count <= (cap / 5))
		{
			output("Man-goop has been spread evenly amongst each bucket, forming small pools of different thicknesses and colors at the bottom of each.");
		}
		else if (count <= (cap / 4))
		{
			output("Man-goop has been spread evenly amongst each bucket, filling the bottom quarter of each with cum of different thicknesses and colors.");
		}
		else if (count <= (cap / 3))
		{
			output("Man-juice has been poured into each, shared evenly amongst each bucket, to the point that each is nearly half full of goop of different thicknesses and colors.");
		}
		else if (count <= (cap / 2))
		{
			output("Man-juice has been poured into each, shared evenly amongst each bucket, to the point that each is half full of goop of different thicknesses and colors.");
		}
		else if (count < (cap / 1))
		{
			output("Man-juice has been poured into each, shared evenly amongst each bucket, to the point that each is nearly filled to the brim with a goopy mixture of different thicknesses and colors.");
		}
		else 
		{
			output("Cum of different thicknesses and colors is spilling over the sides of each and every single bucket.");
		}
	}
	
	showBucketBust();
	
	if (pc.hasItemByClass(EmptyBucket))
	{
		addButton(0, "Add buckets", addBuckets);
	}
	else
	{
		addDisabledButton(0, "Add buckets", "You don't have any");
	}
	
	if (pc.hasVagina() && !pc.isPregnant() && pc.hasPerk("Breed Hungry") && getBroodmotherCumStoredVolume() > 0)
	{
		if ((hours > 4 || hours < 22) && (GetGameTimestamp() > flags["PREG_RASK_RETURNED_LASTIMPREGNATED_RESTING_UNTIL"]) && getBroodmotherFriendliness() >= 35)
		{
			addButton(0, "Use a bucket", useBucket);
		}
		else if (((hours < 4 || hours > 22) || GetGameTimestamp() < flags["PREG_RASK_RETURNED_LASTIMPREGNATED_RESTING_UNTIL"]) && pc.isMischievous())
		{
			addButton(0, "Steal a bucket", stealBucket);
		}
	}
	else 
	{
		if (!pc.hasVagina())
		{
			addDisabledButton(0, "Use a bucket", "Breed hungry" , "You need a vagina for this.");
		}
		else if ((hours < 4 || hours > 22) && !pc.isMischievous())
		{
			addDisabledButton(0, "Use a bucket", "Breed hungry" , "You feel the need to ask her first before using her cum but she's asleep.");
		}
		else if (!pc.hasPerk("Breed Hungry"))
		{
			addDisabledButton(0, "Use a bucket", "Breed hungry" , "You'd have to really like breeding to want to pour old cum into yourself.");
		}
		else if (flags["PREG_RASK_RETURNED_FRIENDLINESS"] < 35)
		{
			addDisabledButton(0, "Use a bucket", "Friendliness", "You're not friendly enough with the Broodmother for her to let you just use one of her buckets.");
		}
		else if (pc.isPregnant())
		{
			addDisabledButton(0, "Use a bucket", "Already pregnant.","You're already pregnant.");
		}
	}
	addButton(14, "Back", denInside);
}

public function useBucket():void{
	clearMenu();
	clearOutput();
	author("HNB");
	showBucketBust();
	
	var count:int = getBroodmotherCumStoredVolume();
	var cap:int = getBroodmotherCumCap();
	
	//ASSUMED HASVAGINA, FRIENDLY AND NOT PREGNANT
	output("You grab " + (cap > 1000 ? "one of the buckets" : "the bucket") + " and turn your head towards the broodmother. <i>“Hey, seeing as we're friends and all, could I have this? I just really need to get knocked up right now.”</i>\n");
	output("A knowing grin spreads across her face. <i>“Ughh, I know how you feel. All I can ever think about is pushing babies out and if that's not 'appening it drives me bonkers!”</i>. Her smile then drops as a thought crosses her mind. <i>“But if you're 'aving it, that means I can't”</i>\n");
	if (pc.isSubby())
	{
		output("<i>“Pleaaase mistress”</i> you beg. <i>“I'm certain men will come from all over to refill it within a matter of minutes. You can surely spare some for little ol' me.”</i>");
	}
	else if (pc.isBimbo())
	{
		output("<i>“Pretty pweaaase”</i> you beg. <i>I'll totes pay you back! I just want the cummies!</i>");
	}
	else if (pc.isMischievous())
	{
		output("<i>“Oh alright. I was going to go outside and find some nice big, virile men to refill it with afterwards but if you don't want that, that's fine.”</i>");
	}
	else
	{
		output("<i>“Pleeease. I can make it worth your while later” you say licking your lips.</i>");
	}
	output("\n<i>“Oh, go on then”</i> she laughs, persauded. <i>“Pour away!”</i>\n\n");
	
	output("As you hear her invitation, you place the ");
	if (count <= (cap / 5)) //Small pool
	{
		output("barely-filled");
	}
	else if (count <= (cap / 3)) //Third
	{
		output("slightly-filled");
	}
	else if (count <= (cap / 2)) //Half
	{
		output("almost half-filled");
	}
	else if (count < (cap / 1)) //Almost full
	{
		output("nearly full");
	}
	else //Full
	{
		output("filled");
	}
	output("bucket on the ground and lie down on the floor. You spread your legs apart and " + (pc.isCrotchExposed() ? "scrunch your legs up" : "open up your [pc.crotchCovers] before scrunching your legs up") + ", lifting your [pc.thighs] off the ground. You grab hold of the bucket by it's rim" + ((cap >= (count * 0.8)) ? ", your fingers plunging into the gooey jizm as you do," : "") + " before dragging it close between your legs.\n");	
	//Unless we're gaping we need to open up
	if (pc.vaginas[pc.biggestVaginaIndex()].loosenessRaw < 3.5)
	{
		output("You take your left hand off the bucket and move it to your exposed [pc.vagina " + pc.biggestVaginaIndex() + "]. With two fingers you push the lips of your pussy apart, ready to receive the buckets thick contents. You ");
	}
	else 
	{
		output("Already more than open enough for pouring, you ");
	}
	output("lift the bucket slightly on one side and tilt it towards you.\n");
	
	var amountInBucket:int = count / (cap / 1000);
	// If capacity is less then it'll get a bit spilly
	if (pc.biggestVaginalCapacity() >= amountInBucket)
	{
		if (amountInBucket <= 100)
		{
			output("The small puddle of thick white cum begins crawling down the inside of the bucket. In anticipation you press the cold metal rim against your labia and soon the collected load pours over the rim, into your waiting lower-mouth, coating the insides white as your semen-hungry snatch convulses, pulling the cum deeper in.");
		}
		else if (amountInBucket <= 250)
		{
			output("The pool of thick white cum piles up on one side of the bucket and begins its descent towards you. In anticipation you press the cold metal rim against your labia and soon the collected load nears the rim. The initial portion pours over in a small steady stream, the thick load pouring deep into the center of your awaiting receptacle. Your semen-hungry snatch convulses, pulling the cum deeper in as a higher volume joins it, the cum now tipping over the side in a heavy stream like a waterfall before cutting out.");
		}
		else 
		{
			output("The heavy lake of thick white cum piles up on one side of the bucket and quickly begins sliding down the side. You quickly press the cold metal rim against your labia, ready to receive the large incoming load. The initial portion pours over the rim in a fat wave, coating your labia in a wave of cum with a large amount dropping into your awaiting baby-hole which convulses in response, pulling the cum deeper in. Wave after wave drops out, dollops of cum slapping against cum as they pour into your pussy with a splashing sound, your cervix trying it's best to let it all through. The white waves slowly thin and stop, a small stream pouring in as the levels in your hole slowly drain.");
		}
	}
	else
	{
		if (amountInBucket <= 100)
		{
			output("The small puddle of thick white cum begins crawling down the inside of the bucket. In anticipation you press the cold metal rim against your labia and soon the collected load pours over the rim, flooding your tiny snatch with cum, a small amount trickling out coating your labia.");
		}
		else if (amountInBucket <= 250)
		{
			output("The pool of thick white cum piles up on one side of the bucket and begins its descent towards you. In anticipation you press the cold metal rim against your labia and soon the collected load nears the rim. The initial portion pours over in a small steady stream, the thick load pouring deep into the center of your awaiting receptacle. Your semen-hungry snatch convulses, pulling the cum deeper in. The volume of cum pouring out increases, now tipping over the side in a heavy stream like a waterfall and your pussy can't take it in fast enough. Cum layers on top of your entrance and overflows, coating your [pc.crotch] white and sliding between your buttocks. You find yourself lying there, empty bucket in hand, a pool of cum between your legs.");
		}
		else 
		{
			output("The heavy lake of thick white cum piles up on one side of the bucket and quickly begins sliding down the side. You quickly press the cold metal rim against your labia, ready to receive the large incoming load. The initial portion pours over the rim in a fat wave, coating your labia in a wave of cum with a large amount dropping into your awaiting baby-hole which convulses in response, pulling the cum deeper in. Wave after wave drops out, dollops of cum slapping against cum as they pour into your pussy with a splashing sound, your cervix trying it's best to let it all through. But it can't and soon with nowhere to go, the cum-waves splash against your cum-pool of a pussy and go everywhere. They splash against your [pc.belly]. They pour out, covering your labia white. They pour down between your legs and into your buttcrack. They coat your [pc.thighs]. Wave after wave comes until you find yourself covered under the stuff from the waste down, holding an empty bucket in the air.");
		}
	}
	
	//Try knock up. We haven't got any function that takes vol into account, so we'll just roll once and then once more for every 250
	dumpStoredCum(amountInBucket);
	var numberOfLoads:int = 1 + (Math.floor(amountInBucket / 250));
	for (var i:int = 0; i < numberOfLoads; i++)
	{
		var creatureCum:int = rand(1);
		switch (creatureCum)
		{
			case 0:
				pc.loadInCunt(chars["RASKVEL_MALE"],pc.vaginas[pc.biggestVaginaIndex()]);
				break;
			case 1:
				pc.loadInCunt(chars["LAPINARA_FEMALE"],pc.vaginas[pc.biggestVaginaIndex()]);
				break;
		}
	}
	addButton(0, "Next", cumStorageMenu);
}

public function stealBucket():void{
	clearMenu();
	clearOutput();
	author("HNB");
	showBucketBust();
	
	var count:int = getBroodmotherCumStoredVolume();
	var cap:int = getBroodmotherCumCap();
	
	var success:Boolean = false;
	if ((15 - pc.reflexes()) <= 0)
	{
		success = true;
	}
	else 
	{
		success = (rand(15 - pc.reflexes()) == 0);
	}
	
	if (success)
	{
		output("You go to grab " + (cap > 1000 ? "one of the buckets" : "the bucket") + " and turn your head towards the broodmother.\n\n");
		
		output("She doesn't seem to have heard you. Comfortable with the fact you're not going to get caught, you place the ");
		if (count <= (cap / 5)) //Small pool
		{
			output("barely-filled");
		}
		else if (count <= (cap / 3)) //Third
		{
			output("slightly-filled");
		}
		else if (count <= (cap / 2)) //Half
		{
			output("almost half-filled");
		}
		else if (count < (cap / 1)) //Almost full
		{
			output("nearly full");
		}
		else //Full
		{
			output("filled");
		}
		output("bucket on the ground and lie down on the floor. You spread your legs apart and " + (pc.isCrotchExposed() ? "scrunch your legs up" : "open up your [pc.crotchCovers] before scrunching your legs up") + ", lifting your [pc.thighs] off the ground. You grab hold of the bucket by it's rim" + ((cap >= (count * 0.8)) ? ", your fingers plunging into the gooey jizm as you do," : "") + " before dragging it close between your legs.\n");	
		//Unless we're gaping we need to open up
		if (pc.vaginas[pc.biggestVaginaIndex()].loosenessRaw < 3.5)
		{
			output("You take your left hand off the bucket and move it to your exposed [pc.vagina " + pc.biggestVaginaIndex() + "]. With two fingers you push the lips of your pussy apart, ready to recieve the buckets thick contents. You ");
		}
		else 
		{
			output("Already more than loose enough for pouring, you ");
		}
		output("lift the bucket slightly on one side and tilt it towards you.\n");
		
		var amountInBucket:int = count / (cap / 1000);
		// If capacity is less then it'll get a bit spilly
		if (pc.biggestVaginalCapacity() >= amountInBucket)
		{
			if (amountInBucket <= 100)
			{
				output("The small puddle of thick white cum begins crawling down the inside of the bucket. In anticipation you press the cold metal rim against your labia and soon the collected load pours over the rim, into your waiting lower-mouth, coating the insides white as your semen-hungry snatch convulses, pulling the cum deeper in.");
			}
			else if (amountInBucket <= 250)
			{
				output("The pool of thick white cum piles up on one side of the bucket and begins its descent towards you. In anticipation you press the cold metal rim against your labia and soon the collected load nears the rim. The initial portion pours over in a small steady stream, the thick load pouring deep into the center of your awaiting recepticle. Your semen-hungry snatch convulses, pulling the cum deeper in as a higher volume joins it, the cum now tipping over the side in a heavy stream like a waterfall before cutting out.");
			}
			else 
			{
				output("The heavy lake of thick white cum piles up on one side of the bucket and quickly begins sliding down the side. You quickly press the cold metal rim against your labia, ready to recieve the large incoming load. The initial portion pours over the rim in a fat wave, coating your labia in a wave of cum with a large amount dropping into your awaiting baby-hole which convulses in response, pulling the cum deeper in. Wave after wave drops out, dollops of cum slapping against cum as they pour into your pussy with a splashing sound, your cervix trying it's best to let it all through. The white waves slowly thin and stop, a small stream pouring in as the levels in your hole slowly drain.");
			}
		}
		else
		{
			if (amountInBucket <= 100)
			{
				output("The small puddle of thick white cum begins crawling down the inside of the bucket. In anticipation you press the cold metal rim against your labia and soon the collected load pours over the rim, flooding your tiny snatch with cum, a small amount trickling out coating your labia.");
			}
			else if (amountInBucket <= 250)
			{
				output("The pool of thick white cum piles up on one side of the bucket and begins its descent towards you. In anticipation you press the cold metal rim against your labia and soon the collected load nears the rim. The initial portion pours over in a small steady stream, the thick load pouring deep into the center of your awaiting recepticle. Your semen-hungry snatch convulses, pulling the cum deeper in. The volume of cum pouring out increases, now tipping over the side in a heavy stream like a waterfall and your pussy can't take it in fast enough. Cum layers on top of your entrance and overflows, coating your [pc.crotch] white and sliding between your buttocks. You find yourself lying there, empty bucket in hand, a pool of cum between your legs.");
			}
			else 
			{
				output("The heavy lake of thick white cum piles up on one side of the bucket and quickly begins sliding down the side. You quickly press the cold metal rim against your labia, ready to recieve the large incoming load. The initial portion pours over the rim in a fat wave, coating your labia in a wave of cum with a large amount dropping into your awaiting baby-hole which convulses in response, pulling the cum deeper in. Wave after wave drops out, dollops of cum slapping against cum as they pour into your pussy with a splashing sound, your cervix trying it's best to let it all through. But it can't and soon with nowhere to go, the cum-waves splash against your cum-pool of a pussy and go everywhere. They splash against your [pc.belly]. They pour out, covering your labia white. They pour down between your legs and into your buttcrack. They coat your [pc.thighs]. Wave after wave comes until you find yourself covered under the stuff from the waste down, holding an empty bucket in the air.");
			}
		}
		
		//Try knock up. We haven't got any function that takes vol into account, so we'll just roll once and then once more for every 250
		dumpStoredCum(amountInBucket);
		var numberOfLoads:int = 1 + (Math.floor(amountInBucket / 250));
		for (var i:int = 0; i < numberOfLoads; i++)
		{
			var creatureCum:int = rand(1);
			switch (creatureCum)
			{
				case 0:
					pc.loadInCunt(chars["RASKVEL_MALE"],pc.vaginas[pc.biggestVaginaIndex()]);
					break;
				case 1:
					pc.loadInCunt(chars["LAPINARA_FEMALE"],pc.vaginas[pc.biggestVaginaIndex()]);
					break;
			}
		}
	}
	else 
	{
		output("You go to grab " + (cap > 1000 ? "one of the buckets" : "the bucket") + ". As you shift it, it scrapes against the ground and the sound echoes throughout the room.\n\n");
		output("<i>“Oy!”</i> a grumpy sounding voice shouts from behind you. You turn your head over your shoulder to face the broodmother, staring at you angrily, feathers dropped across her half closed eyes. <i>“Put. That. Down.”</i>");
		output("\nYou drop the bucket in place and as you do her eyes close again.");
		if (flags["PREG_RASK_RETURNED_FRIENDLINESS"] < 5)
		{
			flags["PREG_RASK_RETURNED_FRIENDLINESS"] = 0;
		}
		else 
		{
			flags["PREG_RASK_RETURNED_FRIENDLINESS"] -= 5;
		}
	}
	addButton(0, "Next", cumStorageMenu);
}

public function showBucketBust():void{
	var count:int = getBroodmotherCumStoredVolume();
	var cap:int = getBroodmotherCumCap();
	
	if (cap == 1000)
	{
		if (count < (cap * 0.75))
		{
			showBust("CUMBUCKET_1_1");
		}
		else if (count < cap)
		{
			showBust("CUMBUCKET_1_2");
		}
		else 
		{
			showBust("CUMBUCKET_1_3");
		}
	}
	else
	{
		if (count < (cap * 0.75))
		{
			showBust("CUMBUCKET_2_1");
		}
		else if (count < cap)
		{
			showBust("CUMBUCKET_2_2");
		}
		else 
		{
			showBust("CUMBUCKET_2_3");
		}
	}
}

public function denRest():void
{
	clearMenu();
	clearOutput();
	author("HNB");
	
	if (pc.hasStatusEffect("Bulky Belly"))
	{
		output("Taking inspiration from the broodmother, you clamber atop another of the rooms supportive structures and lie face forward. As you rest your [pc.belly] between two of the beams, a wave of relaxation comes over you and you quickly fall asleep.");
	}
	else
	{
		output("You walk over to some sofas that sit on one side of the cavernous room and lie down on one. As your body touches the soft material, a wave of relaxation washes over you and you quickly fall asleep.");
	}
	
	addButton(0, "Next", denRestEnd);
}

public function denRestEnd():void
{
	clearMenu();
	author("HNB");
	
	sleepHeal();
	if (pc.hasStatusEffect("Bulky Belly") && getBroodmotherLevel() >= 2 && rand(3) == 0)
	{
		output("\n\nYour eyes jerk open as you feel <b>someone rubbing your [pc.belly]!</b>");
		addButton(0, "Next", denRestMistaken);
		
		processTime(2*60);
	}
	else
	{
		output("\n\nYour eyes flutter open and you " + (pc.hasStatusEffect("Bulky Belly") ? "clamber down from the supports." : "get up from the sofa."));
		addButton(0, "Next", denInside);
		
		processTime(7*60);
	}
}

public function denRestMistaken():void
{
	clearMenu();
	clearOutput();
	showBust("RASKVEL_GANG_NUDE");
	showName("RASKVEL\nGANG");
	author("HNB");
	
	var consent:Boolean = false;
	var stretched:Boolean = false;
	var cummed:Number = pc.cumQ(); //for futa
	
	output("You twist your head to see 3 Raskvel standing in front of you, two with their retractable cocks unsheathed in their hands and their hung leader massaging your [pc.belly]. <i>“Hey”</i> he says in a deep voice. <i>“You're who we're here for right?”</i>\n");
	var isSlut:Boolean = (pc.isTreated() || pc.isBimbo() || pc.isDependant(Creature.DEPENDANT_CUM) || (pc.libido() >= 50 && pc.lust() >= 33) || pc.lust() > 66);
	if (isSlut) //If there's any reason to do this
	{
		output(pc.isBimbo() ? "<i>“Of course”</i> you giggle, wiggling your [pc.hips] in anticipation." : "<i>“Mmmmhmmm”</i> you moan back.");
		consent = true;
	}
	else
	{
		output("<i>“Huh? No, I'm just resting here!”</i> you protest as you try to get off the supports but the two smaller Raskvel pull out some rope and quickly bind you to the frame. <i>“That's a shame”</i> the leader says with a smirk, <i>“But we're feeling quite pent up now we're here.”</i>");
	}
	
	output("\nOne of the raskvel runs his hands along your " + (consent ? "" : "rope bound") + "[pc.hips] whilst another grabs your [pc.ass]. The larger one strokes your cheek" + (consent ? " as he looks into your eyes and runs his fingers around your [pc.nipples]." : " in an effort to calm you before moving his hands down to play with your [pc.nipples]."));
	
	if (consent)
	{
		output("<i>“Ooh, that feels good guys”</i> you moan <i>“but why don't we move things forward.”</i>");
	}
	else
	{
		if (pc.isBro())
		{
			output("You fight again your bindings but they won't budge. <i>“Fuck you guys! When I get out of here, you're all dead!”</i> you shout, breathing heavily as you begin to lose your energy from battling the restraints.");
		}
		else if (pc.isMischievous())
		{
			output("You fight again your bindings but they won't budge. <i>“Hey come on now, let me go and maybe I can help you guys”</i> you plead, breathing heavily as you begin to lose your energy from battling the restraints.");
		}
		else
		{
			output("You fight again your bindings but to no avail. <i>“Please, I'm not like her!”</i> you plead, breathing heavily as you begin to lose your energy from battling the restraints.");
		}
	}
	
	output("\nAt this they begin to step it up a notch. ");
	
	if (!pc.isNude())
	{
		if (consent) output("They hurriedly tear off your [pc.gear] with your help and soon your naked body is ready for them. ");
		else output("They forcefully tear off your [pc.gear], tossing each garment to the floor. ");
		pc.removeAll();
	}
	
	output("The one at the back slips his hand down ");
	if (pc.hasVagina())
	{
		output("from your [pc.ass] to your crotch and thrusts ");
		if (pc.biggestVaginalCapacity() < 400){
			output("two fingers into your " + pc.vaginaDescript(pc.biggestVaginaIndex()) + ", teasing your insides.");
		}
		else if (pc.biggestVaginalCapacity() < 600){
			output("his fist into your " + pc.vaginaDescript(pc.biggestVaginaIndex()) + ", filling up your insides.");
		}
		else{
			output("his forearm into your " + pc.vaginaDescript(pc.biggestVaginaIndex()) + ", stirring up your insides.");
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
			output("several fingers into your [pc.asshole], it spasming as he does.");
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
			output(" and begins sucking from your " + pc.nippleDescript(pc.biggestTitRow()));
		}
		else
		{
			output(" and begins licking your " + pc.nippleDescript(pc.biggestTitRow()));
		}
	}
	else if (pc.hasNipples())
	{
		output(" and begins licking your [pc.nipples]");
	}
	else  
	{
		output(" and begins running his tongue along your [pc.chest]");
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
		output(" by grabbing " + (pc.hasHair() ? "hold of your [pc.hair]" : "hold of your head") + " and jaw , forcing your [pc.lips] open and shoving his enraged purple cock in and out of your wet mouth, slapping your reddening cheeks between repetitions, saliva running down your [pc.face].");
	}
	output("\n");
	
	if (consent){
		output("It seems like two of them are ready to go, but the one "); 
		if (pc.hasTits())
		{
			if (pc.isLactating())
			{
				output(" sucking at your nipples");
			}
			else
			{
				output(" licking your nipples");
			}
		}
		else if (pc.hasNipples())
		{
			output("licking your nipples");
		}
		else  
		{
			output(" tonguing your chest");
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
		if (pc.biggestVaginalCapacity() >= 400)
		{
			output(" With your pussy more than well equipped to accommodate him, his forearm sized raskvel cock thrusts deep into your cavernous fuck-hole, tip slamming against your cervix.");
		}
		else
		{
			output(" With two fingers he stretches your pussy open and then pushes his cock slowly deeper and deeper into you,");
			if (!consent) output(" the walls of your insides fighting a battle against his girth but to no avail"); 
			else output(" the walls of your pussy widening to accommodate him until he's at his depth"); 
			output(", where he begins pulling slightly back out before fucking you, his forearm sized raskvel cock slamming against your cervix.");
			
			if (pc.vaginas[pc.biggestVaginaIndex()].looseness() < 3)
			{
				pc.vaginas[pc.biggestVaginaIndex()].looseness(3);
			}
			pc.vaginas[pc.biggestVaginaIndex()].capacity = 400;
			stretched = true;
		}
	}
	else
	{
		output("behind.");
		if (pc.ass.looseness() >= 3)
		{
			output("Already wide, he buries his cock in your [pc.asshole] and begins thrusting deep into it with his forearm sized raskvel cock.");
		}
		else
		{
			output("With two fingers he stretches your [pc.asshole] open and then thrusts his cock deep into it,");
			if (!consent) output(" the walls of your ass fighting a battle against his girth but to no avail"); 
			else output(" the walls of your ass widening to accommodate him until he's at his depth"); 
			output(", where he begins pulling slightly back out before fucking you, with his forearm sized raskvel cock.");
			
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
		output("grabs " + (pc.hasHair() ? "hold of your [pc.hair]" : "hold of your head") + ", lifting your head so your lips meet his meat before grabbing hold of your jaw, snapping it open, before forcing his fat, purple cock deep into your agape mouth.");
	}
	output("\n");
	
	//Butthole's free, vag in use
	if (pc.hasVagina())
	{
		if (consent)
		{
			output("The third, now ready to go, grabs hold of a side of your [pc.belly] and hoists himself up on top of you. You feel his feet shuffling about on top of you before he kneels on your lower back. You angle your posterior slightly and the raskvel pulls apart your [pc.buttcheeks] and thrusts his dick into your ");
			if (pc.ass.looseness() > 2) output("inviting ");
			output("backdoor, it tightening around his member as he hits depth.");
		}
		else
		{
			output("The third, grabs hold of a side of your rope-wrapped [pc.belly] and hoists himself up on top of you. You feel his feet press into you before his knees dig into your lower back like knives. He spreads apart your [pc.buttcheeks] and you feel his cock thrust through your ");
			output("backdoor. You try to kick him off but your legs have been hogtied and all you manage to do is help him thrust deeper.");
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
			output("The third stops slathering his saliva across your [pc.chest] but his eyes stay fixated on your body, as he starts jerking himself off to your struggle against his brethren.");
		}
	}
	
	output("\nYou breath fiercely through your nose, " + (consent ? "as things get more intense - the bulging cocks pound you with increasing speed and the big earthy one slides along your tongue, pushing against the the bottom of your mouth." : "struggling to breath between the intensity with which their sand-covered cocks assault you. The cock in your mouth blocks your airway with no respite between assaults."));
	
	if (pc.hasVagina())
	{
		if (consent){
			output(" The biggest one, " + (stretched ? "having stretched out your insides like a balloon" : "having slid into your accommodating fuck-hole") + ", has been pounding away, his bulging Raskvel cum-pouch slapping against your thighs. <i>“Mmmm, fuck yeah”</i> you moan, feeling the warmth of his rock-hard fuck-rod " + (stretched ? ("pushing against the walls of your " + pc.vaginaDescript(pc.biggestVaginaIndex()))  : (" pushing fast and hard into your " + pc.vaginaDescript(pc.biggestVaginaIndex()))) + ".");
		}
		else{
			output(" The biggest one, " + (stretched ? "having stretched you to his size like a fresh condom, has been slamming his boiling, rock-hard dick into you with force, it burning against the walls of your insides," : "has been slamming his boiling, rock hard cock into you with force, it pounding deep into you with each thrust,") + " his heavy seed-pouch slamming into the back of you with each thrust.");
		}
	}
	else
	{
		if (consent){
			output(" The biggest one, " + (stretched ? "having stretched out the inside of your ass like a balloon" : "having penetrated your accommodating butt-hole") + ", has been pounding away, his bulging Raskvel cum-pouch slapping against your buttocks. <i>“Mmmm, fuck yeah”</i> you moan, feeling the warmth of his rock-hard fuck-rod " + (stretched ? "pushing against the walls of your ass" : "brushing against your asshole") + ".");
		}
		else{
			output(" The biggest one, " + (stretched ? "having stretched you to his size like a fresh condom, has been slamming his boiling, rock-hard dick into you with force, it burning against the walls of your insides," : "has been slamming his boiling, rock hard cock into you with force, ") + " his heavy seed-pouch slamming into the back of you with each thrust.");
		}
	}
	
	if (pc.hasVagina())
	{
		if (consent){
			output(" The third one kneels atop you , pounding away, his pouch slapping your behind lightly as he moans <i>“Mmmm, so tight”</i>, his curvy fuck-rod travelling in and out of your anal canal, building and releasing pressure on each thrust as his cock brushing against your butthole.");
		}
		else{
			output(" The third one's knees have been digging into your back as he kneels on top of you. <i>“Mmmm, so tight”</i> he laughs whilst his rock hard cock shoves in and out of your asshole, pressure building inside you as he refuses to give your ass any time to breath.");
		}
	}
	else
	{
		if (consent){
			output(" The third one's thick veiny cock is now burning in your hand, throbbing as you slide your hand along it. <i>“Ooah, you're so good”</i> he gasps , his cock just about ready to burst.");
		}
		else{
			output(" <i>“Mmmm, keep fucking this cumdump”</i> the third one moans, watching you get knocked back and forth by his brethren whilst he beats his reddening, veiny cock to what's unfolding.");
		}
	}
	
	output("\nTheir movements get faster and their cocks bigger. The ");
	
	if (consent) output("pleasure you feel from their cocks being buried in your "); 
	else output("pressure you feel from their cocks being buried in your "); 
	
	output("orrifices is overwhelming");
	if (pc.hasCock())
	{
		if (!consent)
		{
			output(". Even though you were initially hating every minute of it"); 
			
		}
		output(", your cock is about to burst from all the fucking they're giving you.");	
	}
	else{
		if (!consent)
		{
			output(". Even though you were very against their assault"); 
			
		}
		output(", they've started to feel pretty good, their cocks stimulating your insides to the point where you feel close to the edge.");	
	}
	
	output(" But seemingly you're pretty overwhelming too.");
	if (consent)
	{
		if (pc.hasVagina())
		{
			output("You feel the boiling dicks in your fuck-holes stiffen and throb against each other through the thin wall between your backdoor and asshole. <i>“Mmm come on boys, fill me up!”</i> you cackle as with each pulsation cum flys from their cocks, shooting against your insides, flooding deeper and deeper into you.");
			output("As they do this, the Raskvel at your front lets out a long moan and his milky cum fires against the back of your throat, flooding your airways, your nose filled with the scent of his cum inside you.");
		}
		else
		{
			output("You feel the boiling dick in your fuck-hole stiffen and throb against the walls, with each pulsation firing hot cum into the walls of your rectum, filling you with raskvel cum.");
			output("As this happens, the Raskvel at your front lets out a long moan and his milky cum fires against the back of your throat, flooding your airways, your nose filled with the scent of his cum inside you.");
			output("The reddened, pre-cum tipped, veiny dick in your hand, finally erupts and fires its hot bounty all over your saliva-drenched face and [pc.chest].");
		}
		
		output("\nContent, you roll onto your back and smile. You swallow the last of the load in your mouth, licking your lips as you do so. <i>“Mmm that was great boys. I hope you come back soon”</i>. <i>“Mmm, we will”</i> the Raskval respond, cocks wiggling and dripping cum as they scurry out the door.");	
		if (flags["PREG_RASK_RETURNED_RASKGANG_CONSENT"] == undefined) flags["PREG_RASK_RETURNED_RASKGANG_CONSENT"] = true;
	}
	else
	{
		if (pc.hasVagina())
		{
			output("You feel the boiling dicks in your passages stiffen and thump against each other through the thin wall between your backdoor and asshole and with each pulsation cum shoots against your insides, flooding you with their unwanted cum.");
			output("As they do this, the Raskvel at your front lets out a long moan and says <i>“Ooh, I hope you're ready for my cum”</i>. As you squeal in protest, his salty load fires against the back of your throat, blocking your airways, your nose filled with his scent");
		}
		else
		{
			output("You feel the boiling dick in your ass stiffen and thump against the walls, with each pulsation firing against your insides, filling you with unwanted raskvel cum.");
			output("As this happens, the Raskvel at your front lets out a long moan and says <i>“Ooh, I hope you're ready for my cum”</i>. As you squeal in protest, his salty load fires against the back of your throat, blocking your airways, your nose filled with his scent");
			output("As you protest and squeal, the third Raskvel fires his hot load, covering your red spit-covered face and chest.");
		}
		
		output("\nHaving forced themselves upon you to completion, the raskvel gangbangers scamper off out the door, laughing, leaving you tied, demeaned and full of their cum.");
		if (flags["PREG_RASK_RETURNED_RASKGANG_CONSENT"] == undefined) flags["PREG_RASK_RETURNED_RASKGANG_CONSENT"] = false;
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
	
	if (consent){addButton(0, "Next", mainGameMenu);}
	else{addButton(0, "Next", denRestMistaken_Untie);}
}

public function denRestMistaken_Untie():void
{
	processTime(40);
	clearMenu();
	clearOutput();
	showPregRaskReturn();
	author("HNB");
	
	var lvl:int = getBroodmotherLevel();
	
	output("After 40 minutes of waiting the Broodmother shoots awake from her slumber and notices you tied up. She " + (lvl <= 3 ? "waddles" : "rolls") + " over and cackles <i>“Ahaha, looks like you got my wakeup call instead. It's a shame but seeing you like this makes it worth it”</i> before freeing you from your binds.");
	addButton(0, "Next", mainGameMenu);
}

//--Entering, exiting and helper methods--------------------------------

public function denEntryAvailable():Boolean
{
	if (flags["AZRA_TARKUSED"] == undefined || flags["AZRA_TARKUS_SKIP"])
	{
		return false;
	}
	return true;
}

public function getLastImpregnated():int
{
	return flags["PREG_RASK_RETURNED_LASTIMPREGNATED"];
}

public function setupBroodmother():void
{
	if (flags["PREG_RASK_RETURNED"] == undefined)
	{
		flags["PREG_RASK_RETURNED"] = true;
	}
	if (flags["PREG_RASK_RETURNED_LVLPOINTS"] == undefined)
	{
		flags["PREG_RASK_RETURNED_LVLPOINTS"] = 0;
	}
	if (flags["PREG_RASK_RETURNED_BODYTYPE"] == undefined)
	{
		flags["PREG_RASK_RETURNED_BODYTYPE"] = []; // Can add FUTA, TREATED
	}
	if (flags["PREG_RASK_RETURNED_LASTIMPREGNATED"] == undefined)
	{
		flags["PREG_RASK_RETURNED_LASTIMPREGNATED"] = 0;
	}
	if (flags["PREG_RASK_RETURNED_ISPREGNANT"] == undefined)
	{
		flags["PREG_RASK_RETURNED_ISPREGNANT"] = false;
	}
	if (flags["PREG_RASK_RETURNED_LASTIMPREGNATED_YOURS"] == undefined)
	{
		flags["PREG_RASK_RETURNED_LASTIMPREGNATED_YOURS"] = false;
	}
	if (flags["PREG_RASK_RETURNED_LASTIMPREGNATED_CHILDREN"] == undefined)
	{
		flags["PREG_RASK_RETURNED_LASTIMPREGNATED_CHILDREN"] = 0;
	}
	if (flags["PREG_RASK_RETURNED_LASTIMPREGNATED_RESTING_UNTIL"] == undefined)
	{
		flags["PREG_RASK_RETURNED_LASTIMPREGNATED_RESTING_UNTIL"] = 0;
	}
	if (flags["PREG_RASK_RETURNED_LASTMILKED"] == undefined)
	{
		flags["PREG_RASK_RETURNED_LASTMILKED"] = 0;
	}
	if (flags["PREG_RASK_RETURNED_HAVEIMPREGNATED"] == undefined)
	{
		flags["PREG_RASK_RETURNED_HAVEIMPREGNATED"] = false;
	}
	if (flags["PREG_RASK_RETURNED_FRIENDLINESS"] == undefined)
	{
		flags["PREG_RASK_RETURNED_FRIENDLINESS"] = 0;
	}
	if (flags["PREG_RASK_RETURNED_BABIES"] == undefined)
	{
		flags["PREG_RASK_RETURNED_BABIES"] = 0;
	}
	if (flags["PREG_RASK_RETURNED_NURSEBABIES"] == undefined)
	{
		flags["PREG_RASK_RETURNED_NURSEBABIES"] = false;
	}
	if (flags["PREG_RASK_RETURNED_CUMSTORAGE"] == undefined)
	{
		flags["PREG_RASK_RETURNED_CUMSTORAGE"] = new Array();
	}
	if (flags["PREG_RASK_RETURNED_CUMSTORAGE_VOLUMECAP"] == undefined)
	{
		flags["PREG_RASK_RETURNED_CUMSTORAGE_VOLUMECAP"] = 1000;
	}
	if (flags["PREG_RASK_RETURNED_EVENT_LASTTIME"] == undefined)
	{
		flags["PREG_RASK_RETURNED_EVENT_LASTTIME"] = 0;
	}
	if (flags["PREG_RASK_RETURNED_EVENT_TYPE"] == undefined)
	{
		flags["PREG_RASK_RETURNED_EVENT_TYPE"] = 0;
	}
	if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY"] == undefined)
	{
		flags["PREG_RASK_RETURNED_DRESSUP_FANTASY"] = 0;
	}
	if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"] == undefined)
	{
		flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"] = null;
	}
	if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_SEEN_REPAIR_RASKVEL"] == undefined)
	{
		flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_SEEN_REPAIR_RASKVEL"] = false;
	}
	chars["RASKVEL_BROODMOTHER"] = new RaskvelBroodmother();
}

public function getBroodmotherFriendliness():int 
{
	return flags["PREG_RASK_RETURNED_FRIENDLINESS"];
}

public function getBroodmotherLevel():int
{
	// If she hasn't been fixed through a motherhusk or dick
	var lvl:int = Math.floor(flags["PREG_RASK_RETURNED_LVLPOINTS"] / 20);
	if (lvl > 6) //If above what we've programmed for, return maxlvl
	{
		lvl = 6;
	}
	else 
	{
		if (lvl < 4 && flags["PREG_RASK_RETURNED_ISPREGNANT"] && (flags["PREG_RASK_RETURNED_LASTIMPREGNATED"] < (int(kGAMECLASS.GetGameTimestamp() - (60 * 24))))) //Have her grow 1 lvl from pregnancy temporarily if it's been a day since pregnant
		{
			lvl += 1;
		}
	}
	return lvl;
}

public function addLevelPoints(points:int):void 
{
	flags["PREG_RASK_RETURNED_LVLPOINTS"] += points;
	
	//Check for creature file. If we're in dev, we might not have it
	var bm:RaskvelBroodmother = kGAMECLASS.chars["RASKVEL_BROODMOTHER"];
	if (bm == null){
		chars["RASKVEL_BROODMOTHER"] = new RaskvelBroodmother();
		bm = kGAMECLASS.chars["RASKVEL_BROODMOTHER"];
	}
	
	//Update config with new lvl
	var lvl:int = getBroodmotherLevel();	
	bm.configLevel(lvl);
	if (isBroodmotherFuta()) bm.configFuta(lvl);
	if (isBroodmotherTreated()) bm.configTreated(lvl);
}

public function impregnateBroodmother(players:Boolean, cumQ:int):Boolean
{
	addLevelPoints(4);
	
	if ((getLastImpregnated() < (int(GetGameTimestamp() / 1440) - 4)))
	{
		var chance:int;
		var maxBabies:int;
		var minBabies:int;
		
		if (cumQ < 5)
		{
			chance = 100; //1 in 100
			maxBabies = 1;
			minBabies = 3;
		}
		else if (cumQ < 50)
		{
			chance = 20; //1 in 20
			maxBabies = 1;
			minBabies = 3;
		}
		else if (cumQ < 200)
		{
			chance = 8; //1 in 8
			maxBabies = 2;
			minBabies = 3;
		}
		else if (cumQ < 1000)
		{
			chance = 3; //1 in 3
			maxBabies = 6;
			minBabies = 3;
		}
		else if (cumQ < 3000)
		{
			chance = 1; //1 in 1
			maxBabies = 10;
			minBabies = 5;
		}
		else
		{
			chance = 1; //1 in 1
			maxBabies = 10;
			minBabies = 10;
		}
		
		if (rand(chance) == 0)
		{
			flags["PREG_RASK_RETURNED_LASTIMPREGNATED"] = int(GetGameTimestamp() / 1440);
			flags["PREG_RASK_RETURNED_LASTIMPREGNATED_YOURS"] = players;
			flags["PREG_RASK_RETURNED_LASTIMPREGNATED_CHILDREN"] = (Math.floor(Math.random() * (maxBabies - minBabies + 1)) + minBabies);
			if (flags["PREG_RASK_RETURNED_HAVEIMPREGNATED"] == false)
			{
				flags["PREG_RASK_RETURNED_HAVEIMPREGNATED"] = true;
			}
			flags["PREG_RASK_RETURNED_ISPREGNANT"] = true;
			return true;
		}
		else
		{
			return false;
		}
	}
	else 
	{
		var cumStored:int = getBroodmotherCumStoredVolume();
		var cap:int = getBroodmotherCumCap();
		// Let her store it if she's got enough volume left
		if (cumStored < cap)
		{
			var cumMap:Object = new Object();
			if (cumStored + cumQ >= cap)
			{
				cumMap.players = players;
				cumMap.cumQ = (cap - cumStored);
				flags["PREG_RASK_RETURNED_CUMSTORAGE"].push(cumMap);
			}
			else
			{
				cumMap.players = players;
				cumMap.cumQ = cumQ;
				flags["PREG_RASK_RETURNED_CUMSTORAGE"].push(cumMap);
			}
		}
		return false;
	}
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
	author("HNB");
	if (denEntryAvailable())
	{
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
	author("HNB");

	var lvl:int = getBroodmotherLevel();
	
	output("You approach the glowing breen button and hold it down.\n");
	
	if (hours <= 4 || hours >= 22 || (lvl != 0 && ((hours % (8 - lvl)) == 0)) || (flags["PREG_RASK_RETURNED_LASTIMPREGNATED_RESTING_UNTIL"] > GetGameTimestamp())) 
	{
		output("You announce yourself and wait. But there's no response.");
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		if (flags["PREG_RASK_RETURNED_BEFORE"] == undefined)
		{
			setupBroodmother();
			
			if (flags["PREG_RASK_GUARD_RESULT"] == 3 && pc.isBimbo())
			{
				output("<i>“Heyyy, it's Miss Superpuss”</i> you shout excitedly into the intercom, recalling when you and your bestie Azra met the Broodmother when looking for those sweet sweet Motherhusks.\n");
			}
			else
			{
				output("<i>“Hi, it's " + pc.mf("Mr.","Ms.") + " Steele”</i>, you announce to the intercom, recalling when you last left here with Azra.\n");
			}
			
			output("<i>“Oh! It's you!”</i>, a voice angrily shouts from the intercom. <i>“Come in if you must but I wont forgive you for what you've taken from me." + (flags["RASKDOOR_BROKE"] == 1 ? " Just move past the door and put it back afterwards - I could do without the sunlight.”</i>\nAs the intercom cuts out you shift the broken security door out of the way, step into the den and slide the door back across the entrance." : "”</i> As the intercom cuts out the door opens inviting you in. You step in and the door slides shut behind you, sealing all natural light out of the room."));
		}
		else
		{			
			if (lvl == 0)
			{
				output((rand(1) == 1 ? "<i>“Guess who's back?”</i> you say into the intercom." : "<i>“I'm back”</i> you state to the intercom."));
				output("\n<i>“...Whatdyya want? Come again to take something else have you?!”</i> the Broodmother shouts back " + (flags["RASKDOOR_BROKE"] == 1 ? "as you slide the door out the way of the doorway and enter the den." : " as the doorway beeps open and you step inside."));
			}
			else if (lvl <= 2)
			{
				output((rand(1) == 1 ? "<i>“Guess who's back?”</i> you say into the intercom." : "<i>“I'm back”</i> you state to the intercom."));
				if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
					output("\n<i>“Ahh my Patient's back! Come on in, let's see what I can do with you!”</i> the Broodmother squeaks excitedly back ");
				}
				else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
					output("\n<i>“Ahh my " + pc.mf("master","mistress") + " is back! Come on in, let's see what I can do for you!”</i> the Broodmother squeaks excitedly back ");
				}
				else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
					output("\n<i>“Ahh Steele, back for another lesson? Come on in”</i> the Broodmother squeaks excitedly back ");
				}
				else{
					output("\n<i>“Ahh Steele, come on in”</i> the Broodmother squeaks excitedly back ");
				}
				output(flags["RASKDOOR_BROKE"] == 1 ? "as you slide the door out the way of the doorway and enter the den." : " as the doorway beeps open and you step inside.");
			}
			else if (lvl <= 4)
			{
				output((rand(1) == 1 ? "<i>“Guess who's back?”</i> you say into the intercom.\n" : "<i>“I'm back”</i> you state to the intercom.\n"));
				if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
					output(pc.hasCock() ? "<i>“Ahh Steele, come on in. Let's see what I can do for my patient today!”</i> the Broodmothers lurid voice responds" : "<i>“Ahh Steele, haven't grown a cock from some delightful illness have you?”</i> the Broodmothers lurid voice responds");
				}
				else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
					output("<i>“Ahh " + pc.mf("master","mistress") + ", come on in. Let's see how I can serve you today..”</i> the Broodmothers lurid voice responds");
				}
				else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
					output("<i>“Ahh Steele, I've been such a naughty schoolgirl. You'll have to come on in and punish me”</i> the Broodmothers lurid voice responds");
				}
				else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
					output("<i>“Ahh Steele, come on in, I've got something to teach you”</i> the Broodmothers lurid voice responds");
				}
				else{
					output(pc.hasCock() ? "<i>“Ahh Steele, come on in”</i> the Broodmothers lurid voice responds" : "<i>“Ahh Steele, I hope you've brought some cock”</i> the Broodmothers lurid voice responds");
				}
				output(flags["RASKDOOR_BROKE"] == 1 ? " as you slide the door out the way of the doorway and enter the den." : " as the doorway beeps open and you step inside.");
			}
			else if (lvl <= 6)
			{
				if (pc.hasCock())
				{
					output((rand(1) == 1 ? "<i>“Hope you left some room?”</i> you announce to the intercom.\n" : "<i>“Room for one more?”</i> you announce to the intercom.\n"));
				}
				else
				{
					output((rand(1) == 1 ? "<i>“Up for some fun?”</i> you whisper into the intercom.\n" : "<i>“Ready for more?”</i> you announce through the intercom.\n"));
				}
				
				if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "NurseOutfit"){
					output((pc.hasCock() ? "Hurried begging comes from the intercom. <i>“Oh fuck, [pc.name], come in quick, I've got a treatment for your [pc.cocks] that needs to be done urgently!”</i>\n" : "Exasperated begging comes from the intercom. <i>“Ah [pc.name], please, come in quick, you're very sick and the only treatment for it is to pleasure my gaping birth hole!”</i>\n"));
				}
				else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "MaidOutfit"){
					output((pc.hasCock() ? "Hurried begging comes from the intercom. <i>“Oh fuck, " + pc.mf("master","mistress") + " [pc.name] come in quick! I need to fuck your [pc.cocks] over and over, as a good maid should!”</i>\n" : "Exasperated begging comes from the intercom. <i>“Oh fuck, " + pc.mf("master","mistress") + " [pc.name] come in quick! I need to fuck you over and over, as a good maid should!”</i>\n"));
				}
				else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "SchoolgirlOutfit"){
					output((pc.hasCock() ? "Hurried begging comes from the intercom. <i>“Oh fuck, [pc.name], I've been such a bad little girl, you need to punish me over and over with your [pc.cocks]!”</i>\n" : "Exasperated begging comes from the intercom. <i>“Oh fuck, [pc.name], I've been such a bad little girl, you need to punish me, now!”</i>\n"));
				}
				else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "LeatherStrapHarness"){
					output((pc.hasCock() ? "Hurried begging comes from the intercom. <i>“Fuck me over and over [pc.name], fill your little bound slut with your [pc.cocks]!”</i>\n" : "Exasperated begging comes from the intercom. <i>“Ah [pc.name], please, fuck your bound sluts' gaping hole!”</i>\n"));
				}
				else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "TeacherOutfit"){
					output((pc.hasCock() ? "Hurried begging comes from the intercom. <i>“Oh fuck, [pc.name], come on in quick! I've got an assignment for the class and it's to stuff my pussy with your [pc.cocks]!”</i>\n" : "Exasperated begging comes from the intercom. <i>“Oh fuck, [pc.name], come on in quick! I've got an assignment for the class and it's to fuck my pussy!”</i>\n"));
				}
				else if (flags["PREG_RASK_RETURNED_DRESSUP_FANTASY_WEARING"]  == "FarmersOveralls"){
					output((pc.hasCock() ? "Hurried begging comes from the intercom. <i>“Fuck me over and over [pc.name], give this little country gal' your [pc.cocks]!”</i>\n" : "Exasperated begging comes from the intercom. <i>“Ah [pc.name], please, pleasure this little country gal's pussy!”</i>\n"));
				}
				else{
					output((pc.hasCock() ? "Hurried begging comes from the intercom. <i>“Fuck me over and over [pc.name], give me your [pc.cocks]!”</i>\n" : "Exasperated begging comes from the intercom. <i>“Ah [pc.name], please, fuck my gaping cunt!”</i>\n"));
				}
				
				if (pc.libido() >= 70 || pc.lust() >= 50 || pc.isBimbo())
				{
					output("She doesn't have to tell you twice.\n")
				}
				
				if (flags["PREG_RASK_RETURNED_DOORLESS"] == undefined){
					output("You walk through the door, which has now been left ajar for more people to discover her.")
					flags["PREG_RASK_RETURNED_DOORLESS"] = true;
				}
				else{
					output("You walk through the open doorway, into the den.");
				}
			}
		}
		clearMenu();
		addButton(0, "Next", move, "BROOD_DEN");
	}
}

public function denLeave():void
{
	clearOutput();
	author("HNB");

	var lvl:int = getBroodmotherLevel();

	if ((hours % (8 - lvl) == 0) || (hours < 4 || hours > 22) || (GetGameTimestamp() < flags["PREG_RASK_RETURNED_LASTIMPREGNATED_RESTING_UNTIL"]))
	{
		output("You press the exit button and the door hums open. A second later you step out into the " + ((hours < 4 || hours > 22) ? "moonlight." : "sunlight."));
		clearMenu();
		addButton(0, "Next", move, "249");
	}
	else 
	{
		if (lvl == 0)
		{
			output("<i>“Oh what and now you're just going to fuck off without fixing anything?!”</i> the broodmother shouts from behind.");
		}
		else if (lvl <= 2)
		{
			output("<i>“Leaving again so soon?”</i> the Broodmother murmurs from behind.");
		}
		else if (lvl <= 4)
		{
			output("<i>“Don't ya want to stay?”</i> the Broodmother murmurs from behind, as you look over your shoulder to see her rubbing her pregnancy-swollen teats.");
		}
		else if (lvl <= 6)
		{
			output("<i>“Are you sure you want to leave?”</i> the Broodmother slurs from behind, as you look over your shoulder to see her spreading her legs.");
		}
		
		if (lvl > 2 && pc.lust() >= 50) //Lusts a good way of knowing either whether the PC would fall for it, or whether they did her.
		{
			if (pc.isBimbo())
			{
				output("\n\nYou turn around. <b>You can't turn down a fellow gal in need.</b>")
				clearMenu();
				addButton(0, "Next", denInside);	
			}
			else
			{
				output("\n\nYou turn around. <b>You can't turn her down.</b>")
				clearMenu();
				addButton(0, "Next", denInside);
			}
		}
		else 
		{
			output("\n\nYou press the exit button and the door hums open. A second later you step out into the " + ((hours < 4 || hours > 22) ? "moonlight." : "sunlight."));
			clearMenu();
			addButton(0, "Next", move, "249");
		}
	}
}

public function denEntryLeave():void
{
	clearOutput();
	clearMenu();
	author("HNB");

	output("You turn your back to the door and step between the orange hills once more.");

	processTime(2);

	clearMenu();
	addButton(0, "Next", move, "249");
}

public function getBroodmotherCumCap():int
{
	return flags["PREG_RASK_RETURNED_CUMSTORAGE_VOLUMECAP"];
}

public function getBroodmotherCumStoredVolume():int 
{
	var cumStorage:Array = flags["PREG_RASK_RETURNED_CUMSTORAGE"];
	var totalVol:int = 0;
	for (var i:int = 0; i < cumStorage.length; i++ )
	{
		totalVol += cumStorage[i].cumQ;
	}
	return totalVol;
}

public function dumpStoredCum(toRemove:int):void 
{
	var cumStorage:Array = flags["PREG_RASK_RETURNED_CUMSTORAGE"];
	var removed:int = 0;
	for (var i:int = 0; i < cumStorage.length; i++ )
	{
		if (removed == toRemove)
		{
			break;
		}
		
		// If removing this one would put removed over toRemove , only remove enough
		if ((removed + cumStorage[i].cumQ) >= toRemove)
		{
			cumStorage[i].cumQ = cumStorage[i].cumQ - (toRemove - removed)
			removed = toRemove;
		}
		// Otherwise remove it completely
		else 
		{
			removed += cumStorage[i].cumQ;
			cumStorage.removeAt(i);
		}
	}
	flags["PREG_RASK_RETURNED_CUMSTORAGE"] = cumStorage;
}

public function addBuckets():void 
{
	clearMenu();
	clearOutput();
	author("HNB");
	showBucketBust();
	
	output("How many?");
	
	var number:int = pc.numberOfItemByClass(EmptyBucket);
	
	for (var i:int = 1; ((i <= number) && (i < 14)); i++)
	{
		addButton(i-1,"x"+i,addBuckets_Number,i);
	}
	
	addButton(14,"Back",cumStorageMenu);
}

public function addBuckets_Number(number:int):void 
{
	clearMenu();
	clearOutput();
	author("HNB");
	
	if (number == 1){
		output("You place the bucket next to the other" + ((flags["PREG_RASK_RETURNED_CUMSTORAGE_VOLUMECAP"] == 1000) ? " one" : "s") + ".");
	}
	else{
		output("You place the buckets in a stack, alongside the other" + ((flags["PREG_RASK_RETURNED_CUMSTORAGE_VOLUMECAP"] == 1000) ? " one" : "s") + ".");
	}
	
	pc.destroyItemByClass(EmptyBucket,number);
	flags["PREG_RASK_RETURNED_CUMSTORAGE_VOLUMECAP"] += number * 1000;
	
	processTime(1);
	addButton(0,"Next",cumStorageMenu);
}

public function isBroodmotherPregnant():Boolean
{
	return flags["PREG_RASK_RETURNED_ISPREGNANT"];
}

public function cumInsideBroodmother(cummies:int):void
{
	clearOutput();
	clearMenu();
	author("HNB");
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

public function broodmotherBirthScene(numBirthed:int):void 
{
	clearOutput();
	clearMenu();
	author("HNB");
	
	var lvl:int = getBroodmotherLevel();
	
	//Offer nursery, doesn't need help
	output("<i>“Oooh!”</i> the Broodmother groans, her belly shifting. <i>“Looks like our babies coming [pc.name]!”</i>\n\n");
	output("<i>“Oh shit!”</i> you gasp. <i>“Come on, I'll land the ship out front and we'll get you to the Nursery!”</i>\n\n");
	output("<i>“Ahaha, no need”</i> she laughs. <i>“This isn't my first Rodeo”</i>\n\n");
	
	//Pushing out of the babies, it's "hellishly pleasurable"
	output("You stand and watch as she huffs and gasps before her " + (lvl >= 5 ? "already gaping snatch sprays a gush of her lube across the room and, looking between her thick lips, you see her insides filled with a large, emerging egg." : "thick pussy-lips are pushed apart by an emerging egg, a gush of her lube spraying across the room as it does."));	
	output("<i>“Oh fuUUckkk”</i> the Raskvel moans as the egg slides against the walls of her insides. It turns as it slides further out stirring up her insides, causing her to cry out and shriek in pleasure. <i>“Oh fuck, oh fuck, oh fuck”</i> she pants. It gets pushed out further, emerging soaking from her dripping snatch until it sits in the rim of her taught hole. It wobbles in her gaping hole and then, with a loud pop, drops to the floor, along with a waterfall of girlcum.\n\n");
	
	// Managing babies
	if (numBirthed > 1)
	{
		output("A while later, after much gasping, moaning and cumming, " + numBirthed + " eggs are lying, soaking behind the collapsed broodmother, in a puddle of her juices. ");
	}
	else 
	{
		output("At this, the Broodmother collapses. The sole egg lies behind her, strings of her cum connecting the two. ");
	}
	
	if (flags["PREG_RASK_RETURNED_NURSEBABIES"] == true)
	{
		output("You'd congratulate her but she's unable to respond. Her tongue dangles from her mouth idly and her eyes are rolled back in her head in ecstasy. You draw your codex from your pocket and flip it open, tapping it a few times, calling " + (numBirthed > 1 ? "nursery drones" : "a nursery drone") + " to your location. ");
		
		if (flags["PREG_RASK_RETURNED_DOORLESS"] == true) output("Not a minute later, " + (numBirthed > 1 ? "they fly through" : "it flies through") +" the door, taking great care to grab on to the slickened " + (numBirthed > 1 ? "eggs" : "egg") + " before flying your children back out towards the nursery.");
		else output("You walk over to the control panel and tap away at the controls. The door flies open at your command and not a minute later, " + (numBirthed > 1 ? "they fly through" : "it flies through") +", taking great care to grab on to the slickened " + (numBirthed > 1 ? "eggs" : "egg") + " before flying back out towards the nursery.");
	}
	else 
	{
		output("You'd congratulate her but she's barely conscious. Her tongue dangles from her mouth idly and her eyes are rolled back in her head in ecstasy. She just barely mumbles <i>“That was soooo good. I'll drag them over to the hatchery in the back in a bit, I just need to rest for a bit.”</i>");
	}
	output("\n\nLeaving her to rest, you walk outside.");
	
	pc.lust(15); //It was probably pretty hot.
	processTime(15);	
	addButton(0, "Next", move, "249");
}