function event_waypoint_arrive(e)
	if(e.wp == 4) then
		eq.unique_spawn(105018,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
