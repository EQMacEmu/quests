function event_signal(e)
	if ( e.signal == 1 ) then
		if ( e.self:GetX() == e.self:GetSpawnPointX() and e.self:GetY() == e.self:GetSpawnPointY() ) then
			e.self:Say("Sir, yes sir!");
		end
	end
end
