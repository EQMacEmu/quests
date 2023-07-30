local CONTROLLER_TYPE = 217068; -- A_booming
local GUARDIAN_TYPE = 217050; -- Guardian_of_Doomfire
local REAVER_TYPE = 217417; -- a_rage_reaver_of_flame
local HEALER_TYPE = 217418; -- a_chaos_healer_of_flame
local MAGUS_TYPE = 217419; -- a_dark_magus_of_flame
local DARKFIEND_TYPE = 217421; -- a_doomfire_darkfiend
local CHAOSFIEND_TYPE = 217420; -- a_doomfire_chaosfiend
local RAGEFIEND_TYPE = 217422; -- a_doomfire_ragefiend
local AZOBIAN_TYPE = 217425; -- Azobian_the_Darklord
local JAVONN_TYPE = 217426; -- Javonn_the_Overlord
local HEBAB_TYPE = 217453; -- Hebabbilys_the_Ragelord
local REAX_TYPE = 217427; -- Reaxnous_the_Chaoslord
local KIRTRA_TYPE = 217432; -- Chancellor_Kirtra
local TRAXOM_TYPE = 217433; -- Chancellor_Traxom
local CRATO_TYPE = 217429; -- Omni_Magus_Crato
local PROLLAZ_TYPE = 217428; -- Warlord_Prollaz
local ELITE_TYPE = 217430; -- elite_guardian_of_ro
local FENNIN_TYPE = 217440; -- Fennin_Ro_the_Tyrant_of_Fire
local PROJECTION_TYPE = 217454; -- Essence_of_Fire

local TRASH_TYPES = {
	REAVER_TYPE, HEALER_TYPE, MAGUS_TYPE, DARKFIEND_TYPE, CHAOSFIEND_TYPE, RAGEFIEND_TYPE, AZOBIAN_TYPE, 
	JAVONN_TYPE, HEBAB_TYPE, REAX_TYPE, KIRTRA_TYPE, TRAXOM_TYPE, CRATO_TYPE, PROLLAZ_TYPE
};

local SPAWNS = {	-- these locs are copied from showeq so they are Y, X, Z, 360 degree headings
	[1] = {
		[REAVER_TYPE] = {
			{ -1621,	-588,	-166.625,	329.0625 },
			{ -1321,	-605,	-117.375,	37.26563 },
			{ -1085,	-673,	-145.1589,	2.109375 },
			{ -1620,	-834,	-207.625,	95.625 },
			{ -1465,	-668,	-146.747,	28.82813 },
			{ -1422,	-714,	-146.747,	47.8125 },
			{ -1321,	-561,	-116.625,	337.5 },
			{ -1070,	-719,	-146.747,	54.14063 },
			{ -992,	-579,	-146.747,	78.04688 },
			{ -1202,	-459,	-201.747,	73.82813 },
			{ -1147,	-452,	-201.7444,	94.21875 },
			{ -1643,	-789,	-201.375,	85.07813 },
			{ -1671,	-839,	-207.625,	80.85938 },
			{ -1166,	-624,	-119.75,	319.2188 },
			{ -944,	-575,	-146.747,	100.5469 },
			{ -995,	-500,	-166.747,	159.6094 },
			{ -1003,	-466,	-166.747,	181.4063 },
		},
		[HEALER_TYPE] = {
			{ -955,	-486,	-166.625,	114.6094 },
			{ -1635,	-560,	-166.625,	309.375 },
			{ -956,	-598,	-146.747,	86.48438 },
			{ -1658,	-867,	-207.625,	85.07813 },
			{ -1467,	-715,	-146.747,	44.29688 },
			{ -1197,	-625,	-116.625,	337.5 },
			{ -1172,	-452,	-201.747,	90.70313 },
		},
		[MAGUS_TYPE] = {
			{ -1175,	-584,	-116.625,	311.4844 },
			{ -1636,	-860,	-207.625,	85.07813 },
			{ -1586,	-508,	-166.625,	281.9531 },
			{ -1351,	-576,	-117,	52.73438 },
			{ -1117,	-709,	-145.2836,	16.17188 },
			{ -981,	-596,	-146.625,	86.48438 },
			{ -1152,	-505,	-201.747,	97.73438 },
			{ -1188,	-513,	-201.747,	90.70313 },
		},
		[DARKFIEND_TYPE] = {
			{ -1331,	-590,	-105.497,	10.54688 },
			{ -1180,	-613,	-105.4944,	319.9219 },
			{ -1081,	-703,	-135.4944,	45 },
		},
		[CHAOSFIEND_TYPE] = {
			{ -994,	-483,	-156.1194,	182.1094 },
			{ -969,	-577,	-136.1194,	90.70313 },
			{ -1172,	-471,	-191.122,	90 },
		},
		[RAGEFIEND_TYPE] = {
			{ -1444,	-692,	-134.872,	46.40625 },
			{ -1647,	-823,	-195.75,	90 },
			{ -1604,	-539,	-154.75,	305.1563 },
		},
	},
	[2] = {
		[REAVER_TYPE] = {
			{ -1573,	-1245,	-227.747,	142.0313 },
			{ -1629,	-1241,	-227.747,	104.0625 },
			{ -1621,	-1306,	-227.747,	94.21875 },
			{ -1611,	-1293,	-227.747,	142.0313 },
			{ -1595,	-1274,	-227.747,	142.0313 },
			{ -1585,	-1229,	-227.747,	106.1719 },
			{ -1551,	-1217,	-227.747,	142.0313 },
		},
		[HEALER_TYPE] = {
			{ -1577,	-1284,	-221.747,	142.7344 },
			{ -1584,	-1350,	-200.747,	142.7344 },
			{ -1525,	-1312,	-198.4345,	142.7344 },
			{ -1506,	-1247,	-200.747,	142.7344 },
			{ -1550,	-1302,	-203.747,	142.7344 },
		},
		[MAGUS_TYPE] = {
			{ -1592,	-1335,	-209.747,	142.7344 },
			{ -1540,	-1235,	-221.747,	142.7344 },
			{ -1604,	-1322,	-221.747,	142.7344 },
			{ -1525,	-1247,	-209.747,	142.7344 },
		},
		[AZOBIAN_TYPE] = { { -1513,	-1274,	-184.6845,	139.9219 }, },
		[JAVONN_TYPE] = { { -1495,	-1338,	-181.5,	142.7344 }, },
		[HEBAB_TYPE] = { { -1562,	-1339,	-184.6845,	123.0469 },	},
		[REAX_TYPE] = {	{ -1572,	-1286,	-204.997,	114.6094 },	},
	},
	[3] = {
		[KIRTRA_TYPE]  = { { -1152, -1555, -199, 182 } },
		[TRAXOM_TYPE]  = { { -1132, -1451, -199, 182 } },
		[CRATO_TYPE]   = { { -906, -1393, -183, 182 } },
		[PROLLAZ_TYPE] = { { -906, -1587, -183, 182 } },
	},
	[4] = {
		[FENNIN_TYPE]  = { { -930, -1504, -160, 182 } },
	},
};

local ELITE_SPAWNIDS = { 369529, 369530, 369531, 369532, 369533, 369534, 369535, 369536, 369537, 369538 };

local PHASE_TEXT = {
	"The ground rumbles as the Guardian of Doomfire collapses to the ground dead.  Then a loud booming voice is heard saying, 'Come little mortals! Feel the chaos of the fires that flame the dark rage. Test yourselves against the might of my armies!'",
	"Four enraged roars of fury echo from further down the bridge over the cacophany of an army waiting to hand out death. The powerful voice is then heard saying, 'Rexanous, Azobian, Hebabbilys, and Javonn! Come destroy these intruders.'",
	"As the last of the army is defeated visions of endless burning flames intrude into your mind.  Suddenly the visions ends as a call comes from just ahead saying, 'Prepare to meet your end at the hands of the Council of Fire!'",
	"A maddened call of endless fury erupts as a burning creature of pure destructions stands tall before you.  The creature then speaks in the loud booming voice of immense power saying, 'You are fools to have come this far. Prepare to tremble at the might of Doomfire!'",
}


local phase = 0;

function ToggleElites(state)
	local elist = eq.get_entity_list();

	for _, id in ipairs(ELITE_SPAWNIDS) do
		if ( state ) then
			elist:GetSpawnByID(id):Enable();
		else
			elist:GetSpawnByID(id):Disable();
		end
	end

end

function SpawnPhase(phase)
	
	if ( not SPAWNS[phase] ) then
		eq.debug("invalid phase "..phase);
		return;
	end
	
	for typ, tab in pairs(SPAWNS[phase]) do
		for _, l in ipairs(tab) do
			eq.spawn2(typ, 0, 0, l[2], l[1], l[3], l[4]*0.7);
		end
	end
	
	eq.zone_emote(0, PHASE_TEXT[phase]);
	
	if ( phase == 4 ) then
		ToggleElites(true);
	end
end

function GuardianCombat(e)
	if ( e.joined ) then
		eq.zone_emote(0, "Guardian of Doomfire lets out an echoing howl of fury and might that reverbrates throughout the scorched landscape as it moves to attack.");
	end
end

function GuardianDeathComplete(e)
	phase = 1;
	SpawnPhase(phase);
	eq.signal(CONTROLLER_TYPE, 1);
end

function ControllerSignal(e)
	if ( e.signal == 1 ) then
		eq.set_timer("fail", 17500000);		-- note: the fail timer is not well understood and may not be accurate for all circumstances
		
	elseif ( e.signal == 2 ) then
		eq.stop_timer("fail");
		phase = 0;
		ToggleElites(false);
	end
end

function ControllerTimer(e)

	if ( e.timer == "fail" ) then
		eq.stop_timer(e.timer);
	
		eq.zone_emote(0, "A booming voice shouts out, 'You do not have the might to match the creatures of Doomfire, come back when you do.'");
		
		for _, typ in ipairs(TRASH_TYPES) do
			eq.depop_all(typ);
		end
		eq.depop_all(FENNIN_TYPE);
		ToggleElites(false);
	end
end

function TrashDeathComplete(e)
	local elist = eq.get_entity_list();
	
	for _, typ in ipairs(TRASH_TYPES) do
		if ( elist:IsMobSpawnedByNpcTypeID(typ) ) then
			return;
		end
	end
	
	phase = phase + 1;
	SpawnPhase(phase);
end

function FenninDeathComplete(e)
	eq.signal(CONTROLLER_TYPE, 2);
	eq.spawn2(PROJECTION_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
	eq.signal(PROJECTION_TYPE, e.killer:GetID()); -- e.killer for death_complete is somebody with kill rights, not death blow
	eq.zone_emote(0, "Loud cries of hopelessness echo throughout the burning lands. The creatures of Doomfire call out to their master, Fennin Ro the Tyrant of Fire, for his dead body now lies at the feet of the mighty adventurers.");
end

function event_encounter_load(e)
	eq.register_npc_event("Fennin", Event.combat, GUARDIAN_TYPE, GuardianCombat);
	eq.register_npc_event("Fennin", Event.death_complete, GUARDIAN_TYPE, GuardianDeathComplete);
	
	eq.register_npc_event("Fennin", Event.signal, CONTROLLER_TYPE, ControllerSignal);
	eq.register_npc_event("Fennin", Event.timer, CONTROLLER_TYPE, ControllerTimer);
	
	eq.register_npc_event("Fennin", Event.death_complete, REAVER_TYPE, TrashDeathComplete);
	eq.register_npc_event("Fennin", Event.death_complete, HEALER_TYPE, TrashDeathComplete);
	eq.register_npc_event("Fennin", Event.death_complete, MAGUS_TYPE, TrashDeathComplete);
	eq.register_npc_event("Fennin", Event.death_complete, DARKFIEND_TYPE, TrashDeathComplete);
	eq.register_npc_event("Fennin", Event.death_complete, CHAOSFIEND_TYPE, TrashDeathComplete);
	eq.register_npc_event("Fennin", Event.death_complete, RAGEFIEND_TYPE, TrashDeathComplete);
	eq.register_npc_event("Fennin", Event.death_complete, AZOBIAN_TYPE, TrashDeathComplete);
	eq.register_npc_event("Fennin", Event.death_complete, JAVONN_TYPE, TrashDeathComplete);
	eq.register_npc_event("Fennin", Event.death_complete, HEBAB_TYPE, TrashDeathComplete);
	eq.register_npc_event("Fennin", Event.death_complete, REAX_TYPE, TrashDeathComplete);
	eq.register_npc_event("Fennin", Event.death_complete, KIRTRA_TYPE, TrashDeathComplete);
	eq.register_npc_event("Fennin", Event.death_complete, TRAXOM_TYPE, TrashDeathComplete);
	eq.register_npc_event("Fennin", Event.death_complete, CRATO_TYPE, TrashDeathComplete);
	eq.register_npc_event("Fennin", Event.death_complete, PROLLAZ_TYPE, TrashDeathComplete);
	
	eq.register_npc_event("Fennin", Event.death_complete, FENNIN_TYPE, FenninDeathComplete);
end
