function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("Hmm? Are you talking to me? Oh, I guess you must be. I am new here and some of the Soldiers still haven't fully accepted me. Give me some time, they will see.");
	end
end
