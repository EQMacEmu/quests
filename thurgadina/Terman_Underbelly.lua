-- shaman

local quest_helper = require('velious_quest_helper');
local THURG_ARMOR = quest_helper.THURG_ARMOR;

local QUEST_ITEMS = {
	quest_helper:priest_helmet(THURG_ARMOR.Chain_Coif, 31007), --helm
	quest_helper:priest_chest(THURG_ARMOR.Chain_Tunic, 31008), --bp
	quest_helper:priest_arms(THURG_ARMOR.Chain_Sleeves, 31009), -- arms
	quest_helper:priest_bracer(THURG_ARMOR.Chain_Bracer, 31010), --bracer
	quest_helper:priest_gloves(THURG_ARMOR.Chain_Gauntlets, 31011), -- gloves
	quest_helper:priest_legs(THURG_ARMOR.Chain_Leggings, 31012), -- legs
	quest_helper:priest_boots(THURG_ARMOR.Chain_Boots, 31013) -- boots
}

function event_say(e)
	if (e.other:GetFaction(e.self) <= 3) then
		if (e.message:findi("hail")) then	
			e.self:Emote("speaks in a rumbling tone. 'Greetings. I only wish to speak to a shaman. Are you a shaman?'");
		elseif (e.message:findi("shaman")) then	
			e.self:Say("I sense the strength of your mystical powers within you and they vibrate with power.  You have learned much from your travels and I shall help you by providing you with protection from harm and the elements in the form of armor.");
		elseif (e.message:findi("armor")) then	
			e.self:Say("For you I shall make a coif, tunic, sleeves, bracers, gauntlets, leggings, and boots. Each piece is a quest unto itself. To find the components you must search the lands for them and test the power of the spirit within.");
		elseif (e.message:findi("coif")) then	
			e.self:Say("Those who are wise as we are know that protection of the head is most important. I may be able to forge you something most interesting if you were to bring me a corroded chain coif and three pieces of crushed onyx sapphire.");
		elseif (e.message:findi("tunic")) then	
			e.self:Say("If you find a corroded chain tunic and three pieces of black marble bring them to me and I shall attempt to create an enchanted tunic that will serve you well.");
		elseif (e.message:findi("sleeve")) then	
			e.self:Say("Three jaundice gems and a set of corroded chain sleeves might be an interesting combination. The powers of the gems may be harnessed to imbue the sleeves.");
		elseif (e.message:findi("bracer")) then	
			e.self:Say("Bracers are quite easy to imbue. Simply find three crushed opals and a corroded chain bracer and I will complete the ritual to enchant them.");
		elseif (e.message:findi("gauntlet")) then		
			e.self:Say("Strong protection for one's hands is important. I may be able to craft you a set of powerful chain gauntlets if you find a set of corroded chain gauntlets and three crushed lava rubies.");
		elseif (e.message:findi("legging")) then		
			e.self:Say("Leggings are a bit trickier to imbue. Three chipped onyx sapphires will allow me to channel the correct energies into a pair of corroded chain leggings. However, those chipped onyx sapphires are somewhat rare. Return to me if you find such things in your journeys.");
		elseif (e.message:findi("boot")) then	
			e.self:Say("Simply bring me a set of three crushed flame emeralds and a pair of corroded chain boots and I will imbue them. I bid you good luck in finding such things.");
		end
	else
		e.self:Say("I do not know you well enough to entrust you with such a quest, yet.");
	end
end

function event_trade(e)
	quest_helper:quest_turn_in(e, 3, QUEST_ITEMS, quest_helper.thurg_armor_success)
end
