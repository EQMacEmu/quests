function event_spawn(e)
	eq.set_timer("playdead",1000);
end

function event_timer(e)
	if(e.timer == "playdead") then
		e.self:SetAppearance(3);
		eq.stop_timer("playdead");
		eq.set_timer("depop",3600000);
	elseif(e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop();
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12278},0)) then
		eq.stop_timer("depop");
		eq.start(2);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_waypoint_arrive(e)
	if(e.wp == 1) then
		eq.create_ground_object(12274, e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	elseif(e.wp ==2) then
		e.self:SetNPCFactionID(79);
	end
end

-- EOF #Captain Klunga - Cauldron