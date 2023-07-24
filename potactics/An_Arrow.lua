function event_combat(e)
	if ( e.joined ) then
		e.self:Emote("screams through the air toward you.");
		eq.depop_with_timer();
	end
end
