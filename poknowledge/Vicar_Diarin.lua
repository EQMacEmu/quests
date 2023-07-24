function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Good day to you. traveler. and may the gods be with you in your quest for knowledge. New Tanaan shall not hinder your quest. my friend -- on the contrary. we strive to provide whatever wisdom and guidance that you would need to further your own path. Do not hesitate to approach us and know us as friend. and nothing more. Unfortunately. my personal experience and knowledge is limited to that of a priestess. for I was bred devoted to The Prime Healer. However. if you are a priest--it does not matter the divine focus of your faith-- then I may serve some purpose to you after all. Please. search my inventory should you have any interest in it and purchase whatever you need that I can possibly provide.");
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
