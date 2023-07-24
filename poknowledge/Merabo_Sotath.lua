function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("gives you a wide. toothy grin. 'Welcome. traveler! The Plane o'Knowledge offers many. many great things as t'the ways of the universe and legends o'the greatest people t'ever walk the face o'Norrath. But that's not all we 'ave 'ere! The merchants an' tradesmen of Norrath from eras recent an' ancient past 'ave come t'gether in celebration o'your arrival. We 'ope t'meet new young an' aspiring people o'the arts an' share with them our experiences an' knowledge. If ye be a brewer. well then. this day be one of good fortune fer me. Come and inspect me wares. friend. and purchase whatever catches yer eye. The supplies 'ere are guaranteed and worth more than the measly price o'which I be sellin' 'em fer.'");
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
