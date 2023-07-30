local MEZABLE_TYPE = 222003;
local UNMEZABLE_TYPE = 222039;
local SPAWNIDS = { 369377, 369380, 369382, 369384, 369386, 369387, 369376, 369378, 369379, 369381, 369383, 369385 };
local BOSS_TYPES = { 222035, 222037, 222036, 222038, 222008, 222009, 222010 }; -- Ginto, Chieftans, Chieftan spawners
local TELEPORT_BOUNDS = {
	{ n = 957, s = 861, w = 2248, e = 1925 },
	{ n = 564, s = 238, w = 2600, e = 2521 },
	{ n = 569, s = 236, w = 1595, e = 1511 },
	{ n = -55, s = -132, w = 2180, e = 1855 },
};
local THRESHOLDS = { 75, 50, 25, 11 };
local MIN_HITS = { 623, 533, 444, 354, 185 };
local MAX_HITS = { 2964, 2498, 2032, 1566, 850 };

local killed = {};
local state = {};

function TeleportClient(c)
	local x = math.random(1, 4);
	local rollX, rollY;
	
	rollX = math.random(TELEPORT_BOUNDS[x].e, TELEPORT_BOUNDS[x].w);
	rollY = math.random(TELEPORT_BOUNDS[x].s, TELEPORT_BOUNDS[x].n);
	
	c:MovePC(222, rollX, rollY, -255, math.random(0, 510));
end

-- if this respawn is the only councilman up, repop all of them
function event_spawn(e)
	local elist = eq.get_entity_list();
	
	local mySpawnID = e.self:GetSpawnPointID();
	killed[mySpawnID] = nil;
	state[mySpawnID] = nil;

	for _, id in ipairs(SPAWNIDS) do
		if ( id ~= mySpawnID ) then
			if ( elist:GetSpawnByID(id):GetNPC().valid ) then
				return;
			end
		end
	end
	
	for _, id in ipairs(SPAWNIDS) do
		eq.update_spawn_timer(id, 1);
	end
	eq.debug("Full council repop");
end

function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("teleport", 60000);
		if ( e.self:GetNPCTypeID() == MEZABLE_TYPE ) then
			eq.set_timer("check_mez", 1000);
		else
			eq.set_timer("checkhp", 3000);
		end
	else
		eq.stop_timer("teleport");
		eq.stop_timer("check_mez");
		eq.stop_timer("check_unmez");
		eq.stop_timer("ten_min");
	end
end

function event_timer(e)

	if ( e.timer == "checkhp" ) then
	
		local mySpawnID = e.self:GetSpawnPointID();
		local myState = state[mySpawnID] or 1;
		local ratio = e.self:GetHPRatio();
		
		if ( not e.self:IsEngaged() ) then
			-- reset NPC combat stats if deaggroed and healed
			if ( myState > 1 and ratio > THRESHOLDS[1] ) then
				state[mySpawnID] = 1;
				e.self:ModifyNPCStat("min_hit", tostring(MIN_HITS[1]));
				e.self:ModifyNPCStat("max_hit", tostring(MAX_HITS[1]));
				e.self:ModifyNPCStat("accuracy", tostring(350));
				e.self:ModifyNPCStat("atk", tostring(30));
				eq.stop_timer(e.timer);
				eq.debug("Councilman combat stats reset", 3);
				return;
			
			elseif ( myState == 1 and ratio > THRESHOLDS[1] ) then
				eq.stop_timer(e.timer);
			end
		end
		
		if ( myState > #THRESHOLDS ) then
			return;
		elseif ( ratio < THRESHOLDS[myState] ) then
		
			-- anti-cheat: if ginto, any chieftan, or chieftan spawners are up, then don't allow councilmen to reduce stats
			--[[
			local elist = eq.get_entity_list();
			for _, id in ipairs(BOSS_TYPES) do
				if ( elist:IsMobSpawnedByNpcTypeID(id) ) then
					return;
				end
			end
			]]
			
			-- new anti-cheat way is to despawn this NPC so players get 3.5 days after Ginto kill to attempt Rathe
			if ( eq.get_entity_list():GetSpawnByID(369490):GetNPC().valid ) then
				return;
			end
		
			myState = myState + 1;
			state[mySpawnID] = myState;
			e.self:ModifyNPCStat("min_hit", tostring(MIN_HITS[myState]));
			e.self:ModifyNPCStat("max_hit", tostring(MAX_HITS[myState]));
			if ( myState == 5 ) then
				e.self:ModifyNPCStat("accuracy", tostring(0));
				e.self:ModifyNPCStat("atk", tostring(0));
				
				if ( e.self:GetTarget().valid and e.self:GetTarget():IsClient() ) then
					eq.debug( string.format("PoEarthB Rathe Councilman disempowered; Tank: %s <%s>", e.self:GetTarget():GetName(), e.self:GetTarget():CastToClient():GetGuildName()) );
				end
			end
			eq.zone_emote(0, "The ground shudders beneath your feet as flecks of dirt and stone fall away from one of the Rathe.");
			
		end
	
	elseif ( e.timer == "teleport" ) then
		
		if ( e.self:IsMezzed() or e.self:GetHPRatio() < 11 ) then
			return;
		end
		--[[
		local hl = e.self:GetHateList();
		local clients = {};
		for ent in hl.entries do
			if ( ent.ent:IsClient() and e.self:CalculateDistance(ent.ent:GetX(), ent.ent:GetY(), ent.ent:GetZ()) < 600 ) then
				table.insert(clients, ent.ent:CastToClient());
			end
		end
		
		if ( #clients > 0 ) then
			TeleportClient( clients[math.random(1, #clients)] );
		end
		]]
		local c = e.self:GetHateRandomClient(600);
		if ( c and c.valid ) then
			TeleportClient(c);
		end
		
	elseif ( e.timer == "ten_min" ) then
	
		-- this attempts to replicate the quirk Sony's code had which dropped aggro after the NPC was mezzed for 10 minutes
		if ( e.self:IsMezzed() ) then
			e.self:WipeHateList();
			eq.debug("Mezzed Councilman hate list wiped", 3);
		else
			eq.stop_timer(e.timer);
		end
		
	elseif ( e.timer == "check_mez" ) then
	
		if ( e.self:IsMezzed() ) then
			eq.stop_timer(e.timer);
			eq.set_timer("ten_min", 600000);
			eq.set_timer("check_unmez", 1000);
		end
		
	elseif ( e.timer == "check_unmez" ) then
	
		if ( not e.self:IsMezzed() ) then
			eq.stop_timer(e.timer);
			eq.stop_timer("ten_min");
			eq.set_timer("check_mez", 1000);
		end
	end
end

function event_signal(e)
	killed[e.signal] = 1;
end

function event_death_complete(e)

	-- keeping track of kills in case something goes wrong and spawn timers get screwy
	local mySpawnID = e.self:GetSpawnPointID();
	killed[mySpawnID] = 1;
	local myType = e.self:GetNPCTypeID();
	
	-- the killed table is not shared between the two types, so have to communicate
	if ( myType == UNMEZABLE_TYPE ) then
		eq.signal(MEZABLE_TYPE, mySpawnID);
	else
		eq.signal(UNMEZABLE_TYPE, mySpawnID);
	end

	for _, id in ipairs(SPAWNIDS) do
		if ( not killed[id] ) then
			return;
		end
	end

	local elist = eq.get_entity_list();
	if ( not elist:IsMobSpawnedByNpcTypeID(MEZABLE_TYPE) and not elist:IsMobSpawnedByNpcTypeID(UNMEZABLE_TYPE) ) then
	
		eq.zone_emote(0, "The last of the council falls to the ground all signs of life gone.  Suddenly twelve voices are heard chanting a mystical spell saying, 'Time comes and time passes for the stone is forever.  Now we call upon our collective power to defend our stronghold!'  The chanting then stops and a deep throated primal scream is heard as the power of twelve comes together as one.  The Avatar of Earth has been summoned to defend Ragrax.");
		eq.unique_spawn(222040, 0, 0, 2050, 410, -210, 0); -- #Avatar_of_Earth

		local variance = math.random(1, 1440);
		local t = (60 * 60 + variance) * 60; -- (60 hours/2.5 days * 60 minutes + variance) * 60 seconds
		for i, id in ipairs(SPAWNIDS) do
			eq.update_spawn_timer(id, t*1000);
		end
	end
end
