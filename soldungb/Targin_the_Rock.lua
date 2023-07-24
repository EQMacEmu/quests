function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("You have much to learn.' and 'Your actions and history are a personal affront to all I stand for.");
	end
end

function event_attack(e)
	e.self:Say("You have much to learn.' and 'Your actions and history are a personal affront to all I stand for.");
end

--END of FILE Zone:soldungb  ID:4900 -- Targin_the_Rock
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
