local INSTANCE_CONTROLLER_TYPE = 223077;	-- _
local EVENTS_CONTROLLER_TYPE = 223078;		-- _
local WAVE1_TYPE = 223019;   -- an_undead_guardian (wave 1 lvl 64)
local WAVE2_1_TYPE = 223020; -- an_undead_guardian (wave 2 warrior lvl 65)
local WAVE2_2_TYPE = 223021; -- an_undead_guardian (wave 2 rogue lvl 65)
local WAVE2_3_TYPE = 223022; -- an_undead_guardian (wave 2 necro lvl 65)
local WAVE2_4_TYPE = 223023; -- an_undead_guardian (wave 2 wizard lvl 65)
local WAVE3_1_TYPE = 223024; -- an_undead_guardian (wave 3 warrior lvl 66)
local WAVE3_2_TYPE = 223025; -- an_undead_guardian (wave 3 monk lvl 66)
local WAVE3_3_TYPE = 223026; -- an_undead_guardian (wave 3 necro lvl 66)
local WAVE3_4_TYPE = 223027; -- an_undead_guardian (wave 3 wizard lvl 66)
local PROTECTOR_TYPE = 223028; -- an_undead_protector (boss wave lvl 66)
local BOSS_TYPE = 223029; -- Rythor_of_the_Undead
local MOBS = { WAVE1_TYPE, WAVE2_1_TYPE, WAVE2_2_TYPE, WAVE2_3_TYPE, WAVE2_4_TYPE, WAVE3_1_TYPE, WAVE3_2_TYPE, WAVE3_3_TYPE, WAVE3_4_TYPE, PROTECTOR_TYPE, BOSS_TYPE };
local SHADOW_NAME = "Shadow_of_Rythor";

local kills, bossStatus;

function UndeadSignal(e)
	if ( e.signal == 131 ) then		-- start trial
		kills = 0;
		bossStatus = tonumber(e.data);
		if ( bossStatus == 1 ) then
			eq.spawn2(BOSS_TYPE, 0, 0, 68, 1109, 500, 192, SHADOW_NAME);
		else
			eq.spawn2(BOSS_TYPE, 0, 0, 68, 1109, 500, 192);
		end
		eq.spawn2(WAVE1_TYPE, 0, 0, 44, 1082, 495, 192);
		eq.spawn2(WAVE1_TYPE, 0, 0, 44, 1109, 495, 192);
		eq.spawn2(WAVE1_TYPE, 0, 0, 44, 1135, 495, 192);
		
	elseif ( e.signal == 100 ) then		-- depopulate zone
		eq.depop_all(WAVE1_TYPE);
		eq.depop_all(WAVE2_1_TYPE);
		eq.depop_all(WAVE2_2_TYPE);
		eq.depop_all(WAVE2_3_TYPE);
		eq.depop_all(WAVE2_4_TYPE);
		eq.depop_all(WAVE3_1_TYPE);
		eq.depop_all(WAVE3_2_TYPE);
		eq.depop_all(WAVE3_3_TYPE);
		eq.depop_all(WAVE3_4_TYPE);
		eq.depop_all(PROTECTOR_TYPE);
		eq.depop_all(BOSS_TYPE);
	end
end

function DeathComplete(e)
	kills = kills + 1;
	if ( kills == 3 ) then
		eq.spawn2(PROTECTOR_TYPE, 0, 0, 66, 1082, 500, 192);
		eq.spawn2(eq.ChooseRandom(WAVE2_1_TYPE, WAVE2_2_TYPE, WAVE2_3_TYPE, WAVE2_4_TYPE), 0, 0, 7, 1089, 495, 0);
		eq.spawn2(eq.ChooseRandom(WAVE2_1_TYPE, WAVE2_2_TYPE, WAVE2_3_TYPE, WAVE2_4_TYPE), 0, 0, 23, 1089, 495, 0);
		eq.spawn2(eq.ChooseRandom(WAVE2_1_TYPE, WAVE2_2_TYPE, WAVE2_3_TYPE, WAVE2_4_TYPE), 0, 0, 27, 1140, 495, 128);
		eq.spawn2(eq.ChooseRandom(WAVE2_1_TYPE, WAVE2_2_TYPE, WAVE2_3_TYPE, WAVE2_4_TYPE), 0, 0, 17, 1140, 495, 128);
	
	elseif ( kills == 7 ) then
		eq.spawn2(PROTECTOR_TYPE, 0, 0, 66, 1137, 499.6, 192);
		eq.spawn2(eq.ChooseRandom(WAVE3_1_TYPE, WAVE3_2_TYPE, WAVE3_3_TYPE, WAVE3_4_TYPE), 0, 0, 22, 1121, 495, 128);
		eq.spawn2(eq.ChooseRandom(WAVE3_1_TYPE, WAVE3_2_TYPE, WAVE3_3_TYPE, WAVE3_4_TYPE), 0, 0, 22, 1091, 495, 0);
		eq.spawn2(eq.ChooseRandom(WAVE3_1_TYPE, WAVE3_2_TYPE, WAVE3_3_TYPE, WAVE3_4_TYPE), 0, 0, -25, 1091, 495, 0);
		eq.spawn2(eq.ChooseRandom(WAVE3_1_TYPE, WAVE3_2_TYPE, WAVE3_3_TYPE, WAVE3_4_TYPE), 0, 0, -25, 1124, 495, 128);
	
	elseif ( kills == 11 ) then
		local npcList = eq.get_entity_list():GetNPCList();
		for npc in npcList.entries do
		
			if ( npc.valid and (npc:GetNPCTypeID() == PROTECTOR_TYPE or npc:GetNPCTypeID() == BOSS_TYPE) ) then
				npc:SetSpecialAbility(24, 0); -- Will Not Aggro off
				npc:SetSpecialAbility(25, 0); -- Immune Aggro off
				npc:SetSpecialAbility(35, 0); -- No Harm from Players off
				npc:SetBodyType(3, false);	-- Undead
			end
		end
	
	elseif ( kills == 14 ) then
		eq.signal(INSTANCE_CONTROLLER_TYPE, 5, 0, "3");	-- trial success
	end
end

function BossSpawn(e)
	if ( bossStatus == 1 ) then
		e.self:ClearItemList();
	end
end

function BossDeathComplete(e)
	eq.signal(INSTANCE_CONTROLLER_TYPE, 6, 0, "1;3");
	DeathComplete(e);
end

function TargetChange(e)
	-- if mob aggros on somebody outside the trial, reset
	if ( e.other and e.other.valid and (e.other:GetY() > 1250 or e.other:GetY() < 1000 or e.other:GetX() > 100) ) then
		eq.debug(e.self:GetName().." is aggro on player outside of trial ("..e.other:GetName()..")");
		e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
		e.self:WipeHateList();
		e.self:Heal();
		e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
	end
end

function event_encounter_load(e)
	eq.register_npc_event("Phase1Undead", Event.signal, EVENTS_CONTROLLER_TYPE, UndeadSignal);
	eq.register_npc_event("Phase1Undead", Event.death_complete, WAVE1_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Undead", Event.death_complete, WAVE2_1_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Undead", Event.death_complete, WAVE2_2_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Undead", Event.death_complete, WAVE2_3_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Undead", Event.death_complete, WAVE2_4_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Undead", Event.death_complete, WAVE3_1_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Undead", Event.death_complete, WAVE3_2_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Undead", Event.death_complete, WAVE3_3_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Undead", Event.death_complete, WAVE3_4_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Undead", Event.death_complete, PROTECTOR_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Undead", Event.spawn, BOSS_TYPE, BossSpawn);
	eq.register_npc_event("Phase1Undead", Event.death_complete, BOSS_TYPE, BossDeathComplete);
	for _, id in ipairs(MOBS) do
		eq.register_npc_event("Phase1Undead", Event.target_change, id, TargetChange);
	end
end
