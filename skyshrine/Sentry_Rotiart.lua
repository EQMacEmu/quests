-- Friend of the Kin

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29626}, 0)) then
		eq.spawn2(114004,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
