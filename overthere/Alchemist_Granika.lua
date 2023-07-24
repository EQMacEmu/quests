--Alchemist Granika will help us to discern the glowing cliff golem from the rest, the one who holds our Chunk of Tynnonium. He is part of the eighth and final quest in the Greenmist line.
function event_spawn(e)
	eq.set_timer("sit",10000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("If you were sent to me, show proof or be gone from my sight!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3892})) then
		e.self:Say("If Heirophant Oxyn has sent this with you, I can assume that our visions were corect. The new age is calling us from the heavens. Prepare for battle. I will take this solution to the Outlander's gates and use it to reveal the location of the metal of prophecy. Should I not return, you will only need to find the creature that glows without the use of a torch. Deklium glows when it gets near the smallest trace of tynnomium. Prepare for battle, Crusader... I am off!");
		eq.stop_timer("sit");
		eq.start(4);
		eq.set_timer("Depop",8000);
		eq.spawn2(93002,46,0,2240,2764,-49,190); -- a glowing cliff golem
		eq.spawn2(93005,5,0,2240,2698,-49,190); -- Watch_Sergeant_Grolj
		eq.spawn2(93004,47,0,2260,2794,-49,190); -- an_undead_marine
		eq.spawn2(93004,48,0,2260,2698,-49,190); -- an_undead_marine
		eq.spawn2(93004,49,0,2280,2794,-49,190); -- an_undead_marine
		eq.spawn2(93004,50,0,2280,2698,-49,190); -- an_undead_marine
		eq.signal(93077,0,0); -- NPC: a_cliff_golem
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if(e.timer == "Depop") then
		eq.stop_timer("Depop");
		eq.depop_with_timer();
	elseif(e.timer == "sit") then
		e.self:SetAppearance(1);
		eq.stop_timer("sit");
	end
end

--Submitted by Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
