function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Good day to you. traveler. The trails of the outer planes and Norrath alike take their tolls upon any adventurer. The need for supplies is great to maintain strength. agility. awareness. and focus and thus. I provide that which may quench your common desires. Search my stock as you wish and purchase what catches your eye. My prices are most fair. I assure you.");
	end
end

function event_spawn(e)
	x = e.self:GetX();
	y = e.self:GetY();
	eq.set_proximity(x - 90, x + 90, y - 90, y + 90);
end

function event_enter(e)
	eq.signal(202274,5); --Nomaad
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
