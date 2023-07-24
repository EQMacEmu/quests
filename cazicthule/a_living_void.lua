function event_trade(e)
	local item_lib = require("items");
	
	if ( item_lib.check_turn_in(e.self, e.trade, {item1 = 8720}, 0) ) then -- Phobonomicon of Thul Tae Ew
		eq.zone_emote(7, "A loud explosion sends ripples of energy through the air! Matter seems to lose its substance, but quickly solidifies. A shriek fills your ears, followed by the pounding sound of drums!");
		eq.spawn2(48376, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0); -- a_horror_construct
		eq.depop_with_timer();
	end

	item_lib.return_items(e.self, e.other, e.trade);
end
