--bard

local quest_helper = require('velious_quest_helper');
local THURG_ARMOR = quest_helper.THURG_ARMOR;

local QUEST_ITEMS = {
	-- boots
	quest_helper:melee_boots(THURG_ARMOR.Plate_Boots, 31041),
	-- legs
	quest_helper:melee_legs(THURG_ARMOR.Plate_Greaves, 31040),
	-- gloves
	quest_helper:melee_gloves(THURG_ARMOR.Plate_Gauntlets, 31039),
	-- wrist
	quest_helper:melee_bracer(THURG_ARMOR.Plate_Bracer, 31038),
	-- arms
	quest_helper:melee_arms(THURG_ARMOR.Plate_Vambraces, 31037),
	-- chest
	quest_helper:melee_chest(THURG_ARMOR.Breastplate, 31036),
	-- helm
	quest_helper:melee_helmet(THURG_ARMOR.Plate_Helmet, 31035)
}

function event_say(e)
	if (e.other:GetFaction(e.self) <= 3) then --kindly or better
		if(e.message:findi("hail")) then		
			e.self:Say("The one thing this bar is sorely missin' is a good bard I tell ye. Ye know, someone to sing a catchy tune and tell us a story from time to time. Forgive me fer seemin' a bit sentimental but my family has always had close ties with bards datin' back ta even before we crossed the ocean. In fact, me great-great-grandfather used ta forge enchanted armor for the ancient bards of Faydark. Oh, the set of bard velium armor I could make if only I had the right components!");
		elseif(e.message:findi("component")) then	
			e.self:Say("With the proper components I could make a helm, a breastplate, armplates, bracers, gauntlets, greaves, and even a pair o' boots!");
		elseif(e.message:findi("helm")) then	
			e.self:Say("To create a piece of armor to protect your skull I will require three pieces of crushed coral as well as a corroded plate helmet.")		;
		elseif(e.message:findi("breastplate")) then	
			e.self:Say("For the breastplate I will need a corroded breastplate and three flawless diamonds. Once I have them in my possession it will not take long to craft a sturdy breastplate.");
		elseif(e.message:findi("armplate")) then			
			e.self:Say("Protection for your arms will come at the price of a set of corroded plate vambraces and three flawed emeralds.");
		elseif(e.message:findi("bracers")) then		
			e.self:Say("For the bracers I will require a corroded plate bracer and a set of three crushed flame emeralds. Return to me if you happen to find these things in your travels.");
		elseif(e.message:findi("gauntlets")) then	
			e.self:Say("Protecting your hands is very important. I can forge protection for your hands if you bring me a pair of corroded plate gauntlets and three crushed topaz.");
		elseif(e.message:findi("greaves")) then	
			e.self:Say("A set of corroded greaves might be salvageable if you were to find three flawed sea sapphires. With the right techniques almost anything is possible.");
		elseif(e.message:findi("boots")) then	
			e.self:Say("Boots made for battle are not always the most comfortable available. However if you seek a fine set for battle bring me a set of corroded plate boots and three pieces of crushed black marble.");
		end
	else
		e.self:Say("I do not know you well enough to entrust you with such a quest, yet.");
	end
end

function event_trade(e)
	quest_helper:quest_turn_in(e, 3, QUEST_ITEMS, quest_helper.thurg_armor_success)
end
