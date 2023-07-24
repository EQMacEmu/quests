--druid

local quest_helper = require('velious_quest_helper');
local SKYSHRINE_ARMOR = quest_helper.SKYSHRINE_ARMOR;

local QUEST_ITEMS = {
  quest_helper:priest_helmet(SKYSHRINE_ARMOR.Leather_Cap, 31147), --helm
  quest_helper:priest_chest(SKYSHRINE_ARMOR.Leather_Tunic, 31148), --bp
  quest_helper:priest_arms(SKYSHRINE_ARMOR.Leather_Sleeves, 31149), -- arms
  quest_helper:priest_bracer(SKYSHRINE_ARMOR.Leather_Bracelet, 31150), --bracer
  quest_helper:priest_gloves(SKYSHRINE_ARMOR.Leather_Gloves, 31151), -- gloves
  quest_helper:priest_legs(SKYSHRINE_ARMOR.Leather_Leggings, 31152), -- legs
  quest_helper:priest_boots(SKYSHRINE_ARMOR.Leather_Boots, 31153), -- boots
}

function event_say(e)
	if (e.other:GetFaction(e.self) < 2) then -- Must be ally
		if(e.message:findi("hail")) then
			e.self:Say("Greetings to you. I seek one who calls himself a druid. What do you call yourself, manling?");
		elseif(e.message:findi("druid")) then
			e.self:Say("Good. I had hoped you were one. As nature's guardian, you fight the never-ending struggle against those who seek to defile it. It is an admirable quality and I wish to aid you. I will provide you with a cap, a tunic, sleeves, bracers, gloves, leggings and boots.");
		elseif(e.message:findi("cap")) then
			e.self:Say("I shall weave one of exceptional quality for you but you must gather the ingredients first. I require an unadorned leather cap and three crushed onyx sapphires.");
		elseif(e.message:findi("tunic")) then
			e.self:Say("You shall be a force of nature with this tunic. Once I have gained an unadorned leather tunic and three pieces of black marble, the item is yours.");		
		elseif(e.message:findi("sleeve")) then
			e.self:Say("As the bark protects the limbs of the tree, so shall these sleeves protect your arms. Bring me a pair of unadorned leather sleeves and three jaundice gems.");
		elseif(e.message:findi("bracer")) then
			e.self:Say("For a bracer I shall require an unadorned leather bracelet as well as three crushed opals. Do this and the reward shall be yours to keep.");
		elseif(e.message:findi("glove")) then
			e.self:Say("The gloves shall help protect you from the elements and harm. In order for me to complete them, I require a pair of unadorned leather gloves and three crushed lava rubies.");
		elseif(e.message:findi("legging")) then
			e.self:Say("As the roots support the mighty oak, so shall these leggings support you. Furnish me three chipped onyx sapphires and a pair of unadorned leather leggings.");
		elseif(e.message:findi("boot")) then
			e.self:Say("Your feet are as hard as any stone and as swift as a coiled serpent but even the swiftest feet require protection so I shall provide you with these. They should help. Acquire a pair of unadorned leather boots and a set of three crushed flame emeralds.")
		end
	else --Not ally
		e.self:Say("You must prove your dedication to the Claws of Veeshan before I will speak to you.");		
	end
end	

function event_trade(e)
	quest_helper:quest_turn_in(e, 1, QUEST_ITEMS, quest_helper.skyshrine_armor_success)

end