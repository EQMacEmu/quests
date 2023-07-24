function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31758}, 0)) then
		eq.spawn2(160002,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),128):AddToHateList(e.other,1); -- an_imprisoned_shade
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
