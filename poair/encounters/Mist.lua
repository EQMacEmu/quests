local CONTROLLER_TYPE = 215423; -- POAPhoenixController
local WIND_TYPE = 215026; -- A_Wind_Phoenix
local WIZ_WIND_TYPE = 215450; -- A_Wind_Phoenix (wizard)
local ARDENT_TYPE = 215430; -- Ardent_Phoenix_of_Xegony
local SERVITOR_TYPE = 215027; -- Servitor_of_Xegony
local BREEZEWING_TYPE = 215058; -- A_Phoenix_Breezewing
local SEAREDWING_TYPE = 215028; -- A_Phoenix_Searedwing
local CALEBGROTHIEL_TYPE = 215324; -- #Calebgrothiel
local FIRESURGER_TYPE = 215397; -- A_Phoenix_Firesurger
local WINDSURGER_TYPE = 215398; -- A_Phoenix_Windsurger
local BOSS_TYPE = 215399; -- Melernil_Faal`Armanna
local PH_TYPE = 215429; -- A_Firewing_Imitor
local AVATAR_TYPE = 215393; -- #Avatar_of_Mist
local GUY_TYPE = 215416; -- phoenix_guy 

local ISLAND_SPAWNIDS = { 367294, 366886, 366641, 367348, 365682, 365962, 367065, 366509, 365361, 366345,
						365270, 366581, 365877, 366313, 366599, 366899, 367373, 367438, 367538 };
local SURGER_LOCS = {
	{ 369, -741, 438, 215 },
	{ 348, -678, 438, 149 },
	{ 302, -762, 440, 19 },
	{ 284, -696, 440, 82 },
};

local TIMER = "phoenix_repop";

local eventActive = false;

function RepopIsland()
	local elist = eq.get_entity_list();

	for _, id in ipairs(ISLAND_SPAWNIDS) do
		elist:GetSpawnByID(id):Repop();
	end
end

function CheckIsland()
	local elist = eq.get_entity_list();

	for _, id in ipairs(ISLAND_SPAWNIDS) do
		if ( elist:GetSpawnByID(id):GetNPC().valid ) then
			eq.set_timer(TIMER, 1080000); -- 18 mins
			return false;
		end
	end
	
	eq.set_timer(TIMER, 10800000); -- 3 hours
	return true;
end

function ControllerSpawn(e)
	eq.set_timer(TIMER, 1083000);
end

function ControllerTimer(e)
	if ( e.timer == TIMER ) then
		
		if ( eventActive ) then
			eq.depop_all(FIRESURGER_TYPE);
			eq.depop_all(WINDSURGER_TYPE);
			eq.depop_all(BOSS_TYPE);
			eq.depop_all(PH_TYPE);
			eventActive = false;
			eq.set_timer(TIMER, 1080000); -- 18 mins
		end
		
		RepopIsland(ISLAND_SPAWNIDS);
	end
end

function ControllerSignal(e)
	if ( e.signal == 1 ) then
		if ( eventActive ) then
			return;
		end
		
		if ( CheckIsland() ) then -- true if island spawns are all dead
		
			eventActive = true;
			
			local mob, t;
			for i, locs in ipairs(SURGER_LOCS) do
				mob = eq.spawn2(FIRESURGER_TYPE, 0, 0, locs[1], locs[2], locs[3], locs[4]);
			end
		end
		
	elseif ( e.signal == 2 ) then
	
		local elist = eq.get_entity_list();
		if ( not elist:IsMobSpawnedByNpcTypeID(FIRESURGER_TYPE) and not elist:IsMobSpawnedByNpcTypeID(WINDSURGER_TYPE) ) then
			local mob, t;
			for i, locs in ipairs(SURGER_LOCS) do
				mob = eq.spawn2(WINDSURGER_TYPE, 0, 0, locs[1], locs[2], locs[3], locs[4]);
			end
		end
	
	elseif ( e.signal == 3 ) then
		local elist = eq.get_entity_list();
		
		if ( not elist:IsMobSpawnedByNpcTypeID(WINDSURGER_TYPE) ) then
			
			if ( elist:IsMobSpawnedByNpcTypeID(GUY_TYPE) ) then
				mob = eq.unique_spawn(BOSS_TYPE, 0, 0, 326, -718, 441, 128);
			else
				eq.unique_spawn(PH_TYPE, 0, 0, 326, -718, 441, 128);
			end
		end
	end
end

function IslandDeath(e)
	eq.signal(CONTROLLER_TYPE, 1);
end

function WizWindDeath(e)
	-- Two Ardents will spawn if this wizard wind phoenix spawn is killed.  It's weird
	eq.spawn2(ARDENT_TYPE, 0, 0, 592, -655, 440.817, 32);
	eq.spawn2(ARDENT_TYPE, 0, 0, 618, -667, 442.988, 0);
end

function FiresurgerDeath(e)
	eq.signal(CONTROLLER_TYPE, 2);
end

function WindsurgerDeath(e)
	eq.signal(CONTROLLER_TYPE, 3);
end

function BossDeathComplete(e)
	eq.unique_spawn(AVATAR_TYPE, 0, 0, -1573, -570, 356.125, 192);
	eq.depop_with_timer(GUY_TYPE);
end

function AvatarSpawn(e)
	e.self:Shout("Leave now foolish mortal you have begun to send events in motion that you cannot possibly understand!");
	eq.set_timer("depop", 2700000);
end

function AvatarCombat(e)
	if ( e.joined ) then
		eq.set_timer("drophate", 1000);
		eq.pause_timer("depop");
	else
		eq.stop_timer("drophate");
		eq.resume_timer("depop");
		
		-- this is to mimic certain behavior Sony's servers had/has.  NPCs aggroed a long time sometimes warp home or
		-- some distance away in the direction of home and heal somewhat when they hate list wipe.  The exact logic to this
		-- behavior is unknown.  Bosses with the tank hate list drop mechanic need this in order to not trivialize the
		-- encounter using mem blur.  This is a crude solution that works well enough
		local ratio = e.self:GetHPRatio();
		if ( ratio < 50 or math.random(100) > ratio ) then
			e.self:GMMove(e.self:GetGuardPointX(), e.self:GetGuardPointY(), e.self:GetGuardPointZ(), e.self:GetSpawnPointH());
			e.self:SetHP(e.self:GetHP() + math.floor(e.self:GetMaxHP() * 0.3));
		end
	end
end

function AvatarTimer(e)
	if ( e.timer == "drophate") then
	
		if ( math.random() < 0.016666 ) then -- averages to once per 60 seconds
			local target = e.self:GetTarget();
			if ( target and target.valid ) then
				e.self:RemoveFromHateList(target);
			end
			eq.debug(e.self:GetName().." dropped target from hate list ("..target:GetName()..")", 2);
		end
		
	elseif ( e.timer == "depop") then
		eq.depop();
	end
end

function event_encounter_load(e)
	eq.register_npc_event("Mist", Event.spawn, CONTROLLER_TYPE, ControllerSpawn);
	eq.register_npc_event("Mist", Event.timer, CONTROLLER_TYPE, ControllerTimer);
	eq.register_npc_event("Mist", Event.signal, CONTROLLER_TYPE, ControllerSignal);

	eq.register_npc_event("Mist", Event.death, WIND_TYPE, IslandDeath);
	eq.register_npc_event("Mist", Event.death, WIZ_WIND_TYPE, WizWindDeath);
	eq.register_npc_event("Mist", Event.death, SERVITOR_TYPE, IslandDeath);
	eq.register_npc_event("Mist", Event.death, BREEZEWING_TYPE, IslandDeath);
	eq.register_npc_event("Mist", Event.death, SEAREDWING_TYPE, IslandDeath);
	eq.register_npc_event("Mist", Event.death, CALEBGROTHIEL_TYPE, IslandDeath);

	eq.register_npc_event("Mist", Event.death, FIRESURGER_TYPE, FiresurgerDeath);
	eq.register_npc_event("Mist", Event.death, WINDSURGER_TYPE, WindsurgerDeath);

	eq.register_npc_event("Mist", Event.death_complete, BOSS_TYPE, BossDeathComplete);	
	eq.register_npc_event("Mist", Event.combat, BOSS_TYPE, AvatarCombat);
	eq.register_npc_event("Mist", Event.timer, BOSS_TYPE, AvatarTimer);

	eq.register_npc_event("Mist", Event.spawn, AVATAR_TYPE, AvatarSpawn);
	eq.register_npc_event("Mist", Event.combat, AVATAR_TYPE, AvatarCombat);
	eq.register_npc_event("Mist", Event.timer, AVATAR_TYPE, AvatarTimer);
end
