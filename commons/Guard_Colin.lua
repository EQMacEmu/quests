function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, traveler! By order of Sir Lucan, the toll fee is one gold piece a head.  Pay at once!!");
	elseif(e.message:findi("no")) then
		eq.attack(e.other:GetName());
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {gold = 1}, 0)) then
		e.self:Say("It is best you donate to the Freeport Militia. I would hate to see anything happen to you.");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end