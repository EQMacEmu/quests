function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("You would do well to be wary when venturing out, there are [rumors] about what lies in the Wasteland.");
	elseif ( e.message:findi("rumors") ) then
		e.self:Say("I am sorry, but I cannot go into detail. Just protect yourself and be prepared for anything.");
	end
end
