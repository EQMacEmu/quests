-- Necromancer Epic NPC -- a_failed_apprentice

function event_death_complete(e)
	eq.spawn2(51144,0,0,-1518.9,347.6,53,31):AddToHateList(e.other,1);
end

--Quest by: Solid11  Zone:lakerathe  ID:51152 -- a_failed_apprentice
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
