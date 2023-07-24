function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to our humble outpost, traveler. Let me know if you see anything you need. I consider it an honor to sell here.  I am doing my part to help Vah Shir in training stay in the field.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5566}, 0)) then
		e.self:Say("Thanks " .. e.other:GetCleanName() .. "! That was delicious. Here is the empty bowl.");
		e.other:QuestReward(e.self,0,0,0,0,5567);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
