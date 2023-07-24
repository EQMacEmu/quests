function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Please keep yer voice down I am busy here. If you do not mind I would ask that ya kindly leave.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8898}, 0)) then
		e.self:Emote("begins to put the armor on, 'Finally the Dain has gotten word of my arrival here.  I await his final orders before proceeding.'");
		eq.spawn2(110017,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
