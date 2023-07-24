function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Do not approach the Tower of Death unless you have been summoned to rebirth.  My brother was unfortunate enough to venture into their halls and he has never been seen again.");
	elseif(e.message:findi("tower of death")) then 	
		e.self:Say("The tower is the laboratory of the secluded Brood of Kotiz.  We supply them with many slaves for their dark experiments and rituals.  Its dark halls smell of rotted flesh from a multitude of creatures, even our own.  It is said there is an entire chamber filled with the blood of a million.  This is no place for a weak stomach.  And the Brood does not welcome visitors.");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
