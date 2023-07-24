function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("gives a quaint. warm smile of welcoming. 'Greetin's an' well met. friend! I be Magnar Quok an' black smithin' be me trade! If ye by chance 'ave an affinity fer the anvil an' 'ammer as well. then ye 'ave certainly come t'the right place! Come. dinnae be shy an' search me wares! I'm certain I 'old somethin' that would be of use t'ye in the ways of iron and fire!'");
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
