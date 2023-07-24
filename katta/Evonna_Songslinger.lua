function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail! Care to sing a song with us?");
	end
end
