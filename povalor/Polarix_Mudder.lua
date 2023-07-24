function event_say(e)

	if ( e.message:findi("hail") ) then
		e.self:Emote("nods briefly before returning back to his post.");
	end
end
