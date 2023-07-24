local PLANAR_PROJECTION_TYPE = 220025;

local SPAWNIDS = { 367227, 366604, 367163 };

function event_death_complete(e)
	eq.spawn2(PLANAR_PROJECTION_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
	eq.signal(PLANAR_PROJECTION_TYPE, e.killer:GetID()); -- e.killer for death_complete is somebody with kill rights, not death blow
end

function event_spawn(e)
	local elist = eq.get_entity_list();
	
	for _, id in ipairs(SPAWNIDS) do
		elist:GetSpawnByID(id):SetTimer(1);
	end
end

function event_signal(e)

	if ( e.signal == 1 ) then
		eq.set_timer("check", 3000);
		
	elseif ( e.signal == 2 ) then
		e.self:SetBodyType(11, false);   -- untargetable
		e.self:SetSpecialAbility(24, 1); -- Will Not Aggro on
		e.self:SetSpecialAbility(35, 1); -- No Harm from Players on
	end
end

function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("bounds", 5000);
	else
		eq.stop_timer("bounds");
	end
end

function event_timer(e)

	if ( e.timer == "bounds" ) then
		if ( e.self:GetX() < 2200 ) then
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
			e.self:WipeHateList();
			e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
		end
	
	elseif ( e.timer == "check" ) then
		eq.stop_timer(e.timer);
		
		local npc;
		local killed = 0;
		local elist = eq.get_entity_list();
		
		for _, id in ipairs(SPAWNIDS) do
		
			npc = elist:GetSpawnByID(id):GetNPC();
			if ( not npc or not npc.valid ) then
				killed = killed + 1;
			end
		end
		
		if ( killed == 3 ) then
			e.self:SetBodyType(1, false);   -- make targetable
			e.self:SetSpecialAbility(24, 0); -- Will Not Aggro off
			e.self:SetSpecialAbility(35, 0); -- No Harm from Players off
		end
	end
end
