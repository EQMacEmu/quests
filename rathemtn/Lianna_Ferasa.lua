-- Part of quest for Bracer of the Reverent

function event_say(e)
	if(e.message:findi("regis")) then
		e.self:Say("Regis was my one true love, but he was [killed] and his soul enslaved by Zahal the Vile.");
	elseif(e.message:findi("killed")) then
		e.self:Say("He was killed in the northern tree line to the east in North Karana. If you kill Zahal, Regis' body will rise from the place where he died. If my flute is on the body, please bring it to me.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13899})) then
		e.self:Say("Thank you for setting his spirit free.  Keep his memory alive with this.");
		e.other:QuestReward(e.self,0,0,0,0,19010,1000);
	end
end

-- Quest by mystic414
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------