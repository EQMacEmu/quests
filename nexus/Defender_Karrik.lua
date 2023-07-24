function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. ". Behind me lies the path to the Odus platform. Please refrain from combat while in the Nexus as we have not thoroughly tested how the teleporters would react if exposed to certain magics.");
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
