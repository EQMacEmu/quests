local WAVE_TIMER = 137000; -- oldEQ/AK timer was ~2:15-2:20.  Live is ~1:37

local CONTROLLER_TYPE = 201511; -- #Event_Execution_Control 
local TRIBUNAL_TYPE = 201508; -- The_Tribunal
local EXECUTIONER_TYPE = 201501; -- an_executioner
local PRISONER_TYPE = 201500; -- a_sentenced_prisoner

local DARK_NEMESIS_TYPE = 201457; -- a_dark_nemesis
local FIERCE_NEMESIS_TYPE = 201458; -- a_fierce_nemesis
local PRIEST_TYPE = 201484; -- #priest_of_doom
local HERALD_TYPE = 201478; -- #herald_of_destruction
local BOSS_TYPE = 201485; -- #Prime_Executioner_Vathoch
local MOBS = { DARK_NEMESIS_TYPE, FIERCE_NEMESIS_TYPE, PRIEST_TYPE, HERALD_TYPE, BOSS_TYPE };

local WAVE_SPAWN_COORDS = {
	{
		{ x = 229, y = -1070 },
		{ x = 228, y = -1088 },
		{ x = 174, y = -1070 },
		{ x = 175, y = -1089 },
	},
	{
		{ x = 216, y = -1091 },
		{ x = 215, y = -1111 },
		{ x = 161, y = -1089 },
		{ x = 160, y = -1111 },
	},
	{
		{ x = 216, y = -1070 },
		{ x = 228, y = -1112 },
		{ x = 175, y = -1110 },
		{ x = 161, y = -1070 },
	}
};

local controller, executioner, prisoner, killed;

function ControllerSpawn(e)
	eq.set_timer("wave", 26000);
	prisoner = eq.spawn2(PRISONER_TYPE, 0, 0, 171, -1167, 81.6, 0);
	controller = e.self;
	wave = 0;
end

function ControllerTimer(e)

	if ( e.timer == "wave" ) then
		wave = wave + 1;
		killed = 0;
		
		if ( wave == 4 ) then
			eq.stop_timer("wave");
		else
			eq.set_timer("wave", WAVE_TIMER);
		end
		eq.set_timer("executioner", 60000);
		SpawnWave();

	elseif ( e.timer == "executioner" ) then
		eq.stop_timer("executioner");
		if ( executioner and prisoner ) then
			executioner:Say("Very well.");
			executioner:CastSpell(982, prisoner:GetID());
		end
		
	elseif ( e.timer == "prisoner" ) then
		eq.stop_timer("prisoner");
		if ( prisoner ) then
			prisoner:Emote("bows his head and says nothing.");
		end
		
	elseif ( e.timer == "fail" ) then
		eq.stop_timer("fail");
		TrialFail();
	end
end

function SpawnWave()
	local t, roll, mob;
	local waveType = math.random(1, 3);

	for _, coords in ipairs(WAVE_SPAWN_COORDS[waveType]) do
	
		roll = math.random(0, 99);
		
		if ( roll < 32 ) then
			t = DARK_NEMESIS_TYPE;
		elseif ( roll < 94 ) then
			t = FIERCE_NEMESIS_TYPE;
		elseif ( roll < 97 ) then
			t = PRIEST_TYPE;
		else
			t = HERALD_TYPE;
		end
		mob = eq.spawn2(t, 0, 0, coords.x, coords.y, 75, 128);
	end
	--[[
		grid: 	265, -1051, 75
				193, -1047, 75
				194, -1154, 82
				169.5, -1157, 82
	]]
	if ( not executioner ) then
		executioner = eq.spawn2(EXECUTIONER_TYPE, 42, 0, 265, -1051, 75, 192);
	end
	eq.set_timer("executioner", 40000, controller);
end

function MobDeath(e)
	if ( not controller ) then
		return;
	end
	
	killed = killed + 1;
	
	if ( killed < 4 ) then
		eq.set_timer("executioner", 34000, controller); -- AK logs show time from mob kill to prisoner death 34 or 35 seconds
		eq.stop_timer("prisoner", controller);
		if ( executioner ) then
			executioner:GMMove(196, -1058, 75);
			executioner:CastToNPC():UpdateWaypoint(1);
			executioner:CastToNPC():SetWaypointPause();
		end
	else
		if ( executioner ) then
			executioner:Depop();
			executioner = nil;
		end
		eq.stop_timer("executioner", controller);
		if ( wave == 4 ) then
			eq.depop_all(PRISONER_TYPE);
			prisoner = nil;
			eq.spawn2(BOSS_TYPE, 0, 0, 195, -1157, 82, 0);
		end
	end
end

function WaypointArrive(e)
	if ( e.wp == 3 ) then
		-- in AK logs, this emote is done 16-18 seconds after a kill
		e.self:Emote("intones, 'Do you have any final words before your sentence is carried out?'");
		eq.set_timer("prisoner", 3500, controller);
	end
end

function BossDeath(e)
	eq.signal(TRIBUNAL_TYPE, 8);
	eq.depop_all(CONTROLLER_TYPE);
	controller = nil;
end

function PrisonerDeath(e)
	eq.set_timer("fail", 2500, controller); -- delay depops so NPCs can animate
	eq.get_entity_list():MessageClose(e.self, true, 200, 0, "The prisoners cry is cut off as his body crumples to the ground.  You have failed.");
end

function TrialFail()
	eq.signal(TRIBUNAL_TYPE, 2);
	eq.depop_all(PRISONER_TYPE);
	prisoner = nil;
	eq.depop_all(EXECUTIONER_TYPE);
	executioner = nil;
	eq.depop_all(CONTROLLER_TYPE);
	controller = nil;
end

function MobSpawn(e)
	eq.set_timer("depop", 60000);
end

function MobTimer(e)
	if ( wave > 0 ) then
		TrialFail();
	end
	wave = 0;
	eq.depop();
end

function MobCombat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function event_encounter_load(e)
	eq.register_npc_event("ExecutionTrial", Event.spawn, CONTROLLER_TYPE, ControllerSpawn);
	eq.register_npc_event("ExecutionTrial", Event.timer, CONTROLLER_TYPE, ControllerTimer);
	
	eq.register_npc_event("ExecutionTrial", Event.waypoint_arrive, EXECUTIONER_TYPE, WaypointArrive);
	
	eq.register_npc_event("ExecutionTrial", Event.death, BOSS_TYPE, BossDeath);
	
	eq.register_npc_event("ExecutionTrial", Event.death_complete, PRISONER_TYPE, PrisonerDeath);

	for _, id in ipairs(MOBS) do
		eq.register_npc_event("ExecutionTrial", Event.spawn, id, MobSpawn);
		eq.register_npc_event("ExecutionTrial", Event.timer, id, MobTimer);
		eq.register_npc_event("ExecutionTrial", Event.combat, id, MobCombat);
		if ( id ~= BOSS_TYPE ) then
			eq.register_npc_event("ExecutionTrial", Event.death, id, MobDeath);
		end
	end
end
