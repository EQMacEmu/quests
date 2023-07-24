function event_waypoint_arrive(e)
	if(e.wp == 1) then
		e.self:SetAppearance(3);
	end
	if(e.wp == 21) then
		e.self:Emote("grabs a large chunk of raw owlbear meat from the storeroom.");
	end
	if(e.wp == 35) then
		e.self:Say("hail Palav. It's feeding time my friend. Now now Rajyk, It's ladies first. I will return with your food shortly.");
		eq.signal(155289,1); -- NPC: Palav
		eq.signal(155288,1); -- NPC: Rajyk
	end
	if(e.wp == 47) then
		e.self:Emote("grabs a large chunk of raw owlbear meat from the storeroom.");
	end
	if(e.wp == 59) then
		e.self:Say("hail Rajyk. You didn't think I forgot to feed you did you? Eat well my friends, I will be back again.");
		eq.signal(155289,1); -- NPC: Palav
		eq.signal(155288,1); -- NPC: Rajyk
	end
	if(e.wp == 67) then
		e.self:Say("My my, what a selection. I think I'll go with some ale today.");
	end
	if(e.wp == 78) then
		e.self:SetAppearance(1);
	end
end

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Well met. friend.  May I be of assistance?");
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
