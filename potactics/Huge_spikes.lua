function event_combat(e)
	if ( e.joined ) then
		e.self:Emote("explode angrily from the walls.");
		eq.depop_with_timer();
	end
end
