function event_say(e)

	local qglobals = eq.get_qglobals(e.other);

	if ( e.message:findi("hail") ) then
		if ( qglobals.aerindar ) then
			e.self:Emote("looks at you humbly. 'I heard about your run in with Aerin`Dar. The Battalion of Marr salutes you.");
		else
			e.self:Emote("stands at attention.");
		end
	end
end
