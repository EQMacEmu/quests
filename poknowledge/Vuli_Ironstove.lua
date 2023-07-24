function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome. traveler! The Ironstoves pride ourselves upon our goods. for no other baker in the whole of the cosmos can hold a candle to our quality. Please. search my inventory and if you do not find that which you are searching for. then search my brethren's stock. I guarantee that among the five of us. you will find the exact ingredient you seek.");
	end
end

function event_spawn(e)
	x = e.self:GetX();
	y = e.self:GetY();
	eq.set_proximity(x - 90, x + 90, y - 90, y + 90);
end

function event_enter(e)
	eq.signal(202273,5); --Qadar
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
