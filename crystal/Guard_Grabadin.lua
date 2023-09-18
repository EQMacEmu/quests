function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What can I do for you, " .. e.other:GetCleanName() .. "? If there isn't anything I could do for you, I can give you a quick task.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end