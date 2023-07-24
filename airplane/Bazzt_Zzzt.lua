function event_spawn(e)
	eq.set_timer("depop",4800000);
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function event_death_complete(e)
	eq.set_global("sirran","6",3,"M20");
	eq.spawn2(71058,0,0,234,-1078,812,192); --Sirran the Lunatic
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
