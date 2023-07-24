function event_spawn(e)
	eq.set_timer("souls",3100000);
end

function event_timer(e)
	e.self:Say("The cold of souls and stench of death! Always, here, do I find it...");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello.  Do you need something or did you merely wish to grace me with your oh-so-delightfully perfumed breath?");
	elseif(e.message:findi("cold")) then
		e.self:Say("Who are you?  Bah.  Never mind.  The cold of lost souls chilling the spine.  Once this was Azrax Soulstealer's domain.  A crueler man there never was.  Binding and stealing souls was his forte.  Some of the souls he reaped still dwell in this place, seeking the promise of release fom their eternal suffering.");
	elseif(e.message:findi("suffering")) then
		e.self:Say("Let them suffer, I say!  I just wish they wouldn't chill my spine.");
	end
end

--END of FILE Zone:paineel  ID:75020 -- Elia_Athrex
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------