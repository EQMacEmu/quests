function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("stares in contemplation at the landscape.");
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Emote("breathes quickly and sweats as he channels his spirit into the sky.");
		e.self:CastSpell(791,e.self:GetID()); -- Spell: Call of the Earth
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
