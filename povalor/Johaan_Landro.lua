function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("Fall in line, soldier!  Hrmm... You are a soldier, aren't you?");
	end
end
