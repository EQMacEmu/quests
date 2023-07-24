function event_say(e)

	if ( e.message:findi("hail") ) then
		e.self:Say("I suggest that you leave before you find yourself in trouble. We will guard these weapons to the death, be it your death or ours.");
	end
end
