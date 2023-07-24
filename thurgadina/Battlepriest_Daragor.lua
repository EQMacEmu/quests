-- paladin
local quest_helper = require('velious_quest_helper');
local THURG_ARMOR = quest_helper.THURG_ARMOR;
local QUEST_TEXT = {
    hail="Greetings to you. I seek the service of devout knights who have distinguished themselves. Are you a paladin, -name?",
    paladin="A paladin of your kind has not made it this far for quite some time. Well, I wonder what it is you seek here? Do you seek heroic and chivalrous deeds to distinguish yourself from your brethren? Do you need accoutrements to aid you in your battles perhaps? You are in luck, knight, for I have both for you. Do you wish to partake of my quests?",
    partake="Excellent! By serving my cause, you, in turn, will further your own. I require certain components and if you bring them to me I shall reward you for your honorable service. You may choose from among these items: a helm, a breastplate, armplates, bracers, gauntlets, greaves, and boots.",
}

QUEST_TEXT = quest_helper.merge_tables(QUEST_TEXT, quest_helper.THURG_PLATE_TEXT);

local QUEST_ITEMS = {
    -- boots
    quest_helper:melee_boots(THURG_ARMOR.Plate_Boots, 31027),
    -- legs
    quest_helper:melee_legs(THURG_ARMOR.Plate_Greaves, 31026),
    -- gloves
    quest_helper:melee_gloves(THURG_ARMOR.Plate_Gauntlets, 31025),
    -- wrist
    quest_helper:melee_bracer(THURG_ARMOR.Plate_Bracer, 31024),
    -- arms
    quest_helper:melee_arms(THURG_ARMOR.Plate_Vambraces, 31023),
    -- chest
    quest_helper:melee_chest(THURG_ARMOR.Breastplate, 31022),
    -- helm
    quest_helper:melee_helmet(THURG_ARMOR.Plate_Helmet, 31021)
}

function event_say(e)
    quest_helper.quest_text(e, QUEST_TEXT, 3);
end


function event_trade(e)
    quest_helper:quest_turn_in(e, 3, QUEST_ITEMS, quest_helper.thurg_armor_success)
end
