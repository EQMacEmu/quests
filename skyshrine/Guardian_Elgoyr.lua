function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("We were created to protect the Kin and the shrine from attack. This is what we've always done. Do not try to alter this.");
	end
end
