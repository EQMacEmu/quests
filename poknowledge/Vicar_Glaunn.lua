function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to New Tanaan. traveler. and know that you are among allies in the quest for knowledge and personal enlightenment. All of New Tanaan's residents have strived for the past weeks to accommodate every visitor's needs as we can. Collectively. we have proven to be without a match in our efforts to do so. as the knowledge kept here is seemingly infinite. Individually. however. we hold specialties that one must take into account before judging us as the proper aid for your current quest. If your life is dedicated to the ways of the priest. despite the mode of your faith. then I may be of service to you. My inventory is stocked. as I am sure that it shall always be. Search it at your convenience and leisure should you wish it.");
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
