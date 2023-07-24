function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Good day to you. " .. e.other:GetCleanName() .. ". Despite your purpose among us in New Tanaan. know that we bear no ill will toward any for mere distinctions of race or religious preference. We are all equals -- children of the gods and children of the earth alike. It has been a very long time since I have been among adventurers. and I admit that this is truly an experience I have not craved. The nymphs were persecuted in our day. though not through intended force. but in the expansion of your cultures and the erection of great elven and human cities. Aaah. but I do dwell on matters of the past. What is done is done. Now. I exist to aid you should you wish it. friend. I have adopted the mortal art of enchantment and what knowledge I have of it is yours should it be of use.");
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
