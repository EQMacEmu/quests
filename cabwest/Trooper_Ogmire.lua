function event_say(e)
	if(e.message:findi("sign the restraining order")) then
		e.self:Say("I knew my wicked ways would eventually come to an end. Very well, then. Hand me the legion order and I shall sign it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18245})) then 	--Legion Order (5 signed)
		e.self:Emote("signs the order and hands it back to you.");
		e.other:QuestReward(e.self,0,0,0,0,18246);	--Legion Order (6 signed)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
