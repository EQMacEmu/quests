local BLADE_TYPE1 = 214310; -- Animated_Decorin_Blade that drops Decorin Ore Shard
local BLADE_TYPE2 = 214326; -- Animated_Decorin_Blade that drops Useless Hunk of Metal
local SPAWN_LOCS = {
	{ 1260, 2136, -302.65 },
	{ 1449, 1734, -305 },
	{ 1246, 1775, -307 },
	{ 1693, 1955, -305 },
};

local spawnCount = 0;

function CountBlades()
	local npcList = eq.get_entity_list():GetNPCList();
	local count = 0;
	
	for npc in npcList.entries do
	
		if ( npc.valid and (npc:GetNPCTypeID() == BLADE_TYPE1 or npc:GetNPCTypeID() == BLADE_TYPE2) ) then
			count = count + 1;
		end
	end
	
	return count;
end

function SpawnBlades(n, tagrin)
	local loc, mob, tar, typ;
	for i = 1, n do
		loc = SPAWN_LOCS[math.random(1, 4)];
		
		if ( spawnCount > 10 ) then -- these stop dropping shards after a certain number of spawns
			typ = BLADE_TYPE2;
		else
			typ = BLADE_TYPE1;
		end
		
		mob = eq.spawn2(typ, 0, 0, loc[1], loc[2], loc[3], 0);
		mob:SetRunning(true);
		if ( tagrin:IsEngaged() ) then
			tar = tagrin:GetHateRandomClient();
		end
		if ( tar and tar.valid ) then
			mob:AddToHateList(tar, 20);
		end
		
		spawnCount = spawnCount + 1;
	end
end

function AggroBlades(tagrin)
	local npcList = eq.get_entity_list():GetNPCList();
	local tar;
	
	for npc in npcList.entries do
	
		if ( npc.valid and (npc:GetNPCTypeID() == BLADE_TYPE1 or npc:GetNPCTypeID() == BLADE_TYPE2) ) then
			
			if ( tagrin:IsEngaged() ) then
				tar = tagrin:GetHateRandom();
			end
			if ( tar and tar.valid ) then
				npc:AddToHateList(tar, 20);
			end				
		end
	end
end

function event_spawn(e)
	spawnCount = 0;
end

function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("tick", 6000);
		AggroBlades(e.self);
	else
		eq.stop_timer("tick");
	end
end

function event_timer(e)

	if ( e.timer == "tick" ) then
	
		if ( e.self:GetY() < 1685 ) then
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());			
			e.self:WipeHateList();
			e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
		end
		
		local blades = CountBlades();
		
		if ( blades < 3 ) then
			SpawnBlades(3 - blades, e.self);
		elseif ( blades < 5 ) then
			SpawnBlades(1, e.self);
		end
	end
end
