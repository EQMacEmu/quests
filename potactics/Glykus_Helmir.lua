local BOAR_SPAWNIDS = { 361349, 361350, 361351, 361352, 361356 };
local FLEDGLING_TYPE = 214040; -- a_Fledgling_War_Boar
local ENRAGED_TYPE = 214308; -- an_Enraged_War_Boar
local FIERCE_TYPE = 214296; -- a_Fierce_War_Boar
local GREATER_TYPE = 214300; -- a_Greater_War_Boar
local ENCHANTED_TYPE = 214307; -- an_Enchanted_War_Boar

local boars = {};
for _, id in ipairs(BOAR_SPAWNIDS) do
	boars[id] = 0;
end

function EvolveBoar(spawnId)

	local entityId = boars[spawnId];
	
	if ( entityId and entityId > 0 ) then
	
		local mob = eq.get_entity_list():GetMobID(entityId);
		
		if ( mob and mob.valid ) then
		
			local typeId = mob:GetNPCTypeID();
			local newType;
			
			if ( typeId == FLEDGLING_TYPE ) then
				newType = ENRAGED_TYPE;
			elseif ( typeId == ENRAGED_TYPE ) then
				newType = FIERCE_TYPE;
			elseif ( typeId == FIERCE_TYPE ) then
				newType = GREATER_TYPE;
			elseif ( typeId == GREATER_TYPE ) then
				newType = ENCHANTED_TYPE;
			end
			
			if ( newType ) then
				local newMob = eq.spawn2(newType, 0, 0, mob:GetX(), mob:GetY(), mob:GetZ(), mob:GetHeading());
				boars[spawnId] = newMob:GetID();
				newMob:SetRunning(true);
				mob:Depop();
			end
		end
	end
end

function GetBoarIDs()
	local npc;
	local elist = eq.get_entity_list();
	
	for _, id in ipairs(BOAR_SPAWNIDS) do
	
		npc = elist:GetSpawnByID(id):GetNPC();
		if ( npc.valid ) then
			boars[id] = npc:GetID(); -- fledgling spawned
		end
	end
end

function DepopBoars()
	eq.debug("Boar depop");
	
	local npcList = eq.get_entity_list():GetNPCList();
	local typeId;
	
	for npc in npcList.entries do
	
		if ( npc.valid ) then
			typeId = npc:GetNPCTypeID()
			if ( typeId == ENRAGED_TYPE or typeId == FIERCE_TYPE
				or typeId == GREATER_TYPE or typeId == ENCHANTED_TYPE
			) then
				if ( npc:GetHP() > 0 ) then -- don't poof corpses
					npc:Depop();
				end
			end
		end
	end
end

function event_combat(e)
	if ( e.joined ) then	
		GetBoarIDs();
		eq.set_timer("evolve", 59000);
		eq.set_timer("respawn", 6000);
		eq.zone_emote(0, "Glykus Helmir blows a carved boar horn. 'My pets! I enfuse you with the power of Zek.  Grow and battle with Glykus!'");
	else
		eq.stop_timer("respawn");
		eq.set_timer("poof", 90000);
	end
end

function event_timer(e)

	if ( e.timer == "evolve" ) then

		eq.debug("Evolving boars");
		
		local elist = eq.get_entity_list();
		local spawn, mob;

		for spawnId, entityId in pairs(boars) do
		
			spawn = elist:GetSpawnByID(spawnId);
			
			-- keep resetting respawn timers to prevent more boars from spawning while some are still alive in evolved forms
			if ( not spawn:GetNPC().valid ) then
				spawn:SetTimer(1200000);
			end
			
			-- change boar to new form
			if ( entityId > 0 ) then
				mob = elist:GetMobID(entityId);
				
				if ( mob and mob.valid ) then
					EvolveBoar(spawnId);
				end
			end
		end

		local npcList = eq.get_entity_list():GetNPCList();
		local typeId;
		
		for npc in npcList.entries do
		
			if ( npc.valid ) then
				typeId = npc:GetNPCTypeID()
				if ( typeId == FLEDGLING_TYPE or typeId == ENRAGED_TYPE or typeId == FIERCE_TYPE
					or typeId == GREATER_TYPE or typeId == ENCHANTED_TYPE
				) then
					npc:MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), -1, true);
				end
			end
		end
		
		if ( not e.self:IsEngaged() ) then
			eq.stop_timer(e.timer);
		end
		
	elseif ( e.timer == "respawn" ) then
	
		-- if boar is dead, poofed, or we otherwise lost track of it, spawn a new fledgling one in pen
		local elist = eq.get_entity_list();
		
		for spawnId, entityId in pairs(boars) do
		
			spawn = elist:GetSpawnByID(spawnId);
			
			if ( entityId > 0 ) then
				mob = elist:GetMobID(entityId);
				
				if ( not mob or not mob.valid ) then
					spawn:SetTimer(1);
					boars[spawnId] = 0;
				end
			else
				spawn:SetTimer(1);
			end
		end
		
	elseif ( e.timer == "poof" ) then
		eq.stop_timer(e.timer);
		
		if ( not e.self:IsEngaged() ) then
			DepopBoars();
		end
	end
end

function event_signal(e)
	if ( e.signal == 1 ) then
		GetBoarIDs(); -- pen spawn, record entity ID
	end
end

function event_death_complete(e)
	DepopBoars();
end
