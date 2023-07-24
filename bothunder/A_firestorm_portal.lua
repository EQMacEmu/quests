function event_signal(e)
	if ( e.signal == 1 ) then
		e.self:Emote("begins to glow as a several fiery figures form inside.");
		eq.spawn2(209005, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0); -- A_firestorm_elemental
	end
end
