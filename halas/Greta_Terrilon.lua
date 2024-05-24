function event_say(e)
	if(eq.is_the_ruins_of_kunark_enabled() and e.message:findi("some ink")) then -- can be done at dubiously
		e.self:Say("Jinkus must've sent ye fer some more of me special ink made from the pigment of th' datura flower. Ye may take some free o' charge, as a donation to the church and to the will o' the Tribunal as well");
		e.other:SummonCursorItem(12619); 				--Vial of Datura Ink
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
