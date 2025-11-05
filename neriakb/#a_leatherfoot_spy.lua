----a_leatherfoot_spy.pl
--Part of Innoruuk Disciple

function event_spawn(e)
	eq.set_timer("depop", 3600000);
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
