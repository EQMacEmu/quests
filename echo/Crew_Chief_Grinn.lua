function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Can't ye see we're busy here?  I don' 'ave time for yer yammerin'.");
	end
end
