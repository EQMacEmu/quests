function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("Sorry, I am a bit tired.  Been working all night.");
	end
end
