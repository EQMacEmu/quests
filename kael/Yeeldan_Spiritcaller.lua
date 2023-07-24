--shaman

local quest_helper = require('velious_quest_helper');
local KAEL_ARMOR = quest_helper.KAEL_ARMOR;

local QUEST_ITEMS = {
	quest_helper:priest_helmet(KAEL_ARMOR.Chain_Coif, 25356), --helm
	quest_helper:priest_chest(KAEL_ARMOR.Chain_Tunic, 25357), -- Breastplate
	quest_helper:priest_arms(KAEL_ARMOR.Chain_Sleeves, 25358), -- Arms
	quest_helper:priest_bracer(KAEL_ARMOR.Chain_Bracer, 25359), --Bracer
	quest_helper:priest_gloves(KAEL_ARMOR.Chain_Gauntlets, 25360), --gloves
	quest_helper:priest_legs(KAEL_ARMOR.Chain_Leggings, 25361), --legs
	quest_helper:priest_boots(KAEL_ARMOR.Chain_Boots, 25362), --boots
}

function event_say(e)
	if(e.other:GetFaction(e.self) <= 1) then --Must be ally
		if(e.message:findi("hail")) then
			e.self:Emote("speaks in a rumbling tone. 'Greetings. I only wish to speak to a shaman. Are you what I seek?'");
		elseif(e.message:findi("shaman")) then
			e.self:Say("I sense the spirit of your totem within you and it is strong with power. You have learned much from your travels and I shall help you, by providing you with protection from harm and the elements, in the form of armor");
		elseif(e.message:findi("armor")) then
			e.self:Say("For you I shall make a coif, breastplate, sleeves, bracers, gauntlets, leggings, and boots. Each piece is a quest unto itself. To seek the components, you must search the lands for them and test the power of the spirit within.");
		elseif(e.message:findi("coif")) then
			e.self:Say("The coif I shall make will be comprised of an ancient tarnished coif and three crushed onyx sapphires. I shall be waiting.");
		elseif(e.message:findi("breastplate")) then
			e.self:Say("A breastplate to protect the spirit within. I shall make one for you granted that you retrieve the components I shall need. An ancient tarnished chain tunic and three pieces of black marble. I await your return.");
		elseif(e.message:findi("sleeve")) then
			e.self:Say("Sleeves I shall make upon receipt of three jaundice gems and an ancient tarnished chain sleeve. Complete this simple task and they are yours.");
		elseif(e.message:findi("bracer")) then
			e.self:Say("A bracer of mystic power I shall grant you. All I require is the acquisition of an ancient tarnished chain bracer and three crushed opal.");
		elseif(e.message:findi("gauntlet")) then
			e.self:Say("I shall require an ancient tarnished pair of chain gauntlets and three crushed lava rubys to complete my ritual.");
		elseif(e.message:findi("legging")) then
			e.self:Say("You seek leggings? Then provide for me, three chipped onyx and a pair of ancient tarnished chain leggings. I will give these to you for your service.");
		elseif(e.message:findi("boot")) then
			e.self:Say("These boots will help you in your battles to come. I shall grant them upon receipt of three crushed flame emeralds and a pair of an ancient tarnished chain boots.");
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
