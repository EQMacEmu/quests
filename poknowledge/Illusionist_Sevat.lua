function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello. traveler. New Tanaan greets you warmly and with the utmost respect. We only hope that you may return to us the same indifference and non prejudicial regard for knowledge and self-progression as we have founded this city upon for a timeless age. I myself was once a traveler as you are now -- exploring the world in search of adventure. wealth. fame. and glory. I am an enchanter. though now I exist as a scholar and researcher of my art. I. like so many other citizens of New Tanaan. have volunteered to give my knowledge unto those willing to accept it. If you are of the same art as I. perhaps you would wish to search my inventory. I have penned many spells from the memories of my youth and you may find something of interest amongst my collection.");
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
