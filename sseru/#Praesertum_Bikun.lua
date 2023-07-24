function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("Well hello " .. e.other:GetCleanName() .. "!  Welcome to Sanctus Seru!  Welcome to my chambers!  Always glad to see new faces around here, it is good for business and good for morale.");
	end
end
