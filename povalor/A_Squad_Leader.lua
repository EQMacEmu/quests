function event_say(e)

	if ( e.message:findi("hail") ) then
		e.self:Say("We are busy here, please don't distract the troops. There is possibility of battle ahead and they must focus.");
	end
end
