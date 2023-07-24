--Tracker Azeal is actually Hero Goxnok in disguise. He is part of the fifth quest in the Greenmist line.
--He will check the zone time every 30 seconds, and if it's 9 PM, he will respawn as a wandering form of himself that will path off and meet whoever is doing the quest.

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks over at you and gives you an awkward smile, then quickly looks away. You notice he isn't like most of the elves you've seen. You can't quite put your finger on it, but for one thing he smells like he hasn't bathed in weeks.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted by Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
