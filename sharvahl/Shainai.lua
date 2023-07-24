function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Oh hi.  I am on my way home now, but we can maybe talk later, ok?");
	end
end

function event_waypoint_arrive(e)
	if(e.wp==21) then
		e.self:Say("Yup yup, I definitely know the way from here.");
	end
	if(e.wp==36) then
		e.self:Say("Ahhh, home at last.");
		eq.signal(155041,1); -- NPC: #Delival
	end
end

function event_signal(e)
	if(e.signal==1) then
		e.self:Say("Daddy I'm sleepy, could you come tuck me in ?");
		eq.signal(155340,1); -- NPC: Delival
		e.self:SetAppearance(3);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4478})) then
		e.self:Emote("settles comfortably in for restful afternoon nap, 'Thank you for walking me home, it was ever so nice of you.  Goodnight.'");
		e.other:Ding();
		eq.signal(155340,2,10); -- NPC: Delival
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
