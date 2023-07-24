function event_spawn(e)
	e.self:SetRunning(true);
	local sp = e.self:GetSpawnPointID();
	local spawn = eq.get_entity_list():GetSpawnByID(sp);
	spawn:SetRespawnTimer(5);
end

function event_death(e)
	local sp = e.self:GetSpawnPointID();
	local spawn = eq.get_entity_list():GetSpawnByID(sp);
	spawn:SetRespawnTimer(14400);
end
