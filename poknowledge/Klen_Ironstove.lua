function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings. traveler. and welcome to my shop! All adventurers who brave the toils of the astral realms of the gods need their sustenance and ol' Klen Ironstove provides all the necessities for bakers to produce their wares. Come. peruse my goods and see if there's anything here of interest t'ye.");
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
