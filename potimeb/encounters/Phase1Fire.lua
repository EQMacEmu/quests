local INSTANCE_CONTROLLER_TYPE = 223077; -- _
local EVENTS_CONTROLLER_TYPE = 223078; -- _
local FLAME1_TYPE = 223009; -- a_flame_mephit (warrior lvl 64 size 10)
local FLAME2_TYPE = 223010; -- a_flame_mephit (wizard lvl 64 size 10)
local FLAME3_TYPE = 223011; -- a_flame_mephit (boss add)
local INFERNO1_TYPE = 223012; -- an_inferno_mephit (warrior)
local INFERNO2_TYPE = 223013; -- an_inferno_mephit (rogue)
local INFERNO3_TYPE = 223014; -- an_inferno_mephit (shadowknight)
local INFERNO4_TYPE = 223015; -- an_inferno_mephit (wizard)
local INFERNO5_TYPE = 223016; -- an_inferno_mephit (magician)
local INFERNO6_TYPE = 223017; -- an_inferno_mephit (boss add)
local BOSS_TYPE = 223018; -- Kazrok_of_Fire
local MOBS = { FLAME1_TYPE, FLAME2_TYPE, FLAME3_TYPE, INFERNO1_TYPE, INFERNO2_TYPE, INFERNO3_TYPE, INFERNO4_TYPE, INFERNO5_TYPE, INFERNO6_TYPE, BOSS_TYPE };
local SHADOW_NAME = "Shadow_of_Kazrok";

local kills, left, right, middle, bossStatus, addSpawns;

function FireSignal(e)
	if ( e.signal == 151 ) then		-- start trial
		kills = 0;
		addSpawns = 0;
		bossStatus = tonumber(e.data);
		if ( bossStatus == 1 ) then
			eq.spawn2(BOSS_TYPE, 0, 0, 68, 573, 504, 192, SHADOW_NAME);
		else
			eq.spawn2(BOSS_TYPE, 0, 0, 68, 573, 504, 192);
		end
		left = eq.spawn2(FLAME2_TYPE, 0, 0, 46, 542, 496, 192):GetID();
		middle = eq.spawn2(FLAME1_TYPE, 0, 0, 46, 571, 496, 192):GetID();
		right = eq.spawn2(FLAME2_TYPE, 0, 0, 46, 604, 496, 192):GetID();
		
	elseif ( e.signal == 100 ) then		-- depopulate zone
		eq.depop_all(FLAME1_TYPE);
		eq.depop_all(FLAME2_TYPE);
		eq.depop_all(FLAME3_TYPE);
		eq.depop_all(INFERNO1_TYPE);
		eq.depop_all(INFERNO2_TYPE);
		eq.depop_all(INFERNO3_TYPE);
		eq.depop_all(INFERNO4_TYPE);
		eq.depop_all(INFERNO5_TYPE);
		eq.depop_all(INFERNO6_TYPE);
		eq.depop_all(BOSS_TYPE);
	end
end

function DeathComplete(e)
	
	local id = e.self:GetID();
	local x, y;
	local Rng = function() return math.random(-45, 70), math.random(540, 610); end
	
	if ( id == left ) then
		x, y = Rng();
		eq.spawn2(INFERNO5_TYPE, 0, 0, x, y, 496, 0);
		x, y = Rng();
		eq.spawn2(INFERNO1_TYPE, 0, 0, x, y, 496, 0);
		
	elseif ( id == middle ) then
		x, y = Rng();
		eq.spawn2(INFERNO4_TYPE, 0, 0, x, y, 496, 0);
		x, y = Rng();
		eq.spawn2(INFERNO1_TYPE, 0, 0, x, y, 496, 0);	
	
	elseif ( id == right ) then
		x, y = Rng();
		eq.spawn2(INFERNO2_TYPE, 0, 0, x, y, 496, 0);
		x, y = Rng();
		eq.spawn2(INFERNO3_TYPE, 0, 0, x, y, 496, 0);	
	end
	
	kills = kills + 1;
	if ( kills == 9 ) then
		local npc = eq.get_entity_list():GetNPCByNPCTypeID(BOSS_TYPE);
		npc:SetSpecialAbility(24, 0); -- Will Not Aggro off
		npc:SetSpecialAbility(25, 0); -- Immune Aggro off
		npc:SetSpecialAbility(35, 0); -- No Harm from Players off
		npc:SetBodyType(27, false);	-- Summoned2
		npc:CastSpell(3741, npc:GetID()); -- Pyrokinetic Aura
	
	elseif ( kills == 16 ) then
		eq.signal(INSTANCE_CONTROLLER_TYPE, 5, 0, "5");	-- trial success
	end
end

function BossSpawn(e)
	eq.set_next_hp_event(75);
	
	if ( bossStatus == 1 ) then
		e.self:ClearItemList();
	end
end

function SpawnAdds()
	local x, y, z = math.random(-45, 70), math.random(540, 610), 496;
	eq.spawn2(eq.ChooseRandom(FLAME3_TYPE, INFERNO6_TYPE), 0, 0, x, y, z, 0);
	eq.spawn2(eq.ChooseRandom(FLAME3_TYPE, INFERNO6_TYPE), 0, 0, x, y, z, 0);
	addSpawns = addSpawns + 2;
end

function BossHP(e)
	if ( e.hp_event == 75 ) then
		eq.set_next_hp_event(50);
	elseif ( e.hp_event == 50 ) then
		eq.set_next_hp_event(25);
	end
	SpawnAdds();
end

function BossDeathComplete(e)
	-- so GMs killing with large hits don't break the script
	if ( addSpawns == 0 ) then
		SpawnAdds();
		SpawnAdds();
		SpawnAdds();
	elseif ( addSpawns == 2 ) then
		SpawnAdds();
		SpawnAdds();
	elseif ( addSpawns == 4 ) then
		SpawnAdds();
	end
	eq.signal(INSTANCE_CONTROLLER_TYPE, 6, 0, "1;5");
	DeathComplete(e);
end

function TargetChange(e)
	-- if mob aggros on somebody outside the trial, reset
	if ( e.other and e.other.valid and (e.other:GetY() > 750 or e.other:GetX() > 100) ) then
		eq.debug(e.self:GetName().." is aggro on player outside of trial ("..e.other:GetName()..")");
		e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
		e.self:WipeHateList();
		e.self:Heal();
		e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
	end
end

function event_encounter_load(e)
	eq.register_npc_event("Phase1Fire", Event.signal, EVENTS_CONTROLLER_TYPE, FireSignal);
	eq.register_npc_event("Phase1Fire", Event.death, FLAME1_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Fire", Event.death, FLAME2_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Fire", Event.death, FLAME3_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Fire", Event.death, INFERNO1_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Fire", Event.death, INFERNO2_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Fire", Event.death, INFERNO3_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Fire", Event.death, INFERNO4_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Fire", Event.death, INFERNO5_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Fire", Event.death, INFERNO6_TYPE, DeathComplete);
	eq.register_npc_event("Phase1Fire", Event.spawn, BOSS_TYPE, BossSpawn);
	eq.register_npc_event("Phase1Fire", Event.hp, BOSS_TYPE, BossHP);
	eq.register_npc_event("Phase1Fire", Event.death, BOSS_TYPE, BossDeathComplete);
	for _, id in ipairs(MOBS) do
		eq.register_npc_event("Phase1Fire", Event.target_change, id, TargetChange);
	end
end
