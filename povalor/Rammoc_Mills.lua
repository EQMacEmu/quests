function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Emote("grumbles under his breath.");
	end
end
