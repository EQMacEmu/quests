function event_spawn(e)
	e.self:SetRunning(true);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("No time to talk!! I must be on my way. I am in a race with the paladins from the Temple of Life.");
	end
end

function event_death(e)
	local sp = e.self:GetSpawnPointID();
	local spawn = eq.get_entity_list():GetSpawnByID(sp);
	spawn:SetRespawnTimer(840);
end
