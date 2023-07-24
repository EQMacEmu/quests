--bard

local quest_helper = require('velious_quest_helper');
local KAEL_ARMOR = quest_helper.KAEL_ARMOR;

local QUEST_ITEMS = {
	quest_helper:melee_helmet(KAEL_ARMOR.Plate_Helmet, 25384), --Helm
	quest_helper:melee_chest(KAEL_ARMOR.Breastplate, 25385), -- Breastplate
	quest_helper:melee_arms(KAEL_ARMOR.Plate_Vambraces, 25386), -- Arms
	quest_helper:melee_bracer(KAEL_ARMOR.Plate_Bracer, 25387), --Bracer
	quest_helper:melee_gloves(KAEL_ARMOR.Plate_Gauntlets, 25388), --gloves
	quest_helper:melee_legs(KAEL_ARMOR.Plate_Greaves, 25389), --legs
	quest_helper:melee_boots(KAEL_ARMOR.Plate_Boots, 25390), --boots
}

function event_say(e)
	if(e.other:GetFaction(e.self) < 2) then -- Must be ally
		if(e.message:findi("hail")) then
			e.self:Say("Hail! I long to speak with a minstrel. I am curious about what has gone on beyond our borders here. Are you a bard? If not then I have no use for you.");
		elseif(e.message:findi("bard")) then
			e.self:Say("So troubadour, what news and stories have you from the New World? Oh, I forget my manners. We shall exchange talk another time. You seek something do you not? A new outfit perhaps?");
		elseif(e.message:findi("new outfit")) then
			e.self:Say("Well then, I have just what you need. Now, my terms of payment is thus, you gather some things for me and in return I shall craft you the finest armor a bard has ever seen! A new outfit comprised of a helm, breastplate, armplates, bracers, gauntlets, greaves, and boots shall make you the envy of your peers, my little friend.");
		elseif(e.message:findi("helm")) then
			e.self:Say("A brand new shiny helm shall be yours once I have an ancient tarnished plate helmet and three pieces of crushed coral. May the audience swoon in your presence.");
		elseif(e.message:findi("breastplate")) then
			e.self:Say("I have need of an ancient tarnished breastplate and three flawless diamonds. Find these for me and I shall craft you a breastplate, minstrel. May it protect you from unruly audiences with rotten vegetables.");
		elseif(e.message:findi("armplate")) then
			e.self:Say("A gorgeous pair of armplates shall be yours once you have retrieved a pair of ancient tarnished plate vambraces and three flawed emeralds. The detail and craftsmanship is stunning!");
		elseif(e.message:findi("bracer")) then
			e.self:Say("A pair of bracers shall be yours upon receipt of an ancient tarnished plate bracer and three crushed flame emeralds. May your songs never falter during a tactical retreat.");
		elseif(e.message:findi("gauntlet")) then
			e.self:Say("It would be a shame if your hands were to be injured and not be able to play your instruments wouldn't it? I shall craft some gauntlets so that your nimble digits remain intact. Bring me a pair of ancient tarnished plate gauntlets as well as three crushed topaz.");
		elseif(e.message:findi("greave")) then
			e.self:Say("Some new greaves would do you some good. The pair you have now looks quite stained and worn. Nevermind, fetch me a pair of ancient tarnished plate greaves and three flawed sea sapphires.");
		elseif(e.message:findi("boot")) then
			e.self:Say("A fancy pair of boots you want is it? Yes, I can see the pair you have now looks a bit worn from running so much. All I require is a set of three crushed pieces of black marble and a pair of ancient tarnished plate boots.");
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
