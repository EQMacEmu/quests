function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("An' a blessed day t'ye. friend. New Tanaan 'as not seen this level of excitement in quite some time -- it is a warmly received break from the serious and almost somber atmosphere this fair little place be known fer. In any case. perhaps ye be searchin' fer some smithin' supplies. and if that be the case then ye 'ave come t'the right place! The Darkanvils were master smiths of our time in Kaladim. before its fair gates opened to the surface above. no doubt. We 'ave recreated some of the supplies commonly used in this trade on your world and offer them at a fair price. we guarantee!");
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
