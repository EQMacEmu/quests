-- Ilanic's Scroll
function event_spawn(e)
	eq.set_timer("depop",3600000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am no more.");
	elseif(e.message:findi("scroll")) then
		e.self:Say("Kobold! Kobold!");
		eq.unique_spawn(38172,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	end
end

function event_timer(e)
	eq.depop_with_timer();
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
--END of FILE Zone:erudnint  ID:38150 --  Ilanics_skeleton

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
