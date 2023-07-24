function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Emote("nods in your direction, recognizing your presence, then returns to his work.");
	end
end
