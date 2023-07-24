
function CorbinWaypoint(e)
	if(e.wp == 2) then
		e.self:Say("Almost there now, just a bit further...");
	elseif(e.wp == 3) then
		e.self:Say("Uh oh, looks like they were tipped off somehow... I hope you can handle them.");
		eq.spawn2(116029,18,0,-2366,-428,205,0); -- Commander_Bahreck
		eq.spawn2(116030,19,0,-2364,-448,205,0); -- Ry`Gorr_Basher
		eq.spawn2(116030,19,0,-2392,-436,205,0); -- Ry`Gorr_Basher
		eq.spawn2(116129,19,0,-1756,-951,220,0); -- Kromrif_Soldier
		eq.spawn2(116129,19,0,-1780,-935,220,0); -- Kromrif_Soldier
		eq.spawn2(116030,19,0,-1808,-952,215,0); -- Ry`Gorr_Basher
		eq.spawn2(116030,19,0,-1512,-244,186,0); -- Ry`Gorr_Basher
		eq.spawn2(116030,19,0,-1487,-262,188,0); -- Ry`Gorr_Basher
	elseif(e.wp == 5) then
		e.self:Say("Well, you're a bit tougher than I had given you credit for. I owe you my life, friend. The camp is right over here.");
	elseif(e.wp == 6) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(116118) or eq.get_entity_list():IsMobSpawnedByNpcTypeID(116036)) then
			eq.depop(116036);
			eq.depop_with_timer(116118);
			eq.unique_spawn(116035,0,0,-3188,-574,158,62); -- NPC: #Dobbin_Crossaxe
		end
	elseif(e.wp == 7) then
		e.self:Say("I have escaped! With the help of our friends here I was saved from certain death. We are in their debt.");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(116035)) then
			eq.get_entity_list():GetMobByNpcTypeID(116035):Say("We thought it was too late, the Dain will be very pleased!");
		end	
	elseif(e.wp == 8)then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(116035)) then
			eq.get_entity_list():GetMobByNpcTypeID(116035):Say("Please friend, show me your Mithril ring and I will show you our gratitude.");
		end			
	end
end

function DobbinSpawn(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(116036)) then
		eq.depop(116036);
	elseif(eq.get_entity_list():IsMobSpawnedByNpcTypeID(116035)) then
		eq.depop_with_timer();
	end
end

function CommanderSpawn(e)
	e.self:SetRunning(true);
end

function SoldierSpawn(e)
	e.self:SetRunning(true);
end

function BasherSpawn(e)
	e.self:SetRunning(true);
end

function CommanderWaypoint(e)
	if(e.wp == 1) then
		e.self:SetRunning(false);
	elseif(e.wp == 8) then
		e.self:SetRunning(true);
	end
end

function SoldierWaypoint(e)
	if(e.wp == 1) then
		e.self:SetRunning(false);
	elseif(e.wp == 9) then
		e.self:SetRunning(true);
	end
end

function BasherWaypoint(e)
	if(e.wp == 1) then
		e.self:SetRunning(false);
	elseif(e.wp == 9) then
		e.self:SetRunning(true);
	end
end

function event_encounter_load(e)
	eq.register_npc_event("ringseven", Event.waypoint_arrive, 116034, CorbinWaypoint);
	eq.register_npc_event("ringseven", Event.spawn, 116118, DobbinSpawn);
	eq.register_npc_event("ringseven", Event.spawn, 116029, CommanderSpawn);
	eq.register_npc_event("ringseven", Event.spawn, 116129, SoldierSpawn);
	eq.register_npc_event("ringseven", Event.spawn, 116030, BasherSpawn);
	eq.register_npc_event("ringseven", Event.waypoint_arrive, 116029, CommanderWaypoint);
	eq.register_npc_event("ringseven", Event.waypoint_arrive, 116129, SoldierWaypoint);
	eq.register_npc_event("ringseven", Event.waypoint_arrive, 116030, BasherWaypoint);
end
