--Shaman Skull Quest 6
function event_spawn(e)
	e.self:Say("Stay out of this, Klok !! I didn't spend 30 seasons in the legion to be pestered by the likes of you!! Here I am, you little croak!! You want my skull? Come and get it!!");
	eq.signal(85140, 50000); --signal Klok_sargin to say something
end

function event_signal(e)
	e.self:Say("Ha!! Who dares to take what is Bruiser's!! I will make swamp mush out of them!!");
	eq.attack(e.other:GetName());
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
