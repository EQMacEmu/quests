-- Coldain Ring: Quest 2

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello stranger, I am Boridain, master hunter of the Coldain. Glad to meet you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30265}, 0)) then
		e.self:Say("Say! This looks just like the axe my uncle uses. With this I can kill the beast for sure! Now please, be very quiet, I must track my prey. I won't return to Thurgadin without the hide of the rabid tundra kodiak!");
		eq.unique_spawn(116016, 13, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
