--druid

local quest_helper = require('velious_quest_helper');
local KAEL_ARMOR = quest_helper.KAEL_ARMOR;

local QUEST_ITEMS = {
	quest_helper:priest_helmet(KAEL_ARMOR.Leather_Cap, 25398), --helm
	quest_helper:priest_chest(KAEL_ARMOR.Leather_Tunic, 25399), -- Breastplate
	quest_helper:priest_arms(KAEL_ARMOR.Leather_Sleeves, 25400), -- Arms
	quest_helper:priest_bracer(KAEL_ARMOR.Leather_Bracelet, 25401), --Bracer
	quest_helper:priest_gloves(KAEL_ARMOR.Leather_Gloves, 25402), --gloves
	quest_helper:priest_legs(KAEL_ARMOR.Leather_Leggings, 25403), --legs
	quest_helper:priest_boots(KAEL_ARMOR.Leather_Boots, 25404), --boots
}

function event_say(e)
	if(e.other:GetFaction(e.self) < 2) then --Must be ally
		if(e.message:findi("hail")) then
			e.self:Say("Greetings to you. I seek one that calls himself a druid. What do you call yourself, manling?");
		elseif(e.message:findi("druid")) then
			e.self:Say("Good. I had hoped you were one. As nature's guardian, you fight the never-ending struggle against those who seek to defile it. It is an admirable quality and I wish to aid you. I will provide you with a cap, a tunic, sleeves, bracers, gloves, leggings and boots.");
		elseif(e.message:findi("cap")) then
			e.self:Say("I shall weave one of exceptional quality for you but you must gather the ingredients first. I require an ancient leather cap and three crushed onyx sapphires.");
		elseif(e.message:findi("tunic")) then
			e.self:Say("You shall be a force of nature with this tunic. Once I have gained an ancient leather tunic and three pieces of black marble the item is yours.");
		elseif(e.message:findi("sleeve")) then
			e.self:Say("As the bark protects the limbs of the tree, so shall these sleeves protect your arms. Bring me a pair of an ancient leather sleeves and three jaundice gems.");
		elseif(e.message:findi("bracer")) then
			e.self:Say("For a bracer I shall require an ancient leather bracelet, and three crushed opals. Do this and the reward shall be yours to keep.");
		elseif(e.message:findi("glove")) then
			e.self:Say("The gloves shall help protect you from the elements and harm. In order for me to complete them I require a pair of an ancient leather gloves and three crushed lava rubys.");
		elseif(e.message:findi("legging")) then
			e.self:Say("As the roots support the mighty oak, so shall these leggings support you. Furnish a pair of an ancient leather leggings as well as three chipped onyx sapphires and they are yours.");
		elseif(e.message:findi("boot")) then
			e.self:Say("Even the swiftest feet need protection so I shall provide you with these. They should help. Acquire a pair of ancient boots and three crushed flame emeralds.");
		end
	elseif (e.other:GetFaction(e.self) < 5) then -- amiably or better
		if(e.message:findi("hail")) then
			e.self:Say("We have nothing to talk about small one.");
		end
	elseif (e.other:GetFaction(e.self) >= 5) then
		if(e.message:findi("hail")) then
			e.self:Say("You must prove your dedication to Kael Drakkal and the Kromzek clan before I will speak to you.");
		end
	end
end

function event_trade(e)
	quest_helper:quest_turn_in(e, 1, QUEST_ITEMS, quest_helper.kael_armor_success) 
end
