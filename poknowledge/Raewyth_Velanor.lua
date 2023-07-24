function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("winces his reptilian eyes in a brief. callous study of you. The Iksar's features contort into a grim. malicious smirk that masterfully incorporates his inherantly viscious and merciless demeanor. In a drawled hiss. heavily accented with the Sebilisian Empire of old. the iksar finally speaks. 'How quaint -- a 'hero' of the world. yes? Well. it seems that this era has no hope for true glory afterall. despite all of the opportunities that those before you have offered. How you squander their legendary work with your debased. pathetic little whimsical dreams of wealth and fame. How selfish you are for all the wrong reasons. It would be pitiable if it weren't for the true element of humor we will gain from your collective failure.'");
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
