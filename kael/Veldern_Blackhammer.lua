--shadowknight

local quest_helper = require('velious_quest_helper');
local KAEL_ARMOR = quest_helper.KAEL_ARMOR;

local QUEST_ITEMS = {
	quest_helper:melee_helmet(KAEL_ARMOR.Plate_Helmet, 25349), --Helm
	quest_helper:melee_chest(KAEL_ARMOR.Breastplate, 25350), -- Breastplate
	quest_helper:melee_arms(KAEL_ARMOR.Plate_Vambraces, 25351), -- Arms
	quest_helper:melee_bracer(KAEL_ARMOR.Plate_Bracer, 25352), --Bracer
	quest_helper:melee_gloves(KAEL_ARMOR.Plate_Gauntlets, 25353), --gloves
	quest_helper:melee_legs(KAEL_ARMOR.Plate_Greaves, 25354), --legs
	quest_helper:melee_boots(KAEL_ARMOR.Plate_Boots, 25355), --boots
}

function event_say(e)
	if(e.other:GetFaction(e.self) < 2) then --Must be ally
		if(e.message:findi("hail")) then 
			e.self:Emote("looks around. 'Who dares address me? Oh, it is a " .. e.other:Race() .. ". Only a shadowknight may address me and proceed further. Are you a shadowknight? Speak, oaf! Otherwise take your prattle elsewhere.'");
		elseif(e.message:findi("shadowknight")) then
			e.self:Say("What is it you want little one? Some armor perhaps? To make a pretty meal? I hate when bits of armor get stuck in my gullet. It is very annoying.");
		elseif(e.message:findi("some armor")) then
			e.self:Emote("laughs deeply at you. 'You are so transparent, " .. e.other:GetCleanName() .. ". Well, if armor is what you wish, then only the best shall you have for I will not waste my time on nothing less. This is what I will make for you, granted that you can acquire the components for me, a helm, breastplate, armplates, bracers, gauntlets, leggings, and boots.'");
		elseif(e.message:findi("helm")) then
			e.self:Say("For the helm I shall require an ancient tarnished plate helmet and three pieces of crushed coral. Does your tiny mind comprehend the task set before you? If so, then get them immediately! I am beginning to get hungry and you are looking all the better as a snack.");
		elseif(e.message:findi("breastplate")) then
			e.self:Say("For the breastplate, I require this. An ancient tarnished breastplate and three flawless diamonds. Nothing more, nothing less. For perfection, there is a price, insignificant one.");
		elseif(e.message:findi("armplate")) then
			e.self:Say("For the armplates, I need these components, an ancient tarnished plate vambraces as well as three flawed emeralds. Now go and fetch them before I change my mind.");
		elseif(e.message:findi("bracer")) then
			e.self:Say("For the bracers, I will require an ancient tarnished plate bracer and three crushed flame emeralds. Now go away before I use your insides as decoration for my boot.");
		elseif(e.message:findi("gauntlet")) then
			e.self:Say("Your hands are quite important are they not? For without them, you cannot use your precious weapons or shields to protect yourself. You humor me with your feeble attempts. Fetch me an ancient tarnished plate gauntlets and three crushed pieces of topaz for your precious little hands.");
		elseif(e.message:findi("legging")) then
			e.self:Say("Legs... they are my favorite part of any meal. I like to pull them off first and...Oh, yes, where was I? The leggings. Go and retrieve an ancient tarnished plate greave as well as three flawed sea sapphires. Now, leave my sight before I sample one of yours.");
		elseif(e.message:findi("boot")) then
			e.self:Say("You wish to have a pair of boots? Then acquire these items for me. A pair of ancient tarnished plate boots and three pieces of crushed black marble. I tire of your prattle. Go away now.");
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
