--[[
p1.1[Tue Jul 10 22:49:39 2012] Coirnav the Avatar of Water shouts 'Those that violate my domain will pay. I call upon the power imbued to me by Povar! Come forth my minions of vapor and destroy these intruders.'
p1.2[Tue Jul 10 22:52:35 2012] Coirnav the Avatar of Water shouts 'Those that violate my domain will pay. I call upon the power imbued to me by E`ci! Come forth my minions of ice and destroy these intruders.'
p1.3[Tue Jul 10 22:54:33 2012] Coirnav the Avatar of Water shouts 'Those that violate my domain will pay. I call upon the power imbued to me by Tarew Marr! Come forth minions of water and destroy these intruders.'
p2[Tue Jul 10 22:58:06 2012] Coirnav the Avatar of Water shouts 'Fools you have gotten this far but you will not succeed. Pwelon, Nrinda, and Vamuil kill these intruders!'
10m[Tue Jul 10 22:59:26 2012] Coirnav the Avatar of Water is suddenly surrounded by a slight glow. A low constant humming is heard in the background.
12m[Tue Jul 10 23:01:23 2012] Coirnav the Avatar of Water is now glowing noticeably brighter and the constant humming is getting louder.
p3[Tue Jul 10 23:02:43 2012] Coirnav the Avatar of Water shouts 'Defenders of vapor, ice, and water I call thee to my aid.  Destroy the defilers of water.'
14m[Tue Jul 10 23:03:21 2012] Coirnav the Avatar of Water glows to brilliant flash of light that suddenly fades. The constant humming suddenly becomes a deafening roar that also mysteriously fades away.
15m[Tue Jul 10 23:04:20 2012] Coirnav the Avatar of Water shouts 'Violaters of this plane be banished from this domain!'

[Thu Apr  5 21:44:17 2012] The monstrous creature spasms in its last death throes sending shockwaves through the reef.  Corinav the Avatar of Water, empowered by the focus of the Triumvirate, has fallen at the hands of the brave adventurers deep within the reef.
]]
local COIRNAV_TYPE = 216048; -- Coirnav_the_Avatar_of_Water
local GUARDIAN_TYPE = 216053; -- Guardian_of_Coirnav
local PWELON_TYPE = 216236; -- Pwelon_of_Vapor
local NRINDA_TYPE = 216245; -- Nrinda_of_Ice
local VAMUIL_TYPE = 216247; -- Vamuil_of_Water
local VAPORFIEND_TYPE = 216257; -- a_triloun_vaporfiend
local VAPORLING_TYPE = 216256; -- a_triloun_vaporling
local ICEFIEND_TYPE = 216260; -- a_hraquis_icefiend
local ICELING_TYPE = 216259; -- a_hraquis_iceling
local WATERFIEND_TYPE = 216258; -- a_regrua_waterfiend
local WATERLING_TYPE = 216265; -- a_regrua_waterling
local PROJECTION_TYPE = 216266; -- Essence_of_Water
local MONSTROUS_TYPE = 216072; -- The_monstrous

local COIRNAV_SPAWNID = 365647;
local GUARDIAN_SPAWNID = 366321;

local SPAWN_LOCS = {
	{ -829,1017,-501 },
	{ -846,1062,-535 },
	{ -836,1125,-461 },
	{ -795,1108,-523 },
	{ -802,1119,-501 },
	{ -810,1034,-502 },
	{ -898,1041,-523 },
	{ -847,1148,-535 },
	{ -862,1125,-501 },
	{ -798,1067,-501 },
	{ -824,1018,-523 },
	{ -906,1048,-502 },
	{ -870,1141,-523 },
	{ -824,1152,-502 },
	{ -916,1121,-502 },
	{ -835,1075,-461 },
	{ -861,998,-502 },
	{ -863,1100,-535 },
	{ -894,1091,-523 },
	{ -882,1013,-501 },
	{ -837,1145,-523 },
	{ -875,1166,-502 },
	{ -794,1059,-523 },
	{ -884,1145,-535 },
	{ -779,1110,-502 },
};

local phase, kills;

function SpawnWave(wave)
	local t;
	if ( wave == 1 ) then
		t = VAPORFIEND_TYPE;
	elseif ( wave == 2 ) then
		t = ICEFIEND_TYPE;
	elseif ( wave == 3 ) then
		t = WATERFIEND_TYPE;
	end
	
	for i = 1, #SPAWN_LOCS do
		if ( not wave or wave > 3 ) then
			t = eq.ChooseRandom(VAPORLING_TYPE, ICELING_TYPE, WATERLING_TYPE);
		end
		eq.spawn2(t, 70, 0, SPAWN_LOCS[i][1], SPAWN_LOCS[i][2], SPAWN_LOCS[i][3], 0);
	end
end

function CoirnavSpawn(e)
	eq.get_entity_list():GetSpawnByID(GUARDIAN_SPAWNID):Repop();
	phase = 1;
	kills = 0;
end

function CoirnavSignal(e)
	if ( e.signal == 1 ) then
		e.self:Shout("Those that violate my domain will pay. I call upon the power imbued to me by Povar! Come forth my minions of vapor and destroy these intruders.");
		eq.set_timer("phase1.2", 180000);
		eq.set_timer("phase1.3", 300000);
		eq.set_timer("warning1", 600000);
		eq.set_timer("warning2", 720000);
		eq.set_timer("warning3", 840000);
		eq.set_timer("fail", 900000);
		--eq.set_timer("aoe", 30000);
		SpawnWave(1);
		eq.spawn2(PWELON_TYPE, 0, 0, -860, 1065, -480, 64);
		e.self:SetSpecialAbility(24, 0); -- Will Not Aggro off
		e.self:SetSpecialAbility(25, 0); -- Immune to Aggro off
		
	elseif ( e.signal == 2 ) then
		eq.depop_all(PWELON_TYPE);
		eq.depop_all(NRINDA_TYPE);
		eq.depop_all(VAMUIL_TYPE);
		--eq.stop_timer("aoe");
		
		e.self:Shout("Fools you have gotten this far but you will not succeed. Pwelon, Nrinda, and Vamuil kill these intruders!");
		
		eq.spawn2(PWELON_TYPE, 0, 0, -860, 1065, -480, 64):CastToNPC():SetBaseHP(130000);
		eq.spawn2(NRINDA_TYPE, 0, 0, -877, 1095, -480, 64):CastToNPC():SetBaseHP(120000);
		eq.spawn2(VAMUIL_TYPE, 0, 0, -860, 1120, -480, 64):CastToNPC():SetBaseHP(155000);
		
		e.self:SetSpecialAbility(35, 0); -- No Harm from Players off
		e.self:SetBodyType(1, false);	-- Humanoid
		phase = 2;
	
	elseif ( e.signal == 3 ) then
		e.self:Shout("Defenders of vapor, ice, and water I call thee to my aid.  Destroy the defilers of water.");
		e.self:SetBaseHP(250000);
		e.self:BuffFadeAll();
		e.self:WipeHateList();
		phase = 3;
		SpawnWave(4);
		eq.set_timer("phase3wave", 49000);
	end
end

function CoirnavTimer(e)
	
	if ( e.timer == "aoe" ) then
		-- this makes him cast while untargetable/unaggroable, but apparently he should be awake enough to hit people
		e.self:CastSpell(3061, e.self:GetID()); -- Curse of the Triumvirate
		return;
	elseif ( e.timer == "phase3wave" ) then
		SpawnWave(4);
		return;
	end
	
	eq.stop_timer(e.timer);
	
	if ( e.timer == "phase1.2" ) then
		e.self:Shout("Those that violate my domain will pay. I call upon the power imbued to me by E`ci! Come forth my minions of ice and destroy these intruders.");
		SpawnWave(2);
		eq.spawn2(NRINDA_TYPE, 0, 0, -877, 1095, -480, 64);
		
	elseif ( e.timer == "phase1.3" ) then
		e.self:Shout("Those that violate my domain will pay. I call upon the power imbued to me by Tarew Marr! Come forth minions of water and destroy these intruders.");
		SpawnWave(3);
		eq.spawn2(VAMUIL_TYPE, 0, 0, -860, 1120, -480, 64);
	
	elseif ( e.timer == "warning1" ) then
		eq.zone_emote(0, "Coirnav the Avatar of Water is suddenly surrounded by a slight glow. A low constant humming is heard in the background.");
		
	elseif ( e.timer == "warning2" ) then
		eq.zone_emote(0, "Coirnav the Avatar of Water is now glowing noticeably brighter and the constant humming is getting louder.");
	
	elseif ( e.timer == "warning3" ) then
		eq.zone_emote(0, "Coirnav the Avatar of Water glows to brilliant flash of light that suddenly fades. The constant humming suddenly becomes a deafening roar that also mysteriously fades away.");
	
	elseif ( e.timer == "fail" ) then
		e.self:Shout("Violaters of this plane be banished from this domain!");
		e.self:CastSpell(1099, e.self:GetID()); -- Banishment of the Pantheon
		eq.signal(MONSTROUS_TYPE, 1, 2000);
	end
end

function GuardianDeathComplete(e)
	eq.signal(COIRNAV_TYPE, 1);
end

function AddDeathComplete(e)
	kills = kills + 1;
	if ( kills >= (#SPAWN_LOCS * 3) ) then
		eq.signal(COIRNAV_TYPE, 2);
	end
end

function MiniBossDeathComplete(e)
	if ( phase ~= 2 ) then
		return;
	end
	local elist = eq.get_entity_list();
	if ( not elist:IsMobSpawnedByNpcTypeID(PWELON_TYPE)
		and not elist:IsMobSpawnedByNpcTypeID(NRINDA_TYPE)
		and not elist:IsMobSpawnedByNpcTypeID(VAMUIL_TYPE)
	) then
		eq.signal(COIRNAV_TYPE, 3);
	end
end

function CoirnavDeathComplete(e)
	eq.depop_all(VAPORLING_TYPE);
	eq.depop_all(ICELING_TYPE);
	eq.depop_all(WATERLING_TYPE);
	eq.zone_emote(0, "The monstrous creature spasms in its last death throes sending shockwaves through the reef.  Corinav the Avatar of Water, empowered by the focus of the Triumvirate, has fallen at the hands of the brave adventurers deep within the reef.");
	eq.spawn2(PROJECTION_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
	eq.signal(PROJECTION_TYPE, e.killer:GetID()); -- e.killer for death_complete is somebody with kill rights, not death blow
end

function MonstrousSignal(e)

	if ( e.signal == 1 ) then
	
		eq.depop_all(VAPORLING_TYPE);
		eq.depop_all(ICELING_TYPE);
		eq.depop_all(WATERLING_TYPE);
		eq.depop_all(VAPORFIEND_TYPE);
		eq.depop_all(ICEFIEND_TYPE);
		eq.depop_all(WATERFIEND_TYPE);
		eq.depop_all(PWELON_TYPE);
		eq.depop_all(NRINDA_TYPE);
		eq.depop_all(VAMUIL_TYPE);
		eq.depop_with_timer(COIRNAV_TYPE);
		
		if ( phase == 1 ) then
			eq.update_spawn_timer(COIRNAV_SPAWNID, 10800000);
		end
	end
end

function event_encounter_load(e)
	eq.register_npc_event("Coirnav", Event.spawn, COIRNAV_TYPE, CoirnavSpawn);
	eq.register_npc_event("Coirnav", Event.timer, COIRNAV_TYPE, CoirnavTimer);
	eq.register_npc_event("Coirnav", Event.signal, COIRNAV_TYPE, CoirnavSignal);
	eq.register_npc_event("Coirnav", Event.death_complete, COIRNAV_TYPE, CoirnavDeathComplete);
	eq.register_npc_event("Coirnav", Event.death_complete, GUARDIAN_TYPE, GuardianDeathComplete);
	eq.register_npc_event("Coirnav", Event.death_complete, VAPORFIEND_TYPE, AddDeathComplete);
	eq.register_npc_event("Coirnav", Event.death_complete, ICEFIEND_TYPE, AddDeathComplete);
	eq.register_npc_event("Coirnav", Event.death_complete, WATERFIEND_TYPE, AddDeathComplete);
	eq.register_npc_event("Coirnav", Event.death_complete, PWELON_TYPE, MiniBossDeathComplete);
	eq.register_npc_event("Coirnav", Event.death_complete, NRINDA_TYPE, MiniBossDeathComplete);
	eq.register_npc_event("Coirnav", Event.death_complete, VAMUIL_TYPE, MiniBossDeathComplete);	
	eq.register_npc_event("Coirnav", Event.signal, MONSTROUS_TYPE, MonstrousSignal);
end
