local PLANAR_PROJECTION_TYPE = 207317;
local SORROWSONG_TYPEID = 207052;
local SORROWSONG_SPAWNID = 346761;

local HP_EVENTS = { 99, 90, 80, 70, 60, 50, 40, 30, 25, 20, 10 };
local SPAWN_LOCS = {
	{ 78, -69, 505.5, 128 },
	{ 79, -7, 455.5, 128 },
	{ 21, -37, 455.5, 172 },
	{ -49, -37, 455.5, 96 },
	{ -54, -120, 455.5, 26 },
};

local event = 1;
local spawns = { 0, 0, 0, 0, 0 };

-- spawn the wolf/boarman NPCs on the stairs and under the floor
function Spawn()
	local loc;
	local elist = eq.get_entity_list();
	
	for i = 1, #spawns do
		if ( spawns[i] == 0 or not elist:GetMob(spawns[i]).valid ) then
			loc = SPAWN_LOCS[i];
			spawns[i] = eq.spawn2( eq.ChooseRandom(207023, 207284, 207024, 207291), 0, 0, loc[1], loc[2], loc[3], loc[4] ):GetID();
		end
	end
end

function Despawn()
	local npcList = eq.get_entity_list():GetNPCList();
	
	for i = 1, #spawns do
	
		if ( spawns[i] ~= 0 ) then
			
			for npc in npcList.entries do
		
				if ( npc.valid and npc:GetID() == spawns[i] ) then
					npc:Depop();
				end
			end
			
			spawns[i] = 0;
		end
	end
end

function event_spawn(e)
	eq.get_entity_list():GetSpawnByID(SORROWSONG_SPAWNID):SetTimer(1); -- force spawn Sorrowsong
	event = 1;
	eq.set_next_hp_event(HP_EVENTS[event]);
end

function event_combat(e)
	if ( e.joined ) then
		eq.stop_timer("checkup");
		eq.set_timer("bounds", 5000);
	else
		--eq.get_entity_list():GetSpawnByID(SORROWSONG_SPAWNID):SetTimer(1); -- force spawn Sorrowsong
		eq.set_timer("checkhp", 5000);
		eq.stop_timer("bounds");
		Despawn();
	end
end

function event_timer(e)

	if ( e.timer == "bounds" ) then
	
		if ( e.self:GetZ() < 575 ) then
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
			e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
		end
	
	elseif ( e.timer == "checkhp" ) then
	
		if ( e.self:GetHPRatio() == 100 ) then		
			eq.stop_timer(e.timer);
			
			eq.signal(SORROWSONG_TYPEID, 3); -- revert to untargetable
			event = 1;
			eq.set_next_hp_event(HP_EVENTS[event]);
		end
	end
end

function event_hp(e)
	
	event = event + 1;
	if ( HP_EVENTS[event] ) then
		eq.set_next_hp_event(HP_EVENTS[event]);
	end
	
	if ( e.hp_event == 99 ) then
		e.self:Say("Sorrowsong, sing for us.  We want these wretches to enjoy their stay, don't we?");
		eq.signal(SORROWSONG_TYPEID, 1); -- start silencing
		Spawn();
		return;
		
	elseif ( e.hp_event == 25 ) then
		e.self:Say("This filth is proving to be a challenge!  Sorrowsong, attack these mortals!");
		eq.signal(SORROWSONG_TYPEID, 2); -- become targable/attack
		return;
	end

	for i = 1, 3 do
		-- spawn a_summoned_servant, a_twisted_spirit
		eq.spawn2(eq.ChooseRandom(207306, 207308), 0, 0, math.random(-30, 30), math.random(-105, -55), 580, 0);
	end
end

function event_death_complete(e)
	Despawn();
	eq.spawn2(PLANAR_PROJECTION_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
	eq.signal(PLANAR_PROJECTION_TYPE, e.killer:GetID()); -- e.killer for death_complete is somebody with kill rights, not death blow
end
