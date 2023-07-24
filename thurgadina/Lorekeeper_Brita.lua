--Enchanter

local quest_helper = require('velious_quest_helper');
local THURG_ARMOR = quest_helper.THURG_ARMOR;

function event_say(e)
	if(e.other:GetFaction(e.self) <= 3 ) then --kindly or better
		if(e.message:findi("hail")) then
			e.self:Say("Greetings to you.  I seek those who call themselves enchanters.  Are you an enchanter?");
		elseif(e.message:findi("enchanter")) then
			e.self:Say("I thought so.  I have several tasks for you accomplish.  Once you have completed them I will have a cap, a robe, sleeves, wristbands, gloves, leggings and boots to reward you with.");
 		elseif(e.message:findi("cap")) then
			e.self:Say("For an enchanted head guard bring me a torn enchanted silk turban as well as three pieces of crushed flame opal.");
 		elseif(e.message:findi("robe")) then
			e.self:Say("With three pristine emeralds and a torn enchanted silk robe I will fashion a wonderous robe for you.");
		elseif(e.message:findi("sleeve")) then
			e.self:Say("Bring unto me a set of torn enchanted silk sleeves as well as three flawed topaz.  With these in my possession I can create a set of enchanted sleeves the likes of which spellcasters like you dream of.");
		elseif(e.message:findi("wristband")) then
			e.self:Say("An enchanted silk wristguard and three crushed onyx sapphires is all that I require to create an imbued wrist wrap of great power.  Seek out these items and return to me when you have acquired them.");
		elseif(e.message:findi("legging")) then
			e.self:Say("Three nephrite and a pair of torn enchanted silk leggings will net you a fine set of pantaloons.");
		elseif(e.message:findi("boot")) then
			e.self:Say("Three crushed jaundice gems combined with torn enchanted silk boots would make a most interesting set of footwear.  The latent powers of the gems can be harnessed to create magical effects.");
		elseif(e.message:findi("glove")) then
			e.self:Say("If you seek gloves of great power, bring to me three crushed topaz and a pair of torn enchanted silk gloves.  I will use the power of the gems to imbue the gloves.");
		end
	else
		e.self:Say("I do not know you well enough to entrust you with such a quest, yet.");
	end
end

local QUEST_ITEMS = {
	-- boots
	quest_helper:silk_boots(THURG_ARMOR.Silk_Boots, 31083),
	-- legs
	quest_helper:silk_legs(THURG_ARMOR.Silk_Pantaloons, 31082),
	-- gloves
	quest_helper:silk_gloves(THURG_ARMOR.Silk_Gloves, 31081),
	-- wrist
	quest_helper:silk_bracer(THURG_ARMOR.Silk_Wristband, 31080),
	-- arms
	quest_helper:silk_arms(THURG_ARMOR.Silk_Sleeves, 31079),
	-- chest
	quest_helper:silk_chest(THURG_ARMOR.Silk_Robe, 31078),
	-- helm
	quest_helper:silk_helmet(THURG_ARMOR.Silk_Turban, 31077),
}

function event_trade(e)

	local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 1427, item2 = 1417})) then
		e.self:Say("Ohh, that's better. I get so touchy when I'm hungry. I should probably go apologize to Derrin for being snappy. Please return this to Mordin for me.");
		e.other:Faction(e.self,406, 3); --coldain
		e.other:Faction(e.self,405, 1); --Dain
		e.other:Faction(e.self,419, -1); --kromrif
		e.other:Faction(e.self,448, -1); --kromzek
		e.other:QuestReward(e.self, 0, 0, 0, 0, 1424, 15000);
	end
	quest_helper:quest_turn_in(e, 3, QUEST_ITEMS, quest_helper.thurg_armor_success)
end
