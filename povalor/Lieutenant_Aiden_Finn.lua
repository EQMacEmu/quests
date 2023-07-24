function event_say(e)

	if ( e.message:findi("hail") ) then
		e.self:Say("We have no time for interruptions. Please leave at once.");
	end
end
