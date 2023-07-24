function event_say(e)

	local qglobals = eq.get_qglobals(e.other);

	if ( e.message:findi("hail") ) then
		if ( qglobals.aerindar ) then
			e.self:Emote("We've heard about your victory "..e.other:GetName()..". Hopefully our lands will begin to purify once more.");
		else
			e.self:Emote("remains silent.");
		end
	end
end
