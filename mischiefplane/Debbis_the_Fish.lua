function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("If only I could walk in somebody elses shoes just for a day. It's not easy being a skunk you know.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6883}, 0)) then -- rabbit foot
		e.self:Say("Oh wow! A rabbits foot!! Thank you so much. Here take this, I won't need this smelly thing any more.");
		e.other:Faction(e.self,437,1); -- Faction: Denizens of Mischief
		e.other:QuestReward(e.self,0,0,0,0,6876,100); -- a lucky skunk foot
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
