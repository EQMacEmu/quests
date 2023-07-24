function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to the Nexus! Down each stairway is a passage that leads out from the Nexus. Through those passages you will find the great trade city of Shadow Haven, the Bazaar, and the cavern systems that lead to the surface of Luclin. Also, located in each tunnel is a teleport pad that can return you to Norrath. There is much information to be gathered here, be sure to speak to everyone and ask lots of questions. Farewell. " .. e.other:GetCleanName() .. ".");
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
