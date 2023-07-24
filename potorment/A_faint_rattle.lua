function event_combat(e)
	e.self:Emote("of chains draws your attention to a sudden movement in the mist above you!");
	eq.spawn2(207299, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0); -- A_parylyx_hatchling
	eq.depop_with_timer();
end
