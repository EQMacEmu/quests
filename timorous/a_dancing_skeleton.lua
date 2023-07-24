function event_say(e)
	if(e.message:findi("gomoz")) then
		e.self:Emote("stops in suprise.");
		e.self:Say("Gomoz!! Why, that is me! I was heading off to be with the elements when I was captured by this smelly ogre. Actually, he is not as smelly as most.");
		eq.stop_timer(10);
		eq.stop_timer(11);
		eq.stop_timer(12);
		eq.stop_timer(100);
		eq.set_timer(100,40000); -- Get the conversation out the way in 40s, or depop
	elseif(e.message:findi("talon southpaw")) then
		e.self:Say("Master Talon Southpaw!! He was my master. Dead, he became. Off to the elements. I keep his special hand with me. Perhaps I should have it returned. Maybe I shall find a young adventurer to [return the hand to Cabilis].");
		eq.stop_timer(100);
		eq.set_timer(100,30000); -- Get the conversation out the way in 30s, or depop
	elseif(e.message:findi("return the hand to cabilis")) then
		e.self:Say("Yes!! Return the hand. Here it is. Missing four it is. Within the tower of past pain and torture is where the four lie. Taken by bones similar to myself.");
		e.other:SummonCursorItem(17037); -- hand with one only a thumb
		eq.set_timer(100,4000);
	end
end

function event_signal(e)
	if(e.signal == 5) then
		eq.set_timer(10,2000); --start dancing in 2s
		e.self:Emote("shambles to its feet and begins to jig somewhat grudingly.");
	end
end

function event_timer(e)
	if(e.timer == 10) then
		--If I'd wanted a career in dancing, I'd have better hips
		eq.stop_timer(10);
		eq.set_timer(11,2000);
		e.self:DoAnim(58);
	end
	if(e.timer == 11) then
		--do the monkey with me
		eq.stop_timer(11);
		eq.set_timer(12,2000);
		e.self:DoAnim(45);
	end
	if(e.timer == 12) then
		--shake it, baby
		eq.stop_timer(12);
		eq.set_timer(13,2000);
		e.self:DoAnim(58);
	end
	if(e.timer == 13) then
		--falldowndead
		eq.stop_timer(13);
		eq.set_timer(100,2000);
		e.self:DoAnim(16);
	end
	if(e.timer == 100) then
		--danceover
		eq.stop_timer(100);
		eq.depop_with_timer();
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

--Quest Name: Talon Southpaw's fate
--Author: BWStripes
--
-- Updated by BWStripes
-- The text and dialog was in the original file, credit to original author. I've never tried collecting the fingers. -Stripes
--
--Original submission:
--Submitted by: Senzo aka Fatty Beerbelly
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
