function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("This place is not for the living. Get out!!"); -- need exact text, this is based on allakhazam comments
	end
end