function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("Hail, strange one.  Have you come to explore the wasteland?  If you have, I wish you good fortune, but that is not a journey I seek to undertake!");
	end
end
