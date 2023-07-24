-- mage

local quest_helper = require('velious_quest_helper');
local THURG_ARMOR = quest_helper.THURG_ARMOR;
local QUEST_TEXT = {
	hail="Greetings to you. I seek those who call themselves magicians. Are you a magician, little one?",
	magician="I thought so. I have several tasks for you accomplish. Once you have completed them I will have a cap, a robe, sleeves, wristbands, gloves, leggings and boots to reward you with.",
}

QUEST_TEXT = quest_helper.merge_tables(QUEST_TEXT, quest_helper.THURG_SILK_TEXT);

local QUEST_ITEMS = {
	-- boots
	quest_helper:silk_boots(THURG_ARMOR.Silk_Boots, 31076),
	-- legs
	quest_helper:silk_legs(THURG_ARMOR.Silk_Pantaloons, 31075),
	-- gloves
	quest_helper:silk_gloves(THURG_ARMOR.Silk_Gloves, 31074),
	-- wrist
	quest_helper:silk_bracer(THURG_ARMOR.Silk_Wristband, 31073),
	-- arms
	quest_helper:silk_arms(THURG_ARMOR.Silk_Sleeves, 31072),
	-- chest
	quest_helper:silk_chest(THURG_ARMOR.Silk_Robe, 31071),
	-- helm
	quest_helper:silk_helmet(THURG_ARMOR.Silk_Turban, 31070)
}

function event_say(e)
	quest_helper.quest_text(e, QUEST_TEXT, 3);
end

function event_trade(e)
	quest_helper:quest_turn_in(e, 3, QUEST_ITEMS, quest_helper.thurg_armor_success)
end
