function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. "");
	end
end
