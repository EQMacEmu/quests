function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("Good day.  Although I do not mind your presence, I do ask to be left alone, for I am trying to concentrate.  Please forgive my lack of gregariousness.  Do come another time.");
	end
end
