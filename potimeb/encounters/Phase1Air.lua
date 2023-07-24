local INSTANCE_CONTROLLER_TYPE = 223077; -- _
local EVENTS_CONTROLLER_TYPE = 223078; -- _
local NOBLE1_TYPE = 223038; -- An_Air_Phoenix_Noble (warrior)
local NOBLE2_TYPE = 223039; -- An_Air_Phoenix_Noble (rogue)
local NOBLE3_TYPE = 223040; -- An_Air_Phoenix_Noble (wizard)
local SERVITOR1_TYPE = 223041; -- Servitor_of_Xegony (warrior)
local SERVITOR2_TYPE = 223042; -- Servitor_of_Xegony (rogue)
local SERVITOR3_TYPE = 223043; -- Servitor_of_Xegony (wizard)
local BOSS_TYPE = 223044; -- Neimon_of_Air
local MOBS = { NOBLE1_TYPE, NOBLE2_TYPE, NOBLE3_TYPE, SERVITOR1_TYPE, SERVITOR2_TYPE, SERVITOR3_TYPE, BOSS_TYPE };
local SHADOW_NAME = "Shadow_of_Neimon";

local SERV_LOCS = {
	{ 60, 1312, 493.753, 192, SERVITOR3_TYPE },
	{ 60, 1339, 494.492, 192, SERVITOR2_TYPE },
	{ 60, 1378, 493.968, 192, SERVITOR2_TYPE },
	{ 60, 1395, 493.753, 192, SERVITOR1_TYPE },
};

local kills, bossStatus;

function AirSignal(e)
	if ( e.signal == 121 ) then		-- start trial
		kills = 0;
		bossStatus = tonumber(e.data);
		eq.spawn2(eq.ChooseRandom(NOBLE1_TYPE, NOBLE2_TYPE, NOBLE3_TYPE), 0, 0, -10, 1336, 494.464, 223);
		eq.spawn2(eq.ChooseRandom(NOBLE1_TYPE, NOBLE2_TYPE, NOBLE3_TYPE), 0, 0, -10, 1373, 494.06, 160);
		eq.spawn2(eq.ChooseRandom(NOBLE1_TYPE, NOBLE2_TYPE, NOBLE3_TYPE), 0, 0, -58, 1336, 494.695, 32);
		eq.spawn2(eq.ChooseRandom(NOBLE1_TYPE, NOBLE2_TYPE, NOBLE3_TYPE), 0, 0, -58, 1373, 494.243, 96);
		
	elseif ( e.signal == 100 ) then		-- depopulate zone
		eq.depop_all(NOBLE1_TYPE);
		eq.depop_all(NOBLE2_TYPE);
		eq.depop_all(NOBLE3_TYPE);
		eq.depop_all(SERVITOR1_TYPE);
		eq.depop_all(SERVITOR2_TYPE);
		eq.depop_all(SERVITOR3_TYPE);
		eq.depop_all(BOSS_TYPE);
	end
end

function NobleDeathComplete(e)
	kills = kills + 1;
	local l = SERV_LOCS[kills];
	eq.spawn2(l[5], 0, 0, l[1], l[2], l[3], l[4]);
	
	if ( kills == 4 ) then
	
		local npcList = eq.get_entity_list():GetNPCList();
		for npc in npcList.entries do
		
			if ( npc.valid and (npc:GetNPCTypeID() == SERVITOR1_TYPE or npc:GetNPCTypeID() == SERVITOR2_TYPE or npc:GetNPCTypeID() == SERVITOR3_TYPE) ) then
				npc:SetSpecialAbility(24, 0); -- Will Not Aggro off
				npc:SetSpecialAbility(25, 0); -- Immune Aggro off
				npc:SetSpecialAbility(35, 0); -- No Harm from Players off
				npc:SetBodyType(23, false);	-- Monster
			end
		end
		
		if ( bossStatus == 1 ) then
			eq.spawn2(BOSS_TYPE, 0, 0, 68, 1355, 504, 192, SHADOW_NAME);
		else
			eq.spawn2(BOSS_TYPE, 0, 0, 68, 1355, 504, 192);
		end
	end
end

function ServitorDeathComplete(e)
	kills = kills + 1;
	if ( kills == 9 ) then
		eq.signal(INSTANCE_CONTROLLER_TYPE, 5, 0, "2");	-- trial success
	end
end

function BossSpawn(e)
	if ( bossStatus == 1 ) then
		e.self:ClearItemList();
	end
	eq.set_timer("buff", 100);	-- CastSpell() refuses to work on spawn, because our code is awesome
end

function BossTimer(e)
	eq.stop_timer(e.timer);
	-- CastSpell() is refusing to work using e.self here for some ridiculous reason
	local npc = eq.get_entity_list():GetNPCByNPCTypeID(BOSS_TYPE);
	npc:CastSpell(3745, npc:GetID()); -- Caustic Aura
end

function BossDeathComplete(e)
	eq.signal(INSTANCE_CONTROLLER_TYPE, 6, 0, "1;2");
	ServitorDeathComplete(e);
end

function TargetChange(e)
	-- if mob aggros on somebody outside the trial, reset
	if ( e.other and e.other.valid and (e.other:GetY() > 1500 or e.other:GetY() < 1250 or e.other:GetX() > 100) ) then
		eq.debug(e.self:GetName().." is aggro on player outside of trial ("..e.other:GetName()..")");
		e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
		e.self:WipeHateList();
		e.self:Heal();
		e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
	end
end

function event_encounter_load(e)
	eq.register_npc_event("Phase1Air", Event.signal, EVENTS_CONTROLLER_TYPE, AirSignal);
	eq.register_npc_event("Phase1Air", Event.death_complete, NOBLE1_TYPE, NobleDeathComplete);
	eq.register_npc_event("Phase1Air", Event.death_complete, NOBLE2_TYPE, NobleDeathComplete);
	eq.register_npc_event("Phase1Air", Event.death_complete, NOBLE3_TYPE, NobleDeathComplete);
	eq.register_npc_event("Phase1Air", Event.death_complete, SERVITOR1_TYPE, ServitorDeathComplete);
	eq.register_npc_event("Phase1Air", Event.death_complete, SERVITOR2_TYPE, ServitorDeathComplete);
	eq.register_npc_event("Phase1Air", Event.death_complete, SERVITOR3_TYPE, ServitorDeathComplete);
	eq.register_npc_event("Phase1Air", Event.spawn, BOSS_TYPE, BossSpawn);
	eq.register_npc_event("Phase1Air", Event.timer, BOSS_TYPE, BossTimer);
	eq.register_npc_event("Phase1Air", Event.death_complete, BOSS_TYPE, BossDeathComplete);
	for _, id in ipairs(MOBS) do
		eq.register_npc_event("Phase1Air", Event.target_change, id, TargetChange);
	end
end
