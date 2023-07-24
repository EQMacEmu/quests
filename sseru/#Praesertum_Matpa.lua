function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("Busy man, can't chat. Important?");
	end
end
