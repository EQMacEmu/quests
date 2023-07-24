-- ranger

local quest_helper = require('velious_quest_helper');
local KAEL_ARMOR = quest_helper.KAEL_ARMOR;

local QUEST_ITEMS = {
	quest_helper:melee_helmet(KAEL_ARMOR.Chain_Coif, 25363), --Helm
	quest_helper:melee_chest(KAEL_ARMOR.Chain_Tunic, 25364), -- Breastplate
	quest_helper:melee_arms(KAEL_ARMOR.Chain_Sleeves, 25365), -- Arms
	quest_helper:melee_bracer(KAEL_ARMOR.Chain_Bracer, 25366), --Bracer
	quest_helper:melee_gloves(KAEL_ARMOR.Chain_Gauntlets, 25367), --gloves
	quest_helper:melee_legs(KAEL_ARMOR.Chain_Leggings, 25368), --legs
	quest_helper:melee_boots(KAEL_ARMOR.Chain_Boots, 25369), --boots
}

function event_say(e)
	if(e.other:GetFaction(e.self) < 2) then --Must be ally
		if(e.message:findi("hail")) then
			e.self:Say("Greetings to you. I seek one who is a protector of nature. A ranger is what you call them I believe. Are you a ranger?");
		elseif(e.message:findi("ranger")) then
			e.self:Say("I have not seen your kind in quite some time. Do you seek aid in your never-ending fight against those who do nature harm? There is no need to answer for I see within your eyes, the commitment and the conviction. None the less, the tasks I set before you shall be none the easier. Are you ready to submit to my will?");
		elseif(e.message:findi("ready to submit")) then
			e.self:Say("That is good for there is nothing like the wrath of nature, woodlands warrior. And Natures wrath shall you be, with this armor to protect you in your struggle. I shall forge a coif, breastplate, sleeves, bracers, gauntlets, leggings, and boots for you.");
		elseif(e.message:findi("coif")) then
			e.self:Say("This coif shall protect you from battle and the elements. What I require of you is this. Three crushed coral pieces and a ancient tarnished chain coif.");
		elseif(e.message:findi("breastplate")) then
			e.self:Say("Even as the hardiest tree in the forest requires protection, so shall this breastplate protect you. Bring these components for me, an ancient tarnished chain tunic as well as three flawless diamonds.");
		elseif(e.message:findi("sleeve")) then
			e.self:Say("I require an ancient tarnished chain sleeves and three flawed emeralds. Do this so that I may grant you these special sleeves as a gift for your diligence.");
		elseif(e.message:findi("bracer")) then
			e.self:Say("This shall help shield your forearms from any stray blows. Bring me an ancient tarnished chain wristguard and a trilogy of crushed flame emeralds.");
		elseif(e.message:findi("gauntlet")) then
			e.self:Say("Bring me these items, for I will not grant you your pair until then. A pair of ancient tarnished chain gauntlets as well as three crushed topaz.");
		elseif(e.message:findi("legging")) then
			e.self:Say("A pair of leggings you seek? I seek something as well. Bring me a pair of an ancient tarnished chain leggings and three flawed sea sapphires. Go now. The struggle continues as we speak.");
		elseif(e.message:findi("boot")) then
			e.self:Say("For the boots, I shall require a pair of an ancient tarnished chain boots and three crushed pieces of black marble.");
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
