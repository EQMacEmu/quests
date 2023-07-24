-- cleric

local quest_helper = require('velious_quest_helper');
local THURG_ARMOR = quest_helper.THURG_ARMOR;

local QUEST_ITEMS = {
	-- boots
	quest_helper:priest_boots(THURG_ARMOR.Plate_Boots, 31048),
	-- legs
	quest_helper:priest_legs(THURG_ARMOR.Plate_Greaves, 31047),
	-- gloves
	quest_helper:priest_gloves(THURG_ARMOR.Plate_Gauntlets, 31046),
	-- wrist
	quest_helper:priest_bracer(THURG_ARMOR.Plate_Bracer, 31045),
	-- arms
	quest_helper:priest_arms(THURG_ARMOR.Plate_Vambraces, 31044),
	-- bp	
	quest_helper:priest_chest(THURG_ARMOR.Breastplate, 31043),
	-- helm
	quest_helper:priest_helmet(THURG_ARMOR.Plate_Helmet, 31042)
}

function event_say(e)
	if (e.other:GetFaction(e.self) <= 3) then
		if(e.message:findi("hail")) then	
			e.self:Say("Greetings to you. You are far away from your homelands, stranger. I am looking for someone. We here at the Temple of Lore are always seeking fellow priests of various faiths. Tell me, "..e.other:Race()..", are you a cleric?");
		elseif(e.message:findi("cleric")) then	
			e.self:Say("Ah, a most pious one indeed. I sense the aura of your devotion and conviction and they are strong about you. A shame you are so short-lived. But I see potential in you and for that I shall aid you in your calling, cleric. Do you wish my aid?");
		elseif(e.message:findi("aid")) then	
			e.self:Say("Then I have a set of goals for you.  Once you have achieved them, you shall be rewarded with such as these: a helm, a breastplate, armplates, bracers, gauntlets, greaves and boots.  May they protect you from your enemies.");
		elseif(e.message:findi("helm")) then	
			e.self:Say("Those who are wise as we are know that protection of the head is most important.  I may be able to forge you something most interesting if you were to bring me a corroded plate helm and three pieces of crushed onyx sapphire.");
		elseif(e.message:findi("breastplate")) then	
			e.self:Say("If you find a corroded breastplate and three pieces of black marble bring them to me and I shall attempt to create an enchanted breastplate that will serve you well.")	
		elseif(e.message:findi("armplate")) then	
			e.self:Say("Three jaundice gems and a set of corroded plate vambraces might be an interesting combination.  The powers of the gems may be harvested to imbue the vambraces.");
		elseif(e.message:findi("bracer")) then	
			e.self:Say("Bracers are quite easy to imbue.  Simply find three crushed opals and a corroded plate bracer and I will complete the ritual to enchant them.");
		elseif(e.message:findi("boot")) then	
			e.self:Say("Simply bring me a set of three crushed flame emeralds and a pair of corroded plate boots and I will imbue them.  I bid you good luck in finding such things.");
		elseif(e.message:findi("gauntlet")) then	
			e.self:Say("Strong protection for one's hands is important.  I may be able to craft you a set of powerful plate gauntlets if you find a set of corroded plate gauntlets and three crushed lava rubies.");
		elseif(e.message:findi("greave")) then	
			e.self:Say("'A set of corroded greaves might be salvageable if you were to find three chipped onyx sapphires. With the right techniques almost anything is possible.");
		end
	else
		e.self:Say("I do not know you well enough to entrust you with such a quest, yet.");
	end
end

function event_signal(e)
	if (e.signal == 1) then
		e.self:Say("The Grand Historian cannot be disturbed right now. Loremaster Borannin will assist you if you seek to perform duties for the crown. If you wish to learn more of our history and culture please speak to the loremasters in the Temple's library here.");
	end
end

function event_trade(e)
	quest_helper:quest_turn_in(e, 3, QUEST_ITEMS, quest_helper.thurg_armor_success)
end
