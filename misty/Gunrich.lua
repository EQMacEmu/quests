function event_say(e)
	if(e.other:GetFaction(e.self) < 5) then
		if(e.message:findi("hail")) then
			e.self:Say("Hello, " .. e.other:GetCleanName() .. ". What can I do for you?");
		elseif(e.message:findi("dark rivers flow east")) then
			e.self:Say("So, Rueppy Kutpurse must have sent you. Here, take this case. Be careful, though. You don't want to get caught with that in town. It is illegal to possess such alcohol.");
			e.other:SummonCursorItem(13131); --Case of Blackburrow Stout
		end
	else
		e.self:Say("I am sorry, " .. e.other:GetCleanName() .. ". You aren't trustworthy enough yet.");
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
