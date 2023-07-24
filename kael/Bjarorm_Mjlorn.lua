--necro

local quest_helper = require('velious_quest_helper');
local KAEL_ARMOR = quest_helper.KAEL_ARMOR;

local QUEST_ITEMS = {
	quest_helper:silk_helmet(KAEL_ARMOR.Silk_Turban, 25412),
	quest_helper:silk_chest(KAEL_ARMOR.Silk_Robe, 25413),
	quest_helper:silk_arms(KAEL_ARMOR.Silk_Sleeves, 25414),
	quest_helper:silk_bracer(KAEL_ARMOR.Silk_Wristband, 25415),
	quest_helper:silk_gloves(KAEL_ARMOR.Silk_Gloves, 25416),
	quest_helper:silk_legs(KAEL_ARMOR.Silk_Pantaloons, 25417),
	quest_helper:silk_boots(KAEL_ARMOR.Silk_Boots, 25418),
}

function event_say(e)
	if(e.other:GetFaction(e.self) < 2) then --Must be ally
		if(e.message:findi("hail")) then
			e.self:Say("I seek those who practice the dark magicks. I seek those who call themselves necromancers. Are you a necromancer?");
		elseif(e.message:findi("necromancer")) then
			e.self:Say("Excellent. Are you sure enough of your skills to undertake my tasks? If not, get out of my sight, weakling!");
		elseif(e.message:findi("task")) then
			e.self:Say("I thought so. One should never back down from a challenge. Once you have completed them I will have a cap, a robe, sleeves, wristbands, gloves, leggings and boots to reward you with.");
		elseif(e.message:findi("cap")) then
			e.self:Say("For you to receive my gift, I shall require an ancient silk turban and three crushed flame opals.");
		elseif(e.message:findi("robe")) then
			e.self:Say("This exquisite robe shall be yours in exchange for an ancient silk robe and three pristine emeralds.");
		elseif(e.message:findi("sleeve")) then
			e.self:Say("For these durable sleeves, you must fetch me a pair of ancient silk sleeves and three flawed topazes.");
		elseif(e.message:findi("wristband")) then
			e.self:Say("The crafting of this wristband requires that you bring me an ancient silk wristband and three crushed pieces of onyx sapphire.");
		elseif(e.message:findi("glove")) then
			e.self:Say("For this fine pair of gloves you must seek out and return to me a pair of ancient silk gloves and a crushed topaz.");
		elseif(e.message:findi("legging")) then
			e.self:Say("This pair of leggings will be yours provided you supply me with a pair of ancient silk pantaloons as well as three nephrites.");
		elseif(e.message:findi("boot")) then
			e.self:Say("These supple boots shall be yours upon receipt of a pair of ancient silk boots and a trilogy of crushed jaundice gems.");
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
	quest_helper:quest_turn_in(e, 1, QUEST_ITEMS, quest_helper.kael_armor_success);
end
