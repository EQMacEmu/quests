function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("claps his thick hands together. creating a loud burst of sound that echoes his hardy yalp of welcoming. 'Greetings t'ye traveler an' welcome t'New Tanaan! I see that ye be a well-seasoned traveler! O'course nothin' escapes good ol' Dogle Pitt's eye. Perhaps that's why I be the most trusted banker in all o'these parts. aye? Indeed! If ye need a place t'store some o'yer excess belongin's there. then dinnae be shy in lettin' me be their temporary caretaker. There's no place safer fer all the treasures in the world than Dogle Pitt's safe. I assure ye!'");
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
