function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Great, let us waste no more time!  I offer to you four challenges.  Summoning, interpretation, gesticulation, and displacement.  Please choose one of these.");
	elseif(e.message:findi("summoning")) then --magician test of summoning
		e.self:Say("Summoning it is. Proceed upward through the sky and return to me a Harpy Statuette, a Finely Woven Cloth Amice, and a Large Diamond. This will prove your abilities to me and I will reward you with a Drake Hide Amice.");
	elseif(e.message:findi("interpretation")) then --magician test of interpretation
		e.self:Say("Interpretation it is. Proceed upward through the sky and return to me a Carmine Spiroc Feather, a Blood Sky Amethyst, and a Golden Efreeti Ring. This will prove your abilities to me and I will reward you with the Duennan Shielding Ring.");
	elseif(e.message:findi("displacement")) then --magician test of displacement
		e.self:Say("Displacement it is. Proceed upward through the sky and return to me some Sweet Nectar, the Crown of Elemental Mastery, a Large Opal, and Djinni's Stave. This will prove your abilities to me and I will reward you with the Staff of Elemental Mastery.");
	elseif(e.message:findi("gesticulation")) then	--magician test of gesticulation
		e.self:Say("Gesticulation it is.  Proceed upward through the sky and return to me an efreeti magi staff, some sweet nectar, a sphinx crown, and a hazy opal.  In return, the Staff of the Magister is yours.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20952, item2 = 20760, item3 = 20761})) then --magician test of summoning using harpy statuette, finely woven cloth amice, large diamond
		e.self:Say("This amice suits you, " .. e.other:GetCleanName() .. ".  Wear it.");
		e.other:QuestReward(e.self,0,0,0,0,2708,100000); --Drake-hide amice
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20959, item2 = 20762, item3 = 20763})) then --magician test of interpretation using carmine spiroc feather, blood sky amethyst, golden efreeti ring
		e.self:Say("The ring of Duennan will protect you in times of trouble, mage. Take it and wear it with pride.");
		e.other:QuestReward(e.self,0,0,0,0,11687,100000); --duennan shielding ring
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20966, item2 = 20764, item3 = 20766, item4 = 20765})) then --magician test of displacement using sweet nectar, crown of elemental mastery, large opal, djinni stave
		e.self:Say("Finally you return, " .. e.other:GetCleanName() .. ". This staff will aid you, I hope.");
		e.other:QuestReward(e.self,0,0,0,0,11568,100000); --staff of elemental mastery
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20870, item2 = 20966, item3 = 20871, item4 = 20872})) then --magician test of gesticulationt Efreeti Magi Staff, Sweet Nectar, Sphinx Crown, Hazy Opal
		e.self:Say("Congratulations, " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,11650,100000); --Staff of the Magister
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
