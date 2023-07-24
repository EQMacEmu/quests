--shadowknight

local quest_helper = require('velious_quest_helper');
local THURG_ARMOR = quest_helper.THURG_ARMOR;

local QUEST_ITEMS = {
	quest_helper:melee_helmet(THURG_ARMOR.Plate_Helmet, 31000), --helm
	quest_helper:melee_chest(THURG_ARMOR.Breastplate, 31001), --bp
	quest_helper:melee_arms(THURG_ARMOR.Plate_Vambraces, 31002), -- arms
	quest_helper:melee_bracer(THURG_ARMOR.Plate_Bracer, 31003), --bracer
	quest_helper:melee_gloves(THURG_ARMOR.Plate_Gauntlets, 31004), -- gloves
	quest_helper:melee_legs(THURG_ARMOR.Plate_Greaves, 31005), -- legs
	quest_helper:melee_boots(THURG_ARMOR.Plate_Boots, 31006), -- boots
}

function event_say(e)
	if(e.other:GetFaction(e.self) <= 3) then
		if(e.message:findi("hail")) then	
			e.self:Say("I wasn't always just a merchant, ye know, I used to work at the temple and spent most of my time in the study of ancient texts and arts. I actually learned a lot about the dark arts in those days. Ye know... necromancy. Oh, I'd never touch the stuff, mind ye, but I'll bet I could make a fine set of plate fer shadowknights if'n I had the right materials.");
		elseif(e.message:findi("material")) then	
			e.self:Say("Glad to see ye're interested, "..e.other:GetName()..". The materials would vary by the piece of armor o' course. I could probably forge a fine set of bracers, gauntlets, greaves, boots, armplates, a helm, or a breastplate.");
		elseif(e.message:findi("helm")) then	
			e.self:Say("To create a piece of armor to protect your skull I will require three pieces of crushed coral as well as a corroded plate helmet.");
		elseif(e.message:findi("breastplate")) then	
			e.self:Say("For the breastplate, I will need a corroded breastplate and three flawless diamonds. Once I have them in my possession it will not take long to craft a sturdy breastplate.");
		elseif(e.message:findi("armplates")) then	
			e.self:Say("Protection for your arms will come at the price of a set of corroded plate vambraces and three flawed emeralds.");
		elseif(e.message:findi("bracers")) then	
			e.self:Say("For the bracers, I will require a corroded plate bracer and a set of three crushed flame emeralds. Return to me if you happen to find these things in your travels.");
		elseif(e.message:findi("gauntlets")) then	
			e.self:Say("Protecting your hands is very important. I can forge protection for your hands if you bring me a pair of corroded plate gauntlets and three crushed topaz.");
		elseif(e.message:findi("greaves")) then	
			e.self:Say("A set of corroded greaves might be salvageable if you were to find three flawed sea sapphires. With the right techniques almost anything is possible.");
		elseif(e.message:findi("boots")) then	
			e.self:Say("Boots made for battle are not always the most comfortable available. However, if you seek a fine set for battle bring me a set of corroded plate boots and three pieces of crushed black marble.");
		end
	else
		e.self:Say("I do not know you well enough to entrust you with such a quest, yet.");
	end
end

function event_trade(e)
	quest_helper:quest_turn_in(e, 3, QUEST_ITEMS, quest_helper.thurg_armor_success);
end
