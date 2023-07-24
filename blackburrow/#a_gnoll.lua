function event_spawn(e)
	local sp = e.self:GetSpawnPointID();
	local spawn = eq.get_entity_list():GetSpawnByID(sp);
	spawn:SetRespawnTimer(230);
	eq.set_timer("depop",120000);
end

function event_combat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop_with_timer();
end

function event_death(e)
	local sp = e.self:GetSpawnPointID();
	local spawn = eq.get_entity_list():GetSpawnByID(sp);
	spawn:SetRespawnTimer(360);
end
