function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey friend, nice wallet ya got there.  Bet it's fulla money, huh?  Why don't ya let me take a quick look, huh?");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18923})) then
		e.other:QuestReward(e.self,0,0,0,0,13158,50); -- Item: Rebbys Rat Whiskers
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Rebby_Willend