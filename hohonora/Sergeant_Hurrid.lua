function event_spawn(e)
	eq.set_timer("formation", 55000);
end

function event_timer(e)
	if ( e.timer == "formation" ) then
		if ( e.self:GetX() == e.self:GetSpawnPointX() and e.self:GetY() == e.self:GetSpawnPointY() ) then
			e.self:Say("Stay in formation!");
			eq.signal(211029, 1); -- An_Imperon_Servicemen
		end
	end
end
