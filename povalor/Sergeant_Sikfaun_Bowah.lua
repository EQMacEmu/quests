function event_say(e)

	if ( e.message:findi("hail") ) then
		e.self:Say("Leave immediately.");
		eq.signal(208063, e.other:GetID()); -- Helix_Jeson
	end
end
