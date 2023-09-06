function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The Guardians' sole purpose is to protect the shrine and all creatures that dwell here.");
	end
end
