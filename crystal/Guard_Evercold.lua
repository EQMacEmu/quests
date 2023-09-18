function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ello there " .. e.other:GetCleanName() .. " . I am Evercold Gemshard and this is my partner Slacey. Now don't you be gettin any funny ideas. That fine woman can show any orc the business side of a sword, and you are lookin mighty orcish today.");
		eq.signal(121027,1); -- NPC: Guard Slacey
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end