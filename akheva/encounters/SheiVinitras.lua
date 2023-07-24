local DEPOP_TIMER = 900000;		-- timer is somewhere between 12-16 minutes for sure; precise value uncertain

local FAKE_SHEI_TYPE = 179032;
local REAL_SHEI_TYPE = 179017;

local DIABO_TATRUA_TYPE = 179021;
local TAVUEL_TATRUA_TYPE = 179020;
local THALL_TATRUA_TYPE = 179024;
local VA_TATRUA_TYPE = 179023;

local XIN_XAKRA_TYPE = 179044;
local XIN_XAKRE_TYPE = 179026;
local XIN_XAKRI_TYPE = 179027;
local XIN_XAKRU_TYPE = 179028;

local XIN_XUKRA_TYPE = 179347;
local XIN_XIKRA_TYPE = 179041;
local XIN_XEKRA_TYPE = 179047;
local XIN_XOKRA_TYPE = 179043;
local XIN_XAKRA__TYPE = 179039;
--local XIN_XYKRA_TYPE = ;				-- these mobs existed, but I could not find enough data on them as they were rare
--local XIN_XIKRA__TYPE = ;				-- they are very similiar to the others however (I think), so it doesn't really matter
--local XIN_XEKRA__TYPE = ;

local TRASH = {
	DIABO_TATRUA_TYPE, TAVUEL_TATRUA_TYPE, THALL_TATRUA_TYPE, VA_TATRUA_TYPE, XIN_XAKRA_TYPE, XIN_XAKRE_TYPE, XIN_XAKRI_TYPE, XIN_XAKRU_TYPE,
	XIN_XUKRA_TYPE, XIN_XIKRA_TYPE, XIN_XEKRA_TYPE, XIN_XOKRA_TYPE, XIN_XAKRA__TYPE
};

function SpawnTatrua()
	eq.unique_spawn(DIABO_TATRUA_TYPE, 0, 0, -1778, 1128, 19.7, 64);
	eq.unique_spawn(THALL_TATRUA_TYPE, 0, 0, -1778, 1108, 19.7, 64);
	eq.unique_spawn(TAVUEL_TATRUA_TYPE, 0, 0, -1778, 1058, 18.2, 64);
	eq.unique_spawn(VA_TATRUA_TYPE, 0, 0, -1778, 1038, 18.2, 64);
end

function FakeCombatEvent(e)
	if ( e.joined ) then
		SpawnTatrua();
		eq.set_timer("aggro", 320000);
	else
		eq.stop_timer("aggro");
	end
end

function TimerEvent(e)
	if ( e.timer == "aggro" ) then
		e.self:Emote("Sivuelaeus Rulour ans Rashan!");
		SpawnTatrua();
	elseif ( e.timer == "depop" ) then
		eq.depop();
	end
end

function FakeDeathEvent(e)
	eq.unique_spawn(REAL_SHEI_TYPE, 0, 0, -1736, 1082, 22.6, 63);
end

function RealCombatEvent(e)
	if ( e.joined ) then
		SpawnTatrua();
		eq.set_timer("aggro", 320000);
		if ( not eq.is_paused_timer("depop") ) then
			eq.pause_timer("depop");
		end
	else
		eq.stop_timer("aggro");
		eq.resume_timer("depop");
	end
end

function SlayEvent(e)
	if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(REAL_SHEI_TYPE)
		or eq.get_entity_list():IsMobSpawnedByNpcTypeID(FAKE_SHEI_TYPE)
	) then
		eq.spawn2(
			eq.ChooseRandom(XIN_XAKRA_TYPE, XIN_XAKRE_TYPE, XIN_XAKRI_TYPE, XIN_XAKRU_TYPE,
				eq.ChooseRandom(XIN_XUKRA_TYPE, XIN_XIKRA_TYPE, XIN_XEKRA_TYPE, XIN_XOKRA_TYPE, XIN_XAKRA__TYPE)
			),
			0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()
		);
	end
end

function SpawnEvent(e)
	eq.set_timer("depop", DEPOP_TIMER);
end

function TrashCombatEvent(e)
	if ( e.joined ) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function event_encounter_load(e)

	for _, id in ipairs(TRASH) do
		eq.register_npc_event("SheiVinitras", Event.slay, id, SlayEvent);
		eq.register_npc_event("SheiVinitras", Event.spawn, id, SpawnEvent);
		eq.register_npc_event("SheiVinitras", Event.combat, id, TrashCombatEvent);
		eq.register_npc_event("SheiVinitras", Event.timer, id, TimerEvent);
	end

	eq.register_npc_event("SheiVinitras", Event.combat, FAKE_SHEI_TYPE, FakeCombatEvent);
	eq.register_npc_event("SheiVinitras", Event.death, FAKE_SHEI_TYPE, FakeDeathEvent);
	eq.register_npc_event("SheiVinitras", Event.slay, FAKE_SHEI_TYPE, SlayEvent);
	
	eq.register_npc_event("SheiVinitras", Event.spawn, REAL_SHEI_TYPE, SpawnEvent);
	eq.register_npc_event("SheiVinitras", Event.combat, REAL_SHEI_TYPE, RealCombatEvent);
	eq.register_npc_event("SheiVinitras", Event.timer, REAL_SHEI_TYPE, TimerEvent);
	eq.register_npc_event("SheiVinitras", Event.slay, REAL_SHEI_TYPE, SlayEvent);
	
	TRASH = nil;
end
