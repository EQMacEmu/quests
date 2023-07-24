--druid

local quest_helper = require('velious_quest_helper');
local THURG_ARMOR = quest_helper.THURG_ARMOR;

local QUEST_ITEMS = {
	quest_helper:priest_helmet(THURG_ARMOR.Leather_Cap, 31049),
	quest_helper:priest_boots(THURG_ARMOR.Leather_Boots, 31055),
	quest_helper:priest_chest(THURG_ARMOR.Leather_Tunic, 31050),
	quest_helper:priest_arms(THURG_ARMOR.Leather_Sleeves, 31051),
	quest_helper:priest_gloves(THURG_ARMOR.Leather_Gloves, 31053),
	quest_helper:priest_bracer(THURG_ARMOR.Leather_Bracelet, 31052),
	quest_helper:priest_legs(THURG_ARMOR.Leather_Leggings, 31054),
}

function event_say(e)
	if(e.other:GetFaction(e.self) <= 3 ) then --kindly or better
		if(e.message:findi("hail")) then
			e.self:Say("Greetings to you. I seek one who calls himself a druid. What do you call yourself, manling?");
		elseif(e.message:findi("druid")) then	
			e.self:Say("Good. I had hoped you were one. As nature's guardian, you fight the never-ending struggle against those who seek to defile it. It is an admirable quality and I wish to aid you. I will provide you with a cap, a tunic, sleeves, bracers, gloves, leggings, and boots.");
		elseif(e.message:findi("tunic")) then	
			e.self:Say("If you find an eroded leather tunic and three pieces of black marble bring them to me and I shall attempt to create an enchanted tunic that will serve you well.");
		elseif(e.message:findi("cap")) then	
			e.self:Say("Those who are as wise as we are know that protection of the head is most important. I may be able to forge you something most interesting if you were to bring me three pieces of crushed onyx sapphire and an eroded leather cap.");
		elseif(e.message:findi("sleeves")) then	
			e.self:Say("Three jaundice gems and a set of eroded leather sleeves might be an interesting combination. The powers of the gems may be harvested to imbue the sleeves.");
		elseif(e.message:findi("gloves")) then	
			e.self:Say("Strong protection for one's hands is important. I may be able to craft you a set of powerful leather gloves if you find a set of eroded leather gloves and three crushed lava rubies.");
		elseif(e.message:findi("bracers")) then	
			e.self:Say("Bracers are quite easy to imbue. Simply find three crushed opals and an eroded leather bracer and I will complete the ritual to enchant them.");
		elseif(e.message:findi("leggings")) then	
			e.self:Say("Leggings are a bit trickier to imbue. Three chipped onyx sapphires will allow me to channel the correct energies into a pair of eroded leather leggings. However, those chipped onyx sapphires are somewhat rare. Return to me if you find such things in your journeys.");
		elseif(e.message:findi("boots")) then	
			e.self:Say("Simply bring me a set of three crushed flame emeralds and a pair of eroded leather boots and I will imbue them. I bid you good luck in finding such things.");
		end
	else
		e.self:Say("I do not know you well enough to entrust you with such a quest, yet.");
	end
end

function event_trade(e)
	quest_helper:quest_turn_in(e, 3, QUEST_ITEMS, quest_helper.thurg_armor_success)
end
