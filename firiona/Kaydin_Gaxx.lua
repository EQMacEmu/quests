function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("smells of rust.  He sets down a chain of linked rings.  'Greetings!  Come looking for some protection from the beasts, eh?  Wise, indeed.  Kunark is a much more dangerous place than one might think.  And once you enter its dense jungle territories, you may not see civilization again for months.'");
		e.self:DoAnim(48);
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
