local entityIDs = {};

function event_spawn(e)
	eq.set_timer("depop", 60000);
	eq.set_timer("lay", 150);
	eq.set_timer("attack", 6000);
	
	entityIDs[e.self:GetID()] = e.self:GetX();
end

function event_combat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function event_timer(e)
	if ( e.timer == "depop" ) then
		local id = entityIDs[e.self:GetID()];
		if ( id and id == -1954 ) then			
			eq.get_entity_list():GetSpawnByID(365397):SetTimer(1);
		elseif ( id and id == -1748 ) then
			eq.get_entity_list():GetSpawnByID(366053):SetTimer(1);
		elseif ( id and id == -1736 ) then
			eq.get_entity_list():GetSpawnByID(366176):SetTimer(1);
		elseif ( id and id == -1958 ) then
			eq.get_entity_list():GetSpawnByID(367232):SetTimer(1);
		end
		entityIDs[e.self:GetID()] = nil;
		eq.depop();
		
	elseif ( e.timer == "lay" ) then
		eq.stop_timer("lay");
		e.self:SetAppearance(3);

	elseif ( e.timer == "attack" ) then
		eq.stop_timer("attack");
		e.self:SetAggroRange(500);
	end
end
