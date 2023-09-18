function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ahh...Come to join me on the watch, eh? Be sure to check in with the Captain. He will have no problem finding work to chill your bones.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end