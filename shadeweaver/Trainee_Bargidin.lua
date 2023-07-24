function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Alas, I have little will to talk right now. It is a [sad time].");
	elseif(e.message:findi("sad time")) then
		e.self:Say("My good friend Torin ventured into the thicket alone a few days ago. There's been no sign of him since. I fear the [saurek deathmaws] have done him in.");
	elseif(e.message:findi("deathmaw")) then
		e.self:Say("The deathmaws would be the only creature in the thicket that could possibly kill Torin. He could handle just about any other hopper, but few can survive a deathmaw attack. Reward or no, I vow I will someday slay those beasts... I'll kill them if it's the last thing I do.");
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
