local WAVE_TIMER = 118000; -- oldEQ/AK timer was ~118-119 seconds.  Live is ~88 seconds

local CONTROLLER_TYPE = 201515; -- #Event_Hanging_Control
local TRIBUNAL_TYPE = 201508; -- The_Tribunal
local PRISONER1_TYPE = 201497; -- a_sentenced_prisoner (aviak)
local PRISONER2_TYPE = 201498; -- a_sentenced_prisoner (wood elf)
local PRISONER3_TYPE = 201499; -- a_sentenced_prisoner (barbarian)

local BREATHLESS_TYPE = 201449; -- a_breathless_void
local STIFLING_TYPE = 201471; -- a_stifling_nemesis
local SPIRIT1_TYPE = 201489; -- spirit_of_suffocation (enchanter)
local SPIRIT2_TYPE = 201490; -- spirit_of_suffocation (necromancer)
local SPIRIT3_TYPE = 201491; -- spirit_of_suffocation (magician)
local SMOTHERING_TYPE = 201470; -- #a_smothering_nemesis 
local PHANTOM_TYPE = 201483; -- #phantom_of_asphyxiation
local BOSS_TYPE = 201477; -- #Gallows_Master_Teion
local MOBS = { BREATHLESS_TYPE, STIFLING_TYPE, SPIRIT1_TYPE, SPIRIT2_TYPE, SPIRIT3_TYPE, SMOTHERING_TYPE, PHANTOM_TYPE, BOSS_TYPE };

local WAVE_SPAWN_COORDS = {
	{ x = 520, y = -1071 },
	{ x = 461, y = -1072 }
};
local SPIRIT_SPAWN_COORDS = {
	{ x = 440, y = -1134 },
	{ x = 489, y = -1136 },
	{ x = 541, y = -1139 }
};
local wave, killed;

local prisoners = {
	[1] = { type = PRISONER1_TYPE,
		emote1 = "The prisoner begins to choke as an invisible noose tightens around its neck.",
		emote2 = "The prisoner clutches at its throat, trying desperately to breathe.",
		emote3 = "The prisoner falls to the ground, legs kicking and fingers clawing at its throat.",
		emote4 = "The prisoner gives one final twitch and suddenly becomes still, its limbs no longer flailing.  You have failed.",
	},
	[2] = { type = PRISONER2_TYPE,
		emote1 = "The prisoner begins to choke as an invisible noose tightens around her neck.",
		emote2 = "The prisoner clutches at her throat, trying desperately to breathe.",
		emote3 = "The prisoner falls to the ground, legs kicking and fingers clawing at her throat.",
		emote4 = "The prisoner gives one final twitch and suddenly becomes still, her limbs no longer flailing.  You have failed.",
	},
	[3] = { type = PRISONER3_TYPE,
		emote1 = "The prisoner begins to choke as an invisible noose tightens around his neck.",
		emote2 = "The prisoner clutches at his throat, trying desperately to breathe.",
		emote3 = "The prisoner falls to the ground, legs kicking and fingers clawing at his throat.",
		emote4 = "The prisoner gives one final twitch and suddenly becomes still, his limbs no longer flailing.  You have failed.",
	},
};


function ControllerSpawn(e)
	eq.set_timer("wave", 26000);
	wave = 0;
	killed = 0;
	for i = 1, 3 do
		prisoners[i].spiritId = nil;
		prisoners[i].timer = nil;
	end
end

function ControllerTimer(e)

	if ( e.timer == "wave" ) then
		wave = wave + 1;

		if ( wave == 4 ) then
			eq.stop_timer("wave");
		else
			eq.set_timer("wave", WAVE_TIMER);
			
			if ( wave == 1 ) then
				eq.spawn2(PRISONER1_TYPE, 0, 0, 440, -1175, 80.751, 0);
				eq.spawn2(PRISONER2_TYPE, 0, 0, 489, -1175, 80.126, 0);
				eq.spawn2(PRISONER3_TYPE, 0, 0, 540, -1175, 81.376, 0);
			end
		end
		SpawnWave();
		SpawnSpirit();
		eq.set_timer("spirit", 47000);
		
	elseif ( e.timer == "spirit" ) then
		eq.stop_timer("spirit");
		SpawnSpirit();
	end
end

function SpawnWave()
	local t, roll, mob, coords;
	local count = 1;
	
	for i = 1, 2 do
		coords = WAVE_SPAWN_COORDS[i];
		
		roll = math.random(1, 100);
		if ( roll > 97 and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(SMOTHERING_TYPE) ) then
			t = SMOTHERING_TYPE;
		elseif ( roll > 48 ) then
			t = STIFLING_TYPE;
		else
			t = BREATHLESS_TYPE;
		end
		
		eq.spawn2(t, 0, 0, coords.x, coords.y, 73, 128);
	end
end

function SpawnSpirit()
	local spawned, mob, prisoner, spritType;
	local giveup = 1;
	local roll = math.random(1, 100);
	if ( roll > 97 and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(PHANTOM_TYPE) ) then
		spritType = PHANTOM_TYPE;
	elseif ( roll > 64 ) then
		spritType = SPIRIT1_TYPE;
	elseif ( roll > 32 ) then
		spritType = SPIRIT2_TYPE;
	else
		spritType = SPIRIT3_TYPE;
	end
	
	while ( not spawned and giveup < 100 ) do
		
		roll = math.random(1, 3);
		if ( not prisoners[roll].spiritId ) then
		
			mob = eq.spawn2(spritType, 0, 0, SPIRIT_SPAWN_COORDS[roll].x, SPIRIT_SPAWN_COORDS[roll].y, 73, 128);
			
			prisoners[roll].spiritId = mob:GetID();
			prisoners[roll].timer = 1;
			
			prisoner = eq.get_entity_list():GetMobByNpcTypeID(prisoners[roll].type);
			if ( prisoner and prisoner.valid ) then
				eq.get_entity_list():MessageClose(prisoner, true, 200, 0, prisoners[roll].emote1);
				prisoner:SetHeading(128);
				eq.set_timer("noose", 17000, prisoner);
			end
			spawned = true;
		end
		giveup = giveup + 1;
	end
end

function PrisonerTimer(e)
	if ( e.timer == "noose" ) then
	
		local myType = e.self:GetNPCTypeID();
		
		for i = 1, 3 do		
			if ( prisoners[i].type == myType ) then

				if ( prisoners[i].timer == 1 ) then
					eq.get_entity_list():MessageClose(e.self, true, 200, 0, prisoners[i].emote2);
					
				elseif ( prisoners[i].timer == 2 ) then
					eq.get_entity_list():MessageClose(e.self, true, 200, 0, prisoners[i].emote3);
					e.self:SetAppearance(3); -- lie down
					
				elseif ( prisoners[i].timer == 3 ) then
					eq.get_entity_list():MessageClose(e.self, true, 200, 0, prisoners[i].emote4);
					TrialFail();
				end
				prisoners[i].timer = prisoners[i].timer + 1;
				return;
			end
		end
	end
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

function MobDeath(e)
	local myType = e.self:GetNPCTypeID();
	killed = killed + 1;

	if ( myType == SPIRIT1_TYPE or myType == SPIRIT2_TYPE or myType == SPIRIT3_TYPE or myType == PHANTOM_TYPE ) then
		local prisoner;
		for i = 1, 3 do		
			if ( prisoners[i].spiritId == e.self:GetID() ) then
				prisoners[i].spiritId = nil;
				prisoner = eq.get_entity_list():GetMobByNpcTypeID(prisoners[i].type);
				if ( prisoner and prisoner.valid ) then
					prisoner:Emote("gasps, taking in large breaths and coughing as the invisible noose disappears.");
					prisoner:SetAppearance(0); -- stand
					prisoner:SetHeading(0);
					eq.stop_timer("noose", prisoner);
				end
				break;
			end
		end
	end
	
	if ( wave == 4 and killed >= 16 ) then
		eq.unique_spawn(BOSS_TYPE, 0, 0, 490, -1052, 76.251, 128);
	end
end

function BossDeath(e)
	eq.signal(TRIBUNAL_TYPE, 11);

	eq.depop_all(CONTROLLER_TYPE);
	eq.depop_all(PRISONER1_TYPE);
	eq.depop_all(PRISONER2_TYPE);
	eq.depop_all(PRISONER3_TYPE);
	wave = 0;
end

function TrialFail()
	eq.signal(TRIBUNAL_TYPE, 5);
	
	eq.depop_all(CONTROLLER_TYPE);
	eq.depop_all(PRISONER1_TYPE);
	eq.depop_all(PRISONER2_TYPE);
	eq.depop_all(PRISONER3_TYPE);
	wave = 0;
end

function event_encounter_load(e)
	eq.register_npc_event("HangingTrial", Event.spawn, CONTROLLER_TYPE, ControllerSpawn);
	eq.register_npc_event("HangingTrial", Event.timer, CONTROLLER_TYPE, ControllerTimer);
	
	eq.register_npc_event("HangingTrial", Event.timer, PRISONER1_TYPE, PrisonerTimer);
	eq.register_npc_event("HangingTrial", Event.timer, PRISONER2_TYPE, PrisonerTimer);
	eq.register_npc_event("HangingTrial", Event.timer, PRISONER3_TYPE, PrisonerTimer);

	eq.register_npc_event("HangingTrial", Event.death, BOSS_TYPE, BossDeath);

	for _, id in ipairs(MOBS) do
		eq.register_npc_event("HangingTrial", Event.spawn, id, MobSpawn);
		eq.register_npc_event("HangingTrial", Event.timer, id, MobTimer);
		eq.register_npc_event("HangingTrial", Event.combat, id, MobCombat);
		if ( id ~= BOSS_TYPE ) then
			eq.register_npc_event("HangingTrial", Event.death, id, MobDeath);
		end
	end
end
