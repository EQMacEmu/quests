function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8897}, 0)) then
		e.self:Say("The final orders, follow me closely!  I pray that the Kromrif have not learned of our plans to allign with the gnomes.");
		eq.spawn2(110019,64,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
