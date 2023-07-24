-- monk
local quest_helper = require('velious_quest_helper');
local THURG_ARMOR = quest_helper.THURG_ARMOR;
local QUEST_TEXT = {
    hail="Greetings to you. I seek one that has chosen the path of monkhood. What do you call yourself?",
    monk="Good. I had hoped you were one. I have heard that as seeker of the way you are in constant training to push yourself to your physical and mental limits. It is an admirable quality and I wish to aid you. I will provide you with a cap, a tunic, sleeves, bracers, gloves, leggings and boots.",

}

QUEST_TEXT = quest_helper.merge_tables(QUEST_TEXT, quest_helper.THURG_LEATHER_TEXT);

local QUEST_ITEMS = {
    -- boots
    quest_helper:melee_boots(THURG_ARMOR.Leather_Boots, 31097),
    -- legs
    quest_helper:melee_legs(THURG_ARMOR.Leather_Leggings, 31096),
    -- gloves
    quest_helper:melee_gloves(THURG_ARMOR.Leather_Gloves, 31095),
    -- wrist
    quest_helper:melee_bracer(THURG_ARMOR.Leather_Bracelet, 31094),
    -- arms
    quest_helper:melee_arms(THURG_ARMOR.Leather_Sleeves, 31093),
    -- chest
    quest_helper:melee_chest(THURG_ARMOR.Leather_Tunic, 31092),
    -- helm
    quest_helper:melee_helmet(THURG_ARMOR.Leather_Cap, 31091)
}

function event_say(e)
    quest_helper.quest_text(e, QUEST_TEXT, 3);
end


function event_trade(e)
    quest_helper:quest_turn_in(e, 3, QUEST_ITEMS, quest_helper.thurg_armor_success)
end