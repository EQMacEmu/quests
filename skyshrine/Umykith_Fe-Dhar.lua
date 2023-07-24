--bard

local quest_helper = require('velious_quest_helper');
local SKYSHRINE_ARMOR = quest_helper.SKYSHRINE_ARMOR;

local QUEST_ITEMS = {
	quest_helper:melee_helmet(SKYSHRINE_ARMOR.Plate_Helmet, 31133), --helm
	quest_helper:melee_chest(SKYSHRINE_ARMOR.Breastplate, 31134), --bp
	quest_helper:melee_arms(SKYSHRINE_ARMOR.Plate_Vambraces, 31135), -- arms
	quest_helper:melee_bracer(SKYSHRINE_ARMOR.Plate_Bracer, 31136), --bracer
	quest_helper:melee_gloves(SKYSHRINE_ARMOR.Plate_Gauntlets, 31137), -- gloves
	quest_helper:melee_legs(SKYSHRINE_ARMOR.Plate_Greaves, 31138), -- legs
	quest_helper:melee_boots(SKYSHRINE_ARMOR.Plate_Boots, 31139), -- boots
}

function event_say(e)
	if(e.other:GetFaction(e.self) <= 1 ) then --Must be ally
		if(e.message:findi("hail")) then
			e.self:Say("Hail! What news and stories have you from the New World? Perhaps if you are a bard you can spin me stories of those lands. Oh, I forget my manners. We shall exchange talk another time. You seek something, do you not? A new outfit perhaps?");
		elseif(e.message:findi("outfit")) then
			e.self:Say("Well, then I have just what you need. Now, my terms of payment are thus, you gather some things for me and in return I shall craft you the finest armor a bard has ever seen! A new outfit comprised of a helm, breastplate, armplates, bracers, gauntlets, greaves, and boots shall make you the envy of your peers, my little friend.");
		elseif(e.message:findi("helm")) then
			e.self:Say("A brand new shiny helm shall be yours once I have an unadorned plate helmet and three pieces of crushed coral. May the audience swoon in your presence.");
		elseif(e.message:findi("breastplate")) then
			e.self:Say("For the breastplate, I require an unadorned breastplate and three flawless diamonds. Nothing more, nothing less. For perfection, there is a price, insignificant one.");
		elseif(e.message:findi("armplate")) then
			e.self:Say("For the armplates, I need these components - unadorned plate vambraces as well as three flawed emeralds. Now go and fetch them before I change my mind.");
		elseif(e.message:findi("bracer")) then
		   e.self:Say("A pair of bracers shall be yours upon receipt of an unadorned plate bracer and three crushed flame emeralds. May your songs never falter during a tactical retreat.");
		elseif(e.message:findi("gauntlet")) then
			e.self:Say("It would be a shame if your hands were to be injured wouldn't it? I shall craft some gauntlets so that your nimble digits remain intact. Bring me a pair of unadorned plate gauntlets as well as three crushed topaz.");
		elseif(e.message:findi("greave")) then
			e.self:Say("Some new greaves would do you some good. The pair you have now looks quite stained and worn. Fetch me a pair of unadorned plate greaves and three flawed sea sapphires.");
		elseif(e.message:findi("boot")) then
			e.self:Say("You wish to have a pair of boots? Then acquire these items for me. Three pieces of crushed black marble and a pair of unadorned plate boots. I tire of your prattle. Go away now.");
		end 
	else --Not ally
		e.self:Say("You must prove your dedication to the Claws of Veeshan before I will speak to you.");
	end
end

function event_trade(e)
	quest_helper:quest_turn_in(e, 1, QUEST_ITEMS, quest_helper.skyshrine_armor_success) 
end
