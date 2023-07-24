function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings to you. " .. e.other:GetCleanName() .. ". and welcome to New Tanaan. I am Cirsaelle. a former minstrel of Norrath in a time long since past. Despite my age and the distance of time that separates the now from when last my feet touched Norrathian soil. my wisdom and memories have not faded. Though I wish I could help all travelers that approach me. my knowledge is limited to that of the bardic traditions. If these ways would aid your quest for self-enlightenment and progression. then perhaps I might be of service. Please. investigate the songs that I possess at your leisure. All coin that is given in trade will help fund this city's recent need to accommodate all Norrathian visitors.");
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
