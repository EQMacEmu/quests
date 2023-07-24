function event_spawn(e)
	eq.attack_npc_type(56105);
end

function event_signal(e)
	e.self:Say("Your servos belong to me!");
	eq.depop();
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
