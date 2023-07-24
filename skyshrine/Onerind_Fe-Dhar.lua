--shadowknight

local quest_helper = require('velious_quest_helper');
local SKYSHRINE_ARMOR = quest_helper.SKYSHRINE_ARMOR;

local QUEST_ITEMS = {
	quest_helper:melee_helmet(SKYSHRINE_ARMOR.Plate_Helmet, 31098), --helm
	quest_helper:melee_chest(SKYSHRINE_ARMOR.Breastplate, 31099), --bp
	quest_helper:melee_arms(SKYSHRINE_ARMOR.Plate_Vambraces, 31100), -- arms
	quest_helper:melee_bracer(SKYSHRINE_ARMOR.Plate_Bracer, 31101), --bracer
	quest_helper:melee_gloves(SKYSHRINE_ARMOR.Plate_Gauntlets, 31102), -- gloves
	quest_helper:melee_legs(SKYSHRINE_ARMOR.Plate_Greaves, 31103), -- legs
	quest_helper:melee_boots(SKYSHRINE_ARMOR.Plate_Boots, 31104), -- boots
}

function event_say(e)
	if(e.other:GetFaction(e.self) <= 1 ) then --Must be ally
		if(e.message:findi("hail")) then
			e.self:Emote("looks around. 'Who dares address me? Oh, it is you. What is it you want? Some armor perhaps? To make a pretty corpse? There is something exquisite about a well-dressed meal. If you are not a shadowknight leave me now or you may end up as my next meal.'");
		elseif(e.message:findi("armor")) then
			e.self:Emote("laughs deeply, 'You manlings are so transparent. Well, if armor is what you wish, then only the best shall you have for I will not waste my time on less than the best. This is what I will make for you, granted that you can acquire the components for me - a helm, breastplate, armplates, bracers, gauntlets, leggings, and boots.'");
		elseif(e.message:findi("helm")) then
			e.self:Say("For the helm I shall require an unadorned plate helmet and three pieces of crushed coral for my trouble. Does your tiny mind comprehend the task set before you? If so, then get them immediately! I am beginning to get hungry and you are looking all the better as a snack.");
		elseif(e.message:findi("breastplate")) then
			e.self:Say("For the breastplate, I require an unadorned breastplate and three flawless diamonds. Nothing more, nothing less. For perfection, there is a price, insignificant one.");
		elseif(e.message:findi("armplate")) then
			e.self:Say("For the armplates, I need these components - unadorned plate vambraces as well as three flawed emeralds. Now go and fetch them before I change my mind.");
		elseif(e.message:findi("bracer")) then
			e.self:Say("For the bracers, I will require an unadorned plate bracer and a set of three crushed flame emeralds. Now go away before I use your insides as decoration for my gullet.");
		elseif(e.message:findi("gauntlet")) then
			e.self:Say("Your hands are quite important, aren't they? For without them, you cannot use your precious weapons or shields to protect yourselves. You humor me with your feeble attempts. Fetch me a set of unadorned plate gauntlets and three crushed topaz for your precious little gauntlets.");
		elseif(e.message:findi("legging")) then
			e.self:Say("Legs?? They are my favorite part of a meal. Some of my brethren consider them too tough, but I like them chewy. Don't you agree? Oh, yes, where was I? The leggings. Go and retrieve unadorned plate greaves as well as three flawed sea sapphires. Leave my sight before I sample one of yours.");
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
