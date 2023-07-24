-- on live it is a fire based aoe on death reported to be around 552 pts damage
-- exact spell is not specified. using Firebomb, fire based aoe - max damage 499

function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_death(e)
	if(math.random(100) < 75) then
		e.self:CastSpell(1017, e.other:GetID());                -- fishnova
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
