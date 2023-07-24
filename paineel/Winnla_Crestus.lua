function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("By Cazic-Thule. I am going to kill him!  If he keeps up that endless chatter.. Oh. hello there. " .. e.other:GetCleanName() .. ".  Please feel free to peruse my wares.");
	end
end

--END of FILE Zone:paineel  ID:75101 -- Winnla_Crestus
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------