function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Ahh, welcome, " .. e.other:GetCleanName() .. ". It is good to see more and more people visiting now that the portals are functional. It took us many, many years to understand the magical powers of Luclin. Whether through dumb luck or divine intervention, we have succeeded in opening the gate back to Norrath.  How long it will stay open, no one knows. My colleagues and I are here to maintain and watch for changes in the Nexus. Should anything happen, you will be notified. Safe travels.");
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
