local CENTIEN_XAKRA_TYPES = {
	158008, -- #Qua_Centien_Xakra
	158122, -- #Zov_Centien_Xakra
	158088, -- #Zun_Centien_Xakra
	158113, -- #Pli_Centien_Xakra
	158121, -- #Eom_Centien_Xakra
};

local VA_LIAKO_XAKRA_TYPES = {
	158029, -- #Qua_Va_Liako_Xakra
	158014, -- #Zov_Va_Liako_Xakra
	158123, -- #Zun_Va_Liako_Xakra
	158098, -- #Pli_Va_Liako_Xakra
	158069, -- #Eom_Va_Liako_Xakra
};

local LIAKO_XAKRA_TYPES = {
	158102, -- #Qua_Liako_Xakra
	158110, -- #Zov_Liako_Xakra
	158012, -- #Zun_Liako_Xakra
	158097, -- #Pli_Liako_Xakra
	158112, -- #Eom_Liako_Xakra
};

local SENSHALI_XAKRA_TYPES = {
	158040, -- #Qua_Senshali_Xakra
	158013, -- #Zov_Senshali_Xakra
	158016, -- #Zun_Senshali_Xakra
	158074, -- #Pli_Senshali_Xakra
	158124, -- #Eom_Senshali_Xakra
};

local ZETHON_XAKRA_TYPES = {
	158007, -- #Qua_Zethon_Xakra
	158043, -- #Zov_Zethon_Xakra
	158103, -- #Zun_Zethon_Xakra
	158101, -- #Pli_Zethon_Xakra
	158099, -- #Eom_Zethon_Xakra
};

local THALL_XAKRA_TYPES = {
	158032, -- #Qua_Thall_Xakra
	158116, -- #Zov_Thall_Xakra
	158087, -- #Zun_Thall_Xakra
	158100, -- #Pli_Thall_Xakra
	158125, -- #Eom_Thall_Xakra
};

local CENTIEN_TYPES = {
	158089, -- #Zun_Centien
	158096, -- #Eom_Centien
	158105, -- #Pli_Centien
	158126, -- #Qua_Centien
	158127, -- #Zov_Centien
	158001, -- Eom_Centien
	158000, -- Pli_Centien
	158078, -- Qua_Centien
	158077, -- Zov_Centien
	158030, -- Zun_Centien
};

local THALL_TYPES = {
	158009, -- #Qua_Thall
	158011, -- #Zun_Thall
	158015, -- #Zov_Thall
	158128, -- #Eom_Thall
	158129, -- #Pli_Thall
	158047, -- Qua_Thall
	158038, -- Zun_Thall
	158042, -- Zov_Thall
	158039, -- Eom_Thall
	158046, -- Pli_Thall
};

local LIAKO_TYPES = {
	158108, -- #Pli_Liako
	158111, -- #Qua_Liako
	158130, -- #Eom_Liako
	158131, -- #Zov_Liako
	158141, -- #Zun_Liako
	158056, -- Eom_Liako
	158054, -- Pli_Liako
	158068, -- Qua_Liako
	158066, -- Zov_Liako
	158140, -- Zun_Liako
};

local SENSHALI_TYPES = {
	158104, -- #Qua_Senshali
	158106, -- #Zov_Senshali
	158107, -- #Zun_Senshali
	158132, -- #Eom_Senshali
	158133, -- #Pli_Senshali
	158034, -- Eom_Senshali
	158031, -- Pli_Senshali
	158079, -- Qua_Senshali
	158062, -- Zov_Senshali
	158003, -- Zun_Senshali
};

local VA_LIAKO_TYPES = {
	158091, -- #Zov_Va_Liako
	158109, -- #Eom_Va_Liako
	158114, -- #Qua_Va_Liako
	158134, -- #Pli_Va_Liako
	158137, -- #Zun_Va_Liako
	158017, -- Eom_Va_Liako
	158053, -- Pli_Va_Liako
	158067, -- Qua_Va_Liako
	158002, -- Zov_Va_Liako
	158041, -- Zun_Va_Liako
};

local ZETHON_TYPES = {
	158090, -- #Qua_Zethon
	158094, -- #Zun_Zethon
	158115, -- #Pli_Zethon
	158138, -- #Eom_Zethon
	158139, -- #Zov_Zethon
	158033, -- Eom_Zethon
	158035, -- Pli_Zethon
	158048, -- Qua_Zethon
	158076, -- Zov_Zethon
	158049, -- Zun_Zethon
};

local AKHEVA_TYPES = { CENTIEN_TYPES, THALL_TYPES, LIAKO_TYPES, SENSHALI_TYPES, VA_LIAKO_TYPES, ZETHON_TYPES };
local SHADE_TYPES = { CENTIEN_XAKRA_TYPES, THALL_XAKRA_TYPES, LIAKO_XAKRA_TYPES, SENSHALI_XAKRA_TYPES, VA_LIAKO_XAKRA_TYPES, ZETHON_XAKRA_TYPES };

function DeathEvent(e)
	local myType = e.self:GetNPCTypeID();
	local myLevel = e.self:GetLevel();
	local myClass = e.self:GetClass();
	local spawnType = CENTIEN_XAKRA_TYPES[1];
	local minType, maxType = 1, 3;		-- default to Qua, Zov, Zun
	
	if ( myLevel == 66 ) then		-- Eom
		minType = 3;
		maxType = 5;
	end
	
	if ( myClass == 1 ) then
		spawnType = CENTIEN_XAKRA_TYPES[math.random(minType, maxType)];
		
	elseif ( myClass == 2 ) then
		spawnType = THALL_XAKRA_TYPES[math.random(minType, maxType)];
	
	elseif ( myClass == 9 ) then
		spawnType = SENSHALI_XAKRA_TYPES[math.random(minType, maxType)];
		
	elseif ( myClass == 12 ) then
		spawnType = ZETHON_XAKRA_TYPES[math.random(minType, maxType)];
		
	elseif ( myClass == 3 or myClass == 5 ) then
		if ( math.random(100) > 50 ) then
			spawnType = LIAKO_XAKRA_TYPES[math.random(minType, maxType)];
		else
			spawnType = VA_LIAKO_XAKRA_TYPES[math.random(minType, maxType)];
		end
	end

	eq.spawn2(spawnType, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);

	-- if players are killing mobs from a different floor, death touch the raid
	if ( (e.self:GetSpawnPointZ() > 100 and e.self:GetZ() < 100) or (e.self:GetSpawnPointZ() < 100 and e.self:GetZ() > 100) ) then
	
		local x, y = e.self:GetX(), e.self:GetY();
		local clientList = eq.get_entity_list():GetClientList();
		local name, guild = "", "";
		for client in clientList.entries do
			if ( not client:GetGM() and math.abs(client:GetX() - x) < 300 and math.abs(client:GetY() - y) < 300 ) then
				eq.signal(158480, client:GetID()); -- Stop_Cheating; tell it to Cazic Touch
				if ( name == "" ) then
					name = client:GetName();
					guild = client:GetGuildName();
				end
			end
		end
		
		eq.debug(string.format("VexThal %s's raid death touched for cheating at %i %i %i <%s>", name, x, y, e.self:GetZ(), guild));
	end
end


function SpawnEvent(e)
	eq.set_timer("depop", 2220000);
end

function TimerEvent(e)
	if ( e.timer == "depop" ) then
		eq.stop_timer("depop");
		eq.depop();
	end
end

function CombatEvent(e)
	if ( e.joined ) then
		if ( not eq.is_paused_timer("depop") ) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function event_encounter_load(e)

	for _, classTypes in ipairs(AKHEVA_TYPES) do
		for _, akhevaType in ipairs(classTypes) do
			eq.register_npc_event("deathspawn", Event.death_complete, akhevaType, DeathEvent);
		end
	end

	for _, classTypes in ipairs(SHADE_TYPES) do
		for _, akhevaType in ipairs(classTypes) do
			eq.register_npc_event("deathspawn", Event.spawn, akhevaType, SpawnEvent);
			eq.register_npc_event("deathspawn", Event.timer, akhevaType, TimerEvent);
			eq.register_npc_event("deathspawn", Event.combat, akhevaType, CombatEvent);
		end
	end
end
