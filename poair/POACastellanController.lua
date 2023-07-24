local CASTELLAN_TYPE = 215000; -- A_Castellan_of_Air
local ALRANDERISAN_TYPE = 215383; -- #Constable_Alranderisan
local BELECOHEN_TYPE = 215384; -- #Constable_Belecohen
local FERABALEN_TYPE = 215385; -- #Constable_Ferabalen
local CHAMBERLAIN_TYPE = 215411; -- #Chamberlain_Escalardian
local APPRENTICE_TYPE = 215410; -- #A_Chamberlain`s_Apprentice
local ARMOR_GUY_TYPE = 215418; -- armor_guy

local CASTELLAN_SPAWNIDS = { 365333, 365444, 365629, 365679, 365833, 366093, 366315, 366369, 366414, 366612, 
							366707, 366798, 367079, 367099, 367284 };
local LOCS = {
	[ALRANDERISAN_TYPE] = { 403, 463, -88.5 },
	[BELECOHEN_TYPE] = { 518, 456, -88.5 },
	[FERABALEN_TYPE] = { 461, 498, -85.875 },
};

local signals = {};
local kills = 0;
local spawns = { ALRANDERISAN_TYPE, BELECOHEN_TYPE, FERABALEN_TYPE };

function RepopIsland()
	local elist = eq.get_entity_list();

	for _, id in ipairs(CASTELLAN_SPAWNIDS) do
		elist:GetSpawnByID(id):Repop();
	end
	
	kills = 0;
	
	for i = 2, 4 do
		signals[i] = nil;
	end

	spawns[1] = eq.ChooseRandom(ALRANDERISAN_TYPE, BELECOHEN_TYPE, FERABALEN_TYPE);
	spawns[2] = nil;
	spawns[3] = nil;
	while ( not spawns[2] ) do
		spawns[2] = eq.ChooseRandom(ALRANDERISAN_TYPE, BELECOHEN_TYPE, FERABALEN_TYPE);
		if ( spawns[2] == spawns[1] ) then
			spawns[2] = nil;
		end
	end
	while ( not spawns[3] ) do
		spawns[3] = eq.ChooseRandom(ALRANDERISAN_TYPE, BELECOHEN_TYPE, FERABALEN_TYPE);
		if ( spawns[3] == spawns[1] or spawns[3] == spawns[2] ) then
			spawns[3] = nil;
		end
	end
end

function event_spawn(e)
	eq.set_timer("castellan_repop", 1080000);
end

function event_timer(e)

	if ( e.timer == "castellan_repop" ) then
		RepopIsland();
	end
end

function event_signal(e)

	if ( e.signal == 1 ) then
	
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(CASTELLAN_TYPE) ) then
			eq.set_timer("castellan_repop", 1080000); -- 18 mins
		else
			eq.set_timer("castellan_repop", 10800000); -- 3 hours
		end
		
		kills = kills + 1;

		local t, mob;
		if ( kills == 5 ) then
			t = spawns[1];
		elseif ( kills == 10 ) then
			t = spawns[2];
		elseif ( kills == 15 ) then
			t = spawns[3];
		end

		if ( t ) then
			loc = LOCS[t];
			mob = eq.unique_spawn(t, 0, 0, LOCS[t][1], LOCS[t][2], LOCS[t][3], 0);
			if ( mob and mob.valid ) then
				eq.debug(mob:GetCleanName().." spawned");
			end
		end
		
	else
		signals[e.signal] = 1;
		
		if ( signals[2] and signals[3] and signals[4] ) then
		
			local elist = eq.get_entity_list();
			local mob;
			
			if ( not elist:IsMobSpawnedByNpcTypeID(CHAMBERLAIN_TYPE) and not elist:IsMobSpawnedByNpcTypeID(APPRENTICE_TYPE) ) then
			
				if ( elist:IsMobSpawnedByNpcTypeID(ARMOR_GUY_TYPE) ) then
					mob = eq.spawn2(CHAMBERLAIN_TYPE, 0, 0, 457, 412, -88.622, 0);
				else
					mob = eq.spawn2(APPRENTICE_TYPE, 0, 0, 457, 412, -88.622, 0);
				end
				if ( mob and mob.valid ) then
					eq.debug(mob:GetCleanName().." spawned");
				end
			end

		end
	end
end
