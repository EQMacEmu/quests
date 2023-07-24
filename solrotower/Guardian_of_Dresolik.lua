local GUARDIAN_SPAWNIDS = { 367793, 367794, 367795, 367796 };

function event_spawn(e)
	local elist = eq.get_entity_list();
	for _, id in ipairs(GUARDIAN_SPAWNIDS) do
		elist:GetSpawnByID(id):SetTimer(1);
	end
end

function event_death_complete(e)
	if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(212046) ) then -- Guardian_of_Dresolik
		eq.unique_spawn(212408, 0, 0, 606, 1584, -152, 64); -- The_Protector_of_Dresolik
	end
end

function event_timer(e)

	if ( e.timer == "bounds" ) then
	
		if ( e.self:GetX() > 978 or e.self:GetX() < 558 ) then
		
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
			e.self:WipeHateList();
			e.self:CastSpell(2830, e.self:GetID()); -- Annul Self			
		end
		
	end
end

function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("bounds", 6000);
	else
		eq.stop_timer("bounds");
	end
end
