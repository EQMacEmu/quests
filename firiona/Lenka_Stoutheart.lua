function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("sips on her ale.  'Look what we have here, Bronto!  A would be hero!'");
		e.self:DoAnim(39);
		eq.signal(84129,1); -- NPC: Bronto_Thudfoot
	elseif(e.message:findi("interesting")) then
		e.self:Emote("takes a jagged scimitar out of a wrap and lets you hold it.  You feel as though it is linked to the spirit world.  Lenka grabs it back.  'No, no!  You can't keep it.  But I can tell you there are plenty more weapons and armor like this.  Just have to do a little dragon slaying.'");
		eq.signal(84129,2); -- NPC: Bronto_Thudfoot
		e.self:DoAnim(57);
	elseif(e.message:findi("cabby pale ale")) then
		eq.signal(84129,3); -- NPC: Bronto_Thudfoot
		eq.set_timer("hobble",math.random(900000,1800000));
	elseif(e.message:findi("lizardtown")) then
		e.self:Say("The trackers of Firiona Vie have come back with reports that the Iksar are back in force and have a city somewhere in the heart of Kunark. There goes the neighborhood...again.");
	end
end

function event_timer(e)
	if(e.timer == "hobble") then
		eq.unique_spawn(84005,22,0,-3148,-1305,256,0); -- NPC: #Sir_Hobble
		eq.stop_timer("hobble");
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("We're just kidding with you, kid. Heh.  Although they are making heroes kinda small these days.  Hey, you [want to see something interesting]?");
	elseif(e.signal == 2) then
		e.self:Say("I hear they sell the stuff in only two places. Lizardtown and Neriak. Hmmm. Now, why is that?");
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
