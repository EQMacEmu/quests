--monk

local quest_helper = require('velious_quest_helper');
local SKYSHRINE_ARMOR = quest_helper.SKYSHRINE_ARMOR;

local QUEST_ITEMS = {
	quest_helper:melee_helmet(SKYSHRINE_ARMOR.Leather_Cap, 31189), --helm
	quest_helper:melee_chest(SKYSHRINE_ARMOR.Leather_Tunic, 31190), --bp
	quest_helper:melee_arms(SKYSHRINE_ARMOR.Leather_Sleeves, 31191), -- arms
	quest_helper:melee_bracer(SKYSHRINE_ARMOR.Leather_Bracelet, 31192), --bracer
	quest_helper:melee_gloves(SKYSHRINE_ARMOR.Leather_Gloves, 31193), -- gloves
	quest_helper:melee_legs(SKYSHRINE_ARMOR.Leather_Leggings, 31194), -- legs
	quest_helper:melee_boots(SKYSHRINE_ARMOR.Leather_Boots, 31195), -- boots
}

function event_say(e)
	if (e.other:GetFaction(e.self) < 2) then -- Must be ally
		if(e.message:findi("hail")) then
			e.self:Say("Greetings to you. I seek one that has chosen the path of monkhood. What do you call yourself?");
		elseif(e.message:findi("monk")) then
			e.self:Say("Good. I had hoped you were one. As seeker of the way you are in constant training to push yourself to your physical and mental limits. It is an admirable quality and I wish to aid you. I will provide you with a cap, a tunic, sleeves, bracers, gloves, leggings and boots");
		elseif(e.message:findi("cap")) then
			e.self:Say("I shall weave one of exceptional quality for you but you must gather the items first. I require an unadorned leather cap and three pieces of crushed coral.");
		elseif(e.message:findi("tunic")) then
			e.self:Say("You shall be an imposing force with this tunic. Solid as the unmoving mountains, it shall protect you. Once I have gained a set of three flawless diamonds and an unadorned leather tunic.");		
		elseif(e.message:findi("sleeve")) then
			e.self:Say("As the mighty stone that parts the flow of water, so shall these sleeves divert harm against you. Bring me a pair of unadorned leather sleeves and three flawed emeralds.");
		elseif(e.message:findi("bracer")) then
			e.self:Say("For a bracer I shall require three crushed flame emeralds and an unadorned leather bracelet. Bring me these items and the reward shall be yours to keep.");
		elseif(e.message:findi("glove")) then
			e.self:Say("Your hands are like the wind, everflowing and moving. Subtle one moment, then a howling wind raining blow upon blow to your foes. These gloves shall aid you. In order for me to complete them, I require a pair of unadorned leather gloves and three crushed topaz.");
		elseif(e.message:findi("legging")) then
			e.self:Say("The leggings shall protect you, as the valley shelters the still pool within it from the howling winds. Furnish a pair of unadorned leather leggings and three flawed sea sapphires.");
		elseif(e.message:findi("boot")) then
			e.self:Say("Your feet are as hard as any stone and as swift as a coiled serpent but even the swiftest feet require protection so I shall provide you with these. They should help. Acquire a pair of unadorned leather boots and three crushed pieces of black marble.")
		end
	else --Not ally
		e.self:Say("You must prove your dedication to the Claws of Veeshan before I will speak to you.");		
	end
end	

function event_trade(e)
	quest_helper:quest_turn_in(e, 1, QUEST_ITEMS, quest_helper.skyshrine_armor_success)

end

