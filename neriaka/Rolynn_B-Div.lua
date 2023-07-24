function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings! I wish I had time to talk, but I do not.");
	elseif(e.message:findi("raider") or e.message:findi("leather") or e.message:findi("narex")) then
		e.self:Say("Talk to Head Master Narex of the Indigo Brotherhood. He will tell you.");
	end
end

function event_waypoint_arrive(e)
	if((e.wp == 3) or (e.wp == 8) or (e.wp == 18)) then
		e.self:Say("Hear yee. Master Narex of the Indigo Brotherhood is offering one gold piece for every Leatherfoot Raider skullcap.");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
