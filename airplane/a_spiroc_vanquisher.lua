local arrive = {};

function event_spawn(e)
	local spawnID = e.self:GetSpawnPointID();
	arrive[spawnID] = true;

	if ( spawnID == 364311 ) then -- typeid 71009, grid 20 (3 points)
		eq.set_timer("caller", 1000);
		
	elseif ( spawnID == 364316 ) then -- typeid 71020, grid 21 (2 points)
		eq.set_timer("expulser", 1000);
	
	elseif ( spawnID == 364322 ) then -- typeid 71022, grid 22 (4 points)
		eq.set_timer("arbiter", 1000);
	end
end

function event_signal(e)

	if ( e.signal == 1 ) then
		eq.set_timer("arbiter", 1000);
		
	elseif ( e.signal == 2 ) then
		eq.set_timer("caller", 1000);
		
	elseif ( e.signal == 3 ) then
		eq.set_timer("expulser", 1000);
	end
end

function event_timer(e)
	if ( e.self:IsEngaged() or e.self:Charmed() or not arrive[e.self:GetSpawnPointID()] ) then
		return;
	end
	
	local elist = eq.get_entity_list();
	
	if ( e.timer == "arbiter" ) then
		if ( not elist:IsMobSpawnedByNpcTypeID(71008) ) then -- a_spiroc_arbiter
			eq.update_spawn_timer(364315, 1000);
		end
		
	elseif ( e.timer == "caller" ) then
		if ( not elist:IsMobSpawnedByNpcTypeID(71015) ) then -- a_spiroc_caller
			eq.update_spawn_timer(364310, 1000);
		end
	
	elseif ( e.timer == "expulser" ) then
		if ( not elist:IsMobSpawnedByNpcTypeID(71011) ) then -- a_spiroc_expulser
			eq.update_spawn_timer(364321, 1000);
		end
	end
	
	eq.stop_timer(e.timer);
end

function event_combat(e)
	if ( e.joined ) then
		arrive[e.self:GetSpawnPointID()] = false;
	end
end

function event_waypoint_arrive(e)
	arrive[e.self:GetSpawnPointID()] = true;
end
