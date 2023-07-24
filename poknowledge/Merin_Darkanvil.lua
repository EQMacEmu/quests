function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Why. good day t'ye as well. good traveler. and welcome t'New Tanaan. We are overjoyed with your kind in our midst. for it 'as been far too long since we've been graced with the hearty character of Norrath's finest heroes and villians alike. Dinnae mistake this for boredom with our fair 'amlet of the cosmos. but take it as a compliment and one not given lightly at that. Well. if you are not inside the library. then you must be searching for supplies -- or ye be lost. In either case. perhaps you would find interest in supplies for blacksmithin");
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
