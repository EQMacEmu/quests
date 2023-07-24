-- cleric

local quest_helper = require('velious_quest_helper');
local SKYSHRINE_ARMOR = quest_helper.SKYSHRINE_ARMOR;

local QUEST_ITEMS = {
  quest_helper:priest_helmet(SKYSHRINE_ARMOR.Plate_Helmet, 31140), --helm
  quest_helper:priest_chest(SKYSHRINE_ARMOR.Breastplate, 31141), --bp
  quest_helper:priest_arms(SKYSHRINE_ARMOR.Plate_Vambraces, 31142), -- arms
  quest_helper:priest_bracer(SKYSHRINE_ARMOR.Plate_Bracer, 31143), --bracer
  quest_helper:priest_gloves(SKYSHRINE_ARMOR.Plate_Gauntlets, 31144), -- gloves
  quest_helper:priest_legs(SKYSHRINE_ARMOR.Plate_Greaves, 31145), -- legs
  quest_helper:priest_boots(SKYSHRINE_ARMOR.Plate_Boots, 31146) -- boots
}

function event_say(e)
	if (e.other:GetFaction(e.self) < 2) then --Must be ally
		if(e.message:findi("hail")) then
			e.self:Say("Hail, most pious one. I sense the aura of your devotion and conviction and it is strong about you. A shame you are so short lived, mortal. But I see potential in you and for that I shall aid you in your calling if you are a cleric. Do you wish my aid?");
		elseif(e.message:findi("aid")) then
			e.self:Say("Then I have a set of goals for you. Once you have achieved them, you shall be rewarded with a helm, a breastplate, armplates, bracers, gauntlets, greaves and boots. May they protect you from your enemies.");
		elseif(e.message:findi("helm")) then
			e.self:Say("I shall craft a helm for you but you must seek these items out for me first. I have need of an unadorned plate helmet and three pieces of crushed onyx sapphire.");
		elseif(e.message:findi("breastplate")) then
			e.self:Say("As your faith protects you, so shall this breastplate. I must have an unadorned breastplate and three pieces of black marble.");
		elseif(e.message:findi("armplate")) then
			e.self:Say("Such lofty goals your kind sets for yourselves. But, that is the way of your kind, I suppose - to seek that which is the most difficult to attain. Bring to me a set of unadorned vambraces and three jaundice gems and you will receive your reward.");	
		elseif(e.message:findi("bracer")) then
			e.self:Say("For the bracers, faithful one, I shall require the acquisition of an unadorned plate bracer as well as three crushed opals.");
		elseif(e.message:findi("gauntlet")) then
			e.self:Say("I will need a pair of unadorned gauntlets as well as three crushed lava rubies, so that I may make your reward.");
		elseif(e.message:findi("greave")) then
			e.self:Say("You shall acquire a pair of unadorned plate greaves and three chipped onyx sapphires for me. I await your return.");
		elseif(e.message:findi("boot")) then
			e.self:Say("With your aid, I shall make a pair of fine boots for you. All that is needed are a pair of unadorned plate boots and three crushed flame emeralds.");
		end
	else --Not ally
		e.self:Say("You must prove your dedication to the Claws of Veeshan before I will speak to you."); 
	end

end

function event_trade(e)
	quest_helper:quest_turn_in(e, 1, QUEST_ITEMS, quest_helper.skyshrine_armor_success)
end