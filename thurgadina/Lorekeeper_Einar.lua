--monk

local quest_helper = require('velious_quest_helper');
local THURG_ARMOR = quest_helper.THURG_ARMOR;

local QUEST_ITEMS = {
	quest_helper:melee_helmet(THURG_ARMOR.Leather_Cap, 31091),
	quest_helper:melee_boots(THURG_ARMOR.Leather_Boots, 31097),
	quest_helper:melee_chest(THURG_ARMOR.Leather_Tunic, 31092),
	quest_helper:melee_arms(THURG_ARMOR.Leather_Sleeves, 31093),
	quest_helper:melee_gloves(THURG_ARMOR.Leather_Gloves, 31095),
	quest_helper:melee_bracer(THURG_ARMOR.Leather_Bracelet, 31094),
	quest_helper:melee_legs(THURG_ARMOR.Leather_Leggings, 31096),
}

function event_say(e)
	if (e.other:GetFaction(e.self) <= 3) then
		if(e.message:findi("hail")) then
			e.self:Say("Greetings to you. I seek one that has chosen the path of monkhood. What do you call yourself?");
		elseif(e.message:findi("monk")) then	
			e.self:Say("Good. I had hoped you were one. I have heard that as seeker of the way you are in constant training to push yourself to your physical and mental limits. It is an admirable quality and I wish to aid you. I will provide you with a cap, a tunic, sleeves, bracers, gloves, leggings and boots.");
		elseif(e.message:findi("cap")) then	
			e.self:Say("To create a piece of armor to protect your sensitive skull I will require three pieces of crushed coral as well as a eroded leather cap.");
		elseif(e.message:findi("tunic")) then	
			e.self:Say("To create a spectacular tunic fit for your kind I will require three flawless diamonds and an eroded leather tunic. With the gems and my skills I may be able to draw out some of its magical powers.");
		elseif(e.message:findi("sleeve")) then	
			e.self:Say("Protection for your arms will come at the price of three flawed emeralds and a set of eroded leather sleeves.");
		elseif(e.message:findi("legging")) then	
			e.self:Say("I may be able to craft a set of wondrous leggings from a set of old eroded leather leggings and three flawed sea sapphires. It is amazing what you can do with a bit of magic.");
		elseif(e.message:findi("glove")) then	
			e.self:Say("Protecting your hands is very important. I can create some excellent protection for your hands if you bring me three crushed topaz and a pair of eroded leather gloves.");
		elseif(e.message:findi("bracer")) then	
			e.self:Say("For the bracers, I will require a eroded leather bracelet as well as three crushed flame emeralds. Return to me when you find such things.");
		elseif(e.message:findi("boot")) then	
			e.self:Say("We use our feet so often, should not they be protected as well as any other portion of our bodies? If you seek fine protection for your feet return to me with three pieces of crushed black marble and a pair of eroded leather boots.");
		end
	else
		e.self:Say("I do not know you well enough to entrust you with such a quest, yet.");
	end
end

function event_trade(e)
	quest_helper:quest_turn_in(e, 3, QUEST_ITEMS, quest_helper.thurg_armor_success)
end
