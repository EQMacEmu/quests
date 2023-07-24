function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings to you, " .. e.other:GetCleanName() .. ". Try the Ogre Swills in this place. They get it to just the right consistency! You could stick a dagger in it and it would stand straight up!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
