--beastlord

local quest_helper = require('velious_quest_helper');
local THURG_ARMOR = quest_helper.THURG_ARMOR;

local QUEST_ITEMS = {
	quest_helper:melee_helmet(THURG_ARMOR.Leather_Cap, 5453), --helm
	quest_helper:melee_chest(THURG_ARMOR.Leather_Tunic, 5454), --bp
	quest_helper:melee_arms(THURG_ARMOR.Leather_Sleeves, 5455), -- arms
	quest_helper:melee_bracer(THURG_ARMOR.Leather_Bracelet, 5456), --bracer
	quest_helper:melee_gloves(THURG_ARMOR.Leather_Gloves, 5457), -- gloves
	quest_helper:melee_legs(THURG_ARMOR.Leather_Leggings, 5458), -- legs
	quest_helper:melee_boots(THURG_ARMOR.Leather_Boots, 5459), -- boots
}

function event_say(e)
	if (e.other:GetFaction(e.self) <= 3) then
		if(e.message:findi("hail")) then	
			e.self:Emote("speaks in a rumbling tone. 'Greetings. I only wish to speak to a beastlord. Are you a beastlord?'");
		elseif(e.message:findi("beastlord")) then	
			e.self:Say("I sense that you are in tune with yourself and with nature. You have learned much from your travels and I shall help you by providing you with protection from harm and the elements in the form of armor.");
		elseif(e.message:findi("armor")) then	
			e.self:Say("For you I shall make a cap, tunic, sleeves, bracers, gloves, leggings, and boots. Each piece is a quest unto itself.  To seek the components you must search the lands for them and test the power of the spirit within.");
		elseif(e.message:findi("cap")) then	
			e.self:Say("Those who are wise as we are know that protection of the head is most important. I may be able to sew you something most interesting if you were to bring me an eroded leather cap and three pieces of crushed coral.");
		elseif(e.message:findi("tunic")) then	
			e.self:Say("If you find an eroded leather tunic and three flawless diamonds bring them to me and I shall attempt to create an enchanted tunic that will serve you well.");
		elseif(e.message:findi("sleeves")) then	
			e.self:Say("Three flawed emeralds and a set of eroded leather sleeves might be an interesting combination. The powers of the gems may be harnessed to imbue the sleeves.");
		elseif(e.message:findi("bracers")) then	
			e.self:Say("Bracers are quite easy to imbue. Simply find three crushed flame emeralds and a eroded leather bracelet and I will complete the ritual to enchant them.");
		elseif(e.message:findi("gloves")) then	
			e.self:Say("Strong protection for one's hands is important. I may be able to craft you a set of enchanted leather gloves if you find a set of eroded leather gloves and a set of three crushed topaz.");
		elseif(e.message:findi("leggings")) then	
			e.self:Say("Leggings are a bit trickier to imbue. Three flawed sea sapphires will allow me to channel the correct energies into a pair of eroded leather leggings. However, those flawed sea sapphires are somewhat rare. Return to me if you find such things in your journeys.");
		elseif(e.message:findi("boots")) then	
			e.self:Say("Simply bring me a set of three crushed black marbles and a pair of eroded leather boots and I will imbue them. I bid you good luck in finding such things.");
		end
	else
		e.self:Say("I do not know you well enough to entrust you with such a quest, yet.");
	end
end

function event_trade(e)
	quest_helper:quest_turn_in(e, 3, QUEST_ITEMS, quest_helper.thurg_armor_success)
end
