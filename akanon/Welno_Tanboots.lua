
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings there " .. e.other:GetCleanName() .. "! I am Welno Tanboots Assassin of Akanon. I pride myself on being one of the few to train our younger prospects in the ways of the rogue."); -- text made up
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18776})) then -- Note
		e.self:Say("Yes, I just knew you'd see it my way, " .. e.other:GetCleanName() .. ". Anyway, welcome to our little part of Ak'Anon's underworld. We have to pay a high price to keep our small orgainzation hidden, which keeps us all busy around here. Now throw this on, and let's put you to work.");
		e.other:Faction(e.self,240,100); 	-- Deep Muses
		e.other:Faction(e.self,288,15); 	-- Merchants of Ak'Anon
		e.other:Faction(e.self,255,15); 	-- Gem Choppers
		e.other:Faction(e.self,238,-15); 	-- Dark Reflection
		e.other:QuestReward(e.self,0,0,0,0,13519,20);	-- Scuffed Tunic*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
