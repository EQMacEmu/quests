-- pulsing green stone - ranger/druid epic

function event_spawn(e)
	eq.set_timer("depop",1800000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("So mortals, you seek to end the tainting of Tunare's children? So be it, I have no cares. My death has been caused by this foolishness and I want no more to do with it. Bring me a scroll with the knowledge of resurrection so that I may once again live. I will hand you that which you seek.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 15392})) then
		e.self:Say("I am alive! My thanks to you, " .. e.other:GetCleanName() .. ". And now I will aid you in your quest for preserving the forests of norrath. Your carcass will help nurture the soils of the wilderness.");
		eq.spawn2(102021,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.depop();
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
