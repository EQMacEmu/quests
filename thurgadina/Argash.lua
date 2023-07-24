-- ranger
local quest_helper = require('velious_quest_helper');
local THURG_ARMOR = quest_helper.THURG_ARMOR;
local QUEST_TEXT = {
    hail="Greetin's, -name, you look like a -race who knows the value of a good bow when ye see one. I'll let ye in on a li'l secret, the bow is the greatest of all weapons as it allows you to inflict maximum punishment on yer foes with minimum risk. How can ye possibly go wrong? Or better yet, if'n ye be a ranger, I can see my way clear to making you a coif, tunic, sleeves, bracer, gauntlets, leggings, or boots that I'm sure ye would enjoy.",
}

QUEST_TEXT = quest_helper.merge_tables(QUEST_TEXT, quest_helper.THURG_CHAIN_TEXT);

local QUEST_ITEMS = {
    -- boots
    quest_helper:melee_boots(THURG_ARMOR.Chain_Boots, 31020),
    -- legs
    quest_helper:melee_legs(THURG_ARMOR.Chain_Leggings, 31019),
    -- gloves
    quest_helper:melee_gloves(THURG_ARMOR.Chain_Gauntlets, 31018),
    -- wrist
    quest_helper:melee_bracer(THURG_ARMOR.Chain_Bracer, 31017),
    -- arms
    quest_helper:melee_arms(THURG_ARMOR.Chain_Sleeves, 31016),
    -- chest
    quest_helper:melee_chest(THURG_ARMOR.Chain_Tunic, 31015),
    -- helm
    quest_helper:melee_helmet(THURG_ARMOR.Chain_Coif, 31014)
}

function event_say(e)
    quest_helper.quest_text(e, QUEST_TEXT, 3);
end


function event_trade(e)
    quest_helper:quest_turn_in(e, 3, QUEST_ITEMS, quest_helper.thurg_armor_success)
end
