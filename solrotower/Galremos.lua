function SpawnMagmite(x, y, z, num)
	for i = 1, num do
		eq.spawn2(212397, 0, 0, x, y, z, 0); -- a_magmite
	end
end

function event_spawn(e)
	eq.set_next_hp_event(90);
end

function event_hp(e)

	e.self:Emote("begins to break into smaller pieces!");
	
	if (e.hp_event == 90) then
		e.self:ChangeSize(25);
		SpawnMagmite(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 1);
		eq.set_next_hp_event(60);
		
	elseif (e.hp_event == 60) then
		e.self:ChangeSize(20);
		SpawnMagmite(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 2);
		eq.set_next_hp_event(35);
		
	elseif (e.hp_event == 35) then
		e.self:ChangeSize(15);
		SpawnMagmite(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 1);
		eq.set_next_hp_event(20);
		
	elseif (e.hp_event == 20) then
		e.self:ChangeSize(10);
		SpawnMagmite(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 4);
		eq.set_next_hp_event(5);
		
	elseif (e.hp_event == 5) then
		e.self:ChangeSize(6);
		SpawnMagmite(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 6);
	end
end
