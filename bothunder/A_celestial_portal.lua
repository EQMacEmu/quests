function event_signal(e)
	if ( e.signal == 1 ) then
		e.self:Emote("begins to radiate celestial energy, as several ethereal figures form inside.");
		eq.spawn2(209138, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0); -- An_animated_meteor
	end
end
