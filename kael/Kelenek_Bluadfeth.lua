--rogue

local quest_helper = require('velious_quest_helper');
local KAEL_ARMOR = quest_helper.KAEL_ARMOR;

local QUEST_ITEMS = {
	quest_helper:melee_helmet(KAEL_ARMOR.Chain_Coif, 25377), --Helm
	quest_helper:melee_chest(KAEL_ARMOR.Chain_Tunic, 25378), -- Breastplate
	quest_helper:melee_arms(KAEL_ARMOR.Chain_Sleeves, 25379), -- Arms
	quest_helper:melee_bracer(KAEL_ARMOR.Chain_Bracer, 25380), --Bracer
	quest_helper:melee_gloves(KAEL_ARMOR.Chain_Gauntlets, 25381), --gloves
	quest_helper:melee_legs(KAEL_ARMOR.Chain_Leggings, 25382), --legs
	quest_helper:melee_boots(KAEL_ARMOR.Chain_Boots, 25383), --boots
}

function event_say(e)
	if(e.other:GetFaction(e.self) < 2) then --Must be ally
		if(e.message:findi("hail")) then
			e.self:Say("What do we have here? A cutthroat, perhaps? If not then go away, for I have words to speak with a rogue.");
		elseif(e.message:findi("rogue")) then
			e.self:Say("I commend you on your skill, making it this far. I have a job for you, thief. Several in fact and quite simple for an assassin such as yourself. I am in need of certain components and will reward you well if they are brought to me. Do I have your services?");
		elseif(e.message:findi("services")) then
			e.self:Say("Excellent. Now, down to business. I shall pay you in trade for the items I seek. What I have for you is as such, a coif, a breastplate, armplates, bracers, gauntlets, greaves and boots. These should aid you in your skullduggery.");
		elseif(e.message:findi("coif")) then
			e.self:Say("I am need of an ancient tarnished chain coif and three crushed pieces of coral. For your services I shall give you a coif suitable for one such as you.");
		elseif(e.message:findi("breastplate")) then
			e.self:Say("For the breastplate you must seek out an ancient tarnished chain tunic and three flawless diamonds. Only then will you receive a breastplate of my crafting.");
		elseif(e.message:findi("armplate")) then
			e.self:Say("For the armplates I shall give you, I require this; an ancient tarnished chain sleeves and three flawed emeralds.");
		elseif(e.message:findi("bracer")) then
			e.self:Say("An ancient tarnished bracer and three crushed flame emeralds is what I require of you. A bracer of my making is your reward.");
		elseif(e.message:findi("gauntlet")) then
			e.self:Say("I need an ancient tarnished chain gauntlets as well as three crushed topaz. Once I have these you shall have your reward.");
		elseif(e.message:findi("greave")) then
			e.self:Say("A pair of leggings will be your once you completed this task for me, thief. Bring unto me a pair of ancient tarnished chain leggings and a trilogy of flawed sea sapphires.");
		elseif(e.message:findi("boot")) then
			e.self:Say("A fine pair of boots shall you have to skulk around in, once I have a pair of an ancient tarnished chain boots and three pieces of crushed black marble.");
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
