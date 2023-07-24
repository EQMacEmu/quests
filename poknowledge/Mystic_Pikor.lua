function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("The mystics of New Tanaan greet " .. e.other:GetCleanName() .. " openly. Do not be afraid of Pikor. for my appearance betrays my nature in this place. All are Pikor's equals. and none below me. I am a mystic of Innoruuk. but my faith in the dark father is not of blood and death any longer. Pikor is of knowledge and power beyond Norrath. and I must cast down my guidance of the eye and turn to the spirit. as shall you when your time comes. If you are a shaman. Pikor may guide you as I have scribed my memory of spells no longer useful here for shaman who seek and need the power.");
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
