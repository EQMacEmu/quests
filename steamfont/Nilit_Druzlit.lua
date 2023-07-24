function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Eh?  Eh?!  Talk not now!  My [creation] is running wild!  Destroy it for me. please!  If you do you can keep whatever parts you want from it.");
	elseif(e.message:findi("what creation")) then
		e.self:Say("Did you kill it yet? What?  Bah!  Yes. I made it.  Nilit's clockwork it is.  I made it to carry my toys to and from Ak'Anon but now it's gone wild and started attacking people.  Please. destroy it!");
	end
end

--END of FILE Zone:steamfont  ID:56136 -- Nilit_Druzlit


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
