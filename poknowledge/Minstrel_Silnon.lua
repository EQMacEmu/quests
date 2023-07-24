function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Ah. good day to thee. " .. e.other:GetCleanName() .. " and welcome to New Tanaan. If you are searching for knowledge and a quiet. peaceful place to calm your senses from the wears of battle. then you could not have made a finer choice than the Plane of Knowledge. The residents of New Tanaan have come together with the recent presence of your kind in hopes of aiding and guiding you where and when we can. If you are perhaps of the bardic ilk. then I might be of some assistance. Please. search my stock if you wish it. All of the songs are recently penned by my own hand. though they are not of a unique or rare breed. they will serve any bard of the proper experience.");
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
