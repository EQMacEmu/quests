function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("I need to update our king on the progress of your attempts to acquire the mines. What should I tell him?");
	end
	if(e.signal == 2) then
		e.self:Say("I understand the condition of the areas that you mentioned. My question  was related to the mines. In what state are our efforts to control the acrylia mines? I need accurate information on our progress in that area!");
	end
	if(e.signal == 3) then
		e.self:Say("I cannot speak on that matter at this time.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
