--rogue

local quest_helper = require('velious_quest_helper');
local SKYSHRINE_ARMOR = quest_helper.SKYSHRINE_ARMOR;

local QUEST_ITEMS = {
	quest_helper:melee_helmet(SKYSHRINE_ARMOR.Chain_Coif, 31126), --helm
	quest_helper:melee_chest(SKYSHRINE_ARMOR.Chain_Tunic, 31127), --bp
	quest_helper:melee_arms(SKYSHRINE_ARMOR.Chain_Sleeves, 31128), -- arms
	quest_helper:melee_bracer(SKYSHRINE_ARMOR.Chain_Bracer, 31129), --bracer
	quest_helper:melee_gloves(SKYSHRINE_ARMOR.Chain_Gauntlets, 31130), -- gloves
	quest_helper:melee_legs(SKYSHRINE_ARMOR.Chain_Leggings, 31131), -- legs
	quest_helper:melee_boots(SKYSHRINE_ARMOR.Chain_Boots, 31132) -- boots
}

function event_say(e)
	if(e.other:GetFaction(e.self) < 2) then -- Must be Ally
		if(e.message:findi("hail")) then
			e.self:Say("What do we have here? A cutthroat, perhaps? If you are a rogue, I may have use for you. I am in need of certain components and will reward you well if they are brought to me. Do I have your services?");
		elseif(e.message:findi("service")) then
			e.self:Say("Excellent. Now, down to business. I shall pay you in trade for the items I seek. What I have for you is as such, a coif, a breastplate, armplates, bracers, gauntlets, greaves and boots. These should aid you in your skullduggery.");
		elseif(e.message:findi("coif")) then
			e.self:Say("I am in need of an unadorned chain coif and three crushed pieces of coral. For your services I shall give you a coif suitable for one such as you.");
		elseif(e.message:findi("breastplate")) then
			e.self:Say("For the breastplate you must seek out an unadorned chain tunic and three flawless diamonds. Only then will you receive a breastplate of my crafting.");
		elseif(e.message:findi("armplate")) then
			e.self:Say("For the armplates I shall give you, I require these: unadorned chain sleeves and three flawed emeralds.");
		elseif(e.message:findi("bracer")) then
			e.self:Say("An unadorned bracer and three crushed flame emeralds are what I require of you. A bracer of my making is your reward.");
		elseif(e.message:findi("gauntlet")) then
			e.self:Say("I need unadorned chain gauntlets and a set of three crushed topaz. Once I have these, you shall have your reward.");
		elseif(e.message:findi("legging")) then
			e.self:Say("A pair of leggings will be yours once you complete this task for me, thief. A pair of unadorned chain leggings and three flawed sea sapphires are all I require.");
		elseif(e.message:findi("boot")) then
			e.self:Say("A fine pair of boots shall you have to skulk around in, once you bring me a pair of unadorned chain boots and three pieces of crushed black marble.");
		end
	else
		e.self:Say("You must prove your dedication to the Claws of Veeshan before I will speak to you.");
	end
end

function event_trade(e)
  quest_helper:quest_turn_in(e, 1, QUEST_ITEMS, quest_helper.skyshrine_armor_success);
end
