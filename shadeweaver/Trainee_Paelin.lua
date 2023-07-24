function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("It is an honor to meet a fellow hunter. I am training to learn how to hunt down the [saurek] that roam the thicket. It is our duty as taruun to provide food for our kin. I plan on claiming captain Tarief's [reward].");
	elseif(e.message:findi("what saurek?")) then
		e.self:Say("The Saurek hoppers are far more aggressive than the needle clawed hoppers. We must hunt them down and kill them lest they attack our families and traders that wander through these thickets. They have many uses to us as well. Their meat gives us food to eat, and their hides make strong protective armor.");
	elseif(e.message:findi("what reward?")) then
		e.self:Say("Captain Tarief has offered to reward those that slay four of the saurek hoppers. You must return four of their scales to him as proof of your deeds to claim the reward. I hope to bring honor to my family by returning home with such a trophy.");
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
