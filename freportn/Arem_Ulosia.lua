function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Praise be to Marr, my friend! Welcome to the temple. If you are not a member of the congregation, please speak with our priests. I am sure they can give you guidance.");
	elseif(e.message:findi("healing")) then
		e.self:Say("It is not my duty to see to the wounded. You must seek out Plur Etinu. He is in here somewhere.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end