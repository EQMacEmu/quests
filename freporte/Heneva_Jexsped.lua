function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Yes, yes, yes.  Hail to you, too, " .. e.other:GetCleanName() .. ".  Now, quit bugging me!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18855})) then
		e.self:Say("Welcome, friend. I see more than a slight glimmer of hate in your eyes. Good... for we have much work to do.");
		e.other:Faction(e.self,271,100,0); -- Dismal Rage
		e.other:Faction(e.self,281,-15,0); -- Knights of Truth
		e.other:Faction(e.self,296,20,0); -- Opal Dark Briar
		e.other:QuestReward(e.self,0,0,0,0,13565,20); -- Item: Old Stained Robe*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freporte  ID:10121 -- Heneva_Jexsped


