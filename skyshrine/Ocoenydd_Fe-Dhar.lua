--magician

local quest_helper = require('velious_quest_helper');
local SKYSHRINE_ARMOR = quest_helper.SKYSHRINE_ARMOR;

local QUEST_ITEMS = {
	quest_helper:silk_helmet(SKYSHRINE_ARMOR.Silk_Turban, 31168), -- helm
	quest_helper:silk_chest(SKYSHRINE_ARMOR.Silk_Robe, 31169), -- chest
	quest_helper:silk_arms(SKYSHRINE_ARMOR.Silk_Sleeves, 31170), -- arms
	quest_helper:silk_bracer(SKYSHRINE_ARMOR.Silk_Wristband, 31171), -- wrist
	quest_helper:silk_gloves(SKYSHRINE_ARMOR.Silk_Gloves, 31172), -- gloves
	quest_helper:silk_legs(SKYSHRINE_ARMOR.Silk_Pantaloons, 31173), -- legs
	quest_helper:silk_boots(SKYSHRINE_ARMOR.Silk_Boots, 31174), -- boots
}

function event_say(e)
    if(e.other:GetFaction(e.self) < 2) then -- Must be ally
        if(e.message:findi("hail")) then
            e.self:Say("Greetings to you. I seek those who call themselves magicians. Are you a magician, little one?");
        elseif(e.message:findi("magician")) then
            e.self:Say("I thought so. I have several tasks for you accomplish. Once you have completed them I will have a cap, a robe, sleeves, wristbands, gloves, leggings and boots to reward you with.");
        elseif(e.message:findi("cap")) then
            e.self:Say("For you to receive my gift, I shall require three crushed flame opals and a tattered silk turban.");
        elseif(e.message:findi("robe")) then
            e.self:Say("This exquisite robe shall be yours in exchange for a tattered silk robe and three pristine emeralds.");
        elseif(e.message:findi("sleeve")) then
            e.self:Say("For these durable sleeves, you must fetch me a pair of tattered silk sleeves and three flawed topaz.");
        elseif(e.message:findi("wristband")) then
            e.self:Say("The crafting of this wristband requires that you bring me a tattered silk wristband and three crushed onyx sapphires.");
        elseif(e.message:findi("glove")) then
            e.self:Say("For this fine pair of gloves you must seek out and return to me a pair of tattered silk gloves and three crushed topaz.");
        elseif(e.message:findi("legging")) then
            e.self:Say("This pair of leggings will be yours provided you supply me with a pair of tattered silk pantaloons and three nephrite.");
        elseif(e.message:findi("boot")) then
            e.self:Say("These supple boots shall be yours upon receipt of a pair of tattered silk boots and three crushed jaundice gems.");
        end
    else --Not ally
        e.self:Say("You must prove your dedication to the Claws of Veeshan before I will speak to you.");
    end
end

function event_trade(e)
	quest_helper:quest_turn_in(e, 1, QUEST_ITEMS, quest_helper.skyshrine_armor_success) 
end

