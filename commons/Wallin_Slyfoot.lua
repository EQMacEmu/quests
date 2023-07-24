function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What? What do you want? Are you here to assist me?");
	elseif(e.message:findi("assist")) then
		e.self:Say("Yes..yes..of course you will. It is a matter of the utmost importance. I need this letter to be delivered to Master Whoopal in the Nektulos forest but I must also get these Brussels sprouts to my granny before they spoil. Please deliver this message for me?");
		e.other:SummonCursorItem(18957); -- Leatherfoot Raider Orders
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end

-- Wallin_Slyfoot.pl
-- Part of Innoruuk Disciple