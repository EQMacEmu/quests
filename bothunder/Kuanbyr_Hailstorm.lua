local TYPES = { 209058, 209057, 209056 }; -- Hrani, Iri, Leistr

function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("tick", 6000);
	else
		eq.stop_timer("tick");
	end
end

function event_timer(e)

	if ( e.timer == "tick" ) then
	
		local npc;
		
		for _, id in ipairs(TYPES) do
	
			npc = eq.get_entity_list():GetNPCByNPCTypeID(id);
			
			if ( npc and npc.valid and e.self:GetTarget() and e.self:GetTarget().valid ) then
				npc:AddToHateList(e.self:GetTarget(), 1);
			end
		end
		
		if ( e.self:GetY() > -1800 ) then
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
		end
	end
end
