function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("Please leave me be.");
	end
end
