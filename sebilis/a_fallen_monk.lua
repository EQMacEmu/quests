--This fallen monk will spawn the fallen monk master when we give him our Shackle of Tynnonium. This is part of the Whistling Fists quest line.
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Failed to find the rest I have. If you wish what is mine then give proof of the final shackle unto me.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4199})) then
		e.self:Say("Earn what is mine. Show me you have the power worthy to wield what I possess.");
		eq.spawn2(89183,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted by: Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
