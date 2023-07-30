local BERTOX_TYPE = 200226; -- #Bertoxxulous

local DARWOL_TYPE = 200234; -- Darwol_Adan
local FEIG_TYPE = 200240; -- Feig_Adan
local XHUT_TYPE = 200265; -- Xhut_Adan
local KAVILIS_TYPE = 200246; -- Kavilis_Adan

local RADDI_TYPE = 200257; -- Raddi_Adan
local WAVADOZZIK_TYPE = 200263; -- Wavadozzik_Adan
local ZANDAL_TYPE = 200266; -- Zandal_Adan
local AKKAPAN_TYPE = 200223; -- Akkapan_Adan

local MEEDO_TYPE = 200250; -- Meedo_Adan
local QEZZIN_TYPE = 200256; -- Qezzin_Adan
local PZO_TYPE = 200255; -- Pzo_Adan
local BHALY_TYPE = 200227; -- Bhaly_Adan

local SPECTRE_TYPE = 200016; -- #Spectre_of_Corruption
local SPECTRE_SPAWNID = 360643;

local SUMMONER_TYPE = 200260; -- Summoner_of_Bertoxxulous
local CONTROLLER_TYPE = 200195; -- PusEventController
local PROJECTION_TYPE = 200269; -- A_Planar_Projection

local BOSS_TABLE = {
	[44] = { DARWOL_TYPE, 0, 280, -247, 0, "A bestial squeak thunders" },
	[48] = { FEIG_TYPE, -200, 0, -277, 64, "A bestial squeak thunders" },
	[52] = { XHUT_TYPE, 0, -280, -247, 128, "A dark vision flashes" },
	[56] = { KAVILIS_TYPE, 200, 0, -269, 192, "A faint buzzing is heard" },
	[84] = { RADDI_TYPE, 0, 280, -247, 0, "A wailing cry echoes" },
	[88] = { WAVADOZZIK_TYPE, -200, 0, -277, 64, "Chittering is heard" },
	[92] = { ZANDAL_TYPE, 0, -280, -247, 128, "Chittering is heard" },
	[96] = { AKKAPAN_TYPE, 200, 0, -269, 192, "A maddened whispering is heard" },
	[10000] = { MEEDO_TYPE, 0, 280, -247, 0 },
	[10001] = { QEZZIN_TYPE, -200, 0, -277, 64 },
	[10002] = { PZO_TYPE, 0, -280, -247, 128 },
	[10003] = { BHALY_TYPE, 200, 0, -269, 192 },
};

local TRASH_TYPES = {
	200247, -- Knight_of_Decay (level 62)
	200268, -- Priest_of_Decay
	200251, -- Necromancer_of_Decay
	200236, -- Elite_Knight_of_Decay
	200238, -- Elite_Priest_of_Decay
	200237, -- Elite_Necromancer_of_Decay
};

-- create table with spawn IDs of trash mobs.  Some were deleted because the locs were wrong so there are 'holes', otherwise they are contiguous
local TRASH_SPAWNIDS = {};
for i = 369228, 369264 do
	if ( i ~= 369241 and i ~= 369244 and i ~= 369255 and i ~= 369257 and i ~= 369260 ) then
		table.insert(TRASH_SPAWNIDS, i);
	end
end

local SUMMONER_LOCS = {
	{ 0, 305, -240, 128 },
	{ -235, 0, -270, 64 },
	{ 235, 0, -270, 192 },
	{ 0, -55, -285, 0 },
	{ 0, -305, -240, 0 },
};

local trashKills = 0;
local bossKills = 0;

function ControllerTimer(e)
	if ( e.timer == "start" ) then
		eq.zone_emote(0, "A foul wind is felt carrying on it the stench of death and decay.  Suddenly a thunderous bang is heard throughout the crypt and then these words, 'Great soldiers of decay you are summoned forth to do battle with these infidels!'  All around the crypt echoes of footsteps and shuffling feet are heard.");
		trashKills = 0;
		bossKills = 0;
		StartSpawns();
	
	elseif ( e.timer == "expire_warning" ) then
		eq.zone_emote(0, "Dark voices whisper in your ear saying, 'Your time is close in coming to an end. Time to flee little ones!'");
		
	elseif ( e.timer == "expire" ) then
		eq.zone_emote(0, "Harsh laughter echoes around the crypt and a voice then speaks saying, 'Perhaps you would care to try when you are more powerful fools.'  The harsh laughter continues softly as all of  the summoned minions of Bertoxxulous vanish.");
		eq.update_spawn_timer(SPECTRE_SPAWNID, 21600000);
		StopSpawns();
	end
	eq.stop_timer(e.timer);
end

function ControllerSignal(e)

	if ( e.signal == 1 ) then
	
		eq.set_timer("expire", 7380000);
		eq.set_timer("expire_warning", 7080000);
		eq.set_timer("start", 350000);
		
	elseif ( e.signal == 2 ) then
		eq.stop_timer("expire");
		eq.stop_timer("expire_warning");
		StopSpawns();
	end
end

function SpectreDeathComplete(e)
	eq.signal(CONTROLLER_TYPE, 1);
	eq.zone_emote(0, "Crazed laughter is heard as you notice a foul creature standing before you. The creature then speaks saying, 'Violaters of the depths of Lxanvom shall pay with your lives!'  The foul minion of decay then begins chanting a dark ritual.  Deeper within the depths of the crypt more chanting can be heard.");
	for _, loc in ipairs(SUMMONER_LOCS) do
		eq.spawn2(SUMMONER_TYPE, 0, 0, loc[1], loc[2], loc[3], loc[4]);
	end
end

function StartSpawns()
	local elist = eq.get_entity_list();
	for _, id in ipairs(TRASH_SPAWNIDS) do
		elist:GetSpawnByID(id):Enable();
	end
end

function StopSpawns()
	local elist = eq.get_entity_list();
	for _, id in ipairs(TRASH_SPAWNIDS) do
		elist:GetSpawnByID(id):Disable();
	end
	eq.depop_all(SUMMONER_TYPE);
	eq.depop_all(BERTOX_TYPE);
end

function TrashDeathComplete(e)

	trashKills = trashKills + 1;
	eq.debug("Bertox event trash kills == "..trashKills, 3);
	
	local boss = BOSS_TABLE[trashKills];
	
	if ( boss ) then
		local b = eq.spawn2(boss[1], 0, 0, boss[2], boss[3], boss[4], boss[5]);
		eq.zone_emote(0, string.format("An unsettling feeling of fear passes through you as you hear the summoners finish a dark incantation then cry out saying, 'We call to you corrupted King of Lxanvom, %s, your master has need of you!' %s thunders through the crypt as a foul fiend of Bertoxxulous is summoned forth.", b:GetCleanName(), boss[6]));
	end
end

-- this trash has atypical loiting behavior
function TrashCombat(e)
	if ( e.joined ) then
		eq.stop_timer("end_loiter");
		
	elseif ( math.random(1, 5) == 1 ) then
		eq.set_timer("end_loiter", math.random(1, 300)*1000);
	end
end

function TrashTimer(e)

	if ( e.timer == "end_loiter" ) then
		eq.stop_timer(e.timer);
		
		e.self:ResumeWandering();
	end
end

function TrashWaypointArrive(e)
	if ( e.self:GetGrid() > 0 and e.wp == (e.self:GetMaxWp() - 1) ) then
		e.self:RemoveWaypoints();
		e.self:SaveGuardSpot();
	end
end

function TriggerBossDeathComplete(e)
	bossKills = bossKills + 1;
	
	if ( bossKills == 8 ) then
		local boss;
		eq.zone_emote(0, "An unsettling feeling of fear passes through you as you hear the summoners finish a dark incantation then cry out saying, 'We call to you the last corrupted Kings of Lxanvom. Meedo Adan! Qezzin Adan! Pzo Adan! Bhaly Adan! Your master has need of you!' Four separate howls of rage and despair echo throughout the lower depths of the crypt as four foul fiends of Bertoxxulous is summoned forth.");

		for i = 10000, 10003 do
			boss = BOSS_TABLE[i];
			eq.spawn2(boss[1], 0, 0, boss[2], boss[3], boss[4], boss[5]);
		end
		
	elseif ( bossKills == 12 ) then
		eq.zone_emote(0, "A sinister vision enters your mind of a faceless one handsome yet dead and decaying. The vision then shifts to that of a torn bestial creature and a loud shout is heard, 'Defilers death comes for you today!'");
		eq.spawn2(BERTOX_TYPE, 58, 0, 0, 280, -243, 0);
	end
end

function BertoxDeathComplete(e)
	eq.signal(CONTROLLER_TYPE, 2);
	eq.zone_emote(0, "A nimbus of light floods throughs the crypt in one magnificent wave as an earth shattering howl is heard.  The bringer of plagues, lord of all disease and decay, Bertoxxulous has been defeated. Suddenly an urgent whisper fills your head simply saying, 'The Torch of Lxanvom shall burn bright again.  Freedom is now ours, for that we thank you.'");
	eq.spawn2(PROJECTION_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
	eq.signal(PROJECTION_TYPE, e.killer:GetID()); -- e.killer for death_complete is somebody with kill rights, not death blow
end

function event_encounter_load(e)

	eq.register_npc_event("Bertox", Event.death_complete, SPECTRE_TYPE, SpectreDeathComplete);
	
	eq.register_npc_event("Bertox", Event.timer, CONTROLLER_TYPE, ControllerTimer);	
	eq.register_npc_event("Bertox", Event.signal, CONTROLLER_TYPE, ControllerSignal);
	
	for _, id in ipairs(TRASH_TYPES) do
		eq.register_npc_event("Bertox", Event.death_complete, id, TrashDeathComplete);
		eq.register_npc_event("Bertox", Event.combat, id, TrashCombat);
		eq.register_npc_event("Bertox", Event.timer, id, TrashTimer);
		eq.register_npc_event("Bertox", Event.waypoint_arrive, id, TrashWaypointArrive);
	end

	for _, boss in pairs(BOSS_TABLE) do
		eq.register_npc_event("Bertox", Event.death_complete, boss[1], TriggerBossDeathComplete);
	end
	
	eq.register_npc_event("Bertox", Event.death_complete, BERTOX_TYPE, BertoxDeathComplete);
end
