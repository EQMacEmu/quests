function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. " .. e.other:GetCleanName() .. ".  I protect these lands in the name of the Royal Order of Koada'Vie. defenders of Felwithe.");
	end
end

-- END of FILE Zone:gfaydark  ID:54106 -- Captain_Silverwind 